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
module pa_core_top(
  biu_pad_haddr,
  biu_pad_hburst,
  biu_pad_hlock,
  biu_pad_hprot,
  biu_pad_hsize,
  biu_pad_htrans,
  biu_pad_hwdata,
  biu_pad_hwrite,
  bmu_tcipif_dbus_acc_deny,
  bmu_tcipif_dbus_addr,
  bmu_tcipif_dbus_req,
  bmu_tcipif_dbus_req_dp,
  bmu_tcipif_dbus_size,
  bmu_tcipif_dbus_supv_mode,
  bmu_tcipif_dbus_wdata,
  bmu_tcipif_dbus_write,
  bmu_tcipif_ibus_acc_deny,
  bmu_tcipif_ibus_addr,
  bmu_tcipif_ibus_req,
  bmu_tcipif_ibus_req_dp,
  bmu_tcipif_ibus_size,
  bmu_tcipif_ibus_supv_mode,
  bmu_tcipif_ibus_wdata,
  bmu_tcipif_ibus_write,
  clic_cpu_int_hv,
  clic_cpu_int_id,
  clic_cpu_int_il,
  clic_cpu_int_priv,
  clk_en_f,
  cp0_biu_icg_en,
  cp0_pad_mcause,
  cp0_pad_mintstatus,
  cp0_pad_mstatus,
  cp0_yy_priv_mode,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpu_pad_dfs_ack,
  cpu_pad_halted,
  cpu_pad_lockup,
  cpu_pad_soft_rst,
  cpurst_b,
  dahbl_pad_haddr,
  dahbl_pad_hburst,
  dahbl_pad_hlock,
  dahbl_pad_hprot,
  dahbl_pad_hsize,
  dahbl_pad_htrans,
  dahbl_pad_hwdata,
  dahbl_pad_hwrite,
  dtu_tdt_dm_halted,
  dtu_tdt_dm_havereset,
  dtu_tdt_dm_itr_done,
  dtu_tdt_dm_retire_debug_expt_vld,
  dtu_tdt_dm_rx_data,
  dtu_tdt_dm_wr_ready,
  forever_cpuclk,
  iahbl_pad_haddr,
  iahbl_pad_hburst,
  iahbl_pad_hlock,
  iahbl_pad_hprot,
  iahbl_pad_hsize,
  iahbl_pad_htrans,
  iahbl_pad_hwdata,
  iahbl_pad_hwrite,
  ifu_clic_warm_up,
  pad_biu_hrdata,
  pad_biu_hready,
  pad_biu_hresp,
  pad_bmu_dahbl_base,
  pad_bmu_dahbl_mask,
  pad_bmu_iahbl_base,
  pad_bmu_iahbl_mask,
  pad_cpu_dfs_req,
  pad_cpu_ext_int_b,
  pad_cpu_nmi,
  pad_cpu_rst_addr,
  pad_cpu_sys_cnt,
  pad_cpu_sysmap_addr0,
  pad_cpu_sysmap_addr0_attr,
  pad_cpu_sysmap_addr1,
  pad_cpu_sysmap_addr1_attr,
  pad_cpu_sysmap_addr2,
  pad_cpu_sysmap_addr2_attr,
  pad_cpu_sysmap_addr3,
  pad_cpu_sysmap_addr3_attr,
  pad_cpu_sysmap_addr4,
  pad_cpu_sysmap_addr4_attr,
  pad_cpu_sysmap_addr5,
  pad_cpu_sysmap_addr5_attr,
  pad_cpu_sysmap_addr6,
  pad_cpu_sysmap_addr6_attr,
  pad_cpu_sysmap_addr7,
  pad_cpu_sysmap_addr7_attr,
  pad_cpu_tcip_base,
  pad_cpu_wakeup_event,
  pad_dahbl_hrdata,
  pad_dahbl_hready,
  pad_dahbl_hresp,
  pad_iahbl_hrdata,
  pad_iahbl_hready,
  pad_iahbl_hresp,
  pad_yy_icg_scan_en,
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
  rtu_yy_xx_dbgon,
  sys_apb_clk,
  sys_apb_rst_b,
  sysio_clint_me_int,
  sysio_clint_mtime,
  sysio_pad_lpmd_b,
  sysmap_tcipif_cmplt,
  sysmap_tcipif_rdata,
  tcip_cp0_clic_base,
  tcipif_bmu_dbus_acc_err,
  tcipif_bmu_dbus_data,
  tcipif_bmu_dbus_grnt,
  tcipif_bmu_dbus_trans_cmplt,
  tcipif_bmu_ibus_acc_err,
  tcipif_bmu_ibus_data,
  tcipif_bmu_ibus_grnt,
  tcipif_bmu_ibus_trans_cmplt,
  tcipif_sysmap_addr,
  tcipif_sysmap_sel,
  tcipif_sysmap_wdata,
  tcipif_sysmap_write,
  tdt_dm_dtu_ack_havereset,
  tdt_dm_dtu_async_halt_req,
  tdt_dm_dtu_halt_on_reset,
  tdt_dm_dtu_halt_req,
  tdt_dm_dtu_itr,
  tdt_dm_dtu_itr_vld,
  tdt_dm_dtu_resume_req,
  tdt_dm_dtu_wdata,
  tdt_dm_dtu_wr_flg,
  tdt_dm_dtu_wr_vld
);

// &Ports; @26
input           clic_cpu_int_hv;                 
input   [11:0]  clic_cpu_int_id;                 
input   [7 :0]  clic_cpu_int_il;                 
input   [1 :0]  clic_cpu_int_priv;               
input           clk_en_f;                        
input           cpurst_b;                        
input           forever_cpuclk;                  
input   [31:0]  pad_biu_hrdata;                  
input           pad_biu_hready;                  
input           pad_biu_hresp;                   
input   [11:0]  pad_bmu_dahbl_base;              
input   [11:0]  pad_bmu_dahbl_mask;              
input   [11:0]  pad_bmu_iahbl_base;              
input   [11:0]  pad_bmu_iahbl_mask;              
input           pad_cpu_dfs_req;                 
input           pad_cpu_ext_int_b;               
input           pad_cpu_nmi;                     
input   [31:0]  pad_cpu_rst_addr;                
input   [63:0]  pad_cpu_sys_cnt;                 
input   [19:0]  pad_cpu_sysmap_addr0;            
input   [2 :0]  pad_cpu_sysmap_addr0_attr;       
input   [19:0]  pad_cpu_sysmap_addr1;            
input   [2 :0]  pad_cpu_sysmap_addr1_attr;       
input   [19:0]  pad_cpu_sysmap_addr2;            
input   [2 :0]  pad_cpu_sysmap_addr2_attr;       
input   [19:0]  pad_cpu_sysmap_addr3;            
input   [2 :0]  pad_cpu_sysmap_addr3_attr;       
input   [19:0]  pad_cpu_sysmap_addr4;            
input   [2 :0]  pad_cpu_sysmap_addr4_attr;       
input   [19:0]  pad_cpu_sysmap_addr5;            
input   [2 :0]  pad_cpu_sysmap_addr5_attr;       
input   [19:0]  pad_cpu_sysmap_addr6;            
input   [2 :0]  pad_cpu_sysmap_addr6_attr;       
input   [19:0]  pad_cpu_sysmap_addr7;            
input   [2 :0]  pad_cpu_sysmap_addr7_attr;       
input   [31:0]  pad_cpu_tcip_base;               
input           pad_cpu_wakeup_event;            
input   [31:0]  pad_dahbl_hrdata;                
input           pad_dahbl_hready;                
input           pad_dahbl_hresp;                 
input   [31:0]  pad_iahbl_hrdata;                
input           pad_iahbl_hready;                
input           pad_iahbl_hresp;                 
input           pad_yy_icg_scan_en;              
input           sys_apb_clk;                     
input           sys_apb_rst_b;                   
input   [31:0]  tcip_cp0_clic_base;              
input           tcipif_bmu_dbus_acc_err;         
input   [31:0]  tcipif_bmu_dbus_data;            
input           tcipif_bmu_dbus_grnt;            
input           tcipif_bmu_dbus_trans_cmplt;     
input           tcipif_bmu_ibus_acc_err;         
input   [31:0]  tcipif_bmu_ibus_data;            
input           tcipif_bmu_ibus_grnt;            
input           tcipif_bmu_ibus_trans_cmplt;     
input   [15:0]  tcipif_sysmap_addr;              
input           tcipif_sysmap_sel;               
input   [31:0]  tcipif_sysmap_wdata;             
input           tcipif_sysmap_write;             
input           tdt_dm_dtu_ack_havereset;        
input           tdt_dm_dtu_async_halt_req;       
input           tdt_dm_dtu_halt_on_reset;        
input           tdt_dm_dtu_halt_req;             
input   [31:0]  tdt_dm_dtu_itr;                  
input           tdt_dm_dtu_itr_vld;              
input           tdt_dm_dtu_resume_req;           
input   [31:0]  tdt_dm_dtu_wdata;                
input   [1 :0]  tdt_dm_dtu_wr_flg;               
input           tdt_dm_dtu_wr_vld;               
output  [31:0]  biu_pad_haddr;                   
output  [2 :0]  biu_pad_hburst;                  
output          biu_pad_hlock;                   
output  [3 :0]  biu_pad_hprot;                   
output  [2 :0]  biu_pad_hsize;                   
output  [1 :0]  biu_pad_htrans;                  
output  [31:0]  biu_pad_hwdata;                  
output          biu_pad_hwrite;                  
output          bmu_tcipif_dbus_acc_deny;        
output  [31:0]  bmu_tcipif_dbus_addr;            
output          bmu_tcipif_dbus_req;             
output          bmu_tcipif_dbus_req_dp;          
output  [1 :0]  bmu_tcipif_dbus_size;            
output          bmu_tcipif_dbus_supv_mode;       
output  [31:0]  bmu_tcipif_dbus_wdata;           
output          bmu_tcipif_dbus_write;           
output          bmu_tcipif_ibus_acc_deny;        
output  [31:0]  bmu_tcipif_ibus_addr;            
output          bmu_tcipif_ibus_req;             
output          bmu_tcipif_ibus_req_dp;          
output  [1 :0]  bmu_tcipif_ibus_size;            
output          bmu_tcipif_ibus_supv_mode;       
output  [31:0]  bmu_tcipif_ibus_wdata;           
output          bmu_tcipif_ibus_write;           
output          cp0_biu_icg_en;                  
output  [31:0]  cp0_pad_mcause;                  
output  [31:0]  cp0_pad_mintstatus;              
output  [31:0]  cp0_pad_mstatus;                 
output  [1 :0]  cp0_yy_priv_mode;                
output  [11:0]  cpu_clic_curid;                  
output          cpu_clic_int_exit;               
output          cpu_pad_dfs_ack;                 
output          cpu_pad_halted;                  
output          cpu_pad_lockup;                  
output  [1 :0]  cpu_pad_soft_rst;                
output  [31:0]  dahbl_pad_haddr;                 
output  [2 :0]  dahbl_pad_hburst;                
output          dahbl_pad_hlock;                 
output  [3 :0]  dahbl_pad_hprot;                 
output  [2 :0]  dahbl_pad_hsize;                 
output  [1 :0]  dahbl_pad_htrans;                
output  [31:0]  dahbl_pad_hwdata;                
output          dahbl_pad_hwrite;                
output          dtu_tdt_dm_halted;               
output          dtu_tdt_dm_havereset;            
output          dtu_tdt_dm_itr_done;             
output          dtu_tdt_dm_retire_debug_expt_vld; 
output  [31:0]  dtu_tdt_dm_rx_data;              
output          dtu_tdt_dm_wr_ready;             
output  [31:0]  iahbl_pad_haddr;                 
output  [2 :0]  iahbl_pad_hburst;                
output          iahbl_pad_hlock;                 
output  [3 :0]  iahbl_pad_hprot;                 
output  [2 :0]  iahbl_pad_hsize;                 
output  [1 :0]  iahbl_pad_htrans;                
output  [31:0]  iahbl_pad_hwdata;                
output          iahbl_pad_hwrite;                
output          ifu_clic_warm_up;                
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
output          rtu_yy_xx_dbgon;                 
output          sysio_clint_me_int;              
output  [63:0]  sysio_clint_mtime;               
output  [1 :0]  sysio_pad_lpmd_b;                
output          sysmap_tcipif_cmplt;             
output  [31:0]  sysmap_tcipif_rdata;             

