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

// &Depend("pa_dtu_cfig.h"); @23
// &Depend("cpu_cfig.h"); @24

// &ModuleBeg; @26
module pa_rtu_cbus(
  cbus_int_ex1_split_inst,
  cbus_int_ipop_int_mask,
  cbus_int_ipush_mie_en,
  cbus_retire_ex2_chgflw_vld,
  cbus_retire_ex2_cur_pc,
  cbus_retire_ex2_expt_inst,
  cbus_retire_ex2_flush,
  cbus_retire_ex2_halt_info,
  cbus_retire_ex2_inst_branch,
  cbus_retire_ex2_inst_dret,
  cbus_retire_ex2_inst_ebreak,
  cbus_retire_ex2_inst_int,
  cbus_retire_ex2_inst_mret,
  cbus_retire_ex2_inst_nmi,
  cbus_retire_ex2_inst_tail_int,
  cbus_retire_ex2_inst_vld,
  cbus_retire_ex2_int_hv,
  cbus_retire_ex2_int_lv,
  cbus_retire_ex2_ipop_int_mask,
  cbus_retire_ex2_may_debug,
  cbus_retire_ex2_next_pc,
  cbus_retire_ex2_split_inst,
  cbus_retire_ex2_tail_spec_inst,
  cbus_retire_ex2_trap_vec,
  cbus_retire_ex2_tval,
  cbus_top_ex2_inst_vld,
  cbus_top_ex2_uncommit_stall,
  cp0_rtu_ex1_chgflw_pc,
  cp0_rtu_ex1_chgflw_vld,
  cp0_rtu_ex1_cmplt,
  cp0_rtu_ex1_cmplt_dp,
  cp0_rtu_ex1_dret,
  cp0_rtu_ex1_ebreak,
  cp0_rtu_ex1_expt_inst,
  cp0_rtu_ex1_expt_tval,
  cp0_rtu_ex1_expt_vec,
  cp0_rtu_ex1_flush,
  cp0_rtu_ex1_halt_info,
  cp0_rtu_ex1_inst_len,
  cp0_rtu_ex1_inst_vld,
  cp0_rtu_ex1_ipush_spec_fail,
  cp0_rtu_ex1_mret,
  cp0_rtu_ex1_split_inst,
  cp0_rtu_ex1_tail_fail,
  cp0_rtu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ifu_rtu_warm_up,
  int_cbus_ex1_int_vld,
  int_cbus_ex1_nmi_req,
  int_cbus_int_hv,
  int_xx_int_id,
  int_xx_int_lv,
  iu_rtu_ex1_bju_branch_inst,
  iu_rtu_ex1_bju_cmplt,
  iu_rtu_ex1_bju_cmplt_dp,
  iu_rtu_ex1_bju_cur_pc,
  iu_rtu_ex1_bju_inst_len,
  iu_rtu_ex1_bju_inst_vld,
  iu_rtu_ex1_bju_split_inst,
  iu_rtu_ex1_cmplt,
  iu_rtu_ex1_cmplt_dp,
  iu_rtu_ex1_inst_len,
  iu_rtu_ex1_inst_vld,
  iu_rtu_ex1_ipop_int_mask,
  iu_rtu_ex1_ipush_mie_en,
  iu_rtu_ex1_ipush_spec_fail,
  iu_rtu_ex1_next_pc,
  iu_rtu_ex1_split_inst,
  iu_rtu_ex1_tail_int_vld,
  iu_rtu_ex2_bju_flush,
  iu_rtu_ex2_bju_next_pc,
  iu_rtu_ex2_bju_next_pc_vld,
  lsu_rtu_async_expt_vld,
  lsu_rtu_ex1_cmplt,
  lsu_rtu_ex1_cmplt_dp,
  lsu_rtu_ex1_halt_info,
  lsu_rtu_ex1_inst_len,
  lsu_rtu_ex1_inst_vld,
  lsu_rtu_ex1_ipop_int_mask,
  lsu_rtu_ex1_ipush_spec_inst,
  lsu_rtu_ex1_split_inst,
  lsu_rtu_ex2_expt_inst,
  lsu_rtu_ex2_expt_vec,
  lsu_rtu_ex2_tval,
  pad_yy_icg_scan_en,
  retire_cbus_debug_may_spec_fail,
  retire_cbus_ex2_stall,
  retire_cbus_flush_stall,
  rtu_cp0_mie_en,
  rtu_cp0_mie_gateclk_en,
  rtu_idu_ex1_int_dis_stall_gateclk_req,
  rtu_idu_ex1_int_dis_stall_req,
  rtu_idu_ex2_ipush_spec_inst_expt_vld,
  rtu_idu_ex2_ipush_spec_inst_halt_info_vld,
  rtu_iu_bju_ex2_cur_pc,
  rtu_iu_ex1_cmplt_dp_vld,
  rtu_iu_ex1_cmplt_inst_len,
  rtu_iu_ex1_cmplt_split_inst,
  rtu_iu_ex1_cmplt_vld,
  rtu_iu_pending_spec_expt_vld,
  rtu_iu_pending_spec_halt_info_vld,
  rtu_xx_ex1_stall,
  rtu_yy_xx_flush
);

