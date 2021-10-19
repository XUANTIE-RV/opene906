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
module pa_rtu_retire(
  cbus_retire_ex2_chgflw_vld,
  cbus_retire_ex2_cur_pc,
  cbus_retire_ex2_expt_inst,
  cbus_retire_ex2_flush,
  cbus_retire_ex2_halt_info,
  cbus_retire_ex2_inst_branch,
  cbus_retire_ex2_inst_dret,
  cbus_retire_ex2_inst_ebreak,
  cbus_retire_ex2_inst_int,
  cbus_retire_ex2_inst_mret,
  cbus_retire_ex2_inst_nmi,
  cbus_retire_ex2_inst_tail_int,
  cbus_retire_ex2_inst_vld,
  cbus_retire_ex2_int_hv,
  cbus_retire_ex2_int_lv,
  cbus_retire_ex2_ipop_int_mask,
  cbus_retire_ex2_may_debug,
  cbus_retire_ex2_next_pc,
  cbus_retire_ex2_split_inst,
  cbus_retire_ex2_tail_spec_inst,
  cbus_retire_ex2_trap_vec,
  cbus_retire_ex2_tval,
  cp0_rtu_ex1_mret,
  cp0_rtu_icg_en,
  cp0_rtu_in_nmi,
  cp0_xx_async_expt_en,
  cp0_yy_clk_en,
  cpurst_b,
  dtu_rtu_async_halt_req,
  dtu_rtu_dpc,
  dtu_rtu_ebreak_action,
  dtu_rtu_pending_tval,
  dtu_rtu_resume_req,
  dtu_rtu_step_en,
  dtu_rtu_sync_flush,
  dtu_rtu_sync_halt_req,
  forever_cpuclk,
  fpu_xx_no_op,
  ifu_rtu_reset_halt_req,
  int_retire_pending_int_hv,
  iu_xx_no_op,
  lockup_clk,
  lockup_clk_en,
  lockup_retire_dbg_vld,
  lockup_retire_nmi_vld,
  lsu_rtu_async_expt_vld,
  lsu_rtu_async_ld_inst,
  lsu_rtu_async_tval,
  lsu_rtu_ex2_bus_err,
  lsu_rtu_ex2_stall,
  lsu_rtu_ex2_tval,
  lsu_rtu_sync_ack,
  lsu_xx_no_op,
  pad_yy_icg_scan_en,
  retire_cbus_debug_may_spec_fail,
  retire_cbus_ex2_stall,
  retire_cbus_flush_stall,
  retire_int_nmi_ack,
  retire_lockup_dbg_req,
  retire_lockup_dbgon,
  retire_lockup_expt_vld,
  retire_lockup_nmi_exit,
  retire_lockup_retire_pc,
  retire_lockup_retire_vld,
  retire_top_dbg_mode_on,
  retire_top_dbg_stall,
  retire_top_flush_cur_state,
  retire_top_lsu_ex2_stall,
  retire_xx_ex2_expt_raw,
  rtu_cp0_bus_error,
  rtu_cp0_epc,
  rtu_cp0_exit_debug,
  rtu_cp0_int_level,
  rtu_cp0_nmi_vld,
  rtu_cp0_tval,
  rtu_dtu_dpc,
  rtu_dtu_halt_ack,
  rtu_dtu_pending_ack,
  rtu_dtu_retire_chgflw,
  rtu_dtu_retire_debug_expt_vld,
  rtu_dtu_retire_halt_info,
  rtu_dtu_retire_mret,
  rtu_dtu_retire_next_pc,
  rtu_dtu_retire_vld,
  rtu_dtu_tval,
  rtu_hpcp_retire_inst_vld,
  rtu_idu_flush_fe,
  rtu_idu_flush_stall,
  rtu_idu_inst_retire,
  rtu_idu_late_flush,
  rtu_ifu_chgflw_pc,
  rtu_ifu_chgflw_vld,
  rtu_ifu_dbg_mask,
  rtu_ifu_flush_fe,
  rtu_lsu_async_expt_ack,
  rtu_lsu_expt_ack,
  rtu_lsu_expt_exit,
  rtu_lsu_inst_retire,
  rtu_lsu_sync_req,
  rtu_pad_inst_retire,
  rtu_pad_inst_split,
  rtu_pad_retire_pc,
  rtu_sysio_halted,
  rtu_xx_no_op,
  rtu_yy_xx_async_flush,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vec,
  rtu_yy_xx_expt_vld,
  rtu_yy_xx_flush,
  rtu_yy_xx_int_hv,
  rtu_yy_xx_tail_int_vld
);

// &Ports; @24
input           cbus_retire_ex2_chgflw_vld;           
input   [31:0]  cbus_retire_ex2_cur_pc;               
input           cbus_retire_ex2_expt_inst;            
input           cbus_retire_ex2_flush;                
input   [14:0]  cbus_retire_ex2_halt_info;            
input           cbus_retire_ex2_inst_branch;          
input           cbus_retire_ex2_inst_dret;            
input           cbus_retire_ex2_inst_ebreak;          
input           cbus_retire_ex2_inst_int;             
input           cbus_retire_ex2_inst_mret;            
input           cbus_retire_ex2_inst_nmi;             
input           cbus_retire_ex2_inst_tail_int;        
input           cbus_retire_ex2_inst_vld;             
input           cbus_retire_ex2_int_hv;               
input   [7 :0]  cbus_retire_ex2_int_lv;               
input           cbus_retire_ex2_ipop_int_mask;        
input           cbus_retire_ex2_may_debug;            
input   [31:0]  cbus_retire_ex2_next_pc;              
input           cbus_retire_ex2_split_inst;           
input           cbus_retire_ex2_tail_spec_inst;       
input   [11:0]  cbus_retire_ex2_trap_vec;             
input   [31:0]  cbus_retire_ex2_tval;                 
input           cp0_rtu_ex1_mret;                     
input           cp0_rtu_icg_en;                       
input           cp0_rtu_in_nmi;                       
input           cp0_xx_async_expt_en;                 
input           cp0_yy_clk_en;                        
input           cpurst_b;                             
input           dtu_rtu_async_halt_req;               
input   [31:0]  dtu_rtu_dpc;                          
input           dtu_rtu_ebreak_action;                
input   [31:0]  dtu_rtu_pending_tval;                 
input           dtu_rtu_resume_req;                   
input           dtu_rtu_step_en;                      
input           dtu_rtu_sync_flush;                   
input           dtu_rtu_sync_halt_req;                
input           forever_cpuclk;                       
input           fpu_xx_no_op;                         
input           ifu_rtu_reset_halt_req;               
input           int_retire_pending_int_hv;            
input           iu_xx_no_op;                          
input           lockup_clk_en;                        
input           lockup_retire_dbg_vld;                
input           lockup_retire_nmi_vld;                
input           lsu_rtu_async_expt_vld;               
input           lsu_rtu_async_ld_inst;                
input   [31:0]  lsu_rtu_async_tval;                   
input           lsu_rtu_ex2_bus_err;                  
input           lsu_rtu_ex2_stall;                    
input   [31:0]  lsu_rtu_ex2_tval;                     
input           lsu_rtu_sync_ack;                     
input           lsu_xx_no_op;                         
input           pad_yy_icg_scan_en;                   
output          lockup_clk;                           
output          retire_cbus_debug_may_spec_fail;      
output          retire_cbus_ex2_stall;                
output          retire_cbus_flush_stall;              
output          retire_int_nmi_ack;                   
output          retire_lockup_dbg_req;                
output          retire_lockup_dbgon;                  
output          retire_lockup_expt_vld;               
output          retire_lockup_nmi_exit;               
output  [31:0]  retire_lockup_retire_pc;              
output          retire_lockup_retire_vld;             
output          retire_top_dbg_mode_on;               
output          retire_top_dbg_stall;                 
output  [2 :0]  retire_top_flush_cur_state;           
output          retire_top_lsu_ex2_stall;             
output          retire_xx_ex2_expt_raw;               
output          rtu_cp0_bus_error;                    
output  [31:0]  rtu_cp0_epc;                          
output          rtu_cp0_exit_debug;                   
output  [7 :0]  rtu_cp0_int_level;                    
output          rtu_cp0_nmi_vld;                      
output  [31:0]  rtu_cp0_tval;                         
output  [31:0]  rtu_dtu_dpc;                          
output          rtu_dtu_halt_ack;                     
output          rtu_dtu_pending_ack;                  
output          rtu_dtu_retire_chgflw;                
output          rtu_dtu_retire_debug_expt_vld;        
output  [14:0]  rtu_dtu_retire_halt_info;             
output          rtu_dtu_retire_mret;                  
output  [31:0]  rtu_dtu_retire_next_pc;               
output          rtu_dtu_retire_vld;                   
output  [31:0]  rtu_dtu_tval;                         
output          rtu_hpcp_retire_inst_vld;             
output          rtu_idu_flush_fe;                     
output          rtu_idu_flush_stall;                  
output          rtu_idu_inst_retire;                  
output          rtu_idu_late_flush;                   
output  [31:0]  rtu_ifu_chgflw_pc;                    
output          rtu_ifu_chgflw_vld;                   
output          rtu_ifu_dbg_mask;                     
output          rtu_ifu_flush_fe;                     
output          rtu_lsu_async_expt_ack;               
output          rtu_lsu_expt_ack;                     
output          rtu_lsu_expt_exit;                    
output          rtu_lsu_inst_retire;                  
output          rtu_lsu_sync_req;                     
output          rtu_pad_inst_retire;                  
output          rtu_pad_inst_split;                   
output  [31:0]  rtu_pad_retire_pc;                    
output          rtu_sysio_halted;                     
output          rtu_xx_no_op;                         
output          rtu_yy_xx_async_flush;                
output          rtu_yy_xx_dbgon;                      
output          rtu_yy_xx_expt_int;                   
output  [11:0]  rtu_yy_xx_expt_vec;                   
output          rtu_yy_xx_expt_vld;                   
output          rtu_yy_xx_flush;                      
output          rtu_yy_xx_int_hv;                     
output          rtu_yy_xx_tail_int_vld;               

