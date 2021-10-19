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

// &Depend("cpu_cfig.h"); @18

// &ModuleBeg; @20
module pa_dcache_top(
  cp0_lsu_icg_en,
  dcache_data_cen_way0_bank0,
  dcache_data_cen_way0_bank1,
  dcache_data_cen_way1_bank0,
  dcache_data_cen_way1_bank1,
  dcache_data_din,
  dcache_data_dout_way0,
  dcache_data_dout_way1,
  dcache_data_idx,
  dcache_data_wen,
  dcache_dirty_cen,
  dcache_dirty_din,
  dcache_dirty_dout,
  dcache_dirty_idx,
  dcache_dirty_wen,
  dcache_tag_cen,
  dcache_tag_din,
  dcache_tag_dout,
  dcache_tag_idx,
  dcache_tag_wen,
  forever_cpuclk,
  pad_yy_icg_scan_en
);

// &Ports; @21
input           cp0_lsu_icg_en;            
input           dcache_data_cen_way0_bank0; 
input           dcache_data_cen_way0_bank1; 
input           dcache_data_cen_way1_bank0; 
input           dcache_data_cen_way1_bank1; 
input   [63:0]  dcache_data_din;           
input   [11:0]  dcache_data_idx;           
input   [3 :0]  dcache_data_wen;           
input           dcache_dirty_cen;          
input   [2 :0]  dcache_dirty_din;          
input   [9 :0]  dcache_dirty_idx;          
input   [2 :0]  dcache_dirty_wen;          
input           dcache_tag_cen;            
input   [22:0]  dcache_tag_din;            
input   [9 :0]  dcache_tag_idx;            
input   [1 :0]  dcache_tag_wen;            
input           forever_cpuclk;            
input           pad_yy_icg_scan_en;        
output  [63:0]  dcache_data_dout_way0;     
output  [63:0]  dcache_data_dout_way1;     
output  [2 :0]  dcache_dirty_dout;         
output  [45:0]  dcache_tag_dout;           

// &Regs; @22

// &Wires; @23
wire            cp0_lsu_icg_en;            
wire            dcache_data_cen00;         
wire            dcache_data_cen01;         
wire            dcache_data_cen10;         
wire            dcache_data_cen11;         
wire            dcache_data_cen_way0_bank0; 
wire            dcache_data_cen_way0_bank1; 
wire            dcache_data_cen_way1_bank0; 
wire            dcache_data_cen_way1_bank1; 
wire            dcache_data_clk_en00;      
wire            dcache_data_clk_en01;      
wire            dcache_data_clk_en10;      
wire            dcache_data_clk_en11;      
wire    [63:0]  dcache_data_din;           
wire    [63:0]  dcache_data_dout_way0;     
wire    [63:0]  dcache_data_dout_way1;     
wire            dcache_data_gwen_t0;       
wire            dcache_data_gwen_t1;       
wire    [11:0]  dcache_data_idx;           
wire    [3 :0]  dcache_data_wen;           
wire    [31:0]  dcache_data_wen_t0;        
wire    [31:0]  dcache_data_wen_t1;        
wire            dcache_dirty_cen;          
wire            dcache_dirty_clk_en;       
wire    [2 :0]  dcache_dirty_din;          
wire    [3 :0]  dcache_dirty_din_t;        
wire    [2 :0]  dcache_dirty_dout;         
wire    [3 :0]  dcache_dirty_dout_t;       
wire            dcache_dirty_gwen;         
wire    [9 :0]  dcache_dirty_idx;          
wire    [2 :0]  dcache_dirty_wen;          
wire    [3 :0]  dcache_dirty_wen_t;        
wire            dcache_tag_cen;            
wire            dcache_tag_clk_en;         
wire    [22:0]  dcache_tag_din;            
wire    [45:0]  dcache_tag_din_t;          
wire    [45:0]  dcache_tag_dout;           
wire            dcache_tag_gwen;           
wire    [9 :0]  dcache_tag_idx;            
wire    [1 :0]  dcache_tag_wen;            
wire    [45:0]  dcache_tag_wen_t;          
wire            forever_cpuclk;            
wire            pad_yy_icg_scan_en;        



assign dcache_tag_clk_en = !dcache_tag_cen; 
assign dcache_tag_gwen   = &dcache_tag_wen[1:0];
assign dcache_tag_din_t[45:0] = {2{dcache_tag_din[22:0]}};
assign dcache_tag_wen_t[45:0] = {{23{dcache_tag_wen[1]}},
                                 {23{dcache_tag_wen[0]}}};

