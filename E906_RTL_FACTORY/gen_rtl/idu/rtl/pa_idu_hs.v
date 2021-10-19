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

// &Depend("pa_idu_cfig.h"); @23
// &ModuleBeg; @24
module pa_idu_hs(
  cp0_idu_icg_en,
  cp0_idu_spec_push_en,
  cp0_idu_swap_sp_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_hs_be_idle,
  ctrl_hs_bkpt_vld,
  ctrl_hs_no_op,
  ctrl_hs_stall,
  decd_hs_ipop_vld,
  decd_hs_ipush_vld,
  forever_cpuclk,
  gpr_hs_sp_busy,
  gpr_hs_sp_busy2,
  gpr_hs_sp_wb,
  hd_dp_rs2_sel,
  hs_ctrl_cancel,
  hs_ctrl_inst_vld,
  hs_ctrl_stall,
  hs_decd_dp_vld,
  hs_decd_dst_vld,
  hs_decd_func,
  hs_decd_imm,
  hs_decd_imm_vld,
  hs_decd_rd,
  hs_decd_rs1,
  hs_decd_rs1_vld,
  hs_decd_rs2,
  hs_decd_rs2_imm_vld,
  hs_decd_rs2_vld,
  hs_decd_sel,
  hs_decd_split,
  hs_dp_ipop_int_mask,
  hs_dp_ipop_tail,
  hs_dp_ipop_tail_gate,
  hs_dp_ipush_spec_fail,
  hs_dp_mie_en,
  hs_dp_rs2_mcause,
  hs_dp_rs2_mepc,
  hs_dp_sp_wb_pending,
  hs_fdecd_dp_vld,
  hs_gpr_wb_mask,
  hs_gpr_wr_mask,
  idu_cp0_ex1_tail_fail,
  idu_cp0_id_tail_vld,
  idu_cp0_sp_swap_pending,
  idu_cp0_sp_swap_req,
  idu_cp0_sp_swap_req_gate,
  idu_iu_tail_fail,
  idu_iu_tail_fail_gate,
  idu_lsu_ex1_ipush_spec,
  idu_yy_xx_tail_ack,
  ifu_idu_id_inst_vld,
  iu_yy_xx_cancel,
  pad_yy_icg_scan_en,
  rtu_idu_ex2_ipush_spec_inst_expt_vld,
  rtu_idu_ex2_ipush_spec_inst_halt_info_vld,
  rtu_idu_flush_fe,
  rtu_idu_id_tail_int_vld,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vld,
  rtu_yy_xx_flush
);

// &Ports; @25
input           cp0_idu_icg_en;                           
input           cp0_idu_spec_push_en;                     
input           cp0_idu_swap_sp_en;                       
input           cp0_yy_clk_en;                            
input           cpurst_b;                                 
input           ctrl_hs_be_idle;                          
input           ctrl_hs_bkpt_vld;                         
input           ctrl_hs_no_op;                            
input           ctrl_hs_stall;                            
input           decd_hs_ipop_vld;                         
input           decd_hs_ipush_vld;                        
input           forever_cpuclk;                           
input           gpr_hs_sp_busy;                           
input           gpr_hs_sp_busy2;                          
input           gpr_hs_sp_wb;                             
input           ifu_idu_id_inst_vld;                      
input           iu_yy_xx_cancel;                          
input           pad_yy_icg_scan_en;                       
input           rtu_idu_ex2_ipush_spec_inst_expt_vld;     
input           rtu_idu_ex2_ipush_spec_inst_halt_info_vld; 
input           rtu_idu_flush_fe;                         
input           rtu_idu_id_tail_int_vld;                  
input           rtu_yy_xx_expt_int;                       
input           rtu_yy_xx_expt_vld;                       
input           rtu_yy_xx_flush;                          
output          hd_dp_rs2_sel;                            
output          hs_ctrl_cancel;                           
output          hs_ctrl_inst_vld;                         
output          hs_ctrl_stall;                            
output          hs_decd_dp_vld;                           
output          hs_decd_dst_vld;                          
output  [19:0]  hs_decd_func;                             
output  [31:0]  hs_decd_imm;                              
output          hs_decd_imm_vld;                          
output  [5 :0]  hs_decd_rd;                               
output  [5 :0]  hs_decd_rs1;                              
output          hs_decd_rs1_vld;                          
output  [5 :0]  hs_decd_rs2;                              
output          hs_decd_rs2_imm_vld;                      
output          hs_decd_rs2_vld;                          
output  [5 :0]  hs_decd_sel;                              
output          hs_decd_split;                            
output          hs_dp_ipop_int_mask;                      
output          hs_dp_ipop_tail;                          
output          hs_dp_ipop_tail_gate;                     
output          hs_dp_ipush_spec_fail;                    
output          hs_dp_mie_en;                             
output          hs_dp_rs2_mcause;                         
output          hs_dp_rs2_mepc;                           
output          hs_dp_sp_wb_pending;                      
output          hs_fdecd_dp_vld;                          
output          hs_gpr_wb_mask;                           
output          hs_gpr_wr_mask;                           
output          idu_cp0_ex1_tail_fail;                    
output          idu_cp0_id_tail_vld;                      
output          idu_cp0_sp_swap_pending;                  
output          idu_cp0_sp_swap_req;                      
output          idu_cp0_sp_swap_req_gate;                 
output          idu_iu_tail_fail;                         
output          idu_iu_tail_fail_gate;                    
output          idu_lsu_ex1_ipush_spec;                   
output          idu_yy_xx_tail_ack;                       

