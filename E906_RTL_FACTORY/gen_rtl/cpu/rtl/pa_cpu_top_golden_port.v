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
module pa_cpu_top_golden_port(
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

// &Ports @3
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


// &Force("input", "pad_yy_scan_mode"); @5
// &Force("input", "pad_yy_scan_enable"); @6
// &Force("input", "pad_yy_scan_rst_b"); @8
// &Force("input", "pad_yy_icg_scan_en"); @9
// &Force("input", "pad_yy_gate_clk_en_b"); @11
// &Force("input","mem_cfg_in"); &Force("bus", "mem_cfg_in",`MEM_CFG_IN_WIDTH-1,0); @15

// &Force("input","mem_cfg_in"); &Force("bus", "mem_cfg_in",`MEM_CFG_IN_WIDTH-1,0); @21

// &Force("input","mem_cfg_in"); &Force("bus", "mem_cfg_in",`MEM_CFG_IN_WIDTH-1,0); @27

// &Force("input", "clk_en"); @33
// &Force("input", "ilite_clk_en"); @36
// &Force("input", "dlite_clk_en"); @39
// &Force("input", "pad_bmu_dahbl_base");        &Force("bus", "pad_bmu_dahbl_base", 11, 0); @43
// &Force("input", "pad_bmu_dahbl_mask");        &Force("bus", "pad_bmu_dahbl_mask", 11, 0); @44
// &Force("input", "pad_dahbl_hrdata");          &Force("bus", "pad_dahbl_hrdata", 31, 0); @45
// &Force("input", "pad_dahbl_hready"); @46
// &Force("input", "pad_dahbl_hresp"); @47
// &Force("output", "dahbl_pad_haddr");          &Force("bus", "dahbl_pad_haddr",31,0); @48
// &Force("output", "dahbl_pad_hburst");         &Force("bus", "dahbl_pad_hburst",2,0); @49
// &Force("output", "dahbl_pad_hprot");          &Force("bus", "dahbl_pad_hprot",3,0); @50
// &Force("output", "dahbl_pad_hsize");          &Force("bus", "dahbl_pad_hsize",2,0); @51
// &Force("output", "dahbl_pad_htrans");         &Force("bus", "dahbl_pad_htrans",1,0); @52
// &Force("output", "dahbl_pad_hwdata");         &Force("bus", "dahbl_pad_hwdata",31,0); @53
// &Force("output", "dahbl_pad_hwrite"); @54
// &Force("output", "dahbl_pad_hlock"); @55
// &Force("input", "pad_bmu_iahbl_base");        &Force("bus", "pad_bmu_iahbl_base", 11, 0); @58
// &Force("input", "pad_bmu_iahbl_mask");        &Force("bus", "pad_bmu_iahbl_mask", 11, 0); @59
// &Force("input", "pad_iahbl_hrdata");          &Force("bus", "pad_iahbl_hrdata", 31, 0); @60
// &Force("input", "pad_iahbl_hready"); @61
// &Force("input", "pad_iahbl_hresp"); @62
// &Force("output", "iahbl_pad_haddr");          &Force("bus", "iahbl_pad_haddr",31,0); @63
// &Force("output", "iahbl_pad_hburst");         &Force("bus", "iahbl_pad_hburst",2,0); @64
// &Force("output", "iahbl_pad_hprot");          &Force("bus", "iahbl_pad_hprot",3,0); @65
// &Force("output", "iahbl_pad_hsize");          &Force("bus", "iahbl_pad_hsize",2,0); @66
// &Force("output", "iahbl_pad_htrans");         &Force("bus", "iahbl_pad_htrans",1,0); @67
// &Force("output", "iahbl_pad_hwdata");         &Force("bus", "iahbl_pad_hwdata",31,0); @68
// &Force("output", "iahbl_pad_hwrite"); @69
// &Force("output", "iahbl_pad_hlock"); @70

// &Force("input", "pad_cpu_dfs_req"); @73
// &Force("output", "cpu_pad_dfs_ack"); @74

// &Force("input", "axim_clk_en"); @78
// &Force("input", "pad_biu_arready"); @79
// &Force("input", "pad_biu_awready"); @80
// &Force("input", "pad_biu_wready"); @81
// &Force("input", "pad_biu_rvalid"); @82
// &Force("input", "pad_biu_rlast"); @83
// &Force("input", "pad_biu_rid");              &Force("bus", "pad_biu_rid",7,0); @84
// &Force("input", "pad_biu_rresp");            &Force("bus", "pad_biu_rresp",1,0); @85
// &Force("input", "pad_biu_rdata");            &Force("bus", "pad_biu_rdata",63,0); @86
// &Force("input", "pad_biu_bvalid"); @87
// &Force("input", "pad_biu_bid");              &Force("bus", "pad_biu_bid",7,0); @88
// &Force("input", "pad_biu_bresp");            &Force("bus", "pad_biu_bresp",1,0); @89
// &Force("input", "pad_cpu_tcip_base");        &Force("bus", "pad_cpu_tcip_base",31,0); @90
// &Force("output", "biu_pad_araddr");          &Force("bus", "biu_pad_araddr",31,0); @92
// &Force("output", "biu_pad_arburst");         &Force("bus", "biu_pad_arburst",1,0); @93
// &Force("output", "biu_pad_arcache");         &Force("bus", "biu_pad_arcache",3,0); @94
// &Force("output", "biu_pad_arid");            &Force("bus", "biu_pad_arid",7,0); @95
// &Force("output", "biu_pad_arlen");           &Force("bus", "biu_pad_arlen",7,0); @96
// &Force("output", "biu_pad_arlock"); @97
// &Force("output", "biu_pad_arprot");          &Force("bus", "biu_pad_arprot",2,0); @98
// &Force("output", "biu_pad_arsize");          &Force("bus", "biu_pad_arsize",2,0); @99
// &Force("output", "biu_pad_arvalid"); @100
// &Force("output", "biu_pad_awaddr");          &Force("bus", "biu_pad_awaddr",31,0); @101
// &Force("output", "biu_pad_awburst");         &Force("bus", "biu_pad_awburst",1,0);  @102
// &Force("output", "biu_pad_awcache");         &Force("bus", "biu_pad_awcache",3,0); @103
// &Force("output", "biu_pad_awid");            &Force("bus", "biu_pad_awid",7,0); @104
// &Force("output", "biu_pad_awlen");           &Force("bus", "biu_pad_awlen",7,0); @105
// &Force("output", "biu_pad_awlock");           @106
// &Force("output", "biu_pad_awprot");          &Force("bus", "biu_pad_awprot",2,0); @107
// &Force("output", "biu_pad_awsize");          &Force("bus", "biu_pad_awsize",2,0);    @108
// &Force("output", "biu_pad_awvalid"); @109
// &Force("output", "biu_pad_bready"); @110
// &Force("output", "biu_pad_rready"); @111
// &Force("output", "biu_pad_wdata");           &Force("bus", "biu_pad_wdata",63,0); @112
// &Force("output", "biu_pad_wlast"); @113
// &Force("output", "biu_pad_wstrb");           &Force("bus", "biu_pad_wstrb",7,0); @114
// &Force("output", "biu_pad_wvalid"); @115
// &Force("input", "pahbl_clk_en"); @118
// &Force("input", "pad_cpu_pahbl_base");        &Force("bus", "pad_cpu_pahbl_base", 11, 0); @119
// &Force("input", "pad_cpu_pahbl_mask");        &Force("bus", "pad_cpu_pahbl_mask", 11, 0); @120
// &Force("input", "pad_pahbl_hrdata");          &Force("bus", "pad_pahbl_hrdata", 31, 0); @121
// &Force("input", "pad_pahbl_hready"); @122
// &Force("input", "pad_pahbl_hresp"); @123
// &Force("input", "pad_pahbl_hexok"); @124
// &Force("output", "pahbl_pad_haddr");          &Force("bus", "pahbl_pad_haddr",31,0); @125
// &Force("output", "pahbl_pad_hburst");         &Force("bus", "pahbl_pad_hburst",2,0); @126
// &Force("output", "pahbl_pad_hprot");          &Force("bus", "pahbl_pad_hprot",6,0); @127
// &Force("output", "pahbl_pad_hsize");          &Force("bus", "pahbl_pad_hsize",2,0); @128
// &Force("output", "pahbl_pad_htrans");         &Force("bus", "pahbl_pad_htrans",1,0); @129
// &Force("output", "pahbl_pad_hwdata");         &Force("bus", "pahbl_pad_hwdata",31,0); @130
// &Force("output", "pahbl_pad_hwrite"); @131
// &Force("output", "pahbl_pad_hmastlock"); @132
// &Force("output", "pahbl_pad_hmaster");        &Force("bus", "pahbl_pad_hmaster",3,0); @133
// &Force("output", "pahbl_pad_hexcl");   @134
// &Force("output", "pahbl_pad_hnonsec");   @135
// &Force("input", "pad_biu_hrdata");           &Force("bus", "pad_biu_hrdata", 31, 0); @138
// &Force("input", "pad_biu_hready"); @139
// &Force("input", "pad_biu_hresp"); @140
// &Force("input", "pad_cpu_tcip_base");        &Force("bus", "pad_cpu_tcip_base",31,0); @141

// &Force("output", "biu_pad_haddr");           &Force("bus", "biu_pad_haddr",31,0); @143
// &Force("output", "biu_pad_hburst");          &Force("bus", "biu_pad_hburst",2,0); @144
// &Force("output", "biu_pad_hprot");           &Force("bus", "biu_pad_hprot",3,0); @145
// &Force("output", "biu_pad_hsize");           &Force("bus", "biu_pad_hsize",2,0); @146
// &Force("output", "biu_pad_htrans");          &Force("bus", "biu_pad_htrans",1,0); @147
// &Force("output", "biu_pad_hwdata");          &Force("bus", "biu_pad_hwdata",31,0); @148
// &Force("output", "biu_pad_hwrite"); @149
// &Force("output", "biu_pad_hlock"); @150

// &Force("input", "pll_core_cpuclk"); @153
// &Force("input", "pad_cpu_rst_b"); @154
// &Force("input", "pad_cpu_sys_cnt");          &Force("bus", "pad_cpu_sys_cnt", 63, 0); @155
// &Force("output", "cpu_pad_soft_rst"); &Force("bus", "cpu_pad_soft_rst", 1, 0); @156
// &Force("output", "cpu_pad_lockup"); @157
// &Force("output", "cpu_pad_halted"); @158
// &Force("input", "pad_cpu_nmi"); @159
// &Force("input", "pad_cpu_rst_addr"); &Force("bus", "pad_cpu_rst_addr", 31, 0); @160
// &Force("input", "pad_cpu_wakeup_event"); @161

//==========================================================
//                       TDT Ports
//==========================================================
// &Force("input","tdt_dmi_paddr");                    &Force("bus","tdt_dmi_paddr",11,0); @166
// &Force("input","tdt_dmi_pwrite"); @167
// &Force("input","tdt_dmi_psel"); @169
// &Force("input","tdt_dmi_psel");                     &Force("bus","tdt_dmi_psel",`TDT_COMP_NUM-1,0); @171
// &Force("input","tdt_dmi_penable"); @173
// &Force("input","tdt_dmi_pwdata");                   &Force("bus","tdt_dmi_pwdata",31,0); @174
// &Force("output","tdt_dmi_prdata");                  &Force("bus","tdt_dmi_prdata",`TDT_COMP_NUM*32-1,0); @175
// &Force("output","tdt_dmi_pready");                   @177
// &Force("output","tdt_dmi_pslverr");                  @178
// &Force("output","tdt_dmi_pready");                  &Force("bus","tdt_dmi_pready",`TDT_COMP_NUM-1,0); @180
// &Force("output","tdt_dmi_pslverr");                 &Force("bus","tdt_dmi_pslverr",`TDT_COMP_NUM-1,0); @181
// &Force("output","tdt_dm_pad_ndmreset_n"); @183

// &Force("output","tdt_dm_pad_hartreset_n"); @186
// &Force("input","pad_tdt_dm_core_unavail"); @187
// &Force("output","tdt_dm_pad_hartreset_n");           &Force("bus","tdt_dm_pad_hartreset_n",`TDT_DM_CORE_NUM-1,0); @189
// &Force("input","pad_tdt_dm_core_unavail");          &Force("bus","pad_tdt_dm_core_unavail",`TDT_DM_CORE_NUM-1,0); @190

// &Force("input","sys_apb_rst_b"); @193

// &Force("input","sys_apb_clk"); @195
// &Force("input","sys_apb_clk_en"); @198

// &Force("input","pad_tdt_dm_halt_req");              &Force("bus","pad_tdt_dm_halt_req",`TDT_DM_EXTHALTTRI_NUM-1,0); @202
// &Force("input","pad_tdt_dm_resume_req");            &Force("bus","pad_tdt_dm_resume_req",`TDT_DM_EXTRESUMETRI_NUM-1,0); @203
// &Force("output","tdt_dm_pad_halt_req");             &Force("bus","tdt_dm_pad_halt_req",`TDT_DM_EXTHALTTRI_NUM-1,0); @204
// &Force("output","tdt_dm_pad_resume_req");           &Force("bus","tdt_dm_pad_resume_req",`TDT_DM_EXTRESUMETRI_NUM-1,0); @205

// &Force("output","tdt_dm_pad_awid");                 &Force("bus","tdt_dm_pad_awid",3,0); @209
// &Force("output","tdt_dm_pad_awaddr");               &Force("bus","tdt_dm_pad_awaddr",`TDT_DM_SBAW-1,0); @210
// &Force("output","tdt_dm_pad_awlen");                &Force("bus","tdt_dm_pad_awlen",3,0); @211
// &Force("output","tdt_dm_pad_awsize");               &Force("bus","tdt_dm_pad_awsize",2,0); @212
// &Force("output","tdt_dm_pad_awvalid"); @213
// &Force("input","pad_tdt_dm_awready"); @214
// &Force("output","tdt_dm_pad_wdata");                &Force("bus","tdt_dm_pad_wdata",`TDT_DM_SBA_DW-1,0); @215
// &Force("output","tdt_dm_pad_wvalid"); @216
// &Force("output","tdt_dm_pad_wlast"); @217
// &Force("output","tdt_dm_pad_wstrb");                &Force("bus","tdt_dm_pad_wstrb",`TDT_DM_SBA_BW-1,0); @218
// &Force("input","pad_tdt_dm_wready"); @219
// &Force("output","tdt_dm_pad_bready"); @220
// &Force("input","pad_tdt_dm_bid");                   &Force("bus","pad_tdt_dm_bid",3,0); @221
// &Force("input","pad_tdt_dm_bresp");                 &Force("bus","pad_tdt_dm_bresp",1,0); @222
// &Force("input","pad_tdt_dm_bvalid"); @223
// &Force("output","tdt_dm_pad_arid");                 &Force("bus","tdt_dm_pad_arid",3,0); @225
// &Force("output","tdt_dm_pad_araddr");               &Force("bus","tdt_dm_pad_araddr",`TDT_DM_SBAW-1,0); @226
// &Force("output","tdt_dm_pad_arlen");                &Force("bus","tdt_dm_pad_arlen",3,0); @227
// &Force("output","tdt_dm_pad_arsize");               &Force("bus","tdt_dm_pad_arsize",2,0); @228
// &Force("output","tdt_dm_pad_arvalid"); @229
// &Force("input","pad_tdt_dm_arready"); @230
// &Force("input","pad_tdt_dm_rid");                   &Force("bus","pad_tdt_dm_rid",3,0); @232
// &Force("input","pad_tdt_dm_rdata");                 &Force("bus","pad_tdt_dm_rdata",`TDT_DM_SBA_DW-1,0); @233
// &Force("input","pad_tdt_dm_rvalid"); @234
// &Force("input","pad_tdt_dm_rlast"); @235
// &Force("input","pad_tdt_dm_rresp");                 &Force("bus","pad_tdt_dm_rresp",1,0); @236
// &Force("output","tdt_dm_pad_rready"); @238
// &Force("output","tdt_dm_pad_awburst");              &Force("bus","tdt_dm_pad_awburst",1,0); @240
// &Force("output","tdt_dm_pad_awcache");              &Force("bus","tdt_dm_pad_awcache",3,0); @241
// &Force("output","tdt_dm_pad_awlock");                @242
// &Force("output","tdt_dm_pad_awprot");               &Force("bus","tdt_dm_pad_awprot",2,0); @243
// &Force("output","tdt_dm_pad_arburst");              &Force("bus","tdt_dm_pad_arburst",1,0); @244
// &Force("output","tdt_dm_pad_arcache");              &Force("bus","tdt_dm_pad_arcache",3,0); @245
// &Force("output","tdt_dm_pad_arlock");                @246
// &Force("output","tdt_dm_pad_arprot");               &Force("bus","tdt_dm_pad_arprot",2,0); @247
// &Force("output","tdt_dm_pad_htrans");               &Force("bus","tdt_dm_pad_htrans",1,0); @250
// &Force("output","tdt_dm_pad_haddr");                &Force("bus","tdt_dm_pad_haddr",`TDT_DM_SBAW-1,0); @251
// &Force("output","tdt_dm_pad_hwrite"); @252
// &Force("output","tdt_dm_pad_hburst");               &Force("bus","tdt_dm_pad_hburst",2,0); @253
// &Force("output","tdt_dm_pad_hsize");                &Force("bus","tdt_dm_pad_hsize",2,0); @254
// &Force("output","tdt_dm_pad_hwdata"); @255
// &Force("output","tdt_dm_pad_hprot");                &Force("bus","tdt_dm_pad_hprot",3,0); @256
// &Force("output","tdt_dm_pad_hmastlock");            &Force("bus","tdt_dm_pad_hwdata",`TDT_DM_SBA_DW-1,0); @257
// &Force("input","pad_tdt_dm_hrdata");                &Force("bus","pad_tdt_dm_hrdata",`TDT_DM_SBA_DW-1,0); @258
// &Force("input","pad_tdt_dm_hready"); @259
// &Force("input","pad_tdt_dm_hresp"); @260

// &Force("output", "rtu_pad_inst_retire"); @263
// &Force("output", "rtu_pad_inst_split"); @264
// &Force("output", "rtu_pad_retire_pc");       &Force("bus", "rtu_pad_retire_pc", 31, 0); @265
// &Force("output", "rtu_pad_wb0_data");         &Force("bus", "rtu_pad_wb0_data", 31, 0); @266
// &Force("output", "rtu_pad_wb0_preg");         &Force("bus", "rtu_pad_wb0_preg", 5, 0); @267
// &Force("output", "rtu_pad_wb0_vld"); @268
// &Force("output", "rtu_pad_wb1_data");         &Force("bus", "rtu_pad_wb1_data", 31, 0); @269
// &Force("output", "rtu_pad_wb1_preg");         &Force("bus", "rtu_pad_wb1_preg", 5, 0); @270
// &Force("output", "rtu_pad_wb1_vld"); @271
// &Force("output", "rtu_pad_wb2_data");         &Force("bus", "rtu_pad_wb2_data", 31, 0); @272
// &Force("output", "rtu_pad_wb2_preg");         &Force("bus", "rtu_pad_wb2_preg", 5, 0); @273
// &Force("output", "rtu_pad_wb2_vld"); @274
// &Force("output", "lsu_pad_sc_pass"); @276
// &Force("output", "cp0_pad_mcause");          &Force("bus", "cp0_pad_mcause", 31, 0); @278
// &Force("output", "cp0_pad_mstatus");         &Force("bus", "cp0_pad_mstatus", 31, 0); @279

// &Force("output","sysio_pad_lpmd_b");          &Force("bus", "sysio_pad_lpmd_b", 1, 0); @281
//==========================================================
//                      CLIC Ports
//==========================================================
// &Force("output", "cp0_pad_mintstatus");      &Force("bus", "cp0_pad_mintstatus", 31, 0); @286
// &Force("input", "pad_clic_int_vld");         &Force("bus", "pad_clic_int_vld", `CLIC_INTNUM-1-16, 0); @288

//==========================================================
//                      CLINT Ports
//==========================================================
// &Force("input", "pad_cpu_ext_int_b"); @295

// &Force("input","pad_yy_dft_clk_rst_b"); @298

//==========================================================
//                        FPU Ports
//==========================================================
// &Force("output", "rtu_pad_wb_freg_vld"); @305
// &Force("output", "rtu_pad_wb_freg"); &Force("bus", "rtu_pad_wb_freg", 4, 0); @306
// &Force("output", "rtu_pad_wb_freg_data"); &Force("bus", "rtu_pad_wb_freg_data", 63, 0); @308
// &Force("output", "rtu_pad_wb_freg_data"); &Force("bus", "rtu_pad_wb_freg_data", 31, 0); @310

// &Force("input","pad_cpu_sysmap_addr0"); &Force("bus","pad_cpu_sysmap_addr0",19,0); @314
// &Force("input","pad_cpu_sysmap_addr1"); &Force("bus","pad_cpu_sysmap_addr1",19,0); @315
// &Force("input","pad_cpu_sysmap_addr2"); &Force("bus","pad_cpu_sysmap_addr2",19,0); @316
// &Force("input","pad_cpu_sysmap_addr3"); &Force("bus","pad_cpu_sysmap_addr3",19,0); @317
// &Force("input","pad_cpu_sysmap_addr4"); &Force("bus","pad_cpu_sysmap_addr4",19,0); @318
// &Force("input","pad_cpu_sysmap_addr5"); &Force("bus","pad_cpu_sysmap_addr5",19,0); @319
// &Force("input","pad_cpu_sysmap_addr6"); &Force("bus","pad_cpu_sysmap_addr6",19,0); @320
// &Force("input","pad_cpu_sysmap_addr7"); &Force("bus","pad_cpu_sysmap_addr7",19,0); @321
// &Force("input","pad_cpu_sysmap_addr0_attr"); &Force("bus","pad_cpu_sysmap_addr0_attr",2,0); @322
// &Force("input","pad_cpu_sysmap_addr1_attr"); &Force("bus","pad_cpu_sysmap_addr1_attr",2,0); @323
// &Force("input","pad_cpu_sysmap_addr2_attr"); &Force("bus","pad_cpu_sysmap_addr2_attr",2,0); @324
// &Force("input","pad_cpu_sysmap_addr3_attr"); &Force("bus","pad_cpu_sysmap_addr3_attr",2,0); @325
// &Force("input","pad_cpu_sysmap_addr4_attr"); &Force("bus","pad_cpu_sysmap_addr4_attr",2,0); @326
// &Force("input","pad_cpu_sysmap_addr5_attr"); &Force("bus","pad_cpu_sysmap_addr5_attr",2,0); @327
// &Force("input","pad_cpu_sysmap_addr6_attr"); &Force("bus","pad_cpu_sysmap_addr6_attr",2,0); @328
// &Force("input","pad_cpu_sysmap_addr7_attr"); &Force("bus","pad_cpu_sysmap_addr7_attr",2,0); @329

// &ModuleEnd @331
endmodule



