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

// &ModuleBeg; @33
module openE906(
  biu_pad_haddr,
  biu_pad_hburst,
  biu_pad_hlock,
  biu_pad_hprot,
  biu_pad_hsize,
  biu_pad_htrans,
  biu_pad_hwdata,
  biu_pad_hwrite,
  clk_en,
  cp0_pad_mcause,
  cp0_pad_mintstatus,
  cp0_pad_mstatus,
  cpu_pad_dfs_ack,
  cpu_pad_halted,
  cpu_pad_lockup,
  cpu_pad_soft_rst,
  dahbl_pad_haddr,
  dahbl_pad_hburst,
  dahbl_pad_hlock,
  dahbl_pad_hprot,
  dahbl_pad_hsize,
  dahbl_pad_htrans,
  dahbl_pad_hwdata,
  dahbl_pad_hwrite,
  iahbl_pad_haddr,
  iahbl_pad_hburst,
  iahbl_pad_hlock,
  iahbl_pad_hprot,
  iahbl_pad_hsize,
  iahbl_pad_htrans,
  iahbl_pad_hwdata,
  iahbl_pad_hwrite,
  pad_biu_hrdata,
  pad_biu_hready,
  pad_biu_hresp,
  pad_bmu_dahbl_base,
  pad_bmu_dahbl_mask,
  pad_bmu_iahbl_base,
  pad_bmu_iahbl_mask,
  pad_clic_int_vld,
  pad_cpu_dfs_req,
  pad_cpu_ext_int_b,
  pad_cpu_nmi,
  pad_cpu_rst_addr,
  pad_cpu_rst_b,
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
  pad_tdt_dm_core_unavail,
  pad_yy_dft_clk_rst_b,
  pad_yy_icg_scan_en,
  pad_yy_scan_enable,
  pad_yy_scan_mode,
  pad_yy_scan_rst_b,
  pll_core_cpuclk,
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
  sys_apb_clk,
  sys_apb_rst_b,
  sysio_pad_lpmd_b,
  tdt_dm_pad_hartreset_n,
  tdt_dm_pad_ndmreset_n,
  tdt_dmi_paddr,
  tdt_dmi_penable,
  tdt_dmi_prdata,
  tdt_dmi_pready,
  tdt_dmi_psel,
  tdt_dmi_pslverr,
  tdt_dmi_pwdata,
  tdt_dmi_pwrite
);

