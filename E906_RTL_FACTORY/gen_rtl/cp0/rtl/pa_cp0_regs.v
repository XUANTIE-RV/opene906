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
module pa_cp0_regs(
  cp0_biu_icg_en,
  cp0_dtu_icg_en,
  cp0_dtu_int_id,
  cp0_dtu_mexpt_vld,
  cp0_dtu_pcfifo_frz,
  cp0_fpu_icg_en,
  cp0_fpu_xx_dqnan,
  cp0_fpu_xx_rm,
  cp0_hpcp_icg_en,
  cp0_hpcp_index,
  cp0_hpcp_pmdm,
  cp0_hpcp_pmdu,
  cp0_hpcp_wdata,
  cp0_hpcp_wreg,
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
  cp0_ifu_mtvec,
  cp0_ifu_ras_en,
  cp0_ifu_rst_inv_done,
  cp0_iu_icg_en,
  cp0_lsu_dcache_en,
  cp0_lsu_dcache_wa,
  cp0_lsu_dcache_wb,
  cp0_lsu_icc_addr,
  cp0_lsu_icc_op,
  cp0_lsu_icc_req,
  cp0_lsu_icc_type,
  cp0_lsu_icg_en,
  cp0_lsu_mm,
  cp0_pad_mcause,
  cp0_pad_mintstatus,
  cp0_pad_mstatus,
  cp0_pmp_csr_sel,
  cp0_pmp_csr_wen,
  cp0_pmp_icg_en,
  cp0_pmp_mstatus_mpp,
  cp0_pmp_mstatus_mprv,
  cp0_pmp_updt_data,
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
  cp0_rtu_wfe_en,
  cp0_xx_async_expt_en,
  cp0_yy_cskyisaee,
  cp0_yy_mach_mode,
  cp0_yy_priv_mode,
  cpurst_b,
  dtu_cp0_dcsr_mprven,
  dtu_cp0_dcsr_prv,
  dtu_cp0_rdata,
  ext_inst_ifu_icc_addr,
  ext_inst_ifu_icc_req,
  ext_inst_ifu_icc_type,
  ext_inst_ifu_inv_done,
  ext_inst_lsu_icc_addr,
  ext_inst_lsu_icc_done,
  ext_inst_lsu_icc_op,
  ext_inst_lsu_icc_req,
  ext_inst_lsu_icc_type,
  forever_cpuclk,
  fpu_cp0_wb_fflags,
  fpu_cp0_wb_fflags_updt,
  hpcp_cp0_data,
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
  ifu_cp0_rst_inv_req,
  ifu_cp0_vec_err,
  ifu_cp0_vec_succeed,
  inv_sm_clk,
  iui_csr_wen_f,
  iui_regs_csr_mnxti_vld,
  iui_regs_csr_wen,
  iui_regs_imm,
  iui_regs_inst_csr,
  iui_regs_inst_mret,
  iui_regs_wdata,
  iui_regs_wdata_mie,
  iui_regs_wdata_rs1,
  iui_regs_wdata_srst,
  lsu_cp0_icc_done,
  pad_yy_icg_scan_en,
  pmp_cp0_data,
  regs_clk,
  regs_iui_expt_vld,
  regs_iui_mepc,
  regs_iui_mie,
  regs_iui_mnxti_sel,
  regs_iui_mstatus,
  regs_iui_pm,
  regs_iui_rdata,
  regs_special_lpmd,
  regs_srst_srst_vld,
  regs_srst_srstmd,
  rst_top_op_done,
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
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vec,
  rtu_yy_xx_expt_vld,
  rtu_yy_xx_int_hv,
  rtu_yy_xx_tail_int_vld,
  special_dcache_clean,
  special_icache_inv,
  special_icache_inv_done,
  special_regs_clk_en,
  special_regs_inv_sm_clk_en,
  sysio_cp0_clkratio,
  sysio_cp0_rst_addr,
  tcip_cp0_clic_base
);

// &Ports; @24
input           cpurst_b;                  
input           dtu_cp0_dcsr_mprven;       
input   [1 :0]  dtu_cp0_dcsr_prv;          
input   [31:0]  dtu_cp0_rdata;             
input   [31:0]  ext_inst_ifu_icc_addr;     
input           ext_inst_ifu_icc_req;      
input           ext_inst_ifu_icc_type;     
input   [31:0]  ext_inst_lsu_icc_addr;     
input   [1 :0]  ext_inst_lsu_icc_op;       
input           ext_inst_lsu_icc_req;      
input   [1 :0]  ext_inst_lsu_icc_type;     
input           forever_cpuclk;            
input   [4 :0]  fpu_cp0_wb_fflags;         
input           fpu_cp0_wb_fflags_updt;    
input   [31:0]  hpcp_cp0_data;             
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
input           ifu_cp0_rst_inv_req;       
input           ifu_cp0_vec_err;           
input           ifu_cp0_vec_succeed;       
input           iui_csr_wen_f;             
input           iui_regs_csr_mnxti_vld;    
input           iui_regs_csr_wen;          
input   [11:0]  iui_regs_imm;              
input           iui_regs_inst_csr;         
input           iui_regs_inst_mret;        
input   [31:0]  iui_regs_wdata;            
input           iui_regs_wdata_mie;        
input   [31:0]  iui_regs_wdata_rs1;        
input   [1 :0]  iui_regs_wdata_srst;       
input           lsu_cp0_icc_done;          
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
input           rtu_yy_xx_dbgon;           
input           rtu_yy_xx_expt_int;        
input   [11:0]  rtu_yy_xx_expt_vec;        
input           rtu_yy_xx_expt_vld;        
input           rtu_yy_xx_int_hv;          
input           rtu_yy_xx_tail_int_vld;    
input           special_dcache_clean;      
input           special_icache_inv;        
input           special_regs_clk_en;       
input           special_regs_inv_sm_clk_en; 
input   [2 :0]  sysio_cp0_clkratio;        
input   [31:0]  sysio_cp0_rst_addr;        
input   [31:0]  tcip_cp0_clic_base;        
output          cp0_biu_icg_en;            
output          cp0_dtu_icg_en;            
output  [11:0]  cp0_dtu_int_id;            
output          cp0_dtu_mexpt_vld;         
output          cp0_dtu_pcfifo_frz;        
output          cp0_fpu_icg_en;            
output          cp0_fpu_xx_dqnan;          
output  [2 :0]  cp0_fpu_xx_rm;             
output          cp0_hpcp_icg_en;           
output  [11:0]  cp0_hpcp_index;            
output          cp0_hpcp_pmdm;             
output          cp0_hpcp_pmdu;             
output  [31:0]  cp0_hpcp_wdata;            
output          cp0_hpcp_wreg;             
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
output  [31:0]  cp0_ifu_mtvec;             
output          cp0_ifu_ras_en;            
output          cp0_ifu_rst_inv_done;      
output          cp0_iu_icg_en;             
output          cp0_lsu_dcache_en;         
output          cp0_lsu_dcache_wa;         
output          cp0_lsu_dcache_wb;         
output  [31:0]  cp0_lsu_icc_addr;          
output  [1 :0]  cp0_lsu_icc_op;            
output          cp0_lsu_icc_req;           
output  [1 :0]  cp0_lsu_icc_type;          
output          cp0_lsu_icg_en;            
output          cp0_lsu_mm;                
output  [31:0]  cp0_pad_mcause;            
output  [31:0]  cp0_pad_mintstatus;        
output  [31:0]  cp0_pad_mstatus;           
output  [19:0]  cp0_pmp_csr_sel;           
output          cp0_pmp_csr_wen;           
output          cp0_pmp_icg_en;            
output  [1 :0]  cp0_pmp_mstatus_mpp;       
output          cp0_pmp_mstatus_mprv;      
output  [31:0]  cp0_pmp_updt_data;         
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
output          cp0_rtu_wfe_en;            
output          cp0_xx_async_expt_en;      
output          cp0_yy_cskyisaee;          
output          cp0_yy_mach_mode;          
output  [1 :0]  cp0_yy_priv_mode;          
output          ext_inst_ifu_inv_done;     
output          ext_inst_lsu_icc_done;     
output          inv_sm_clk;                
output          regs_clk;                  
output          regs_iui_expt_vld;         
output  [31:0]  regs_iui_mepc;             
output          regs_iui_mie;              
output          regs_iui_mnxti_sel;        
output  [31:0]  regs_iui_mstatus;          
output  [1 :0]  regs_iui_pm;               
output  [31:0]  regs_iui_rdata;            
output  [1 :0]  regs_special_lpmd;         
output          regs_srst_srst_vld;        
output  [1 :0]  regs_srst_srstmd;          
output          rst_top_op_done;           
output          special_icache_inv_done;   

// &Regs; @25
reg     [31:0]  regs_csr_rdata;            
reg             regs_ext_imm_inv;          
reg             regs_imm_inv;              