// &Regs; @26
reg     [2 :0]  ipop_cur_st;                              
reg     [2 :0]  ipop_nxt_st;                              
reg             ipop_split_ag_imm_vld;                    
reg             ipop_split_dst_vld;                       
reg     [19:0]  ipop_split_func;                          
reg     [31:0]  ipop_split_imm;                           
reg     [5 :0]  ipop_split_sel;                           
reg     [2 :0]  ipush_cur_st;                             
reg     [2 :0]  ipush_nxt_st;                             
reg             ipush_spec_flag;                          
reg             ipush_split_ag_imm_vld;                   
reg             ipush_split_dst_vld;                      
reg     [19:0]  ipush_split_func;                         
reg     [31:0]  ipush_split_imm_pos;                      
reg     [5 :0]  ipush_split_sel;                          
reg     [1 :0]  sp_wb_nxt;                                
reg     [1 :0]  sp_wb_st;                                 
reg     [3 :0]  stack_cnt;                                

// &Wires; @27
wire            cnt_inc_vld;                              
wire            cp0_idu_icg_en;                           
wire            cp0_idu_spec_push_en;                     
wire            cp0_idu_swap_sp_en;                       
wire            cp0_yy_clk_en;                            
wire            cpurst_b;                                 
wire            ctrl_hs_be_idle;                          
wire            ctrl_hs_bkpt_vld;                         
wire            ctrl_hs_no_op;                            
wire            ctrl_hs_stall;                            
wire            decd_hs_ipop_vld;                         
wire            decd_hs_ipush_vld;                        
wire            forever_cpuclk;                           
wire            gpr_hs_sp_busy;                           
wire            gpr_hs_sp_busy2;                          
wire            gpr_hs_sp_wb;                             
wire            hd_dp_rs2_sel;                            
wire            hs_cpuclk;                                
wire            hs_ctrl_cancel;                           
wire            hs_ctrl_inst_vld;                         
wire            hs_ctrl_stall;                            
wire            hs_decd_dp_vld;                           
wire            hs_decd_dst_vld;                          
wire    [19:0]  hs_decd_func;                             
wire    [31:0]  hs_decd_imm;                              
wire            hs_decd_imm_vld;                          
wire    [5 :0]  hs_decd_rd;                               
wire    [5 :0]  hs_decd_rs1;                              
wire            hs_decd_rs1_vld;                          
wire    [5 :0]  hs_decd_rs2;                              
wire            hs_decd_rs2_imm_vld;                      
wire            hs_decd_rs2_vld;                          
wire    [5 :0]  hs_decd_sel;                              
wire            hs_decd_split;                            
wire            hs_dp_ipop_int_mask;                      
wire            hs_dp_ipop_tail;                          
wire            hs_dp_ipop_tail_gate;                     
wire            hs_dp_ipush_spec_fail;                    
wire            hs_dp_mie_en;                             
wire            hs_dp_rs2_mcause;                         
wire            hs_dp_rs2_mepc;                           
wire            hs_dp_sp_wb_pending;                      
wire            hs_fdecd_dp_vld;                          
wire            hs_flush;                                 
wire            hs_gpr_wb_mask;                           
wire            hs_gpr_wr_mask;                           
wire            hs_icg_en;                                
wire            hs_id_inst_vld;                           
wire            hs_id_ipush_vld;                          
wire            hs_ipush_flush;                           
wire            idu_cp0_ex1_tail_fail;                    
wire            idu_cp0_id_tail_vld;                      
wire            idu_cp0_sp_swap_pending;                  
wire            idu_cp0_sp_swap_req;                      
wire            idu_cp0_sp_swap_req_gate;                 
wire            idu_iu_tail_fail;                         
wire            idu_iu_tail_fail_gate;                    
wire            idu_lsu_ex1_ipush_spec;                   
wire            idu_yy_xx_tail_ack;                       
wire            ifu_idu_id_inst_vld;                      
wire            ipop_addsp_st;                            
wire            ipop_idle_st;                             
wire            ipop_ldepc_st;                            
wire    [31:0]  ipop_ldgpr_imm;                           
wire            ipop_ldgpr_st;                            
wire            ipop_ldmce_st;                            
wire            ipop_req_vld;                             
wire            ipop_rs2_imm_vld;                         
wire            ipop_rte_st;                              
wire            ipop_split_first;                         
wire            ipop_split_inst_vld;                      
wire            ipop_split_last;                          
wire    [5 :0]  ipop_split_ld_rd;                         
wire    [5 :0]  ipop_split_rd;                            
wire    [5 :0]  ipop_split_rs1;                           
wire            ipop_split_rs1_vld;                       
wire            ipop_split_stall;                         
wire            ipop_stall_relax;                         
wire            ipop_tail_fail;                           
wire            ipop_tail_hs;                             
wire            ipop_tail_st;                             
wire            ipop_tail_vld;                            
wire            ipush_check_fail;                         
wire            ipush_check_pass;                         
wire            ipush_check_ready;                        
wire            ipush_idle_st;                            
wire            ipush_inst_vld;                           
wire            ipush_mcause_rs2_vld;                     
wire            ipush_mepc_rs2_vld;                       
wire            ipush_req_vld;                            
wire            ipush_rs2_imm_vld;                        
wire            ipush_sexpt_st;                           
wire            ipush_spec_clr;                           
wire            ipush_spec_expt;                          
wire            ipush_spec_vld;                           
wire    [31:0]  ipush_split_imm;                          
wire            ipush_split_inst_vld;                     
wire            ipush_split_last;                         
wire    [5 :0]  ipush_split_rd;                           
wire    [5 :0]  ipush_split_rs1;                          
wire            ipush_split_rs1_vld;                      
wire    [5 :0]  ipush_split_rs2;                          
wire            ipush_split_rs2_vld;                      
wire            ipush_split_stall;                        
wire            ipush_stall_relax;                        
wire            ipush_stepc_st;                           
wire    [31:0]  ipush_stgpr_imm;                          
wire            ipush_stgpr_st;                           
wire            ipush_stmce_st;                           
wire            ipush_subsp_inst_vld;                     
wire            ipush_subsp_st;                           
wire            iu_yy_xx_cancel;                          
wire            pad_yy_icg_scan_en;                       
wire            rtu_idu_ex2_ipush_spec_inst_expt_vld;     
wire            rtu_idu_ex2_ipush_spec_inst_halt_info_vld; 
wire            rtu_idu_flush_fe;                         
wire            rtu_idu_id_tail_int_vld;                  
wire            rtu_yy_xx_expt_int;                       
wire            rtu_yy_xx_expt_vld;                       
wire            rtu_yy_xx_flush;                          
wire            sp_cur_wb1;                               
wire            sp_wb_pending;                            
wire            stack_cnt_done;                           
wire            stack_cnt_gpra;                           
wire            stack_cnt_gprb;                           
wire            stack_cnt_gprc;                           
wire            stack_cnt_gprd;                           


