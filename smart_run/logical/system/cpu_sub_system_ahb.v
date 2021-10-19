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
module cpu_sub_system_ahb(
  biu_pad_haddr,
  biu_pad_hburst,
  biu_pad_hprot,
  biu_pad_hsize,
  biu_pad_htrans,
  biu_pad_hwdata,
  biu_pad_hwrite,
  biu_pad_lpmd_b,
  clk_en,
  corec_pmu_sleep_out,
  cpu_clk,
  had_pad_jtg_tdo,
  nmi_wake_int_lower,
  pad_biu_bigend_b,
  pad_biu_hrdata,
  pad_biu_hready,
  pad_biu_hresp,
  pad_cpu_rst_b,
  pad_had_jtg_tclk,
  pad_had_jtg_tdi,
  pad_had_jtg_tms,
  pad_had_jtg_trst_b,
  pad_vic_int_vld,
  pad_yy_icg_scan_en,
  pad_yy_scan_enable,
  pad_yy_scan_mode,
  pad_yy_scan_rst_b,
  pg_reset_b,
  pmu_corec_isolation,
  pmu_corec_sleep_in,
  sys_rst
);

// &Ports; @23
input            clk_en;                
input            cpu_clk;               
input   [1  :0]  nmi_wake_int_lower;    
input            pad_biu_bigend_b;      
input   [31 :0]  pad_biu_hrdata;        
input            pad_biu_hready;        
input   [1  :0]  pad_biu_hresp;         
input            pad_cpu_rst_b;         
input            pad_had_jtg_tclk;      
input            pad_had_jtg_tdi;       
input            pad_had_jtg_tms;       
input            pad_had_jtg_trst_b;    
input   [31 :0]  pad_vic_int_vld;       
input            pad_yy_icg_scan_en;    
input            pad_yy_scan_enable;    
input            pad_yy_scan_mode;      
input            pad_yy_scan_rst_b;     
input            pg_reset_b;            
input            pmu_corec_isolation;   
input            pmu_corec_sleep_in;    
output  [31 :0]  biu_pad_haddr;         
output  [2  :0]  biu_pad_hburst;        
output  [3  :0]  biu_pad_hprot;         
output  [2  :0]  biu_pad_hsize;         
output  [1  :0]  biu_pad_htrans;        
output  [31 :0]  biu_pad_hwdata;        
output           biu_pad_hwrite;        
output  [1  :0]  biu_pad_lpmd_b;        
output           corec_pmu_sleep_out;   
output           had_pad_jtg_tdo;       
output           sys_rst;               

// &Regs; @24
reg     [1  :0]  biu_addr;              
reg     [1  :0]  biu_size;              
reg              cpu_clk_div2;          
reg     [1  :0]  dahbl_addr;            
reg     [1  :0]  dahbl_size;            
reg     [1  :0]  iahbl_addr;            
reg     [1  :0]  iahbl_size;            
reg     [31 :0]  pad_biu_hrdata_mux;    
reg     [63 :0]  pad_cpu_sys_cnt;       
reg     [31 :0]  pad_dahbl_hrdata_mux;  
reg     [31 :0]  pad_iahbl_hrdata_mux;  

// &Wires; @25
wire    [31 :0]  biu_pad_haddr;         
wire    [2  :0]  biu_pad_hburst;        
wire             biu_pad_hlock;         
wire    [3  :0]  biu_pad_hprot;         
wire    [2  :0]  biu_pad_hsize;         
wire    [1  :0]  biu_pad_htrans;        
wire    [31 :0]  biu_pad_hwdata;        
wire             biu_pad_hwrite;        
wire    [1  :0]  biu_pad_lpmd_b;        
wire             biu_pad_retire;        
wire    [31 :0]  biu_pad_retire_pc;     
wire    [31 :0]  biu_pad_wb1_gpr_data;  
wire             biu_pad_wb1_gpr_en;    
wire    [5  :0]  biu_pad_wb1_gpr_index; 
wire    [31 :0]  biu_pad_wb_gpr_data;   
wire             biu_pad_wb_gpr_en;     
wire    [5  :0]  biu_pad_wb_gpr_index;  
wire             clk_en;                
wire    [31 :0]  cp0_pad_mcause;        
wire    [31 :0]  cp0_pad_mintstatus;    
wire    [31 :0]  cp0_pad_mstatus;       
wire             cpu_clk;               
wire             cpu_pad_dfs_ack;       
wire             cpu_pad_halted;        
wire             cpu_pad_lockup;        
wire    [1  :0]  cpu_pad_soft_rst;      
wire             cpu_rst;               
wire    [31 :0]  dahbl_pad_haddr;       
wire    [2  :0]  dahbl_pad_hburst;      
wire             dahbl_pad_hlock;       
wire    [3  :0]  dahbl_pad_hprot;       
wire    [2  :0]  dahbl_pad_hsize;       
wire    [1  :0]  dahbl_pad_htrans;      
wire    [31 :0]  dahbl_pad_hwdata;      
wire             dahbl_pad_hwrite;      
wire             had_pad_jtg_tdo;       
wire    [31 :0]  iahbl_pad_haddr;       
wire    [2  :0]  iahbl_pad_hburst;      
wire             iahbl_pad_hlock;       
wire    [3  :0]  iahbl_pad_hprot;       
wire    [2  :0]  iahbl_pad_hsize;       
wire    [1  :0]  iahbl_pad_htrans;      
wire    [31 :0]  iahbl_pad_hwdata;      
wire             iahbl_pad_hwrite;      
wire             nmi_req;               
wire    [1  :0]  nmi_wake_int_lower;    
wire             pad_biu_bigend_b;      
wire    [31 :0]  pad_biu_hrdata;        
wire             pad_biu_hready;        
wire    [1  :0]  pad_biu_hresp;         
wire             pad_biu_hresp_0;       
wire    [ 128 - 1 :0]  pad_clic_int_vld;
wire             pad_cpu_dfs_req;       
wire             pad_cpu_ext_int_b;     
wire             pad_cpu_rst_b;         
wire    [31 :0]  pad_dahbl_hrdata;      
wire             pad_dahbl_hready;      
wire    [1  :0]  pad_dahbl_hresp;       
wire             pad_dahbl_hresp_0;     
wire             pad_had_jtg_tclk;      
wire             pad_had_jtg_tdi;       
wire             pad_had_jtg_tms;       
wire             pad_had_jtg_trst_b;    
wire    [31 :0]  pad_iahbl_hrdata;      
wire             pad_iahbl_hready;      
wire    [1  :0]  pad_iahbl_hresp;       
wire             pad_iahbl_hresp_0;     
wire    [31 :0]  pad_vic_int_vld;       
wire             pad_yy_icg_scan_en;    
wire             pad_yy_scan_enable;    
wire             pad_yy_scan_mode;      
wire             pad_yy_scan_rst_b;     
wire             pg_reset_b;            
wire             rtu_pad_inst_split;    
wire    [31 :0]  rtu_pad_wb2_data;      
wire    [5  :0]  rtu_pad_wb2_preg;      
wire             rtu_pad_wb2_vld;       
// wire    [4  :0]  rtu_pad_wb_freg;       
// wire    [63 :0]  rtu_pad_wb_freg_data;  
// wire             rtu_pad_wb_freg_vld;   

