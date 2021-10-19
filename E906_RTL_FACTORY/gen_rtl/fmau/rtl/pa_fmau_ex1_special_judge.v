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
module pa_fmau_ex1_special_judge(
  cp0_fpu_xx_dqnan,
  dp_xx_ex1_cnan,
  dp_xx_ex1_inf,
  dp_xx_ex1_norm,
  dp_xx_ex1_qnan,
  dp_xx_ex1_snan,
  dp_xx_ex1_zero,
  ex1_inst_rm,
  ex1_mac,
  ex1_mult_expnt,
  ex1_mult_sign,
  ex1_special_cmplt,
  ex1_src2_sign,
  ex1_sub_vld,
  fmau_fpu_ex1_fflags,
  fmau_fpu_ex1_special_sel,
  fmau_fpu_ex1_special_sign
);

// &Ports; @25
input          cp0_fpu_xx_dqnan;         
input   [2:0]  dp_xx_ex1_cnan;           
input   [2:0]  dp_xx_ex1_inf;            
input   [2:0]  dp_xx_ex1_norm;           
input   [2:0]  dp_xx_ex1_qnan;           
input   [2:0]  dp_xx_ex1_snan;           
input   [2:0]  dp_xx_ex1_zero;           
input   [2:0]  ex1_inst_rm;              
input          ex1_mac;                  
input   [9:0]  ex1_mult_expnt;           
input          ex1_mult_sign;            
input          ex1_src2_sign;            
input          ex1_sub_vld;              
output         ex1_special_cmplt;        
output  [4:0]  fmau_fpu_ex1_fflags;      
output  [7:0]  fmau_fpu_ex1_special_sel; 
output  [3:0]  fmau_fpu_ex1_special_sign; 

// &Regs; @26

// &Wires; @27
wire           cp0_fpu_xx_dqnan;         
wire    [2:0]  dp_xx_ex1_cnan;           
wire    [2:0]  dp_xx_ex1_inf;            
wire    [2:0]  dp_xx_ex1_norm;           
wire    [2:0]  dp_xx_ex1_qnan;           
wire    [2:0]  dp_xx_ex1_snan;           
wire    [2:0]  dp_xx_ex1_zero;           
wire           ex1_fmau_inf_sign;        
wire           ex1_fmau_lfn_sign;        
wire           ex1_fmau_nv;              
wire           ex1_fmau_of;              
wire           ex1_fmau_result_cnan;     
wire           ex1_fmau_result_inf;      
wire           ex1_fmau_result_lfn;      
wire    [2:0]  ex1_fmau_result_qnan;     
wire           ex1_fmau_result_src2;     
wire           ex1_fmau_result_zero;     
wire           ex1_fmau_src2_sign;       
wire           ex1_fmau_zero_sign;       
wire    [2:0]  ex1_inst_rm;              
wire           ex1_mac;                  
wire    [9:0]  ex1_mult_expnt;           
wire           ex1_mult_sign;            
wire    [2:0]  ex1_nv;                   
wire    [2:0]  ex1_result_qnan;          
wire           ex1_result_zero;          
wire           ex1_special_cmplt;        
wire           ex1_src2_sign;            
wire           ex1_sub_vld;              
wire    [4:0]  fmau_fpu_ex1_fflags;      
wire    [7:0]  fmau_fpu_ex1_special_sel; 
wire    [3:0]  fmau_fpu_ex1_special_sign; 


// &Depend("cpu_cfig.h"); @29

parameter FPU_WIDTH   = 64;
parameter SINGLE_FRAC = 23;
parameter DOUBLE_FRAC = 52;
parameter SINGLE_EXPN =  8;
parameter DOUBLE_EXPN = 11;
parameter FUNC_WIDTH  = 10;

//==========================================================
//                EX1 exception judge
//==========================================================

assign ex1_nv[0] = |dp_xx_ex1_snan[2:0];   //sNan

assign ex1_nv[1] = (dp_xx_ex1_zero[0] && dp_xx_ex1_inf[1]) //0*inf
                || (dp_xx_ex1_zero[1] && dp_xx_ex1_inf[0]);//inf*0
 
assign ex1_nv[2] = (dp_xx_ex1_inf[0]  && dp_xx_ex1_norm[1] && dp_xx_ex1_inf[2] && ex1_sub_vld)  //inf*F -inf 
                || (dp_xx_ex1_inf[1]  && dp_xx_ex1_norm[0] && dp_xx_ex1_inf[2] && ex1_sub_vld)  //inf*F -inf 
                || (dp_xx_ex1_inf[0]  && dp_xx_ex1_inf[1]  && dp_xx_ex1_inf[2] && ex1_sub_vld); //inf*inf -inf

