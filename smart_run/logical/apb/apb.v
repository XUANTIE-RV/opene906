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
module apb(
  b_pad_gpio_porta,
  biu_pad_lpmd_b,
  clk_en,
  corec_pmu_sleep_out,
  cpu_clk,
  fifo_pad_haddr,
  fifo_pad_hprot,
  haddr_s2,
  hrdata_s2,
  hready_s2,
  hresp_s2,
  hsel_s2,
  hwdata_s2,
  hwrite_s2,
  i_pad_cpu_jtg_rst_b,
  i_pad_jtg_tclk,
  nmi_wake_int_lower,
  pad_clk,
  pad_cpu_rst_b,
  pad_had_jtg_tap_en,
  pad_had_jtg_tms_i,
  pad_had_jtg_trst_b,
  pad_had_jtg_trst_b_pre,
  pad_vic_int_vld,
  per_clk,
  pg_reset_b,
  pmu_corec_isolation,
  pmu_corec_sleep_in,
  smpu_deny,
  sys_rst,
  uart0_sin,
  uart0_sout
);

// &Ports; @21
input   [1 :0]  biu_pad_lpmd_b;        
input           corec_pmu_sleep_out;   
input   [31:0]  fifo_pad_haddr;        
input   [3 :0]  fifo_pad_hprot;        
input   [31:0]  haddr_s2;              
input           hsel_s2;               
input   [31:0]  hwdata_s2;             
input           hwrite_s2;             
input           i_pad_cpu_jtg_rst_b;   
input           i_pad_jtg_tclk;        
input           pad_clk;               
input           pad_cpu_rst_b;         
input           pad_had_jtg_tap_en;    
input           pad_had_jtg_tms_i;     
input           pad_had_jtg_trst_b_pre; 
input           sys_rst;               
input           uart0_sin;             
output          clk_en;                
output          cpu_clk;               
output  [31:0]  hrdata_s2;             
output          hready_s2;             
output  [1 :0]  hresp_s2;              
output  [1 :0]  nmi_wake_int_lower;    
output          pad_had_jtg_trst_b;    
output  [31:0]  pad_vic_int_vld;       
output          per_clk;               
output          pg_reset_b;            
output          pmu_corec_isolation;   
output          pmu_corec_sleep_in;    
output          smpu_deny;             
output          uart0_sout;            
inout   [7 :0]  b_pad_gpio_porta;      

// &Regs; @22

// &Wires; @23
wire            apb_clkgen_psel;       
wire            apb_gpio_psel;         
wire            apb_nmi_wake_psel;     
wire            apb_pmu_psel;          
wire            apb_smpu_psel;         
wire            apb_stim_psel;         
wire            apb_tim1_psel;         
wire            apb_tim_psel;          
wire            apb_uart_psel;         
wire    [31:0]  apb_xx_paddr;          
wire            apb_xx_penable;        
wire    [31:0]  apb_xx_pwdata;         
wire            apb_xx_pwrite;         
wire    [7 :0]  b_pad_gpio_porta;      
wire    [1 :0]  biu_pad_lpmd_b;        
wire            clk_en;                
wire    [31:0]  clkgen_apb_prdata;     
wire            corec_pmu_sleep_out;   
wire            cpu_clk;               
wire    [31:0]  fifo_pad_haddr;        
wire    [3 :0]  fifo_pad_hprot;        
wire            gate_en0;              
wire            gate_en1;              
wire    [31:0]  gpio_apb_prdata;       
wire    [7 :0]  gpio_vic_int;          
wire    [31:0]  haddr_s2;              
wire    [31:0]  hrdata_s2;             
wire            hready_s2;             
wire    [1 :0]  hresp_s2;              
wire            hsel_s2;               
wire    [31:0]  hwdata_s2;             
wire            hwrite_s2;             
wire            i_pad_cpu_jtg_rst_b;   
wire            i_pad_jtg_tclk;        
wire            intraw_vld;            
wire    [31:0]  nmi_wake_apb_prdata;   
wire    [3 :0]  nmi_wake_int;          
wire    [1 :0]  nmi_wake_int_higher;   
wire    [1 :0]  nmi_wake_int_lower;    
wire            pad_clk;               
wire            pad_cpu_rst_b;         
wire            pad_had_jtg_tap_en;    
wire            pad_had_jtg_tms_i;     
wire            pad_had_jtg_trst_b;    
wire            pad_had_jtg_trst_b_pre; 
wire    [31:0]  pad_vic_int_vld;       
wire            per_clk;               
wire            pg_reset_b;            
wire    [31:0]  pmu_apb_prdata;        
wire            pmu_clk;               
wire            pmu_corec_isolation;   
wire            pmu_corec_sleep_in;    
wire    [31:0]  smpu_apb_prdata;       
wire            smpu_deny;             
wire    [31:0]  stim_apb_prdata;       
wire    [3 :0]  stim_vic_int;          
wire            sys_rst;               
wire    [31:0]  tim1_apb_prdata;       
wire    [3 :0]  tim1_vic_int;          
wire    [31:0]  tim_apb_prdata;        
wire    [3 :0]  tim_vic_int;           
wire            uart0_sin;             
wire            uart0_sout;            
wire            uart0_vic_int;         
wire    [31:0]  uart_apb_prdata;       
wire            wic_clk;               