// &Regs; @27

// &Wires; @28
wire    [31:0]  biu_pad_haddr;                   
wire    [2 :0]  biu_pad_hburst;                  
wire            biu_pad_hlock;                   
wire    [3 :0]  biu_pad_hprot;                   
wire    [2 :0]  biu_pad_hsize;                   
wire    [1 :0]  biu_pad_htrans;                  
wire    [31:0]  biu_pad_hwdata;                  
wire            biu_pad_hwrite;                  
wire            biu_sysio_idle;                  
wire            bmu_dahbl_dbus_acc_deny;         
wire    [31:0]  bmu_dahbl_dbus_addr;             
wire    [2 :0]  bmu_dahbl_dbus_burst;            
wire            bmu_dahbl_dbus_lock;             
wire            bmu_dahbl_dbus_lrsc;             
wire    [3 :0]  bmu_dahbl_dbus_prot;             
wire            bmu_dahbl_dbus_req;              
wire            bmu_dahbl_dbus_req_dp;           
wire            bmu_dahbl_dbus_seq;              
wire    [1 :0]  bmu_dahbl_dbus_size;             
wire    [31:0]  bmu_dahbl_dbus_wdata;            
wire            bmu_dahbl_dbus_write;            
wire            bmu_dahbl_ibus_acc_deny;         
wire    [31:0]  bmu_dahbl_ibus_addr;             
wire    [2 :0]  bmu_dahbl_ibus_burst;            
wire    [3 :0]  bmu_dahbl_ibus_prot;             
wire            bmu_dahbl_ibus_req;              
wire            bmu_dahbl_ibus_req_dp;           
wire            bmu_dahbl_ibus_seq;              
wire    [1 :0]  bmu_dahbl_ibus_size;             
wire    [3 :0]  bmu_dtu_debug_info;              
wire            bmu_iahbl_dbus_acc_deny;         
wire    [31:0]  bmu_iahbl_dbus_addr;             
wire    [2 :0]  bmu_iahbl_dbus_burst;            
wire            bmu_iahbl_dbus_lock;             
wire            bmu_iahbl_dbus_lrsc;             
wire    [3 :0]  bmu_iahbl_dbus_prot;             
wire            bmu_iahbl_dbus_req;              
wire            bmu_iahbl_dbus_req_dp;           
wire            bmu_iahbl_dbus_seq;              
wire    [1 :0]  bmu_iahbl_dbus_size;             
wire    [31:0]  bmu_iahbl_dbus_wdata;            
wire            bmu_iahbl_dbus_write;            
wire            bmu_iahbl_ibus_acc_deny;         
wire    [31:0]  bmu_iahbl_ibus_addr;             
wire    [2 :0]  bmu_iahbl_ibus_burst;            
wire    [3 :0]  bmu_iahbl_ibus_prot;             
wire            bmu_iahbl_ibus_req;              
wire            bmu_iahbl_ibus_req_dp;           
wire            bmu_iahbl_ibus_seq;              
wire    [1 :0]  bmu_iahbl_ibus_size;             
wire            bmu_ifu_acc_err;                 
wire            bmu_ifu_grant;                   
wire    [31:0]  bmu_ifu_rdata;                   
wire            bmu_ifu_trans_cmplt;             
wire            bmu_lsu_acc_err;                 
wire            bmu_lsu_grant;                   
wire    [31:0]  bmu_lsu_rdata;                   
wire            bmu_lsu_trans_cmplt;             
wire            bmu_sahbl_dbus_acc_deny;         
wire    [31:0]  bmu_sahbl_dbus_addr;             
wire    [2 :0]  bmu_sahbl_dbus_burst;            
wire            bmu_sahbl_dbus_lock;             
wire            bmu_sahbl_dbus_lrsc;             
wire    [3 :0]  bmu_sahbl_dbus_prot;             
wire            bmu_sahbl_dbus_req;              
wire            bmu_sahbl_dbus_req_dp;           
wire            bmu_sahbl_dbus_seq;              
wire    [1 :0]  bmu_sahbl_dbus_size;             
wire    [31:0]  bmu_sahbl_dbus_wdata;            
wire            bmu_sahbl_dbus_write;            
wire            bmu_sahbl_ibus_acc_deny;         
wire    [31:0]  bmu_sahbl_ibus_addr;             
wire    [2 :0]  bmu_sahbl_ibus_burst;            
wire    [3 :0]  bmu_sahbl_ibus_prot;             
wire            bmu_sahbl_ibus_req;              
wire            bmu_sahbl_ibus_req_dp;           
wire            bmu_sahbl_ibus_seq;              
wire    [1 :0]  bmu_sahbl_ibus_size;             
wire            bmu_tcipif_dbus_acc_deny;        
wire    [31:0]  bmu_tcipif_dbus_addr;            
wire            bmu_tcipif_dbus_req;             
wire            bmu_tcipif_dbus_req_dp;          
wire    [1 :0]  bmu_tcipif_dbus_size;            
wire            bmu_tcipif_dbus_supv_mode;       
wire    [31:0]  bmu_tcipif_dbus_wdata;           
wire            bmu_tcipif_dbus_write;           
wire            bmu_tcipif_ibus_acc_deny;        
wire    [31:0]  bmu_tcipif_ibus_addr;            
wire            bmu_tcipif_ibus_req;             
wire            bmu_tcipif_ibus_req_dp;          
wire    [1 :0]  bmu_tcipif_ibus_size;            
wire            bmu_tcipif_ibus_supv_mode;       
wire    [31:0]  bmu_tcipif_ibus_wdata;           
wire            bmu_tcipif_ibus_write;           
wire            clic_cpu_int_hv;                 
wire    [11:0]  clic_cpu_int_id;                 
wire    [7 :0]  clic_cpu_int_il;                 
wire    [1 :0]  clic_cpu_int_priv;               
wire            clk_en_f;                        
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
wire            cp0_hpcp_icg_en;                 
wire    [11:0]  cp0_hpcp_index;                  
wire            cp0_hpcp_pmdm;                   
wire            cp0_hpcp_pmdu;                   
wire    [31:0]  cp0_hpcp_wdata;                  
wire            cp0_hpcp_wreg;                   
wire    [31:0]  cp0_pad_mcause;                  
wire    [31:0]  cp0_pad_mintstatus;              
wire    [31:0]  cp0_pad_mstatus;                 
wire    [19:0]  cp0_pmp_csr_sel;                 
wire            cp0_pmp_csr_wen;                 
wire            cp0_pmp_icg_en;                  
wire    [1 :0]  cp0_pmp_mstatus_mpp;             
wire            cp0_pmp_mstatus_mprv;            
wire    [31:0]  cp0_pmp_updt_data;               
wire            cp0_sysio_ipend_b;               
wire    [1 :0]  cp0_sysio_lpmd_b;                
wire    [1 :0]  cp0_sysio_srst;                  
wire            cp0_yy_clk_en;                   
wire            cp0_yy_mach_mode;                
wire    [1 :0]  cp0_yy_priv_mode;                
wire    [11:0]  cpu_clic_curid;                  
wire            cpu_clic_int_exit;               
wire            cpu_pad_dfs_ack;                 
wire            cpu_pad_halted;                  
wire            cpu_pad_lockup;                  
wire    [1 :0]  cpu_pad_soft_rst;                
wire            cpurst_b;                        
wire            dahbl_bmu_dbus_acc_err;          
wire    [31:0]  dahbl_bmu_dbus_data;             
wire            dahbl_bmu_dbus_grnt;             
wire            dahbl_bmu_dbus_trans_cmplt;      
wire            dahbl_bmu_ibus_acc_err;          
wire    [31:0]  dahbl_bmu_ibus_data;             
wire            dahbl_bmu_ibus_grnt;             
wire            dahbl_bmu_ibus_trans_cmplt;      
wire    [10:0]  dahbl_dtu_debug_info;            
wire    [31:0]  dahbl_pad_haddr;                 
wire    [2 :0]  dahbl_pad_hburst;                
wire            dahbl_pad_hlock;                 
wire    [3 :0]  dahbl_pad_hprot;                 
wire    [2 :0]  dahbl_pad_hsize;                 
wire    [1 :0]  dahbl_pad_htrans;                
wire    [31:0]  dahbl_pad_hwdata;                
wire            dahbl_pad_hwrite;                
wire            dahbl_sysio_idle;                
wire            dtu_cp0_dcsr_mprven;             
wire    [1 :0]  dtu_cp0_dcsr_prv;                
wire    [31:0]  dtu_cp0_rdata;                   
wire            dtu_cp0_wake_up;                 
wire            dtu_hpcp_dcsr_stopcount;         
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
wire            dtu_tdt_dm_halted;               
wire            dtu_tdt_dm_havereset;            
wire            dtu_tdt_dm_itr_done;             
wire            dtu_tdt_dm_retire_debug_expt_vld; 
wire    [31:0]  dtu_tdt_dm_rx_data;              
wire            dtu_tdt_dm_wr_ready;             
wire            forever_cpuclk;                  
wire    [7 :0]  fpu_dtu_debug_info;              
wire    [31:0]  hpcp_cp0_data;                   
wire            iahbl_bmu_dbus_acc_err;          
wire    [31:0]  iahbl_bmu_dbus_data;             
wire            iahbl_bmu_dbus_grnt;             
wire            iahbl_bmu_dbus_trans_cmplt;      
wire            iahbl_bmu_ibus_acc_err;          
wire    [31:0]  iahbl_bmu_ibus_data;             
wire            iahbl_bmu_ibus_grnt;             
wire            iahbl_bmu_ibus_trans_cmplt;      
wire    [10:0]  iahbl_dtu_debug_info;            
wire    [31:0]  iahbl_pad_haddr;                 
wire    [2 :0]  iahbl_pad_hburst;                
wire            iahbl_pad_hlock;                 
wire    [3 :0]  iahbl_pad_hprot;                 
wire    [2 :0]  iahbl_pad_hsize;                 
wire    [1 :0]  iahbl_pad_htrans;                
wire    [31:0]  iahbl_pad_hwdata;                
wire            iahbl_pad_hwrite;                
wire            iahbl_sysio_idle;                
wire    [21:0]  idu_dtu_debug_info;              
wire    [95:0]  idu_dtu_fpr_info;                
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
wire            ifu_dtu_addr_vld0;               
wire            ifu_dtu_addr_vld1;               
wire            ifu_dtu_data_vld0;               
wire            ifu_dtu_data_vld1;               
wire    [26:0]  ifu_dtu_debug_info;              
wire    [31:0]  ifu_dtu_exe_addr0;               
wire    [31:0]  ifu_dtu_exe_addr1;               
wire    [31:0]  ifu_dtu_exe_data0;               
wire    [31:0]  ifu_dtu_exe_data1;               
wire            ifu_hpcp_icache_access;          
wire            ifu_hpcp_icache_miss;            
wire    [31:0]  ifu_pmp_addr;                    
wire            ifu_pmp_machine_mode;            
wire    [31:0]  ifu_sysmap_pa;                   
wire            ifu_sysmap_rst_sample;           
wire    [8 :0]  iu_dtu_debug_info;               
wire            iu_hpcp_inst_bht_mispred;        
wire            iu_hpcp_inst_condbr;             
wire            iu_hpcp_inst_condbr_gate;        
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
wire    [31:0]  lsu_pmp_addr;                    
wire            lsu_pmp_write;                   
wire    [31:0]  lsu_sysmap_pa;                   
wire            lsu_xx_flush;                    
wire            lsu_xx_warm_up;                  
wire    [31:0]  pad_biu_hrdata;                  
wire            pad_biu_hready;                  
wire            pad_biu_hresp;                   
wire    [11:0]  pad_bmu_dahbl_base;              
wire    [11:0]  pad_bmu_dahbl_mask;              
wire    [11:0]  pad_bmu_iahbl_base;              
wire    [11:0]  pad_bmu_iahbl_mask;              
wire            pad_cpu_dfs_req;                 
wire            pad_cpu_ext_int_b;               
wire            pad_cpu_nmi;                     
wire    [31:0]  pad_cpu_rst_addr;                
wire    [63:0]  pad_cpu_sys_cnt;                 
wire    [19:0]  pad_cpu_sysmap_addr0;            
wire    [2 :0]  pad_cpu_sysmap_addr0_attr;       
wire    [19:0]  pad_cpu_sysmap_addr1;            
wire    [2 :0]  pad_cpu_sysmap_addr1_attr;       
wire    [19:0]  pad_cpu_sysmap_addr2;            
wire    [2 :0]  pad_cpu_sysmap_addr2_attr;       
wire    [19:0]  pad_cpu_sysmap_addr3;            
wire    [2 :0]  pad_cpu_sysmap_addr3_attr;       
wire    [19:0]  pad_cpu_sysmap_addr4;            
wire    [2 :0]  pad_cpu_sysmap_addr4_attr;       
wire    [19:0]  pad_cpu_sysmap_addr5;            
wire    [2 :0]  pad_cpu_sysmap_addr5_attr;       
wire    [19:0]  pad_cpu_sysmap_addr6;            
wire    [2 :0]  pad_cpu_sysmap_addr6_attr;       
wire    [19:0]  pad_cpu_sysmap_addr7;            
wire    [2 :0]  pad_cpu_sysmap_addr7_attr;       
wire    [31:0]  pad_cpu_tcip_base;               
wire            pad_cpu_wakeup_event;            
wire    [31:0]  pad_dahbl_hrdata;                
wire            pad_dahbl_hready;                
wire            pad_dahbl_hresp;                 
wire    [31:0]  pad_iahbl_hrdata;                
wire            pad_iahbl_hready;                
wire            pad_iahbl_hresp;                 
wire            pad_yy_icg_scan_en;              
wire    [31:0]  pmp_cp0_data;                    
wire            pmp_ifu_acc_deny;                
wire            pmp_lsu_acc_deny;                
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
wire            rtu_hpcp_retire_inst_vld;        
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
wire            rtu_yy_xx_async_flush;           
wire            rtu_yy_xx_dbgon;                 
wire            rtu_yy_xx_expt_int;              
wire    [11:0]  rtu_yy_xx_expt_vec;              
wire            rtu_yy_xx_expt_vld;              
wire            sahbl_bmu_dbus_acc_err;          
wire    [31:0]  sahbl_bmu_dbus_data;             
wire            sahbl_bmu_dbus_grnt;             
wire            sahbl_bmu_dbus_trans_cmplt;      
wire            sahbl_bmu_ibus_acc_err;          
wire    [31:0]  sahbl_bmu_ibus_data;             
wire            sahbl_bmu_ibus_grnt;             
wire            sahbl_bmu_ibus_trans_cmplt;      
wire    [10:0]  sahbl_dtu_debug_info;            
wire            sys_apb_clk;                     
wire            sys_apb_rst_b;                   
wire            sysio_clint_me_int;              
wire    [63:0]  sysio_clint_mtime;               
wire            sysio_cp0_clk_en;                
wire    [2 :0]  sysio_cp0_clkratio;              
wire    [31:0]  sysio_cp0_rst_addr;              
wire    [63:0]  sysio_hpcp_time;                 
wire    [31:0]  sysio_ifu_rst_addr;              
wire            sysio_ifu_rst_addr_done;         
wire    [31:0]  sysio_iu_rst_addr;               
wire    [1 :0]  sysio_pad_lpmd_b;                
wire            sysio_rtu_nmi_int;               
wire            sysio_rtu_wk_event;              
wire            sysio_xx_halt_req;               
wire    [4 :0]  sysmap_ifu_flg;                  
wire    [4 :0]  sysmap_lsu_flg;                  
wire            sysmap_tcipif_cmplt;             
wire    [31:0]  sysmap_tcipif_rdata;             
wire    [31:0]  tcip_cp0_clic_base;              
wire            tcipif_bmu_dbus_acc_err;         
wire    [31:0]  tcipif_bmu_dbus_data;            
wire            tcipif_bmu_dbus_grnt;            
wire            tcipif_bmu_dbus_trans_cmplt;     
wire            tcipif_bmu_ibus_acc_err;         
wire    [31:0]  tcipif_bmu_ibus_data;            
wire            tcipif_bmu_ibus_grnt;            
wire            tcipif_bmu_ibus_trans_cmplt;     
wire    [15:0]  tcipif_sysmap_addr;              
wire            tcipif_sysmap_sel;               
wire    [31:0]  tcipif_sysmap_wdata;             
wire            tcipif_sysmap_write;             
wire            tdt_dm_dtu_ack_havereset;        
wire            tdt_dm_dtu_async_halt_req;       
wire            tdt_dm_dtu_halt_on_reset;        
wire            tdt_dm_dtu_halt_req;             
wire    [31:0]  tdt_dm_dtu_itr;                  
wire            tdt_dm_dtu_itr_vld;              
wire            tdt_dm_dtu_resume_req;           
wire    [31:0]  tdt_dm_dtu_wdata;                
wire    [1 :0]  tdt_dm_dtu_wr_flg;               
wire            tdt_dm_dtu_wr_vld;               