wire    [4 :0]  rtu_pad_wb_freg;
wire            rtu_pad_wb_freg_vld;


wire    [31:0]  rtu_pad_wb_freg_data;


wire             sys_rst;               
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
wire             tdt_dtm_pad_tdo_en;    
wire             tdt_dtm_pad_tms_o;     
wire             tdt_dtm_pad_tms_oe;    
wire             wakeup_req;            





// &Force("nonport","cp0_pad_mintstatus"); @35
// &Force("nonport","cp0_pad_mstatus"); @36
// &Instance("E902_181204", "x_e902"); @37
// &Connect(.cp0_pad_psr                (biu_pad_psr           ), @39
//          .iu_pad_gpr_index           (biu_pad_wb_gpr_index  ), @40
//          .iu_pad_gpr_we              (biu_pad_wb_gpr_en     ), @41
//          .iu_pad_inst_retire         (biu_pad_retire        ), @42
//          .iu_pad_retire_pc           (biu_pad_retire_pc     ), @43
//          .pad_biu_hrdata_parity      (1'b0                  ), @44
//          .pad_dahbl_hrdata_parity    (1'b0                  ), @45
//          .pad_iahbl_hrdata_parity    (1'b0                  ), @46
//          .pad_sysio_bigend_b         (pad_biu_bigend_b      ), @47
//          .pad_sysio_clkratio         (pad_biu_clkratio      ),   @48
//          .pad_sysio_gsb              (pad_biu_gsb           ),   @49
//          .pad_clic_int_cfg            (pad_clic_int_cfg     ),  @50
//          .pad_clic_int_vld            (pad_clic_int_vld     ),  @51
//          .pad_ctim_refclk            (1'b0                  ), @52
//          .pad_ctim_calib             (26'b0                 ), @53
//          .pad_bmu_dahbl_base         (12'h200               ), @54
//          .pad_bmu_dahbl_mask         (12'hfff               ), @55
//          .pad_bmu_iahbl_base         (12'h000               ), @56
//          .pad_bmu_iahbl_mask         (12'he00               ), @57
//          .pad_biu_hresp              (pad_biu_hresp_0       ), @58
//          .pad_dahbl_hresp            (pad_dahbl_hresp_0     ), @59
//          .pad_dahbl_hsec             (1'b0                  ), @60
//          .pad_iahbl_hresp            (pad_iahbl_hresp[0]    ), @61
//          .pad_iahbl_hsec             (1'b0                  ), @62
//          .ctim_pad_int_vld           (ctim_int_vld          ),   @63
//          .sysio_pad_dbg_b            (biu_pad_dbg_b         ),   @64
//          .sysio_pad_ipend_b          (biu_pad_ipend_b       ),   @65
//          .sysio_pad_lpmd_b           (biu_pad_lpmd_b        ),   @66
//          .sysio_pad_wakeup_b         (biu_pad_wakeup_b      ),   @67
//          .iu_pad_gpr_data            (biu_pad_wb_gpr_data   ), @68
//          .pll_core_cpuclk            (cpu_clk               ), @69
//          .pad_cpu_rst_b              (pg_reset_b            ), @70
//          .pad_cpu_dfs_req            (1'b0                  ), @71
//          .pll_core_cpuclk_nogated    (cpu_clk               ), @72
//          .pad_sysio_endian_v2        (1'b0                  ), @73
//          .pad_had_rst_b              (pad_had_jtg_trst_b    ), @74
//          .pad_had_jtg_trst_b         (pad_had_jtg_trst_b    ), @75
//          .pad_cpu_gpr_rst_b          (pg_reset_b            ), @76
//          .pad_sysio_clk_unlock       (1'b0                  ),   @77
//          .pad_cpu_secu_dbg_en        (1'b1                  ) @78
// 	  @79
//         ); @80
// &Force("inout","i_pad_jtg_tms"); @85
// &Force("output","pad_had_jtg_tms_i"); @88
// &Force("nonport", "pad_had_jtg_tdi"); @89
// &Force("nonport", "had_pad_jtg_tdo"); @90
// &Force("nonport","pad_cpu_secu_dbg_en"); @95
// &Force("nonport","pad_cpu_secu_dbg_en"); @100
// &Force("bus","pad_biu_hresp","1","0"); @110
// &Force("nonport","sysio_pad_srst"); @111
// &Force("nonport","iu_pad_inst_split"); @112
// &Force("nonport","dahbl_pad_hburst"); @113
// &Force("nonport","dahbl_pad_hprot"); @114
// &Force("nonport","iahbl_pad_hburst"); @115
// &Force("nonport","iahbl_pad_hprot"); @116
// &Force("nonport","had_pad_jdb_pm"); @117
// &Instance("iahb_mem_ctrl", "x_iahb_mem_ctrl"); @121
// &Connect(.lite_yy_haddr   (iahbl_pad_haddr     ), @122
//          .lite_yy_hsize   (iahbl_pad_hsize     ), @123
//          .lite_yy_htrans  (iahbl_pad_htrans    ), @124
//          .lite_yy_hwdata  (iahbl_pad_hwdata    ),  @125
//          .lite_yy_hwrite  (iahbl_pad_hwrite    ), @126
//          .mmc_lite_hrdata (pad_iahbl_hrdata    ),  @127
//          .mmc_lite_hready (pad_iahbl_hready    ), @128
//          .mmc_lite_hresp  (pad_iahbl_hresp     ),  @129
//          .lite_mmc_hsel   (iahbl_pad_htrans[1] ), @130
//          .pll_core_cpuclk (cpu_clk             ) @131
//         ); @132

