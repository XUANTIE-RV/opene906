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
module pa_iu_ctrl(
  ag_dp_ex1_dst_preg,
  ag_dp_ex1_fwd_data,
  ag_dp_ex1_fwd_vld,
  alu_dp_ex1_cmplt,
  alu_dp_ex1_cmplt_dp,
  alu_dp_ex1_fwd_vld,
  alu_dp_ex1_rslt,
  bju_dp_ex1_cmplt_dp,
  bju_dp_ex1_rslt,
  bju_dp_ex1_rslt_vld,
  bju_dp_ex1_stall,
  bju_dp_no_op,
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
  dp_xx_ex1_stall,
  dp_xx_ex2_stall,
  forever_cpuclk,
  fpu_iu_ex1_cmplt,
  fpu_iu_ex1_cmplt_dp,
  idu_iu_ex1_alu_sel,
  idu_iu_ex1_dst_preg,
  idu_iu_ex1_gateclk_vld,
  idu_iu_ex1_inst_len,
  idu_iu_ex1_inst_vld,
  idu_iu_ex1_ipop_int_mask,
  idu_iu_ex1_ipush_mie_en,
  idu_iu_ex1_ipush_spec_fail,
  idu_iu_ex1_mul_sel,
  idu_iu_ex1_rd_pair,
  idu_iu_ex1_split,
  idu_iu_ex1_tail_int_vld,
  idu_iu_ex1_wb_vld,
  ifu_iu_warm_up,
  iu_ex2_div_grant,
  iu_idu_ex1_fwd_data,
  iu_idu_ex1_fwd_preg,
  iu_idu_ex1_fwd_vld,
  iu_idu_ex1_stall,
  iu_idu_ex2_div_vld,
  iu_idu_ex2_fwd_data0,
  iu_idu_ex2_fwd_data1,
  iu_idu_ex2_fwd_preg0,
  iu_idu_ex2_fwd_preg1,
  iu_idu_ex2_fwd_vld0,
  iu_idu_ex2_fwd_vld1,
  iu_idu_ex2_inst_vld,
  iu_idu_ex2_rd_pair,
  iu_idu_id_stall,
  iu_lsu_ex2_wb0_grant,
  iu_rtu_ex1_cmplt,
  iu_rtu_ex1_cmplt_dp,
  iu_rtu_ex1_inst_len,
  iu_rtu_ex1_inst_vld,
  iu_rtu_ex1_ipop_int_mask,
  iu_rtu_ex1_ipush_mie_en,
  iu_rtu_ex1_ipush_spec_fail,
  iu_rtu_ex1_split_inst,
  iu_rtu_ex1_tail_int_vld,
  iu_rtu_wb0_data,
  iu_rtu_wb0_preg,
  iu_rtu_wb0_vld,
  iu_xx_no_op,
  lsu_iu_ex2_lsi_dst_preg,
  lsu_iu_ex2_lsi_rslt,
  lsu_iu_ex2_lsi_rslt_vld,
  lsu_rtu_ex1_cmplt_dp,
  mul_dp_ex1_cmplt,
  mul_dp_ex1_cmplt_dp,
  mul_dp_ex2_inst_vld,
  mul_dp_ex2_rslt0,
  mul_dp_ex2_rslt0_vld,
  pad_yy_icg_scan_en,
  rtu_iu_pending_spec_expt_vld,
  rtu_iu_pending_spec_halt_info_vld,
  rtu_yy_xx_flush
);