assign ex1_fmau_nv = |ex1_nv[2:0];
assign ex1_fmau_of = (ex1_mult_expnt[9 : 8] == 2'b01) && &dp_xx_ex1_norm[1:0] && (dp_xx_ex1_norm[2] || dp_xx_ex1_zero[2]) //single expt >128
                  || (ex1_mult_expnt[9 : 0] == 10'b00_1111_1111)  && &dp_xx_ex1_norm[1:0] && !ex1_mac; //single expt>127
//==========================================================
//                EX1 special result judge
//==========================================================
assign ex1_result_qnan[0] = dp_xx_ex1_snan[0]
                         || dp_xx_ex1_qnan[0] && !dp_xx_ex1_snan[1] && !dp_xx_ex1_snan[2];

assign ex1_result_qnan[1] = !dp_xx_ex1_snan[0] && dp_xx_ex1_snan[1]
                         || !dp_xx_ex1_snan[0] &&!dp_xx_ex1_qnan[0] && dp_xx_ex1_qnan[1] && !dp_xx_ex1_snan[2];

assign ex1_result_qnan[2] = !dp_xx_ex1_snan[0] && !dp_xx_ex1_snan[1] &&  dp_xx_ex1_snan[2]
                         || !dp_xx_ex1_snan[0] && !dp_xx_ex1_snan[1] && !dp_xx_ex1_qnan[0] && !dp_xx_ex1_qnan[1] && dp_xx_ex1_qnan[2];

assign ex1_fmau_result_cnan = ex1_result_qnan[0] && (dp_xx_ex1_cnan[0] || !cp0_fpu_xx_dqnan)
                            ||ex1_result_qnan[1] && (dp_xx_ex1_cnan[1] || !cp0_fpu_xx_dqnan)
                            ||ex1_result_qnan[2] && (dp_xx_ex1_cnan[2] || !cp0_fpu_xx_dqnan)
                            ||ex1_nv[1] && !ex1_result_qnan[2]
                            ||ex1_nv[2];

assign ex1_fmau_result_qnan[2:0] = ex1_result_qnan[2:0] &(~dp_xx_ex1_cnan[2:0]) & {3{cp0_fpu_xx_dqnan}};

assign ex1_result_zero = dp_xx_ex1_zero[0] && dp_xx_ex1_norm[1] && dp_xx_ex1_zero[2]
                      || dp_xx_ex1_zero[1] && dp_xx_ex1_norm[0] && dp_xx_ex1_zero[2] 
                      || dp_xx_ex1_zero[0] && dp_xx_ex1_zero[1] && dp_xx_ex1_zero[2];

assign ex1_fmau_result_zero = ex1_result_zero;

assign ex1_fmau_zero_sign = ex1_sub_vld ? (ex1_inst_rm[2:0]==3'b010) : ex1_mult_sign;

assign ex1_fmau_result_inf = (|dp_xx_ex1_inf[2:0]) && !(|ex1_result_qnan[2:0]) && !ex1_nv[1] && !ex1_nv[2]
                             ||ex1_fmau_of && 
                             ((ex1_inst_rm[1:0]==2'b00) 
                            || ex1_mult_sign && (ex1_inst_rm[2:0]==3'b010)
                            ||!ex1_mult_sign && (ex1_inst_rm[2:0]==3'b011)); 

assign ex1_fmau_inf_sign   = (|dp_xx_ex1_inf[1:0] || ex1_fmau_of) ? ex1_mult_sign : ex1_src2_sign;

assign ex1_fmau_result_lfn = ex1_fmau_of && 
                             ((ex1_inst_rm[2:0]==3'b001) 
                            ||!ex1_mult_sign && (ex1_inst_rm[2:0]==3'b010)
                            || ex1_mult_sign && (ex1_inst_rm[2:0]==3'b011));

assign ex1_fmau_lfn_sign = ex1_mult_sign;

assign ex1_fmau_result_src2 =  dp_xx_ex1_zero[0] && dp_xx_ex1_norm[1] && dp_xx_ex1_norm[2]  //zero * normal
                            || dp_xx_ex1_zero[1] && dp_xx_ex1_norm[0] && dp_xx_ex1_norm[2]
                            || dp_xx_ex1_zero[0] && dp_xx_ex1_zero[1] && dp_xx_ex1_norm[2];

assign ex1_fmau_src2_sign = ex1_src2_sign;

assign fmau_fpu_ex1_special_sel[7:0] = {ex1_fmau_result_qnan[2:0],
                                       ex1_fmau_result_cnan,
                                       ex1_fmau_result_lfn,
                                       ex1_fmau_result_inf,
                                       ex1_fmau_result_zero,
                                       ex1_fmau_result_src2};

assign fmau_fpu_ex1_special_sign[3:0]= {ex1_fmau_lfn_sign, ex1_fmau_inf_sign, ex1_fmau_zero_sign, ex1_fmau_src2_sign};

assign fmau_fpu_ex1_fflags[4:0] = {ex1_fmau_nv, 1'b0,ex1_fmau_of,1'b0,ex1_fmau_of};

assign ex1_special_cmplt =|({ex1_fmau_result_qnan[2:0],
                             ex1_fmau_result_cnan,
                             ex1_fmau_result_lfn,
                             ex1_fmau_result_inf,
                             ex1_fmau_result_zero,
                             ex1_fmau_result_src2});
// &ModuleEnd;  @127
endmodule



