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

// &Depend("cpu_cfig.h"); @23

// &ModuleBeg; @25
module pa_core(
  bmu_ifu_acc_err,
  bmu_ifu_grant,
  bmu_ifu_rdata,
  bmu_ifu_trans_cmplt,
  bmu_lsu_acc_err,
  bmu_lsu_grant,
  bmu_lsu_rdata,
  bmu_lsu_trans_cmplt,
  clic_cpu_int_hv,
  clic_cpu_int_id,
  clic_cpu_int_il,
  clic_cpu_int_priv,
  cp0_biu_icg_en,
  cp0_dtu_addr,
  cp0_dtu_debug_info,
  cp0_dtu_icg_en,
  cp0_dtu_int_id,
  cp0_dtu_mexpt_vld,
  cp0_dtu_pcfifo_frz,
  cp0_dtu_rreg,
  cp0_dtu_wdata,
  cp0_dtu_wreg,
  cp0_hpcp_icg_en,
  cp0_hpcp_index,
  cp0_hpcp_pmdm,
  cp0_hpcp_pmdu,
  cp0_hpcp_wdata,
  cp0_hpcp_wreg,
  cp0_pad_mcause,
  cp0_pad_mintstatus,
  cp0_pad_mstatus,
  cp0_pmp_csr_sel,
  cp0_pmp_csr_wen,
  cp0_pmp_icg_en,
  cp0_pmp_mstatus_mpp,
  cp0_pmp_mstatus_mprv,
  cp0_pmp_updt_data,
  cp0_sysio_ipend_b,
  cp0_sysio_lpmd_b,
  cp0_sysio_srst,
  cp0_yy_clk_en,
  cp0_yy_mach_mode,
  cp0_yy_priv_mode,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpurst_b,
  dtu_cp0_dcsr_mprven,
  dtu_cp0_dcsr_prv,
  dtu_cp0_rdata,
  dtu_cp0_wake_up,
  dtu_ifu_debug_inst,
  dtu_ifu_debug_inst_vld,
  dtu_ifu_halt_info0,
  dtu_ifu_halt_info1,
  dtu_ifu_halt_info_vld,
  dtu_ifu_halt_on_reset,
  dtu_lsu_addr_trig_en,
  dtu_lsu_data_trig_en,
  dtu_lsu_halt_info,
  dtu_lsu_halt_info_vld,
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
  fpu_dtu_debug_info,
  hpcp_cp0_data,
  idu_dtu_debug_info,
  idu_dtu_fpr_info,
  idu_yy_xx_tail_ack,
  ifu_bmu_acc_deny,
  ifu_bmu_addr,
  ifu_bmu_burst,
  ifu_bmu_data_req,
  ifu_bmu_prot,
  ifu_bmu_req,
  ifu_bmu_seq,
  ifu_bmu_size,
  ifu_clic_warm_up,
  ifu_dtu_addr_vld0,
  ifu_dtu_addr_vld1,
  ifu_dtu_data_vld0,
  ifu_dtu_data_vld1,
  ifu_dtu_debug_info,
  ifu_dtu_exe_addr0,
  ifu_dtu_exe_addr1,
  ifu_dtu_exe_data0,
  ifu_dtu_exe_data1,
  ifu_hpcp_icache_access,
  ifu_hpcp_icache_miss,
  ifu_pmp_addr,
  ifu_pmp_machine_mode,
  ifu_sysmap_pa,
  ifu_sysmap_rst_sample,
  iu_dtu_debug_info,
  iu_hpcp_inst_bht_mispred,
  iu_hpcp_inst_condbr,
  iu_hpcp_inst_condbr_gate,
  lsu_biu_amo_pmp_deny,
  lsu_biu_async_expt_ack,
  lsu_bmu_acc_deny,
  lsu_bmu_addr,
  lsu_bmu_burst,
  lsu_bmu_lock,
  lsu_bmu_lrsc,
  lsu_bmu_prot,
  lsu_bmu_req,
  lsu_bmu_req_dp,
  lsu_bmu_seq,
  lsu_bmu_size,
  lsu_bmu_wdata,
  lsu_bmu_write,
  lsu_dtu_debug_info,
  lsu_dtu_halt_info,
  lsu_dtu_last_check,
  lsu_dtu_ldst_addr,
  lsu_dtu_ldst_addr_vld,
  lsu_dtu_ldst_bytes_vld,
  lsu_dtu_ldst_data,
  lsu_dtu_ldst_data_vld,
  lsu_dtu_ldst_type,
  lsu_dtu_mem_access_size,
  lsu_hpcp_cache_read_access,
  lsu_hpcp_cache_read_access_gate,
  lsu_hpcp_cache_read_miss,
  lsu_hpcp_cache_read_miss_gate,
  lsu_hpcp_cache_write_access,
  lsu_hpcp_cache_write_access_gate,
  lsu_hpcp_cache_write_miss,
  lsu_hpcp_cache_write_miss_gate,
  lsu_hpcp_inst_store,
  lsu_hpcp_inst_store_gate,
  lsu_pmp_addr,
  lsu_pmp_write,
  lsu_sysmap_pa,
  lsu_xx_flush,
  lsu_xx_warm_up,
  pad_yy_icg_scan_en,
  pmp_cp0_data,
  pmp_ifu_acc_deny,
  pmp_lsu_acc_deny,
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
  rtu_hpcp_retire_inst_vld,
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
  rtu_yy_xx_async_flush,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vec,
  rtu_yy_xx_expt_vld,
  sysio_cp0_clk_en,
  sysio_cp0_clkratio,
  sysio_cp0_rst_addr,
  sysio_ifu_rst_addr,
  sysio_ifu_rst_addr_done,
  sysio_iu_rst_addr,
  sysio_rtu_nmi_int,
  sysio_rtu_wk_event,
  sysio_xx_halt_req,
  sysmap_ifu_flg,
  sysmap_lsu_flg,
  tcip_cp0_clic_base
);

// &Ports; @26
input           bmu_ifu_acc_err;                          
input           bmu_ifu_grant;                            
input   [31:0]  bmu_ifu_rdata;                            
input           bmu_ifu_trans_cmplt;                      
input           bmu_lsu_acc_err;                          
input           bmu_lsu_grant;                            
input   [31:0]  bmu_lsu_rdata;                            
input           bmu_lsu_trans_cmplt;                      
input           clic_cpu_int_hv;                          
input   [11:0]  clic_cpu_int_id;                          
input   [7 :0]  clic_cpu_int_il;                          
input   [1 :0]  clic_cpu_int_priv;                        
input           cpurst_b;                                 
input           dtu_cp0_dcsr_mprven;                      
input   [1 :0]  dtu_cp0_dcsr_prv;                         
input   [31:0]  dtu_cp0_rdata;                            
input           dtu_cp0_wake_up;                          
input   [31:0]  dtu_ifu_debug_inst;                       
input           dtu_ifu_debug_inst_vld;                   
input   [14:0]  dtu_ifu_halt_info0;                       
input   [14:0]  dtu_ifu_halt_info1;                       
input           dtu_ifu_halt_info_vld;                    
input           dtu_ifu_halt_on_reset;                    
input           dtu_lsu_addr_trig_en;                     
input           dtu_lsu_data_trig_en;                     
input   [14:0]  dtu_lsu_halt_info;                        
input           dtu_lsu_halt_info_vld;                    
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
input   [31:0]  hpcp_cp0_data;                            
input           pad_yy_icg_scan_en;                       
input   [31:0]  pmp_cp0_data;                             
input           pmp_ifu_acc_deny;                         
input           pmp_lsu_acc_deny;                         
input           sysio_cp0_clk_en;                         
input   [2 :0]  sysio_cp0_clkratio;                       
input   [31:0]  sysio_cp0_rst_addr;                       
input   [31:0]  sysio_ifu_rst_addr;                       
input           sysio_ifu_rst_addr_done;                  
input   [31:0]  sysio_iu_rst_addr;                        
input           sysio_rtu_nmi_int;                        
input           sysio_rtu_wk_event;                       
input           sysio_xx_halt_req;                        
input   [4 :0]  sysmap_ifu_flg;                           
input   [4 :0]  sysmap_lsu_flg;                           
input   [31:0]  tcip_cp0_clic_base;                       
output          cp0_biu_icg_en;                           
output  [11:0]  cp0_dtu_addr;                             
output  [5 :0]  cp0_dtu_debug_info;                       
output          cp0_dtu_icg_en;                           
output  [11:0]  cp0_dtu_int_id;                           
output          cp0_dtu_mexpt_vld;                        
output          cp0_dtu_pcfifo_frz;                       
output          cp0_dtu_rreg;                             
output  [31:0]  cp0_dtu_wdata;                            
output          cp0_dtu_wreg;                             
output          cp0_hpcp_icg_en;                          
output  [11:0]  cp0_hpcp_index;                           
output          cp0_hpcp_pmdm;                            
output          cp0_hpcp_pmdu;                            
output  [31:0]  cp0_hpcp_wdata;                           
output          cp0_hpcp_wreg;                            
output  [31:0]  cp0_pad_mcause;                           
output  [31:0]  cp0_pad_mintstatus;                       
output  [31:0]  cp0_pad_mstatus;                          
output  [19:0]  cp0_pmp_csr_sel;                          
output          cp0_pmp_csr_wen;                          
output          cp0_pmp_icg_en;                           
output  [1 :0]  cp0_pmp_mstatus_mpp;                      
output          cp0_pmp_mstatus_mprv;                     
output  [31:0]  cp0_pmp_updt_data;                        
output          cp0_sysio_ipend_b;                        
output  [1 :0]  cp0_sysio_lpmd_b;                         
output  [1 :0]  cp0_sysio_srst;                           
output          cp0_yy_clk_en;                            
output          cp0_yy_mach_mode;                         
output  [1 :0]  cp0_yy_priv_mode;                         
output  [11:0]  cpu_clic_curid;                           
output          cpu_clic_int_exit;                        
output  [7 :0]  fpu_dtu_debug_info;                       
output  [21:0]  idu_dtu_debug_info;                       
output  [95:0]  idu_dtu_fpr_info;                         
output          idu_yy_xx_tail_ack;                       
output          ifu_bmu_acc_deny;                         
output  [31:0]  ifu_bmu_addr;                             
output  [2 :0]  ifu_bmu_burst;                            
output          ifu_bmu_data_req;                         
output  [3 :0]  ifu_bmu_prot;                             
output          ifu_bmu_req;                              
output          ifu_bmu_seq;                              
output  [1 :0]  ifu_bmu_size;                             
output          ifu_clic_warm_up;                         
output          ifu_dtu_addr_vld0;                        
output          ifu_dtu_addr_vld1;                        
output          ifu_dtu_data_vld0;                        
output          ifu_dtu_data_vld1;                        
output  [26:0]  ifu_dtu_debug_info;                       
output  [31:0]  ifu_dtu_exe_addr0;                        
output  [31:0]  ifu_dtu_exe_addr1;                        
output  [31:0]  ifu_dtu_exe_data0;                        
output  [31:0]  ifu_dtu_exe_data1;                        
output          ifu_hpcp_icache_access;                   
output          ifu_hpcp_icache_miss;                     
output  [31:0]  ifu_pmp_addr;                             
output          ifu_pmp_machine_mode;                     
output  [31:0]  ifu_sysmap_pa;                            
output          ifu_sysmap_rst_sample;                    
output  [8 :0]  iu_dtu_debug_info;                        
output          iu_hpcp_inst_bht_mispred;                 
output          iu_hpcp_inst_condbr;                      
output          iu_hpcp_inst_condbr_gate;                 
output          lsu_biu_amo_pmp_deny;                     
output          lsu_biu_async_expt_ack;                   
output          lsu_bmu_acc_deny;                         
output  [31:0]  lsu_bmu_addr;                             
output  [2 :0]  lsu_bmu_burst;                            
output          lsu_bmu_lock;                             
output          lsu_bmu_lrsc;                             
output  [3 :0]  lsu_bmu_prot;                             
output          lsu_bmu_req;                              
output          lsu_bmu_req_dp;                           
output          lsu_bmu_seq;                              
output  [1 :0]  lsu_bmu_size;                             
output  [31:0]  lsu_bmu_wdata;                            
output          lsu_bmu_write;                            
output  [78:0]  lsu_dtu_debug_info;                       
output  [14:0]  lsu_dtu_halt_info;                        
output          lsu_dtu_last_check;                       
output  [31:0]  lsu_dtu_ldst_addr;                        
output          lsu_dtu_ldst_addr_vld;                    
output  [7 :0]  lsu_dtu_ldst_bytes_vld;                   
output  [31:0]  lsu_dtu_ldst_data;                        
output          lsu_dtu_ldst_data_vld;                    
output  [1 :0]  lsu_dtu_ldst_type;                        
output  [1 :0]  lsu_dtu_mem_access_size;                  
output          lsu_hpcp_cache_read_access;               
output          lsu_hpcp_cache_read_access_gate;          
output          lsu_hpcp_cache_read_miss;                 
output          lsu_hpcp_cache_read_miss_gate;            
output          lsu_hpcp_cache_write_access;              
output          lsu_hpcp_cache_write_access_gate;         
output          lsu_hpcp_cache_write_miss;                
output          lsu_hpcp_cache_write_miss_gate;           
output          lsu_hpcp_inst_store;                      
output          lsu_hpcp_inst_store_gate;                 
output  [31:0]  lsu_pmp_addr;                             
output          lsu_pmp_write;                            
output  [31:0]  lsu_sysmap_pa;                            
output          lsu_xx_flush;                             
output          lsu_xx_warm_up;                           
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
output          rtu_hpcp_retire_inst_vld;                 
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
output          rtu_yy_xx_async_flush;                    
output          rtu_yy_xx_dbgon;                          
output          rtu_yy_xx_expt_int;                       
output  [11:0]  rtu_yy_xx_expt_vec;                       
output          rtu_yy_xx_expt_vld;                       

// &Regs; @27