// &Ports; @24
input   [5 :0]  ag_dp_ex1_dst_preg;               
input   [31:0]  ag_dp_ex1_fwd_data;               
input           ag_dp_ex1_fwd_vld;                
input           alu_dp_ex1_cmplt;                 
input           alu_dp_ex1_cmplt_dp;              
input           alu_dp_ex1_fwd_vld;               
input   [31:0]  alu_dp_ex1_rslt;                  
input           bju_dp_ex1_cmplt_dp;              
input   [31:0]  bju_dp_ex1_rslt;                  
input           bju_dp_ex1_rslt_vld;              
input           bju_dp_ex1_stall;                 
input           bju_dp_no_op;                     
input           cp0_iu_icg_en;                    
input           cp0_yy_clk_en;                    
input           cpurst_b;                         
input           div_ctrl_itering;                 
input           div_dp_ex1_cmplt;                 
input           div_dp_ex1_cmplt_dp;              
input   [31:0]  div_dp_ex1_fwd_data;              
input           div_dp_ex1_fwd_vld;               
input           div_dp_ex1_stall;                 
input   [5 :0]  div_dp_ex2_dst_preg;              
input   [31:0]  div_dp_ex2_rslt;                  
input           div_dp_ex2_rslt_vld;              
input           forever_cpuclk;                   
input           fpu_iu_ex1_cmplt;                 
input           fpu_iu_ex1_cmplt_dp;              
input           idu_iu_ex1_alu_sel;               
input   [5 :0]  idu_iu_ex1_dst_preg;              
input           idu_iu_ex1_gateclk_vld;           
input           idu_iu_ex1_inst_len;              
input           idu_iu_ex1_inst_vld;              
input           idu_iu_ex1_ipop_int_mask;         
input           idu_iu_ex1_ipush_mie_en;          
input           idu_iu_ex1_ipush_spec_fail;       
input           idu_iu_ex1_mul_sel;               
input           idu_iu_ex1_rd_pair;               
input           idu_iu_ex1_split;                 
input           idu_iu_ex1_tail_int_vld;          
input           idu_iu_ex1_wb_vld;                
input           ifu_iu_warm_up;                   
input   [5 :0]  lsu_iu_ex2_lsi_dst_preg;          
input   [31:0]  lsu_iu_ex2_lsi_rslt;              
input           lsu_iu_ex2_lsi_rslt_vld;          
input           lsu_rtu_ex1_cmplt_dp;             
input           mul_dp_ex1_cmplt;                 
input           mul_dp_ex1_cmplt_dp;              
input           mul_dp_ex2_inst_vld;              
input   [31:0]  mul_dp_ex2_rslt0;                 
input           mul_dp_ex2_rslt0_vld;             
input           pad_yy_icg_scan_en;               
input           rtu_iu_pending_spec_expt_vld;     
input           rtu_iu_pending_spec_halt_info_vld; 
input           rtu_yy_xx_flush;                  
output          dp_xx_ex1_stall;                  
output          dp_xx_ex2_stall;                  
output          iu_ex2_div_grant;                 
output  [31:0]  iu_idu_ex1_fwd_data;              
output  [5 :0]  iu_idu_ex1_fwd_preg;              
output          iu_idu_ex1_fwd_vld;               
output          iu_idu_ex1_stall;                 
output          iu_idu_ex2_div_vld;               
output  [31:0]  iu_idu_ex2_fwd_data0;             
output  [31:0]  iu_idu_ex2_fwd_data1;             
output  [5 :0]  iu_idu_ex2_fwd_preg0;             
output  [5 :0]  iu_idu_ex2_fwd_preg1;             
output          iu_idu_ex2_fwd_vld0;              
output          iu_idu_ex2_fwd_vld1;              
output          iu_idu_ex2_inst_vld;              
output          iu_idu_ex2_rd_pair;               
output          iu_idu_id_stall;                  
output          iu_lsu_ex2_wb0_grant;             
output          iu_rtu_ex1_cmplt;                 
output          iu_rtu_ex1_cmplt_dp;              
output          iu_rtu_ex1_inst_len;              
output          iu_rtu_ex1_inst_vld;              
output          iu_rtu_ex1_ipop_int_mask;         
output          iu_rtu_ex1_ipush_mie_en;          
output          iu_rtu_ex1_ipush_spec_fail;       
output          iu_rtu_ex1_split_inst;            
output          iu_rtu_ex1_tail_int_vld;          
output  [31:0]  iu_rtu_wb0_data;                  
output  [5 :0]  iu_rtu_wb0_preg;                  
output          iu_rtu_wb0_vld;                   
output          iu_xx_no_op;                      

// &Regs; @25
reg     [31:0]  iu_ex1_fwd_data;                  
reg     [5 :0]  iu_ex1_fwd_preg;                  
reg             iu_ex1_fwd_vld;                   
reg     [5 :0]  iu_ex2_ex1_dst_preg;              
reg             iu_ex2_ex1_ov_flag;               
reg     [31:0]  iu_ex2_ex1_rslt;                  
reg             iu_ex2_ex1_rslt_vld;              
reg     [31:0]  iu_ex2_fwd_data0;                 
reg     [5 :0]  iu_ex2_fwd_preg;                  
reg             iu_ex2_rd_pair;                   

