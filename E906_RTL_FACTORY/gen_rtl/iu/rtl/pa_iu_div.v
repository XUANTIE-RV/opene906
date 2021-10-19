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
module pa_iu_div(
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  div_ctrl_itering,
  div_dp_ex1_cmplt,
  div_dp_ex1_cmplt_dp,
  div_dp_ex1_fwd_data,
  div_dp_ex1_fwd_vld,
  div_dp_ex1_stall,
  div_dp_ex2_dst_preg,
  div_dp_ex2_rslt,
  div_dp_ex2_rslt_vld,
  div_iu_debug_info,
  forever_cpuclk,
  idu_iu_ex1_div_cmplt_dp_sel,
  idu_iu_ex1_div_gateclk_sel,
  idu_iu_ex1_div_sel,
  idu_iu_ex1_dst_preg,
  idu_iu_ex1_func,
  idu_iu_ex1_inst_vld,
  idu_iu_ex1_src0,
  idu_iu_ex1_src1,
  idu_iu_ex1_wb_vld,
  ifu_iu_warm_up,
  iu_ex2_div_grant,
  pad_yy_icg_scan_en,
  rtu_yy_xx_async_flush
);

// &Ports; @24
input           cp0_iu_icg_en;              
input           cp0_yy_clk_en;              
input           cpurst_b;                   
input           forever_cpuclk;             
input           idu_iu_ex1_div_cmplt_dp_sel; 
input           idu_iu_ex1_div_gateclk_sel; 
input           idu_iu_ex1_div_sel;         
input   [5 :0]  idu_iu_ex1_dst_preg;        
input   [19:0]  idu_iu_ex1_func;            
input           idu_iu_ex1_inst_vld;        
input   [31:0]  idu_iu_ex1_src0;            
input   [31:0]  idu_iu_ex1_src1;            
input           idu_iu_ex1_wb_vld;          
input           ifu_iu_warm_up;             
input           iu_ex2_div_grant;           
input           pad_yy_icg_scan_en;         
input           rtu_yy_xx_async_flush;      
output          div_ctrl_itering;           
output          div_dp_ex1_cmplt;           
output          div_dp_ex1_cmplt_dp;        
output  [31:0]  div_dp_ex1_fwd_data;        
output          div_dp_ex1_fwd_vld;         
output          div_dp_ex1_stall;           
output  [5 :0]  div_dp_ex2_dst_preg;        
output  [31:0]  div_dp_ex2_rslt;            
output          div_dp_ex2_rslt_vld;        
output  [4 :0]  div_iu_debug_info;          

// &Regs; @25
reg     [2 :0]  div_cur_state;              
reg     [31:0]  div_dividend_raw;           
reg             div_divisor_31;             
reg     [31:0]  div_divisor_reg;            
reg     [4 :0]  div_dst_preg;               
reg     [3 :0]  div_ex1_res_onehot_flop;    
reg     [4 :0]  div_ff1_res_pos;            
reg     [2 :0]  div_next_state;             
reg             div_oper_is_signed_flop;    
reg     [31:0]  div_quotient_reg;           
reg     [31:0]  div_remainder_reg;          
reg             div_res_sel_quotient_flop;  
reg     [31:0]  div_special_res_quotient;   
reg     [31:0]  div_special_res_remainder;  
reg             div_special_res_vld;        