// &Wires; @26
wire            cp0_biu_icg_en;            
wire            cp0_dtu_icg_en;            
wire    [11:0]  cp0_dtu_int_id;            
wire            cp0_dtu_mexpt_vld;         
wire            cp0_dtu_pcfifo_frz;        
wire            cp0_fpu_icg_en;            
wire            cp0_fpu_xx_dqnan;          
wire    [2 :0]  cp0_fpu_xx_rm;             
wire            cp0_hpcp_icg_en;           
wire    [11:0]  cp0_hpcp_index;            
wire            cp0_hpcp_pmdm;             
wire            cp0_hpcp_pmdu;             
wire    [31:0]  cp0_hpcp_wdata;            
wire            cp0_hpcp_wreg;             
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
wire    [31:0]  cp0_ifu_mtvec;             
wire            cp0_ifu_ras_en;            
wire            cp0_ifu_rst_inv_done;      
wire            cp0_iu_icg_en;             
wire            cp0_lsu_dcache_en;         
wire            cp0_lsu_dcache_wa;         
wire            cp0_lsu_dcache_wb;         
wire    [31:0]  cp0_lsu_icc_addr;          
wire    [1 :0]  cp0_lsu_icc_op;            
wire            cp0_lsu_icc_req;           
wire    [1 :0]  cp0_lsu_icc_type;          
wire            cp0_lsu_icg_en;            
wire            cp0_lsu_mm;                
wire    [31:0]  cp0_pad_mcause;            
wire    [31:0]  cp0_pad_mintstatus;        
wire    [31:0]  cp0_pad_mstatus;           
wire    [19:0]  cp0_pmp_csr_sel;           
wire            cp0_pmp_csr_wen;           
wire            cp0_pmp_icg_en;            
wire    [1 :0]  cp0_pmp_mstatus_mpp;       
wire            cp0_pmp_mstatus_mprv;      
wire    [31:0]  cp0_pmp_updt_data;         
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
wire            cp0_rtu_wfe_en;            
wire            cp0_xx_async_expt_en;      
wire            cp0_yy_cskyisaee;          
wire            cp0_yy_mach_mode;          
wire    [1 :0]  cp0_yy_priv_mode;          
wire            cpurst_b;                  
wire            dtu_cp0_dcsr_mprven;       
wire    [1 :0]  dtu_cp0_dcsr_prv;          
wire    [31:0]  dtu_cp0_rdata;             
wire    [31:0]  ext_inst_ifu_icc_addr;     
wire            ext_inst_ifu_icc_req;      
wire            ext_inst_ifu_icc_type;     
wire            ext_inst_ifu_inv_done;     
wire    [31:0]  ext_inst_lsu_icc_addr;     
wire            ext_inst_lsu_icc_done;     
wire    [1 :0]  ext_inst_lsu_icc_op;       
wire            ext_inst_lsu_icc_req;      
wire    [1 :0]  ext_inst_lsu_icc_type;     
wire            fcsr_local_en;             
wire    [31:0]  fcsr_value;                
wire            fflags_clk;                
wire            fflags_clk_en;             
wire            fflags_local_en;           
wire    [31:0]  fflags_value;              
wire            forever_cpuclk;            
wire            fpu_cp0_fflags_updt;       
wire    [4 :0]  fpu_cp0_wb_fflags;         
wire            fpu_cp0_wb_fflags_updt;    
wire            frm_local_en;              
wire    [31:0]  frm_value;                 
wire            fs_dirty_upd;              
wire            fxcr_local_en;             
wire    [31:0]  fxcr_value;                
wire    [31:0]  hpcp_cp0_data;             
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
wire            ifu_cp0_rst_inv_req;       
wire            ifu_cp0_vec_err;           
wire            ifu_cp0_vec_succeed;       
wire            inv_sm_clk;                
wire            iu_cp0_wb_ov_updt;         
wire            iui_csr_wen_f;             
wire            iui_regs_csr_mnxti_vld;    
wire            iui_regs_csr_wen;          
wire    [11:0]  iui_regs_imm;              
wire            iui_regs_inst_csr;         
wire            iui_regs_inst_mret;        
wire    [31:0]  iui_regs_wdata;            
wire            iui_regs_wdata_mie;        
wire    [31:0]  iui_regs_wdata_rs1;        
wire    [1 :0]  iui_regs_wdata_srst;       
wire            lsu_cp0_icc_done;          
wire    [31:0]  marchid_value;             
wire            mcause_local_en;           
wire    [31:0]  mcause_value;              
wire    [31:0]  mclicbase_value;           
wire            mcnten_local_en;           
wire    [31:0]  mcnten_value;              
wire            mcpuid_local_en;           
wire    [31:0]  mcpuid_value;              
wire    [31:0]  medeleg_value;             
wire            mepc_local_en;             
wire    [31:0]  mepc_value;                
wire            mexstatus_local_en;        
wire    [31:0]  mexstatus_value;           
wire    [31:0]  mhartid_value;             
wire            mhcr_local_en;             
wire    [31:0]  mhcr_value;                
wire            mhint2_local_en;           
wire    [31:0]  mhint2_value;              
wire            mhint_local_en;            
wire    [31:0]  mhint_value;               
wire    [31:0]  mideleg_value;             
wire    [31:0]  mie_value;                 
wire    [31:0]  mimpid_value;              
wire    [31:0]  mintstatus_value;          
wire    [31:0]  mip_value;                 
wire    [31:0]  misa_value;                
wire            mnmicause_local_en;        
wire    [31:0]  mnmicause_value;           
wire            mnmipc_local_en;           
wire    [31:0]  mnmipc_value;              
wire            mnxti_local_en;            
wire    [31:0]  mnxti_value;               
wire    [31:0]  mraddr_value;              
wire            mscratch_local_en;         
wire    [31:0]  mscratch_value;            
wire            mscratchcsw_local_en;      
wire    [31:0]  mscratchcsw_value;         
wire            mscratchcswl_local_en;     
wire    [31:0]  mscratchcswl_value;        
wire            mstatus_local_en;          
wire    [31:0]  mstatus_value;             
wire            mtval_local_en;            
wire    [31:0]  mtval_value;               
wire            mtvec_local_en;            
wire    [29:0]  mtvec_rslt;                
wire    [31:0]  mtvec_value;               
wire            mtvt_local_en;             
wire    [31:0]  mtvt_value;                
wire    [31:0]  mvendorid_value;           
wire            mxstatus_local_en;         
wire    [31:0]  mxstatus_value;            
wire            pad_yy_icg_scan_en;        
wire    [31:0]  pmp_cp0_data;              
wire            regs_clk;                  
wire            regs_cpu_in_int;           
wire            regs_cpu_in_nmi;           
wire    [11:0]  regs_csr_imm;              
wire            regs_csr_wen;              
wire            regs_flush_clk;            
wire            regs_flush_icg_en;         
wire            regs_fs_off;               
wire            regs_icg_en;               
wire            regs_iui_expt_vld;         
wire    [31:0]  regs_iui_mepc;             
wire            regs_iui_mie;              
wire            regs_iui_mnxti_sel;        
wire    [31:0]  regs_iui_mstatus;          
wire    [1 :0]  regs_iui_pm;               
wire    [31:0]  regs_iui_rdata;            
wire            regs_mach_mode;            
wire    [1 :0]  regs_special_lpmd;         
wire            regs_spswap_en;            
wire            regs_srst_srst_vld;        
wire    [1 :0]  regs_srst_srstmd;          
wire            regs_swap_int_sp_en_gate;  
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
wire            rtu_yy_xx_dbgon;           
wire            rtu_yy_xx_expt_int;        
wire    [11:0]  rtu_yy_xx_expt_vec;        
wire            rtu_yy_xx_expt_vld;        
wire            rtu_yy_xx_int_hv;          
wire            rtu_yy_xx_tail_int_vld;    
wire            special_dcache_clean;      
wire            special_icache_inv;        
wire            special_icache_inv_done;   
wire            special_regs_clk_en;       
wire            special_regs_inv_sm_clk_en; 
wire    [2 :0]  sysio_cp0_clkratio;        
wire    [31:0]  sysio_cp0_rst_addr;        
wire    [31:0]  tcip_cp0_clic_base;        
wire    [1 :0]  trap_csr_pm;               
wire            vxsat_local_en;            


//==========================================================
// Control Register Module
// 1. Instance ICG Cell
// 1. CSR Address List
// 2. Instance CSR Group Sub-Modules
// 3. CSR Write Port
// 4. CSR Read Port
//==========================================================

//------------------------------------------------
// 1. Instance ICG Cell
// Clock is on when inst csr or expt vld
// Todo: split cpuid index clk
//------------------------------------------------
assign regs_icg_en = iui_regs_csr_wen || iui_csr_wen_f
                  || iui_regs_inst_csr && mcpuid_local_en;  // cpuid index
