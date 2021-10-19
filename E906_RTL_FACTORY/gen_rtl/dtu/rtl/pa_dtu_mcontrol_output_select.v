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
module pa_dtu_mcontrol_output_select(
  action0_mcontrol,
  action1_mcontrol,
  cp0_dtu_icg_en,
  cp0_dtu_wdata,
  cp0_write_tdata1,
  cp0_write_tdata2,
  cp0_write_tdata3,
  cp0_yy_clk_en,
  cpurst_b,
  dtu_ifu_halt_info_vld,
  dtu_lsu_halt_info,
  dtu_lsu_halt_info_vld,
  exe0_16bit,
  exe0_32bit,
  exe1_16bit,
  exe1_32bit,
  forever_cpuclk,
  ifu_dtu_addr_vld0,
  ifu_dtu_addr_vld1,
  ifu_dtu_data_vld0,
  ifu_dtu_data_vld1,
  ifu_dtu_exe_addr0,
  ifu_dtu_exe_addr1,
  ldst_16bit,
  ldst_32bit,
  ldst_8bit,
  ldst_addr_mcontrol,
  ldst_data_mcontrol,
  load_addr_vld,
  load_data_vld,
  lsu_dtu_halt_info,
  lsu_dtu_last_check,
  lsu_dtu_ldst_addr,
  lsu_dtu_ldst_addr_vld,
  lsu_dtu_ldst_bytes_vld,
  lsu_dtu_ldst_data,
  lsu_dtu_ldst_data_vld,
  m0_tdata1,
  m0_tdata2,
  m0_tdata3,
  m0_tinfo,
  m1_tdata1,
  m1_tdata2,
  m1_tdata3,
  m1_tinfo,
  m2_tdata1,
  m2_tdata2,
  m2_tdata3,
  m2_tinfo,
  m3_tdata1,
  m3_tdata2,
  m3_tdata3,
  m3_tinfo,
  m4_tdata1,
  m4_tdata2,
  m4_tdata3,
  m4_tinfo,
  m5_tdata1,
  m5_tdata2,
  m5_tdata3,
  m5_tinfo,
  m6_tdata1,
  m6_tdata2,
  m6_tdata3,
  m6_tinfo,
  m7_tdata1,
  m7_tdata2,
  m7_tdata3,
  m7_tinfo,
  m_mode,
  mcontext,
  mcontrol_halt_info0,
  mcontrol_halt_info1,
  mcontrol_hit,
  pad_yy_icg_scan_en,
  rtu_yy_xx_dbgon,
  store_addr_vld,
  store_data_vld,
  tcontrol,
  tselect_wr_en,
  u_mode
);

// &Ports; @24
input           cp0_dtu_icg_en;                    
input   [31:0]  cp0_dtu_wdata;                     
input           cp0_write_tdata1;                  
input           cp0_write_tdata2;                  
input           cp0_write_tdata3;                  
input           cp0_yy_clk_en;                     
input           cpurst_b;                          
input           exe0_16bit;                        
input           exe0_32bit;                        
input           exe1_16bit;                        
input           exe1_32bit;                        
input           forever_cpuclk;                    
input           ifu_dtu_addr_vld0;                 
input           ifu_dtu_addr_vld1;                 
input           ifu_dtu_data_vld0;                 
input           ifu_dtu_data_vld1;                 
input   [31:0]  ifu_dtu_exe_addr0;                 
input   [31:0]  ifu_dtu_exe_addr1;                 
input           ldst_16bit;                        
input           ldst_32bit;                        
input           ldst_8bit;                         
input           load_addr_vld;                     
input           load_data_vld;                     
input   [14:0]  lsu_dtu_halt_info;                 
input           lsu_dtu_last_check;                
input   [31:0]  lsu_dtu_ldst_addr;                 
input           lsu_dtu_ldst_addr_vld;             
input   [7 :0]  lsu_dtu_ldst_bytes_vld;            
input   [31:0]  lsu_dtu_ldst_data;                 
input           lsu_dtu_ldst_data_vld;             
input           m_mode;                            
input   [31:0]  mcontext;                          
input   [2 :0]  mcontrol_hit;                      
input           pad_yy_icg_scan_en;                
input           rtu_yy_xx_dbgon;                   
input           store_addr_vld;                    
input           store_data_vld;                    
input   [31:0]  tcontrol;                          
input   [9 :0]  tselect_wr_en;                     
input           u_mode;                            
output  [2 :0]  action0_mcontrol;                  
output  [2 :0]  action1_mcontrol;                  
output          dtu_ifu_halt_info_vld;             
output  [14:0]  dtu_lsu_halt_info;                 
output          dtu_lsu_halt_info_vld;             
output          ldst_addr_mcontrol;                
output          ldst_data_mcontrol;                
output  [31:0]  m0_tdata1;                         
output  [31:0]  m0_tdata2;                         
output  [31:0]  m0_tdata3;                         
output  [31:0]  m0_tinfo;                          
output  [31:0]  m1_tdata1;                         
output  [31:0]  m1_tdata2;                         
output  [31:0]  m1_tdata3;                         
output  [31:0]  m1_tinfo;                          
output  [31:0]  m2_tdata1;                         
output  [31:0]  m2_tdata2;                         
output  [31:0]  m2_tdata3;                         
output  [31:0]  m2_tinfo;                          
output  [31:0]  m3_tdata1;                         
output  [31:0]  m3_tdata2;                         
output  [31:0]  m3_tdata3;                         
output  [31:0]  m3_tinfo;                          
output  [31:0]  m4_tdata1;                         
output  [31:0]  m4_tdata2;                         
output  [31:0]  m4_tdata3;                         
output  [31:0]  m4_tinfo;                          
output  [31:0]  m5_tdata1;                         
output  [31:0]  m5_tdata2;                         
output  [31:0]  m5_tdata3;                         
output  [31:0]  m5_tinfo;                          
output  [31:0]  m6_tdata1;                         
output  [31:0]  m6_tdata2;                         
output  [31:0]  m6_tdata3;                         
output  [31:0]  m6_tinfo;                          
output  [31:0]  m7_tdata1;                         
output  [31:0]  m7_tdata2;                         
output  [31:0]  m7_tdata3;                         
output  [31:0]  m7_tinfo;                          
output  [14:0]  mcontrol_halt_info0;               
output  [14:0]  mcontrol_halt_info1;               

// &Regs; @25
reg             cp0_write_tdata1_f;                
reg             exe_cycle2_cannot_hit;             
reg             ldst_cancel;                       
reg             ldst_cycle2_cannot_hit;            
reg     [7 :0]  ldst_match;                        
reg             lsu_dtu_last_check_f;              
reg             need_match_store_data_t0_trigger_f; 
reg     [1 :0]  x_phigher_than_m0_reg_lowbits;     
reg     [1 :0]  x_phigher_than_m1_reg_lowbits;     
reg     [1 :0]  x_phigher_than_m2_reg_lowbits;     
reg     [1 :0]  x_thigher_than_m0_reg_lowbits;     
reg     [1 :0]  x_thigher_than_m1_reg_lowbits;     
reg     [1 :0]  x_thigher_than_m2_reg_lowbits;     

// &Wires; @26
wire    [2 :0]  action0_mcontrol;                  
wire    [2 :0]  action1_mcontrol;                  
wire    [2 :0]  already_match;                     
wire            chain0_timing0_match;              
wire            chain1_timing0_match;              
wire            chain2_timing0_match;              
wire            chain3_timing0_match;              
wire            chain4_timing0_match;              
wire            chain5_timing0_match;              
wire            chain6_timing0_match;              
wire            cp0_dtu_icg_en;                    
wire    [31:0]  cp0_dtu_wdata;                     
wire            cp0_write_tdata1;                  
wire            cp0_write_tdata2;                  
wire            cp0_write_tdata3;                  
wire            cp0_yy_clk_en;                     
wire            cpurst_b;                          
wire            dtu_ifu_halt_info_vld;             
wire    [14:0]  dtu_lsu_halt_info;                 
wire            dtu_lsu_halt_info_vld;             
wire            exe0_16bit;                        
wire            exe0_32bit;                        
wire            exe0_action;                       
wire            exe0_action0;                      
wire            exe0_action01;                     
wire            exe0_action1;                      
wire    [7 :0]  exe0_after_chain_match;            
wire            exe0_after_chain_match0;           
wire            exe0_after_chain_match1;           
wire            exe0_after_chain_match2;           
wire            exe0_after_chain_match3;           
wire            exe0_after_chain_match4;           
wire            exe0_after_chain_match5;           
wire            exe0_after_chain_match6;           
wire            exe0_after_chain_match7;           
wire            exe0_cancel;                       
wire            exe0_chain;                        
wire            exe0_chain_cancel;                 
wire            exe0_have_match;                   
wire    [7 :0]  exe0_match;                        
wire            exe0_may_hit;                      
wire            exe0_single_mcontrol_cancel;       
wire            exe0_timing;                       
wire            exe1_16bit;                        
wire            exe1_32bit;                        
wire            exe1_action;                       
wire            exe1_action0;                      
wire            exe1_action01;                     
wire            exe1_action1;                      
wire    [7 :0]  exe1_after_chain_match;            
wire            exe1_after_chain_match0;           
wire            exe1_after_chain_match1;           
wire            exe1_after_chain_match2;           
wire            exe1_after_chain_match3;           
wire            exe1_after_chain_match4;           
wire            exe1_after_chain_match5;           
wire            exe1_after_chain_match6;           
wire            exe1_after_chain_match7;           
wire            exe1_cancel;                       
wire            exe1_chain;                        
wire            exe1_chain_cancel;                 
wire            exe1_have_match;                   
wire    [7 :0]  exe1_match;                        
wire            exe1_may_hit;                      
wire            exe1_single_mcontrol_cancel;       
wire            exe1_timing;                       
wire            exe_may_hit;                       
wire            forever_cpuclk;                    
wire            have_store_data_timing0;           
wire            have_timing0_match;                
wire            ifu_dtu_addr_vld0;                 
wire            ifu_dtu_addr_vld1;                 
wire            ifu_dtu_data_vld0;                 
wire            ifu_dtu_data_vld1;                 
wire    [31:0]  ifu_dtu_exe_addr0;                 
wire    [31:0]  ifu_dtu_exe_addr1;                 
wire            ldst_16bit;                        
wire            ldst_32bit;                        
wire            ldst_8bit;                         
wire            ldst_action;                       
wire            ldst_action0;                      
wire            ldst_action01;                     
wire            ldst_action1;                      
wire            ldst_addr_mcontrol;                
wire    [7 :0]  ldst_after_chain_match;            
wire            ldst_after_chain_match0;           
wire            ldst_after_chain_match1;           
wire            ldst_after_chain_match2;           
wire            ldst_after_chain_match3;           
wire            ldst_after_chain_match4;           
wire            ldst_after_chain_match5;           
wire            ldst_after_chain_match6;           
wire            ldst_after_chain_match7;           
wire            ldst_chain0_match;                 
wire            ldst_chain1_match;                 
wire            ldst_chain2_match;                 
wire            ldst_chain3_match;                 
wire            ldst_chain4_match;                 
wire            ldst_chain5_match;                 
wire            ldst_chain6_match;                 
wire            ldst_data_mcontrol;                
wire            ldst_have_match;                   
wire            ldst_may_hit;                      
wire            ldst_mcontrol0_single_match;       
wire            ldst_mcontrol0_timing0_match;      
wire            ldst_mcontrol1_single_match;       
wire            ldst_mcontrol1_timing0_match;      
wire            ldst_mcontrol2_single_match;       
wire            ldst_mcontrol2_timing0_match;      
wire            ldst_mcontrol3_single_match;       
wire            ldst_mcontrol3_timing0_match;      
wire            ldst_mcontrol4_single_match;       
wire            ldst_mcontrol4_timing0_match;      
wire            ldst_mcontrol5_single_match;       
wire            ldst_mcontrol5_timing0_match;      
wire            ldst_mcontrol6_single_match;       
wire            ldst_mcontrol6_timing0_match;      
wire            ldst_mcontrol7_single_match;       
wire            ldst_mcontrol7_timing0_match;      
wire            ldst_timing;                       
wire            load_addr_vld;                     
wire            load_data_vld;                     
wire    [14:0]  lsu_dtu_halt_info;                 
wire            lsu_dtu_last_check;                
wire    [31:0]  lsu_dtu_ldst_addr;                 
wire            lsu_dtu_ldst_addr_vld;             
wire    [7 :0]  lsu_dtu_ldst_bytes_vld;            
wire    [31:0]  lsu_dtu_ldst_data;                 
wire            lsu_dtu_ldst_data_vld;             
wire            m0_exe0_action0;                   
wire            m0_exe0_action1;                   
wire            m0_exe0_can_match;                 
wire            m0_exe0_match;                     
wire            m0_exe1_action0;                   
wire            m0_exe1_action1;                   
wire            m0_exe1_can_match;                 
wire            m0_exe1_match;                     
wire            m0_ldst_action0;                   
wire            m0_ldst_action1;                   
wire            m0_ldst_can_match;                 
wire            m0_ldst_match;                     
wire            m0_ldst_timing;                    
wire            m0_mtiming;                        
wire            m0_mtiming_mask;                   
wire            m0_phigher_than_m1;                
wire            m0_phigher_than_m2;                
wire            m0_phigher_than_m3;                
wire            m0_phigher_than_m4;                
wire            m0_phigher_than_m5;                
wire            m0_phigher_than_m6;                
wire            m0_phigher_than_m7;                
wire    [1 :0]  m0_priority;                       
wire    [1 :0]  m0_priority_mask;                  
wire    [31:0]  m0_tdata1;                         
wire    [31:0]  m0_tdata2;                         
wire    [31:0]  m0_tdata3;                         
wire            m0_thigher_than_m1;                
wire            m0_thigher_than_m2;                
wire            m0_thigher_than_m3;                
wire            m0_thigher_than_m4;                
wire            m0_thigher_than_m5;                
wire            m0_thigher_than_m6;                
wire            m0_thigher_than_m7;                
wire    [31:0]  m0_tinfo;                          
wire            m1_exe0_action0;                   
wire            m1_exe0_action1;                   
wire            m1_exe0_can_match;                 
wire            m1_exe0_match;                     
wire            m1_exe1_action0;                   
wire            m1_exe1_action1;                   
wire            m1_exe1_can_match;                 
wire            m1_exe1_match;                     
wire            m1_ldst_action0;                   
wire            m1_ldst_action1;                   
wire            m1_ldst_can_match;                 
wire            m1_ldst_match;                     
wire            m1_ldst_timing;                    
wire            m1_mtiming;                        
wire            m1_mtiming_mask;                   
wire            m1_phigher_than_m0;                
wire            m1_phigher_than_m2;                
wire            m1_phigher_than_m3;                
wire            m1_phigher_than_m4;                
wire            m1_phigher_than_m5;                
wire            m1_phigher_than_m6;                
wire            m1_phigher_than_m7;                
wire    [1 :0]  m1_priority;                       
wire    [1 :0]  m1_priority_mask;                  
wire    [31:0]  m1_tdata1;                         
wire    [31:0]  m1_tdata2;                         
wire    [31:0]  m1_tdata3;                         
wire            m1_thigher_than_m0;                
wire            m1_thigher_than_m2;                
wire            m1_thigher_than_m3;                
wire            m1_thigher_than_m4;                
wire            m1_thigher_than_m5;                
wire            m1_thigher_than_m6;                
wire            m1_thigher_than_m7;                
wire    [31:0]  m1_tinfo;                          
wire            m2_exe0_action0;                   
wire            m2_exe0_action1;                   
wire            m2_exe0_can_match;                 
wire            m2_exe0_match;                     
wire            m2_exe1_action0;                   
wire            m2_exe1_action1;                   
wire            m2_exe1_can_match;                 
wire            m2_exe1_match;                     
wire            m2_ldst_action0;                   
wire            m2_ldst_action1;                   
wire            m2_ldst_can_match;                 
wire            m2_ldst_match;                     
wire            m2_ldst_timing;                    
wire            m2_mtiming;                        
wire            m2_mtiming_mask;                   
wire            m2_phigher_than_m0;                
wire            m2_phigher_than_m1;                
wire            m2_phigher_than_m3;                
wire            m2_phigher_than_m4;                
wire            m2_phigher_than_m5;                
wire            m2_phigher_than_m6;                
wire            m2_phigher_than_m7;                
wire    [1 :0]  m2_priority;                       
wire    [1 :0]  m2_priority_mask;                  
wire    [31:0]  m2_tdata1;                         
wire    [31:0]  m2_tdata2;                         
wire    [31:0]  m2_tdata3;                         
wire            m2_thigher_than_m0;                
wire            m2_thigher_than_m1;                
wire            m2_thigher_than_m3;                
wire            m2_thigher_than_m4;                
wire            m2_thigher_than_m5;                
wire            m2_thigher_than_m6;                
wire            m2_thigher_than_m7;                
wire    [31:0]  m2_tinfo;                          
wire            m3_exe0_action0;                   
wire            m3_exe0_action1;                   
wire            m3_exe0_can_match;                 
wire            m3_exe0_match;                     
wire            m3_exe1_action0;                   
wire            m3_exe1_action1;                   
wire            m3_exe1_can_match;                 
wire            m3_exe1_match;                     
wire            m3_ldst_action0;                   
wire            m3_ldst_action1;                   
wire            m3_ldst_can_match;                 
wire            m3_ldst_match;                     
wire            m3_ldst_timing;                    
wire            m3_mtiming;                        
wire            m3_mtiming_mask;                   
wire            m3_phigher_than_m0;                
wire            m3_phigher_than_m1;                
wire            m3_phigher_than_m2;                
wire            m3_phigher_than_m4;                
wire            m3_phigher_than_m5;                
wire            m3_phigher_than_m6;                
wire            m3_phigher_than_m7;                
wire    [1 :0]  m3_priority;                       
wire    [1 :0]  m3_priority_mask;                  
wire    [31:0]  m3_tdata1;                         
wire    [31:0]  m3_tdata2;                         
wire    [31:0]  m3_tdata3;                         
wire            m3_thigher_than_m0;                
wire            m3_thigher_than_m1;                
wire            m3_thigher_than_m2;                
wire            m3_thigher_than_m4;                
wire            m3_thigher_than_m5;                
wire            m3_thigher_than_m6;                
wire            m3_thigher_than_m7;                
wire    [31:0]  m3_tinfo;                          
wire            m4_exe0_action0;                   
wire            m4_exe0_action1;                   
wire            m4_exe0_can_match;                 
wire            m4_exe0_match;                     
wire            m4_exe1_action0;                   
wire            m4_exe1_action1;                   
wire            m4_exe1_can_match;                 
wire            m4_exe1_match;                     
wire            m4_ldst_action0;                   
wire            m4_ldst_action1;                   
wire            m4_ldst_can_match;                 
wire            m4_ldst_match;                     
wire            m4_ldst_timing;                    
wire            m4_mtiming;                        
wire            m4_mtiming_mask;                   
wire            m4_phigher_than_m0;                
wire            m4_phigher_than_m1;                
wire            m4_phigher_than_m2;                
wire            m4_phigher_than_m3;                
wire            m4_phigher_than_m5;                
wire            m4_phigher_than_m6;                
wire            m4_phigher_than_m7;                
wire    [1 :0]  m4_priority;                       
wire    [1 :0]  m4_priority_mask;                  
wire    [31:0]  m4_tdata1;                         
wire    [31:0]  m4_tdata2;                         
wire    [31:0]  m4_tdata3;                         
wire            m4_thigher_than_m0;                
wire            m4_thigher_than_m1;                
wire            m4_thigher_than_m2;                
wire            m4_thigher_than_m3;                
wire            m4_thigher_than_m5;                
wire            m4_thigher_than_m6;                
wire            m4_thigher_than_m7;                
wire    [31:0]  m4_tinfo;                          
wire            m5_exe0_action0;                   
wire            m5_exe0_action1;                   
wire            m5_exe0_can_match;                 
wire            m5_exe0_match;                     
wire            m5_exe1_action0;                   
wire            m5_exe1_action1;                   
wire            m5_exe1_can_match;                 
wire            m5_exe1_match;                     
wire            m5_ldst_action0;                   
wire            m5_ldst_action1;                   
wire            m5_ldst_can_match;                 
wire            m5_ldst_match;                     
wire            m5_ldst_timing;                    
wire            m5_mtiming;                        
wire            m5_mtiming_mask;                   
wire            m5_phigher_than_m0;                
wire            m5_phigher_than_m1;                
wire            m5_phigher_than_m2;                
wire            m5_phigher_than_m3;                
wire            m5_phigher_than_m4;                
wire            m5_phigher_than_m6;                
wire            m5_phigher_than_m7;                
wire    [1 :0]  m5_priority;                       
wire    [1 :0]  m5_priority_mask;                  
wire    [31:0]  m5_tdata1;                         
wire    [31:0]  m5_tdata2;                         
wire    [31:0]  m5_tdata3;                         
wire            m5_thigher_than_m0;                
wire            m5_thigher_than_m1;                
wire            m5_thigher_than_m2;                
wire            m5_thigher_than_m3;                
wire            m5_thigher_than_m4;                
wire            m5_thigher_than_m6;                
wire            m5_thigher_than_m7;                
wire    [31:0]  m5_tinfo;                          
wire            m6_exe0_action0;                   
wire            m6_exe0_action1;                   
wire            m6_exe0_can_match;                 
wire            m6_exe0_match;                     
wire            m6_exe1_action0;                   
wire            m6_exe1_action1;                   
wire            m6_exe1_can_match;                 
wire            m6_exe1_match;                     
wire            m6_ldst_action0;                   
wire            m6_ldst_action1;                   
wire            m6_ldst_can_match;                 
wire            m6_ldst_match;                     
wire            m6_ldst_timing;                    
wire            m6_mtiming;                        
wire            m6_mtiming_mask;                   
wire            m6_phigher_than_m0;                
wire            m6_phigher_than_m1;                
wire            m6_phigher_than_m2;                
wire            m6_phigher_than_m3;                
wire            m6_phigher_than_m4;                
wire            m6_phigher_than_m5;                
wire            m6_phigher_than_m7;                
wire    [1 :0]  m6_priority;                       
wire    [1 :0]  m6_priority_mask;                  
wire    [31:0]  m6_tdata1;                         
wire    [31:0]  m6_tdata2;                         
wire    [31:0]  m6_tdata3;                         
wire            m6_thigher_than_m0;                
wire            m6_thigher_than_m1;                
wire            m6_thigher_than_m2;                
wire            m6_thigher_than_m3;                
wire            m6_thigher_than_m4;                
wire            m6_thigher_than_m5;                
wire            m6_thigher_than_m7;                
wire    [31:0]  m6_tinfo;                          
wire            m7_exe0_action0;                   
wire            m7_exe0_action1;                   
wire            m7_exe0_can_match;                 
wire            m7_exe0_match;                     
wire            m7_exe1_action0;                   
wire            m7_exe1_action1;                   
wire            m7_exe1_can_match;                 
wire            m7_exe1_match;                     
wire            m7_ldst_action0;                   
wire            m7_ldst_action1;                   
wire            m7_ldst_can_match;                 
wire            m7_ldst_match;                     
wire            m7_ldst_timing;                    
wire            m7_mtiming;                        
wire            m7_mtiming_mask;                   
wire            m7_phigher_than_m0;                
wire            m7_phigher_than_m1;                
wire            m7_phigher_than_m2;                
wire            m7_phigher_than_m3;                
wire            m7_phigher_than_m4;                
wire            m7_phigher_than_m5;                
wire            m7_phigher_than_m6;                
wire    [1 :0]  m7_priority;                       
wire    [1 :0]  m7_priority_mask;                  
wire    [31:0]  m7_tdata1;                         
wire    [31:0]  m7_tdata2;                         
wire    [31:0]  m7_tdata3;                         
wire            m7_thigher_than_m0;                
wire            m7_thigher_than_m1;                
wire            m7_thigher_than_m2;                
wire            m7_thigher_than_m3;                
wire            m7_thigher_than_m4;                
wire            m7_thigher_than_m5;                
wire            m7_thigher_than_m6;                
wire    [31:0]  m7_tinfo;                          
wire            m_mode;                            
wire    [31:0]  mcontext;                          
wire            mcontrol0_action0;                 
wire            mcontrol0_action1;                 
wire            mcontrol0_chain;                   
wire            mcontrol0_dmode;                   
wire            mcontrol0_exe0_match;              
wire            mcontrol0_exe0_may_hit;            
wire            mcontrol0_exe1_match;              
wire            mcontrol0_exe1_may_hit;            
wire            mcontrol0_is_exe;                  
wire            mcontrol0_is_ldst;                 
wire            mcontrol0_is_ldst_addr;            
wire            mcontrol0_is_ldst_data;            
wire            mcontrol0_ldst_match;              
wire            mcontrol0_ldst_may_hit;            
wire            mcontrol0_mtiming;                 
wire            mcontrol0_mtiming_mask;            
wire    [1 :0]  mcontrol0_priority;                
wire    [1 :0]  mcontrol0_priority_mask;           
wire            mcontrol0_store_data_timing0;      
wire            mcontrol0_timing;                  
wire            mcontrol1_action0;                 
wire            mcontrol1_action1;                 
wire            mcontrol1_chain;                   
wire            mcontrol1_dmode;                   
wire            mcontrol1_exe0_match;              
wire            mcontrol1_exe0_may_hit;            
wire            mcontrol1_exe1_match;              
wire            mcontrol1_exe1_may_hit;            
wire            mcontrol1_is_exe;                  
wire            mcontrol1_is_ldst;                 
wire            mcontrol1_is_ldst_addr;            
wire            mcontrol1_is_ldst_data;            
wire            mcontrol1_ldst_match;              
wire            mcontrol1_ldst_may_hit;            
wire            mcontrol1_mtiming;                 
wire            mcontrol1_mtiming_mask;            
wire    [1 :0]  mcontrol1_priority;                
wire    [1 :0]  mcontrol1_priority_mask;           
wire            mcontrol1_store_data_timing0;      
wire            mcontrol1_timing;                  
wire            mcontrol2_action0;                 
wire            mcontrol2_action1;                 
wire            mcontrol2_chain;                   
wire            mcontrol2_dmode;                   
wire            mcontrol2_exe0_match;              
wire            mcontrol2_exe0_may_hit;            
wire            mcontrol2_exe1_match;              
wire            mcontrol2_exe1_may_hit;            
wire            mcontrol2_is_exe;                  
wire            mcontrol2_is_ldst;                 
wire            mcontrol2_is_ldst_addr;            
wire            mcontrol2_is_ldst_data;            
wire            mcontrol2_ldst_match;              
wire            mcontrol2_ldst_may_hit;            
wire            mcontrol2_mtiming;                 
wire            mcontrol2_mtiming_mask;            
wire    [1 :0]  mcontrol2_priority;                
wire    [1 :0]  mcontrol2_priority_mask;           
wire            mcontrol2_store_data_timing0;      
wire            mcontrol2_timing;                  
wire            mcontrol3_action0;                 
wire            mcontrol3_action1;                 
wire            mcontrol3_exe0_match;              
wire            mcontrol3_exe1_match;              
wire            mcontrol3_is_ldst;                 
wire            mcontrol3_is_ldst_data;            
wire            mcontrol3_ldst_match;              
wire            mcontrol3_store_data_timing0;      
wire            mcontrol3_timing;                  
wire            mcontrol4_action0;                 
wire            mcontrol4_action1;                 
wire            mcontrol4_exe0_match;              
wire            mcontrol4_exe1_match;              
wire            mcontrol4_is_ldst;                 
wire            mcontrol4_is_ldst_data;            
wire            mcontrol4_ldst_match;              
wire            mcontrol4_store_data_timing0;      
wire            mcontrol4_timing;                  
wire            mcontrol5_action0;                 
wire            mcontrol5_action1;                 
wire            mcontrol5_exe0_match;              
wire            mcontrol5_exe1_match;              
wire            mcontrol5_is_ldst;                 
wire            mcontrol5_is_ldst_data;            
wire            mcontrol5_ldst_match;              
wire            mcontrol5_store_data_timing0;      
wire            mcontrol5_timing;                  
wire            mcontrol6_action0;                 
wire            mcontrol6_action1;                 
wire            mcontrol6_exe0_match;              
wire            mcontrol6_exe1_match;              
wire            mcontrol6_is_ldst;                 
wire            mcontrol6_is_ldst_data;            
wire            mcontrol6_ldst_match;              
wire            mcontrol6_store_data_timing0;      
wire            mcontrol6_timing;                  
wire            mcontrol7_action0;                 
wire            mcontrol7_action1;                 
wire            mcontrol7_exe0_match;              
wire            mcontrol7_exe1_match;              
wire            mcontrol7_is_ldst;                 
wire            mcontrol7_is_ldst_data;            
wire            mcontrol7_ldst_match;              
wire            mcontrol7_store_data_timing0;      
wire            mcontrol7_timing;                  
wire    [14:0]  mcontrol_halt_info0;               
wire    [14:0]  mcontrol_halt_info1;               
wire    [2 :0]  mcontrol_hit;                      
wire            mcontrol_output_clk;               
wire            mcontrol_output_clk_en;            
wire            need_match_store_data_t0_trigger;  
wire            pad_yy_icg_scan_en;                
wire            rtu_yy_xx_dbgon;                   
wire            store_addr_vld;                    
wire            store_data_vld;                    
wire    [31:0]  tcontrol;                          
wire    [7 :0]  timing0_match;                     
wire    [9 :0]  tselect_wr_en;                     
wire            u_mode;                            
wire    [6 :0]  x_phigher_than_m0;                 
wire    [6 :0]  x_phigher_than_m0_reg;             
wire    [6 :0]  x_phigher_than_m1;                 
wire    [6 :0]  x_phigher_than_m1_reg;             
wire    [6 :0]  x_phigher_than_m2;                 
wire    [6 :0]  x_phigher_than_m2_reg;             
wire    [6 :0]  x_phigher_than_m3;                 
wire    [6 :0]  x_phigher_than_m3_reg;             
wire    [6 :0]  x_phigher_than_m4;                 
wire    [6 :0]  x_phigher_than_m4_reg;             
wire    [6 :0]  x_phigher_than_m5;                 
wire    [6 :0]  x_phigher_than_m5_reg;             
wire    [6 :0]  x_phigher_than_m6;                 
wire    [6 :0]  x_phigher_than_m6_reg;             
wire    [6 :0]  x_phigher_than_m7;                 
wire    [6 :0]  x_phigher_than_m7_reg;             
wire    [6 :0]  x_thigher_than_m0;                 
wire    [6 :0]  x_thigher_than_m0_reg;             
wire    [6 :0]  x_thigher_than_m1;                 
wire    [6 :0]  x_thigher_than_m1_reg;             
wire    [6 :0]  x_thigher_than_m2;                 
wire    [6 :0]  x_thigher_than_m2_reg;             
wire    [6 :0]  x_thigher_than_m3;                 
wire    [6 :0]  x_thigher_than_m3_reg;             
wire    [6 :0]  x_thigher_than_m4;                 
wire    [6 :0]  x_thigher_than_m4_reg;             
wire    [6 :0]  x_thigher_than_m5;                 
wire    [6 :0]  x_thigher_than_m5_reg;             
wire    [6 :0]  x_thigher_than_m6;                 
wire    [6 :0]  x_thigher_than_m6_reg;             
wire    [6 :0]  x_thigher_than_m7;                 
wire    [6 :0]  x_thigher_than_m7_reg;             