// &Ports("compare", "../../../gen_rtl/cpu/rtl/pa_cpu_top_golden_port.v"); @34
input            clk_en;                          
input   [31 :0]  pad_biu_hrdata;                  
input            pad_biu_hready;                  
input            pad_biu_hresp;                   
input   [11 :0]  pad_bmu_dahbl_base;              
input   [11 :0]  pad_bmu_dahbl_mask;              
input   [11 :0]  pad_bmu_iahbl_base;              
input   [11 :0]  pad_bmu_iahbl_mask;              
input   [127:0]  pad_clic_int_vld;                
input            pad_cpu_dfs_req;                 
input            pad_cpu_ext_int_b;               
input            pad_cpu_nmi;                     
input   [31 :0]  pad_cpu_rst_addr;                
input            pad_cpu_rst_b;                   
input   [63 :0]  pad_cpu_sys_cnt;                 
input   [19 :0]  pad_cpu_sysmap_addr0;            
input   [2  :0]  pad_cpu_sysmap_addr0_attr;       
input   [19 :0]  pad_cpu_sysmap_addr1;            
input   [2  :0]  pad_cpu_sysmap_addr1_attr;       
input   [19 :0]  pad_cpu_sysmap_addr2;            
input   [2  :0]  pad_cpu_sysmap_addr2_attr;       
input   [19 :0]  pad_cpu_sysmap_addr3;            
input   [2  :0]  pad_cpu_sysmap_addr3_attr;       
input   [19 :0]  pad_cpu_sysmap_addr4;            
input   [2  :0]  pad_cpu_sysmap_addr4_attr;       
input   [19 :0]  pad_cpu_sysmap_addr5;            
input   [2  :0]  pad_cpu_sysmap_addr5_attr;       
input   [19 :0]  pad_cpu_sysmap_addr6;            
input   [2  :0]  pad_cpu_sysmap_addr6_attr;       
input   [19 :0]  pad_cpu_sysmap_addr7;            
input   [2  :0]  pad_cpu_sysmap_addr7_attr;       
input   [31 :0]  pad_cpu_tcip_base;               
input            pad_cpu_wakeup_event;            
input   [31 :0]  pad_dahbl_hrdata;                
input            pad_dahbl_hready;                
input            pad_dahbl_hresp;                 
input   [31 :0]  pad_iahbl_hrdata;                
input            pad_iahbl_hready;                
input            pad_iahbl_hresp;                 
input            pad_tdt_dm_core_unavail;         
input            pad_yy_dft_clk_rst_b;            
input            pad_yy_icg_scan_en;              
input            pad_yy_scan_enable;              
input            pad_yy_scan_mode;                
input            pad_yy_scan_rst_b;               
input            pll_core_cpuclk;                 
input            sys_apb_clk;                     
input            sys_apb_rst_b;                   
input   [11 :0]  tdt_dmi_paddr;                   
input            tdt_dmi_penable;                 
input            tdt_dmi_psel;                    
input   [31 :0]  tdt_dmi_pwdata;                  
input            tdt_dmi_pwrite;                  
output  [31 :0]  biu_pad_haddr;                   
output  [2  :0]  biu_pad_hburst;                  
output           biu_pad_hlock;                   
output  [3  :0]  biu_pad_hprot;                   
output  [2  :0]  biu_pad_hsize;                   
output  [1  :0]  biu_pad_htrans;                  
output  [31 :0]  biu_pad_hwdata;                  
output           biu_pad_hwrite;                  
output  [31 :0]  cp0_pad_mcause;                  
output  [31 :0]  cp0_pad_mintstatus;              
output  [31 :0]  cp0_pad_mstatus;                 
output           cpu_pad_dfs_ack;                 
output           cpu_pad_halted;                  
output           cpu_pad_lockup;                  
output  [1  :0]  cpu_pad_soft_rst;                
output  [31 :0]  dahbl_pad_haddr;                 
output  [2  :0]  dahbl_pad_hburst;                
output           dahbl_pad_hlock;                 
output  [3  :0]  dahbl_pad_hprot;                 
output  [2  :0]  dahbl_pad_hsize;                 
output  [1  :0]  dahbl_pad_htrans;                
output  [31 :0]  dahbl_pad_hwdata;                
output           dahbl_pad_hwrite;                
output  [31 :0]  iahbl_pad_haddr;                 
output  [2  :0]  iahbl_pad_hburst;                
output           iahbl_pad_hlock;                 
output  [3  :0]  iahbl_pad_hprot;                 
output  [2  :0]  iahbl_pad_hsize;                 
output  [1  :0]  iahbl_pad_htrans;                
output  [31 :0]  iahbl_pad_hwdata;                
output           iahbl_pad_hwrite;                
output           rtu_pad_inst_retire;             
output           rtu_pad_inst_split;              
output  [31 :0]  rtu_pad_retire_pc;               
output  [31 :0]  rtu_pad_wb0_data;                
output  [5  :0]  rtu_pad_wb0_preg;                
output           rtu_pad_wb0_vld;                 
output  [31 :0]  rtu_pad_wb1_data;                
output  [5  :0]  rtu_pad_wb1_preg;                
output           rtu_pad_wb1_vld;                 
output  [31 :0]  rtu_pad_wb2_data;                
output  [5  :0]  rtu_pad_wb2_preg;                
output           rtu_pad_wb2_vld;                 
output  [4  :0]  rtu_pad_wb_freg;                 
output  [31 :0]  rtu_pad_wb_freg_data;            
output           rtu_pad_wb_freg_vld;             
output  [1  :0]  sysio_pad_lpmd_b;                
output           tdt_dm_pad_hartreset_n;          
output           tdt_dm_pad_ndmreset_n;           
output  [31 :0]  tdt_dmi_prdata;                  
output           tdt_dmi_pready;                  
output           tdt_dmi_pslverr;                 

//&Ports;
// &Regs; @36

