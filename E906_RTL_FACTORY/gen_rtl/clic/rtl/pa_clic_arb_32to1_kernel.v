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
module pa_clic_arb_32to1_kernel(
  // input
  prio_in_vec,
  // output
  prio_out_mid,
  sel_out_onehot
);

parameter PRIO_WIDTH   = 6;
parameter INT_NUM     = 32;
localparam PRIO_EXP_NUM = 1 <<< PRIO_WIDTH;

input  [PRIO_EXP_NUM*INT_NUM-1:0] prio_in_vec;
output [PRIO_EXP_NUM-1:0]         prio_out_mid;
output [INT_NUM-1:0]              sel_out_onehot;

wire   [PRIO_EXP_NUM*INT_NUM-1:0] prio_in_vec;
wire   [PRIO_EXP_NUM-1:0]         prio_out_mid;
wire   [INT_NUM-1:0]              sel_out_onehot;

wire   [PRIO_EXP_NUM-1:0]    prio_in_2d[INT_NUM-1:0];
wire   [INT_NUM-1:0]         prio_in_2d_rev[PRIO_EXP_NUM-1:0];

genvar i;
genvar j;
genvar k;

//==========================================================
//                   Generate 2D prio
//==========================================================
generate
  for (k = 0; k < INT_NUM; k = k+1)
  begin: EXPEND_PRIO
    assign prio_in_2d[k][PRIO_EXP_NUM-1:0] = prio_in_vec[PRIO_EXP_NUM*k+:PRIO_EXP_NUM];
  end
endgenerate

//==========================================================
//                   Reverse 2D signal
//==========================================================
generate
  for (i = 0; i < INT_NUM; i = i+1) begin: REVERSEI
    for (j = 0; j < PRIO_EXP_NUM; j = j+1) begin: REVERSEJ
      assign prio_in_2d_rev[j][i] = prio_in_2d[i][j];
    end
  end
endgenerate

wire   [PRIO_EXP_NUM-1:0]         high_prio_onehot;
wire   [PRIO_EXP_NUM-1:0]         prio_out;
//==========================================================
//                     Do or to sel
//==========================================================
generate
  for (i = 0; i < PRIO_EXP_NUM; i = i+1) begin: OR_SEL
    assign prio_out[i] = |prio_in_2d_rev[i][INT_NUM-1:0];
  end
endgenerate

assign prio_out_mid[PRIO_EXP_NUM-1:0] = prio_out[PRIO_EXP_NUM-1:0];

pa_clic_ff1_onehot #(PRIO_EXP_NUM) x_pa_clic_high_prio(
  .data_in        (prio_out),
  .ff1_out_onehot (high_prio_onehot)
);

wire   [PRIO_EXP_NUM-1:0]    prio_after_mask_2d[INT_NUM-1:0];
wire   [INT_NUM-1:0]         int_hit_prio;
generate
  for (k = 0; k < INT_NUM; k = k+1)
  begin: PRIO_MASK
    assign prio_after_mask_2d[k][PRIO_EXP_NUM-1:0] = prio_in_2d[k][PRIO_EXP_NUM-1:0] & high_prio_onehot[PRIO_EXP_NUM-1:0];
    assign int_hit_prio[k] = |prio_after_mask_2d[k][PRIO_EXP_NUM-1:0];
  end
endgenerate

wire   [INT_NUM-1:0]          int_sel_onehot;

pa_clic_ff1_onehot #(INT_NUM) x_pa_clic_num(
  .data_in        (int_hit_prio),
  .ff1_out_onehot (int_sel_onehot)
);

assign sel_out_onehot[INT_NUM-1:0] = int_sel_onehot[INT_NUM-1:0];

endmodule

