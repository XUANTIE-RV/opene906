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

// &ModuleBeg; @28
module pa_clic_arb(
  arb_ctrl_int_hv,
  arb_ctrl_int_id,
  arb_ctrl_int_il,
  arb_ctrl_int_mode,
  arb_ctrl_int_req_raw,
  ctrl_xx_int_lv_or_mask,
  kid_arb_int_all_vec,
  kid_arb_int_hv,
  kid_arb_int_req
);

// &Ports; @29
input   [2  :0]  ctrl_xx_int_lv_or_mask; 
input   [575:0]  kid_arb_int_all_vec;   
input   [143:0]  kid_arb_int_hv;        
input   [143:0]  kid_arb_int_req;       
output           arb_ctrl_int_hv;       
output  [11 :0]  arb_ctrl_int_id;       
output  [7  :0]  arb_ctrl_int_il;       
output           arb_ctrl_int_mode;     
output           arb_ctrl_int_req_raw;  

// &Regs; @30

// &Wires; @31
wire             arb_ctrl_int_hv;       
wire    [11 :0]  arb_ctrl_int_id;       
wire    [7  :0]  arb_ctrl_int_il;       
wire             arb_ctrl_int_mode;     
wire             arb_ctrl_int_req_raw;  
wire    [3  :0]  arb_final_int_all;     
wire             arb_final_int_hv;      
wire    [11 :0]  arb_final_int_id;      
wire    [2  :0]  arb_final_int_lv;      
wire             arb_final_int_mode;    
wire             arb_final_int_req;     
wire    [2  :0]  ctrl_xx_int_lv_or_mask; 
wire    [143:0]  kid_arb_int_req;       


parameter CLICINTNUM     = `CLIC_INTNUM;
parameter CLICINTCTLBITS = `CLIC_INTCTLBITS;
parameter ID_WIDTH       = 12;

// &Force("input", "kid_arb_int_all_vec"); @37
// &Force("bus", "kid_arb_int_all_vec", (CLICINTCTLBITS+1)*(CLICINTNUM)-1, 0); @38
// &Force("input", "kid_arb_int_hv"); &Force("bus", "kid_arb_int_hv", CLICINTNUM-1, 0); @39
// &Force("input", "kid_arb_int_req"); &Force("bus", "kid_arb_int_req", CLICINTNUM-1, 0); @40

//==========================================================
//                       Arbiter
//==========================================================
//csky vperl_off
wire [ID_WIDTH*CLICINTNUM-1:0] id_vec;

genvar i;
generate
  for (i = 0; i < CLICINTNUM; i = i+1)
  begin: GEN_ID
    assign id_vec[ID_WIDTH*i+:ID_WIDTH] = $unsigned(i) & {ID_WIDTH{1'b1}};
  end
endgenerate

pa_clic_arb_kernel #(.PRIO_WIDTH(CLICINTCTLBITS+1), .INT_NUM(CLICINTNUM)) x_pa_clic_arb_kernel (
  .id_in_vec      (id_vec),
  .hv_in_vec      (kid_arb_int_hv),
  .prio_in_vec    (kid_arb_int_all_vec),
  .req_in_vec     (kid_arb_int_req),
  .id_out         (arb_final_int_id),
  .hv_out         (arb_final_int_hv),
  .prio_out       (arb_final_int_all),
  .req_out        (arb_final_int_req)
);
//csky vperl_on


// &Force("nonport", "arb_final_int_id"); @69
// &Force("nonport", "arb_final_int_hv"); @70
// &Force("nonport", "arb_final_int_all"); @71
// &Force("nonport", "arb_final_int_req"); @72

assign arb_final_int_mode = arb_final_int_all[CLICINTCTLBITS];
assign arb_final_int_lv[CLICINTCTLBITS-1:0] = arb_final_int_all[CLICINTCTLBITS-1:0]
                                         | ctrl_xx_int_lv_or_mask[CLICINTCTLBITS-1:0]
                                         & {CLICINTCTLBITS{arb_final_int_req}};


//==========================================================
//                     Output Signal
//==========================================================
assign arb_ctrl_int_hv               = arb_final_int_hv;
assign arb_ctrl_int_id[ID_WIDTH-1:0] = arb_final_int_id[ID_WIDTH-1:0];
assign arb_ctrl_int_mode             = arb_final_int_mode;
assign arb_ctrl_int_il[7:0]          = {arb_final_int_lv[CLICINTCTLBITS-1:0],
                                        {(8-CLICINTCTLBITS){arb_final_int_req}}};

//==========================================================
//                     Gate Clk Cell
//==========================================================
assign arb_ctrl_int_req_raw = |kid_arb_int_req[CLICINTNUM-1:0];

// &ModuleEnd; @94
endmodule


