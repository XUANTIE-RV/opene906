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
module pa_rtu_top(
  clic_cpu_int_hv,
  clic_cpu_int_id,
  clic_cpu_int_il,
  clic_cpu_int_priv,
  cp0_rtu_ex1_chgflw_pc,
  cp0_rtu_ex1_chgflw_vld,
  cp0_rtu_ex1_cmplt,
  cp0_rtu_ex1_cmplt_dp,
  cp0_rtu_ex1_dret,
  cp0_rtu_ex1_ebreak,
  cp0_rtu_ex1_expt_inst,
  cp0_rtu_ex1_expt_tval,
  cp0_rtu_ex1_expt_vec,
  cp0_rtu_ex1_flush,
  cp0_rtu_ex1_halt_info,
  cp0_rtu_ex1_inst_len,
  cp0_rtu_ex1_inst_vld,
  cp0_rtu_ex1_ipush_spec_fail,
  cp0_rtu_ex1_mret,
  cp0_rtu_ex1_split_inst,
  cp0_rtu_ex1_tail_fail,
  cp0_rtu_icg_en,
  cp0_rtu_in_expt,
  cp0_rtu_in_nmi,
  cp0_rtu_int_level,
  cp0_rtu_int_mode,
  cp0_rtu_mie,
  cp0_rtu_mnxti_vld,
  cp0_rtu_mpil,
  cp0_rtu_pm_bypass,
  cp0_rtu_tail_int_hv,
  cp0_rtu_tail_int_id,
  cp0_rtu_wb_data,
  cp0_rtu_wb_preg,
  cp0_rtu_wb_vld,
  cp0_rtu_wfe_en,
  cp0_xx_async_expt_en,
  cp0_yy_clk_en,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpurst_b,
  dtu_rtu_async_halt_req,
  dtu_rtu_dpc,
  dtu_rtu_ebreak_action,
  dtu_rtu_int_mask,
  dtu_rtu_pending_tval,
  dtu_rtu_resume_req,
  dtu_rtu_step_en,
  dtu_rtu_sync_flush,
  dtu_rtu_sync_halt_req,
  forever_cpuclk,
  fpu_rtu_fgpr_wb_data,
  fpu_rtu_fgpr_wb_reg,
  fpu_rtu_fgpr_wb_vld,
  fpu_rtu_wb_data,
  fpu_rtu_wb_preg,
  fpu_rtu_wb_vld,
  fpu_xx_no_op,
  idu_yy_xx_tail_ack,
  ifu_rtu_lockup_ack,
  ifu_rtu_reset_halt_req,
  ifu_rtu_warm_up,
  iu_rtu_ex1_bju_branch_inst,
  iu_rtu_ex1_bju_cmplt,
  iu_rtu_ex1_bju_cmplt_dp,
  iu_rtu_ex1_bju_cur_pc,
  iu_rtu_ex1_bju_inst_len,
  iu_rtu_ex1_bju_inst_vld,
  iu_rtu_ex1_bju_split_inst,
  iu_rtu_ex1_cmplt,
  iu_rtu_ex1_cmplt_dp,
  iu_rtu_ex1_inst_len,
  iu_rtu_ex1_inst_vld,
  iu_rtu_ex1_ipop_int_mask,
  iu_rtu_ex1_ipush_mie_en,
  iu_rtu_ex1_ipush_spec_fail,
  iu_rtu_ex1_next_pc,
  iu_rtu_ex1_split_inst,
  iu_rtu_ex1_tail_int_vld,
  iu_rtu_ex2_bju_flush,
  iu_rtu_ex2_bju_next_pc,
  iu_rtu_ex2_bju_next_pc_vld,
  iu_rtu_wb0_data,
  iu_rtu_wb0_preg,
  iu_rtu_wb0_vld,
  iu_xx_no_op,
  lsu_rtu_async_expt_vld,
  lsu_rtu_async_ld_inst,
  lsu_rtu_async_tval,
  lsu_rtu_ex1_cmplt,
  lsu_rtu_ex1_cmplt_dp,
  lsu_rtu_ex1_halt_info,
  lsu_rtu_ex1_inst_len,
  lsu_rtu_ex1_inst_vld,
  lsu_rtu_ex1_ipop_int_mask,
  lsu_rtu_ex1_ipush_spec_inst,
  lsu_rtu_ex1_split_inst,
  lsu_rtu_ex2_bus_err,
  lsu_rtu_ex2_expt_inst,
  lsu_rtu_ex2_expt_vec,
  lsu_rtu_ex2_stall,
  lsu_rtu_ex2_tval,
  lsu_rtu_fgpr_wb_data,
  lsu_rtu_fgpr_wb_reg,
  lsu_rtu_fgpr_wb_vld,
  lsu_rtu_sync_ack,
  lsu_rtu_wb_data,
  lsu_rtu_wb_preg,
  lsu_rtu_wb_vld,
  lsu_xx_no_op,
  pad_yy_icg_scan_en,
  rtu_cp0_bus_error,
  rtu_cp0_epc,
  rtu_cp0_exit_debug,
  rtu_cp0_fp_dirty_vld,
  rtu_cp0_int_level,
  rtu_cp0_lockup_clr,
  rtu_cp0_lockup_vld,
  rtu_cp0_mie_en,
  rtu_cp0_mie_gateclk_en,
  rtu_cp0_mnxti_pending_vld,
  rtu_cp0_nmi_vld,
  rtu_cp0_pending_int_hv,
  rtu_cp0_pending_int_id,
  rtu_cp0_pending_int_level,
  rtu_cp0_tval,
  rtu_cp0_wk_int,
  rtu_dtu_debug_info,
  rtu_dtu_dpc,
  rtu_dtu_halt_ack,
  rtu_dtu_nmi_pending,
  rtu_dtu_pending_ack,
  rtu_dtu_retire_chgflw,
  rtu_dtu_retire_debug_expt_vld,
  rtu_dtu_retire_halt_info,
  rtu_dtu_retire_mret,
  rtu_dtu_retire_next_pc,
  rtu_dtu_retire_vld,
  rtu_dtu_tval,
  rtu_fpu_fgpr_wb_grant,
  rtu_fpu_wb_grant,
  rtu_hpcp_retire_inst_vld,
  rtu_idu_ex1_int_dis_stall_gateclk_req,
  rtu_idu_ex1_int_dis_stall_req,
  rtu_idu_ex2_ipush_spec_inst_expt_vld,
  rtu_idu_ex2_ipush_spec_inst_halt_info_vld,
  rtu_idu_fgpr_wb_data,
  rtu_idu_fgpr_wb_flsu_vld,
  rtu_idu_fgpr_wb_reg,
  rtu_idu_fgpr_wb_vld,
  rtu_idu_flush_fe,
  rtu_idu_flush_stall,
  rtu_idu_id_tail_int_vld,
  rtu_idu_inst_retire,
  rtu_idu_late_flush,
  rtu_idu_wb0_data,
  rtu_idu_wb0_fpu_vld,
  rtu_idu_wb0_preg,
  rtu_idu_wb0_vld,
  rtu_idu_wb1_data,
  rtu_idu_wb1_lsu_vld,
  rtu_idu_wb1_preg,
  rtu_idu_wb1_vld,
  rtu_idu_wb2_data,
  rtu_idu_wb2_preg,
  rtu_idu_wb2_vld,
  rtu_ifu_chgflw_pc,
  rtu_ifu_chgflw_vld,
  rtu_ifu_dbg_mask,
  rtu_ifu_flush_fe,
  rtu_ifu_lockup_expt_vld,
  rtu_ifu_lockup_mask,
  rtu_ifu_lockup_req,
  rtu_iu_bju_ex2_cur_pc,
  rtu_iu_ex1_cmplt_dp_vld,
  rtu_iu_ex1_cmplt_inst_len,
  rtu_iu_ex1_cmplt_split_inst,
  rtu_iu_ex1_cmplt_vld,
  rtu_iu_pending_spec_expt_vld,
  rtu_iu_pending_spec_halt_info_vld,
  rtu_lsu_async_expt_ack,
  rtu_lsu_expt_ack,
  rtu_lsu_expt_exit,
  rtu_lsu_fgpr_wb_data,
  rtu_lsu_fgpr_wb_reg,
  rtu_lsu_fgpr_wb_vld,
  rtu_lsu_inst_retire,
  rtu_lsu_sync_req,
  rtu_lsu_wb1_data,
  rtu_lsu_wb1_lsu_vld,
  rtu_lsu_wb1_preg,
  rtu_pad_inst_retire,
  rtu_pad_inst_split,
  rtu_pad_retire_pc,
  rtu_pad_wb0_data,
  rtu_pad_wb0_preg,
  rtu_pad_wb0_vld,
  rtu_pad_wb1_data,
  rtu_pad_wb1_preg,
  rtu_pad_wb1_vld,
  rtu_pad_wb2_data,
  rtu_pad_wb2_preg,
  rtu_pad_wb2_vld,
  rtu_pad_wb_freg,
  rtu_pad_wb_freg_data,
  rtu_pad_wb_freg_vld,
  rtu_sysio_halted,
  rtu_sysio_lockup_on,
  rtu_xx_ex1_stall,
  rtu_xx_no_op,
  rtu_yy_xx_async_flush,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vec,
  rtu_yy_xx_expt_vld,
  rtu_yy_xx_flush,
  rtu_yy_xx_int_hv,
  rtu_yy_xx_tail_int_vld,
  sysio_rtu_nmi_int,
  sysio_rtu_wk_event
);