// &Wires; @37
wire    [31 :0]  biu_pad_haddr;                   
wire    [2  :0]  biu_pad_hburst;                  
wire             biu_pad_hlock;                   
wire    [3  :0]  biu_pad_hprot;                   
wire    [2  :0]  biu_pad_hsize;                   
wire    [1  :0]  biu_pad_htrans;                  
wire    [31 :0]  biu_pad_hwdata;                  
wire             biu_pad_hwrite;                  
wire             bmu_tcipif_dbus_acc_deny;        
wire    [31 :0]  bmu_tcipif_dbus_addr;            
wire             bmu_tcipif_dbus_req;             
wire             bmu_tcipif_dbus_req_dp;          
wire    [1  :0]  bmu_tcipif_dbus_size;            
wire             bmu_tcipif_dbus_supv_mode;       
wire    [31 :0]  bmu_tcipif_dbus_wdata;           
wire             bmu_tcipif_dbus_write;           
wire             bmu_tcipif_ibus_acc_deny;        
wire    [31 :0]  bmu_tcipif_ibus_addr;            
wire             bmu_tcipif_ibus_req;             
wire             bmu_tcipif_ibus_req_dp;          
wire    [1  :0]  bmu_tcipif_ibus_size;            
wire             bmu_tcipif_ibus_supv_mode;       
wire    [31 :0]  bmu_tcipif_ibus_wdata;           
wire             bmu_tcipif_ibus_write;           
wire             clic_cpu_int_hv;                 
wire    [11 :0]  clic_cpu_int_id;                 
wire    [7  :0]  clic_cpu_int_il;                 
wire    [1  :0]  clic_cpu_int_priv;               
wire             clk_en;                          
wire             clk_en_f;                        
wire             cp0_biu_icg_en;                  
wire    [31 :0]  cp0_pad_mcause;                  
wire    [31 :0]  cp0_pad_mintstatus;              
wire    [31 :0]  cp0_pad_mstatus;                 
wire    [1  :0]  cp0_yy_priv_mode;                
wire    [11 :0]  cpu_clic_curid;                  
wire             cpu_clic_int_exit;               
wire             cpu_pad_dfs_ack;                 
wire             cpu_pad_halted;                  
wire             cpu_pad_lockup;                  
wire    [1  :0]  cpu_pad_soft_rst;                
wire             cpurst_b;                        
wire    [31 :0]  dahbl_pad_haddr;                 
wire    [2  :0]  dahbl_pad_hburst;                
wire             dahbl_pad_hlock;                 
wire    [3  :0]  dahbl_pad_hprot;                 
wire    [2  :0]  dahbl_pad_hsize;                 
wire    [1  :0]  dahbl_pad_htrans;                
wire    [31 :0]  dahbl_pad_hwdata;                
wire             dahbl_pad_hwrite;                
wire             dtu_tdt_dm_halted;               
wire             dtu_tdt_dm_havereset;            
wire             dtu_tdt_dm_itr_done;             
wire             dtu_tdt_dm_retire_debug_expt_vld; 
wire    [31 :0]  dtu_tdt_dm_rx_data;              
wire             dtu_tdt_dm_wr_ready;             
wire             forever_cpuclk;                  
wire    [31 :0]  iahbl_pad_haddr;                 
wire    [2  :0]  iahbl_pad_hburst;                
wire             iahbl_pad_hlock;                 
wire    [3  :0]  iahbl_pad_hprot;                 
wire    [2  :0]  iahbl_pad_hsize;                 
wire    [1  :0]  iahbl_pad_htrans;                
wire    [31 :0]  iahbl_pad_hwdata;                
wire             iahbl_pad_hwrite;                
wire             ifu_clic_warm_up;                
wire    [31 :0]  pad_biu_hrdata;                  
wire             pad_biu_hready;                  
wire             pad_biu_hresp;                   
wire    [11 :0]  pad_bmu_dahbl_base;              
wire    [11 :0]  pad_bmu_dahbl_mask;              
wire    [11 :0]  pad_bmu_iahbl_base;              
wire    [11 :0]  pad_bmu_iahbl_mask;              
wire    [127:0]  pad_clic_int_vld;                
wire             pad_cpu_dfs_req;                 
wire             pad_cpu_ext_int_b;               
wire             pad_cpu_nmi;                     
wire    [31 :0]  pad_cpu_rst_addr;                
wire             pad_cpu_rst_b;                   
wire    [63 :0]  pad_cpu_sys_cnt;                 
wire    [19 :0]  pad_cpu_sysmap_addr0;            
wire    [2  :0]  pad_cpu_sysmap_addr0_attr;       
wire    [19 :0]  pad_cpu_sysmap_addr1;            
wire    [2  :0]  pad_cpu_sysmap_addr1_attr;       
wire    [19 :0]  pad_cpu_sysmap_addr2;            
wire    [2  :0]  pad_cpu_sysmap_addr2_attr;       
wire    [19 :0]  pad_cpu_sysmap_addr3;            
wire    [2  :0]  pad_cpu_sysmap_addr3_attr;       
wire    [19 :0]  pad_cpu_sysmap_addr4;            
wire    [2  :0]  pad_cpu_sysmap_addr4_attr;       
wire    [19 :0]  pad_cpu_sysmap_addr5;            
wire    [2  :0]  pad_cpu_sysmap_addr5_attr;       
wire    [19 :0]  pad_cpu_sysmap_addr6;            
wire    [2  :0]  pad_cpu_sysmap_addr6_attr;       
wire    [19 :0]  pad_cpu_sysmap_addr7;            
wire    [2  :0]  pad_cpu_sysmap_addr7_attr;       
wire    [31 :0]  pad_cpu_tcip_base;               
wire             pad_cpu_wakeup_event;            
wire    [31 :0]  pad_dahbl_hrdata;                
wire             pad_dahbl_hready;                
wire             pad_dahbl_hresp;                 
wire    [31 :0]  pad_iahbl_hrdata;                
wire             pad_iahbl_hready;                
wire             pad_iahbl_hresp;                 
wire             pad_tdt_dm_core_unavail;         
wire             pad_yy_dft_clk_rst_b;            
wire             pad_yy_icg_scan_en;              
wire             pad_yy_scan_mode;                
wire             pad_yy_scan_rst_b;               
wire             pll_core_cpuclk;                 
wire             rtu_pad_inst_retire;             
wire             rtu_pad_inst_split;              
wire    [31 :0]  rtu_pad_retire_pc;               
wire    [31 :0]  rtu_pad_wb0_data;                
wire    [5  :0]  rtu_pad_wb0_preg;                
wire             rtu_pad_wb0_vld;                 
wire    [31 :0]  rtu_pad_wb1_data;                
wire    [5  :0]  rtu_pad_wb1_preg;                
wire             rtu_pad_wb1_vld;                 
wire    [31 :0]  rtu_pad_wb2_data;                
wire    [5  :0]  rtu_pad_wb2_preg;                
wire             rtu_pad_wb2_vld;                 
wire    [4  :0]  rtu_pad_wb_freg;                 
wire    [31 :0]  rtu_pad_wb_freg_data;            
wire             rtu_pad_wb_freg_vld;             
wire             rtu_yy_xx_dbgon;                 
wire             sync_sys_apb_rst_b;              
wire             sys_apb_clk;                     
wire             sys_apb_rst_b;                   
wire             sysio_clint_me_int;              
wire    [63 :0]  sysio_clint_mtime;               
wire    [1  :0]  sysio_pad_lpmd_b;                
wire             sysmap_tcipif_cmplt;             
wire    [31 :0]  sysmap_tcipif_rdata;             
wire    [31 :0]  tcip_cp0_clic_base;              
wire             tcipif_bmu_dbus_acc_err;         
wire    [31 :0]  tcipif_bmu_dbus_data;            
wire             tcipif_bmu_dbus_grnt;            
wire             tcipif_bmu_dbus_trans_cmplt;     
wire             tcipif_bmu_ibus_acc_err;         
wire    [31 :0]  tcipif_bmu_ibus_data;            
wire             tcipif_bmu_ibus_grnt;            
wire             tcipif_bmu_ibus_trans_cmplt;     
wire    [15 :0]  tcipif_sysmap_addr;              
wire             tcipif_sysmap_sel;               
wire    [31 :0]  tcipif_sysmap_wdata;             
wire             tcipif_sysmap_write;             
wire             tdt_dm_dtu_ack_havereset;        
wire             tdt_dm_dtu_async_halt_req;       
wire             tdt_dm_dtu_halt_on_reset;        
wire             tdt_dm_dtu_halt_req;             
wire    [1  :0]  tdt_dm_dtu_halt_req_cause;       
wire    [31 :0]  tdt_dm_dtu_itr;                  
wire             tdt_dm_dtu_itr_vld;              
wire             tdt_dm_dtu_resume_req;           
wire    [31 :0]  tdt_dm_dtu_wdata;                
wire    [1  :0]  tdt_dm_dtu_wr_flg;               
wire             tdt_dm_dtu_wr_vld;               
wire             tdt_dm_pad_hartreset_n;          
wire             tdt_dm_pad_ndmreset_n;           
wire    [11 :0]  tdt_dmi_paddr;                   
wire             tdt_dmi_penable;                 
wire    [31 :0]  tdt_dmi_prdata;                  
wire             tdt_dmi_pready;                  
wire             tdt_dmi_psel;                    
wire             tdt_dmi_pslverr;                 
wire    [31 :0]  tdt_dmi_pwdata;                  
wire             tdt_dmi_pwrite;                  


