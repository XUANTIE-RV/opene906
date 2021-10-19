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
module pa_sysmap_busif(
  cp0_pmp_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ifu_sysmap_rst_sample,
  pad_cpu_sysmap_addr0,
  pad_cpu_sysmap_addr0_attr,
  pad_cpu_sysmap_addr1,
  pad_cpu_sysmap_addr1_attr,
  pad_cpu_sysmap_addr2,
  pad_cpu_sysmap_addr2_attr,
  pad_cpu_sysmap_addr3,
  pad_cpu_sysmap_addr3_attr,
  pad_cpu_sysmap_addr4,
  pad_cpu_sysmap_addr4_attr,
  pad_cpu_sysmap_addr5,
  pad_cpu_sysmap_addr5_attr,
  pad_cpu_sysmap_addr6,
  pad_cpu_sysmap_addr6_attr,
  pad_cpu_sysmap_addr7,
  pad_cpu_sysmap_addr7_attr,
  pad_yy_icg_scan_en,
  sysmap_base_addr0_value,
  sysmap_base_addr1_value,
  sysmap_base_addr2_value,
  sysmap_base_addr3_value,
  sysmap_base_addr4_value,
  sysmap_base_addr5_value,
  sysmap_base_addr6_value,
  sysmap_base_addr7_value,
  sysmap_flg0_value,
  sysmap_flg1_value,
  sysmap_flg2_value,
  sysmap_flg3_value,
  sysmap_flg4_value,
  sysmap_flg5_value,
  sysmap_flg6_value,
  sysmap_flg7_value,
  sysmap_tcipif_cmplt,
  sysmap_tcipif_rdata,
  tcipif_sysmap_addr,
  tcipif_sysmap_sel,
  tcipif_sysmap_wdata,
  tcipif_sysmap_write
);


// &Ports; @25
input           cp0_pmp_icg_en;           
input           cp0_yy_clk_en;            
input           cpurst_b;                 
input           forever_cpuclk;           
input           ifu_sysmap_rst_sample;    
input   [19:0]  pad_cpu_sysmap_addr0;     
input   [2 :0]  pad_cpu_sysmap_addr0_attr; 
input   [19:0]  pad_cpu_sysmap_addr1;     
input   [2 :0]  pad_cpu_sysmap_addr1_attr; 
input   [19:0]  pad_cpu_sysmap_addr2;     
input   [2 :0]  pad_cpu_sysmap_addr2_attr; 
input   [19:0]  pad_cpu_sysmap_addr3;     
input   [2 :0]  pad_cpu_sysmap_addr3_attr; 
input   [19:0]  pad_cpu_sysmap_addr4;     
input   [2 :0]  pad_cpu_sysmap_addr4_attr; 
input   [19:0]  pad_cpu_sysmap_addr5;     
input   [2 :0]  pad_cpu_sysmap_addr5_attr; 
input   [19:0]  pad_cpu_sysmap_addr6;     
input   [2 :0]  pad_cpu_sysmap_addr6_attr; 
input   [19:0]  pad_cpu_sysmap_addr7;     
input   [2 :0]  pad_cpu_sysmap_addr7_attr; 
input           pad_yy_icg_scan_en;       
input   [15:0]  tcipif_sysmap_addr;       
input           tcipif_sysmap_sel;        
input   [31:0]  tcipif_sysmap_wdata;      
input           tcipif_sysmap_write;      
output  [19:0]  sysmap_base_addr0_value;  
output  [19:0]  sysmap_base_addr1_value;  
output  [19:0]  sysmap_base_addr2_value;  
output  [19:0]  sysmap_base_addr3_value;  
output  [19:0]  sysmap_base_addr4_value;  
output  [19:0]  sysmap_base_addr5_value;  
output  [19:0]  sysmap_base_addr6_value;  
output  [19:0]  sysmap_base_addr7_value;  
output  [4 :0]  sysmap_flg0_value;        
output  [4 :0]  sysmap_flg1_value;        
output  [4 :0]  sysmap_flg2_value;        
output  [4 :0]  sysmap_flg3_value;        
output  [4 :0]  sysmap_flg4_value;        
output  [4 :0]  sysmap_flg5_value;        
output  [4 :0]  sysmap_flg6_value;        
output  [4 :0]  sysmap_flg7_value;        
output          sysmap_tcipif_cmplt;      
output  [31:0]  sysmap_tcipif_rdata;      