//*********************** E906 *************************
//&Instance("S902_1808102", "x_s902");

// assign pad_clic_int_vld = {{128 - 32{1'b0}},pad_vic_int_vld[31:0]};

assign pad_clic_int_vld[ 31 : 0] = pad_vic_int_vld[ 31 : 0];

assign pad_clic_int_vld[128 - 1 : 32] = 'h0;

assign pad_cpu_ext_int_b  =1'b1;

// //&Force("input","pad_vic_int_cfg"); @145
// &Force("nonport","cp0_pad_mintstatus"); @146
// &Force("nonport","cp0_pad_mstatus"); @147
// &Instance("E906_TOP", "x_e906"); @148
openE906  x_e906_top (
  .biu_pad_haddr             (biu_pad_haddr            ),
  .biu_pad_hburst            (biu_pad_hburst           ),
  .biu_pad_hlock             (biu_pad_hlock            ),
  .biu_pad_hprot             (biu_pad_hprot            ),
  .biu_pad_hsize             (biu_pad_hsize            ),
  .biu_pad_htrans            (biu_pad_htrans           ),
  .biu_pad_hwdata            (biu_pad_hwdata           ),
  .biu_pad_hwrite            (biu_pad_hwrite           ),
  .clk_en                    (clk_en                   ),
  .cp0_pad_mcause            (cp0_pad_mcause           ),
  .cp0_pad_mintstatus        (cp0_pad_mintstatus       ),
  .cp0_pad_mstatus           (cp0_pad_mstatus          ),
  .cpu_pad_dfs_ack           (cpu_pad_dfs_ack          ),
  .cpu_pad_halted            (cpu_pad_halted           ),
  .cpu_pad_lockup            (cpu_pad_lockup           ),
  .cpu_pad_soft_rst          (cpu_pad_soft_rst         ),
  .dahbl_pad_haddr           (dahbl_pad_haddr          ),
  .dahbl_pad_hburst          (dahbl_pad_hburst         ),
  .dahbl_pad_hlock           (dahbl_pad_hlock          ),
  .dahbl_pad_hprot           (dahbl_pad_hprot          ),
  .dahbl_pad_hsize           (dahbl_pad_hsize          ),
  .dahbl_pad_htrans          (dahbl_pad_htrans         ),
  .dahbl_pad_hwdata          (dahbl_pad_hwdata         ),
  .dahbl_pad_hwrite          (dahbl_pad_hwrite         ),
  .iahbl_pad_haddr           (iahbl_pad_haddr          ),
  .iahbl_pad_hburst          (iahbl_pad_hburst         ),
  .iahbl_pad_hlock           (iahbl_pad_hlock          ),
  .iahbl_pad_hprot           (iahbl_pad_hprot          ),
  .iahbl_pad_hsize           (iahbl_pad_hsize          ),
  .iahbl_pad_htrans          (iahbl_pad_htrans         ),
  .iahbl_pad_hwdata          (iahbl_pad_hwdata         ),
  .iahbl_pad_hwrite          (iahbl_pad_hwrite         ),
  .pad_biu_hrdata            (pad_biu_hrdata_mux       ),
  .pad_biu_hready            (pad_biu_hready           ),
  .pad_biu_hresp             (pad_biu_hresp_0          ),
  .pad_bmu_dahbl_base        (12'h200                  ),
  .pad_bmu_dahbl_mask        (12'hfff                  ),
  .pad_bmu_iahbl_base        (12'h000                  ),
  .pad_bmu_iahbl_mask        (12'he00                  ),
  .pad_clic_int_vld          (pad_clic_int_vld         ),
  .pad_cpu_dfs_req           (pad_cpu_dfs_req          ),
  .pad_cpu_ext_int_b         (pad_cpu_ext_int_b        ),
  .pad_cpu_nmi               (nmi_req                  ),
  .pad_cpu_rst_addr          (32'h0000_0000            ),
  .pad_cpu_rst_b             (cpu_rst                  ),
  .pad_cpu_sys_cnt           (pad_cpu_sys_cnt          ),
  .pad_cpu_sysmap_addr0      (20'h20000                ),
  .pad_cpu_sysmap_addr0_attr (3'b011                   ),
  .pad_cpu_sysmap_addr1      (20'h30000                ),
  .pad_cpu_sysmap_addr1_attr (3'b011                   ),
  .pad_cpu_sysmap_addr2      (20'h40000                ),
  .pad_cpu_sysmap_addr2_attr (3'b000                   ),
  .pad_cpu_sysmap_addr3      (20'h50000                ),
  .pad_cpu_sysmap_addr3_attr (3'b100                   ),
  .pad_cpu_sysmap_addr4      (20'h60000                ),
  .pad_cpu_sysmap_addr4_attr (3'b000                   ),
  .pad_cpu_sysmap_addr5      (20'h70000                ),
  .pad_cpu_sysmap_addr5_attr (3'b100                   ),
  .pad_cpu_sysmap_addr6      (20'he0000                ),
  .pad_cpu_sysmap_addr6_attr (3'b000                   ),
  .pad_cpu_sysmap_addr7      (20'hfffff                ),
  .pad_cpu_sysmap_addr7_attr (3'b100                   ),
  .pad_cpu_tcip_base         (32'he000_0000            ),
  .pad_cpu_wakeup_event      (wakeup_req               ),
  .pad_dahbl_hrdata          (pad_dahbl_hrdata_mux     ),
  .pad_dahbl_hready          (pad_dahbl_hready         ),
  .pad_dahbl_hresp           (pad_dahbl_hresp_0        ),
  .pad_iahbl_hrdata          (pad_iahbl_hrdata_mux     ),
  .pad_iahbl_hready          (pad_iahbl_hready         ),
  .pad_iahbl_hresp           (pad_iahbl_hresp_0        ),
  .pad_tdt_dm_core_unavail   (1'b0                     ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .pad_yy_scan_enable        (pad_yy_scan_enable       ),
  .pad_yy_scan_mode          (pad_yy_scan_mode         ),
  .pad_yy_scan_rst_b         (pad_yy_scan_rst_b        ),
  .pll_core_cpuclk           (cpu_clk                  ),
  .rtu_pad_inst_retire       (biu_pad_retire           ),
  .rtu_pad_inst_split        (rtu_pad_inst_split       ),
  .rtu_pad_retire_pc         (biu_pad_retire_pc        ),
  .rtu_pad_wb0_data          (biu_pad_wb_gpr_data      ),
  .rtu_pad_wb0_preg          (biu_pad_wb_gpr_index     ),
  .rtu_pad_wb0_vld           (biu_pad_wb_gpr_en        ),
  .rtu_pad_wb1_data          (biu_pad_wb1_gpr_data     ),
  .rtu_pad_wb1_preg          (biu_pad_wb1_gpr_index    ),
  .rtu_pad_wb1_vld           (biu_pad_wb1_gpr_en       ),
  .rtu_pad_wb2_data          (rtu_pad_wb2_data         ),
  .rtu_pad_wb2_preg          (rtu_pad_wb2_preg         ),
  .rtu_pad_wb2_vld           (rtu_pad_wb2_vld          ),

  .rtu_pad_wb_freg           (rtu_pad_wb_freg          ),
.rtu_pad_wb_freg_data      (rtu_pad_wb_freg_data     ),
.rtu_pad_wb_freg_vld       (rtu_pad_wb_freg_vld      ),


  // .rtu_pad_wb_freg           (rtu_pad_wb_freg          ),
  // .rtu_pad_wb_freg_data      (rtu_pad_wb_freg_data     ),
  // .rtu_pad_wb_freg_vld       (rtu_pad_wb_freg_vld      ),
  .sys_apb_clk               (cpu_clk_div2             ),
  .sys_apb_rst_b             (pad_cpu_rst_b            ),
  .sysio_pad_lpmd_b          (biu_pad_lpmd_b           ),
  .tdt_dm_pad_hartreset_n    (tdt_dm_pad_hartreset_n   ),
  .tdt_dm_pad_ndmreset_n     (tdt_dm_pad_ndmreset_n    ),

  

  

  .pad_yy_dft_clk_rst_b      (1'b1                     ),


  .tdt_dmi_paddr             (tdt_dmi_paddr            ),
  .tdt_dmi_penable           (tdt_dmi_penable          ),
  .tdt_dmi_prdata            (tdt_dmi_prdata           ),
  .tdt_dmi_pready            (tdt_dmi_pready           ),
  .tdt_dmi_psel              (tdt_dmi_psel             ),
  .tdt_dmi_pslverr           (tdt_dmi_pslverr          ),
  .tdt_dmi_pwdata            (tdt_dmi_pwdata           ),
  .tdt_dmi_pwrite            (tdt_dmi_pwrite           )
);

// &Connect(.rtu_pad_wb0_preg           (biu_pad_wb_gpr_index  ), @149
//          .rtu_pad_wb0_vld            (biu_pad_wb_gpr_en     ), @150
//          .rtu_pad_wb0_data           (biu_pad_wb_gpr_data   ), @151
//          .rtu_pad_wb1_preg           (biu_pad_wb1_gpr_index ), @152
//          .rtu_pad_wb1_vld            (biu_pad_wb1_gpr_en    ), @153
//          .rtu_pad_wb1_data           (biu_pad_wb1_gpr_data  ), @154
//          .rtu_pad_inst_retire        (biu_pad_retire        ), @155
//          .rtu_pad_retire_pc          (biu_pad_retire_pc     ), @156
//          .pad_clic_int_vld           (pad_clic_int_vld      ),  @157
//          .pad_cpu_sys_cnt            (pad_cpu_sys_cnt       ),  @158
//          .pad_bmu_dahbl_base         (12'h200               ), @159
//          .pad_bmu_dahbl_mask         (12'hfff               ), @160
//          .pad_bmu_iahbl_base         (12'h000               ), @161
//          .pad_bmu_iahbl_mask         (12'he00               ), @162
//          .pad_biu_hresp              (pad_biu_hresp_0       ), @163
//          .pad_biu_hrdata             (pad_biu_hrdata_mux    ), @164
//          .pad_iahbl_hrdata           (pad_iahbl_hrdata_mux  ), @165
//          .pad_dahbl_hrdata           (pad_dahbl_hrdata_mux  ), @166
//          .pad_dahbl_hresp            (pad_dahbl_hresp_0     ), @167
//          .pad_iahbl_hresp            (pad_iahbl_hresp_0     ), @168
//          .sysio_pad_lpmd_b           (biu_pad_lpmd_b        ),   @169
//          .pll_core_cpuclk            (cpu_clk               ), @170
//          .pad_cpu_rst_b              (cpu_rst               ), @171
//          .ilite_clk_en               (clk_en                ), @172
//          .dlite_clk_en               (clk_en                ), @173
//          .pad_cpu_dfs_req            (pad_cpu_dfs_req       ), @174
//          //.pad_had_rst_b              (had_rst               ), @175
//          .pad_had_jtg_trst_b         (pad_had_jtg_trst_b    ), @176
//          .cpu_pad_lockup             (cpu_pad_lockup        ), @177
//          .cpu_pad_soft_rst           (cpu_pad_soft_rst      ), @178
//          .pad_cpu_nmi                (nmi_req               ), @179
//          .pad_cpu_wakeup_event       (wakeup_req            ), @180
//          .pad_cpu_rst_addr           (32'h0                 ), @181
//          .pad_cpu_sysmap_addr0 (20'h20000), @182
//          .pad_cpu_sysmap_addr0_attr (3'b011), @183
//          .pad_cpu_sysmap_addr1 (20'h30000), @184
//          .pad_cpu_sysmap_addr1_attr (3'b011), @185
//          .pad_cpu_sysmap_addr2 (20'h40000), @186
//          .pad_cpu_sysmap_addr2_attr (3'b000), @187
//          .pad_cpu_sysmap_addr3 (20'h50000), @188
//          .pad_cpu_sysmap_addr3_attr (3'b100), @189
//          .pad_cpu_sysmap_addr4 (20'h60000), @190
//          .pad_cpu_sysmap_addr4_attr (3'b000), @191
//          .pad_cpu_sysmap_addr5 (20'h70000), @192
//          .pad_cpu_sysmap_addr5_attr (3'b100), @193
//          .pad_cpu_sysmap_addr6 (20'he0000), @194
//          .pad_cpu_sysmap_addr6_attr (3'b000), @195
//          .pad_cpu_sysmap_addr7 (20'hfffff), @196
//          .pad_cpu_sysmap_addr7_attr (3'b100), @197
//          .pad_cpu_tcip_base (32'he000_0000), @198
//          .pad_tdt_dm_core_unavail (1'b0), @199
//          .sys_apb_clk (cpu_clk_div2), @200
//          .sys_apb_rst_b (pad_cpu_rst_b), @201
//         ); @202
        
always@(posedge cpu_clk or negedge pad_cpu_rst_b) begin
  if(!pad_cpu_rst_b)
    cpu_clk_div2 <= 1'b0;
  else
    cpu_clk_div2 <= ~cpu_clk_div2;
end

// &Force("nonport","cpu_pad_soft_rst"); @211

// &Instance("tdt_dmi_top_FPGA","x_tdt_dmi_top"); @213
tdt_dmi_top  x_tdt_dmi_top (
`ifdef SELECT_2_WIRE_JTAG
  .pad_tdt_dtm_jtag2_sel (1'b1                 ),
`else
  .pad_tdt_dtm_jtag2_sel (1'b0                 ),
`endif
  .pad_tdt_dtm_tap_en    (1'b1                 ),
  .pad_tdt_dtm_tclk      (pad_had_jtg_tclk     ),
  .pad_tdt_dtm_tdi       (pad_had_jtg_tdi      ),
  .pad_tdt_dtm_tms_i     (pad_had_jtg_tms      ),
  .pad_tdt_dtm_trst_b    (pad_had_jtg_trst_b   ),
  .pad_tdt_icg_scan_en   (1'b0                 ),
  .pad_yy_scan_mode      (1'b0                 ),
  .pad_yy_scan_rst_b     (1'b1                 ),
  .sys_apb_clk           (cpu_clk_div2         ),
  .sys_apb_rst_b         (pad_cpu_rst_b        ),
  .tdt_dmi_paddr         (tdt_dmi_paddr        ),
  .tdt_dmi_penable       (tdt_dmi_penable      ),
  .tdt_dmi_prdata        (tdt_dmi_prdata       ),
  .tdt_dmi_pready        (tdt_dmi_pready       ),
  .tdt_dmi_psel          (tdt_dmi_psel         ),
  .tdt_dmi_pslverr       (tdt_dmi_pslverr      ),
  .tdt_dmi_pwdata        (tdt_dmi_pwdata       ),
  .tdt_dmi_pwrite        (tdt_dmi_pwrite       ),
  .tdt_dtm_pad_tdo       (had_pad_jtg_tdo      ),
  .tdt_dtm_pad_tdo_en    (tdt_dtm_pad_tdo_en   ),
  .tdt_dtm_pad_tms_o     (tdt_dtm_pad_tms_o    ),
  .tdt_dtm_pad_tms_oe    (tdt_dtm_pad_tms_oe   )
);

// &Connect(.pad_tdt_icg_scan_en (1'b0), @214
//          .sys_apb_clk  (cpu_clk_div2), @215
//          .sys_apb_rst_b (pad_cpu_rst_b), @216
//          .pad_tdt_dtm_jtag2_sel (1'b0), @217
//          .pad_tdt_dtm_tap_en (1'b1), @218
//          .tdt_dtm_pad_tdo (had_pad_jtg_tdo), @219
//          .pad_tdt_dtm_tclk (pad_had_jtg_tclk), @220
//          .pad_tdt_dtm_tdi (pad_had_jtg_tdi), @221
//          .pad_tdt_dtm_trst_b (pad_had_jtg_trst_b), @222
//          .pad_tdt_dtm_tms_i (pad_had_jtg_tms) @223
// ); @224

// &Force("nonport","tdt_dtm_pad_tdo_en"); @226
// &Force("nonport","tdt_dtm_pad_tms_o"); @227
// &Force("nonport","tdt_dtm_pad_tms_oe"); @228

// &Force("nonport","rtu_pad_wb2_data"); @230
// &Force("nonport","rtu_pad_wb2_preg"); @231
// &Force("nonport","rtu_pad_wb2_vld"); @232
// &Force("nonport","cpu_pad_lockup"); @233
// &Force("nonport","cpu_pad_halted"); @234
assign pad_cpu_dfs_req = 0;
assign nmi_req = nmi_wake_int_lower[0];
assign wakeup_req = nmi_wake_int_lower[1];
//assign clk_en = 1;
// sys cnt
always@(posedge cpu_clk or negedge pg_reset_b)
begin
  if (!pg_reset_b)
    pad_cpu_sys_cnt[63:0] <= 64'b0;
  else
    pad_cpu_sys_cnt[63:0] <= pad_cpu_sys_cnt[63:0] + 1'b1;
end

assign cpu_rst = pg_reset_b & tdt_dm_pad_hartreset_n;
assign sys_rst = tdt_dm_pad_ndmreset_n;
// &Force("output","sys_rst"); @250


// &Force("inout","i_pad_jtg_tms"); @255
// &Force("output","pad_had_jtg_tms_i"); @258
// &Force("nonport", "pad_had_jtg_tdi"); @259
// &Force("nonport", "had_pad_jtg_tdo"); @260

// &Force("nonport","pad_cpu_secu_dbg_en"); @265

// &Force("nonport","pad_cpu_secu_dbg_en"); @270

assign pad_biu_hresp_0 = pad_biu_hresp[0];
always@(posedge cpu_clk or negedge pg_reset_b)
begin
    if(!pg_reset_b) begin
      biu_size[1:0] <= 2'h2;
      biu_addr[1:0] <= 2'b0;
    end
    else if((biu_pad_htrans == 2) && (!biu_pad_hwrite) && pad_biu_hready) begin
      biu_size[1:0] <= biu_pad_hsize[1:0];
      biu_addr[1:0] <= biu_pad_haddr[1:0];
    end
end
always@(*)
begin
    case({biu_size[1:0],biu_addr[1:0]})
        4'b0000:pad_biu_hrdata_mux[31:0] = {24'h0,pad_biu_hrdata[7:0]};
        4'b0001:pad_biu_hrdata_mux[31:0] = {16'h0,pad_biu_hrdata[15:8],8'h0};
        4'b0010:pad_biu_hrdata_mux[31:0] = {8'h0,pad_biu_hrdata[23:16],16'h0};
        4'b0011:pad_biu_hrdata_mux[31:0] = {pad_biu_hrdata[31:24],24'h0};
        4'b0100: pad_biu_hrdata_mux[31:0] = {16'h0,pad_biu_hrdata[15:0]};
        4'b0110: pad_biu_hrdata_mux[31:0] = {pad_biu_hrdata[31:16],16'h0};
        4'b1000: pad_biu_hrdata_mux[31:0] = pad_biu_hrdata[31:0];
        default: pad_biu_hrdata_mux[31:0] = 32'h0;
    endcase
end
// &Force("output","biu_pad_hsize"); @302
// &Force("output","biu_pad_htrans"); @303
// &Force("output","biu_pad_hwrite"); @304
// &Force("output","biu_pad_haddr"); @305
// &Instance("dahb_mem_ctrl", "x_dahb_mem_ctrl"); @307
dahb_mem_ctrl  x_dahb_mem_ctrl (
  .lite_mmc_hsel       (dahbl_pad_htrans[1]),
  .lite_yy_haddr       (dahbl_pad_haddr    ),
  .lite_yy_hsize       (dahbl_pad_hsize    ),
  .lite_yy_htrans      (dahbl_pad_htrans   ),
  .lite_yy_hwdata      (dahbl_pad_hwdata   ),
  .lite_yy_hwrite      (dahbl_pad_hwrite   ),
  .mmc_lite_hrdata     (pad_dahbl_hrdata   ),
  .mmc_lite_hready     (pad_dahbl_hready   ),
  .mmc_lite_hresp      (pad_dahbl_hresp    ),
  .pad_biu_bigend_b    (pad_biu_bigend_b   ),
  .pad_cpu_rst_b       (pad_cpu_rst_b      ),
  .pll_core_cpuclk     (cpu_clk            )
);

// &Connect(.lite_yy_haddr   (dahbl_pad_haddr     ), @308
//          .lite_yy_hsize   (dahbl_pad_hsize     ), @309
//          .lite_yy_htrans  (dahbl_pad_htrans    ), @310
//          .lite_yy_hwdata  (dahbl_pad_hwdata    ), @311
//          .lite_yy_hwrite  (dahbl_pad_hwrite    ), @312
//          .mmc_lite_hrdata (pad_dahbl_hrdata    ), @313
//          .mmc_lite_hready (pad_dahbl_hready    ), @314
//          .mmc_lite_hresp  (pad_dahbl_hresp     ), @315
//          .lite_mmc_hsel   (dahbl_pad_htrans[1] ), @316
//          .pll_core_cpuclk (cpu_clk             ) @317
//  @318
//         ); @319

assign pad_dahbl_hresp_0 = pad_dahbl_hresp[0];
// &Force("nonport","dahbl_pad_hburst"); @322
// &Force("nonport","dahbl_pad_hprot"); @323
always@(posedge cpu_clk or negedge pg_reset_b)
begin
    if(!pg_reset_b) begin
      dahbl_size[1:0] <= 2'h2;
      dahbl_addr[1:0] <= 2'b0;
    end
    else if((dahbl_pad_htrans == 2) && (!dahbl_pad_hwrite) && pad_dahbl_hready) begin
      dahbl_size[1:0] <= dahbl_pad_hsize[1:0];
      dahbl_addr[1:0] <= dahbl_pad_haddr[1:0];
    end
end
always@(*)
begin
    case({dahbl_size[1:0],dahbl_addr[1:0]})
        4'b0000:pad_dahbl_hrdata_mux[31:0] = {24'h0,pad_dahbl_hrdata[7:0]};
        4'b0001:pad_dahbl_hrdata_mux[31:0] = {16'h0,pad_dahbl_hrdata[15:8],8'h0};
        4'b0010:pad_dahbl_hrdata_mux[31:0] = {8'h0,pad_dahbl_hrdata[23:16],16'h0};
        4'b0011:pad_dahbl_hrdata_mux[31:0] = {pad_dahbl_hrdata[31:24],24'h0};
        4'b0100: pad_dahbl_hrdata_mux[31:0] = {16'h0,pad_dahbl_hrdata[15:0]};
        4'b0110: pad_dahbl_hrdata_mux[31:0] = {pad_dahbl_hrdata[31:16],16'h0};
        4'b1000: pad_dahbl_hrdata_mux[31:0] = pad_dahbl_hrdata[31:0];
        default: pad_dahbl_hrdata_mux[31:0] = 32'h0;
    endcase
end

// &Force("bus","pad_biu_hresp","1","0"); @350
// &Force("nonport","sysio_pad_srst"); @351
// &Force("nonport","iu_pad_inst_split"); @352
// &Force("nonport","dahbl_pad_hburst"); @353
// &Force("nonport","dahbl_pad_hprot"); @354
// &Force("nonport","iahbl_pad_hburst"); @355
// &Force("nonport","iahbl_pad_hprot"); @356
// &Force("nonport","had_pad_jdb_pm"); @357
// &Force("nonport","cpu_pad_dfs_ack"); @358
// &Force("nonport","ifu_pad_sw_word"); @359
// &Force("nonport","rtu_pad_inst_split"); @360
//TODO
// &Force("nonport","biu_pad_hlock"); @363
// &Force("nonport","dahbl_pad_hlock"); @364
// &Force("nonport","iahbl_pad_hlock"); @365

// IAHB Lite Memory
// &Instance("iahb_mem_ctrl", "x_iahb_mem_ctrl"); @369
iahb_mem_ctrl  x_iahb_mem_ctrl (
  .lite_mmc_hsel       (iahbl_pad_htrans[1]),
  .lite_yy_haddr       (iahbl_pad_haddr    ),
  .lite_yy_hsize       (iahbl_pad_hsize    ),
  .lite_yy_htrans      (iahbl_pad_htrans   ),
  .lite_yy_hwdata      (iahbl_pad_hwdata   ),
  .lite_yy_hwrite      (iahbl_pad_hwrite   ),
  .mmc_lite_hrdata     (pad_iahbl_hrdata   ),
  .mmc_lite_hready     (pad_iahbl_hready   ),
  .mmc_lite_hresp      (pad_iahbl_hresp    ),
  .pad_biu_bigend_b    (pad_biu_bigend_b   ),
  .pad_cpu_rst_b       (pad_cpu_rst_b      ),
  .pll_core_cpuclk     (cpu_clk            )
);

// &Connect(.lite_yy_haddr   (iahbl_pad_haddr     ), @370
//          .lite_yy_hsize   (iahbl_pad_hsize     ), @371
//          .lite_yy_htrans  (iahbl_pad_htrans    ), @372
//          .lite_yy_hwdata  (iahbl_pad_hwdata    ),  @373
//          .lite_yy_hwrite  (iahbl_pad_hwrite    ), @374
//          .mmc_lite_hrdata (pad_iahbl_hrdata    ),  @375
//          .mmc_lite_hready (pad_iahbl_hready    ), @376
//          .mmc_lite_hresp  (pad_iahbl_hresp     ),  @377
//          .lite_mmc_hsel   (iahbl_pad_htrans[1] ), @378
//          .pll_core_cpuclk (cpu_clk             ) @379
//         ); @380

assign pad_iahbl_hresp_0 = pad_iahbl_hresp[0];
always@(posedge cpu_clk or negedge pg_reset_b)
begin
    if(!pg_reset_b) begin
      iahbl_size[1:0] <= 2'h2;
      iahbl_addr[1:0] <= 2'b0;
    end
    else if((iahbl_pad_htrans == 2) && (!iahbl_pad_hwrite) && pad_iahbl_hready) begin
      iahbl_size[1:0] <= iahbl_pad_hsize[1:0];
      iahbl_addr[1:0] <= iahbl_pad_haddr[1:0];
    end
end
always@(*)
begin
    case({iahbl_size[1:0],iahbl_addr[1:0]})
        4'b0000:pad_iahbl_hrdata_mux[31:0] = {24'h0,pad_iahbl_hrdata[7:0]};
        4'b0001:pad_iahbl_hrdata_mux[31:0] = {16'h0,pad_iahbl_hrdata[15:8],8'h0};
        4'b0010:pad_iahbl_hrdata_mux[31:0] = {8'h0,pad_iahbl_hrdata[23:16],16'h0};
        4'b0011:pad_iahbl_hrdata_mux[31:0] = {pad_iahbl_hrdata[31:24],24'h0};
        4'b0100: pad_iahbl_hrdata_mux[31:0] = {16'h0,pad_iahbl_hrdata[15:0]};
        4'b0110: pad_iahbl_hrdata_mux[31:0] = {pad_iahbl_hrdata[31:16],16'h0};
        4'b1000: pad_iahbl_hrdata_mux[31:0] = pad_iahbl_hrdata[31:0];
        default: pad_iahbl_hrdata_mux[31:0] = 32'h0;
    endcase
end

//****************************************************





// &Force("input", "pmu_corec_isolation"); @416
// &Force("input", "pmu_corec_sleep_in"); @417
// &Force("output", "corec_pmu_sleep_out"); @418

// &Force("nonport","pad_had_jtag2_sel"); @420
// &Force("nonport","sysio_pad_srst"); @421
// &Force("nonport","biu_pad_retire"); @422
// &Force("nonport","biu_pad_retire_pc"); @423
// &Force("nonport","biu_pad_wb_gpr_data"); @424
// &Force("nonport","biu_pad_wb_gpr_en"); @425
// &Force("nonport","biu_pad_wb_gpr_index"); @426
// &Force("nonport","biu_pad_wb1_gpr_data"); @427
// &Force("nonport","biu_pad_wb1_gpr_en"); @428
// &Force("nonport","biu_pad_wb1_gpr_index"); @429
// &Force("nonport","cp0_pad_mcause"); @430
// &Force("nonport","rtu_pad_wb_freg"); @431
// &Force("nonport","rtu_pad_wb_freg_vld"); @432
// &Force("nonport","rtu_pad_wb_freg_data"); @433


// &ModuleEnd; @436
endmodule


