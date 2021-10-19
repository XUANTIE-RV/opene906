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
module pa_bmu_top(
  bmu_dahbl_dbus_acc_deny,
  bmu_dahbl_dbus_addr,
  bmu_dahbl_dbus_burst,
  bmu_dahbl_dbus_lock,
  bmu_dahbl_dbus_lrsc,
  bmu_dahbl_dbus_prot,
  bmu_dahbl_dbus_req,
  bmu_dahbl_dbus_req_dp,
  bmu_dahbl_dbus_seq,
  bmu_dahbl_dbus_size,
  bmu_dahbl_dbus_wdata,
  bmu_dahbl_dbus_write,
  bmu_dahbl_ibus_acc_deny,
  bmu_dahbl_ibus_addr,
  bmu_dahbl_ibus_burst,
  bmu_dahbl_ibus_prot,
  bmu_dahbl_ibus_req,
  bmu_dahbl_ibus_req_dp,
  bmu_dahbl_ibus_seq,
  bmu_dahbl_ibus_size,
  bmu_dtu_debug_info,
  bmu_iahbl_dbus_acc_deny,
  bmu_iahbl_dbus_addr,
  bmu_iahbl_dbus_burst,
  bmu_iahbl_dbus_lock,
  bmu_iahbl_dbus_lrsc,
  bmu_iahbl_dbus_prot,
  bmu_iahbl_dbus_req,
  bmu_iahbl_dbus_req_dp,
  bmu_iahbl_dbus_seq,
  bmu_iahbl_dbus_size,
  bmu_iahbl_dbus_wdata,
  bmu_iahbl_dbus_write,
  bmu_iahbl_ibus_acc_deny,
  bmu_iahbl_ibus_addr,
  bmu_iahbl_ibus_burst,
  bmu_iahbl_ibus_prot,
  bmu_iahbl_ibus_req,
  bmu_iahbl_ibus_req_dp,
  bmu_iahbl_ibus_seq,
  bmu_iahbl_ibus_size,
  bmu_ifu_acc_err,
  bmu_ifu_grant,
  bmu_ifu_rdata,
  bmu_ifu_trans_cmplt,
  bmu_lsu_acc_err,
  bmu_lsu_grant,
  bmu_lsu_rdata,
  bmu_lsu_trans_cmplt,
  bmu_sahbl_dbus_acc_deny,
  bmu_sahbl_dbus_addr,
  bmu_sahbl_dbus_burst,
  bmu_sahbl_dbus_lock,
  bmu_sahbl_dbus_lrsc,
  bmu_sahbl_dbus_prot,
  bmu_sahbl_dbus_req,
  bmu_sahbl_dbus_req_dp,
  bmu_sahbl_dbus_seq,
  bmu_sahbl_dbus_size,
  bmu_sahbl_dbus_wdata,
  bmu_sahbl_dbus_write,
  bmu_sahbl_ibus_acc_deny,
  bmu_sahbl_ibus_addr,
  bmu_sahbl_ibus_burst,
  bmu_sahbl_ibus_prot,
  bmu_sahbl_ibus_req,
  bmu_sahbl_ibus_req_dp,
  bmu_sahbl_ibus_seq,
  bmu_sahbl_ibus_size,
  bmu_tcipif_dbus_acc_deny,
  bmu_tcipif_dbus_addr,
  bmu_tcipif_dbus_req,
  bmu_tcipif_dbus_req_dp,
  bmu_tcipif_dbus_size,
  bmu_tcipif_dbus_supv_mode,
  bmu_tcipif_dbus_wdata,
  bmu_tcipif_dbus_write,
  bmu_tcipif_ibus_acc_deny,
  bmu_tcipif_ibus_addr,
  bmu_tcipif_ibus_req,
  bmu_tcipif_ibus_req_dp,
  bmu_tcipif_ibus_size,
  bmu_tcipif_ibus_supv_mode,
  bmu_tcipif_ibus_wdata,
  bmu_tcipif_ibus_write,
  cp0_biu_icg_en,
  cpurst_b,
  dahbl_bmu_dbus_acc_err,
  dahbl_bmu_dbus_data,
  dahbl_bmu_dbus_grnt,
  dahbl_bmu_dbus_trans_cmplt,
  dahbl_bmu_ibus_acc_err,
  dahbl_bmu_ibus_data,
  dahbl_bmu_ibus_grnt,
  dahbl_bmu_ibus_trans_cmplt,
  forever_cpuclk,
  iahbl_bmu_dbus_acc_err,
  iahbl_bmu_dbus_data,
  iahbl_bmu_dbus_grnt,
  iahbl_bmu_dbus_trans_cmplt,
  iahbl_bmu_ibus_acc_err,
  iahbl_bmu_ibus_data,
  iahbl_bmu_ibus_grnt,
  iahbl_bmu_ibus_trans_cmplt,
  ifu_bmu_acc_deny,
  ifu_bmu_addr,
  ifu_bmu_burst,
  ifu_bmu_data_req,
  ifu_bmu_prot,
  ifu_bmu_req,
  ifu_bmu_seq,
  ifu_bmu_size,
  lsu_bmu_acc_deny,
  lsu_bmu_addr,
  lsu_bmu_burst,
  lsu_bmu_lock,
  lsu_bmu_lrsc,
  lsu_bmu_prot,
  lsu_bmu_req,
  lsu_bmu_req_dp,
  lsu_bmu_seq,
  lsu_bmu_size,
  lsu_bmu_wdata,
  lsu_bmu_write,
  pad_bmu_dahbl_base,
  pad_bmu_dahbl_mask,
  pad_bmu_iahbl_base,
  pad_bmu_iahbl_mask,
  pad_cpu_tcip_base,
  pad_yy_icg_scan_en,
  rtu_yy_xx_async_flush,
  sahbl_bmu_dbus_acc_err,
  sahbl_bmu_dbus_data,
  sahbl_bmu_dbus_grnt,
  sahbl_bmu_dbus_trans_cmplt,
  sahbl_bmu_ibus_acc_err,
  sahbl_bmu_ibus_data,
  sahbl_bmu_ibus_grnt,
  sahbl_bmu_ibus_trans_cmplt,
  tcipif_bmu_dbus_acc_err,
  tcipif_bmu_dbus_data,
  tcipif_bmu_dbus_grnt,
  tcipif_bmu_dbus_trans_cmplt,
  tcipif_bmu_ibus_acc_err,
  tcipif_bmu_ibus_data,
  tcipif_bmu_ibus_grnt,
  tcipif_bmu_ibus_trans_cmplt
);