// &Instance("pa_dcache_tag_array", "x_pa_dcache_tag_array"); @32
pa_dcache_tag_array  x_pa_dcache_tag_array (
  .cp0_lsu_icg_en     (cp0_lsu_icg_en    ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .tag_cen            (dcache_tag_cen    ),
  .tag_clk_en         (dcache_tag_clk_en ),
  .tag_din            (dcache_tag_din_t  ),
  .tag_dout           (dcache_tag_dout   ),
  .tag_gwen           (dcache_tag_gwen   ),
  .tag_idx            (dcache_tag_idx    ),
  .tag_wen            (dcache_tag_wen_t  )
);

// &Connect( @33
//          .tag_clk_en             (dcache_tag_clk_en       ), @34
//          .tag_cen                (dcache_tag_cen          ), @35
//          .tag_wen                (dcache_tag_wen_t        ), @36
//          .tag_din                (dcache_tag_din_t        ), @37
//          .tag_idx                (dcache_tag_idx          ), @38
//          .tag_gwen               (dcache_tag_gwen         ), @39
//          .tag_dout               (dcache_tag_dout         )); @40

assign dcache_dirty_clk_en = !dcache_dirty_cen; 
assign dcache_dirty_gwen   = &dcache_dirty_wen[2:0];
assign dcache_dirty_wen_t[3:0] = {dcache_dirty_wen[2],dcache_dirty_wen[2:0]};
assign dcache_dirty_din_t[3:0] = {1'b0,dcache_dirty_din[2:0]};
assign dcache_dirty_dout[2:0]  = dcache_dirty_dout_t[2:0];

// &Instance("pa_dcache_dirty_array", "x_pa_dcache_dirty_array"); @48
pa_dcache_dirty_array  x_pa_dcache_dirty_array (
  .cp0_lsu_icg_en      (cp0_lsu_icg_en     ),
  .dirty_cen           (dcache_dirty_cen   ),
  .dirty_clk_en        (dcache_dirty_clk_en),
  .dirty_din           (dcache_dirty_din_t ),
  .dirty_dout          (dcache_dirty_dout_t),
  .dirty_gwen          (dcache_dirty_gwen  ),
  .dirty_idx           (dcache_dirty_idx   ),
  .dirty_wen           (dcache_dirty_wen_t ),
  .forever_cpuclk      (forever_cpuclk     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect( @49
//          .dirty_clk_en             (dcache_dirty_clk_en       ), @50
//          .dirty_cen                (dcache_dirty_cen          ), @51
//          .dirty_wen                (dcache_dirty_wen_t        ), @52
//          .dirty_din                (dcache_dirty_din_t        ), @53
//          .dirty_idx                (dcache_dirty_idx          ), @54
//          .dirty_gwen               (dcache_dirty_gwen         ), @55
//          .dirty_dout               (dcache_dirty_dout_t       )); @56

assign dcache_data_gwen_t0      = &dcache_data_wen[3:0];
assign dcache_data_wen_t0[31:0] = {{8{dcache_data_wen[3]}},
                                   {8{dcache_data_wen[2]}},
                                   {8{dcache_data_wen[1]}},
                                   {8{dcache_data_wen[0]}}};

assign dcache_data_gwen_t1      = dcache_data_gwen_t0;
assign dcache_data_wen_t1[31:0] = dcache_data_wen_t0[31:0]; 

assign dcache_data_clk_en00 = !dcache_data_cen_way0_bank0; 
assign dcache_data_cen00    =  dcache_data_cen_way0_bank0;

// &Instance("pa_dcache_data_array", "x_pa_dcache_data_array_way0_bank0"); @78
pa_dcache_data_array  x_pa_dcache_data_array_way0_bank0 (
  .cp0_lsu_icg_en              (cp0_lsu_icg_en             ),
  .data_cen                    (dcache_data_cen00          ),
  .data_clk_en                 (dcache_data_clk_en00       ),
  .data_din                    (dcache_data_din[31:0]      ),
  .data_dout                   (dcache_data_dout_way0[31:0]),
  .data_gwen                   (dcache_data_gwen_t0        ),
  .data_idx                    (dcache_data_idx            ),
  .data_wen                    (dcache_data_wen_t0         ),
  .forever_cpuclk              (forever_cpuclk             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect( @79
//          .data_clk_en             (dcache_data_clk_en00    ), @80
//          .data_cen                (dcache_data_cen00       ), @81
//          .data_wen                (dcache_data_wen_t0      ), @82
//          .data_din                (dcache_data_din[31:0]   ), @83
//          .data_idx                (dcache_data_idx         ), @84
//          .data_gwen               (dcache_data_gwen_t0     ), @85
//          .data_dout               (dcache_data_dout_way0[31:0])); @86

assign dcache_data_clk_en01 = !dcache_data_cen_way0_bank1; 
assign dcache_data_cen01    =  dcache_data_cen_way0_bank1;

// &Instance("pa_dcache_data_array", "x_pa_dcache_data_array_way0_bank1"); @91
pa_dcache_data_array  x_pa_dcache_data_array_way0_bank1 (
  .cp0_lsu_icg_en               (cp0_lsu_icg_en              ),
  .data_cen                     (dcache_data_cen01           ),
  .data_clk_en                  (dcache_data_clk_en01        ),
  .data_din                     (dcache_data_din[63:32]      ),
  .data_dout                    (dcache_data_dout_way0[63:32]),
  .data_gwen                    (dcache_data_gwen_t1         ),
  .data_idx                     (dcache_data_idx             ),
  .data_wen                     (dcache_data_wen_t1          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);

// &Connect( @92
//          .data_clk_en             (dcache_data_clk_en01    ), @93
//          .data_cen                (dcache_data_cen01       ), @94
//          .data_wen                (dcache_data_wen_t1      ), @95
//          .data_din                (dcache_data_din[63:32]  ), @96
//          .data_idx                (dcache_data_idx         ), @97
//          .data_gwen               (dcache_data_gwen_t1     ), @98
//          .data_dout               (dcache_data_dout_way0[63:32])); @99


assign dcache_data_clk_en10 = !dcache_data_cen_way1_bank0;
assign dcache_data_cen10    =  dcache_data_cen_way1_bank0;

// &Instance("pa_dcache_data_array", "x_pa_dcache_data_array_way1_bank0"); @105
pa_dcache_data_array  x_pa_dcache_data_array_way1_bank0 (
  .cp0_lsu_icg_en              (cp0_lsu_icg_en             ),
  .data_cen                    (dcache_data_cen10          ),
  .data_clk_en                 (dcache_data_clk_en10       ),
  .data_din                    (dcache_data_din[31:0]      ),
  .data_dout                   (dcache_data_dout_way1[31:0]),
  .data_gwen                   (dcache_data_gwen_t0        ),
  .data_idx                    (dcache_data_idx            ),
  .data_wen                    (dcache_data_wen_t0         ),
  .forever_cpuclk              (forever_cpuclk             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect( @106
//          .data_clk_en             (dcache_data_clk_en10     ), @107
//          .data_cen                (dcache_data_cen10        ), @108
//          .data_wen                (dcache_data_wen_t0       ), @109
//          .data_din                (dcache_data_din[31:0]    ), @110
//          .data_idx                (dcache_data_idx          ), @111
//          .data_gwen               (dcache_data_gwen_t0      ), @112
//          .data_dout               (dcache_data_dout_way1[31:0])); @113

assign dcache_data_clk_en11 = !dcache_data_cen_way1_bank1;
assign dcache_data_cen11    =  dcache_data_cen_way1_bank1;

// &Instance("pa_dcache_data_array", "x_pa_dcache_data_array_way1_bank1"); @118
pa_dcache_data_array  x_pa_dcache_data_array_way1_bank1 (
  .cp0_lsu_icg_en               (cp0_lsu_icg_en              ),
  .data_cen                     (dcache_data_cen11           ),
  .data_clk_en                  (dcache_data_clk_en11        ),
  .data_din                     (dcache_data_din[63:32]      ),
  .data_dout                    (dcache_data_dout_way1[63:32]),
  .data_gwen                    (dcache_data_gwen_t1         ),
  .data_idx                     (dcache_data_idx             ),
  .data_wen                     (dcache_data_wen_t1          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);

// &Connect( @119
//          .data_clk_en             (dcache_data_clk_en11     ), @120
//          .data_cen                (dcache_data_cen11        ), @121
//          .data_wen                (dcache_data_wen_t1       ), @122
//          .data_din                (dcache_data_din[63:32]   ), @123
//          .data_idx                (dcache_data_idx          ), @124
//          .data_gwen               (dcache_data_gwen_t1      ), @125
//          .data_dout               (dcache_data_dout_way1[63:32])); @126

// &ModuleEnd; @128
endmodule


