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

// &ModuleBeg; @19
module fpga_clk_gen(
  clk_en,
  clkrst_b,
  cpu_clk,
  gate_en0,
  gate_en1,
  pad_clk,
  penable,
  per_clk,
  pmu_clk,
  prdata,
  psel,
  pwdata,
  pwrite,
  wic_clk
);

// &Ports; @20
input           clkrst_b;      
input           gate_en0;      
input           gate_en1;      
input           pad_clk;       
input           penable;       
input           psel;          
input   [2 :0]  pwdata;        
input           pwrite;        
output          clk_en;        
output          cpu_clk;       
output          per_clk;       
output          pmu_clk;       
output  [31:0]  prdata;        
output          wic_clk;       

// &Regs; @21
reg     [2 :0]  input_clkratio; 
reg     [31:0]  prdata;        

// &Wires; @22
wire            clk_en;        
wire            clkrst_b;      
wire            cpu_clk;       
wire            pad_clk;       
wire            penable;       
wire            per_clk;       
wire            pmu_clk;       
wire            psel;          
wire    [2 :0]  pwdata;        
wire            pwrite;        
wire            wic_clk;       


always@(posedge per_clk or negedge clkrst_b)
begin
  if (!clkrst_b)
    input_clkratio[2:0] <= 3'b0;
  else if(psel && pwrite && penable)
    input_clkratio[2:0] <= pwdata[2:0]; 
end

// &CombBeg; @32
always @( psel
       or pwrite)
begin
if(psel && !pwrite)
begin
  prdata[31:0] <= 32'b0;
end
// &CombEnd; @37
end

assign cpu_clk = pad_clk; 
assign wic_clk = pad_clk;
assign per_clk = pad_clk;
assign pmu_clk = pad_clk;

assign clk_en = 1'b1;
// &Force("output","per_clk"); @45


// &Force("input", "gate_en0"); @48
// &Force("input", "gate_en1"); @49
// &Force("nonport", "input_clkratio"); @50

// &ModuleEnd; @52
endmodule


