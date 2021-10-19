/*Copyright 2020-2021 T-Head Semiconductor Co., Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
module pa_clic_arb_kernel(
  // input
  id_in_vec,
  hv_in_vec,
  prio_in_vec,
  req_in_vec,
  // output
  id_out,
  hv_out,
  prio_out,
  req_out
);

parameter PRIO_WIDTH    = 6;
parameter INT_NUM       = 64;
parameter NUM_PER_GROUP = 16;

parameter ID_WIDTH      = 12;
parameter PRIO_EXP_NUM  = 1 <<< PRIO_WIDTH;
parameter GROUP_NUM     = (INT_NUM-1) / NUM_PER_GROUP + 1;
parameter ALL_ARB_WIDTH = PRIO_WIDTH*GROUP_NUM*NUM_PER_GROUP;
parameter ALL_EXP_WIDTH = PRIO_EXP_NUM*GROUP_NUM*NUM_PER_GROUP;
parameter ALL_ID_WIDTH  = ID_WIDTH*GROUP_NUM*NUM_PER_GROUP;
parameter ALL_INT_WIDTH = GROUP_NUM*NUM_PER_GROUP;

input  [ID_WIDTH*INT_NUM-1:0]   id_in_vec;
input  [INT_NUM-1:0]            hv_in_vec;
input  [PRIO_WIDTH*INT_NUM-1:0] prio_in_vec;
input  [INT_NUM-1:0]            req_in_vec;
output [ID_WIDTH-1:0]           id_out;
output                          hv_out;
output [PRIO_WIDTH-1:0]         prio_out;
output                          req_out;

wire   [ID_WIDTH*INT_NUM-1:0]   id_in_vec;
wire   [INT_NUM-1:0]            hv_in_vec;
wire   [PRIO_WIDTH*INT_NUM-1:0] prio_in_vec;
wire   [INT_NUM-1:0]            req_in_vec;
wire   [ID_WIDTH-1:0]           id_out;
wire                            hv_out;
wire   [PRIO_WIDTH-1:0]         prio_out;
wire                            req_out;

//==========================================================
//                     Expand Priority
//==========================================================
wire   [PRIO_EXP_NUM*INT_NUM-1:0] prio_expand_vec;

pa_clic_expand #(PRIO_WIDTH, INT_NUM) x_pa_clic_prio_expand(
  .data_in_vec    (prio_in_vec),
  .expand_out_vec (prio_expand_vec)
);

//==========================================================
//                         Padding
//==========================================================
wire   [ALL_EXP_WIDTH:0]   prio_expand_vec_padding;
assign prio_expand_vec_padding[ALL_EXP_WIDTH:0] = {{(ALL_EXP_WIDTH-PRIO_EXP_NUM*INT_NUM+1){1'b0}},
                                                 prio_expand_vec[PRIO_EXP_NUM*INT_NUM-1:0]};

wire   [ALL_ARB_WIDTH:0]   prio_in_vec_padding;
assign prio_in_vec_padding[ALL_ARB_WIDTH:0] = {{(ALL_ARB_WIDTH-PRIO_WIDTH*INT_NUM+1){1'b0}},
                                                 prio_in_vec[PRIO_WIDTH*INT_NUM-1:0]};

wire   [ALL_ID_WIDTH:0]    id_vec_padding;
assign id_vec_padding[ALL_ID_WIDTH:0] = {{(ALL_ID_WIDTH-ID_WIDTH*INT_NUM+1){1'b0}},
                                              id_in_vec[ID_WIDTH*INT_NUM-1:0]};

wire   [ALL_INT_WIDTH:0]   hv_vec_padding;
assign hv_vec_padding[ALL_INT_WIDTH:0] =  {{(ALL_INT_WIDTH-INT_NUM+1){1'b0}}, hv_in_vec[INT_NUM-1:0]};

wire   [ALL_INT_WIDTH:0]   req_vec_padding;
assign req_vec_padding[ALL_INT_WIDTH:0] = {{(ALL_INT_WIDTH-INT_NUM+1){1'b0}}, req_in_vec[INT_NUM-1:0]};

//==========================================================
//                1st Stage Arbiter & Select
//==========================================================
wire   [PRIO_EXP_NUM*GROUP_NUM-1:0]  prio_out_mid_1st;
wire   [NUM_PER_GROUP*GROUP_NUM-1:0] sel_out_onehot_1st;

wire   [PRIO_WIDTH*GROUP_NUM-1:0]    sel_out_prio_vec_1st;
wire   [ID_WIDTH*GROUP_NUM-1:0]      sel_out_id_vec_1st;

wire   [GROUP_NUM-1:0]               sel_out_hv_vec_1st;
wire   [GROUP_NUM-1:0]               sel_out_req_vec_1st;

genvar i;

generate
for (i = 0; i < GROUP_NUM; i = i+1)
begin: GROUP_X
//----------------------------------------------------------
//                         Arbiter
//----------------------------------------------------------
  pa_clic_arb_32to1_kernel #(PRIO_WIDTH, NUM_PER_GROUP) x_pa_clic_arb_1st_round(
    .prio_in_vec    (prio_expand_vec_padding[(PRIO_EXP_NUM*NUM_PER_GROUP)*i+:(PRIO_EXP_NUM*NUM_PER_GROUP)]),
    .prio_out_mid   (prio_out_mid_1st[PRIO_EXP_NUM*i+:PRIO_EXP_NUM]),
    .sel_out_onehot (sel_out_onehot_1st[NUM_PER_GROUP*i+:NUM_PER_GROUP])
  );

//----------------------------------------------------------
//                     Select Priority
//----------------------------------------------------------
  pa_clic_sel #(PRIO_WIDTH, NUM_PER_GROUP) x_pa_clic_lv_sel_1st_round(
    .data_in        (prio_in_vec_padding[(PRIO_WIDTH*NUM_PER_GROUP)*i+:(PRIO_WIDTH*NUM_PER_GROUP)]),
    .sel_in_onehot  (sel_out_onehot_1st[NUM_PER_GROUP*i+:NUM_PER_GROUP]),
    .data_out       (sel_out_prio_vec_1st[PRIO_WIDTH*i+:PRIO_WIDTH])
  );

//----------------------------------------------------------
//                        Select ID
//----------------------------------------------------------
  pa_clic_sel #(ID_WIDTH, NUM_PER_GROUP) x_pa_clic_id_sel_1st_round(
    .data_in        (id_vec_padding[(ID_WIDTH*NUM_PER_GROUP)*i+:(ID_WIDTH*NUM_PER_GROUP)]),
    .sel_in_onehot  (sel_out_onehot_1st[NUM_PER_GROUP*i+:NUM_PER_GROUP]),
    .data_out       (sel_out_id_vec_1st[ID_WIDTH*i+:ID_WIDTH])
  );

//----------------------------------------------------------
//                     Select hv & req
//----------------------------------------------------------
  assign sel_out_hv_vec_1st[i]  = |(sel_out_onehot_1st[NUM_PER_GROUP*i+:NUM_PER_GROUP] & hv_vec_padding[NUM_PER_GROUP*i+:NUM_PER_GROUP]);
  assign sel_out_req_vec_1st[i] = |(sel_out_onehot_1st[NUM_PER_GROUP*i+:NUM_PER_GROUP] & req_vec_padding[NUM_PER_GROUP*i+:NUM_PER_GROUP]);

end
endgenerate

//==========================================================
//                2nd Stage Arbiter & Select
//==========================================================
//----------------------------------------------------------
//                         Arbiter
//----------------------------------------------------------
wire [PRIO_EXP_NUM-1:0] prio_out_mid_2nd;
wire [GROUP_NUM-1:0]    sel_out_2nd_round;

pa_clic_arb_32to1_kernel #(PRIO_WIDTH, GROUP_NUM) x_pa_clic_arb_2nd_round(
  .prio_in_vec     (prio_out_mid_1st),
  .prio_out_mid    (prio_out_mid_2nd), // Not Use.
  .sel_out_onehot  (sel_out_2nd_round)
);

//----------------------------------------------------------
//                     Select Priority
//----------------------------------------------------------
pa_clic_sel #(PRIO_WIDTH, GROUP_NUM) x_pa_clic_lv_sel_2nd_round(
  .data_in         (sel_out_prio_vec_1st),
  .sel_in_onehot   (sel_out_2nd_round),
  .data_out        (prio_out)
);

//----------------------------------------------------------
//                        Select ID
//----------------------------------------------------------
pa_clic_sel #(ID_WIDTH, GROUP_NUM) x_pa_clic_id_sel_2nd_round(
  .data_in         (sel_out_id_vec_1st),
  .sel_in_onehot   (sel_out_2nd_round),
  .data_out        (id_out)
);

//----------------------------------------------------------
//                     Select hv & req
//----------------------------------------------------------
assign hv_out  = |(sel_out_hv_vec_1st[GROUP_NUM-1:0]  & sel_out_2nd_round[GROUP_NUM-1:0]);
assign req_out = |(sel_out_req_vec_1st[GROUP_NUM-1:0] & sel_out_2nd_round[GROUP_NUM-1:0]);

endmodule