// &Ports; @24
input           clic_cpu_int_hv;                          
input   [11:0]  clic_cpu_int_id;                          
input   [7 :0]  clic_cpu_int_il;                          
input   [1 :0]  clic_cpu_int_priv;                        
input   [30:0]  cp0_rtu_ex1_chgflw_pc;                    
input           cp0_rtu_ex1_chgflw_vld;                   
input           cp0_rtu_ex1_cmplt;                        
input           cp0_rtu_ex1_cmplt_dp;                     
input           cp0_rtu_ex1_dret;                         
input           cp0_rtu_ex1_ebreak;                       
input           cp0_rtu_ex1_expt_inst;                    
input   [31:0]  cp0_rtu_ex1_expt_tval;                    
input   [3 :0]  cp0_rtu_ex1_expt_vec;                     
input           cp0_rtu_ex1_flush;                        
input   [14:0]  cp0_rtu_ex1_halt_info;                    
input           cp0_rtu_ex1_inst_len;                     
input           cp0_rtu_ex1_inst_vld;                     
input           cp0_rtu_ex1_ipush_spec_fail;              
input           cp0_rtu_ex1_mret;                         
input           cp0_rtu_ex1_split_inst;                   
input           cp0_rtu_ex1_tail_fail;                    
input           cp0_rtu_icg_en;                           
input           cp0_rtu_in_expt;                          
input           cp0_rtu_in_nmi;                           
input   [7 :0]  cp0_rtu_int_level;                        
input   [1 :0]  cp0_rtu_int_mode;                         
input           cp0_rtu_mie;                              
input           cp0_rtu_mnxti_vld;                        
input   [7 :0]  cp0_rtu_mpil;                             
input   [1 :0]  cp0_rtu_pm_bypass;                        
input           cp0_rtu_tail_int_hv;                      
input   [11:0]  cp0_rtu_tail_int_id;                      
input   [31:0]  cp0_rtu_wb_data;                          
input   [5 :0]  cp0_rtu_wb_preg;                          
input           cp0_rtu_wb_vld;                           
input           cp0_rtu_wfe_en;                           
input           cp0_xx_async_expt_en;                     
input           cp0_yy_clk_en;                            
input           cpurst_b;                                 
input           dtu_rtu_async_halt_req;                   
input   [31:0]  dtu_rtu_dpc;                              
input           dtu_rtu_ebreak_action;                    
input           dtu_rtu_int_mask;                         
input   [31:0]  dtu_rtu_pending_tval;                     
input           dtu_rtu_resume_req;                       
input           dtu_rtu_step_en;                          
input           dtu_rtu_sync_flush;                       
input           dtu_rtu_sync_halt_req;                    
input           forever_cpuclk;                           
input   [31:0]  fpu_rtu_fgpr_wb_data;                     
input   [4 :0]  fpu_rtu_fgpr_wb_reg;                      
input           fpu_rtu_fgpr_wb_vld;                      
input   [31:0]  fpu_rtu_wb_data;                          
input   [5 :0]  fpu_rtu_wb_preg;                          
input           fpu_rtu_wb_vld;                           
input           fpu_xx_no_op;                             
input           idu_yy_xx_tail_ack;                       
input           ifu_rtu_lockup_ack;                       
input           ifu_rtu_reset_halt_req;                   
input           ifu_rtu_warm_up;                          
input           iu_rtu_ex1_bju_branch_inst;               
input           iu_rtu_ex1_bju_cmplt;                     
input           iu_rtu_ex1_bju_cmplt_dp;                  
input   [30:0]  iu_rtu_ex1_bju_cur_pc;                    
input           iu_rtu_ex1_bju_inst_len;                  
input           iu_rtu_ex1_bju_inst_vld;                  
input           iu_rtu_ex1_bju_split_inst;                
input           iu_rtu_ex1_cmplt;                         
input           iu_rtu_ex1_cmplt_dp;                      
input           iu_rtu_ex1_inst_len;                      
input           iu_rtu_ex1_inst_vld;                      
input           iu_rtu_ex1_ipop_int_mask;                 
input           iu_rtu_ex1_ipush_mie_en;                  
input           iu_rtu_ex1_ipush_spec_fail;               
input   [30:0]  iu_rtu_ex1_next_pc;                       
input           iu_rtu_ex1_split_inst;                    
input           iu_rtu_ex1_tail_int_vld;                  
input           iu_rtu_ex2_bju_flush;                     
input   [30:0]  iu_rtu_ex2_bju_next_pc;                   
input           iu_rtu_ex2_bju_next_pc_vld;               
input   [31:0]  iu_rtu_wb0_data;                          
input   [5 :0]  iu_rtu_wb0_preg;                          
input           iu_rtu_wb0_vld;                           
input           iu_xx_no_op;                              
input           lsu_rtu_async_expt_vld;                   
input           lsu_rtu_async_ld_inst;                    
input   [31:0]  lsu_rtu_async_tval;                       
input           lsu_rtu_ex1_cmplt;                        
input           lsu_rtu_ex1_cmplt_dp;                     
input   [14:0]  lsu_rtu_ex1_halt_info;                    
input           lsu_rtu_ex1_inst_len;                     
input           lsu_rtu_ex1_inst_vld;                     
input           lsu_rtu_ex1_ipop_int_mask;                
input           lsu_rtu_ex1_ipush_spec_inst;              
input           lsu_rtu_ex1_split_inst;                   
input           lsu_rtu_ex2_bus_err;                      
input           lsu_rtu_ex2_expt_inst;                    
input   [3 :0]  lsu_rtu_ex2_expt_vec;                     
input           lsu_rtu_ex2_stall;                        
input   [31:0]  lsu_rtu_ex2_tval;                         
input   [31:0]  lsu_rtu_fgpr_wb_data;                     
input   [4 :0]  lsu_rtu_fgpr_wb_reg;                      
input           lsu_rtu_fgpr_wb_vld;                      
input           lsu_rtu_sync_ack;                         
input   [31:0]  lsu_rtu_wb_data;                          
input   [5 :0]  lsu_rtu_wb_preg;                          
input           lsu_rtu_wb_vld;                           
input           lsu_xx_no_op;                             
input           pad_yy_icg_scan_en;                       
input           sysio_rtu_nmi_int;                        
input           sysio_rtu_wk_event;                       
output  [11:0]  cpu_clic_curid;                           
output          cpu_clic_int_exit;                        
output          rtu_cp0_bus_error;                        
output  [31:0]  rtu_cp0_epc;                              
output          rtu_cp0_exit_debug;                       
output          rtu_cp0_fp_dirty_vld;                     
output  [7 :0]  rtu_cp0_int_level;                        
output          rtu_cp0_lockup_clr;                       
output          rtu_cp0_lockup_vld;                       
output          rtu_cp0_mie_en;                           
output          rtu_cp0_mie_gateclk_en;                   
output          rtu_cp0_mnxti_pending_vld;                
output          rtu_cp0_nmi_vld;                          
output          rtu_cp0_pending_int_hv;                   
output  [11:0]  rtu_cp0_pending_int_id;                   
output  [7 :0]  rtu_cp0_pending_int_level;                
output  [31:0]  rtu_cp0_tval;                             
output          rtu_cp0_wk_int;                           
output  [13:0]  rtu_dtu_debug_info;                       
output  [31:0]  rtu_dtu_dpc;                              
output          rtu_dtu_halt_ack;                         
output          rtu_dtu_nmi_pending;                      
output          rtu_dtu_pending_ack;                      
output          rtu_dtu_retire_chgflw;                    
output          rtu_dtu_retire_debug_expt_vld;            
output  [14:0]  rtu_dtu_retire_halt_info;                 
output          rtu_dtu_retire_mret;                      
output  [31:0]  rtu_dtu_retire_next_pc;                   
output          rtu_dtu_retire_vld;                       
output  [31:0]  rtu_dtu_tval;                             
output          rtu_fpu_fgpr_wb_grant;                    
output          rtu_fpu_wb_grant;                         
output          rtu_hpcp_retire_inst_vld;                 
output          rtu_idu_ex1_int_dis_stall_gateclk_req;    
output          rtu_idu_ex1_int_dis_stall_req;            
output          rtu_idu_ex2_ipush_spec_inst_expt_vld;     
output          rtu_idu_ex2_ipush_spec_inst_halt_info_vld; 
output  [31:0]  rtu_idu_fgpr_wb_data;                     
output          rtu_idu_fgpr_wb_flsu_vld;                 
output  [4 :0]  rtu_idu_fgpr_wb_reg;                      
output          rtu_idu_fgpr_wb_vld;                      
output          rtu_idu_flush_fe;                         
output          rtu_idu_flush_stall;                      
output          rtu_idu_id_tail_int_vld;                  
output          rtu_idu_inst_retire;                      
output          rtu_idu_late_flush;                       
output  [31:0]  rtu_idu_wb0_data;                         
output          rtu_idu_wb0_fpu_vld;                      
output  [5 :0]  rtu_idu_wb0_preg;                         
output          rtu_idu_wb0_vld;                          
output  [31:0]  rtu_idu_wb1_data;                         
output          rtu_idu_wb1_lsu_vld;                      
output  [5 :0]  rtu_idu_wb1_preg;                         
output          rtu_idu_wb1_vld;                          
output  [31:0]  rtu_idu_wb2_data;                         
output  [5 :0]  rtu_idu_wb2_preg;                         
output          rtu_idu_wb2_vld;                          
output  [31:0]  rtu_ifu_chgflw_pc;                        
output          rtu_ifu_chgflw_vld;                       
output          rtu_ifu_dbg_mask;                         
output          rtu_ifu_flush_fe;                         
output          rtu_ifu_lockup_expt_vld;                  
output          rtu_ifu_lockup_mask;                      
output          rtu_ifu_lockup_req;                       
output  [31:0]  rtu_iu_bju_ex2_cur_pc;                    
output          rtu_iu_ex1_cmplt_dp_vld;                  
output          rtu_iu_ex1_cmplt_inst_len;                
output          rtu_iu_ex1_cmplt_split_inst;              
output          rtu_iu_ex1_cmplt_vld;                     
output          rtu_iu_pending_spec_expt_vld;             
output          rtu_iu_pending_spec_halt_info_vld;        
output          rtu_lsu_async_expt_ack;                   
output          rtu_lsu_expt_ack;                         
output          rtu_lsu_expt_exit;                        
output  [31:0]  rtu_lsu_fgpr_wb_data;                     
output  [4 :0]  rtu_lsu_fgpr_wb_reg;                      
output          rtu_lsu_fgpr_wb_vld;                      
output          rtu_lsu_inst_retire;                      
output          rtu_lsu_sync_req;                         
output  [31:0]  rtu_lsu_wb1_data;                         
output          rtu_lsu_wb1_lsu_vld;                      
output  [5 :0]  rtu_lsu_wb1_preg;                         
output          rtu_pad_inst_retire;                      
output          rtu_pad_inst_split;                       
output  [31:0]  rtu_pad_retire_pc;                        
output  [31:0]  rtu_pad_wb0_data;                         
output  [5 :0]  rtu_pad_wb0_preg;                         
output          rtu_pad_wb0_vld;                          
output  [31:0]  rtu_pad_wb1_data;                         
output  [5 :0]  rtu_pad_wb1_preg;                         
output          rtu_pad_wb1_vld;                          
output  [31:0]  rtu_pad_wb2_data;                         
output  [5 :0]  rtu_pad_wb2_preg;                         
output          rtu_pad_wb2_vld;                          
output  [4 :0]  rtu_pad_wb_freg;                          
output  [31:0]  rtu_pad_wb_freg_data;                     
output          rtu_pad_wb_freg_vld;                      
output          rtu_sysio_halted;                         
output          rtu_sysio_lockup_on;                      
output          rtu_xx_ex1_stall;                         
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