// &Force("input","pad_yy_scan_enable"); @39
//==========================================================
//  Instance 906 core top module
//==========================================================
// &Instance("pa_core_top"); @43
pa_core_top  x_pa_core_top (
  .biu_pad_haddr                    (biu_pad_haddr                   ),
  .biu_pad_hburst                   (biu_pad_hburst                  ),
  .biu_pad_hlock                    (biu_pad_hlock                   ),
  .biu_pad_hprot                    (biu_pad_hprot                   ),
  .biu_pad_hsize                    (biu_pad_hsize                   ),
  .biu_pad_htrans                   (biu_pad_htrans                  ),
  .biu_pad_hwdata                   (biu_pad_hwdata                  ),
  .biu_pad_hwrite                   (biu_pad_hwrite                  ),
  .bmu_tcipif_dbus_acc_deny         (bmu_tcipif_dbus_acc_deny        ),
  .bmu_tcipif_dbus_addr             (bmu_tcipif_dbus_addr            ),
  .bmu_tcipif_dbus_req              (bmu_tcipif_dbus_req             ),
  .bmu_tcipif_dbus_req_dp           (bmu_tcipif_dbus_req_dp          ),
  .bmu_tcipif_dbus_size             (bmu_tcipif_dbus_size            ),
  .bmu_tcipif_dbus_supv_mode        (bmu_tcipif_dbus_supv_mode       ),
  .bmu_tcipif_dbus_wdata            (bmu_tcipif_dbus_wdata           ),
  .bmu_tcipif_dbus_write            (bmu_tcipif_dbus_write           ),
  .bmu_tcipif_ibus_acc_deny         (bmu_tcipif_ibus_acc_deny        ),
  .bmu_tcipif_ibus_addr             (bmu_tcipif_ibus_addr            ),
  .bmu_tcipif_ibus_req              (bmu_tcipif_ibus_req             ),
  .bmu_tcipif_ibus_req_dp           (bmu_tcipif_ibus_req_dp          ),
  .bmu_tcipif_ibus_size             (bmu_tcipif_ibus_size            ),
  .bmu_tcipif_ibus_supv_mode        (bmu_tcipif_ibus_supv_mode       ),
  .bmu_tcipif_ibus_wdata            (bmu_tcipif_ibus_wdata           ),
  .bmu_tcipif_ibus_write            (bmu_tcipif_ibus_write           ),
  .clic_cpu_int_hv                  (clic_cpu_int_hv                 ),
  .clic_cpu_int_id                  (clic_cpu_int_id                 ),
  .clic_cpu_int_il                  (clic_cpu_int_il                 ),
  .clic_cpu_int_priv                (clic_cpu_int_priv               ),
  .clk_en_f                         (clk_en_f                        ),
  .cp0_biu_icg_en                   (cp0_biu_icg_en                  ),
  .cp0_pad_mcause                   (cp0_pad_mcause                  ),
  .cp0_pad_mintstatus               (cp0_pad_mintstatus              ),
  .cp0_pad_mstatus                  (cp0_pad_mstatus                 ),
  .cp0_yy_priv_mode                 (cp0_yy_priv_mode                ),
  .cpu_clic_curid                   (cpu_clic_curid                  ),
  .cpu_clic_int_exit                (cpu_clic_int_exit               ),
  .cpu_pad_dfs_ack                  (cpu_pad_dfs_ack                 ),
  .cpu_pad_halted                   (cpu_pad_halted                  ),
  .cpu_pad_lockup                   (cpu_pad_lockup                  ),
  .cpu_pad_soft_rst                 (cpu_pad_soft_rst                ),
  .cpurst_b                         (cpurst_b                        ),
  .dahbl_pad_haddr                  (dahbl_pad_haddr                 ),
  .dahbl_pad_hburst                 (dahbl_pad_hburst                ),
  .dahbl_pad_hlock                  (dahbl_pad_hlock                 ),
  .dahbl_pad_hprot                  (dahbl_pad_hprot                 ),
  .dahbl_pad_hsize                  (dahbl_pad_hsize                 ),
  .dahbl_pad_htrans                 (dahbl_pad_htrans                ),
  .dahbl_pad_hwdata                 (dahbl_pad_hwdata                ),
  .dahbl_pad_hwrite                 (dahbl_pad_hwrite                ),
  .dtu_tdt_dm_halted                (dtu_tdt_dm_halted               ),
  .dtu_tdt_dm_havereset             (dtu_tdt_dm_havereset            ),
  .dtu_tdt_dm_itr_done              (dtu_tdt_dm_itr_done             ),
  .dtu_tdt_dm_retire_debug_expt_vld (dtu_tdt_dm_retire_debug_expt_vld),
  .dtu_tdt_dm_rx_data               (dtu_tdt_dm_rx_data              ),
  .dtu_tdt_dm_wr_ready              (dtu_tdt_dm_wr_ready             ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .iahbl_pad_haddr                  (iahbl_pad_haddr                 ),
  .iahbl_pad_hburst                 (iahbl_pad_hburst                ),
  .iahbl_pad_hlock                  (iahbl_pad_hlock                 ),
  .iahbl_pad_hprot                  (iahbl_pad_hprot                 ),
  .iahbl_pad_hsize                  (iahbl_pad_hsize                 ),
  .iahbl_pad_htrans                 (iahbl_pad_htrans                ),
  .iahbl_pad_hwdata                 (iahbl_pad_hwdata                ),
  .iahbl_pad_hwrite                 (iahbl_pad_hwrite                ),
  .ifu_clic_warm_up                 (ifu_clic_warm_up                ),
  .pad_biu_hrdata                   (pad_biu_hrdata                  ),
  .pad_biu_hready                   (pad_biu_hready                  ),
  .pad_biu_hresp                    (pad_biu_hresp                   ),
  .pad_bmu_dahbl_base               (pad_bmu_dahbl_base              ),
  .pad_bmu_dahbl_mask               (pad_bmu_dahbl_mask              ),
  .pad_bmu_iahbl_base               (pad_bmu_iahbl_base              ),
  .pad_bmu_iahbl_mask               (pad_bmu_iahbl_mask              ),
  .pad_cpu_dfs_req                  (pad_cpu_dfs_req                 ),
  .pad_cpu_ext_int_b                (pad_cpu_ext_int_b               ),
  .pad_cpu_nmi                      (pad_cpu_nmi                     ),
  .pad_cpu_rst_addr                 (pad_cpu_rst_addr                ),
  .pad_cpu_sys_cnt                  (pad_cpu_sys_cnt                 ),
  .pad_cpu_sysmap_addr0             (pad_cpu_sysmap_addr0            ),
  .pad_cpu_sysmap_addr0_attr        (pad_cpu_sysmap_addr0_attr       ),
  .pad_cpu_sysmap_addr1             (pad_cpu_sysmap_addr1            ),
  .pad_cpu_sysmap_addr1_attr        (pad_cpu_sysmap_addr1_attr       ),
  .pad_cpu_sysmap_addr2             (pad_cpu_sysmap_addr2            ),
  .pad_cpu_sysmap_addr2_attr        (pad_cpu_sysmap_addr2_attr       ),
  .pad_cpu_sysmap_addr3             (pad_cpu_sysmap_addr3            ),
  .pad_cpu_sysmap_addr3_attr        (pad_cpu_sysmap_addr3_attr       ),
  .pad_cpu_sysmap_addr4             (pad_cpu_sysmap_addr4            ),
  .pad_cpu_sysmap_addr4_attr        (pad_cpu_sysmap_addr4_attr       ),
  .pad_cpu_sysmap_addr5             (pad_cpu_sysmap_addr5            ),
  .pad_cpu_sysmap_addr5_attr        (pad_cpu_sysmap_addr5_attr       ),
  .pad_cpu_sysmap_addr6             (pad_cpu_sysmap_addr6            ),
  .pad_cpu_sysmap_addr6_attr        (pad_cpu_sysmap_addr6_attr       ),
  .pad_cpu_sysmap_addr7             (pad_cpu_sysmap_addr7            ),
  .pad_cpu_sysmap_addr7_attr        (pad_cpu_sysmap_addr7_attr       ),
  .pad_cpu_tcip_base                (pad_cpu_tcip_base               ),
  .pad_cpu_wakeup_event             (pad_cpu_wakeup_event            ),
  .pad_dahbl_hrdata                 (pad_dahbl_hrdata                ),
  .pad_dahbl_hready                 (pad_dahbl_hready                ),
  .pad_dahbl_hresp                  (pad_dahbl_hresp                 ),
  .pad_iahbl_hrdata                 (pad_iahbl_hrdata                ),
  .pad_iahbl_hready                 (pad_iahbl_hready                ),
  .pad_iahbl_hresp                  (pad_iahbl_hresp                 ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
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
  .rtu_yy_xx_dbgon                  (rtu_yy_xx_dbgon                 ),
  .sys_apb_clk                      (sys_apb_clk                     ),
  .sys_apb_rst_b                    (sync_sys_apb_rst_b              ),
  .sysio_clint_me_int               (sysio_clint_me_int              ),
  .sysio_clint_mtime                (sysio_clint_mtime               ),
  .sysio_pad_lpmd_b                 (sysio_pad_lpmd_b                ),
  .sysmap_tcipif_cmplt              (sysmap_tcipif_cmplt             ),
  .sysmap_tcipif_rdata              (sysmap_tcipif_rdata             ),
  .tcip_cp0_clic_base               (tcip_cp0_clic_base              ),
  .tcipif_bmu_dbus_acc_err          (tcipif_bmu_dbus_acc_err         ),
  .tcipif_bmu_dbus_data             (tcipif_bmu_dbus_data            ),
  .tcipif_bmu_dbus_grnt             (tcipif_bmu_dbus_grnt            ),
  .tcipif_bmu_dbus_trans_cmplt      (tcipif_bmu_dbus_trans_cmplt     ),
  .tcipif_bmu_ibus_acc_err          (tcipif_bmu_ibus_acc_err         ),
  .tcipif_bmu_ibus_data             (tcipif_bmu_ibus_data            ),
  .tcipif_bmu_ibus_grnt             (tcipif_bmu_ibus_grnt            ),
  .tcipif_bmu_ibus_trans_cmplt      (tcipif_bmu_ibus_trans_cmplt     ),
  .tcipif_sysmap_addr               (tcipif_sysmap_addr              ),
  .tcipif_sysmap_sel                (tcipif_sysmap_sel               ),
  .tcipif_sysmap_wdata              (tcipif_sysmap_wdata             ),
  .tcipif_sysmap_write              (tcipif_sysmap_write             ),
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

// &Connect(.sys_apb_rst_b (sync_sys_apb_rst_b)); @44

//==========================================================
//          TDT
//==========================================================
// &Instance("tdt_top"); @50
tdt_top  x_tdt_top (
  .ciu_rst_b                        (cpurst_b                        ),
  .dtu_tdt_dm_halted                (dtu_tdt_dm_halted               ),
  .dtu_tdt_dm_havereset             (dtu_tdt_dm_havereset            ),
  .dtu_tdt_dm_itr_done              (dtu_tdt_dm_itr_done             ),
  .dtu_tdt_dm_retire_debug_expt_vld (dtu_tdt_dm_retire_debug_expt_vld),
  .dtu_tdt_dm_rx_data               (dtu_tdt_dm_rx_data              ),
  .dtu_tdt_dm_wr_ready              (dtu_tdt_dm_wr_ready             ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .pad_tdt_dm_core_unavail          (pad_tdt_dm_core_unavail         ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .pad_yy_scan_mode                 (pad_yy_scan_mode                ),
  .pad_yy_scan_rst_b                (pad_yy_scan_rst_b               ),
  .sys_apb_clk                      (sys_apb_clk                     ),
  .sys_apb_rst_b                    (sync_sys_apb_rst_b              ),
  .sys_bus_clk_en                   (clk_en_f                        ),
  .tdt_dm_dtu_ack_havereset         (tdt_dm_dtu_ack_havereset        ),
  .tdt_dm_dtu_async_halt_req        (tdt_dm_dtu_async_halt_req       ),
  .tdt_dm_dtu_halt_on_reset         (tdt_dm_dtu_halt_on_reset        ),
  .tdt_dm_dtu_halt_req              (tdt_dm_dtu_halt_req             ),
  .tdt_dm_dtu_halt_req_cause        (tdt_dm_dtu_halt_req_cause       ),
  .tdt_dm_dtu_itr                   (tdt_dm_dtu_itr                  ),
  .tdt_dm_dtu_itr_vld               (tdt_dm_dtu_itr_vld              ),
  .tdt_dm_dtu_resume_req            (tdt_dm_dtu_resume_req           ),
  .tdt_dm_dtu_wdata                 (tdt_dm_dtu_wdata                ),
  .tdt_dm_dtu_wr_flg                (tdt_dm_dtu_wr_flg               ),
  .tdt_dm_dtu_wr_vld                (tdt_dm_dtu_wr_vld               ),
  .tdt_dm_pad_hartreset_n           (tdt_dm_pad_hartreset_n          ),
  .tdt_dm_pad_ndmreset_n            (tdt_dm_pad_ndmreset_n           ),
  .tdt_dmi_paddr                    (tdt_dmi_paddr                   ),
  .tdt_dmi_penable                  (tdt_dmi_penable                 ),
  .tdt_dmi_prdata                   (tdt_dmi_prdata                  ),
  .tdt_dmi_pready                   (tdt_dmi_pready                  ),
  .tdt_dmi_psel                     (tdt_dmi_psel                    ),
  .tdt_dmi_pslverr                  (tdt_dmi_pslverr                 ),
  .tdt_dmi_pwdata                   (tdt_dmi_pwdata                  ),
  .tdt_dmi_pwrite                   (tdt_dmi_pwrite                  )
);

// &Connect(.ciu_rst_b (cpurst_b)); @51
// &Connect(.sys_apb_clk (sys_apb_clk)); @52
// &Connect(.sys_apb_rst_b (sync_sys_apb_rst_b)); @53
// &Connect(.sys_bus_clk_en    (axim_clk_en_f)); @55
// &Connect(.sys_bus_clk_en    (clk_en_f)); @57
//scan chain
//make sure whether to delete this pin
// &Force("nonport", "tdt_dm_dtu_halt_req_cause"); @61
// &Instance("tdt_top_dummy"); @63
// &Connect(.ciu_rst_b (cpurst_b)); @64
// &Connect(.sys_apb_clk (sys_apb_clk)); @65
// &Connect(.sys_apb_rst_b (sys_apb_rst_b)); @66
// &Connect(.sys_bus_clk_en (1'b0)); @67
// &Force("nonport", "tdt_dm_dtu_halt_req_cause"); @69
//==========================================================
//  Instance CLOCK and RST module 
//==========================================================
// &Instance("pa_clkrst_top"); @74
pa_clkrst_top  x_pa_clkrst_top (
  .clk_en             (clk_en            ),
  .clk_en_f           (clk_en_f          ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .pad_yy_scan_mode   (pad_yy_scan_mode  ),
  .pad_yy_scan_rst_b  (pad_yy_scan_rst_b ),
  .pll_core_cpuclk    (pll_core_cpuclk   ),
  .sync_sys_apb_rst_b (sync_sys_apb_rst_b),
  .sys_apb_clk        (sys_apb_clk       ),
  .sys_apb_rst_b      (sys_apb_rst_b     )
);


//==========================================================
//  Instance TCIPIF module 
//==========================================================
// &Instance("pa_tcipif_top"); @80
pa_tcipif_top  x_pa_tcipif_top (
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
  .clic_cpu_int_hv             (clic_cpu_int_hv            ),
  .clic_cpu_int_id             (clic_cpu_int_id            ),
  .clic_cpu_int_il             (clic_cpu_int_il            ),
  .clic_cpu_int_priv           (clic_cpu_int_priv          ),
  .cp0_biu_icg_en              (cp0_biu_icg_en             ),
  .cp0_yy_priv_mode            (cp0_yy_priv_mode           ),
  .cpu_clic_curid              (cpu_clic_curid             ),
  .cpu_clic_int_exit           (cpu_clic_int_exit          ),
  .cpurst_b                    (cpurst_b                   ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ifu_clic_warm_up            (ifu_clic_warm_up           ),
  .pad_clic_int_vld            (pad_clic_int_vld           ),
  .pad_cpu_tcip_base           (pad_cpu_tcip_base          ),
  .pad_yy_dft_clk_rst_b        (pad_yy_dft_clk_rst_b       ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .pad_yy_scan_mode            (pad_yy_scan_mode           ),
  .rtu_yy_xx_dbgon             (rtu_yy_xx_dbgon            ),
  .sysio_clint_me_int          (sysio_clint_me_int         ),
  .sysio_clint_mtime           (sysio_clint_mtime          ),
  .sysmap_tcipif_cmplt         (sysmap_tcipif_cmplt        ),
  .sysmap_tcipif_rdata         (sysmap_tcipif_rdata        ),
  .tcip_cp0_clic_base          (tcip_cp0_clic_base         ),
  .tcipif_bmu_dbus_acc_err     (tcipif_bmu_dbus_acc_err    ),
  .tcipif_bmu_dbus_data        (tcipif_bmu_dbus_data       ),
  .tcipif_bmu_dbus_grnt        (tcipif_bmu_dbus_grnt       ),
  .tcipif_bmu_dbus_trans_cmplt (tcipif_bmu_dbus_trans_cmplt),
  .tcipif_bmu_ibus_acc_err     (tcipif_bmu_ibus_acc_err    ),
  .tcipif_bmu_ibus_data        (tcipif_bmu_ibus_data       ),
  .tcipif_bmu_ibus_grnt        (tcipif_bmu_ibus_grnt       ),
  .tcipif_bmu_ibus_trans_cmplt (tcipif_bmu_ibus_trans_cmplt),
  .tcipif_sysmap_addr          (tcipif_sysmap_addr         ),
  .tcipif_sysmap_sel           (tcipif_sysmap_sel          ),
  .tcipif_sysmap_wdata         (tcipif_sysmap_wdata        ),
  .tcipif_sysmap_write         (tcipif_sysmap_write        )
);

// &Instance("pa_tcipif_top_dummy"); @82


// &Force("input", "pad_cpu_nmi"); @90
// &Force("input", "pad_cpu_rst_addr"); &Force("bus", "pad_cpu_rst_addr", 31, 0); @91
// &Force("input", "pad_cpu_wakeup_event"); @92

// &Force("nonport", "sysio_pad_srst"); @94

// &Force("output","biu_pad_arvalid"); @98
// &Force("output","biu_pad_rready"); @99
// &Force("output","biu_pad_awvalid"); @100
// &Force("output","biu_pad_bready"); @101
// &Force("output","cpu_pad_dfs_ack"); @102
// &Force("output","pahbl_pad_htrans"); @103
// &Force("input","pad_biu_arready"); @104
// &Force("input","pad_biu_rvalid"); @105
// &Force("input","pad_biu_rlast"); @106
// &Force("input","pad_pahbl_hready"); @107
// &Force("input","pad_biu_bvalid"); @108
// &Force("input","pad_biu_awready"); @109
// &Force("nonport","fencei_icache_inv_done"); @184
// &Force("nonport","lpmd_all_done"); @185
// &Force("nonport","srst_special_srst_cmplt"); @186

// &ModuleEnd; @191
endmodule