// &Regs; @26
reg     [31:0]  busif_rdata;              

// &Wires; @27
wire    [15:0]  busif_addr;               
wire            busif_base_addr0_updt;    
wire    [31:0]  busif_base_addr0_value;   
wire            busif_base_addr1_updt;    
wire    [31:0]  busif_base_addr1_value;   
wire            busif_base_addr2_updt;    
wire    [31:0]  busif_base_addr2_value;   
wire            busif_base_addr3_updt;    
wire    [31:0]  busif_base_addr3_value;   
wire            busif_base_addr4_updt;    
wire    [31:0]  busif_base_addr4_value;   
wire            busif_base_addr5_updt;    
wire    [31:0]  busif_base_addr5_value;   
wire            busif_base_addr6_updt;    
wire    [31:0]  busif_base_addr6_value;   
wire            busif_base_addr7_updt;    
wire    [31:0]  busif_base_addr7_value;   
wire            busif_flg0_updt;          
wire    [31:0]  busif_flg0_value;         
wire            busif_flg1_updt;          
wire    [31:0]  busif_flg1_value;         
wire            busif_flg2_updt;          
wire    [31:0]  busif_flg2_value;         
wire            busif_flg3_updt;          
wire    [31:0]  busif_flg3_value;         
wire            busif_flg4_updt;          
wire    [31:0]  busif_flg4_value;         
wire            busif_flg5_updt;          
wire    [31:0]  busif_flg5_value;         
wire            busif_flg6_updt;          
wire    [31:0]  busif_flg6_value;         
wire            busif_flg7_updt;          
wire    [31:0]  busif_flg7_value;         
wire            busif_sel;                
wire            busif_updt;               
wire    [31:0]  busif_wdata;              
wire            busif_write;              
wire            cp0_pmp_icg_en;           
wire            cp0_yy_clk_en;            
wire            cpurst_b;                 
wire            forever_cpuclk;           
wire            ifu_sysmap_rst_sample;    
wire    [19:0]  pad_cpu_sysmap_addr0;     
wire    [2 :0]  pad_cpu_sysmap_addr0_attr; 
wire    [19:0]  pad_cpu_sysmap_addr1;     
wire    [2 :0]  pad_cpu_sysmap_addr1_attr; 
wire    [19:0]  pad_cpu_sysmap_addr2;     
wire    [2 :0]  pad_cpu_sysmap_addr2_attr; 
wire    [19:0]  pad_cpu_sysmap_addr3;     
wire    [2 :0]  pad_cpu_sysmap_addr3_attr; 
wire    [19:0]  pad_cpu_sysmap_addr4;     
wire    [2 :0]  pad_cpu_sysmap_addr4_attr; 
wire    [19:0]  pad_cpu_sysmap_addr5;     
wire    [2 :0]  pad_cpu_sysmap_addr5_attr; 
wire    [19:0]  pad_cpu_sysmap_addr6;     
wire    [2 :0]  pad_cpu_sysmap_addr6_attr; 
wire    [19:0]  pad_cpu_sysmap_addr7;     
wire    [2 :0]  pad_cpu_sysmap_addr7_attr; 
wire            pad_yy_icg_scan_en;       
wire    [19:0]  sysmap_base_addr0_value;  
wire    [19:0]  sysmap_base_addr1_value;  
wire    [19:0]  sysmap_base_addr2_value;  
wire    [19:0]  sysmap_base_addr3_value;  
wire    [19:0]  sysmap_base_addr4_value;  
wire    [19:0]  sysmap_base_addr5_value;  
wire    [19:0]  sysmap_base_addr6_value;  
wire    [19:0]  sysmap_base_addr7_value;  
wire            sysmap_clk;               
wire            sysmap_clk_en;            
wire    [4 :0]  sysmap_flg0_value;        
wire    [4 :0]  sysmap_flg1_value;        
wire    [4 :0]  sysmap_flg2_value;        
wire    [4 :0]  sysmap_flg3_value;        
wire    [4 :0]  sysmap_flg4_value;        
wire    [4 :0]  sysmap_flg5_value;        
wire    [4 :0]  sysmap_flg6_value;        
wire    [4 :0]  sysmap_flg7_value;        
wire            sysmap_tcipif_cmplt;      
wire    [31:0]  sysmap_tcipif_rdata;      
wire    [15:0]  tcipif_sysmap_addr;       
wire            tcipif_sysmap_sel;        
wire    [31:0]  tcipif_sysmap_wdata;      
wire            tcipif_sysmap_write;      