// &Wires; @26
wire    [5 :0]  ag_dp_ex1_dst_preg;               
wire    [31:0]  ag_dp_ex1_fwd_data;               
wire            ag_dp_ex1_fwd_vld;                
wire            alu_dp_ex1_borrow_vld;            
wire            alu_dp_ex1_cmplt;                 
wire            alu_dp_ex1_cmplt_dp;              
wire            alu_dp_ex1_fwd_vld;               
wire            alu_dp_ex1_ov_flag;               
wire    [31:0]  alu_dp_ex1_rslt;                  
wire            alu_dp_ex1_rslt_vld;              
wire    [31:0]  alu_dp_ex2_rslt0;                 
wire            alu_dp_ex2_rslt0_vld;             
wire    [31:0]  alu_dp_ex2_rslt1;                 
wire            alu_dp_ex2_rslt1_vld;             
wire            bju_dp_ex1_cmplt_dp;              
wire    [31:0]  bju_dp_ex1_rslt;                  
wire            bju_dp_ex1_rslt_vld;              
wire            bju_dp_ex1_stall;                 
wire            bju_dp_no_op;                     
wire            cp0_iu_icg_en;                    
wire            cp0_yy_clk_en;                    
wire            cpurst_b;                         
wire            div_ctrl_itering;                 
wire            div_dp_ex1_cmplt;                 
wire            div_dp_ex1_cmplt_dp;              
wire    [31:0]  div_dp_ex1_fwd_data;              
wire            div_dp_ex1_fwd_vld;               
wire            div_dp_ex1_stall;                 
wire    [5 :0]  div_dp_ex2_dst_preg;              
wire    [31:0]  div_dp_ex2_rslt;                  
wire            div_dp_ex2_rslt_vld;              
wire            dp_xx_ex1_stall;                  
wire            dp_xx_ex2_stall;                  
wire            forever_cpuclk;                   
wire            fpu_iu_ex1_cmplt;                 
wire            fpu_iu_ex1_cmplt_dp;              
wire            idu_iu_ex1_alu_sel;               
wire    [5 :0]  idu_iu_ex1_dst_preg;              
wire            idu_iu_ex1_gateclk_vld;           
wire            idu_iu_ex1_inst_len;              
wire            idu_iu_ex1_inst_vld;              
wire            idu_iu_ex1_ipop_int_mask;         
wire            idu_iu_ex1_ipush_mie_en;          
wire            idu_iu_ex1_ipush_spec_fail;       
wire            idu_iu_ex1_mul_sel;               
wire            idu_iu_ex1_rd_pair;               
wire            idu_iu_ex1_split;                 
wire            idu_iu_ex1_tail_int_vld;          
wire            idu_iu_ex1_wb_vld;                
wire            ifu_iu_warm_up;                   
wire            iu_ctrl_clk;                      
wire            iu_ctrl_clk_en;                   
wire            iu_ex1_fwd_dp_clk;                
wire            iu_ex1_fwd_dp_clk_en;             
wire    [4 :0]  iu_ex1_fwd_sel;                   
wire            iu_ex1_inst_pipe_down;            
wire            iu_ex1_no_op;                     
wire            iu_ex1_rslt_pipe_down;            
wire            iu_ex1_rslt_vld;                  
wire            iu_ex2_div_data_vld;              
wire            iu_ex2_div_grant;                 
wire    [31:0]  iu_ex2_fwd_data1;                 
wire            iu_ex2_fwd_vld0;                  
wire            iu_ex2_inst_vld;                  
wire            iu_ex2_lsu_data_vld;              
wire            iu_ex2_lsu_grant;                 
wire            iu_ex2_no_op;                     
wire    [4 :0]  iu_ex2_rslt_sel;                  
wire            iu_ex3_no_op;                     
wire    [31:0]  iu_idu_ex1_fwd_data;              
wire    [5 :0]  iu_idu_ex1_fwd_preg;              
wire            iu_idu_ex1_fwd_vld;               
wire            iu_idu_ex1_stall;                 
wire            iu_idu_ex2_div_vld;               
wire    [31:0]  iu_idu_ex2_fwd_data0;             
wire    [31:0]  iu_idu_ex2_fwd_data1;             
wire    [5 :0]  iu_idu_ex2_fwd_preg0;             
wire    [5 :0]  iu_idu_ex2_fwd_preg1;             
wire            iu_idu_ex2_fwd_vld0;              
wire            iu_idu_ex2_fwd_vld1;              
wire            iu_idu_ex2_inst_vld;              
wire            iu_idu_ex2_rd_pair;               
wire            iu_idu_id_stall;                  
wire            iu_lsu_ex2_wb0_grant;             
wire            iu_rtu_ex1_cmplt;                 
wire            iu_rtu_ex1_cmplt_dp;              
wire            iu_rtu_ex1_inst_len;              
wire            iu_rtu_ex1_inst_vld;              
wire            iu_rtu_ex1_ipop_int_mask;         
wire            iu_rtu_ex1_ipush_mie_en;          
wire            iu_rtu_ex1_ipush_spec_fail;       
wire            iu_rtu_ex1_split_inst;            
wire            iu_rtu_ex1_tail_int_vld;          
wire    [31:0]  iu_rtu_wb0_data;                  
wire    [5 :0]  iu_rtu_wb0_preg;                  
wire            iu_rtu_wb0_vld;                   
wire            iu_xx_no_op;                      
wire    [5 :0]  lsu_iu_ex2_lsi_dst_preg;          
wire    [31:0]  lsu_iu_ex2_lsi_rslt;              
wire            lsu_iu_ex2_lsi_rslt_vld;          
wire            lsu_rtu_ex1_cmplt_dp;             
wire            mul_dp_ex1_cmplt;                 
wire            mul_dp_ex1_cmplt_dp;              
wire            mul_dp_ex2_inst_vld;              
wire    [31:0]  mul_dp_ex2_rslt0;                 
wire            mul_dp_ex2_rslt0_vld;             
wire    [31:0]  mul_dp_ex2_rslt1;                 
wire            mul_dp_ex2_rslt1_vld;             
wire            pad_yy_icg_scan_en;               
wire            rtu_iu_pending_spec_expt_vld;     
wire            rtu_iu_pending_spec_halt_info_vld; 
wire            rtu_yy_xx_flush;                  


