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
module pa_cp0_top(
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
  cp0_fpu_icg_en,
  cp0_fpu_xx_dqnan,
  cp0_fpu_xx_rm,
  cp0_hpcp_icg_en,
  cp0_hpcp_index,
  cp0_hpcp_pmdm,
  cp0_hpcp_pmdu,
  cp0_hpcp_wdata,
  cp0_hpcp_wreg,
  cp0_idu_ex1_stall,
  cp0_idu_fs,
  cp0_idu_icg_en,
  cp0_idu_mcause,
  cp0_idu_mepc,
  cp0_idu_rm,
  cp0_idu_sp_use_scratch,
  cp0_idu_sp_wdata,
  cp0_idu_sp_wen,
  cp0_idu_sp_wen_gate,
  cp0_idu_spec_push_en,
  cp0_idu_swap_sp_en,
  cp0_ifu_bht_en,
  cp0_ifu_bht_inv,
  cp0_ifu_btb_clr,
  cp0_ifu_btb_en,
  cp0_ifu_icache_en,
  cp0_ifu_icache_inv_addr,
  cp0_ifu_icache_inv_req,
  cp0_ifu_icache_inv_type,
  cp0_ifu_icg_en,
  cp0_ifu_in_lpmd,
  cp0_ifu_lpmd_req,
  cp0_ifu_mtvec,
  cp0_ifu_ras_en,
  cp0_ifu_rst_inv_done,
  cp0_ifu_srst_mask,
  cp0_ifu_srst_req,
  cp0_iu_adder_borrow_in,
  cp0_iu_adder_borrow_vld,
  cp0_iu_icg_en,
  cp0_lsu_dcache_en,
  cp0_lsu_dcache_wa,
  cp0_lsu_dcache_wb,
  cp0_lsu_fence_req,
  cp0_lsu_icc_addr,
  cp0_lsu_icc_op,
  cp0_lsu_icc_req,
  cp0_lsu_icc_type,
  cp0_lsu_icg_en,
  cp0_lsu_mm,
  cp0_lsu_sync_req,
  cp0_pad_mcause,
  cp0_pad_mintstatus,
  cp0_pad_mstatus,
  cp0_pmp_csr_sel,
  cp0_pmp_csr_wen,
  cp0_pmp_icg_en,
  cp0_pmp_mstatus_mpp,
  cp0_pmp_mstatus_mprv,
  cp0_pmp_updt_data,
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
  cp0_sysio_ipend_b,
  cp0_sysio_lpmd_b,
  cp0_sysio_srst,
  cp0_xx_async_expt_en,
  cp0_yy_clk_en,
  cp0_yy_cskyisaee,
  cp0_yy_mach_mode,
  cp0_yy_priv_mode,
  cpurst_b,
  dtu_cp0_dcsr_mprven,
  dtu_cp0_dcsr_prv,
  dtu_cp0_rdata,
  dtu_cp0_wake_up,
  forever_cpuclk,
  fpu_cp0_wb_fflags,
  fpu_cp0_wb_fflags_updt,
  hpcp_cp0_data,
  idu_cp0_ex1_cmplt_dp_sel,
  idu_cp0_ex1_dst_idx,
  idu_cp0_ex1_dst_vld,
  idu_cp0_ex1_expt_high,
  idu_cp0_ex1_expt_type,
  idu_cp0_ex1_expt_vld,
  idu_cp0_ex1_func,
  idu_cp0_ex1_gateclk_sel,
  idu_cp0_ex1_halt_info,
  idu_cp0_ex1_inst_len,
  idu_cp0_ex1_ipush_spec_fail,
  idu_cp0_ex1_opcode,
  idu_cp0_ex1_rs1,
  idu_cp0_ex1_rs2,
  idu_cp0_ex1_sel,
  idu_cp0_ex1_split_inst,
  idu_cp0_ex1_tail_fail,
  idu_cp0_id_tail_vld,
  idu_cp0_ipop_data,
  idu_cp0_mcause_wen,
  idu_cp0_mepc_wen,
  idu_cp0_sp_reg,
  idu_cp0_sp_swap_pending,
  idu_cp0_sp_swap_req,
  idu_cp0_sp_swap_req_gate,
  idu_yy_xx_tail_ack,
  ifu_cp0_bht_inv_done,
  ifu_cp0_icache_inv_done,
  ifu_cp0_lpmd_ack,
  ifu_cp0_rst_inv_req,
  ifu_cp0_srst_ack,
  ifu_cp0_vec_err,
  ifu_cp0_vec_succeed,
  ifu_cp0_warm_up,
  iu_cp0_ex1_borrow_expt_pc,
  lsu_cp0_fence_ack,
  lsu_cp0_icc_done,
  lsu_cp0_sync_ack,
  pad_yy_icg_scan_en,
  pmp_cp0_data,
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
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vec,
  rtu_yy_xx_expt_vld,
  rtu_yy_xx_flush,
  rtu_yy_xx_int_hv,
  rtu_yy_xx_tail_int_vld,
  sysio_cp0_clk_en,
  sysio_cp0_clkratio,
  sysio_cp0_rst_addr,
  tcip_cp0_clic_base
);