//XLEN
parameter XLEN = `TDT_DM_CORE_MAX_XLEN;

// &Force("input","ifu_dtu_exe_addr0");&Force("bus","ifu_dtu_exe_addr0",`PA_WIDTH-1,0); @32
// &Force("input","ifu_dtu_exe_data0");&Force("bus","ifu_dtu_exe_data0",31,0); @33
// &Force("input","ifu_dtu_exe_addr1");&Force("bus","ifu_dtu_exe_addr1",`PA_WIDTH-1,0); @34
// &Force("input","ifu_dtu_exe_data1");&Force("bus","ifu_dtu_exe_data1",31,0); @35
// &Force("input","lsu_dtu_halt_info");&Force("bus","lsu_dtu_halt_info",`TDT_HINFO_WIDTH-1,0); @37
// &Force("input","lsu_dtu_ldst_addr");&Force("bus","lsu_dtu_ldst_addr",`PA_WIDTH-1,0); @38
// &Force("input","lsu_dtu_ldst_addr_vld"); @39
// &Force("input","lsu_dtu_ldst_bytes_vld");&Force("bus","lsu_dtu_ldst_bytes_vld",7,0); @40
// &Force("input","lsu_dtu_ldst_data");&Force("bus","lsu_dtu_ldst_data",XLEN-1,0); @41
// &Force("input","lsu_dtu_ldst_data_vld"); @42
// &Force("input","lsu_dtu_ldst_type");&Force("bus","lsu_dtu_ldst_type",1,0); @43
// &Force("input","lsu_dtu_mem_access_size");&Force("bus","lsu_dtu_mem_access_size",1,0); @44
// &Force("input","lsu_dtu_last_check"); @45
// &Force("output","mcontrol_halt_info0");&Force("bus","mcontrol_halt_info0",`TDT_HINFO_WIDTH-1,0); @47
// &Force("output","mcontrol_halt_info1");&Force("bus","mcontrol_halt_info1",`TDT_HINFO_WIDTH-1,0); @48

//=========================================================
//
//                   Instance mcontrol     
//
//=========================================================
// &Instance("pa_dtu_mcontrol_0","x_pa_dtu_mcontrol_0"); @106
// &Connect( @107
//          .trigger_selected        (tselect_wr_en[0]), @108
//          .set_trigger_hit         (mcontrol_hit), @109
//          .already_match           (already_match), @110
//          .previous_trigger_chian  (1'b0), @111
//          .previous_trigger_dmode  (1'b0), @112
//          .next_trigger_chain      (1'b0), @113
//          .next_trigger_dmode      (1'b0), @114
//          .tdata1_chain            (mcontrol0_chain), @115
//          .tdata1_dmode            (mcontrol0_dmode), @116
//          .tdata1_action0          (mcontrol0_action0), @117
//          .tdata1_action1          (mcontrol0_action1),   @118
//          .tdata1_timing           (mcontrol0_timing), @119
//          .exe_mcontrol            (mcontrol0_is_exe), @120
//          .ldst_mcontrol           (mcontrol0_is_ldst), @121
//          .ldst_addr_mcontrol      (mcontrol0_is_ldst_addr), @122
//          .ldst_data_mcontrol      (mcontrol0_is_ldst_data), @123
//          .mpriority               (mcontrol0_priority), @124
//          .mpriority_mask          (mcontrol0_priority_mask), @125
//          .mtiming                 (mcontrol0_mtiming), @126
//          .mtiming_mask            (mcontrol0_mtiming_mask), @127
//          .next_mpriority          (2'b10), @128
//          .next_mpriority_mask     (2'b00), @129
//          .next_mtiming            (1'b1), @130
//          .next_mtiming_mask       (1'b0), @131
//          .previous_mpriority      (2'b10), @132
//          .previous_mpriority_mask (2'b00), @133
//          .previous_mtiming        (1'b1), @134
//          .previous_mtiming_mask   (1'b0), @135
//          .mpriority_after_chain      (m0_priority), @136
//          .mpriority_mask_after_chain (m0_priority_mask), @137
//          .mtiming_after_chain        (m0_mtiming), @138
//          .mtiming_mask_after_chain   (m0_mtiming_mask), @139
//          .exe0_match              (mcontrol0_exe0_match), @140
//          .exe1_match              (mcontrol0_exe1_match), @141
//          .ldst_match              (mcontrol0_ldst_match), @142
//          .tdata1         (m0_tdata1), @143
//          .tdata2         (m0_tdata2), @144
//          .tdata3         (m0_tdata3), @145
//          .tinfo          (m0_tinfo), @146
//          .ldst_may_hit    (mcontrol0_ldst_may_hit), @147
//          .exe0_may_hit    (mcontrol0_exe0_may_hit), @148
//          .exe1_may_hit    (mcontrol0_exe1_may_hit)); @149
// &Force("bus","tselect_wr_en",9,0); @185
// &Force("nonport","mcontrol0_chain"); @186
// &Force("nonport","mcontrol0_dmode"); @187
// &Force("nonport","mcontrol0_mtiming"); @188
// &Force("nonport","mcontrol0_mtiming_mask"); @189
// &Force("nonport","mcontrol0_priority"); @190
// &Force("nonport","mcontrol0_priority_mask"); @191

// &Instance("pa_dtu_mcontrol_0","x_pa_dtu_mcontrol_0"); @195
// &Connect( @196
//          .trigger_selected        (tselect_wr_en[0]), @197
//          .set_trigger_hit         (mcontrol_hit[0]), @198
//          .already_match           (already_match[0]), @199
//          .previous_trigger_chian  (1'b0), @200
//          .previous_trigger_dmode  (1'b0), @201
//          .next_trigger_chain      (mcontrol1_chain), @202
//          .next_trigger_dmode      (mcontrol1_dmode), @203
//          .tdata1_chain            (mcontrol0_chain), @204
//          .tdata1_dmode            (mcontrol0_dmode), @205
//          .tdata1_action0          (mcontrol0_action0), @206
//          .tdata1_action1          (mcontrol0_action1),   @207
//          .tdata1_timing           (mcontrol0_timing), @208
//          .exe_mcontrol            (mcontrol0_is_exe), @209
//          .ldst_mcontrol           (mcontrol0_is_ldst), @210
//          .ldst_addr_mcontrol      (mcontrol0_is_ldst_addr), @211
//          .ldst_data_mcontrol      (mcontrol0_is_ldst_data), @212
//          .mpriority               (mcontrol0_priority), @213
//          .mpriority_mask          (mcontrol0_priority_mask), @214
//          .mtiming                 (mcontrol0_mtiming), @215
//          .mtiming_mask            (mcontrol0_mtiming_mask), @216
//          .next_mpriority          (mcontrol1_priority), @217
//          .next_mpriority_mask     (mcontrol1_priority_mask), @218
//          .next_mtiming            (mcontrol1_mtiming), @219
//          .next_mtiming_mask       (mcontrol1_mtiming_mask), @220
//          .previous_mpriority      (2'b10), @221
//          .previous_mpriority_mask (2'b00), @222
//          .previous_mtiming        (1'b1), @223
//          .previous_mtiming_mask   (1'b0), @224
//          .mpriority_after_chain      (m0_priority), @225
//          .mpriority_mask_after_chain (m0_priority_mask), @226
//          .mtiming_after_chain        (m0_mtiming), @227
//          .mtiming_mask_after_chain   (m0_mtiming_mask), @228
//          .exe0_match              (mcontrol0_exe0_match), @229
//          .exe1_match              (mcontrol0_exe1_match), @230
//          .ldst_match              (mcontrol0_ldst_match), @231
//          .tdata1         (m0_tdata1), @232
//          .tdata2         (m0_tdata2), @233
//          .tdata3         (m0_tdata3), @234
//          .tinfo          (m0_tinfo), @235
//          .ldst_may_hit    (mcontrol0_ldst_may_hit), @236
//          .exe0_may_hit    (mcontrol0_exe0_may_hit), @237
//          .exe1_may_hit    (mcontrol0_exe1_may_hit)); @238
// &Instance("pa_dtu_mcontrol_1","x_pa_dtu_mcontrol_1"); @240
// &Connect( @241
//          .trigger_selected        (tselect_wr_en[1]), @242
//          .set_trigger_hit         (mcontrol_hit[1]), @243
//          .already_match           (already_match[1]),     @244
//          .previous_trigger_chian  (mcontrol0_chain), @245
//          .previous_trigger_dmode  (mcontrol0_dmode), @246
//          .next_trigger_chain      (1'b0), @247
//          .next_trigger_dmode      (1'b0), @248
//          .tdata1_chain            (mcontrol1_chain), @249
//          .tdata1_dmode            (mcontrol1_dmode), @250
//          .tdata1_action0          (mcontrol1_action0), @251
//          .tdata1_action1          (mcontrol1_action1), @252
//          .tdata1_timing           (mcontrol1_timing), @253
//          .exe_mcontrol            (mcontrol1_is_exe), @254
//          .ldst_mcontrol           (mcontrol1_is_ldst), @255
//          .ldst_addr_mcontrol      (mcontrol1_is_ldst_addr), @256
//          .ldst_data_mcontrol      (mcontrol1_is_ldst_data), @257
//          .mpriority               (mcontrol1_priority), @258
//          .mpriority_mask          (mcontrol1_priority_mask), @259
//          .mtiming                 (mcontrol1_mtiming), @260
//          .mtiming_mask            (mcontrol1_mtiming_mask), @261
//          .next_mpriority          (2'b10), @262
//          .next_mpriority_mask     (2'b00), @263
//          .next_mtiming            (1'b1), @264
//          .next_mtiming_mask       (1'b0), @265
//          .previous_mpriority      (mcontrol0_priority), @266
//          .previous_mpriority_mask (mcontrol0_priority_mask), @267
//          .previous_mtiming        (mcontrol0_mtiming), @268
//          .previous_mtiming_mask   (mcontrol0_mtiming_mask), @269
//          .mpriority_after_chain      (m1_priority), @270
//          .mpriority_mask_after_chain (m1_priority_mask), @271
//          .mtiming_after_chain        (m1_mtiming), @272
//          .mtiming_mask_after_chain   (m1_mtiming_mask), @273
//          .exe0_match              (mcontrol1_exe0_match), @274
//          .exe1_match              (mcontrol1_exe1_match), @275
//          .ldst_match              (mcontrol1_ldst_match), @276
//          .tdata1         (m1_tdata1), @277
//          .tdata2         (m1_tdata2), @278
//          .tdata3         (m1_tdata3), @279
//          .tinfo          (m1_tinfo), @280
//          .ldst_may_hit   (mcontrol1_ldst_may_hit), @281
//          .exe0_may_hit    (mcontrol1_exe0_may_hit), @282
//          .exe1_may_hit    (mcontrol1_exe1_may_hit)); @283
// &Force("bus","tselect_wr_en",9,0); @314

