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
module pa_sysmap_reg(
  busif_base_addr_x_updt,
  busif_base_addr_x_value,
  busif_flg_x_updt,
  busif_flg_x_value,
  busif_wdata,
  cpurst_b,
  ifu_sysmap_rst_sample,
  pad_cpu_sysmap_addr_x,
  pad_cpu_sysmap_addr_x_attr,
  sysmap_base_addr_x_value,
  sysmap_clk,
  sysmap_flg_x_value
);


// &Ports; @25
input           busif_base_addr_x_updt;    
input           busif_flg_x_updt;          
input   [31:0]  busif_wdata;               
input           cpurst_b;                  
input           ifu_sysmap_rst_sample;     
input   [19:0]  pad_cpu_sysmap_addr_x;     
input   [2 :0]  pad_cpu_sysmap_addr_x_attr; 
input           sysmap_clk;                
output  [31:0]  busif_base_addr_x_value;   
output  [31:0]  busif_flg_x_value;         
output  [19:0]  sysmap_base_addr_x_value;  
output  [4 :0]  sysmap_flg_x_value;        

// &Regs; @26
reg     [19:0]  base_addr_value;           
reg     [2 :0]  flg_value_3;               

// &Wires; @27
wire            busif_base_addr_x_updt;    
wire    [31:0]  busif_base_addr_x_value;   
wire            busif_flg_x_updt;          
wire    [31:0]  busif_flg_x_value;         
wire    [31:0]  busif_wdata;               
wire            cpurst_b;                  
wire            ifu_sysmap_rst_sample;     
wire    [19:0]  pad_cpu_sysmap_addr_x;     
wire    [2 :0]  pad_cpu_sysmap_addr_x_attr; 
wire    [19:0]  sysmap_base_addr_x_value;  
wire            sysmap_clk;                
wire    [4 :0]  sysmap_flg_x_value;        


parameter ADDR_WIDTH = 32-12;
parameter FLG_WIDTH  = 5;

parameter FLG_RST_VALUE = {FLG_WIDTH{1'b0}};
parameter ADDR_RST_VALUE = {ADDR_WIDTH{1'b0}};

// &Force("bus", "busif_wdata", 31, 0); @35
// &Force("bus", "flg_x_reset_value", FLG_WIDTH-1, 0); @36
always @ (posedge sysmap_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    flg_value_3[FLG_WIDTH-3:0] <= {(FLG_WIDTH-2){1'b0}};
  else if(ifu_sysmap_rst_sample)
    flg_value_3[FLG_WIDTH-3:0] <= pad_cpu_sysmap_addr_x_attr[FLG_WIDTH-3:0];
  else if (busif_flg_x_updt)
    flg_value_3[FLG_WIDTH-3:0] <= busif_wdata[FLG_WIDTH-1:2];
end
assign busif_flg_x_value[31:0] = {{(32-FLG_WIDTH){1'b0}}, flg_value_3[FLG_WIDTH-3:0], 2'b0};
assign sysmap_flg_x_value[FLG_WIDTH-1:0] = {flg_value_3[FLG_WIDTH-3:0], 2'b0};

always @ (posedge sysmap_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    base_addr_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(ifu_sysmap_rst_sample)
    base_addr_value[ADDR_WIDTH-1:0] <= pad_cpu_sysmap_addr_x[ADDR_WIDTH-1:0];
  else if (busif_base_addr_x_updt)
    base_addr_value[ADDR_WIDTH-1:0] <= busif_wdata[ADDR_WIDTH-1:0];
end
assign busif_base_addr_x_value[31:0] = {{(32-ADDR_WIDTH){1'b0}}, base_addr_value[ADDR_WIDTH-1:0]};
assign sysmap_base_addr_x_value[ADDR_WIDTH-1:0] = base_addr_value[ADDR_WIDTH-1:0];

// &ModuleEnd; @61
endmodule



