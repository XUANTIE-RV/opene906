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

module pa_ifu_icache_tag_array(
  cp0_yy_clk_en,
  cp0_ifu_icg_en,
  forever_cpuclk,
  icache_tag_cen,
  icache_tag_din,
  icache_tag_dout,
  icache_tag_idx,
  icache_tag_wen,
  pad_yy_icg_scan_en
);

input           cp0_yy_clk_en;       
input           cp0_ifu_icg_en;       
input           forever_cpuclk;      
input           icache_tag_cen;      
input   [46:0]  icache_tag_din;      
input   [9 :0]  icache_tag_idx;      
input   [2 :0]  icache_tag_wen;      
input           pad_yy_icg_scan_en; 
output  [46:0]  icache_tag_dout;     

wire            cp0_yy_clk_en;       
wire            cp0_ifu_icg_en;       
wire            forever_cpuclk;      
wire    [46:0]  icache_tag_bwen;     
wire    [46:0]  icache_tag_bwen_b;   
wire            icache_tag_cen;      
wire            icache_tag_cen_b;    
wire            icache_tag_clk;      
wire    [46:0]  icache_tag_din;      
wire    [46:0]  icache_tag_din_fin;  
wire    [46:0]  icache_tag_dout;     
wire    [46:0]  icache_tag_dout_raw; 
wire            icache_tag_gwen;     
wire            icache_tag_gwen_b;   
wire            icache_tag_icg_en;   
wire    [9 :0]  icache_tag_idx;      
wire    [2 :0]  icache_tag_wen;      
wire            pad_yy_icg_scan_en; 

//==========================================================
// Icache Tag Array Module
// 1. Instance ICG Cell
// 2. Transmit Port Signals
// 3. Instance Memory Cell 
//==========================================================

//------------------------------------------------
// 1. Instance ICG Cell
//------------------------------------------------
assign icache_tag_icg_en = icache_tag_cen;
// &Instance("gated_clk_cell", "x_icache_tag_icg_cell"); @92
gated_clk_cell  x_icache_tag_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icache_tag_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (icache_tag_icg_en ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk   ), @93
//           .external_en(1'b0             ), @94
//           .global_en  (cp0_yy_clk_en    ), @95
//           .module_en  (cp0_ifu_icg_en   ), @96
//           .local_en   (icache_tag_icg_en), @97
//           .clk_out    (icache_tag_clk   ) @98
//          ); @99

//------------------------------------------------
// 2. Transmit Port Signals
//------------------------------------------------
assign icache_tag_gwen = |icache_tag_wen[2:0];
//csky vperl_off
`ifdef ICACHE_2K
assign icache_tag_bwen[46:0] = {
                               {  {icache_tag_wen[2]}},  //fifo
                               {(`I_TAG_TAG_WIDTH+1){icache_tag_wen[1]}},  //way1
                               {(`I_TAG_TAG_WIDTH+1){icache_tag_wen[0]}}   //way0
                              };
assign icache_tag_dout[46:0] = icache_tag_dout_raw[46:0];
`else
assign icache_tag_bwen[46:0] = {  {2*(22-`I_TAG_TAG_WIDTH){1'b0}},
                               {  {icache_tag_wen[2]}},  //fifo
                               {(`I_TAG_TAG_WIDTH+1){icache_tag_wen[1]}},  //way1
                               {(`I_TAG_TAG_WIDTH+1){icache_tag_wen[0]}}   //way0
                              };
assign icache_tag_dout[46:0] = {  
                  icache_tag_dout_raw[2*`I_TAG_TAG_WIDTH+2:2*`I_TAG_TAG_WIDTH+1],
                  {(22-`I_TAG_TAG_WIDTH){1'b0}},
                  icache_tag_dout_raw[2*`I_TAG_TAG_WIDTH:`I_TAG_TAG_WIDTH],
                  {(22-`I_TAG_TAG_WIDTH){1'b0}},
                  icache_tag_dout_raw[`I_TAG_TAG_WIDTH-1:0]
                              };

assign icache_tag_dout_raw[46:2*`I_TAG_TAG_WIDTH+3] = {(44-2*`I_TAG_TAG_WIDTH){1'b0}};
assign icache_tag_din_fin[46:2*`I_TAG_TAG_WIDTH+3]  = {(44-2*`I_TAG_TAG_WIDTH){1'b0}};
`endif
//csky vperl_on
assign icache_tag_cen_b  = ~icache_tag_cen;
assign icache_tag_gwen_b = ~icache_tag_gwen;
assign icache_tag_bwen_b[46:0] = ~icache_tag_bwen[46:0];
assign icache_tag_din_fin[2*`I_TAG_TAG_WIDTH+2:0] = 
                               {icache_tag_din[46:45-`I_TAG_TAG_WIDTH],
                                icache_tag_din[22:22-`I_TAG_TAG_WIDTH]
                              };

//------------------------------------------------
// 3. Instance Memory Cell 
//------------------------------------------------
//csky vperl_off
`ifdef ICACHE_2K
pa_spsram_32x47  x_pa_spsram_32x47
`endif
`ifdef ICACHE_4K
pa_spsram_64x45  x_pa_spsram_64x45
`endif
`ifdef ICACHE_8K
pa_spsram_128x43  x_pa_spsram_128x43
`endif
`ifdef ICACHE_16K
pa_spsram_256x41  x_pa_spsram_256x41
`endif
`ifdef ICACHE_32K
pa_spsram_512x39  x_pa_spsram_512x39
`endif
`ifdef ICACHE_64K
pa_spsram_1024x37  x_pa_spsram_1024x37
`endif
(
         `ifdef MEM_CFG_IN
         .mem_cfg_in     (mem_cfg_in    ),
         `endif
         .CLK    (icache_tag_clk     ),
         .CEN    (icache_tag_cen_b   ),
         .GWEN   (icache_tag_gwen_b  ),
         .WEN    (icache_tag_bwen_b[2*`I_TAG_TAG_WIDTH+2:0]),
         .A      (icache_tag_idx[`I_TAG_INDEX_WIDTH-1:0]),
         .D      (icache_tag_din_fin[2*`I_TAG_TAG_WIDTH+2:0]),
         .Q      (icache_tag_dout_raw[2*`I_TAG_TAG_WIDTH+2:0])
);
//csky vperl_on

// &ModuleEnd; @175
endmodule