// &Ports; @23
input           cp0_biu_icg_en;             
input           cpurst_b;                   
input           dahbl_bmu_dbus_acc_err;     
input   [31:0]  dahbl_bmu_dbus_data;        
input           dahbl_bmu_dbus_grnt;        
input           dahbl_bmu_dbus_trans_cmplt; 
input           dahbl_bmu_ibus_acc_err;     
input   [31:0]  dahbl_bmu_ibus_data;        
input           dahbl_bmu_ibus_grnt;        
input           dahbl_bmu_ibus_trans_cmplt; 
input           forever_cpuclk;             
input           iahbl_bmu_dbus_acc_err;     
input   [31:0]  iahbl_bmu_dbus_data;        
input           iahbl_bmu_dbus_grnt;        
input           iahbl_bmu_dbus_trans_cmplt; 
input           iahbl_bmu_ibus_acc_err;     
input   [31:0]  iahbl_bmu_ibus_data;        
input           iahbl_bmu_ibus_grnt;        
input           iahbl_bmu_ibus_trans_cmplt; 
input           ifu_bmu_acc_deny;           
input   [31:0]  ifu_bmu_addr;               
input   [2 :0]  ifu_bmu_burst;              
input           ifu_bmu_data_req;           
input   [3 :0]  ifu_bmu_prot;               
input           ifu_bmu_req;                
input           ifu_bmu_seq;                
input   [1 :0]  ifu_bmu_size;               
input           lsu_bmu_acc_deny;           
input   [31:0]  lsu_bmu_addr;               
input   [2 :0]  lsu_bmu_burst;              
input           lsu_bmu_lock;               
input           lsu_bmu_lrsc;               
input   [3 :0]  lsu_bmu_prot;               
input           lsu_bmu_req;                
input           lsu_bmu_req_dp;             
input           lsu_bmu_seq;                
input   [1 :0]  lsu_bmu_size;               
input   [31:0]  lsu_bmu_wdata;              
input           lsu_bmu_write;              
input   [11:0]  pad_bmu_dahbl_base;         
input   [11:0]  pad_bmu_dahbl_mask;         
input   [11:0]  pad_bmu_iahbl_base;         
input   [11:0]  pad_bmu_iahbl_mask;         
input   [31:0]  pad_cpu_tcip_base;          
input           pad_yy_icg_scan_en;         
input           rtu_yy_xx_async_flush;      
input           sahbl_bmu_dbus_acc_err;     
input   [31:0]  sahbl_bmu_dbus_data;        
input           sahbl_bmu_dbus_grnt;        
input           sahbl_bmu_dbus_trans_cmplt; 
input           sahbl_bmu_ibus_acc_err;     
input   [31:0]  sahbl_bmu_ibus_data;        
input           sahbl_bmu_ibus_grnt;        
input           sahbl_bmu_ibus_trans_cmplt; 
input           tcipif_bmu_dbus_acc_err;    
input   [31:0]  tcipif_bmu_dbus_data;       
input           tcipif_bmu_dbus_grnt;       
input           tcipif_bmu_dbus_trans_cmplt; 
input           tcipif_bmu_ibus_acc_err;    
input   [31:0]  tcipif_bmu_ibus_data;       
input           tcipif_bmu_ibus_grnt;       
input           tcipif_bmu_ibus_trans_cmplt; 
output          bmu_dahbl_dbus_acc_deny;    
output  [31:0]  bmu_dahbl_dbus_addr;        
output  [2 :0]  bmu_dahbl_dbus_burst;       
output          bmu_dahbl_dbus_lock;        
output          bmu_dahbl_dbus_lrsc;        
output  [3 :0]  bmu_dahbl_dbus_prot;        
output          bmu_dahbl_dbus_req;         
output          bmu_dahbl_dbus_req_dp;      
output          bmu_dahbl_dbus_seq;         
output  [1 :0]  bmu_dahbl_dbus_size;        
output  [31:0]  bmu_dahbl_dbus_wdata;       
output          bmu_dahbl_dbus_write;       
output          bmu_dahbl_ibus_acc_deny;    
output  [31:0]  bmu_dahbl_ibus_addr;        
output  [2 :0]  bmu_dahbl_ibus_burst;       
output  [3 :0]  bmu_dahbl_ibus_prot;        
output          bmu_dahbl_ibus_req;         
output          bmu_dahbl_ibus_req_dp;      
output          bmu_dahbl_ibus_seq;         
output  [1 :0]  bmu_dahbl_ibus_size;        
output  [3 :0]  bmu_dtu_debug_info;         
output          bmu_iahbl_dbus_acc_deny;    
output  [31:0]  bmu_iahbl_dbus_addr;        
output  [2 :0]  bmu_iahbl_dbus_burst;       
output          bmu_iahbl_dbus_lock;        
output          bmu_iahbl_dbus_lrsc;        
output  [3 :0]  bmu_iahbl_dbus_prot;        
output          bmu_iahbl_dbus_req;         
output          bmu_iahbl_dbus_req_dp;      
output          bmu_iahbl_dbus_seq;         
output  [1 :0]  bmu_iahbl_dbus_size;        
output  [31:0]  bmu_iahbl_dbus_wdata;       
output          bmu_iahbl_dbus_write;       
output          bmu_iahbl_ibus_acc_deny;    
output  [31:0]  bmu_iahbl_ibus_addr;        
output  [2 :0]  bmu_iahbl_ibus_burst;       
output  [3 :0]  bmu_iahbl_ibus_prot;        
output          bmu_iahbl_ibus_req;         
output          bmu_iahbl_ibus_req_dp;      
output          bmu_iahbl_ibus_seq;         
output  [1 :0]  bmu_iahbl_ibus_size;        
output          bmu_ifu_acc_err;            
output          bmu_ifu_grant;              
output  [31:0]  bmu_ifu_rdata;              
output          bmu_ifu_trans_cmplt;        
output          bmu_lsu_acc_err;            
output          bmu_lsu_grant;              
output  [31:0]  bmu_lsu_rdata;              
output          bmu_lsu_trans_cmplt;        
output          bmu_sahbl_dbus_acc_deny;    
output  [31:0]  bmu_sahbl_dbus_addr;        
output  [2 :0]  bmu_sahbl_dbus_burst;       
output          bmu_sahbl_dbus_lock;        
output          bmu_sahbl_dbus_lrsc;        
output  [3 :0]  bmu_sahbl_dbus_prot;        
output          bmu_sahbl_dbus_req;         
output          bmu_sahbl_dbus_req_dp;      
output          bmu_sahbl_dbus_seq;         
output  [1 :0]  bmu_sahbl_dbus_size;        
output  [31:0]  bmu_sahbl_dbus_wdata;       
output          bmu_sahbl_dbus_write;       
output          bmu_sahbl_ibus_acc_deny;    
output  [31:0]  bmu_sahbl_ibus_addr;        
output  [2 :0]  bmu_sahbl_ibus_burst;       
output  [3 :0]  bmu_sahbl_ibus_prot;        
output          bmu_sahbl_ibus_req;         
output          bmu_sahbl_ibus_req_dp;      
output          bmu_sahbl_ibus_seq;         
output  [1 :0]  bmu_sahbl_ibus_size;        
output          bmu_tcipif_dbus_acc_deny;   
output  [31:0]  bmu_tcipif_dbus_addr;       
output          bmu_tcipif_dbus_req;        
output          bmu_tcipif_dbus_req_dp;     
output  [1 :0]  bmu_tcipif_dbus_size;       
output          bmu_tcipif_dbus_supv_mode;  
output  [31:0]  bmu_tcipif_dbus_wdata;      
output          bmu_tcipif_dbus_write;      
output          bmu_tcipif_ibus_acc_deny;   
output  [31:0]  bmu_tcipif_ibus_addr;       
output          bmu_tcipif_ibus_req;        
output          bmu_tcipif_ibus_req_dp;     
output  [1 :0]  bmu_tcipif_ibus_size;       
output          bmu_tcipif_ibus_supv_mode;  
output  [31:0]  bmu_tcipif_ibus_wdata;      
output          bmu_tcipif_ibus_write;      