// &Ports; @27
input   [30:0]  cp0_rtu_ex1_chgflw_pc;                    
input           cp0_rtu_ex1_chgflw_vld;                   
input           cp0_rtu_ex1_cmplt;                        
input           cp0_rtu_ex1_cmplt_dp;                     
input           cp0_rtu_ex1_dret;                         
input           cp0_rtu_ex1_ebreak;                       
input           cp0_rtu_ex1_expt_inst;                    
input   [31:0]  cp0_rtu_ex1_expt_tval;                    
input   [3 :0]  cp0_rtu_ex1_expt_vec;                     
input           cp0_rtu_ex1_flush;                        
input   [14:0]  cp0_rtu_ex1_halt_info;                    
input           cp0_rtu_ex1_inst_len;                     
input           cp0_rtu_ex1_inst_vld;                     
input           cp0_rtu_ex1_ipush_spec_fail;              
input           cp0_rtu_ex1_mret;                         
input           cp0_rtu_ex1_split_inst;                   
input           cp0_rtu_ex1_tail_fail;                    
input           cp0_rtu_icg_en;                           
input           cp0_yy_clk_en;                            
input           cpurst_b;                                 
input           forever_cpuclk;                           
input           ifu_rtu_warm_up;                          
input           int_cbus_ex1_int_vld;                     
input           int_cbus_ex1_nmi_req;                     
input           int_cbus_int_hv;                          
input   [11:0]  int_xx_int_id;                            
input   [7 :0]  int_xx_int_lv;                            
input           iu_rtu_ex1_bju_branch_inst;               
input           iu_rtu_ex1_bju_cmplt;                     
input           iu_rtu_ex1_bju_cmplt_dp;                  
input   [30:0]  iu_rtu_ex1_bju_cur_pc;                    
input           iu_rtu_ex1_bju_inst_len;                  
input           iu_rtu_ex1_bju_inst_vld;                  
input           iu_rtu_ex1_bju_split_inst;                
input           iu_rtu_ex1_cmplt;                         
input           iu_rtu_ex1_cmplt_dp;                      
input           iu_rtu_ex1_inst_len;                      
input           iu_rtu_ex1_inst_vld;                      
input           iu_rtu_ex1_ipop_int_mask;                 
input           iu_rtu_ex1_ipush_mie_en;                  
input           iu_rtu_ex1_ipush_spec_fail;               
input   [30:0]  iu_rtu_ex1_next_pc;                       
input           iu_rtu_ex1_split_inst;                    
input           iu_rtu_ex1_tail_int_vld;                  
input           iu_rtu_ex2_bju_flush;                     
input   [30:0]  iu_rtu_ex2_bju_next_pc;                   
input           iu_rtu_ex2_bju_next_pc_vld;               
input           lsu_rtu_async_expt_vld;                   
input           lsu_rtu_ex1_cmplt;                        
input           lsu_rtu_ex1_cmplt_dp;                     
input   [14:0]  lsu_rtu_ex1_halt_info;                    
input           lsu_rtu_ex1_inst_len;                     
input           lsu_rtu_ex1_inst_vld;                     
input           lsu_rtu_ex1_ipop_int_mask;                
input           lsu_rtu_ex1_ipush_spec_inst;              
input           lsu_rtu_ex1_split_inst;                   
input           lsu_rtu_ex2_expt_inst;                    
input   [3 :0]  lsu_rtu_ex2_expt_vec;                     
input   [31:0]  lsu_rtu_ex2_tval;                         
input           pad_yy_icg_scan_en;                       
input           retire_cbus_debug_may_spec_fail;          
input           retire_cbus_ex2_stall;                    
input           retire_cbus_flush_stall;                  
input           rtu_yy_xx_flush;                          
output          cbus_int_ex1_split_inst;                  
output          cbus_int_ipop_int_mask;                   
output          cbus_int_ipush_mie_en;                    
output          cbus_retire_ex2_chgflw_vld;               
output  [31:0]  cbus_retire_ex2_cur_pc;                   
output          cbus_retire_ex2_expt_inst;                
output          cbus_retire_ex2_flush;                    
output  [14:0]  cbus_retire_ex2_halt_info;                
output          cbus_retire_ex2_inst_branch;              
output          cbus_retire_ex2_inst_dret;                
output          cbus_retire_ex2_inst_ebreak;              
output          cbus_retire_ex2_inst_int;                 
output          cbus_retire_ex2_inst_mret;                
output          cbus_retire_ex2_inst_nmi;                 
output          cbus_retire_ex2_inst_tail_int;            
output          cbus_retire_ex2_inst_vld;                 
output          cbus_retire_ex2_int_hv;                   
output  [7 :0]  cbus_retire_ex2_int_lv;                   
output          cbus_retire_ex2_ipop_int_mask;            
output          cbus_retire_ex2_may_debug;                
output  [31:0]  cbus_retire_ex2_next_pc;                  
output          cbus_retire_ex2_split_inst;               
output          cbus_retire_ex2_tail_spec_inst;           
output  [11:0]  cbus_retire_ex2_trap_vec;                 
output  [31:0]  cbus_retire_ex2_tval;                     
output          cbus_top_ex2_inst_vld;                    
output          cbus_top_ex2_uncommit_stall;              
output          rtu_cp0_mie_en;                           
output          rtu_cp0_mie_gateclk_en;                   
output          rtu_idu_ex1_int_dis_stall_gateclk_req;    
output          rtu_idu_ex1_int_dis_stall_req;            
output          rtu_idu_ex2_ipush_spec_inst_expt_vld;     
output          rtu_idu_ex2_ipush_spec_inst_halt_info_vld; 
output  [31:0]  rtu_iu_bju_ex2_cur_pc;                    
output          rtu_iu_ex1_cmplt_dp_vld;                  
output          rtu_iu_ex1_cmplt_inst_len;                
output          rtu_iu_ex1_cmplt_split_inst;              
output          rtu_iu_ex1_cmplt_vld;                     
output          rtu_iu_pending_spec_expt_vld;             
output          rtu_iu_pending_spec_halt_info_vld;        
output          rtu_xx_ex1_stall;                         

// &Regs; @28
reg     [11:0]  cbus_ex1_trap_vec;                        
reg     [31:0]  cbus_ex1_tval;                            
reg             cbus_ex2_chgflw_vld;                      
reg     [30:0]  cbus_ex2_cur_pc;                          
reg             cbus_ex2_dret;                            
reg             cbus_ex2_ebreak;                          
reg             cbus_ex2_expt_inst;                       
reg             cbus_ex2_flush;                           
reg     [14:0]  cbus_ex2_halt_info;                       
reg             cbus_ex2_inst_branch;                     
reg             cbus_ex2_inst_int;                        
reg             cbus_ex2_inst_tail_int;                   
reg     [3 :0]  cbus_ex2_inst_type;                       
reg             cbus_ex2_inst_vld;                        
reg             cbus_ex2_int_hv;                          
reg     [7 :0]  cbus_ex2_int_lv;                          
reg             cbus_ex2_ipop_int_mask;                   
reg             cbus_ex2_ipush_spec_inst;                 
reg             cbus_ex2_may_debug;                       
reg             cbus_ex2_may_spec_fail;                   
reg             cbus_ex2_mret;                            
reg     [30:0]  cbus_ex2_next_pc;                         
reg             cbus_ex2_nmi;                             
reg             cbus_ex2_pending_spec_expt;               
reg             cbus_ex2_pending_spec_halt_info;          
reg     [14:0]  cbus_ex2_pending_spec_halt_info_data;     
reg             cbus_ex2_split_inst;                      
reg             cbus_ex2_tail_spec_inst;                  
reg     [11:0]  cbus_ex2_trap_vec;                        
reg     [31:0]  cbus_ex2_tval;                            

