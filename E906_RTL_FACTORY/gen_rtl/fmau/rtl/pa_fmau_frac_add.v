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
module pa_fmau_frac_add(
  ctrl_dp_ex2_inst_pipe_down,
  ctrl_dp_ex3_inst_pipe_down,
  ctrl_xx_ex2_warm_up,
  ctrl_xx_ex3_warm_up,
  ex2_adder_0_sel_h,
  ex2_mac,
  ex2_mac_expnt,
  ex2_mult_data,
  ex2_shift_data,
  ex2_sub_vld,
  ex3_inst_rm,
  ex3_mac_expnt,
  ex3_mult_expnt,
  ex3_mult_sign,
  ex3_sub_vld,
  ex4_inst_rm,
  fmau_ex3_data_clk,
  fmau_ex4_data_clk,
  fmau_fpu_ex3_fflags,
  fmau_fpu_ex3_result,
  fmau_fpu_ex4_fflags,
  fmau_fpu_ex4_result
);

// &Ports; @25
input           ctrl_dp_ex2_inst_pipe_down;      
input           ctrl_dp_ex3_inst_pipe_down;      
input           ctrl_xx_ex2_warm_up;             
input           ctrl_xx_ex3_warm_up;             
input           ex2_adder_0_sel_h;               
input           ex2_mac;                         
input   [9 :0]  ex2_mac_expnt;                   
input   [47:0]  ex2_mult_data;                   
input   [52:0]  ex2_shift_data;                  
input           ex2_sub_vld;                     
input   [2 :0]  ex3_inst_rm;                     
input   [9 :0]  ex3_mac_expnt;                   
input   [9 :0]  ex3_mult_expnt;                  
input           ex3_mult_sign;                   
input           ex3_sub_vld;                     
input   [2 :0]  ex4_inst_rm;                     
input           fmau_ex3_data_clk;               
input           fmau_ex4_data_clk;               
output  [4 :0]  fmau_fpu_ex3_fflags;             
output  [31:0]  fmau_fpu_ex3_result;             
output  [4 :0]  fmau_fpu_ex4_fflags;             
output  [31:0]  fmau_fpu_ex4_result;             

// &Regs; @26
reg     [52:0]  ex3_adder_0;                     
reg     [52:0]  ex3_adder_1;                     
reg     [52:0]  ex3_adder_result;                
reg     [22:0]  ex3_mult_frac_result;            
reg             ex3_mult_rnd_in;                 
reg     [1 :0]  ex3_mult_single_gs_bit;          
reg     [15:0]  ex3_shift_limit_low;             
reg     [9 :0]  ex4_mac_expnt;                   
reg             ex4_mac_expnt_neg_max;           
reg     [7 :0]  ex4_mac_expnt_result;            
reg             ex4_mac_frac_not_zero;           
reg     [52:0]  ex4_mac_frac_pre;                
reg     [22:0]  ex4_mac_frac_result;             
reg             ex4_mac_rnd_in;                  
reg             ex4_mac_shift_32_bit;            
reg             ex4_mac_sign;                    

