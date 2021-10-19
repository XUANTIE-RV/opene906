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
// &Depend("pa_spsram_32x46.vp"); @19
// &Depend("pa_spsram_64x44.vp"); @20
// &Depend("pa_spsram_128x42.vp"); @21
// &Depend("pa_spsram_256x40.vp"); @22
// &Depend("pa_spsram_512x38.vp"); @23
// &Depend("pa_spsram_1024x36.vp"); @24
// &Depend("gated_clk_cell.vp"); @25

module pa_dcache_tag_array(
  forever_cpuclk,
  cp0_lsu_icg_en,
  pad_yy_icg_scan_en,
  tag_clk_en,
  tag_cen,
  tag_wen,
  tag_din,
  tag_idx,
  tag_gwen,
  tag_dout  
);

parameter D_TAG_TAG_LEN   = `D_TAG_TAG_WIDTH;
parameter D_TAG_INDEX_LEN = `D_TAG_INDEX_WIDTH;

input                          forever_cpuclk;      
input                          cp0_lsu_icg_en;      
input                          pad_yy_icg_scan_en; 
input                          tag_clk_en;          
input                          tag_cen;             
input   [45:0]                 tag_wen;             
input   [45:0]                 tag_din;             
input   [9:0]                  tag_idx;             
input                          tag_gwen;            
output  [45:0]                 tag_dout;            

wire                           forever_cpuclk;      
wire                           cp0_lsu_icg_en;      
wire                           pad_yy_icg_scan_en; 
wire                           tag_clk_en;          
wire                           tag_cen;             
wire    [45:0]                 tag_wen;             
wire    [45:0]                 tag_din;             
wire    [9:0]                  tag_idx;             
wire                           tag_gwen;            
wire    [45:0]                 tag_dout;
wire                           tag_clk;

wire    [2*D_TAG_TAG_LEN+1:0]  tag_wen_raw;             
wire    [2*D_TAG_TAG_LEN+1:0]  tag_din_raw;             
wire    [2*D_TAG_TAG_LEN+1:0]  tag_dout_raw;

assign tag_wen_raw[2*D_TAG_TAG_LEN+1:0] = {tag_wen[45], tag_wen[23+D_TAG_TAG_LEN-1:23], 
                                           tag_wen[22], tag_wen[D_TAG_TAG_LEN-1:0]};

assign tag_din_raw[2*D_TAG_TAG_LEN+1:0] = {tag_din[45], tag_din[23+D_TAG_TAG_LEN-1:23], 
                                           tag_din[22], tag_din[D_TAG_TAG_LEN-1:0]};

assign tag_dout[45:0] = {tag_dout_raw[2*D_TAG_TAG_LEN+1], {(22-D_TAG_TAG_LEN){1'b0}}, tag_dout_raw[2*D_TAG_TAG_LEN:D_TAG_TAG_LEN+1],
                         tag_dout_raw[D_TAG_TAG_LEN],     {(22-D_TAG_TAG_LEN){1'b0}}, tag_dout_raw[D_TAG_TAG_LEN-1:0]};

 //==========================================================
//                 Instance of Gated Cell
//==========================================================
gated_clk_cell  x_dcache_tag_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (tag_clk             ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (tag_clk_en          ),
  .module_en            (cp0_lsu_icg_en      ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);
//csky vperl_off
//==========================================================
//              Instance dcache array
//==========================================================
`ifdef DCACHE_2K
pa_spsram_32x46  x_pa_spsram_32x46 (
`endif
`ifdef DCACHE_4K
pa_spsram_64x44  x_pa_spsram_64x44 (
`endif
`ifdef DCACHE_8K
pa_spsram_128x42  x_pa_spsram_128x42 (
`endif
`ifdef DCACHE_16K
pa_spsram_256x40  x_pa_spsram_256x40 (
`endif
`ifdef DCACHE_32K
pa_spsram_512x38  x_pa_spsram_512x38 (
`endif
`ifdef DCACHE_64K
pa_spsram_1024x36 x_pa_spsram_1024x36 (
`endif
  `ifdef MEM_CFG_IN
  .mem_cfg_in     (mem_cfg_in    ),
  `endif
  .A              (tag_idx[D_TAG_INDEX_LEN-1:0]),
  .CEN            (tag_cen            ),
  .CLK            (tag_clk            ),
  .GWEN           (tag_gwen           ),
  .D              (tag_din_raw[2*D_TAG_TAG_LEN+1:0]),
  .Q              (tag_dout_raw[2*D_TAG_TAG_LEN+1:0]),
  .WEN            (tag_wen_raw[2*D_TAG_TAG_LEN+1:0])
);
//csky vperl_on
endmodule
 