// &Force("output","iu_rtu_wb0_vld"); @28
// &Force("output","iu_rtu_wb0_preg"); @29
// &Force("output","iu_idu_ex2_fwd_vld0"); @30
// &Force("output","iu_idu_ex2_fwd_data0"); @31
// &Force("output","iu_idu_ex2_fwd_preg0"); @32
// &Force("output","iu_ex2_div_grant"); @33
// &Force("output","iu_idu_ex2_fwd_vld1"); @34
// &Force("noport", "iu_ex2_ex1_ov_flag"); @35
//=======================================================================
//                           Fwd Datapath
//=======================================================================

assign alu_dp_ex1_borrow_vld    = 1'b0;
assign alu_dp_ex1_ov_flag       = 1'b0;
assign alu_dp_ex1_rslt_vld      = idu_iu_ex1_inst_vld & 
                                  idu_iu_ex1_alu_sel  & 
                                  idu_iu_ex1_wb_vld;
assign alu_dp_ex2_rslt0_vld     = 1'b0;
assign alu_dp_ex2_rslt1_vld     = 1'b0;
assign alu_dp_ex2_rslt0[31:0]   = 32'b0;
assign alu_dp_ex2_rslt1[31:0]   = 32'b0;

assign mul_dp_ex2_rslt1_vld     = 1'b0;
assign mul_dp_ex2_rslt1[31:0]   = 32'b0;
//--------- EX1 Result Mux -------------
//Ex1 fwd data srcs: lsu/alu/bju/div
//mul fwd preg for idu without data
assign iu_ex1_fwd_sel[4:0] = {lsu_rtu_ex1_cmplt_dp, 
                              alu_dp_ex1_cmplt_dp , 
                              bju_dp_ex1_cmplt_dp ,
                              mul_dp_ex1_cmplt_dp ,
                              div_dp_ex1_cmplt_dp };

