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
module pa_fmau_frac_shift(
  ctrl_dp_ex1_inst_pipe_down,
  ctrl_xx_ex1_warm_up,
  ex1_expnt_2,
  ex1_mult_expnt,
  ex2_adder_0_sel_h,
  ex2_expnt_2,
  ex2_frac_2,
  ex2_mac,
  ex2_mac_expnt,
  ex2_mult_expnt,
  ex2_shift_data,
  fmau_ex2_data_clk
);

// &Ports; @25
input           ctrl_dp_ex1_inst_pipe_down; 
input           ctrl_xx_ex1_warm_up;       
input   [9 :0]  ex1_expnt_2;               
input   [9 :0]  ex1_mult_expnt;            
input   [9 :0]  ex2_expnt_2;               
input   [23:0]  ex2_frac_2;                
input           ex2_mac;                   
input   [9 :0]  ex2_mult_expnt;            
input           fmau_ex2_data_clk;         
output          ex2_adder_0_sel_h;         
output  [9 :0]  ex2_mac_expnt;             
output  [52:0]  ex2_shift_data;            

// &Regs; @26
reg     [9 :0]  ex2_left_max;              
reg     [9 :0]  ex2_mac_expnt_diff;        
reg             ex2_right_sel;             
reg     [5 :0]  ex2_shift_index;           

// &Wires; @27
wire            ctrl_dp_ex1_inst_pipe_down; 
wire            ctrl_xx_ex1_warm_up;       
wire    [9 :0]  ex1_expnt_2;               
wire    [9 :0]  ex1_left_max;              
wire    [9 :0]  ex1_mac_expnt_diff;        
wire    [9 :0]  ex1_mult_expnt;            
wire    [9 :0]  ex1_right_max;             
wire            ex1_right_sel;             
wire            ex2_adder_0_sel_h;         
wire    [23:0]  ex2_data_for_shift;        
wire    [9 :0]  ex2_expnt_2;               
wire    [23:0]  ex2_frac_2;                
wire            ex2_mac;                   
wire    [9 :0]  ex2_mac_expnt;             
wire    [9 :0]  ex2_mult_expnt;            
wire    [9 :0]  ex2_right_max;             
wire    [52:0]  ex2_shift_data;            
wire    [52:0]  ex2_shift_data_out;        
wire    [2 :0]  ex2_shift_sel;             
wire            fmau_ex2_data_clk;         


// &Depend("cpu_cfig.h"); @29

parameter DOUBLE_WIDTH= 64;
parameter DOUBLE_FRAC = 52;
parameter DOUBLE_EXPN = 11;

parameter SINGLE_WIDTH= 32;
parameter SINGLE_FRAC = 23;
parameter SINGLE_EXPN =  8;

parameter FUNC_WIDTH  = 10;

//==========================================================
//                     EX1 data path
//==========================================================
// &CombBeg; @88
// &CombEnd; @95
// &Instance("pa_fmau_src2_shifter_double","x_pa_fmau_src2_shifter_double"); @107
assign ex1_mac_expnt_diff[SINGLE_EXPN+1:0] = ex1_mult_expnt[SINGLE_EXPN+1:0] +
                                            {{SINGLE_EXPN{1'b0}},2'b10} -  
                                            {ex1_expnt_2[SINGLE_EXPN+1:0]};

assign ex1_right_max[SINGLE_EXPN+1:0] = 10'b00_0011_0011;//51=2*FRAC+5

assign ex1_right_sel = (ex1_mac_expnt_diff[SINGLE_EXPN:0]< ex1_right_max[SINGLE_EXPN:0]);

assign ex1_left_max[SINGLE_EXPN+1:0]  = 10'b00_0001_1001 + //FRAC+2 -(-D)
                                    + ex1_mac_expnt_diff[SINGLE_EXPN+1:0];

always @(posedge fmau_ex2_data_clk)
begin
 if(ctrl_dp_ex1_inst_pipe_down || ctrl_xx_ex1_warm_up) 
 begin
    ex2_mac_expnt_diff[SINGLE_EXPN+1:0]<= ex1_mac_expnt_diff[SINGLE_EXPN+1:0];
    ex2_left_max[SINGLE_EXPN+1:0]      <= ex1_left_max[SINGLE_EXPN+1:0];
    ex2_right_sel                      <= ex1_right_sel;
  end
end

assign ex2_shift_sel[0] = !ex2_mac_expnt_diff[SINGLE_EXPN+1] &&  ex2_right_sel;//right shift diff
assign ex2_shift_sel[1] = !ex2_mac_expnt_diff[SINGLE_EXPN+1] && !ex2_right_sel;//right shift 2*FRAC+5
assign ex2_shift_sel[2] =  ex2_mac_expnt_diff[SINGLE_EXPN+1] && !ex2_left_max[SINGLE_EXPN+1]; //left shift FRAC+2-|diff|

assign ex2_right_max[SINGLE_EXPN+1:0] = 10'b00_0011_0011;//51=2*FRAC+5

// &CombBeg; @156
always @( ex2_left_max[5:0]
       or ex2_right_max[5:0]
       or ex2_mac_expnt_diff[5:0]
       or ex2_shift_sel[2:0])
begin
case(ex2_shift_sel[2:0])
  3'b001: ex2_shift_index[5:0] = ex2_mac_expnt_diff[5:0];
  3'b010: ex2_shift_index[5:0] = ex2_right_max[5:0];
  3'b100: ex2_shift_index[5:0] = ex2_left_max[5:0];
 default: ex2_shift_index[5:0] = {6{1'b0}};
endcase
// &CombEnd; @163
end

assign ex2_mac_expnt[SINGLE_EXPN+1:0] = ex2_mac_expnt_diff[SINGLE_EXPN+1] 
                        ? ex2_expnt_2[SINGLE_EXPN+1:0] + { {4{1'b0}},ex2_shift_index[5:0]}
                        : ex2_mult_expnt[SINGLE_EXPN+1:0]+{ {SINGLE_EXPN{1'b0}},2'b10};

assign ex2_data_for_shift[SINGLE_FRAC:0] = ex2_frac_2[SINGLE_FRAC:0];

assign ex2_adder_0_sel_h = ex2_mac_expnt_diff[SINGLE_EXPN+1] || !ex2_mac;
//==========================================================
//                     EX2 data path
//==========================================================
// &Instance("pa_fmau_src2_shifter_single","x_pa_fmau_src2_shifter_single"); @175
pa_fmau_src2_shifter_single  x_pa_fmau_src2_shifter_single (
  .ex2_data_for_shift (ex2_data_for_shift),
  .ex2_shift_data_out (ex2_shift_data_out),
  .ex2_shift_index    (ex2_shift_index   )
);

assign ex2_shift_data[52:0] = ex2_shift_data_out[52:0];


// &ModuleEnd; @180
endmodule