// &Force("output","cp0_iu_icg_en"); @44
// &Instance("gated_clk_cell", "x_cp0_regs_icg_cell"); @45
gated_clk_cell  x_cp0_regs_icg_cell (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (regs_clk           ),
  .external_en         (1'b0               ),
  .global_en           (special_regs_clk_en),
  .local_en            (regs_icg_en        ),
  .module_en           (cp0_iu_icg_en      ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @46
//          .external_en (1'b0), @47
//          .global_en   (special_regs_clk_en), @48
//          .module_en   (cp0_iu_icg_en), @49
//          .local_en    (regs_icg_en), @50
//          .clk_out     (regs_clk)); @51
// &Force("output", "regs_clk"); @52
assign regs_flush_icg_en = iui_regs_inst_csr
                        || iui_regs_inst_mret
                        || rtu_cp0_exit_debug
                        || rtu_yy_xx_expt_vld
                        || rtu_yy_xx_tail_int_vld
                        || idu_cp0_id_tail_vld
                        || ifu_cp0_vec_succeed
                        || ifu_cp0_vec_err
                        || rtu_cp0_lockup_vld
                        || rtu_cp0_lockup_clr
                        || rtu_cp0_mie_gateclk_en
                        || idu_cp0_mepc_wen
                        || idu_cp0_mcause_wen
                        || idu_yy_xx_tail_ack
                        || regs_swap_int_sp_en_gate;
// &Instance("gated_clk_cell", "x_cp0_regs_flush_icg_cell"); @68
gated_clk_cell  x_cp0_regs_flush_icg_cell (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (regs_flush_clk     ),
  .external_en         (1'b0               ),
  .global_en           (special_regs_clk_en),
  .local_en            (regs_flush_icg_en  ),
  .module_en           (cp0_iu_icg_en      ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @69
//          .external_en (1'b0), @70
//          .global_en   (special_regs_clk_en), @71
//          .module_en   (cp0_iu_icg_en), @72
//          .local_en    (regs_flush_icg_en), @73
//          .clk_out     (regs_flush_clk)); @74

//------------------------------------------------
// 1. CSR Address List
// a. Machine Level Normal CSRs
// b. Machine Level CLIC CSRs
// c. T-Head Extension CSRs
//------------------------------------------------

// a. Machine Level CSRs
// Machine Information Registers
parameter MVENDORID = 12'hF11;
parameter MARCHID   = 12'hF12;
parameter MIMPID    = 12'hF13;
parameter MHARTID   = 12'hF14;

// Machine Trap Setup
parameter MSTATUS   = 12'h300;
parameter MISA      = 12'h301;
parameter MEDELEG   = 12'h302;
parameter MIDELEG   = 12'h303;
parameter MIE       = 12'h304;
parameter MTVEC     = 12'h305;
parameter MCNTEN    = 12'h306;
parameter MTVT      = 12'h307;

// Machine Trap Handling
parameter MSCRATCH  = 12'h340;
parameter MEPC      = 12'h341;
parameter MCAUSE    = 12'h342;
parameter MTVAL     = 12'h343;
parameter MIP       = 12'h344;
parameter MNXTI        = 12'h345;
parameter MINTSTATUS   = 12'h346;
parameter MSCRATCHCSW  = 12'h348;
parameter MSCRATCHCSWL = 12'h349;
parameter MCLICBASE    = 12'h350;


// Machine Protection and Translation
parameter PMPCFG0   = 12'h3A0;
parameter PMPCFG1   = 12'h3A1;
parameter PMPCFG2   = 12'h3A2;
parameter PMPCFG3   = 12'h3A3;
parameter PMPADDR0  = 12'h3B0;
parameter PMPADDR1  = 12'h3B1;
parameter PMPADDR2  = 12'h3B2;
parameter PMPADDR3  = 12'h3B3;
parameter PMPADDR4  = 12'h3B4;
parameter PMPADDR5  = 12'h3B5;
parameter PMPADDR6  = 12'h3B6;
parameter PMPADDR7  = 12'h3B7;
parameter PMPADDR8  = 12'h3B8;
parameter PMPADDR9  = 12'h3B9;
parameter PMPADDR10 = 12'h3BA;
parameter PMPADDR11 = 12'h3BB;
parameter PMPADDR12 = 12'h3BC;
parameter PMPADDR13 = 12'h3BD;
parameter PMPADDR14 = 12'h3BE;
parameter PMPADDR15 = 12'h3BF;

// Performance Monitor Regs
// Machine Counter Setup
parameter MCNTINHBT = 12'h320;
parameter MHPMEVT3  = 12'h323;
parameter MHPMEVT4  = 12'h324;
parameter MHPMEVT5  = 12'h325;
parameter MHPMEVT6  = 12'h326;
parameter MHPMEVT7  = 12'h327;
parameter MHPMEVT8  = 12'h328;
parameter MHPMEVT9  = 12'h329;
parameter MHPMEVT10 = 12'h32A;
parameter MHPMEVT11 = 12'h32B;
parameter MHPMEVT12 = 12'h32C;
parameter MHPMEVT13 = 12'h32D;
parameter MHPMEVT14 = 12'h32E;
parameter MHPMEVT15 = 12'h32F;
parameter MHPMEVT16 = 12'h330;
parameter MHPMEVT17 = 12'h331;
parameter MHPMEVT18 = 12'h332;
parameter MHPMEVT19 = 12'h333;
parameter MHPMEVT20 = 12'h334;
parameter MHPMEVT21 = 12'h335;
parameter MHPMEVT22 = 12'h336;
parameter MHPMEVT23 = 12'h337;
parameter MHPMEVT24 = 12'h338;
parameter MHPMEVT25 = 12'h339;
parameter MHPMEVT26 = 12'h33A;
parameter MHPMEVT27 = 12'h33B;
parameter MHPMEVT28 = 12'h33C;
parameter MHPMEVT29 = 12'h33D;
parameter MHPMEVT30 = 12'h33E;
parameter MHPMEVT31 = 12'h33F;

// Machine Counters/Timers
// Low
parameter MCYCLE    = 12'hB00;
parameter MINSTRET  = 12'hB02;
parameter MHPMCNT3  = 12'hB03;
parameter MHPMCNT4  = 12'hB04;
parameter MHPMCNT5  = 12'hB05;
parameter MHPMCNT6  = 12'hB06;
parameter MHPMCNT7  = 12'hB07;
parameter MHPMCNT8  = 12'hB08;
parameter MHPMCNT9  = 12'hB09;
parameter MHPMCNT10 = 12'hB0A;
parameter MHPMCNT11 = 12'hB0B;
parameter MHPMCNT12 = 12'hB0C;
parameter MHPMCNT13 = 12'hB0D;
parameter MHPMCNT14 = 12'hB0E;
parameter MHPMCNT15 = 12'hB0F;
parameter MHPMCNT16 = 12'hB10;
parameter MHPMCNT17 = 12'hB11;
parameter MHPMCNT18 = 12'hB12;
parameter MHPMCNT19 = 12'hB13;
parameter MHPMCNT20 = 12'hB14;
parameter MHPMCNT21 = 12'hB15;
parameter MHPMCNT22 = 12'hB16;
parameter MHPMCNT23 = 12'hB17;
parameter MHPMCNT24 = 12'hB18;
parameter MHPMCNT25 = 12'hB19;
parameter MHPMCNT26 = 12'hB1A;
parameter MHPMCNT27 = 12'hB1B;
parameter MHPMCNT28 = 12'hB1C;
parameter MHPMCNT29 = 12'hB1D;
parameter MHPMCNT30 = 12'hB1E;
parameter MHPMCNT31 = 12'hB1F;
// High
parameter MCYCLEH    = 12'hB80;
parameter MINSTRETH  = 12'hB82;
parameter MHPMCNT3H  = 12'hB83;
parameter MHPMCNT4H  = 12'hB84;
parameter MHPMCNT5H  = 12'hB85;
parameter MHPMCNT6H  = 12'hB86;
parameter MHPMCNT7H  = 12'hB87;
parameter MHPMCNT8H  = 12'hB88;
parameter MHPMCNT9H  = 12'hB89;
parameter MHPMCNT10H = 12'hB8A;
parameter MHPMCNT11H = 12'hB8B;
parameter MHPMCNT12H = 12'hB8C;
parameter MHPMCNT13H = 12'hB8D;
parameter MHPMCNT14H = 12'hB8E;
parameter MHPMCNT15H = 12'hB8F;
parameter MHPMCNT16H = 12'hB90;
parameter MHPMCNT17H = 12'hB91;
parameter MHPMCNT18H = 12'hB92;
parameter MHPMCNT19H = 12'hB93;
parameter MHPMCNT20H = 12'hB94;
parameter MHPMCNT21H = 12'hB95;
parameter MHPMCNT22H = 12'hB96;
parameter MHPMCNT23H = 12'hB97;
parameter MHPMCNT24H = 12'hB98;
parameter MHPMCNT25H = 12'hB99;
parameter MHPMCNT26H = 12'hB9A;
parameter MHPMCNT27H = 12'hB9B;
parameter MHPMCNT28H = 12'hB9C;
parameter MHPMCNT29H = 12'hB9D;
parameter MHPMCNT30H = 12'hB9E;
parameter MHPMCNT31H = 12'hB9F;

// User Counters/Timers
// Low
parameter CYCLE    = 12'hC00;
parameter REG_TIME     = 12'hC01;
parameter INSTRET  = 12'hC02;
parameter HPMCNT3  = 12'hC03;
parameter HPMCNT4  = 12'hC04;
parameter HPMCNT5  = 12'hC05;
parameter HPMCNT6  = 12'hC06;
parameter HPMCNT7  = 12'hC07;
parameter HPMCNT8  = 12'hC08;
parameter HPMCNT9  = 12'hC09;
parameter HPMCNT10 = 12'hC0A;
parameter HPMCNT11 = 12'hC0B;
parameter HPMCNT12 = 12'hC0C;
parameter HPMCNT13 = 12'hC0D;
parameter HPMCNT14 = 12'hC0E;
parameter HPMCNT15 = 12'hC0F;
parameter HPMCNT16 = 12'hC10;
parameter HPMCNT17 = 12'hC11;
parameter HPMCNT18 = 12'hC12;
parameter HPMCNT19 = 12'hC13;
parameter HPMCNT20 = 12'hC14;
parameter HPMCNT21 = 12'hC15;
parameter HPMCNT22 = 12'hC16;
parameter HPMCNT23 = 12'hC17;
parameter HPMCNT24 = 12'hC18;
parameter HPMCNT25 = 12'hC19;
parameter HPMCNT26 = 12'hC1A;
parameter HPMCNT27 = 12'hC1B;
parameter HPMCNT28 = 12'hC1C;
parameter HPMCNT29 = 12'hC1D;
parameter HPMCNT30 = 12'hC1E;
parameter HPMCNT31 = 12'hC1F;
// High
parameter CYCLEH    = 12'hC80;
parameter REG_TIMEH     = 12'hC81;
parameter INSTRETH  = 12'hC82;
parameter HPMCNT3H  = 12'hC83;
parameter HPMCNT4H  = 12'hC84;
parameter HPMCNT5H  = 12'hC85;
parameter HPMCNT6H  = 12'hC86;
parameter HPMCNT7H  = 12'hC87;
parameter HPMCNT8H  = 12'hC88;
parameter HPMCNT9H  = 12'hC89;
parameter HPMCNT10H = 12'hC8A;
parameter HPMCNT11H = 12'hC8B;
parameter HPMCNT12H = 12'hC8C;
parameter HPMCNT13H = 12'hC8D;
parameter HPMCNT14H = 12'hC8E;
parameter HPMCNT15H = 12'hC8F;
parameter HPMCNT16H = 12'hC90;
parameter HPMCNT17H = 12'hC91;
parameter HPMCNT18H = 12'hC92;
parameter HPMCNT19H = 12'hC93;
parameter HPMCNT20H = 12'hC94;
parameter HPMCNT21H = 12'hC95;
parameter HPMCNT22H = 12'hC96;
parameter HPMCNT23H = 12'hC97;
parameter HPMCNT24H = 12'hC98;
parameter HPMCNT25H = 12'hC99;
parameter HPMCNT26H = 12'hC9A;
parameter HPMCNT27H = 12'hC9B;
parameter HPMCNT28H = 12'hC9C;
parameter HPMCNT29H = 12'hC9D;
parameter HPMCNT30H = 12'hC9E;
parameter HPMCNT31H = 12'hC9F;

// User Floating-Point
parameter FFLAGS    = 12'h001;
parameter FRM       = 12'h002;
parameter FCSR      = 12'h003;
parameter FXCR      = 12'h800; // T-Head Extension

//DSP and vector 
parameter VXSAT     = 12'h009;

// c. T-Head Extension CSRs
// Processor Control and Status Extension; M-Mode
parameter MXSTATUS  = 12'h7C0;
parameter MHCR      = 12'h7C1;
parameter MHINT     = 12'h7C5;
parameter MHINT2     = 12'h7CC;
// Processor ID Extension; M-Mode
parameter MCPUID    = 12'hFC0;

parameter MRADDR    = 12'h7E0;
parameter MEXSTATUS = 12'h7E1;
parameter MNMICAUSE = 12'h7E2;
parameter MNMIPC    = 12'h7E3;
//----------------------------------------------------------
//                       Debug CSRs
//----------------------------------------------------------
parameter DCSR       = 12'h7B0;
parameter DPC        = 12'h7B1;
parameter DSCRATCH0  = 12'h7B2;
parameter DSCRATCH1  = 12'h7B3;

//----------------------------------------------------------
//                      Trigger CSRs
//----------------------------------------------------------
parameter TSELECT    = 12'h7A0;
parameter TDATA1     = 12'h7A1;
parameter TDATA2     = 12'h7A2;
parameter TDATA3     = 12'h7A3;
parameter TINFO      = 12'h7A4;
parameter TCONTROL   = 12'h7A5;
parameter MCONTEXT   = 12'h7A8;
parameter SCONTEXT   = 12'h7AA;

//-----------Debug Extension -----------
parameter MHALTCAUSE = 12'hFE0;
parameter MDBGINFO   = 12'hFE1;
parameter MPCFIFO    = 12'hFE2;

//------------------------------------------------
// 2. Instance CSR Group Sub-Modules
//------------------------------------------------

// Machine Information & Counter Registers
// &Instance("pa_cp0_info_csr", "x_pa_cp0_info_csr"); @354
pa_cp0_info_csr  x_pa_cp0_info_csr (
  .cpurst_b          (cpurst_b         ),
  .iui_regs_inst_csr (iui_regs_inst_csr),
  .marchid_value     (marchid_value    ),
  .mcpuid_local_en   (mcpuid_local_en  ),
  .mcpuid_value      (mcpuid_value     ),
  .mhartid_value     (mhartid_value    ),
  .mimpid_value      (mimpid_value     ),
  .mvendorid_value   (mvendorid_value  ),
  .regs_clk          (regs_clk         )
);


// Machine Trap Setup & Handling Registers
// &Instance("pa_cp0_trap_csr", "x_pa_cp0_trap_csr"); @357
pa_cp0_trap_csr  x_pa_cp0_trap_csr (
  .cp0_dtu_int_id            (cp0_dtu_int_id           ),
  .cp0_dtu_mexpt_vld         (cp0_dtu_mexpt_vld        ),
  .cp0_hpcp_pmdm             (cp0_hpcp_pmdm            ),
  .cp0_hpcp_pmdu             (cp0_hpcp_pmdu            ),
  .cp0_idu_fs                (cp0_idu_fs               ),
  .cp0_idu_mcause            (cp0_idu_mcause           ),
  .cp0_idu_mepc              (cp0_idu_mepc             ),
  .cp0_idu_sp_use_scratch    (cp0_idu_sp_use_scratch   ),
  .cp0_idu_sp_wdata          (cp0_idu_sp_wdata         ),
  .cp0_idu_sp_wen            (cp0_idu_sp_wen           ),
  .cp0_idu_sp_wen_gate       (cp0_idu_sp_wen_gate      ),
  .cp0_lsu_mm                (cp0_lsu_mm               ),
  .cp0_pmp_mstatus_mpp       (cp0_pmp_mstatus_mpp      ),
  .cp0_pmp_mstatus_mprv      (cp0_pmp_mstatus_mprv     ),
  .cp0_rtu_in_nmi            (cp0_rtu_in_nmi           ),
  .cp0_rtu_int_level         (cp0_rtu_int_level        ),
  .cp0_rtu_int_mode          (cp0_rtu_int_mode         ),
  .cp0_rtu_mie               (cp0_rtu_mie              ),
  .cp0_rtu_mnxti_vld         (cp0_rtu_mnxti_vld        ),
  .cp0_rtu_mpil              (cp0_rtu_mpil             ),
  .cp0_rtu_pm_bypass         (cp0_rtu_pm_bypass        ),
  .cp0_rtu_tail_int_hv       (cp0_rtu_tail_int_hv      ),
  .cp0_rtu_tail_int_id       (cp0_rtu_tail_int_id      ),
  .cp0_yy_cskyisaee          (cp0_yy_cskyisaee         ),
  .cpurst_b                  (cpurst_b                 ),
  .dtu_cp0_dcsr_mprven       (dtu_cp0_dcsr_mprven      ),
  .dtu_cp0_dcsr_prv          (dtu_cp0_dcsr_prv         ),
  .fcsr_local_en             (fcsr_local_en            ),
  .fflags_clk                (fflags_clk               ),
  .fflags_local_en           (fflags_local_en          ),
  .fpu_cp0_wb_fflags_updt    (fpu_cp0_wb_fflags_updt   ),
  .frm_local_en              (frm_local_en             ),
  .fs_dirty_upd              (fs_dirty_upd             ),
  .fxcr_local_en             (fxcr_local_en            ),
  .idu_cp0_id_tail_vld       (idu_cp0_id_tail_vld      ),
  .idu_cp0_ipop_data         (idu_cp0_ipop_data        ),
  .idu_cp0_mcause_wen        (idu_cp0_mcause_wen       ),
  .idu_cp0_mepc_wen          (idu_cp0_mepc_wen         ),
  .idu_cp0_sp_reg            (idu_cp0_sp_reg           ),
  .idu_cp0_sp_swap_pending   (idu_cp0_sp_swap_pending  ),
  .idu_cp0_sp_swap_req       (idu_cp0_sp_swap_req      ),
  .idu_cp0_sp_swap_req_gate  (idu_cp0_sp_swap_req_gate ),
  .idu_yy_xx_tail_ack        (idu_yy_xx_tail_ack       ),
  .ifu_cp0_vec_err           (ifu_cp0_vec_err          ),
  .ifu_cp0_vec_succeed       (ifu_cp0_vec_succeed      ),
  .iui_regs_inst_mret        (iui_regs_inst_mret       ),
  .iui_regs_wdata            (iui_regs_wdata           ),
  .iui_regs_wdata_mie        (iui_regs_wdata_mie       ),
  .iui_regs_wdata_rs1        (iui_regs_wdata_rs1       ),
  .mcause_local_en           (mcause_local_en          ),
  .mcause_value              (mcause_value             ),
  .mclicbase_value           (mclicbase_value          ),
  .mcnten_local_en           (mcnten_local_en          ),
  .mcnten_value              (mcnten_value             ),
  .medeleg_value             (medeleg_value            ),
  .mepc_local_en             (mepc_local_en            ),
  .mepc_value                (mepc_value               ),
  .mideleg_value             (mideleg_value            ),
  .mie_value                 (mie_value                ),
  .mintstatus_value          (mintstatus_value         ),
  .mip_value                 (mip_value                ),
  .misa_value                (misa_value               ),
  .mnmicause_local_en        (mnmicause_local_en       ),
  .mnmicause_value           (mnmicause_value          ),
  .mnmipc_local_en           (mnmipc_local_en          ),
  .mnmipc_value              (mnmipc_value             ),
  .mnxti_local_en            (mnxti_local_en           ),
  .mnxti_value               (mnxti_value              ),
  .mscratch_local_en         (mscratch_local_en        ),
  .mscratch_value            (mscratch_value           ),
  .mscratchcsw_local_en      (mscratchcsw_local_en     ),
  .mscratchcsw_value         (mscratchcsw_value        ),
  .mscratchcswl_local_en     (mscratchcswl_local_en    ),
  .mscratchcswl_value        (mscratchcswl_value       ),
  .mstatus_local_en          (mstatus_local_en         ),
  .mstatus_value             (mstatus_value            ),
  .mtval_local_en            (mtval_local_en           ),
  .mtval_value               (mtval_value              ),
  .mtvec_local_en            (mtvec_local_en           ),
  .mtvec_rslt                (mtvec_rslt               ),
  .mtvec_value               (mtvec_value              ),
  .mtvt_local_en             (mtvt_local_en            ),
  .mtvt_value                (mtvt_value               ),
  .mxstatus_local_en         (mxstatus_local_en        ),
  .mxstatus_value            (mxstatus_value           ),
  .regs_clk                  (regs_clk                 ),
  .regs_cpu_in_int           (regs_cpu_in_int          ),
  .regs_cpu_in_nmi           (regs_cpu_in_nmi          ),
  .regs_flush_clk            (regs_flush_clk           ),
  .regs_fs_off               (regs_fs_off              ),
  .regs_iui_mie              (regs_iui_mie             ),
  .regs_spswap_en            (regs_spswap_en           ),
  .regs_swap_int_sp_en_gate  (regs_swap_int_sp_en_gate ),
  .rtu_cp0_epc               (rtu_cp0_epc              ),
  .rtu_cp0_exit_debug        (rtu_cp0_exit_debug       ),
  .rtu_cp0_fp_dirty_vld      (rtu_cp0_fp_dirty_vld     ),
  .rtu_cp0_int_level         (rtu_cp0_int_level        ),
  .rtu_cp0_mie_en            (rtu_cp0_mie_en           ),
  .rtu_cp0_mnxti_pending_vld (rtu_cp0_mnxti_pending_vld),
  .rtu_cp0_nmi_vld           (rtu_cp0_nmi_vld          ),
  .rtu_cp0_pending_int_hv    (rtu_cp0_pending_int_hv   ),
  .rtu_cp0_pending_int_id    (rtu_cp0_pending_int_id   ),
  .rtu_cp0_pending_int_level (rtu_cp0_pending_int_level),
  .rtu_cp0_tval              (rtu_cp0_tval             ),
  .rtu_yy_xx_dbgon           (rtu_yy_xx_dbgon          ),
  .rtu_yy_xx_expt_int        (rtu_yy_xx_expt_int       ),
  .rtu_yy_xx_expt_vec        (rtu_yy_xx_expt_vec       ),
  .rtu_yy_xx_expt_vld        (rtu_yy_xx_expt_vld       ),
  .rtu_yy_xx_int_hv          (rtu_yy_xx_int_hv         ),
  .rtu_yy_xx_tail_int_vld    (rtu_yy_xx_tail_int_vld   ),
  .tcip_cp0_clic_base        (tcip_cp0_clic_base       ),
  .trap_csr_pm               (trap_csr_pm              )
);


// Machine Extension Registers
// &Instance("pa_cp0_ext_csr", "x_pa_cp0_ext_csr"); @360
pa_cp0_ext_csr  x_pa_cp0_ext_csr (
  .cp0_biu_icg_en             (cp0_biu_icg_en            ),
  .cp0_dtu_icg_en             (cp0_dtu_icg_en            ),
  .cp0_dtu_pcfifo_frz         (cp0_dtu_pcfifo_frz        ),
  .cp0_fpu_icg_en             (cp0_fpu_icg_en            ),
  .cp0_hpcp_icg_en            (cp0_hpcp_icg_en           ),
  .cp0_idu_icg_en             (cp0_idu_icg_en            ),
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
  .cp0_pmp_icg_en             (cp0_pmp_icg_en            ),
  .cp0_rtu_icg_en             (cp0_rtu_icg_en            ),
  .cp0_rtu_in_expt            (cp0_rtu_in_expt           ),
  .cp0_rtu_wfe_en             (cp0_rtu_wfe_en            ),
  .cp0_xx_async_expt_en       (cp0_xx_async_expt_en      ),
  .cpurst_b                   (cpurst_b                  ),
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
  .ifu_cp0_bht_inv_done       (ifu_cp0_bht_inv_done      ),
  .ifu_cp0_icache_inv_done    (ifu_cp0_icache_inv_done   ),
  .ifu_cp0_rst_inv_req        (ifu_cp0_rst_inv_req       ),
  .inv_sm_clk                 (inv_sm_clk                ),
  .iui_regs_inst_mret         (iui_regs_inst_mret        ),
  .iui_regs_wdata             (iui_regs_wdata            ),
  .iui_regs_wdata_srst        (iui_regs_wdata_srst       ),
  .lsu_cp0_icc_done           (lsu_cp0_icc_done          ),
  .mexstatus_local_en         (mexstatus_local_en        ),
  .mexstatus_value            (mexstatus_value           ),
  .mhcr_local_en              (mhcr_local_en             ),
  .mhcr_value                 (mhcr_value                ),
  .mhint2_local_en            (mhint2_local_en           ),
  .mhint2_value               (mhint2_value              ),
  .mhint_local_en             (mhint_local_en            ),
  .mhint_value                (mhint_value               ),
  .mraddr_value               (mraddr_value              ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .regs_clk                   (regs_clk                  ),
  .regs_cpu_in_int            (regs_cpu_in_int           ),
  .regs_cpu_in_nmi            (regs_cpu_in_nmi           ),
  .regs_flush_clk             (regs_flush_clk            ),
  .regs_special_lpmd          (regs_special_lpmd         ),
  .regs_spswap_en             (regs_spswap_en            ),
  .regs_srst_srst_vld         (regs_srst_srst_vld        ),
  .regs_srst_srstmd           (regs_srst_srstmd          ),
  .rst_top_op_done            (rst_top_op_done           ),
  .rtu_cp0_bus_error          (rtu_cp0_bus_error         ),
  .rtu_cp0_lockup_clr         (rtu_cp0_lockup_clr        ),
  .rtu_cp0_lockup_vld         (rtu_cp0_lockup_vld        ),
  .rtu_cp0_nmi_vld            (rtu_cp0_nmi_vld           ),
  .rtu_yy_xx_dbgon            (rtu_yy_xx_dbgon           ),
  .rtu_yy_xx_expt_int         (rtu_yy_xx_expt_int        ),
  .rtu_yy_xx_expt_vld         (rtu_yy_xx_expt_vld        ),
  .special_dcache_clean       (special_dcache_clean      ),
  .special_icache_inv         (special_icache_inv        ),
  .special_icache_inv_done    (special_icache_inv_done   ),
  .special_regs_clk_en        (special_regs_clk_en       ),
  .special_regs_inv_sm_clk_en (special_regs_inv_sm_clk_en),
  .sysio_cp0_clkratio         (sysio_cp0_clkratio        ),
  .sysio_cp0_rst_addr         (sysio_cp0_rst_addr        )
);


// Floating-Point Registers
// &Instance("pa_cp0_float_csr", "x_pa_cp0_float_csr"); @364
pa_cp0_float_csr  x_pa_cp0_float_csr (
  .cp0_fpu_xx_dqnan       (cp0_fpu_xx_dqnan      ),
  .cp0_fpu_xx_rm          (cp0_fpu_xx_rm         ),
  .cp0_idu_rm             (cp0_idu_rm            ),
  .cpurst_b               (cpurst_b              ),
  .fcsr_local_en          (fcsr_local_en         ),
  .fcsr_value             (fcsr_value            ),
  .fflags_clk             (fflags_clk            ),
  .fflags_local_en        (fflags_local_en       ),
  .fflags_value           (fflags_value          ),
  .fpu_cp0_fflags_updt    (fpu_cp0_fflags_updt   ),
  .fpu_cp0_wb_fflags      (fpu_cp0_wb_fflags     ),
  .fpu_cp0_wb_fflags_updt (fpu_cp0_wb_fflags_updt),
  .frm_local_en           (frm_local_en          ),
  .frm_value              (frm_value             ),
  .fxcr_local_en          (fxcr_local_en         ),
  .fxcr_value             (fxcr_value            ),
  .iui_regs_wdata         (iui_regs_wdata        ),
  .regs_clk               (regs_clk              )
);

assign fflags_clk_en = fflags_local_en
                    || fcsr_local_en
                    || fxcr_local_en
                    || vxsat_local_en
                    || fpu_cp0_fflags_updt
                    || iu_cp0_wb_ov_updt
                    || fs_dirty_upd
                    || iui_regs_inst_csr;
// &Instance("gated_clk_cell", "x_fflags_clk"); @375
gated_clk_cell  x_fflags_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (fflags_clk         ),
  .external_en         (1'b0               ),
  .global_en           (special_regs_clk_en),
  .local_en            (fflags_clk_en      ),
  .module_en           (cp0_iu_icg_en      ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @376
//          .external_en (1'b0), @377
//          .global_en   (special_regs_clk_en), @378
//          .module_en   (cp0_iu_icg_en), @379
//          .local_en    (fflags_clk_en), @380
//          .clk_out     (fflags_clk)); @381
assign vxsat_local_en    = 1'b0;
assign iu_cp0_wb_ov_updt = 1'b0;

// &Instance("gated_clk_cell", "x_fflags_clk"); @394
// &Connect(.clk_in      (forever_cpuclk), @395
//          .external_en (1'b0), @396
//          .global_en   (special_regs_clk_en), @397
//          .module_en   (cp0_iu_icg_en), @398
//          .local_en    (fflags_clk_en), @399
//          .clk_out     (fflags_clk)); @400





// &Instance("pa_cp0_other_csr", "x_pa_cp0_other_csr"); @411
//------------------------------------------------
// 3. CSR Write Port
// a. Illegal Access
// b. CSR Write decode
//------------------------------------------------
assign regs_mach_mode = trap_csr_pm[1:0] == 2'b11;

// a. Illegal Access
assign regs_csr_imm[11:0]   = iui_regs_imm[11:0];

// Qualify CSR Imm Addr
// &CombBeg; @424
always @( regs_fs_off
       or mcnten_value[9:0]
       or mcnten_value[31:24]
       or mcnten_value[25:7]
       or regs_ext_imm_inv
       or rtu_yy_xx_dbgon
       or regs_csr_imm[11:0]
       or trap_csr_pm[1:0])
begin
  casez(regs_csr_imm[11:0])
    MVENDORID : regs_imm_inv = 1'b0;
    MARCHID   : regs_imm_inv = 1'b0;
    MIMPID    : regs_imm_inv = 1'b0;
    MHARTID   : regs_imm_inv = 1'b0;

    MSTATUS   : regs_imm_inv = 1'b0;
    MISA      : regs_imm_inv = 1'b0;
    MIE       : regs_imm_inv = 1'b0;
    MEDELEG   : regs_imm_inv = 1'b0;
    MIDELEG   : regs_imm_inv = 1'b0;
    MTVEC     : regs_imm_inv = 1'b0;
    MCNTEN    : regs_imm_inv = 1'b0;
    MTVT      : regs_imm_inv = 1'b0;

    MSCRATCH  : regs_imm_inv = 1'b0;
    MEPC      : regs_imm_inv = 1'b0;
    MCAUSE    : regs_imm_inv = 1'b0;
    MTVAL     : regs_imm_inv = 1'b0;
    MIP       : regs_imm_inv = 1'b0;
    MNXTI        : regs_imm_inv = 1'b0;
    MINTSTATUS   : regs_imm_inv = 1'b0;
    MSCRATCHCSW  : regs_imm_inv = 1'b0;
    MSCRATCHCSWL : regs_imm_inv = 1'b0;
    MCLICBASE    : regs_imm_inv = 1'b0;

    // HPCP
    MCNTINHBT  : regs_imm_inv = 1'b0;
    MHPMEVT3   : regs_imm_inv = 1'b0;
    MHPMEVT4   : regs_imm_inv = 1'b0;
    MHPMEVT5   : regs_imm_inv = 1'b0;
    MHPMEVT6   : regs_imm_inv = 1'b0;
    MHPMEVT7   : regs_imm_inv = 1'b0;
    MHPMEVT8   : regs_imm_inv = 1'b0;
    MHPMEVT9   : regs_imm_inv = 1'b0;
    MHPMEVT10  : regs_imm_inv = 1'b0;
    MHPMEVT11  : regs_imm_inv = 1'b0;
    MHPMEVT12  : regs_imm_inv = 1'b0;
    MHPMEVT13  : regs_imm_inv = 1'b0;
    MHPMEVT14  : regs_imm_inv = 1'b0;
    MHPMEVT15  : regs_imm_inv = 1'b0;
    MHPMEVT16  : regs_imm_inv = 1'b0;
    MHPMEVT17  : regs_imm_inv = 1'b0;
    MHPMEVT18  : regs_imm_inv = 1'b0;
    MHPMEVT19  : regs_imm_inv = 1'b0;
    MHPMEVT20  : regs_imm_inv = 1'b0;
    MHPMEVT21  : regs_imm_inv = 1'b0;
    MHPMEVT22  : regs_imm_inv = 1'b0;
    MHPMEVT23  : regs_imm_inv = 1'b0;
    MHPMEVT24  : regs_imm_inv = 1'b0;
    MHPMEVT25  : regs_imm_inv = 1'b0;
    MHPMEVT26  : regs_imm_inv = 1'b0;
    MHPMEVT27  : regs_imm_inv = 1'b0;
    MHPMEVT28  : regs_imm_inv = 1'b0;
    MHPMEVT29  : regs_imm_inv = 1'b0;
    MHPMEVT30  : regs_imm_inv = 1'b0;
    MHPMEVT31  : regs_imm_inv = 1'b0;

    MCYCLE     : regs_imm_inv = 1'b0;
    MINSTRET   : regs_imm_inv = 1'b0;
    MHPMCNT3   : regs_imm_inv = 1'b0;
    MHPMCNT4   : regs_imm_inv = 1'b0;
    MHPMCNT5   : regs_imm_inv = 1'b0;
    MHPMCNT6   : regs_imm_inv = 1'b0;
    MHPMCNT7   : regs_imm_inv = 1'b0;
    MHPMCNT8   : regs_imm_inv = 1'b0;
    MHPMCNT9   : regs_imm_inv = 1'b0;
    MHPMCNT10  : regs_imm_inv = 1'b0;
    MHPMCNT11  : regs_imm_inv = 1'b0;
    MHPMCNT12  : regs_imm_inv = 1'b0;
    MHPMCNT13  : regs_imm_inv = 1'b0;
    MHPMCNT14  : regs_imm_inv = 1'b0;
    MHPMCNT15  : regs_imm_inv = 1'b0;
    MHPMCNT16  : regs_imm_inv = 1'b0;
    MHPMCNT17  : regs_imm_inv = 1'b0;
    MHPMCNT18  : regs_imm_inv = 1'b0;
    MHPMCNT19  : regs_imm_inv = 1'b0;
    MHPMCNT20  : regs_imm_inv = 1'b0;
    MHPMCNT21  : regs_imm_inv = 1'b0;
    MHPMCNT22  : regs_imm_inv = 1'b0;
    MHPMCNT23  : regs_imm_inv = 1'b0;
    MHPMCNT24  : regs_imm_inv = 1'b0;
    MHPMCNT25  : regs_imm_inv = 1'b0;
    MHPMCNT26  : regs_imm_inv = 1'b0;
    MHPMCNT27  : regs_imm_inv = 1'b0;
    MHPMCNT28  : regs_imm_inv = 1'b0;
    MHPMCNT29  : regs_imm_inv = 1'b0;
    MHPMCNT30  : regs_imm_inv = 1'b0;
    MHPMCNT31  : regs_imm_inv = 1'b0;
    
    MCYCLEH     : regs_imm_inv = 1'b0;
    MINSTRETH   : regs_imm_inv = 1'b0;
    MHPMCNT3H   : regs_imm_inv = 1'b0;
    MHPMCNT4H   : regs_imm_inv = 1'b0;
    MHPMCNT5H   : regs_imm_inv = 1'b0;
    MHPMCNT6H   : regs_imm_inv = 1'b0;
    MHPMCNT7H   : regs_imm_inv = 1'b0;
    MHPMCNT8H   : regs_imm_inv = 1'b0;
    MHPMCNT9H   : regs_imm_inv = 1'b0;
    MHPMCNT10H  : regs_imm_inv = 1'b0;
    MHPMCNT11H  : regs_imm_inv = 1'b0;
    MHPMCNT12H  : regs_imm_inv = 1'b0;
    MHPMCNT13H  : regs_imm_inv = 1'b0;
    MHPMCNT14H  : regs_imm_inv = 1'b0;
    MHPMCNT15H  : regs_imm_inv = 1'b0;
    MHPMCNT16H  : regs_imm_inv = 1'b0;
    MHPMCNT17H  : regs_imm_inv = 1'b0;
    MHPMCNT18H  : regs_imm_inv = 1'b0;
    MHPMCNT19H  : regs_imm_inv = 1'b0;
    MHPMCNT20H  : regs_imm_inv = 1'b0;
    MHPMCNT21H  : regs_imm_inv = 1'b0;
    MHPMCNT22H  : regs_imm_inv = 1'b0;
    MHPMCNT23H  : regs_imm_inv = 1'b0;
    MHPMCNT24H  : regs_imm_inv = 1'b0;
    MHPMCNT25H  : regs_imm_inv = 1'b0;
    MHPMCNT26H  : regs_imm_inv = 1'b0;
    MHPMCNT27H  : regs_imm_inv = 1'b0;
    MHPMCNT28H  : regs_imm_inv = 1'b0;
    MHPMCNT29H  : regs_imm_inv = 1'b0;
    MHPMCNT30H  : regs_imm_inv = 1'b0;
    MHPMCNT31H  : regs_imm_inv = 1'b0;

    CYCLE     : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[0]);
    REG_TIME      : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[1]);
    INSTRET   : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[2]);
    HPMCNT3   : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[3]);
    HPMCNT4   : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[4]);
    HPMCNT5   : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[5]);
    HPMCNT6   : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[6]);
    HPMCNT7   : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[7]);
    HPMCNT8   : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[8]);
    HPMCNT9   : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[9]);
    HPMCNT10  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[10]);
    HPMCNT11  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[11]);
    HPMCNT12  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[12]);
    HPMCNT13  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[13]);
    HPMCNT14  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[14]);
    HPMCNT15  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[15]);
    HPMCNT16  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[16]);
    HPMCNT17  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[17]);
    HPMCNT18  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[18]);
    HPMCNT19  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[19]);
    HPMCNT20  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[20]);
    HPMCNT21  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[21]);
    HPMCNT22  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[22]);
    HPMCNT23  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[23]);
    HPMCNT24  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[24]);
    HPMCNT25  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[25]);
    HPMCNT26  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[26]);
    HPMCNT27  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[27]);
    HPMCNT28  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[28]);
    HPMCNT29  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[29]);
    HPMCNT30  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[30]);
    HPMCNT31  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[31]);

    CYCLEH    : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[0]);
    REG_TIMEH     : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[1]);
    INSTRETH  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[2]);
    HPMCNT3H  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[3]);
    HPMCNT4H  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[4]);
    HPMCNT5H  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[5]);
    HPMCNT6H  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[6]);
    HPMCNT7H  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[7]);
    HPMCNT8H  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[8]);
    HPMCNT9H  : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[9]);
    HPMCNT10H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[10]);
    HPMCNT11H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[11]);
    HPMCNT12H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[12]);
    HPMCNT13H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[13]);
    HPMCNT14H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[14]);
    HPMCNT15H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[15]);
    HPMCNT16H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[16]);
    HPMCNT17H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[17]);
    HPMCNT18H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[18]);
    HPMCNT19H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[19]);
    HPMCNT20H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[20]);
    HPMCNT21H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[21]);
    HPMCNT22H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[22]);
    HPMCNT23H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[23]);
    HPMCNT24H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[24]);
    HPMCNT25H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[25]);
    HPMCNT26H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[26]);
    HPMCNT27H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[27]);
    HPMCNT28H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[28]);
    HPMCNT29H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[29]);
    HPMCNT30H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[30]);
    HPMCNT31H : regs_imm_inv = !(trap_csr_pm[1:0] == 2'b11 || mcnten_value[31]);

    PMPCFG0   : regs_imm_inv = 1'b0;
    PMPADDR0  : regs_imm_inv = 1'b0;
    PMPADDR1  : regs_imm_inv = 1'b0;
    PMPADDR2  : regs_imm_inv = 1'b0;
    PMPADDR3  : regs_imm_inv = 1'b0;
    PMPCFG1   : regs_imm_inv = 1'b0;
    PMPADDR4  : regs_imm_inv = 1'b0;
    PMPADDR5  : regs_imm_inv = 1'b0;
    PMPADDR6  : regs_imm_inv = 1'b0;
    PMPADDR7  : regs_imm_inv = 1'b0;
    PMPCFG2   : regs_imm_inv = 1'b0;
    PMPADDR8  : regs_imm_inv = 1'b0;
    PMPADDR9  : regs_imm_inv = 1'b0;
    PMPADDR10 : regs_imm_inv = 1'b0;
    PMPADDR11 : regs_imm_inv = 1'b0;
    PMPCFG3   : regs_imm_inv = 1'b0;
    PMPADDR12 : regs_imm_inv = 1'b0;
    PMPADDR13 : regs_imm_inv = 1'b0;
    PMPADDR14 : regs_imm_inv = 1'b0;
    PMPADDR15 : regs_imm_inv = 1'b0;

    FFLAGS    : regs_imm_inv = regs_fs_off;
    FRM       : regs_imm_inv = regs_fs_off;
    FCSR      : regs_imm_inv = regs_fs_off;



//----------------------------------------------------------
//                       Debug CSRs
//----------------------------------------------------------
    DCSR,
    DPC,
    DSCRATCH0,
    DSCRATCH1 : regs_imm_inv = !rtu_yy_xx_dbgon;

//----------------------------------------------------------
//                      Trigger CSRs
//----------------------------------------------------------
    TSELECT,
    TDATA1,
    TDATA2,
    TDATA3,
    TINFO,
    TCONTROL,
    MCONTEXT:   regs_imm_inv = 1'b0;

//----------------------------------------------------------
//                  M-Mode Extension CSRs
//----------------------------------------------------------
// 0x7C0-0x7FF
    12'b0111_11??_????,
// 0xBC0-0xBFF
    12'b1011_11??_????,
// 0xFC0-0xFFF
    12'b1111_11??_????: regs_imm_inv = regs_ext_imm_inv;

//----------------------------------------------------------
//                  S-Mode Extension CSRs
//----------------------------------------------------------
// 0x5C0-0x5FF
    12'b0101_11??_????,
// 0x9C0-0x9FF
    12'b1001_11??_????,
// 0xDC0-0xDFF
    12'b1101_11??_????: regs_imm_inv = regs_ext_imm_inv;

//----------------------------------------------------------
//                  U-Mode Extension CSRs
//----------------------------------------------------------
// 0x800-0x8FF
    12'b1000_????_????,
// 0xCC0-0xCFF
    12'b1100_11??_????: regs_imm_inv = regs_ext_imm_inv;


    default   : regs_imm_inv = 1'b1;
  endcase
// &CombEnd; @703
end

//==========================================================
//                  Extension CSRs Invalid
//==========================================================
// &CombBeg; @708
always @( regs_fs_off
       or regs_csr_imm[11:0])
begin
  case(regs_csr_imm[11:0])
//----------------------------------------------------------
//               M-Mode T-Head Extension CSRs
//----------------------------------------------------------
// Processor Control and Status Extension 
    MXSTATUS  : regs_ext_imm_inv = 1'b0;
    MHCR      : regs_ext_imm_inv = 1'b0;
    MHINT     : regs_ext_imm_inv = 1'b0;
    MHINT2    : regs_ext_imm_inv = 1'b0;

    MRADDR    : regs_ext_imm_inv = 1'b0;
    MEXSTATUS : regs_ext_imm_inv = 1'b0;
    MNMICAUSE : regs_ext_imm_inv = 1'b0;
    MNMIPC    : regs_ext_imm_inv = 1'b0;
    FXCR      : regs_ext_imm_inv = regs_fs_off;
    MHALTCAUSE,
    MDBGINFO,
    MPCFIFO   : regs_ext_imm_inv = 1'b0;
     default  : regs_ext_imm_inv = 1'b0;
  endcase
// &CombEnd; @733
end




// b. CSR Write decode
assign regs_csr_wen      = iui_regs_csr_wen;

assign mcpuid_local_en   = regs_csr_imm[11:0] == MCPUID;

assign mstatus_local_en  = regs_csr_wen && regs_csr_imm[11:0] == MSTATUS;
assign mtvec_local_en    = regs_csr_wen && regs_csr_imm[11:0] == MTVEC;
assign mcnten_local_en   = regs_csr_wen && regs_csr_imm[11:0] == MCNTEN;
assign mtvt_local_en     = regs_csr_wen && regs_csr_imm[11:0] == MTVT;

assign mscratch_local_en = regs_csr_wen && regs_csr_imm[11:0] == MSCRATCH;
assign mepc_local_en     = regs_csr_wen && regs_csr_imm[11:0] == MEPC;
assign mcause_local_en   = regs_csr_wen && regs_csr_imm[11:0] == MCAUSE;
assign mtval_local_en    = regs_csr_wen && regs_csr_imm[11:0] == MTVAL;
assign mnxti_local_en    = regs_csr_wen && regs_csr_imm[11:0] == MNXTI
                        && iui_regs_csr_mnxti_vld;
assign regs_iui_mnxti_sel = regs_csr_wen && regs_csr_imm[11:0] == MNXTI;
assign mscratchcsw_local_en  = regs_csr_wen && regs_csr_imm[11:0] == MSCRATCHCSW;
assign mscratchcswl_local_en = regs_csr_wen && regs_csr_imm[11:0] == MSCRATCHCSWL;

assign fflags_local_en  = regs_csr_wen && regs_csr_imm[11:0] == FFLAGS;
assign frm_local_en     = regs_csr_wen && regs_csr_imm[11:0] == FRM;
assign fcsr_local_en    = regs_csr_wen && regs_csr_imm[11:0] == FCSR;
assign fxcr_local_en    = regs_csr_wen && regs_csr_imm[11:0] == FXCR;


assign mxstatus_local_en = regs_csr_wen && regs_csr_imm[11:0] == MXSTATUS;
assign mhcr_local_en     = regs_csr_wen && regs_csr_imm[11:0] == MHCR;
assign mhint_local_en    = regs_csr_wen && regs_csr_imm[11:0] == MHINT;
assign mhint2_local_en    = regs_csr_wen && regs_csr_imm[11:0] == MHINT2;

assign mexstatus_local_en = regs_csr_wen && regs_csr_imm[11:0] == MEXSTATUS;
assign mnmicause_local_en = regs_csr_wen && regs_csr_imm[11:0] == MNMICAUSE;
assign mnmipc_local_en    = regs_csr_wen && regs_csr_imm[11:0] == MNMIPC;

//------------------------------------------------
// 4. CSR Read Port
//------------------------------------------------

// &CombBeg; @790
always @( mnmicause_value[31:0]
       or mtval_value[31:0]
       or dtu_cp0_rdata[31:0]
       or mstatus_value[31:0]
       or mhcr_value[31:0]
       or mideleg_value[31:0]
       or mraddr_value[31:0]
       or mscratch_value[31:0]
       or mip_value[31:0]
       or mcause_value[31:0]
       or mcnten_value[31:0]
       or mscratchcswl_value[31:0]
       or pmp_cp0_data[31:0]
       or marchid_value[31:0]
       or mepc_value[31:0]
       or mexstatus_value[31:0]
       or medeleg_value[31:0]
       or mscratchcsw_value[31:0]
       or mtvec_value[31:0]
       or mnmipc_value[31:0]
       or hpcp_cp0_data[31:0]
       or misa_value[31:0]
       or mhartid_value[31:0]
       or mie_value[31:0]
       or regs_csr_imm[11:0]
       or mhint_value[31:0]
       or mcpuid_value[31:0]
       or mhint2_value[31:0]
       or mimpid_value[31:0]
       or fxcr_value[31:0]
       or fflags_value[31:0]
       or mintstatus_value[31:0]
       or mtvt_value[31:0]
       or mvendorid_value[31:0]
       or mnxti_value[31:0]
       or frm_value[31:0]
       or mxstatus_value[31:0]
       or mclicbase_value[31:0]
       or fcsr_value[31:0])
begin
  case(regs_csr_imm[11:0])
    MVENDORID : regs_csr_rdata[31:0] = mvendorid_value[31:0];
    MARCHID   : regs_csr_rdata[31:0] = marchid_value[31:0];
    MIMPID    : regs_csr_rdata[31:0] = mimpid_value[31:0];
    MHARTID   : regs_csr_rdata[31:0] = mhartid_value[31:0];

    MCPUID    : regs_csr_rdata[31:0] = mcpuid_value[31:0];

    MSTATUS   : regs_csr_rdata[31:0] = mstatus_value[31:0];
    MISA      : regs_csr_rdata[31:0] = misa_value[31:0];
    MEDELEG   : regs_csr_rdata[31:0] = medeleg_value[31:0];
    MIDELEG   : regs_csr_rdata[31:0] = mideleg_value[31:0];
    MIE       : regs_csr_rdata[31:0] = mie_value[31:0];
    MTVEC     : regs_csr_rdata[31:0] = mtvec_value[31:0];
    MCNTEN    : regs_csr_rdata[31:0] = mcnten_value[31:0];
    MTVT      : regs_csr_rdata[31:0] = mtvt_value[31:0];

    MSCRATCH  : regs_csr_rdata[31:0] = mscratch_value[31:0];
    MEPC      : regs_csr_rdata[31:0] = mepc_value[31:0];
    MCAUSE    : regs_csr_rdata[31:0] = mcause_value[31:0];
    MTVAL     : regs_csr_rdata[31:0] = mtval_value[31:0];
    MIP       : regs_csr_rdata[31:0] = mip_value[31:0];
    MNXTI        : regs_csr_rdata[31:0] = mnxti_value[31:0];
    MINTSTATUS   : regs_csr_rdata[31:0] = mintstatus_value[31:0];
    MSCRATCHCSW  : regs_csr_rdata[31:0] = mscratchcsw_value[31:0];
    MSCRATCHCSWL : regs_csr_rdata[31:0] = mscratchcswl_value[31:0];
    MCLICBASE    : regs_csr_rdata[31:0] = mclicbase_value[31:0];

    // HPCP
    MCNTINHBT,
    MHPMEVT3,
    MHPMEVT4,
    MHPMEVT5,
    MHPMEVT6,
    MHPMEVT7,
    MHPMEVT8,
    MHPMEVT9,
    MHPMEVT10,
    MHPMEVT11,
    MHPMEVT12,
    MHPMEVT13,
    MHPMEVT14,
    MHPMEVT15,
    MHPMEVT16,
    MHPMEVT17,
    MHPMEVT18,
    MHPMEVT19,
    MHPMEVT20,
    MHPMEVT21,
    MHPMEVT22,
    MHPMEVT23,
    MHPMEVT24,
    MHPMEVT25,
    MHPMEVT26,
    MHPMEVT27,
    MHPMEVT28,
    MHPMEVT29,
    MHPMEVT30,
    MHPMEVT31,
    MCYCLE,
    MINSTRET,
    MHPMCNT3,
    MHPMCNT4,
    MHPMCNT5,
    MHPMCNT6,
    MHPMCNT7,
    MHPMCNT8,
    MHPMCNT9,
    MHPMCNT10,
    MHPMCNT11,
    MHPMCNT12,
    MHPMCNT13,
    MHPMCNT14,
    MHPMCNT15,
    MHPMCNT16,
    MHPMCNT17,
    MHPMCNT18,
    MHPMCNT19,
    MHPMCNT20,
    MHPMCNT21,
    MHPMCNT22,
    MHPMCNT23,
    MHPMCNT24,
    MHPMCNT25,
    MHPMCNT26,
    MHPMCNT27,
    MHPMCNT28,
    MHPMCNT29,
    MHPMCNT30,
    MHPMCNT31,
    MCYCLEH,
    MINSTRETH,
    MHPMCNT3H,
    MHPMCNT4H,
    MHPMCNT5H,
    MHPMCNT6H,
    MHPMCNT7H,
    MHPMCNT8H,
    MHPMCNT9H,
    MHPMCNT10H,
    MHPMCNT11H,
    MHPMCNT12H,
    MHPMCNT13H,
    MHPMCNT14H,
    MHPMCNT15H,
    MHPMCNT16H,
    MHPMCNT17H,
    MHPMCNT18H,
    MHPMCNT19H,
    MHPMCNT20H,
    MHPMCNT21H,
    MHPMCNT22H,
    MHPMCNT23H,
    MHPMCNT24H,
    MHPMCNT25H,
    MHPMCNT26H,
    MHPMCNT27H,
    MHPMCNT28H,
    MHPMCNT29H,
    MHPMCNT30H,
    MHPMCNT31H,
    CYCLE,
    REG_TIME,
    INSTRET,
    HPMCNT3,
    HPMCNT4,
    HPMCNT5,
    HPMCNT6,
    HPMCNT7,
    HPMCNT8,
    HPMCNT9,
    HPMCNT10,
    HPMCNT11,
    HPMCNT12,
    HPMCNT13,
    HPMCNT14,
    HPMCNT15,
    HPMCNT16,
    HPMCNT17,
    HPMCNT18,
    HPMCNT19,
    HPMCNT20,
    HPMCNT21,
    HPMCNT22,
    HPMCNT23,
    HPMCNT24,
    HPMCNT25,
    HPMCNT26,
    HPMCNT27,
    HPMCNT28,
    HPMCNT29,
    HPMCNT30,
    HPMCNT31,
    CYCLEH,
    REG_TIMEH,
    INSTRETH,
    HPMCNT3H,
    HPMCNT4H,
    HPMCNT5H,
    HPMCNT6H,
    HPMCNT7H,
    HPMCNT8H,
    HPMCNT9H,
    HPMCNT10H,
    HPMCNT11H,
    HPMCNT12H,
    HPMCNT13H,
    HPMCNT14H,
    HPMCNT15H,
    HPMCNT16H,
    HPMCNT17H,
    HPMCNT18H,
    HPMCNT19H,
    HPMCNT20H,
    HPMCNT21H,
    HPMCNT22H,
    HPMCNT23H,
    HPMCNT24H,
    HPMCNT25H,
    HPMCNT26H,
    HPMCNT27H,
    HPMCNT28H,
    HPMCNT29H,
    HPMCNT30H,
    HPMCNT31H:  regs_csr_rdata[31:0] = hpcp_cp0_data[31:0];

    MXSTATUS  : regs_csr_rdata[31:0] = mxstatus_value[31:0];
    MHCR      : regs_csr_rdata[31:0] = mhcr_value[31:0];
    MHINT     : regs_csr_rdata[31:0] = mhint_value[31:0];
    MHINT2    : regs_csr_rdata[31:0] = mhint2_value[31:0];

    MRADDR    : regs_csr_rdata[31:0] = mraddr_value[31:0];
    MEXSTATUS : regs_csr_rdata[31:0] = mexstatus_value[31:0];
    MNMICAUSE : regs_csr_rdata[31:0] = mnmicause_value[31:0];
    MNMIPC    : regs_csr_rdata[31:0] = mnmipc_value[31:0];

    PMPCFG0   : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPCFG1   : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPCFG2   : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPCFG3   : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR0  : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR1  : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR2  : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR3  : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR4  : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR5  : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR6  : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR7  : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR8  : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR9  : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR10 : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR11 : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR12 : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR13 : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR14 : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];
    PMPADDR15 : regs_csr_rdata[31:0] = pmp_cp0_data[31:0];

    FFLAGS    : regs_csr_rdata[31:0] = fflags_value[31:0];
    FRM       : regs_csr_rdata[31:0] = frm_value[31:0];
    FCSR      : regs_csr_rdata[31:0] = fcsr_value[31:0];
    FXCR      : regs_csr_rdata[31:0] = fxcr_value[31:0];

