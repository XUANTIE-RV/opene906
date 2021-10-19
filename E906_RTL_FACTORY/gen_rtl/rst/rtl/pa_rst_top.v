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
module pa_rst_top(
  cpurst_b,
  forever_cpuclk,
  pad_cpu_rst_b,
  pad_yy_scan_mode,
  pad_yy_scan_rst_b,
  sync_sys_apb_rst_b,
  sys_apb_clk,
  sys_apb_rst_b
);

// &Ports; @23
input        forever_cpuclk;    
input        pad_cpu_rst_b;     
input        pad_yy_scan_mode;  
input        pad_yy_scan_rst_b; 
input        sys_apb_clk;       
input        sys_apb_rst_b;     
output       cpurst_b;          
output       sync_sys_apb_rst_b; 

// &Regs; @24
reg          ciu_rst_ff_1st;    
reg          ciu_rst_ff_2nd;    
reg          ciu_rst_ff_3rd;    
reg          sys_apb_rst_ff_1st; 

// &Wires; @25
wire         async_apb_rst_b;   
wire         async_ciu_rst_b;   
wire         cpurst_b;          
wire         forever_cpuclk;    
wire         pad_cpu_rst_b;     
wire         pad_yy_scan_mode;  
wire         pad_yy_scan_rst_b; 
wire         sync_sys_apb_rst_b; 
wire         sys_apb_clk;       
wire         sys_apb_rst_b;     


assign async_ciu_rst_b = pad_cpu_rst_b;// & !pad_yy_mbist_mode;

always @(posedge forever_cpuclk or negedge async_ciu_rst_b)
begin
  if (!async_ciu_rst_b)
  begin
    ciu_rst_ff_1st <= 1'b0;
    ciu_rst_ff_2nd <= 1'b0;
    ciu_rst_ff_3rd <= 1'b0;
  end
  else
  begin
    ciu_rst_ff_1st <= 1'b1;
    ciu_rst_ff_2nd <= ciu_rst_ff_1st;
    ciu_rst_ff_3rd <= ciu_rst_ff_2nd;
  end
end

assign cpurst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : ciu_rst_ff_3rd;
//assign hadrst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : pad_had_rst_b;
//assign trst_b   = pad_yy_scan_mode ? pad_yy_scan_rst_b : pad_had_jtg_trst_b;


assign async_apb_rst_b = sys_apb_rst_b;// & !pad_yy_mbist_mode;

always @(posedge sys_apb_clk or negedge async_apb_rst_b)
begin
  if (!async_apb_rst_b)
    sys_apb_rst_ff_1st <= 1'b0;
  else
    sys_apb_rst_ff_1st <= 1'b1;
end


assign sync_sys_apb_rst_b = pad_yy_scan_mode ? pad_yy_scan_rst_b : sys_apb_rst_ff_1st;


// &ModuleEnd; @77
endmodule