// &Wires; @26
wire            cp0_iu_icg_en;              
wire            cp0_yy_clk_en;              
wire            cpurst_b;                   
wire    [31:0]  div_abnormal_quotient;      
wire    [31:0]  div_abnormal_remainder;     
wire    [31:0]  div_abnormal_res;           
wire            div_abnormal_res_vld;       
wire    [31:0]  div_abs_res;                
wire    [31:0]  div_abs_src;                
wire            div_buffer_update;          
wire            div_clk;                    
wire            div_clk_en;                 
wire            div_clk_en_raw;             
wire            div_cmplt;                  
wire            div_ctrl_itering;           
wire    [31:0]  div_dividend;               
wire            div_dividend_31;            
wire            div_dividend_eq0;           
wire    [31:0]  div_dividend_eq0_quotient;  
wire    [31:0]  div_dividend_eq0_remainder; 
wire            div_dividend_hit_buffer;    
wire    [31:0]  div_divisor;                
wire            div_divisor_eq0;            
wire    [31:0]  div_divisor_eq0_quotient;   
wire    [31:0]  div_divisor_eq0_remainder;  
wire            div_divisor_hit_buffer;     
wire    [31:0]  div_divisor_raw;            
wire            div_divisor_raw_is_neg;     
wire            div_dp_ex1_cmplt;           
wire            div_dp_ex1_cmplt_dp;        
wire    [31:0]  div_dp_ex1_fwd_data;        
wire            div_dp_ex1_fwd_vld;         
wire            div_dp_ex1_stall;           
wire    [5 :0]  div_dp_ex2_dst_preg;        
wire    [31:0]  div_dp_ex2_rslt;            
wire            div_dp_ex2_rslt_vld;        
wire    [31:0]  div_ex1_res;                
wire    [3 :0]  div_ex1_res_onehot;         
wire            div_ex1_res_vld;            
wire            div_ex1_res_vld_raw;        
wire            div_ex1_stall;              
wire            div_ex2_enable_wb;          
wire    [31:0]  div_ex2_res;                
wire            div_ex2_res_vld;            
wire            div_ex2_res_vld_raw;        
wire    [4 :0]  div_ff1_res;                
wire    [4 :0]  div_ff1_res_neg;            
wire    [31:0]  div_ff1_src;                
wire            div_flush;                  
wire            div_flush_buffer;           
wire            div_hit_buffer;             
wire    [31:0]  div_hit_buffer_res;         
wire            div_hit_buffer_res_vld;     
wire            div_inst_vld;               
wire            div_is_idle;                
wire            div_is_signed;              
wire            div_iter_cmplt;             
wire            div_iter_start;             
wire            div_iterating;              
wire    [4 :0]  div_iu_debug_info;          
wire    [31:0]  div_normal_quotient;        
wire    [31:0]  div_normal_remainder;       
wire            div_not_cmplt;              
wire            div_oper_is_signed;         
wire            div_preg_updt_vld;          
wire            div_prepare_src0;           
wire            div_prepare_src1;           
wire    [31:0]  div_quotient_reg_updt;      
wire    [31:0]  div_quotient_res;           
wire    [31:0]  div_remainder_reg_updt;     
wire    [31:0]  div_remainder_res;          
wire            div_res_overflow;           
wire    [31:0]  div_res_overflow_quotient;  
wire    [31:0]  div_res_overflow_remainder; 
wire            div_res_quotient_neg;       
wire            div_res_remainder_neg;      
wire            div_res_sel_quotient;       
wire            div_signed_hit_buffer;      
wire    [31:0]  div_special_res;            
wire            div_special_res_vld_update; 
wire            div_src_is_neg;             
wire    [4 :0]  div_sub_func;               
wire            div_wfwb;                   
wire            forever_cpuclk;             
wire            idu_iu_ex1_div_cmplt_dp_sel; 
wire            idu_iu_ex1_div_gateclk_sel; 
wire            idu_iu_ex1_div_sel;         
wire    [5 :0]  idu_iu_ex1_dst_preg;        
wire    [19:0]  idu_iu_ex1_func;            
wire            idu_iu_ex1_inst_vld;        
wire    [31:0]  idu_iu_ex1_src0;            
wire    [31:0]  idu_iu_ex1_src1;            
wire            idu_iu_ex1_wb_vld;          
wire            ifu_iu_warm_up;             
wire            iu_ex2_div_grant;           
wire            pad_yy_icg_scan_en;         
wire            rtu_yy_xx_async_flush;      


// &Force("bus", "idu_iu_ex1_func", 19, 0); @28

assign div_inst_vld         = idu_iu_ex1_inst_vld && idu_iu_ex1_div_sel;
assign div_sub_func[4:0]    = {5{idu_iu_ex1_div_gateclk_sel}} & idu_iu_ex1_func[4:0];
assign div_oper_is_signed   = div_sub_func[0] || div_sub_func[2];
assign div_res_sel_quotient = div_sub_func[0] || div_sub_func[1];

assign div_dividend[31:0]   = {32{idu_iu_ex1_div_gateclk_sel}} & idu_iu_ex1_src0[31:0];
assign div_divisor[31:0]    = {32{idu_iu_ex1_div_gateclk_sel}} & idu_iu_ex1_src1[31:0];

assign div_preg_updt_vld    =  idu_iu_ex1_div_gateclk_sel & ~div_ex1_stall;
// &Force("bus", "idu_iu_ex1_dst_preg", 5, 0); @39
always @ (posedge div_clk)
begin
  if (ifu_iu_warm_up)
    div_dst_preg[4:0] <= 5'b0;
  else if (div_preg_updt_vld)
    div_dst_preg[4:0] <= idu_iu_ex1_dst_preg[4:0];
  else
    div_dst_preg[4:0] <= div_dst_preg[4:0];
end

//==========================================================
//                  DIV Main State Machine
//==========================================================
parameter IDLE  = 3'b000,
          WFI2  = 3'b001,
          ITER  = 3'b010,
          CMPLT = 3'b011,
          WFWB  = 3'b100; // EX2 stall set and must wait for wb.

