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
module pa_pmp_top(
  cp0_pmp_csr_sel,
  cp0_pmp_csr_wen,
  cp0_pmp_icg_en,
  cp0_pmp_mstatus_mpp,
  cp0_pmp_mstatus_mprv,
  cp0_pmp_updt_data,
  cp0_yy_clk_en,
  cp0_yy_mach_mode,
  cpurst_b,
  forever_cpuclk,
  ifu_pmp_addr,
  ifu_pmp_machine_mode,
  lsu_pmp_addr,
  lsu_pmp_write,
  pad_yy_icg_scan_en,
  pmp_cp0_data,
  pmp_ifu_acc_deny,
  pmp_lsu_acc_deny
);

// &Ports; @25
input   [19:0]  cp0_pmp_csr_sel;         
input           cp0_pmp_csr_wen;         
input           cp0_pmp_icg_en;          
input   [1 :0]  cp0_pmp_mstatus_mpp;     
input           cp0_pmp_mstatus_mprv;    
input   [31:0]  cp0_pmp_updt_data;       
input           cp0_yy_clk_en;           
input           cp0_yy_mach_mode;        
input           cpurst_b;                
input           forever_cpuclk;          
input   [31:0]  ifu_pmp_addr;            
input           ifu_pmp_machine_mode;    
input   [31:0]  lsu_pmp_addr;            
input           lsu_pmp_write;           
input           pad_yy_icg_scan_en;      
output  [31:0]  pmp_cp0_data;            
output          pmp_ifu_acc_deny;        
output          pmp_lsu_acc_deny;        

// &Regs; @26

// &Wires; @27
wire    [19:0]  cp0_pmp_csr_sel;         
wire            cp0_pmp_csr_wen;         
wire            cp0_pmp_icg_en;          
wire    [1 :0]  cp0_pmp_mstatus_mpp;     
wire            cp0_pmp_mstatus_mprv;    
wire    [31:0]  cp0_pmp_updt_data;       
wire            cp0_yy_clk_en;           
wire            cp0_yy_mach_mode;        
wire            cp0_yy_secu_mode_aft_dbg; 
wire            cpuclk;                  
wire            cpurst_b;                
wire            forever_cpuclk;          
wire    [7 :0]  ifu_addr_ge_bottom;      
wire    [31:0]  ifu_pmp_addr;            
wire            ifu_pmp_machine_mode;    
wire    [15:0]  lsu_4k_cross;            
wire    [7 :0]  lsu_addr_ge_bottom;      
wire    [31:0]  lsu_pmp_addr;            
wire            lsu_pmp_write;           
wire            pad_yy_icg_scan_en;      
wire    [31:0]  pmp_cp0_data;            
wire    [19:0]  pmp_csr_wen;             
wire    [15:0]  pmp_entry_lock;          
wire            pmp_ifu_acc_deny;        
wire    [7 :0]  pmp_ifu_hit;             
wire            pmp_lsu_acc_deny;        
wire    [7 :0]  pmp_lsu_hit;             
wire    [25:0]  pmpaddr0_value;          
wire    [25:0]  pmpaddr1_value;          
wire    [25:0]  pmpaddr2_value;          
wire    [25:0]  pmpaddr3_value;          
wire    [25:0]  pmpaddr4_value;          
wire    [25:0]  pmpaddr5_value;          
wire    [25:0]  pmpaddr6_value;          
wire    [25:0]  pmpaddr7_value;          
wire    [1 :0]  regs_comp_addr_mode0;    
wire    [1 :0]  regs_comp_addr_mode1;    
wire    [1 :0]  regs_comp_addr_mode2;    
wire    [1 :0]  regs_comp_addr_mode3;    
wire    [1 :0]  regs_comp_addr_mode4;    
wire    [1 :0]  regs_comp_addr_mode5;    
wire    [1 :0]  regs_comp_addr_mode6;    
wire    [1 :0]  regs_comp_addr_mode7;    
wire            regs_comp_excut0;        
wire            regs_comp_excut1;        
wire            regs_comp_excut2;        
wire            regs_comp_excut3;        
wire            regs_comp_excut4;        
wire            regs_comp_excut5;        
wire            regs_comp_excut6;        
wire            regs_comp_excut7;        
wire            regs_comp_lock0;         
wire            regs_comp_lock1;         
wire            regs_comp_lock10;        
wire            regs_comp_lock11;        
wire            regs_comp_lock12;        
wire            regs_comp_lock13;        
wire            regs_comp_lock14;        
wire            regs_comp_lock15;        
wire            regs_comp_lock2;         
wire            regs_comp_lock3;         
wire            regs_comp_lock4;         
wire            regs_comp_lock5;         
wire            regs_comp_lock6;         
wire            regs_comp_lock7;         
wire            regs_comp_lock8;         
wire            regs_comp_lock9;         
wire            regs_comp_read0;         
wire            regs_comp_read1;         
wire            regs_comp_read2;         
wire            regs_comp_read3;         
wire            regs_comp_read4;         
wire            regs_comp_read5;         
wire            regs_comp_read6;         
wire            regs_comp_read7;         
wire            regs_comp_write0;        
wire            regs_comp_write1;        
wire            regs_comp_write2;        
wire            regs_comp_write3;        
wire            regs_comp_write4;        
wire            regs_comp_write5;        
wire            regs_comp_write6;        
wire            regs_comp_write7;        
wire            wr_pmp_regs;             