assign iu_ex1_rslt_vld    = (bju_dp_ex1_rslt_vld | alu_dp_ex1_rslt_vld) & 
                            (~(rtu_iu_pending_spec_expt_vld | rtu_iu_pending_spec_halt_info_vld));
// &CombBeg @71
always @( ag_dp_ex1_fwd_data[31:0]
       or div_dp_ex1_fwd_data[31:0]
       or bju_dp_ex1_rslt_vld
       or ag_dp_ex1_fwd_vld
       or alu_dp_ex1_fwd_vld
       or iu_ex1_fwd_sel[4:0]
       or ag_dp_ex1_dst_preg[5:0]
       or bju_dp_ex1_rslt[31:0]
       or alu_dp_ex1_rslt[31:0]
       or div_dp_ex1_fwd_vld
       or idu_iu_ex1_dst_preg[5:0])
begin
  case (iu_ex1_fwd_sel[4:0])
    5'b00001:   // From DIV
    begin
      iu_ex1_fwd_vld         = div_dp_ex1_fwd_vld;
      iu_ex1_fwd_preg[5:0]   = idu_iu_ex1_dst_preg[5:0];
      iu_ex1_fwd_data[31:0]  = div_dp_ex1_fwd_data[31:0];
    end
    5'b00010:   // From MUL
    begin
      iu_ex1_fwd_vld         = 1'b0;
      iu_ex1_fwd_preg[5:0]   = idu_iu_ex1_dst_preg[5:0];   
      iu_ex1_fwd_data[31:0]  = alu_dp_ex1_rslt[31:0];
    end
    5'b00100:   // From BJU
    begin
      iu_ex1_fwd_vld         = bju_dp_ex1_rslt_vld;
      iu_ex1_fwd_preg[5:0]   = idu_iu_ex1_dst_preg[5:0];
      iu_ex1_fwd_data[31:0]  = bju_dp_ex1_rslt[31:0];
    end
    5'b01000:   // From ALU
    begin
      iu_ex1_fwd_vld         = alu_dp_ex1_fwd_vld;
      iu_ex1_fwd_preg[5:0]   = idu_iu_ex1_dst_preg[5:0];
      iu_ex1_fwd_data[31:0]  = alu_dp_ex1_rslt[31:0];
    end
    5'b10000:   // From LSU
    begin
      iu_ex1_fwd_vld         = ag_dp_ex1_fwd_vld;
      iu_ex1_fwd_preg[5:0]   = ag_dp_ex1_dst_preg[5:0];
      iu_ex1_fwd_data[31:0]  = ag_dp_ex1_fwd_data[31:0];
    end
    default:
    begin
      iu_ex1_fwd_vld         = 1'b0;
      iu_ex1_fwd_preg[5:0]   = {6{1'bx}};
      iu_ex1_fwd_data[31:0]  = {32{1'bx}};
    end
  endcase
// &CombEnd @110
end

//--------- EX2 Result Mux -------------
//priority: iu > lsu_lsi > div, no grant with ex3 stall
//warning: ex3 wb mul should be considered
assign iu_ex2_inst_vld     = alu_dp_ex2_rslt0_vld | 
                             mul_dp_ex2_inst_vld  | 
                             iu_ex2_ex1_rslt_vld;

assign iu_ex2_div_grant    = (~iu_ex2_inst_vld) & 
                             (~lsu_iu_ex2_lsi_rslt_vld);

assign iu_ex2_lsu_grant    = (~iu_ex2_inst_vld);
                             
assign iu_ex2_div_data_vld = div_dp_ex2_rslt_vld & 
                             iu_ex2_div_grant;

assign iu_ex2_lsu_data_vld = lsu_iu_ex2_lsi_rslt_vld & 
                             iu_ex2_lsu_grant;
//Ex2 fwd data src: ex1 pipe rslt/div/mul/alu
//limit: mul/alu must fwd wb1 with wb0 fwd vld
assign iu_ex2_rslt_sel[4:0] = {iu_ex2_lsu_data_vld , 
                              mul_dp_ex2_rslt0_vld,
                              alu_dp_ex2_rslt0_vld, 
                              iu_ex2_ex1_rslt_vld , 
                              iu_ex2_div_data_vld };
assign iu_ex2_fwd_vld0      = |iu_ex2_rslt_sel[4:0];                      
// &CombBeg @137
always @( lsu_iu_ex2_lsi_dst_preg[5:0]
       or div_dp_ex2_dst_preg[5:0]
       or iu_ex2_rslt_sel[4:0]
       or iu_ex2_ex1_dst_preg[5:0]
       or lsu_iu_ex2_lsi_rslt[31:0]
       or iu_ex2_ex1_rslt[31:0]
       or alu_dp_ex2_rslt0[31:0]
       or div_dp_ex2_rslt[31:0]
       or mul_dp_ex2_rslt0[31:0])
begin
  case(iu_ex2_rslt_sel[4:0])
    5'b00001:   // From DIV
    begin
      iu_ex2_fwd_data0[31:0] = div_dp_ex2_rslt[31:0];
      iu_ex2_fwd_preg[5:0]   = div_dp_ex2_dst_preg[5:0];
    end
    5'b00010:   // From Ex1
    begin
      iu_ex2_fwd_data0[31:0] = iu_ex2_ex1_rslt[31:0];
      iu_ex2_fwd_preg[5:0]   = iu_ex2_ex1_dst_preg[5:0];
    end
    5'b00100:   // From ALU
    begin
      iu_ex2_fwd_data0[31:0] = alu_dp_ex2_rslt0[31:0];
      iu_ex2_fwd_preg[5:0]   = iu_ex2_ex1_dst_preg[5:0];
    end
    5'b01000:   // From MUL
    begin
      iu_ex2_fwd_data0[31:0] = mul_dp_ex2_rslt0[31:0];
      iu_ex2_fwd_preg[5:0]   = iu_ex2_ex1_dst_preg[5:0];
    end
    5'b10000:   // From LSU
    begin
      iu_ex2_fwd_data0[31:0] = lsu_iu_ex2_lsi_rslt[31:0];
      iu_ex2_fwd_preg[5:0]   = lsu_iu_ex2_lsi_dst_preg[5:0];
    end
    default:
    begin
      iu_ex2_fwd_data0[31:0] = {32{1'bx}};
      iu_ex2_fwd_preg[5:0]   = iu_ex2_ex1_dst_preg[5:0];
    end
  endcase
// &CombEnd @170
end

assign iu_ex2_fwd_data1[31:0] = {32{mul_dp_ex2_rslt1_vld}} & mul_dp_ex2_rslt1[31:0] |
                                {32{alu_dp_ex2_rslt1_vld}} & alu_dp_ex2_rslt1[31:0];
//--------- EX3 Result Mux -------------
//Ex2 fwd src: ex2-ex3/mul
// &CombBeg @181
// &CombEnd @196
//=======================================================================
//                           Pipeline
//=======================================================================
//--------- Ex1-Ex2 Pipe reg -------------
// &Instance("gated_clk_cell", "x_iu_ex1_fwd_dp_clk"); @206
gated_clk_cell  x_iu_ex1_fwd_dp_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (iu_ex1_fwd_dp_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (iu_ex1_fwd_dp_clk_en),
  .module_en            (cp0_iu_icg_en       ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in      (forever_cpuclk), @207
//          .external_en (1'b0), @208
//          .global_en   (cp0_yy_clk_en), @209
//          .module_en   (cp0_iu_icg_en), @210
//          .local_en    (iu_ex1_fwd_dp_clk_en), @211
//          .clk_out     (iu_ex1_fwd_dp_clk)); @212

//pipe register shared by result and preg pipe
assign iu_ex1_rslt_pipe_down = iu_ex1_rslt_vld | alu_dp_ex1_borrow_vld;

assign iu_ex1_inst_pipe_down = idu_iu_ex1_inst_vld &
                               (idu_iu_ex1_mul_sel | 
                                idu_iu_ex1_alu_sel);
assign iu_ex1_fwd_dp_clk_en = iu_ex1_rslt_pipe_down | iu_ex1_inst_pipe_down
                              | ifu_iu_warm_up;

always@(posedge iu_ex1_fwd_dp_clk)
begin
  if( iu_ex1_rslt_pipe_down | iu_ex1_inst_pipe_down | ifu_iu_warm_up)
  begin
    iu_ex2_ex1_dst_preg[5:0] <= iu_ex1_fwd_preg[5:0];
    iu_ex2_rd_pair           <= idu_iu_ex1_rd_pair;
  end 
  else
  begin
    iu_ex2_ex1_dst_preg[5:0] <= iu_ex2_ex1_dst_preg[5:0];
    iu_ex2_rd_pair           <= iu_ex2_rd_pair;
  end
end


always@(posedge iu_ex1_fwd_dp_clk)
begin
  if( iu_ex1_rslt_pipe_down | ifu_iu_warm_up)
  begin
    iu_ex2_ex1_rslt[31:0]    <= iu_ex1_fwd_data[31:0];
    iu_ex2_ex1_ov_flag       <= alu_dp_ex1_ov_flag;
  end 
  else
  begin
    iu_ex2_ex1_rslt[31:0]    <= iu_ex2_ex1_rslt[31:0];
    iu_ex2_ex1_ov_flag       <= iu_ex2_ex1_ov_flag;
  end
end

//--------- Ex2-Ex3 Pipe reg -------------
// &Instance("gated_clk_cell", "x_iu_ex2_fwd0_dp_clk"); @301
// &Connect(.clk_in      (forever_cpuclk), @302
//          .external_en (1'b0), @303
//          .global_en   (cp0_yy_clk_en), @304
//          .module_en   (cp0_iu_icg_en), @305
//          .local_en    (iu_ex2_fwd0_dp_clk_en), @306
//          .clk_out     (iu_ex2_fwd0_dp_clk)); @307
// &Instance("gated_clk_cell", "x_iu_ex2_fwd1_dp_clk"); @380
// &Connect(.clk_in      (forever_cpuclk), @381
//          .external_en (1'b0), @382
//          .global_en   (cp0_yy_clk_en), @383
//          .module_en   (cp0_iu_icg_en), @384
//          .local_en    (iu_ex2_fwd1_dp_clk_en), @385
//          .clk_out     (iu_ex2_fwd1_dp_clk)); @386

// &Instance("gated_clk_cell", "x_iu_wb_ov_dp_clk"); @425
// &Connect(.clk_in      (forever_cpuclk), @426
//          .external_en (1'b0), @427
//          .global_en   (cp0_yy_clk_en), @428
//          .module_en   (cp0_iu_icg_en), @429
//          .local_en    (iu_wb_ov_dp_clk_en), @430
//          .clk_out     (iu_wb_ov_dp_clk)); @431
//----------------------------------------------------------
//                       Ctrl Signal
//----------------------------------------------------------
assign iu_ctrl_clk_en = idu_iu_ex1_gateclk_vld | 
                        iu_idu_ex2_fwd_vld0    |
                        iu_ex2_ex1_rslt_vld    |
                        rtu_yy_xx_flush;

// &Instance("gated_clk_cell", "x_iu_ctrl_clk"); @494
gated_clk_cell  x_iu_ctrl_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (iu_ctrl_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (iu_ctrl_clk_en    ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @495
//          .external_en (1'b0), @496
//          .global_en   (cp0_yy_clk_en), @497
//          .module_en   (cp0_iu_icg_en), @498
//          .local_en    (iu_ctrl_clk_en), @499
//          .clk_out     (iu_ctrl_clk)); @500


always@(posedge iu_ctrl_clk or negedge cpurst_b)
begin
  if (~cpurst_b)
  begin
    iu_ex2_ex1_rslt_vld <= 1'b0;
  end
  else if (rtu_yy_xx_flush)
  begin
    iu_ex2_ex1_rslt_vld <= 1'b0;
  end
  else if (iu_ex1_rslt_vld)
  begin
    iu_ex2_ex1_rslt_vld <= 1'b1;
  end
  else
  begin
    iu_ex2_ex1_rslt_vld <= 1'b0;
  end
end


//==========================================================
//                  Signal for RTU
//==========================================================
//--------- cmplt---- -------------
assign iu_rtu_ex1_cmplt     = alu_dp_ex1_cmplt | mul_dp_ex1_cmplt | 
                              div_dp_ex1_cmplt | fpu_iu_ex1_cmplt; 
assign iu_rtu_ex1_cmplt_dp  = alu_dp_ex1_cmplt_dp  | mul_dp_ex1_cmplt_dp | 
                              div_dp_ex1_cmplt_dp  | fpu_iu_ex1_cmplt_dp; 

assign iu_rtu_ex1_split_inst       = idu_iu_ex1_split;
assign iu_rtu_ex1_ipop_int_mask    = idu_iu_ex1_ipop_int_mask & alu_dp_ex1_cmplt_dp;
assign iu_rtu_ex1_ipush_mie_en     = idu_iu_ex1_ipush_mie_en  & alu_dp_ex1_cmplt_dp & 
                                     (~(rtu_iu_pending_spec_expt_vld | rtu_iu_pending_spec_halt_info_vld));
assign iu_rtu_ex1_tail_int_vld     = idu_iu_ex1_tail_int_vld  & alu_dp_ex1_cmplt_dp;
assign iu_rtu_ex1_ipush_spec_fail  = idu_iu_ex1_ipush_spec_fail & alu_dp_ex1_cmplt_dp;
assign iu_rtu_ex1_inst_len         = idu_iu_ex1_inst_len;
assign iu_rtu_ex1_inst_vld         = idu_iu_ex1_gateclk_vld;
//--------- Wb Result -------------
assign iu_rtu_wb0_vld        = iu_idu_ex2_fwd_vld0;
assign iu_rtu_wb0_preg[5:0]  = iu_idu_ex2_fwd_preg0[5:0];
assign iu_rtu_wb0_data[31:0] = iu_idu_ex2_fwd_data0[31:0];

//==========================================================
//                  Signal for IDU
//==========================================================
assign iu_ex1_no_op = ~idu_iu_ex1_inst_vld;
assign iu_ex2_no_op = ~(iu_ex2_fwd_vld0 | mul_dp_ex2_inst_vld);
assign iu_ex3_no_op = 1'b1;

assign iu_xx_no_op =  iu_ex1_no_op & 
                      iu_ex2_no_op & 
                      iu_ex3_no_op &
                      bju_dp_no_op &
                     (~div_ctrl_itering);

assign iu_idu_ex1_stall           =  div_dp_ex1_stall  | bju_dp_ex1_stall  ; 

assign iu_idu_id_stall            = 1'b0;                                  
assign iu_idu_ex1_fwd_vld         = iu_ex1_fwd_vld; 
assign iu_idu_ex1_fwd_data[31:0]  = iu_ex1_fwd_data[31:0]; 
assign iu_idu_ex1_fwd_preg[5:0]   = iu_ex1_fwd_preg[5:0]; 

assign iu_idu_ex2_inst_vld        = iu_ex2_inst_vld;
assign iu_idu_ex2_rd_pair         = iu_ex2_rd_pair;
assign iu_idu_ex2_div_vld         = iu_ex2_div_data_vld;
assign iu_idu_ex2_fwd_vld0        = iu_ex2_fwd_vld0; 
assign iu_idu_ex2_fwd_data0[31:0] = iu_ex2_fwd_data0[31:0]; 
assign iu_idu_ex2_fwd_preg0[5:0]  = iu_ex2_fwd_preg[5:0]; 
assign iu_idu_ex2_fwd_vld1        = mul_dp_ex2_rslt1_vld | alu_dp_ex2_rslt1_vld; 
assign iu_idu_ex2_fwd_data1[31:0] = iu_ex2_fwd_data1[31:0]; 

assign iu_idu_ex2_fwd_preg1[5:0]  = 6'b0;
//==========================================================
//                  signals for cp0 
//==========================================================

//assign iu_cp0_wb_fflags_updt = iu_wb_fflags_updt;
//assign iu_cp0_wb_fflags[4:0] = iu_wb_fflags[4:0];
//==========================================================
//                  IU internal signals 
//==========================================================
assign dp_xx_ex2_stall      = 1'b0; 
assign dp_xx_ex1_stall      = 1'b0;

// &Force("nonport","dp_alu_ex2_rslt"); @707
//==========================================================
//                  signals for LSU 
//==========================================================
assign iu_lsu_ex2_wb0_grant  = lsu_iu_ex2_lsi_rslt_vld & iu_ex2_lsu_grant;

// &Force("input", "idu_iu_ex1_bju_gateclk_sel"); @718
// &Force("input", "idu_iu_ex1_div_sel"); @719
// &Force("nonport", "rtu_flush_ff"); @720
// &ModuleEnd; @885
endmodule