parameter ADDR_WIDTH = 32-12;
parameter FLG_WIDTH  = 5;

parameter BASE_ADDR0_OFFSET = 12'h000;
parameter FLAG0_OFFSET      = 12'h004;
parameter BASE_ADDR1_OFFSET = 12'h008;
parameter FLAG1_OFFSET      = 12'h00c;
parameter BASE_ADDR2_OFFSET = 12'h010;
parameter FLAG2_OFFSET      = 12'h014;
parameter BASE_ADDR3_OFFSET = 12'h018;
parameter FLAG3_OFFSET      = 12'h01C;
parameter BASE_ADDR4_OFFSET = 12'h020;
parameter FLAG4_OFFSET      = 12'h024;
parameter BASE_ADDR5_OFFSET = 12'h028;
parameter FLAG5_OFFSET      = 12'h02C;
parameter BASE_ADDR6_OFFSET = 12'h030;
parameter FLAG6_OFFSET      = 12'h034;
parameter BASE_ADDR7_OFFSET = 12'h038;
parameter FLAG7_OFFSET      = 12'h03C;

assign busif_sel         = tcipif_sysmap_sel;
assign busif_addr[15:0]  = tcipif_sysmap_addr[15:0];
assign busif_write       = tcipif_sysmap_write;
assign busif_wdata[31:0] = tcipif_sysmap_wdata[31:0];

assign busif_updt = busif_sel && busif_write;

assign busif_base_addr0_updt = busif_updt &&  busif_addr[11:0] == BASE_ADDR0_OFFSET;
assign busif_base_addr1_updt = busif_updt &&  busif_addr[11:0] == BASE_ADDR1_OFFSET;
assign busif_base_addr2_updt = busif_updt &&  busif_addr[11:0] == BASE_ADDR2_OFFSET;
assign busif_base_addr3_updt = busif_updt &&  busif_addr[11:0] == BASE_ADDR3_OFFSET;
assign busif_base_addr4_updt = busif_updt &&  busif_addr[11:0] == BASE_ADDR4_OFFSET;
assign busif_base_addr5_updt = busif_updt &&  busif_addr[11:0] == BASE_ADDR5_OFFSET;
assign busif_base_addr6_updt = busif_updt &&  busif_addr[11:0] == BASE_ADDR6_OFFSET;
assign busif_base_addr7_updt = busif_updt &&  busif_addr[11:0] == BASE_ADDR7_OFFSET;

assign busif_flg0_updt = busif_updt &&  busif_addr[11:0] == FLAG0_OFFSET;
assign busif_flg1_updt = busif_updt &&  busif_addr[11:0] == FLAG1_OFFSET;
assign busif_flg2_updt = busif_updt &&  busif_addr[11:0] == FLAG2_OFFSET;
assign busif_flg3_updt = busif_updt &&  busif_addr[11:0] == FLAG3_OFFSET;
assign busif_flg4_updt = busif_updt &&  busif_addr[11:0] == FLAG4_OFFSET;
assign busif_flg5_updt = busif_updt &&  busif_addr[11:0] == FLAG5_OFFSET;
assign busif_flg6_updt = busif_updt &&  busif_addr[11:0] == FLAG6_OFFSET;
assign busif_flg7_updt = busif_updt &&  busif_addr[11:0] == FLAG7_OFFSET;

