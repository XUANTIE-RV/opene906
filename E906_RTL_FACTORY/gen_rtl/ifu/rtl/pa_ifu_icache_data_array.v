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

module pa_ifu_icache_data_array(
  cp0_yy_clk_en,
  cp0_ifu_icg_en,
  forever_cpuclk,
  icache_data0_dout,
  icache_data1_dout,
  icache_data_cen,
  icache_data_din,
  icache_data_idx,
  icache_data_wen,
  pad_yy_icg_scan_en
);

input           cp0_yy_clk_en;       
input           cp0_ifu_icg_en;       
input           forever_cpuclk;      
input   [1 :0]  icache_data_cen;     
input   [31:0]  icache_data_din;     
input   [12:0]  icache_data_idx;     
input   [1 :0]  icache_data_wen;     
input           pad_yy_icg_scan_en; 
output  [31:0]  icache_data0_dout;   
output  [31:0]  icache_data1_dout;   

wire            cp0_yy_clk_en;       
wire            cp0_ifu_icg_en;       
wire            forever_cpuclk;      
wire    [31:0]  icache_data0_bwen_b; 
wire            icache_data0_cen_b;  
wire            icache_data0_clk;    
wire    [31:0]  icache_data0_dout;   
wire            icache_data0_gwen_b; 
wire            icache_data0_icg_en; 
wire    [31:0]  icache_data1_bwen_b; 
wire            icache_data1_cen_b;  
wire            icache_data1_clk;    
wire    [31:0]  icache_data1_dout;   
wire            icache_data1_gwen_b; 
wire            icache_data1_icg_en; 
wire    [1 :0]  icache_data_cen;     
wire    [31:0]  icache_data_din;     
wire    [12:0]  icache_data_idx;     
wire    [1 :0]  icache_data_wen;     
wire            pad_yy_icg_scan_en; 


//==========================================================
// Icache Data Array Module
// 1. Instance ICG Cell
// 2. Transmit Port Signals
// 3. Instance Memory Cell 
//==========================================================

//------------------------------------------------
// 1. Instance ICG Cell
//------------------------------------------------
assign icache_data1_icg_en = icache_data_cen[1];
gated_clk_cell  x_icache_data1_icg_cell (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (icache_data1_clk    ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (icache_data1_icg_en ),
  .module_en            (cp0_ifu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en)
);

assign icache_data0_icg_en = icache_data_cen[0];
gated_clk_cell  x_icache_data0_icg_cell (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (icache_data0_clk    ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (icache_data0_icg_en ),
  .module_en            (cp0_ifu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en)
);

assign icache_data1_cen_b  = ~icache_data_cen[1];
assign icache_data1_gwen_b = ~icache_data_wen[1];
assign icache_data1_bwen_b[31:0] = ~{32{icache_data_wen[1]}};

assign icache_data0_cen_b  = ~icache_data_cen[0];
assign icache_data0_gwen_b = ~icache_data_wen[0];
assign icache_data0_bwen_b[31:0] = ~{32{icache_data_wen[0]}};

//csky vperl_off
`ifdef ICACHE_2K
pa_spsram_256x32 x_pa_spsram_256x32_1
`endif
`ifdef ICACHE_4K
pa_spsram_512x32 x_pa_spsram_512x32_1
`endif
`ifdef ICACHE_8K
pa_spsram_1024x32 x_pa_spsram_1024x32_1
`endif
`ifdef ICACHE_16K
pa_spsram_2048x32 x_pa_spsram_2048x32_1
`endif
`ifdef ICACHE_32K
pa_spsram_4096x32 x_pa_spsram_4096x32_1
`endif
`ifdef ICACHE_64K
pa_spsram_8192x32 x_pa_spsram_8192x32_1
`endif
(
  `ifdef MEM_CFG_IN
  .mem_cfg_in           (mem_cfg_in          ),
  `endif
  .A                    (icache_data_idx[`I_TAG_INDEX_WIDTH+2:0]),
  .CEN                  (icache_data1_cen_b  ),
  .CLK                  (icache_data1_clk    ),
  .D                    (icache_data_din     ),
  .GWEN                 (icache_data1_gwen_b ),
  .Q                    (icache_data1_dout   ),
  .WEN                  (icache_data1_bwen_b )
);

`ifdef ICACHE_2K
pa_spsram_256x32 x_pa_spsram_256x32_0
`endif
`ifdef ICACHE_4K
pa_spsram_512x32 x_pa_spsram_512x32_0
`endif
`ifdef ICACHE_8K
pa_spsram_1024x32 x_pa_spsram_1024x32_0
`endif
`ifdef ICACHE_16K
pa_spsram_2048x32 x_pa_spsram_2048x32_0
`endif
`ifdef ICACHE_32K
pa_spsram_4096x32 x_pa_spsram_4096x32_0
`endif
`ifdef ICACHE_64K
pa_spsram_8192x32 x_pa_spsram_8192x32_0
`endif
(
  `ifdef MEM_CFG_IN
  .mem_cfg_in           (mem_cfg_in          ),
  `endif
  .A                    (icache_data_idx[`I_TAG_INDEX_WIDTH+2:0]),
  .CEN                  (icache_data0_cen_b  ),
  .CLK                  (icache_data0_clk    ),
  .D                    (icache_data_din     ),
  .GWEN                 (icache_data0_gwen_b ),
  .Q                    (icache_data0_dout   ),
  .WEN                  (icache_data0_bwen_b )
);
//csky vperl_on

endmodule