// &Ports; @24
input           cpurst_b;                   
input           dtu_cp0_dcsr_mprven;        
input   [1 :0]  dtu_cp0_dcsr_prv;           
input   [31:0]  dtu_cp0_rdata;              
input           dtu_cp0_wake_up;            
input           forever_cpuclk;             
input   [4 :0]  fpu_cp0_wb_fflags;          
input           fpu_cp0_wb_fflags_updt;     
input   [31:0]  hpcp_cp0_data;              
input           idu_cp0_ex1_cmplt_dp_sel;   
input   [5 :0]  idu_cp0_ex1_dst_idx;        
input           idu_cp0_ex1_dst_vld;        
input           idu_cp0_ex1_expt_high;      
input           idu_cp0_ex1_expt_type;      
input           idu_cp0_ex1_expt_vld;       
input   [19:0]  idu_cp0_ex1_func;           
input           idu_cp0_ex1_gateclk_sel;    
input   [14:0]  idu_cp0_ex1_halt_info;      
input           idu_cp0_ex1_inst_len;       
input           idu_cp0_ex1_ipush_spec_fail; 
input   [31:0]  idu_cp0_ex1_opcode;         
input   [31:0]  idu_cp0_ex1_rs1;            
input   [11:0]  idu_cp0_ex1_rs2;            
input           idu_cp0_ex1_sel;            
input           idu_cp0_ex1_split_inst;     
input           idu_cp0_ex1_tail_fail;      
input           idu_cp0_id_tail_vld;        
input   [31:0]  idu_cp0_ipop_data;          
input           idu_cp0_mcause_wen;         
input           idu_cp0_mepc_wen;           
input   [31:0]  idu_cp0_sp_reg;             
input           idu_cp0_sp_swap_pending;    
input           idu_cp0_sp_swap_req;        
input           idu_cp0_sp_swap_req_gate;   
input           idu_yy_xx_tail_ack;         
input           ifu_cp0_bht_inv_done;       
input           ifu_cp0_icache_inv_done;    
input           ifu_cp0_lpmd_ack;           
input           ifu_cp0_rst_inv_req;        
input           ifu_cp0_srst_ack;           
input           ifu_cp0_vec_err;            
input           ifu_cp0_vec_succeed;        
input           ifu_cp0_warm_up;            
input   [31:0]  iu_cp0_ex1_borrow_expt_pc;  
input           lsu_cp0_fence_ack;          
input           lsu_cp0_icc_done;           
input           lsu_cp0_sync_ack;           
input           pad_yy_icg_scan_en;         
input   [31:0]  pmp_cp0_data;               
input           rtu_cp0_bus_error;          
input   [31:0]  rtu_cp0_epc;                
input           rtu_cp0_exit_debug;         
input           rtu_cp0_fp_dirty_vld;       
input   [7 :0]  rtu_cp0_int_level;          
input           rtu_cp0_lockup_clr;         
input           rtu_cp0_lockup_vld;         
input           rtu_cp0_mie_en;             
input           rtu_cp0_mie_gateclk_en;     
input           rtu_cp0_mnxti_pending_vld;  
input           rtu_cp0_nmi_vld;            
input           rtu_cp0_pending_int_hv;     
input   [11:0]  rtu_cp0_pending_int_id;     
input   [7 :0]  rtu_cp0_pending_int_level;  
input   [31:0]  rtu_cp0_tval;               
input           rtu_cp0_wk_int;             
input           rtu_yy_xx_dbgon;            
input           rtu_yy_xx_expt_int;         
input   [11:0]  rtu_yy_xx_expt_vec;         
input           rtu_yy_xx_expt_vld;         
input           rtu_yy_xx_flush;            
input           rtu_yy_xx_int_hv;           
input           rtu_yy_xx_tail_int_vld;     
input           sysio_cp0_clk_en;           
input   [2 :0]  sysio_cp0_clkratio;         
input   [31:0]  sysio_cp0_rst_addr;         
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
output          cp0_fpu_icg_en;             
output          cp0_fpu_xx_dqnan;           
output  [2 :0]  cp0_fpu_xx_rm;              
output          cp0_hpcp_icg_en;            
output  [11:0]  cp0_hpcp_index;             
output          cp0_hpcp_pmdm;              
output          cp0_hpcp_pmdu;              
output  [31:0]  cp0_hpcp_wdata;             
output          cp0_hpcp_wreg;              
output          cp0_idu_ex1_stall;          
output  [1 :0]  cp0_idu_fs;                 
output          cp0_idu_icg_en;             
output  [31:0]  cp0_idu_mcause;             
output  [31:0]  cp0_idu_mepc;               
output  [2 :0]  cp0_idu_rm;                 
output          cp0_idu_sp_use_scratch;     
output  [31:0]  cp0_idu_sp_wdata;           
output          cp0_idu_sp_wen;             
output          cp0_idu_sp_wen_gate;        
output          cp0_idu_spec_push_en;       
output          cp0_idu_swap_sp_en;         
output          cp0_ifu_bht_en;             
output          cp0_ifu_bht_inv;            
output          cp0_ifu_btb_clr;            
output          cp0_ifu_btb_en;             
output          cp0_ifu_icache_en;          
output  [31:0]  cp0_ifu_icache_inv_addr;    
output          cp0_ifu_icache_inv_req;     
output          cp0_ifu_icache_inv_type;    
output          cp0_ifu_icg_en;             
output          cp0_ifu_in_lpmd;            
output          cp0_ifu_lpmd_req;           
output  [31:0]  cp0_ifu_mtvec;              
output          cp0_ifu_ras_en;             
output          cp0_ifu_rst_inv_done;       
output          cp0_ifu_srst_mask;          
output          cp0_ifu_srst_req;           
output          cp0_iu_adder_borrow_in;     
output          cp0_iu_adder_borrow_vld;    
output          cp0_iu_icg_en;              
output          cp0_lsu_dcache_en;          
output          cp0_lsu_dcache_wa;          
output          cp0_lsu_dcache_wb;          
output          cp0_lsu_fence_req;          
output  [31:0]  cp0_lsu_icc_addr;           
output  [1 :0]  cp0_lsu_icc_op;             
output          cp0_lsu_icc_req;            
output  [1 :0]  cp0_lsu_icc_type;           
output          cp0_lsu_icg_en;             
output          cp0_lsu_mm;                 
output          cp0_lsu_sync_req;           
output  [31:0]  cp0_pad_mcause;             
output  [31:0]  cp0_pad_mintstatus;         
output  [31:0]  cp0_pad_mstatus;            
output  [19:0]  cp0_pmp_csr_sel;            
output          cp0_pmp_csr_wen;            
output          cp0_pmp_icg_en;             
output  [1 :0]  cp0_pmp_mstatus_mpp;        
output          cp0_pmp_mstatus_mprv;       
output  [31:0]  cp0_pmp_updt_data;          
output  [30:0]  cp0_rtu_ex1_chgflw_pc;      
output          cp0_rtu_ex1_chgflw_vld;     
output          cp0_rtu_ex1_cmplt;          
output          cp0_rtu_ex1_cmplt_dp;       
output          cp0_rtu_ex1_dret;           
output          cp0_rtu_ex1_ebreak;         
output          cp0_rtu_ex1_expt_inst;      
output  [31:0]  cp0_rtu_ex1_expt_tval;      
output  [3 :0]  cp0_rtu_ex1_expt_vec;       
output          cp0_rtu_ex1_flush;          
output  [14:0]  cp0_rtu_ex1_halt_info;      
output          cp0_rtu_ex1_inst_len;       
output          cp0_rtu_ex1_inst_vld;       
output          cp0_rtu_ex1_ipush_spec_fail; 
output          cp0_rtu_ex1_mret;           
output          cp0_rtu_ex1_split_inst;     
output          cp0_rtu_ex1_tail_fail;      
output          cp0_rtu_icg_en;             
output          cp0_rtu_in_expt;            
output          cp0_rtu_in_nmi;             
output  [7 :0]  cp0_rtu_int_level;          
output  [1 :0]  cp0_rtu_int_mode;           
output          cp0_rtu_mie;                
output          cp0_rtu_mnxti_vld;          
output  [7 :0]  cp0_rtu_mpil;               
output  [1 :0]  cp0_rtu_pm_bypass;          
output          cp0_rtu_tail_int_hv;        
output  [11:0]  cp0_rtu_tail_int_id;        
output  [31:0]  cp0_rtu_wb_data;            
output  [5 :0]  cp0_rtu_wb_preg;            
output          cp0_rtu_wb_vld;             
output          cp0_rtu_wfe_en;             
output          cp0_sysio_ipend_b;          
output  [1 :0]  cp0_sysio_lpmd_b;           
output  [1 :0]  cp0_sysio_srst;             
output          cp0_xx_async_expt_en;       
output          cp0_yy_clk_en;              
output          cp0_yy_cskyisaee;           
output          cp0_yy_mach_mode;           
output  [1 :0]  cp0_yy_priv_mode;           