// &Wires; @27
wire            ctrl_dp_ex2_inst_pipe_down;      
wire            ctrl_dp_ex3_inst_pipe_down;      
wire            ctrl_xx_ex2_warm_up;             
wire            ctrl_xx_ex3_warm_up;             
wire    [52:0]  ex2_adder_0;                     
wire    [52:0]  ex2_adder_0_0;                   
wire    [52:0]  ex2_adder_0_1;                   
wire            ex2_adder_0_sel_h;               
wire    [52:0]  ex2_adder_1;                     
wire            ex2_adder_1_for_single_rnd_add_1; 
wire            ex2_adder_1_for_single_rnd_add_2; 
wire    [52:0]  ex2_adder_1_rnd_data;            
wire            ex2_mac;                         
wire    [9 :0]  ex2_mac_expnt;                   
wire    [47:0]  ex2_mult_data;                   
wire    [1 :0]  ex2_mult_single_gs_bit;          
wire    [52:0]  ex2_shift_data;                  
wire    [15:0]  ex2_shift_limit_low;             
wire            ex2_shift_limit_vld;             
wire            ex2_sub_vld;                     
wire    [52:0]  ex3_adder_0_result;              
wire    [52:0]  ex3_adder_1_result;              
wire    [2 :0]  ex3_adder_result_sel;            
wire    [2 :0]  ex3_inst_rm;                     
wire    [6 :0]  ex3_lza_result;                  
wire    [9 :0]  ex3_mac_expnt;                   
wire    [9 :0]  ex3_mac_expnt_adjust;            
wire            ex3_mac_expnt_neg_max;           
wire            ex3_mac_frac_not_zero;           
wire    [52:0]  ex3_mac_result_shift;            
wire            ex3_mac_sign;                    
wire    [9 :0]  ex3_mult_expnt;                  
wire            ex3_mult_expnt_add_in;           
wire    [9 :0]  ex3_mult_expnt_plus_1;           
wire    [7 :0]  ex3_mult_expnt_result;           
wire    [1 :0]  ex3_mult_frac_sel;               
wire    [22:0]  ex3_mult_no_rnd_result;          
wire            ex3_mult_nx;                     
wire    [24:0]  ex3_mult_result;                 
wire    [2 :0]  ex3_mult_rnd_bit;                
wire    [24:0]  ex3_mult_rnd_result;             
wire            ex3_mult_sign;                   
wire    [31:0]  ex3_mult_single_result;          
wire    [52:0]  ex3_shift_limit;                 
wire    [63:0]  ex3_shift_limit_one_hot;         
wire            ex3_sub_vld;                     
wire            ex4_early_of;                    
wire            ex4_expnt_rnd_in;                
wire    [31:0]  ex4_fmau_single_result;          
wire    [2 :0]  ex4_inst_rm;                     
wire            ex4_late_of;                     
wire    [24:0]  ex4_mac_data_for_rnd;            
wire    [23:0]  ex4_mac_data_no_rnd;             
wire            ex4_mac_expnt_plus_1;            
wire    [2 :0]  ex4_mac_expnt_sel;               
wire    [52:0]  ex4_mac_frac;                    
wire    [1 :0]  ex4_mac_frac_sel;                
wire            ex4_mac_nx;                      
wire            ex4_mac_of;                      
wire    [24:0]  ex4_mac_rnd_result;              
wire            ex4_mac_sign_result;             
wire            ex4_mac_uf;                      
wire            ex4_of_frac_bit;                 
wire            ex4_plus_1_of;                   
wire    [2 :0]  ex4_rnd_bit;                     
wire            fmau_ex3_data_clk;               
wire            fmau_ex4_data_clk;               
wire    [4 :0]  fmau_fpu_ex3_fflags;             
wire    [31:0]  fmau_fpu_ex3_result;             
wire    [4 :0]  fmau_fpu_ex4_fflags;             
wire    [31:0]  fmau_fpu_ex4_result;             


// &Depend("cpu_cfig.h"); @29

parameter DOUBLE_WIDTH= 64;
parameter DOUBLE_FRAC = 52;
parameter DOUBLE_EXPN = 11;
parameter ADD_D_WIDTH =111;

parameter FUNC_WIDTH  = 10;