assign pmp_csr_wen[19:0] = cp0_pmp_csr_sel[19:0] & {20{cp0_pmp_csr_wen}};

assign cp0_yy_secu_mode_aft_dbg = 1'b0;

assign wr_pmp_regs = |pmp_csr_wen[19:0];
// &Instance("gated_clk_cell", "x_pmp_gated_clk"); @49
gated_clk_cell  x_pmp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cpuclk            ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (wr_pmp_regs       ),
  .module_en          (cp0_pmp_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( @50
//          .clk_in      (forever_cpuclk), @51
//          .global_en   (cp0_yy_clk_en ), @52
//          .module_en   (cp0_pmp_icg_en), @53
//          .local_en    (wr_pmp_regs   ), @54
//          .external_en (1'b0          ), @55
//          .clk_out     (cpuclk        ), @56
//         ); @57

// &Instance("pa_pmp_enc"); @59
pa_pmp_enc  x_pa_pmp_enc (
  .cp0_pmp_mstatus_mpp  (cp0_pmp_mstatus_mpp ),
  .cp0_pmp_mstatus_mprv (cp0_pmp_mstatus_mprv),
  .cp0_yy_mach_mode     (cp0_yy_mach_mode    ),
  .ifu_pmp_machine_mode (ifu_pmp_machine_mode),
  .lsu_4k_cross         (lsu_4k_cross        ),
  .lsu_pmp_write        (lsu_pmp_write       ),
  .pmp_entry_lock       (pmp_entry_lock      ),
  .pmp_ifu_acc_deny     (pmp_ifu_acc_deny    ),
  .pmp_ifu_hit          (pmp_ifu_hit         ),
  .pmp_lsu_acc_deny     (pmp_lsu_acc_deny    ),
  .pmp_lsu_hit          (pmp_lsu_hit         ),
  .regs_comp_excut0     (regs_comp_excut0    ),
  .regs_comp_excut1     (regs_comp_excut1    ),
  .regs_comp_excut2     (regs_comp_excut2    ),
  .regs_comp_excut3     (regs_comp_excut3    ),
  .regs_comp_excut4     (regs_comp_excut4    ),
  .regs_comp_excut5     (regs_comp_excut5    ),
  .regs_comp_excut6     (regs_comp_excut6    ),
  .regs_comp_excut7     (regs_comp_excut7    ),
  .regs_comp_lock0      (regs_comp_lock0     ),
  .regs_comp_lock1      (regs_comp_lock1     ),
  .regs_comp_lock10     (regs_comp_lock10    ),
  .regs_comp_lock11     (regs_comp_lock11    ),
  .regs_comp_lock12     (regs_comp_lock12    ),
  .regs_comp_lock13     (regs_comp_lock13    ),
  .regs_comp_lock14     (regs_comp_lock14    ),
  .regs_comp_lock15     (regs_comp_lock15    ),
  .regs_comp_lock2      (regs_comp_lock2     ),
  .regs_comp_lock3      (regs_comp_lock3     ),
  .regs_comp_lock4      (regs_comp_lock4     ),
  .regs_comp_lock5      (regs_comp_lock5     ),
  .regs_comp_lock6      (regs_comp_lock6     ),
  .regs_comp_lock7      (regs_comp_lock7     ),
  .regs_comp_lock8      (regs_comp_lock8     ),
  .regs_comp_lock9      (regs_comp_lock9     ),
  .regs_comp_read0      (regs_comp_read0     ),
  .regs_comp_read1      (regs_comp_read1     ),
  .regs_comp_read2      (regs_comp_read2     ),
  .regs_comp_read3      (regs_comp_read3     ),
  .regs_comp_read4      (regs_comp_read4     ),
  .regs_comp_read5      (regs_comp_read5     ),
  .regs_comp_read6      (regs_comp_read6     ),
  .regs_comp_read7      (regs_comp_read7     ),
  .regs_comp_write0     (regs_comp_write0    ),
  .regs_comp_write1     (regs_comp_write1    ),
  .regs_comp_write2     (regs_comp_write2    ),
  .regs_comp_write3     (regs_comp_write3    ),
  .regs_comp_write4     (regs_comp_write4    ),
  .regs_comp_write5     (regs_comp_write5    ),
  .regs_comp_write6     (regs_comp_write6    ),
  .regs_comp_write7     (regs_comp_write7    )
);

// &Instance("pa_pmp_regs"); @60
pa_pmp_regs  x_pa_pmp_regs (
  .cp0_pmp_csr_sel          (cp0_pmp_csr_sel         ),
  .cp0_pmp_updt_data        (cp0_pmp_updt_data       ),
  .cp0_yy_secu_mode_aft_dbg (cp0_yy_secu_mode_aft_dbg),
  .cpuclk                   (cpuclk                  ),
  .cpurst_b                 (cpurst_b                ),
  .pmp_cp0_data             (pmp_cp0_data            ),
  .pmp_csr_wen              (pmp_csr_wen             ),
  .pmpaddr0_value           (pmpaddr0_value          ),
  .pmpaddr1_value           (pmpaddr1_value          ),
  .pmpaddr2_value           (pmpaddr2_value          ),
  .pmpaddr3_value           (pmpaddr3_value          ),
  .pmpaddr4_value           (pmpaddr4_value          ),
  .pmpaddr5_value           (pmpaddr5_value          ),
  .pmpaddr6_value           (pmpaddr6_value          ),
  .pmpaddr7_value           (pmpaddr7_value          ),
  .regs_comp_addr_mode0     (regs_comp_addr_mode0    ),
  .regs_comp_addr_mode1     (regs_comp_addr_mode1    ),
  .regs_comp_addr_mode2     (regs_comp_addr_mode2    ),
  .regs_comp_addr_mode3     (regs_comp_addr_mode3    ),
  .regs_comp_addr_mode4     (regs_comp_addr_mode4    ),
  .regs_comp_addr_mode5     (regs_comp_addr_mode5    ),
  .regs_comp_addr_mode6     (regs_comp_addr_mode6    ),
  .regs_comp_addr_mode7     (regs_comp_addr_mode7    ),
  .regs_comp_excut0         (regs_comp_excut0        ),
  .regs_comp_excut1         (regs_comp_excut1        ),
  .regs_comp_excut2         (regs_comp_excut2        ),
  .regs_comp_excut3         (regs_comp_excut3        ),
  .regs_comp_excut4         (regs_comp_excut4        ),
  .regs_comp_excut5         (regs_comp_excut5        ),
  .regs_comp_excut6         (regs_comp_excut6        ),
  .regs_comp_excut7         (regs_comp_excut7        ),
  .regs_comp_lock0          (regs_comp_lock0         ),
  .regs_comp_lock1          (regs_comp_lock1         ),
  .regs_comp_lock10         (regs_comp_lock10        ),
  .regs_comp_lock11         (regs_comp_lock11        ),
  .regs_comp_lock12         (regs_comp_lock12        ),
  .regs_comp_lock13         (regs_comp_lock13        ),
  .regs_comp_lock14         (regs_comp_lock14        ),
  .regs_comp_lock15         (regs_comp_lock15        ),
  .regs_comp_lock2          (regs_comp_lock2         ),
  .regs_comp_lock3          (regs_comp_lock3         ),
  .regs_comp_lock4          (regs_comp_lock4         ),
  .regs_comp_lock5          (regs_comp_lock5         ),
  .regs_comp_lock6          (regs_comp_lock6         ),
  .regs_comp_lock7          (regs_comp_lock7         ),
  .regs_comp_lock8          (regs_comp_lock8         ),
  .regs_comp_lock9          (regs_comp_lock9         ),
  .regs_comp_read0          (regs_comp_read0         ),
  .regs_comp_read1          (regs_comp_read1         ),
  .regs_comp_read2          (regs_comp_read2         ),
  .regs_comp_read3          (regs_comp_read3         ),
  .regs_comp_read4          (regs_comp_read4         ),
  .regs_comp_read5          (regs_comp_read5         ),
  .regs_comp_read6          (regs_comp_read6         ),
  .regs_comp_read7          (regs_comp_read7         ),
  .regs_comp_write0         (regs_comp_write0        ),
  .regs_comp_write1         (regs_comp_write1        ),
  .regs_comp_write2         (regs_comp_write2        ),
  .regs_comp_write3         (regs_comp_write3        ),
  .regs_comp_write4         (regs_comp_write4        ),
  .regs_comp_write5         (regs_comp_write5        ),
  .regs_comp_write6         (regs_comp_write6        ),
  .regs_comp_write7         (regs_comp_write7        )
);


// &Force("bus","ifu_pmp_addr",31,0); @62
// &Force("bus","lsu_pmp_addr",31,0); @63

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_0"); @66
pa_pmp_comp_hit  x_pa_pmp_comp_hit_0 (
  .addr_match_mode           (regs_comp_addr_mode0[1:0]),
  .ifu_acc_addr              (ifu_pmp_addr[31:0]       ),
  .ifu_addr_ge_bottom        (1'b1                     ),
  .ifu_addr_ge_pmpaddr       (ifu_addr_ge_bottom[0]    ),
  .lsu_4k_cross              (lsu_4k_cross[0]          ),
  .lsu_acc_addr              (lsu_pmp_addr[31:0]       ),
  .lsu_addr_ge_bottom        (1'b1                     ),
  .lsu_addr_ge_pmpaddr       (lsu_addr_ge_bottom[0]    ),
  .pmp_ifu_hit               (pmp_ifu_hit[0]           ),
  .pmp_lsu_hit               (pmp_lsu_hit[0]           ),
  .pmpaddr                   (pmpaddr0_value[25:0]     )
);

// &Connect(.addr_match_mode     (regs_comp_addr_mode0[1:0]), @67
//          .pmpaddr             (pmpaddr0_value[25:0]     ), @68
//          .ifu_addr_ge_bottom  (1'b1                     ), @69
//          .lsu_addr_ge_bottom  (1'b1                     ), @70
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]       ), @71
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]       ),  @72
//          .pmp_ifu_hit         (pmp_ifu_hit[0]           ), @73
//          .pmp_lsu_hit         (pmp_lsu_hit[0]           ), @74
//          .lsu_4k_cross        (lsu_4k_cross[0]          ), @75
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[0]    ), @76
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[0]    ) @77
//         ); @78

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_1"); @82
pa_pmp_comp_hit  x_pa_pmp_comp_hit_1 (
  .addr_match_mode           (regs_comp_addr_mode1[1:0]),
  .ifu_acc_addr              (ifu_pmp_addr[31:0]       ),
  .ifu_addr_ge_bottom        (ifu_addr_ge_bottom[0]    ),
  .ifu_addr_ge_pmpaddr       (ifu_addr_ge_bottom[1]    ),
  .lsu_4k_cross              (lsu_4k_cross[1]          ),
  .lsu_acc_addr              (lsu_pmp_addr[31:0]       ),
  .lsu_addr_ge_bottom        (lsu_addr_ge_bottom[0]    ),
  .lsu_addr_ge_pmpaddr       (lsu_addr_ge_bottom[1]    ),
  .pmp_ifu_hit               (pmp_ifu_hit[1]           ),
  .pmp_lsu_hit               (pmp_lsu_hit[1]           ),
  .pmpaddr                   (pmpaddr1_value[25:0]     )
);

