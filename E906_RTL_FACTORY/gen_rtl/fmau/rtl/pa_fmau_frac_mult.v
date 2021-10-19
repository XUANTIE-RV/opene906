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

// &ModuleBeg; @24
module pa_fmau_frac_mult(
  ctrl_dp_ex1_inst_pipe_down,
  ctrl_xx_ex1_warm_up,
  ex1_frac_0,
  ex1_frac_1,
  ex2_mult_data,
  fmau_ex2_data_clk
);

// &Ports; @25
input           ctrl_dp_ex1_inst_pipe_down; 
input           ctrl_xx_ex1_warm_up;       
input   [23:0]  ex1_frac_0;                
input   [23:0]  ex1_frac_1;                
input           fmau_ex2_data_clk;         
output  [47:0]  ex2_mult_data;             

// &Regs; @26
reg     [47:0]  ex2_partial_result_0;      
reg     [47:0]  ex2_partial_result_1;      

// &Wires; @27
wire            ctrl_dp_ex1_inst_pipe_down; 
wire            ctrl_xx_ex1_warm_up;       
wire    [23:0]  ex1_frac_0;                
wire    [23:0]  ex1_frac_1;                
wire    [49:0]  ex1_partial_result_0;      
wire    [49:0]  ex1_partial_result_1;      
wire    [47:0]  ex2_mult_data;             
wire            fmau_ex2_data_clk;         
wire    [23:0]  mult_0_0;                  
wire    [23:0]  mult_0_1;                  
wire    [49:0]  result_0_0;                
wire    [49:0]  result_0_1;                


// &Depend("cpu_cfig.h"); @29

parameter FPU_WIDTH   = 64;
parameter SINGLE_FRAC = 23;
parameter DOUBLE_FRAC = 52;
parameter SINGLE_EXPN =  8;
parameter DOUBLE_EXPN = 11;
parameter FUNC_WIDTH  = 10;

//==========================================================
//                     EX1 data path
//==========================================================

// &Instance("pa_fmau_multiplier_53x27_partial","multiplier_53x27"); @52
// &Connect( @53
//   .a(mult_0_0), @54
//   .b(mult_0_1), @55
//   .out0(result_0_0), @56
//   .out1(result_0_1) @57
// ); @58
// &Instance("pa_fmau_multiplier_53x27_partial","multiplier_53x26"); @60
// &Connect( @61
//   .a(mult_1_0), @62
//   .b(mult_1_1), @63
//   .out0(result_1_0), @64
//   .out1(result_1_1) @65
// ); @66
// &Force("bus","result_0_0",83,0); @68
// &Force("bus","result_0_1",83,0); @69
// &Force("bus","result_1_0",83,0); @70
// &Force("bus","result_1_1",83,0); @71
// &Force("nonport", "mult_0_0"); @79
// &Force("nonport", "mult_0_1"); @80
// &Force("nonport", "result_0_0"); @81
// &Force("nonport", "result_0_1"); @82
// &Force("nonport", "mult_1_0"); @92
// &Force("nonport", "mult_1_1"); @93
// &Force("nonport", "result_1_0"); @94
// &Force("nonport", "result_1_1"); @95

assign mult_0_0[23:0] = ex1_frac_0[23:0];
assign mult_0_1[23:0] = ex1_frac_1[23:0];

// &Instance("pa_fmau_multiplier_24x24_partial","multiplier_24x24"); @164
pa_fmau_multiplier_24x24_partial  multiplier_24x24 (
  .a          (mult_0_0  ),
  .b          (mult_0_1  ),
  .out0       (result_0_0),
  .out1       (result_0_1)
);

// &Connect( @165
//   .a(mult_0_0), @166
//   .b(mult_0_1), @167
//   .out0(result_0_0), @168
//   .out1(result_0_1) @169
// ); @170

// &Force("nonport", "mult_0_0"); @174
// &Force("nonport", "mult_0_1"); @175
// &Force("nonport", "result_0_0"); @176
// &Force("nonport", "result_0_1"); @177
assign ex1_partial_result_0[49:0] = result_0_0[49:0];
assign ex1_partial_result_1[49:0] = result_0_1[49:0];


always@(posedge fmau_ex2_data_clk)
begin
  if(ctrl_dp_ex1_inst_pipe_down || ctrl_xx_ex1_warm_up)
  begin
    ex2_partial_result_0[47:0] <= ex1_partial_result_0[47:0];
    ex2_partial_result_1[47:0] <= ex1_partial_result_1[47:0];
  end
end

assign ex2_mult_data[47:0] = ex2_partial_result_0[47:0] + ex2_partial_result_1[47:0];

// &ModuleEnd; @220
endmodule