// &Instance("apb_bridge", "x_apb_bridge"); @26
apb_bridge  x_apb_bridge (
  .apb_harb_hrdata     (hrdata_s2          ),
  .apb_harb_hready     (hready_s2          ),
  .apb_harb_hresp      (hresp_s2           ),
  .apb_xx_paddr        (apb_xx_paddr       ),
  .apb_xx_penable      (apb_xx_penable     ),
  .apb_xx_pwdata       (apb_xx_pwdata      ),
  .apb_xx_pwrite       (apb_xx_pwrite      ),
  .harb_apb_hsel       (hsel_s2            ),
  .harb_xx_haddr       (haddr_s2           ),
  .harb_xx_hwdata      (hwdata_s2          ),
  .harb_xx_hwrite      (hwrite_s2          ),
  .hclk                (per_clk            ),
  .hrst_b              (pg_reset_b         ),
  .prdata_s1           (uart_apb_prdata    ),
  .prdata_s2           (tim_apb_prdata     ),
  .prdata_s3           (pmu_apb_prdata     ),
  .prdata_s4           (gpio_apb_prdata    ),
  .prdata_s5           (stim_apb_prdata    ),
  .prdata_s6           (clkgen_apb_prdata  ),
  .prdata_s7           (smpu_apb_prdata    ),
  .prdata_s8           (nmi_wake_apb_prdata),
  .prdata_s9           (tim1_apb_prdata    ),
  .psel_s1             (apb_uart_psel      ),
  .psel_s2             (apb_tim_psel       ),
  .psel_s3             (apb_pmu_psel       ),
  .psel_s4             (apb_gpio_psel      ),
  .psel_s5             (apb_stim_psel      ),
  .psel_s6             (apb_clkgen_psel    ),
  .psel_s7             (apb_smpu_psel      ),
  .psel_s8             (apb_nmi_wake_psel  ),
  .psel_s9             (apb_tim1_psel      )
);