// &Regs; @25

// &Wires; @26
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
wire            cpurst_b;                   
wire            dtu_cp0_dcsr_mprven;        
wire    [1 :0]  dtu_cp0_dcsr_prv;           
wire    [31:0]  dtu_cp0_rdata;              
wire            dtu_cp0_wake_up;            
wire    [31:0]  ext_inst_ifu_icc_addr;      
wire            ext_inst_ifu_icc_req;       
wire            ext_inst_ifu_icc_type;      
wire            ext_inst_ifu_inv_done;      
wire    [31:0]  ext_inst_lsu_icc_addr;      
wire            ext_inst_lsu_icc_done;      
wire    [1 :0]  ext_inst_lsu_icc_op;        
wire            ext_inst_lsu_icc_req;       
wire    [1 :0]  ext_inst_lsu_icc_type;      
wire            ext_iui_cache_stall;        
wire            ext_iui_expt_vld;           
wire    [2 :0]  fence_top_cur_state;        
wire            forever_cpuclk;             
wire    [4 :0]  fpu_cp0_wb_fflags;          
wire            fpu_cp0_wb_fflags_updt;     
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
wire            idu_yy_xx_tail_ack;         
wire            ifu_cp0_bht_inv_done;       
wire            ifu_cp0_icache_inv_done;    
wire            ifu_cp0_lpmd_ack;           
wire            ifu_cp0_rst_inv_req;        
wire            ifu_cp0_srst_ack;           
wire            ifu_cp0_vec_err;            
wire            ifu_cp0_vec_succeed;        
wire            ifu_cp0_warm_up;            
wire            inv_sm_clk;                 
wire    [31:0]  iu_cp0_ex1_borrow_expt_pc;  
wire            iui_csr_wen_f;              
wire            iui_ext_inst_cache;         
wire    [11:0]  iui_ext_inst_imm;           
wire    [31:0]  iui_ext_inst_rs1;           
wire            iui_regs_csr_mnxti_vld;     
wire            iui_regs_csr_wen;           
wire    [11:0]  iui_regs_imm;               
wire            iui_regs_inst_csr;          
wire            iui_regs_inst_mret;         
wire    [31:0]  iui_regs_wdata;             
wire            iui_regs_wdata_mie;         
wire    [31:0]  iui_regs_wdata_rs1;         
wire    [1 :0]  iui_regs_wdata_srst;        
wire            iui_special_ecall;          
wire            iui_special_fence;          
wire            iui_special_fencei;         
wire            iui_special_int_vld;        
wire            iui_special_sync;           
wire            iui_special_synci;          
wire            iui_special_wfi;            
wire    [1 :0]  lpmd_top_cur_state;         
wire            lsu_cp0_fence_ack;          
wire            lsu_cp0_icc_done;           
wire            lsu_cp0_sync_ack;           
wire            pad_yy_icg_scan_en;         
wire    [31:0]  pmp_cp0_data;               
wire            regs_clk;                   
wire            regs_iui_expt_vld;          
wire    [31:0]  regs_iui_mepc;              
wire            regs_iui_mie;               
wire            regs_iui_mnxti_sel;         
wire    [31:0]  regs_iui_mstatus;           
wire    [1 :0]  regs_iui_pm;                
wire    [31:0]  regs_iui_rdata;             
wire    [1 :0]  regs_special_lpmd;          
wire            regs_srst_srst_vld;         
wire    [1 :0]  regs_srst_srstmd;           
wire            rst_top_op_done;            
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
wire            rtu_yy_xx_dbgon;            
wire            rtu_yy_xx_expt_int;         
wire    [11:0]  rtu_yy_xx_expt_vec;         
wire            rtu_yy_xx_expt_vld;         
wire            rtu_yy_xx_flush;            
wire            rtu_yy_xx_int_hv;           
wire            rtu_yy_xx_tail_int_vld;     
wire            special_dcache_clean;       
wire            special_icache_inv;         
wire            special_icache_inv_done;    
wire            special_iui_expt_vld;       
wire            special_iui_stall;          
wire            special_regs_clk_en;        
wire            special_regs_inv_sm_clk_en; 
wire            srst_in_wait_state;         
wire            srst_iui_stall;             
wire            srst_sm_clk;                
wire            srst_special_srst_sm_clk_en; 
wire            sysio_cp0_clk_en;           
wire    [2 :0]  sysio_cp0_clkratio;         
wire    [31:0]  sysio_cp0_rst_addr;         
wire    [31:0]  tcip_cp0_clic_base;         