// &Connect(.addr_match_mode     (regs_comp_addr_mode1[1:0]), @83
//          .pmpaddr             (pmpaddr1_value[25:0]     ), @84
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[0]    ), @85
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[0]    ), @86
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]       ), @87
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]       ),  @88
//          .lsu_4k_cross        (lsu_4k_cross[1]          ), @89
//          .pmp_ifu_hit         (pmp_ifu_hit[1]           ), @90
//          .pmp_lsu_hit         (pmp_lsu_hit[1]           ), @91
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[1]    ), @92
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[1]    ) @93
//         ); @94

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_2"); @98
pa_pmp_comp_hit  x_pa_pmp_comp_hit_2 (
  .addr_match_mode           (regs_comp_addr_mode2[1:0]),
  .ifu_acc_addr              (ifu_pmp_addr[31:0]       ),
  .ifu_addr_ge_bottom        (ifu_addr_ge_bottom[1]    ),
  .ifu_addr_ge_pmpaddr       (ifu_addr_ge_bottom[2]    ),
  .lsu_4k_cross              (lsu_4k_cross[2]          ),
  .lsu_acc_addr              (lsu_pmp_addr[31:0]       ),
  .lsu_addr_ge_bottom        (lsu_addr_ge_bottom[1]    ),
  .lsu_addr_ge_pmpaddr       (lsu_addr_ge_bottom[2]    ),
  .pmp_ifu_hit               (pmp_ifu_hit[2]           ),
  .pmp_lsu_hit               (pmp_lsu_hit[2]           ),
  .pmpaddr                   (pmpaddr2_value[25:0]     )
);