// &Regs; @25
reg             bkpt_req_split_lsu_trigger_buf;       
reg             bkpt_req_split_trigger_t1_buf;        
reg             dbg_mode_on;                          
reg             dbg_mode_on_after_req;                
reg     [1 :0]  dbg_stall_cur_state;                  
reg     [1 :0]  dbg_stall_next_state;                 
reg     [2 :0]  flush_cur_state;                      
reg     [2 :0]  flush_next_state;                     
reg     [3 :0]  halt_cause;                           
reg             halt_req_split_trigger_t1_buf;        
reg             retire_async_flush;                   
reg             retire_buf_async_trap_vld;            
reg     [14:0]  retire_buf_split_trigger_t1_halt_info; 
reg             retire_buf_trap_vld;                  
reg             retire_buf_xret_vld;                  
reg             retire_int_flush;                     
reg             retire_trap_ack_async;                
reg             retire_trap_ack_int;                  
reg             retire_trap_ack_nmi;                  
reg     [31:0]  retire_trap_tval;                     
reg     [11:0]  retire_trap_vec;                      
reg     [14:0]  rtu_dtu_retire_halt_info;             
reg     [31:0]  rtu_dtu_tval;                         

// &Wires; @26
wire            bkpt_req_buf_split_trigger_t1;        
wire            bkpt_req_ebreak;                      
wire            bkpt_req_pending;                     
wire            bkpt_req_split_trigger_t1;            
wire            bkpt_req_t1_retire_vld;               
wire            bkpt_req_t1_retire_vld_raw;           
wire            bkpt_req_trigger_t0;                  
wire            bkpt_req_trigger_t1;                  
wire            bkpt_req_trigger_t1_raw;              
wire            cbus_retire_ex2_chgflw_vld;           
wire    [31:0]  cbus_retire_ex2_cur_pc;               
wire            cbus_retire_ex2_expt_inst;            
wire            cbus_retire_ex2_flush;                
wire    [14:0]  cbus_retire_ex2_halt_info;            
wire            cbus_retire_ex2_inst_branch;          
wire            cbus_retire_ex2_inst_dret;            
wire            cbus_retire_ex2_inst_ebreak;          
wire            cbus_retire_ex2_inst_int;             
wire            cbus_retire_ex2_inst_mret;            
wire            cbus_retire_ex2_inst_nmi;             
wire            cbus_retire_ex2_inst_tail_int;        
wire            cbus_retire_ex2_inst_vld;             
wire            cbus_retire_ex2_int_hv;               
wire    [7 :0]  cbus_retire_ex2_int_lv;               
wire            cbus_retire_ex2_ipop_int_mask;        
wire            cbus_retire_ex2_may_debug;            
wire    [31:0]  cbus_retire_ex2_next_pc;              
wire            cbus_retire_ex2_split_inst;           
wire            cbus_retire_ex2_tail_spec_inst;       
wire    [11:0]  cbus_retire_ex2_trap_vec;             
wire    [31:0]  cbus_retire_ex2_tval;                 
wire            cp0_rtu_ex1_mret;                     
wire            cp0_rtu_icg_en;                       
wire            cp0_rtu_in_nmi;                       
wire            cp0_xx_async_expt_en;                 
wire            cp0_yy_clk_en;                        
wire            cpurst_b;                             
wire            dtu_rtu_async_halt_req;               
wire    [31:0]  dtu_rtu_dpc;                          
wire            dtu_rtu_ebreak_action;                
wire    [31:0]  dtu_rtu_pending_tval;                 
wire            dtu_rtu_resume_req;                   
wire            dtu_rtu_step_en;                      
wire            dtu_rtu_sync_flush;                   
wire            dtu_rtu_sync_halt_req;                
wire            forever_cpuclk;                       
wire            fpu_xx_no_op;                         
wire            halt_req;                             
wire            halt_req_buf_split_trigger_t1;        
wire            halt_req_dm_async;                    
wire            halt_req_dm_sync;                     
wire            halt_req_ebreak;                      
wire            halt_req_lockup_dm_sync;              
wire            halt_req_pending;                     
wire            halt_req_reset;                       
wire            halt_req_split_trigger_t1;            
wire            halt_req_step;                        
wire            halt_req_t1;                          
wire            halt_req_t1_raw;                      
wire            halt_req_t1_retire_vld;               
wire            halt_req_t1_retire_vld_raw;           
wire            halt_req_trigger_t0;                  
wire            halt_req_trigger_t1;                  
wire            halt_req_trigger_t1_raw;              
wire            ifu_rtu_reset_halt_req;               
wire            int_retire_pending_int_hv;            
wire            iu_xx_no_op;                          
wire            lockup_clk;                           
wire            lockup_clk_en;                        
wire            lockup_retire_dbg_vld;                
wire            lockup_retire_nmi_vld;                
wire            lsu_rtu_async_expt_vld;               
wire            lsu_rtu_async_ld_inst;                
wire    [31:0]  lsu_rtu_async_tval;                   
wire            lsu_rtu_ex2_bus_err;                  
wire            lsu_rtu_ex2_stall;                    
wire    [31:0]  lsu_rtu_ex2_tval;                     
wire            lsu_rtu_sync_ack;                     
wire            lsu_xx_no_op;                         
wire            pad_yy_icg_scan_en;                   
wire            retire_async_expt;                    
wire            retire_async_expt_en;                 
wire    [11:0]  retire_async_expt_vec;                
wire            retire_async_trap_vld;                
wire    [31:0]  retire_async_tval;                    
wire            retire_bkpt_expt;                     
wire            retire_bkpt_expt_lsu_trigger_t1;      
wire            retire_bkpt_expt_split_lsu_trigger_t1; 
wire            retire_bkpt_expt_t1;                  
wire            retire_cbus_debug_may_spec_fail;      
wire            retire_cbus_ex2_stall;                
wire            retire_cbus_flush_stall;              
wire    [31:0]  retire_chgflw_pc;                     
wire            retire_chgflw_vld;                    
wire            retire_clk;                           
wire            retire_clk_en;                        
wire            retire_cpu_no_op;                     
wire            retire_dbg_mode_async_trap_vld;       
wire            retire_dbg_stall;                     
wire            retire_dbg_stall_set;                 
wire            retire_debug_flush;                   
wire            retire_ex2_retire_normal;             
wire            retire_ex2_retire_vld;                
wire            retire_exit_debug;                    
wire            retire_expt_debug;                    
wire            retire_expt_inst;                     
wire            retire_flush_be;                      
wire            retire_flush_fe;                      
wire            retire_flush_fe_set;                  
wire            retire_flush_stall;                   
wire    [14:0]  retire_halt_info;                     
wire            retire_inst_expt;                     
wire    [11:0]  retire_inst_expt_vec;                 
wire            retire_int_inst;                      
wire            retire_int_nmi_ack;                   
wire            retire_int_vld;                       
wire            retire_lockup_dbg_req;                
wire            retire_lockup_dbgon;                  
wire            retire_lockup_expt_vld;               
wire            retire_lockup_nmi_exit;               
wire    [31:0]  retire_lockup_retire_pc;              
wire            retire_lockup_retire_vld;             
wire            retire_nmi_inst;                      
wire            retire_nmi_vld;                       
wire            retire_pending_bkpt_expt;             
wire            retire_sync_debug_may_spec_fail;      
wire            retire_sync_expt;                     
wire            retire_tail_int_vld;                  
wire            retire_top_dbg_mode_on;               
wire            retire_top_dbg_stall;                 
wire    [2 :0]  retire_top_flush_cur_state;           
wire            retire_top_lsu_ex2_stall;             
wire    [31:0]  retire_trap_epc;                      
wire            retire_trap_epc_sel_cur_pc;           
wire            retire_trap_tval_ex1;                 
wire            retire_trap_vld;                      
wire            retire_xx_ex2_expt_raw;               
wire            rtu_cp0_bus_error;                    
wire    [31:0]  rtu_cp0_epc;                          
wire            rtu_cp0_exit_debug;                   
wire    [7 :0]  rtu_cp0_int_level;                    
wire            rtu_cp0_nmi_vld;                      
wire    [31:0]  rtu_cp0_tval;                         
wire    [31:0]  rtu_dtu_dpc;                          
wire            rtu_dtu_halt_ack;                     
wire            rtu_dtu_pending_ack;                  
wire            rtu_dtu_retire_chgflw;                
wire            rtu_dtu_retire_debug_expt_vld;        
wire            rtu_dtu_retire_mret;                  
wire    [31:0]  rtu_dtu_retire_next_pc;               
wire            rtu_dtu_retire_vld;                   
wire            rtu_hpcp_retire_inst_vld;             
wire            rtu_idu_flush_fe;                     
wire            rtu_idu_flush_stall;                  
wire            rtu_idu_inst_retire;                  
wire            rtu_idu_late_flush;                   
wire    [31:0]  rtu_ifu_chgflw_pc;                    
wire            rtu_ifu_chgflw_vld;                   
wire            rtu_ifu_dbg_mask;                     
wire            rtu_ifu_flush_fe;                     
wire            rtu_lsu_async_expt_ack;               
wire            rtu_lsu_expt_ack;                     
wire            rtu_lsu_expt_exit;                    
wire            rtu_lsu_inst_retire;                  
wire            rtu_lsu_sync_req;                     
wire            rtu_pad_inst_retire;                  
wire            rtu_pad_inst_split;                   
wire    [31:0]  rtu_pad_retire_pc;                    
wire            rtu_sysio_halted;                     
wire            rtu_xx_no_op;                         
wire            rtu_yy_xx_async_flush;                
wire            rtu_yy_xx_dbgon;                      
wire            rtu_yy_xx_expt_int;                   
wire    [11:0]  rtu_yy_xx_expt_vec;                   
wire            rtu_yy_xx_expt_vld;                   
wire            rtu_yy_xx_flush;                      
wire            rtu_yy_xx_int_hv;                     
wire            rtu_yy_xx_tail_int_vld;               