//==========================================================
//  Instance 906 core module
//==========================================================
// &Instance("pa_core"); @34
pa_core  x_pa_core (
  .bmu_ifu_acc_err                  (bmu_ifu_acc_err                 ),
  .bmu_ifu_grant                    (bmu_ifu_grant                   ),
  .bmu_ifu_rdata                    (bmu_ifu_rdata                   ),
  .bmu_ifu_trans_cmplt              (bmu_ifu_trans_cmplt             ),
  .bmu_lsu_acc_err                  (bmu_lsu_acc_err                 ),
  .bmu_lsu_grant                    (bmu_lsu_grant                   ),
  .bmu_lsu_rdata                    (bmu_lsu_rdata                   ),
  .bmu_lsu_trans_cmplt              (bmu_lsu_trans_cmplt             ),
  .clic_cpu_int_hv                  (clic_cpu_int_hv                 ),
  .clic_cpu_int_id                  (clic_cpu_int_id                 ),
  .clic_cpu_int_il                  (clic_cpu_int_il                 ),
  .clic_cpu_int_priv                (clic_cpu_int_priv               ),
  .cp0_biu_icg_en                   (cp0_biu_icg_en                  ),
  .cp0_dtu_addr                     (cp0_dtu_addr                    ),
  .cp0_dtu_debug_info               (cp0_dtu_debug_info              ),
  .cp0_dtu_icg_en                   (cp0_dtu_icg_en                  ),
  .cp0_dtu_int_id                   (cp0_dtu_int_id                  ),
  .cp0_dtu_mexpt_vld                (cp0_dtu_mexpt_vld               ),
  .cp0_dtu_pcfifo_frz               (cp0_dtu_pcfifo_frz              ),
  .cp0_dtu_rreg                     (cp0_dtu_rreg                    ),
  .cp0_dtu_wdata                    (cp0_dtu_wdata                   ),
  .cp0_dtu_wreg                     (cp0_dtu_wreg                    ),
  .cp0_hpcp_icg_en                  (cp0_hpcp_icg_en                 ),
  .cp0_hpcp_index                   (cp0_hpcp_index                  ),
  .cp0_hpcp_pmdm                    (cp0_hpcp_pmdm                   ),
  .cp0_hpcp_pmdu                    (cp0_hpcp_pmdu                   ),
  .cp0_hpcp_wdata                   (cp0_hpcp_wdata                  ),
  .cp0_hpcp_wreg                    (cp0_hpcp_wreg                   ),
  .cp0_pad_mcause                   (cp0_pad_mcause                  ),
  .cp0_pad_mintstatus               (cp0_pad_mintstatus              ),
  .cp0_pad_mstatus                  (cp0_pad_mstatus                 ),
  .cp0_pmp_csr_sel                  (cp0_pmp_csr_sel                 ),
  .cp0_pmp_csr_wen                  (cp0_pmp_csr_wen                 ),
  .cp0_pmp_icg_en                   (cp0_pmp_icg_en                  ),
  .cp0_pmp_mstatus_mpp              (cp0_pmp_mstatus_mpp             ),
  .cp0_pmp_mstatus_mprv             (cp0_pmp_mstatus_mprv            ),
  .cp0_pmp_updt_data                (cp0_pmp_updt_data               ),
  .cp0_sysio_ipend_b                (cp0_sysio_ipend_b               ),
  .cp0_sysio_lpmd_b                 (cp0_sysio_lpmd_b                ),
  .cp0_sysio_srst                   (cp0_sysio_srst                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cp0_yy_mach_mode                 (cp0_yy_mach_mode                ),
  .cp0_yy_priv_mode                 (cp0_yy_priv_mode                ),
  .cpu_clic_curid                   (cpu_clic_curid                  ),
  .cpu_clic_int_exit                (cpu_clic_int_exit               ),
  .cpurst_b                         (cpurst_b                        ),
  .dtu_cp0_dcsr_mprven              (dtu_cp0_dcsr_mprven             ),
  .dtu_cp0_dcsr_prv                 (dtu_cp0_dcsr_prv                ),
  .dtu_cp0_rdata                    (dtu_cp0_rdata                   ),
  .dtu_cp0_wake_up                  (dtu_cp0_wake_up                 ),
  .dtu_ifu_debug_inst               (dtu_ifu_debug_inst              ),
  .dtu_ifu_debug_inst_vld           (dtu_ifu_debug_inst_vld          ),
  .dtu_ifu_halt_info0               (dtu_ifu_halt_info0              ),
  .dtu_ifu_halt_info1               (dtu_ifu_halt_info1              ),
  .dtu_ifu_halt_info_vld            (dtu_ifu_halt_info_vld           ),
  .dtu_ifu_halt_on_reset            (dtu_ifu_halt_on_reset           ),
  .dtu_lsu_addr_trig_en             (dtu_lsu_addr_trig_en            ),
  .dtu_lsu_data_trig_en             (dtu_lsu_data_trig_en            ),
  .dtu_lsu_halt_info                (dtu_lsu_halt_info               ),
  .dtu_lsu_halt_info_vld            (dtu_lsu_halt_info_vld           ),
  .dtu_rtu_async_halt_req           (dtu_rtu_async_halt_req          ),
  .dtu_rtu_dpc                      (dtu_rtu_dpc                     ),
  .dtu_rtu_ebreak_action            (dtu_rtu_ebreak_action           ),
  .dtu_rtu_int_mask                 (dtu_rtu_int_mask                ),
  .dtu_rtu_pending_tval             (dtu_rtu_pending_tval            ),
  .dtu_rtu_resume_req               (dtu_rtu_resume_req              ),
  .dtu_rtu_step_en                  (dtu_rtu_step_en                 ),
  .dtu_rtu_sync_flush               (dtu_rtu_sync_flush              ),
  .dtu_rtu_sync_halt_req            (dtu_rtu_sync_halt_req           ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .fpu_dtu_debug_info               (fpu_dtu_debug_info              ),
  .hpcp_cp0_data                    (hpcp_cp0_data                   ),
  .idu_dtu_debug_info               (idu_dtu_debug_info              ),
  .idu_dtu_fpr_info                 (idu_dtu_fpr_info                ),
  .idu_yy_xx_tail_ack               (idu_yy_xx_tail_ack              ),
  .ifu_bmu_acc_deny                 (ifu_bmu_acc_deny                ),
  .ifu_bmu_addr                     (ifu_bmu_addr                    ),
  .ifu_bmu_burst                    (ifu_bmu_burst                   ),
  .ifu_bmu_data_req                 (ifu_bmu_data_req                ),
  .ifu_bmu_prot                     (ifu_bmu_prot                    ),
  .ifu_bmu_req                      (ifu_bmu_req                     ),
  .ifu_bmu_seq                      (ifu_bmu_seq                     ),
  .ifu_bmu_size                     (ifu_bmu_size                    ),
  .ifu_clic_warm_up                 (ifu_clic_warm_up                ),
  .ifu_dtu_addr_vld0                (ifu_dtu_addr_vld0               ),
  .ifu_dtu_addr_vld1                (ifu_dtu_addr_vld1               ),
  .ifu_dtu_data_vld0                (ifu_dtu_data_vld0               ),
  .ifu_dtu_data_vld1                (ifu_dtu_data_vld1               ),
  .ifu_dtu_debug_info               (ifu_dtu_debug_info              ),
  .ifu_dtu_exe_addr0                (ifu_dtu_exe_addr0               ),
  .ifu_dtu_exe_addr1                (ifu_dtu_exe_addr1               ),
  .ifu_dtu_exe_data0                (ifu_dtu_exe_data0               ),
  .ifu_dtu_exe_data1                (ifu_dtu_exe_data1               ),
  .ifu_hpcp_icache_access           (ifu_hpcp_icache_access          ),
  .ifu_hpcp_icache_miss             (ifu_hpcp_icache_miss            ),
  .ifu_pmp_addr                     (ifu_pmp_addr                    ),
  .ifu_pmp_machine_mode             (ifu_pmp_machine_mode            ),
  .ifu_sysmap_pa                    (ifu_sysmap_pa                   ),
  .ifu_sysmap_rst_sample            (ifu_sysmap_rst_sample           ),
  .iu_dtu_debug_info                (iu_dtu_debug_info               ),
  .iu_hpcp_inst_bht_mispred         (iu_hpcp_inst_bht_mispred        ),
  .iu_hpcp_inst_condbr              (iu_hpcp_inst_condbr             ),
  .iu_hpcp_inst_condbr_gate         (iu_hpcp_inst_condbr_gate        ),
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
  .lsu_pmp_addr                     (lsu_pmp_addr                    ),
  .lsu_pmp_write                    (lsu_pmp_write                   ),
  .lsu_sysmap_pa                    (lsu_sysmap_pa                   ),
  .lsu_xx_flush                     (lsu_xx_flush                    ),
  .lsu_xx_warm_up                   (lsu_xx_warm_up                  ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .pmp_cp0_data                     (pmp_cp0_data                    ),
  .pmp_ifu_acc_deny                 (pmp_ifu_acc_deny                ),
  .pmp_lsu_acc_deny                 (pmp_lsu_acc_deny                ),
  .rtu_dtu_debug_info               (rtu_dtu_debug_info              ),
  .rtu_dtu_dpc                      (rtu_dtu_dpc                     ),
  .rtu_dtu_halt_ack                 (rtu_dtu_halt_ack                ),
  .rtu_dtu_nmi_pending              (rtu_dtu_nmi_pending             ),
  .rtu_dtu_pending_ack              (rtu_dtu_pending_ack             ),
  .rtu_dtu_retire_chgflw            (rtu_dtu_retire_chgflw           ),
  .rtu_dtu_retire_debug_expt_vld    (rtu_dtu_retire_debug_expt_vld   ),
  .rtu_dtu_retire_halt_info         (rtu_dtu_retire_halt_info        ),
  .rtu_dtu_retire_mret              (rtu_dtu_retire_mret             ),
  .rtu_dtu_retire_next_pc           (rtu_dtu_retire_next_pc          ),
  .rtu_dtu_retire_vld               (rtu_dtu_retire_vld              ),
  .rtu_dtu_tval                     (rtu_dtu_tval                    ),
  .rtu_hpcp_retire_inst_vld         (rtu_hpcp_retire_inst_vld        ),
  .rtu_pad_inst_retire              (rtu_pad_inst_retire             ),
  .rtu_pad_inst_split               (rtu_pad_inst_split              ),
  .rtu_pad_retire_pc                (rtu_pad_retire_pc               ),
  .rtu_pad_wb0_data                 (rtu_pad_wb0_data                ),
  .rtu_pad_wb0_preg                 (rtu_pad_wb0_preg                ),
  .rtu_pad_wb0_vld                  (rtu_pad_wb0_vld                 ),
  .rtu_pad_wb1_data                 (rtu_pad_wb1_data                ),
  .rtu_pad_wb1_preg                 (rtu_pad_wb1_preg                ),
  .rtu_pad_wb1_vld                  (rtu_pad_wb1_vld                 ),
  .rtu_pad_wb2_data                 (rtu_pad_wb2_data                ),
  .rtu_pad_wb2_preg                 (rtu_pad_wb2_preg                ),
  .rtu_pad_wb2_vld                  (rtu_pad_wb2_vld                 ),
  .rtu_pad_wb_freg                  (rtu_pad_wb_freg                 ),
  .rtu_pad_wb_freg_data             (rtu_pad_wb_freg_data            ),
  .rtu_pad_wb_freg_vld              (rtu_pad_wb_freg_vld             ),
  .rtu_sysio_halted                 (rtu_sysio_halted                ),
  .rtu_sysio_lockup_on              (rtu_sysio_lockup_on             ),
  .rtu_yy_xx_async_flush            (rtu_yy_xx_async_flush           ),
  .rtu_yy_xx_dbgon                  (rtu_yy_xx_dbgon                 ),
  .rtu_yy_xx_expt_int               (rtu_yy_xx_expt_int              ),
  .rtu_yy_xx_expt_vec               (rtu_yy_xx_expt_vec              ),
  .rtu_yy_xx_expt_vld               (rtu_yy_xx_expt_vld              ),
  .sysio_cp0_clk_en                 (sysio_cp0_clk_en                ),
  .sysio_cp0_clkratio               (sysio_cp0_clkratio              ),
  .sysio_cp0_rst_addr               (sysio_cp0_rst_addr              ),
  .sysio_ifu_rst_addr               (sysio_ifu_rst_addr              ),
  .sysio_ifu_rst_addr_done          (sysio_ifu_rst_addr_done         ),
  .sysio_iu_rst_addr                (sysio_iu_rst_addr               ),
  .sysio_rtu_nmi_int                (sysio_rtu_nmi_int               ),
  .sysio_rtu_wk_event               (sysio_rtu_wk_event              ),
  .sysio_xx_halt_req                (sysio_xx_halt_req               ),
  .sysmap_ifu_flg                   (sysmap_ifu_flg                  ),
  .sysmap_lsu_flg                   (sysmap_lsu_flg                  ),
  .tcip_cp0_clic_base               (tcip_cp0_clic_base              )
);

// &Connect( @35
//          .had_yy_xx_exit_dbg    (had_core_exit_dbg       ), @36
//         ); @37
// //&Force("output", "cp0_yy_mach_mode"); @38
// &Force("output", "rtu_yy_xx_dbgon"); @39
// &Force("output", "cp0_biu_icg_en"); @40
// //&Force("output", "rtu_yy_xx_async_flush"); @41

//==========================================================
//  Instance PMP module 
//==========================================================
// &Instance("pa_pmp_top"); @47
pa_pmp_top  x_pa_pmp_top (
  .cp0_pmp_csr_sel      (cp0_pmp_csr_sel     ),
  .cp0_pmp_csr_wen      (cp0_pmp_csr_wen     ),
  .cp0_pmp_icg_en       (cp0_pmp_icg_en      ),
  .cp0_pmp_mstatus_mpp  (cp0_pmp_mstatus_mpp ),
  .cp0_pmp_mstatus_mprv (cp0_pmp_mstatus_mprv),
  .cp0_pmp_updt_data    (cp0_pmp_updt_data   ),
  .cp0_yy_clk_en        (cp0_yy_clk_en       ),
  .cp0_yy_mach_mode     (cp0_yy_mach_mode    ),
  .cpurst_b             (cpurst_b            ),
  .forever_cpuclk       (forever_cpuclk      ),
  .ifu_pmp_addr         (ifu_pmp_addr        ),
  .ifu_pmp_machine_mode (ifu_pmp_machine_mode),
  .lsu_pmp_addr         (lsu_pmp_addr        ),
  .lsu_pmp_write        (lsu_pmp_write       ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  ),
  .pmp_cp0_data         (pmp_cp0_data        ),
  .pmp_ifu_acc_deny     (pmp_ifu_acc_deny    ),
  .pmp_lsu_acc_deny     (pmp_lsu_acc_deny    )
);

// &Force("nonport", "ifu_pmp_addr"); &Force("bus", "ifu_pmp_addr", 31, 0); @49
// &Force("nonport", "ifu_pmp_machine_mode"); @50
// &Force("nonport", "lsu_pmp_addr"); &Force("bus", "lsu_pmp_addr", 31, 0); @51
// &Force("nonport", "lsu_pmp_write"); @52

//==========================================================
//  Instance SYSMAP module 
//==========================================================
// &Instance("pa_sysmap_top"); @63
pa_sysmap_top  x_pa_sysmap_top (
  .cp0_pmp_icg_en            (cp0_pmp_icg_en           ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .ifu_sysmap_pa             (ifu_sysmap_pa            ),
  .ifu_sysmap_rst_sample     (ifu_sysmap_rst_sample    ),
  .lsu_sysmap_pa             (lsu_sysmap_pa            ),
  .pad_cpu_sysmap_addr0      (pad_cpu_sysmap_addr0     ),
  .pad_cpu_sysmap_addr0_attr (pad_cpu_sysmap_addr0_attr),
  .pad_cpu_sysmap_addr1      (pad_cpu_sysmap_addr1     ),
  .pad_cpu_sysmap_addr1_attr (pad_cpu_sysmap_addr1_attr),
  .pad_cpu_sysmap_addr2      (pad_cpu_sysmap_addr2     ),
  .pad_cpu_sysmap_addr2_attr (pad_cpu_sysmap_addr2_attr),
  .pad_cpu_sysmap_addr3      (pad_cpu_sysmap_addr3     ),
  .pad_cpu_sysmap_addr3_attr (pad_cpu_sysmap_addr3_attr),
  .pad_cpu_sysmap_addr4      (pad_cpu_sysmap_addr4     ),
  .pad_cpu_sysmap_addr4_attr (pad_cpu_sysmap_addr4_attr),
  .pad_cpu_sysmap_addr5      (pad_cpu_sysmap_addr5     ),
  .pad_cpu_sysmap_addr5_attr (pad_cpu_sysmap_addr5_attr),
  .pad_cpu_sysmap_addr6      (pad_cpu_sysmap_addr6     ),
  .pad_cpu_sysmap_addr6_attr (pad_cpu_sysmap_addr6_attr),
  .pad_cpu_sysmap_addr7      (pad_cpu_sysmap_addr7     ),
  .pad_cpu_sysmap_addr7_attr (pad_cpu_sysmap_addr7_attr),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .sysmap_ifu_flg            (sysmap_ifu_flg           ),
  .sysmap_lsu_flg            (sysmap_lsu_flg           ),
  .sysmap_tcipif_cmplt       (sysmap_tcipif_cmplt      ),
  .sysmap_tcipif_rdata       (sysmap_tcipif_rdata      ),
  .tcipif_sysmap_addr        (tcipif_sysmap_addr       ),
  .tcipif_sysmap_sel         (tcipif_sysmap_sel        ),
  .tcipif_sysmap_wdata       (tcipif_sysmap_wdata      ),
  .tcipif_sysmap_write       (tcipif_sysmap_write      )
);


//==========================================================
//  Instance BMU module 
//==========================================================
// &Instance("pa_biu_top"); @70
// &Instance("pa_bmu_top"); @72
pa_bmu_top  x_pa_bmu_top (
  .bmu_dahbl_dbus_acc_deny     (bmu_dahbl_dbus_acc_deny    ),
  .bmu_dahbl_dbus_addr         (bmu_dahbl_dbus_addr        ),
  .bmu_dahbl_dbus_burst        (bmu_dahbl_dbus_burst       ),
  .bmu_dahbl_dbus_lock         (bmu_dahbl_dbus_lock        ),
  .bmu_dahbl_dbus_lrsc         (bmu_dahbl_dbus_lrsc        ),
  .bmu_dahbl_dbus_prot         (bmu_dahbl_dbus_prot        ),
  .bmu_dahbl_dbus_req          (bmu_dahbl_dbus_req         ),
  .bmu_dahbl_dbus_req_dp       (bmu_dahbl_dbus_req_dp      ),
  .bmu_dahbl_dbus_seq          (bmu_dahbl_dbus_seq         ),
  .bmu_dahbl_dbus_size         (bmu_dahbl_dbus_size        ),
  .bmu_dahbl_dbus_wdata        (bmu_dahbl_dbus_wdata       ),
  .bmu_dahbl_dbus_write        (bmu_dahbl_dbus_write       ),
  .bmu_dahbl_ibus_acc_deny     (bmu_dahbl_ibus_acc_deny    ),
  .bmu_dahbl_ibus_addr         (bmu_dahbl_ibus_addr        ),
  .bmu_dahbl_ibus_burst        (bmu_dahbl_ibus_burst       ),
  .bmu_dahbl_ibus_prot         (bmu_dahbl_ibus_prot        ),
  .bmu_dahbl_ibus_req          (bmu_dahbl_ibus_req         ),
  .bmu_dahbl_ibus_req_dp       (bmu_dahbl_ibus_req_dp      ),
  .bmu_dahbl_ibus_seq          (bmu_dahbl_ibus_seq         ),
  .bmu_dahbl_ibus_size         (bmu_dahbl_ibus_size        ),
  .bmu_dtu_debug_info          (bmu_dtu_debug_info         ),
  .bmu_iahbl_dbus_acc_deny     (bmu_iahbl_dbus_acc_deny    ),
  .bmu_iahbl_dbus_addr         (bmu_iahbl_dbus_addr        ),
  .bmu_iahbl_dbus_burst        (bmu_iahbl_dbus_burst       ),
  .bmu_iahbl_dbus_lock         (bmu_iahbl_dbus_lock        ),
  .bmu_iahbl_dbus_lrsc         (bmu_iahbl_dbus_lrsc        ),
  .bmu_iahbl_dbus_prot         (bmu_iahbl_dbus_prot        ),
  .bmu_iahbl_dbus_req          (bmu_iahbl_dbus_req         ),
  .bmu_iahbl_dbus_req_dp       (bmu_iahbl_dbus_req_dp      ),
  .bmu_iahbl_dbus_seq          (bmu_iahbl_dbus_seq         ),
  .bmu_iahbl_dbus_size         (bmu_iahbl_dbus_size        ),
  .bmu_iahbl_dbus_wdata        (bmu_iahbl_dbus_wdata       ),
  .bmu_iahbl_dbus_write        (bmu_iahbl_dbus_write       ),
  .bmu_iahbl_ibus_acc_deny     (bmu_iahbl_ibus_acc_deny    ),
  .bmu_iahbl_ibus_addr         (bmu_iahbl_ibus_addr        ),
  .bmu_iahbl_ibus_burst        (bmu_iahbl_ibus_burst       ),
  .bmu_iahbl_ibus_prot         (bmu_iahbl_ibus_prot        ),
  .bmu_iahbl_ibus_req          (bmu_iahbl_ibus_req         ),
  .bmu_iahbl_ibus_req_dp       (bmu_iahbl_ibus_req_dp      ),
  .bmu_iahbl_ibus_seq          (bmu_iahbl_ibus_seq         ),
  .bmu_iahbl_ibus_size         (bmu_iahbl_ibus_size        ),
  .bmu_ifu_acc_err             (bmu_ifu_acc_err            ),
  .bmu_ifu_grant               (bmu_ifu_grant              ),
  .bmu_ifu_rdata               (bmu_ifu_rdata              ),
  .bmu_ifu_trans_cmplt         (bmu_ifu_trans_cmplt        ),
  .bmu_lsu_acc_err             (bmu_lsu_acc_err            ),
  .bmu_lsu_grant               (bmu_lsu_grant              ),
  .bmu_lsu_rdata               (bmu_lsu_rdata              ),
  .bmu_lsu_trans_cmplt         (bmu_lsu_trans_cmplt        ),
  .bmu_sahbl_dbus_acc_deny     (bmu_sahbl_dbus_acc_deny    ),
  .bmu_sahbl_dbus_addr         (bmu_sahbl_dbus_addr        ),
  .bmu_sahbl_dbus_burst        (bmu_sahbl_dbus_burst       ),
  .bmu_sahbl_dbus_lock         (bmu_sahbl_dbus_lock        ),
  .bmu_sahbl_dbus_lrsc         (bmu_sahbl_dbus_lrsc        ),
  .bmu_sahbl_dbus_prot         (bmu_sahbl_dbus_prot        ),
  .bmu_sahbl_dbus_req          (bmu_sahbl_dbus_req         ),
  .bmu_sahbl_dbus_req_dp       (bmu_sahbl_dbus_req_dp      ),
  .bmu_sahbl_dbus_seq          (bmu_sahbl_dbus_seq         ),
  .bmu_sahbl_dbus_size         (bmu_sahbl_dbus_size        ),
  .bmu_sahbl_dbus_wdata        (bmu_sahbl_dbus_wdata       ),
  .bmu_sahbl_dbus_write        (bmu_sahbl_dbus_write       ),
  .bmu_sahbl_ibus_acc_deny     (bmu_sahbl_ibus_acc_deny    ),
  .bmu_sahbl_ibus_addr         (bmu_sahbl_ibus_addr        ),
  .bmu_sahbl_ibus_burst        (bmu_sahbl_ibus_burst       ),
  .bmu_sahbl_ibus_prot         (bmu_sahbl_ibus_prot        ),
  .bmu_sahbl_ibus_req          (bmu_sahbl_ibus_req         ),
  .bmu_sahbl_ibus_req_dp       (bmu_sahbl_ibus_req_dp      ),
  .bmu_sahbl_ibus_seq          (bmu_sahbl_ibus_seq         ),
  .bmu_sahbl_ibus_size         (bmu_sahbl_ibus_size        ),
  .bmu_tcipif_dbus_acc_deny    (bmu_tcipif_dbus_acc_deny   ),
  .bmu_tcipif_dbus_addr        (bmu_tcipif_dbus_addr       ),
  .bmu_tcipif_dbus_req         (bmu_tcipif_dbus_req        ),
  .bmu_tcipif_dbus_req_dp      (bmu_tcipif_dbus_req_dp     ),
  .bmu_tcipif_dbus_size        (bmu_tcipif_dbus_size       ),
  .bmu_tcipif_dbus_supv_mode   (bmu_tcipif_dbus_supv_mode  ),
  .bmu_tcipif_dbus_wdata       (bmu_tcipif_dbus_wdata      ),
  .bmu_tcipif_dbus_write       (bmu_tcipif_dbus_write      ),
  .bmu_tcipif_ibus_acc_deny    (bmu_tcipif_ibus_acc_deny   ),
  .bmu_tcipif_ibus_addr        (bmu_tcipif_ibus_addr       ),
  .bmu_tcipif_ibus_req         (bmu_tcipif_ibus_req        ),
  .bmu_tcipif_ibus_req_dp      (bmu_tcipif_ibus_req_dp     ),
  .bmu_tcipif_ibus_size        (bmu_tcipif_ibus_size       ),
  .bmu_tcipif_ibus_supv_mode   (bmu_tcipif_ibus_supv_mode  ),
  .bmu_tcipif_ibus_wdata       (bmu_tcipif_ibus_wdata      ),
  .bmu_tcipif_ibus_write       (bmu_tcipif_ibus_write      ),
  .cp0_biu_icg_en              (cp0_biu_icg_en             ),
  .cpurst_b                    (cpurst_b                   ),
  .dahbl_bmu_dbus_acc_err      (dahbl_bmu_dbus_acc_err     ),
  .dahbl_bmu_dbus_data         (dahbl_bmu_dbus_data        ),
  .dahbl_bmu_dbus_grnt         (dahbl_bmu_dbus_grnt        ),
  .dahbl_bmu_dbus_trans_cmplt  (dahbl_bmu_dbus_trans_cmplt ),
  .dahbl_bmu_ibus_acc_err      (dahbl_bmu_ibus_acc_err     ),
  .dahbl_bmu_ibus_data         (dahbl_bmu_ibus_data        ),
  .dahbl_bmu_ibus_grnt         (dahbl_bmu_ibus_grnt        ),
  .dahbl_bmu_ibus_trans_cmplt  (dahbl_bmu_ibus_trans_cmplt ),
  .forever_cpuclk              (forever_cpuclk             ),
  .iahbl_bmu_dbus_acc_err      (iahbl_bmu_dbus_acc_err     ),
  .iahbl_bmu_dbus_data         (iahbl_bmu_dbus_data        ),
  .iahbl_bmu_dbus_grnt         (iahbl_bmu_dbus_grnt        ),
  .iahbl_bmu_dbus_trans_cmplt  (iahbl_bmu_dbus_trans_cmplt ),
  .iahbl_bmu_ibus_acc_err      (iahbl_bmu_ibus_acc_err     ),
  .iahbl_bmu_ibus_data         (iahbl_bmu_ibus_data        ),
  .iahbl_bmu_ibus_grnt         (iahbl_bmu_ibus_grnt        ),
  .iahbl_bmu_ibus_trans_cmplt  (iahbl_bmu_ibus_trans_cmplt ),
  .ifu_bmu_acc_deny            (ifu_bmu_acc_deny           ),
  .ifu_bmu_addr                (ifu_bmu_addr               ),
  .ifu_bmu_burst               (ifu_bmu_burst              ),
  .ifu_bmu_data_req            (ifu_bmu_data_req           ),
  .ifu_bmu_prot                (ifu_bmu_prot               ),
  .ifu_bmu_req                 (ifu_bmu_req                ),
  .ifu_bmu_seq                 (ifu_bmu_seq                ),
  .ifu_bmu_size                (ifu_bmu_size               ),
  .lsu_bmu_acc_deny            (lsu_bmu_acc_deny           ),
  .lsu_bmu_addr                (lsu_bmu_addr               ),
  .lsu_bmu_burst               (lsu_bmu_burst              ),
  .lsu_bmu_lock                (lsu_bmu_lock               ),
  .lsu_bmu_lrsc                (lsu_bmu_lrsc               ),
  .lsu_bmu_prot                (lsu_bmu_prot               ),
  .lsu_bmu_req                 (lsu_bmu_req                ),
  .lsu_bmu_req_dp              (lsu_bmu_req_dp             ),
  .lsu_bmu_seq                 (lsu_bmu_seq                ),
  .lsu_bmu_size                (lsu_bmu_size               ),
  .lsu_bmu_wdata               (lsu_bmu_wdata              ),
  .lsu_bmu_write               (lsu_bmu_write              ),
  .pad_bmu_dahbl_base          (pad_bmu_dahbl_base         ),
  .pad_bmu_dahbl_mask          (pad_bmu_dahbl_mask         ),
  .pad_bmu_iahbl_base          (pad_bmu_iahbl_base         ),
  .pad_bmu_iahbl_mask          (pad_bmu_iahbl_mask         ),
  .pad_cpu_tcip_base           (pad_cpu_tcip_base          ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .rtu_yy_xx_async_flush       (rtu_yy_xx_async_flush      ),
  .sahbl_bmu_dbus_acc_err      (sahbl_bmu_dbus_acc_err     ),
  .sahbl_bmu_dbus_data         (sahbl_bmu_dbus_data        ),
  .sahbl_bmu_dbus_grnt         (sahbl_bmu_dbus_grnt        ),
  .sahbl_bmu_dbus_trans_cmplt  (sahbl_bmu_dbus_trans_cmplt ),
  .sahbl_bmu_ibus_acc_err      (sahbl_bmu_ibus_acc_err     ),
  .sahbl_bmu_ibus_data         (sahbl_bmu_ibus_data        ),
  .sahbl_bmu_ibus_grnt         (sahbl_bmu_ibus_grnt        ),
  .sahbl_bmu_ibus_trans_cmplt  (sahbl_bmu_ibus_trans_cmplt ),
  .tcipif_bmu_dbus_acc_err     (tcipif_bmu_dbus_acc_err    ),
  .tcipif_bmu_dbus_data        (tcipif_bmu_dbus_data       ),
  .tcipif_bmu_dbus_grnt        (tcipif_bmu_dbus_grnt       ),
  .tcipif_bmu_dbus_trans_cmplt (tcipif_bmu_dbus_trans_cmplt),
  .tcipif_bmu_ibus_acc_err     (tcipif_bmu_ibus_acc_err    ),
  .tcipif_bmu_ibus_data        (tcipif_bmu_ibus_data       ),
  .tcipif_bmu_ibus_grnt        (tcipif_bmu_ibus_grnt       ),
  .tcipif_bmu_ibus_trans_cmplt (tcipif_bmu_ibus_trans_cmplt)
);


//==========================================================
//  Instance BIU module 
//==========================================================
// &ConnRule(s/sahbl_pad/biu_pad/); @77
// &ConnRule(s/pad_sahbl/pad_biu/); @78
// &Instance("pa_sahbl_top"); @79
pa_sahbl_top  x_pa_sahbl_top (
  .bmu_sahbl_dbus_acc_deny    (bmu_sahbl_dbus_acc_deny   ),
  .bmu_sahbl_dbus_addr        (bmu_sahbl_dbus_addr       ),
  .bmu_sahbl_dbus_burst       (bmu_sahbl_dbus_burst      ),
  .bmu_sahbl_dbus_lock        (bmu_sahbl_dbus_lock       ),
  .bmu_sahbl_dbus_lrsc        (bmu_sahbl_dbus_lrsc       ),
  .bmu_sahbl_dbus_prot        (bmu_sahbl_dbus_prot       ),
  .bmu_sahbl_dbus_req         (bmu_sahbl_dbus_req        ),
  .bmu_sahbl_dbus_req_dp      (bmu_sahbl_dbus_req_dp     ),
  .bmu_sahbl_dbus_seq         (bmu_sahbl_dbus_seq        ),
  .bmu_sahbl_dbus_size        (bmu_sahbl_dbus_size       ),
  .bmu_sahbl_dbus_wdata       (bmu_sahbl_dbus_wdata      ),
  .bmu_sahbl_dbus_write       (bmu_sahbl_dbus_write      ),
  .bmu_sahbl_ibus_acc_deny    (bmu_sahbl_ibus_acc_deny   ),
  .bmu_sahbl_ibus_addr        (bmu_sahbl_ibus_addr       ),
  .bmu_sahbl_ibus_burst       (bmu_sahbl_ibus_burst      ),
  .bmu_sahbl_ibus_prot        (bmu_sahbl_ibus_prot       ),
  .bmu_sahbl_ibus_req         (bmu_sahbl_ibus_req        ),
  .bmu_sahbl_ibus_req_dp      (bmu_sahbl_ibus_req_dp     ),
  .bmu_sahbl_ibus_seq         (bmu_sahbl_ibus_seq        ),
  .bmu_sahbl_ibus_size        (bmu_sahbl_ibus_size       ),
  .clk_en_f                   (clk_en_f                  ),
  .cp0_biu_icg_en             (cp0_biu_icg_en            ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .lsu_biu_amo_pmp_deny       (lsu_biu_amo_pmp_deny      ),
  .lsu_biu_async_expt_ack     (lsu_biu_async_expt_ack    ),
  .lsu_xx_flush               (lsu_xx_flush              ),
  .lsu_xx_warm_up             (lsu_xx_warm_up            ),
  .pad_sahbl_hrdata           (pad_biu_hrdata            ),
  .pad_sahbl_hready           (pad_biu_hready            ),
  .pad_sahbl_hresp            (pad_biu_hresp             ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .sahbl_bmu_dbus_acc_err     (sahbl_bmu_dbus_acc_err    ),
  .sahbl_bmu_dbus_data        (sahbl_bmu_dbus_data       ),
  .sahbl_bmu_dbus_grnt        (sahbl_bmu_dbus_grnt       ),
  .sahbl_bmu_dbus_trans_cmplt (sahbl_bmu_dbus_trans_cmplt),
  .sahbl_bmu_ibus_acc_err     (sahbl_bmu_ibus_acc_err    ),
  .sahbl_bmu_ibus_data        (sahbl_bmu_ibus_data       ),
  .sahbl_bmu_ibus_grnt        (sahbl_bmu_ibus_grnt       ),
  .sahbl_bmu_ibus_trans_cmplt (sahbl_bmu_ibus_trans_cmplt),
  .sahbl_dtu_debug_info       (sahbl_dtu_debug_info      ),
  .sahbl_pad_haddr            (biu_pad_haddr             ),
  .sahbl_pad_hburst           (biu_pad_hburst            ),
  .sahbl_pad_hlock            (biu_pad_hlock             ),
  .sahbl_pad_hprot            (biu_pad_hprot             ),
  .sahbl_pad_hsize            (biu_pad_hsize             ),
  .sahbl_pad_htrans           (biu_pad_htrans            ),
  .sahbl_pad_hwdata           (biu_pad_hwdata            ),
  .sahbl_pad_hwrite           (biu_pad_hwrite            ),
  .sahbl_sysio_idle           (biu_sysio_idle            ),
  .sysio_xx_halt_req          (sysio_xx_halt_req         )
);

// &Connect(.sahbl_sysio_idle (biu_sysio_idle)); @80

//==========================================================
//  Instance IAHBLite module
//==========================================================
// &Instance("pa_iahbl_top"); @86
pa_iahbl_top  x_pa_iahbl_top (
  .bmu_iahbl_dbus_acc_deny    (bmu_iahbl_dbus_acc_deny   ),
  .bmu_iahbl_dbus_addr        (bmu_iahbl_dbus_addr       ),
  .bmu_iahbl_dbus_burst       (bmu_iahbl_dbus_burst      ),
  .bmu_iahbl_dbus_lock        (bmu_iahbl_dbus_lock       ),
  .bmu_iahbl_dbus_lrsc        (bmu_iahbl_dbus_lrsc       ),
  .bmu_iahbl_dbus_prot        (bmu_iahbl_dbus_prot       ),
  .bmu_iahbl_dbus_req         (bmu_iahbl_dbus_req        ),
  .bmu_iahbl_dbus_req_dp      (bmu_iahbl_dbus_req_dp     ),
  .bmu_iahbl_dbus_seq         (bmu_iahbl_dbus_seq        ),
  .bmu_iahbl_dbus_size        (bmu_iahbl_dbus_size       ),
  .bmu_iahbl_dbus_wdata       (bmu_iahbl_dbus_wdata      ),
  .bmu_iahbl_dbus_write       (bmu_iahbl_dbus_write      ),
  .bmu_iahbl_ibus_acc_deny    (bmu_iahbl_ibus_acc_deny   ),
  .bmu_iahbl_ibus_addr        (bmu_iahbl_ibus_addr       ),
  .bmu_iahbl_ibus_burst       (bmu_iahbl_ibus_burst      ),
  .bmu_iahbl_ibus_prot        (bmu_iahbl_ibus_prot       ),
  .bmu_iahbl_ibus_req         (bmu_iahbl_ibus_req        ),
  .bmu_iahbl_ibus_req_dp      (bmu_iahbl_ibus_req_dp     ),
  .bmu_iahbl_ibus_seq         (bmu_iahbl_ibus_seq        ),
  .bmu_iahbl_ibus_size        (bmu_iahbl_ibus_size       ),
  .cp0_biu_icg_en             (cp0_biu_icg_en            ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .iahbl_bmu_dbus_acc_err     (iahbl_bmu_dbus_acc_err    ),
  .iahbl_bmu_dbus_data        (iahbl_bmu_dbus_data       ),
  .iahbl_bmu_dbus_grnt        (iahbl_bmu_dbus_grnt       ),
  .iahbl_bmu_dbus_trans_cmplt (iahbl_bmu_dbus_trans_cmplt),
  .iahbl_bmu_ibus_acc_err     (iahbl_bmu_ibus_acc_err    ),
  .iahbl_bmu_ibus_data        (iahbl_bmu_ibus_data       ),
  .iahbl_bmu_ibus_grnt        (iahbl_bmu_ibus_grnt       ),
  .iahbl_bmu_ibus_trans_cmplt (iahbl_bmu_ibus_trans_cmplt),
  .iahbl_dtu_debug_info       (iahbl_dtu_debug_info      ),
  .iahbl_pad_haddr            (iahbl_pad_haddr           ),
  .iahbl_pad_hburst           (iahbl_pad_hburst          ),
  .iahbl_pad_hlock            (iahbl_pad_hlock           ),
  .iahbl_pad_hprot            (iahbl_pad_hprot           ),
  .iahbl_pad_hsize            (iahbl_pad_hsize           ),
  .iahbl_pad_htrans           (iahbl_pad_htrans          ),
  .iahbl_pad_hwdata           (iahbl_pad_hwdata          ),
  .iahbl_pad_hwrite           (iahbl_pad_hwrite          ),
  .iahbl_sysio_idle           (iahbl_sysio_idle          ),
  .lsu_biu_amo_pmp_deny       (lsu_biu_amo_pmp_deny      ),
  .lsu_biu_async_expt_ack     (lsu_biu_async_expt_ack    ),
  .lsu_xx_flush               (lsu_xx_flush              ),
  .lsu_xx_warm_up             (lsu_xx_warm_up            ),
  .pad_iahbl_hrdata           (pad_iahbl_hrdata          ),
  .pad_iahbl_hready           (pad_iahbl_hready          ),
  .pad_iahbl_hresp            (pad_iahbl_hresp           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .rtu_yy_xx_async_flush      (rtu_yy_xx_async_flush     ),
  .sysio_xx_halt_req          (sysio_xx_halt_req         )
);


//==========================================================
//  Instance DAHBLite module
//==========================================================
// &Instance("pa_dahbl_top"); @96
pa_dahbl_top  x_pa_dahbl_top (
  .bmu_dahbl_dbus_acc_deny    (bmu_dahbl_dbus_acc_deny   ),
  .bmu_dahbl_dbus_addr        (bmu_dahbl_dbus_addr       ),
  .bmu_dahbl_dbus_burst       (bmu_dahbl_dbus_burst      ),
  .bmu_dahbl_dbus_lock        (bmu_dahbl_dbus_lock       ),
  .bmu_dahbl_dbus_lrsc        (bmu_dahbl_dbus_lrsc       ),
  .bmu_dahbl_dbus_prot        (bmu_dahbl_dbus_prot       ),
  .bmu_dahbl_dbus_req         (bmu_dahbl_dbus_req        ),
  .bmu_dahbl_dbus_req_dp      (bmu_dahbl_dbus_req_dp     ),
  .bmu_dahbl_dbus_seq         (bmu_dahbl_dbus_seq        ),
  .bmu_dahbl_dbus_size        (bmu_dahbl_dbus_size       ),
  .bmu_dahbl_dbus_wdata       (bmu_dahbl_dbus_wdata      ),
  .bmu_dahbl_dbus_write       (bmu_dahbl_dbus_write      ),
  .bmu_dahbl_ibus_acc_deny    (bmu_dahbl_ibus_acc_deny   ),
  .bmu_dahbl_ibus_addr        (bmu_dahbl_ibus_addr       ),
  .bmu_dahbl_ibus_burst       (bmu_dahbl_ibus_burst      ),
  .bmu_dahbl_ibus_prot        (bmu_dahbl_ibus_prot       ),
  .bmu_dahbl_ibus_req         (bmu_dahbl_ibus_req        ),
  .bmu_dahbl_ibus_req_dp      (bmu_dahbl_ibus_req_dp     ),
  .bmu_dahbl_ibus_seq         (bmu_dahbl_ibus_seq        ),
  .bmu_dahbl_ibus_size        (bmu_dahbl_ibus_size       ),
  .cp0_biu_icg_en             (cp0_biu_icg_en            ),
  .cpurst_b                   (cpurst_b                  ),
  .dahbl_bmu_dbus_acc_err     (dahbl_bmu_dbus_acc_err    ),
  .dahbl_bmu_dbus_data        (dahbl_bmu_dbus_data       ),
  .dahbl_bmu_dbus_grnt        (dahbl_bmu_dbus_grnt       ),
  .dahbl_bmu_dbus_trans_cmplt (dahbl_bmu_dbus_trans_cmplt),
  .dahbl_bmu_ibus_acc_err     (dahbl_bmu_ibus_acc_err    ),
  .dahbl_bmu_ibus_data        (dahbl_bmu_ibus_data       ),
  .dahbl_bmu_ibus_grnt        (dahbl_bmu_ibus_grnt       ),
  .dahbl_bmu_ibus_trans_cmplt (dahbl_bmu_ibus_trans_cmplt),
  .dahbl_dtu_debug_info       (dahbl_dtu_debug_info      ),
  .dahbl_pad_haddr            (dahbl_pad_haddr           ),
  .dahbl_pad_hburst           (dahbl_pad_hburst          ),
  .dahbl_pad_hlock            (dahbl_pad_hlock           ),
  .dahbl_pad_hprot            (dahbl_pad_hprot           ),
  .dahbl_pad_hsize            (dahbl_pad_hsize           ),
  .dahbl_pad_htrans           (dahbl_pad_htrans          ),
  .dahbl_pad_hwdata           (dahbl_pad_hwdata          ),
  .dahbl_pad_hwrite           (dahbl_pad_hwrite          ),
  .dahbl_sysio_idle           (dahbl_sysio_idle          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .lsu_biu_amo_pmp_deny       (lsu_biu_amo_pmp_deny      ),
  .lsu_biu_async_expt_ack     (lsu_biu_async_expt_ack    ),
  .lsu_xx_flush               (lsu_xx_flush              ),
  .lsu_xx_warm_up             (lsu_xx_warm_up            ),
  .pad_dahbl_hrdata           (pad_dahbl_hrdata          ),
  .pad_dahbl_hready           (pad_dahbl_hready          ),
  .pad_dahbl_hresp            (pad_dahbl_hresp           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .rtu_yy_xx_async_flush      (rtu_yy_xx_async_flush     ),
  .sysio_xx_halt_req          (sysio_xx_halt_req         )
);


//==========================================================
//  Instance HPCP module
//==========================================================
// &Force("output", "cp0_yy_priv_mode"); @106
// &Instance("pa_hpcp_top"); @107
pa_hpcp_top  x_pa_hpcp_top (
  .cp0_hpcp_icg_en                  (cp0_hpcp_icg_en                 ),
  .cp0_hpcp_index                   (cp0_hpcp_index                  ),
  .cp0_hpcp_pmdm                    (cp0_hpcp_pmdm                   ),
  .cp0_hpcp_pmdu                    (cp0_hpcp_pmdu                   ),
  .cp0_hpcp_wdata                   (cp0_hpcp_wdata                  ),
  .cp0_hpcp_wreg                    (cp0_hpcp_wreg                   ),
  .cp0_yy_priv_mode                 (cp0_yy_priv_mode                ),
  .cpurst_b                         (cpurst_b                        ),
  .dtu_hpcp_dcsr_stopcount          (dtu_hpcp_dcsr_stopcount         ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .hpcp_cp0_data                    (hpcp_cp0_data                   ),
  .ifu_hpcp_icache_access           (ifu_hpcp_icache_access          ),
  .ifu_hpcp_icache_miss             (ifu_hpcp_icache_miss            ),
  .iu_hpcp_inst_bht_mispred         (iu_hpcp_inst_bht_mispred        ),
  .iu_hpcp_inst_condbr              (iu_hpcp_inst_condbr             ),
  .iu_hpcp_inst_condbr_gate         (iu_hpcp_inst_condbr_gate        ),
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
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .rtu_hpcp_retire_inst_vld         (rtu_hpcp_retire_inst_vld        ),
  .rtu_yy_xx_dbgon                  (rtu_yy_xx_dbgon                 ),
  .sysio_hpcp_time                  (sysio_hpcp_time                 )
);


//==========================================================
//  Instance SYSTEM IO module
//==========================================================
// &Instance("pa_sys_io","x_pa_sys_io"); @112
pa_sys_io  x_pa_sys_io (
  .biu_sysio_idle          (biu_sysio_idle         ),
  .clk_en                  (clk_en_f               ),
  .cp0_biu_icg_en          (cp0_biu_icg_en         ),
  .cp0_sysio_ipend_b       (cp0_sysio_ipend_b      ),
  .cp0_sysio_lpmd_b        (cp0_sysio_lpmd_b       ),
  .cp0_sysio_srst          (cp0_sysio_srst         ),
  .cpu_pad_dfs_ack         (cpu_pad_dfs_ack        ),
  .cpu_pad_halted          (cpu_pad_halted         ),
  .cpu_pad_lockup          (cpu_pad_lockup         ),
  .cpu_pad_soft_rst        (cpu_pad_soft_rst       ),
  .cpurst_b                (cpurst_b               ),
  .dahbl_sysio_idle        (dahbl_sysio_idle       ),
  .dtu_cp0_wake_up         (dtu_cp0_wake_up        ),
  .forever_cpuclk          (forever_cpuclk         ),
  .iahbl_sysio_idle        (iahbl_sysio_idle       ),
  .pad_cpu_dfs_req         (pad_cpu_dfs_req        ),
  .pad_cpu_ext_int_b       (pad_cpu_ext_int_b      ),
  .pad_cpu_nmi             (pad_cpu_nmi            ),
  .pad_cpu_rst_addr        (pad_cpu_rst_addr       ),
  .pad_cpu_sys_cnt         (pad_cpu_sys_cnt        ),
  .pad_cpu_wakeup_event    (pad_cpu_wakeup_event   ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .rtu_sysio_halted        (rtu_sysio_halted       ),
  .rtu_sysio_lockup_on     (rtu_sysio_lockup_on    ),
  .rtu_yy_xx_dbgon         (rtu_yy_xx_dbgon        ),
  .sysio_clint_me_int      (sysio_clint_me_int     ),
  .sysio_clint_mtime       (sysio_clint_mtime      ),
  .sysio_cp0_clk_en        (sysio_cp0_clk_en       ),
  .sysio_cp0_clkratio      (sysio_cp0_clkratio     ),
  .sysio_cp0_rst_addr      (sysio_cp0_rst_addr     ),
  .sysio_hpcp_time         (sysio_hpcp_time        ),
  .sysio_ifu_rst_addr      (sysio_ifu_rst_addr     ),
  .sysio_ifu_rst_addr_done (sysio_ifu_rst_addr_done),
  .sysio_iu_rst_addr       (sysio_iu_rst_addr      ),
  .sysio_pad_lpmd_b        (sysio_pad_lpmd_b       ),
  .sysio_rtu_nmi_int       (sysio_rtu_nmi_int      ),
  .sysio_rtu_wk_event      (sysio_rtu_wk_event     ),
  .sysio_xx_halt_req       (sysio_xx_halt_req      )
);

// &Connect(.clk_en (clk_en_f)); @113

//==========================================================
//  Instance DTU module 
//==========================================================
// &Instance("pa_dtu_top"); @119
pa_dtu_top  x_pa_dtu_top (
  .bmu_dtu_debug_info               (bmu_dtu_debug_info              ),
  .cp0_dtu_addr                     (cp0_dtu_addr                    ),
  .cp0_dtu_debug_info               (cp0_dtu_debug_info              ),
  .cp0_dtu_icg_en                   (cp0_dtu_icg_en                  ),
  .cp0_dtu_int_id                   (cp0_dtu_int_id                  ),
  .cp0_dtu_mexpt_vld                (cp0_dtu_mexpt_vld               ),
  .cp0_dtu_pcfifo_frz               (cp0_dtu_pcfifo_frz              ),
  .cp0_dtu_rreg                     (cp0_dtu_rreg                    ),
  .cp0_dtu_wdata                    (cp0_dtu_wdata                   ),
  .cp0_dtu_wreg                     (cp0_dtu_wreg                    ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cp0_yy_priv_mode                 (cp0_yy_priv_mode                ),
  .cpurst_b                         (cpurst_b                        ),
  .dahbl_dtu_debug_info             (dahbl_dtu_debug_info            ),
  .dtu_cp0_dcsr_mprven              (dtu_cp0_dcsr_mprven             ),
  .dtu_cp0_dcsr_prv                 (dtu_cp0_dcsr_prv                ),
  .dtu_cp0_rdata                    (dtu_cp0_rdata                   ),
  .dtu_cp0_wake_up                  (dtu_cp0_wake_up                 ),
  .dtu_hpcp_dcsr_stopcount          (dtu_hpcp_dcsr_stopcount         ),
  .dtu_ifu_debug_inst               (dtu_ifu_debug_inst              ),
  .dtu_ifu_debug_inst_vld           (dtu_ifu_debug_inst_vld          ),
  .dtu_ifu_halt_info0               (dtu_ifu_halt_info0              ),
  .dtu_ifu_halt_info1               (dtu_ifu_halt_info1              ),
  .dtu_ifu_halt_info_vld            (dtu_ifu_halt_info_vld           ),
  .dtu_ifu_halt_on_reset            (dtu_ifu_halt_on_reset           ),
  .dtu_lsu_addr_trig_en             (dtu_lsu_addr_trig_en            ),
  .dtu_lsu_data_trig_en             (dtu_lsu_data_trig_en            ),
  .dtu_lsu_halt_info                (dtu_lsu_halt_info               ),
  .dtu_lsu_halt_info_vld            (dtu_lsu_halt_info_vld           ),
  .dtu_rtu_async_halt_req           (dtu_rtu_async_halt_req          ),
  .dtu_rtu_dpc                      (dtu_rtu_dpc                     ),
  .dtu_rtu_ebreak_action            (dtu_rtu_ebreak_action           ),
  .dtu_rtu_int_mask                 (dtu_rtu_int_mask                ),
  .dtu_rtu_pending_tval             (dtu_rtu_pending_tval            ),
  .dtu_rtu_resume_req               (dtu_rtu_resume_req              ),
  .dtu_rtu_step_en                  (dtu_rtu_step_en                 ),
  .dtu_rtu_sync_flush               (dtu_rtu_sync_flush              ),
  .dtu_rtu_sync_halt_req            (dtu_rtu_sync_halt_req           ),
  .dtu_tdt_dm_halted                (dtu_tdt_dm_halted               ),
  .dtu_tdt_dm_havereset             (dtu_tdt_dm_havereset            ),
  .dtu_tdt_dm_itr_done              (dtu_tdt_dm_itr_done             ),
  .dtu_tdt_dm_retire_debug_expt_vld (dtu_tdt_dm_retire_debug_expt_vld),
  .dtu_tdt_dm_rx_data               (dtu_tdt_dm_rx_data              ),
  .dtu_tdt_dm_wr_ready              (dtu_tdt_dm_wr_ready             ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .fpu_dtu_debug_info               (fpu_dtu_debug_info              ),
  .iahbl_dtu_debug_info             (iahbl_dtu_debug_info            ),
  .idu_dtu_debug_info               (idu_dtu_debug_info              ),
  .idu_dtu_fpr_info                 (idu_dtu_fpr_info                ),
  .idu_yy_xx_tail_ack               (idu_yy_xx_tail_ack              ),
  .ifu_dtu_addr_vld0                (ifu_dtu_addr_vld0               ),
  .ifu_dtu_addr_vld1                (ifu_dtu_addr_vld1               ),
  .ifu_dtu_data_vld0                (ifu_dtu_data_vld0               ),
  .ifu_dtu_data_vld1                (ifu_dtu_data_vld1               ),
  .ifu_dtu_debug_info               (ifu_dtu_debug_info              ),
  .ifu_dtu_exe_addr0                (ifu_dtu_exe_addr0               ),
  .ifu_dtu_exe_addr1                (ifu_dtu_exe_addr1               ),
  .ifu_dtu_exe_data0                (ifu_dtu_exe_data0               ),
  .ifu_dtu_exe_data1                (ifu_dtu_exe_data1               ),
  .iu_dtu_debug_info                (iu_dtu_debug_info               ),
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
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .rtu_dtu_debug_info               (rtu_dtu_debug_info              ),
  .rtu_dtu_dpc                      (rtu_dtu_dpc                     ),
  .rtu_dtu_halt_ack                 (rtu_dtu_halt_ack                ),
  .rtu_dtu_nmi_pending              (rtu_dtu_nmi_pending             ),
  .rtu_dtu_pending_ack              (rtu_dtu_pending_ack             ),
  .rtu_dtu_retire_chgflw            (rtu_dtu_retire_chgflw           ),
  .rtu_dtu_retire_debug_expt_vld    (rtu_dtu_retire_debug_expt_vld   ),
  .rtu_dtu_retire_halt_info         (rtu_dtu_retire_halt_info        ),
  .rtu_dtu_retire_mret              (rtu_dtu_retire_mret             ),
  .rtu_dtu_retire_next_pc           (rtu_dtu_retire_next_pc          ),
  .rtu_dtu_retire_vld               (rtu_dtu_retire_vld              ),
  .rtu_dtu_tval                     (rtu_dtu_tval                    ),
  .rtu_yy_xx_dbgon                  (rtu_yy_xx_dbgon                 ),
  .rtu_yy_xx_expt_int               (rtu_yy_xx_expt_int              ),
  .rtu_yy_xx_expt_vec               (rtu_yy_xx_expt_vec              ),
  .rtu_yy_xx_expt_vld               (rtu_yy_xx_expt_vld              ),
  .sahbl_dtu_debug_info             (sahbl_dtu_debug_info            ),
  .sys_apb_clk                      (sys_apb_clk                     ),
  .sys_apb_rst_b                    (sys_apb_rst_b                   ),
  .tdt_dm_dtu_ack_havereset         (tdt_dm_dtu_ack_havereset        ),
  .tdt_dm_dtu_async_halt_req        (tdt_dm_dtu_async_halt_req       ),
  .tdt_dm_dtu_halt_on_reset         (tdt_dm_dtu_halt_on_reset        ),
  .tdt_dm_dtu_halt_req              (tdt_dm_dtu_halt_req             ),
  .tdt_dm_dtu_itr                   (tdt_dm_dtu_itr                  ),
  .tdt_dm_dtu_itr_vld               (tdt_dm_dtu_itr_vld              ),
  .tdt_dm_dtu_resume_req            (tdt_dm_dtu_resume_req           ),
  .tdt_dm_dtu_wdata                 (tdt_dm_dtu_wdata                ),
  .tdt_dm_dtu_wr_flg                (tdt_dm_dtu_wr_flg               ),
  .tdt_dm_dtu_wr_vld                (tdt_dm_dtu_wr_vld               )
);

// &Instance("pa_dtu_top_dummy"); @121

// &ModuleEnd; @124
endmodule