// &Wires; @26
wire            cbus_int_ex1_split_inst;                  
wire            cbus_int_ipop_int_mask;                   
wire            cbus_int_ipush_mie_en;                    
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
wire            cbus_top_ex2_inst_vld;                    
wire            cbus_top_ex2_uncommit_stall;              
wire            clic_cpu_int_hv;                          
wire    [11:0]  clic_cpu_int_id;                          
wire    [7 :0]  clic_cpu_int_il;                          
wire    [1 :0]  clic_cpu_int_priv;                        
wire    [30:0]  cp0_rtu_ex1_chgflw_pc;                    
wire            cp0_rtu_ex1_chgflw_vld;                   
wire            cp0_rtu_ex1_cmplt;                        
wire            cp0_rtu_ex1_cmplt_dp;                     
wire            cp0_rtu_ex1_dret;                         
wire            cp0_rtu_ex1_ebreak;                       
wire            cp0_rtu_ex1_expt_inst;                    
wire    [31:0]  cp0_rtu_ex1_expt_tval;                    
wire    [3 :0]  cp0_rtu_ex1_expt_vec;                     
wire            cp0_rtu_ex1_flush;                        
wire    [14:0]  cp0_rtu_ex1_halt_info;                    
wire            cp0_rtu_ex1_inst_len;                     
wire            cp0_rtu_ex1_inst_vld;                     
wire            cp0_rtu_ex1_ipush_spec_fail;              
wire            cp0_rtu_ex1_mret;                         
wire            cp0_rtu_ex1_split_inst;                   
wire            cp0_rtu_ex1_tail_fail;                    
wire            cp0_rtu_icg_en;                           
wire            cp0_rtu_in_expt;                          
wire            cp0_rtu_in_nmi;                           
wire    [7 :0]  cp0_rtu_int_level;                        
wire    [1 :0]  cp0_rtu_int_mode;                         
wire            cp0_rtu_mie;                              
wire            cp0_rtu_mnxti_vld;                        
wire    [7 :0]  cp0_rtu_mpil;                             
wire    [1 :0]  cp0_rtu_pm_bypass;                        
wire            cp0_rtu_tail_int_hv;                      
wire    [11:0]  cp0_rtu_tail_int_id;                      
wire    [31:0]  cp0_rtu_wb_data;                          
wire    [5 :0]  cp0_rtu_wb_preg;                          
wire            cp0_rtu_wb_vld;                           
wire            cp0_rtu_wfe_en;                           
wire            cp0_xx_async_expt_en;                     
wire            cp0_yy_clk_en;                            
wire    [11:0]  cpu_clic_curid;                           
wire            cpu_clic_int_exit;                        
wire            cpurst_b;                                 
wire            dtu_rtu_async_halt_req;                   
wire    [31:0]  dtu_rtu_dpc;                              
wire            dtu_rtu_ebreak_action;                    
wire            dtu_rtu_int_mask;                         
wire    [31:0]  dtu_rtu_pending_tval;                     
wire            dtu_rtu_resume_req;                       
wire            dtu_rtu_step_en;                          
wire            dtu_rtu_sync_flush;                       
wire            dtu_rtu_sync_halt_req;                    
wire            forever_cpuclk;                           
wire    [31:0]  fpu_rtu_fgpr_wb_data;                     
wire    [4 :0]  fpu_rtu_fgpr_wb_reg;                      
wire            fpu_rtu_fgpr_wb_vld;                      
wire    [31:0]  fpu_rtu_wb_data;                          
wire    [5 :0]  fpu_rtu_wb_preg;                          
wire            fpu_rtu_wb_vld;                           
wire            fpu_xx_no_op;                             
wire            idu_yy_xx_tail_ack;                       
wire            ifu_rtu_lockup_ack;                       
wire            ifu_rtu_reset_halt_req;                   
wire            ifu_rtu_warm_up;                          
wire            int_cbus_ex1_int_vld;                     
wire            int_cbus_ex1_nmi_req;                     
wire            int_cbus_int_hv;                          
wire            int_lockup_nmi_req;                       
wire            int_retire_pending_int_hv;                
wire            int_top_nmi_req;                          
wire    [11:0]  int_xx_int_id;                            
wire    [7 :0]  int_xx_int_lv;                            
wire            iu_rtu_ex1_bju_branch_inst;               
wire            iu_rtu_ex1_bju_cmplt;                     
wire            iu_rtu_ex1_bju_cmplt_dp;                  
wire    [30:0]  iu_rtu_ex1_bju_cur_pc;                    
wire            iu_rtu_ex1_bju_inst_len;                  
wire            iu_rtu_ex1_bju_inst_vld;                  
wire            iu_rtu_ex1_bju_split_inst;                
wire            iu_rtu_ex1_cmplt;                         
wire            iu_rtu_ex1_cmplt_dp;                      
wire            iu_rtu_ex1_inst_len;                      
wire            iu_rtu_ex1_inst_vld;                      
wire            iu_rtu_ex1_ipop_int_mask;                 
wire            iu_rtu_ex1_ipush_mie_en;                  
wire            iu_rtu_ex1_ipush_spec_fail;               
wire    [30:0]  iu_rtu_ex1_next_pc;                       
wire            iu_rtu_ex1_split_inst;                    
wire            iu_rtu_ex1_tail_int_vld;                  
wire            iu_rtu_ex2_bju_flush;                     
wire    [30:0]  iu_rtu_ex2_bju_next_pc;                   
wire            iu_rtu_ex2_bju_next_pc_vld;               
wire    [31:0]  iu_rtu_wb0_data;                          
wire    [5 :0]  iu_rtu_wb0_preg;                          
wire            iu_rtu_wb0_vld;                           
wire            iu_xx_no_op;                              
wire            lockup_clk;                               
wire            lockup_clk_en;                            
wire            lockup_retire_dbg_vld;                    
wire            lockup_retire_nmi_vld;                    
wire    [2 :0]  lockup_top_cur_st;                        
wire            lsu_rtu_async_expt_vld;                   
wire            lsu_rtu_async_ld_inst;                    
wire    [31:0]  lsu_rtu_async_tval;                       
wire            lsu_rtu_ex1_cmplt;                        
wire            lsu_rtu_ex1_cmplt_dp;                     
wire    [14:0]  lsu_rtu_ex1_halt_info;                    
wire            lsu_rtu_ex1_inst_len;                     
wire            lsu_rtu_ex1_inst_vld;                     
wire            lsu_rtu_ex1_ipop_int_mask;                
wire            lsu_rtu_ex1_ipush_spec_inst;              
wire            lsu_rtu_ex1_split_inst;                   
wire            lsu_rtu_ex2_bus_err;                      
wire            lsu_rtu_ex2_expt_inst;                    
wire    [3 :0]  lsu_rtu_ex2_expt_vec;                     
wire            lsu_rtu_ex2_stall;                        
wire    [31:0]  lsu_rtu_ex2_tval;                         
wire    [31:0]  lsu_rtu_fgpr_wb_data;                     
wire    [4 :0]  lsu_rtu_fgpr_wb_reg;                      
wire            lsu_rtu_fgpr_wb_vld;                      
wire            lsu_rtu_sync_ack;                         
wire    [31:0]  lsu_rtu_wb_data;                          
wire    [5 :0]  lsu_rtu_wb_preg;                          
wire            lsu_rtu_wb_vld;                           
wire            lsu_xx_no_op;                             
wire            pad_yy_icg_scan_en;                       
wire            rbus_top_fpu_wb_stall;                    
wire            rbus_top_iu_wb_stall;                     
wire            retire_cbus_debug_may_spec_fail;          
wire            retire_cbus_ex2_stall;                    
wire            retire_cbus_flush_stall;                  
wire            retire_int_nmi_ack;                       
wire            retire_lockup_dbg_req;                    
wire            retire_lockup_dbgon;                      
wire            retire_lockup_expt_vld;                   
wire            retire_lockup_nmi_exit;                   
wire    [31:0]  retire_lockup_retire_pc;                  
wire            retire_lockup_retire_vld;                 
wire            retire_top_dbg_mode_on;                   
wire            retire_top_dbg_stall;                     
wire    [2 :0]  retire_top_flush_cur_state;               
wire            retire_top_lsu_ex2_stall;                 
wire            retire_xx_ex2_expt_raw;                   
wire            rtu_cp0_bus_error;                        
wire    [31:0]  rtu_cp0_epc;                              
wire            rtu_cp0_exit_debug;                       
wire            rtu_cp0_fp_dirty_vld;                     
wire    [7 :0]  rtu_cp0_int_level;                        
wire            rtu_cp0_lockup_clr;                       
wire            rtu_cp0_lockup_vld;                       
wire            rtu_cp0_mie_en;                           
wire            rtu_cp0_mie_gateclk_en;                   
wire            rtu_cp0_mnxti_pending_vld;                
wire            rtu_cp0_nmi_vld;                          
wire            rtu_cp0_pending_int_hv;                   
wire    [11:0]  rtu_cp0_pending_int_id;                   
wire    [7 :0]  rtu_cp0_pending_int_level;                
wire    [31:0]  rtu_cp0_tval;                             
wire            rtu_cp0_wk_int;                           
wire    [13:0]  rtu_dtu_debug_info;                       
wire    [31:0]  rtu_dtu_dpc;                              
wire            rtu_dtu_halt_ack;                         
wire            rtu_dtu_nmi_pending;                      
wire            rtu_dtu_pending_ack;                      
wire            rtu_dtu_retire_chgflw;                    
wire            rtu_dtu_retire_debug_expt_vld;            
wire    [14:0]  rtu_dtu_retire_halt_info;                 
wire            rtu_dtu_retire_mret;                      
wire    [31:0]  rtu_dtu_retire_next_pc;                   
wire            rtu_dtu_retire_vld;                       
wire    [31:0]  rtu_dtu_tval;                             
wire            rtu_fpu_fgpr_wb_grant;                    
wire            rtu_fpu_wb_grant;                         
wire            rtu_hpcp_retire_inst_vld;                 
wire            rtu_idu_ex1_int_dis_stall_gateclk_req;    
wire            rtu_idu_ex1_int_dis_stall_req;            
wire            rtu_idu_ex2_ipush_spec_inst_expt_vld;     
wire            rtu_idu_ex2_ipush_spec_inst_halt_info_vld; 
wire    [31:0]  rtu_idu_fgpr_wb_data;                     
wire            rtu_idu_fgpr_wb_flsu_vld;                 
wire    [4 :0]  rtu_idu_fgpr_wb_reg;                      
wire            rtu_idu_fgpr_wb_vld;                      
wire            rtu_idu_flush_fe;                         
wire            rtu_idu_flush_stall;                      
wire            rtu_idu_id_tail_int_vld;                  
wire            rtu_idu_inst_retire;                      
wire            rtu_idu_late_flush;                       
wire    [31:0]  rtu_idu_wb0_data;                         
wire            rtu_idu_wb0_fpu_vld;                      
wire    [5 :0]  rtu_idu_wb0_preg;                         
wire            rtu_idu_wb0_vld;                          
wire    [31:0]  rtu_idu_wb1_data;                         
wire            rtu_idu_wb1_lsu_vld;                      
wire    [5 :0]  rtu_idu_wb1_preg;                         
wire            rtu_idu_wb1_vld;                          
wire    [31:0]  rtu_idu_wb2_data;                         
wire    [5 :0]  rtu_idu_wb2_preg;                         
wire            rtu_idu_wb2_vld;                          
wire    [31:0]  rtu_ifu_chgflw_pc;                        
wire            rtu_ifu_chgflw_vld;                       
wire            rtu_ifu_dbg_mask;                         
wire            rtu_ifu_flush_fe;                         
wire            rtu_ifu_lockup_expt_vld;                  
wire            rtu_ifu_lockup_mask;                      
wire            rtu_ifu_lockup_req;                       
wire    [31:0]  rtu_iu_bju_ex2_cur_pc;                    
wire            rtu_iu_ex1_cmplt_dp_vld;                  
wire            rtu_iu_ex1_cmplt_inst_len;                
wire            rtu_iu_ex1_cmplt_split_inst;              
wire            rtu_iu_ex1_cmplt_vld;                     
wire            rtu_iu_pending_spec_expt_vld;             
wire            rtu_iu_pending_spec_halt_info_vld;        
wire            rtu_lsu_async_expt_ack;                   
wire            rtu_lsu_expt_ack;                         
wire            rtu_lsu_expt_exit;                        
wire    [31:0]  rtu_lsu_fgpr_wb_data;                     
wire    [4 :0]  rtu_lsu_fgpr_wb_reg;                      
wire            rtu_lsu_fgpr_wb_vld;                      
wire            rtu_lsu_inst_retire;                      
wire            rtu_lsu_sync_req;                         
wire    [31:0]  rtu_lsu_wb1_data;                         
wire            rtu_lsu_wb1_lsu_vld;                      
wire    [5 :0]  rtu_lsu_wb1_preg;                         
wire            rtu_pad_inst_retire;                      
wire            rtu_pad_inst_split;                       
wire    [31:0]  rtu_pad_retire_pc;                        
wire    [31:0]  rtu_pad_wb0_data;                         
wire    [5 :0]  rtu_pad_wb0_preg;                         
wire            rtu_pad_wb0_vld;                          
wire    [31:0]  rtu_pad_wb1_data;                         
wire    [5 :0]  rtu_pad_wb1_preg;                         
wire            rtu_pad_wb1_vld;                          
wire    [31:0]  rtu_pad_wb2_data;                         
wire    [5 :0]  rtu_pad_wb2_preg;                         
wire            rtu_pad_wb2_vld;                          
wire    [4 :0]  rtu_pad_wb_freg;                          
wire    [31:0]  rtu_pad_wb_freg_data;                     
wire            rtu_pad_wb_freg_vld;                      
wire            rtu_sysio_halted;                         
wire            rtu_sysio_lockup_on;                      
wire            rtu_xx_ex1_stall;                         
wire            rtu_xx_no_op;                             
wire            rtu_yy_xx_async_flush;                    
wire            rtu_yy_xx_dbgon;                          
wire            rtu_yy_xx_expt_int;                       
wire    [11:0]  rtu_yy_xx_expt_vec;                       
wire            rtu_yy_xx_expt_vld;                       
wire            rtu_yy_xx_flush;                          
wire            rtu_yy_xx_int_hv;                         
wire            rtu_yy_xx_tail_int_vld;                   
wire            sysio_rtu_nmi_int;                        
wire            sysio_rtu_wk_event;                       