parameter SINGLE_WIDTH= 32;
parameter SINGLE_FRAC = 23;
parameter SINGLE_EXPN =  8;
parameter ADD_S_WIDTH = 53;
//==================================================================
//                     EX2 data prepare
//==================================================================
//case 1: E01+2>=E2 MAC
// MULT_RESULT:0|0|X|X|FRAC_H[51:0]|FRAC_L[51:0]|0|0|0
// SRC2        0|x|FRAC[51:0]|000.........000000000000>>shift index
//case 2: E01+2 < E2 MAC
// MULT_RESULT:0|0|00...00000|0|0|X|X|FRAC_H[51:0]|S
// SRC2        0|x|FRAC[51:0]|00....0.....000000000000>>shift index
//case 3:MULT ROUNDING
// MULT_RESULT:00..........000000|0|X|X|FRAC_H[51:0]|S
// SRC2        00..........000000000000|SINGLE...OUBLE|>>shift index
// &CombBeg; @129
// &CombEnd; @136
// &Instance("pa_fmau_lza_double","x_pa_fmau_lza_double"); @156
// &Connect( .summand     (ex3_adder_0    ), @157
//           .addend      (ex3_adder_1    ), @158
//           .sub_vld     (ex3_sub_vld    ), @159
//           .upper_limit (ex3_shift_limit), @160
//           .lza_result  (ex3_lza_result )); @161
// &CombBeg; @266
// &CombEnd; @275
// &CombBeg; @280
// &CombEnd; @286
// &CombBeg; @304
// &CombEnd; @311
// &CombBeg; @354
// &CombEnd; @363
// &CombBeg; @371
// &CombEnd; @377
//==================================================================
//                     EX2 data prepare
//==================================================================
//case 1: E01+2>=E2 MAC
// MULT_RESULT:0|0|X|X|FRAC_H[22:0]|FRAC_L[22:0]|0|0|0
// SRC2        0|x|FRAC[22:0]|000.........000000000000>>shift index
//case 2: E01+2 < E2 MAC
// MULT_RESULT:0|0|00...00000|0|0|X|X|FRAC_H[22:0]|S
// SRC2        0|x|FRAC[22:0]|00....0.....000000000000>>shift index
//case 3:MULT ROUNDING
// MULT_RESULT:00..........000000|0|X|X|FRAC_H[22:0]|S
// SRC2        00..........000000000000|SINGLE...OUBLE|>>shift index

assign ex2_adder_0_0[ADD_S_WIDTH-1:0] = {2'b00,{SINGLE_FRAC{1'b0}}, 2'b00, ex2_mult_data[2*SINGLE_FRAC+1:SINGLE_FRAC],|ex2_mult_single_gs_bit[1:0]};
assign ex2_adder_0_1[ADD_S_WIDTH-1:0] = {2'b00, ex2_mult_data[2*SINGLE_FRAC+1:0],3'b0};

assign ex2_adder_0[ADD_S_WIDTH-1:0] =  ex2_adder_0_sel_h ? ex2_adder_0_0[ADD_S_WIDTH-1:0] : ex2_adder_0_1[ADD_S_WIDTH-1:0];

assign ex2_adder_1_for_single_rnd_add_1 = !ex2_mac && !ex2_mult_data[2*SINGLE_FRAC+1];
assign ex2_adder_1_for_single_rnd_add_2 = !ex2_mac &&  ex2_mult_data[2*SINGLE_FRAC+1];


assign ex2_adder_1_rnd_data[ADD_S_WIDTH-1:0] = {{51{1'b0}},ex2_adder_1_for_single_rnd_add_1,{1{1'b0}} }
                                             | {{50{1'b0}},ex2_adder_1_for_single_rnd_add_2,{2{1'b0}} };

assign ex2_adder_1[ADD_S_WIDTH-1:0] = ex2_sub_vld 
                                   ? ~ex2_shift_data[ADD_S_WIDTH-1:0]
                                   : (ex2_shift_data[ADD_S_WIDTH-1:0] |ex2_adder_1_rnd_data[ADD_S_WIDTH-1:0]);

assign ex2_mult_single_gs_bit[1:0] = {ex2_mult_data[22], |ex2_mult_data[21: 0]};

