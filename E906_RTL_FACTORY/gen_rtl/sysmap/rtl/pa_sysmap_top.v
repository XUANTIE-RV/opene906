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
module pa_sysmap_top(
  cp0_pmp_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ifu_sysmap_pa,
  ifu_sysmap_rst_sample,
  lsu_sysmap_pa,
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
  sysmap_ifu_flg,
  sysmap_lsu_flg,
  sysmap_tcipif_cmplt,
  sysmap_tcipif_rdata,
  tcipif_sysmap_addr,
  tcipif_sysmap_sel,
  tcipif_sysmap_wdata,
  tcipif_sysmap_write
);

// &Ports; @24
input           cp0_pmp_icg_en;           
input           cp0_yy_clk_en;            
input           cpurst_b;                 
input           forever_cpuclk;           
input   [31:0]  ifu_sysmap_pa;            
input           ifu_sysmap_rst_sample;    
input   [31:0]  lsu_sysmap_pa;            
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
output  [4 :0]  sysmap_ifu_flg;           
output  [4 :0]  sysmap_lsu_flg;           
output          sysmap_tcipif_cmplt;      
output  [31:0]  sysmap_tcipif_rdata;      

// &Regs; @25

// &Wires; @26
wire            cp0_pmp_icg_en;           
wire            cp0_yy_clk_en;            
wire            cpurst_b;                 
wire            forever_cpuclk;           
wire    [31:0]  ifu_sysmap_pa;            
wire            ifu_sysmap_rst_sample;    
wire    [31:0]  lsu_sysmap_pa;            
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
wire    [4 :0]  sysmap_flg0;              
wire    [4 :0]  sysmap_flg0_value;        
wire    [4 :0]  sysmap_flg1;              
wire    [4 :0]  sysmap_flg1_value;        
wire    [4 :0]  sysmap_flg2_value;        
wire    [4 :0]  sysmap_flg3_value;        
wire    [4 :0]  sysmap_flg4_value;        
wire    [4 :0]  sysmap_flg5_value;        
wire    [4 :0]  sysmap_flg6_value;        
wire    [4 :0]  sysmap_flg7_value;        
wire    [4 :0]  sysmap_ifu_flg;           
wire    [4 :0]  sysmap_lsu_flg;           
wire    [19:0]  sysmap_pa0;               
wire    [19:0]  sysmap_pa1;               
wire            sysmap_tcipif_cmplt;      
wire    [31:0]  sysmap_tcipif_rdata;      
wire    [15:0]  tcipif_sysmap_addr;       
wire            tcipif_sysmap_sel;        
wire    [31:0]  tcipif_sysmap_wdata;      
wire            tcipif_sysmap_write;      


parameter ADDR_WIDTH = 32-12;
parameter FLG_WIDTH  = 5;

//==========================================================
// System Map top Module
//==========================================================

//------------------------------------------------
// Instance two accesses for IFU and LSU 
//------------------------------------------------
// &ConnRule(s/_y/0/); @38
// &Instance("pa_sysmap_access", "x_ifu_pa_sysmap_access"); @39
pa_sysmap_access  x_ifu_pa_sysmap_access (
  .sysmap_base_addr0_value (sysmap_base_addr0_value),
  .sysmap_base_addr1_value (sysmap_base_addr1_value),
  .sysmap_base_addr2_value (sysmap_base_addr2_value),
  .sysmap_base_addr3_value (sysmap_base_addr3_value),
  .sysmap_base_addr4_value (sysmap_base_addr4_value),
  .sysmap_base_addr5_value (sysmap_base_addr5_value),
  .sysmap_base_addr6_value (sysmap_base_addr6_value),
  .sysmap_base_addr7_value (sysmap_base_addr7_value),
  .sysmap_flg0_value       (sysmap_flg0_value      ),
  .sysmap_flg1_value       (sysmap_flg1_value      ),
  .sysmap_flg2_value       (sysmap_flg2_value      ),
  .sysmap_flg3_value       (sysmap_flg3_value      ),
  .sysmap_flg4_value       (sysmap_flg4_value      ),
  .sysmap_flg5_value       (sysmap_flg5_value      ),
  .sysmap_flg6_value       (sysmap_flg6_value      ),
  .sysmap_flg7_value       (sysmap_flg7_value      ),
  .sysmap_flg_y            (sysmap_flg0            ),
  .sysmap_pa_y             (sysmap_pa0             )
);