//==========================================================
// Hardware Stack Module
// 1. Instance ICG cell
// 2. IPUSH FSM
// 3. IPUSH Spec Flag
// 4. HS Speed Up En
// 5. Stack Counter
// 6. IPOP FSM
// 7. Split Inst Generate
//==========================================================

//------------------------------------------------
// 1. Instance ICG cell
//------------------------------------------------
assign hs_icg_en = ipush_req_vld | ~ipush_idle_st
                | ipop_req_vld  | ~ipop_idle_st
                | sp_wb_pending
                | rtu_yy_xx_expt_int
                | ipush_spec_flag
                ;

// &Instance("gated_clk_cell", "x_idu_hs_icg_cell"); @50
gated_clk_cell  x_idu_hs_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (hs_cpuclk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (hs_icg_en         ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @51
//          .external_en (1'b0), @52
//          .global_en   (cp0_yy_clk_en), @53
//          .module_en ( cp0_idu_icg_en ) , @54
//          .local_en    (hs_icg_en), @55
//          .clk_out     (hs_cpuclk) @56
//         ); @57

//------------------------------------------------
// 2. IPUSH FSM
// a. IPUSH_IDLE: IPUSH IDLE State
// b. `FUNC_SW_MCAUSE:  Store MCAUSE Reg to Stack
// c. `FUNC_SW_GPR:     Store GPR to Stack
// d. `FUNC_ADD_SP:     Add Stack Pointer
//------------------------------------------------

parameter IPUSH_IDLE = 3'b000;
parameter ST_MEPC    = 3'b001;
parameter ST_MCAUSE  = 3'b010;
parameter ST_GPR     = 3'b011;
parameter SPEC_EXPT  = 3'b100;
parameter SUB_SP     = 3'b111;

always@(posedge hs_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ipush_cur_st[2:0] <= IPUSH_IDLE;
  else if(hs_ipush_flush)
    ipush_cur_st[2:0] <= IPUSH_IDLE;
  else if(ipush_spec_expt)
    ipush_cur_st[2:0] <= SPEC_EXPT;
  else if(~ctrl_hs_stall | rtu_yy_xx_expt_int)
    ipush_cur_st[2:0] <= ipush_nxt_st[2:0];
end

assign hs_id_inst_vld = ifu_idu_id_inst_vld & ~(rtu_idu_flush_fe | rtu_yy_xx_expt_vld);
assign hs_id_ipush_vld = decd_hs_ipush_vld & ~ctrl_hs_bkpt_vld;
assign ipush_inst_vld = rtu_yy_xx_expt_int & cp0_idu_spec_push_en & (ipop_idle_st | rtu_yy_xx_expt_vld)
                     | hs_id_inst_vld & hs_id_ipush_vld & ipop_idle_st; 
assign ipush_req_vld  = ipush_inst_vld;

assign ipush_check_ready = hs_id_inst_vld;
assign ipush_check_pass  = hs_id_inst_vld &  hs_id_ipush_vld 
                        & (ipush_stgpr_st | ipush_subsp_st);
assign ipush_check_fail  = (hs_id_inst_vld & ~hs_id_ipush_vld) 
                        & ipush_spec_flag
                        & (ipush_stgpr_st | ipush_subsp_st);

assign ipush_spec_expt = (rtu_idu_ex2_ipush_spec_inst_expt_vld
                        | rtu_idu_ex2_ipush_spec_inst_halt_info_vld)
                       & !ipush_idle_st; // & !ipush_subsp_st;

assign hs_ipush_flush = rtu_idu_flush_fe & ~ipush_spec_flag | iu_yy_xx_cancel & !ipush_spec_vld | rtu_yy_xx_flush;
assign hs_flush       = hs_ipush_flush | rtu_yy_xx_expt_vld;

// &CombBeg; @106
always @( ctrl_hs_no_op
       or ipush_check_fail
       or ipush_check_ready
       or ipush_inst_vld
       or ipush_spec_flag
       or ipush_cur_st[2:0]
       or stack_cnt_done)
begin
case(ipush_cur_st[2:0])
  IPUSH_IDLE:
  begin
    if(ipush_inst_vld)
      ipush_nxt_st[2:0] = ST_MEPC;
    else
      ipush_nxt_st[2:0] = IPUSH_IDLE;
  end
  ST_MEPC:
  begin
    if(ctrl_hs_no_op)
      ipush_nxt_st[2:0] = ST_MCAUSE;
    else
      ipush_nxt_st[2:0] = ST_MEPC;
  end
  ST_MCAUSE:
  begin
    ipush_nxt_st[2:0] = ST_GPR;
  end
  ST_GPR:
  begin
    if(ipush_check_fail)
      ipush_nxt_st[2:0] = IPUSH_IDLE;
    else if(stack_cnt_done)
      ipush_nxt_st[2:0] = SUB_SP;
    else
      ipush_nxt_st[2:0] = ST_GPR;
  end
  SUB_SP:
  begin
    if(ipush_spec_flag)
      if(ipush_check_ready)
        ipush_nxt_st[2:0] = IPUSH_IDLE;
      else
        ipush_nxt_st[2:0] = SUB_SP;
    else
      ipush_nxt_st[2:0] = IPUSH_IDLE;
  end
  SPEC_EXPT:
  begin
    ipush_nxt_st[2:0] = IPUSH_IDLE;
  end
  default:
  begin
    ipush_nxt_st[2:0] = IPUSH_IDLE;
  end
endcase
// &CombEnd; @154
end

// ipush fsm state infor
assign ipush_idle_st  = ipush_cur_st[2:0] == IPUSH_IDLE;
assign ipush_stepc_st = ipush_cur_st[2:0] == ST_MEPC;
assign ipush_stmce_st = ipush_cur_st[2:0] == ST_MCAUSE;
assign ipush_stgpr_st = ipush_cur_st[2:0] == ST_GPR;
assign ipush_subsp_st = ipush_cur_st[2:0] == SUB_SP;
assign ipush_sexpt_st = ipush_cur_st[2:0] == SPEC_EXPT;

// //&Force("output","ipush_idle_st"); @165
//------------------------------------------------
// 3. IPUSH Spec Flag
//------------------------------------------------
assign ipush_spec_vld = rtu_yy_xx_expt_int & cp0_idu_spec_push_en & (ipop_idle_st | rtu_yy_xx_expt_vld);
assign ipush_spec_clr = (ipush_check_fail | ipush_sexpt_st | ipush_subsp_st & ipush_check_ready) & ~ctrl_hs_stall;

always@(posedge hs_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ipush_spec_flag <= 1'b0;
  else if(hs_ipush_flush)
    ipush_spec_flag <= 1'b0;
  else if(ipush_spec_vld)
    ipush_spec_flag <= 1'b1;
  else if(ipush_spec_clr)
    ipush_spec_flag <= 1'b0;
  else
    ipush_spec_flag <= ipush_spec_flag;
end

// sp(x2) writeback pending
parameter SP_IDLE = 2'b00;
parameter SP_WB1  = 2'b01;
parameter SP_WB2  = 2'b11;

//always@(posedge hs_cpuclk or negedge cpurst_b)
//begin
//  if(~cpurst_b)
//    sp_wb_pending <= 1'b0;
//  else if(rtu_idu_flush_fe & ~ipush_spec_flag)
//    sp_wb_pending <= 1'b0;
//  else if(rtu_yy_xx_expt_vld & rtu_yy_xx_expt_int & cp0_idu_swap_sp_en)
//    sp_wb_pending <= gpr_hs_sp_busy;
//  else if(sp_wb_pending & gpr_hs_sp_wb)
//    sp_wb_pending <= 1'b0;
//  else
//    sp_wb_pending <= sp_wb_pending;
//end
always@(posedge hs_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    sp_wb_st[1:0] <= SP_IDLE;
  else if(rtu_idu_flush_fe & ~ipush_spec_flag | rtu_yy_xx_flush)
    sp_wb_st[1:0] <= SP_IDLE;
  else
    sp_wb_st[1:0] <= sp_wb_nxt[1:0];
end
// &CombBeg; @214
always @( cp0_idu_swap_sp_en
       or gpr_hs_sp_busy2
       or rtu_yy_xx_expt_vld
       or gpr_hs_sp_wb
       or gpr_hs_sp_busy
       or rtu_yy_xx_expt_int
       or sp_wb_st[1:0])
begin
case(sp_wb_st[1:0])
  SP_IDLE:
  begin
    if(rtu_yy_xx_expt_vld & rtu_yy_xx_expt_int & cp0_idu_swap_sp_en)
      if(gpr_hs_sp_busy2)
        sp_wb_nxt[1:0] = SP_WB2;
      else if(gpr_hs_sp_busy)
        sp_wb_nxt[1:0] = SP_WB1;
      else
        sp_wb_nxt[1:0] = SP_IDLE;
    else
      sp_wb_nxt[1:0] = SP_IDLE;
  end
  SP_WB1:
  begin
    if(gpr_hs_sp_wb)
      sp_wb_nxt[1:0] = SP_IDLE;
    else
      sp_wb_nxt[1:0] = SP_WB1;
  end
  SP_WB2:
  begin
    if(gpr_hs_sp_wb)
      sp_wb_nxt[1:0] = SP_WB1;
    else
      sp_wb_nxt[1:0] = SP_WB2;
  end
  default:
  begin
    sp_wb_nxt[1:0] = SP_IDLE;
  end
endcase
// &CombEnd; @247
end

assign sp_wb_pending = sp_wb_st[1:0] != SP_IDLE;
assign sp_cur_wb1    = sp_wb_st[1:0] == SP_WB1;

//------------------------------------------------
// 4. HS Speed Up En
//------------------------------------------------
//assign ipush_spec_hs = ipush_subsp_st & ipush_spec_flag & ipush_check_ready;
assign ipop_tail_hs  = ipop_tail_st & hs_id_inst_vld & hs_id_ipush_vld;

//------------------------------------------------
// 5. Stack Counter
//------------------------------------------------
assign cnt_inc_vld = ipush_stgpr_st | ipop_ldgpr_st;
always@(posedge hs_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    stack_cnt[3:0] <= 4'b0;
  else if(hs_flush | ipush_sexpt_st | ipush_check_fail | ipop_tail_fail)
    stack_cnt[3:0] <= 4'b0;
  else if(cnt_inc_vld & ~ctrl_hs_stall)
    stack_cnt[3:0] <= stack_cnt[3:0] + 4'b1;
  else
    stack_cnt[3:0] <= stack_cnt[3:0];
end

assign stack_cnt_done = stack_cnt[3:0] == 4'hf;

assign stack_cnt_gpra = stack_cnt[3:0] == 4'h0;  // X1
assign stack_cnt_gprb = stack_cnt[3:2] == 2'b00 & stack_cnt[1:0] != 2'b0; // X5~X7
assign stack_cnt_gprc = stack_cnt[3:2] == 2'b01  // X10~X13
                     | stack_cnt[3:2] == 2'b10; // X14~X17
assign stack_cnt_gprd = stack_cnt[3:2] == 2'b11; // X28~X31


//------------------------------------------------
// 6. IPOP FSM
//------------------------------------------------

parameter IPOP_IDLE = 3'b000;
parameter LD_GPR    = 3'b001;
parameter LD_MCAUSE = 3'b010;
parameter LD_MEPC   = 3'b011;
parameter ADD_SP    = 3'b100;
parameter IPOP_RTE  = 3'b110;
parameter IPOP_TAIL = 3'b111;

always@(posedge hs_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ipop_cur_st[2:0] <= IPOP_IDLE;
  else if(hs_flush | rtu_idu_flush_fe)
    ipop_cur_st[2:0] <= IPOP_IDLE;
  else if(~ctrl_hs_stall)
    ipop_cur_st[2:0] <= ipop_nxt_st[2:0];
end

assign ipop_req_vld  = hs_id_inst_vld & decd_hs_ipop_vld & (ipush_idle_st | ipush_check_fail) & ~ctrl_hs_bkpt_vld; 
assign ipop_tail_vld = rtu_idu_id_tail_int_vld & cp0_idu_spec_push_en;

// &CombBeg; @308
always @( ipop_cur_st[2:0]
       or hs_id_ipush_vld
       or ipop_tail_vld
       or hs_id_inst_vld
       or ipop_req_vld
       or stack_cnt_done)
begin
case(ipop_cur_st[2:0])
  IPOP_IDLE:
  begin
    if(ipop_req_vld)
      if(ipop_tail_vld)
        ipop_nxt_st[2:0] = IPOP_TAIL;
      else
        ipop_nxt_st[2:0] = LD_GPR;
    else
      ipop_nxt_st[2:0] = IPOP_IDLE;
  end
  LD_GPR:
  begin
    if(stack_cnt_done)
      ipop_nxt_st[2:0] = LD_MCAUSE;
    else
      ipop_nxt_st[2:0] = LD_GPR;
  end
  LD_MCAUSE:
  begin
    ipop_nxt_st[2:0] = LD_MEPC;
  end
  LD_MEPC:
  begin
    ipop_nxt_st[2:0] = ADD_SP;
  end
  ADD_SP:
  begin
    ipop_nxt_st[2:0] = IPOP_RTE;
  end
  IPOP_RTE:
  begin
    ipop_nxt_st[2:0] = IPOP_IDLE;
  end
  IPOP_TAIL:
  begin
    if(hs_id_inst_vld)
      if(hs_id_ipush_vld)
        ipop_nxt_st[2:0] = IPOP_IDLE;
      else
        ipop_nxt_st[2:0] = LD_GPR;
    else
      ipop_nxt_st[2:0] = IPOP_TAIL;
  end
  default:
  begin
    ipop_nxt_st[2:0] = IPOP_IDLE;
  end
endcase
// &CombEnd; @358
end

// ipop fsm state infor
assign ipop_idle_st  = ipop_cur_st[2:0] == IPOP_IDLE;
assign ipop_ldgpr_st = ipop_cur_st[2:0] == LD_GPR;
assign ipop_ldmce_st = ipop_cur_st[2:0] == LD_MCAUSE;
assign ipop_ldepc_st = ipop_cur_st[2:0] == LD_MEPC;
assign ipop_addsp_st = ipop_cur_st[2:0] == ADD_SP;
assign ipop_rte_st   = ipop_cur_st[2:0] == IPOP_RTE;
assign ipop_tail_st  = ipop_cur_st[2:0] == IPOP_TAIL;

//assign ipop_tail_ready = ipop_tail_st & hs_id_inst_vld;
assign ipop_tail_fail  = ipop_tail_st & hs_id_inst_vld & ~hs_id_ipush_vld;

// //&Force("output","ipop_idle_st"); @373

//------------------------------------------------
// 7. Split Inst Generate
// a. IPUSH split inst 
// b. IPOP split inst 
//------------------------------------------------
// a. IPUSH split inst
// basic split inst infor
// &CombBeg; @383
always @( ipush_stgpr_imm[31:0]
       or ipush_cur_st[2:0])
begin
case(ipush_cur_st[2:0])
  ST_MEPC:
  begin
    ipush_split_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
    ipush_split_func[`FUNC_WIDTH-1:0] = `FUNC_SW;
    ipush_split_ag_imm_vld            = 1'b1;
    ipush_split_dst_vld               = 1'b0;
    ipush_split_imm_pos[31:0]         = 32'h4;
  end
  ST_MCAUSE:
  begin
    ipush_split_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
    ipush_split_func[`FUNC_WIDTH-1:0] = `FUNC_SW;
    ipush_split_ag_imm_vld            = 1'b1;
    ipush_split_dst_vld               = 1'b0;
    ipush_split_imm_pos[31:0]         = 32'h8;
  end
  ST_GPR:
  begin
    ipush_split_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
    ipush_split_func[`FUNC_WIDTH-1:0] = `FUNC_SW;
    ipush_split_ag_imm_vld            = 1'b1;
    ipush_split_dst_vld               = 1'b0;
    ipush_split_imm_pos[31:0]         = ipush_stgpr_imm[31:0];
  end
  SUB_SP:
  begin
    ipush_split_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
    ipush_split_func[`FUNC_WIDTH-1:0] = `FUNC_ADD;
    ipush_split_ag_imm_vld            = 1'b0;
    ipush_split_dst_vld               = 1'b1;
    ipush_split_imm_pos[31:0]         = 32'h48;
  end
  SPEC_EXPT:
  begin
    ipush_split_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
    ipush_split_func[`FUNC_WIDTH-1:0] = `FUNC_ADD;
    ipush_split_ag_imm_vld            = 1'b0;
    ipush_split_dst_vld               = 1'b0;
    ipush_split_imm_pos[31:0]         = 32'h0;
  end
  default:
  begin
    ipush_split_sel[`SEL_WIDTH-1:0]   = {`SEL_WIDTH{1'b0}};
    ipush_split_func[`FUNC_WIDTH-1:0] = {`FUNC_WIDTH{1'b0}};
    ipush_split_ag_imm_vld            = 1'b0;
    ipush_split_dst_vld               = 1'b0;
    ipush_split_imm_pos[31:0]         = 32'h0;
  end
endcase
// &CombEnd; @434
end

// operand prepare
// rs1
assign ipush_split_rs1_vld  = ~ipush_idle_st;
assign ipush_split_rs1[5:0] = 6'h2;

// rs2 
assign ipush_split_rs2_vld  = ipush_stgpr_st;
assign ipush_mepc_rs2_vld   = ipush_stepc_st;
assign ipush_mcause_rs2_vld = ipush_stmce_st;
assign ipush_split_rs2[5:0] = {6{stack_cnt_gpra}} & 6'd1
                            | {6{stack_cnt_gprb}} & ({2'b0, stack_cnt[3:0]} + 6'd4) 
                            | {6{stack_cnt_gprc}} & ({2'b0, stack_cnt[3:0]} + 6'd6) 
                            | {6{stack_cnt_gprd}} & ({2'b0, stack_cnt[3:0]} + 6'd16); 

// imm
assign ipush_rs2_imm_vld     = ipush_subsp_st;
assign ipush_stgpr_imm[31:0] = {25'b0, {1'b0, stack_cnt[3:0]} + 5'b11, 2'b0};
assign ipush_split_imm[31:0] = ~ipush_split_imm_pos[31:0] + 1'b1;

// rd
assign ipush_split_rd[5:0]  = 6'h2; 

// split inst valid
assign ipush_split_inst_vld = ipush_stepc_st & ctrl_hs_no_op
                           | ipush_stmce_st
                           | ipush_stgpr_st
                           | ipush_subsp_st & ipush_spec_flag & ipush_check_pass
                           | ipush_subsp_st & ~ipush_spec_flag
                           | ipush_sexpt_st;
assign ipush_subsp_inst_vld = ipush_subsp_st & ipush_spec_flag & ipush_check_pass
                          | ipush_subsp_st & ~ipush_spec_flag;

// stall signal
assign ipush_stall_relax = //ipush_stgpr_st & ipush_spec_flag & ipush_check_fail
                           ipush_subsp_st & ipush_spec_flag & ipush_check_pass;
assign ipush_split_stall = ~ipush_idle_st & ~ipush_stall_relax;

// split signal
//assign ipush_split_first = ipush_stepc_st;
assign ipush_split_last  = ipush_subsp_st;
//assign ipush_split_swp   = ipush_idle_st & rtu_yy_xx_expt_int;

// ie enable

// b. IPOP split inst 
//assign ipop_vld = ipop_inst_vld & ~ipop_tail_vld;
// basic split inst infor
// &CombBeg; @483
always @( ipop_cur_st[2:0]
       or ipop_ldgpr_imm[31:0])
begin
case(ipop_cur_st[2:0])
  LD_GPR:
  begin
    ipop_split_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
    ipop_split_func[`FUNC_WIDTH-1:0] = `FUNC_LW;
    ipop_split_ag_imm_vld            = 1'b1;
    ipop_split_dst_vld               = 1'b1;
    ipop_split_imm[31:0]             = ipop_ldgpr_imm[31:0];
  end
  LD_MCAUSE:
  begin
    ipop_split_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
    ipop_split_func[`FUNC_WIDTH-1:0] = `FUNC_LW;
    ipop_split_ag_imm_vld            = 1'b1;
    ipop_split_dst_vld               = 1'b1;
    ipop_split_imm[31:0]             = 32'h40;
  end
  LD_MEPC:
  begin
    ipop_split_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
    ipop_split_func[`FUNC_WIDTH-1:0] = `FUNC_LW;
    ipop_split_ag_imm_vld            = 1'b1;
    ipop_split_dst_vld               = 1'b1;
    ipop_split_imm[31:0]             = 32'h44;
  end
  ADD_SP:
  begin
    ipop_split_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
    ipop_split_func[`FUNC_WIDTH-1:0] = `FUNC_ADD;
    ipop_split_ag_imm_vld            = 1'b0;
    ipop_split_dst_vld               = 1'b1;
    ipop_split_imm[31:0]             = 32'h48;
  end
  IPOP_RTE:
  begin
    ipop_split_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
    ipop_split_func[`FUNC_WIDTH-1:0] = `FUNC_MRET;
    ipop_split_ag_imm_vld            = 1'b0;
    ipop_split_dst_vld               = 1'b0;
    ipop_split_imm[31:0]             = 32'h0;
  end
  IPOP_TAIL:
  begin
    ipop_split_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
    ipop_split_func[`FUNC_WIDTH-1:0] = `FUNC_ADD;
    ipop_split_ag_imm_vld            = 1'b0;
    ipop_split_dst_vld               = 1'b0;
    ipop_split_imm[31:0]             = 32'h0;
  end
  default:
  begin
    ipop_split_sel[`SEL_WIDTH-1:0]   = {`SEL_WIDTH{1'b0}};
    ipop_split_func[`FUNC_WIDTH-1:0] = {`FUNC_WIDTH{1'b0}};
    ipop_split_ag_imm_vld            = 1'b0;
    ipop_split_dst_vld               = 1'b0;
    ipop_split_imm[31:0]             = 32'h0;
  end
endcase
// &CombEnd; @542
end

// rs1
assign ipop_split_rs1_vld  = 1'b1;
assign ipop_split_rs1[5:0] = 6'h2;

// imm
assign ipop_rs2_imm_vld = ipop_addsp_st;
assign ipop_ldgpr_imm[31:0] = {26'h0, 4'hf-stack_cnt[3:0], 2'b0};
//assign ipop_split_imm[31:0] = ~ipop_split_imm_pos[31:0] + 1'b1;

// rd
//assign ipop_mepc_rd_vld   = ipop_ldepc_st;
//assign ipop_mcause_rd_vld = ipop_ldmce_st;
assign ipop_split_ld_rd[5:0] = {6{stack_cnt_gpra}} & 6'd1
                             | {6{stack_cnt_gprb}} & ({2'b0, stack_cnt[3:0]} + 6'd4) 
                             | {6{stack_cnt_gprc}} & ({2'b0, stack_cnt[3:0]} + 6'd6) 
                             | {6{stack_cnt_gprd}} & ({2'b0, stack_cnt[3:0]} + 6'd16);
assign ipop_split_rd[5:0] = ipop_addsp_st ? 6'd2  : ipop_ldepc_st ? 6'h20 
                          : ipop_ldmce_st ? 6'h21 : ipop_split_ld_rd[5:0];

// split inst valid
assign ipop_split_inst_vld = ipop_ldgpr_st
                          | ipop_ldepc_st
                          | ipop_ldmce_st
                          | ipop_addsp_st
                          | ipop_rte_st;

// stall signal
assign ipop_stall_relax = ipop_idle_st & ipop_tail_vld 
                       | ipop_tail_hs;
assign ipop_split_stall = ~ipop_idle_st & ~ipop_stall_relax;

// split signal
assign ipop_split_first = ipop_idle_st & ipop_req_vld;
assign ipop_split_last  = ipop_rte_st & ctrl_hs_be_idle;

//-----------------------------------------------
// 4. Rename for Output
//-----------------------------------------------
// Output to decd
assign hs_decd_dp_vld = ~ipush_idle_st // & ~ipush_check_fail
                     | ~ipop_idle_st; 
assign hs_fdecd_dp_vld = ~ipush_idle_st // & ~ipush_check_fail
                     | ~ipop_idle_st; 
assign hs_decd_sel[`SEL_WIDTH-1:0]   = ipush_split_sel[`SEL_WIDTH-1:0] | ipop_split_sel[`SEL_WIDTH-1:0];
assign hs_decd_func[`FUNC_WIDTH-1:0] = ipush_split_func[`FUNC_WIDTH-1:0]
                                     | ipop_split_func[`FUNC_WIDTH-1:0];

assign hs_decd_rs1_vld    = ipush_split_rs1_vld | ipop_split_rs1_vld;
assign hs_decd_rs1[5:0]   = ipush_split_rs1[5:0] | ipop_split_rs1[5:0];

assign hs_decd_rs2_vld    = ipush_split_rs2_vld;
assign hs_decd_rs2[5:0]   = ipush_split_rs2[5:0];

assign hs_decd_rs2_imm_vld = ipush_rs2_imm_vld | ipop_rs2_imm_vld;
assign hs_decd_imm_vld     = ipush_split_ag_imm_vld | ipop_split_ag_imm_vld;
assign hs_decd_imm[31:0]   = ipop_split_imm[31:0] | ipush_split_imm[31:0];

assign hs_decd_dst_vld    = ipush_split_dst_vld | ipop_split_dst_vld;
assign hs_decd_rd[5:0]    = ipush_subsp_st ? ipush_split_rd[5:0] : ipop_split_rd[5:0];
assign hs_decd_split      = ~(ipush_split_last | ipop_split_last | ipop_tail_hs);

// Output to ctrl
assign hs_ctrl_inst_vld   = ipush_split_inst_vld | ipop_split_inst_vld;
assign hs_ctrl_stall      = ipush_split_stall | ipop_split_stall;
assign hs_ctrl_cancel     = ipush_idle_st & ipush_req_vld
                         | ipush_stepc_st & ~ctrl_hs_no_op
                         | ipush_check_fail
                         | ipush_spec_expt
                         | ipop_split_first & ~ipop_tail_vld
                         | ipop_tail_fail;
// Output to dp
assign hd_dp_rs2_sel      = ~ipush_idle_st;
assign hs_dp_rs2_mepc     = ipush_mepc_rs2_vld;
assign hs_dp_rs2_mcause   = ipush_mcause_rs2_vld;
assign hs_dp_ipush_spec_fail = ipush_sexpt_st;
assign hs_dp_ipop_tail    = ipop_split_first & ipop_tail_vld & ~ctrl_hs_stall;
assign hs_dp_ipop_tail_gate = ipop_split_first & ipop_tail_vld;
assign hs_dp_mie_en       = ipush_subsp_inst_vld;
assign hs_dp_ipop_int_mask = ipop_ldgpr_st | ipop_split_first & ipop_tail_vld;
assign hs_dp_sp_wb_pending = sp_wb_pending;

// Output to write mask
assign hs_gpr_wr_mask     = ipop_ldmce_st | ipop_ldepc_st;
assign hs_gpr_wb_mask     = ~ipop_idle_st;

// Output to IFU
//assign idu_ifu_tail_vld   = ipop_split_first & ipop_tail_vld;

// Output to CP0
//assign idu_cp0_sp_swap_en  = ipush_split_swp | ipop_split_last;
assign idu_cp0_sp_swap_pending = sp_wb_pending;
assign idu_cp0_sp_swap_req     = rtu_yy_xx_expt_vld & rtu_yy_xx_expt_int & cp0_idu_swap_sp_en & ~gpr_hs_sp_busy
                              | sp_cur_wb1 & gpr_hs_sp_wb
                              | sp_wb_pending & (rtu_idu_flush_fe & ~ipush_spec_flag | rtu_yy_xx_flush);
assign idu_cp0_sp_swap_req_gate = rtu_yy_xx_expt_int & cp0_idu_swap_sp_en & ~gpr_hs_sp_busy
                              | sp_cur_wb1 & gpr_hs_sp_wb
                              | sp_wb_pending & (rtu_idu_flush_fe & ~ipush_spec_flag | rtu_yy_xx_flush);

//assign idu_cp0_sp_swap_req      = (ipush_subsp_inst_vld | ipush_check_fail) & cp0_idu_swap_sp_en;
//assign idu_cp0_sp_swap_req_gate = (ipush_subsp_inst_vld | ipush_check_fail) & cp0_idu_swap_sp_en;
assign idu_cp0_id_tail_vld   = ipop_split_first & ipop_tail_vld;
assign idu_yy_xx_tail_ack       = ipop_tail_hs;

// Output to RTU
assign idu_lsu_ex1_ipush_spec  = ipush_spec_flag;
assign idu_cp0_ex1_tail_fail   = ipop_tail_fail;

// Output to IU
assign idu_iu_tail_fail        = ipop_tail_fail;
assign idu_iu_tail_fail_gate  = ipop_tail_st & ifu_idu_id_inst_vld;

// &Force("nonport","flag"); @667
// &Force("nonport","clk"); @668
// &Force("nonport","rst"); @669

// &ModuleEnd; @678
endmodule