// &Connect( @27
//   .hclk                   (per_clk), @28
//   .hrst_b                 (pg_reset_b), @29
//   .harb_apb_hsel          (hsel_s2), @30
//   .harb_xx_haddr          (haddr_s2), @31
//   .harb_xx_hwdata         (hwdata_s2), @32
//   .harb_xx_hwrite         (hwrite_s2), @33
//   .apb_harb_hrdata        (hrdata_s2), @34
//   .apb_harb_hready        (hready_s2), @35
//   .apb_harb_hresp         (hresp_s2), @36
//   .apb_xx_paddr           (apb_xx_paddr), @37
//   .apb_xx_penable         (apb_xx_penable), @38
//   .apb_xx_pwdata          (apb_xx_pwdata), @39
//   .apb_xx_pwrite          (apb_xx_pwrite), @40
//   .prdata_s1              (uart_apb_prdata), @41
//   .prdata_s2              (tim_apb_prdata), @42
//   .prdata_s3              (pmu_apb_prdata), @43
//   .prdata_s4              (gpio_apb_prdata), @44
//   .prdata_s5              (stim_apb_prdata), @45
//   .prdata_s6              (clkgen_apb_prdata), @46
//   .prdata_s7              (smpu_apb_prdata), @47
//   .prdata_s8              (nmi_wake_apb_prdata), @48
//   .prdata_s9              (tim1_apb_prdata), @49
//   .psel_s1                (apb_uart_psel), @50
//   .psel_s2                (apb_tim_psel), @51
//   .psel_s3                (apb_pmu_psel), @52
//   .psel_s4                (apb_gpio_psel), @53
//   .psel_s5                (apb_stim_psel), @54
//   .psel_s6                (apb_clkgen_psel), @55
//   .psel_s7                (apb_smpu_psel), @56
//   .psel_s8                (apb_nmi_wake_psel), @57
//   .psel_s9                (apb_tim1_psel) @58
// ); @59