// &ConnRule(s/_x/0/); @74
// &Instance("pa_sysmap_reg", "x_pa_sysmap_reg_0"); @75
pa_sysmap_reg  x_pa_sysmap_reg_0 (
  .busif_base_addr_x_updt     (busif_base_addr0_updt     ),
  .busif_base_addr_x_value    (busif_base_addr0_value    ),
  .busif_flg_x_updt           (busif_flg0_updt           ),
  .busif_flg_x_value          (busif_flg0_value          ),
  .busif_wdata                (busif_wdata               ),
  .cpurst_b                   (cpurst_b                  ),
  .ifu_sysmap_rst_sample      (ifu_sysmap_rst_sample     ),
  .pad_cpu_sysmap_addr_x      (pad_cpu_sysmap_addr0      ),
  .pad_cpu_sysmap_addr_x_attr (pad_cpu_sysmap_addr0_attr ),
  .sysmap_base_addr_x_value   (sysmap_base_addr0_value   ),
  .sysmap_clk                 (sysmap_clk                ),
  .sysmap_flg_x_value         (sysmap_flg0_value         )
);


// &ConnRule(s/_x/1/); @77
// &Instance("pa_sysmap_reg", "x_pa_sysmap_reg_1"); @78
pa_sysmap_reg  x_pa_sysmap_reg_1 (
  .busif_base_addr_x_updt     (busif_base_addr1_updt     ),
  .busif_base_addr_x_value    (busif_base_addr1_value    ),
  .busif_flg_x_updt           (busif_flg1_updt           ),
  .busif_flg_x_value          (busif_flg1_value          ),
  .busif_wdata                (busif_wdata               ),
  .cpurst_b                   (cpurst_b                  ),
  .ifu_sysmap_rst_sample      (ifu_sysmap_rst_sample     ),
  .pad_cpu_sysmap_addr_x      (pad_cpu_sysmap_addr1      ),
  .pad_cpu_sysmap_addr_x_attr (pad_cpu_sysmap_addr1_attr ),
  .sysmap_base_addr_x_value   (sysmap_base_addr1_value   ),
  .sysmap_clk                 (sysmap_clk                ),
  .sysmap_flg_x_value         (sysmap_flg1_value         )
);


// &ConnRule(s/_x/2/); @80
// &Instance("pa_sysmap_reg", "x_pa_sysmap_reg_2"); @81
pa_sysmap_reg  x_pa_sysmap_reg_2 (
  .busif_base_addr_x_updt     (busif_base_addr2_updt     ),
  .busif_base_addr_x_value    (busif_base_addr2_value    ),
  .busif_flg_x_updt           (busif_flg2_updt           ),
  .busif_flg_x_value          (busif_flg2_value          ),
  .busif_wdata                (busif_wdata               ),
  .cpurst_b                   (cpurst_b                  ),
  .ifu_sysmap_rst_sample      (ifu_sysmap_rst_sample     ),
  .pad_cpu_sysmap_addr_x      (pad_cpu_sysmap_addr2      ),
  .pad_cpu_sysmap_addr_x_attr (pad_cpu_sysmap_addr2_attr ),
  .sysmap_base_addr_x_value   (sysmap_base_addr2_value   ),
  .sysmap_clk                 (sysmap_clk                ),
  .sysmap_flg_x_value         (sysmap_flg2_value         )
);


// &ConnRule(s/_x/3/); @83
// &Instance("pa_sysmap_reg", "x_pa_sysmap_reg_3"); @84
pa_sysmap_reg  x_pa_sysmap_reg_3 (
  .busif_base_addr_x_updt     (busif_base_addr3_updt     ),
  .busif_base_addr_x_value    (busif_base_addr3_value    ),
  .busif_flg_x_updt           (busif_flg3_updt           ),
  .busif_flg_x_value          (busif_flg3_value          ),
  .busif_wdata                (busif_wdata               ),
  .cpurst_b                   (cpurst_b                  ),
  .ifu_sysmap_rst_sample      (ifu_sysmap_rst_sample     ),
  .pad_cpu_sysmap_addr_x      (pad_cpu_sysmap_addr3      ),
  .pad_cpu_sysmap_addr_x_attr (pad_cpu_sysmap_addr3_attr ),
  .sysmap_base_addr_x_value   (sysmap_base_addr3_value   ),
  .sysmap_clk                 (sysmap_clk                ),
  .sysmap_flg_x_value         (sysmap_flg3_value         )
);