// &Connect(.addr_match_mode     (regs_comp_addr_mode2[1:0]), @99
//          .pmpaddr             (pmpaddr2_value[25:0]     ), @100
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[1]    ), @101
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[1]    ), @102
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]       ), @103
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]       ),  @104
//          .lsu_4k_cross        (lsu_4k_cross[2]          ), @105
//          .pmp_ifu_hit         (pmp_ifu_hit[2]           ), @106
//          .pmp_lsu_hit         (pmp_lsu_hit[2]           ), @107
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[2]    ), @108
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[2]    ) @109
//         ); @110

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_3"); @114
pa_pmp_comp_hit  x_pa_pmp_comp_hit_3 (
  .addr_match_mode           (regs_comp_addr_mode3[1:0]),
  .ifu_acc_addr              (ifu_pmp_addr[31:0]       ),
  .ifu_addr_ge_bottom        (ifu_addr_ge_bottom[2]    ),
  .ifu_addr_ge_pmpaddr       (ifu_addr_ge_bottom[3]    ),
  .lsu_4k_cross              (lsu_4k_cross[3]          ),
  .lsu_acc_addr              (lsu_pmp_addr[31:0]       ),
  .lsu_addr_ge_bottom        (lsu_addr_ge_bottom[2]    ),
  .lsu_addr_ge_pmpaddr       (lsu_addr_ge_bottom[3]    ),
  .pmp_ifu_hit               (pmp_ifu_hit[3]           ),
  .pmp_lsu_hit               (pmp_lsu_hit[3]           ),
  .pmpaddr                   (pmpaddr3_value[25:0]     )
);

