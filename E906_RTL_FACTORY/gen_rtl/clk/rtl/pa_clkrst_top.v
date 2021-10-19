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

// &ModuleBeg; @22
module pa_clkrst_top(
  clk_en,
  clk_en_f,
  cpurst_b,
  forever_cpuclk,
  pad_cpu_rst_b,
  pad_yy_scan_mode,
  pad_yy_scan_rst_b,
  pll_core_cpuclk,
  sync_sys_apb_rst_b,
  sys_apb_clk,
  sys_apb_rst_b
);

// &Ports; @23
input        clk_en;            
input        pad_cpu_rst_b;     
input        pad_yy_scan_mode;  
input        pad_yy_scan_rst_b; 
input        pll_core_cpuclk;   
input        sys_apb_clk;       
input        sys_apb_rst_b;     
output       clk_en_f;          
output       cpurst_b;          
output       forever_cpuclk;    
output       sync_sys_apb_rst_b; 

// &Regs; @24

// &Wires; @25
wire         clk_en;            
wire         clk_en_f;          
wire         cpurst_b;          
wire         forever_cpuclk;    
wire         pad_cpu_rst_b;     
wire         pad_yy_scan_mode;  
wire         pad_yy_scan_rst_b; 
wire         pll_core_cpuclk;   
wire         sync_sys_apb_rst_b; 
wire         sys_apb_clk;       
wire         sys_apb_rst_b;     


// &Force("output", "forever_cpuclk"); @27

//----------------------------------------------------------
// clock top
//----------------------------------------------------------
// &Instance("pa_clk_top"); @32
pa_clk_top  x_pa_clk_top (
  .clk_en          (clk_en         ),
  .clk_en_f        (clk_en_f       ),
  .forever_cpuclk  (forever_cpuclk ),
  .pll_core_cpuclk (pll_core_cpuclk)
);


//----------------------------------------------------------
// reset top
//----------------------------------------------------------
// &Instance("pa_rst_top"); @37
pa_rst_top  x_pa_rst_top (
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .pad_yy_scan_mode   (pad_yy_scan_mode  ),
  .pad_yy_scan_rst_b  (pad_yy_scan_rst_b ),
  .sync_sys_apb_rst_b (sync_sys_apb_rst_b),
  .sys_apb_clk        (sys_apb_clk       ),
  .sys_apb_rst_b      (sys_apb_rst_b     )
);

// &ModuleEnd; @38
endmodule