// &Regs; @24

// &Wires; @25
wire            bmu_clk;                    
wire            bmu_clk_en;                 
wire            bmu_dahbl_dbus_acc_deny;    
wire    [31:0]  bmu_dahbl_dbus_addr;        
wire    [2 :0]  bmu_dahbl_dbus_burst;       
wire            bmu_dahbl_dbus_lock;        
wire            bmu_dahbl_dbus_lrsc;        
wire    [3 :0]  bmu_dahbl_dbus_prot;        
wire            bmu_dahbl_dbus_req;         
wire            bmu_dahbl_dbus_req_dp;      
wire            bmu_dahbl_dbus_seq;         
wire    [1 :0]  bmu_dahbl_dbus_size;        
wire    [31:0]  bmu_dahbl_dbus_wdata;       
wire            bmu_dahbl_dbus_write;       
wire            bmu_dahbl_ibus_acc_deny;    
wire    [31:0]  bmu_dahbl_ibus_addr;        
wire    [2 :0]  bmu_dahbl_ibus_burst;       
wire    [3 :0]  bmu_dahbl_ibus_prot;        
wire            bmu_dahbl_ibus_req;         
wire            bmu_dahbl_ibus_req_dp;      
wire            bmu_dahbl_ibus_seq;         
wire    [1 :0]  bmu_dahbl_ibus_size;        
wire    [31:0]  bmu_dahbl_ibus_wdata;       
wire            bmu_dahbl_ibus_write;       
wire    [3 :0]  bmu_dtu_debug_info;         
wire            bmu_iahbl_dbus_acc_deny;    
wire    [31:0]  bmu_iahbl_dbus_addr;        
wire    [2 :0]  bmu_iahbl_dbus_burst;       
wire            bmu_iahbl_dbus_lock;        
wire            bmu_iahbl_dbus_lrsc;        
wire    [3 :0]  bmu_iahbl_dbus_prot;        
wire            bmu_iahbl_dbus_req;         
wire            bmu_iahbl_dbus_req_dp;      
wire            bmu_iahbl_dbus_seq;         
wire    [1 :0]  bmu_iahbl_dbus_size;        
wire    [31:0]  bmu_iahbl_dbus_wdata;       
wire            bmu_iahbl_dbus_write;       
wire            bmu_iahbl_ibus_acc_deny;    
wire    [31:0]  bmu_iahbl_ibus_addr;        
wire    [2 :0]  bmu_iahbl_ibus_burst;       
wire    [3 :0]  bmu_iahbl_ibus_prot;        
wire            bmu_iahbl_ibus_req;         
wire            bmu_iahbl_ibus_req_dp;      
wire            bmu_iahbl_ibus_seq;         
wire    [1 :0]  bmu_iahbl_ibus_size;        
wire    [31:0]  bmu_iahbl_ibus_wdata;       
wire            bmu_iahbl_ibus_write;       
wire            bmu_ifu_acc_err;            
wire            bmu_ifu_clk_en;             
wire            bmu_ifu_grant;              
wire    [31:0]  bmu_ifu_rdata;              
wire            bmu_ifu_trans_cmplt;        
wire            bmu_lsu_acc_err;            
wire            bmu_lsu_clk_en;             
wire            bmu_lsu_grant;              
wire    [31:0]  bmu_lsu_rdata;              
wire            bmu_lsu_trans_cmplt;        
wire            bmu_sahbl_dbus_acc_deny;    
wire    [31:0]  bmu_sahbl_dbus_addr;        
wire    [2 :0]  bmu_sahbl_dbus_burst;       
wire            bmu_sahbl_dbus_lock;        
wire            bmu_sahbl_dbus_lrsc;        
wire    [3 :0]  bmu_sahbl_dbus_prot;        
wire            bmu_sahbl_dbus_req;         
wire            bmu_sahbl_dbus_req_dp;      
wire            bmu_sahbl_dbus_seq;         
wire    [1 :0]  bmu_sahbl_dbus_size;        
wire    [31:0]  bmu_sahbl_dbus_wdata;       
wire            bmu_sahbl_dbus_write;       
wire            bmu_sahbl_ibus_acc_deny;    
wire    [31:0]  bmu_sahbl_ibus_addr;        
wire    [2 :0]  bmu_sahbl_ibus_burst;       
wire    [3 :0]  bmu_sahbl_ibus_prot;        
wire            bmu_sahbl_ibus_req;         
wire            bmu_sahbl_ibus_req_dp;      
wire            bmu_sahbl_ibus_seq;         
wire    [1 :0]  bmu_sahbl_ibus_size;        
wire    [31:0]  bmu_sahbl_ibus_wdata;       
wire            bmu_sahbl_ibus_write;       
wire            bmu_tcipif_dbus_acc_deny;   
wire    [31:0]  bmu_tcipif_dbus_addr;       
wire            bmu_tcipif_dbus_req;        
wire            bmu_tcipif_dbus_req_dp;     
wire    [1 :0]  bmu_tcipif_dbus_size;       
wire            bmu_tcipif_dbus_supv_mode;  
wire    [31:0]  bmu_tcipif_dbus_wdata;      
wire            bmu_tcipif_dbus_write;      
wire            bmu_tcipif_ibus_acc_deny;   
wire    [31:0]  bmu_tcipif_ibus_addr;       
wire            bmu_tcipif_ibus_req;        
wire            bmu_tcipif_ibus_req_dp;     
wire    [1 :0]  bmu_tcipif_ibus_size;       
wire            bmu_tcipif_ibus_supv_mode;  
wire    [31:0]  bmu_tcipif_ibus_wdata;      
wire            bmu_tcipif_ibus_write;      
wire            cp0_biu_icg_en;             
wire            cpurst_b;                   
wire            dahbl_bmu_dbus_acc_err;     
wire    [31:0]  dahbl_bmu_dbus_data;        
wire            dahbl_bmu_dbus_grnt;        
wire            dahbl_bmu_dbus_trans_cmplt; 
wire            dahbl_bmu_ibus_acc_err;     
wire    [31:0]  dahbl_bmu_ibus_data;        
wire            dahbl_bmu_ibus_grnt;        
wire            dahbl_bmu_ibus_trans_cmplt; 
wire    [1 :0]  dbus_dbginfo;               
wire            forever_cpuclk;             
wire            iahbl_bmu_dbus_acc_err;     
wire    [31:0]  iahbl_bmu_dbus_data;        
wire            iahbl_bmu_dbus_grnt;        
wire            iahbl_bmu_dbus_trans_cmplt; 
wire            iahbl_bmu_ibus_acc_err;     
wire    [31:0]  iahbl_bmu_ibus_data;        
wire            iahbl_bmu_ibus_grnt;        
wire            iahbl_bmu_ibus_trans_cmplt; 
wire    [1 :0]  ibus_dbginfo;               
wire            ifu_bmu_acc_deny;           
wire    [31:0]  ifu_bmu_addr;               
wire    [2 :0]  ifu_bmu_burst;              
wire            ifu_bmu_data_req;           
wire    [3 :0]  ifu_bmu_prot;               
wire            ifu_bmu_req;                
wire            ifu_bmu_seq;                
wire    [1 :0]  ifu_bmu_size;               
wire    [31:0]  ifu_bmu_wdata;              
wire            ifu_bmu_write;              
wire            lsu_bmu_acc_deny;           
wire    [31:0]  lsu_bmu_addr;               
wire    [2 :0]  lsu_bmu_burst;              
wire            lsu_bmu_lock;               
wire            lsu_bmu_lrsc;               
wire    [3 :0]  lsu_bmu_prot;               
wire            lsu_bmu_req;                
wire            lsu_bmu_req_dp;             
wire            lsu_bmu_seq;                
wire    [1 :0]  lsu_bmu_size;               
wire    [31:0]  lsu_bmu_wdata;              
wire            lsu_bmu_write;              
wire    [11:0]  pad_bmu_dahbl_base;         
wire    [11:0]  pad_bmu_dahbl_mask;         
wire    [11:0]  pad_bmu_iahbl_base;         
wire    [11:0]  pad_bmu_iahbl_mask;         
wire    [31:0]  pad_cpu_tcip_base;          
wire            pad_yy_icg_scan_en;         
wire            rtu_yy_xx_async_flush;      
wire            sahbl_bmu_dbus_acc_err;     
wire    [31:0]  sahbl_bmu_dbus_data;        
wire            sahbl_bmu_dbus_grnt;        
wire            sahbl_bmu_dbus_trans_cmplt; 
wire            sahbl_bmu_ibus_acc_err;     
wire    [31:0]  sahbl_bmu_ibus_data;        
wire            sahbl_bmu_ibus_grnt;        
wire            sahbl_bmu_ibus_trans_cmplt; 
wire            tcipif_bmu_dbus_acc_err;    
wire    [31:0]  tcipif_bmu_dbus_data;       
wire            tcipif_bmu_dbus_grnt;       
wire            tcipif_bmu_dbus_trans_cmplt; 
wire            tcipif_bmu_ibus_acc_err;    
wire    [31:0]  tcipif_bmu_ibus_data;       
wire            tcipif_bmu_ibus_grnt;       
wire            tcipif_bmu_ibus_trans_cmplt; 