//==========================================================
//                   Retire valid signals
//==========================================================
assign retire_ex2_retire_vld    = cbus_retire_ex2_inst_vld
                                  && !cbus_retire_ex2_tail_spec_inst
                                  && !lsu_rtu_ex2_stall
                                  && !retire_dbg_stall;

assign retire_ex2_retire_normal = retire_ex2_retire_vld
                                  && !retire_sync_expt;

//==========================================================
//                 Retire Exception Process
//==========================================================
//----------------------------------------------------------
//                           Expt
//----------------------------------------------------------
// Expt source includes:
//   1. EX1 Expt
//   2. bus error
//   3. breakpoint
assign retire_inst_expt             = cbus_retire_ex2_expt_inst || retire_bkpt_expt;
assign retire_inst_expt_vec[11:0]   = cbus_retire_ex2_trap_vec[11:0];

assign retire_async_expt_en         = (cp0_xx_async_expt_en || !lsu_rtu_async_ld_inst)
                                      && !cbus_retire_ex2_split_inst;
assign retire_async_expt            = lsu_rtu_async_expt_vld;
assign retire_async_expt_vec[11:0]  = lsu_rtu_async_ld_inst ? 12'd5 : 12'd7;
assign retire_async_tval[31:0]      = lsu_rtu_async_tval[31:0];

assign retire_sync_expt             = retire_inst_expt
                                   || retire_pending_bkpt_expt;

assign retire_expt_inst             = retire_sync_expt
                                   || retire_async_expt;
//expt in debug mode: expt except bkpt will set cmderr3
assign retire_expt_debug            = retire_pending_bkpt_expt
                                   || retire_async_expt
                                   || cbus_retire_ex2_expt_inst
                                      && !retire_bkpt_expt;
assign retire_int_inst              = cbus_retire_ex2_inst_int;
assign retire_nmi_inst              = cbus_retire_ex2_inst_nmi;

assign retire_xx_ex2_expt_raw       = retire_expt_inst;

//----------------------------------------------------------
//                       Trap Vector
//----------------------------------------------------------
// Trap level:
//   1. pending bkpt expt
//   2. NMI
//   3. Int
//   4. async expt
//   5. sync expt
// &CombBeg; @84
always @( retire_int_inst
       or retire_async_expt_vec[11:0]
       or retire_async_expt
       or retire_bkpt_expt
       or retire_inst_expt_vec[11:0]
       or retire_nmi_inst
       or lockup_retire_nmi_vld
       or retire_pending_bkpt_expt)