// &ConnRule(s/_x/4/); @86
// &Instance("pa_sysmap_reg", "x_pa_sysmap_reg_4"); @87
pa_sysmap_reg  x_pa_sysmap_reg_4 (
  .busif_base_addr_x_updt     (busif_base_addr4_updt     ),
  .busif_base_addr_x_value    (busif_base_addr4_value    ),
  .busif_flg_x_updt           (busif_flg4_updt           ),
  .busif_flg_x_value          (busif_flg4_value          ),
  .busif_wdata                (busif_wdata               ),
  .cpurst_b                   (cpurst_b                  ),
  .ifu_sysmap_rst_sample      (ifu_sysmap_rst_sample     ),
  .pad_cpu_sysmap_addr_x      (pad_cpu_sysmap_addr4      ),
  .pad_cpu_sysmap_addr_x_attr (pad_cpu_sysmap_addr4_attr ),
  .sysmap_base_addr_x_value   (sysmap_base_addr4_value   ),
  .sysmap_clk                 (sysmap_clk                ),
  .sysmap_flg_x_value         (sysmap_flg4_value         )
);


// &ConnRule(s/_x/5/); @89
// &Instance("pa_sysmap_reg", "x_pa_sysmap_reg_5"); @90
pa_sysmap_reg  x_pa_sysmap_reg_5 (
  .busif_base_addr_x_updt     (busif_base_addr5_updt     ),
  .busif_base_addr_x_value    (busif_base_addr5_value    ),
  .busif_flg_x_updt           (busif_flg5_updt           ),
  .busif_flg_x_value          (busif_flg5_value          ),
  .busif_wdata                (busif_wdata               ),
  .cpurst_b                   (cpurst_b                  ),
  .ifu_sysmap_rst_sample      (ifu_sysmap_rst_sample     ),
  .pad_cpu_sysmap_addr_x      (pad_cpu_sysmap_addr5      ),
  .pad_cpu_sysmap_addr_x_attr (pad_cpu_sysmap_addr5_attr ),
  .sysmap_base_addr_x_value   (sysmap_base_addr5_value   ),
  .sysmap_clk                 (sysmap_clk                ),
  .sysmap_flg_x_value         (sysmap_flg5_value         )
);


// &ConnRule(s/_x/6/); @92
// &Instance("pa_sysmap_reg", "x_pa_sysmap_reg_6"); @93
pa_sysmap_reg  x_pa_sysmap_reg_6 (
  .busif_base_addr_x_updt     (busif_base_addr6_updt     ),
  .busif_base_addr_x_value    (busif_base_addr6_value    ),
  .busif_flg_x_updt           (busif_flg6_updt           ),
  .busif_flg_x_value          (busif_flg6_value          ),
  .busif_wdata                (busif_wdata               ),
  .cpurst_b                   (cpurst_b                  ),
  .ifu_sysmap_rst_sample      (ifu_sysmap_rst_sample     ),
  .pad_cpu_sysmap_addr_x      (pad_cpu_sysmap_addr6      ),
  .pad_cpu_sysmap_addr_x_attr (pad_cpu_sysmap_addr6_attr ),
  .sysmap_base_addr_x_value   (sysmap_base_addr6_value   ),
  .sysmap_clk                 (sysmap_clk                ),
  .sysmap_flg_x_value         (sysmap_flg6_value         )
);