//==========================================================
// CP0 TOP Module
//==========================================================

//------------------------------------------------
// Instance all the submodules
//------------------------------------------------

// Instruction Unified Interface Module
// &Instance("pa_cp0_iui", "x_pa_cp0_iui"); @37
pa_cp0_iui  x_pa_cp0_iui (
  .cp0_dtu_addr                (cp0_dtu_addr               ),
  .cp0_dtu_rreg                (cp0_dtu_rreg               ),
  .cp0_dtu_wdata               (cp0_dtu_wdata              ),
  .cp0_dtu_wreg                (cp0_dtu_wreg               ),
  .cp0_idu_ex1_stall           (cp0_idu_ex1_stall          ),
  .cp0_iu_adder_borrow_in      (cp0_iu_adder_borrow_in     ),
  .cp0_iu_adder_borrow_vld     (cp0_iu_adder_borrow_vld    ),
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
  .cp0_rtu_wb_data             (cp0_rtu_wb_data            ),
  .cp0_rtu_wb_preg             (cp0_rtu_wb_preg            ),
  .cp0_rtu_wb_vld              (cp0_rtu_wb_vld             ),
  .cpurst_b                    (cpurst_b                   ),
  .ext_iui_cache_stall         (ext_iui_cache_stall        ),
  .ext_iui_expt_vld            (ext_iui_expt_vld           ),
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
  .ifu_cp0_warm_up             (ifu_cp0_warm_up            ),
  .iu_cp0_ex1_borrow_expt_pc   (iu_cp0_ex1_borrow_expt_pc  ),
  .iui_csr_wen_f               (iui_csr_wen_f              ),
  .iui_ext_inst_cache          (iui_ext_inst_cache         ),
  .iui_ext_inst_imm            (iui_ext_inst_imm           ),
  .iui_ext_inst_rs1            (iui_ext_inst_rs1           ),
  .iui_regs_csr_mnxti_vld      (iui_regs_csr_mnxti_vld     ),
  .iui_regs_csr_wen            (iui_regs_csr_wen           ),
  .iui_regs_imm                (iui_regs_imm               ),
  .iui_regs_inst_csr           (iui_regs_inst_csr          ),
  .iui_regs_inst_mret          (iui_regs_inst_mret         ),
  .iui_regs_wdata              (iui_regs_wdata             ),
  .iui_regs_wdata_mie          (iui_regs_wdata_mie         ),
  .iui_regs_wdata_rs1          (iui_regs_wdata_rs1         ),
  .iui_regs_wdata_srst         (iui_regs_wdata_srst        ),
  .iui_special_ecall           (iui_special_ecall          ),
  .iui_special_fence           (iui_special_fence          ),
  .iui_special_fencei          (iui_special_fencei         ),
  .iui_special_int_vld         (iui_special_int_vld        ),
  .iui_special_sync            (iui_special_sync           ),
  .iui_special_synci           (iui_special_synci          ),
  .iui_special_wfi             (iui_special_wfi            ),
  .regs_clk                    (regs_clk                   ),
  .regs_iui_expt_vld           (regs_iui_expt_vld          ),
  .regs_iui_mepc               (regs_iui_mepc              ),
  .regs_iui_mie                (regs_iui_mie               ),
  .regs_iui_mnxti_sel          (regs_iui_mnxti_sel         ),
  .regs_iui_mstatus            (regs_iui_mstatus           ),
  .regs_iui_pm                 (regs_iui_pm                ),
  .regs_iui_rdata              (regs_iui_rdata             ),
  .rtu_cp0_wk_int              (rtu_cp0_wk_int             ),
  .rtu_yy_xx_dbgon             (rtu_yy_xx_dbgon            ),
  .special_iui_expt_vld        (special_iui_expt_vld       ),
  .special_iui_stall           (special_iui_stall          ),
  .srst_iui_stall              (srst_iui_stall             )
);