// &Wires; @29
wire    [3 :0]  cbus_cmplt;                               
wire    [3 :0]  cbus_cmplt_dp;                            
wire            cbus_cmplt_dp_vld;                        
wire            cbus_cmplt_vld;                           
wire            cbus_ex1_chgflw_vld;                      
wire    [30:0]  cbus_ex1_cur_pc;                          
wire            cbus_ex1_dret;                            
wire            cbus_ex1_ebreak;                          
wire            cbus_ex1_expt_inst;                       
wire    [3 :0]  cbus_ex1_expt_vec;                        
wire            cbus_ex1_flush;                           
wire    [14:0]  cbus_ex1_halt_info;                       
wire    [3 :0]  cbus_ex1_inst;                            
wire            cbus_ex1_inst_branch;                     
wire            cbus_ex1_inst_int;                        
wire            cbus_ex1_inst_len;                        
wire            cbus_ex1_inst_tail_int;                   
wire            cbus_ex1_inst_vld;                        
wire            cbus_ex1_int_hv;                          
wire    [7 :0]  cbus_ex1_int_lv;                          
wire    [11:0]  cbus_ex1_int_vec;                         
wire            cbus_ex1_ipop_int_mask;                   
wire            cbus_ex1_ipush_mie_en;                    
wire            cbus_ex1_ipush_mie_gateclk_en;            
wire            cbus_ex1_ipush_spec_fail;                 
wire            cbus_ex1_ipush_spec_inst;                 
wire            cbus_ex1_may_spec_fail;                   
wire            cbus_ex1_may_spec_fail_debug;             
wire            cbus_ex1_mret;                            
wire    [30:0]  cbus_ex1_next_pc;                         
wire            cbus_ex1_nmi;                             
wire            cbus_ex1_pending_spec_expt_clr;           
wire            cbus_ex1_pending_spec_halt_info_clr;      
wire            cbus_ex1_split_inst;                      
wire            cbus_ex1_tail_fail;                       
wire            cbus_ex1_tail_int_vld;                    
wire            cbus_ex1_tail_spec_inst;                  
wire            cbus_ex2_pending_spec_expt_set;           
wire            cbus_ex2_pending_spec_halt_info_set;      
wire            cbus_ex2_uncommit_stall;                  
wire            cbus_int_ex1_split_inst;                  
wire            cbus_int_ipop_int_mask;                   
wire            cbus_int_ipush_mie_en;                    
wire            cbus_retire_ex2_chgflw_vld;               
wire    [31:0]  cbus_retire_ex2_cur_pc;                   
wire            cbus_retire_ex2_expt_inst;                
wire            cbus_retire_ex2_flush;                    
wire    [14:0]  cbus_retire_ex2_halt_info;                
wire            cbus_retire_ex2_inst_branch;              
wire            cbus_retire_ex2_inst_dret;                
wire            cbus_retire_ex2_inst_ebreak;              
wire            cbus_retire_ex2_inst_int;                 
wire            cbus_retire_ex2_inst_mret;                
wire            cbus_retire_ex2_inst_nmi;                 
wire            cbus_retire_ex2_inst_tail_int;            
wire            cbus_retire_ex2_inst_vld;                 
wire            cbus_retire_ex2_int_hv;                   
wire    [7 :0]  cbus_retire_ex2_int_lv;                   
wire            cbus_retire_ex2_ipop_int_mask;            
wire            cbus_retire_ex2_may_debug;                
wire    [31:0]  cbus_retire_ex2_next_pc;                  
wire            cbus_retire_ex2_split_inst;               
wire            cbus_retire_ex2_tail_spec_inst;           
wire    [11:0]  cbus_retire_ex2_trap_vec;                 
wire    [31:0]  cbus_retire_ex2_tval;                     
wire            cbus_top_ex2_inst_vld;                    
wire            cbus_top_ex2_uncommit_stall;              
wire    [30:0]  cp0_rtu_ex1_chgflw_pc;                    
wire            cp0_rtu_ex1_chgflw_vld;                   
wire            cp0_rtu_ex1_cmplt;                        
wire            cp0_rtu_ex1_cmplt_dp;                     
wire            cp0_rtu_ex1_dret;                         
wire            cp0_rtu_ex1_ebreak;                       
wire            cp0_rtu_ex1_expt_inst;                    
wire    [31:0]  cp0_rtu_ex1_expt_tval;                    
wire    [3 :0]  cp0_rtu_ex1_expt_vec;                     
wire            cp0_rtu_ex1_flush;                        
wire    [14:0]  cp0_rtu_ex1_halt_info;                    
wire            cp0_rtu_ex1_inst_len;                     
wire            cp0_rtu_ex1_inst_vld;                     
wire            cp0_rtu_ex1_ipush_spec_fail;              
wire            cp0_rtu_ex1_mret;                         
wire            cp0_rtu_ex1_split_inst;                   
wire            cp0_rtu_ex1_tail_fail;                    
wire            cp0_rtu_icg_en;                           
wire            cp0_yy_clk_en;                            
wire            cpurst_b;                                 
wire            forever_cpuclk;                           
wire            ifu_rtu_warm_up;                          
wire            int_cbus_ex1_int_vld;                     
wire            int_cbus_ex1_nmi_req;                     
wire            int_cbus_int_hv;                          
wire    [11:0]  int_xx_int_id;                            
wire    [7 :0]  int_xx_int_lv;                            
wire            iu_rtu_ex1_bju_branch_inst;               
wire            iu_rtu_ex1_bju_cmplt;                     
wire            iu_rtu_ex1_bju_cmplt_dp;                  
wire    [30:0]  iu_rtu_ex1_bju_cur_pc;                    
wire            iu_rtu_ex1_bju_inst_len;                  
wire            iu_rtu_ex1_bju_inst_vld;                  
wire            iu_rtu_ex1_bju_split_inst;                
wire            iu_rtu_ex1_cmplt;                         
wire            iu_rtu_ex1_cmplt_dp;                      
wire            iu_rtu_ex1_inst_len;                      
wire            iu_rtu_ex1_inst_vld;                      
wire            iu_rtu_ex1_ipop_int_mask;                 
wire            iu_rtu_ex1_ipush_mie_en;                  
wire            iu_rtu_ex1_ipush_spec_fail;               
wire    [30:0]  iu_rtu_ex1_next_pc;                       
wire            iu_rtu_ex1_split_inst;                    
wire            iu_rtu_ex1_tail_int_vld;                  
wire            iu_rtu_ex2_bju_flush;                     
wire    [30:0]  iu_rtu_ex2_bju_next_pc;                   
wire            iu_rtu_ex2_bju_next_pc_vld;               
wire            lsu_rtu_async_expt_vld;                   
wire            lsu_rtu_ex1_cmplt;                        
wire            lsu_rtu_ex1_cmplt_dp;                     
wire    [14:0]  lsu_rtu_ex1_halt_info;                    
wire            lsu_rtu_ex1_inst_len;                     
wire            lsu_rtu_ex1_inst_vld;                     
wire            lsu_rtu_ex1_ipop_int_mask;                
wire            lsu_rtu_ex1_ipush_spec_inst;              
wire            lsu_rtu_ex1_split_inst;                   
wire            lsu_rtu_ex2_expt_inst;                    
wire    [3 :0]  lsu_rtu_ex2_expt_vec;                     
wire    [31:0]  lsu_rtu_ex2_tval;                         
wire            pad_yy_icg_scan_en;                       
wire            retire_cbus_debug_may_spec_fail;          
wire            retire_cbus_ex2_stall;                    
wire            retire_cbus_flush_stall;                  
wire            retire_ex2_clk;                           
wire            retire_ex2_clk_en;                        
wire            retire_ex2_expt_clk;                      
wire            retire_ex2_expt_clk_en;                   
wire            rtu_cp0_mie_en;                           
wire            rtu_cp0_mie_gateclk_en;                   
wire            rtu_idu_ex1_int_dis_stall_gateclk_req;    
wire            rtu_idu_ex1_int_dis_stall_req;            
wire            rtu_idu_ex2_ipush_spec_inst_expt_vld;     
wire            rtu_idu_ex2_ipush_spec_inst_halt_info_vld; 
wire    [31:0]  rtu_iu_bju_ex2_cur_pc;                    
wire            rtu_iu_ex1_cmplt_dp_vld;                  
wire            rtu_iu_ex1_cmplt_inst_len;                
wire            rtu_iu_ex1_cmplt_split_inst;              
wire            rtu_iu_ex1_cmplt_vld;                     
wire            rtu_iu_pending_spec_expt_vld;             
wire            rtu_iu_pending_spec_halt_info_vld;        
wire            rtu_xx_ex1_stall;                         
wire            rtu_yy_xx_flush;                          


