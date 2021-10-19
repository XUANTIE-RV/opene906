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

// &ModuleBeg; @22
module pa_fadd_lop_s1_s(
  ff1_mask,
  ff1_pred,
  ff1_pred_d,
  ff1_pred_onehot,
  src0_adder,
  src1_adder
);

// &Ports; @23
input   [27:0]  ff1_mask;            
input   [27:0]  src0_adder;          
input   [27:0]  src1_adder;          
output  [4 :0]  ff1_pred;            
output  [4 :0]  ff1_pred_d;          
output  [27:0]  ff1_pred_onehot;     

// &Regs; @24
reg     [4 :0]  ff1_pred_e_d;        
reg     [4 :0]  ff1_pred_t0_d;       
reg     [27:0]  ff1_pred_t0_d_onehot; 

// &Wires; @25
wire    [27:0]  close_adder0_t0;     
wire    [27:0]  close_adder1_t0;     
wire    [27:0]  close_ff1_a_t0;      
wire    [27:0]  close_ff1_b_t0;      
wire    [27:0]  close_ff1_c_t0;      
wire    [27:0]  close_ff1_f_t0;      
wire    [27:0]  close_ff1_g_t0;      
wire    [27:0]  close_ff1_t_t0;      
wire    [27:0]  close_ff1_z_t0;      
wire    [27:0]  ff1_code;            
wire    [27:0]  ff1_mask;            
wire    [4 :0]  ff1_pred;            
wire    [4 :0]  ff1_pred_d;          
wire    [27:0]  ff1_pred_onehot;     
wire    [27:0]  src0_adder;          
wire    [27:0]  src1_adder;          



assign ff1_pred_onehot[27:0] = ff1_pred_t0_d_onehot[27:0];
assign ff1_pred[4:0]         = ff1_pred_t0_d[4:0];
//assign ff1_pred_s[5:0]       = {1'b0,//ff1_pred_t0_s[4:0]};
assign ff1_pred_d[4:0]       = ff1_pred_e_d[4:0];

assign close_adder0_t0[27:0] = src0_adder[27:0];
assign close_adder1_t0[27:0] = src1_adder[27:0];

//close_sum0 for F1-F0
//close_sum select, keep sum not negative
//close_sum0_m1
//assign close_sum_m1_t0[53:0] = $unsigned($signed(close_adder0_t0[53:0])
//                                        - $signed(close_adder1_t0[53:0])
//                                        + $signed(close_m1_oper2[53:0]));
//csky vperl_on
//FF1 Logic of Close Path S0
//If predict first 1 set at r[n]
//Actual first 1 may set at r[n+1] or r[n]
//A and B are to oprand
assign close_ff1_a_t0[27:0] = close_adder0_t0[27:0];
assign close_ff1_b_t0[27:0] = close_adder1_t0[27:0];

//C = B && act_add || ~B && act_sub
assign close_ff1_c_t0[27:0] = ~close_ff1_b_t0[27:0];
//T = A^C  G=A&C  Z=(~A)&(~C)
assign close_ff1_t_t0[27:0] = close_ff1_a_t0[27:0] ^ close_ff1_c_t0[27:0];
assign close_ff1_g_t0[27:0] = close_ff1_a_t0[27:0] & close_ff1_c_t0[27:0];
assign close_ff1_z_t0[27:0] = (~close_ff1_a_t0[27:0]) & (~close_ff1_c_t0[27:0]);
//F :
//fn-1 = En[gi(~zi-1) + zi(~gi-1)] + (~En)[gi(~gi-1) + zi(~zi-1)], En=act_sub
//f0   = t1(g0En+z0) + (~t1)(z0En+g0)
//fi   = ti+1[gi(~zi-1) + zi(~gi-1)] + (~ti+1)[gi(~gi-1) + zi(~zi-1)]
assign close_ff1_f_t0[27]   =  ( close_ff1_g_t0[27] & (~close_ff1_z_t0[26])) |
                               ( close_ff1_z_t0[27] & (~close_ff1_g_t0[26]));
assign close_ff1_f_t0[0]    = (( close_ff1_t_t0[1]) & (close_ff1_g_t0[0] | close_ff1_z_t0[0])) |
                              ((~close_ff1_t_t0[1]) & (close_ff1_z_t0[0] | close_ff1_g_t0[0]));
assign close_ff1_f_t0[26:1] = (( close_ff1_t_t0[27:2]) & ((close_ff1_g_t0[26:1] & (~close_ff1_z_t0[25:0])) |
                               ( close_ff1_z_t0[26:1]  & (~close_ff1_g_t0[25:0]))))                     |
                              ((~close_ff1_t_t0[27:2]) & ((close_ff1_g_t0[26:1] & (~close_ff1_g_t0[25:0])) |
                               ( close_ff1_z_t0[26:1]  & (~close_ff1_z_t0[25:0]))));