// &Connect(.addr_match_mode     (regs_comp_addr_mode3[1:0]), @115
//          .pmpaddr             (pmpaddr3_value[25:0]     ), @116
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[2]    ), @117
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[2]    ), @118
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]       ), @119
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]       ),  @120
//          .lsu_4k_cross        (lsu_4k_cross[3]          ), @121
//          .pmp_ifu_hit         (pmp_ifu_hit[3]           ), @122
//          .pmp_lsu_hit         (pmp_lsu_hit[3]           ), @123
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[3]    ), @124
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[3]    ) @125
//         ); @126

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_4"); @130
pa_pmp_comp_hit  x_pa_pmp_comp_hit_4 (
  .addr_match_mode           (regs_comp_addr_mode4[1:0]),
  .ifu_acc_addr              (ifu_pmp_addr[31:0]       ),
  .ifu_addr_ge_bottom        (ifu_addr_ge_bottom[3]    ),
  .ifu_addr_ge_pmpaddr       (ifu_addr_ge_bottom[4]    ),
  .lsu_4k_cross              (lsu_4k_cross[4]          ),
  .lsu_acc_addr              (lsu_pmp_addr[31:0]       ),
  .lsu_addr_ge_bottom        (lsu_addr_ge_bottom[3]    ),
  .lsu_addr_ge_pmpaddr       (lsu_addr_ge_bottom[4]    ),
  .pmp_ifu_hit               (pmp_ifu_hit[4]           ),
  .pmp_lsu_hit               (pmp_lsu_hit[4]           ),
  .pmpaddr                   (pmpaddr4_value[25:0]     )
);

