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
module pa_hpcp_event(
  clk_en,
  cnt_output,
  cnt_wen,
  cp0_hpcp_icg_en,
  cpurst_b,
  forever_cpuclk,
  hpcp_wdata,
  pad_yy_icg_scan_en
);

// &Ports; @23
input           clk_en;            
input           cnt_wen;           
input           cp0_hpcp_icg_en;   
input           cpurst_b;          
input           forever_cpuclk;    
input   [31:0]  hpcp_wdata;        
input           pad_yy_icg_scan_en; 
output  [31:0]  cnt_output;        

// &Regs; @24
reg     [4 :0]  counter;           

// &Wires @25
wire            clk_en;            
wire            cnt_clk;           
wire    [31:0]  cnt_output;        
wire            cnt_wen;           
wire            cp0_hpcp_icg_en;   
wire            cpurst_b;          
wire            forever_cpuclk;    
wire    [31:0]  hpcp_wdata;        
wire            pad_yy_icg_scan_en; 


// &Force("bus","hpcp_wdata",31,0); @27
//==========================================================
//                 Instance of Gated Cell  
//========================================================== 
// &Instance("gated_clk_cell", "x_gated_clk"); @31
gated_clk_cell  x_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cnt_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (clk_en            ),
  .module_en          (cp0_hpcp_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @32
//          .external_en (1'b0), @33
//          .global_en   (1'b1), @34
//          .module_en   (cp0_hpcp_icg_en), @35
//          .local_en    (clk_en), @36
//          .clk_out     (cnt_clk)); @37

//==========================================================
//                 Implementation of counter  
//==========================================================
always @(posedge cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    counter[4:0] <= 5'b0;
  else if(cnt_wen)
    counter[4:0] <= hpcp_wdata[4:0];
  else
    counter[4:0] <= counter[4:0];
end

//output
assign cnt_output[31:0] = {27'b0, counter[4:0]};

// &ModuleEnd; @55
endmodule