// &Instance("pa_dtu_mcontrol_0","x_pa_dtu_mcontrol_0"); @318
pa_dtu_mcontrol_0  x_pa_dtu_mcontrol_0 (
  .already_match              (already_match[0]          ),
  .cp0_dtu_icg_en             (cp0_dtu_icg_en            ),
  .cp0_dtu_wdata              (cp0_dtu_wdata             ),
  .cp0_write_tdata1           (cp0_write_tdata1          ),
  .cp0_write_tdata2           (cp0_write_tdata2          ),
  .cp0_write_tdata3           (cp0_write_tdata3          ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .exe0_16bit                 (exe0_16bit                ),
  .exe0_32bit                 (exe0_32bit                ),
  .exe0_match                 (mcontrol0_exe0_match      ),
  .exe0_may_hit               (mcontrol0_exe0_may_hit    ),
  .exe1_16bit                 (exe1_16bit                ),
  .exe1_32bit                 (exe1_32bit                ),
  .exe1_match                 (mcontrol0_exe1_match      ),
  .exe1_may_hit               (mcontrol0_exe1_may_hit    ),
  .exe_mcontrol               (mcontrol0_is_exe          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .ifu_dtu_addr_vld0          (ifu_dtu_addr_vld0         ),
  .ifu_dtu_addr_vld1          (ifu_dtu_addr_vld1         ),
  .ifu_dtu_data_vld0          (ifu_dtu_data_vld0         ),
  .ifu_dtu_data_vld1          (ifu_dtu_data_vld1         ),
  .ifu_dtu_exe_addr0          (ifu_dtu_exe_addr0         ),
  .ifu_dtu_exe_addr1          (ifu_dtu_exe_addr1         ),
  .ldst_16bit                 (ldst_16bit                ),
  .ldst_32bit                 (ldst_32bit                ),
  .ldst_8bit                  (ldst_8bit                 ),
  .ldst_addr_mcontrol         (mcontrol0_is_ldst_addr    ),
  .ldst_data_mcontrol         (mcontrol0_is_ldst_data    ),
  .ldst_match                 (mcontrol0_ldst_match      ),
  .ldst_may_hit               (mcontrol0_ldst_may_hit    ),
  .ldst_mcontrol              (mcontrol0_is_ldst         ),
  .load_addr_vld              (load_addr_vld             ),
  .load_data_vld              (load_data_vld             ),
  .lsu_dtu_ldst_addr          (lsu_dtu_ldst_addr         ),
  .lsu_dtu_ldst_addr_vld      (lsu_dtu_ldst_addr_vld     ),
  .lsu_dtu_ldst_bytes_vld     (lsu_dtu_ldst_bytes_vld    ),
  .lsu_dtu_ldst_data          (lsu_dtu_ldst_data         ),
  .lsu_dtu_ldst_data_vld      (lsu_dtu_ldst_data_vld     ),
  .m_mode                     (m_mode                    ),
  .mcontext                   (mcontext                  ),
  .mpriority                  (mcontrol0_priority        ),
  .mpriority_after_chain      (m0_priority               ),
  .mpriority_mask             (mcontrol0_priority_mask   ),
  .mpriority_mask_after_chain (m0_priority_mask          ),
  .mtiming                    (mcontrol0_mtiming         ),
  .mtiming_after_chain        (m0_mtiming                ),
  .mtiming_mask               (mcontrol0_mtiming_mask    ),
  .mtiming_mask_after_chain   (m0_mtiming_mask           ),
  .next_mpriority             (mcontrol1_priority        ),
  .next_mpriority_mask        (mcontrol1_priority_mask   ),
  .next_mtiming               (mcontrol1_mtiming         ),
  .next_mtiming_mask          (mcontrol1_mtiming_mask    ),
  .next_trigger_chain         (mcontrol1_chain           ),
  .next_trigger_dmode         (mcontrol1_dmode           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .previous_mpriority         (2'b10                     ),
  .previous_mpriority_mask    (2'b00                     ),
  .previous_mtiming           (1'b1                      ),
  .previous_mtiming_mask      (1'b0                      ),
  .previous_trigger_chian     (1'b0                      ),
  .previous_trigger_dmode     (1'b0                      ),
  .rtu_yy_xx_dbgon            (rtu_yy_xx_dbgon           ),
  .set_trigger_hit            (mcontrol_hit[0]           ),
  .store_addr_vld             (store_addr_vld            ),
  .store_data_vld             (store_data_vld            ),
  .tcontrol                   (tcontrol                  ),
  .tdata1                     (m0_tdata1                 ),
  .tdata1_action0             (mcontrol0_action0         ),
  .tdata1_action1             (mcontrol0_action1         ),
  .tdata1_chain               (mcontrol0_chain           ),
  .tdata1_dmode               (mcontrol0_dmode           ),
  .tdata1_timing              (mcontrol0_timing          ),
  .tdata2                     (m0_tdata2                 ),
  .tdata3                     (m0_tdata3                 ),
  .tinfo                      (m0_tinfo                  ),
  .trigger_selected           (tselect_wr_en[0]          ),
  .u_mode                     (u_mode                    )
);

// &Connect( @319
//          .trigger_selected        (tselect_wr_en[0]), @320
//          .set_trigger_hit         (mcontrol_hit[0]), @321
//          .already_match           (already_match[0]), @322
//          .previous_trigger_chian  (1'b0), @323
//          .previous_trigger_dmode  (1'b0), @324
//          .next_trigger_chain      (mcontrol1_chain), @325
//          .next_trigger_dmode      (mcontrol1_dmode), @326
//          .tdata1_chain            (mcontrol0_chain), @327
//          .tdata1_dmode            (mcontrol0_dmode), @328
//          .tdata1_action0          (mcontrol0_action0), @329
//          .tdata1_action1          (mcontrol0_action1),   @330
//          .tdata1_timing           (mcontrol0_timing), @331
//          .exe_mcontrol            (mcontrol0_is_exe), @332
//          .ldst_mcontrol           (mcontrol0_is_ldst), @333
//          .ldst_addr_mcontrol      (mcontrol0_is_ldst_addr), @334
//          .ldst_data_mcontrol      (mcontrol0_is_ldst_data), @335
//          .mpriority               (mcontrol0_priority), @336
//          .mpriority_mask          (mcontrol0_priority_mask), @337
//          .mtiming                 (mcontrol0_mtiming), @338
//          .mtiming_mask            (mcontrol0_mtiming_mask), @339
//          .next_mpriority          (mcontrol1_priority), @340
//          .next_mpriority_mask     (mcontrol1_priority_mask), @341
//          .next_mtiming            (mcontrol1_mtiming), @342
//          .next_mtiming_mask       (mcontrol1_mtiming_mask), @343
//          .previous_mpriority      (2'b10), @344
//          .previous_mpriority_mask (2'b00), @345
//          .previous_mtiming        (1'b1), @346
//          .previous_mtiming_mask   (1'b0), @347
//          .mpriority_after_chain      (m0_priority), @348
//          .mpriority_mask_after_chain (m0_priority_mask), @349
//          .mtiming_after_chain        (m0_mtiming), @350
//          .mtiming_mask_after_chain   (m0_mtiming_mask), @351
//          .exe0_match              (mcontrol0_exe0_match), @352
//          .exe1_match              (mcontrol0_exe1_match), @353
//          .ldst_match              (mcontrol0_ldst_match), @354
//          .tdata1         (m0_tdata1), @355
//          .tdata2         (m0_tdata2), @356
//          .tdata3         (m0_tdata3), @357
//          .tinfo          (m0_tinfo), @358
//          .ldst_may_hit    (mcontrol0_ldst_may_hit), @359
//          .exe0_may_hit    (mcontrol0_exe0_may_hit), @360
//          .exe1_may_hit    (mcontrol0_exe1_may_hit)); @361

// &Instance("pa_dtu_mcontrol_1","x_pa_dtu_mcontrol_1"); @363
pa_dtu_mcontrol_1  x_pa_dtu_mcontrol_1 (
  .already_match              (already_match[1]          ),
  .cp0_dtu_icg_en             (cp0_dtu_icg_en            ),
  .cp0_dtu_wdata              (cp0_dtu_wdata             ),
  .cp0_write_tdata1           (cp0_write_tdata1          ),
  .cp0_write_tdata2           (cp0_write_tdata2          ),
  .cp0_write_tdata3           (cp0_write_tdata3          ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .exe0_16bit                 (exe0_16bit                ),
  .exe0_32bit                 (exe0_32bit                ),
  .exe0_match                 (mcontrol1_exe0_match      ),
  .exe0_may_hit               (mcontrol1_exe0_may_hit    ),
  .exe1_16bit                 (exe1_16bit                ),
  .exe1_32bit                 (exe1_32bit                ),
  .exe1_match                 (mcontrol1_exe1_match      ),
  .exe1_may_hit               (mcontrol1_exe1_may_hit    ),
  .exe_mcontrol               (mcontrol1_is_exe          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .ifu_dtu_addr_vld0          (ifu_dtu_addr_vld0         ),
  .ifu_dtu_addr_vld1          (ifu_dtu_addr_vld1         ),
  .ifu_dtu_data_vld0          (ifu_dtu_data_vld0         ),
  .ifu_dtu_data_vld1          (ifu_dtu_data_vld1         ),
  .ifu_dtu_exe_addr0          (ifu_dtu_exe_addr0         ),
  .ifu_dtu_exe_addr1          (ifu_dtu_exe_addr1         ),
  .ldst_16bit                 (ldst_16bit                ),
  .ldst_32bit                 (ldst_32bit                ),
  .ldst_8bit                  (ldst_8bit                 ),
  .ldst_addr_mcontrol         (mcontrol1_is_ldst_addr    ),
  .ldst_data_mcontrol         (mcontrol1_is_ldst_data    ),
  .ldst_match                 (mcontrol1_ldst_match      ),
  .ldst_may_hit               (mcontrol1_ldst_may_hit    ),
  .ldst_mcontrol              (mcontrol1_is_ldst         ),
  .load_addr_vld              (load_addr_vld             ),
  .load_data_vld              (load_data_vld             ),
  .lsu_dtu_ldst_addr          (lsu_dtu_ldst_addr         ),
  .lsu_dtu_ldst_addr_vld      (lsu_dtu_ldst_addr_vld     ),
  .lsu_dtu_ldst_bytes_vld     (lsu_dtu_ldst_bytes_vld    ),
  .lsu_dtu_ldst_data          (lsu_dtu_ldst_data         ),
  .lsu_dtu_ldst_data_vld      (lsu_dtu_ldst_data_vld     ),
  .m_mode                     (m_mode                    ),
  .mcontext                   (mcontext                  ),
  .mpriority                  (mcontrol1_priority        ),
  .mpriority_after_chain      (m1_priority               ),
  .mpriority_mask             (mcontrol1_priority_mask   ),
  .mpriority_mask_after_chain (m1_priority_mask          ),
  .mtiming                    (mcontrol1_mtiming         ),
  .mtiming_after_chain        (m1_mtiming                ),
  .mtiming_mask               (mcontrol1_mtiming_mask    ),
  .mtiming_mask_after_chain   (m1_mtiming_mask           ),
  .next_mpriority             (mcontrol2_priority        ),
  .next_mpriority_mask        (mcontrol2_priority_mask   ),
  .next_mtiming               (mcontrol2_mtiming         ),
  .next_mtiming_mask          (mcontrol2_mtiming_mask    ),
  .next_trigger_chain         (mcontrol2_chain           ),
  .next_trigger_dmode         (mcontrol2_dmode           ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .previous_mpriority         (mcontrol0_priority        ),
  .previous_mpriority_mask    (mcontrol0_priority_mask   ),
  .previous_mtiming           (mcontrol0_mtiming         ),
  .previous_mtiming_mask      (mcontrol0_mtiming_mask    ),
  .previous_trigger_chian     (mcontrol0_chain           ),
  .previous_trigger_dmode     (mcontrol0_dmode           ),
  .rtu_yy_xx_dbgon            (rtu_yy_xx_dbgon           ),
  .set_trigger_hit            (mcontrol_hit[1]           ),
  .store_addr_vld             (store_addr_vld            ),
  .store_data_vld             (store_data_vld            ),
  .tcontrol                   (tcontrol                  ),
  .tdata1                     (m1_tdata1                 ),
  .tdata1_action0             (mcontrol1_action0         ),
  .tdata1_action1             (mcontrol1_action1         ),
  .tdata1_chain               (mcontrol1_chain           ),
  .tdata1_dmode               (mcontrol1_dmode           ),
  .tdata1_timing              (mcontrol1_timing          ),
  .tdata2                     (m1_tdata2                 ),
  .tdata3                     (m1_tdata3                 ),
  .tinfo                      (m1_tinfo                  ),
  .trigger_selected           (tselect_wr_en[1]          ),
  .u_mode                     (u_mode                    )
);

// &Connect( @364
//          .trigger_selected        (tselect_wr_en[1]), @365
//          .set_trigger_hit         (mcontrol_hit[1]), @366
//          .already_match           (already_match[1]),     @367
//          .previous_trigger_chian  (mcontrol0_chain), @368
//          .previous_trigger_dmode  (mcontrol0_dmode), @369
//          .next_trigger_chain      (mcontrol2_chain), @370
//          .next_trigger_dmode      (mcontrol2_dmode), @371
//          .tdata1_chain            (mcontrol1_chain), @372
//          .tdata1_dmode            (mcontrol1_dmode), @373
//          .tdata1_action0          (mcontrol1_action0), @374
//          .tdata1_action1          (mcontrol1_action1), @375
//          .tdata1_timing           (mcontrol1_timing), @376
//          .exe_mcontrol            (mcontrol1_is_exe), @377
//          .ldst_mcontrol           (mcontrol1_is_ldst), @378
//          .ldst_addr_mcontrol      (mcontrol1_is_ldst_addr), @379
//          .ldst_data_mcontrol      (mcontrol1_is_ldst_data), @380
//          .mpriority               (mcontrol1_priority), @381
//          .mpriority_mask          (mcontrol1_priority_mask), @382
//          .mtiming                 (mcontrol1_mtiming), @383
//          .mtiming_mask            (mcontrol1_mtiming_mask), @384
//          .next_mpriority          (mcontrol2_priority), @385
//          .next_mpriority_mask     (mcontrol2_priority_mask), @386
//          .next_mtiming            (mcontrol2_mtiming), @387
//          .next_mtiming_mask       (mcontrol2_mtiming_mask), @388
//          .previous_mpriority      (mcontrol0_priority), @389
//          .previous_mpriority_mask (mcontrol0_priority_mask), @390
//          .previous_mtiming        (mcontrol0_mtiming), @391
//          .previous_mtiming_mask   (mcontrol0_mtiming_mask), @392
//          .mpriority_after_chain      (m1_priority), @393
//          .mpriority_mask_after_chain (m1_priority_mask), @394
//          .mtiming_after_chain        (m1_mtiming), @395
//          .mtiming_mask_after_chain   (m1_mtiming_mask), @396
//          .exe0_match              (mcontrol1_exe0_match), @397
//          .exe1_match              (mcontrol1_exe1_match), @398
//          .ldst_match              (mcontrol1_ldst_match), @399
//          .tdata1         (m1_tdata1), @400
//          .tdata2         (m1_tdata2), @401
//          .tdata3         (m1_tdata3), @402
//          .tinfo          (m1_tinfo), @403
//          .ldst_may_hit   (mcontrol1_ldst_may_hit), @404
//          .exe0_may_hit    (mcontrol1_exe0_may_hit), @405
//          .exe1_may_hit    (mcontrol1_exe1_may_hit)); @406

// &Instance("pa_dtu_mcontrol_2","x_pa_dtu_mcontrol_2"); @408
pa_dtu_mcontrol_2  x_pa_dtu_mcontrol_2 (
  .already_match              (already_match[2]          ),
  .cp0_dtu_icg_en             (cp0_dtu_icg_en            ),
  .cp0_dtu_wdata              (cp0_dtu_wdata             ),
  .cp0_write_tdata1           (cp0_write_tdata1          ),
  .cp0_write_tdata2           (cp0_write_tdata2          ),
  .cp0_write_tdata3           (cp0_write_tdata3          ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .exe0_16bit                 (exe0_16bit                ),
  .exe0_32bit                 (exe0_32bit                ),
  .exe0_match                 (mcontrol2_exe0_match      ),
  .exe0_may_hit               (mcontrol2_exe0_may_hit    ),
  .exe1_16bit                 (exe1_16bit                ),
  .exe1_32bit                 (exe1_32bit                ),
  .exe1_match                 (mcontrol2_exe1_match      ),
  .exe1_may_hit               (mcontrol2_exe1_may_hit    ),
  .exe_mcontrol               (mcontrol2_is_exe          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .ifu_dtu_addr_vld0          (ifu_dtu_addr_vld0         ),
  .ifu_dtu_addr_vld1          (ifu_dtu_addr_vld1         ),
  .ifu_dtu_data_vld0          (ifu_dtu_data_vld0         ),
  .ifu_dtu_data_vld1          (ifu_dtu_data_vld1         ),
  .ifu_dtu_exe_addr0          (ifu_dtu_exe_addr0         ),
  .ifu_dtu_exe_addr1          (ifu_dtu_exe_addr1         ),
  .ldst_16bit                 (ldst_16bit                ),
  .ldst_32bit                 (ldst_32bit                ),
  .ldst_8bit                  (ldst_8bit                 ),
  .ldst_addr_mcontrol         (mcontrol2_is_ldst_addr    ),
  .ldst_data_mcontrol         (mcontrol2_is_ldst_data    ),
  .ldst_match                 (mcontrol2_ldst_match      ),
  .ldst_may_hit               (mcontrol2_ldst_may_hit    ),
  .ldst_mcontrol              (mcontrol2_is_ldst         ),
  .load_addr_vld              (load_addr_vld             ),
  .load_data_vld              (load_data_vld             ),
  .lsu_dtu_ldst_addr          (lsu_dtu_ldst_addr         ),
  .lsu_dtu_ldst_addr_vld      (lsu_dtu_ldst_addr_vld     ),
  .lsu_dtu_ldst_bytes_vld     (lsu_dtu_ldst_bytes_vld    ),
  .lsu_dtu_ldst_data          (lsu_dtu_ldst_data         ),
  .lsu_dtu_ldst_data_vld      (lsu_dtu_ldst_data_vld     ),
  .m_mode                     (m_mode                    ),
  .mcontext                   (mcontext                  ),
  .mpriority                  (mcontrol2_priority        ),
  .mpriority_after_chain      (m2_priority               ),
  .mpriority_mask             (mcontrol2_priority_mask   ),
  .mpriority_mask_after_chain (m2_priority_mask          ),
  .mtiming                    (mcontrol2_mtiming         ),
  .mtiming_after_chain        (m2_mtiming                ),
  .mtiming_mask               (mcontrol2_mtiming_mask    ),
  .mtiming_mask_after_chain   (m2_mtiming_mask           ),
  .next_mpriority             (2'b10                     ),
  .next_mpriority_mask        (2'b00                     ),
  .next_mtiming               (1'b0                      ),
  .next_mtiming_mask          (1'b0                      ),
  .next_trigger_chain         (1'b0                      ),
  .next_trigger_dmode         (1'b0                      ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .previous_mpriority         (mcontrol1_priority        ),
  .previous_mpriority_mask    (mcontrol1_priority_mask   ),
  .previous_mtiming           (mcontrol1_mtiming         ),
  .previous_mtiming_mask      (mcontrol1_mtiming_mask    ),
  .previous_trigger_chian     (mcontrol1_chain           ),
  .previous_trigger_dmode     (mcontrol1_dmode           ),
  .rtu_yy_xx_dbgon            (rtu_yy_xx_dbgon           ),
  .set_trigger_hit            (mcontrol_hit[2]           ),
  .store_addr_vld             (store_addr_vld            ),
  .store_data_vld             (store_data_vld            ),
  .tcontrol                   (tcontrol                  ),
  .tdata1                     (m2_tdata1                 ),
  .tdata1_action0             (mcontrol2_action0         ),
  .tdata1_action1             (mcontrol2_action1         ),
  .tdata1_chain               (mcontrol2_chain           ),
  .tdata1_dmode               (mcontrol2_dmode           ),
  .tdata1_timing              (mcontrol2_timing          ),
  .tdata2                     (m2_tdata2                 ),
  .tdata3                     (m2_tdata3                 ),
  .tinfo                      (m2_tinfo                  ),
  .trigger_selected           (tselect_wr_en[2]          ),
  .u_mode                     (u_mode                    )
);

// &Connect( @409
//          .trigger_selected        (tselect_wr_en[2]), @410
//          .set_trigger_hit         (mcontrol_hit[2]), @411
//          .already_match           (already_match[2]),     @412
//          .previous_trigger_chian  (mcontrol1_chain), @413
//          .previous_trigger_dmode  (mcontrol1_dmode), @414
//          .next_trigger_chain      (1'b0), @415
//          .next_trigger_dmode      (1'b0), @416
//          .tdata1_chain            (mcontrol2_chain), @417
//          .tdata1_dmode            (mcontrol2_dmode), @418
//          .tdata1_action0          (mcontrol2_action0), @419
//          .tdata1_action1          (mcontrol2_action1), @420
//          .tdata1_timing           (mcontrol2_timing), @421
//          .exe_mcontrol            (mcontrol2_is_exe), @422
//          .ldst_mcontrol           (mcontrol2_is_ldst), @423
//          .ldst_addr_mcontrol      (mcontrol2_is_ldst_addr), @424
//          .ldst_data_mcontrol      (mcontrol2_is_ldst_data), @425
//          .mpriority               (mcontrol2_priority), @426
//          .mpriority_mask          (mcontrol2_priority_mask), @427
//          .mtiming                 (mcontrol2_mtiming), @428
//          .mtiming_mask            (mcontrol2_mtiming_mask), @429
//          .next_mpriority          (2'b10), @430
//          .next_mpriority_mask     (2'b00), @431
//          .next_mtiming            (1'b0), @432
//          .next_mtiming_mask       (1'b0), @433
//          .previous_mpriority      (mcontrol1_priority), @434
//          .previous_mpriority_mask (mcontrol1_priority_mask), @435
//          .previous_mtiming        (mcontrol1_mtiming), @436
//          .previous_mtiming_mask   (mcontrol1_mtiming_mask), @437
//          .mpriority_after_chain      (m2_priority), @438
//          .mpriority_mask_after_chain (m2_priority_mask), @439
//          .mtiming_after_chain        (m2_mtiming), @440
//          .mtiming_mask_after_chain   (m2_mtiming_mask), @441
//          .exe0_match              (mcontrol2_exe0_match), @442
//          .exe1_match              (mcontrol2_exe1_match), @443
//          .ldst_match              (mcontrol2_ldst_match), @444
//          .tdata1         (m2_tdata1), @445
//          .tdata2         (m2_tdata2), @446
//          .tdata3         (m2_tdata3), @447
//          .tinfo          (m2_tinfo), @448
//          .ldst_may_hit   (mcontrol2_ldst_may_hit), @449
//          .exe0_may_hit    (mcontrol2_exe0_may_hit), @450
//          .exe1_may_hit    (mcontrol2_exe1_may_hit)); @451
 
assign m3_tdata1[XLEN-1:0]   = {XLEN{1'b1}};
assign m3_tdata2[XLEN-1:0]   = {XLEN{1'b1}};
assign m3_tdata3[XLEN-1:0]   = {XLEN{1'b1}};
assign m3_tinfo[XLEN-1:0]    = {XLEN{1'b1}};

assign m4_tdata1[XLEN-1:0]   = {XLEN{1'b1}};
assign m4_tdata2[XLEN-1:0]   = {XLEN{1'b1}};
assign m4_tdata3[XLEN-1:0]   = {XLEN{1'b1}};
assign m4_tinfo[XLEN-1:0]    = {XLEN{1'b1}};

assign m5_tdata1[XLEN-1:0]   = {XLEN{1'b1}};
assign m5_tdata2[XLEN-1:0]   = {XLEN{1'b1}};
assign m5_tdata3[XLEN-1:0]   = {XLEN{1'b1}};
assign m5_tinfo[XLEN-1:0]    = {XLEN{1'b1}};
   
assign m6_tdata1[XLEN-1:0]   = {XLEN{1'b1}};
assign m6_tdata2[XLEN-1:0]   = {XLEN{1'b1}};
assign m6_tdata3[XLEN-1:0]   = {XLEN{1'b1}};
assign m6_tinfo[XLEN-1:0]    = {XLEN{1'b1}};

assign m7_tdata1[XLEN-1:0]   = {XLEN{1'b1}};
assign m7_tdata2[XLEN-1:0]   = {XLEN{1'b1}};
assign m7_tdata3[XLEN-1:0]   = {XLEN{1'b1}};
assign m7_tinfo[XLEN-1:0]    = {XLEN{1'b1}};
// &Force("bus","tselect_wr_en",9,0); @477

// &Instance("pa_dtu_mcontrol_0","x_pa_dtu_mcontrol_0"); @481
// &Connect( @482
//          .trigger_selected        (tselect_wr_en[0]), @483
//          .set_trigger_hit         (mcontrol_hit[0]), @484
//          .already_match           (already_match[0]), @485
//          .previous_trigger_chian  (1'b0), @486
//          .previous_trigger_dmode  (1'b0), @487
//          .next_trigger_chain      (mcontrol1_chain), @488
//          .next_trigger_dmode      (mcontrol1_dmode), @489
//          .tdata1_chain            (mcontrol0_chain), @490
//          .tdata1_dmode            (mcontrol0_dmode), @491
//          .tdata1_action0          (mcontrol0_action0), @492
//          .tdata1_action1          (mcontrol0_action1),   @493
//          .tdata1_timing           (mcontrol0_timing), @494
//          .exe_mcontrol            (mcontrol0_is_exe), @495
//          .ldst_mcontrol           (mcontrol0_is_ldst), @496
//          .ldst_addr_mcontrol      (mcontrol0_is_ldst_addr), @497
//          .ldst_data_mcontrol      (mcontrol0_is_ldst_data), @498
//          .mpriority               (mcontrol0_priority), @499
//          .mpriority_mask          (mcontrol0_priority_mask), @500
//          .mtiming                 (mcontrol0_mtiming), @501
//          .mtiming_mask            (mcontrol0_mtiming_mask), @502
//          .next_mpriority          (mcontrol1_priority), @503
//          .next_mpriority_mask     (mcontrol1_priority_mask), @504
//          .next_mtiming            (mcontrol1_mtiming), @505
//          .next_mtiming_mask       (mcontrol1_mtiming_mask), @506
//          .previous_mpriority      (2'b10), @507
//          .previous_mpriority_mask (2'b00), @508
//          .previous_mtiming        (1'b1), @509
//          .previous_mtiming_mask   (1'b0), @510
//          .mpriority_after_chain      (m0_priority), @511
//          .mpriority_mask_after_chain (m0_priority_mask), @512
//          .mtiming_after_chain        (m0_mtiming), @513
//          .mtiming_mask_after_chain   (m0_mtiming_mask), @514
//          .exe0_match              (mcontrol0_exe0_match), @515
//          .exe1_match              (mcontrol0_exe1_match), @516
//          .ldst_match              (mcontrol0_ldst_match), @517
//          .tdata1         (m0_tdata1), @518
//          .tdata2         (m0_tdata2), @519
//          .tdata3         (m0_tdata3), @520
//          .tinfo          (m0_tinfo), @521
//          .ldst_may_hit    (mcontrol0_ldst_may_hit), @522
//          .exe0_may_hit    (mcontrol0_exe0_may_hit), @523
//          .exe1_may_hit    (mcontrol0_exe1_may_hit)); @524
// &Instance("pa_dtu_mcontrol_1","x_pa_dtu_mcontrol_1"); @526
// &Connect( @527
//          .trigger_selected        (tselect_wr_en[1]), @528
//          .set_trigger_hit         (mcontrol_hit[1]), @529
//          .already_match           (already_match[1]),     @530
//          .previous_trigger_chian  (mcontrol0_chain), @531
//          .previous_trigger_dmode  (mcontrol0_dmode), @532
//          .next_trigger_chain      (mcontrol2_chain), @533
//          .next_trigger_dmode      (mcontrol2_dmode), @534
//          .tdata1_chain            (mcontrol1_chain), @535
//          .tdata1_dmode            (mcontrol1_dmode), @536
//          .tdata1_action0          (mcontrol1_action0), @537
//          .tdata1_action1          (mcontrol1_action1), @538
//          .tdata1_timing           (mcontrol1_timing), @539
//          .exe_mcontrol            (mcontrol1_is_exe), @540
//          .ldst_mcontrol           (mcontrol1_is_ldst), @541
//          .ldst_addr_mcontrol      (mcontrol1_is_ldst_addr), @542
//          .ldst_data_mcontrol      (mcontrol1_is_ldst_data), @543
//          .mpriority               (mcontrol1_priority), @544
//          .mpriority_mask          (mcontrol1_priority_mask), @545
//          .mtiming                 (mcontrol1_mtiming), @546
//          .mtiming_mask            (mcontrol1_mtiming_mask), @547
//          .next_mpriority          (mcontrol2_priority), @548
//          .next_mpriority_mask     (mcontrol2_priority_mask), @549
//          .next_mtiming            (mcontrol2_mtiming), @550
//          .next_mtiming_mask       (mcontrol2_mtiming_mask), @551
//          .previous_mpriority      (mcontrol0_priority), @552
//          .previous_mpriority_mask (mcontrol0_priority_mask), @553
//          .previous_mtiming        (mcontrol0_mtiming), @554
//          .previous_mtiming_mask   (mcontrol0_mtiming_mask), @555
//          .mpriority_after_chain      (m1_priority), @556
//          .mpriority_mask_after_chain (m1_priority_mask), @557
//          .mtiming_after_chain        (m1_mtiming), @558
//          .mtiming_mask_after_chain   (m1_mtiming_mask), @559
//          .exe0_match              (mcontrol1_exe0_match), @560
//          .exe1_match              (mcontrol1_exe1_match), @561
//          .ldst_match              (mcontrol1_ldst_match), @562
//          .tdata1         (m1_tdata1), @563
//          .tdata2         (m1_tdata2), @564
//          .tdata3         (m1_tdata3), @565
//          .tinfo          (m1_tinfo), @566
//          .ldst_may_hit   (mcontrol1_ldst_may_hit), @567
//          .exe0_may_hit    (mcontrol1_exe0_may_hit), @568
//          .exe1_may_hit    (mcontrol1_exe1_may_hit)); @569
// &Instance("pa_dtu_mcontrol_2","x_pa_dtu_mcontrol_2"); @571
// &Connect( @572
//          .trigger_selected        (tselect_wr_en[2]), @573
//          .set_trigger_hit         (mcontrol_hit[2]), @574
//          .already_match           (already_match[2]),     @575
//          .previous_trigger_chian  (mcontrol1_chain), @576
//          .previous_trigger_dmode  (mcontrol1_dmode), @577
//          .next_trigger_chain      (mcontrol3_chain), @578
//          .next_trigger_dmode      (mcontrol3_dmode), @579
//          .tdata1_chain            (mcontrol2_chain), @580
//          .tdata1_dmode            (mcontrol2_dmode), @581
//          .tdata1_action0          (mcontrol2_action0), @582
//          .tdata1_action1          (mcontrol2_action1), @583
//          .tdata1_timing           (mcontrol2_timing), @584
//          .exe_mcontrol            (mcontrol2_is_exe), @585
//          .ldst_mcontrol           (mcontrol2_is_ldst), @586
//          .ldst_addr_mcontrol      (mcontrol2_is_ldst_addr), @587
//          .ldst_data_mcontrol      (mcontrol2_is_ldst_data), @588
//          .mpriority               (mcontrol2_priority), @589
//          .mpriority_mask          (mcontrol2_priority_mask), @590
//          .mtiming                 (mcontrol2_mtiming), @591
//          .mtiming_mask            (mcontrol2_mtiming_mask), @592
//          .next_mpriority          (mcontrol3_priority), @593
//          .next_mpriority_mask     (mcontrol3_priority_mask), @594
//          .next_mtiming            (mcontrol3_mtiming), @595
//          .next_mtiming_mask       (mcontrol3_mtiming_mask), @596
//          .previous_mpriority      (mcontrol1_priority), @597
//          .previous_mpriority_mask (mcontrol1_priority_mask), @598
//          .previous_mtiming        (mcontrol1_mtiming), @599
//          .previous_mtiming_mask   (mcontrol1_mtiming_mask), @600
//          .mpriority_after_chain      (m2_priority), @601
//          .mpriority_mask_after_chain (m2_priority_mask), @602
//          .mtiming_after_chain        (m2_mtiming), @603
//          .mtiming_mask_after_chain   (m2_mtiming_mask), @604
//          .exe0_match              (mcontrol2_exe0_match), @605
//          .exe1_match              (mcontrol2_exe1_match), @606
//          .ldst_match              (mcontrol2_ldst_match), @607
//          .tdata1         (m2_tdata1), @608
//          .tdata2         (m2_tdata2), @609
//          .tdata3         (m2_tdata3), @610
//          .tinfo          (m2_tinfo), @611
//          .ldst_may_hit   (mcontrol2_ldst_may_hit), @612
//          .exe0_may_hit    (mcontrol2_exe0_may_hit), @613
//          .exe1_may_hit    (mcontrol2_exe1_may_hit)); @614
// &Instance("pa_dtu_mcontrol_3","x_pa_dtu_mcontrol_3"); @616
// &Connect( @617
//          .trigger_selected        (tselect_wr_en[3]), @618
//          .set_trigger_hit         (mcontrol_hit[3]), @619
//          .already_match           (already_match[3]),     @620
//          .previous_trigger_chian  (mcontrol2_chain), @621
//          .previous_trigger_dmode  (mcontrol2_dmode), @622
//          .next_trigger_chain      (1'b0), @623
//          .next_trigger_dmode      (1'b0), @624
//          .tdata1_chain            (mcontrol3_chain), @625
//          .tdata1_dmode            (mcontrol3_dmode), @626
//          .tdata1_action0          (mcontrol3_action0), @627
//          .tdata1_action1          (mcontrol3_action1), @628
//          .tdata1_timing           (mcontrol3_timing), @629
//          .exe_mcontrol            (mcontrol3_is_exe), @630
//          .ldst_mcontrol           (mcontrol3_is_ldst), @631
//          .ldst_addr_mcontrol      (mcontrol3_is_ldst_addr), @632
//          .ldst_data_mcontrol      (mcontrol3_is_ldst_data), @633
//          .mpriority               (mcontrol3_priority), @634
//          .mpriority_mask          (mcontrol3_priority_mask), @635
//          .mtiming                 (mcontrol3_mtiming), @636
//          .mtiming_mask            (mcontrol3_mtiming_mask), @637
//          .next_mpriority          (2'b10), @638
//          .next_mpriority_mask     (2'b00), @639
//          .next_mtiming            (1'b1), @640
//          .next_mtiming_mask       (1'b0), @641
//          .previous_mpriority      (mcontrol2_priority), @642
//          .previous_mpriority_mask (mcontrol2_priority_mask), @643
//          .previous_mtiming        (mcontrol2_mtiming), @644
//          .previous_mtiming_mask   (mcontrol2_mtiming_mask), @645
//          .mpriority_after_chain      (m3_priority), @646
//          .mpriority_mask_after_chain (m3_priority_mask), @647
//          .mtiming_after_chain        (m3_mtiming), @648
//          .mtiming_mask_after_chain   (m3_mtiming_mask), @649
//          .exe0_match              (mcontrol3_exe0_match), @650
//          .exe1_match              (mcontrol3_exe1_match), @651
//          .ldst_match              (mcontrol3_ldst_match), @652
//          .tdata1         (m3_tdata1), @653
//          .tdata2         (m3_tdata2), @654
//          .tdata3         (m3_tdata3), @655
//          .tinfo          (m3_tinfo), @656
//          .ldst_may_hit   (mcontrol3_ldst_may_hit), @657
//          .exe0_may_hit    (mcontrol3_exe0_may_hit), @658
//          .exe1_may_hit    (mcontrol3_exe1_may_hit)); @659
// &Force("bus","tselect_wr_en",9,0); @680

// &Instance("pa_dtu_mcontrol_0","x_pa_dtu_mcontrol_0"); @684
// &Connect( @685
//          .trigger_selected        (tselect_wr_en[0]), @686
//          .set_trigger_hit         (mcontrol_hit[0]), @687
//          .already_match           (already_match[0]), @688
//          .previous_trigger_chian  (1'b0), @689
//          .previous_trigger_dmode  (1'b0), @690
//          .next_trigger_chain      (mcontrol1_chain), @691
//          .next_trigger_dmode      (mcontrol1_dmode), @692
//          .tdata1_chain            (mcontrol0_chain), @693
//          .tdata1_dmode            (mcontrol0_dmode), @694
//          .tdata1_action0          (mcontrol0_action0), @695
//          .tdata1_action1          (mcontrol0_action1),   @696
//          .tdata1_timing           (mcontrol0_timing), @697
//          .exe_mcontrol            (mcontrol0_is_exe), @698
//          .ldst_mcontrol           (mcontrol0_is_ldst), @699
//          .ldst_addr_mcontrol      (mcontrol0_is_ldst_addr), @700
//          .ldst_data_mcontrol      (mcontrol0_is_ldst_data), @701
//          .mpriority               (mcontrol0_priority), @702
//          .mpriority_mask          (mcontrol0_priority_mask), @703
//          .mtiming                 (mcontrol0_mtiming), @704
//          .mtiming_mask            (mcontrol0_mtiming_mask), @705
//          .next_mpriority          (mcontrol1_priority), @706
//          .next_mpriority_mask     (mcontrol1_priority_mask), @707
//          .next_mtiming            (mcontrol1_mtiming), @708
//          .next_mtiming_mask       (mcontrol1_mtiming_mask), @709
//          .previous_mpriority      (2'b10), @710
//          .previous_mpriority_mask (2'b00), @711
//          .previous_mtiming        (1'b1), @712
//          .previous_mtiming_mask   (1'b0), @713
//          .mpriority_after_chain      (m0_priority), @714
//          .mpriority_mask_after_chain (m0_priority_mask), @715
//          .mtiming_after_chain        (m0_mtiming), @716
//          .mtiming_mask_after_chain   (m0_mtiming_mask), @717
//          .exe0_match              (mcontrol0_exe0_match), @718
//          .exe1_match              (mcontrol0_exe1_match), @719
//          .ldst_match              (mcontrol0_ldst_match), @720
//          .tdata1         (m0_tdata1), @721
//          .tdata2         (m0_tdata2), @722
//          .tdata3         (m0_tdata3), @723
//          .tinfo          (m0_tinfo), @724
//          .ldst_may_hit    (mcontrol0_ldst_may_hit), @725
//          .exe0_may_hit    (mcontrol0_exe0_may_hit), @726
//          .exe1_may_hit    (mcontrol0_exe1_may_hit)); @727
// &Instance("pa_dtu_mcontrol_1","x_pa_dtu_mcontrol_1"); @729
// &Connect( @730
//          .trigger_selected        (tselect_wr_en[1]), @731
//          .set_trigger_hit         (mcontrol_hit[1]), @732
//          .already_match           (already_match[1]),     @733
//          .previous_trigger_chian  (mcontrol0_chain), @734
//          .previous_trigger_dmode  (mcontrol0_dmode), @735
//          .next_trigger_chain      (mcontrol2_chain), @736
//          .next_trigger_dmode      (mcontrol2_dmode), @737
//          .tdata1_chain            (mcontrol1_chain), @738
//          .tdata1_dmode            (mcontrol1_dmode), @739
//          .tdata1_action0          (mcontrol1_action0), @740
//          .tdata1_action1          (mcontrol1_action1), @741
//          .tdata1_timing           (mcontrol1_timing), @742
//          .exe_mcontrol            (mcontrol1_is_exe), @743
//          .ldst_mcontrol           (mcontrol1_is_ldst), @744
//          .ldst_addr_mcontrol      (mcontrol1_is_ldst_addr), @745
//          .ldst_data_mcontrol      (mcontrol1_is_ldst_data), @746
//          .mpriority               (mcontrol1_priority), @747
//          .mpriority_mask          (mcontrol1_priority_mask), @748
//          .mtiming                 (mcontrol1_mtiming), @749
//          .mtiming_mask            (mcontrol1_mtiming_mask), @750
//          .next_mpriority          (mcontrol2_priority), @751
//          .next_mpriority_mask     (mcontrol2_priority_mask), @752
//          .next_mtiming            (mcontrol2_mtiming), @753
//          .next_mtiming_mask       (mcontrol2_mtiming_mask), @754
//          .previous_mpriority      (mcontrol0_priority), @755
//          .previous_mpriority_mask (mcontrol0_priority_mask), @756
//          .previous_mtiming        (mcontrol0_mtiming), @757
//          .previous_mtiming_mask   (mcontrol0_mtiming_mask), @758
//          .mpriority_after_chain      (m1_priority), @759
//          .mpriority_mask_after_chain (m1_priority_mask), @760
//          .mtiming_after_chain        (m1_mtiming), @761
//          .mtiming_mask_after_chain   (m1_mtiming_mask), @762
//          .exe0_match              (mcontrol1_exe0_match), @763
//          .exe1_match              (mcontrol1_exe1_match), @764
//          .ldst_match              (mcontrol1_ldst_match), @765
//          .tdata1         (m1_tdata1), @766
//          .tdata2         (m1_tdata2), @767
//          .tdata3         (m1_tdata3), @768
//          .tinfo          (m1_tinfo), @769
//          .ldst_may_hit   (mcontrol1_ldst_may_hit), @770
//          .exe0_may_hit    (mcontrol1_exe0_may_hit), @771
//          .exe1_may_hit    (mcontrol1_exe1_may_hit)); @772
// &Instance("pa_dtu_mcontrol_2","x_pa_dtu_mcontrol_2"); @774
// &Connect( @775
//          .trigger_selected        (tselect_wr_en[2]), @776
//          .set_trigger_hit         (mcontrol_hit[2]), @777
//          .already_match           (already_match[2]),     @778
//          .previous_trigger_chian  (mcontrol1_chain), @779
//          .previous_trigger_dmode  (mcontrol1_dmode), @780
//          .next_trigger_chain      (mcontrol3_chain), @781
//          .next_trigger_dmode      (mcontrol3_dmode), @782
//          .tdata1_chain            (mcontrol2_chain), @783
//          .tdata1_dmode            (mcontrol2_dmode), @784
//          .tdata1_action0          (mcontrol2_action0), @785
//          .tdata1_action1          (mcontrol2_action1), @786
//          .tdata1_timing           (mcontrol2_timing), @787
//          .exe_mcontrol            (mcontrol2_is_exe), @788
//          .ldst_mcontrol           (mcontrol2_is_ldst), @789
//          .ldst_addr_mcontrol      (mcontrol2_is_ldst_addr), @790
//          .ldst_data_mcontrol      (mcontrol2_is_ldst_data), @791
//          .mpriority               (mcontrol2_priority), @792
//          .mpriority_mask          (mcontrol2_priority_mask), @793
//          .mtiming                 (mcontrol2_mtiming), @794
//          .mtiming_mask            (mcontrol2_mtiming_mask), @795
//          .next_mpriority          (mcontrol3_priority), @796
//          .next_mpriority_mask     (mcontrol3_priority_mask), @797
//          .next_mtiming            (mcontrol3_mtiming), @798
//          .next_mtiming_mask       (mcontrol3_mtiming_mask), @799
//          .previous_mpriority      (mcontrol1_priority), @800
//          .previous_mpriority_mask (mcontrol1_priority_mask), @801
//          .previous_mtiming        (mcontrol1_mtiming), @802
//          .previous_mtiming_mask   (mcontrol1_mtiming_mask), @803
//          .mpriority_after_chain      (m2_priority), @804
//          .mpriority_mask_after_chain (m2_priority_mask), @805
//          .mtiming_after_chain        (m2_mtiming), @806
//          .mtiming_mask_after_chain   (m2_mtiming_mask), @807
//          .exe0_match              (mcontrol2_exe0_match), @808
//          .exe1_match              (mcontrol2_exe1_match), @809
//          .ldst_match              (mcontrol2_ldst_match), @810
//          .tdata1         (m2_tdata1), @811
//          .tdata2         (m2_tdata2), @812
//          .tdata3         (m2_tdata3), @813
//          .tinfo          (m2_tinfo), @814
//          .ldst_may_hit   (mcontrol2_ldst_may_hit), @815
//          .exe0_may_hit    (mcontrol2_exe0_may_hit), @816
//          .exe1_may_hit    (mcontrol2_exe1_may_hit)); @817
// &Instance("pa_dtu_mcontrol_3","x_pa_dtu_mcontrol_3"); @819
// &Connect( @820
//          .trigger_selected        (tselect_wr_en[3]), @821
//          .set_trigger_hit         (mcontrol_hit[3]), @822
//          .already_match           (already_match[3]),     @823
//          .previous_trigger_chian  (mcontrol2_chain), @824
//          .previous_trigger_dmode  (mcontrol2_dmode), @825
//          .next_trigger_chain      (mcontrol4_chain), @826
//          .next_trigger_dmode      (mcontrol4_dmode), @827
//          .tdata1_chain            (mcontrol3_chain), @828
//          .tdata1_dmode            (mcontrol3_dmode), @829
//          .tdata1_action0          (mcontrol3_action0), @830
//          .tdata1_action1          (mcontrol3_action1), @831
//          .tdata1_timing           (mcontrol3_timing), @832
//          .exe_mcontrol            (mcontrol3_is_exe), @833
//          .ldst_mcontrol           (mcontrol3_is_ldst), @834
//          .ldst_addr_mcontrol      (mcontrol3_is_ldst_addr), @835
//          .ldst_data_mcontrol      (mcontrol3_is_ldst_data), @836
//          .mpriority               (mcontrol3_priority), @837
//          .mpriority_mask          (mcontrol3_priority_mask), @838
//          .mtiming                 (mcontrol3_mtiming), @839
//          .mtiming_mask            (mcontrol3_mtiming_mask), @840
//          .next_mpriority          (mcontrol4_priority), @841
//          .next_mpriority_mask     (mcontrol4_priority_mask), @842
//          .next_mtiming            (mcontrol4_mtiming), @843
//          .next_mtiming_mask       (mcontrol4_mtiming_mask), @844
//          .previous_mpriority      (mcontrol2_priority), @845
//          .previous_mpriority_mask (mcontrol2_priority_mask), @846
//          .previous_mtiming        (mcontrol2_mtiming), @847
//          .previous_mtiming_mask   (mcontrol2_mtiming_mask), @848
//          .mpriority_after_chain      (m3_priority), @849
//          .mpriority_mask_after_chain (m3_priority_mask), @850
//          .mtiming_after_chain        (m3_mtiming), @851
//          .mtiming_mask_after_chain   (m3_mtiming_mask), @852
//          .exe0_match              (mcontrol3_exe0_match), @853
//          .exe1_match              (mcontrol3_exe1_match), @854
//          .ldst_match              (mcontrol3_ldst_match), @855
//          .tdata1         (m3_tdata1), @856
//          .tdata2         (m3_tdata2), @857
//          .tdata3         (m3_tdata3), @858
//          .tinfo          (m3_tinfo), @859
//          .ldst_may_hit   (mcontrol3_ldst_may_hit), @860
//          .exe0_may_hit    (mcontrol3_exe0_may_hit), @861
//          .exe1_may_hit    (mcontrol3_exe1_may_hit)); @862
// &Instance("pa_dtu_mcontrol_4","x_pa_dtu_mcontrol_4"); @864
// &Connect( @865
//          .trigger_selected        (tselect_wr_en[4]), @866
//          .set_trigger_hit         (mcontrol_hit[4]), @867
//          .already_match           (already_match[4]),     @868
//          .previous_trigger_chian  (mcontrol3_chain), @869
//          .previous_trigger_dmode  (mcontrol3_dmode), @870
//          .next_trigger_chain      (1'b0), @871
//          .next_trigger_dmode      (1'b0), @872
//          .tdata1_chain            (mcontrol4_chain), @873
//          .tdata1_dmode            (mcontrol4_dmode), @874
//          .tdata1_action0          (mcontrol4_action0), @875
//          .tdata1_action1          (mcontrol4_action1), @876
//          .tdata1_timing           (mcontrol4_timing), @877
//          .exe_mcontrol            (mcontrol4_is_exe), @878
//          .ldst_mcontrol           (mcontrol4_is_ldst), @879
//          .ldst_addr_mcontrol      (mcontrol4_is_ldst_addr), @880
//          .ldst_data_mcontrol      (mcontrol4_is_ldst_data), @881
//          .mpriority               (mcontrol4_priority), @882
//          .mpriority_mask          (mcontrol4_priority_mask), @883
//          .mtiming                 (mcontrol4_mtiming), @884
//          .mtiming_mask            (mcontrol4_mtiming_mask), @885
//          .next_mpriority          (2'b10), @886
//          .next_mpriority_mask     (2'b00), @887
//          .next_mtiming            (1'b1), @888
//          .next_mtiming_mask       (1'b0), @889
//          .previous_mpriority      (mcontrol3_priority), @890
//          .previous_mpriority_mask (mcontrol3_priority_mask), @891
//          .previous_mtiming        (mcontrol3_mtiming), @892
//          .previous_mtiming_mask   (mcontrol3_mtiming_mask), @893
//          .mpriority_after_chain      (m4_priority), @894
//          .mpriority_mask_after_chain (m4_priority_mask), @895
//          .mtiming_after_chain        (m4_mtiming), @896
//          .mtiming_mask_after_chain   (m4_mtiming_mask), @897
//          .exe0_match              (mcontrol4_exe0_match), @898
//          .exe1_match              (mcontrol4_exe1_match), @899
//          .ldst_match              (mcontrol4_ldst_match), @900
//          .tdata1         (m4_tdata1), @901
//          .tdata2         (m4_tdata2), @902
//          .tdata3         (m4_tdata3), @903
//          .tinfo          (m4_tinfo), @904
//          .ldst_may_hit   (mcontrol4_ldst_may_hit), @905
//          .exe0_may_hit    (mcontrol4_exe0_may_hit), @906
//          .exe1_may_hit    (mcontrol4_exe1_may_hit)); @907
// &Force("bus","tselect_wr_en",9,0); @923

// &Instance("pa_dtu_mcontrol_0","x_pa_dtu_mcontrol_0"); @927
// &Connect( @928
//          .trigger_selected        (tselect_wr_en[0]), @929
//          .set_trigger_hit         (mcontrol_hit[0]), @930
//          .already_match           (already_match[0]), @931
//          .previous_trigger_chian  (1'b0), @932
//          .previous_trigger_dmode  (1'b0), @933
//          .next_trigger_chain      (mcontrol1_chain), @934
//          .next_trigger_dmode      (mcontrol1_dmode), @935
//          .tdata1_chain            (mcontrol0_chain), @936
//          .tdata1_dmode            (mcontrol0_dmode), @937
//          .tdata1_action0          (mcontrol0_action0), @938
//          .tdata1_action1          (mcontrol0_action1),   @939
//          .tdata1_timing           (mcontrol0_timing), @940
//          .exe_mcontrol            (mcontrol0_is_exe), @941
//          .ldst_mcontrol           (mcontrol0_is_ldst), @942
//          .ldst_addr_mcontrol      (mcontrol0_is_ldst_addr), @943
//          .ldst_data_mcontrol      (mcontrol0_is_ldst_data), @944
//          .mpriority               (mcontrol0_priority), @945
//          .mpriority_mask          (mcontrol0_priority_mask), @946
//          .mtiming                 (mcontrol0_mtiming), @947
//          .mtiming_mask            (mcontrol0_mtiming_mask), @948
//          .next_mpriority          (mcontrol1_priority), @949
//          .next_mpriority_mask     (mcontrol1_priority_mask), @950
//          .next_mtiming            (mcontrol1_mtiming), @951
//          .next_mtiming_mask       (mcontrol1_mtiming_mask), @952
//          .previous_mpriority      (2'b10), @953
//          .previous_mpriority_mask (2'b00), @954
//          .previous_mtiming        (1'b1), @955
//          .previous_mtiming_mask   (1'b0), @956
//          .mpriority_after_chain      (m0_priority), @957
//          .mpriority_mask_after_chain (m0_priority_mask), @958
//          .mtiming_after_chain        (m0_mtiming), @959
//          .mtiming_mask_after_chain   (m0_mtiming_mask), @960
//          .exe0_match              (mcontrol0_exe0_match), @961
//          .exe1_match              (mcontrol0_exe1_match), @962
//          .ldst_match              (mcontrol0_ldst_match), @963
//          .tdata1         (m0_tdata1), @964
//          .tdata2         (m0_tdata2), @965
//          .tdata3         (m0_tdata3), @966
//          .tinfo          (m0_tinfo), @967
//          .ldst_may_hit    (mcontrol0_ldst_may_hit), @968
//          .exe0_may_hit    (mcontrol0_exe0_may_hit), @969
//          .exe1_may_hit    (mcontrol0_exe1_may_hit)); @970
// &Instance("pa_dtu_mcontrol_1","x_pa_dtu_mcontrol_1"); @972
// &Connect( @973
//          .trigger_selected        (tselect_wr_en[1]), @974
//          .set_trigger_hit         (mcontrol_hit[1]), @975
//          .already_match           (already_match[1]),     @976
//          .previous_trigger_chian  (mcontrol0_chain), @977
//          .previous_trigger_dmode  (mcontrol0_dmode), @978
//          .next_trigger_chain      (mcontrol2_chain), @979
//          .next_trigger_dmode      (mcontrol2_dmode), @980
//          .tdata1_chain            (mcontrol1_chain), @981
//          .tdata1_dmode            (mcontrol1_dmode), @982
//          .tdata1_action0          (mcontrol1_action0), @983
//          .tdata1_action1          (mcontrol1_action1), @984
//          .tdata1_timing           (mcontrol1_timing), @985
//          .exe_mcontrol            (mcontrol1_is_exe), @986
//          .ldst_mcontrol           (mcontrol1_is_ldst), @987
//          .ldst_addr_mcontrol      (mcontrol1_is_ldst_addr), @988
//          .ldst_data_mcontrol      (mcontrol1_is_ldst_data), @989
//          .mpriority               (mcontrol1_priority), @990
//          .mpriority_mask          (mcontrol1_priority_mask), @991
//          .mtiming                 (mcontrol1_mtiming), @992
//          .mtiming_mask            (mcontrol1_mtiming_mask), @993
//          .next_mpriority          (mcontrol2_priority), @994
//          .next_mpriority_mask     (mcontrol2_priority_mask), @995
//          .next_mtiming            (mcontrol2_mtiming), @996
//          .next_mtiming_mask       (mcontrol2_mtiming_mask), @997
//          .previous_mpriority      (mcontrol0_priority), @998
//          .previous_mpriority_mask (mcontrol0_priority_mask), @999
//          .previous_mtiming        (mcontrol0_mtiming), @1000
//          .previous_mtiming_mask   (mcontrol0_mtiming_mask), @1001
//          .mpriority_after_chain      (m1_priority), @1002
//          .mpriority_mask_after_chain (m1_priority_mask), @1003
//          .mtiming_after_chain        (m1_mtiming), @1004
//          .mtiming_mask_after_chain   (m1_mtiming_mask), @1005
//          .exe0_match              (mcontrol1_exe0_match), @1006
//          .exe1_match              (mcontrol1_exe1_match), @1007
//          .ldst_match              (mcontrol1_ldst_match), @1008
//          .tdata1         (m1_tdata1), @1009
//          .tdata2         (m1_tdata2), @1010
//          .tdata3         (m1_tdata3), @1011
//          .tinfo          (m1_tinfo), @1012
//          .ldst_may_hit   (mcontrol1_ldst_may_hit), @1013
//          .exe0_may_hit    (mcontrol1_exe0_may_hit), @1014
//          .exe1_may_hit    (mcontrol1_exe1_may_hit)); @1015
// &Instance("pa_dtu_mcontrol_2","x_pa_dtu_mcontrol_2"); @1017
// &Connect( @1018
//          .trigger_selected        (tselect_wr_en[2]), @1019
//          .set_trigger_hit         (mcontrol_hit[2]), @1020
//          .already_match           (already_match[2]),     @1021
//          .previous_trigger_chian  (mcontrol1_chain), @1022
//          .previous_trigger_dmode  (mcontrol1_dmode), @1023
//          .next_trigger_chain      (mcontrol3_chain), @1024
//          .next_trigger_dmode      (mcontrol3_dmode), @1025
//          .tdata1_chain            (mcontrol2_chain), @1026
//          .tdata1_dmode            (mcontrol2_dmode), @1027
//          .tdata1_action0          (mcontrol2_action0), @1028
//          .tdata1_action1          (mcontrol2_action1), @1029
//          .tdata1_timing           (mcontrol2_timing), @1030
//          .exe_mcontrol            (mcontrol2_is_exe), @1031
//          .ldst_mcontrol           (mcontrol2_is_ldst), @1032
//          .ldst_addr_mcontrol      (mcontrol2_is_ldst_addr), @1033
//          .ldst_data_mcontrol      (mcontrol2_is_ldst_data), @1034
//          .mpriority               (mcontrol2_priority), @1035
//          .mpriority_mask          (mcontrol2_priority_mask), @1036
//          .mtiming                 (mcontrol2_mtiming), @1037
//          .mtiming_mask            (mcontrol2_mtiming_mask), @1038
//          .next_mpriority          (mcontrol3_priority), @1039
//          .next_mpriority_mask     (mcontrol3_priority_mask), @1040
//          .next_mtiming            (mcontrol3_mtiming), @1041
//          .next_mtiming_mask       (mcontrol3_mtiming_mask), @1042
//          .previous_mpriority      (mcontrol1_priority), @1043
//          .previous_mpriority_mask (mcontrol1_priority_mask), @1044
//          .previous_mtiming        (mcontrol1_mtiming), @1045
//          .previous_mtiming_mask   (mcontrol1_mtiming_mask), @1046
//          .mpriority_after_chain      (m2_priority), @1047
//          .mpriority_mask_after_chain (m2_priority_mask), @1048
//          .mtiming_after_chain        (m2_mtiming), @1049
//          .mtiming_mask_after_chain   (m2_mtiming_mask), @1050
//          .exe0_match              (mcontrol2_exe0_match), @1051
//          .exe1_match              (mcontrol2_exe1_match), @1052
//          .ldst_match              (mcontrol2_ldst_match), @1053
//          .tdata1         (m2_tdata1), @1054
//          .tdata2         (m2_tdata2), @1055
//          .tdata3         (m2_tdata3), @1056
//          .tinfo          (m2_tinfo), @1057
//          .ldst_may_hit   (mcontrol2_ldst_may_hit), @1058
//          .exe0_may_hit    (mcontrol2_exe0_may_hit), @1059
//          .exe1_may_hit    (mcontrol2_exe1_may_hit)); @1060
// &Instance("pa_dtu_mcontrol_3","x_pa_dtu_mcontrol_3"); @1062
// &Connect( @1063
//          .trigger_selected        (tselect_wr_en[3]), @1064
//          .set_trigger_hit         (mcontrol_hit[3]), @1065
//          .already_match           (already_match[3]),     @1066
//          .previous_trigger_chian  (mcontrol2_chain), @1067
//          .previous_trigger_dmode  (mcontrol2_dmode), @1068
//          .next_trigger_chain      (mcontrol4_chain), @1069
//          .next_trigger_dmode      (mcontrol4_dmode), @1070
//          .tdata1_chain            (mcontrol3_chain), @1071
//          .tdata1_dmode            (mcontrol3_dmode), @1072
//          .tdata1_action0          (mcontrol3_action0), @1073
//          .tdata1_action1          (mcontrol3_action1), @1074
//          .tdata1_timing           (mcontrol3_timing), @1075
//          .exe_mcontrol            (mcontrol3_is_exe), @1076
//          .ldst_mcontrol           (mcontrol3_is_ldst), @1077
//          .ldst_addr_mcontrol      (mcontrol3_is_ldst_addr), @1078
//          .ldst_data_mcontrol      (mcontrol3_is_ldst_data), @1079
//          .mpriority               (mcontrol3_priority), @1080
//          .mpriority_mask          (mcontrol3_priority_mask), @1081
//          .mtiming                 (mcontrol3_mtiming), @1082
//          .mtiming_mask            (mcontrol3_mtiming_mask), @1083
//          .next_mpriority          (mcontrol4_priority), @1084
//          .next_mpriority_mask     (mcontrol4_priority_mask), @1085
//          .next_mtiming            (mcontrol4_mtiming), @1086
//          .next_mtiming_mask       (mcontrol4_mtiming_mask), @1087
//          .previous_mpriority      (mcontrol2_priority), @1088
//          .previous_mpriority_mask (mcontrol2_priority_mask), @1089
//          .previous_mtiming        (mcontrol2_mtiming), @1090
//          .previous_mtiming_mask   (mcontrol2_mtiming_mask), @1091
//          .mpriority_after_chain      (m3_priority), @1092
//          .mpriority_mask_after_chain (m3_priority_mask), @1093
//          .mtiming_after_chain        (m3_mtiming), @1094
//          .mtiming_mask_after_chain   (m3_mtiming_mask), @1095
//          .exe0_match              (mcontrol3_exe0_match), @1096
//          .exe1_match              (mcontrol3_exe1_match), @1097
//          .ldst_match              (mcontrol3_ldst_match), @1098
//          .tdata1         (m3_tdata1), @1099
//          .tdata2         (m3_tdata2), @1100
//          .tdata3         (m3_tdata3), @1101
//          .tinfo          (m3_tinfo), @1102
//          .ldst_may_hit   (mcontrol3_ldst_may_hit), @1103
//          .exe0_may_hit    (mcontrol3_exe0_may_hit), @1104
//          .exe1_may_hit    (mcontrol3_exe1_may_hit)); @1105
// &Instance("pa_dtu_mcontrol_4","x_pa_dtu_mcontrol_4"); @1107
// &Connect( @1108
//          .trigger_selected        (tselect_wr_en[4]), @1109
//          .set_trigger_hit         (mcontrol_hit[4]), @1110
//          .already_match           (already_match[4]),     @1111
//          .previous_trigger_chian  (mcontrol3_chain), @1112
//          .previous_trigger_dmode  (mcontrol3_dmode), @1113
//          .next_trigger_chain      (mcontrol5_chain), @1114
//          .next_trigger_dmode      (mcontrol5_dmode), @1115
//          .tdata1_chain            (mcontrol4_chain), @1116
//          .tdata1_dmode            (mcontrol4_dmode), @1117
//          .tdata1_action0          (mcontrol4_action0), @1118
//          .tdata1_action1          (mcontrol4_action1), @1119
//          .tdata1_timing           (mcontrol4_timing), @1120
//          .exe_mcontrol            (mcontrol4_is_exe), @1121
//          .ldst_mcontrol           (mcontrol4_is_ldst), @1122
//          .ldst_addr_mcontrol      (mcontrol4_is_ldst_addr), @1123
//          .ldst_data_mcontrol      (mcontrol4_is_ldst_data), @1124
//          .mpriority               (mcontrol4_priority), @1125
//          .mpriority_mask          (mcontrol4_priority_mask), @1126
//          .mtiming                 (mcontrol4_mtiming), @1127
//          .mtiming_mask            (mcontrol4_mtiming_mask), @1128
//          .next_mpriority          (mcontrol5_priority), @1129
//          .next_mpriority_mask     (mcontrol5_priority_mask), @1130
//          .next_mtiming            (mcontrol5_mtiming), @1131
//          .next_mtiming_mask       (mcontrol5_mtiming_mask), @1132
//          .previous_mpriority      (mcontrol3_priority), @1133
//          .previous_mpriority_mask (mcontrol3_priority_mask), @1134
//          .previous_mtiming        (mcontrol3_mtiming), @1135
//          .previous_mtiming_mask   (mcontrol3_mtiming_mask), @1136
//          .mpriority_after_chain      (m4_priority), @1137
//          .mpriority_mask_after_chain (m4_priority_mask), @1138
//          .mtiming_after_chain        (m4_mtiming), @1139
//          .mtiming_mask_after_chain   (m4_mtiming_mask), @1140
//          .exe0_match              (mcontrol4_exe0_match), @1141
//          .exe1_match              (mcontrol4_exe1_match), @1142
//          .ldst_match              (mcontrol4_ldst_match), @1143
//          .tdata1         (m4_tdata1), @1144
//          .tdata2         (m4_tdata2), @1145
//          .tdata3         (m4_tdata3), @1146
//          .tinfo          (m4_tinfo), @1147
//          .ldst_may_hit   (mcontrol4_ldst_may_hit), @1148
//          .exe0_may_hit    (mcontrol4_exe0_may_hit), @1149
//          .exe1_may_hit    (mcontrol4_exe1_may_hit)); @1150
// &Instance("pa_dtu_mcontrol_5","x_pa_dtu_mcontrol_5"); @1152
// &Connect( @1153
//          .trigger_selected        (tselect_wr_en[5]), @1154
//          .set_trigger_hit         (mcontrol_hit[5]), @1155
//          .already_match           (already_match[5]),     @1156
//          .previous_trigger_chian  (mcontrol4_chain), @1157
//          .previous_trigger_dmode  (mcontrol4_dmode), @1158
//          .next_trigger_chain      (1'b0), @1159
//          .next_trigger_dmode      (1'b0), @1160
//          .tdata1_chain            (mcontrol5_chain), @1161
//          .tdata1_dmode            (mcontrol5_dmode), @1162
//          .tdata1_action0          (mcontrol5_action0), @1163
//          .tdata1_action1          (mcontrol5_action1), @1164
//          .tdata1_timing           (mcontrol5_timing), @1165
//          .exe_mcontrol            (mcontrol5_is_exe), @1166
//          .ldst_mcontrol           (mcontrol5_is_ldst), @1167
//          .ldst_addr_mcontrol      (mcontrol5_is_ldst_addr), @1168
//          .ldst_data_mcontrol      (mcontrol5_is_ldst_data), @1169
//          .mpriority               (mcontrol5_priority), @1170
//          .mpriority_mask          (mcontrol5_priority_mask), @1171
//          .mtiming                 (mcontrol5_mtiming), @1172
//          .mtiming_mask            (mcontrol5_mtiming_mask), @1173
//          .next_mpriority          (2'b10), @1174
//          .next_mpriority_mask     (2'b00), @1175
//          .next_mtiming            (1'b1), @1176
//          .next_mtiming_mask       (1'b0), @1177
//          .previous_mpriority      (mcontrol4_priority), @1178
//          .previous_mpriority_mask (mcontrol4_priority_mask), @1179
//          .previous_mtiming        (mcontrol4_mtiming), @1180
//          .previous_mtiming_mask   (mcontrol4_mtiming_mask), @1181
//          .mpriority_after_chain      (m5_priority), @1182
//          .mpriority_mask_after_chain (m5_priority_mask), @1183
//          .mtiming_after_chain        (m5_mtiming), @1184
//          .mtiming_mask_after_chain   (m5_mtiming_mask), @1185
//          .exe0_match              (mcontrol5_exe0_match), @1186
//          .exe1_match              (mcontrol5_exe1_match), @1187
//          .ldst_match              (mcontrol5_ldst_match), @1188
//          .tdata1         (m5_tdata1), @1189
//          .tdata2         (m5_tdata2), @1190
//          .tdata3         (m5_tdata3), @1191
//          .tinfo          (m5_tinfo), @1192
//          .ldst_may_hit   (mcontrol5_ldst_may_hit), @1193
//          .exe0_may_hit    (mcontrol5_exe0_may_hit), @1194
//          .exe1_may_hit    (mcontrol5_exe1_may_hit)); @1195
// &Force("bus","tselect_wr_en",9,0); @1206

// &Instance("pa_dtu_mcontrol_0","x_pa_dtu_mcontrol_0"); @1210
// &Connect( @1211
//          .trigger_selected        (tselect_wr_en[0]), @1212
//          .set_trigger_hit         (mcontrol_hit[0]), @1213
//          .already_match           (already_match[0]), @1214
//          .previous_trigger_chian  (1'b0), @1215
//          .previous_trigger_dmode  (1'b0), @1216
//          .next_trigger_chain      (mcontrol1_chain), @1217
//          .next_trigger_dmode      (mcontrol1_dmode), @1218
//          .tdata1_chain            (mcontrol0_chain), @1219
//          .tdata1_dmode            (mcontrol0_dmode), @1220
//          .tdata1_action0          (mcontrol0_action0), @1221
//          .tdata1_action1          (mcontrol0_action1),   @1222
//          .tdata1_timing           (mcontrol0_timing), @1223
//          .exe_mcontrol            (mcontrol0_is_exe), @1224
//          .ldst_mcontrol           (mcontrol0_is_ldst), @1225
//          .ldst_addr_mcontrol      (mcontrol0_is_ldst_addr), @1226
//          .ldst_data_mcontrol      (mcontrol0_is_ldst_data), @1227
//          .mpriority               (mcontrol0_priority), @1228
//          .mpriority_mask          (mcontrol0_priority_mask), @1229
//          .mtiming                 (mcontrol0_mtiming), @1230
//          .mtiming_mask            (mcontrol0_mtiming_mask), @1231
//          .next_mpriority          (mcontrol1_priority), @1232
//          .next_mpriority_mask     (mcontrol1_priority_mask), @1233
//          .next_mtiming            (mcontrol1_mtiming), @1234
//          .next_mtiming_mask       (mcontrol1_mtiming_mask), @1235
//          .previous_mpriority      (2'b10), @1236
//          .previous_mpriority_mask (2'b00), @1237
//          .previous_mtiming        (1'b1), @1238
//          .previous_mtiming_mask   (1'b0), @1239
//          .mpriority_after_chain      (m0_priority), @1240
//          .mpriority_mask_after_chain (m0_priority_mask), @1241
//          .mtiming_after_chain        (m0_mtiming), @1242
//          .mtiming_mask_after_chain   (m0_mtiming_mask), @1243
//          .exe0_match              (mcontrol0_exe0_match), @1244
//          .exe1_match              (mcontrol0_exe1_match), @1245
//          .ldst_match              (mcontrol0_ldst_match), @1246
//          .tdata1         (m0_tdata1), @1247
//          .tdata2         (m0_tdata2), @1248
//          .tdata3         (m0_tdata3), @1249
//          .tinfo          (m0_tinfo), @1250
//          .ldst_may_hit    (mcontrol0_ldst_may_hit), @1251
//          .exe0_may_hit    (mcontrol0_exe0_may_hit), @1252
//          .exe1_may_hit    (mcontrol0_exe1_may_hit)); @1253
// &Instance("pa_dtu_mcontrol_1","x_pa_dtu_mcontrol_1"); @1255
// &Connect( @1256
//          .trigger_selected        (tselect_wr_en[1]), @1257
//          .set_trigger_hit         (mcontrol_hit[1]), @1258
//          .already_match           (already_match[1]),     @1259
//          .previous_trigger_chian  (mcontrol0_chain), @1260
//          .previous_trigger_dmode  (mcontrol0_dmode), @1261
//          .next_trigger_chain      (mcontrol2_chain), @1262
//          .next_trigger_dmode      (mcontrol2_dmode), @1263
//          .tdata1_chain            (mcontrol1_chain), @1264
//          .tdata1_dmode            (mcontrol1_dmode), @1265
//          .tdata1_action0          (mcontrol1_action0), @1266
//          .tdata1_action1          (mcontrol1_action1), @1267
//          .tdata1_timing           (mcontrol1_timing), @1268
//          .exe_mcontrol            (mcontrol1_is_exe), @1269
//          .ldst_mcontrol           (mcontrol1_is_ldst), @1270
//          .ldst_addr_mcontrol      (mcontrol1_is_ldst_addr), @1271
//          .ldst_data_mcontrol      (mcontrol1_is_ldst_data), @1272
//          .mpriority               (mcontrol1_priority), @1273
//          .mpriority_mask          (mcontrol1_priority_mask), @1274
//          .mtiming                 (mcontrol1_mtiming), @1275
//          .mtiming_mask            (mcontrol1_mtiming_mask), @1276
//          .next_mpriority          (mcontrol2_priority), @1277
//          .next_mpriority_mask     (mcontrol2_priority_mask), @1278
//          .next_mtiming            (mcontrol2_mtiming), @1279
//          .next_mtiming_mask       (mcontrol2_mtiming_mask), @1280
//          .previous_mpriority      (mcontrol0_priority), @1281
//          .previous_mpriority_mask (mcontrol0_priority_mask), @1282
//          .previous_mtiming        (mcontrol0_mtiming), @1283
//          .previous_mtiming_mask   (mcontrol0_mtiming_mask), @1284
//          .mpriority_after_chain      (m1_priority), @1285
//          .mpriority_mask_after_chain (m1_priority_mask), @1286
//          .mtiming_after_chain        (m1_mtiming), @1287
//          .mtiming_mask_after_chain   (m1_mtiming_mask), @1288
//          .exe0_match              (mcontrol1_exe0_match), @1289
//          .exe1_match              (mcontrol1_exe1_match), @1290
//          .ldst_match              (mcontrol1_ldst_match), @1291
//          .tdata1         (m1_tdata1), @1292
//          .tdata2         (m1_tdata2), @1293
//          .tdata3         (m1_tdata3), @1294
//          .tinfo          (m1_tinfo), @1295
//          .ldst_may_hit   (mcontrol1_ldst_may_hit), @1296
//          .exe0_may_hit    (mcontrol1_exe0_may_hit), @1297
//          .exe1_may_hit    (mcontrol1_exe1_may_hit)); @1298
// &Instance("pa_dtu_mcontrol_2","x_pa_dtu_mcontrol_2"); @1300
// &Connect( @1301
//          .trigger_selected        (tselect_wr_en[2]), @1302
//          .set_trigger_hit         (mcontrol_hit[2]), @1303
//          .already_match           (already_match[2]),     @1304
//          .previous_trigger_chian  (mcontrol1_chain), @1305
//          .previous_trigger_dmode  (mcontrol1_dmode), @1306
//          .next_trigger_chain      (mcontrol3_chain), @1307
//          .next_trigger_dmode      (mcontrol3_dmode), @1308
//          .tdata1_chain            (mcontrol2_chain), @1309
//          .tdata1_dmode            (mcontrol2_dmode), @1310
//          .tdata1_action0          (mcontrol2_action0), @1311
//          .tdata1_action1          (mcontrol2_action1), @1312
//          .tdata1_timing           (mcontrol2_timing), @1313
//          .exe_mcontrol            (mcontrol2_is_exe), @1314
//          .ldst_mcontrol           (mcontrol2_is_ldst), @1315
//          .ldst_addr_mcontrol      (mcontrol2_is_ldst_addr), @1316
//          .ldst_data_mcontrol      (mcontrol2_is_ldst_data), @1317
//          .mpriority               (mcontrol2_priority), @1318
//          .mpriority_mask          (mcontrol2_priority_mask), @1319
//          .mtiming                 (mcontrol2_mtiming), @1320
//          .mtiming_mask            (mcontrol2_mtiming_mask), @1321
//          .next_mpriority          (mcontrol3_priority), @1322
//          .next_mpriority_mask     (mcontrol3_priority_mask), @1323
//          .next_mtiming            (mcontrol3_mtiming), @1324
//          .next_mtiming_mask       (mcontrol3_mtiming_mask), @1325
//          .previous_mpriority      (mcontrol1_priority), @1326
//          .previous_mpriority_mask (mcontrol1_priority_mask), @1327
//          .previous_mtiming        (mcontrol1_mtiming), @1328
//          .previous_mtiming_mask   (mcontrol1_mtiming_mask), @1329
//          .mpriority_after_chain      (m2_priority), @1330
//          .mpriority_mask_after_chain (m2_priority_mask), @1331
//          .mtiming_after_chain        (m2_mtiming), @1332
//          .mtiming_mask_after_chain   (m2_mtiming_mask), @1333
//          .exe0_match              (mcontrol2_exe0_match), @1334
//          .exe1_match              (mcontrol2_exe1_match), @1335
//          .ldst_match              (mcontrol2_ldst_match), @1336
//          .tdata1         (m2_tdata1), @1337
//          .tdata2         (m2_tdata2), @1338
//          .tdata3         (m2_tdata3), @1339
//          .tinfo          (m2_tinfo), @1340
//          .ldst_may_hit   (mcontrol2_ldst_may_hit), @1341
//          .exe0_may_hit    (mcontrol2_exe0_may_hit), @1342
//          .exe1_may_hit    (mcontrol2_exe1_may_hit)); @1343
// &Instance("pa_dtu_mcontrol_3","x_pa_dtu_mcontrol_3"); @1345
// &Connect( @1346
//          .trigger_selected        (tselect_wr_en[3]), @1347
//          .set_trigger_hit         (mcontrol_hit[3]), @1348
//          .already_match           (already_match[3]),     @1349
//          .previous_trigger_chian  (mcontrol2_chain), @1350
//          .previous_trigger_dmode  (mcontrol2_dmode), @1351
//          .next_trigger_chain      (mcontrol4_chain), @1352
//          .next_trigger_dmode      (mcontrol4_dmode), @1353
//          .tdata1_chain            (mcontrol3_chain), @1354
//          .tdata1_dmode            (mcontrol3_dmode), @1355
//          .tdata1_action0          (mcontrol3_action0), @1356
//          .tdata1_action1          (mcontrol3_action1), @1357
//          .tdata1_timing           (mcontrol3_timing), @1358
//          .exe_mcontrol            (mcontrol3_is_exe), @1359
//          .ldst_mcontrol           (mcontrol3_is_ldst), @1360
//          .ldst_addr_mcontrol      (mcontrol3_is_ldst_addr), @1361
//          .ldst_data_mcontrol      (mcontrol3_is_ldst_data), @1362
//          .mpriority               (mcontrol3_priority), @1363
//          .mpriority_mask          (mcontrol3_priority_mask), @1364
//          .mtiming                 (mcontrol3_mtiming), @1365
//          .mtiming_mask            (mcontrol3_mtiming_mask), @1366
//          .next_mpriority          (mcontrol4_priority), @1367
//          .next_mpriority_mask     (mcontrol4_priority_mask), @1368
//          .next_mtiming            (mcontrol4_mtiming), @1369
//          .next_mtiming_mask       (mcontrol4_mtiming_mask), @1370
//          .previous_mpriority      (mcontrol2_priority), @1371
//          .previous_mpriority_mask (mcontrol2_priority_mask), @1372
//          .previous_mtiming        (mcontrol2_mtiming), @1373
//          .previous_mtiming_mask   (mcontrol2_mtiming_mask), @1374
//          .mpriority_after_chain      (m3_priority), @1375
//          .mpriority_mask_after_chain (m3_priority_mask), @1376
//          .mtiming_after_chain        (m3_mtiming), @1377
//          .mtiming_mask_after_chain   (m3_mtiming_mask), @1378
//          .exe0_match              (mcontrol3_exe0_match), @1379
//          .exe1_match              (mcontrol3_exe1_match), @1380
//          .ldst_match              (mcontrol3_ldst_match), @1381
//          .tdata1         (m3_tdata1), @1382
//          .tdata2         (m3_tdata2), @1383
//          .tdata3         (m3_tdata3), @1384
//          .tinfo          (m3_tinfo), @1385
//          .ldst_may_hit   (mcontrol3_ldst_may_hit), @1386
//          .exe0_may_hit    (mcontrol3_exe0_may_hit), @1387
//          .exe1_may_hit    (mcontrol3_exe1_may_hit)); @1388
// &Instance("pa_dtu_mcontrol_4","x_pa_dtu_mcontrol_4"); @1390
// &Connect( @1391
//          .trigger_selected        (tselect_wr_en[4]), @1392
//          .set_trigger_hit         (mcontrol_hit[4]), @1393
//          .already_match           (already_match[4]),     @1394
//          .previous_trigger_chian  (mcontrol3_chain), @1395
//          .previous_trigger_dmode  (mcontrol3_dmode), @1396
//          .next_trigger_chain      (mcontrol5_chain), @1397
//          .next_trigger_dmode      (mcontrol5_dmode), @1398
//          .tdata1_chain            (mcontrol4_chain), @1399
//          .tdata1_dmode            (mcontrol4_dmode), @1400
//          .tdata1_action0          (mcontrol4_action0), @1401
//          .tdata1_action1          (mcontrol4_action1), @1402
//          .tdata1_timing           (mcontrol4_timing), @1403
//          .exe_mcontrol            (mcontrol4_is_exe), @1404
//          .ldst_mcontrol           (mcontrol4_is_ldst), @1405
//          .ldst_addr_mcontrol      (mcontrol4_is_ldst_addr), @1406
//          .ldst_data_mcontrol      (mcontrol4_is_ldst_data), @1407
//          .mpriority               (mcontrol4_priority), @1408
//          .mpriority_mask          (mcontrol4_priority_mask), @1409
//          .mtiming                 (mcontrol4_mtiming), @1410
//          .mtiming_mask            (mcontrol4_mtiming_mask), @1411
//          .next_mpriority          (mcontrol5_priority), @1412
//          .next_mpriority_mask     (mcontrol5_priority_mask), @1413
//          .next_mtiming            (mcontrol5_mtiming), @1414
//          .next_mtiming_mask       (mcontrol5_mtiming_mask), @1415
//          .previous_mpriority      (mcontrol3_priority), @1416
//          .previous_mpriority_mask (mcontrol3_priority_mask), @1417
//          .previous_mtiming        (mcontrol3_mtiming), @1418
//          .previous_mtiming_mask   (mcontrol3_mtiming_mask), @1419
//          .mpriority_after_chain      (m4_priority), @1420
//          .mpriority_mask_after_chain (m4_priority_mask), @1421
//          .mtiming_after_chain        (m4_mtiming), @1422
//          .mtiming_mask_after_chain   (m4_mtiming_mask), @1423
//          .exe0_match              (mcontrol4_exe0_match), @1424
//          .exe1_match              (mcontrol4_exe1_match), @1425
//          .ldst_match              (mcontrol4_ldst_match), @1426
//          .tdata1         (m4_tdata1), @1427
//          .tdata2         (m4_tdata2), @1428
//          .tdata3         (m4_tdata3), @1429
//          .tinfo          (m4_tinfo), @1430
//          .ldst_may_hit   (mcontrol4_ldst_may_hit), @1431
//          .exe0_may_hit    (mcontrol4_exe0_may_hit), @1432
//          .exe1_may_hit    (mcontrol4_exe1_may_hit)); @1433
// &Instance("pa_dtu_mcontrol_5","x_pa_dtu_mcontrol_5"); @1435
// &Connect( @1436
//          .trigger_selected        (tselect_wr_en[5]), @1437
//          .set_trigger_hit         (mcontrol_hit[5]), @1438
//          .already_match           (already_match[5]),     @1439
//          .previous_trigger_chian  (mcontrol4_chain), @1440
//          .previous_trigger_dmode  (mcontrol4_dmode), @1441
//          .next_trigger_chain      (mcontrol6_chain), @1442
//          .next_trigger_dmode      (mcontrol6_dmode), @1443
//          .tdata1_chain            (mcontrol5_chain), @1444
//          .tdata1_dmode            (mcontrol5_dmode), @1445
//          .tdata1_action0          (mcontrol5_action0), @1446
//          .tdata1_action1          (mcontrol5_action1), @1447
//          .tdata1_timing           (mcontrol5_timing), @1448
//          .exe_mcontrol            (mcontrol5_is_exe), @1449
//          .ldst_mcontrol           (mcontrol5_is_ldst), @1450
//          .ldst_addr_mcontrol      (mcontrol5_is_ldst_addr), @1451
//          .ldst_data_mcontrol      (mcontrol5_is_ldst_data), @1452
//          .mpriority               (mcontrol5_priority), @1453
//          .mpriority_mask          (mcontrol5_priority_mask), @1454
//          .mtiming                 (mcontrol5_mtiming), @1455
//          .mtiming_mask            (mcontrol5_mtiming_mask), @1456
//          .next_mpriority          (mcontrol6_priority), @1457
//          .next_mpriority_mask     (mcontrol6_priority_mask), @1458
//          .next_mtiming            (mcontrol6_mtiming), @1459
//          .next_mtiming_mask       (mcontrol6_mtiming_mask), @1460
//          .previous_mpriority      (mcontrol4_priority), @1461
//          .previous_mpriority_mask (mcontrol4_priority_mask), @1462
//          .previous_mtiming        (mcontrol4_mtiming), @1463
//          .previous_mtiming_mask   (mcontrol4_mtiming_mask), @1464
//          .mpriority_after_chain      (m5_priority), @1465
//          .mpriority_mask_after_chain (m5_priority_mask), @1466
//          .mtiming_after_chain        (m5_mtiming), @1467
//          .mtiming_mask_after_chain   (m5_mtiming_mask), @1468
//          .exe0_match              (mcontrol5_exe0_match), @1469
//          .exe1_match              (mcontrol5_exe1_match), @1470
//          .ldst_match              (mcontrol5_ldst_match), @1471
//          .tdata1         (m5_tdata1), @1472
//          .tdata2         (m5_tdata2), @1473
//          .tdata3         (m5_tdata3), @1474
//          .tinfo          (m5_tinfo), @1475
//          .ldst_may_hit   (mcontrol5_ldst_may_hit), @1476
//          .exe0_may_hit    (mcontrol5_exe0_may_hit), @1477
//          .exe1_may_hit    (mcontrol5_exe1_may_hit)); @1478
// &Instance("pa_dtu_mcontrol_6","x_pa_dtu_mcontrol_6"); @1480
// &Connect( @1481
//          .trigger_selected        (tselect_wr_en[6]), @1482
//          .set_trigger_hit         (mcontrol_hit[6]), @1483
//          .already_match           (already_match[6]),     @1484
//          .previous_trigger_chian  (mcontrol5_chain), @1485
//          .previous_trigger_dmode  (mcontrol5_dmode), @1486
//          .next_trigger_chain      (1'b0), @1487
//          .next_trigger_dmode      (1'b0), @1488
//          .tdata1_chain            (mcontrol6_chain), @1489
//          .tdata1_dmode            (mcontrol6_dmode), @1490
//          .tdata1_action0          (mcontrol6_action0), @1491
//          .tdata1_action1          (mcontrol6_action1), @1492
//          .tdata1_timing           (mcontrol6_timing), @1493
//          .exe_mcontrol            (mcontrol6_is_exe), @1494
//          .ldst_mcontrol           (mcontrol6_is_ldst), @1495
//          .ldst_addr_mcontrol      (mcontrol6_is_ldst_addr), @1496
//          .ldst_data_mcontrol      (mcontrol6_is_ldst_data), @1497
//          .mpriority               (mcontrol6_priority), @1498
//          .mpriority_mask          (mcontrol6_priority_mask), @1499
//          .mtiming                 (mcontrol6_mtiming), @1500
//          .mtiming_mask            (mcontrol6_mtiming_mask), @1501
//          .next_mpriority          (2'b10), @1502
//          .next_mpriority_mask     (2'b00), @1503
//          .next_mtiming            (1'b1), @1504
//          .next_mtiming_mask       (1'b0), @1505
//          .previous_mpriority      (mcontrol5_priority), @1506
//          .previous_mpriority_mask (mcontrol5_priority_mask), @1507
//          .previous_mtiming        (mcontrol5_mtiming), @1508
//          .previous_mtiming_mask   (mcontrol5_mtiming_mask), @1509
//          .mpriority_after_chain      (m6_priority), @1510
//          .mpriority_mask_after_chain (m6_priority_mask), @1511
//          .mtiming_after_chain        (m6_mtiming), @1512
//          .mtiming_mask_after_chain   (m6_mtiming_mask), @1513
//          .exe0_match              (mcontrol6_exe0_match), @1514
//          .exe1_match              (mcontrol6_exe1_match), @1515
//          .ldst_match              (mcontrol6_ldst_match), @1516
//          .tdata1         (m6_tdata1), @1517
//          .tdata2         (m6_tdata2), @1518
//          .tdata3         (m6_tdata3), @1519
//          .tinfo          (m6_tinfo), @1520
//          .ldst_may_hit   (mcontrol6_ldst_may_hit), @1521
//          .exe0_may_hit    (mcontrol6_exe0_may_hit), @1522
//          .exe1_may_hit    (mcontrol6_exe1_may_hit)); @1523
// &Force("bus","tselect_wr_en",9,0); @1529

// &Instance("pa_dtu_mcontrol_0","x_pa_dtu_mcontrol_0"); @1533
// &Connect( @1534
//          .trigger_selected        (tselect_wr_en[0]), @1535
//          .set_trigger_hit         (mcontrol_hit[0]), @1536
//          .already_match           (already_match[0]), @1537
//          .previous_trigger_chian  (1'b0), @1538
//          .previous_trigger_dmode  (1'b0), @1539
//          .next_trigger_chain      (mcontrol1_chain), @1540
//          .next_trigger_dmode      (mcontrol1_dmode), @1541
//          .tdata1_chain            (mcontrol0_chain), @1542
//          .tdata1_dmode            (mcontrol0_dmode), @1543
//          .tdata1_action0          (mcontrol0_action0), @1544
//          .tdata1_action1          (mcontrol0_action1),   @1545
//          .tdata1_timing           (mcontrol0_timing), @1546
//          .exe_mcontrol            (mcontrol0_is_exe), @1547
//          .ldst_mcontrol           (mcontrol0_is_ldst), @1548
//          .ldst_addr_mcontrol      (mcontrol0_is_ldst_addr), @1549
//          .ldst_data_mcontrol      (mcontrol0_is_ldst_data), @1550
//          .mpriority               (mcontrol0_priority), @1551
//          .mpriority_mask          (mcontrol0_priority_mask), @1552
//          .mtiming                 (mcontrol0_mtiming), @1553
//          .mtiming_mask            (mcontrol0_mtiming_mask), @1554
//          .next_mpriority          (mcontrol1_priority), @1555
//          .next_mpriority_mask     (mcontrol1_priority_mask), @1556
//          .next_mtiming            (mcontrol1_mtiming), @1557
//          .next_mtiming_mask       (mcontrol1_mtiming_mask), @1558
//          .previous_mpriority      (2'b10), @1559
//          .previous_mpriority_mask (2'b00), @1560
//          .previous_mtiming        (1'b1), @1561
//          .previous_mtiming_mask   (1'b0), @1562
//          .mpriority_after_chain      (m0_priority), @1563
//          .mpriority_mask_after_chain (m0_priority_mask), @1564
//          .mtiming_after_chain        (m0_mtiming), @1565
//          .mtiming_mask_after_chain   (m0_mtiming_mask), @1566
//          .exe0_match              (mcontrol0_exe0_match), @1567
//          .exe1_match              (mcontrol0_exe1_match), @1568
//          .ldst_match              (mcontrol0_ldst_match), @1569
//          .tdata1         (m0_tdata1), @1570
//          .tdata2         (m0_tdata2), @1571
//          .tdata3         (m0_tdata3), @1572
//          .tinfo          (m0_tinfo), @1573
//          .ldst_may_hit    (mcontrol0_ldst_may_hit), @1574
//          .exe0_may_hit    (mcontrol0_exe0_may_hit), @1575
//          .exe1_may_hit    (mcontrol0_exe1_may_hit)); @1576
// &Instance("pa_dtu_mcontrol_1","x_pa_dtu_mcontrol_1"); @1578
// &Connect( @1579
//          .trigger_selected        (tselect_wr_en[1]), @1580
//          .set_trigger_hit         (mcontrol_hit[1]), @1581
//          .already_match           (already_match[1]),     @1582
//          .previous_trigger_chian  (mcontrol0_chain), @1583
//          .previous_trigger_dmode  (mcontrol0_dmode), @1584
//          .next_trigger_chain      (mcontrol2_chain), @1585
//          .next_trigger_dmode      (mcontrol2_dmode), @1586
//          .tdata1_chain            (mcontrol1_chain), @1587
//          .tdata1_dmode            (mcontrol1_dmode), @1588
//          .tdata1_action0          (mcontrol1_action0), @1589
//          .tdata1_action1          (mcontrol1_action1), @1590
//          .tdata1_timing           (mcontrol1_timing), @1591
//          .exe_mcontrol            (mcontrol1_is_exe), @1592
//          .ldst_mcontrol           (mcontrol1_is_ldst), @1593
//          .ldst_addr_mcontrol      (mcontrol1_is_ldst_addr), @1594
//          .ldst_data_mcontrol      (mcontrol1_is_ldst_data), @1595
//          .mpriority               (mcontrol1_priority), @1596
//          .mpriority_mask          (mcontrol1_priority_mask), @1597
//          .mtiming                 (mcontrol1_mtiming), @1598
//          .mtiming_mask            (mcontrol1_mtiming_mask), @1599
//          .next_mpriority          (mcontrol2_priority), @1600
//          .next_mpriority_mask     (mcontrol2_priority_mask), @1601
//          .next_mtiming            (mcontrol2_mtiming), @1602
//          .next_mtiming_mask       (mcontrol2_mtiming_mask), @1603
//          .previous_mpriority      (mcontrol0_priority), @1604
//          .previous_mpriority_mask (mcontrol0_priority_mask), @1605
//          .previous_mtiming        (mcontrol0_mtiming), @1606
//          .previous_mtiming_mask   (mcontrol0_mtiming_mask), @1607
//          .mpriority_after_chain      (m1_priority), @1608
//          .mpriority_mask_after_chain (m1_priority_mask), @1609
//          .mtiming_after_chain        (m1_mtiming), @1610
//          .mtiming_mask_after_chain   (m1_mtiming_mask), @1611
//          .exe0_match              (mcontrol1_exe0_match), @1612
//          .exe1_match              (mcontrol1_exe1_match), @1613
//          .ldst_match              (mcontrol1_ldst_match), @1614
//          .tdata1         (m1_tdata1), @1615
//          .tdata2         (m1_tdata2), @1616
//          .tdata3         (m1_tdata3), @1617
//          .tinfo          (m1_tinfo), @1618
//          .ldst_may_hit   (mcontrol1_ldst_may_hit), @1619
//          .exe0_may_hit    (mcontrol1_exe0_may_hit), @1620
//          .exe1_may_hit    (mcontrol1_exe1_may_hit)); @1621
// &Instance("pa_dtu_mcontrol_2","x_pa_dtu_mcontrol_2"); @1623
// &Connect( @1624
//          .trigger_selected        (tselect_wr_en[2]), @1625
//          .set_trigger_hit         (mcontrol_hit[2]), @1626
//          .already_match           (already_match[2]),     @1627
//          .previous_trigger_chian  (mcontrol1_chain), @1628
//          .previous_trigger_dmode  (mcontrol1_dmode), @1629
//          .next_trigger_chain      (mcontrol3_chain), @1630
//          .next_trigger_dmode      (mcontrol3_dmode), @1631
//          .tdata1_chain            (mcontrol2_chain), @1632
//          .tdata1_dmode            (mcontrol2_dmode), @1633
//          .tdata1_action0          (mcontrol2_action0), @1634
//          .tdata1_action1          (mcontrol2_action1), @1635
//          .tdata1_timing           (mcontrol2_timing), @1636
//          .exe_mcontrol            (mcontrol2_is_exe), @1637
//          .ldst_mcontrol           (mcontrol2_is_ldst), @1638
//          .ldst_addr_mcontrol      (mcontrol2_is_ldst_addr), @1639
//          .ldst_data_mcontrol      (mcontrol2_is_ldst_data), @1640
//          .mpriority               (mcontrol2_priority), @1641
//          .mpriority_mask          (mcontrol2_priority_mask), @1642
//          .mtiming                 (mcontrol2_mtiming), @1643
//          .mtiming_mask            (mcontrol2_mtiming_mask), @1644
//          .next_mpriority          (mcontrol3_priority), @1645
//          .next_mpriority_mask     (mcontrol3_priority_mask), @1646
//          .next_mtiming            (mcontrol3_mtiming), @1647
//          .next_mtiming_mask       (mcontrol3_mtiming_mask), @1648
//          .previous_mpriority      (mcontrol1_priority), @1649
//          .previous_mpriority_mask (mcontrol1_priority_mask), @1650
//          .previous_mtiming        (mcontrol1_mtiming), @1651
//          .previous_mtiming_mask   (mcontrol1_mtiming_mask), @1652
//          .mpriority_after_chain      (m2_priority), @1653
//          .mpriority_mask_after_chain (m2_priority_mask), @1654
//          .mtiming_after_chain        (m2_mtiming), @1655
//          .mtiming_mask_after_chain   (m2_mtiming_mask), @1656
//          .exe0_match              (mcontrol2_exe0_match), @1657
//          .exe1_match              (mcontrol2_exe1_match), @1658
//          .ldst_match              (mcontrol2_ldst_match), @1659
//          .tdata1         (m2_tdata1), @1660
//          .tdata2         (m2_tdata2), @1661
//          .tdata3         (m2_tdata3), @1662
//          .tinfo          (m2_tinfo), @1663
//          .ldst_may_hit   (mcontrol2_ldst_may_hit), @1664
//          .exe0_may_hit    (mcontrol2_exe0_may_hit), @1665
//          .exe1_may_hit    (mcontrol2_exe1_may_hit)); @1666
// &Instance("pa_dtu_mcontrol_3","x_pa_dtu_mcontrol_3"); @1668
// &Connect( @1669
//          .trigger_selected        (tselect_wr_en[3]), @1670
//          .set_trigger_hit         (mcontrol_hit[3]), @1671
//          .already_match           (already_match[3]),     @1672
//          .previous_trigger_chian  (mcontrol2_chain), @1673
//          .previous_trigger_dmode  (mcontrol2_dmode), @1674
//          .next_trigger_chain      (mcontrol4_chain), @1675
//          .next_trigger_dmode      (mcontrol4_dmode), @1676
//          .tdata1_chain            (mcontrol3_chain), @1677
//          .tdata1_dmode            (mcontrol3_dmode), @1678
//          .tdata1_action0          (mcontrol3_action0), @1679
//          .tdata1_action1          (mcontrol3_action1), @1680
//          .tdata1_timing           (mcontrol3_timing), @1681
//          .exe_mcontrol            (mcontrol3_is_exe), @1682
//          .ldst_mcontrol           (mcontrol3_is_ldst), @1683
//          .ldst_addr_mcontrol      (mcontrol3_is_ldst_addr), @1684
//          .ldst_data_mcontrol      (mcontrol3_is_ldst_data), @1685
//          .mpriority               (mcontrol3_priority), @1686
//          .mpriority_mask          (mcontrol3_priority_mask), @1687
//          .mtiming                 (mcontrol3_mtiming), @1688
//          .mtiming_mask            (mcontrol3_mtiming_mask), @1689
//          .next_mpriority          (mcontrol4_priority), @1690
//          .next_mpriority_mask     (mcontrol4_priority_mask), @1691
//          .next_mtiming            (mcontrol4_mtiming), @1692
//          .next_mtiming_mask       (mcontrol4_mtiming_mask), @1693
//          .previous_mpriority      (mcontrol2_priority), @1694
//          .previous_mpriority_mask (mcontrol2_priority_mask), @1695
//          .previous_mtiming        (mcontrol2_mtiming), @1696
//          .previous_mtiming_mask   (mcontrol2_mtiming_mask), @1697
//          .mpriority_after_chain      (m3_priority), @1698
//          .mpriority_mask_after_chain (m3_priority_mask), @1699
//          .mtiming_after_chain        (m3_mtiming), @1700
//          .mtiming_mask_after_chain   (m3_mtiming_mask), @1701
//          .exe0_match              (mcontrol3_exe0_match), @1702
//          .exe1_match              (mcontrol3_exe1_match), @1703
//          .ldst_match              (mcontrol3_ldst_match), @1704
//          .tdata1         (m3_tdata1), @1705
//          .tdata2         (m3_tdata2), @1706
//          .tdata3         (m3_tdata3), @1707
//          .tinfo          (m3_tinfo), @1708
//          .ldst_may_hit   (mcontrol3_ldst_may_hit), @1709
//          .exe0_may_hit    (mcontrol3_exe0_may_hit), @1710
//          .exe1_may_hit    (mcontrol3_exe1_may_hit)); @1711
// &Instance("pa_dtu_mcontrol_4","x_pa_dtu_mcontrol_4"); @1713
// &Connect( @1714
//          .trigger_selected        (tselect_wr_en[4]), @1715
//          .set_trigger_hit         (mcontrol_hit[4]), @1716
//          .already_match           (already_match[4]),     @1717
//          .previous_trigger_chian  (mcontrol3_chain), @1718
//          .previous_trigger_dmode  (mcontrol3_dmode), @1719
//          .next_trigger_chain      (mcontrol5_chain), @1720
//          .next_trigger_dmode      (mcontrol5_dmode), @1721
//          .tdata1_chain            (mcontrol4_chain), @1722
//          .tdata1_dmode            (mcontrol4_dmode), @1723
//          .tdata1_action0          (mcontrol4_action0), @1724
//          .tdata1_action1          (mcontrol4_action1), @1725
//          .tdata1_timing           (mcontrol4_timing), @1726
//          .exe_mcontrol            (mcontrol4_is_exe), @1727
//          .ldst_mcontrol           (mcontrol4_is_ldst), @1728
//          .ldst_addr_mcontrol      (mcontrol4_is_ldst_addr), @1729
//          .ldst_data_mcontrol      (mcontrol4_is_ldst_data), @1730
//          .mpriority               (mcontrol4_priority), @1731
//          .mpriority_mask          (mcontrol4_priority_mask), @1732
//          .mtiming                 (mcontrol4_mtiming), @1733
//          .mtiming_mask            (mcontrol4_mtiming_mask), @1734
//          .next_mpriority          (mcontrol5_priority), @1735
//          .next_mpriority_mask     (mcontrol5_priority_mask), @1736
//          .next_mtiming            (mcontrol5_mtiming), @1737
//          .next_mtiming_mask       (mcontrol5_mtiming_mask), @1738
//          .previous_mpriority      (mcontrol3_priority), @1739
//          .previous_mpriority_mask (mcontrol3_priority_mask), @1740
//          .previous_mtiming        (mcontrol3_mtiming), @1741
//          .previous_mtiming_mask   (mcontrol3_mtiming_mask), @1742
//          .mpriority_after_chain      (m4_priority), @1743
//          .mpriority_mask_after_chain (m4_priority_mask), @1744
//          .mtiming_after_chain        (m4_mtiming), @1745
//          .mtiming_mask_after_chain   (m4_mtiming_mask), @1746
//          .exe0_match              (mcontrol4_exe0_match), @1747
//          .exe1_match              (mcontrol4_exe1_match), @1748
//          .ldst_match              (mcontrol4_ldst_match), @1749
//          .tdata1         (m4_tdata1), @1750
//          .tdata2         (m4_tdata2), @1751
//          .tdata3         (m4_tdata3), @1752
//          .tinfo          (m4_tinfo), @1753
//          .ldst_may_hit   (mcontrol4_ldst_may_hit), @1754
//          .exe0_may_hit    (mcontrol4_exe0_may_hit), @1755
//          .exe1_may_hit    (mcontrol4_exe1_may_hit)); @1756
// &Instance("pa_dtu_mcontrol_5","x_pa_dtu_mcontrol_5"); @1758
// &Connect( @1759
//          .trigger_selected        (tselect_wr_en[5]), @1760
//          .set_trigger_hit         (mcontrol_hit[5]), @1761
//          .already_match           (already_match[5]),     @1762
//          .previous_trigger_chian  (mcontrol4_chain), @1763
//          .previous_trigger_dmode  (mcontrol4_dmode), @1764
//          .next_trigger_chain      (mcontrol6_chain), @1765
//          .next_trigger_dmode      (mcontrol6_dmode), @1766
//          .tdata1_chain            (mcontrol5_chain), @1767
//          .tdata1_dmode            (mcontrol5_dmode), @1768
//          .tdata1_action0          (mcontrol5_action0), @1769
//          .tdata1_action1          (mcontrol5_action1), @1770
//          .tdata1_timing           (mcontrol5_timing), @1771
//          .exe_mcontrol            (mcontrol5_is_exe), @1772
//          .ldst_mcontrol           (mcontrol5_is_ldst), @1773
//          .ldst_addr_mcontrol      (mcontrol5_is_ldst_addr), @1774
//          .ldst_data_mcontrol      (mcontrol5_is_ldst_data), @1775
//          .mpriority               (mcontrol5_priority), @1776
//          .mpriority_mask          (mcontrol5_priority_mask), @1777
//          .mtiming                 (mcontrol5_mtiming), @1778
//          .mtiming_mask            (mcontrol5_mtiming_mask), @1779
//          .next_mpriority          (mcontrol6_priority), @1780
//          .next_mpriority_mask     (mcontrol6_priority_mask), @1781
//          .next_mtiming            (mcontrol6_mtiming), @1782
//          .next_mtiming_mask       (mcontrol6_mtiming_mask), @1783
//          .previous_mpriority      (mcontrol4_priority), @1784
//          .previous_mpriority_mask (mcontrol4_priority_mask), @1785
//          .previous_mtiming        (mcontrol4_mtiming), @1786
//          .previous_mtiming_mask   (mcontrol4_mtiming_mask), @1787
//          .mpriority_after_chain      (m5_priority), @1788
//          .mpriority_mask_after_chain (m5_priority_mask), @1789
//          .mtiming_after_chain        (m5_mtiming), @1790
//          .mtiming_mask_after_chain   (m5_mtiming_mask), @1791
//          .exe0_match              (mcontrol5_exe0_match), @1792
//          .exe1_match              (mcontrol5_exe1_match), @1793
//          .ldst_match              (mcontrol5_ldst_match), @1794
//          .tdata1         (m5_tdata1), @1795
//          .tdata2         (m5_tdata2), @1796
//          .tdata3         (m5_tdata3), @1797
//          .tinfo          (m5_tinfo), @1798
//          .ldst_may_hit   (mcontrol5_ldst_may_hit), @1799
//          .exe0_may_hit    (mcontrol5_exe0_may_hit), @1800
//          .exe1_may_hit    (mcontrol5_exe1_may_hit)); @1801
// &Instance("pa_dtu_mcontrol_6","x_pa_dtu_mcontrol_6"); @1803
// &Connect( @1804
//          .trigger_selected        (tselect_wr_en[6]), @1805
//          .set_trigger_hit         (mcontrol_hit[6]), @1806
//          .already_match           (already_match[6]),     @1807
//          .previous_trigger_chian  (mcontrol5_chain), @1808
//          .previous_trigger_dmode  (mcontrol5_dmode), @1809
//          .next_trigger_chain      (mcontrol7_chain), @1810
//          .next_trigger_dmode      (mcontrol7_dmode), @1811
//          .tdata1_chain            (mcontrol6_chain), @1812
//          .tdata1_dmode            (mcontrol6_dmode), @1813
//          .tdata1_action0          (mcontrol6_action0), @1814
//          .tdata1_action1          (mcontrol6_action1), @1815
//          .tdata1_timing           (mcontrol6_timing), @1816
//          .exe_mcontrol            (mcontrol6_is_exe), @1817
//          .ldst_mcontrol           (mcontrol6_is_ldst), @1818
//          .ldst_addr_mcontrol      (mcontrol6_is_ldst_addr), @1819
//          .ldst_data_mcontrol      (mcontrol6_is_ldst_data), @1820
//          .mpriority               (mcontrol6_priority), @1821
//          .mpriority_mask          (mcontrol6_priority_mask), @1822
//          .mtiming                 (mcontrol6_mtiming), @1823
//          .mtiming_mask            (mcontrol6_mtiming_mask), @1824
//          .next_mpriority          (mcontrol7_priority), @1825
//          .next_mpriority_mask     (mcontrol7_priority_mask), @1826
//          .next_mtiming            (mcontrol7_mtiming), @1827
//          .next_mtiming_mask       (mcontrol7_mtiming_mask), @1828
//          .previous_mpriority      (mcontrol5_priority), @1829
//          .previous_mpriority_mask (mcontrol5_priority_mask), @1830
//          .previous_mtiming        (mcontrol5_mtiming), @1831
//          .previous_mtiming_mask   (mcontrol5_mtiming_mask), @1832
//          .mpriority_after_chain      (m6_priority), @1833
//          .mpriority_mask_after_chain (m6_priority_mask), @1834
//          .mtiming_after_chain        (m6_mtiming), @1835
//          .mtiming_mask_after_chain   (m6_mtiming_mask), @1836
//          .exe0_match              (mcontrol6_exe0_match), @1837
//          .exe1_match              (mcontrol6_exe1_match), @1838
//          .ldst_match              (mcontrol6_ldst_match), @1839
//          .tdata1         (m6_tdata1), @1840
//          .tdata2         (m6_tdata2), @1841
//          .tdata3         (m6_tdata3), @1842
//          .tinfo          (m6_tinfo), @1843
//          .ldst_may_hit   (mcontrol6_ldst_may_hit), @1844
//          .exe0_may_hit    (mcontrol6_exe0_may_hit), @1845
//          .exe1_may_hit    (mcontrol6_exe1_may_hit)); @1846
// &Instance("pa_dtu_mcontrol_7","x_pa_dtu_mcontrol_7"); @1848
// &Connect( @1849
//          .trigger_selected        (tselect_wr_en[7]), @1850
//          .set_trigger_hit         (mcontrol_hit[7]), @1851
//          .already_match           (already_match[7]),     @1852
//          .previous_trigger_chian  (mcontrol6_chain), @1853
//          .previous_trigger_dmode  (mcontrol6_dmode), @1854
//          .next_trigger_chain      (1'b1), @1855
//          .next_trigger_dmode      (1'b0), @1856
//          .tdata1_chain            (mcontrol7_chain), @1857
//          .tdata1_dmode            (mcontrol7_dmode), @1858
//          .tdata1_action0          (mcontrol7_action0), @1859
//          .tdata1_action1          (mcontrol7_action1), @1860
//          .tdata1_timing           (mcontrol7_timing), @1861
//          .exe_mcontrol            (mcontrol7_is_exe), @1862
//          .ldst_mcontrol           (mcontrol7_is_ldst), @1863
//          .ldst_addr_mcontrol      (mcontrol7_is_ldst_addr), @1864
//          .ldst_data_mcontrol      (mcontrol7_is_ldst_data), @1865
//          .mpriority               (mcontrol7_priority), @1866
//          .mpriority_mask          (mcontrol7_priority_mask), @1867
//          .mtiming                 (mcontrol7_mtiming), @1868
//          .mtiming_mask            (mcontrol7_mtiming_mask), @1869
//          .next_mpriority          (2'b10), @1870
//          .next_mpriority_mask     (2'b00), @1871
//          .next_mtiming            (1'b1), @1872
//          .next_mtiming_mask       (1'b0), @1873
//          .previous_mpriority      (mcontrol6_priority), @1874
//          .previous_mpriority_mask (mcontrol6_priority_mask), @1875
//          .previous_mtiming        (mcontrol6_mtiming), @1876
//          .previous_mtiming_mask   (mcontrol6_mtiming_mask), @1877
//          .mpriority_after_chain      (m7_priority), @1878
//          .mpriority_mask_after_chain (m7_priority_mask), @1879
//          .mtiming_after_chain        (m7_mtiming), @1880
//          .mtiming_mask_after_chain   (m7_mtiming_mask), @1881
//          .exe0_match              (mcontrol7_exe0_match), @1882
//          .exe1_match              (mcontrol7_exe1_match), @1883
//          .ldst_match              (mcontrol7_ldst_match), @1884
//          .tdata1         (m7_tdata1), @1885
//          .tdata2         (m7_tdata2), @1886
//          .tdata3         (m7_tdata3), @1887
//          .tinfo          (m7_tinfo), @1888
//          .ldst_may_hit   (mcontrol7_ldst_may_hit), @1889
//          .exe0_may_hit    (mcontrol7_exe0_may_hit), @1890
//          .exe1_may_hit    (mcontrol7_exe1_may_hit)); @1891
// &Force("bus","tselect_wr_en",9,0); @1892
//=========================================================
//
//                   generate information     
//
//=========================================================
// &Force("bus","lsu_dtu_halt_info",`TDT_HINFO_WIDTH-1,0); @1901
assign already_match[2:0] = lsu_dtu_halt_info[`TDT_HINFO_TRIGGER:`TDT_HINFO_TRIGGER-2];
assign action0_mcontrol[`TDT_TM_MCONTROL_TRI_NUM-1:0] = {mcontrol2_action0,
                                                         mcontrol1_action0,mcontrol0_action0};
assign action1_mcontrol[`TDT_TM_MCONTROL_TRI_NUM-1:0] = {mcontrol2_action1,
                                                         mcontrol1_action1,mcontrol0_action1};
assign ldst_addr_mcontrol = mcontrol0_is_ldst_addr || mcontrol1_is_ldst_addr || mcontrol2_is_ldst_addr;
assign ldst_data_mcontrol = mcontrol0_is_ldst_data || mcontrol1_is_ldst_data || mcontrol2_is_ldst_data;
assign exe0_may_hit       = mcontrol0_exe0_may_hit || mcontrol1_exe0_may_hit || mcontrol2_exe0_may_hit;
assign exe1_may_hit       = mcontrol0_exe1_may_hit || mcontrol1_exe1_may_hit || mcontrol2_exe1_may_hit;
assign exe_may_hit        = exe0_may_hit && ifu_dtu_addr_vld0 || exe1_may_hit && ifu_dtu_addr_vld1;  
assign ldst_may_hit       = mcontrol0_ldst_may_hit || mcontrol1_ldst_may_hit || mcontrol2_ldst_may_hit;
//assign exe_clcye1_hit_vld_need_reg =  exe0_may_hit && (ifu_dtu_addr_vld0 || ifu_dtu_data_vld0) ||
//                                      exe1_may_hit && (ifu_dtu_addr_vld1 || ifu_dtu_data_vld1);
always @(posedge mcontrol_output_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    exe_cycle2_cannot_hit <= 1'b0;
  else if(exe_cycle2_cannot_hit)
    exe_cycle2_cannot_hit <= 1'b0;
  else if(exe_may_hit)
    exe_cycle2_cannot_hit <= 1'b1;
end
always @(posedge mcontrol_output_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ldst_cycle2_cannot_hit <= 1'b0;
  else if(ldst_cycle2_cannot_hit)
    ldst_cycle2_cannot_hit <= 1'b0;
  else if(ldst_may_hit)
    ldst_cycle2_cannot_hit <= 1'b1;
end

assign dtu_ifu_halt_info_vld     = exe_cycle2_cannot_hit || !exe_may_hit;
assign dtu_lsu_halt_info_vld     = ldst_cycle2_cannot_hit || !ldst_may_hit;
//----------------------chain info-------------------------
//   &Force("nonport","mcontrol0_is_exe");&Force("nonport","mcontrol1_is_exe"); @2198
//   &Force("nonport","mcontrol2_is_exe");&Force("nonport","mcontrol3_is_exe"); @2199
//   &Force("nonport","mcontrol4_is_exe");&Force("nonport","mcontrol5_is_exe"); @2200
//   &Force("nonport","mcontrol6_is_exe");&Force("nonport","mcontrol7_is_exe"); @2201
  assign mcontrol3_is_ldst =1'b0;
  assign mcontrol4_is_ldst =1'b0;
  assign mcontrol5_is_ldst =1'b0;
  assign mcontrol6_is_ldst =1'b0;
  assign mcontrol7_is_ldst =1'b0;
//----------------------priority and timing info-------------------------
//higher priority
  assign m3_priority[1:0] =2'b00;
  assign m3_priority_mask[1:0] =2'b11;
  assign m4_priority[1:0] =2'b00;
  assign m4_priority_mask[1:0] =2'b11;
  assign m5_priority[1:0] =2'b00;
  assign m5_priority_mask[1:0] =2'b11;
  assign m6_priority[1:0] =2'b00;
  assign m6_priority_mask[1:0] =2'b11;
  assign m7_priority[1:0] =2'b00;
  assign m7_priority_mask[1:0] =2'b11;

assign m1_phigher_than_m0 = |(m0_priority_mask[1:0] & m1_priority[1:0]);
assign m2_phigher_than_m0 = |(m0_priority_mask[1:0] & m2_priority[1:0]);
assign m3_phigher_than_m0 = |(m0_priority_mask[1:0] & m3_priority[1:0]);
assign m4_phigher_than_m0 = |(m0_priority_mask[1:0] & m4_priority[1:0]);
assign m5_phigher_than_m0 = |(m0_priority_mask[1:0] & m5_priority[1:0]);
assign m6_phigher_than_m0 = |(m0_priority_mask[1:0] & m6_priority[1:0]);
assign m7_phigher_than_m0 = |(m0_priority_mask[1:0] & m7_priority[1:0]);
assign x_phigher_than_m0[6:0] = {m7_phigher_than_m0,m6_phigher_than_m0,m5_phigher_than_m0,
                                 m4_phigher_than_m0,m3_phigher_than_m0,m2_phigher_than_m0,
                                 m1_phigher_than_m0};

assign m0_phigher_than_m1 = |(m1_priority_mask[1:0] & m0_priority[1:0]);
assign m2_phigher_than_m1 = |(m1_priority_mask[1:0] & m2_priority[1:0]);
assign m3_phigher_than_m1 = |(m1_priority_mask[1:0] & m3_priority[1:0]);
assign m4_phigher_than_m1 = |(m1_priority_mask[1:0] & m4_priority[1:0]);
assign m5_phigher_than_m1 = |(m1_priority_mask[1:0] & m5_priority[1:0]);
assign m6_phigher_than_m1 = |(m1_priority_mask[1:0] & m6_priority[1:0]);
assign m7_phigher_than_m1 = |(m1_priority_mask[1:0] & m7_priority[1:0]);
assign x_phigher_than_m1[6:0] = {m7_phigher_than_m1,m6_phigher_than_m1,m5_phigher_than_m1,
                                 m4_phigher_than_m1,m3_phigher_than_m1,m2_phigher_than_m1,
                                 m0_phigher_than_m1};

assign m0_phigher_than_m2 = |(m2_priority_mask[1:0] & m0_priority[1:0]);
assign m1_phigher_than_m2 = |(m2_priority_mask[1:0] & m1_priority[1:0]);
assign m3_phigher_than_m2 = |(m2_priority_mask[1:0] & m3_priority[1:0]);
assign m4_phigher_than_m2 = |(m2_priority_mask[1:0] & m4_priority[1:0]);
assign m5_phigher_than_m2 = |(m2_priority_mask[1:0] & m5_priority[1:0]);
assign m6_phigher_than_m2 = |(m2_priority_mask[1:0] & m6_priority[1:0]);
assign m7_phigher_than_m2 = |(m2_priority_mask[1:0] & m7_priority[1:0]);
assign x_phigher_than_m2[6:0] = {m7_phigher_than_m2,m6_phigher_than_m2,m5_phigher_than_m2,
                                 m4_phigher_than_m2,m3_phigher_than_m2,m1_phigher_than_m2,
                                 m0_phigher_than_m2};

assign m0_phigher_than_m3 = |(m3_priority_mask[1:0] & m0_priority[1:0]);
assign m1_phigher_than_m3 = |(m3_priority_mask[1:0] & m1_priority[1:0]);
assign m2_phigher_than_m3 = |(m3_priority_mask[1:0] & m2_priority[1:0]);
assign m4_phigher_than_m3 = |(m3_priority_mask[1:0] & m4_priority[1:0]);
assign m5_phigher_than_m3 = |(m3_priority_mask[1:0] & m5_priority[1:0]);
assign m6_phigher_than_m3 = |(m3_priority_mask[1:0] & m6_priority[1:0]);
assign m7_phigher_than_m3 = |(m3_priority_mask[1:0] & m7_priority[1:0]);
assign x_phigher_than_m3[6:0] = {m7_phigher_than_m3,m6_phigher_than_m3,m5_phigher_than_m3,
                                 m4_phigher_than_m3,m2_phigher_than_m3,m1_phigher_than_m3,
                                 m0_phigher_than_m3};

assign m0_phigher_than_m4 = |(m4_priority_mask[1:0] & m0_priority[1:0]);
assign m1_phigher_than_m4 = |(m4_priority_mask[1:0] & m1_priority[1:0]);
assign m2_phigher_than_m4 = |(m4_priority_mask[1:0] & m2_priority[1:0]);
assign m3_phigher_than_m4 = |(m4_priority_mask[1:0] & m3_priority[1:0]);
assign m5_phigher_than_m4 = |(m4_priority_mask[1:0] & m5_priority[1:0]);
assign m6_phigher_than_m4 = |(m4_priority_mask[1:0] & m6_priority[1:0]);
assign m7_phigher_than_m4 = |(m4_priority_mask[1:0] & m7_priority[1:0]);
assign x_phigher_than_m4[6:0] = {m7_phigher_than_m4,m6_phigher_than_m4,m5_phigher_than_m4,
                                 m3_phigher_than_m4,m2_phigher_than_m4,m1_phigher_than_m4,
                                 m0_phigher_than_m4};

assign m0_phigher_than_m5 = |(m5_priority_mask[1:0] & m0_priority[1:0]);
assign m1_phigher_than_m5 = |(m5_priority_mask[1:0] & m1_priority[1:0]);
assign m2_phigher_than_m5 = |(m5_priority_mask[1:0] & m2_priority[1:0]);
assign m3_phigher_than_m5 = |(m5_priority_mask[1:0] & m3_priority[1:0]);
assign m4_phigher_than_m5 = |(m5_priority_mask[1:0] & m4_priority[1:0]);
assign m6_phigher_than_m5 = |(m5_priority_mask[1:0] & m6_priority[1:0]);
assign m7_phigher_than_m5 = |(m5_priority_mask[1:0] & m7_priority[1:0]);
assign x_phigher_than_m5[6:0] = {m7_phigher_than_m5,m6_phigher_than_m5,m4_phigher_than_m5,
                                 m3_phigher_than_m5,m2_phigher_than_m5,m1_phigher_than_m5,
                                 m0_phigher_than_m5};

assign m0_phigher_than_m6 = |(m6_priority_mask[1:0] & m0_priority[1:0]);
assign m1_phigher_than_m6 = |(m6_priority_mask[1:0] & m1_priority[1:0]);
assign m2_phigher_than_m6 = |(m6_priority_mask[1:0] & m2_priority[1:0]);
assign m3_phigher_than_m6 = |(m6_priority_mask[1:0] & m3_priority[1:0]);
assign m4_phigher_than_m6 = |(m6_priority_mask[1:0] & m4_priority[1:0]);
assign m5_phigher_than_m6 = |(m6_priority_mask[1:0] & m5_priority[1:0]);
assign m7_phigher_than_m6 = |(m6_priority_mask[1:0] & m7_priority[1:0]);
assign x_phigher_than_m6[6:0] = {m7_phigher_than_m6,m5_phigher_than_m6,m4_phigher_than_m6,
                                 m3_phigher_than_m6,m2_phigher_than_m6,m1_phigher_than_m6,
                                 m0_phigher_than_m6};

assign m0_phigher_than_m7 = |(m7_priority_mask[1:0] & m0_priority[1:0]);
assign m1_phigher_than_m7 = |(m7_priority_mask[1:0] & m1_priority[1:0]);
assign m2_phigher_than_m7 = |(m7_priority_mask[1:0] & m2_priority[1:0]);
assign m3_phigher_than_m7 = |(m7_priority_mask[1:0] & m3_priority[1:0]);
assign m4_phigher_than_m7 = |(m7_priority_mask[1:0] & m4_priority[1:0]);
assign m5_phigher_than_m7 = |(m7_priority_mask[1:0] & m5_priority[1:0]);
assign m6_phigher_than_m7 = |(m7_priority_mask[1:0] & m6_priority[1:0]);
assign x_phigher_than_m7[6:0] = {m6_phigher_than_m7,m5_phigher_than_m7,m4_phigher_than_m7,
                                 m3_phigher_than_m7,m2_phigher_than_m7,m1_phigher_than_m7,
                                 m0_phigher_than_m7};

//higher timing
  assign m3_mtiming =1'b0;
  assign m3_mtiming_mask =1'b1;
  assign m4_mtiming =1'b0;
  assign m4_mtiming_mask =1'b1;
  assign m5_mtiming =1'b0;
  assign m5_mtiming_mask =1'b1;
  assign m6_mtiming =1'b0;
  assign m6_mtiming_mask =1'b1;
  assign m7_mtiming =1'b0;
  assign m7_mtiming_mask =1'b1;

assign m1_thigher_than_m0 = m0_mtiming_mask & m1_mtiming;
assign m2_thigher_than_m0 = m0_mtiming_mask & m2_mtiming;
assign m3_thigher_than_m0 = m0_mtiming_mask & m3_mtiming;
assign m4_thigher_than_m0 = m0_mtiming_mask & m4_mtiming;
assign m5_thigher_than_m0 = m0_mtiming_mask & m5_mtiming;
assign m6_thigher_than_m0 = m0_mtiming_mask & m6_mtiming;
assign m7_thigher_than_m0 = m0_mtiming_mask & m7_mtiming;
assign x_thigher_than_m0[6:0] = {m7_thigher_than_m0,m6_thigher_than_m0,m5_thigher_than_m0,
                                 m4_thigher_than_m0,m3_thigher_than_m0,m2_thigher_than_m0,
                                 m1_thigher_than_m0};

assign m0_thigher_than_m1 = m1_mtiming_mask & m0_mtiming;
assign m2_thigher_than_m1 = m1_mtiming_mask & m2_mtiming;
assign m3_thigher_than_m1 = m1_mtiming_mask & m3_mtiming;
assign m4_thigher_than_m1 = m1_mtiming_mask & m4_mtiming;
assign m5_thigher_than_m1 = m1_mtiming_mask & m5_mtiming;
assign m6_thigher_than_m1 = m1_mtiming_mask & m6_mtiming;
assign m7_thigher_than_m1 = m1_mtiming_mask & m7_mtiming;
assign x_thigher_than_m1[6:0] = {m7_thigher_than_m1,m6_thigher_than_m1,m5_thigher_than_m1,
                                 m4_thigher_than_m1,m3_thigher_than_m1,m2_thigher_than_m1,
                                 m0_thigher_than_m1};

assign m0_thigher_than_m2 = m2_mtiming_mask & m0_mtiming;
assign m1_thigher_than_m2 = m2_mtiming_mask & m1_mtiming;
assign m3_thigher_than_m2 = m2_mtiming_mask & m3_mtiming;
assign m4_thigher_than_m2 = m2_mtiming_mask & m4_mtiming;
assign m5_thigher_than_m2 = m2_mtiming_mask & m5_mtiming;
assign m6_thigher_than_m2 = m2_mtiming_mask & m6_mtiming;
assign m7_thigher_than_m2 = m2_mtiming_mask & m7_mtiming;
assign x_thigher_than_m2[6:0] = {m7_thigher_than_m2,m6_thigher_than_m2,m5_thigher_than_m2,
                                 m4_thigher_than_m2,m3_thigher_than_m2,m1_thigher_than_m2,
                                 m0_thigher_than_m2};

assign m0_thigher_than_m3 = m3_mtiming_mask & m0_mtiming;
assign m1_thigher_than_m3 = m3_mtiming_mask & m1_mtiming;
assign m2_thigher_than_m3 = m3_mtiming_mask & m2_mtiming;
assign m4_thigher_than_m3 = m3_mtiming_mask & m4_mtiming;
assign m5_thigher_than_m3 = m3_mtiming_mask & m5_mtiming;
assign m6_thigher_than_m3 = m3_mtiming_mask & m6_mtiming;
assign m7_thigher_than_m3 = m3_mtiming_mask & m7_mtiming;
assign x_thigher_than_m3[6:0] = {m7_thigher_than_m3,m6_thigher_than_m3,m5_thigher_than_m3,
                                 m4_thigher_than_m3,m2_thigher_than_m3,m1_thigher_than_m3,
                                 m0_thigher_than_m3};

assign m0_thigher_than_m4 = m4_mtiming_mask & m0_mtiming;
assign m1_thigher_than_m4 = m4_mtiming_mask & m1_mtiming;
assign m2_thigher_than_m4 = m4_mtiming_mask & m2_mtiming;
assign m3_thigher_than_m4 = m4_mtiming_mask & m3_mtiming;
assign m5_thigher_than_m4 = m4_mtiming_mask & m5_mtiming;
assign m6_thigher_than_m4 = m4_mtiming_mask & m6_mtiming;
assign m7_thigher_than_m4 = m4_mtiming_mask & m7_mtiming;
assign x_thigher_than_m4[6:0] = {m7_thigher_than_m4,m6_thigher_than_m4,m5_thigher_than_m4,
                                 m3_thigher_than_m4,m2_thigher_than_m4,m1_thigher_than_m4,
                                 m0_thigher_than_m4};

assign m0_thigher_than_m5 = m5_mtiming_mask & m0_mtiming;
assign m1_thigher_than_m5 = m5_mtiming_mask & m1_mtiming;
assign m2_thigher_than_m5 = m5_mtiming_mask & m2_mtiming;
assign m3_thigher_than_m5 = m5_mtiming_mask & m3_mtiming;
assign m4_thigher_than_m5 = m5_mtiming_mask & m4_mtiming;
assign m6_thigher_than_m5 = m5_mtiming_mask & m6_mtiming;
assign m7_thigher_than_m5 = m5_mtiming_mask & m7_mtiming;
assign x_thigher_than_m5[6:0] = {m7_thigher_than_m5,m6_thigher_than_m5,m4_thigher_than_m5,
                                 m3_thigher_than_m5,m2_thigher_than_m5,m1_thigher_than_m5,
                                 m0_thigher_than_m5};

assign m0_thigher_than_m6 = m6_mtiming_mask & m0_mtiming;
assign m1_thigher_than_m6 = m6_mtiming_mask & m1_mtiming;
assign m2_thigher_than_m6 = m6_mtiming_mask & m2_mtiming;
assign m3_thigher_than_m6 = m6_mtiming_mask & m3_mtiming;
assign m4_thigher_than_m6 = m6_mtiming_mask & m4_mtiming;
assign m5_thigher_than_m6 = m6_mtiming_mask & m5_mtiming;
assign m7_thigher_than_m6 = m6_mtiming_mask & m7_mtiming;
assign x_thigher_than_m6[6:0] = {m7_thigher_than_m6,m5_thigher_than_m6,m4_thigher_than_m6,
                                 m3_thigher_than_m6,m2_thigher_than_m6,m1_thigher_than_m6,
                                 m0_thigher_than_m6};

assign m0_thigher_than_m7 = m7_mtiming_mask & m0_mtiming;
assign m1_thigher_than_m7 = m7_mtiming_mask & m1_mtiming;
assign m2_thigher_than_m7 = m7_mtiming_mask & m2_mtiming;
assign m3_thigher_than_m7 = m7_mtiming_mask & m3_mtiming;
assign m4_thigher_than_m7 = m7_mtiming_mask & m4_mtiming;
assign m5_thigher_than_m7 = m7_mtiming_mask & m5_mtiming;
assign m6_thigher_than_m7 = m7_mtiming_mask & m6_mtiming;
assign x_thigher_than_m7[6:0] = {m6_thigher_than_m7,m5_thigher_than_m7,m4_thigher_than_m7,
                                 m3_thigher_than_m7,m2_thigher_than_m7,m1_thigher_than_m7,
                                 m0_thigher_than_m7};
//record phigher and thigher info in register
// &Force("nonport","x_phigher_than_m0");&Force("nonport","x_thigher_than_m0"); @2567
// &Force("nonport","x_phigher_than_m1");&Force("nonport","x_thigher_than_m1"); @2568
// &Force("nonport","x_phigher_than_m2");&Force("nonport","x_thigher_than_m2"); @2569
// &Force("nonport","x_phigher_than_m3");&Force("nonport","x_thigher_than_m3"); @2570
// &Force("nonport","x_phigher_than_m4");&Force("nonport","x_thigher_than_m4"); @2571
// &Force("nonport","x_phigher_than_m5");&Force("nonport","x_thigher_than_m5"); @2572
// &Force("nonport","x_phigher_than_m6");&Force("nonport","x_thigher_than_m6"); @2573
// &Force("nonport","x_phigher_than_m7");&Force("nonport","x_thigher_than_m7"); @2574
// &Force("nonport","x_phigher_than_m2");&Force("nonport","x_thigher_than_m2"); @2593
// &Force("nonport","x_phigher_than_m3");&Force("nonport","x_thigher_than_m3"); @2594
// &Force("nonport","x_phigher_than_m4");&Force("nonport","x_thigher_than_m4"); @2595
// &Force("nonport","x_phigher_than_m5");&Force("nonport","x_thigher_than_m5"); @2596
// &Force("nonport","x_phigher_than_m6");&Force("nonport","x_thigher_than_m6"); @2597
// &Force("nonport","x_phigher_than_m7");&Force("nonport","x_thigher_than_m7"); @2598
// &Force("nonport","x_phigher_than_m3");&Force("nonport","x_thigher_than_m3"); @2636
// &Force("nonport","x_phigher_than_m4");&Force("nonport","x_thigher_than_m4"); @2637
// &Force("nonport","x_phigher_than_m5");&Force("nonport","x_thigher_than_m5"); @2638
// &Force("nonport","x_phigher_than_m6");&Force("nonport","x_thigher_than_m6"); @2639
// &Force("nonport","x_phigher_than_m7");&Force("nonport","x_thigher_than_m7"); @2640
always @(posedge mcontrol_output_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      x_phigher_than_m0_reg_lowbits[1:0] <= 2'b0;
      x_phigher_than_m1_reg_lowbits[1:0] <= 2'b0;
      x_phigher_than_m2_reg_lowbits[1:0] <= 2'b0;

      x_thigher_than_m0_reg_lowbits[1:0] <= 2'b0;
      x_thigher_than_m1_reg_lowbits[1:0] <= 2'b0;
      x_thigher_than_m2_reg_lowbits[1:0] <= 2'b0;
    end
  else if(cp0_write_tdata1_f)
    begin
      x_phigher_than_m0_reg_lowbits[1:0] <= x_phigher_than_m0[1:0];
      x_phigher_than_m1_reg_lowbits[1:0] <= x_phigher_than_m1[1:0];
      x_phigher_than_m2_reg_lowbits[1:0] <= x_phigher_than_m2[1:0];

      x_thigher_than_m0_reg_lowbits[1:0] <= x_thigher_than_m0[1:0];
      x_thigher_than_m1_reg_lowbits[1:0] <= x_thigher_than_m1[1:0];
      x_thigher_than_m2_reg_lowbits[1:0] <= x_thigher_than_m2[1:0];
    end
end
assign x_phigher_than_m0_reg[6:0] = {5'b0,x_phigher_than_m0_reg_lowbits[1:0]};
assign x_thigher_than_m0_reg[6:0] = {5'b0,x_thigher_than_m0_reg_lowbits[1:0]};
assign x_phigher_than_m1_reg[6:0] = {5'b0,x_phigher_than_m1_reg_lowbits[1:0]};
assign x_thigher_than_m1_reg[6:0] = {5'b0,x_thigher_than_m1_reg_lowbits[1:0]};
assign x_phigher_than_m2_reg[6:0] = {5'b0,x_phigher_than_m2_reg_lowbits[1:0]};
assign x_thigher_than_m2_reg[6:0] = {5'b0,x_thigher_than_m2_reg_lowbits[1:0]};
assign x_phigher_than_m3_reg[6:0] = 7'b0;
assign x_thigher_than_m3_reg[6:0] = 7'b0;
assign x_phigher_than_m4_reg[6:0] = 7'b0;
assign x_thigher_than_m4_reg[6:0] = 7'b0;
assign x_phigher_than_m5_reg[6:0] = 7'b0;
assign x_thigher_than_m5_reg[6:0] = 7'b0;
assign x_phigher_than_m6_reg[6:0] = 7'b0;
assign x_thigher_than_m6_reg[6:0] = 7'b0;
assign x_phigher_than_m7_reg[6:0] = 7'b0;
assign x_thigher_than_m7_reg[6:0] = 7'b0;
// &Force("nonport","x_phigher_than_m4");&Force("nonport","x_thigher_than_m4"); @2682
// &Force("nonport","x_phigher_than_m5");&Force("nonport","x_thigher_than_m5"); @2683
// &Force("nonport","x_phigher_than_m6");&Force("nonport","x_thigher_than_m6"); @2684
// &Force("nonport","x_phigher_than_m7");&Force("nonport","x_thigher_than_m7"); @2685
// &Force("nonport","x_phigher_than_m5");&Force("nonport","x_thigher_than_m5"); @2731
// &Force("nonport","x_phigher_than_m6");&Force("nonport","x_thigher_than_m6"); @2732
// &Force("nonport","x_phigher_than_m7");&Force("nonport","x_thigher_than_m7"); @2733
// &Force("nonport","x_phigher_than_m6");&Force("nonport","x_thigher_than_m6"); @2783
// &Force("nonport","x_phigher_than_m7");&Force("nonport","x_thigher_than_m7"); @2784
// &Force("nonport","x_phigher_than_m7");&Force("nonport","x_thigher_than_m7"); @2838

//=========================================================
//
//                   output select     
//
//=========================================================
  assign mcontrol3_exe0_match = 1'b0;   
  assign mcontrol3_exe1_match = 1'b0;
  assign mcontrol3_ldst_match = 1'b0;
  assign mcontrol3_action0 = 1'b0;
  assign mcontrol3_action1 = 1'b0; 
  assign mcontrol3_timing = 1'b0;   
  assign mcontrol3_is_ldst_data =1'b0;
  assign mcontrol4_exe0_match = 1'b0;  
  assign mcontrol4_exe1_match = 1'b0;
  assign mcontrol4_ldst_match = 1'b0;
  assign mcontrol4_action0 = 1'b0;
  assign mcontrol4_action1 = 1'b0;  
  assign mcontrol4_timing = 1'b0;   
  assign mcontrol4_is_ldst_data =1'b0;
  assign mcontrol5_exe0_match = 1'b0;  
  assign mcontrol5_exe1_match = 1'b0;
  assign mcontrol5_ldst_match = 1'b0;
  assign mcontrol5_action0 = 1'b0;
  assign mcontrol5_action1 = 1'b0;  
  assign mcontrol5_timing = 1'b0;   
  assign mcontrol5_is_ldst_data =1'b0;
  assign mcontrol6_exe0_match = 1'b0;   
  assign mcontrol6_exe1_match = 1'b0;
  assign mcontrol6_ldst_match = 1'b0;
  assign mcontrol6_action0 = 1'b0;
  assign mcontrol6_action1 = 1'b0; 
  assign mcontrol6_timing = 1'b0;  
  assign mcontrol6_is_ldst_data =1'b0;
  assign mcontrol7_exe0_match = 1'b0;  
  assign mcontrol7_exe1_match = 1'b0;
  assign mcontrol7_ldst_match = 1'b0;
  assign mcontrol7_action0 = 1'b0;
  assign mcontrol7_action1 = 1'b0; 
  assign mcontrol7_timing = 1'b0;  
  assign mcontrol7_is_ldst_data =1'b0;

//---------------------------------------------------------
//                    exe0 output select logic
//---------------------------------------------------------
//chain match logic
assign exe0_single_mcontrol_cancel = mcontrol0_exe0_match || mcontrol1_exe0_match || mcontrol2_exe0_match || mcontrol3_exe0_match ||
                                     mcontrol4_exe0_match || mcontrol5_exe0_match || mcontrol6_exe0_match || mcontrol7_exe0_match;
assign exe0_chain_cancel           = 1'b0;

assign exe0_after_chain_match0 = mcontrol0_exe0_match;
assign exe0_after_chain_match1 = mcontrol1_exe0_match;
assign exe0_after_chain_match2 = mcontrol2_exe0_match;
assign exe0_after_chain_match3 = mcontrol3_exe0_match;
assign exe0_after_chain_match4 = mcontrol4_exe0_match;
assign exe0_after_chain_match5 = mcontrol5_exe0_match;
assign exe0_after_chain_match6 = mcontrol6_exe0_match;
assign exe0_after_chain_match7 = mcontrol7_exe0_match;
assign exe0_after_chain_match[7:0] ={exe0_after_chain_match7,exe0_after_chain_match6,
                                     exe0_after_chain_match5,exe0_after_chain_match4,
                                     exe0_after_chain_match3,exe0_after_chain_match2,
                                     exe0_after_chain_match1,exe0_after_chain_match0};
//priority select logic
assign m0_exe0_can_match = !(|(x_phigher_than_m0_reg[6:0] & exe0_after_chain_match[7:1]));
assign m1_exe0_can_match = !(|(x_phigher_than_m1_reg[6:0] & {exe0_after_chain_match[7:2],exe0_after_chain_match[0]}));
assign m2_exe0_can_match = !(|(x_phigher_than_m2_reg[6:0] & {exe0_after_chain_match[7:3],exe0_after_chain_match[1:0]}));
assign m3_exe0_can_match = !(|(x_phigher_than_m3_reg[6:0] & {exe0_after_chain_match[7:4],exe0_after_chain_match[2:0]}));
assign m4_exe0_can_match = !(|(x_phigher_than_m4_reg[6:0] & {exe0_after_chain_match[7:5],exe0_after_chain_match[3:0]}));
assign m5_exe0_can_match = !(|(x_phigher_than_m5_reg[6:0] & {exe0_after_chain_match[7:6],exe0_after_chain_match[4:0]}));
assign m6_exe0_can_match = !(|(x_phigher_than_m6_reg[6:0] & {exe0_after_chain_match[7],exe0_after_chain_match[5:0]}));
assign m7_exe0_can_match = !(|(x_phigher_than_m7_reg[6:0] & exe0_after_chain_match[6:0]));

assign m0_exe0_match     = m0_exe0_can_match && exe0_after_chain_match0;
assign m1_exe0_match     = m1_exe0_can_match && exe0_after_chain_match1;
assign m2_exe0_match     = m2_exe0_can_match && exe0_after_chain_match2;
assign m3_exe0_match     = m3_exe0_can_match && exe0_after_chain_match3;
assign m4_exe0_match     = m4_exe0_can_match && exe0_after_chain_match4;
assign m5_exe0_match     = m5_exe0_can_match && exe0_after_chain_match5;
assign m6_exe0_match     = m6_exe0_can_match && exe0_after_chain_match6;
assign m7_exe0_match     = m7_exe0_can_match && exe0_after_chain_match7;

//output select
//match
assign exe0_match[7:0]    = {m7_exe0_match,m6_exe0_match,m5_exe0_match,m4_exe0_match,
                             m3_exe0_match,m2_exe0_match,m1_exe0_match,m0_exe0_match};
assign exe0_have_match    = exe0_cancel;
//chain
assign exe0_chain         = 1'b0;
//action0
assign m0_exe0_action0      = m0_exe0_match && mcontrol0_action0;
assign m1_exe0_action0      = m1_exe0_match && mcontrol1_action0;
assign m2_exe0_action0      = m2_exe0_match && mcontrol2_action0;
assign m3_exe0_action0      = m3_exe0_match && mcontrol3_action0;
assign m4_exe0_action0      = m4_exe0_match && mcontrol4_action0;
assign m5_exe0_action0      = m5_exe0_match && mcontrol5_action0;
assign m6_exe0_action0      = m6_exe0_match && mcontrol6_action0;
assign m7_exe0_action0      = m7_exe0_match && mcontrol7_action0;
assign exe0_action0         = m7_exe0_action0 || m6_exe0_action0 || m5_exe0_action0 || m4_exe0_action0 ||
                            m3_exe0_action0 || m2_exe0_action0 || m1_exe0_action0 || m0_exe0_action0;

//action1
assign m0_exe0_action1      = m0_exe0_match && mcontrol0_action1;
assign m1_exe0_action1      = m1_exe0_match && mcontrol1_action1;
assign m2_exe0_action1      = m2_exe0_match && mcontrol2_action1;
assign m3_exe0_action1      = m3_exe0_match && mcontrol3_action1;
assign m4_exe0_action1      = m4_exe0_match && mcontrol4_action1;
assign m5_exe0_action1      = m5_exe0_match && mcontrol5_action1;
assign m6_exe0_action1      = m6_exe0_match && mcontrol6_action1;
assign m7_exe0_action1      = m7_exe0_match && mcontrol7_action1;
assign exe0_action1         = m7_exe0_action1 || m6_exe0_action1 || m5_exe0_action1 || m4_exe0_action1 ||
                            m3_exe0_action1 || m2_exe0_action1 || m1_exe0_action1 || m0_exe0_action1;

assign exe0_action        = !exe0_action0 && exe0_action1;
assign exe0_action01      = exe0_action0 && exe0_action1;

//timing
assign exe0_timing         = 1'b0;

//cancel
assign exe0_cancel        = exe0_single_mcontrol_cancel || exe0_chain_cancel;

assign mcontrol_halt_info0[`TDT_HINFO_WIDTH-1:0] = {exe0_match[`TDT_TM_MCONTROL_TRI_NUM-1:0],4'd2,1'b0,
                                                   exe0_timing,exe0_action01,exe0_action,
                                                   exe0_chain,1'b0,exe0_have_match,exe0_cancel};

//---------------------------------------------------------
//                    exe1 output select logic
//---------------------------------------------------------
//chain match logic
assign exe1_single_mcontrol_cancel = mcontrol0_exe1_match || mcontrol1_exe1_match || mcontrol2_exe1_match || mcontrol3_exe1_match ||
                                     mcontrol4_exe1_match || mcontrol5_exe1_match || mcontrol6_exe1_match || mcontrol7_exe1_match;
assign exe1_chain_cancel           = 1'b0;

assign exe1_after_chain_match0 = mcontrol0_exe1_match;
assign exe1_after_chain_match1 = mcontrol1_exe1_match;
assign exe1_after_chain_match2 = mcontrol2_exe1_match;
assign exe1_after_chain_match3 = mcontrol3_exe1_match;
assign exe1_after_chain_match4 = mcontrol4_exe1_match;
assign exe1_after_chain_match5 = mcontrol5_exe1_match;
assign exe1_after_chain_match6 = mcontrol6_exe1_match;
assign exe1_after_chain_match7 = mcontrol7_exe1_match;
assign exe1_after_chain_match[7:0] ={exe1_after_chain_match7,exe1_after_chain_match6,
                                     exe1_after_chain_match5,exe1_after_chain_match4,
                                     exe1_after_chain_match3,exe1_after_chain_match2,
                                     exe1_after_chain_match1,exe1_after_chain_match0};
//priority select logic
assign m0_exe1_can_match = !(|(x_phigher_than_m0_reg[6:0] & exe1_after_chain_match[7:1]));
assign m1_exe1_can_match = !(|(x_phigher_than_m1_reg[6:0] & {exe1_after_chain_match[7:2],exe1_after_chain_match[0]}));
assign m2_exe1_can_match = !(|(x_phigher_than_m2_reg[6:0] & {exe1_after_chain_match[7:3],exe1_after_chain_match[1:0]}));
assign m3_exe1_can_match = !(|(x_phigher_than_m3_reg[6:0] & {exe1_after_chain_match[7:4],exe1_after_chain_match[2:0]}));
assign m4_exe1_can_match = !(|(x_phigher_than_m4_reg[6:0] & {exe1_after_chain_match[7:5],exe1_after_chain_match[3:0]}));
assign m5_exe1_can_match = !(|(x_phigher_than_m5_reg[6:0] & {exe1_after_chain_match[7:6],exe1_after_chain_match[4:0]}));
assign m6_exe1_can_match = !(|(x_phigher_than_m6_reg[6:0] & {exe1_after_chain_match[7],exe1_after_chain_match[5:0]}));
assign m7_exe1_can_match = !(|(x_phigher_than_m7_reg[6:0] & exe1_after_chain_match[6:0]));

assign m0_exe1_match     = m0_exe1_can_match && exe1_after_chain_match0;
assign m1_exe1_match     = m1_exe1_can_match && exe1_after_chain_match1;
assign m2_exe1_match     = m2_exe1_can_match && exe1_after_chain_match2;
assign m3_exe1_match     = m3_exe1_can_match && exe1_after_chain_match3;
assign m4_exe1_match     = m4_exe1_can_match && exe1_after_chain_match4;
assign m5_exe1_match     = m5_exe1_can_match && exe1_after_chain_match5;
assign m6_exe1_match     = m6_exe1_can_match && exe1_after_chain_match6;
assign m7_exe1_match     = m7_exe1_can_match && exe1_after_chain_match7;

//output select
//match
assign exe1_match[7:0]    = {m7_exe1_match,m6_exe1_match,m5_exe1_match,m4_exe1_match,
                             m3_exe1_match,m2_exe1_match,m1_exe1_match,m0_exe1_match};
assign exe1_have_match    = exe1_cancel;  
//chain
assign exe1_chain         = 1'b0;
//action0
assign m0_exe1_action0      = m0_exe1_match && mcontrol0_action0;
assign m1_exe1_action0      = m1_exe1_match && mcontrol1_action0;
assign m2_exe1_action0      = m2_exe1_match && mcontrol2_action0;
assign m3_exe1_action0      = m3_exe1_match && mcontrol3_action0;
assign m4_exe1_action0      = m4_exe1_match && mcontrol4_action0;
assign m5_exe1_action0      = m5_exe1_match && mcontrol5_action0;
assign m6_exe1_action0      = m6_exe1_match && mcontrol6_action0;
assign m7_exe1_action0      = m7_exe1_match && mcontrol7_action0;
assign exe1_action0         = m7_exe1_action0 || m6_exe1_action0 || m5_exe1_action0 || m4_exe1_action0 ||
                            m3_exe1_action0 || m2_exe1_action0 || m1_exe1_action0 || m0_exe1_action0;

//action1
assign m0_exe1_action1      = m0_exe1_match && mcontrol0_action1;
assign m1_exe1_action1      = m1_exe1_match && mcontrol1_action1;
assign m2_exe1_action1      = m2_exe1_match && mcontrol2_action1;
assign m3_exe1_action1      = m3_exe1_match && mcontrol3_action1;
assign m4_exe1_action1      = m4_exe1_match && mcontrol4_action1;
assign m5_exe1_action1      = m5_exe1_match && mcontrol5_action1;
assign m6_exe1_action1      = m6_exe1_match && mcontrol6_action1;
assign m7_exe1_action1      = m7_exe1_match && mcontrol7_action1;
assign exe1_action1         = m7_exe1_action1 || m6_exe1_action1 || m5_exe1_action1 || m4_exe1_action1 ||
                            m3_exe1_action1 || m2_exe1_action1 || m1_exe1_action1 || m0_exe1_action1;

assign exe1_action        = !exe1_action0 && exe1_action1;
assign exe1_action01      = exe1_action0 && exe1_action1;

//timing
assign exe1_timing         = 1'b0;

//cancel
assign exe1_cancel        = exe1_single_mcontrol_cancel || exe1_chain_cancel;

assign mcontrol_halt_info1[`TDT_HINFO_WIDTH-1:0] = {exe1_match[`TDT_TM_MCONTROL_TRI_NUM-1:0],4'd2,1'b0,
                                                   exe1_timing,exe1_action01,exe1_action,
                                                   exe1_chain,1'b0,exe1_have_match,exe1_cancel};

//---------------------------------------------------------
//                    ldst output select logic
//---------------------------------------------------------
assign mcontrol0_store_data_timing0 = mcontrol0_is_ldst_data && !mcontrol0_timing;
assign mcontrol1_store_data_timing0 = mcontrol1_is_ldst_data && !mcontrol1_timing;
assign mcontrol2_store_data_timing0 = mcontrol2_is_ldst_data && !mcontrol2_timing;
assign mcontrol3_store_data_timing0 = mcontrol3_is_ldst_data && !mcontrol3_timing;
assign mcontrol4_store_data_timing0 = mcontrol4_is_ldst_data && !mcontrol4_timing;
assign mcontrol5_store_data_timing0 = mcontrol5_is_ldst_data && !mcontrol5_timing;
assign mcontrol6_store_data_timing0 = mcontrol6_is_ldst_data && !mcontrol6_timing;
assign mcontrol7_store_data_timing0 = mcontrol7_is_ldst_data && !mcontrol7_timing;
assign have_store_data_timing0      = mcontrol0_store_data_timing0 || mcontrol1_store_data_timing0 ||
                                      mcontrol2_store_data_timing0 || mcontrol3_store_data_timing0 ||
                                      mcontrol4_store_data_timing0 || mcontrol5_store_data_timing0 ||
                                      mcontrol6_store_data_timing0 || mcontrol7_store_data_timing0;

//chain match logic
assign ldst_mcontrol0_single_match = mcontrol0_ldst_match;
assign ldst_mcontrol1_single_match = mcontrol1_ldst_match;
assign ldst_mcontrol2_single_match = mcontrol2_ldst_match;
assign ldst_mcontrol3_single_match = mcontrol3_ldst_match;
assign ldst_mcontrol4_single_match = mcontrol4_ldst_match;
assign ldst_mcontrol5_single_match = mcontrol5_ldst_match;
assign ldst_mcontrol6_single_match = mcontrol6_ldst_match;
assign ldst_mcontrol7_single_match = mcontrol7_ldst_match;

assign ldst_chain0_match = 1'b0;
assign ldst_chain1_match = 1'b0;
assign ldst_chain2_match = 1'b0;
assign ldst_chain3_match = 1'b0;
assign ldst_chain4_match = 1'b0;
assign ldst_chain5_match = 1'b0;
assign ldst_chain6_match = 1'b0;

assign ldst_after_chain_match0 = mcontrol0_ldst_match;
assign ldst_after_chain_match1 = mcontrol1_ldst_match;
assign ldst_after_chain_match2 = mcontrol2_ldst_match;
assign ldst_after_chain_match3 = mcontrol3_ldst_match;
assign ldst_after_chain_match4 = mcontrol4_ldst_match;
assign ldst_after_chain_match5 = mcontrol5_ldst_match;
assign ldst_after_chain_match6 = mcontrol6_ldst_match;
assign ldst_after_chain_match7 = mcontrol7_ldst_match;
assign ldst_after_chain_match[7:0] ={ldst_after_chain_match7,ldst_after_chain_match6,
                                     ldst_after_chain_match5,ldst_after_chain_match4,
                                     ldst_after_chain_match3,ldst_after_chain_match2,
                                     ldst_after_chain_match1,ldst_after_chain_match0};
//timing0 match
assign ldst_mcontrol0_timing0_match = !mcontrol0_timing && ldst_mcontrol0_single_match;
assign ldst_mcontrol1_timing0_match = !mcontrol1_timing && ldst_mcontrol1_single_match;
assign ldst_mcontrol2_timing0_match = !mcontrol2_timing && ldst_mcontrol2_single_match;
assign ldst_mcontrol3_timing0_match = !mcontrol3_timing && ldst_mcontrol3_single_match;
assign ldst_mcontrol4_timing0_match = !mcontrol4_timing && ldst_mcontrol4_single_match;
assign ldst_mcontrol5_timing0_match = !mcontrol5_timing && ldst_mcontrol5_single_match;
assign ldst_mcontrol6_timing0_match = !mcontrol6_timing && ldst_mcontrol6_single_match;
assign ldst_mcontrol7_timing0_match = !mcontrol7_timing && ldst_mcontrol7_single_match;

assign chain0_timing0_match = (mcontrol0_is_ldst ? !mcontrol0_timing : !mcontrol1_timing) && ldst_chain0_match;
assign chain1_timing0_match = (mcontrol1_is_ldst ? !mcontrol1_timing : !mcontrol2_timing) && ldst_chain1_match;
assign chain2_timing0_match = (mcontrol2_is_ldst ? !mcontrol2_timing : !mcontrol3_timing) && ldst_chain2_match;
assign chain3_timing0_match = (mcontrol3_is_ldst ? !mcontrol3_timing : !mcontrol4_timing) && ldst_chain3_match;
assign chain4_timing0_match = (mcontrol4_is_ldst ? !mcontrol4_timing : !mcontrol5_timing) && ldst_chain4_match;
assign chain5_timing0_match = (mcontrol5_is_ldst ? !mcontrol5_timing : !mcontrol6_timing) && ldst_chain5_match;
assign chain6_timing0_match = (mcontrol6_is_ldst ? !mcontrol6_timing : !mcontrol7_timing) && ldst_chain6_match;
// &Force("nonport","mcontrol7_is_ldst"); @3561

assign timing0_match[7:0] = {ldst_mcontrol7_timing0_match || chain6_timing0_match,
                             ldst_mcontrol6_timing0_match || chain6_timing0_match || chain5_timing0_match,
                             ldst_mcontrol5_timing0_match || chain5_timing0_match || chain4_timing0_match,
                             ldst_mcontrol4_timing0_match || chain4_timing0_match || chain3_timing0_match,
                             ldst_mcontrol3_timing0_match || chain3_timing0_match || chain2_timing0_match,
                             ldst_mcontrol2_timing0_match || chain2_timing0_match || chain1_timing0_match,
                             ldst_mcontrol1_timing0_match || chain1_timing0_match || chain0_timing0_match,
                             ldst_mcontrol0_timing0_match || chain0_timing0_match};

assign have_timing0_match = |timing0_match[7:0];

//priority select logic
assign m0_ldst_can_match = !(|(x_thigher_than_m0_reg[6:0] & ldst_after_chain_match[7:1]));
assign m1_ldst_can_match = !(|(x_thigher_than_m1_reg[6:0] & {ldst_after_chain_match[7:2],ldst_after_chain_match[0]}));
assign m2_ldst_can_match = !(|(x_thigher_than_m2_reg[6:0] & {ldst_after_chain_match[7:3],ldst_after_chain_match[1:0]}));
assign m3_ldst_can_match = !(|(x_thigher_than_m3_reg[6:0] & {ldst_after_chain_match[7:4],ldst_after_chain_match[2:0]}));
assign m4_ldst_can_match = !(|(x_thigher_than_m4_reg[6:0] & {ldst_after_chain_match[7:5],ldst_after_chain_match[3:0]}));
assign m5_ldst_can_match = !(|(x_thigher_than_m5_reg[6:0] & {ldst_after_chain_match[7:6],ldst_after_chain_match[4:0]}));
assign m6_ldst_can_match = !(|(x_thigher_than_m6_reg[6:0] & {ldst_after_chain_match[7],ldst_after_chain_match[5:0]}));
assign m7_ldst_can_match = !(|(x_thigher_than_m7_reg[6:0] & ldst_after_chain_match[6:0]));

assign m0_ldst_match     = m0_ldst_can_match && ldst_after_chain_match[0];
assign m1_ldst_match     = m1_ldst_can_match && ldst_after_chain_match[1];
assign m2_ldst_match     = m2_ldst_can_match && ldst_after_chain_match[2];
assign m3_ldst_match     = m3_ldst_can_match && ldst_after_chain_match[3];
assign m4_ldst_match     = m4_ldst_can_match && ldst_after_chain_match[4];
assign m5_ldst_match     = m5_ldst_can_match && ldst_after_chain_match[5];
assign m6_ldst_match     = m6_ldst_can_match && ldst_after_chain_match[6];
assign m7_ldst_match     = m7_ldst_can_match && ldst_after_chain_match[7];

//output select
always @(posedge mcontrol_output_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lsu_dtu_last_check_f <= 1'b0;
  else if(lsu_dtu_last_check)
    lsu_dtu_last_check_f <= 1'b1;
  else if(lsu_dtu_last_check_f)
    lsu_dtu_last_check_f <= 1'b0;
end

assign need_match_store_data_t0_trigger = have_store_data_timing0 && store_addr_vld; 
always @(posedge mcontrol_output_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    need_match_store_data_t0_trigger_f <= 1'b0;
  else if(need_match_store_data_t0_trigger)
    need_match_store_data_t0_trigger_f <= 1'b1;
  else if(need_match_store_data_t0_trigger_f)
    need_match_store_data_t0_trigger_f <= 1'b0;
end

//match
// &CombBeg; @3616
always @( mcontrol5_ldst_match
       or mcontrol4_ldst_match
       or m1_ldst_match
       or need_match_store_data_t0_trigger_f
       or m0_ldst_match
       or lsu_dtu_last_check_f
       or m6_ldst_match
       or mcontrol6_ldst_match
       or mcontrol1_ldst_match
       or mcontrol3_ldst_match
       or m5_ldst_match
       or m3_ldst_match
       or timing0_match[7:0]
       or m4_ldst_match
       or have_timing0_match
       or m7_ldst_match
       or mcontrol0_ldst_match
       or m2_ldst_match
       or mcontrol7_ldst_match
       or mcontrol2_ldst_match)
begin
if(lsu_dtu_last_check_f)
  ldst_match[7:0] = {m7_ldst_match,m6_ldst_match,m5_ldst_match,m4_ldst_match,
                     m3_ldst_match,m2_ldst_match,m1_ldst_match,m0_ldst_match};
else if(have_timing0_match && !need_match_store_data_t0_trigger_f)
  ldst_match[7:0] = timing0_match[7:0];
else
  ldst_match[7:0] = {mcontrol7_ldst_match,mcontrol6_ldst_match,mcontrol5_ldst_match,mcontrol4_ldst_match,
                     mcontrol3_ldst_match,mcontrol2_ldst_match,mcontrol1_ldst_match,mcontrol0_ldst_match};
// &CombEnd; @3625
end

assign ldst_have_match = |ldst_after_chain_match[7:0];

//action0
assign m0_ldst_action0      = m0_ldst_match && mcontrol0_action0;
assign m1_ldst_action0      = m1_ldst_match && mcontrol1_action0;
assign m2_ldst_action0      = m2_ldst_match && mcontrol2_action0;
assign m3_ldst_action0      = m3_ldst_match && mcontrol3_action0;
assign m4_ldst_action0      = m4_ldst_match && mcontrol4_action0;
assign m5_ldst_action0      = m5_ldst_match && mcontrol5_action0;
assign m6_ldst_action0      = m6_ldst_match && mcontrol6_action0;
assign m7_ldst_action0      = m7_ldst_match && mcontrol7_action0;
assign ldst_action0         = m7_ldst_action0 || m6_ldst_action0 || m5_ldst_action0 || m4_ldst_action0 ||
                              m3_ldst_action0 || m2_ldst_action0 || m1_ldst_action0 || m0_ldst_action0;

//action1
assign m0_ldst_action1      = m0_ldst_match && mcontrol0_action1;
assign m1_ldst_action1      = m1_ldst_match && mcontrol1_action1;
assign m2_ldst_action1      = m2_ldst_match && mcontrol2_action1;
assign m3_ldst_action1      = m3_ldst_match && mcontrol3_action1;
assign m4_ldst_action1      = m4_ldst_match && mcontrol4_action1;
assign m5_ldst_action1      = m5_ldst_match && mcontrol5_action1;
assign m6_ldst_action1      = m6_ldst_match && mcontrol6_action1;
assign m7_ldst_action1      = m7_ldst_match && mcontrol7_action1;
assign ldst_action1         = m7_ldst_action1 || m6_ldst_action1 || m5_ldst_action1 || m4_ldst_action1 ||
                              m3_ldst_action1 || m2_ldst_action1 || m1_ldst_action1 || m0_ldst_action1;

assign ldst_action        = !ldst_action0 && ldst_action1;
assign ldst_action01      = ldst_action0 && ldst_action1;

//timing
assign m0_ldst_timing      = m0_ldst_match && mcontrol0_timing;
assign m1_ldst_timing      = m1_ldst_match && mcontrol1_timing;
assign m2_ldst_timing      = m2_ldst_match && mcontrol2_timing;
assign m3_ldst_timing      = m3_ldst_match && mcontrol3_timing;
assign m4_ldst_timing      = m4_ldst_match && mcontrol4_timing;
assign m5_ldst_timing      = m5_ldst_match && mcontrol5_timing;
assign m6_ldst_timing      = m6_ldst_match && mcontrol6_timing;
assign m7_ldst_timing      = m7_ldst_match && mcontrol7_timing;
assign ldst_timing         = m7_ldst_timing || m6_ldst_timing || m5_ldst_timing || m4_ldst_timing ||
                             m3_ldst_timing || m2_ldst_timing || m1_ldst_timing || m0_ldst_timing;

//cancel
// &CombBeg; @3669
always @( lsu_dtu_last_check_f
       or need_match_store_data_t0_trigger_f
       or ldst_have_match
       or have_timing0_match
       or ldst_timing)
begin
//assign ldst_cancel        = !ldst_timing && ldst_have_match;
if(lsu_dtu_last_check_f)
  ldst_cancel =  !ldst_timing && ldst_have_match;
else if(have_timing0_match && !need_match_store_data_t0_trigger_f)
  ldst_cancel = 1'b1;   
else
  ldst_cancel = 1'b0;
// &CombEnd; @3677
end

assign dtu_lsu_halt_info[`TDT_HINFO_WIDTH-1:0] = {ldst_match[`TDT_TM_MCONTROL_TRI_NUM-1:0],4'd2,1'b0,
                                                   ldst_timing,ldst_action01,ldst_action,
                                                   1'b0,1'b1,ldst_have_match,ldst_cancel};



//==========================================================
//                     gate clk
//==========================================================
always @(posedge mcontrol_output_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cp0_write_tdata1_f <= 1'b0;
  else
    cp0_write_tdata1_f <= cp0_write_tdata1;
end
// &Force("nonport","cp0_write_tdata1_f"); @3704


assign mcontrol_output_clk_en = cp0_write_tdata1 || cp0_write_tdata1_f ||
                                exe_may_hit || ldst_may_hit || 
                                exe_cycle2_cannot_hit || ldst_cycle2_cannot_hit ||
                                lsu_dtu_last_check || lsu_dtu_last_check_f ||
                                need_match_store_data_t0_trigger || need_match_store_data_t0_trigger_f;
// &Force("nonport","mcontrol_output_clk_en"); @3712

// &Instance("gated_clk_cell", "x_reg_gated_clk"); @3714
gated_clk_cell  x_reg_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (mcontrol_output_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (mcontrol_output_clk_en),
  .module_en              (cp0_dtu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in      (forever_cpuclk), @3715
//          .external_en (1'b0), @3716
//          .global_en   (cp0_yy_clk_en), @3717
//          .module_en   (cp0_dtu_icg_en), @3718
//          .local_en    (mcontrol_output_clk_en), @3719
//          //.local_en    (1'b1), @3720
//          .clk_out     (mcontrol_output_clk)); @3721



// &ModuleEnd; @3740
endmodule


