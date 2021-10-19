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

module pa_dcache_data_array(
  forever_cpuclk,
  cp0_lsu_icg_en,
  pad_yy_icg_scan_en,
  data_clk_en,
  data_cen,
  data_wen,
  data_din,
  data_idx,
  data_gwen,
  data_dout  
);

input                          forever_cpuclk;
input                          cp0_lsu_icg_en;      
input                          pad_yy_icg_scan_en; 
input                          data_clk_en;          
input                          data_cen;             
input   [11:0]                 data_idx;             
input                          data_gwen;            
input   [31:0]                 data_wen;             
input   [31:0]                 data_din;             
output  [31:0]                 data_dout;            

wire                           forever_cpuclk;
wire                           cp0_lsu_icg_en;      
wire                           pad_yy_icg_scan_en; 
wire                           data_clk_en;          
wire                           data_cen;             
wire    [11:0]                 data_idx;             
wire                           data_gwen;            
wire    [31:0]                 data_wen;             
wire    [31:0]                 data_din;             
wire    [31:0]                 data_dout;
wire                           data_clk;

 //==========================================================
//                 Instance of Gated Cell
//==========================================================
gated_clk_cell  x_dcache_data_gated_clk (
  .clk_in               (forever_cpuclk       ),
  .clk_out              (data_clk             ),
  .external_en          (1'b0                 ),
  .global_en            (1'b1                 ),
  .local_en             (data_clk_en          ),
  .module_en            (cp0_lsu_icg_en       ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en )
);
//csky vperl_off
//==========================================================
//              Instance dcache array
//==========================================================
`ifdef DCACHE_2K
pa_spsram_128x32  x_pa_spsram_128x32 (
`endif
`ifdef DCACHE_4K
pa_spsram_256x32  x_pa_spsram_256x32 (
`endif
`ifdef DCACHE_8K
pa_spsram_512x32  x_pa_spsram_512x32 (
`endif
`ifdef DCACHE_16K
pa_spsram_1024x32  x_pa_spsram_1024x32 (
`endif
`ifdef DCACHE_32K
pa_spsram_2048x32  x_pa_spsram_2048x32 (
`endif
`ifdef DCACHE_64K
pa_spsram_4096x32  x_pa_spsram_4096x32 (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in     (mem_cfg_in    ),
  `endif
  .A              (data_idx[`D_DATA_INDEX_WIDTH-1:0]),
  .CEN            (data_cen            ),
  .CLK            (data_clk            ),
  .GWEN           (data_gwen           ),
  .D              (data_din            ),
  .Q              (data_dout           ),
  .WEN            (data_wen            )
);
//csky vperl_on
endmodule
 