assign ff1_code[27:0] = close_ff1_f_t0[27:0] | ff1_mask[27:0];

// &CombBeg; @70
always @( ff1_code[27:0])
begin
casez(ff1_code[27:0])
  28'b1???_????_????_????_????_????_????: begin
    ff1_pred_t0_d_onehot[27:0] = 28'b1000_0000_0000_0000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd0;
    ff1_pred_e_d[4:0]          = 5'b0;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b01??_????_????_????_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0100_0000_0000_0000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd1;
    ff1_pred_e_d[4:0]          = 5'd0;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b001?_????_????_????_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0010_0000_0000_0000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd2;
    ff1_pred_e_d[4:0]          = 5'd1;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0001_????_????_????_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0001_0000_0000_0000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd3;
    ff1_pred_e_d[4:0]          = 5'd2;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_1???_????_????_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_1000_0000_0000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd4;
    ff1_pred_e_d[4:0]          = 5'd3;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_01??_????_????_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0100_0000_0000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd5;
    ff1_pred_e_d[4:0]          = 5'd4;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_001?_????_????_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0010_0000_0000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd6;
    ff1_pred_e_d[4:0]          = 5'd5;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0001_????_????_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0001_0000_0000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd7;
    ff1_pred_e_d[4:0]          = 5'd6;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_1???_????_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_1000_0000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd8;
    ff1_pred_e_d[4:0]          = 5'd7;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_01??_????_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0100_0000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd9;
    ff1_pred_e_d[4:0]          = 5'd8;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_001?_????_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0010_0000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd10;
    ff1_pred_e_d[4:0]          = 5'd9;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0001_????_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0001_0000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd11;
    ff1_pred_e_d[4:0]          = 5'd10;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_1???_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_1000_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd12;
    ff1_pred_e_d[4:0]          = 5'd11;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_01??_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0100_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd13;
    ff1_pred_e_d[4:0]          = 5'd12;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_001?_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0010_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd14;
    ff1_pred_e_d[4:0]          = 5'd13;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0001_????_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0001_0000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd15;
    ff1_pred_e_d[4:0]          = 5'd14;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0000_1???_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0000_1000_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd16;
    ff1_pred_e_d[4:0]          = 5'd15;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0000_01??_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0000_0100_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd17;
    ff1_pred_e_d[4:0]          = 5'd16;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0000_001?_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0000_0010_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd18;
    ff1_pred_e_d[4:0]          = 5'd17;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0000_0001_????_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0000_0001_0000_0000;
    ff1_pred_t0_d[4:0]         = 5'd19;
    ff1_pred_e_d[4:0]          = 5'd18;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0000_0000_1???_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0000_0000_1000_0000;
    ff1_pred_t0_d[4:0]         = 5'd20;
    ff1_pred_e_d[4:0]          = 5'd19;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0000_0000_01??_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0000_0000_0100_0000;
    ff1_pred_t0_d[4:0]         = 5'd21;
    ff1_pred_e_d[4:0]          = 5'd20;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0000_0000_001?_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0000_0000_0010_0000;
    ff1_pred_t0_d[4:0]         = 5'd22;
    ff1_pred_e_d[4:0]          = 5'd21;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0000_0000_0001_???? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0000_0000_0001_0000;
    ff1_pred_t0_d[4:0]         = 5'd23;
    ff1_pred_e_d[4:0]          = 5'd22;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0000_0000_0000_1??? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0000_0000_0000_1000;
    ff1_pred_t0_d[4:0]         = 5'd24;
    ff1_pred_e_d[4:0]          = 5'd23;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0000_0000_0000_01?? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0000_0000_0000_0100;
    ff1_pred_t0_d[4:0]         = 5'd25;
    ff1_pred_e_d[4:0]          = 5'd24;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0000_0000_0000_001? : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0000_0000_0000_0010;
    ff1_pred_t0_d[4:0]         = 5'd26;
    ff1_pred_e_d[4:0]          = 5'd25;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  28'b0000_0000_0000_0000_0000_0000_0001 : begin
    ff1_pred_t0_d_onehot[27:0] = 28'b0000_0000_0000_0000_0000_0000_0001;
    ff1_pred_t0_d[4:0]         = 5'd27;
    ff1_pred_e_d[4:0]          = 5'd26;
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
  default : begin
    ff1_pred_t0_d_onehot[27:0] = {28{1'bx}};
    ff1_pred_t0_d[4:0]         = {5{1'bx}};
    ff1_pred_e_d[4:0]          = {5{1'bx}};
    //ff1_pred_t0_s[4:0]         = {5{1'bx}};
  end
endcase
// &CombEnd; @247
end

// &ModuleEnd; @249
endmodule