// &ConnRule(s/_y/1/); @41
// &Instance("pa_sysmap_access", "x_lsu_pa_sysmap_access"); @42
pa_sysmap_access  x_lsu_pa_sysmap_access (
  .sysmap_base_addr0_value (sysmap_base_addr0_value),
  .sysmap_base_addr1_value (sysmap_base_addr1_value),
  .sysmap_base_addr2_value (sysmap_base_addr2_value),
  .sysmap_base_addr3_value (sysmap_base_addr3_value),
  .sysmap_base_addr4_value (sysmap_base_addr4_value),
  .sysmap_base_addr5_value (sysmap_base_addr5_value),
  .sysmap_base_addr6_value (sysmap_base_addr6_value),
  .sysmap_base_addr7_value (sysmap_base_addr7_value),
  .sysmap_flg0_value       (sysmap_flg0_value      ),
  .sysmap_flg1_value       (sysmap_flg1_value      ),
  .sysmap_flg2_value       (sysmap_flg2_value      ),
  .sysmap_flg3_value       (sysmap_flg3_value      ),
  .sysmap_flg4_value       (sysmap_flg4_value      ),
  .sysmap_flg5_value       (sysmap_flg5_value      ),
  .sysmap_flg6_value       (sysmap_flg6_value      ),
  .sysmap_flg7_value       (sysmap_flg7_value      ),
  .sysmap_flg_y            (sysmap_flg1            ),
  .sysmap_pa_y             (sysmap_pa1             )
);


// IFU Ports
// &Force("bus", "ifu_sysmap_pa", 31, 0); @45
assign sysmap_pa0[19:0] = ifu_sysmap_pa[31:12];
assign sysmap_ifu_flg[4:0] = sysmap_flg0[4:0];

// LSU Ports
// &Force("bus", "lsu_sysmap_pa", 31, 0); @50
assign sysmap_pa1[19:0] = lsu_sysmap_pa[31:12];
assign sysmap_lsu_flg[4:0] = sysmap_flg1[4:0];

// &Instance("pa_sysmap_busif"); @55
pa_sysmap_busif  x_pa_sysmap_busif (
  .cp0_pmp_icg_en            (cp0_pmp_icg_en           ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .ifu_sysmap_rst_sample     (ifu_sysmap_rst_sample    ),
  .pad_cpu_sysmap_addr0      (pad_cpu_sysmap_addr0     ),
  .pad_cpu_sysmap_addr0_attr (pad_cpu_sysmap_addr0_attr),
  .pad_cpu_sysmap_addr1      (pad_cpu_sysmap_addr1     ),
  .pad_cpu_sysmap_addr1_attr (pad_cpu_sysmap_addr1_attr),
  .pad_cpu_sysmap_addr2      (pad_cpu_sysmap_addr2     ),
  .pad_cpu_sysmap_addr2_attr (pad_cpu_sysmap_addr2_attr),
  .pad_cpu_sysmap_addr3      (pad_cpu_sysmap_addr3     ),
  .pad_cpu_sysmap_addr3_attr (pad_cpu_sysmap_addr3_attr),
  .pad_cpu_sysmap_addr4      (pad_cpu_sysmap_addr4     ),
  .pad_cpu_sysmap_addr4_attr (pad_cpu_sysmap_addr4_attr),
  .pad_cpu_sysmap_addr5      (pad_cpu_sysmap_addr5     ),
  .pad_cpu_sysmap_addr5_attr (pad_cpu_sysmap_addr5_attr),
  .pad_cpu_sysmap_addr6      (pad_cpu_sysmap_addr6     ),
  .pad_cpu_sysmap_addr6_attr (pad_cpu_sysmap_addr6_attr),
  .pad_cpu_sysmap_addr7      (pad_cpu_sysmap_addr7     ),
  .pad_cpu_sysmap_addr7_attr (pad_cpu_sysmap_addr7_attr),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .sysmap_base_addr0_value   (sysmap_base_addr0_value  ),
  .sysmap_base_addr1_value   (sysmap_base_addr1_value  ),
  .sysmap_base_addr2_value   (sysmap_base_addr2_value  ),
  .sysmap_base_addr3_value   (sysmap_base_addr3_value  ),
  .sysmap_base_addr4_value   (sysmap_base_addr4_value  ),
  .sysmap_base_addr5_value   (sysmap_base_addr5_value  ),
  .sysmap_base_addr6_value   (sysmap_base_addr6_value  ),
  .sysmap_base_addr7_value   (sysmap_base_addr7_value  ),
  .sysmap_flg0_value         (sysmap_flg0_value        ),
  .sysmap_flg1_value         (sysmap_flg1_value        ),
  .sysmap_flg2_value         (sysmap_flg2_value        ),
  .sysmap_flg3_value         (sysmap_flg3_value        ),
  .sysmap_flg4_value         (sysmap_flg4_value        ),
  .sysmap_flg5_value         (sysmap_flg5_value        ),
  .sysmap_flg6_value         (sysmap_flg6_value        ),
  .sysmap_flg7_value         (sysmap_flg7_value        ),
  .sysmap_tcipif_cmplt       (sysmap_tcipif_cmplt      ),
  .sysmap_tcipif_rdata       (sysmap_tcipif_rdata      ),
  .tcipif_sysmap_addr        (tcipif_sysmap_addr       ),
  .tcipif_sysmap_sel         (tcipif_sysmap_sel        ),
  .tcipif_sysmap_wdata       (tcipif_sysmap_wdata      ),
  .tcipif_sysmap_write       (tcipif_sysmap_write      )
);


// &ModuleEnd; @75
endmodule