//==========================================================
//                       Parameters
//==========================================================
parameter IU  = 0;
parameter BJU = 1;
parameter LSU = 2;
parameter CP0 = 3;

//==========================================================
//                      Complete Bus
//==========================================================
//----------------------------------------------------------
//                     Valid Signals
//----------------------------------------------------------
assign cbus_cmplt[IU]     = iu_rtu_ex1_cmplt;
assign cbus_cmplt[BJU]    = iu_rtu_ex1_bju_cmplt;
assign cbus_cmplt[LSU]    = lsu_rtu_ex1_cmplt;
assign cbus_cmplt[CP0]    = cp0_rtu_ex1_cmplt;

assign cbus_cmplt_dp[IU]  = iu_rtu_ex1_cmplt_dp;
assign cbus_cmplt_dp[BJU] = iu_rtu_ex1_bju_cmplt_dp;
assign cbus_cmplt_dp[LSU] = lsu_rtu_ex1_cmplt_dp;
assign cbus_cmplt_dp[CP0] = cp0_rtu_ex1_cmplt_dp;

assign cbus_ex1_inst[IU]  = iu_rtu_ex1_inst_vld;
assign cbus_ex1_inst[BJU] = iu_rtu_ex1_bju_inst_vld;
assign cbus_ex1_inst[LSU] = lsu_rtu_ex1_inst_vld;
assign cbus_ex1_inst[CP0] = cp0_rtu_ex1_inst_vld;

// &Force("nonport","cbus_ex1_inst_vld"); @60
assign cbus_cmplt_vld     = |cbus_cmplt[3:0];
assign cbus_cmplt_dp_vld  = |cbus_cmplt_dp[3:0];
assign cbus_ex1_inst_vld  = |cbus_ex1_inst[3:0];

assign rtu_iu_ex1_cmplt_vld    = cbus_cmplt_vld && !retire_cbus_ex2_stall;
assign rtu_iu_ex1_cmplt_dp_vld = cbus_cmplt_dp_vld;

//----------------------------------------------------------
//                   PC and Change Flow
//----------------------------------------------------------
assign cbus_ex1_cur_pc[30:0] = iu_rtu_ex1_bju_cur_pc[30:0];

//bju change flow pc will be muxed in EX2 due to timing
assign cbus_ex1_chgflw_vld =
    cbus_cmplt_dp[CP0] && cp0_rtu_ex1_chgflw_vld;

// //&Force("bus","iu_rtu_ex1_next_pc",31,0); @77
assign cbus_ex1_next_pc[30:0] =
    cbus_ex1_chgflw_vld ? cp0_rtu_ex1_chgflw_pc[30:0]
                        : iu_rtu_ex1_next_pc[30:0];

//----------------------------------------------------------
//                   Instruction Type
//----------------------------------------------------------
assign cbus_ex1_split_inst =
     cbus_cmplt_dp[IU]  && iu_rtu_ex1_split_inst
  || cbus_cmplt_dp[BJU] && iu_rtu_ex1_bju_split_inst
  || cbus_cmplt_dp[LSU] && lsu_rtu_ex1_split_inst
  || cbus_cmplt_dp[CP0] && cp0_rtu_ex1_split_inst;