// &Connect(.addr_match_mode     (regs_comp_addr_mode4[1:0]), @131
//          .pmpaddr             (pmpaddr4_value[25:0]     ), @132
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[3]    ), @133
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[3]    ), @134
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]       ), @135
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]       ),  @136
//          .lsu_4k_cross        (lsu_4k_cross[4]          ), @137
//          .pmp_ifu_hit         (pmp_ifu_hit[4]           ), @138
//          .pmp_lsu_hit         (pmp_lsu_hit[4]           ), @139
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[4]    ), @140
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[4]    ) @141
//         ); @142

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_5"); @146
pa_pmp_comp_hit  x_pa_pmp_comp_hit_5 (
  .addr_match_mode           (regs_comp_addr_mode5[1:0]),
  .ifu_acc_addr              (ifu_pmp_addr[31:0]       ),
  .ifu_addr_ge_bottom        (ifu_addr_ge_bottom[4]    ),
  .ifu_addr_ge_pmpaddr       (ifu_addr_ge_bottom[5]    ),
  .lsu_4k_cross              (lsu_4k_cross[5]          ),
  .lsu_acc_addr              (lsu_pmp_addr[31:0]       ),
  .lsu_addr_ge_bottom        (lsu_addr_ge_bottom[4]    ),
  .lsu_addr_ge_pmpaddr       (lsu_addr_ge_bottom[5]    ),
  .pmp_ifu_hit               (pmp_ifu_hit[5]           ),
  .pmp_lsu_hit               (pmp_lsu_hit[5]           ),
  .pmpaddr                   (pmpaddr5_value[25:0]     )
);

// &Connect(.addr_match_mode     (regs_comp_addr_mode5[1:0]), @147
//          .pmpaddr             (pmpaddr5_value[25:0]     ), @148
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[4]    ), @149
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[4]    ), @150
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]       ), @151
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]       ),  @152
//          .lsu_4k_cross        (lsu_4k_cross[5]          ), @153
//          .pmp_ifu_hit         (pmp_ifu_hit[5]           ), @154
//          .pmp_lsu_hit         (pmp_lsu_hit[5]           ), @155
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[5]    ), @156
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[5]    ) @157
//         ); @158

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_6"); @162
pa_pmp_comp_hit  x_pa_pmp_comp_hit_6 (
  .addr_match_mode           (regs_comp_addr_mode6[1:0]),
  .ifu_acc_addr              (ifu_pmp_addr[31:0]       ),
  .ifu_addr_ge_bottom        (ifu_addr_ge_bottom[5]    ),
  .ifu_addr_ge_pmpaddr       (ifu_addr_ge_bottom[6]    ),
  .lsu_4k_cross              (lsu_4k_cross[6]          ),
  .lsu_acc_addr              (lsu_pmp_addr[31:0]       ),
  .lsu_addr_ge_bottom        (lsu_addr_ge_bottom[5]    ),
  .lsu_addr_ge_pmpaddr       (lsu_addr_ge_bottom[6]    ),
  .pmp_ifu_hit               (pmp_ifu_hit[6]           ),
  .pmp_lsu_hit               (pmp_lsu_hit[6]           ),
  .pmpaddr                   (pmpaddr6_value[25:0]     )
);