// &Instance("pa_rtu_retire"); @28
pa_rtu_retire  x_pa_rtu_retire (
  .cbus_retire_ex2_chgflw_vld      (cbus_retire_ex2_chgflw_vld     ),
  .cbus_retire_ex2_cur_pc          (cbus_retire_ex2_cur_pc         ),
  .cbus_retire_ex2_expt_inst       (cbus_retire_ex2_expt_inst      ),
  .cbus_retire_ex2_flush           (cbus_retire_ex2_flush          ),
  .cbus_retire_ex2_halt_info       (cbus_retire_ex2_halt_info      ),
  .cbus_retire_ex2_inst_branch     (cbus_retire_ex2_inst_branch    ),
  .cbus_retire_ex2_inst_dret       (cbus_retire_ex2_inst_dret      ),
  .cbus_retire_ex2_inst_ebreak     (cbus_retire_ex2_inst_ebreak    ),
  .cbus_retire_ex2_inst_int        (cbus_retire_ex2_inst_int       ),
  .cbus_retire_ex2_inst_mret       (cbus_retire_ex2_inst_mret      ),
  .cbus_retire_ex2_inst_nmi        (cbus_retire_ex2_inst_nmi       ),
  .cbus_retire_ex2_inst_tail_int   (cbus_retire_ex2_inst_tail_int  ),
  .cbus_retire_ex2_inst_vld        (cbus_retire_ex2_inst_vld       ),
  .cbus_retire_ex2_int_hv          (cbus_retire_ex2_int_hv         ),
  .cbus_retire_ex2_int_lv          (cbus_retire_ex2_int_lv         ),
  .cbus_retire_ex2_ipop_int_mask   (cbus_retire_ex2_ipop_int_mask  ),
  .cbus_retire_ex2_may_debug       (cbus_retire_ex2_may_debug      ),
  .cbus_retire_ex2_next_pc         (cbus_retire_ex2_next_pc        ),
  .cbus_retire_ex2_split_inst      (cbus_retire_ex2_split_inst     ),
  .cbus_retire_ex2_tail_spec_inst  (cbus_retire_ex2_tail_spec_inst ),
  .cbus_retire_ex2_trap_vec        (cbus_retire_ex2_trap_vec       ),
  .cbus_retire_ex2_tval            (cbus_retire_ex2_tval           ),
  .cp0_rtu_ex1_mret                (cp0_rtu_ex1_mret               ),
  .cp0_rtu_icg_en                  (cp0_rtu_icg_en                 ),
  .cp0_rtu_in_nmi                  (cp0_rtu_in_nmi                 ),
  .cp0_xx_async_expt_en            (cp0_xx_async_expt_en           ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .dtu_rtu_async_halt_req          (dtu_rtu_async_halt_req         ),
  .dtu_rtu_dpc                     (dtu_rtu_dpc                    ),
  .dtu_rtu_ebreak_action           (dtu_rtu_ebreak_action          ),
  .dtu_rtu_pending_tval            (dtu_rtu_pending_tval           ),
  .dtu_rtu_resume_req              (dtu_rtu_resume_req             ),
  .dtu_rtu_step_en                 (dtu_rtu_step_en                ),
  .dtu_rtu_sync_flush              (dtu_rtu_sync_flush             ),
  .dtu_rtu_sync_halt_req           (dtu_rtu_sync_halt_req          ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .fpu_xx_no_op                    (fpu_xx_no_op                   ),
  .ifu_rtu_reset_halt_req          (ifu_rtu_reset_halt_req         ),
  .int_retire_pending_int_hv       (int_retire_pending_int_hv      ),
  .iu_xx_no_op                     (iu_xx_no_op                    ),
  .lockup_clk                      (lockup_clk                     ),
  .lockup_clk_en                   (lockup_clk_en                  ),
  .lockup_retire_dbg_vld           (lockup_retire_dbg_vld          ),
  .lockup_retire_nmi_vld           (lockup_retire_nmi_vld          ),
  .lsu_rtu_async_expt_vld          (lsu_rtu_async_expt_vld         ),
  .lsu_rtu_async_ld_inst           (lsu_rtu_async_ld_inst          ),
  .lsu_rtu_async_tval              (lsu_rtu_async_tval             ),
  .lsu_rtu_ex2_bus_err             (lsu_rtu_ex2_bus_err            ),
  .lsu_rtu_ex2_stall               (lsu_rtu_ex2_stall              ),
  .lsu_rtu_ex2_tval                (lsu_rtu_ex2_tval               ),
  .lsu_rtu_sync_ack                (lsu_rtu_sync_ack               ),
  .lsu_xx_no_op                    (lsu_xx_no_op                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .retire_cbus_debug_may_spec_fail (retire_cbus_debug_may_spec_fail),
  .retire_cbus_ex2_stall           (retire_cbus_ex2_stall          ),
  .retire_cbus_flush_stall         (retire_cbus_flush_stall        ),
  .retire_int_nmi_ack              (retire_int_nmi_ack             ),
  .retire_lockup_dbg_req           (retire_lockup_dbg_req          ),
  .retire_lockup_dbgon             (retire_lockup_dbgon            ),
  .retire_lockup_expt_vld          (retire_lockup_expt_vld         ),
  .retire_lockup_nmi_exit          (retire_lockup_nmi_exit         ),
  .retire_lockup_retire_pc         (retire_lockup_retire_pc        ),
  .retire_lockup_retire_vld        (retire_lockup_retire_vld       ),
  .retire_top_dbg_mode_on          (retire_top_dbg_mode_on         ),
  .retire_top_dbg_stall            (retire_top_dbg_stall           ),
  .retire_top_flush_cur_state      (retire_top_flush_cur_state     ),
  .retire_top_lsu_ex2_stall        (retire_top_lsu_ex2_stall       ),
  .retire_xx_ex2_expt_raw          (retire_xx_ex2_expt_raw         ),
  .rtu_cp0_bus_error               (rtu_cp0_bus_error              ),
  .rtu_cp0_epc                     (rtu_cp0_epc                    ),
  .rtu_cp0_exit_debug              (rtu_cp0_exit_debug             ),
  .rtu_cp0_int_level               (rtu_cp0_int_level              ),
  .rtu_cp0_nmi_vld                 (rtu_cp0_nmi_vld                ),
  .rtu_cp0_tval                    (rtu_cp0_tval                   ),
  .rtu_dtu_dpc                     (rtu_dtu_dpc                    ),
  .rtu_dtu_halt_ack                (rtu_dtu_halt_ack               ),
  .rtu_dtu_pending_ack             (rtu_dtu_pending_ack            ),
  .rtu_dtu_retire_chgflw           (rtu_dtu_retire_chgflw          ),
  .rtu_dtu_retire_debug_expt_vld   (rtu_dtu_retire_debug_expt_vld  ),
  .rtu_dtu_retire_halt_info        (rtu_dtu_retire_halt_info       ),
  .rtu_dtu_retire_mret             (rtu_dtu_retire_mret            ),
  .rtu_dtu_retire_next_pc          (rtu_dtu_retire_next_pc         ),
  .rtu_dtu_retire_vld              (rtu_dtu_retire_vld             ),
  .rtu_dtu_tval                    (rtu_dtu_tval                   ),
  .rtu_hpcp_retire_inst_vld        (rtu_hpcp_retire_inst_vld       ),
  .rtu_idu_flush_fe                (rtu_idu_flush_fe               ),
  .rtu_idu_flush_stall             (rtu_idu_flush_stall            ),
  .rtu_idu_inst_retire             (rtu_idu_inst_retire            ),
  .rtu_idu_late_flush              (rtu_idu_late_flush             ),
  .rtu_ifu_chgflw_pc               (rtu_ifu_chgflw_pc              ),
  .rtu_ifu_chgflw_vld              (rtu_ifu_chgflw_vld             ),
  .rtu_ifu_dbg_mask                (rtu_ifu_dbg_mask               ),
  .rtu_ifu_flush_fe                (rtu_ifu_flush_fe               ),
  .rtu_lsu_async_expt_ack          (rtu_lsu_async_expt_ack         ),
  .rtu_lsu_expt_ack                (rtu_lsu_expt_ack               ),
  .rtu_lsu_expt_exit               (rtu_lsu_expt_exit              ),
  .rtu_lsu_inst_retire             (rtu_lsu_inst_retire            ),
  .rtu_lsu_sync_req                (rtu_lsu_sync_req               ),
  .rtu_pad_inst_retire             (rtu_pad_inst_retire            ),
  .rtu_pad_inst_split              (rtu_pad_inst_split             ),
  .rtu_pad_retire_pc               (rtu_pad_retire_pc              ),
  .rtu_sysio_halted                (rtu_sysio_halted               ),
  .rtu_xx_no_op                    (rtu_xx_no_op                   ),
  .rtu_yy_xx_async_flush           (rtu_yy_xx_async_flush          ),
  .rtu_yy_xx_dbgon                 (rtu_yy_xx_dbgon                ),
  .rtu_yy_xx_expt_int              (rtu_yy_xx_expt_int             ),
  .rtu_yy_xx_expt_vec              (rtu_yy_xx_expt_vec             ),
  .rtu_yy_xx_expt_vld              (rtu_yy_xx_expt_vld             ),
  .rtu_yy_xx_flush                 (rtu_yy_xx_flush                ),
  .rtu_yy_xx_int_hv                (rtu_yy_xx_int_hv               ),
  .rtu_yy_xx_tail_int_vld          (rtu_yy_xx_tail_int_vld         )
);

// &Force("output", "rtu_yy_xx_dbgon"); @29
// &Force("output", "rtu_yy_xx_flush"); @30
// &Force("output", "rtu_yy_xx_expt_int"); @31
// &Force("output", "rtu_yy_xx_expt_vld"); @32
// &Force("output", "rtu_yy_xx_expt_vec"); @33
// &Force("output", "rtu_yy_xx_int_hv"); @34

// &Instance("pa_rtu_cbus"); @36
pa_rtu_cbus  x_pa_rtu_cbus (
  .cbus_int_ex1_split_inst                   (cbus_int_ex1_split_inst                  ),
  .cbus_int_ipop_int_mask                    (cbus_int_ipop_int_mask                   ),
  .cbus_int_ipush_mie_en                     (cbus_int_ipush_mie_en                    ),
  .cbus_retire_ex2_chgflw_vld                (cbus_retire_ex2_chgflw_vld               ),
  .cbus_retire_ex2_cur_pc                    (cbus_retire_ex2_cur_pc                   ),
  .cbus_retire_ex2_expt_inst                 (cbus_retire_ex2_expt_inst                ),
  .cbus_retire_ex2_flush                     (cbus_retire_ex2_flush                    ),
  .cbus_retire_ex2_halt_info                 (cbus_retire_ex2_halt_info                ),
  .cbus_retire_ex2_inst_branch               (cbus_retire_ex2_inst_branch              ),
  .cbus_retire_ex2_inst_dret                 (cbus_retire_ex2_inst_dret                ),
  .cbus_retire_ex2_inst_ebreak               (cbus_retire_ex2_inst_ebreak              ),
  .cbus_retire_ex2_inst_int                  (cbus_retire_ex2_inst_int                 ),
  .cbus_retire_ex2_inst_mret                 (cbus_retire_ex2_inst_mret                ),
  .cbus_retire_ex2_inst_nmi                  (cbus_retire_ex2_inst_nmi                 ),
  .cbus_retire_ex2_inst_tail_int             (cbus_retire_ex2_inst_tail_int            ),
  .cbus_retire_ex2_inst_vld                  (cbus_retire_ex2_inst_vld                 ),
  .cbus_retire_ex2_int_hv                    (cbus_retire_ex2_int_hv                   ),
  .cbus_retire_ex2_int_lv                    (cbus_retire_ex2_int_lv                   ),
  .cbus_retire_ex2_ipop_int_mask             (cbus_retire_ex2_ipop_int_mask            ),
  .cbus_retire_ex2_may_debug                 (cbus_retire_ex2_may_debug                ),
  .cbus_retire_ex2_next_pc                   (cbus_retire_ex2_next_pc                  ),
  .cbus_retire_ex2_split_inst                (cbus_retire_ex2_split_inst               ),
  .cbus_retire_ex2_tail_spec_inst            (cbus_retire_ex2_tail_spec_inst           ),
  .cbus_retire_ex2_trap_vec                  (cbus_retire_ex2_trap_vec                 ),
  .cbus_retire_ex2_tval                      (cbus_retire_ex2_tval                     ),
  .cbus_top_ex2_inst_vld                     (cbus_top_ex2_inst_vld                    ),
  .cbus_top_ex2_uncommit_stall               (cbus_top_ex2_uncommit_stall              ),
  .cp0_rtu_ex1_chgflw_pc                     (cp0_rtu_ex1_chgflw_pc                    ),
  .cp0_rtu_ex1_chgflw_vld                    (cp0_rtu_ex1_chgflw_vld                   ),
  .cp0_rtu_ex1_cmplt                         (cp0_rtu_ex1_cmplt                        ),
  .cp0_rtu_ex1_cmplt_dp                      (cp0_rtu_ex1_cmplt_dp                     ),
  .cp0_rtu_ex1_dret                          (cp0_rtu_ex1_dret                         ),
  .cp0_rtu_ex1_ebreak                        (cp0_rtu_ex1_ebreak                       ),
  .cp0_rtu_ex1_expt_inst                     (cp0_rtu_ex1_expt_inst                    ),
  .cp0_rtu_ex1_expt_tval                     (cp0_rtu_ex1_expt_tval                    ),
  .cp0_rtu_ex1_expt_vec                      (cp0_rtu_ex1_expt_vec                     ),
  .cp0_rtu_ex1_flush                         (cp0_rtu_ex1_flush                        ),
  .cp0_rtu_ex1_halt_info                     (cp0_rtu_ex1_halt_info                    ),
  .cp0_rtu_ex1_inst_len                      (cp0_rtu_ex1_inst_len                     ),
  .cp0_rtu_ex1_inst_vld                      (cp0_rtu_ex1_inst_vld                     ),
  .cp0_rtu_ex1_ipush_spec_fail               (cp0_rtu_ex1_ipush_spec_fail              ),
  .cp0_rtu_ex1_mret                          (cp0_rtu_ex1_mret                         ),
  .cp0_rtu_ex1_split_inst                    (cp0_rtu_ex1_split_inst                   ),
  .cp0_rtu_ex1_tail_fail                     (cp0_rtu_ex1_tail_fail                    ),
  .cp0_rtu_icg_en                            (cp0_rtu_icg_en                           ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cpurst_b                                  (cpurst_b                                 ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .ifu_rtu_warm_up                           (ifu_rtu_warm_up                          ),
  .int_cbus_ex1_int_vld                      (int_cbus_ex1_int_vld                     ),
  .int_cbus_ex1_nmi_req                      (int_cbus_ex1_nmi_req                     ),
  .int_cbus_int_hv                           (int_cbus_int_hv                          ),
  .int_xx_int_id                             (int_xx_int_id                            ),
  .int_xx_int_lv                             (int_xx_int_lv                            ),
  .iu_rtu_ex1_bju_branch_inst                (iu_rtu_ex1_bju_branch_inst               ),
  .iu_rtu_ex1_bju_cmplt                      (iu_rtu_ex1_bju_cmplt                     ),
  .iu_rtu_ex1_bju_cmplt_dp                   (iu_rtu_ex1_bju_cmplt_dp                  ),
  .iu_rtu_ex1_bju_cur_pc                     (iu_rtu_ex1_bju_cur_pc                    ),
  .iu_rtu_ex1_bju_inst_len                   (iu_rtu_ex1_bju_inst_len                  ),
  .iu_rtu_ex1_bju_inst_vld                   (iu_rtu_ex1_bju_inst_vld                  ),
  .iu_rtu_ex1_bju_split_inst                 (iu_rtu_ex1_bju_split_inst                ),
  .iu_rtu_ex1_cmplt                          (iu_rtu_ex1_cmplt                         ),
  .iu_rtu_ex1_cmplt_dp                       (iu_rtu_ex1_cmplt_dp                      ),
  .iu_rtu_ex1_inst_len                       (iu_rtu_ex1_inst_len                      ),
  .iu_rtu_ex1_inst_vld                       (iu_rtu_ex1_inst_vld                      ),
  .iu_rtu_ex1_ipop_int_mask                  (iu_rtu_ex1_ipop_int_mask                 ),
  .iu_rtu_ex1_ipush_mie_en                   (iu_rtu_ex1_ipush_mie_en                  ),
  .iu_rtu_ex1_ipush_spec_fail                (iu_rtu_ex1_ipush_spec_fail               ),
  .iu_rtu_ex1_next_pc                        (iu_rtu_ex1_next_pc                       ),
  .iu_rtu_ex1_split_inst                     (iu_rtu_ex1_split_inst                    ),
  .iu_rtu_ex1_tail_int_vld                   (iu_rtu_ex1_tail_int_vld                  ),
  .iu_rtu_ex2_bju_flush                      (iu_rtu_ex2_bju_flush                     ),
  .iu_rtu_ex2_bju_next_pc                    (iu_rtu_ex2_bju_next_pc                   ),
  .iu_rtu_ex2_bju_next_pc_vld                (iu_rtu_ex2_bju_next_pc_vld               ),
  .lsu_rtu_async_expt_vld                    (lsu_rtu_async_expt_vld                   ),
  .lsu_rtu_ex1_cmplt                         (lsu_rtu_ex1_cmplt                        ),
  .lsu_rtu_ex1_cmplt_dp                      (lsu_rtu_ex1_cmplt_dp                     ),
  .lsu_rtu_ex1_halt_info                     (lsu_rtu_ex1_halt_info                    ),
  .lsu_rtu_ex1_inst_len                      (lsu_rtu_ex1_inst_len                     ),
  .lsu_rtu_ex1_inst_vld                      (lsu_rtu_ex1_inst_vld                     ),
  .lsu_rtu_ex1_ipop_int_mask                 (lsu_rtu_ex1_ipop_int_mask                ),
  .lsu_rtu_ex1_ipush_spec_inst               (lsu_rtu_ex1_ipush_spec_inst              ),
  .lsu_rtu_ex1_split_inst                    (lsu_rtu_ex1_split_inst                   ),
  .lsu_rtu_ex2_expt_inst                     (lsu_rtu_ex2_expt_inst                    ),
  .lsu_rtu_ex2_expt_vec                      (lsu_rtu_ex2_expt_vec                     ),
  .lsu_rtu_ex2_tval                          (lsu_rtu_ex2_tval                         ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .retire_cbus_debug_may_spec_fail           (retire_cbus_debug_may_spec_fail          ),
  .retire_cbus_ex2_stall                     (retire_cbus_ex2_stall                    ),
  .retire_cbus_flush_stall                   (retire_cbus_flush_stall                  ),
  .rtu_cp0_mie_en                            (rtu_cp0_mie_en                           ),
  .rtu_cp0_mie_gateclk_en                    (rtu_cp0_mie_gateclk_en                   ),
  .rtu_idu_ex1_int_dis_stall_gateclk_req     (rtu_idu_ex1_int_dis_stall_gateclk_req    ),
  .rtu_idu_ex1_int_dis_stall_req             (rtu_idu_ex1_int_dis_stall_req            ),
  .rtu_idu_ex2_ipush_spec_inst_expt_vld      (rtu_idu_ex2_ipush_spec_inst_expt_vld     ),
  .rtu_idu_ex2_ipush_spec_inst_halt_info_vld (rtu_idu_ex2_ipush_spec_inst_halt_info_vld),
  .rtu_iu_bju_ex2_cur_pc                     (rtu_iu_bju_ex2_cur_pc                    ),
  .rtu_iu_ex1_cmplt_dp_vld                   (rtu_iu_ex1_cmplt_dp_vld                  ),
  .rtu_iu_ex1_cmplt_inst_len                 (rtu_iu_ex1_cmplt_inst_len                ),
  .rtu_iu_ex1_cmplt_split_inst               (rtu_iu_ex1_cmplt_split_inst              ),
  .rtu_iu_ex1_cmplt_vld                      (rtu_iu_ex1_cmplt_vld                     ),
  .rtu_iu_pending_spec_expt_vld              (rtu_iu_pending_spec_expt_vld             ),
  .rtu_iu_pending_spec_halt_info_vld         (rtu_iu_pending_spec_halt_info_vld        ),
  .rtu_xx_ex1_stall                          (rtu_xx_ex1_stall                         ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          )
);


// &Instance("pa_rtu_rbus"); @38
pa_rtu_rbus  x_pa_rtu_rbus (
  .cp0_rtu_icg_en           (cp0_rtu_icg_en          ),
  .cp0_rtu_wb_data          (cp0_rtu_wb_data         ),
  .cp0_rtu_wb_preg          (cp0_rtu_wb_preg         ),
  .cp0_rtu_wb_vld           (cp0_rtu_wb_vld          ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .fpu_rtu_fgpr_wb_data     (fpu_rtu_fgpr_wb_data    ),
  .fpu_rtu_fgpr_wb_reg      (fpu_rtu_fgpr_wb_reg     ),
  .fpu_rtu_fgpr_wb_vld      (fpu_rtu_fgpr_wb_vld     ),
  .fpu_rtu_wb_data          (fpu_rtu_wb_data         ),
  .fpu_rtu_wb_preg          (fpu_rtu_wb_preg         ),
  .fpu_rtu_wb_vld           (fpu_rtu_wb_vld          ),
  .ifu_rtu_warm_up          (ifu_rtu_warm_up         ),
  .iu_rtu_wb0_data          (iu_rtu_wb0_data         ),
  .iu_rtu_wb0_preg          (iu_rtu_wb0_preg         ),
  .iu_rtu_wb0_vld           (iu_rtu_wb0_vld          ),
  .lsu_rtu_fgpr_wb_data     (lsu_rtu_fgpr_wb_data    ),
  .lsu_rtu_fgpr_wb_reg      (lsu_rtu_fgpr_wb_reg     ),
  .lsu_rtu_fgpr_wb_vld      (lsu_rtu_fgpr_wb_vld     ),
  .lsu_rtu_wb_data          (lsu_rtu_wb_data         ),
  .lsu_rtu_wb_preg          (lsu_rtu_wb_preg         ),
  .lsu_rtu_wb_vld           (lsu_rtu_wb_vld          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .rbus_top_fpu_wb_stall    (rbus_top_fpu_wb_stall   ),
  .rbus_top_iu_wb_stall     (rbus_top_iu_wb_stall    ),
  .rtu_cp0_fp_dirty_vld     (rtu_cp0_fp_dirty_vld    ),
  .rtu_fpu_fgpr_wb_grant    (rtu_fpu_fgpr_wb_grant   ),
  .rtu_fpu_wb_grant         (rtu_fpu_wb_grant        ),
  .rtu_idu_fgpr_wb_data     (rtu_idu_fgpr_wb_data    ),
  .rtu_idu_fgpr_wb_flsu_vld (rtu_idu_fgpr_wb_flsu_vld),
  .rtu_idu_fgpr_wb_reg      (rtu_idu_fgpr_wb_reg     ),
  .rtu_idu_fgpr_wb_vld      (rtu_idu_fgpr_wb_vld     ),
  .rtu_idu_wb0_data         (rtu_idu_wb0_data        ),
  .rtu_idu_wb0_fpu_vld      (rtu_idu_wb0_fpu_vld     ),
  .rtu_idu_wb0_preg         (rtu_idu_wb0_preg        ),
  .rtu_idu_wb0_vld          (rtu_idu_wb0_vld         ),
  .rtu_idu_wb1_data         (rtu_idu_wb1_data        ),
  .rtu_idu_wb1_lsu_vld      (rtu_idu_wb1_lsu_vld     ),
  .rtu_idu_wb1_preg         (rtu_idu_wb1_preg        ),
  .rtu_idu_wb1_vld          (rtu_idu_wb1_vld         ),
  .rtu_idu_wb2_data         (rtu_idu_wb2_data        ),
  .rtu_idu_wb2_preg         (rtu_idu_wb2_preg        ),
  .rtu_idu_wb2_vld          (rtu_idu_wb2_vld         ),
  .rtu_lsu_fgpr_wb_data     (rtu_lsu_fgpr_wb_data    ),
  .rtu_lsu_fgpr_wb_reg      (rtu_lsu_fgpr_wb_reg     ),
  .rtu_lsu_fgpr_wb_vld      (rtu_lsu_fgpr_wb_vld     ),
  .rtu_lsu_wb1_data         (rtu_lsu_wb1_data        ),
  .rtu_lsu_wb1_lsu_vld      (rtu_lsu_wb1_lsu_vld     ),
  .rtu_lsu_wb1_preg         (rtu_lsu_wb1_preg        ),
  .rtu_pad_wb0_data         (rtu_pad_wb0_data        ),
  .rtu_pad_wb0_preg         (rtu_pad_wb0_preg        ),
  .rtu_pad_wb0_vld          (rtu_pad_wb0_vld         ),
  .rtu_pad_wb1_data         (rtu_pad_wb1_data        ),
  .rtu_pad_wb1_preg         (rtu_pad_wb1_preg        ),
  .rtu_pad_wb1_vld          (rtu_pad_wb1_vld         ),
  .rtu_pad_wb2_data         (rtu_pad_wb2_data        ),
  .rtu_pad_wb2_preg         (rtu_pad_wb2_preg        ),
  .rtu_pad_wb2_vld          (rtu_pad_wb2_vld         ),
  .rtu_pad_wb_freg          (rtu_pad_wb_freg         ),
  .rtu_pad_wb_freg_data     (rtu_pad_wb_freg_data    ),
  .rtu_pad_wb_freg_vld      (rtu_pad_wb_freg_vld     )
);


// &Instance("pa_rtu_int"); @40
pa_rtu_int  x_pa_rtu_int (
  .cbus_int_ex1_split_inst   (cbus_int_ex1_split_inst  ),
  .cbus_int_ipop_int_mask    (cbus_int_ipop_int_mask   ),
  .cbus_int_ipush_mie_en     (cbus_int_ipush_mie_en    ),
  .clic_cpu_int_hv           (clic_cpu_int_hv          ),
  .clic_cpu_int_id           (clic_cpu_int_id          ),
  .clic_cpu_int_il           (clic_cpu_int_il          ),
  .clic_cpu_int_priv         (clic_cpu_int_priv        ),
  .cp0_rtu_ex1_mret          (cp0_rtu_ex1_mret         ),
  .cp0_rtu_icg_en            (cp0_rtu_icg_en           ),
  .cp0_rtu_in_nmi            (cp0_rtu_in_nmi           ),
  .cp0_rtu_int_level         (cp0_rtu_int_level        ),
  .cp0_rtu_int_mode          (cp0_rtu_int_mode         ),
  .cp0_rtu_mie               (cp0_rtu_mie              ),
  .cp0_rtu_mnxti_vld         (cp0_rtu_mnxti_vld        ),
  .cp0_rtu_mpil              (cp0_rtu_mpil             ),
  .cp0_rtu_pm_bypass         (cp0_rtu_pm_bypass        ),
  .cp0_rtu_tail_int_hv       (cp0_rtu_tail_int_hv      ),
  .cp0_rtu_tail_int_id       (cp0_rtu_tail_int_id      ),
  .cp0_rtu_wfe_en            (cp0_rtu_wfe_en           ),
  .cpu_clic_curid            (cpu_clic_curid           ),
  .cpu_clic_int_exit         (cpu_clic_int_exit        ),
  .cpurst_b                  (cpurst_b                 ),
  .dtu_rtu_int_mask          (dtu_rtu_int_mask         ),
  .forever_cpuclk            (forever_cpuclk           ),
  .idu_yy_xx_tail_ack        (idu_yy_xx_tail_ack       ),
  .int_cbus_ex1_int_vld      (int_cbus_ex1_int_vld     ),
  .int_cbus_ex1_nmi_req      (int_cbus_ex1_nmi_req     ),
  .int_cbus_int_hv           (int_cbus_int_hv          ),
  .int_lockup_nmi_req        (int_lockup_nmi_req       ),
  .int_retire_pending_int_hv (int_retire_pending_int_hv),
  .int_top_nmi_req           (int_top_nmi_req          ),
  .int_xx_int_id             (int_xx_int_id            ),
  .int_xx_int_lv             (int_xx_int_lv            ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .retire_int_nmi_ack        (retire_int_nmi_ack       ),
  .retire_xx_ex2_expt_raw    (retire_xx_ex2_expt_raw   ),
  .rtu_cp0_mnxti_pending_vld (rtu_cp0_mnxti_pending_vld),
  .rtu_cp0_pending_int_hv    (rtu_cp0_pending_int_hv   ),
  .rtu_cp0_pending_int_id    (rtu_cp0_pending_int_id   ),
  .rtu_cp0_pending_int_level (rtu_cp0_pending_int_level),
  .rtu_cp0_wk_int            (rtu_cp0_wk_int           ),
  .rtu_dtu_nmi_pending       (rtu_dtu_nmi_pending      ),
  .rtu_idu_id_tail_int_vld   (rtu_idu_id_tail_int_vld  ),
  .rtu_yy_xx_expt_int        (rtu_yy_xx_expt_int       ),
  .rtu_yy_xx_expt_vec        (rtu_yy_xx_expt_vec       ),
  .rtu_yy_xx_expt_vld        (rtu_yy_xx_expt_vld       ),
  .rtu_yy_xx_int_hv          (rtu_yy_xx_int_hv         ),
  .sysio_rtu_nmi_int         (sysio_rtu_nmi_int        ),
  .sysio_rtu_wk_event        (sysio_rtu_wk_event       )
);


// &Instance("pa_rtu_lockup"); @42
pa_rtu_lockup  x_pa_rtu_lockup (
  .cp0_rtu_in_expt          (cp0_rtu_in_expt         ),
  .cp0_rtu_in_nmi           (cp0_rtu_in_nmi          ),
  .cpurst_b                 (cpurst_b                ),
  .ifu_rtu_lockup_ack       (ifu_rtu_lockup_ack      ),
  .int_lockup_nmi_req       (int_lockup_nmi_req      ),
  .lockup_clk               (lockup_clk              ),
  .lockup_clk_en            (lockup_clk_en           ),
  .lockup_retire_dbg_vld    (lockup_retire_dbg_vld   ),
  .lockup_retire_nmi_vld    (lockup_retire_nmi_vld   ),
  .lockup_top_cur_st        (lockup_top_cur_st       ),
  .retire_lockup_dbg_req    (retire_lockup_dbg_req   ),
  .retire_lockup_dbgon      (retire_lockup_dbgon     ),
  .retire_lockup_expt_vld   (retire_lockup_expt_vld  ),
  .retire_lockup_nmi_exit   (retire_lockup_nmi_exit  ),
  .retire_lockup_retire_pc  (retire_lockup_retire_pc ),
  .retire_lockup_retire_vld (retire_lockup_retire_vld),
  .rtu_cp0_lockup_clr       (rtu_cp0_lockup_clr      ),
  .rtu_cp0_lockup_vld       (rtu_cp0_lockup_vld      ),
  .rtu_ifu_lockup_expt_vld  (rtu_ifu_lockup_expt_vld ),
  .rtu_ifu_lockup_mask      (rtu_ifu_lockup_mask     ),
  .rtu_ifu_lockup_req       (rtu_ifu_lockup_req      ),
  .rtu_sysio_lockup_on      (rtu_sysio_lockup_on     )
);


assign rtu_dtu_debug_info[13:0] = {
         int_top_nmi_req,
         lockup_top_cur_st[2:0],
         rbus_top_fpu_wb_stall,
         rbus_top_iu_wb_stall,
         cbus_top_ex2_uncommit_stall,
         cbus_top_ex2_inst_vld,
         retire_top_flush_cur_state[2:0],
         retire_top_dbg_stall,
         retire_top_dbg_mode_on,
         retire_top_lsu_ex2_stall
       };


// &ModuleEnd; @58
endmodule