// &Wires; @28
wire            bmu_ifu_acc_err;                          
wire            bmu_ifu_grant;                            
wire    [31:0]  bmu_ifu_rdata;                            
wire            bmu_ifu_trans_cmplt;                      
wire            bmu_lsu_acc_err;                          
wire            bmu_lsu_grant;                            
wire    [31:0]  bmu_lsu_rdata;                            
wire            bmu_lsu_trans_cmplt;                      
wire            clic_cpu_int_hv;                          
wire    [11:0]  clic_cpu_int_id;                          
wire    [7 :0]  clic_cpu_int_il;                          
wire    [1 :0]  clic_cpu_int_priv;                        
wire            cp0_biu_icg_en;                           
wire    [11:0]  cp0_dtu_addr;                             
wire    [5 :0]  cp0_dtu_debug_info;                       
wire            cp0_dtu_icg_en;                           
wire    [11:0]  cp0_dtu_int_id;                           
wire            cp0_dtu_mexpt_vld;                        
wire            cp0_dtu_pcfifo_frz;                       
wire            cp0_dtu_rreg;                             
wire    [31:0]  cp0_dtu_wdata;                            
wire            cp0_dtu_wreg;                             
wire            cp0_fpu_icg_en;                           
wire            cp0_fpu_xx_dqnan;                         
wire    [2 :0]  cp0_fpu_xx_rm;                            
wire            cp0_hpcp_icg_en;                          
wire    [11:0]  cp0_hpcp_index;                           
wire            cp0_hpcp_pmdm;                            
wire            cp0_hpcp_pmdu;                            
wire    [31:0]  cp0_hpcp_wdata;                           
wire            cp0_hpcp_wreg;                            
wire            cp0_idu_ex1_stall;                        
wire    [1 :0]  cp0_idu_fs;                               
wire            cp0_idu_icg_en;                           
wire    [31:0]  cp0_idu_mcause;                           
wire    [31:0]  cp0_idu_mepc;                             
wire    [2 :0]  cp0_idu_rm;                               
wire            cp0_idu_sp_use_scratch;                   
wire    [31:0]  cp0_idu_sp_wdata;                         
wire            cp0_idu_sp_wen;                           
wire            cp0_idu_sp_wen_gate;                      
wire            cp0_idu_spec_push_en;                     
wire            cp0_idu_swap_sp_en;                       
wire            cp0_ifu_bht_en;                           
wire            cp0_ifu_bht_inv;                          
wire            cp0_ifu_btb_clr;                          
wire            cp0_ifu_btb_en;                           
wire            cp0_ifu_icache_en;                        
wire    [31:0]  cp0_ifu_icache_inv_addr;                  
wire            cp0_ifu_icache_inv_req;                   
wire            cp0_ifu_icache_inv_type;                  
wire            cp0_ifu_icg_en;                           
wire            cp0_ifu_in_lpmd;                          
wire            cp0_ifu_lpmd_req;                         
wire    [31:0]  cp0_ifu_mtvec;                            
wire            cp0_ifu_ras_en;                           
wire            cp0_ifu_rst_inv_done;                     
wire            cp0_ifu_srst_mask;                        
wire            cp0_ifu_srst_req;                         
wire            cp0_iu_adder_borrow_in;                   
wire            cp0_iu_adder_borrow_vld;                  
wire            cp0_iu_icg_en;                            
wire            cp0_lsu_dcache_en;                        
wire            cp0_lsu_dcache_wa;                        
wire            cp0_lsu_dcache_wb;                        
wire            cp0_lsu_fence_req;                        
wire    [31:0]  cp0_lsu_icc_addr;                         
wire    [1 :0]  cp0_lsu_icc_op;                           
wire            cp0_lsu_icc_req;                          
wire    [1 :0]  cp0_lsu_icc_type;                         
wire            cp0_lsu_icg_en;                           
wire            cp0_lsu_mm;                               
wire            cp0_lsu_sync_req;                         
wire    [31:0]  cp0_pad_mcause;                           
wire    [31:0]  cp0_pad_mintstatus;                       
wire    [31:0]  cp0_pad_mstatus;                          
wire    [19:0]  cp0_pmp_csr_sel;                          
wire            cp0_pmp_csr_wen;                          
wire            cp0_pmp_icg_en;                           
wire    [1 :0]  cp0_pmp_mstatus_mpp;                      
wire            cp0_pmp_mstatus_mprv;                     
wire    [31:0]  cp0_pmp_updt_data;                        
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
wire            cp0_sysio_ipend_b;                        
wire    [1 :0]  cp0_sysio_lpmd_b;                         
wire    [1 :0]  cp0_sysio_srst;                           
wire            cp0_xx_async_expt_en;                     
wire            cp0_yy_clk_en;                            
wire            cp0_yy_cskyisaee;                         
wire            cp0_yy_mach_mode;                         
wire    [1 :0]  cp0_yy_priv_mode;                         
wire    [11:0]  cpu_clic_curid;                           
wire            cpu_clic_int_exit;                        
wire            cpurst_b;                                 
wire            dtu_cp0_dcsr_mprven;                      
wire    [1 :0]  dtu_cp0_dcsr_prv;                         
wire    [31:0]  dtu_cp0_rdata;                            
wire            dtu_cp0_wake_up;                          
wire    [31:0]  dtu_ifu_debug_inst;                       
wire            dtu_ifu_debug_inst_vld;                   
wire    [14:0]  dtu_ifu_halt_info0;                       
wire    [14:0]  dtu_ifu_halt_info1;                       
wire            dtu_ifu_halt_info_vld;                    
wire            dtu_ifu_halt_on_reset;                    
wire            dtu_lsu_addr_trig_en;                     
wire            dtu_lsu_data_trig_en;                     
wire    [14:0]  dtu_lsu_halt_info;                        
wire            dtu_lsu_halt_info_vld;                    
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
wire    [4 :0]  fpu_cp0_wb_fflags;                        
wire            fpu_cp0_wb_fflags_updt;                   
wire    [7 :0]  fpu_dtu_debug_info;                       
wire            fpu_gated_cpuclk;                         
wire            fpu_gated_cpuclk_en;                      
wire            fpu_idu_ex1_stall;                        
wire    [31:0]  fpu_idu_fwd_data;                         
wire    [4 :0]  fpu_idu_fwd_freg;                         
wire            fpu_idu_fwd_vld;                          
wire            fpu_iu_ex1_cmplt;                         
wire            fpu_iu_ex1_cmplt_dp;                      
wire    [31:0]  fpu_rtu_fgpr_wb_data;                     
wire    [4 :0]  fpu_rtu_fgpr_wb_reg;                      
wire            fpu_rtu_fgpr_wb_vld;                      
wire    [31:0]  fpu_rtu_wb_data;                          
wire    [5 :0]  fpu_rtu_wb_preg;                          
wire            fpu_rtu_wb_vld;                           
wire            fpu_wb_float_fflags_updt;                 
wire            fpu_xx_no_op;                             
wire    [31:0]  hpcp_cp0_data;                            
wire            idu_cp0_ex1_cmplt_dp_sel;                 
wire    [5 :0]  idu_cp0_ex1_dst_idx;                      
wire            idu_cp0_ex1_dst_vld;                      
wire            idu_cp0_ex1_expt_high;                    
wire            idu_cp0_ex1_expt_type;                    
wire            idu_cp0_ex1_expt_vld;                     
wire    [19:0]  idu_cp0_ex1_func;                         
wire            idu_cp0_ex1_gateclk_sel;                  
wire    [14:0]  idu_cp0_ex1_halt_info;                    
wire            idu_cp0_ex1_inst_len;                     
wire            idu_cp0_ex1_ipush_spec_fail;              
wire    [31:0]  idu_cp0_ex1_opcode;                       
wire    [31:0]  idu_cp0_ex1_rs1;                          
wire    [11:0]  idu_cp0_ex1_rs2;                          
wire            idu_cp0_ex1_sel;                          
wire            idu_cp0_ex1_split_inst;                   
wire            idu_cp0_ex1_tail_fail;                    
wire            idu_cp0_id_tail_vld;                      
wire    [31:0]  idu_cp0_ipop_data;                        
wire            idu_cp0_mcause_wen;                       
wire            idu_cp0_mepc_wen;                         
wire    [31:0]  idu_cp0_sp_reg;                           
wire            idu_cp0_sp_swap_pending;                  
wire            idu_cp0_sp_swap_req;                      
wire            idu_cp0_sp_swap_req_gate;                 
wire    [21:0]  idu_dtu_debug_info;                       
wire    [95:0]  idu_dtu_fpr_info;                         
wire            idu_fpu_ex1_cmplt_dp_sel;                 
wire    [4 :0]  idu_fpu_ex1_dst_freg;                     
wire            idu_fpu_ex1_dst_freg_vld;                 
wire    [4 :0]  idu_fpu_ex1_dst_preg;                     
wire    [2 :0]  idu_fpu_ex1_eu_sel;                       
wire    [9 :0]  idu_fpu_ex1_func;                         
wire            idu_fpu_ex1_gateclk_vld;                  
wire            idu_fpu_ex1_inst_vld;                     
wire    [2 :0]  idu_fpu_ex1_rm;                           
wire    [31:0]  idu_fpu_ex1_srcf0;                        
wire    [31:0]  idu_fpu_ex1_srcf1;                        
wire    [31:0]  idu_fpu_ex1_srcf2;                        
wire    [31:0]  idu_fpu_ex1_srci;                         
wire            idu_ifu_id_stall;                         
wire            idu_ifu_tail_vld;                         
wire            idu_ifu_tail_vld_gate;                    
wire    [31:0]  idu_ifu_x1;                               
wire    [31:0]  idu_iu_ex1_ag_imm;                        
wire            idu_iu_ex1_alu_cmplt_dp_sel;              
wire            idu_iu_ex1_alu_gateclk_sel;               
wire            idu_iu_ex1_alu_sel;                       
wire    [1 :0]  idu_iu_ex1_bht_pred;                      
wire            idu_iu_ex1_bju_cmplt_dp_sel;              
wire            idu_iu_ex1_bju_depd_lsu_src0;             
wire            idu_iu_ex1_bju_depd_lsu_src1;             
wire            idu_iu_ex1_bju_gateclk_sel;               
wire            idu_iu_ex1_bju_sel;                       
wire            idu_iu_ex1_bju_use_pc;                    
wire            idu_iu_ex1_div_cmplt_dp_sel;              
wire            idu_iu_ex1_div_gateclk_sel;               
wire            idu_iu_ex1_div_sel;                       
wire    [5 :0]  idu_iu_ex1_dst_preg;                      
wire    [19:0]  idu_iu_ex1_func;                          
wire            idu_iu_ex1_gateclk_vld;                   
wire            idu_iu_ex1_inst_len;                      
wire            idu_iu_ex1_inst_vld;                      
wire            idu_iu_ex1_ipop_int_mask;                 
wire            idu_iu_ex1_ipush_mie_en;                  
wire            idu_iu_ex1_ipush_spec_fail;               
wire            idu_iu_ex1_mul_cmplt_dp_sel;              
wire            idu_iu_ex1_mul_gateclk_sel;               
wire            idu_iu_ex1_mul_high_sel;                  
wire            idu_iu_ex1_mul_sel;                       
wire            idu_iu_ex1_rd_pair;                       
wire            idu_iu_ex1_split;                         
wire    [31:0]  idu_iu_ex1_src0;                          
wire    [5 :0]  idu_iu_ex1_src0_reg;                      
wire    [31:0]  idu_iu_ex1_src1;                          
wire    [5 :0]  idu_iu_ex1_src1_reg;                      
wire    [31:0]  idu_iu_ex1_src2;                          
wire            idu_iu_ex1_tail_int_vld;                  
wire            idu_iu_ex1_wb_vld;                        
wire            idu_iu_tail_fail;                         
wire            idu_iu_tail_fail_gate;                    
wire    [31:0]  idu_lsu_ex1_ag_imm;                       
wire    [31:0]  idu_lsu_ex1_base;                         
wire            idu_lsu_ex1_base_sel;                     
wire            idu_lsu_ex1_base_wb;                      
wire    [31:0]  idu_lsu_ex1_data;                         
wire    [5 :0]  idu_lsu_ex1_dest_reg;                     
wire            idu_lsu_ex1_dest_vld;                     
wire            idu_lsu_ex1_dp_sel;                       
wire            idu_lsu_ex1_fls;                          
wire    [3 :0]  idu_lsu_ex1_func;                         
wire            idu_lsu_ex1_gateclk_sel;                  
wire    [14:0]  idu_lsu_ex1_halt_info;                    
wire            idu_lsu_ex1_ipop_int_mask;                
wire            idu_lsu_ex1_ipush_spec;                   
wire            idu_lsu_ex1_length;                       
wire            idu_lsu_ex1_offset_sel;                   
wire            idu_lsu_ex1_sel;                          
wire            idu_lsu_ex1_sign_extend;                  
wire    [1 :0]  idu_lsu_ex1_size;                         
wire            idu_lsu_ex1_split;                        
wire    [5 :0]  idu_lsu_ex1_src0_reg;                     
wire            idu_lsu_ex1_src1_depd;                    
wire    [5 :0]  idu_lsu_ex1_src1_reg;                     
wire            idu_yy_xx_tail_ack;                       
wire            ifu_bmu_acc_deny;                         
wire    [31:0]  ifu_bmu_addr;                             
wire    [2 :0]  ifu_bmu_burst;                            
wire            ifu_bmu_data_req;                         
wire    [3 :0]  ifu_bmu_prot;                             
wire            ifu_bmu_req;                              
wire            ifu_bmu_seq;                              
wire    [1 :0]  ifu_bmu_size;                             
wire            ifu_clic_warm_up;                         
wire            ifu_cp0_bht_inv_done;                     
wire            ifu_cp0_icache_inv_done;                  
wire            ifu_cp0_lpmd_ack;                         
wire            ifu_cp0_rst_inv_req;                      
wire            ifu_cp0_srst_ack;                         
wire            ifu_cp0_vec_err;                          
wire            ifu_cp0_vec_succeed;                      
wire            ifu_cp0_warm_up;                          
wire            ifu_dtu_addr_vld0;                        
wire            ifu_dtu_addr_vld1;                        
wire            ifu_dtu_data_vld0;                        
wire            ifu_dtu_data_vld1;                        
wire    [26:0]  ifu_dtu_debug_info;                       
wire    [31:0]  ifu_dtu_exe_addr0;                        
wire    [31:0]  ifu_dtu_exe_addr1;                        
wire    [31:0]  ifu_dtu_exe_data0;                        
wire    [31:0]  ifu_dtu_exe_data1;                        
wire            ifu_fpu_warm_up;                          
wire            ifu_hpcp_icache_access;                   
wire            ifu_hpcp_icache_miss;                     
wire            ifu_idu_chgflw_flush;                     
wire            ifu_idu_id_expt_high;                     
wire            ifu_idu_id_expt_vld;                      
wire    [14:0]  ifu_idu_id_halt_info;                     
wire    [31:0]  ifu_idu_id_inst;                          
wire            ifu_idu_id_inst_vld;                      
wire    [1 :0]  ifu_idu_id_pred_taken;                    
wire            ifu_idu_warm_up;                          
wire    [31:0]  ifu_iu_chgflw_pc;                         
wire            ifu_iu_chgflw_vld;                        
wire    [31:0]  ifu_iu_ex1_pc_pred;                       
wire            ifu_iu_reset_vld;                         
wire            ifu_iu_warm_up;                           
wire            ifu_lsu_warm_up;                          
wire    [31:0]  ifu_pmp_addr;                             
wire            ifu_pmp_machine_mode;                     
wire            ifu_rtu_lockup_ack;                       
wire            ifu_rtu_reset_halt_req;                   
wire            ifu_rtu_warm_up;                          
wire    [31:0]  ifu_sysmap_pa;                            
wire            ifu_sysmap_rst_sample;                    
wire            ifu_xx_in_warm_up;                        
wire    [31:0]  iu_cp0_ex1_borrow_expt_pc;                
wire    [8 :0]  iu_dtu_debug_info;                        
wire            iu_hpcp_inst_bht_mispred;                 
wire            iu_hpcp_inst_condbr;                      
wire            iu_hpcp_inst_condbr_gate;                 
wire            iu_idu_bju_global_stall;                  
wire            iu_idu_bju_stall;                         
wire    [31:0]  iu_idu_ex1_fwd_data;                      
wire    [5 :0]  iu_idu_ex1_fwd_preg;                      
wire            iu_idu_ex1_fwd_vld;                       
wire    [31:0]  iu_idu_ex1_src1_update_value;             
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
wire    [31:0]  iu_ifu_bht_cur_pc;                        
wire            iu_ifu_bht_mispred;                       
wire            iu_ifu_bht_mispred_gate;                  
wire    [1 :0]  iu_ifu_bht_pred;                          
wire            iu_ifu_bht_taken;                         
wire            iu_ifu_br_vld;                            
wire            iu_ifu_br_vld_gate;                       
wire            iu_ifu_ind_link_vld;                      
wire            iu_ifu_link_vld;                          
wire            iu_ifu_link_vld_gate;                     
wire            iu_ifu_pc_mispred;                        
wire            iu_ifu_pc_mispred_gate;                   
wire            iu_ifu_ret_vld;                           
wire            iu_ifu_ret_vld_gate;                      
wire    [31:0]  iu_ifu_tar_pc;                            
wire            iu_ifu_tar_pc_vld;                        
wire            iu_ifu_tar_pc_vld_gate;                   
wire    [31:0]  iu_lsu_ex1_lsi_rst;                       
wire            iu_lsu_ex2_wb0_grant;                     
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
wire            iu_yy_xx_cancel;                          
wire            lsu_biu_amo_pmp_deny;                     
wire            lsu_biu_async_expt_ack;                   
wire            lsu_bmu_acc_deny;                         
wire    [31:0]  lsu_bmu_addr;                             
wire    [2 :0]  lsu_bmu_burst;                            
wire            lsu_bmu_lock;                             
wire            lsu_bmu_lrsc;                             
wire    [3 :0]  lsu_bmu_prot;                             
wire            lsu_bmu_req;                              
wire            lsu_bmu_req_dp;                           
wire            lsu_bmu_seq;                              
wire    [1 :0]  lsu_bmu_size;                             
wire    [31:0]  lsu_bmu_wdata;                            
wire            lsu_bmu_write;                            
wire            lsu_cp0_fence_ack;                        
wire            lsu_cp0_icc_done;                         
wire            lsu_cp0_sync_ack;                         
wire    [78:0]  lsu_dtu_debug_info;                       
wire    [14:0]  lsu_dtu_halt_info;                        
wire            lsu_dtu_last_check;                       
wire    [31:0]  lsu_dtu_ldst_addr;                        
wire            lsu_dtu_ldst_addr_vld;                    
wire    [7 :0]  lsu_dtu_ldst_bytes_vld;                   
wire    [31:0]  lsu_dtu_ldst_data;                        
wire            lsu_dtu_ldst_data_vld;                    
wire    [1 :0]  lsu_dtu_ldst_type;                        
wire    [1 :0]  lsu_dtu_mem_access_size;                  
wire            lsu_hpcp_cache_read_access;               
wire            lsu_hpcp_cache_read_access_gate;          
wire            lsu_hpcp_cache_read_miss;                 
wire            lsu_hpcp_cache_read_miss_gate;            
wire            lsu_hpcp_cache_write_access;              
wire            lsu_hpcp_cache_write_access_gate;         
wire            lsu_hpcp_cache_write_miss;                
wire            lsu_hpcp_cache_write_miss_gate;           
wire            lsu_hpcp_inst_store;                      
wire            lsu_hpcp_inst_store_gate;                 
wire    [14:0]  lsu_idu_ex1_halt_info;                    
wire            lsu_idu_ex1_halt_info_update_en;          
wire            lsu_idu_ex1_src1_update_en;               
wire            lsu_idu_ex1_src1_update_en_gate;          
wire            lsu_idu_ex1_stall;                        
wire    [31:0]  lsu_idu_ex2_ffwd_data;                    
wire            lsu_idu_ex2_ffwd_vld;                     
wire    [31:0]  lsu_idu_ex2_fwd_data;                     
wire    [4 :0]  lsu_idu_ex2_fwd_freg;                     
wire    [5 :0]  lsu_idu_ex2_fwd_preg;                     
wire            lsu_idu_ex2_fwd_vld;                      
wire    [31:0]  lsu_idu_ex3_ffwd_data;                    
wire            lsu_idu_ex3_ffwd_vld;                     
wire    [31:0]  lsu_idu_ex3_fwd_data;                     
wire    [4 :0]  lsu_idu_ex3_fwd_freg;                     
wire    [5 :0]  lsu_idu_ex3_fwd_preg;                     
wire            lsu_idu_ex3_fwd_vld;                      
wire            lsu_idu_global_stall;                     
wire    [31:0]  lsu_idu_update_addr;                      
wire            lsu_idu_update_en;                        
wire            lsu_idu_update_en_gate;                   
wire    [31:0]  lsu_idu_update_offset;                    
wire            lsu_iu_ex1_base_wb;                       
wire            lsu_iu_ex1_src1_sel;                      
wire    [31:0]  lsu_iu_ex2_data;                          
wire            lsu_iu_ex2_data_vld;                      
wire    [5 :0]  lsu_iu_ex2_dest_reg;                      
wire    [5 :0]  lsu_iu_ex2_lsi_dst_preg;                  
wire    [31:0]  lsu_iu_ex2_lsi_rslt;                      
wire            lsu_iu_ex2_lsi_rslt_vld;                  
wire    [31:0]  lsu_pmp_addr;                             
wire            lsu_pmp_write;                            
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
wire    [31:0]  lsu_sysmap_pa;                            
wire            lsu_xx_flush;                             
wire            lsu_xx_no_op;                             
wire            lsu_xx_warm_up;                           
wire            pad_yy_icg_scan_en;                       
wire    [31:0]  pmp_cp0_data;                             
wire            pmp_ifu_acc_deny;                         
wire            pmp_lsu_acc_deny;                         
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
wire            sysio_cp0_clk_en;                         
wire    [2 :0]  sysio_cp0_clkratio;                       
wire    [31:0]  sysio_cp0_rst_addr;                       
wire    [31:0]  sysio_ifu_rst_addr;                       
wire            sysio_ifu_rst_addr_done;                  
wire    [31:0]  sysio_iu_rst_addr;                        
wire            sysio_rtu_nmi_int;                        
wire            sysio_rtu_wk_event;                       
wire            sysio_xx_halt_req;                        
wire    [4 :0]  sysmap_ifu_flg;                           
wire    [4 :0]  sysmap_lsu_flg;                           
wire    [31:0]  tcip_cp0_clic_base;                       