// &Connect(.addr_match_mode     (regs_comp_addr_mode6[1:0]), @163
//          .pmpaddr             (pmpaddr6_value[25:0]     ), @164
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[5]    ), @165
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[5]    ), @166
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]       ), @167
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]       ),  @168
//          .lsu_4k_cross        (lsu_4k_cross[6]          ), @169
//          .pmp_ifu_hit         (pmp_ifu_hit[6]           ), @170
//          .pmp_lsu_hit         (pmp_lsu_hit[6]           ), @171
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[6]    ), @172
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[6]    ) @173
//         ); @174

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_7"); @178
pa_pmp_comp_hit  x_pa_pmp_comp_hit_7 (
  .addr_match_mode           (regs_comp_addr_mode7[1:0]),
  .ifu_acc_addr              (ifu_pmp_addr[31:0]       ),
  .ifu_addr_ge_bottom        (ifu_addr_ge_bottom[6]    ),
  .ifu_addr_ge_pmpaddr       (ifu_addr_ge_bottom[7]    ),
  .lsu_4k_cross              (lsu_4k_cross[7]          ),
  .lsu_acc_addr              (lsu_pmp_addr[31:0]       ),
  .lsu_addr_ge_bottom        (lsu_addr_ge_bottom[6]    ),
  .lsu_addr_ge_pmpaddr       (lsu_addr_ge_bottom[7]    ),
  .pmp_ifu_hit               (pmp_ifu_hit[7]           ),
  .pmp_lsu_hit               (pmp_lsu_hit[7]           ),
  .pmpaddr                   (pmpaddr7_value[25:0]     )
);

