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

// &ModuleBeg; @23
module pa_clk_top(
  clk_en,
  clk_en_f,
  forever_cpuclk,
  pll_core_cpuclk
);

// &Ports; @24
input        clk_en;         
input        pll_core_cpuclk; 
output       clk_en_f;       
output       forever_cpuclk; 

// &Regs; @25
reg          clk_en_f;       

// &Wires; @26
wire         clk_en;         
wire         forever_cpuclk; 
wire         pll_core_cpuclk; 


//assign forever_jtgclk = pad_had_jtg_tclk;
assign forever_cpuclk = pll_core_cpuclk;
// &Force("output","forever_cpuclk"); @30
// &Force("output", "axim_clk_en_f"); @32
always@(posedge forever_cpuclk)
begin
  clk_en_f <= clk_en;
end


// &ModuleEnd; @65
endmodule


