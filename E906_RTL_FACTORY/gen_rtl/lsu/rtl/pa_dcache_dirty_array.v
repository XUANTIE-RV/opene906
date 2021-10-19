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
// &Depend("pa_spsram_32x4.vp"); @19
// &Depend("pa_spsram_64x4.vp"); @20
// &Depend("pa_spsram_128x4.vp"); @21
// &Depend("pa_spsram_256x4.vp"); @22
// &Depend("pa_spsram_512x4.vp"); @23
// &Depend("pa_spsram_1024x4.vp"); @24
// &Depend("gated_clk_cell.vp"); @25

module pa_dcache_dirty_array(
  forever_cpuclk,
  cp0_lsu_icg_en,
  pad_yy_icg_scan_en,
  dirty_clk_en,
  dirty_cen,
  dirty_wen,
  dirty_din,
  dirty_idx,
  dirty_gwen,
  dirty_dout  
);

input                          forever_cpuclk;
input                          cp0_lsu_icg_en;      
input                          pad_yy_icg_scan_en; 
input                          dirty_clk_en;          
input                          dirty_cen;             
input   [9:0]                  dirty_idx;             
input                          dirty_gwen;            
input   [3:0]                  dirty_wen;             
input   [3:0]                  dirty_din;             
output  [3:0]                  dirty_dout;            

wire                           forever_cpuclk;
wire                           cp0_lsu_icg_en;      
wire                           pad_yy_icg_scan_en; 
wire                           dirty_clk_en;          
wire                           dirty_cen;             
wire    [9:0]                  dirty_idx;             
wire                           dirty_gwen;            
wire    [3:0]                  dirty_wen;             
wire    [3:0]                  dirty_din;             
wire    [3:0]                  dirty_dout;
wire                           dirty_clk;

 //==========================================================
//                 Instance of Gated Cell
//==========================================================
gated_clk_cell  x_dcache_dirty_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (dirty_clk           ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (dirty_clk_en        ),
  .module_en            (cp0_lsu_icg_en      ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);
//csky vperl_off
//==========================================================
//              Instance dcache array
//==========================================================
`ifdef DCACHE_2K
pa_spsram_32x4  x_pa_spsram_32x4        (
`endif
`ifdef DCACHE_4K
pa_spsram_64x4  x_pa_spsram_64x4        (
`endif
`ifdef DCACHE_8K
pa_spsram_128x4  x_pa_spsram_128x4      (
`endif
`ifdef DCACHE_16K
pa_spsram_256x4  x_pa_spsram_256x4      (
`endif
`ifdef DCACHE_32K
pa_spsram_512x4  x_pa_spsram_512x4      (
`endif
`ifdef DCACHE_64K
pa_spsram_1024x4  x_pa_spsram_1024x4    (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in     (mem_cfg_in    ),
  `endif
  .A              (dirty_idx[`D_TAG_INDEX_WIDTH-1:0]),
  .CEN            (dirty_cen            ),
  .CLK            (dirty_clk            ),
  .GWEN           (dirty_gwen           ),
  .D              (dirty_din            ),
  .Q              (dirty_dout           ),
  .WEN            (dirty_wen            )
);
//csky vperl_on
endmodule
 