assign cbus_ex1_inst_len =
     cbus_cmplt_dp[IU]  && iu_rtu_ex1_inst_len
  || cbus_cmplt_dp[BJU] && iu_rtu_ex1_bju_inst_len
  || cbus_cmplt_dp[LSU] && lsu_rtu_ex1_inst_len
  || cbus_cmplt_dp[CP0] && cp0_rtu_ex1_inst_len;

assign cbus_ex1_inst_branch =
    cbus_cmplt_dp[BJU] && iu_rtu_ex1_bju_branch_inst;

assign cbus_ex1_mret =
    cbus_cmplt_dp[CP0] && cp0_rtu_ex1_mret;

assign cbus_ex1_ebreak =
    cbus_cmplt_dp[CP0] && cp0_rtu_ex1_ebreak;

assign cbus_ex1_dret =
    cbus_cmplt_dp[CP0] && cp0_rtu_ex1_dret;

assign cbus_ex1_flush =
    cbus_cmplt_dp[CP0] && cp0_rtu_ex1_flush;

assign cbus_int_ex1_split_inst     = cbus_ex1_split_inst;
assign rtu_iu_ex1_cmplt_inst_len   = cbus_ex1_inst_len;
assign rtu_iu_ex1_cmplt_split_inst = cbus_ex1_split_inst;

//----------------------------------------------------------
//                     Debug Info
//----------------------------------------------------------
assign cbus_ex1_halt_info[`TDT_HINFO_WIDTH-1:0] = 
    {`TDT_HINFO_WIDTH{cbus_cmplt_dp[LSU]}} & lsu_rtu_ex1_halt_info[`TDT_HINFO_WIDTH-1:0]
  | {`TDT_HINFO_WIDTH{cbus_cmplt_dp[CP0]}} & cp0_rtu_ex1_halt_info[`TDT_HINFO_WIDTH-1:0];

//----------------------------------------------------------
//                      Exception
//----------------------------------------------------------
//lsu expt will be muxed in EX2
assign cbus_ex1_expt_inst =
    cbus_cmplt_dp[CP0] && cp0_rtu_ex1_expt_inst;

assign cbus_ex1_expt_vec[3:0] =
    {4{cbus_cmplt_dp[CP0]}} & cp0_rtu_ex1_expt_vec[3:0];

// &CombBeg; @133
always @( lsu_rtu_ex2_tval[31:0]
       or cbus_ex2_tval[31:0]
       or cbus_ex2_inst_type[2]
       or cbus_cmplt_dp[3]
       or cp0_rtu_ex1_expt_tval[31:0]
       or cbus_ex2_inst_int)
begin
  if(cbus_cmplt_dp[CP0])
    cbus_ex1_tval[31:0]    = cp0_rtu_ex1_expt_tval[31:0];
  //if lsu inst generate pending expt, save lsu expt info for new
  //spec inst pending expt which may not be lsu inst (cannot mux expt
  //info from lsu)
  else if(cbus_ex2_inst_type[LSU] && !cbus_ex2_inst_int)
    cbus_ex1_tval[31:0]    = lsu_rtu_ex2_tval[31:0];
  //if no expt inst cmplt, hold expt info for spec inst pending expt
  else
    cbus_ex1_tval[31:0]    = cbus_ex2_tval[31:0];
// &CombEnd; @144
end

//----------------------------------------------------------
//                      Interrupt
//----------------------------------------------------------
assign cbus_ex1_inst_int       = int_cbus_ex1_int_vld;
assign cbus_ex1_nmi            = int_cbus_ex1_nmi_req;
assign cbus_ex1_int_vec[11:0]  = int_xx_int_id[11:0];
assign cbus_ex1_int_hv         = int_cbus_int_hv;
assign cbus_ex1_int_lv[7:0]    = int_xx_int_lv[7:0];

// &CombBeg; @155
always @( lsu_rtu_ex2_expt_vec[3:0]
       or cbus_ex1_expt_inst
       or cbus_ex2_inst_type[2]
       or cbus_ex2_trap_vec[11:0]
       or cbus_ex1_expt_vec[3:0]
       or cbus_ex1_inst_int
       or cbus_ex1_int_vec[11:0]
       or cbus_ex2_inst_int)
begin
  if(cbus_ex1_inst_int)
    cbus_ex1_trap_vec[11:0]    = cbus_ex1_int_vec[11:0];
  else if(cbus_ex1_expt_inst)
    cbus_ex1_trap_vec[11:0]    = {8'b0, cbus_ex1_expt_vec[3:0]};
  //if lsu inst generate pending expt, save lsu expt info for new
  //spec inst pending expt which may not be lsu inst (cannot mux expt
  //info from lsu)
  else if(cbus_ex2_inst_type[LSU] && !cbus_ex2_inst_int)
    cbus_ex1_trap_vec[11:0]    = {8'b0, lsu_rtu_ex2_expt_vec[3:0]};
  //if no expt inst cmplt, hold expt info for spec inst pending expt
  else
    cbus_ex1_trap_vec[11:0]    = cbus_ex2_trap_vec[11:0];
// &CombEnd; @168
end

//----------------------------------------------------------
//                   Tail Inst and Int
//----------------------------------------------------------
//if spec inst generate exception, pending this exception
//and take no action when retire
assign cbus_ex1_ipush_spec_inst =
    cbus_cmplt_dp[LSU] && lsu_rtu_ex1_ipush_spec_inst;

//clear pending spec inst exception and take no action when retire
assign cbus_ex1_ipush_spec_fail =
    cbus_cmplt_dp[CP0] & cp0_rtu_ex1_ipush_spec_fail
  | cbus_cmplt_dp[IU] & iu_rtu_ex1_ipush_spec_fail;

//freeze pc and take no action when retire
assign cbus_ex1_tail_fail =
    cbus_cmplt_dp[CP0] && cp0_rtu_ex1_tail_fail;

assign cbus_ex1_tail_int_vld = 
    cbus_cmplt_dp[IU] && iu_rtu_ex1_tail_int_vld;

assign cbus_ex1_ipop_int_mask =
     cbus_cmplt_dp[IU]  && iu_rtu_ex1_ipop_int_mask
  || cbus_cmplt_dp[LSU] && lsu_rtu_ex1_ipop_int_mask;

assign cbus_ex1_ipush_mie_en =
    cbus_cmplt_dp[IU]  && iu_rtu_ex1_ipush_mie_en;

assign cbus_ex1_ipush_mie_gateclk_en =
    cbus_ex1_inst[IU]  && iu_rtu_ex1_ipush_mie_en;

assign cbus_ex1_inst_tail_int  = cbus_ex1_tail_int_vld
                                 && !cbus_ex1_nmi
                                 && !cbus_ex1_inst_int;

//take no action when retire:
//ignore any (async/sync) exception, interrupt and debug
assign cbus_ex1_tail_spec_inst = cbus_ex1_ipush_spec_inst
                                 || cbus_ex1_ipush_spec_fail
                                 || cbus_ex1_tail_fail;

//if committed inst could cmplt in ex1 stage
assign rtu_cp0_mie_en         = cbus_cmplt_vld
                                && cbus_ex1_ipush_mie_en;
//                                && !retire_xx_ex2_expt_raw;

assign rtu_cp0_mie_gateclk_en = cbus_ex1_inst_vld
                                && cbus_ex1_ipush_mie_gateclk_en;
//                                && !retire_xx_ex2_expt_raw;

//output to int
assign cbus_int_ipush_mie_en = cbus_ex1_ipush_mie_en;
assign cbus_int_ipop_int_mask = cbus_ex1_ipop_int_mask;

//==========================================================
//                 EX1 May spec fail Signal
//==========================================================
assign cbus_ex1_may_spec_fail_debug = cbus_ex1_halt_info[`TDT_HINFO_MATCH]
                                   || cbus_ex1_halt_info[`TDT_HINFO_PENDING_HALT]
                                   || cbus_ex1_halt_info[`TDT_HINFO_CANCEL]
                                   || cbus_ex1_ebreak;