//----------------------------------------------------------
//                       Debug CSRs
//----------------------------------------------------------
    DCSR,
    DPC,
    DSCRATCH0,
    DSCRATCH1 : regs_csr_rdata[31:0] = dtu_cp0_rdata[31:0];
//----------------------------------------------------------
//                      Trigger CSRs
//----------------------------------------------------------
    TSELECT,
    TDATA1,
    TDATA2,
    TDATA3,
    TINFO,
    TCONTROL,
    MCONTEXT :  regs_csr_rdata[31:0] = dtu_cp0_rdata[31:0];
//------------Debug Extension-----------
    MHALTCAUSE,
    MDBGINFO,
    MPCFIFO   : regs_csr_rdata[31:0] = dtu_cp0_rdata[31:0];
    //MTVT      : regs_csr_rdata[31:0] = mtvt_value[31:0];
    //MNXTI     : regs_csr_rdata[31:0] = mnxti_value[31:0];
    //MINTSTATUS: regs_csr_rdata[31:0] = mintstatus_value[31:0];
    default   : regs_csr_rdata[31:0] = 32'b0;
  endcase
// &CombEnd; @1050
end

//==========================================================
// Rename for Output
//==========================================================

// Output to IUI
assign regs_iui_expt_vld     = regs_imm_inv;
assign regs_iui_rdata[31:0]  = regs_csr_rdata[31:0];
assign regs_iui_mepc[31:0]   = mepc_value[31:0];
assign regs_iui_pm[1:0]      = trap_csr_pm[1:0];
assign regs_iui_mstatus[31:0] = mstatus_value[31:0];