always @ (posedge div_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    div_cur_state[2:0] <= IDLE;
  else if (div_flush)
    div_cur_state[2:0] <= IDLE;
  else
    div_cur_state[2:0] <= div_next_state[2:0];
end

// &CombBeg; @83
always @( div_iter_start
       or div_ex2_enable_wb
       or div_cur_state[2:0]
       or div_ex1_res_vld
       or div_iter_cmplt)
begin
case (div_cur_state[2:0])
  IDLE:
  begin
    if (div_iter_start)
      div_next_state[2:0] = WFI2;
    else if(div_ex1_res_vld)
      div_next_state[2:0] = WFWB;
    else
      div_next_state[2:0] = IDLE;
  end
  WFI2:
    div_next_state[2:0] = ITER;
  ITER:
  begin
    if (div_iter_cmplt)
      div_next_state[2:0] = CMPLT;
    else
      div_next_state[2:0] = ITER;
  end
  CMPLT:
  begin
    if (div_ex2_enable_wb)
      if (div_iter_start)
        div_next_state[2:0] = WFI2;
      else  if (div_ex1_res_vld)
        div_next_state[2:0] = WFWB;
      else
        div_next_state[2:0] = IDLE;
    else
      div_next_state[2:0] = WFWB;
  end
  WFWB:
  begin
    if (div_ex2_enable_wb)
      if (div_iter_start)
        div_next_state[2:0] = WFI2;
      else  if (div_ex1_res_vld)
        div_next_state[2:0] = WFWB;
      else
        div_next_state[2:0] = IDLE;
    else
      div_next_state[2:0] = WFWB;
  end
  default:
    div_next_state[2:0] = IDLE;
endcase
// &CombEnd; @130
end


assign div_is_idle      = div_cur_state[2:0] == IDLE
                       || div_ex2_res_vld;       // Next state will be IDLE;
assign div_iter_start   = div_inst_vld && !div_ex1_res_vld_raw;
assign div_prepare_src0 = div_is_idle &&  div_iter_start;
assign div_prepare_src1 = div_cur_state[2:0] == WFI2;
assign div_iterating    = div_cur_state[2:0] == ITER;
assign div_cmplt        = div_cur_state[2:0] == CMPLT;
assign div_wfwb         = div_cur_state[2:0] == WFWB;

//==========================================================
//                 Special Result Judgement
//==========================================================
// Judge if abnormal result or not @ IDLE
assign div_dividend_eq0                 = div_dividend[31:0] == 32'b0;
assign div_dividend_eq0_quotient[31:0]  = 32'b0;
assign div_dividend_eq0_remainder[31:0] = 32'b0;

assign div_divisor_eq0                  = div_divisor[31:0] == 32'b0;
assign div_divisor_eq0_quotient[31:0]   = 32'hffff_ffff;
assign div_divisor_eq0_remainder[31:0]  = div_dividend[31:0];

assign div_res_overflow                 = div_oper_is_signed
                                       && (div_dividend[31:0] == 32'h8000_0000)
                                       && (div_divisor[31:0] == 32'hffff_ffff);
assign div_res_overflow_quotient[31:0]  = 32'h8000_0000;
assign div_res_overflow_remainder[31:0] = 32'b0;

assign div_abnormal_res_vld             = div_dividend_eq0
                                       || div_divisor_eq0
                                       || div_res_overflow;
assign div_abnormal_quotient[31:0]      = {32{div_dividend_eq0}} & div_dividend_eq0_quotient[31:0]
                                        | {32{div_divisor_eq0}}  & div_divisor_eq0_quotient[31:0]
                                        | {32{div_res_overflow}} & div_res_overflow_quotient[31:0];
assign div_abnormal_remainder[31:0]     = {32{div_dividend_eq0}} & div_dividend_eq0_remainder[31:0]
                                        | {32{div_divisor_eq0}}  & div_divisor_eq0_remainder[31:0]
                                        | {32{div_res_overflow}} & div_res_overflow_remainder[31:0];
assign div_abnormal_res[31:0]           = div_res_sel_quotient ? div_abnormal_quotient[31:0]
                                                               : div_abnormal_remainder[31:0];

assign div_hit_buffer_res_vld           = div_hit_buffer & ~div_abnormal_res_vld;
assign div_hit_buffer_res[31:0]         = div_res_sel_quotient ? div_quotient_res[31:0]
                                                               : div_remainder_res[31:0];

assign div_ex1_res_vld_raw              = (div_abnormal_res_vld || div_hit_buffer_res_vld)
                                        && div_is_idle;
assign div_ex1_res[31:0]                = div_abnormal_res_vld ? div_abnormal_res[31:0]
                                                               : div_hit_buffer_res[31:0];
assign div_ex1_res_vld                  = div_ex1_res_vld_raw && div_inst_vld;
assign div_ex1_res_onehot[3:0]          = {div_hit_buffer_res_vld, 
                                           div_dividend_eq0 && !div_divisor_eq0, 
                                           div_divisor_eq0, 
                                           div_res_overflow};

always @(posedge div_clk)
begin
  if (ifu_iu_warm_up) begin
    div_ex1_res_onehot_flop[3:0] <= 4'b0;
  end
  else if (div_ex1_res_vld)begin
    div_ex1_res_onehot_flop[3:0] <= div_ex1_res_onehot[3:0];
  end
end

assign div_special_res_vld_update = div_is_idle && div_inst_vld;
assign div_buffer_update          = div_is_idle && div_inst_vld;
always @(posedge div_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    div_special_res_vld <= 1'b0;
  end
  else if (div_special_res_vld_update)begin
    div_special_res_vld <= div_ex1_res_vld_raw;
  end
end

// &CombBeg; @222
always @( div_ex1_res_onehot_flop[3:0]
       or div_quotient_res[31:0])
begin
  case(div_ex1_res_onehot_flop[3:0])
    4'b0001 :  div_special_res_quotient[31:0] = 32'h8000_0000;
    4'b0010 :  div_special_res_quotient[31:0] = 32'hffff_ffff;
    4'b0100 :  div_special_res_quotient[31:0] = 32'b0;
    4'b1000 :  div_special_res_quotient[31:0] = div_quotient_res[31:0];
    default:   div_special_res_quotient[31:0] = {32{1'bx}};
  endcase
// &CombEnd @230
end

// &CombBeg; @232
always @( div_dividend_raw[31:0]
       or div_ex1_res_onehot_flop[3:0]
       or div_remainder_res[31:0])
begin
  case(div_ex1_res_onehot_flop[3:0])
    4'b0001 :  div_special_res_remainder[31:0] = 32'b0;
    4'b0010 :  div_special_res_remainder[31:0] = div_dividend_raw[31:0];
    4'b0100 :  div_special_res_remainder[31:0] = 32'b0;
    4'b1000 :  div_special_res_remainder[31:0] = div_remainder_res[31:0];
    default:   div_special_res_remainder[31:0] = {32{1'bx}};
  endcase
// &CombEnd @240
end

assign div_special_res[31:0]  = div_res_sel_quotient_flop ? div_special_res_quotient[31:0] 
                                                          : div_special_res_remainder[31:0];

//==========================================================
//                       Abs and FF1
//==========================================================
// Calculate ABS and find first 1 @ IDLE and WFI2
// div_prepare_src0 is dirty. Must use other signal as ctrl signal.
assign div_abs_src[31:0] = div_prepare_src1 ? div_divisor_reg[31:0]
                                            : div_dividend[31:0];

assign div_is_signed     = div_prepare_src1 ? div_oper_is_signed_flop
                                            : div_oper_is_signed;

assign div_src_is_neg    = div_is_signed ? div_abs_src[31]
                                         : 1'b0;

assign div_abs_res[31:0] = div_src_is_neg ? ~div_abs_src[31:0] + 32'b1
                                          :  div_abs_src[31:0];

assign div_ff1_src[31:0] = div_abs_src[31:0];
// &CombBeg; @263
always @( div_ff1_src[31:0])
begin
  casez (div_ff1_src[31:0])
    32'b1???????????????????????????????: div_ff1_res_pos[4:0] = 5'd31;
    32'b01??????????????????????????????: div_ff1_res_pos[4:0] = 5'd30;
    32'b001?????????????????????????????: div_ff1_res_pos[4:0] = 5'd29;
    32'b0001????????????????????????????: div_ff1_res_pos[4:0] = 5'd28;
    32'b00001???????????????????????????: div_ff1_res_pos[4:0] = 5'd27;
    32'b000001??????????????????????????: div_ff1_res_pos[4:0] = 5'd26;
    32'b0000001?????????????????????????: div_ff1_res_pos[4:0] = 5'd25;
    32'b00000001????????????????????????: div_ff1_res_pos[4:0] = 5'd24;
    32'b000000001???????????????????????: div_ff1_res_pos[4:0] = 5'd23;
    32'b0000000001??????????????????????: div_ff1_res_pos[4:0] = 5'd22;
    32'b00000000001?????????????????????: div_ff1_res_pos[4:0] = 5'd21;
    32'b000000000001????????????????????: div_ff1_res_pos[4:0] = 5'd20;
    32'b0000000000001???????????????????: div_ff1_res_pos[4:0] = 5'd19;
    32'b00000000000001??????????????????: div_ff1_res_pos[4:0] = 5'd18;
    32'b000000000000001?????????????????: div_ff1_res_pos[4:0] = 5'd17;
    32'b0000000000000001????????????????: div_ff1_res_pos[4:0] = 5'd16;
    32'b00000000000000001???????????????: div_ff1_res_pos[4:0] = 5'd15;
    32'b000000000000000001??????????????: div_ff1_res_pos[4:0] = 5'd14;
    32'b0000000000000000001?????????????: div_ff1_res_pos[4:0] = 5'd13;
    32'b00000000000000000001????????????: div_ff1_res_pos[4:0] = 5'd12;
    32'b000000000000000000001???????????: div_ff1_res_pos[4:0] = 5'd11;
    32'b0000000000000000000001??????????: div_ff1_res_pos[4:0] = 5'd10;
    32'b00000000000000000000001?????????: div_ff1_res_pos[4:0] = 5'd9;
    32'b000000000000000000000001????????: div_ff1_res_pos[4:0] = 5'd8;
    32'b0000000000000000000000001???????: div_ff1_res_pos[4:0] = 5'd7;
    32'b00000000000000000000000001??????: div_ff1_res_pos[4:0] = 5'd6;
    32'b000000000000000000000000001?????: div_ff1_res_pos[4:0] = 5'd5;
    32'b0000000000000000000000000001????: div_ff1_res_pos[4:0] = 5'd4;
    32'b00000000000000000000000000001???: div_ff1_res_pos[4:0] = 5'd3;
    32'b000000000000000000000000000001??: div_ff1_res_pos[4:0] = 5'd2;
    32'b0000000000000000000000000000001?: div_ff1_res_pos[4:0] = 5'd1;
    32'b00000000000000000000000000000001: div_ff1_res_pos[4:0] = 5'd0;
    32'b00000000000000000000000000000000: div_ff1_res_pos[4:0] = 5'd0;       // In div, src eq 0 is meanless, don't care.
    default:                              div_ff1_res_pos[4:0] = {5{1'bx}};
  endcase
// &CombEnd; @300
end

//----------------------------------------------------------
//                       Negetive FF1
//----------------------------------------------------------
assign div_ff1_res_neg[4:0] =
  {5{  div_ff1_src[31]     && !div_ff1_src[30] && !(|div_ff1_src[29:0])}} & 5'd31
| {5{  div_ff1_src[31]     && !div_ff1_src[30] &&  (|div_ff1_src[29:0])}} & 5'd30
| {5{(&div_ff1_src[31:30]) && !div_ff1_src[29] && !(|div_ff1_src[28:0])}} & 5'd30
| {5{(&div_ff1_src[31:30]) && !div_ff1_src[29] &&  (|div_ff1_src[28:0])}} & 5'd29
| {5{(&div_ff1_src[31:29]) && !div_ff1_src[28] && !(|div_ff1_src[27:0])}} & 5'd29
| {5{(&div_ff1_src[31:29]) && !div_ff1_src[28] &&  (|div_ff1_src[27:0])}} & 5'd28
| {5{(&div_ff1_src[31:28]) && !div_ff1_src[27] && !(|div_ff1_src[26:0])}} & 5'd28
| {5{(&div_ff1_src[31:28]) && !div_ff1_src[27] &&  (|div_ff1_src[26:0])}} & 5'd27
| {5{(&div_ff1_src[31:27]) && !div_ff1_src[26] && !(|div_ff1_src[25:0])}} & 5'd27
| {5{(&div_ff1_src[31:27]) && !div_ff1_src[26] &&  (|div_ff1_src[25:0])}} & 5'd26
| {5{(&div_ff1_src[31:26]) && !div_ff1_src[25] && !(|div_ff1_src[24:0])}} & 5'd26
| {5{(&div_ff1_src[31:26]) && !div_ff1_src[25] &&  (|div_ff1_src[24:0])}} & 5'd25
| {5{(&div_ff1_src[31:25]) && !div_ff1_src[24] && !(|div_ff1_src[23:0])}} & 5'd25
| {5{(&div_ff1_src[31:25]) && !div_ff1_src[24] &&  (|div_ff1_src[23:0])}} & 5'd24
| {5{(&div_ff1_src[31:24]) && !div_ff1_src[23] && !(|div_ff1_src[22:0])}} & 5'd24
| {5{(&div_ff1_src[31:24]) && !div_ff1_src[23] &&  (|div_ff1_src[22:0])}} & 5'd23
| {5{(&div_ff1_src[31:23]) && !div_ff1_src[22] && !(|div_ff1_src[21:0])}} & 5'd23
| {5{(&div_ff1_src[31:23]) && !div_ff1_src[22] &&  (|div_ff1_src[21:0])}} & 5'd22
| {5{(&div_ff1_src[31:22]) && !div_ff1_src[21] && !(|div_ff1_src[20:0])}} & 5'd22
| {5{(&div_ff1_src[31:22]) && !div_ff1_src[21] &&  (|div_ff1_src[20:0])}} & 5'd21
| {5{(&div_ff1_src[31:21]) && !div_ff1_src[20] && !(|div_ff1_src[19:0])}} & 5'd21
| {5{(&div_ff1_src[31:21]) && !div_ff1_src[20] &&  (|div_ff1_src[19:0])}} & 5'd20
| {5{(&div_ff1_src[31:20]) && !div_ff1_src[19] && !(|div_ff1_src[18:0])}} & 5'd20
| {5{(&div_ff1_src[31:20]) && !div_ff1_src[19] &&  (|div_ff1_src[18:0])}} & 5'd19
| {5{(&div_ff1_src[31:19]) && !div_ff1_src[18] && !(|div_ff1_src[17:0])}} & 5'd19
| {5{(&div_ff1_src[31:19]) && !div_ff1_src[18] &&  (|div_ff1_src[17:0])}} & 5'd18
| {5{(&div_ff1_src[31:18]) && !div_ff1_src[17] && !(|div_ff1_src[16:0])}} & 5'd18
| {5{(&div_ff1_src[31:18]) && !div_ff1_src[17] &&  (|div_ff1_src[16:0])}} & 5'd17
| {5{(&div_ff1_src[31:17]) && !div_ff1_src[16] && !(|div_ff1_src[15:0])}} & 5'd17
| {5{(&div_ff1_src[31:17]) && !div_ff1_src[16] &&  (|div_ff1_src[15:0])}} & 5'd16
| {5{(&div_ff1_src[31:16]) && !div_ff1_src[15] && !(|div_ff1_src[14:0])}} & 5'd16
| {5{(&div_ff1_src[31:16]) && !div_ff1_src[15] &&  (|div_ff1_src[14:0])}} & 5'd15
| {5{(&div_ff1_src[31:15]) && !div_ff1_src[14] && !(|div_ff1_src[13:0])}} & 5'd15
| {5{(&div_ff1_src[31:15]) && !div_ff1_src[14] &&  (|div_ff1_src[13:0])}} & 5'd14
| {5{(&div_ff1_src[31:14]) && !div_ff1_src[13] && !(|div_ff1_src[12:0])}} & 5'd14
| {5{(&div_ff1_src[31:14]) && !div_ff1_src[13] &&  (|div_ff1_src[12:0])}} & 5'd13
| {5{(&div_ff1_src[31:13]) && !div_ff1_src[12] && !(|div_ff1_src[11:0])}} & 5'd13
| {5{(&div_ff1_src[31:13]) && !div_ff1_src[12] &&  (|div_ff1_src[11:0])}} & 5'd12
| {5{(&div_ff1_src[31:12]) && !div_ff1_src[11] && !(|div_ff1_src[10:0])}} & 5'd12
| {5{(&div_ff1_src[31:12]) && !div_ff1_src[11] &&  (|div_ff1_src[10:0])}} & 5'd11
| {5{(&div_ff1_src[31:11]) && !div_ff1_src[10] && !(|div_ff1_src[9:0])}}  & 5'd11
| {5{(&div_ff1_src[31:11]) && !div_ff1_src[10] &&  (|div_ff1_src[9:0])}}  & 5'd10
| {5{(&div_ff1_src[31:10]) && !div_ff1_src[9]  && !(|div_ff1_src[8:0])}}  & 5'd10
| {5{(&div_ff1_src[31:10]) && !div_ff1_src[9]  &&  (|div_ff1_src[8:0])}}  & 5'd9
| {5{(&div_ff1_src[31:9])  && !div_ff1_src[8]  && !(|div_ff1_src[7:0])}}  & 5'd9
| {5{(&div_ff1_src[31:9])  && !div_ff1_src[8]  &&  (|div_ff1_src[7:0])}}  & 5'd8
| {5{(&div_ff1_src[31:8])  && !div_ff1_src[7]  && !(|div_ff1_src[6:0])}}  & 5'd8
| {5{(&div_ff1_src[31:8])  && !div_ff1_src[7]  &&  (|div_ff1_src[6:0])}}  & 5'd7
| {5{(&div_ff1_src[31:7])  && !div_ff1_src[6]  && !(|div_ff1_src[5:0])}}  & 5'd7
| {5{(&div_ff1_src[31:7])  && !div_ff1_src[6]  &&  (|div_ff1_src[5:0])}}  & 5'd6
| {5{(&div_ff1_src[31:6])  && !div_ff1_src[5]  && !(|div_ff1_src[4:0])}}  & 5'd6
| {5{(&div_ff1_src[31:6])  && !div_ff1_src[5]  &&  (|div_ff1_src[4:0])}}  & 5'd5
| {5{(&div_ff1_src[31:5])  && !div_ff1_src[4]  && !(|div_ff1_src[3:0])}}  & 5'd5
| {5{(&div_ff1_src[31:5])  && !div_ff1_src[4]  &&  (|div_ff1_src[3:0])}}  & 5'd4
| {5{(&div_ff1_src[31:4])  && !div_ff1_src[3]  && !(|div_ff1_src[2:0])}}  & 5'd4
| {5{(&div_ff1_src[31:4])  && !div_ff1_src[3]  &&  (|div_ff1_src[2:0])}}  & 5'd3
| {5{(&div_ff1_src[31:3])  && !div_ff1_src[2]  && !(|div_ff1_src[1:0])}}  & 5'd3
| {5{(&div_ff1_src[31:3])  && !div_ff1_src[2]  &&  (|div_ff1_src[1:0])}}  & 5'd2
| {5{(&div_ff1_src[31:2])  && !div_ff1_src[1]  &&   !div_ff1_src[0]}}     & 5'd2
| {5{(&div_ff1_src[31:2])  && !div_ff1_src[1]  &&    div_ff1_src[0]}}     & 5'd1
| {5{(&div_ff1_src[31:1])  && !div_ff1_src[0]}}                   & 5'd1
| {5{(&div_ff1_src[31:0])}}                               & 5'd0;

assign div_ff1_res[4:0] = div_src_is_neg ? div_ff1_res_neg[4:0]
                                         : div_ff1_res_pos[4:0];


always @ (posedge div_clk)
begin
  if (ifu_iu_warm_up) begin
    div_oper_is_signed_flop   <= 1'b0;
    div_res_sel_quotient_flop <= 1'b0;
    // div_dividend_31           <= 1'b0;
    div_divisor_31            <= 1'b0;
  end
  else if (div_buffer_update || div_ex1_res_vld) begin
    div_oper_is_signed_flop   <= div_oper_is_signed;
    div_res_sel_quotient_flop <= div_res_sel_quotient;
    // div_dividend_31           <= div_dividend[31];
    div_divisor_31            <= div_divisor[31];
  end
end

assign div_dividend_31 = div_dividend_raw[31];

assign div_res_quotient_neg  = div_oper_is_signed_flop && (div_dividend_31 ^ div_divisor_31);
assign div_res_remainder_neg = div_oper_is_signed_flop && div_dividend_31;

// Save div_divisor @ WFI2, hold the value @ ITERdiv_ex1_res_vld
// divisor_raw will be saved in div_divisor_reg after DIV_CMPLT.
always @ (posedge div_clk)
begin
  if (ifu_iu_warm_up)
    div_divisor_reg[31:0] <= 32'b0;
  else if (div_buffer_update)
    div_divisor_reg[31:0] <= div_divisor[31:0];
  else if (div_prepare_src1)
    div_divisor_reg[31:0] <= div_abs_res[31:0];
  else if (div_iter_cmplt)
    div_divisor_reg[31:0] <= div_divisor_raw[31:0];
end

assign div_divisor_raw_is_neg = div_oper_is_signed_flop && div_divisor_31;
assign div_divisor_raw[31:0] = div_divisor_raw_is_neg ? ~div_divisor_reg[31:0] + 32'b1
                                                      : div_divisor_reg[31:0];

// Save the initial value @ IDLE, change the value @ITER
always @ (posedge div_clk)
begin
  if (ifu_iu_warm_up) begin
    div_quotient_reg[31:0]  <= 32'b0;
    div_remainder_reg[31:0] <= 32'b0;
  end
  else if (div_prepare_src0) begin
    div_quotient_reg[31:0]  <= 32'b0;
    div_remainder_reg[31:0] <= div_abs_res[31:0];
  end
  else if (div_cmplt) begin
    div_quotient_reg[31:0]  <= div_normal_quotient[31:0];
    div_remainder_reg[31:0] <= div_normal_remainder[31:0];
  end
  else if (div_iterating) begin
    div_quotient_reg[31:0]  <= div_quotient_reg_updt[31:0];
    div_remainder_reg[31:0] <= div_remainder_reg_updt[31:0];
  end
end

// Do iteration compare @ ITER.
// &Instance("pa_iu_div_shift_kernel", "x_pa_iu_div_kernel");
// &Instance("pa_iu_div_shift2_kernel", "x_pa_iu_div_kernel"); @500
pa_iu_div_shift2_kernel  x_pa_iu_div_kernel (
  .cpurst_b               (cpurst_b              ),
  .div_clk                (div_clk               ),
  .div_divisor_reg        (div_divisor_reg       ),
  .div_ff1_res            (div_ff1_res           ),
  .div_flush              (div_flush             ),
  .div_iter_cmplt         (div_iter_cmplt        ),
  .div_iterating          (div_iterating         ),
  .div_prepare_src0       (div_prepare_src0      ),
  .div_prepare_src1       (div_prepare_src1      ),
  .div_quotient_reg       (div_quotient_reg      ),
  .div_quotient_reg_updt  (div_quotient_reg_updt ),
  .div_remainder_reg      (div_remainder_reg     ),
  .div_remainder_reg_updt (div_remainder_reg_updt)
);

// &Instance("pa_iu_div_srt_kernel", "x_pa_iu_div_kernel");

assign div_normal_quotient[31:0]          = div_res_quotient_neg ? ~div_quotient_reg[31:0] + 32'b1
                                                                 : div_quotient_reg[31:0];
assign div_normal_remainder[31:0]         = div_res_remainder_neg ? ~div_remainder_reg[31:0] + 32'b1
                                                                  : div_remainder_reg[31:0];

assign div_quotient_res[31:0]  = div_cmplt ? div_normal_quotient[31:0]
                                           : div_quotient_reg[31:0];
assign div_remainder_res[31:0] = div_cmplt ? div_normal_remainder[31:0]
                                           : div_remainder_reg[31:0];


assign div_ex2_enable_wb  = iu_ex2_div_grant;
assign div_ex2_res_vld_raw = (div_cmplt || div_wfwb);    // div main state.
assign div_ex2_res_vld    = div_ex2_res_vld_raw && iu_ex2_div_grant;
assign div_ex2_res[31:0]  = div_res_sel_quotient_flop ? div_quotient_res[31:0]
                                                      : div_remainder_res[31:0];


//==========================================================
//                 WriteBack State Machine
//==========================================================
//parameter WB_IDLE  = 2'b00,
//          WB_EX2   = 2'b10,
//          WB_CMPLT = 2'b01;
//
//always @ (posedge div_clk or negedge cpurst_b)
//begin
//  if (!cpurst_b)
//    wb_cur_state[1:0] <= WB_IDLE;
//  else if (div_flush)
//    wb_cur_state[1:0] <= WB_IDLE;
//  else
//    wb_cur_state[1:0] <= wb_nxt_state[1:0];
//end
//
//&CombBeg;
//  case(wb_cur_state)
//    WB_IDLE:
//      if (div_inst_vld)
//        if (dp_xx_ex2_stall)
//          wb_nxt_state = WB_IDLE;
//        else
//          wb_nxt_state = WB_EX2;
//      else
//        wb_nxt_state = WB_IDLE;
//    WB_EX2:
//      if (dp_xx_ex2_stall)
//        wb_nxt_state = WB_EX2;
//      else
//        if (div_ex2_res_vld)
//          if (div_iter_start && !dp_xx_ex2_stall)
//            wb_nxt_state = WB_EX2;
//          else
//            wb_nxt_state = WB_IDLE;
//        else
//          wb_nxt_state = WB_CMPLT;
//    WB_CMPLT:
//      if (div_ex2_res_vld)
//        if (div_iter_start && !dp_xx_ex2_stall)
//          wb_nxt_state = WB_EX2;
//        else
//          wb_nxt_state = WB_IDLE;
//      else
//        wb_nxt_state = WB_CMPLT;
//    default:
//      wb_nxt_state = WB_IDLE;
//  endcase
//&CombEnd;
//
//assign div_wb_sm_idle  = wb_cur_state == WB_IDLE
//                      || wb_cur_state == WB_CMPLT && div_ex2_res_vld;
//assign div_wb_sm_ex2   = wb_cur_state == WB_EX2;
//assign div_wb_sm_cmplt = wb_cur_state == WB_EX2
//                      || wb_cur_state == WB_CMPLT;
//
//==========================================================
//                   Output for IU ctrl
//==========================================================
assign div_dp_ex1_cmplt           = div_inst_vld && (~div_ex1_stall);
assign div_dp_ex1_cmplt_dp        = idu_iu_ex1_div_cmplt_dp_sel;
// &Force("output", "div_dp_ex1_cmplt_dp"); @583
assign div_dp_ex1_fwd_vld         = div_ex1_res_vld_raw && div_dp_ex1_cmplt_dp & idu_iu_ex1_wb_vld;
assign div_dp_ex1_fwd_data[31:0]  = div_ex1_res[31:0];

assign div_dp_ex2_rslt_vld       = div_ex2_res_vld_raw;
assign div_dp_ex2_rslt[31:0]     = div_special_res_vld ? div_special_res[31:0]  : div_ex2_res[31:0];
assign div_dp_ex2_dst_preg[5:0]  = {1'b0,div_dst_preg[4:0]};
//==========================================================
//                      DIV stall
//==========================================================
//-------------- To IDU ----------------
// assign iu_idu_div_ex1_data_vld   = div_ex1_res_vld;
// assign iu_idu_div_data_vld       = div_ex2_res_vld;
// assign iu_idu_div_dest_vld       = div_cur_state != IDLE;
// assign iu_idu_div_dest_preg[5:0] = {1'b0, (idu_iu_ex1_div_sel ? idu_iu_ex1_dst_preg[4:0]
//                                                               : div_dst_preg[4:0])};

//-------------- To RTU ----------------
assign div_ex1_stall =  idu_iu_ex1_div_gateclk_sel && !div_is_idle;
assign div_dp_ex1_stall = div_ex1_stall;

//==========================================================
//                      DIV flush
//==========================================================
assign div_flush        = rtu_yy_xx_async_flush;
assign div_not_cmplt    = div_flush && (div_cur_state[2:0] != IDLE || div_prepare_src0);
assign div_flush_buffer = div_not_cmplt || ifu_iu_warm_up;

//==========================================================
//                      DIV buffer
//==========================================================
// DIV Has one buffer for div fuse and speed up calculation
always @ (posedge div_clk)
begin
  if (div_flush_buffer)
    div_dividend_raw[31:0] <= 32'b0;
  else if (div_buffer_update)
    div_dividend_raw[31:0] <= div_dividend[31:0];
end

assign div_dividend_hit_buffer = div_dividend_raw[31:0] == div_dividend[31:0];
assign div_divisor_hit_buffer  = div_divisor_reg[31:0]  == div_divisor[31:0];
assign div_signed_hit_buffer   = div_oper_is_signed_flop == div_oper_is_signed;

assign div_hit_buffer = div_dividend_hit_buffer
                     && div_divisor_hit_buffer
                     && div_signed_hit_buffer;

//==========================================================
//                       Gate Cell
//==========================================================
assign div_clk_en_raw = idu_iu_ex1_div_gateclk_sel || (div_cur_state[2:0] != IDLE);
assign div_ctrl_itering = !div_is_idle;

//==========================================================
//                  DIV gateclk
//==========================================================
assign div_clk_en = div_clk_en_raw
                 || ifu_iu_warm_up;

// &Instance("gated_clk_cell", "x_div_clk"); @655
gated_clk_cell  x_div_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (div_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (div_clk_en        ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @656
//          .external_en (1'b0), @657
//          .global_en   (cp0_yy_clk_en), @658
//          .module_en   (cp0_iu_icg_en), @659
//          .local_en    (div_clk_en), @660
//          .clk_out     (div_clk)); @661


assign div_iu_debug_info[4:0] = {2'b0, div_cur_state[2:0]};

// &ModuleEnd; @666
endmodule