// &Instance("pmu", "x_pmu"); @61
pmu  x_pmu (
  .apb_pmu_paddr          (apb_xx_paddr[11:0]    ),
  .apb_pmu_penable        (apb_xx_penable        ),
  .apb_pmu_psel           (apb_pmu_psel          ),
  .apb_pmu_pwdata         (apb_xx_pwdata         ),
  .apb_pmu_pwrite         (apb_xx_pwrite         ),
  .biu_pad_lpmd_b         (biu_pad_lpmd_b        ),
  .corec_pmu_sleep_out    (corec_pmu_sleep_out   ),
  .cpu_clk                (cpu_clk               ),
  .gate_en0               (gate_en0              ),
  .gate_en1               (gate_en1              ),
  .had_pad_wakeup_req_b   (1'b1                  ),
  .i_pad_cpu_jtg_rst_b    (i_pad_cpu_jtg_rst_b   ),
  .i_pad_jtg_tclk         (i_pad_jtg_tclk        ),
  .intraw_vld             (intraw_vld            ),
  .pad_cpu_rst_b          (pad_cpu_rst_b         ),
  .pad_had_jtg_tap_en     (pad_had_jtg_tap_en    ),
  .pad_had_jtg_tms_i      (pad_had_jtg_tms_i     ),
  .pad_had_jtg_trst_b     (pad_had_jtg_trst_b    ),
  .pad_had_jtg_trst_b_pre (pad_had_jtg_trst_b_pre),
  .pg_reset_b             (pg_reset_b            ),
  .pmu_apb_prdata         (pmu_apb_prdata        ),
  .pmu_clk                (pmu_clk               ),
  .pmu_corec_isolation    (pmu_corec_isolation   ),
  .pmu_corec_sleep_in     (pmu_corec_sleep_in    ),
  .sys_rst                (sys_rst               )
);

// &Connect( @62
//   .apb_pmu_psel          (apb_pmu_psel), @63
//   .apb_pmu_paddr         (apb_xx_paddr[11:0]), @64
//   .apb_pmu_penable       (apb_xx_penable), @65
//   .apb_pmu_pwdata        (apb_xx_pwdata), @66
//   .apb_pmu_pwrite        (apb_xx_pwrite), @67
//   .pad_cpu_rst_b         (pad_cpu_rst_b), @68
//   .pmu_apb_prdata        (pmu_apb_prdata), @69
//   .intraw_b              (wic_vic_intraw_b), @70
//   .had_pad_wakeup_req_b  (1'b1            ) @71
// //  .ctl_xx_awake_enable   (32'hffffffff), @72
// //  .pulse_int             (1'b0) @73
//  // .pad_vic_event_vld     (1'b0) @74
// ); @75


// &Instance("uart", "x_uart"); @78
uart  x_uart (
  .apb_uart_paddr   (apb_xx_paddr    ),
  .apb_uart_penable (apb_xx_penable  ),
  .apb_uart_psel    (apb_uart_psel   ),
  .apb_uart_pwdata  (apb_xx_pwdata   ),
  .apb_uart_pwrite  (apb_xx_pwrite   ),
  .rst_b            (pad_cpu_rst_b   ),
  .s_in             (uart0_sin       ),
  .s_out            (uart0_sout      ),
  .sys_clk          (pmu_clk         ),
  .uart_apb_prdata  (uart_apb_prdata ),
  .uart_vic_int     (uart0_vic_int   )
);

// &Connect( @79
//   .sys_clk                (pmu_clk), @80
//   .apb_uart_psel          (apb_uart_psel), @81
//   .apb_uart_paddr         (apb_xx_paddr), @82
//   .apb_uart_penable       (apb_xx_penable), @83
//   .apb_uart_pwdata        (apb_xx_pwdata), @84
//   .apb_uart_pwrite        (apb_xx_pwrite), @85
//   .rst_b                  (pad_cpu_rst_b), @86
//   .uart_apb_prdata        (uart_apb_prdata), @87
//   .uart_vic_int           (uart0_vic_int), @88
//   .s_in                   (uart0_sin), @89
//   .s_out                  (uart0_sout) @90
// ); @91

// &Instance("timer", "x_timer"); @93
timer  x_timer (
  .paddr              (apb_xx_paddr[15:0]),
  .pclk               (pmu_clk           ),
  .penable            (apb_xx_penable    ),
  .prdata             (tim_apb_prdata    ),
  .presetn            (pad_cpu_rst_b     ),
  .psel               (apb_tim_psel      ),
  .pwdata             (apb_xx_pwdata     ),
  .pwrite             (apb_xx_pwrite     ),
  .timer_int          (tim_vic_int       )
);

// &Connect( @94
//   .presetn                (pad_cpu_rst_b), @95
//   .prdata                 (tim_apb_prdata), @96
//   .timer_int              (tim_vic_int), @97
//   .pclk                   (pmu_clk), @98
//   .penable                (apb_xx_penable), @99
//   .paddr                  (apb_xx_paddr[15:0]), @100
//   .psel                   (apb_tim_psel), @101
//   .pwdata                 (apb_xx_pwdata), @102
//   .pwrite                 (apb_xx_pwrite) @103
// ); @104

// &Instance("timer", "x_nmi_wake"); @106
timer  x_nmi_wake (
  .paddr               (apb_xx_paddr[15:0] ),
  .pclk                (pmu_clk            ),
  .penable             (apb_xx_penable     ),
  .prdata              (nmi_wake_apb_prdata),
  .presetn             (pad_cpu_rst_b      ),
  .psel                (apb_nmi_wake_psel  ),
  .pwdata              (apb_xx_pwdata      ),
  .pwrite              (apb_xx_pwrite      ),
  .timer_int           (nmi_wake_int       )
);

// &Connect( @107
//   .presetn                (pad_cpu_rst_b), @108
//   .prdata                 (nmi_wake_apb_prdata), @109
//   .timer_int              (nmi_wake_int), @110
//   .pclk                   (pmu_clk), @111
//   .penable                (apb_xx_penable), @112
//   .paddr                  (apb_xx_paddr[15:0]), @113
//   .psel                   (apb_nmi_wake_psel), @114
//   .pwdata                 (apb_xx_pwdata), @115
//   .pwrite                 (apb_xx_pwrite) @116
// ); @117
assign nmi_wake_int_lower[1:0]= nmi_wake_int[1:0];
assign nmi_wake_int_higher[1:0] = nmi_wake_int[3:2];

// &Instance("timer", "x_stimer"); @121
timer  x_stimer (
  .paddr              (apb_xx_paddr[15:0]),
  .pclk               (pmu_clk           ),
  .penable            (apb_xx_penable    ),
  .prdata             (stim_apb_prdata   ),
  .presetn            (pad_cpu_rst_b     ),
  .psel               (apb_stim_psel     ),
  .pwdata             (apb_xx_pwdata     ),
  .pwrite             (apb_xx_pwrite     ),
  .timer_int          (stim_vic_int      )
);

// &Connect( @122
//   .presetn                (pad_cpu_rst_b), @123
//   .prdata                 (stim_apb_prdata), @124
//   .timer_int              (stim_vic_int), @125
//   .pclk                   (pmu_clk), @126
//   .penable                (apb_xx_penable), @127
//   .paddr                  (apb_xx_paddr[15:0]), @128
//   .psel                   (apb_stim_psel), @129
//   .pwdata                 (apb_xx_pwdata), @130
//   .pwrite                 (apb_xx_pwrite) @131
// ); @132

// &Instance("timer", "x_timer1"); @134
timer  x_timer1 (
  .paddr              (apb_xx_paddr[15:0]),
  .pclk               (pmu_clk           ),
  .penable            (apb_xx_penable    ),
  .prdata             (tim1_apb_prdata   ),
  .presetn            (pad_cpu_rst_b     ),
  .psel               (apb_tim1_psel     ),
  .pwdata             (apb_xx_pwdata     ),
  .pwrite             (apb_xx_pwrite     ),
  .timer_int          (tim1_vic_int      )
);

// &Connect( @135
//   .presetn                (pad_cpu_rst_b), @136
//   .prdata                 (tim1_apb_prdata), @137
//   .timer_int              (tim1_vic_int), @138
//   .pclk                   (pmu_clk), @139
//   .penable                (apb_xx_penable), @140
//   .paddr                  (apb_xx_paddr[15:0]), @141
//   .psel                   (apb_tim1_psel), @142
//   .pwdata                 (apb_xx_pwdata), @143
//   .pwrite                 (apb_xx_pwrite) @144
// ); @145


// &Instance("fpga_clk_gen", "x_fpga_clk_gen"); @149
fpga_clk_gen  x_fpga_clk_gen (
  .clk_en             (clk_en            ),
  .clkrst_b           (pad_cpu_rst_b     ),
  .cpu_clk            (cpu_clk           ),
  .gate_en0           (gate_en0          ),
  .gate_en1           (gate_en1          ),
  .pad_clk            (pad_clk           ),
  .penable            (apb_xx_penable    ),
  .per_clk            (per_clk           ),
  .pmu_clk            (pmu_clk           ),
  .prdata             (clkgen_apb_prdata ),
  .psel               (apb_clkgen_psel   ),
  .pwdata             (apb_xx_pwdata[2:0]),
  .pwrite             (apb_xx_pwrite     ),
  .wic_clk            (wic_clk           )
);

// &Connect( @150
//   .penable               (apb_xx_penable    ), @151
//   .psel                  (apb_clkgen_psel   ), @152
//   .prdata                (clkgen_apb_prdata ), @153
//   .pwdata                (apb_xx_pwdata[2:0]), @154
//   .pwrite                (apb_xx_pwrite     ), @155
//   .clkrst_b              (pad_cpu_rst_b     ) @156
// ); @157
// &Instance("clk_aligner", "x_clk_aligner"); @159
// &Connect( @160
//   .forever_cpuclk          (pad_clk           ), @161
//   .penable                 (apb_xx_penable    ), @162
//   .paddr                   (apb_xx_paddr[11:0]), @163
//   .psel                    (apb_clkgen_psel   ), @164
//   .prdata                  (clkgen_apb_prdata ), @165
//   .pwdata                  (apb_xx_pwdata[2:0]), @166
//   .pwrite                  (apb_xx_pwrite     ), @167
//   .clkrst_b                (pad_cpu_rst_b     ) @168
// ); @169
// &Instance("clk_divider", "x_clk_divider"); @171
// &Connect( @172
//   .osc_clk                 (pad_clk) @173
// ); @174



// &Instance("gpio", "x_gpio"); @179
gpio  x_gpio (
  .b_pad_gpio_porta  (b_pad_gpio_porta ),
  .gpio_intr         (gpio_vic_int     ),
  .paddr             (apb_xx_paddr[6:2]),
  .pclk              (pmu_clk          ),
  .pclk_intr         (pmu_clk          ),
  .penable           (apb_xx_penable   ),
  .prdata            (gpio_apb_prdata  ),
  .presetn           (pad_cpu_rst_b    ),
  .psel              (apb_gpio_psel    ),
  .pwdata            (apb_xx_pwdata    ),
  .pwrite            (apb_xx_pwrite    )
);

// &Connect( @180
//   .paddr                  (apb_xx_paddr[6:2]), @181
//   .pclk                   (pmu_clk), @182
//   .pclk_intr              (pmu_clk), @183
//   .penable                (apb_xx_penable), @184
//   .presetn                (pad_cpu_rst_b), @185
//   .psel                   (apb_gpio_psel), @186
//   .pwdata                 (apb_xx_pwdata), @187
//   .pwrite                 (apb_xx_pwrite), @188
//   .gpio_intr              (gpio_vic_int), @189
//   .prdata                 (gpio_apb_prdata) @190
// ); @191

// &Instance("smpu_top", "x_smpu_top"); @193
smpu_top  x_smpu_top (
  .biu_pad_haddr     (fifo_pad_haddr   ),
  .biu_pad_hprot     (fifo_pad_hprot   ),
  .paddr             (apb_xx_paddr[3:2]),
  .pclk              (per_clk          ),
  .penable           (apb_xx_penable   ),
  .prdata            (smpu_apb_prdata  ),
  .presetn           (pg_reset_b       ),
  .psel              (apb_smpu_psel    ),
  .pwdata            (apb_xx_pwdata    ),
  .pwrite            (apb_xx_pwrite    ),
  .smpu_deny         (smpu_deny        )
);

// &Connect( @194
//   .paddr                  (apb_xx_paddr[3:2]), @195
//   .pclk                   (per_clk), @196
//   .penable                (apb_xx_penable), @197
//   .presetn                (pg_reset_b), @198
//   .psel                   (apb_smpu_psel), @199
//   .pwdata                 (apb_xx_pwdata), @200
//   .pwrite                 (apb_xx_pwrite), @201
//   .prdata                 (smpu_apb_prdata), @202
//   .biu_pad_haddr          (fifo_pad_haddr ), @203
//   .biu_pad_hprot          (fifo_pad_hprot ) @204
// ); @205

// &Instance("wic_top", "x_wic_top"); @207
wic_top  x_wic_top (
  .ctl_xx_awake_enable (32'hffffffff       ),
  .gpio_vic_int        (gpio_vic_int       ),
  .intraw_vld          (intraw_vld         ),
  .nmi_wake_int_higher (nmi_wake_int_higher),
  .pad_cpu_rst_b       (pad_cpu_rst_b      ),
  .pad_vic_int_vld     (pad_vic_int_vld    ),
  .pulse_int           (1'b0               ),
  .stim_vic_int        (stim_vic_int       ),
  .tim1_vic_int        (tim1_vic_int       ),
  .tim_vic_int         (tim_vic_int        ),
  .uart0_vic_int       (uart0_vic_int      ),
  .wic_clk             (wic_clk            )
);

// &Connect( @208
//    .pulse_int              (1'b0         ), @209
//    .ctl_xx_awake_enable   (32'hffffffff  ) @210
//  @211
// ); @212
// &Force("nonport","pulse_int"); @214
// &Force("nonport","stim_vic_int"); @215
// &Force("nonport","gpio_vic_int"); @216

// &Force("nonport", "pulse_int"); @220
// &Force("nonport", "stim_vic_int"); @221

//assign pll_core_cpuclk = per_clk;
// &Force("output","per_clk"); @225
// &Force("output","cpu_clk"); @226
// &Force("output","pg_reset_b"); @227

// //&Force("output","cpu_clk"); @229
// //&Force("output",""); @230

// &ModuleEnd; @232
endmodule