begin
  if (retire_pending_bkpt_expt) begin
    retire_trap_vec[11:0] = 12'd3;

    //retire_trap_ack_sync  = 1'b1;
    retire_trap_ack_async = 1'b0;
    retire_trap_ack_int   = 1'b0;
    retire_trap_ack_nmi   = 1'b0;
  end
  else if (retire_nmi_inst || lockup_retire_nmi_vld) begin // nmi
    retire_trap_vec[11:0] = 12'd24;

    //retire_trap_ack_sync  = 1'b0;
    retire_trap_ack_async = 1'b0;
    retire_trap_ack_int   = 1'b0;
    retire_trap_ack_nmi   = 1'b1;
  end
  else if (retire_int_inst) begin
    retire_trap_vec[11:0] = retire_inst_expt_vec[11:0];

    //retire_trap_ack_sync  = 1'b0;
    retire_trap_ack_async = 1'b0;
    retire_trap_ack_int   = 1'b1;
    retire_trap_ack_nmi   = 1'b0;
  end
  else if (retire_async_expt) begin // async expt
    retire_trap_vec[11:0] = retire_async_expt_vec[11:0];

    //retire_trap_ack_sync  = 1'b0;
    retire_trap_ack_async = 1'b1;
    retire_trap_ack_int   = 1'b0;
    retire_trap_ack_nmi   = 1'b0;
  end
  else if (retire_bkpt_expt) begin
    retire_trap_vec[11:0] = 12'd3;

    //retire_trap_ack_sync  = 1'b1;
    retire_trap_ack_async = 1'b0;
    retire_trap_ack_int   = 1'b0;
    retire_trap_ack_nmi   = 1'b0;
  end
  else begin
    retire_trap_vec[11:0] = retire_inst_expt_vec[11:0];

    //retire_trap_ack_sync  = 1'b1;
    retire_trap_ack_async = 1'b0;
    retire_trap_ack_int   = 1'b0;
    retire_trap_ack_nmi   = 1'b0;
  end
// &CombEnd; @133
end