//==========================================================
//  Instance IFU module
//==========================================================
// &Instance("pa_ifu_top"); @33
pa_ifu_top  x_pa_ifu_top (
  .bmu_ifu_acc_err         (bmu_ifu_acc_err        ),
  .bmu_ifu_grant           (bmu_ifu_grant          ),
  .bmu_ifu_rdata           (bmu_ifu_rdata          ),
  .bmu_ifu_trans_cmplt     (bmu_ifu_trans_cmplt    ),
  .cp0_ifu_bht_en          (cp0_ifu_bht_en         ),
  .cp0_ifu_bht_inv         (cp0_ifu_bht_inv        ),
  .cp0_ifu_btb_clr         (cp0_ifu_btb_clr        ),
  .cp0_ifu_btb_en          (cp0_ifu_btb_en         ),
  .cp0_ifu_icache_en       (cp0_ifu_icache_en      ),
  .cp0_ifu_icache_inv_addr (cp0_ifu_icache_inv_addr),
  .cp0_ifu_icache_inv_req  (cp0_ifu_icache_inv_req ),
  .cp0_ifu_icache_inv_type (cp0_ifu_icache_inv_type),
  .cp0_ifu_icg_en          (cp0_ifu_icg_en         ),
  .cp0_ifu_in_lpmd         (cp0_ifu_in_lpmd        ),
  .cp0_ifu_lpmd_req        (cp0_ifu_lpmd_req       ),
  .cp0_ifu_mtvec           (cp0_ifu_mtvec          ),
  .cp0_ifu_ras_en          (cp0_ifu_ras_en         ),
  .cp0_ifu_rst_inv_done    (cp0_ifu_rst_inv_done   ),
  .cp0_ifu_srst_mask       (cp0_ifu_srst_mask      ),
  .cp0_ifu_srst_req        (cp0_ifu_srst_req       ),
  .cp0_yy_clk_en           (cp0_yy_clk_en          ),
  .cp0_yy_mach_mode        (cp0_yy_mach_mode       ),
  .cpurst_b                (cpurst_b               ),
  .dtu_ifu_debug_inst      (dtu_ifu_debug_inst     ),
  .dtu_ifu_debug_inst_vld  (dtu_ifu_debug_inst_vld ),
  .dtu_ifu_halt_info0      (dtu_ifu_halt_info0     ),
  .dtu_ifu_halt_info1      (dtu_ifu_halt_info1     ),
  .dtu_ifu_halt_info_vld   (dtu_ifu_halt_info_vld  ),
  .dtu_ifu_halt_on_reset   (dtu_ifu_halt_on_reset  ),
  .forever_cpuclk          (forever_cpuclk         ),
  .idu_ifu_id_stall        (idu_ifu_id_stall       ),
  .idu_ifu_tail_vld        (idu_ifu_tail_vld       ),
  .idu_ifu_tail_vld_gate   (idu_ifu_tail_vld_gate  ),
  .idu_ifu_x1              (idu_ifu_x1             ),
  .ifu_bmu_acc_deny        (ifu_bmu_acc_deny       ),
  .ifu_bmu_addr            (ifu_bmu_addr           ),
  .ifu_bmu_burst           (ifu_bmu_burst          ),
  .ifu_bmu_data_req        (ifu_bmu_data_req       ),
  .ifu_bmu_prot            (ifu_bmu_prot           ),
  .ifu_bmu_req             (ifu_bmu_req            ),
  .ifu_bmu_seq             (ifu_bmu_seq            ),
  .ifu_bmu_size            (ifu_bmu_size           ),
  .ifu_clic_warm_up        (ifu_clic_warm_up       ),
  .ifu_cp0_bht_inv_done    (ifu_cp0_bht_inv_done   ),
  .ifu_cp0_icache_inv_done (ifu_cp0_icache_inv_done),
  .ifu_cp0_lpmd_ack        (ifu_cp0_lpmd_ack       ),
  .ifu_cp0_rst_inv_req     (ifu_cp0_rst_inv_req    ),
  .ifu_cp0_srst_ack        (ifu_cp0_srst_ack       ),
  .ifu_cp0_vec_err         (ifu_cp0_vec_err        ),
  .ifu_cp0_vec_succeed     (ifu_cp0_vec_succeed    ),
  .ifu_cp0_warm_up         (ifu_cp0_warm_up        ),
  .ifu_dtu_addr_vld0       (ifu_dtu_addr_vld0      ),
  .ifu_dtu_addr_vld1       (ifu_dtu_addr_vld1      ),
  .ifu_dtu_data_vld0       (ifu_dtu_data_vld0      ),
  .ifu_dtu_data_vld1       (ifu_dtu_data_vld1      ),
  .ifu_dtu_debug_info      (ifu_dtu_debug_info     ),
  .ifu_dtu_exe_addr0       (ifu_dtu_exe_addr0      ),
  .ifu_dtu_exe_addr1       (ifu_dtu_exe_addr1      ),
  .ifu_dtu_exe_data0       (ifu_dtu_exe_data0      ),
  .ifu_dtu_exe_data1       (ifu_dtu_exe_data1      ),
  .ifu_fpu_warm_up         (ifu_fpu_warm_up        ),
  .ifu_hpcp_icache_access  (ifu_hpcp_icache_access ),
  .ifu_hpcp_icache_miss    (ifu_hpcp_icache_miss   ),
  .ifu_idu_chgflw_flush    (ifu_idu_chgflw_flush   ),
  .ifu_idu_id_expt_high    (ifu_idu_id_expt_high   ),
  .ifu_idu_id_expt_vld     (ifu_idu_id_expt_vld    ),
  .ifu_idu_id_halt_info    (ifu_idu_id_halt_info   ),
  .ifu_idu_id_inst         (ifu_idu_id_inst        ),
  .ifu_idu_id_inst_vld     (ifu_idu_id_inst_vld    ),
  .ifu_idu_id_pred_taken   (ifu_idu_id_pred_taken  ),
  .ifu_idu_warm_up         (ifu_idu_warm_up        ),
  .ifu_iu_chgflw_pc        (ifu_iu_chgflw_pc       ),
  .ifu_iu_chgflw_vld       (ifu_iu_chgflw_vld      ),
  .ifu_iu_ex1_pc_pred      (ifu_iu_ex1_pc_pred     ),
  .ifu_iu_reset_vld        (ifu_iu_reset_vld       ),
  .ifu_iu_warm_up          (ifu_iu_warm_up         ),
  .ifu_lsu_warm_up         (ifu_lsu_warm_up        ),
  .ifu_pmp_addr            (ifu_pmp_addr           ),
  .ifu_pmp_machine_mode    (ifu_pmp_machine_mode   ),
  .ifu_rtu_lockup_ack      (ifu_rtu_lockup_ack     ),
  .ifu_rtu_reset_halt_req  (ifu_rtu_reset_halt_req ),
  .ifu_rtu_warm_up         (ifu_rtu_warm_up        ),
  .ifu_sysmap_pa           (ifu_sysmap_pa          ),
  .ifu_sysmap_rst_sample   (ifu_sysmap_rst_sample  ),
  .ifu_xx_in_warm_up       (ifu_xx_in_warm_up      ),
  .iu_ifu_bht_cur_pc       (iu_ifu_bht_cur_pc      ),
  .iu_ifu_bht_mispred      (iu_ifu_bht_mispred     ),
  .iu_ifu_bht_mispred_gate (iu_ifu_bht_mispred_gate),
  .iu_ifu_bht_pred         (iu_ifu_bht_pred        ),
  .iu_ifu_bht_taken        (iu_ifu_bht_taken       ),
  .iu_ifu_br_vld           (iu_ifu_br_vld          ),
  .iu_ifu_br_vld_gate      (iu_ifu_br_vld_gate     ),
  .iu_ifu_ind_link_vld     (iu_ifu_ind_link_vld    ),
  .iu_ifu_link_vld         (iu_ifu_link_vld        ),
  .iu_ifu_link_vld_gate    (iu_ifu_link_vld_gate   ),
  .iu_ifu_pc_mispred       (iu_ifu_pc_mispred      ),
  .iu_ifu_pc_mispred_gate  (iu_ifu_pc_mispred_gate ),
  .iu_ifu_ret_vld          (iu_ifu_ret_vld         ),
  .iu_ifu_ret_vld_gate     (iu_ifu_ret_vld_gate    ),
  .iu_ifu_tar_pc           (iu_ifu_tar_pc          ),
  .iu_ifu_tar_pc_vld       (iu_ifu_tar_pc_vld      ),
  .iu_ifu_tar_pc_vld_gate  (iu_ifu_tar_pc_vld_gate ),
  .iu_yy_xx_cancel         (iu_yy_xx_cancel        ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .pmp_ifu_acc_deny        (pmp_ifu_acc_deny       ),
  .rtu_ifu_chgflw_pc       (rtu_ifu_chgflw_pc      ),
  .rtu_ifu_chgflw_vld      (rtu_ifu_chgflw_vld     ),
  .rtu_ifu_dbg_mask        (rtu_ifu_dbg_mask       ),
  .rtu_ifu_flush_fe        (rtu_ifu_flush_fe       ),
  .rtu_ifu_lockup_expt_vld (rtu_ifu_lockup_expt_vld),
  .rtu_ifu_lockup_mask     (rtu_ifu_lockup_mask    ),
  .rtu_ifu_lockup_req      (rtu_ifu_lockup_req     ),
  .rtu_yy_xx_dbgon         (rtu_yy_xx_dbgon        ),
  .rtu_yy_xx_expt_int      (rtu_yy_xx_expt_int     ),
  .rtu_yy_xx_expt_vld      (rtu_yy_xx_expt_vld     ),
  .rtu_yy_xx_int_hv        (rtu_yy_xx_int_hv       ),
  .rtu_yy_xx_tail_int_vld  (rtu_yy_xx_tail_int_vld ),
  .sysio_ifu_rst_addr      (sysio_ifu_rst_addr     ),
  .sysio_ifu_rst_addr_done (sysio_ifu_rst_addr_done),
  .sysio_xx_halt_req       (sysio_xx_halt_req      ),
  .sysmap_ifu_flg          (sysmap_ifu_flg         )
);


//==========================================================
//  Instance IDU module
//==========================================================
// &Instance("pa_idu_top"); @38
pa_idu_top  x_pa_idu_top (
  .cp0_idu_ex1_stall                         (cp0_idu_ex1_stall                        ),
  .cp0_idu_fs                                (cp0_idu_fs                               ),
  .cp0_idu_icg_en                            (cp0_idu_icg_en                           ),
  .cp0_idu_mcause                            (cp0_idu_mcause                           ),
  .cp0_idu_mepc                              (cp0_idu_mepc                             ),
  .cp0_idu_rm                                (cp0_idu_rm                               ),
  .cp0_idu_sp_use_scratch                    (cp0_idu_sp_use_scratch                   ),
  .cp0_idu_sp_wdata                          (cp0_idu_sp_wdata                         ),
  .cp0_idu_sp_wen                            (cp0_idu_sp_wen                           ),
  .cp0_idu_sp_wen_gate                       (cp0_idu_sp_wen_gate                      ),
  .cp0_idu_spec_push_en                      (cp0_idu_spec_push_en                     ),
  .cp0_idu_swap_sp_en                        (cp0_idu_swap_sp_en                       ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cp0_yy_cskyisaee                          (cp0_yy_cskyisaee                         ),
  .cp0_yy_mach_mode                          (cp0_yy_mach_mode                         ),
  .cpurst_b                                  (cpurst_b                                 ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .fpu_idu_ex1_stall                         (fpu_idu_ex1_stall                        ),
  .fpu_idu_fwd_data                          (fpu_idu_fwd_data                         ),
  .fpu_idu_fwd_freg                          (fpu_idu_fwd_freg                         ),
  .fpu_idu_fwd_vld                           (fpu_idu_fwd_vld                          ),
  .fpu_xx_no_op                              (fpu_xx_no_op                             ),
  .idu_cp0_ex1_cmplt_dp_sel                  (idu_cp0_ex1_cmplt_dp_sel                 ),
  .idu_cp0_ex1_dst_idx                       (idu_cp0_ex1_dst_idx                      ),
  .idu_cp0_ex1_dst_vld                       (idu_cp0_ex1_dst_vld                      ),
  .idu_cp0_ex1_expt_high                     (idu_cp0_ex1_expt_high                    ),
  .idu_cp0_ex1_expt_type                     (idu_cp0_ex1_expt_type                    ),
  .idu_cp0_ex1_expt_vld                      (idu_cp0_ex1_expt_vld                     ),
  .idu_cp0_ex1_func                          (idu_cp0_ex1_func                         ),
  .idu_cp0_ex1_gateclk_sel                   (idu_cp0_ex1_gateclk_sel                  ),
  .idu_cp0_ex1_halt_info                     (idu_cp0_ex1_halt_info                    ),
  .idu_cp0_ex1_inst_len                      (idu_cp0_ex1_inst_len                     ),
  .idu_cp0_ex1_ipush_spec_fail               (idu_cp0_ex1_ipush_spec_fail              ),
  .idu_cp0_ex1_opcode                        (idu_cp0_ex1_opcode                       ),
  .idu_cp0_ex1_rs1                           (idu_cp0_ex1_rs1                          ),
  .idu_cp0_ex1_rs2                           (idu_cp0_ex1_rs2                          ),
  .idu_cp0_ex1_sel                           (idu_cp0_ex1_sel                          ),
  .idu_cp0_ex1_split_inst                    (idu_cp0_ex1_split_inst                   ),
  .idu_cp0_ex1_tail_fail                     (idu_cp0_ex1_tail_fail                    ),
  .idu_cp0_id_tail_vld                       (idu_cp0_id_tail_vld                      ),
  .idu_cp0_ipop_data                         (idu_cp0_ipop_data                        ),
  .idu_cp0_mcause_wen                        (idu_cp0_mcause_wen                       ),
  .idu_cp0_mepc_wen                          (idu_cp0_mepc_wen                         ),
  .idu_cp0_sp_reg                            (idu_cp0_sp_reg                           ),
  .idu_cp0_sp_swap_pending                   (idu_cp0_sp_swap_pending                  ),
  .idu_cp0_sp_swap_req                       (idu_cp0_sp_swap_req                      ),
  .idu_cp0_sp_swap_req_gate                  (idu_cp0_sp_swap_req_gate                 ),
  .idu_dtu_debug_info                        (idu_dtu_debug_info                       ),
  .idu_dtu_fpr_info                          (idu_dtu_fpr_info                         ),
  .idu_fpu_ex1_cmplt_dp_sel                  (idu_fpu_ex1_cmplt_dp_sel                 ),
  .idu_fpu_ex1_dst_freg                      (idu_fpu_ex1_dst_freg                     ),
  .idu_fpu_ex1_dst_freg_vld                  (idu_fpu_ex1_dst_freg_vld                 ),
  .idu_fpu_ex1_dst_preg                      (idu_fpu_ex1_dst_preg                     ),
  .idu_fpu_ex1_eu_sel                        (idu_fpu_ex1_eu_sel                       ),
  .idu_fpu_ex1_func                          (idu_fpu_ex1_func                         ),
  .idu_fpu_ex1_gateclk_vld                   (idu_fpu_ex1_gateclk_vld                  ),
  .idu_fpu_ex1_inst_vld                      (idu_fpu_ex1_inst_vld                     ),
  .idu_fpu_ex1_rm                            (idu_fpu_ex1_rm                           ),
  .idu_fpu_ex1_srcf0                         (idu_fpu_ex1_srcf0                        ),
  .idu_fpu_ex1_srcf1                         (idu_fpu_ex1_srcf1                        ),
  .idu_fpu_ex1_srcf2                         (idu_fpu_ex1_srcf2                        ),
  .idu_fpu_ex1_srci                          (idu_fpu_ex1_srci                         ),
  .idu_ifu_id_stall                          (idu_ifu_id_stall                         ),
  .idu_ifu_tail_vld                          (idu_ifu_tail_vld                         ),
  .idu_ifu_tail_vld_gate                     (idu_ifu_tail_vld_gate                    ),
  .idu_ifu_x1                                (idu_ifu_x1                               ),
  .idu_iu_ex1_ag_imm                         (idu_iu_ex1_ag_imm                        ),
  .idu_iu_ex1_alu_cmplt_dp_sel               (idu_iu_ex1_alu_cmplt_dp_sel              ),
  .idu_iu_ex1_alu_gateclk_sel                (idu_iu_ex1_alu_gateclk_sel               ),
  .idu_iu_ex1_alu_sel                        (idu_iu_ex1_alu_sel                       ),
  .idu_iu_ex1_bht_pred                       (idu_iu_ex1_bht_pred                      ),
  .idu_iu_ex1_bju_cmplt_dp_sel               (idu_iu_ex1_bju_cmplt_dp_sel              ),
  .idu_iu_ex1_bju_depd_lsu_src0              (idu_iu_ex1_bju_depd_lsu_src0             ),
  .idu_iu_ex1_bju_depd_lsu_src1              (idu_iu_ex1_bju_depd_lsu_src1             ),
  .idu_iu_ex1_bju_gateclk_sel                (idu_iu_ex1_bju_gateclk_sel               ),
  .idu_iu_ex1_bju_sel                        (idu_iu_ex1_bju_sel                       ),
  .idu_iu_ex1_bju_use_pc                     (idu_iu_ex1_bju_use_pc                    ),
  .idu_iu_ex1_div_cmplt_dp_sel               (idu_iu_ex1_div_cmplt_dp_sel              ),
  .idu_iu_ex1_div_gateclk_sel                (idu_iu_ex1_div_gateclk_sel               ),
  .idu_iu_ex1_div_sel                        (idu_iu_ex1_div_sel                       ),
  .idu_iu_ex1_dst_preg                       (idu_iu_ex1_dst_preg                      ),
  .idu_iu_ex1_func                           (idu_iu_ex1_func                          ),
  .idu_iu_ex1_gateclk_vld                    (idu_iu_ex1_gateclk_vld                   ),
  .idu_iu_ex1_inst_len                       (idu_iu_ex1_inst_len                      ),
  .idu_iu_ex1_inst_vld                       (idu_iu_ex1_inst_vld                      ),
  .idu_iu_ex1_ipop_int_mask                  (idu_iu_ex1_ipop_int_mask                 ),
  .idu_iu_ex1_ipush_mie_en                   (idu_iu_ex1_ipush_mie_en                  ),
  .idu_iu_ex1_ipush_spec_fail                (idu_iu_ex1_ipush_spec_fail               ),
  .idu_iu_ex1_mul_cmplt_dp_sel               (idu_iu_ex1_mul_cmplt_dp_sel              ),
  .idu_iu_ex1_mul_gateclk_sel                (idu_iu_ex1_mul_gateclk_sel               ),
  .idu_iu_ex1_mul_high_sel                   (idu_iu_ex1_mul_high_sel                  ),
  .idu_iu_ex1_mul_sel                        (idu_iu_ex1_mul_sel                       ),
  .idu_iu_ex1_rd_pair                        (idu_iu_ex1_rd_pair                       ),
  .idu_iu_ex1_split                          (idu_iu_ex1_split                         ),
  .idu_iu_ex1_src0                           (idu_iu_ex1_src0                          ),
  .idu_iu_ex1_src0_reg                       (idu_iu_ex1_src0_reg                      ),
  .idu_iu_ex1_src1                           (idu_iu_ex1_src1                          ),
  .idu_iu_ex1_src1_reg                       (idu_iu_ex1_src1_reg                      ),
  .idu_iu_ex1_src2                           (idu_iu_ex1_src2                          ),
  .idu_iu_ex1_tail_int_vld                   (idu_iu_ex1_tail_int_vld                  ),
  .idu_iu_ex1_wb_vld                         (idu_iu_ex1_wb_vld                        ),
  .idu_iu_tail_fail                          (idu_iu_tail_fail                         ),
  .idu_iu_tail_fail_gate                     (idu_iu_tail_fail_gate                    ),
  .idu_lsu_ex1_ag_imm                        (idu_lsu_ex1_ag_imm                       ),
  .idu_lsu_ex1_base                          (idu_lsu_ex1_base                         ),
  .idu_lsu_ex1_base_sel                      (idu_lsu_ex1_base_sel                     ),
  .idu_lsu_ex1_base_wb                       (idu_lsu_ex1_base_wb                      ),
  .idu_lsu_ex1_data                          (idu_lsu_ex1_data                         ),
  .idu_lsu_ex1_dest_reg                      (idu_lsu_ex1_dest_reg                     ),
  .idu_lsu_ex1_dest_vld                      (idu_lsu_ex1_dest_vld                     ),
  .idu_lsu_ex1_dp_sel                        (idu_lsu_ex1_dp_sel                       ),
  .idu_lsu_ex1_fls                           (idu_lsu_ex1_fls                          ),
  .idu_lsu_ex1_func                          (idu_lsu_ex1_func                         ),
  .idu_lsu_ex1_gateclk_sel                   (idu_lsu_ex1_gateclk_sel                  ),
  .idu_lsu_ex1_halt_info                     (idu_lsu_ex1_halt_info                    ),
  .idu_lsu_ex1_ipop_int_mask                 (idu_lsu_ex1_ipop_int_mask                ),
  .idu_lsu_ex1_ipush_spec                    (idu_lsu_ex1_ipush_spec                   ),
  .idu_lsu_ex1_length                        (idu_lsu_ex1_length                       ),
  .idu_lsu_ex1_offset_sel                    (idu_lsu_ex1_offset_sel                   ),
  .idu_lsu_ex1_sel                           (idu_lsu_ex1_sel                          ),
  .idu_lsu_ex1_sign_extend                   (idu_lsu_ex1_sign_extend                  ),
  .idu_lsu_ex1_size                          (idu_lsu_ex1_size                         ),
  .idu_lsu_ex1_split                         (idu_lsu_ex1_split                        ),
  .idu_lsu_ex1_src0_reg                      (idu_lsu_ex1_src0_reg                     ),
  .idu_lsu_ex1_src1_depd                     (idu_lsu_ex1_src1_depd                    ),
  .idu_lsu_ex1_src1_reg                      (idu_lsu_ex1_src1_reg                     ),
  .idu_yy_xx_tail_ack                        (idu_yy_xx_tail_ack                       ),
  .ifu_idu_chgflw_flush                      (ifu_idu_chgflw_flush                     ),
  .ifu_idu_id_expt_high                      (ifu_idu_id_expt_high                     ),
  .ifu_idu_id_expt_vld                       (ifu_idu_id_expt_vld                      ),
  .ifu_idu_id_halt_info                      (ifu_idu_id_halt_info                     ),
  .ifu_idu_id_inst                           (ifu_idu_id_inst                          ),
  .ifu_idu_id_inst_vld                       (ifu_idu_id_inst_vld                      ),
  .ifu_idu_id_pred_taken                     (ifu_idu_id_pred_taken                    ),
  .ifu_idu_warm_up                           (ifu_idu_warm_up                          ),
  .iu_idu_bju_global_stall                   (iu_idu_bju_global_stall                  ),
  .iu_idu_bju_stall                          (iu_idu_bju_stall                         ),
  .iu_idu_ex1_fwd_data                       (iu_idu_ex1_fwd_data                      ),
  .iu_idu_ex1_fwd_preg                       (iu_idu_ex1_fwd_preg                      ),
  .iu_idu_ex1_fwd_vld                        (iu_idu_ex1_fwd_vld                       ),
  .iu_idu_ex1_src1_update_value              (iu_idu_ex1_src1_update_value             ),
  .iu_idu_ex1_stall                          (iu_idu_ex1_stall                         ),
  .iu_idu_ex2_div_vld                        (iu_idu_ex2_div_vld                       ),
  .iu_idu_ex2_fwd_data0                      (iu_idu_ex2_fwd_data0                     ),
  .iu_idu_ex2_fwd_data1                      (iu_idu_ex2_fwd_data1                     ),
  .iu_idu_ex2_fwd_preg0                      (iu_idu_ex2_fwd_preg0                     ),
  .iu_idu_ex2_fwd_preg1                      (iu_idu_ex2_fwd_preg1                     ),
  .iu_idu_ex2_fwd_vld0                       (iu_idu_ex2_fwd_vld0                      ),
  .iu_idu_ex2_fwd_vld1                       (iu_idu_ex2_fwd_vld1                      ),
  .iu_idu_ex2_inst_vld                       (iu_idu_ex2_inst_vld                      ),
  .iu_idu_ex2_rd_pair                        (iu_idu_ex2_rd_pair                       ),
  .iu_idu_id_stall                           (iu_idu_id_stall                          ),
  .iu_xx_no_op                               (iu_xx_no_op                              ),
  .iu_yy_xx_cancel                           (iu_yy_xx_cancel                          ),
  .lsu_idu_ex1_halt_info                     (lsu_idu_ex1_halt_info                    ),
  .lsu_idu_ex1_halt_info_update_en           (lsu_idu_ex1_halt_info_update_en          ),
  .lsu_idu_ex1_src1_update_en                (lsu_idu_ex1_src1_update_en               ),
  .lsu_idu_ex1_src1_update_en_gate           (lsu_idu_ex1_src1_update_en_gate          ),
  .lsu_idu_ex1_stall                         (lsu_idu_ex1_stall                        ),
  .lsu_idu_ex2_ffwd_data                     (lsu_idu_ex2_ffwd_data                    ),
  .lsu_idu_ex2_ffwd_vld                      (lsu_idu_ex2_ffwd_vld                     ),
  .lsu_idu_ex2_fwd_data                      (lsu_idu_ex2_fwd_data                     ),
  .lsu_idu_ex2_fwd_freg                      (lsu_idu_ex2_fwd_freg                     ),
  .lsu_idu_ex2_fwd_preg                      (lsu_idu_ex2_fwd_preg                     ),
  .lsu_idu_ex2_fwd_vld                       (lsu_idu_ex2_fwd_vld                      ),
  .lsu_idu_ex3_ffwd_data                     (lsu_idu_ex3_ffwd_data                    ),
  .lsu_idu_ex3_ffwd_vld                      (lsu_idu_ex3_ffwd_vld                     ),
  .lsu_idu_ex3_fwd_data                      (lsu_idu_ex3_fwd_data                     ),
  .lsu_idu_ex3_fwd_freg                      (lsu_idu_ex3_fwd_freg                     ),
  .lsu_idu_ex3_fwd_preg                      (lsu_idu_ex3_fwd_preg                     ),
  .lsu_idu_ex3_fwd_vld                       (lsu_idu_ex3_fwd_vld                      ),
  .lsu_idu_global_stall                      (lsu_idu_global_stall                     ),
  .lsu_idu_update_addr                       (lsu_idu_update_addr                      ),
  .lsu_idu_update_en                         (lsu_idu_update_en                        ),
  .lsu_idu_update_en_gate                    (lsu_idu_update_en_gate                   ),
  .lsu_idu_update_offset                     (lsu_idu_update_offset                    ),
  .lsu_xx_no_op                              (lsu_xx_no_op                             ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_idu_ex1_int_dis_stall_gateclk_req     (rtu_idu_ex1_int_dis_stall_gateclk_req    ),
  .rtu_idu_ex1_int_dis_stall_req             (rtu_idu_ex1_int_dis_stall_req            ),
  .rtu_idu_ex2_ipush_spec_inst_expt_vld      (rtu_idu_ex2_ipush_spec_inst_expt_vld     ),
  .rtu_idu_ex2_ipush_spec_inst_halt_info_vld (rtu_idu_ex2_ipush_spec_inst_halt_info_vld),
  .rtu_idu_fgpr_wb_data                      (rtu_idu_fgpr_wb_data                     ),
  .rtu_idu_fgpr_wb_flsu_vld                  (rtu_idu_fgpr_wb_flsu_vld                 ),
  .rtu_idu_fgpr_wb_reg                       (rtu_idu_fgpr_wb_reg                      ),
  .rtu_idu_fgpr_wb_vld                       (rtu_idu_fgpr_wb_vld                      ),
  .rtu_idu_flush_fe                          (rtu_idu_flush_fe                         ),
  .rtu_idu_flush_stall                       (rtu_idu_flush_stall                      ),
  .rtu_idu_id_tail_int_vld                   (rtu_idu_id_tail_int_vld                  ),
  .rtu_idu_inst_retire                       (rtu_idu_inst_retire                      ),
  .rtu_idu_late_flush                        (rtu_idu_late_flush                       ),
  .rtu_idu_wb0_data                          (rtu_idu_wb0_data                         ),
  .rtu_idu_wb0_fpu_vld                       (rtu_idu_wb0_fpu_vld                      ),
  .rtu_idu_wb0_preg                          (rtu_idu_wb0_preg                         ),
  .rtu_idu_wb0_vld                           (rtu_idu_wb0_vld                          ),
  .rtu_idu_wb1_data                          (rtu_idu_wb1_data                         ),
  .rtu_idu_wb1_lsu_vld                       (rtu_idu_wb1_lsu_vld                      ),
  .rtu_idu_wb1_preg                          (rtu_idu_wb1_preg                         ),
  .rtu_idu_wb1_vld                           (rtu_idu_wb1_vld                          ),
  .rtu_idu_wb2_data                          (rtu_idu_wb2_data                         ),
  .rtu_idu_wb2_preg                          (rtu_idu_wb2_preg                         ),
  .rtu_idu_wb2_vld                           (rtu_idu_wb2_vld                          ),
  .rtu_xx_ex1_stall                          (rtu_xx_ex1_stall                         ),
  .rtu_xx_no_op                              (rtu_xx_no_op                             ),
  .rtu_yy_xx_dbgon                           (rtu_yy_xx_dbgon                          ),
  .rtu_yy_xx_expt_int                        (rtu_yy_xx_expt_int                       ),
  .rtu_yy_xx_expt_vld                        (rtu_yy_xx_expt_vld                       ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          )
);


//==========================================================
//  Instance IU module
//==========================================================
// &Instance("pa_iu_top"); @43
pa_iu_top  x_pa_iu_top (
  .cp0_iu_adder_borrow_in            (cp0_iu_adder_borrow_in           ),
  .cp0_iu_adder_borrow_vld           (cp0_iu_adder_borrow_vld          ),
  .cp0_iu_icg_en                     (cp0_iu_icg_en                    ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cpurst_b                          (cpurst_b                         ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .fpu_iu_ex1_cmplt                  (fpu_iu_ex1_cmplt                 ),
  .fpu_iu_ex1_cmplt_dp               (fpu_iu_ex1_cmplt_dp              ),
  .idu_iu_ex1_ag_imm                 (idu_iu_ex1_ag_imm                ),
  .idu_iu_ex1_alu_cmplt_dp_sel       (idu_iu_ex1_alu_cmplt_dp_sel      ),
  .idu_iu_ex1_alu_gateclk_sel        (idu_iu_ex1_alu_gateclk_sel       ),
  .idu_iu_ex1_alu_sel                (idu_iu_ex1_alu_sel               ),
  .idu_iu_ex1_bht_pred               (idu_iu_ex1_bht_pred              ),
  .idu_iu_ex1_bju_cmplt_dp_sel       (idu_iu_ex1_bju_cmplt_dp_sel      ),
  .idu_iu_ex1_bju_depd_lsu_src0      (idu_iu_ex1_bju_depd_lsu_src0     ),
  .idu_iu_ex1_bju_depd_lsu_src1      (idu_iu_ex1_bju_depd_lsu_src1     ),
  .idu_iu_ex1_bju_gateclk_sel        (idu_iu_ex1_bju_gateclk_sel       ),
  .idu_iu_ex1_bju_sel                (idu_iu_ex1_bju_sel               ),
  .idu_iu_ex1_bju_use_pc             (idu_iu_ex1_bju_use_pc            ),
  .idu_iu_ex1_div_cmplt_dp_sel       (idu_iu_ex1_div_cmplt_dp_sel      ),
  .idu_iu_ex1_div_gateclk_sel        (idu_iu_ex1_div_gateclk_sel       ),
  .idu_iu_ex1_div_sel                (idu_iu_ex1_div_sel               ),
  .idu_iu_ex1_dst_preg               (idu_iu_ex1_dst_preg              ),
  .idu_iu_ex1_func                   (idu_iu_ex1_func                  ),
  .idu_iu_ex1_gateclk_vld            (idu_iu_ex1_gateclk_vld           ),
  .idu_iu_ex1_inst_len               (idu_iu_ex1_inst_len              ),
  .idu_iu_ex1_inst_vld               (idu_iu_ex1_inst_vld              ),
  .idu_iu_ex1_ipop_int_mask          (idu_iu_ex1_ipop_int_mask         ),
  .idu_iu_ex1_ipush_mie_en           (idu_iu_ex1_ipush_mie_en          ),
  .idu_iu_ex1_ipush_spec_fail        (idu_iu_ex1_ipush_spec_fail       ),
  .idu_iu_ex1_mul_cmplt_dp_sel       (idu_iu_ex1_mul_cmplt_dp_sel      ),
  .idu_iu_ex1_mul_gateclk_sel        (idu_iu_ex1_mul_gateclk_sel       ),
  .idu_iu_ex1_mul_high_sel           (idu_iu_ex1_mul_high_sel          ),
  .idu_iu_ex1_mul_sel                (idu_iu_ex1_mul_sel               ),
  .idu_iu_ex1_rd_pair                (idu_iu_ex1_rd_pair               ),
  .idu_iu_ex1_split                  (idu_iu_ex1_split                 ),
  .idu_iu_ex1_src0                   (idu_iu_ex1_src0                  ),
  .idu_iu_ex1_src0_reg               (idu_iu_ex1_src0_reg              ),
  .idu_iu_ex1_src1                   (idu_iu_ex1_src1                  ),
  .idu_iu_ex1_src1_reg               (idu_iu_ex1_src1_reg              ),
  .idu_iu_ex1_src2                   (idu_iu_ex1_src2                  ),
  .idu_iu_ex1_tail_int_vld           (idu_iu_ex1_tail_int_vld          ),
  .idu_iu_ex1_wb_vld                 (idu_iu_ex1_wb_vld                ),
  .idu_iu_tail_fail                  (idu_iu_tail_fail                 ),
  .idu_iu_tail_fail_gate             (idu_iu_tail_fail_gate            ),
  .ifu_iu_chgflw_pc                  (ifu_iu_chgflw_pc                 ),
  .ifu_iu_chgflw_vld                 (ifu_iu_chgflw_vld                ),
  .ifu_iu_ex1_pc_pred                (ifu_iu_ex1_pc_pred               ),
  .ifu_iu_reset_vld                  (ifu_iu_reset_vld                 ),
  .ifu_iu_warm_up                    (ifu_iu_warm_up                   ),
  .iu_cp0_ex1_borrow_expt_pc         (iu_cp0_ex1_borrow_expt_pc        ),
  .iu_dtu_debug_info                 (iu_dtu_debug_info                ),
  .iu_hpcp_inst_bht_mispred          (iu_hpcp_inst_bht_mispred         ),
  .iu_hpcp_inst_condbr               (iu_hpcp_inst_condbr              ),
  .iu_hpcp_inst_condbr_gate          (iu_hpcp_inst_condbr_gate         ),
  .iu_idu_bju_global_stall           (iu_idu_bju_global_stall          ),
  .iu_idu_bju_stall                  (iu_idu_bju_stall                 ),
  .iu_idu_ex1_fwd_data               (iu_idu_ex1_fwd_data              ),
  .iu_idu_ex1_fwd_preg               (iu_idu_ex1_fwd_preg              ),
  .iu_idu_ex1_fwd_vld                (iu_idu_ex1_fwd_vld               ),
  .iu_idu_ex1_src1_update_value      (iu_idu_ex1_src1_update_value     ),
  .iu_idu_ex1_stall                  (iu_idu_ex1_stall                 ),
  .iu_idu_ex2_div_vld                (iu_idu_ex2_div_vld               ),
  .iu_idu_ex2_fwd_data0              (iu_idu_ex2_fwd_data0             ),
  .iu_idu_ex2_fwd_data1              (iu_idu_ex2_fwd_data1             ),
  .iu_idu_ex2_fwd_preg0              (iu_idu_ex2_fwd_preg0             ),
  .iu_idu_ex2_fwd_preg1              (iu_idu_ex2_fwd_preg1             ),
  .iu_idu_ex2_fwd_vld0               (iu_idu_ex2_fwd_vld0              ),
  .iu_idu_ex2_fwd_vld1               (iu_idu_ex2_fwd_vld1              ),
  .iu_idu_ex2_inst_vld               (iu_idu_ex2_inst_vld              ),
  .iu_idu_ex2_rd_pair                (iu_idu_ex2_rd_pair               ),
  .iu_idu_id_stall                   (iu_idu_id_stall                  ),
  .iu_ifu_bht_cur_pc                 (iu_ifu_bht_cur_pc                ),
  .iu_ifu_bht_mispred                (iu_ifu_bht_mispred               ),
  .iu_ifu_bht_mispred_gate           (iu_ifu_bht_mispred_gate          ),
  .iu_ifu_bht_pred                   (iu_ifu_bht_pred                  ),
  .iu_ifu_bht_taken                  (iu_ifu_bht_taken                 ),
  .iu_ifu_br_vld                     (iu_ifu_br_vld                    ),
  .iu_ifu_br_vld_gate                (iu_ifu_br_vld_gate               ),
  .iu_ifu_ind_link_vld               (iu_ifu_ind_link_vld              ),
  .iu_ifu_link_vld                   (iu_ifu_link_vld                  ),
  .iu_ifu_link_vld_gate              (iu_ifu_link_vld_gate             ),
  .iu_ifu_pc_mispred                 (iu_ifu_pc_mispred                ),
  .iu_ifu_pc_mispred_gate            (iu_ifu_pc_mispred_gate           ),
  .iu_ifu_ret_vld                    (iu_ifu_ret_vld                   ),
  .iu_ifu_ret_vld_gate               (iu_ifu_ret_vld_gate              ),
  .iu_ifu_tar_pc                     (iu_ifu_tar_pc                    ),
  .iu_ifu_tar_pc_vld                 (iu_ifu_tar_pc_vld                ),
  .iu_ifu_tar_pc_vld_gate            (iu_ifu_tar_pc_vld_gate           ),
  .iu_lsu_ex1_lsi_rst                (iu_lsu_ex1_lsi_rst               ),
  .iu_lsu_ex2_wb0_grant              (iu_lsu_ex2_wb0_grant             ),
  .iu_rtu_ex1_bju_branch_inst        (iu_rtu_ex1_bju_branch_inst       ),
  .iu_rtu_ex1_bju_cmplt              (iu_rtu_ex1_bju_cmplt             ),
  .iu_rtu_ex1_bju_cmplt_dp           (iu_rtu_ex1_bju_cmplt_dp          ),
  .iu_rtu_ex1_bju_cur_pc             (iu_rtu_ex1_bju_cur_pc            ),
  .iu_rtu_ex1_bju_inst_len           (iu_rtu_ex1_bju_inst_len          ),
  .iu_rtu_ex1_bju_inst_vld           (iu_rtu_ex1_bju_inst_vld          ),
  .iu_rtu_ex1_bju_split_inst         (iu_rtu_ex1_bju_split_inst        ),
  .iu_rtu_ex1_cmplt                  (iu_rtu_ex1_cmplt                 ),
  .iu_rtu_ex1_cmplt_dp               (iu_rtu_ex1_cmplt_dp              ),
  .iu_rtu_ex1_inst_len               (iu_rtu_ex1_inst_len              ),
  .iu_rtu_ex1_inst_vld               (iu_rtu_ex1_inst_vld              ),
  .iu_rtu_ex1_ipop_int_mask          (iu_rtu_ex1_ipop_int_mask         ),
  .iu_rtu_ex1_ipush_mie_en           (iu_rtu_ex1_ipush_mie_en          ),
  .iu_rtu_ex1_ipush_spec_fail        (iu_rtu_ex1_ipush_spec_fail       ),
  .iu_rtu_ex1_next_pc                (iu_rtu_ex1_next_pc               ),
  .iu_rtu_ex1_split_inst             (iu_rtu_ex1_split_inst            ),
  .iu_rtu_ex1_tail_int_vld           (iu_rtu_ex1_tail_int_vld          ),
  .iu_rtu_ex2_bju_flush              (iu_rtu_ex2_bju_flush             ),
  .iu_rtu_ex2_bju_next_pc            (iu_rtu_ex2_bju_next_pc           ),
  .iu_rtu_ex2_bju_next_pc_vld        (iu_rtu_ex2_bju_next_pc_vld       ),
  .iu_rtu_wb0_data                   (iu_rtu_wb0_data                  ),
  .iu_rtu_wb0_preg                   (iu_rtu_wb0_preg                  ),
  .iu_rtu_wb0_vld                    (iu_rtu_wb0_vld                   ),
  .iu_xx_no_op                       (iu_xx_no_op                      ),
  .iu_yy_xx_cancel                   (iu_yy_xx_cancel                  ),
  .lsu_iu_ex1_base_wb                (lsu_iu_ex1_base_wb               ),
  .lsu_iu_ex1_src1_sel               (lsu_iu_ex1_src1_sel              ),
  .lsu_iu_ex2_data                   (lsu_iu_ex2_data                  ),
  .lsu_iu_ex2_data_vld               (lsu_iu_ex2_data_vld              ),
  .lsu_iu_ex2_dest_reg               (lsu_iu_ex2_dest_reg              ),
  .lsu_iu_ex2_lsi_dst_preg           (lsu_iu_ex2_lsi_dst_preg          ),
  .lsu_iu_ex2_lsi_rslt               (lsu_iu_ex2_lsi_rslt              ),
  .lsu_iu_ex2_lsi_rslt_vld           (lsu_iu_ex2_lsi_rslt_vld          ),
  .lsu_rtu_ex1_cmplt_dp              (lsu_rtu_ex1_cmplt_dp             ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .rtu_iu_bju_ex2_cur_pc             (rtu_iu_bju_ex2_cur_pc            ),
  .rtu_iu_ex1_cmplt_dp_vld           (rtu_iu_ex1_cmplt_dp_vld          ),
  .rtu_iu_ex1_cmplt_inst_len         (rtu_iu_ex1_cmplt_inst_len        ),
  .rtu_iu_ex1_cmplt_split_inst       (rtu_iu_ex1_cmplt_split_inst      ),
  .rtu_iu_ex1_cmplt_vld              (rtu_iu_ex1_cmplt_vld             ),
  .rtu_iu_pending_spec_expt_vld      (rtu_iu_pending_spec_expt_vld     ),
  .rtu_iu_pending_spec_halt_info_vld (rtu_iu_pending_spec_halt_info_vld),
  .rtu_xx_ex1_stall                  (rtu_xx_ex1_stall                 ),
  .rtu_yy_xx_async_flush             (rtu_yy_xx_async_flush            ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .sysio_iu_rst_addr                 (sysio_iu_rst_addr                )
);


// //&Force("output", "iu_xx_no_op"); @45

//==========================================================
//  Instance LSU module
//==========================================================
// &Instance("pa_axi_lsu_top", "x_pa_lsu_top"); @51
// &Instance("pa_lsu_top"); @53
pa_lsu_top  x_pa_lsu_top (
  .bmu_lsu_acc_err                  (bmu_lsu_acc_err                 ),
  .bmu_lsu_grant                    (bmu_lsu_grant                   ),
  .bmu_lsu_rdata                    (bmu_lsu_rdata                   ),
  .bmu_lsu_trans_cmplt              (bmu_lsu_trans_cmplt             ),
  .cp0_lsu_dcache_en                (cp0_lsu_dcache_en               ),
  .cp0_lsu_dcache_wa                (cp0_lsu_dcache_wa               ),
  .cp0_lsu_dcache_wb                (cp0_lsu_dcache_wb               ),
  .cp0_lsu_fence_req                (cp0_lsu_fence_req               ),
  .cp0_lsu_icc_addr                 (cp0_lsu_icc_addr                ),
  .cp0_lsu_icc_op                   (cp0_lsu_icc_op                  ),
  .cp0_lsu_icc_req                  (cp0_lsu_icc_req                 ),
  .cp0_lsu_icc_type                 (cp0_lsu_icc_type                ),
  .cp0_lsu_icg_en                   (cp0_lsu_icg_en                  ),
  .cp0_lsu_mm                       (cp0_lsu_mm                      ),
  .cp0_lsu_sync_req                 (cp0_lsu_sync_req                ),
  .cp0_xx_async_expt_en             (cp0_xx_async_expt_en            ),
  .cp0_yy_mach_mode                 (cp0_yy_mach_mode                ),
  .cpurst_b                         (cpurst_b                        ),
  .dtu_lsu_addr_trig_en             (dtu_lsu_addr_trig_en            ),
  .dtu_lsu_data_trig_en             (dtu_lsu_data_trig_en            ),
  .dtu_lsu_halt_info                (dtu_lsu_halt_info               ),
  .dtu_lsu_halt_info_vld            (dtu_lsu_halt_info_vld           ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_lsu_ex1_ag_imm               (idu_lsu_ex1_ag_imm              ),
  .idu_lsu_ex1_base                 (idu_lsu_ex1_base                ),
  .idu_lsu_ex1_base_sel             (idu_lsu_ex1_base_sel            ),
  .idu_lsu_ex1_base_wb              (idu_lsu_ex1_base_wb             ),
  .idu_lsu_ex1_data                 (idu_lsu_ex1_data                ),
  .idu_lsu_ex1_dest_reg             (idu_lsu_ex1_dest_reg            ),
  .idu_lsu_ex1_dest_vld             (idu_lsu_ex1_dest_vld            ),
  .idu_lsu_ex1_dp_sel               (idu_lsu_ex1_dp_sel              ),
  .idu_lsu_ex1_fls                  (idu_lsu_ex1_fls                 ),
  .idu_lsu_ex1_func                 (idu_lsu_ex1_func                ),
  .idu_lsu_ex1_gateclk_sel          (idu_lsu_ex1_gateclk_sel         ),
  .idu_lsu_ex1_halt_info            (idu_lsu_ex1_halt_info           ),
  .idu_lsu_ex1_ipop_int_mask        (idu_lsu_ex1_ipop_int_mask       ),
  .idu_lsu_ex1_ipush_spec           (idu_lsu_ex1_ipush_spec          ),
  .idu_lsu_ex1_length               (idu_lsu_ex1_length              ),
  .idu_lsu_ex1_offset_sel           (idu_lsu_ex1_offset_sel          ),
  .idu_lsu_ex1_sel                  (idu_lsu_ex1_sel                 ),
  .idu_lsu_ex1_sign_extend          (idu_lsu_ex1_sign_extend         ),
  .idu_lsu_ex1_size                 (idu_lsu_ex1_size                ),
  .idu_lsu_ex1_split                (idu_lsu_ex1_split               ),
  .idu_lsu_ex1_src0_reg             (idu_lsu_ex1_src0_reg            ),
  .idu_lsu_ex1_src1_depd            (idu_lsu_ex1_src1_depd           ),
  .idu_lsu_ex1_src1_reg             (idu_lsu_ex1_src1_reg            ),
  .ifu_lsu_warm_up                  (ifu_lsu_warm_up                 ),
  .iu_lsu_ex1_lsi_rst               (iu_lsu_ex1_lsi_rst              ),
  .iu_lsu_ex2_wb0_grant             (iu_lsu_ex2_wb0_grant            ),
  .lsu_biu_amo_pmp_deny             (lsu_biu_amo_pmp_deny            ),
  .lsu_biu_async_expt_ack           (lsu_biu_async_expt_ack          ),
  .lsu_bmu_acc_deny                 (lsu_bmu_acc_deny                ),
  .lsu_bmu_addr                     (lsu_bmu_addr                    ),
  .lsu_bmu_burst                    (lsu_bmu_burst                   ),
  .lsu_bmu_lock                     (lsu_bmu_lock                    ),
  .lsu_bmu_lrsc                     (lsu_bmu_lrsc                    ),
  .lsu_bmu_prot                     (lsu_bmu_prot                    ),
  .lsu_bmu_req                      (lsu_bmu_req                     ),
  .lsu_bmu_req_dp                   (lsu_bmu_req_dp                  ),
  .lsu_bmu_seq                      (lsu_bmu_seq                     ),
  .lsu_bmu_size                     (lsu_bmu_size                    ),
  .lsu_bmu_wdata                    (lsu_bmu_wdata                   ),
  .lsu_bmu_write                    (lsu_bmu_write                   ),
  .lsu_cp0_fence_ack                (lsu_cp0_fence_ack               ),
  .lsu_cp0_icc_done                 (lsu_cp0_icc_done                ),
  .lsu_cp0_sync_ack                 (lsu_cp0_sync_ack                ),
  .lsu_dtu_debug_info               (lsu_dtu_debug_info              ),
  .lsu_dtu_halt_info                (lsu_dtu_halt_info               ),
  .lsu_dtu_last_check               (lsu_dtu_last_check              ),
  .lsu_dtu_ldst_addr                (lsu_dtu_ldst_addr               ),
  .lsu_dtu_ldst_addr_vld            (lsu_dtu_ldst_addr_vld           ),
  .lsu_dtu_ldst_bytes_vld           (lsu_dtu_ldst_bytes_vld          ),
  .lsu_dtu_ldst_data                (lsu_dtu_ldst_data               ),
  .lsu_dtu_ldst_data_vld            (lsu_dtu_ldst_data_vld           ),
  .lsu_dtu_ldst_type                (lsu_dtu_ldst_type               ),
  .lsu_dtu_mem_access_size          (lsu_dtu_mem_access_size         ),
  .lsu_hpcp_cache_read_access       (lsu_hpcp_cache_read_access      ),
  .lsu_hpcp_cache_read_access_gate  (lsu_hpcp_cache_read_access_gate ),
  .lsu_hpcp_cache_read_miss         (lsu_hpcp_cache_read_miss        ),
  .lsu_hpcp_cache_read_miss_gate    (lsu_hpcp_cache_read_miss_gate   ),
  .lsu_hpcp_cache_write_access      (lsu_hpcp_cache_write_access     ),
  .lsu_hpcp_cache_write_access_gate (lsu_hpcp_cache_write_access_gate),
  .lsu_hpcp_cache_write_miss        (lsu_hpcp_cache_write_miss       ),
  .lsu_hpcp_cache_write_miss_gate   (lsu_hpcp_cache_write_miss_gate  ),
  .lsu_hpcp_inst_store              (lsu_hpcp_inst_store             ),
  .lsu_hpcp_inst_store_gate         (lsu_hpcp_inst_store_gate        ),
  .lsu_idu_ex1_halt_info            (lsu_idu_ex1_halt_info           ),
  .lsu_idu_ex1_halt_info_update_en  (lsu_idu_ex1_halt_info_update_en ),
  .lsu_idu_ex1_src1_update_en       (lsu_idu_ex1_src1_update_en      ),
  .lsu_idu_ex1_src1_update_en_gate  (lsu_idu_ex1_src1_update_en_gate ),
  .lsu_idu_ex1_stall                (lsu_idu_ex1_stall               ),
  .lsu_idu_ex2_ffwd_data            (lsu_idu_ex2_ffwd_data           ),
  .lsu_idu_ex2_ffwd_vld             (lsu_idu_ex2_ffwd_vld            ),
  .lsu_idu_ex2_fwd_data             (lsu_idu_ex2_fwd_data            ),
  .lsu_idu_ex2_fwd_freg             (lsu_idu_ex2_fwd_freg            ),
  .lsu_idu_ex2_fwd_preg             (lsu_idu_ex2_fwd_preg            ),
  .lsu_idu_ex2_fwd_vld              (lsu_idu_ex2_fwd_vld             ),
  .lsu_idu_ex3_ffwd_data            (lsu_idu_ex3_ffwd_data           ),
  .lsu_idu_ex3_ffwd_vld             (lsu_idu_ex3_ffwd_vld            ),
  .lsu_idu_ex3_fwd_data             (lsu_idu_ex3_fwd_data            ),
  .lsu_idu_ex3_fwd_freg             (lsu_idu_ex3_fwd_freg            ),
  .lsu_idu_ex3_fwd_preg             (lsu_idu_ex3_fwd_preg            ),
  .lsu_idu_ex3_fwd_vld              (lsu_idu_ex3_fwd_vld             ),
  .lsu_idu_global_stall             (lsu_idu_global_stall            ),
  .lsu_idu_update_addr              (lsu_idu_update_addr             ),
  .lsu_idu_update_en                (lsu_idu_update_en               ),
  .lsu_idu_update_en_gate           (lsu_idu_update_en_gate          ),
  .lsu_idu_update_offset            (lsu_idu_update_offset           ),
  .lsu_iu_ex1_base_wb               (lsu_iu_ex1_base_wb              ),
  .lsu_iu_ex1_src1_sel              (lsu_iu_ex1_src1_sel             ),
  .lsu_iu_ex2_data                  (lsu_iu_ex2_data                 ),
  .lsu_iu_ex2_data_vld              (lsu_iu_ex2_data_vld             ),
  .lsu_iu_ex2_dest_reg              (lsu_iu_ex2_dest_reg             ),
  .lsu_iu_ex2_lsi_dst_preg          (lsu_iu_ex2_lsi_dst_preg         ),
  .lsu_iu_ex2_lsi_rslt              (lsu_iu_ex2_lsi_rslt             ),
  .lsu_iu_ex2_lsi_rslt_vld          (lsu_iu_ex2_lsi_rslt_vld         ),
  .lsu_pmp_addr                     (lsu_pmp_addr                    ),
  .lsu_pmp_write                    (lsu_pmp_write                   ),
  .lsu_rtu_async_expt_vld           (lsu_rtu_async_expt_vld          ),
  .lsu_rtu_async_ld_inst            (lsu_rtu_async_ld_inst           ),
  .lsu_rtu_async_tval               (lsu_rtu_async_tval              ),
  .lsu_rtu_ex1_cmplt                (lsu_rtu_ex1_cmplt               ),
  .lsu_rtu_ex1_cmplt_dp             (lsu_rtu_ex1_cmplt_dp            ),
  .lsu_rtu_ex1_halt_info            (lsu_rtu_ex1_halt_info           ),
  .lsu_rtu_ex1_inst_len             (lsu_rtu_ex1_inst_len            ),
  .lsu_rtu_ex1_inst_vld             (lsu_rtu_ex1_inst_vld            ),
  .lsu_rtu_ex1_ipop_int_mask        (lsu_rtu_ex1_ipop_int_mask       ),
  .lsu_rtu_ex1_ipush_spec_inst      (lsu_rtu_ex1_ipush_spec_inst     ),
  .lsu_rtu_ex1_split_inst           (lsu_rtu_ex1_split_inst          ),
  .lsu_rtu_ex2_bus_err              (lsu_rtu_ex2_bus_err             ),
  .lsu_rtu_ex2_expt_inst            (lsu_rtu_ex2_expt_inst           ),
  .lsu_rtu_ex2_expt_vec             (lsu_rtu_ex2_expt_vec            ),
  .lsu_rtu_ex2_stall                (lsu_rtu_ex2_stall               ),
  .lsu_rtu_ex2_tval                 (lsu_rtu_ex2_tval                ),
  .lsu_rtu_fgpr_wb_data             (lsu_rtu_fgpr_wb_data            ),
  .lsu_rtu_fgpr_wb_reg              (lsu_rtu_fgpr_wb_reg             ),
  .lsu_rtu_fgpr_wb_vld              (lsu_rtu_fgpr_wb_vld             ),
  .lsu_rtu_sync_ack                 (lsu_rtu_sync_ack                ),
  .lsu_rtu_wb_data                  (lsu_rtu_wb_data                 ),
  .lsu_rtu_wb_preg                  (lsu_rtu_wb_preg                 ),
  .lsu_rtu_wb_vld                   (lsu_rtu_wb_vld                  ),
  .lsu_sysmap_pa                    (lsu_sysmap_pa                   ),
  .lsu_xx_flush                     (lsu_xx_flush                    ),
  .lsu_xx_no_op                     (lsu_xx_no_op                    ),
  .lsu_xx_warm_up                   (lsu_xx_warm_up                  ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .pmp_lsu_acc_deny                 (pmp_lsu_acc_deny                ),
  .rtu_lsu_async_expt_ack           (rtu_lsu_async_expt_ack          ),
  .rtu_lsu_expt_ack                 (rtu_lsu_expt_ack                ),
  .rtu_lsu_expt_exit                (rtu_lsu_expt_exit               ),
  .rtu_lsu_fgpr_wb_data             (rtu_lsu_fgpr_wb_data            ),
  .rtu_lsu_fgpr_wb_reg              (rtu_lsu_fgpr_wb_reg             ),
  .rtu_lsu_fgpr_wb_vld              (rtu_lsu_fgpr_wb_vld             ),
  .rtu_lsu_inst_retire              (rtu_lsu_inst_retire             ),
  .rtu_lsu_sync_req                 (rtu_lsu_sync_req                ),
  .rtu_lsu_wb1_data                 (rtu_lsu_wb1_data                ),
  .rtu_lsu_wb1_lsu_vld              (rtu_lsu_wb1_lsu_vld             ),
  .rtu_lsu_wb1_preg                 (rtu_lsu_wb1_preg                ),
  .rtu_xx_ex1_stall                 (rtu_xx_ex1_stall                ),
  .rtu_yy_xx_async_flush            (rtu_yy_xx_async_flush           ),
  .rtu_yy_xx_dbgon                  (rtu_yy_xx_dbgon                 ),
  .rtu_yy_xx_flush                  (rtu_yy_xx_flush                 ),
  .sysmap_lsu_flg                   (sysmap_lsu_flg                  )
);


// //&Force("output", "lsu_xx_no_op"); @56

//==========================================================
//  Instance CP0 sub module
//==========================================================
// &Instance("pa_cp0_top"); @61
pa_cp0_top  x_pa_cp0_top (
  .cp0_biu_icg_en              (cp0_biu_icg_en             ),
  .cp0_dtu_addr                (cp0_dtu_addr               ),
  .cp0_dtu_debug_info          (cp0_dtu_debug_info         ),
  .cp0_dtu_icg_en              (cp0_dtu_icg_en             ),
  .cp0_dtu_int_id              (cp0_dtu_int_id             ),
  .cp0_dtu_mexpt_vld           (cp0_dtu_mexpt_vld          ),
  .cp0_dtu_pcfifo_frz          (cp0_dtu_pcfifo_frz         ),
  .cp0_dtu_rreg                (cp0_dtu_rreg               ),
  .cp0_dtu_wdata               (cp0_dtu_wdata              ),
  .cp0_dtu_wreg                (cp0_dtu_wreg               ),
  .cp0_fpu_icg_en              (cp0_fpu_icg_en             ),
  .cp0_fpu_xx_dqnan            (cp0_fpu_xx_dqnan           ),
  .cp0_fpu_xx_rm               (cp0_fpu_xx_rm              ),
  .cp0_hpcp_icg_en             (cp0_hpcp_icg_en            ),
  .cp0_hpcp_index              (cp0_hpcp_index             ),
  .cp0_hpcp_pmdm               (cp0_hpcp_pmdm              ),
  .cp0_hpcp_pmdu               (cp0_hpcp_pmdu              ),
  .cp0_hpcp_wdata              (cp0_hpcp_wdata             ),
  .cp0_hpcp_wreg               (cp0_hpcp_wreg              ),
  .cp0_idu_ex1_stall           (cp0_idu_ex1_stall          ),
  .cp0_idu_fs                  (cp0_idu_fs                 ),
  .cp0_idu_icg_en              (cp0_idu_icg_en             ),
  .cp0_idu_mcause              (cp0_idu_mcause             ),
  .cp0_idu_mepc                (cp0_idu_mepc               ),
  .cp0_idu_rm                  (cp0_idu_rm                 ),
  .cp0_idu_sp_use_scratch      (cp0_idu_sp_use_scratch     ),
  .cp0_idu_sp_wdata            (cp0_idu_sp_wdata           ),
  .cp0_idu_sp_wen              (cp0_idu_sp_wen             ),
  .cp0_idu_sp_wen_gate         (cp0_idu_sp_wen_gate        ),
  .cp0_idu_spec_push_en        (cp0_idu_spec_push_en       ),
  .cp0_idu_swap_sp_en          (cp0_idu_swap_sp_en         ),
  .cp0_ifu_bht_en              (cp0_ifu_bht_en             ),
  .cp0_ifu_bht_inv             (cp0_ifu_bht_inv            ),
  .cp0_ifu_btb_clr             (cp0_ifu_btb_clr            ),
  .cp0_ifu_btb_en              (cp0_ifu_btb_en             ),
  .cp0_ifu_icache_en           (cp0_ifu_icache_en          ),
  .cp0_ifu_icache_inv_addr     (cp0_ifu_icache_inv_addr    ),
  .cp0_ifu_icache_inv_req      (cp0_ifu_icache_inv_req     ),
  .cp0_ifu_icache_inv_type     (cp0_ifu_icache_inv_type    ),
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_ifu_in_lpmd             (cp0_ifu_in_lpmd            ),
  .cp0_ifu_lpmd_req            (cp0_ifu_lpmd_req           ),
  .cp0_ifu_mtvec               (cp0_ifu_mtvec              ),
  .cp0_ifu_ras_en              (cp0_ifu_ras_en             ),
  .cp0_ifu_rst_inv_done        (cp0_ifu_rst_inv_done       ),
  .cp0_ifu_srst_mask           (cp0_ifu_srst_mask          ),
  .cp0_ifu_srst_req            (cp0_ifu_srst_req           ),
  .cp0_iu_adder_borrow_in      (cp0_iu_adder_borrow_in     ),
  .cp0_iu_adder_borrow_vld     (cp0_iu_adder_borrow_vld    ),
  .cp0_iu_icg_en               (cp0_iu_icg_en              ),
  .cp0_lsu_dcache_en           (cp0_lsu_dcache_en          ),
  .cp0_lsu_dcache_wa           (cp0_lsu_dcache_wa          ),
  .cp0_lsu_dcache_wb           (cp0_lsu_dcache_wb          ),
  .cp0_lsu_fence_req           (cp0_lsu_fence_req          ),
  .cp0_lsu_icc_addr            (cp0_lsu_icc_addr           ),
  .cp0_lsu_icc_op              (cp0_lsu_icc_op             ),
  .cp0_lsu_icc_req             (cp0_lsu_icc_req            ),
  .cp0_lsu_icc_type            (cp0_lsu_icc_type           ),
  .cp0_lsu_icg_en              (cp0_lsu_icg_en             ),
  .cp0_lsu_mm                  (cp0_lsu_mm                 ),
  .cp0_lsu_sync_req            (cp0_lsu_sync_req           ),
  .cp0_pad_mcause              (cp0_pad_mcause             ),
  .cp0_pad_mintstatus          (cp0_pad_mintstatus         ),
  .cp0_pad_mstatus             (cp0_pad_mstatus            ),
  .cp0_pmp_csr_sel             (cp0_pmp_csr_sel            ),
  .cp0_pmp_csr_wen             (cp0_pmp_csr_wen            ),
  .cp0_pmp_icg_en              (cp0_pmp_icg_en             ),
  .cp0_pmp_mstatus_mpp         (cp0_pmp_mstatus_mpp        ),
  .cp0_pmp_mstatus_mprv        (cp0_pmp_mstatus_mprv       ),
  .cp0_pmp_updt_data           (cp0_pmp_updt_data          ),
  .cp0_rtu_ex1_chgflw_pc       (cp0_rtu_ex1_chgflw_pc      ),
  .cp0_rtu_ex1_chgflw_vld      (cp0_rtu_ex1_chgflw_vld     ),
  .cp0_rtu_ex1_cmplt           (cp0_rtu_ex1_cmplt          ),
  .cp0_rtu_ex1_cmplt_dp        (cp0_rtu_ex1_cmplt_dp       ),
  .cp0_rtu_ex1_dret            (cp0_rtu_ex1_dret           ),
  .cp0_rtu_ex1_ebreak          (cp0_rtu_ex1_ebreak         ),
  .cp0_rtu_ex1_expt_inst       (cp0_rtu_ex1_expt_inst      ),
  .cp0_rtu_ex1_expt_tval       (cp0_rtu_ex1_expt_tval      ),
  .cp0_rtu_ex1_expt_vec        (cp0_rtu_ex1_expt_vec       ),
  .cp0_rtu_ex1_flush           (cp0_rtu_ex1_flush          ),
  .cp0_rtu_ex1_halt_info       (cp0_rtu_ex1_halt_info      ),
  .cp0_rtu_ex1_inst_len        (cp0_rtu_ex1_inst_len       ),
  .cp0_rtu_ex1_inst_vld        (cp0_rtu_ex1_inst_vld       ),
  .cp0_rtu_ex1_ipush_spec_fail (cp0_rtu_ex1_ipush_spec_fail),
  .cp0_rtu_ex1_mret            (cp0_rtu_ex1_mret           ),
  .cp0_rtu_ex1_split_inst      (cp0_rtu_ex1_split_inst     ),
  .cp0_rtu_ex1_tail_fail       (cp0_rtu_ex1_tail_fail      ),
  .cp0_rtu_icg_en              (cp0_rtu_icg_en             ),
  .cp0_rtu_in_expt             (cp0_rtu_in_expt            ),
  .cp0_rtu_in_nmi              (cp0_rtu_in_nmi             ),
  .cp0_rtu_int_level           (cp0_rtu_int_level          ),
  .cp0_rtu_int_mode            (cp0_rtu_int_mode           ),
  .cp0_rtu_mie                 (cp0_rtu_mie                ),
  .cp0_rtu_mnxti_vld           (cp0_rtu_mnxti_vld          ),
  .cp0_rtu_mpil                (cp0_rtu_mpil               ),
  .cp0_rtu_pm_bypass           (cp0_rtu_pm_bypass          ),
  .cp0_rtu_tail_int_hv         (cp0_rtu_tail_int_hv        ),
  .cp0_rtu_tail_int_id         (cp0_rtu_tail_int_id        ),
  .cp0_rtu_wb_data             (cp0_rtu_wb_data            ),
  .cp0_rtu_wb_preg             (cp0_rtu_wb_preg            ),
  .cp0_rtu_wb_vld              (cp0_rtu_wb_vld             ),
  .cp0_rtu_wfe_en              (cp0_rtu_wfe_en             ),
  .cp0_sysio_ipend_b           (cp0_sysio_ipend_b          ),
  .cp0_sysio_lpmd_b            (cp0_sysio_lpmd_b           ),
  .cp0_sysio_srst              (cp0_sysio_srst             ),
  .cp0_xx_async_expt_en        (cp0_xx_async_expt_en       ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cp0_yy_cskyisaee            (cp0_yy_cskyisaee           ),
  .cp0_yy_mach_mode            (cp0_yy_mach_mode           ),
  .cp0_yy_priv_mode            (cp0_yy_priv_mode           ),
  .cpurst_b                    (cpurst_b                   ),
  .dtu_cp0_dcsr_mprven         (dtu_cp0_dcsr_mprven        ),
  .dtu_cp0_dcsr_prv            (dtu_cp0_dcsr_prv           ),
  .dtu_cp0_rdata               (dtu_cp0_rdata              ),
  .dtu_cp0_wake_up             (dtu_cp0_wake_up            ),
  .forever_cpuclk              (forever_cpuclk             ),
  .fpu_cp0_wb_fflags           (fpu_cp0_wb_fflags          ),
  .fpu_cp0_wb_fflags_updt      (fpu_cp0_wb_fflags_updt     ),
  .hpcp_cp0_data               (hpcp_cp0_data              ),
  .idu_cp0_ex1_cmplt_dp_sel    (idu_cp0_ex1_cmplt_dp_sel   ),
  .idu_cp0_ex1_dst_idx         (idu_cp0_ex1_dst_idx        ),
  .idu_cp0_ex1_dst_vld         (idu_cp0_ex1_dst_vld        ),
  .idu_cp0_ex1_expt_high       (idu_cp0_ex1_expt_high      ),
  .idu_cp0_ex1_expt_type       (idu_cp0_ex1_expt_type      ),
  .idu_cp0_ex1_expt_vld        (idu_cp0_ex1_expt_vld       ),
  .idu_cp0_ex1_func            (idu_cp0_ex1_func           ),
  .idu_cp0_ex1_gateclk_sel     (idu_cp0_ex1_gateclk_sel    ),
  .idu_cp0_ex1_halt_info       (idu_cp0_ex1_halt_info      ),
  .idu_cp0_ex1_inst_len        (idu_cp0_ex1_inst_len       ),
  .idu_cp0_ex1_ipush_spec_fail (idu_cp0_ex1_ipush_spec_fail),
  .idu_cp0_ex1_opcode          (idu_cp0_ex1_opcode         ),
  .idu_cp0_ex1_rs1             (idu_cp0_ex1_rs1            ),
  .idu_cp0_ex1_rs2             (idu_cp0_ex1_rs2            ),
  .idu_cp0_ex1_sel             (idu_cp0_ex1_sel            ),
  .idu_cp0_ex1_split_inst      (idu_cp0_ex1_split_inst     ),
  .idu_cp0_ex1_tail_fail       (idu_cp0_ex1_tail_fail      ),
  .idu_cp0_id_tail_vld         (idu_cp0_id_tail_vld        ),
  .idu_cp0_ipop_data           (idu_cp0_ipop_data          ),
  .idu_cp0_mcause_wen          (idu_cp0_mcause_wen         ),
  .idu_cp0_mepc_wen            (idu_cp0_mepc_wen           ),
  .idu_cp0_sp_reg              (idu_cp0_sp_reg             ),
  .idu_cp0_sp_swap_pending     (idu_cp0_sp_swap_pending    ),
  .idu_cp0_sp_swap_req         (idu_cp0_sp_swap_req        ),
  .idu_cp0_sp_swap_req_gate    (idu_cp0_sp_swap_req_gate   ),
  .idu_yy_xx_tail_ack          (idu_yy_xx_tail_ack         ),
  .ifu_cp0_bht_inv_done        (ifu_cp0_bht_inv_done       ),
  .ifu_cp0_icache_inv_done     (ifu_cp0_icache_inv_done    ),
  .ifu_cp0_lpmd_ack            (ifu_cp0_lpmd_ack           ),
  .ifu_cp0_rst_inv_req         (ifu_cp0_rst_inv_req        ),
  .ifu_cp0_srst_ack            (ifu_cp0_srst_ack           ),
  .ifu_cp0_vec_err             (ifu_cp0_vec_err            ),
  .ifu_cp0_vec_succeed         (ifu_cp0_vec_succeed        ),
  .ifu_cp0_warm_up             (ifu_cp0_warm_up            ),
  .iu_cp0_ex1_borrow_expt_pc   (iu_cp0_ex1_borrow_expt_pc  ),
  .lsu_cp0_fence_ack           (lsu_cp0_fence_ack          ),
  .lsu_cp0_icc_done            (lsu_cp0_icc_done           ),
  .lsu_cp0_sync_ack            (lsu_cp0_sync_ack           ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .pmp_cp0_data                (pmp_cp0_data               ),
  .rtu_cp0_bus_error           (rtu_cp0_bus_error          ),
  .rtu_cp0_epc                 (rtu_cp0_epc                ),
  .rtu_cp0_exit_debug          (rtu_cp0_exit_debug         ),
  .rtu_cp0_fp_dirty_vld        (rtu_cp0_fp_dirty_vld       ),
  .rtu_cp0_int_level           (rtu_cp0_int_level          ),
  .rtu_cp0_lockup_clr          (rtu_cp0_lockup_clr         ),
  .rtu_cp0_lockup_vld          (rtu_cp0_lockup_vld         ),
  .rtu_cp0_mie_en              (rtu_cp0_mie_en             ),
  .rtu_cp0_mie_gateclk_en      (rtu_cp0_mie_gateclk_en     ),
  .rtu_cp0_mnxti_pending_vld   (rtu_cp0_mnxti_pending_vld  ),
  .rtu_cp0_nmi_vld             (rtu_cp0_nmi_vld            ),
  .rtu_cp0_pending_int_hv      (rtu_cp0_pending_int_hv     ),
  .rtu_cp0_pending_int_id      (rtu_cp0_pending_int_id     ),
  .rtu_cp0_pending_int_level   (rtu_cp0_pending_int_level  ),
  .rtu_cp0_tval                (rtu_cp0_tval               ),
  .rtu_cp0_wk_int              (rtu_cp0_wk_int             ),
  .rtu_yy_xx_dbgon             (rtu_yy_xx_dbgon            ),
  .rtu_yy_xx_expt_int          (rtu_yy_xx_expt_int         ),
  .rtu_yy_xx_expt_vec          (rtu_yy_xx_expt_vec         ),
  .rtu_yy_xx_expt_vld          (rtu_yy_xx_expt_vld         ),
  .rtu_yy_xx_flush             (rtu_yy_xx_flush            ),
  .rtu_yy_xx_int_hv            (rtu_yy_xx_int_hv           ),
  .rtu_yy_xx_tail_int_vld      (rtu_yy_xx_tail_int_vld     ),
  .sysio_cp0_clk_en            (sysio_cp0_clk_en           ),
  .sysio_cp0_clkratio          (sysio_cp0_clkratio         ),
  .sysio_cp0_rst_addr          (sysio_cp0_rst_addr         ),
  .tcip_cp0_clic_base          (tcip_cp0_clic_base         )
);

// &Force("output", "cp0_yy_priv_mode"); @62
// &Force("output", "cp0_yy_clk_en"); @64
// &Force("output", "cp0_yy_mach_mode"); @65
// &Force("output", "cp0_yy_clk_en"); @68
// &Force("output", "cp0_yy_clk_en");    @71

//==========================================================
//  Instance RTU module
//==========================================================
// &Instance("pa_rtu_top"); @79
pa_rtu_top  x_pa_rtu_top (
  .clic_cpu_int_hv                           (clic_cpu_int_hv                          ),
  .clic_cpu_int_id                           (clic_cpu_int_id                          ),
  .clic_cpu_int_il                           (clic_cpu_int_il                          ),
  .clic_cpu_int_priv                         (clic_cpu_int_priv                        ),
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
  .cp0_rtu_in_expt                           (cp0_rtu_in_expt                          ),
  .cp0_rtu_in_nmi                            (cp0_rtu_in_nmi                           ),
  .cp0_rtu_int_level                         (cp0_rtu_int_level                        ),
  .cp0_rtu_int_mode                          (cp0_rtu_int_mode                         ),
  .cp0_rtu_mie                               (cp0_rtu_mie                              ),
  .cp0_rtu_mnxti_vld                         (cp0_rtu_mnxti_vld                        ),
  .cp0_rtu_mpil                              (cp0_rtu_mpil                             ),
  .cp0_rtu_pm_bypass                         (cp0_rtu_pm_bypass                        ),
  .cp0_rtu_tail_int_hv                       (cp0_rtu_tail_int_hv                      ),
  .cp0_rtu_tail_int_id                       (cp0_rtu_tail_int_id                      ),
  .cp0_rtu_wb_data                           (cp0_rtu_wb_data                          ),
  .cp0_rtu_wb_preg                           (cp0_rtu_wb_preg                          ),
  .cp0_rtu_wb_vld                            (cp0_rtu_wb_vld                           ),
  .cp0_rtu_wfe_en                            (cp0_rtu_wfe_en                           ),
  .cp0_xx_async_expt_en                      (cp0_xx_async_expt_en                     ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cpu_clic_curid                            (cpu_clic_curid                           ),
  .cpu_clic_int_exit                         (cpu_clic_int_exit                        ),
  .cpurst_b                                  (cpurst_b                                 ),
  .dtu_rtu_async_halt_req                    (dtu_rtu_async_halt_req                   ),
  .dtu_rtu_dpc                               (dtu_rtu_dpc                              ),
  .dtu_rtu_ebreak_action                     (dtu_rtu_ebreak_action                    ),
  .dtu_rtu_int_mask                          (dtu_rtu_int_mask                         ),
  .dtu_rtu_pending_tval                      (dtu_rtu_pending_tval                     ),
  .dtu_rtu_resume_req                        (dtu_rtu_resume_req                       ),
  .dtu_rtu_step_en                           (dtu_rtu_step_en                          ),
  .dtu_rtu_sync_flush                        (dtu_rtu_sync_flush                       ),
  .dtu_rtu_sync_halt_req                     (dtu_rtu_sync_halt_req                    ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .fpu_rtu_fgpr_wb_data                      (fpu_rtu_fgpr_wb_data                     ),
  .fpu_rtu_fgpr_wb_reg                       (fpu_rtu_fgpr_wb_reg                      ),
  .fpu_rtu_fgpr_wb_vld                       (fpu_rtu_fgpr_wb_vld                      ),
  .fpu_rtu_wb_data                           (fpu_rtu_wb_data                          ),
  .fpu_rtu_wb_preg                           (fpu_rtu_wb_preg                          ),
  .fpu_rtu_wb_vld                            (fpu_rtu_wb_vld                           ),
  .fpu_xx_no_op                              (fpu_xx_no_op                             ),
  .idu_yy_xx_tail_ack                        (idu_yy_xx_tail_ack                       ),
  .ifu_rtu_lockup_ack                        (ifu_rtu_lockup_ack                       ),
  .ifu_rtu_reset_halt_req                    (ifu_rtu_reset_halt_req                   ),
  .ifu_rtu_warm_up                           (ifu_rtu_warm_up                          ),
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
  .iu_rtu_wb0_data                           (iu_rtu_wb0_data                          ),
  .iu_rtu_wb0_preg                           (iu_rtu_wb0_preg                          ),
  .iu_rtu_wb0_vld                            (iu_rtu_wb0_vld                           ),
  .iu_xx_no_op                               (iu_xx_no_op                              ),
  .lsu_rtu_async_expt_vld                    (lsu_rtu_async_expt_vld                   ),
  .lsu_rtu_async_ld_inst                     (lsu_rtu_async_ld_inst                    ),
  .lsu_rtu_async_tval                        (lsu_rtu_async_tval                       ),
  .lsu_rtu_ex1_cmplt                         (lsu_rtu_ex1_cmplt                        ),
  .lsu_rtu_ex1_cmplt_dp                      (lsu_rtu_ex1_cmplt_dp                     ),
  .lsu_rtu_ex1_halt_info                     (lsu_rtu_ex1_halt_info                    ),
  .lsu_rtu_ex1_inst_len                      (lsu_rtu_ex1_inst_len                     ),
  .lsu_rtu_ex1_inst_vld                      (lsu_rtu_ex1_inst_vld                     ),
  .lsu_rtu_ex1_ipop_int_mask                 (lsu_rtu_ex1_ipop_int_mask                ),
  .lsu_rtu_ex1_ipush_spec_inst               (lsu_rtu_ex1_ipush_spec_inst              ),
  .lsu_rtu_ex1_split_inst                    (lsu_rtu_ex1_split_inst                   ),
  .lsu_rtu_ex2_bus_err                       (lsu_rtu_ex2_bus_err                      ),
  .lsu_rtu_ex2_expt_inst                     (lsu_rtu_ex2_expt_inst                    ),
  .lsu_rtu_ex2_expt_vec                      (lsu_rtu_ex2_expt_vec                     ),
  .lsu_rtu_ex2_stall                         (lsu_rtu_ex2_stall                        ),
  .lsu_rtu_ex2_tval                          (lsu_rtu_ex2_tval                         ),
  .lsu_rtu_fgpr_wb_data                      (lsu_rtu_fgpr_wb_data                     ),
  .lsu_rtu_fgpr_wb_reg                       (lsu_rtu_fgpr_wb_reg                      ),
  .lsu_rtu_fgpr_wb_vld                       (lsu_rtu_fgpr_wb_vld                      ),
  .lsu_rtu_sync_ack                          (lsu_rtu_sync_ack                         ),
  .lsu_rtu_wb_data                           (lsu_rtu_wb_data                          ),
  .lsu_rtu_wb_preg                           (lsu_rtu_wb_preg                          ),
  .lsu_rtu_wb_vld                            (lsu_rtu_wb_vld                           ),
  .lsu_xx_no_op                              (lsu_xx_no_op                             ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_cp0_bus_error                         (rtu_cp0_bus_error                        ),
  .rtu_cp0_epc                               (rtu_cp0_epc                              ),
  .rtu_cp0_exit_debug                        (rtu_cp0_exit_debug                       ),
  .rtu_cp0_fp_dirty_vld                      (rtu_cp0_fp_dirty_vld                     ),
  .rtu_cp0_int_level                         (rtu_cp0_int_level                        ),
  .rtu_cp0_lockup_clr                        (rtu_cp0_lockup_clr                       ),
  .rtu_cp0_lockup_vld                        (rtu_cp0_lockup_vld                       ),
  .rtu_cp0_mie_en                            (rtu_cp0_mie_en                           ),
  .rtu_cp0_mie_gateclk_en                    (rtu_cp0_mie_gateclk_en                   ),
  .rtu_cp0_mnxti_pending_vld                 (rtu_cp0_mnxti_pending_vld                ),
  .rtu_cp0_nmi_vld                           (rtu_cp0_nmi_vld                          ),
  .rtu_cp0_pending_int_hv                    (rtu_cp0_pending_int_hv                   ),
  .rtu_cp0_pending_int_id                    (rtu_cp0_pending_int_id                   ),
  .rtu_cp0_pending_int_level                 (rtu_cp0_pending_int_level                ),
  .rtu_cp0_tval                              (rtu_cp0_tval                             ),
  .rtu_cp0_wk_int                            (rtu_cp0_wk_int                           ),
  .rtu_dtu_debug_info                        (rtu_dtu_debug_info                       ),
  .rtu_dtu_dpc                               (rtu_dtu_dpc                              ),
  .rtu_dtu_halt_ack                          (rtu_dtu_halt_ack                         ),
  .rtu_dtu_nmi_pending                       (rtu_dtu_nmi_pending                      ),
  .rtu_dtu_pending_ack                       (rtu_dtu_pending_ack                      ),
  .rtu_dtu_retire_chgflw                     (rtu_dtu_retire_chgflw                    ),
  .rtu_dtu_retire_debug_expt_vld             (rtu_dtu_retire_debug_expt_vld            ),
  .rtu_dtu_retire_halt_info                  (rtu_dtu_retire_halt_info                 ),
  .rtu_dtu_retire_mret                       (rtu_dtu_retire_mret                      ),
  .rtu_dtu_retire_next_pc                    (rtu_dtu_retire_next_pc                   ),
  .rtu_dtu_retire_vld                        (rtu_dtu_retire_vld                       ),
  .rtu_dtu_tval                              (rtu_dtu_tval                             ),
  .rtu_fpu_fgpr_wb_grant                     (rtu_fpu_fgpr_wb_grant                    ),
  .rtu_fpu_wb_grant                          (rtu_fpu_wb_grant                         ),
  .rtu_hpcp_retire_inst_vld                  (rtu_hpcp_retire_inst_vld                 ),
  .rtu_idu_ex1_int_dis_stall_gateclk_req     (rtu_idu_ex1_int_dis_stall_gateclk_req    ),
  .rtu_idu_ex1_int_dis_stall_req             (rtu_idu_ex1_int_dis_stall_req            ),
  .rtu_idu_ex2_ipush_spec_inst_expt_vld      (rtu_idu_ex2_ipush_spec_inst_expt_vld     ),
  .rtu_idu_ex2_ipush_spec_inst_halt_info_vld (rtu_idu_ex2_ipush_spec_inst_halt_info_vld),
  .rtu_idu_fgpr_wb_data                      (rtu_idu_fgpr_wb_data                     ),
  .rtu_idu_fgpr_wb_flsu_vld                  (rtu_idu_fgpr_wb_flsu_vld                 ),
  .rtu_idu_fgpr_wb_reg                       (rtu_idu_fgpr_wb_reg                      ),
  .rtu_idu_fgpr_wb_vld                       (rtu_idu_fgpr_wb_vld                      ),
  .rtu_idu_flush_fe                          (rtu_idu_flush_fe                         ),
  .rtu_idu_flush_stall                       (rtu_idu_flush_stall                      ),
  .rtu_idu_id_tail_int_vld                   (rtu_idu_id_tail_int_vld                  ),
  .rtu_idu_inst_retire                       (rtu_idu_inst_retire                      ),
  .rtu_idu_late_flush                        (rtu_idu_late_flush                       ),
  .rtu_idu_wb0_data                          (rtu_idu_wb0_data                         ),
  .rtu_idu_wb0_fpu_vld                       (rtu_idu_wb0_fpu_vld                      ),
  .rtu_idu_wb0_preg                          (rtu_idu_wb0_preg                         ),
  .rtu_idu_wb0_vld                           (rtu_idu_wb0_vld                          ),
  .rtu_idu_wb1_data                          (rtu_idu_wb1_data                         ),
  .rtu_idu_wb1_lsu_vld                       (rtu_idu_wb1_lsu_vld                      ),
  .rtu_idu_wb1_preg                          (rtu_idu_wb1_preg                         ),
  .rtu_idu_wb1_vld                           (rtu_idu_wb1_vld                          ),
  .rtu_idu_wb2_data                          (rtu_idu_wb2_data                         ),
  .rtu_idu_wb2_preg                          (rtu_idu_wb2_preg                         ),
  .rtu_idu_wb2_vld                           (rtu_idu_wb2_vld                          ),
  .rtu_ifu_chgflw_pc                         (rtu_ifu_chgflw_pc                        ),
  .rtu_ifu_chgflw_vld                        (rtu_ifu_chgflw_vld                       ),
  .rtu_ifu_dbg_mask                          (rtu_ifu_dbg_mask                         ),
  .rtu_ifu_flush_fe                          (rtu_ifu_flush_fe                         ),
  .rtu_ifu_lockup_expt_vld                   (rtu_ifu_lockup_expt_vld                  ),
  .rtu_ifu_lockup_mask                       (rtu_ifu_lockup_mask                      ),
  .rtu_ifu_lockup_req                        (rtu_ifu_lockup_req                       ),
  .rtu_iu_bju_ex2_cur_pc                     (rtu_iu_bju_ex2_cur_pc                    ),
  .rtu_iu_ex1_cmplt_dp_vld                   (rtu_iu_ex1_cmplt_dp_vld                  ),
  .rtu_iu_ex1_cmplt_inst_len                 (rtu_iu_ex1_cmplt_inst_len                ),
  .rtu_iu_ex1_cmplt_split_inst               (rtu_iu_ex1_cmplt_split_inst              ),
  .rtu_iu_ex1_cmplt_vld                      (rtu_iu_ex1_cmplt_vld                     ),
  .rtu_iu_pending_spec_expt_vld              (rtu_iu_pending_spec_expt_vld             ),
  .rtu_iu_pending_spec_halt_info_vld         (rtu_iu_pending_spec_halt_info_vld        ),
  .rtu_lsu_async_expt_ack                    (rtu_lsu_async_expt_ack                   ),
  .rtu_lsu_expt_ack                          (rtu_lsu_expt_ack                         ),
  .rtu_lsu_expt_exit                         (rtu_lsu_expt_exit                        ),
  .rtu_lsu_fgpr_wb_data                      (rtu_lsu_fgpr_wb_data                     ),
  .rtu_lsu_fgpr_wb_reg                       (rtu_lsu_fgpr_wb_reg                      ),
  .rtu_lsu_fgpr_wb_vld                       (rtu_lsu_fgpr_wb_vld                      ),
  .rtu_lsu_inst_retire                       (rtu_lsu_inst_retire                      ),
  .rtu_lsu_sync_req                          (rtu_lsu_sync_req                         ),
  .rtu_lsu_wb1_data                          (rtu_lsu_wb1_data                         ),
  .rtu_lsu_wb1_lsu_vld                       (rtu_lsu_wb1_lsu_vld                      ),
  .rtu_lsu_wb1_preg                          (rtu_lsu_wb1_preg                         ),
  .rtu_pad_inst_retire                       (rtu_pad_inst_retire                      ),
  .rtu_pad_inst_split                        (rtu_pad_inst_split                       ),
  .rtu_pad_retire_pc                         (rtu_pad_retire_pc                        ),
  .rtu_pad_wb0_data                          (rtu_pad_wb0_data                         ),
  .rtu_pad_wb0_preg                          (rtu_pad_wb0_preg                         ),
  .rtu_pad_wb0_vld                           (rtu_pad_wb0_vld                          ),
  .rtu_pad_wb1_data                          (rtu_pad_wb1_data                         ),
  .rtu_pad_wb1_preg                          (rtu_pad_wb1_preg                         ),
  .rtu_pad_wb1_vld                           (rtu_pad_wb1_vld                          ),
  .rtu_pad_wb2_data                          (rtu_pad_wb2_data                         ),
  .rtu_pad_wb2_preg                          (rtu_pad_wb2_preg                         ),
  .rtu_pad_wb2_vld                           (rtu_pad_wb2_vld                          ),
  .rtu_pad_wb_freg                           (rtu_pad_wb_freg                          ),
  .rtu_pad_wb_freg_data                      (rtu_pad_wb_freg_data                     ),
  .rtu_pad_wb_freg_vld                       (rtu_pad_wb_freg_vld                      ),
  .rtu_sysio_halted                          (rtu_sysio_halted                         ),
  .rtu_sysio_lockup_on                       (rtu_sysio_lockup_on                      ),
  .rtu_xx_ex1_stall                          (rtu_xx_ex1_stall                         ),
  .rtu_xx_no_op                              (rtu_xx_no_op                             ),
  .rtu_yy_xx_async_flush                     (rtu_yy_xx_async_flush                    ),
  .rtu_yy_xx_dbgon                           (rtu_yy_xx_dbgon                          ),
  .rtu_yy_xx_expt_int                        (rtu_yy_xx_expt_int                       ),
  .rtu_yy_xx_expt_vec                        (rtu_yy_xx_expt_vec                       ),
  .rtu_yy_xx_expt_vld                        (rtu_yy_xx_expt_vld                       ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          ),
  .rtu_yy_xx_int_hv                          (rtu_yy_xx_int_hv                         ),
  .rtu_yy_xx_tail_int_vld                    (rtu_yy_xx_tail_int_vld                   ),
  .sysio_rtu_nmi_int                         (sysio_rtu_nmi_int                        ),
  .sysio_rtu_wk_event                        (sysio_rtu_wk_event                       )
);


// &Force("output", "rtu_yy_xx_dbgon"); @81
// &Force("output", "rtu_yy_xx_expt_vld"); @82
// &Force("output", "rtu_yy_xx_expt_int"); @83
// &Force("output", "rtu_yy_xx_expt_vec"); @84
// &Force("output", "idu_yy_xx_tail_ack"); @85
// &Force("output", "rtu_yy_xx_async_flush"); @88

// &Instance("pa_fpu_top"); @92
pa_fpu_top  x_pa_fpu_top (
  .cp0_fpu_icg_en           (cp0_fpu_icg_en          ),
  .cp0_fpu_xx_dqnan         (cp0_fpu_xx_dqnan        ),
  .cp0_fpu_xx_rm            (cp0_fpu_xx_rm           ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .forever_cpuclk           (fpu_gated_cpuclk        ),
  .fpu_cp0_wb_fflags        (fpu_cp0_wb_fflags       ),
  .fpu_cp0_wb_fflags_updt   (fpu_cp0_wb_fflags_updt  ),
  .fpu_dtu_debug_info       (fpu_dtu_debug_info      ),
  .fpu_idu_ex1_stall        (fpu_idu_ex1_stall       ),
  .fpu_idu_fwd_data         (fpu_idu_fwd_data        ),
  .fpu_idu_fwd_freg         (fpu_idu_fwd_freg        ),
  .fpu_idu_fwd_vld          (fpu_idu_fwd_vld         ),
  .fpu_iu_ex1_cmplt         (fpu_iu_ex1_cmplt        ),
  .fpu_iu_ex1_cmplt_dp      (fpu_iu_ex1_cmplt_dp     ),
  .fpu_rtu_fgpr_wb_data     (fpu_rtu_fgpr_wb_data    ),
  .fpu_rtu_fgpr_wb_reg      (fpu_rtu_fgpr_wb_reg     ),
  .fpu_rtu_fgpr_wb_vld      (fpu_rtu_fgpr_wb_vld     ),
  .fpu_rtu_wb_data          (fpu_rtu_wb_data         ),
  .fpu_rtu_wb_preg          (fpu_rtu_wb_preg         ),
  .fpu_rtu_wb_vld           (fpu_rtu_wb_vld          ),
  .fpu_wb_float_fflags_updt (fpu_wb_float_fflags_updt),
  .fpu_xx_no_op             (fpu_xx_no_op            ),
  .idu_fpu_ex1_cmplt_dp_sel (idu_fpu_ex1_cmplt_dp_sel),
  .idu_fpu_ex1_dst_freg     (idu_fpu_ex1_dst_freg    ),
  .idu_fpu_ex1_dst_freg_vld (idu_fpu_ex1_dst_freg_vld),
  .idu_fpu_ex1_dst_preg     (idu_fpu_ex1_dst_preg    ),
  .idu_fpu_ex1_eu_sel       (idu_fpu_ex1_eu_sel      ),
  .idu_fpu_ex1_func         (idu_fpu_ex1_func        ),
  .idu_fpu_ex1_gateclk_vld  (idu_fpu_ex1_gateclk_vld ),
  .idu_fpu_ex1_inst_vld     (idu_fpu_ex1_inst_vld    ),
  .idu_fpu_ex1_rm           (idu_fpu_ex1_rm          ),
  .idu_fpu_ex1_srcf0        (idu_fpu_ex1_srcf0       ),
  .idu_fpu_ex1_srcf1        (idu_fpu_ex1_srcf1       ),
  .idu_fpu_ex1_srcf2        (idu_fpu_ex1_srcf2       ),
  .idu_fpu_ex1_srci         (idu_fpu_ex1_srci        ),
  .ifu_fpu_warm_up          (ifu_fpu_warm_up         ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .rtu_fpu_fgpr_wb_grant    (rtu_fpu_fgpr_wb_grant   ),
  .rtu_fpu_wb_grant         (rtu_fpu_wb_grant        ),
  .rtu_yy_xx_async_flush    (rtu_yy_xx_async_flush   ),
  .rtu_yy_xx_flush          (rtu_yy_xx_flush         )
);

// &Connect(.forever_cpuclk      (fpu_gated_cpuclk)); @93

assign fpu_gated_cpuclk_en = !fpu_xx_no_op
                            || fpu_wb_float_fflags_updt
//                          || rtu_fpu_frbus_wb_vld
                          || ifu_xx_in_warm_up;
// &Instance("gated_clk_cell", "x_cp0_fpu_cpuclk"); @99
gated_clk_cell  x_cp0_fpu_cpuclk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (fpu_gated_cpuclk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (fpu_gated_cpuclk_en),
  .module_en           (cp0_fpu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @100
//          .external_en (1'b0), @101
//          .global_en   (cp0_yy_clk_en), @102
//          .module_en   (cp0_fpu_icg_en), @103
//          .local_en    (fpu_gated_cpuclk_en), @104
//          .clk_out     (fpu_gated_cpuclk)); @105

// &ModuleEnd; @108
endmodule