//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign ifu_bmu_write = 1'b0;
assign ifu_bmu_wdata[31:0] = 32'b0;
// &Force("nonport", "bmu_dahbl_ibus_write") @33
// &Force("nonport", "bmu_dahbl_ibus_wdata") @34
// &Force("nonport", "bmu_iahbl_ibus_write") @35
// &Force("nonport", "bmu_iahbl_ibus_wdata") @36
// &Force("nonport", "bmu_sahbl_ibus_write") @37
// &Force("nonport", "bmu_sahbl_ibus_wdata") @38

//assign bmu_clk_en = bmu_lsu_clk_en | bmu_had_clk_en | bmu_ifu_clk_en;
assign bmu_clk_en = bmu_lsu_clk_en | bmu_ifu_clk_en;

// &Instance("gated_clk_cell", "x_pa_lsu_bmu_gated_clk"); @43
gated_clk_cell  x_pa_lsu_bmu_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bmu_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (bmu_clk_en        ),
  .module_en          (cp0_biu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @44
//          .external_en (1'b0), @45
//          .global_en   (1'b1), @46
//          .module_en   (cp0_biu_icg_en), @47
//          .local_en    (bmu_clk_en), @48
//          .clk_out     (bmu_clk)); @49

// &ConnRule(s/xx/ibus/); @51
// &ConnRule(s/tt/ifu/); @52
// &Instance("pa_bmu_bus_if","x_pa_bmu_ibus_if"); @53
pa_bmu_bus_if  x_pa_bmu_ibus_if (
  .bmu_clk                     (bmu_clk                    ),
  .bmu_dahbl_xx_acc_deny       (bmu_dahbl_ibus_acc_deny    ),
  .bmu_dahbl_xx_addr           (bmu_dahbl_ibus_addr        ),
  .bmu_dahbl_xx_burst          (bmu_dahbl_ibus_burst       ),
  .bmu_dahbl_xx_prot           (bmu_dahbl_ibus_prot        ),
  .bmu_dahbl_xx_req            (bmu_dahbl_ibus_req         ),
  .bmu_dahbl_xx_req_dp         (bmu_dahbl_ibus_req_dp      ),
  .bmu_dahbl_xx_seq            (bmu_dahbl_ibus_seq         ),
  .bmu_dahbl_xx_size           (bmu_dahbl_ibus_size        ),
  .bmu_dahbl_xx_wdata          (bmu_dahbl_ibus_wdata       ),
  .bmu_dahbl_xx_write          (bmu_dahbl_ibus_write       ),
  .bmu_iahbl_xx_acc_deny       (bmu_iahbl_ibus_acc_deny    ),
  .bmu_iahbl_xx_addr           (bmu_iahbl_ibus_addr        ),
  .bmu_iahbl_xx_burst          (bmu_iahbl_ibus_burst       ),
  .bmu_iahbl_xx_prot           (bmu_iahbl_ibus_prot        ),
  .bmu_iahbl_xx_req            (bmu_iahbl_ibus_req         ),
  .bmu_iahbl_xx_req_dp         (bmu_iahbl_ibus_req_dp      ),
  .bmu_iahbl_xx_seq            (bmu_iahbl_ibus_seq         ),
  .bmu_iahbl_xx_size           (bmu_iahbl_ibus_size        ),
  .bmu_iahbl_xx_wdata          (bmu_iahbl_ibus_wdata       ),
  .bmu_iahbl_xx_write          (bmu_iahbl_ibus_write       ),
  .bmu_sahbl_xx_acc_deny       (bmu_sahbl_ibus_acc_deny    ),
  .bmu_sahbl_xx_addr           (bmu_sahbl_ibus_addr        ),
  .bmu_sahbl_xx_burst          (bmu_sahbl_ibus_burst       ),
  .bmu_sahbl_xx_prot           (bmu_sahbl_ibus_prot        ),
  .bmu_sahbl_xx_req            (bmu_sahbl_ibus_req         ),
  .bmu_sahbl_xx_req_dp         (bmu_sahbl_ibus_req_dp      ),
  .bmu_sahbl_xx_seq            (bmu_sahbl_ibus_seq         ),
  .bmu_sahbl_xx_size           (bmu_sahbl_ibus_size        ),
  .bmu_sahbl_xx_wdata          (bmu_sahbl_ibus_wdata       ),
  .bmu_sahbl_xx_write          (bmu_sahbl_ibus_write       ),
  .bmu_tcipif_xx_acc_deny      (bmu_tcipif_ibus_acc_deny   ),
  .bmu_tcipif_xx_addr          (bmu_tcipif_ibus_addr       ),
  .bmu_tcipif_xx_req           (bmu_tcipif_ibus_req        ),
  .bmu_tcipif_xx_req_dp        (bmu_tcipif_ibus_req_dp     ),
  .bmu_tcipif_xx_size          (bmu_tcipif_ibus_size       ),
  .bmu_tcipif_xx_supv_mode     (bmu_tcipif_ibus_supv_mode  ),
  .bmu_tcipif_xx_wdata         (bmu_tcipif_ibus_wdata      ),
  .bmu_tcipif_xx_write         (bmu_tcipif_ibus_write      ),
  .bmu_tt_acc_err              (bmu_ifu_acc_err            ),
  .bmu_tt_clk_en               (bmu_ifu_clk_en             ),
  .bmu_tt_grant                (bmu_ifu_grant              ),
  .bmu_tt_rdata                (bmu_ifu_rdata              ),
  .bmu_tt_trans_cmplt          (bmu_ifu_trans_cmplt        ),
  .cpurst_b                    (cpurst_b                   ),
  .dahbl_bmu_xx_acc_err        (dahbl_bmu_ibus_acc_err     ),
  .dahbl_bmu_xx_data           (dahbl_bmu_ibus_data        ),
  .dahbl_bmu_xx_grnt           (dahbl_bmu_ibus_grnt        ),
  .dahbl_bmu_xx_trans_cmplt    (dahbl_bmu_ibus_trans_cmplt ),
  .iahbl_bmu_xx_acc_err        (iahbl_bmu_ibus_acc_err     ),
  .iahbl_bmu_xx_data           (iahbl_bmu_ibus_data        ),
  .iahbl_bmu_xx_grnt           (iahbl_bmu_ibus_grnt        ),
  .iahbl_bmu_xx_trans_cmplt    (iahbl_bmu_ibus_trans_cmplt ),
  .pad_bmu_dahbl_base          (pad_bmu_dahbl_base         ),
  .pad_bmu_dahbl_mask          (pad_bmu_dahbl_mask         ),
  .pad_bmu_iahbl_base          (pad_bmu_iahbl_base         ),
  .pad_bmu_iahbl_mask          (pad_bmu_iahbl_mask         ),
  .pad_cpu_tcip_base           (pad_cpu_tcip_base          ),
  .sahbl_bmu_xx_acc_err        (sahbl_bmu_ibus_acc_err     ),
  .sahbl_bmu_xx_data           (sahbl_bmu_ibus_data        ),
  .sahbl_bmu_xx_grnt           (sahbl_bmu_ibus_grnt        ),
  .sahbl_bmu_xx_trans_cmplt    (sahbl_bmu_ibus_trans_cmplt ),
  .tcipif_bmu_xx_acc_err       (tcipif_bmu_ibus_acc_err    ),
  .tcipif_bmu_xx_data          (tcipif_bmu_ibus_data       ),
  .tcipif_bmu_xx_grnt          (tcipif_bmu_ibus_grnt       ),
  .tcipif_bmu_xx_trans_cmplt   (tcipif_bmu_ibus_trans_cmplt),
  .tt_bmu_acc_deny             (ifu_bmu_acc_deny           ),
  .tt_bmu_addr                 (ifu_bmu_addr               ),
  .tt_bmu_burst                (ifu_bmu_burst              ),
  .tt_bmu_data_req             (ifu_bmu_data_req           ),
  .tt_bmu_prot                 (ifu_bmu_prot               ),
  .tt_bmu_req                  (ifu_bmu_req                ),
  .tt_bmu_seq                  (ifu_bmu_seq                ),
  .tt_bmu_size                 (ifu_bmu_size               ),
  .tt_bmu_wdata                (ifu_bmu_wdata              ),
  .tt_bmu_write                (ifu_bmu_write              ),
  .xx_dbginfo                  (ibus_dbginfo               )
);


// &Instance("pa_bmu_dbus_if","x_pa_bmu_dbus_if"); @55
pa_bmu_dbus_if  x_pa_bmu_dbus_if (
  .bmu_clk                     (bmu_clk                    ),
  .bmu_dahbl_dbus_acc_deny     (bmu_dahbl_dbus_acc_deny    ),
  .bmu_dahbl_dbus_addr         (bmu_dahbl_dbus_addr        ),
  .bmu_dahbl_dbus_burst        (bmu_dahbl_dbus_burst       ),
  .bmu_dahbl_dbus_lock         (bmu_dahbl_dbus_lock        ),
  .bmu_dahbl_dbus_lrsc         (bmu_dahbl_dbus_lrsc        ),
  .bmu_dahbl_dbus_prot         (bmu_dahbl_dbus_prot        ),
  .bmu_dahbl_dbus_req          (bmu_dahbl_dbus_req         ),
  .bmu_dahbl_dbus_req_dp       (bmu_dahbl_dbus_req_dp      ),
  .bmu_dahbl_dbus_seq          (bmu_dahbl_dbus_seq         ),
  .bmu_dahbl_dbus_size         (bmu_dahbl_dbus_size        ),
  .bmu_dahbl_dbus_wdata        (bmu_dahbl_dbus_wdata       ),
  .bmu_dahbl_dbus_write        (bmu_dahbl_dbus_write       ),
  .bmu_iahbl_dbus_acc_deny     (bmu_iahbl_dbus_acc_deny    ),
  .bmu_iahbl_dbus_addr         (bmu_iahbl_dbus_addr        ),
  .bmu_iahbl_dbus_burst        (bmu_iahbl_dbus_burst       ),
  .bmu_iahbl_dbus_lock         (bmu_iahbl_dbus_lock        ),
  .bmu_iahbl_dbus_lrsc         (bmu_iahbl_dbus_lrsc        ),
  .bmu_iahbl_dbus_prot         (bmu_iahbl_dbus_prot        ),
  .bmu_iahbl_dbus_req          (bmu_iahbl_dbus_req         ),
  .bmu_iahbl_dbus_req_dp       (bmu_iahbl_dbus_req_dp      ),
  .bmu_iahbl_dbus_seq          (bmu_iahbl_dbus_seq         ),
  .bmu_iahbl_dbus_size         (bmu_iahbl_dbus_size        ),
  .bmu_iahbl_dbus_wdata        (bmu_iahbl_dbus_wdata       ),
  .bmu_iahbl_dbus_write        (bmu_iahbl_dbus_write       ),
  .bmu_lsu_acc_err             (bmu_lsu_acc_err            ),
  .bmu_lsu_clk_en              (bmu_lsu_clk_en             ),
  .bmu_lsu_grant               (bmu_lsu_grant              ),
  .bmu_lsu_rdata               (bmu_lsu_rdata              ),
  .bmu_lsu_trans_cmplt         (bmu_lsu_trans_cmplt        ),
  .bmu_sahbl_dbus_acc_deny     (bmu_sahbl_dbus_acc_deny    ),
  .bmu_sahbl_dbus_addr         (bmu_sahbl_dbus_addr        ),
  .bmu_sahbl_dbus_burst        (bmu_sahbl_dbus_burst       ),
  .bmu_sahbl_dbus_lock         (bmu_sahbl_dbus_lock        ),
  .bmu_sahbl_dbus_lrsc         (bmu_sahbl_dbus_lrsc        ),
  .bmu_sahbl_dbus_prot         (bmu_sahbl_dbus_prot        ),
  .bmu_sahbl_dbus_req          (bmu_sahbl_dbus_req         ),
  .bmu_sahbl_dbus_req_dp       (bmu_sahbl_dbus_req_dp      ),
  .bmu_sahbl_dbus_seq          (bmu_sahbl_dbus_seq         ),
  .bmu_sahbl_dbus_size         (bmu_sahbl_dbus_size        ),
  .bmu_sahbl_dbus_wdata        (bmu_sahbl_dbus_wdata       ),
  .bmu_sahbl_dbus_write        (bmu_sahbl_dbus_write       ),
  .bmu_tcipif_dbus_acc_deny    (bmu_tcipif_dbus_acc_deny   ),
  .bmu_tcipif_dbus_addr        (bmu_tcipif_dbus_addr       ),
  .bmu_tcipif_dbus_req         (bmu_tcipif_dbus_req        ),
  .bmu_tcipif_dbus_req_dp      (bmu_tcipif_dbus_req_dp     ),
  .bmu_tcipif_dbus_size        (bmu_tcipif_dbus_size       ),
  .bmu_tcipif_dbus_supv_mode   (bmu_tcipif_dbus_supv_mode  ),
  .bmu_tcipif_dbus_wdata       (bmu_tcipif_dbus_wdata      ),
  .bmu_tcipif_dbus_write       (bmu_tcipif_dbus_write      ),
  .cpurst_b                    (cpurst_b                   ),
  .dahbl_bmu_dbus_acc_err      (dahbl_bmu_dbus_acc_err     ),
  .dahbl_bmu_dbus_data         (dahbl_bmu_dbus_data        ),
  .dahbl_bmu_dbus_grnt         (dahbl_bmu_dbus_grnt        ),
  .dahbl_bmu_dbus_trans_cmplt  (dahbl_bmu_dbus_trans_cmplt ),
  .dbus_dbginfo                (dbus_dbginfo               ),
  .iahbl_bmu_dbus_acc_err      (iahbl_bmu_dbus_acc_err     ),
  .iahbl_bmu_dbus_data         (iahbl_bmu_dbus_data        ),
  .iahbl_bmu_dbus_grnt         (iahbl_bmu_dbus_grnt        ),
  .iahbl_bmu_dbus_trans_cmplt  (iahbl_bmu_dbus_trans_cmplt ),
  .lsu_bmu_acc_deny            (lsu_bmu_acc_deny           ),
  .lsu_bmu_addr                (lsu_bmu_addr               ),
  .lsu_bmu_burst               (lsu_bmu_burst              ),
  .lsu_bmu_lock                (lsu_bmu_lock               ),
  .lsu_bmu_lrsc                (lsu_bmu_lrsc               ),
  .lsu_bmu_prot                (lsu_bmu_prot               ),
  .lsu_bmu_req                 (lsu_bmu_req                ),
  .lsu_bmu_req_dp              (lsu_bmu_req_dp             ),
  .lsu_bmu_seq                 (lsu_bmu_seq                ),
  .lsu_bmu_size                (lsu_bmu_size               ),
  .lsu_bmu_wdata               (lsu_bmu_wdata              ),
  .lsu_bmu_write               (lsu_bmu_write              ),
  .pad_bmu_dahbl_base          (pad_bmu_dahbl_base         ),
  .pad_bmu_dahbl_mask          (pad_bmu_dahbl_mask         ),
  .pad_bmu_iahbl_base          (pad_bmu_iahbl_base         ),
  .pad_bmu_iahbl_mask          (pad_bmu_iahbl_mask         ),
  .pad_cpu_tcip_base           (pad_cpu_tcip_base          ),
  .rtu_yy_xx_async_flush       (rtu_yy_xx_async_flush      ),
  .sahbl_bmu_dbus_acc_err      (sahbl_bmu_dbus_acc_err     ),
  .sahbl_bmu_dbus_data         (sahbl_bmu_dbus_data        ),
  .sahbl_bmu_dbus_grnt         (sahbl_bmu_dbus_grnt        ),
  .sahbl_bmu_dbus_trans_cmplt  (sahbl_bmu_dbus_trans_cmplt ),
  .tcipif_bmu_dbus_acc_err     (tcipif_bmu_dbus_acc_err    ),
  .tcipif_bmu_dbus_data        (tcipif_bmu_dbus_data       ),
  .tcipif_bmu_dbus_grnt        (tcipif_bmu_dbus_grnt       ),
  .tcipif_bmu_dbus_trans_cmplt (tcipif_bmu_dbus_trans_cmplt)
);


// //&ConnRule(s/xx/had/); @57
// //&ConnRule(s/tt/had/); @58
//&Instance("pa_bmu_bus_if","x_pa_bmu_had_if");
//assign had_bmu_acc_deny = 1'b0;
//assign had_bmu_data_req = had_bmu_req;

assign bmu_dtu_debug_info[3:0] = {ibus_dbginfo[1:0],dbus_dbginfo[1:0]};
// &ModuleEnd; @64
endmodule