// Regs Module
// &Instance("pa_cp0_regs", "x_pa_cp0_regs"); @40
pa_cp0_regs  x_pa_cp0_regs (
  .cp0_biu_icg_en             (cp0_biu_icg_en            ),
  .cp0_dtu_icg_en             (cp0_dtu_icg_en            ),
  .cp0_dtu_int_id             (cp0_dtu_int_id            ),
  .cp0_dtu_mexpt_vld          (cp0_dtu_mexpt_vld         ),
  .cp0_dtu_pcfifo_frz         (cp0_dtu_pcfifo_frz        ),
  .cp0_fpu_icg_en             (cp0_fpu_icg_en            ),
  .cp0_fpu_xx_dqnan           (cp0_fpu_xx_dqnan          ),
  .cp0_fpu_xx_rm              (cp0_fpu_xx_rm             ),
  .cp0_hpcp_icg_en            (cp0_hpcp_icg_en           ),
  .cp0_hpcp_index             (cp0_hpcp_index            ),
  .cp0_hpcp_pmdm              (cp0_hpcp_pmdm             ),
  .cp0_hpcp_pmdu              (cp0_hpcp_pmdu             ),
  .cp0_hpcp_wdata             (cp0_hpcp_wdata            ),
  .cp0_hpcp_wreg              (cp0_hpcp_wreg             ),
  .cp0_idu_fs                 (cp0_idu_fs                ),
  .cp0_idu_icg_en             (cp0_idu_icg_en            ),
  .cp0_idu_mcause             (cp0_idu_mcause            ),
  .cp0_idu_mepc               (cp0_idu_mepc              ),
  .cp0_idu_rm                 (cp0_idu_rm                ),
  .cp0_idu_sp_use_scratch     (cp0_idu_sp_use_scratch    ),
  .cp0_idu_sp_wdata           (cp0_idu_sp_wdata          ),
  .cp0_idu_sp_wen             (cp0_idu_sp_wen            ),
  .cp0_idu_sp_wen_gate        (cp0_idu_sp_wen_gate       ),
  .cp0_idu_spec_push_en       (cp0_idu_spec_push_en      ),
  .cp0_idu_swap_sp_en         (cp0_idu_swap_sp_en        ),
  .cp0_ifu_bht_en             (cp0_ifu_bht_en            ),
  .cp0_ifu_bht_inv            (cp0_ifu_bht_inv           ),
  .cp0_ifu_btb_clr            (cp0_ifu_btb_clr           ),
  .cp0_ifu_btb_en             (cp0_ifu_btb_en            ),
  .cp0_ifu_icache_en          (cp0_ifu_icache_en         ),
  .cp0_ifu_icache_inv_addr    (cp0_ifu_icache_inv_addr   ),
  .cp0_ifu_icache_inv_req     (cp0_ifu_icache_inv_req    ),
  .cp0_ifu_icache_inv_type    (cp0_ifu_icache_inv_type   ),
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_ifu_mtvec              (cp0_ifu_mtvec             ),
  .cp0_ifu_ras_en             (cp0_ifu_ras_en            ),
  .cp0_ifu_rst_inv_done       (cp0_ifu_rst_inv_done      ),
  .cp0_iu_icg_en              (cp0_iu_icg_en             ),
  .cp0_lsu_dcache_en          (cp0_lsu_dcache_en         ),
  .cp0_lsu_dcache_wa          (cp0_lsu_dcache_wa         ),
  .cp0_lsu_dcache_wb          (cp0_lsu_dcache_wb         ),
  .cp0_lsu_icc_addr           (cp0_lsu_icc_addr          ),
  .cp0_lsu_icc_op             (cp0_lsu_icc_op            ),
  .cp0_lsu_icc_req            (cp0_lsu_icc_req           ),
  .cp0_lsu_icc_type           (cp0_lsu_icc_type          ),
  .cp0_lsu_icg_en             (cp0_lsu_icg_en            ),
  .cp0_lsu_mm                 (cp0_lsu_mm                ),
  .cp0_pad_mcause             (cp0_pad_mcause            ),
  .cp0_pad_mintstatus         (cp0_pad_mintstatus        ),
  .cp0_pad_mstatus            (cp0_pad_mstatus           ),
  .cp0_pmp_csr_sel            (cp0_pmp_csr_sel           ),
  .cp0_pmp_csr_wen            (cp0_pmp_csr_wen           ),
  .cp0_pmp_icg_en             (cp0_pmp_icg_en            ),
  .cp0_pmp_mstatus_mpp        (cp0_pmp_mstatus_mpp       ),
  .cp0_pmp_mstatus_mprv       (cp0_pmp_mstatus_mprv      ),
  .cp0_pmp_updt_data          (cp0_pmp_updt_data         ),
  .cp0_rtu_icg_en             (cp0_rtu_icg_en            ),
  .cp0_rtu_in_expt            (cp0_rtu_in_expt           ),
  .cp0_rtu_in_nmi             (cp0_rtu_in_nmi            ),
  .cp0_rtu_int_level          (cp0_rtu_int_level         ),
  .cp0_rtu_int_mode           (cp0_rtu_int_mode          ),
  .cp0_rtu_mie                (cp0_rtu_mie               ),
  .cp0_rtu_mnxti_vld          (cp0_rtu_mnxti_vld         ),
  .cp0_rtu_mpil               (cp0_rtu_mpil              ),
  .cp0_rtu_pm_bypass          (cp0_rtu_pm_bypass         ),
  .cp0_rtu_tail_int_hv        (cp0_rtu_tail_int_hv       ),
  .cp0_rtu_tail_int_id        (cp0_rtu_tail_int_id       ),
  .cp0_rtu_wfe_en             (cp0_rtu_wfe_en            ),
  .cp0_xx_async_expt_en       (cp0_xx_async_expt_en      ),
  .cp0_yy_cskyisaee           (cp0_yy_cskyisaee          ),
  .cp0_yy_mach_mode           (cp0_yy_mach_mode          ),
  .cp0_yy_priv_mode           (cp0_yy_priv_mode          ),
  .cpurst_b                   (cpurst_b                  ),
  .dtu_cp0_dcsr_mprven        (dtu_cp0_dcsr_mprven       ),
  .dtu_cp0_dcsr_prv           (dtu_cp0_dcsr_prv          ),
  .dtu_cp0_rdata              (dtu_cp0_rdata             ),
  .ext_inst_ifu_icc_addr      (ext_inst_ifu_icc_addr     ),
  .ext_inst_ifu_icc_req       (ext_inst_ifu_icc_req      ),
  .ext_inst_ifu_icc_type      (ext_inst_ifu_icc_type     ),
  .ext_inst_ifu_inv_done      (ext_inst_ifu_inv_done     ),
  .ext_inst_lsu_icc_addr      (ext_inst_lsu_icc_addr     ),
  .ext_inst_lsu_icc_done      (ext_inst_lsu_icc_done     ),
  .ext_inst_lsu_icc_op        (ext_inst_lsu_icc_op       ),
  .ext_inst_lsu_icc_req       (ext_inst_lsu_icc_req      ),
  .ext_inst_lsu_icc_type      (ext_inst_lsu_icc_type     ),
  .forever_cpuclk             (forever_cpuclk            ),
  .fpu_cp0_wb_fflags          (fpu_cp0_wb_fflags         ),
  .fpu_cp0_wb_fflags_updt     (fpu_cp0_wb_fflags_updt    ),
  .hpcp_cp0_data              (hpcp_cp0_data             ),
  .idu_cp0_id_tail_vld        (idu_cp0_id_tail_vld       ),
  .idu_cp0_ipop_data          (idu_cp0_ipop_data         ),
  .idu_cp0_mcause_wen         (idu_cp0_mcause_wen        ),
  .idu_cp0_mepc_wen           (idu_cp0_mepc_wen          ),
  .idu_cp0_sp_reg             (idu_cp0_sp_reg            ),
  .idu_cp0_sp_swap_pending    (idu_cp0_sp_swap_pending   ),
  .idu_cp0_sp_swap_req        (idu_cp0_sp_swap_req       ),
  .idu_cp0_sp_swap_req_gate   (idu_cp0_sp_swap_req_gate  ),
  .idu_yy_xx_tail_ack         (idu_yy_xx_tail_ack        ),
  .ifu_cp0_bht_inv_done       (ifu_cp0_bht_inv_done      ),
  .ifu_cp0_icache_inv_done    (ifu_cp0_icache_inv_done   ),
  .ifu_cp0_rst_inv_req        (ifu_cp0_rst_inv_req       ),
  .ifu_cp0_vec_err            (ifu_cp0_vec_err           ),
  .ifu_cp0_vec_succeed        (ifu_cp0_vec_succeed       ),
  .inv_sm_clk                 (inv_sm_clk                ),
  .iui_csr_wen_f              (iui_csr_wen_f             ),
  .iui_regs_csr_mnxti_vld     (iui_regs_csr_mnxti_vld    ),
  .iui_regs_csr_wen           (iui_regs_csr_wen          ),
  .iui_regs_imm               (iui_regs_imm              ),
  .iui_regs_inst_csr          (iui_regs_inst_csr         ),
  .iui_regs_inst_mret         (iui_regs_inst_mret        ),
  .iui_regs_wdata             (iui_regs_wdata            ),
  .iui_regs_wdata_mie         (iui_regs_wdata_mie        ),
  .iui_regs_wdata_rs1         (iui_regs_wdata_rs1        ),
  .iui_regs_wdata_srst        (iui_regs_wdata_srst       ),
  .lsu_cp0_icc_done           (lsu_cp0_icc_done          ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pmp_cp0_data               (pmp_cp0_data              ),
  .regs_clk                   (regs_clk                  ),
  .regs_iui_expt_vld          (regs_iui_expt_vld         ),
  .regs_iui_mepc              (regs_iui_mepc             ),
  .regs_iui_mie               (regs_iui_mie              ),
  .regs_iui_mnxti_sel         (regs_iui_mnxti_sel        ),
  .regs_iui_mstatus           (regs_iui_mstatus          ),
  .regs_iui_pm                (regs_iui_pm               ),
  .regs_iui_rdata             (regs_iui_rdata            ),
  .regs_special_lpmd          (regs_special_lpmd         ),
  .regs_srst_srst_vld         (regs_srst_srst_vld        ),
  .regs_srst_srstmd           (regs_srst_srstmd          ),
  .rst_top_op_done            (rst_top_op_done           ),
  .rtu_cp0_bus_error          (rtu_cp0_bus_error         ),
  .rtu_cp0_epc                (rtu_cp0_epc               ),
  .rtu_cp0_exit_debug         (rtu_cp0_exit_debug        ),
  .rtu_cp0_fp_dirty_vld       (rtu_cp0_fp_dirty_vld      ),
  .rtu_cp0_int_level          (rtu_cp0_int_level         ),
  .rtu_cp0_lockup_clr         (rtu_cp0_lockup_clr        ),
  .rtu_cp0_lockup_vld         (rtu_cp0_lockup_vld        ),
  .rtu_cp0_mie_en             (rtu_cp0_mie_en            ),
  .rtu_cp0_mie_gateclk_en     (rtu_cp0_mie_gateclk_en    ),
  .rtu_cp0_mnxti_pending_vld  (rtu_cp0_mnxti_pending_vld ),
  .rtu_cp0_nmi_vld            (rtu_cp0_nmi_vld           ),
  .rtu_cp0_pending_int_hv     (rtu_cp0_pending_int_hv    ),
  .rtu_cp0_pending_int_id     (rtu_cp0_pending_int_id    ),
  .rtu_cp0_pending_int_level  (rtu_cp0_pending_int_level ),
  .rtu_cp0_tval               (rtu_cp0_tval              ),
  .rtu_yy_xx_dbgon            (rtu_yy_xx_dbgon           ),
  .rtu_yy_xx_expt_int         (rtu_yy_xx_expt_int        ),
  .rtu_yy_xx_expt_vec         (rtu_yy_xx_expt_vec        ),
  .rtu_yy_xx_expt_vld         (rtu_yy_xx_expt_vld        ),
  .rtu_yy_xx_int_hv           (rtu_yy_xx_int_hv          ),
  .rtu_yy_xx_tail_int_vld     (rtu_yy_xx_tail_int_vld    ),
  .special_dcache_clean       (special_dcache_clean      ),
  .special_icache_inv         (special_icache_inv        ),
  .special_icache_inv_done    (special_icache_inv_done   ),
  .special_regs_clk_en        (special_regs_clk_en       ),
  .special_regs_inv_sm_clk_en (special_regs_inv_sm_clk_en),
  .sysio_cp0_clkratio         (sysio_cp0_clkratio        ),
  .sysio_cp0_rst_addr         (sysio_cp0_rst_addr        ),
  .tcip_cp0_clic_base         (tcip_cp0_clic_base        )
);

// &Force("output","cp0_iu_icg_en"); @41
// Special Inst module
// &Instance("pa_cp0_special", "x_pa_cp0_special"); @43
pa_cp0_special  x_pa_cp0_special (
  .cp0_ifu_in_lpmd             (cp0_ifu_in_lpmd            ),
  .cp0_ifu_lpmd_req            (cp0_ifu_lpmd_req           ),
  .cp0_lsu_fence_req           (cp0_lsu_fence_req          ),
  .cp0_lsu_sync_req            (cp0_lsu_sync_req           ),
  .cp0_sysio_ipend_b           (cp0_sysio_ipend_b          ),
  .cp0_sysio_lpmd_b            (cp0_sysio_lpmd_b           ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .dtu_cp0_wake_up             (dtu_cp0_wake_up            ),
  .fence_top_cur_state         (fence_top_cur_state        ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ifu_cp0_lpmd_ack            (ifu_cp0_lpmd_ack           ),
  .inv_sm_clk                  (inv_sm_clk                 ),
  .iui_special_ecall           (iui_special_ecall          ),
  .iui_special_fence           (iui_special_fence          ),
  .iui_special_fencei          (iui_special_fencei         ),
  .iui_special_int_vld         (iui_special_int_vld        ),
  .iui_special_sync            (iui_special_sync           ),
  .iui_special_synci           (iui_special_synci          ),
  .iui_special_wfi             (iui_special_wfi            ),
  .lpmd_top_cur_state          (lpmd_top_cur_state         ),
  .lsu_cp0_fence_ack           (lsu_cp0_fence_ack          ),
  .lsu_cp0_icc_done            (lsu_cp0_icc_done           ),
  .lsu_cp0_sync_ack            (lsu_cp0_sync_ack           ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .regs_special_lpmd           (regs_special_lpmd          ),
  .rtu_yy_xx_dbgon             (rtu_yy_xx_dbgon            ),
  .rtu_yy_xx_flush             (rtu_yy_xx_flush            ),
  .special_dcache_clean        (special_dcache_clean       ),
  .special_icache_inv          (special_icache_inv         ),
  .special_icache_inv_done     (special_icache_inv_done    ),
  .special_iui_expt_vld        (special_iui_expt_vld       ),
  .special_iui_stall           (special_iui_stall          ),
  .special_regs_clk_en         (special_regs_clk_en        ),
  .special_regs_inv_sm_clk_en  (special_regs_inv_sm_clk_en ),
  .srst_in_wait_state          (srst_in_wait_state         ),
  .srst_sm_clk                 (srst_sm_clk                ),
  .srst_special_srst_sm_clk_en (srst_special_srst_sm_clk_en)
);


// Extension Inst
// &Instance("pa_cp0_ext_inst"); @46
pa_cp0_ext_inst  x_pa_cp0_ext_inst (
  .ext_inst_ifu_icc_addr (ext_inst_ifu_icc_addr),
  .ext_inst_ifu_icc_req  (ext_inst_ifu_icc_req ),
  .ext_inst_ifu_icc_type (ext_inst_ifu_icc_type),
  .ext_inst_ifu_inv_done (ext_inst_ifu_inv_done),
  .ext_inst_lsu_icc_addr (ext_inst_lsu_icc_addr),
  .ext_inst_lsu_icc_done (ext_inst_lsu_icc_done),
  .ext_inst_lsu_icc_op   (ext_inst_lsu_icc_op  ),
  .ext_inst_lsu_icc_req  (ext_inst_lsu_icc_req ),
  .ext_inst_lsu_icc_type (ext_inst_lsu_icc_type),
  .ext_iui_cache_stall   (ext_iui_cache_stall  ),
  .ext_iui_expt_vld      (ext_iui_expt_vld     ),
  .iui_ext_inst_cache    (iui_ext_inst_cache   ),
  .iui_ext_inst_imm      (iui_ext_inst_imm     ),
  .iui_ext_inst_rs1      (iui_ext_inst_rs1     )
);

// &Force("output", "cp0_yy_priv_mode"); @47

// &Instance("pa_cp0_srst"); @49
pa_cp0_srst  x_pa_cp0_srst (
  .cp0_ifu_srst_mask           (cp0_ifu_srst_mask          ),
  .cp0_ifu_srst_req            (cp0_ifu_srst_req           ),
  .cp0_sysio_srst              (cp0_sysio_srst             ),
  .cpurst_b                    (cpurst_b                   ),
  .ifu_cp0_srst_ack            (ifu_cp0_srst_ack           ),
  .lsu_cp0_sync_ack            (lsu_cp0_sync_ack           ),
  .regs_srst_srst_vld          (regs_srst_srst_vld         ),
  .regs_srst_srstmd            (regs_srst_srstmd           ),
  .rtu_yy_xx_dbgon             (rtu_yy_xx_dbgon            ),
  .rtu_yy_xx_flush             (rtu_yy_xx_flush            ),
  .srst_in_wait_state          (srst_in_wait_state         ),
  .srst_iui_stall              (srst_iui_stall             ),
  .srst_sm_clk                 (srst_sm_clk                ),
  .srst_special_srst_sm_clk_en (srst_special_srst_sm_clk_en),
  .sysio_cp0_clk_en            (sysio_cp0_clk_en           )
);


assign cp0_dtu_debug_info[5:0] = {lpmd_top_cur_state[1:0],
                                  fence_top_cur_state[2:0],
                                  rst_top_op_done};

//assign cp0_had_pcfifo_wen        = 1'b1;





// &ModuleEnd; @158
endmodule