// Output to IFU
assign cp0_ifu_mtvec[31:0]   = {mtvec_rslt[29:0], 2'b0};

// Output to PMP
// Todo
assign cp0_pmp_csr_sel[0]  = regs_csr_imm[11:0] == PMPCFG0;
assign cp0_pmp_csr_sel[1]  = regs_csr_imm[11:0] == PMPCFG1;
assign cp0_pmp_csr_sel[2]  = regs_csr_imm[11:0] == PMPCFG2;
assign cp0_pmp_csr_sel[3]  = regs_csr_imm[11:0] == PMPCFG3;
assign cp0_pmp_csr_sel[4]  = regs_csr_imm[11:0] == PMPADDR0;
assign cp0_pmp_csr_sel[5]  = regs_csr_imm[11:0] == PMPADDR1;
assign cp0_pmp_csr_sel[6]  = regs_csr_imm[11:0] == PMPADDR2;
assign cp0_pmp_csr_sel[7]  = regs_csr_imm[11:0] == PMPADDR3;
assign cp0_pmp_csr_sel[8]  = regs_csr_imm[11:0] == PMPADDR4;
assign cp0_pmp_csr_sel[9]  = regs_csr_imm[11:0] == PMPADDR5;
assign cp0_pmp_csr_sel[10] = regs_csr_imm[11:0] == PMPADDR6;
assign cp0_pmp_csr_sel[11] = regs_csr_imm[11:0] == PMPADDR7;
assign cp0_pmp_csr_sel[12] = regs_csr_imm[11:0] == PMPADDR8;
assign cp0_pmp_csr_sel[13] = regs_csr_imm[11:0] == PMPADDR9;
assign cp0_pmp_csr_sel[14] = regs_csr_imm[11:0] == PMPADDR10;
assign cp0_pmp_csr_sel[15] = regs_csr_imm[11:0] == PMPADDR11;
assign cp0_pmp_csr_sel[16] = regs_csr_imm[11:0] == PMPADDR12;
assign cp0_pmp_csr_sel[17] = regs_csr_imm[11:0] == PMPADDR13;
assign cp0_pmp_csr_sel[18] = regs_csr_imm[11:0] == PMPADDR14;
assign cp0_pmp_csr_sel[19] = regs_csr_imm[11:0] == PMPADDR15;
assign cp0_pmp_csr_wen = regs_csr_wen;
assign cp0_pmp_updt_data[31:0] = iui_regs_wdata[31:0];

//==========================================================
//                      Output to HPCP
//==========================================================
assign cp0_hpcp_index[11:0] = regs_csr_imm[11:0];
assign cp0_hpcp_wdata[31:0] = iui_regs_wdata[31:0];
assign cp0_hpcp_wreg        = regs_csr_wen;

// Output to HAD
// //&Force("input", "had_cp0_mcause_data"); @1101
// //&Force("bus", "had_cp0_mcause_data", 31, 0); @1102
//assign cp0_had_mcause_data[31:0] = mcause_value[31:0];
//assign cp0_had_cpuid_idx0[31:0]  = info_csr_cpuid0_value[31:0];

// Todo
assign cp0_yy_priv_mode[1:0] = trap_csr_pm[1:0];
assign cp0_yy_mach_mode      = regs_mach_mode;
assign cp0_pad_mintstatus[31:0] = mintstatus_value[31:0];
assign cp0_pad_mstatus[31:0]    = mstatus_value[31:0];
assign cp0_pad_mcause[31:0]     = mcause_value[31:0];

// &Force("input","dtu_cp0_rdata"); @1117
// &Force("bus","dtu_cp0_rdata",31,0); @1118
// &ModuleEnd; @1120
endmodule


