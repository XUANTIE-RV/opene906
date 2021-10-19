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
module pa_hpcp_cnt(
  clk_en,
  cnt_adder,
  cnt_en,
  cnt_hwen,
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
input           cnt_adder;         
input           cnt_en;            
input           cnt_hwen;          
input           cnt_wen;           
input           cp0_hpcp_icg_en;   
input           cpurst_b;          
input           forever_cpuclk;    
input   [31:0]  hpcp_wdata;        
input           pad_yy_icg_scan_en; 
output  [63:0]  cnt_output;        

// &Regs; @24
reg     [63:0]  counter;           

// &Wires @25
wire            clk_en;            
wire            cnt_adder;         
wire            cnt_clk;           
wire            cnt_en;            
wire            cnt_hwen;          
wire    [63:0]  cnt_output;        
wire            cnt_wen;           
wire    [63:0]  counter_adder;     
wire            cp0_hpcp_icg_en;   
wire            cpurst_b;          
wire            forever_cpuclk;    
wire    [31:0]  hpcp_wdata;        
wire            pad_yy_icg_scan_en; 


//==========================================================
//                 Instance of Gated Cell  
//========================================================== 
// &Instance("gated_clk_cell", "x_gated_clk"); @30
gated_clk_cell  x_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cnt_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (clk_en            ),
  .module_en          (cp0_hpcp_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @31
//          .external_en (1'b0), @32
//          .global_en   (1'b1), @33
//          .module_en   (cp0_hpcp_icg_en), @34
//          .local_en    (clk_en), @35
//          .clk_out     (cnt_clk)); @36

//==========================================================
//                 Implementation of counter  
//==========================================================
always @(posedge cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    counter[63:0] <= 64'b0;
  else if(cnt_wen)
    counter[63:0] <= {counter[63:32], hpcp_wdata[31:0]};
  else if(cnt_hwen)
    counter[63:0] <= {hpcp_wdata[31:0], counter[31:0]};
  else if(cnt_en)   //if gateclk is not immplented                   
    counter[63:0] <= counter_adder[63:0];
  else
    counter[63:0] <= counter[63:0];
end

assign counter_adder[63:0] = counter[63:0] + {63'b0, cnt_adder};

//output
assign cnt_output[63:0] = counter[63:0];

// &ModuleEnd; @60
endmodule