//if ex1 instruction may produce speculation fail
//rtu should stall ex1 through uncommit stall when at ex2 stage
assign cbus_ex1_may_spec_fail       = cbus_ex1_expt_inst
                                   || cbus_ex1_flush
                                   || cbus_ex1_may_spec_fail_debug
                                   || cbus_ex1_chgflw_vld;

//==========================================================
//                    EX2 Retire Info
//==========================================================
//----------------------------------------------------------
//                      Gated Cell
//----------------------------------------------------------
assign retire_ex2_clk_en = ifu_rtu_warm_up
                           || cbus_cmplt_dp_vld
                           || cbus_ex2_inst_vld
                           || cbus_ex2_pending_spec_expt
                           || cbus_ex2_pending_spec_halt_info;
// &Instance("gated_clk_cell", "x_retire_ex2_clk"); @248
gated_clk_cell  x_retire_ex2_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (retire_ex2_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (retire_ex2_clk_en ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @249
//          .external_en (1'b0), @250
//          .global_en   (cp0_yy_clk_en), @251
//          .module_en   (cp0_rtu_icg_en), @252
//          .local_en    (retire_ex2_clk_en), @253
//          .clk_out     (retire_ex2_clk)); @254

assign retire_ex2_expt_clk_en = cbus_ex1_expt_inst
                             || cbus_ex1_inst_int
                             || cbus_ex1_halt_info[`TDT_HINFO_MATCH]
                             || cbus_ex1_halt_info[`TDT_HINFO_PENDING_HALT]
                             || cbus_ex1_halt_info[`TDT_HINFO_CANCEL]
                             || cbus_ex1_ebreak
                             || cbus_ex2_expt_inst
                             || cbus_retire_ex2_expt_inst;
// &Instance("gated_clk_cell", "x_retire_ex2_expt_clk"); @264
gated_clk_cell  x_retire_ex2_expt_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (retire_ex2_expt_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (retire_ex2_expt_clk_en),
  .module_en              (cp0_rtu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in      (forever_cpuclk), @265
//          .external_en (1'b0), @266
//          .global_en   (cp0_yy_clk_en), @267
//          .module_en   (cp0_rtu_icg_en), @268
//          .local_en    (retire_ex2_expt_clk_en), @269
//          .clk_out     (retire_ex2_expt_clk)); @270

//----------------------------------------------------------
//                   Retire inst valid
//----------------------------------------------------------
always @ (posedge retire_ex2_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    cbus_ex2_inst_vld       <= 1'b0;
    cbus_ex2_inst_type[3:0] <= 4'b0;
    cbus_ex2_may_spec_fail  <= 1'b0;
  end
  else if(!retire_cbus_ex2_stall) begin
    cbus_ex2_inst_vld       <= cbus_cmplt_vld;
    cbus_ex2_inst_type[3:0] <= cbus_cmplt[3:0];
    cbus_ex2_may_spec_fail  <= cbus_ex1_may_spec_fail;
  end
end

//----------------------------------------------------------
//                 Retire inst information
//----------------------------------------------------------
always @ (posedge retire_ex2_clk)
begin
  if(ifu_rtu_warm_up || !retire_cbus_ex2_stall) begin
    cbus_ex2_chgflw_vld      <= cbus_ex1_chgflw_vld;
    cbus_ex2_split_inst      <= cbus_ex1_split_inst;
    cbus_ex2_inst_branch     <= cbus_ex1_inst_branch;
    cbus_ex2_mret            <= cbus_ex1_mret;
    cbus_ex2_ebreak          <= cbus_ex1_ebreak;
    cbus_ex2_dret            <= cbus_ex1_dret;
    cbus_ex2_inst_int        <= cbus_ex1_inst_int;
    cbus_ex2_nmi             <= cbus_ex1_nmi;
    cbus_ex2_int_hv          <= cbus_ex1_int_hv;
    cbus_ex2_int_lv[7:0]     <= cbus_ex1_int_lv[7:0];
    cbus_ex2_inst_tail_int   <= cbus_ex1_inst_tail_int;
    cbus_ex2_ipush_spec_inst <= cbus_ex1_ipush_spec_inst;
    cbus_ex2_tail_spec_inst  <= cbus_ex1_tail_spec_inst;
    cbus_ex2_ipop_int_mask   <= cbus_ex1_ipop_int_mask;
    cbus_ex2_may_debug       <= cbus_ex1_may_spec_fail_debug;
    cbus_ex2_halt_info[`TDT_HINFO_WIDTH-1:0] <=
    cbus_ex1_halt_info[`TDT_HINFO_WIDTH-1:0];
  end
end

//reset expt inst and expt vector for less x:
//ex1 trap vec is ex2 trap vec when no expt
//avoid long x before expt inst
always @ (posedge retire_ex2_expt_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    cbus_ex2_expt_inst       <= 1'b0;
    cbus_ex2_tval[31:0]      <= 32'b0;
    cbus_ex2_trap_vec[11:0]  <= 12'b0;
  end
  else if(!retire_cbus_ex2_stall) begin
    cbus_ex2_expt_inst       <= cbus_ex1_expt_inst;
    cbus_ex2_tval[31:0]      <= cbus_ex1_tval[31:0];
    cbus_ex2_trap_vec[11:0]  <= cbus_ex1_trap_vec[11:0];
  end
end

always @ (posedge retire_ex2_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cbus_ex2_flush           <= 1'b0;
  else if(!retire_cbus_ex2_stall)
    cbus_ex2_flush           <= cbus_ex1_flush;
  //flush vld may be 0 when ex2 stall, rtu should save flush vld value
  else if(cbus_ex2_inst_type[BJU] && iu_rtu_ex2_bju_flush)
    cbus_ex2_flush           <= 1'b1;
end

//tail fail should hold pc value
always @ (posedge retire_ex2_clk)
begin
  if(ifu_rtu_warm_up)
    cbus_ex2_cur_pc[30:0]   <= cbus_ex1_cur_pc[30:0];
  else if(cbus_ex1_tail_fail)
    cbus_ex2_cur_pc[30:0]   <= cbus_ex2_cur_pc[30:0];
  else if(!retire_cbus_ex2_stall && cbus_cmplt_dp_vld)
    cbus_ex2_cur_pc[30:0]   <= cbus_ex1_cur_pc[30:0];
end

//tail fail should hold pc value
always @ (posedge retire_ex2_clk)
begin
  if(ifu_rtu_warm_up)
    cbus_ex2_next_pc[30:0]  <= cbus_ex1_next_pc[30:0];
  else if(cbus_ex1_tail_fail)
    cbus_ex2_next_pc[30:0]  <= cbus_ex2_next_pc[30:0];
  else if(!retire_cbus_ex2_stall)
    cbus_ex2_next_pc[30:0]  <= cbus_ex1_next_pc[30:0];
  //next pc vld may be 0 when ex2 stall, rtu should save next pc value
  else if(cbus_ex2_inst_type[BJU] && iu_rtu_ex2_bju_next_pc_vld)
    cbus_ex2_next_pc[30:0]  <= iu_rtu_ex2_bju_next_pc[30:0];
end

//output to bju
assign rtu_iu_bju_ex2_cur_pc[31:0] = {cbus_ex2_cur_pc[30:0], 1'b0};

//----------------------------------------------------------
//                    Output to Retire
//----------------------------------------------------------
// &Force("output","cbus_retire_ex2_inst_nmi"); @448
assign cbus_retire_ex2_inst_vld       = cbus_ex2_inst_vld;
assign cbus_retire_ex2_cur_pc[31:0]   = {cbus_ex2_cur_pc[30:0], 1'b0};
assign cbus_retire_ex2_split_inst     = cbus_ex2_split_inst;
assign cbus_retire_ex2_inst_branch    = cbus_ex2_inst_branch;
assign cbus_retire_ex2_inst_mret      = cbus_ex2_mret;
assign cbus_retire_ex2_inst_ebreak    = cbus_ex2_ebreak;
assign cbus_retire_ex2_inst_dret      = cbus_ex2_dret;
assign cbus_retire_ex2_inst_int       = cbus_ex2_inst_int;
assign cbus_retire_ex2_chgflw_vld     = cbus_ex2_chgflw_vld;
assign cbus_retire_ex2_inst_nmi       = cbus_ex2_nmi;
assign cbus_retire_ex2_int_hv         = cbus_ex2_int_hv;
assign cbus_retire_ex2_int_lv[7:0]    = cbus_ex2_int_lv[7:0];
assign cbus_retire_ex2_inst_tail_int  = cbus_ex2_inst_tail_int;
assign cbus_retire_ex2_tail_spec_inst = cbus_ex2_tail_spec_inst;
assign cbus_retire_ex2_ipop_int_mask  = cbus_ex2_ipop_int_mask;
assign cbus_retire_ex2_may_debug      = cbus_ex2_may_debug;

assign cbus_top_ex2_inst_vld          = cbus_ex2_inst_vld;

//----------------------------------------------------------
//                      Halt Info MUX
//----------------------------------------------------------
assign cbus_retire_ex2_halt_info[`TDT_HINFO_WIDTH-1:0] =
       cbus_ex2_pending_spec_halt_info && !cbus_ex2_ipush_spec_inst
       ? cbus_ex2_pending_spec_halt_info_data[`TDT_HINFO_WIDTH-1:0]
       : cbus_ex2_halt_info[`TDT_HINFO_WIDTH-1:0];

//----------------------------------------------------------
//                    BJU EX2 flush MUX
//----------------------------------------------------------
assign cbus_retire_ex2_flush          = cbus_ex2_inst_type[BJU]
                                        ? cbus_ex2_flush || iu_rtu_ex2_bju_flush
                                        : cbus_ex2_flush;

//----------------------------------------------------------
//                    BJU EX2 next PC MUX
//----------------------------------------------------------
assign cbus_retire_ex2_next_pc[31:0]  = cbus_ex2_inst_type[BJU]
                                        && iu_rtu_ex2_bju_next_pc_vld
                                        ? {iu_rtu_ex2_bju_next_pc[30:0], 1'b0}
                                        : {cbus_ex2_next_pc[30:0], 1'b0};

//----------------------------------------------------------
//                  LSU EX2 Exception MUX
//----------------------------------------------------------
//mux with lsu ex2 exception signals
//lsu will hold expt info when ex2 stall (no new lsu inst cmplt)
//so do not need to save lsu ex2 expt info when ex2 stall
// &Force("output","cbus_retire_ex2_expt_inst"); @497
//assign cbus_retire_ex2_expt_inst      = cbus_ex2_inst_type[LSU]
//                                        ? lsu_rtu_ex2_expt_inst
//                                        : cbus_ex2_expt_inst;
assign cbus_retire_ex2_expt_inst      = cbus_ex2_pending_spec_expt
                                        && !cbus_ex2_ipush_spec_inst
                                    || (cbus_ex2_inst_type[LSU]
                                        ? lsu_rtu_ex2_expt_inst
                                        : cbus_ex2_expt_inst);
assign cbus_retire_ex2_trap_vec[11:0] = cbus_ex2_inst_type[LSU] && !cbus_ex2_inst_int
                                        ? {8'b0, lsu_rtu_ex2_expt_vec[3:0]}
                                        : cbus_ex2_trap_vec[11:0];
assign cbus_retire_ex2_tval[31:0]     = cbus_ex2_inst_type[LSU] && !cbus_ex2_inst_int
                                        ? lsu_rtu_ex2_tval[31:0]
                                        : cbus_ex2_tval[31:0];

//==========================================================
//             Pending Exception for spec inst
//==========================================================
//if spec inst retire with exception, pending this exception
assign cbus_ex2_pending_spec_expt_set = cbus_ex2_inst_vld
                                        && !retire_cbus_ex2_stall
                                        && cbus_ex2_ipush_spec_inst
                                        && cbus_retire_ex2_expt_inst;
assign rtu_idu_ex2_ipush_spec_inst_expt_vld = cbus_ex2_pending_spec_expt_set;
////clear pending exception when ex1 spec fail or ex2 non spec inst retire
assign cbus_ex1_pending_spec_expt_clr = cbus_cmplt_vld
                                        && !retire_cbus_ex2_stall
                                        && cbus_ex1_ipush_spec_fail
                                     || cbus_ex2_inst_vld
                                        && !retire_cbus_ex2_stall
                                        && !cbus_ex2_ipush_spec_inst
                                        && cbus_ex2_pending_spec_expt;

always @ (posedge retire_ex2_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cbus_ex2_pending_spec_expt <= 1'b0;
  else if (cbus_ex1_pending_spec_expt_clr || rtu_yy_xx_flush)
    cbus_ex2_pending_spec_expt <= 1'b0;
  else if (cbus_ex2_pending_spec_expt_set)
    cbus_ex2_pending_spec_expt <= 1'b1;
end

assign rtu_iu_pending_spec_expt_vld = cbus_ex2_pending_spec_expt;

//==========================================================
//             Pending Halt Info for spec inst
//==========================================================
//if spec inst retire with t0 halt req / expt trigger match,
//pending its halt info
assign cbus_ex2_pending_spec_halt_info_set = cbus_ex2_inst_vld
                                             && !retire_cbus_ex2_stall
                                             && cbus_ex2_ipush_spec_inst
                                             && !cbus_ex2_halt_info[`TDT_HINFO_PENDING_HALT]
                                             &&  cbus_ex2_halt_info[`TDT_HINFO_MATCH]
                                             && !cbus_ex2_halt_info[`TDT_HINFO_CHAIN]
                                             && !cbus_ex2_halt_info[`TDT_HINFO_TIMING];
assign rtu_idu_ex2_ipush_spec_inst_halt_info_vld = cbus_ex2_pending_spec_halt_info_set;
////clear pending exception when ex1 spec fail or ex2 non spec inst retire
assign cbus_ex1_pending_spec_halt_info_clr = cbus_cmplt_vld
                                             && !retire_cbus_ex2_stall
                                             && cbus_ex1_ipush_spec_fail
                                          || cbus_ex2_inst_vld
                                             && !retire_cbus_ex2_stall
                                             && !cbus_ex2_ipush_spec_inst
                                             && cbus_ex2_pending_spec_halt_info;

always @ (posedge retire_ex2_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    cbus_ex2_pending_spec_halt_info <= 1'b0;
    cbus_ex2_pending_spec_halt_info_data[`TDT_HINFO_WIDTH-1:0] <= {`TDT_HINFO_WIDTH{1'b0}};
  end
  else if (cbus_ex1_pending_spec_halt_info_clr || rtu_yy_xx_flush) begin
    cbus_ex2_pending_spec_halt_info <= 1'b0;
    cbus_ex2_pending_spec_halt_info_data[`TDT_HINFO_WIDTH-1:0] <= {`TDT_HINFO_WIDTH{1'b0}};
  end
  else if (cbus_ex2_pending_spec_halt_info_set) begin
    cbus_ex2_pending_spec_halt_info <= 1'b1;
    cbus_ex2_pending_spec_halt_info_data[`TDT_HINFO_WIDTH-1:0] <= cbus_ex2_halt_info[`TDT_HINFO_WIDTH-1:0];
  end
end

assign rtu_iu_pending_spec_halt_info_vld = cbus_ex2_pending_spec_halt_info;

//==========================================================
//                  RTU Complete Bus Stall
//==========================================================
//if ex1 instruction may produce speculation fail
//rtu should stall ex1 through uncommit stall when ex2
//when bju change flow inst results spec fail, rtu should
//stall when ex2
assign cbus_ex2_uncommit_stall = cbus_ex2_inst_vld
                                 && (cbus_ex2_may_spec_fail
                                  || cbus_ex2_chgflw_vld
                                  || cbus_retire_ex2_expt_inst
                                  || cbus_retire_ex2_inst_nmi
                                  || lsu_rtu_async_expt_vld)
                               || retire_cbus_flush_stall
                               || retire_cbus_debug_may_spec_fail
                               || iu_rtu_ex2_bju_flush;
assign cbus_top_ex2_uncommit_stall = cbus_ex2_uncommit_stall;

//rtu ex1 stall: stall IDU EX1 inst sel, stall EU cmplt
assign rtu_xx_ex1_stall        = cbus_ex2_uncommit_stall
                                 || retire_cbus_ex2_stall;
////if ex1 inst valid and may retire with interrupt, id stage
////should be stalled to prevent newer spec fail inst modify
////write back table state
//assign rtu_idu_ex1_int_stall         = cbus_ex1_inst_vld
//                                       && cbus_ex1_inst_int;
//if ex1 inst pipedown with int, stall dispatch until int change flow
assign rtu_idu_ex1_int_dis_stall_req         = cbus_cmplt_vld
                                               && !retire_cbus_ex2_stall
                                               && cbus_ex1_inst_int;
assign rtu_idu_ex1_int_dis_stall_gateclk_req = cbus_cmplt_dp_vld
                                               && cbus_ex1_inst_int;


// &ModuleEnd; @617
endmodule