//----------------------------------------------------------
//                        Trap TVAL
//----------------------------------------------------------
//assign retire_trap_tval_pc = cbus_retire_ex2_expt_inst
//                             && (cbus_retire_ex2_trap_vec[3:0] == 4'h1
//                              || cbus_retire_ex2_trap_vec[3:0] == 4'hc);
assign retire_trap_tval_ex1 = cbus_retire_ex2_expt_inst
                              && (cbus_retire_ex2_trap_vec[3:0] == 4'h1
                               || cbus_retire_ex2_trap_vec[3:0] == 4'h2
                               || cbus_retire_ex2_trap_vec[3:0] == 4'h4
                               || cbus_retire_ex2_trap_vec[3:0] == 4'h5
                               || cbus_retire_ex2_trap_vec[3:0] == 4'h6
                               || cbus_retire_ex2_trap_vec[3:0] == 4'h7
                               || cbus_retire_ex2_trap_vec[3:0] == 4'hc);

// For tval proirity:
//   1. pending bkpt expt
//   2. NMI (do not update tval)
//   3. Int
//   4. async expt
//   5. sync expt
// &CombBeg; @156
always @( dtu_rtu_pending_tval[31:0]
       or retire_int_inst
       or bkpt_req_trigger_t0
       or retire_async_expt
       or retire_async_tval[31:0]
       or retire_trap_tval_ex1
       or cbus_retire_ex2_tval[31:0]
       or retire_pending_bkpt_expt)
begin
  if (retire_pending_bkpt_expt)
    retire_trap_tval[31:0] = dtu_rtu_pending_tval[31:0];
  else if (retire_int_inst)
    retire_trap_tval[31:0] = 32'b0;
  else if (retire_async_expt)
    retire_trap_tval[31:0] = retire_async_tval[31:0];
//  else if (retire_trap_tval_pc)
//    retire_trap_tval[31:0] = cbus_retire_ex2_cur_pc[31:0];
  else if (retire_trap_tval_ex1 || bkpt_req_trigger_t0)
    retire_trap_tval[31:0] = cbus_retire_ex2_tval[31:0];
  else
    retire_trap_tval[31:0] = 32'b0;
// &CombEnd @169
end

//----------------------------------------------------------
//                       Trap EPC
//----------------------------------------------------------
assign retire_trap_epc_sel_cur_pc = retire_sync_expt
                                 || retire_async_expt
                                    && (!retire_async_expt_en
                                      || cbus_retire_ex2_inst_tail_int)
                                 || (retire_int_inst || retire_nmi_inst)
                                    && cbus_retire_ex2_ipop_int_mask;

assign retire_trap_epc[31:0]      = retire_trap_epc_sel_cur_pc
                                    ? cbus_retire_ex2_cur_pc[31:0]
                                    : cbus_retire_ex2_next_pc[31:0];

//----------------------------------------------------------
//                      Sync Trap Ack
//----------------------------------------------------------
assign retire_trap_vld      = retire_ex2_retire_vld
                              && !halt_req && !dbg_mode_on
                              && (retire_expt_inst || retire_int_inst || retire_nmi_inst)
                           || lockup_retire_nmi_vld;

//assign retire_sync_trap_vld = retire_ex2_retire_vld
//                              && !halt_req && !dbg_mode_on
//                              && retire_trap_ack_sync;

assign retire_nmi_vld       = retire_ex2_retire_vld
                              && !halt_req && !dbg_mode_on
                              && retire_trap_ack_nmi;

assign retire_int_vld       = retire_ex2_retire_vld
                              && !halt_req && !dbg_mode_on
                              && retire_trap_ack_int;

assign retire_tail_int_vld  = retire_ex2_retire_vld
                              && !halt_req && !dbg_mode_on
                              && !retire_expt_inst
                              && cbus_retire_ex2_inst_tail_int;

assign retire_int_nmi_ack   = retire_nmi_vld || lockup_retire_nmi_vld;

//----------------------------------------------------------
//                     Async Trap Ack
//----------------------------------------------------------
//for lsu
assign retire_async_trap_vld = retire_async_expt
                               && (retire_trap_vld
                                   && retire_trap_ack_async);
//                                || dbg_mode_on_after_req);
//debug mode async trap
assign retire_dbg_mode_async_trap_vld = retire_async_expt
                                        && retire_ex2_retire_vld
                                        && !retire_pending_bkpt_expt;

//==========================================================
//                        Changeflow
//==========================================================
assign retire_chgflw_vld      = retire_ex2_retire_vld && !retire_trap_vld
                                && (cbus_retire_ex2_chgflw_vld
                                 || cbus_retire_ex2_flush)
                                || retire_exit_debug;

assign retire_chgflw_pc[31:0] = retire_exit_debug
                                ? dtu_rtu_dpc[31:0]
                                : cbus_retire_ex2_next_pc[31:0];

//==========================================================
//                      Debug Process
//==========================================================
parameter STALL_IDLE   = 2'b00;
parameter STALL_SET    = 2'b01;
parameter STALL_RETIRE = 2'b10;

//----------------------------------------------------------
//                       Debug Stall
//----------------------------------------------------------
assign retire_dbg_stall_set = cbus_retire_ex2_inst_vld
                              && !dbg_mode_on
                              && (cbus_retire_ex2_may_debug
                               || retire_sync_debug_may_spec_fail);
assign rtu_lsu_sync_req     = retire_dbg_stall_set;

always @ (posedge retire_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dbg_stall_cur_state[1:0] <= 2'b0;
  else
    dbg_stall_cur_state[1:0] <= dbg_stall_next_state[1:0];
end

// &CombBeg; @262
always @( retire_ex2_retire_vld
       or lsu_rtu_sync_ack
       or dbg_stall_cur_state[1:0]
       or retire_dbg_stall_set)
begin
  case(dbg_stall_cur_state[1:0])
  STALL_IDLE:
    if (retire_dbg_stall_set)
      dbg_stall_next_state[1:0] = STALL_SET;
    else
      dbg_stall_next_state[1:0] = STALL_IDLE;
  STALL_SET:
    if (lsu_rtu_sync_ack)
      dbg_stall_next_state[1:0] = STALL_RETIRE;
    else
      dbg_stall_next_state[1:0] = STALL_SET;
  STALL_RETIRE:
    if (retire_ex2_retire_vld)
      dbg_stall_next_state[1:0] = STALL_IDLE;
    else
      dbg_stall_next_state[1:0] = STALL_RETIRE;
  default:
      dbg_stall_next_state[1:0] = STALL_IDLE;
  endcase
// &CombEnd; @282
end

assign retire_dbg_stall = (dbg_stall_cur_state[1:0] == STALL_IDLE)
                          && retire_dbg_stall_set
                       || (dbg_stall_cur_state[1:0] == STALL_SET);
assign retire_top_dbg_stall  = retire_dbg_stall;

//----------------------------------------------------------
//                Halt Request : Timing 0
//----------------------------------------------------------
//t0 halt request will enter debug mode when not in debug mode
assign halt_req_reset            = ifu_rtu_reset_halt_req;
//async halt req ignore dbg_mode_on
assign halt_req_dm_async         = dtu_rtu_async_halt_req;
//ack dm sync halt req in lockup without inst retire
assign halt_req_lockup_dm_sync   = lockup_retire_dbg_vld;
assign halt_req_ebreak           = retire_ex2_retire_vld
                                   && dtu_rtu_ebreak_action
                                   && cbus_retire_ex2_inst_ebreak
                                   && !cbus_retire_ex2_halt_info[`TDT_HINFO_PENDING_HALT]
                                   && !dbg_mode_on_after_req;
assign halt_req_trigger_t0       = retire_ex2_retire_vld
                                   && cbus_retire_ex2_halt_info[`TDT_HINFO_MATCH]
                                   && !cbus_retire_ex2_halt_info[`TDT_HINFO_CHAIN]
                                   && !cbus_retire_ex2_halt_info[`TDT_HINFO_TIMING]
                                   && cbus_retire_ex2_halt_info[`TDT_HINFO_ACTION]
                                   && !cbus_retire_ex2_halt_info[`TDT_HINFO_PENDING_HALT]
                                   && !dbg_mode_on_after_req;
assign halt_req_pending          = retire_ex2_retire_vld
                                   && cbus_retire_ex2_halt_info[`TDT_HINFO_PENDING_HALT]
                                   && cbus_retire_ex2_halt_info[`TDT_HINFO_ACTION]
                                   && !dbg_mode_on_after_req;
//t0 halt request
assign halt_req                  = halt_req_reset
                                || halt_req_ebreak
                                || halt_req_trigger_t0
                                || halt_req_pending
                                || halt_req_dm_async
                                || halt_req_lockup_dm_sync;

//----------------------------------------------------------
//                Halt Request : Timing 1
//----------------------------------------------------------
//cannot ack t1 halt request when:
//1.inst with pending halt or expt
//2.in debug mode
assign halt_req_t1_retire_vld_raw = retire_ex2_retire_vld
                                    && !cbus_retire_ex2_halt_info[`TDT_HINFO_PENDING_HALT]
                                    && !dbg_mode_on_after_req;
//3.ack t0 halt request
//4.t1 bkpt expt request (see below)
assign halt_req_t1_retire_vld     = halt_req_t1_retire_vld_raw
                                    && !halt_req;
//Halt Request with Timing 1
assign halt_req_dm_sync           = halt_req_t1_retire_vld
                                    && !cbus_retire_ex2_split_inst
                                    && !cbus_retire_ex2_inst_tail_int
                                    && dtu_rtu_sync_halt_req;
assign halt_req_step              = halt_req_t1_retire_vld
                                    && !cbus_retire_ex2_split_inst
                                    && !cbus_retire_ex2_inst_tail_int
                                    && dtu_rtu_step_en;
assign halt_req_trigger_t1_raw    = halt_req_t1_retire_vld
                                    && cbus_retire_ex2_halt_info[`TDT_HINFO_MATCH]
                                    && !cbus_retire_ex2_halt_info[`TDT_HINFO_CHAIN]
                                    && cbus_retire_ex2_halt_info[`TDT_HINFO_TIMING]
                                    && cbus_retire_ex2_halt_info[`TDT_HINFO_ACTION];
// &Force("nonport","veri_halt_req_t1"); @350

//split inst t1 trigger will be buffered and ack in last split inst
assign halt_req_trigger_t1        = halt_req_trigger_t1_raw
                                    && !cbus_retire_ex2_split_inst
                                    && !cbus_retire_ex2_inst_tail_int;
assign halt_req_split_trigger_t1  = halt_req_trigger_t1_raw
                                    && (cbus_retire_ex2_split_inst
                                     || cbus_retire_ex2_inst_tail_int);
//buffered split trigger will ack at non-split inst
assign halt_req_buf_split_trigger_t1 = halt_req_t1_retire_vld
                                       && !cbus_retire_ex2_split_inst
                                       && !cbus_retire_ex2_inst_tail_int
                                       && halt_req_split_trigger_t1_buf;

//t1 halt request will generate inst flush and signal dtu pending halt
assign halt_req_t1_raw            = halt_req_dm_sync
                                 || halt_req_trigger_t1
                                 || halt_req_buf_split_trigger_t1
                                 || halt_req_step;

//cannot ack t1 halt request when:
//4.t1 bkpt expt request
assign halt_req_t1                = halt_req_t1_raw
                                    && !retire_bkpt_expt_t1;

//----------------------------------------------------------
//              Bkpt Expt Request : Timing 0
//----------------------------------------------------------
assign bkpt_req_ebreak           = retire_ex2_retire_vld
                                   && !dtu_rtu_ebreak_action
                                   && cbus_retire_ex2_inst_ebreak
                                   && !cbus_retire_ex2_halt_info[`TDT_HINFO_PENDING_HALT];
assign bkpt_req_pending          = retire_ex2_retire_vld
                                   && cbus_retire_ex2_halt_info[`TDT_HINFO_PENDING_HALT]
                                   && !cbus_retire_ex2_halt_info[`TDT_HINFO_ACTION];

assign bkpt_req_trigger_t0       = retire_ex2_retire_vld
                                   && !cbus_retire_ex2_halt_info[`TDT_HINFO_PENDING_HALT]
                                   && cbus_retire_ex2_halt_info[`TDT_HINFO_MATCH]
                                   && !cbus_retire_ex2_halt_info[`TDT_HINFO_CHAIN]
                                   && !cbus_retire_ex2_halt_info[`TDT_HINFO_TIMING]
                                   && !cbus_retire_ex2_halt_info[`TDT_HINFO_ACTION];
//normal bkpt expt includes       ebreak and t0 trigger
assign retire_bkpt_expt          = bkpt_req_ebreak
                                   || bkpt_req_trigger_t0;
//pending bkpt expt has highest priority
assign retire_pending_bkpt_expt  = bkpt_req_pending;

//----------------------------------------------------------
//              Bkpt Expt Request : Timing 1
//----------------------------------------------------------
//cannot ack t1 halt request when:
//1.inst with pending halt or expt
assign bkpt_req_t1_retire_vld_raw = retire_ex2_retire_vld
                                    && !cbus_retire_ex2_halt_info[`TDT_HINFO_PENDING_HALT];
//2.ack t0 halt request
assign bkpt_req_t1_retire_vld     = bkpt_req_t1_retire_vld_raw
                                    && !halt_req;
//Halt Request with Timing 1
assign bkpt_req_trigger_t1_raw    = bkpt_req_t1_retire_vld
                                    && cbus_retire_ex2_halt_info[`TDT_HINFO_MATCH]
                                    && !cbus_retire_ex2_halt_info[`TDT_HINFO_CHAIN]
                                    && cbus_retire_ex2_halt_info[`TDT_HINFO_TIMING]
                                    && !cbus_retire_ex2_halt_info[`TDT_HINFO_ACTION];
// &Force("nonport","veri_retire_bkpt_expt_t1"); @434
//split inst t1 trigger will be buffered and ack in last split inst
assign bkpt_req_trigger_t1        = bkpt_req_trigger_t1_raw
                                    && !cbus_retire_ex2_split_inst
                                    && !cbus_retire_ex2_inst_tail_int;
assign bkpt_req_split_trigger_t1  = bkpt_req_trigger_t1_raw
                                    && (cbus_retire_ex2_split_inst
                                     || cbus_retire_ex2_inst_tail_int);
//buffered split trigger will ack  at non-split inst
assign bkpt_req_buf_split_trigger_t1 = bkpt_req_t1_retire_vld
                                       && bkpt_req_split_trigger_t1_buf
                                       && !cbus_retire_ex2_split_inst
                                       && !cbus_retire_ex2_inst_tail_int;

assign retire_bkpt_expt_t1        = bkpt_req_trigger_t1
                                 || bkpt_req_buf_split_trigger_t1;

assign retire_bkpt_expt_lsu_trigger_t1       = bkpt_req_trigger_t1
                                               && cbus_retire_ex2_halt_info[`TDT_HINFO_LDST];
assign retire_bkpt_expt_split_lsu_trigger_t1 = bkpt_req_buf_split_trigger_t1
                                               && bkpt_req_split_lsu_trigger_buf;

//----------------------------------------------------------
//                    May Debug Signal
//----------------------------------------------------------
//dtu or dm may produce spec fail, signal cbus to stall ex1 inst commit
assign retire_cbus_debug_may_spec_fail = ifu_rtu_reset_halt_req
                                      || dtu_rtu_async_halt_req
                                      || lockup_retire_dbg_vld
                                      || dtu_rtu_resume_req
                                      || cbus_retire_ex2_inst_vld
                                         && (dtu_rtu_sync_halt_req
                                          || dtu_rtu_step_en
                                          || halt_req_split_trigger_t1_buf
                                          || bkpt_req_split_trigger_t1_buf
                                          || dtu_rtu_sync_flush);
//sync (may) debug request should tirgger debug stall
assign retire_sync_debug_may_spec_fail = cbus_retire_ex2_inst_vld
                                         && (dtu_rtu_sync_halt_req
                                          || dtu_rtu_step_en
                                          || halt_req_split_trigger_t1_buf
                                          || bkpt_req_split_trigger_t1_buf
                                          || dtu_rtu_sync_flush);

//----------------------------------------------------------
//                   Debug Sync Flush
//----------------------------------------------------------
//when dtu signal sync flush, rtu should flush when any inst
//retire: include step and icount
assign retire_debug_flush  = retire_ex2_retire_vld
                             && dtu_rtu_sync_flush
                             && !cbus_retire_ex2_split_inst
                             && !cbus_retire_ex2_inst_tail_int
                             && !dbg_mode_on_after_req;

//----------------------------------------------------------
//                     Exit Debug Mode
//----------------------------------------------------------
//exit debug ignore exception:
//execute dret in debug mode should not generate exception
assign retire_exit_debug   = dbg_mode_on_after_req
                             && (dtu_rtu_resume_req
                              || retire_ex2_retire_vld
                                 && cbus_retire_ex2_inst_dret);

//----------------------------------------------------------
//                     Cause Select
//----------------------------------------------------------
//select cause according to priority
//not includes itrigger and etrigger, which fire in 
// &CombBeg; @512
always @( halt_req_trigger_t0
       or halt_req_buf_split_trigger_t1
       or halt_req_pending
       or halt_req_dm_sync
       or lockup_retire_dbg_vld
       or cbus_retire_ex2_halt_info[11:8]
       or halt_req_reset
       or halt_req_ebreak
       or halt_req_trigger_t1
       or halt_req_dm_async)
begin
  if(halt_req_dm_async)
    halt_cause[3:0] = 4'd8;
  else if(halt_req_pending)
    halt_cause[3:0] = cbus_retire_ex2_halt_info[`TDT_HINFO_CAUSE:`TDT_HINFO_CAUSE-3];
  else if(halt_req_trigger_t0
       || halt_req_trigger_t1
       || halt_req_buf_split_trigger_t1)
    halt_cause[3:0] = 4'd2;
  else if(halt_req_ebreak)
    halt_cause[3:0] = 4'd1;
  else if(halt_req_reset)
    halt_cause[3:0] = 4'd5;
  else if(halt_req_dm_sync)
    halt_cause[3:0] = 4'd3;
  else if(lockup_retire_dbg_vld)
    halt_cause[3:0] = 4'd3;
  else //halt_req_step
    halt_cause[3:0] = 4'd4;
// &CombEnd; @531
end

//----------------------------------------------------------
//                       Debug Mode
//----------------------------------------------------------
//debug mode on after request:
//used to mask ifu inst fetch and new halt request
always @ (posedge retire_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dbg_mode_on_after_req <= 1'b0;
  else if (halt_req)
    dbg_mode_on_after_req <= 1'b1;
  else if (retire_exit_debug)
    dbg_mode_on_after_req <= 1'b0;
end

//debug mode on after flush be:
//indicate hart is in halt
always @ (posedge retire_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dbg_mode_on <= 1'b0;
  else if (retire_flush_be && dbg_mode_on_after_req)
    dbg_mode_on <= 1'b1;
  else if (retire_exit_debug)
    dbg_mode_on <= 1'b0;
end

always @ (posedge retire_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    retire_async_flush <= 1'b0;
  else
    retire_async_flush <= halt_req_dm_async;
end

//----------------------------------------------------------
//                Split inst t1 halt info
//----------------------------------------------------------
//if split inst hit t0 trigger, it will ack as normal inst
//if split inst hit t1 trigger, rtu will buffer and merge
//halt info, then ack at last split inst (!split)
//if split inst flush, t1 halt info will be flushed
//chain 1 match will clear/not merge into halt info 
always @ (posedge retire_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    halt_req_split_trigger_t1_buf <= 1'b0;
  else if (retire_flush_be || halt_req_trigger_t1)
    halt_req_split_trigger_t1_buf <= 1'b0;
  else if (halt_req_split_trigger_t1)
    halt_req_split_trigger_t1_buf <= 1'b1;
end

always @ (posedge retire_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    bkpt_req_split_trigger_t1_buf  <= 1'b0;
    bkpt_req_split_lsu_trigger_buf <= 1'b0;
  end
  else if (retire_flush_be || bkpt_req_trigger_t1) begin
    bkpt_req_split_trigger_t1_buf  <= 1'b0;
    bkpt_req_split_lsu_trigger_buf <= 1'b0;
  end
  else if (bkpt_req_split_trigger_t1) begin
    bkpt_req_split_trigger_t1_buf  <= 1'b1;
    bkpt_req_split_lsu_trigger_buf <= cbus_retire_ex2_halt_info[`TDT_HINFO_LDST];
  end
end

always @ (posedge retire_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    retire_buf_split_trigger_t1_halt_info[`TDT_HINFO_WIDTH-1:0] <= {`TDT_HINFO_WIDTH{1'b0}};
  else if (retire_flush_be || halt_req_trigger_t1 || bkpt_req_trigger_t1)
    retire_buf_split_trigger_t1_halt_info[`TDT_HINFO_WIDTH-1:0] <= {`TDT_HINFO_WIDTH{1'b0}};
  else if (halt_req_split_trigger_t1 || bkpt_req_split_trigger_t1)
    retire_buf_split_trigger_t1_halt_info[`TDT_HINFO_WIDTH-1:0] <=
    retire_buf_split_trigger_t1_halt_info[`TDT_HINFO_WIDTH-1:0]
                | cbus_retire_ex2_halt_info[`TDT_HINFO_WIDTH-1:0];
end

//----------------------------------------------------------
//                Retire Halt Info
//----------------------------------------------------------
//if there is buffered split trigger t1 halt/bkpt req
//merge buffered halt info into retired halt info
assign retire_halt_info[`TDT_HINFO_WIDTH-1:0] =
    cbus_retire_ex2_halt_info[`TDT_HINFO_WIDTH-1:0]
  | {`TDT_HINFO_WIDTH{(halt_req_buf_split_trigger_t1
                    || bkpt_req_buf_split_trigger_t1)}}
    & retire_buf_split_trigger_t1_halt_info[`TDT_HINFO_WIDTH-1:0];
// &Force("input", "cbus_retire_ex2_halt_info"); @628
// &Force("bus", "cbus_retire_ex2_halt_info",`TDT_HINFO_WIDTH-1,0); @629
// &Force("input", "cbus_retire_ex2_inst_branch"); @630
// &Force("input", "cbus_retire_ex2_inst_dret"); @631
// &Force("input", "cbus_retire_ex2_inst_ebreak"); @632
// &Force("input", "cbus_retire_ex2_may_debug"); @633
// &Force("input", "lockup_retire_dbg_vld"); @634
// &Force("input", "dtu_rtu_async_halt_req"); @635
// &Force("input", "dtu_rtu_ebreak_action"); @636
// &Force("input", "dtu_rtu_resume_req"); @637
// &Force("input", "dtu_rtu_step_en"); @638
// &Force("input", "dtu_rtu_sync_flush"); @639
// &Force("input", "lsu_rtu_sync_ack"); @640

//==========================================================
//                    Flush Control
//==========================================================
//----------------------------------------------------------
//                      Flush Set
//----------------------------------------------------------
// Flush fe will be set when:
//   1. expt
//   2. flush inst (cannot flush when ack int because of idu ipush sm)
//   3. t1 bkpt expt
//   4. t0 and t1 halt req:
//      halt req will sync with inst retire by itself
assign retire_flush_fe_set = retire_ex2_retire_vld
                             && (retire_expt_inst
                              || retire_nmi_inst
                              || lockup_retire_nmi_vld
                              || cbus_retire_ex2_flush
                                 && !retire_trap_ack_int
                              || retire_bkpt_expt_t1
                              || retire_debug_flush)
                             || halt_req
                             || halt_req_t1;
//pipeline no operation
assign retire_cpu_no_op    = lsu_xx_no_op
                             && iu_xx_no_op
                             && fpu_xx_no_op
                             && rtu_xx_no_op;

//----------------------------------------------------------
//                        Flush FSM
//----------------------------------------------------------
parameter FLUSH_IDLE  = 3'b000;
parameter FLUSH_FE    = 3'b101;
parameter FLUSH_WAIT  = 3'b100;
parameter FLUSH_BE    = 3'b110;
parameter FLUSH_FE_BE = 3'b111;

always @ (posedge retire_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    flush_cur_state[2:0] <= 3'b0;
  else if (halt_req_dm_async)
    flush_cur_state[2:0] <= FLUSH_FE_BE;
  else
    flush_cur_state[2:0] <= flush_next_state[2:0];
end

// &CombBeg; @716
always @( flush_cur_state[2:0]
       or retire_cpu_no_op
       or retire_flush_fe_set)
begin
  case(flush_cur_state[2:0])
  FLUSH_IDLE:
    if (retire_flush_fe_set)
      flush_next_state[2:0] = FLUSH_FE;
    else
      flush_next_state[2:0] = FLUSH_IDLE;
  FLUSH_FE:
    if (retire_cpu_no_op)
      flush_next_state[2:0] = FLUSH_BE;
    else
      flush_next_state[2:0] = FLUSH_WAIT;
  FLUSH_WAIT:
    if (retire_cpu_no_op)
      flush_next_state[2:0] = FLUSH_BE;
    else
      flush_next_state[2:0] = FLUSH_WAIT;
  FLUSH_BE:
    flush_next_state[2:0] = FLUSH_IDLE;
  FLUSH_FE_BE:
    flush_next_state[2:0] = FLUSH_IDLE;
  default:
    flush_next_state[2:0] = FLUSH_IDLE;
  endcase
// &CombEnd; @740
end

assign retire_flush_stall = flush_cur_state[2];
assign retire_flush_fe    = flush_cur_state[0];
assign retire_flush_be    = flush_cur_state[1];
//output
assign retire_top_flush_cur_state[2:0] = flush_cur_state[2:0];

//----------------------------------------------------------
//                       Int Flush
//----------------------------------------------------------
always @ (posedge retire_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    retire_int_flush <= 1'b0;
  else if (retire_flush_be)
    retire_int_flush <= 1'b0;
  else if (retire_trap_vld && retire_expt_inst && retire_trap_ack_int)
    retire_int_flush <= 1'b1;
end

//----------------------------------------------------------
//            Buffer retire info for flush be
//----------------------------------------------------------
always @ (posedge retire_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    retire_buf_trap_vld       <= 1'b0;
    retire_buf_xret_vld       <= 1'b0;
    //retire_buf_sync_trap_vld  <= 1'b0;
    retire_buf_async_trap_vld <= 1'b0;
  end
  else if (retire_ex2_retire_vld) begin
    retire_buf_trap_vld       <= retire_trap_vld;
    retire_buf_xret_vld       <= retire_ex2_retire_normal
                                 && cbus_retire_ex2_inst_mret;
    //retire_buf_sync_trap_vld  <= retire_sync_trap_vld;
    retire_buf_async_trap_vld <= retire_async_trap_vld;
  end
  else if (retire_flush_be) begin
    retire_buf_trap_vld       <= 1'b0;
    retire_buf_xret_vld       <= 1'b0;
    //retire_buf_sync_trap_vld  <= 1'b0;
    retire_buf_async_trap_vld <= 1'b0;
  end
end

//==========================================================
//                         Output
//==========================================================
//----------------------------------------------------------
//                         For XX
//----------------------------------------------------------
assign rtu_yy_xx_flush          = retire_flush_be;
assign rtu_yy_xx_async_flush    = retire_async_flush;
assign rtu_yy_xx_expt_vld       = retire_trap_vld;
assign rtu_yy_xx_tail_int_vld   = retire_tail_int_vld;
assign rtu_yy_xx_expt_int       = retire_int_vld;
assign rtu_yy_xx_expt_vec[11:0] = retire_trap_vec[11:0];
assign rtu_yy_xx_dbgon          = dbg_mode_on;

assign rtu_yy_xx_int_hv         = cbus_retire_ex2_inst_tail_int
                                  ? int_retire_pending_int_hv
                                  : cbus_retire_ex2_int_hv;

// &Force("output", "rtu_xx_no_op"); @807
assign rtu_xx_no_op             = !cbus_retire_ex2_inst_vld;

assign retire_top_dbg_mode_on   = dbg_mode_on_after_req;

//----------------------------------------------------------
//                         For Pad
//----------------------------------------------------------
assign rtu_pad_inst_retire     = retire_ex2_retire_vld;
assign rtu_pad_inst_split      = cbus_retire_ex2_split_inst;
assign rtu_pad_retire_pc[31:0] = cbus_retire_ex2_cur_pc[31:0];
assign rtu_sysio_halted        = dbg_mode_on;

//----------------------------------------------------------
//                         For DTU
//----------------------------------------------------------
//trigger signals
// &CombBeg; @825
always @( halt_req_t1_raw
       or halt_req
       or retire_bkpt_expt_t1
       or halt_req_buf_split_trigger_t1
       or bkpt_req_buf_split_trigger_t1
       or halt_req_t1
       or retire_halt_info[14:0]
       or halt_cause[3:0])
begin
  rtu_dtu_retire_halt_info[`TDT_HINFO_WIDTH-1:0] = retire_halt_info[`TDT_HINFO_WIDTH-1:0];
  if(1'b1) begin
  rtu_dtu_retire_halt_info[`TDT_HINFO_ACTION]       = halt_req    || halt_req_t1;
  rtu_dtu_retire_halt_info[`TDT_HINFO_PENDING_HALT] = halt_req_t1 || retire_bkpt_expt_t1;
  rtu_dtu_retire_halt_info[`TDT_HINFO_ACTION01]     = retire_halt_info[`TDT_HINFO_ACTION01]
                                                      || halt_req_buf_split_trigger_t1
                                                      && bkpt_req_buf_split_trigger_t1
                                                      || retire_bkpt_expt_t1
                                                      && halt_req_t1_raw;
  rtu_dtu_retire_halt_info[`TDT_HINFO_CAUSE:`TDT_HINFO_CAUSE-3] = halt_cause[3:0];
  end
// &CombEnd; @837
end

//halt signals
assign rtu_dtu_dpc[31:0]             = cbus_retire_ex2_cur_pc[31:0];

// &CombBeg; @842
always @( retire_bkpt_expt_split_lsu_trigger_t1
       or cbus_retire_ex2_cur_pc[31:0]
       or lsu_rtu_ex2_tval[31:0]
       or retire_bkpt_expt_lsu_trigger_t1)
begin
  //if load/store mcontrol, update load/store address
  if(retire_bkpt_expt_lsu_trigger_t1)
    rtu_dtu_tval[31:0]               = lsu_rtu_ex2_tval[31:0];
  //if split load/store mcontrol, update 0
  else if(retire_bkpt_expt_split_lsu_trigger_t1)
    rtu_dtu_tval[31:0]               = 32'b0;
  //otherwise update cur pc
  else
    rtu_dtu_tval[31:0]               = cbus_retire_ex2_cur_pc[31:0];
// &CombEnd; @852
end

assign rtu_dtu_halt_ack              = halt_req;
assign rtu_dtu_pending_ack           = halt_req_pending || bkpt_req_pending;

//inst retire and pcfifo
assign rtu_dtu_retire_vld            = retire_ex2_retire_vld
                                       && (retire_flush_fe_set
                                           || !(cbus_retire_ex2_split_inst
                                             || cbus_retire_ex2_inst_tail_int));
assign rtu_dtu_retire_debug_expt_vld = retire_ex2_retire_vld
                                       && dbg_mode_on
                                       && retire_expt_debug;
assign rtu_dtu_retire_mret           = cbus_retire_ex2_inst_mret;
assign rtu_dtu_retire_chgflw         = cbus_retire_ex2_inst_branch;
assign rtu_dtu_retire_next_pc[31:0]  = cbus_retire_ex2_next_pc[31:0];

//----------------------------------------------------------
//                         For IFU
//----------------------------------------------------------
assign rtu_ifu_chgflw_vld       = retire_chgflw_vld;
assign rtu_ifu_flush_fe         = retire_flush_fe;
assign rtu_ifu_chgflw_pc[31:0]  = retire_chgflw_pc[31:0];

assign rtu_ifu_dbg_mask         = dbg_mode_on_after_req;

//----------------------------------------------------------
//                         For CP0
//----------------------------------------------------------
assign rtu_cp0_epc[31:0]        = retire_trap_epc[31:0];
assign rtu_cp0_tval[31:0]       = retire_trap_tval[31:0];
assign rtu_cp0_exit_debug       = retire_exit_debug;
assign rtu_cp0_nmi_vld          = retire_nmi_vld || lockup_retire_nmi_vld;
assign rtu_cp0_bus_error        = lsu_rtu_ex2_bus_err || lsu_rtu_async_expt_vld;
assign rtu_cp0_int_level[7:0]   = cbus_retire_ex2_int_lv[7:0];

//----------------------------------------------------------
//                         For IDU
//----------------------------------------------------------
assign rtu_idu_inst_retire      = retire_ex2_retire_vld;
assign rtu_idu_flush_stall      = retire_flush_stall;
assign rtu_idu_flush_fe         = retire_flush_fe;
assign rtu_idu_late_flush       = retire_int_flush;

//----------------------------------------------------------
//                         For LSU
//----------------------------------------------------------
assign rtu_lsu_expt_ack         = retire_flush_be && retire_buf_trap_vld;
assign rtu_lsu_expt_exit        = retire_flush_be && retire_buf_xret_vld;
//when in debug mode, rtu do not set trap_vld and flush
//so rtu should ack lsu when async inst retire
assign rtu_lsu_async_expt_ack   = dbg_mode_on
                                  ? retire_dbg_mode_async_trap_vld
                                  : retire_flush_be && retire_buf_async_trap_vld;
assign rtu_lsu_inst_retire      = retire_ex2_retire_vld;

//----------------------------------------------------------
//                         For HPCP
//----------------------------------------------------------
assign rtu_hpcp_retire_inst_vld = retire_ex2_retire_vld && !cbus_retire_ex2_split_inst;
//assign rtu_hpcp_retire_pc[31:0] = cbus_retire_ex2_cur_pc[31:0];
//assign rtu_hpcp_int_vld         = retire_int_vld;

//==========================================================
//                          Lockup
//==========================================================
assign retire_lockup_nmi_exit        = cp0_rtu_ex1_mret && cp0_rtu_in_nmi;

assign retire_lockup_dbg_req         = dtu_rtu_sync_halt_req;
assign retire_lockup_expt_vld        = retire_trap_vld
                                       && !retire_int_inst
                                       && !retire_nmi_inst
                                       && retire_trap_vec[11:0] != 12'd3
                                       && retire_trap_vec[11:0] != 12'd11;
assign retire_lockup_retire_vld      = retire_ex2_retire_vld;
assign retire_lockup_retire_pc[31:0] = cbus_retire_ex2_cur_pc[31:0];
assign retire_lockup_dbgon           = dbg_mode_on;

//==========================================================
//                          Stall
//==========================================================
//stall ex2 pipeline and wait for lsu no op or lsu cmplt
assign retire_cbus_flush_stall  = retire_flush_stall;
assign retire_cbus_ex2_stall    = retire_dbg_stall
                               || lsu_rtu_ex2_stall;
assign retire_top_lsu_ex2_stall = lsu_rtu_ex2_stall;

//==========================================================
//                    Gate Clk Cell
//==========================================================
assign retire_clk_en = cbus_retire_ex2_inst_vld
                    || halt_req
                    || retire_exit_debug
                    || retire_flush_fe_set
                    || retire_buf_trap_vld
                    || retire_buf_xret_vld
                    || retire_buf_async_trap_vld
                    || flush_cur_state[2:0] != FLUSH_IDLE
                    || dbg_stall_cur_state[1:0] != STALL_IDLE
                    || retire_async_flush
                    || halt_req_trigger_t1
                    || halt_req_split_trigger_t1
                    || bkpt_req_trigger_t1
                    || bkpt_req_split_trigger_t1
                    || lockup_clk_en;

// &Instance("gated_clk_cell", "x_retire_clk"); @970
gated_clk_cell  x_retire_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (retire_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (retire_clk_en     ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @971
//          .external_en (1'b0), @972
//          .global_en   (cp0_yy_clk_en), @973
//          .module_en   (cp0_rtu_icg_en), @974
//          .local_en    (retire_clk_en), @975
//          .clk_out     (retire_clk)); @976

assign lockup_clk = retire_clk;

// &ModuleEnd; @980
endmodule