assign ex2_shift_limit_low[15:0] = 16'b1000_0000_0000_0000 >> ex2_mac_expnt[3:0];
assign ex2_shift_limit_vld       = (ex2_mac_expnt[9:6]==4'b0000);
//==========================================================
//                     EX3 data pipe
//==========================================================

always @(posedge fmau_ex3_data_clk)
begin
 if(ctrl_dp_ex2_inst_pipe_down || ctrl_xx_ex2_warm_up) 
 begin
    ex3_mult_single_gs_bit[1:0]    <= ex2_mult_single_gs_bit[1:0];
    ex3_adder_0[ADD_S_WIDTH-1:0]   <= ex2_adder_0[ADD_S_WIDTH-1:0];
    ex3_adder_1[ADD_S_WIDTH-1:0]   <= ex2_adder_1[ADD_S_WIDTH-1:0];
    ex3_shift_limit_low[15:0]      <= ex2_shift_limit_low[15:0] & {16{ex2_shift_limit_vld}};
  end
end

assign ex3_shift_limit_one_hot[63:0] = {ex3_shift_limit_low[15:0],{48{1'b0}} } >> {ex3_mac_expnt[5:4],4'b0};
assign ex3_shift_limit[52:0] = ex3_shift_limit_one_hot[63:11];
//==========================================================
//                     EX3 adders
//==========================================================
assign ex3_adder_0_result[ADD_S_WIDTH-1:0] = ex3_adder_0[ADD_S_WIDTH-1:0] + ex3_adder_1[ADD_S_WIDTH-1:0];
assign ex3_adder_1_result[ADD_S_WIDTH-1:0] = ex3_adder_0[ADD_S_WIDTH-1:0] + ex3_adder_1[ADD_S_WIDTH-1:0] + 1'b1;

assign ex3_adder_result_sel[0] = !ex3_sub_vld;
assign ex3_adder_result_sel[1] =  ex3_sub_vld && ex3_adder_1_result[ADD_S_WIDTH-1];
assign ex3_adder_result_sel[2] =  ex3_sub_vld &&!ex3_adder_1_result[ADD_S_WIDTH-1];

// &CombBeg; @484
always @( ex3_adder_0_result[52:0]
       or ex3_adder_1_result[52:0]
       or ex3_adder_result_sel[2:0])
begin
case(ex3_adder_result_sel[2:0])
  3'b001: ex3_adder_result[ADD_S_WIDTH-1:0] = ex3_adder_0_result[ADD_S_WIDTH-1:0];
  3'b010: ex3_adder_result[ADD_S_WIDTH-1:0] =~ex3_adder_0_result[ADD_S_WIDTH-1:0];
  3'b100: ex3_adder_result[ADD_S_WIDTH-1:0] = ex3_adder_1_result[ADD_S_WIDTH-1:0];
 default: ex3_adder_result[ADD_S_WIDTH-1:0] = {ADD_S_WIDTH{1'bx}};
endcase
// &CombEnd; @491
end

assign ex3_mac_sign = ex3_mult_sign ^(ex3_sub_vld && ex3_adder_1_result[ADD_S_WIDTH-1]);
assign ex3_mac_frac_not_zero = |ex3_adder_result[ADD_S_WIDTH-1:0];
//==========================================================
//                     EX3 early overflow judge
//==========================================================
//assign ex3_single_of = (ex3_mac_expnt[9:0]==10'b01_0000_0001) && |ex3_adder_result[ADD_S_WIDTH-1:ADD_S_WIDTH-4] //expn=130,frac=1x.xxx or 01.xxx or 00.1xxx or 00.01x
//                     ||(ex3_mac_expnt[9:0]==10'b01_0000_0000) && |ex3_adder_result[ADD_S_WIDTH-1:ADD_S_WIDTH-3] //expn=129,frac=1x.xxx or 01.xxx or 00.1xxx
//                     ||(ex3_mac_expnt[9:0]==10'b00_1111_1111) && |ex3_adder_result[ADD_S_WIDTH-1:ADD_S_WIDTH-2] //expn=128,frac=1x.xxx or 01.xxx
//                     ||(ex3_mac_expnt[9:0]==10'b00_1111_1110) &&  ex3_adder_result[ADD_S_WIDTH-1];              //expn=127, frac=1x.xxx

//======================================================================
//   leading zero predict
//======================================================================
// &Instance("pa_fmau_lza_single","x_pa_fmau_lza_single"); @506
pa_fmau_lza_single  x_pa_fmau_lza_single (
  .addend          (ex3_adder_1    ),
  .lza_result      (ex3_lza_result ),
  .sub_vld         (ex3_sub_vld    ),
  .summand         (ex3_adder_0    ),
  .upper_limit     (ex3_shift_limit)
);

// &Connect( .summand     (ex3_adder_0    ), @507
//           .addend      (ex3_adder_1    ), @508
//           .sub_vld     (ex3_sub_vld    ), @509
//           .upper_limit (ex3_shift_limit), @510
//           .lza_result  (ex3_lza_result )); @511
//==========================================================
//                     EX3 result pipe down
//==========================================================

assign ex3_mac_result_shift[ADD_S_WIDTH-1:0] = ex3_adder_result[ADD_S_WIDTH-1:0]<<{ex3_lza_result[4:0]};
assign ex3_mac_expnt_adjust[SINGLE_EXPN+1:0] = ex3_mac_expnt[SINGLE_EXPN+1:0] -{ {4{1'b0}},ex3_lza_result[5:0]};//plus1

assign ex3_mac_expnt_neg_max                 =(ex3_mac_expnt[SINGLE_EXPN+1:0] == { {4{1'b0}},ex3_lza_result[5:0]});

always @(posedge fmau_ex4_data_clk)
begin
 if(ctrl_dp_ex3_inst_pipe_down || ctrl_xx_ex3_warm_up) 
 begin
    ex4_mac_expnt[SINGLE_EXPN+1:0]     <= ex3_mac_expnt_adjust[SINGLE_EXPN+1:0];
    ex4_mac_frac_pre[ADD_S_WIDTH-1:0]  <= ex3_mac_result_shift[ADD_S_WIDTH-1:0];
    ex4_mac_expnt_neg_max              <= ex3_mac_expnt_neg_max;
    ex4_mac_frac_not_zero              <= ex3_mac_frac_not_zero;
    ex4_mac_shift_32_bit               <= ex3_lza_result[5];
    ex4_mac_sign                       <= ex3_mac_sign;
//    ex4_single_of                  <= ex3_single_of;
  end
end
//======================================================================
//       EX4 MAC RESULT ROUNDING
//======================================================================
assign ex4_mac_frac[ADD_S_WIDTH-1:0] = ex4_mac_shift_32_bit ? {ex4_mac_frac_pre[ADD_S_WIDTH-33:0], {32{1'b0}} }
                                                            :  ex4_mac_frac_pre[ADD_S_WIDTH- 1:0];

assign ex4_early_of = (ex4_mac_expnt[9 : 8]==2'b01)||(ex4_mac_expnt[9 : 0]==10'b00_1111_1111);

assign ex4_plus_1_of=(ex4_mac_expnt[9:0] == 10'b00_1111_1110) && ex4_mac_expnt_plus_1;

assign ex4_of_frac_bit = (ex4_inst_rm[2:0]==3'b001)//rnd to zero 
                       ||(ex4_inst_rm[2:0]==3'b010) && !ex4_mac_sign //rnd to neg and !sign
                       ||(ex4_inst_rm[2:0]==3'b011) &&  ex4_mac_sign;//rnd to pos and  sign

assign ex4_mac_expnt_plus_1 = ex4_mac_frac[ADD_S_WIDTH-1] || ex4_mac_expnt_neg_max;

assign ex4_mac_data_no_rnd[SINGLE_FRAC:0] =(ex4_mac_frac[ADD_S_WIDTH-1] || ex4_mac_expnt_neg_max)
                                          ? ex4_mac_frac[ADD_S_WIDTH-1:ADD_S_WIDTH-SINGLE_FRAC-1]
                                          : ex4_mac_frac[ADD_S_WIDTH-2:ADD_S_WIDTH-SINGLE_FRAC-2];
                                            

assign ex4_mac_data_for_rnd[SINGLE_FRAC+1:0] = {1'b0, ex4_mac_data_no_rnd[SINGLE_FRAC:0]}; 

assign ex4_mac_rnd_result[SINGLE_FRAC+1:0] = ex4_mac_data_for_rnd[SINGLE_FRAC+1:0] +
                                           { {24{1'b0}},1'b1 };

assign ex4_rnd_bit[2:0] = (ex4_mac_frac[ADD_S_WIDTH-1] || ex4_mac_expnt_neg_max)
                        ? {ex4_mac_frac[29:28],|ex4_mac_frac[27:0]}
                        : {ex4_mac_frac[28:27],|ex4_mac_frac[26:0]};
// &CombBeg; @587
always @( ex4_inst_rm[2:0]
       or ex4_mac_sign
       or ex4_rnd_bit[2:0])
begin
case(ex4_inst_rm[2:0])
  3'b000: ex4_mac_rnd_in = ex4_rnd_bit[1] && (ex4_rnd_bit[0] || ex4_rnd_bit[2]); //round to nearest even
  3'b001: ex4_mac_rnd_in = 1'b0;
  3'b010: ex4_mac_rnd_in = ex4_mac_sign && |ex4_rnd_bit[1:0]; //round to negative infinity
  3'b011: ex4_mac_rnd_in =!ex4_mac_sign && |ex4_rnd_bit[1:0]; //round to positive infinity
  3'b100: ex4_mac_rnd_in = ex4_rnd_bit[1];
default : ex4_mac_rnd_in = 1'b0;
endcase
// &CombEnd; @596
end

assign ex4_mac_frac_sel[0] = ex4_mac_rnd_result[SINGLE_FRAC+1] && ex4_mac_rnd_in && !ex4_early_of && !ex4_plus_1_of; //1x.xxx after rnd,no of
assign ex4_mac_frac_sel[1] =!ex4_mac_rnd_result[SINGLE_FRAC+1] && ex4_mac_rnd_in && !ex4_early_of && !ex4_plus_1_of; //0x.xxx after rnd,no of

// &CombBeg; @601
always @( ex4_mac_rnd_result[23:0]
       or ex4_early_of
       or ex4_mac_data_no_rnd[22:0]
       or ex4_mac_frac_sel[1:0]
       or ex4_plus_1_of
       or ex4_of_frac_bit)
begin
case(ex4_mac_frac_sel[1:0])
  2'b01: ex4_mac_frac_result[SINGLE_FRAC-1:0] = ex4_mac_rnd_result[SINGLE_FRAC:1];
  2'b10: ex4_mac_frac_result[SINGLE_FRAC-1:0] = ex4_mac_rnd_result[SINGLE_FRAC-1:0];
default: ex4_mac_frac_result[SINGLE_FRAC-1:0] =(ex4_early_of || ex4_plus_1_of) ? {SINGLE_FRAC{ex4_of_frac_bit}} : ex4_mac_data_no_rnd[SINGLE_FRAC-1:0];
endcase
// &CombEnd; @607
end

assign ex4_expnt_rnd_in = ex4_mac_rnd_in &&
                        &(ex4_mac_data_for_rnd[SINGLE_FRAC-1:0]);

assign ex4_mac_expnt_sel[2] = ex4_mac_data_no_rnd[SINGLE_FRAC] && ex4_mac_frac_not_zero && !ex4_early_of 
                           && ex4_expnt_rnd_in && ex4_mac_expnt_plus_1 && !ex4_plus_1_of;  //plus 2

assign ex4_mac_expnt_sel[1] = ex4_mac_data_no_rnd[SINGLE_FRAC] && ex4_mac_frac_not_zero && !ex4_early_of 
                           &&(ex4_expnt_rnd_in ^ ex4_mac_expnt_plus_1) && !ex4_plus_1_of  //plus 1
                           ||!ex4_mac_data_no_rnd[SINGLE_FRAC] && ex4_mac_frac_not_zero && !ex4_early_of 
                           && ex4_expnt_rnd_in;  //plus 1

assign ex4_mac_expnt_sel[0] = ex4_mac_data_no_rnd[SINGLE_FRAC] && ex4_mac_frac_not_zero && !ex4_early_of 
                           &&!ex4_expnt_rnd_in && !ex4_mac_expnt_plus_1   //plus 0
                           ||!ex4_mac_data_no_rnd[SINGLE_FRAC] && ex4_mac_frac_not_zero && !ex4_early_of
                           &&!ex4_expnt_rnd_in;
// &CombBeg; @624
always @( ex4_mac_expnt[7:0]
       or ex4_mac_expnt_sel[2:0]
       or ex4_early_of
       or ex4_plus_1_of
       or ex4_of_frac_bit)
begin
case(ex4_mac_expnt_sel[2:0])
  3'b100: ex4_mac_expnt_result[SINGLE_EXPN-1:0] = ex4_mac_expnt[SINGLE_EXPN-1:0] + 8'b0000_0010;
  3'b010: ex4_mac_expnt_result[SINGLE_EXPN-1:0] = ex4_mac_expnt[SINGLE_EXPN-1:0] + 8'b0000_0001;
  3'b001: ex4_mac_expnt_result[SINGLE_EXPN-1:0] = ex4_mac_expnt[SINGLE_EXPN-1:0];
 default: ex4_mac_expnt_result[SINGLE_EXPN-1:0] =(ex4_early_of || ex4_plus_1_of) ? {{7{1'b1}},!ex4_of_frac_bit}: 8'b0000_0000; 
endcase
// &CombEnd; @631
end


assign ex4_mac_sign_result = ex4_mac_frac_not_zero ? ex4_mac_sign : (ex4_inst_rm[2:0]==3'b010);

assign ex4_late_of = (ex4_mac_expnt[7:0]==8'b1111_1101) && ex4_mac_expnt_sel[2]
                   ||(ex4_mac_expnt[7:0]==8'b1111_1110) && ex4_mac_expnt_sel[1];

assign ex4_mac_of = ex4_early_of || ex4_plus_1_of || ex4_late_of;

assign ex4_mac_uf = ex4_mac_expnt_neg_max && |ex4_rnd_bit[1:0]  //inexact frac
                && !ex4_expnt_rnd_in && !ex4_mac_data_no_rnd[SINGLE_FRAC];

assign ex4_mac_nx = |ex4_rnd_bit[1:0];

assign fmau_fpu_ex4_fflags[4:0] = {1'b0, 1'b0,ex4_mac_of,ex4_mac_uf,ex4_mac_nx || ex4_mac_of};

assign ex4_fmau_single_result[31:0] = {ex4_mac_sign_result,ex4_mac_expnt_result[7:0],ex4_mac_frac_result[22:0]};

assign fmau_fpu_ex4_result[31:0] = ex4_fmau_single_result[31:0];

//==================================================================================
// EX3 normal mult rounding:expnt= [-126/-1022,126/1022] && no denormal no overflow
//==================================================================================
assign ex3_mult_result[SINGLE_FRAC+1:0] = ex3_adder_0[SINGLE_FRAC+2:1];

assign ex3_mult_rnd_result[SINGLE_FRAC+1:0] = ex3_adder_0_result[SINGLE_FRAC+2:1];

assign ex3_mult_rnd_bit[2:0] = ex3_mult_result[SINGLE_FRAC+1]
                             ?{ex3_mult_result[1:0],|ex3_mult_single_gs_bit[1:0]}
                             :{ex3_mult_result[0],   ex3_mult_single_gs_bit[1:0]};

// &CombBeg; @663
always @( ex3_mult_sign
       or ex3_inst_rm[2:0]
       or ex3_mult_rnd_bit[2:0])
begin
case(ex3_inst_rm[2:0])
  3'b000: ex3_mult_rnd_in = ex3_mult_rnd_bit[1] && (ex3_mult_rnd_bit[0] || ex3_mult_rnd_bit[2]); //round to nearest even
  3'b001: ex3_mult_rnd_in = 1'b0;
  3'b010: ex3_mult_rnd_in = ex3_mult_sign && |ex3_mult_rnd_bit[1:0]; //round to negative infinity
  3'b011: ex3_mult_rnd_in =!ex3_mult_sign && |ex3_mult_rnd_bit[1:0]; //round to positive infinity
  3'b100: ex3_mult_rnd_in = ex3_mult_rnd_bit[1];
default : ex3_mult_rnd_in = 1'b0;
endcase
// &CombEnd; @672
end

assign ex3_mult_frac_sel[0] = ex3_mult_rnd_result[SINGLE_FRAC+1] && ex3_mult_rnd_in;
assign ex3_mult_frac_sel[1] =!ex3_mult_rnd_result[SINGLE_FRAC+1] && ex3_mult_rnd_in;

assign ex3_mult_no_rnd_result[SINGLE_FRAC-1:0] = ex3_mult_result[SINGLE_FRAC+1]
                                               ? ex3_mult_result[SINGLE_FRAC:1]
                                               : ex3_mult_result[SINGLE_FRAC-1:0];
// &CombBeg; @680
always @( ex3_mult_no_rnd_result[22:0]
       or ex3_mult_frac_sel[1:0]
       or ex3_mult_rnd_result[23:0])
begin
case(ex3_mult_frac_sel[1:0])
  2'b01: ex3_mult_frac_result[SINGLE_FRAC-1:0] = ex3_mult_rnd_result[SINGLE_FRAC:1];
  2'b10: ex3_mult_frac_result[SINGLE_FRAC-1:0] = ex3_mult_rnd_result[SINGLE_FRAC-1:0];
default: ex3_mult_frac_result[SINGLE_FRAC-1:0] = ex3_mult_no_rnd_result[SINGLE_FRAC-1:0];
endcase
// &CombEnd; @686
end

assign ex3_mult_expnt_add_in = ex3_mult_result[SINGLE_FRAC+1] 
                          ||  &ex3_mult_result[SINGLE_FRAC-1:0] && ex3_mult_rnd_in;

assign ex3_mult_expnt_plus_1[SINGLE_EXPN+1:0] = ex3_mult_expnt[SINGLE_EXPN+1:0] + 1'b1;

assign ex3_mult_expnt_result[SINGLE_EXPN-1:0] =  ex3_mult_expnt_add_in 
                                               ? ex3_mult_expnt_plus_1[SINGLE_EXPN-1:0]
                                               : ex3_mult_expnt[SINGLE_EXPN-1:0];

assign ex3_mult_single_result[SINGLE_WIDTH-1:0] = { ex3_mult_sign, 
                                                    ex3_mult_expnt_result[SINGLE_EXPN-1:0],
                                                    ex3_mult_frac_result[SINGLE_FRAC-1:SINGLE_FRAC-SINGLE_FRAC]};

assign ex3_mult_nx = |ex3_mult_rnd_bit[1:0];

assign fmau_fpu_ex3_result[SINGLE_WIDTH-1:0] = ex3_mult_single_result[SINGLE_WIDTH-1:0];

assign fmau_fpu_ex3_fflags[4:0] = {4'b0,ex3_mult_nx};

// &ModuleEnd; @708
endmodule