// &ConnRule(s/_x/7/); @95
// &Instance("pa_sysmap_reg", "x_pa_sysmap_reg_7"); @96
pa_sysmap_reg  x_pa_sysmap_reg_7 (
  .busif_base_addr_x_updt     (busif_base_addr7_updt     ),
  .busif_base_addr_x_value    (busif_base_addr7_value    ),
  .busif_flg_x_updt           (busif_flg7_updt           ),
  .busif_flg_x_value          (busif_flg7_value          ),
  .busif_wdata                (busif_wdata               ),
  .cpurst_b                   (cpurst_b                  ),
  .ifu_sysmap_rst_sample      (ifu_sysmap_rst_sample     ),
  .pad_cpu_sysmap_addr_x      (pad_cpu_sysmap_addr7      ),
  .pad_cpu_sysmap_addr_x_attr (pad_cpu_sysmap_addr7_attr ),
  .sysmap_base_addr_x_value   (sysmap_base_addr7_value   ),
  .sysmap_clk                 (sysmap_clk                ),
  .sysmap_flg_x_value         (sysmap_flg7_value         )
);


// &CombBeg; @98
always @( busif_flg7_value[31:0]
       or busif_flg2_value[31:0]
       or busif_base_addr7_value[31:0]
       or busif_base_addr2_value[31:0]
       or busif_flg1_value[31:0]
       or busif_addr[11:0]
       or busif_flg5_value[31:0]
       or busif_base_addr6_value[31:0]
       or busif_base_addr1_value[31:0]
       or busif_base_addr0_value[31:0]
       or busif_base_addr4_value[31:0]
       or busif_base_addr5_value[31:0]
       or busif_base_addr3_value[31:0]
       or busif_flg0_value[31:0]
       or busif_flg4_value[31:0]
       or busif_flg6_value[31:0]
       or busif_flg3_value[31:0])
begin
  case(busif_addr[11:0])
    BASE_ADDR0_OFFSET: busif_rdata[31:0] = busif_base_addr0_value[31:0];
    BASE_ADDR1_OFFSET: busif_rdata[31:0] = busif_base_addr1_value[31:0];
    BASE_ADDR2_OFFSET: busif_rdata[31:0] = busif_base_addr2_value[31:0];
    BASE_ADDR3_OFFSET: busif_rdata[31:0] = busif_base_addr3_value[31:0];
    BASE_ADDR4_OFFSET: busif_rdata[31:0] = busif_base_addr4_value[31:0];
    BASE_ADDR5_OFFSET: busif_rdata[31:0] = busif_base_addr5_value[31:0];
    BASE_ADDR6_OFFSET: busif_rdata[31:0] = busif_base_addr6_value[31:0];
    BASE_ADDR7_OFFSET: busif_rdata[31:0] = busif_base_addr7_value[31:0];
    FLAG0_OFFSET:      busif_rdata[31:0] = busif_flg0_value[31:0];
    FLAG1_OFFSET:      busif_rdata[31:0] = busif_flg1_value[31:0];
    FLAG2_OFFSET:      busif_rdata[31:0] = busif_flg2_value[31:0];
    FLAG3_OFFSET:      busif_rdata[31:0] = busif_flg3_value[31:0];
    FLAG4_OFFSET:      busif_rdata[31:0] = busif_flg4_value[31:0];
    FLAG5_OFFSET:      busif_rdata[31:0] = busif_flg5_value[31:0];
    FLAG6_OFFSET:      busif_rdata[31:0] = busif_flg6_value[31:0];
    FLAG7_OFFSET:      busif_rdata[31:0] = busif_flg7_value[31:0];
    default:           busif_rdata[31:0] = 32'b0;
  endcase
// &CombEnd; @118
end

assign sysmap_tcipif_cmplt = busif_sel;
assign sysmap_tcipif_rdata[31:0] = busif_rdata[31:0];

assign sysmap_clk_en = busif_updt | ifu_sysmap_rst_sample;
// &Instance("gated_clk_cell", "x_sysmap_clk"); @124
gated_clk_cell  x_sysmap_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sysmap_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sysmap_clk_en     ),
  .module_en          (cp0_pmp_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @125
//          .external_en (1'b0), @126
//          .global_en   (cp0_yy_clk_en), @127
//          .module_en   (cp0_pmp_icg_en), @128
//          .local_en    (sysmap_clk_en), @129
//          .clk_out     (sysmap_clk)); @130

// &ModuleEnd; @132
endmodule


