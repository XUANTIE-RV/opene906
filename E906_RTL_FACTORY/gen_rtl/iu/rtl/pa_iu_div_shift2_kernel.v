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

// &ModuleBeg; @23
module pa_iu_div_shift2_kernel(
  cpurst_b,
  div_clk,
  div_divisor_reg,
  div_ff1_res,
  div_flush,
  div_iter_cmplt,
  div_iterating,
  div_prepare_src0,
  div_prepare_src1,
  div_quotient_reg,
  div_quotient_reg_updt,
  div_remainder_reg,
  div_remainder_reg_updt
);

// &Ports; @24
input           cpurst_b;                   
input           div_clk;                    
input   [31:0]  div_divisor_reg;            
input   [4 :0]  div_ff1_res;                
input           div_flush;                  
input           div_iterating;              
input           div_prepare_src0;           
input           div_prepare_src1;           
input   [31:0]  div_quotient_reg;           
input   [31:0]  div_remainder_reg;          
output          div_iter_cmplt;             
output  [31:0]  div_quotient_reg_updt;      
output  [31:0]  div_remainder_reg_updt;     

// &Regs; @25
reg     [4 :0]  div_iter_count;             
reg     [31:0]  div_remainder_reg_updt;     
reg     [1 :0]  div_shift_in;               

// &Wires; @26
wire            cpurst_b;                   
wire            div_clk;                    
wire    [33:0]  div_divisor_01;             
wire    [33:0]  div_divisor_10;             
wire    [31:0]  div_divisor_reg;            
wire    [4 :0]  div_ff1_res;                
wire            div_flush;                  
wire            div_iter_cmplt;             
wire    [4 :0]  div_iter_count_updt;        
wire            div_iter_count_updt_0;      
wire    [4 :0]  div_iter_sub;               
wire            div_iterating;              
wire            div_prepare_src0;           
wire            div_prepare_src1;           
wire    [31:0]  div_quotient_reg;           
wire    [31:0]  div_quotient_reg_updt;      
wire            div_remainder_lt_divisor_01; 
wire            div_remainder_lt_divisor_10; 
wire            div_remainder_lt_divisor_11; 
wire    [31:0]  div_remainder_reg;          
wire            div_suber_c1_01;            
wire            div_suber_c1_10;            
wire            div_suber_c1_11;            
wire    [33:0]  div_suber_res1_01;          
wire    [33:0]  div_suber_res1_10;          
wire    [33:0]  div_suber_res1_11;          


//==========================================================
//                    2bit Shift Kernel
//==========================================================
// This is shift kernel of divider.
// Each iter product 2-bit result.

// &Force("bus", "div_quotient_reg", 31, 0); @34
//----------------------------------------------------------
//                    Iteration Counter
//----------------------------------------------------------
// Calculate iterations @ WFI2, Decrease iterations @ ITER.
assign div_iter_sub[4:0]          = div_prepare_src1 ? div_ff1_res[4:0]
                                                     : div_iterating ? 5'b10
                                                                     : 5'b0;

assign div_iter_count_updt_0 = div_iter_count[4:0] < div_iter_sub[4:0];
assign div_iter_count_updt[4:0] = div_iter_count_updt_0 ? 5'b0
                                                        : div_iter_count[4:0] - div_iter_sub[4:0];

always @ (posedge div_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    div_iter_count[4:0] <= 5'b0;
  else if (div_flush)
    div_iter_count[4:0] <= 5'b0;
  else if (div_prepare_src0)
    div_iter_count[4:0] <= div_ff1_res[4:0];
  else if (div_prepare_src1 || div_iterating)
    div_iter_count[4:0] <= div_iter_count_updt[4:0];
end

assign div_iter_cmplt     = div_iterating && (div_iter_count[4:0] == 5'b0
                                           || div_iter_count[4:0] == 5'b1);
// &Force("output", "div_iter_cmplt"); @61

//----------------------------------------------------------
//                   Calcuate Interation
//----------------------------------------------------------
// Do iteration compare @ ITER.
// Using divisor x1, x2, x3 compare with remainder to get shift_in and new remainder.
assign div_divisor_01[33:0]                 = {2'b0, div_divisor_reg[31:0]} << {div_iter_count[4:1], 1'b0};
assign div_divisor_10[33:0]                 = {1'b0, div_divisor_reg[31:0], 1'b0} << {div_iter_count[4:1], 1'b0};
///assign div_divisor_11[33:0]                 = div_divisor_01[33:0] + div_divisor_10[33:0];

assign {div_suber_c1_01, div_suber_res1_01[33:0]} = {3'b0, div_remainder_reg[31:0]} - {1'b0, div_divisor_01[33:0]};
assign {div_suber_c1_10, div_suber_res1_10[33:0]} = {3'b0, div_remainder_reg[31:0]} - {1'b0, div_divisor_10[33:0]};
assign {div_suber_c1_11, div_suber_res1_11[33:0]} = {3'b0, div_remainder_reg[31:0]} - {1'b0, div_divisor_01[33:0]} - {1'b0, div_divisor_10[33:0]};
assign div_remainder_lt_divisor_01          = div_suber_c1_01;
assign div_remainder_lt_divisor_10          = div_suber_c1_10;
assign div_remainder_lt_divisor_11          = div_suber_c1_11;

//----------------------------------------------------------
//                Generate Iteration Results
//----------------------------------------------------------
// &CombBeg; @82
always @( div_remainder_lt_divisor_01
       or div_remainder_lt_divisor_10
       or div_remainder_lt_divisor_11)
begin
  casez({div_remainder_lt_divisor_01, div_remainder_lt_divisor_10, div_remainder_lt_divisor_11})
    3'b1??:  div_shift_in[1:0] = 2'b00;
    3'b01?:  div_shift_in[1:0] = 2'b01;
    3'b001:  div_shift_in[1:0] = 2'b10;
    3'b000:  div_shift_in[1:0] = 2'b11;
    default: div_shift_in[1:0] = {2{1'bx}};
  endcase
// &CombEnd; @90
end

assign div_quotient_reg_updt[31:0]        = {div_quotient_reg[29:0], div_shift_in[1:0]};

// &CombBeg; @94
always @( div_remainder_reg[31:0]
       or div_suber_res1_10[31:0]
       or div_suber_res1_01[31:0]
       or div_remainder_lt_divisor_01
       or div_remainder_lt_divisor_10
       or div_suber_res1_11[31:0]
       or div_remainder_lt_divisor_11)
begin
  casez({div_remainder_lt_divisor_01, div_remainder_lt_divisor_10, div_remainder_lt_divisor_11})
    3'b1??:  div_remainder_reg_updt[31:0] = div_remainder_reg[31:0];
    3'b01?:  div_remainder_reg_updt[31:0] = div_suber_res1_01[31:0];
    3'b001:  div_remainder_reg_updt[31:0] = div_suber_res1_10[31:0];
    3'b000:  div_remainder_reg_updt[31:0] = div_suber_res1_11[31:0];
    default: div_remainder_reg_updt[31:0] = {32{1'bx}};
  endcase
// &CombEnd; @102
end

// &ModuleEnd; @104
endmodule