// &Connect(.addr_match_mode     (regs_comp_addr_mode7[1:0]), @179
//          .pmpaddr             (pmpaddr7_value[25:0]     ), @180
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[6]    ), @181
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[6]    ), @182
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]       ), @183
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]       ),  @184
//          .lsu_4k_cross        (lsu_4k_cross[7]          ), @185
//          .pmp_ifu_hit         (pmp_ifu_hit[7]           ), @186
//          .pmp_lsu_hit         (pmp_lsu_hit[7]           ), @187
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[7]    ), @188
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[7]    ) @189
//         ); @190

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_8"); @194
// &Connect(.addr_match_mode     (regs_comp_addr_mode8[1:0]), @195
//          .pmpaddr             (pmpaddr8_value[25:0]     ), @196
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[7]    ), @197
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[7]    ), @198
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]       ), @199
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]       ),  @200
//          .lsu_4k_cross        (lsu_4k_cross[8]          ), @201
//          .pmp_ifu_hit         (pmp_ifu_hit[8]           ), @202
//          .pmp_lsu_hit         (pmp_lsu_hit[8]           ), @203
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[8]    ), @204
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[8]    ) @205
//         ); @206

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_9"); @210
// &Connect(.addr_match_mode     (regs_comp_addr_mode9[1:0]), @211
//          .pmpaddr             (pmpaddr9_value[25:0]     ), @212
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[8]    ), @213
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[8]    ), @214
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]       ), @215
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]       ),  @216
//          .lsu_4k_cross        (lsu_4k_cross[9]          ), @217
//          .pmp_ifu_hit         (pmp_ifu_hit[9]           ), @218
//          .pmp_lsu_hit         (pmp_lsu_hit[9]           ), @219
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[9]    ), @220
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[9]    ) @221
//         ); @222

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_10"); @226
// &Connect(.addr_match_mode     (regs_comp_addr_mode10[1:0]), @227
//          .pmpaddr             (pmpaddr10_value[25:0]     ), @228
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[9]     ), @229
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[9]     ), @230
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]        ), @231
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]        ),  @232
//          .lsu_4k_cross        (lsu_4k_cross[10]          ), @233
//          .pmp_ifu_hit         (pmp_ifu_hit[10]           ), @234
//          .pmp_lsu_hit         (pmp_lsu_hit[10]           ), @235
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[10]    ), @236
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[10]    ) @237
//         ); @238

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_11"); @242
// &Connect(.addr_match_mode     (regs_comp_addr_mode11[1:0]), @243
//          .pmpaddr             (pmpaddr11_value[25:0]     ), @244
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[10]    ), @245
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[10]    ), @246
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]        ), @247
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]        ),  @248
//          .lsu_4k_cross        (lsu_4k_cross[11]          ), @249
//          .pmp_ifu_hit         (pmp_ifu_hit[11]           ), @250
//          .pmp_lsu_hit         (pmp_lsu_hit[11]           ), @251
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[11]    ), @252
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[11]    ) @253
//         ); @254

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_12"); @258
// &Connect(.addr_match_mode     (regs_comp_addr_mode12[1:0]), @259
//          .pmpaddr             (pmpaddr12_value[25:0]     ), @260
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[11]    ), @261
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[11]    ), @262
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]        ), @263
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]        ),  @264
//          .lsu_4k_cross        (lsu_4k_cross[12]          ), @265
//          .pmp_ifu_hit         (pmp_ifu_hit[12]           ), @266
//          .pmp_lsu_hit         (pmp_lsu_hit[12]           ), @267
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[12]    ), @268
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[12]    ) @269
//         ); @270

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_13"); @274
// &Connect(.addr_match_mode     (regs_comp_addr_mode13[1:0]), @275
//          .pmpaddr             (pmpaddr13_value[25:0]     ), @276
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[12]    ), @277
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[12]    ), @278
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]        ), @279
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]        ),  @280
//          .lsu_4k_cross        (lsu_4k_cross[13]          ), @281
//          .pmp_ifu_hit         (pmp_ifu_hit[13]           ), @282
//          .pmp_lsu_hit         (pmp_lsu_hit[13]           ), @283
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[13]    ), @284
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[13]    ) @285
//         ); @286

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_14"); @290
// &Connect(.addr_match_mode     (regs_comp_addr_mode14[1:0]), @291
//          .pmpaddr             (pmpaddr14_value[25:0]     ), @292
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[13]    ), @293
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[13]    ), @294
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]        ), @295
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]        ),  @296
//          .lsu_4k_cross        (lsu_4k_cross[14]          ), @297
//          .pmp_ifu_hit         (pmp_ifu_hit[14]           ), @298
//          .pmp_lsu_hit         (pmp_lsu_hit[14]           ), @299
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[14]    ), @300
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[14]    ) @301
//         ); @302

// &Instance("pa_pmp_comp_hit", "x_pa_pmp_comp_hit_15"); @306
// &Connect(.addr_match_mode     (regs_comp_addr_mode15[1:0]), @307
//          .pmpaddr             (pmpaddr15_value[25:0]     ), @308
//          .ifu_addr_ge_bottom  (ifu_addr_ge_bottom[14]    ), @309
//          .lsu_addr_ge_bottom  (lsu_addr_ge_bottom[14]    ), @310
//          .ifu_acc_addr        (ifu_pmp_addr[31:0]        ), @311
//          .lsu_acc_addr        (lsu_pmp_addr[31:0]        ),  @312
//          .lsu_4k_cross        (lsu_4k_cross[15]          ), @313
//          .pmp_ifu_hit         (pmp_ifu_hit[15]           ), @314
//          .pmp_lsu_hit         (pmp_lsu_hit[15]           ), @315
//          .ifu_addr_ge_pmpaddr (ifu_addr_ge_bottom[15]    ), @316
//          .lsu_addr_ge_pmpaddr (lsu_addr_ge_bottom[15]    ) @317
//         ); @318

assign lsu_4k_cross[15:12] = 4'b0;
    assign lsu_4k_cross[11:8] = 4'b0;
// &Force("nonport", "pmp_entry_lock"); @334


// &ModuleEnd; @366
endmodule


