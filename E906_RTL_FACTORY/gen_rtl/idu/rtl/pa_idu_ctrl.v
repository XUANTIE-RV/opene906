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
module pa_idu_ctrl(
  cp0_idu_ex1_stall,
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_dp_ex1_bju_sel,
  ctrl_dp_ex1_div_sel,
  ctrl_dp_ex1_dst_preg,
  ctrl_dp_ex1_dst_vld,
  ctrl_dp_ex1_fls,
  ctrl_dp_ex1_inst_vld,
  ctrl_dp_ex1_lsu_sel,
  ctrl_dp_ex1_rs1_dep,
  ctrl_dp_ex1_rs2_dep,
  ctrl_dp_ex1_st_sel,
  ctrl_dp_pipe_down,
  ctrl_dp_pipe_down_gate,
  ctrl_fpr_ex1_int_spec,
  ctrl_gpr_div_inst,
  ctrl_gpr_ex1_dst_preg,
  ctrl_gpr_ex1_int_spec,
  ctrl_gpr_id_rd1_vld,
  ctrl_gpr_id_rd2_vld,
  ctrl_gpr_id_wr_idx1,
  ctrl_gpr_id_wr_idx2,
  ctrl_gpr_ld_inst,
  ctrl_gpr_wr_issue1,
  ctrl_hs_be_idle,
  ctrl_hs_bkpt_vld,
  ctrl_hs_no_op,
  ctrl_hs_stall,
  ctrl_id_fp_ex1_inst_vld,
  ctrl_id_fp_ex1_lsu_sel,
  ctrl_id_fp_id_expt_vld,
  ctrl_id_fp_id_inst_vld,
  ctrl_id_fp_id_stall,
  ctrl_id_fp_pipe_down,
  ctrl_id_fp_st_rs2_dep,
  ctrl_id_fp_uncmit,
  ctrl_split_bkpt_vld,
  ctrl_split_stall,
  ctrl_top_bju_dep1_vld,
  ctrl_top_bju_dep2_vld,
  ctrl_top_cp0_stall,
  ctrl_top_div_stall,
  ctrl_top_ex1_fp_vld,
  ctrl_top_ex1_sel,
  ctrl_top_ex1_stall,
  ctrl_top_ex1_vld,
  ctrl_top_id_cancel,
  ctrl_top_id_inst_vld,
  ctrl_top_id_stall,
  ctrl_top_ld_stall,
  ctrl_top_norm_stall,
  ctrl_top_st_dep_vld,
  decd_ctrl_bju_use_pc,
  decd_ctrl_id_func,
  decd_ctrl_ill_expt,
  decd_ctrl_inst_32bit,
  decd_ctrl_rd1,
  decd_ctrl_rd1_vld,
  decd_ctrl_rd2,
  decd_ctrl_rd2_vld,
  decd_ctrl_sti_vld,
  decd_ctrl_str_vld,
  decd_ctrl_unit_sel,
  dp_ctrl_ex1_ex_st_rs2_vld,
  dp_ctrl_ex1_st_vld,
  dp_ctrl_rs1_dep_ex1_dst,
  dp_ctrl_rs1_fwd_lsu,
  dp_ctrl_rs1_stall_upd,
  dp_ctrl_rs2_dep_ex1_dst,
  dp_ctrl_rs2_fwd_lsu,
  dp_ctrl_rs2_stall_upd,
  dp_ctrl_rs3_dep_ex1_dst,
  dp_ctrl_rs3_fwd_lsu,
  dp_ctrl_rs3_stall_upd,
  dp_ctrl_rs_norm_stall,
  fdecd_ctrl_dst_idx,
  fdecd_ctrl_dst_vld,
  fdecd_ctrl_fls,
  fdecd_ctrl_fp_inst_vld,
  fdecd_ctrl_int_dst_vld,
  forever_cpuclk,
  fpu_idu_ex1_stall,
  fpu_xx_no_op,
  gpr_ctrl_rd1_busy_div,
  gpr_ctrl_rd1_busy_lsu,
  gpr_ctrl_rd2_busy_div,
  gpr_ctrl_rd2_busy_lsu,
  gpr_ctrl_rs1_busy_div,
  gpr_ctrl_rs1_busy_lsu,
  gpr_ctrl_rs1_busy_lsu2,
  gpr_ctrl_rs2_busy_div,
  gpr_ctrl_rs2_busy_lsu,
  gpr_ctrl_rs2_busy_lsu2,
  gpr_ctrl_rs3_busy_div,
  gpr_ctrl_rs3_busy_lsu,
  gpr_ctrl_rs3_busy_lsu2,
  gpr_ctrl_rs4_busy_div,
  gpr_ctrl_rs4_busy_lsu,
  hs_ctrl_cancel,
  hs_ctrl_inst_vld,
  hs_ctrl_stall,
  id_fp_ctrl_id_stall,
  id_fp_ctrl_rs2_dep_ex1_dst,
  id_fp_ctrl_rs2_stall_upd,
  idu_cp0_ex1_cmplt_dp_sel,
  idu_cp0_ex1_dst_idx,
  idu_cp0_ex1_dst_vld,
  idu_cp0_ex1_expt_high,
  idu_cp0_ex1_expt_type,
  idu_cp0_ex1_expt_vld,
  idu_cp0_ex1_gateclk_sel,
  idu_cp0_ex1_halt_info,
  idu_cp0_ex1_inst_len,
  idu_cp0_ex1_sel,
  idu_ifu_id_stall,
  idu_iu_ex1_alu_cmplt_dp_sel,
  idu_iu_ex1_alu_gateclk_sel,
  idu_iu_ex1_alu_sel,
  idu_iu_ex1_bht_pred,
  idu_iu_ex1_bju_cmplt_dp_sel,
  idu_iu_ex1_bju_depd_lsu_src0,
  idu_iu_ex1_bju_depd_lsu_src1,
  idu_iu_ex1_bju_gateclk_sel,
  idu_iu_ex1_bju_sel,
  idu_iu_ex1_bju_use_pc,
  idu_iu_ex1_div_cmplt_dp_sel,
  idu_iu_ex1_div_gateclk_sel,
  idu_iu_ex1_div_sel,
  idu_iu_ex1_dst_preg,
  idu_iu_ex1_gateclk_vld,
  idu_iu_ex1_inst_len,
  idu_iu_ex1_inst_vld,
  idu_iu_ex1_mul_cmplt_dp_sel,
  idu_iu_ex1_mul_gateclk_sel,
  idu_iu_ex1_mul_sel,
  idu_iu_ex1_wb_vld,
  idu_lsu_ex1_base_sel,
  idu_lsu_ex1_dest_reg,
  idu_lsu_ex1_dest_vld,
  idu_lsu_ex1_dp_sel,
  idu_lsu_ex1_fls,
  idu_lsu_ex1_gateclk_sel,
  idu_lsu_ex1_halt_info,
  idu_lsu_ex1_length,
  idu_lsu_ex1_sel,
  idu_lsu_ex1_src1_depd,
  idu_misc_cpuclk,
  ifu_idu_id_expt_high,
  ifu_idu_id_expt_vld,
  ifu_idu_id_halt_info,
  ifu_idu_id_inst_vld,
  ifu_idu_id_pred_taken,
  ifu_idu_warm_up,
  iu_idu_bju_global_stall,
  iu_idu_bju_stall,
  iu_idu_ex1_stall,
  iu_idu_id_stall,
  iu_xx_no_op,
  iu_yy_xx_cancel,
  lsu_idu_ex1_halt_info,
  lsu_idu_ex1_halt_info_update_en,
  lsu_idu_ex1_stall,
  lsu_idu_global_stall,
  lsu_xx_no_op,
  pad_yy_icg_scan_en,
  rtu_idu_ex1_int_dis_stall_gateclk_req,
  rtu_idu_ex1_int_dis_stall_req,
  rtu_idu_flush_fe,
  rtu_idu_flush_stall,
  rtu_idu_inst_retire,
  rtu_idu_late_flush,
  rtu_xx_ex1_stall,
  rtu_xx_no_op,
  rtu_yy_xx_flush,
  split_ctrl_cancel,
  split_ctrl_icg_en,
  split_ctrl_stall
);

// &Ports; @24
input           cp0_idu_ex1_stall;                    
input           cp0_idu_icg_en;                       
input           cp0_yy_clk_en;                        
input           cpurst_b;                             
input           decd_ctrl_bju_use_pc;                 
input   [4 :0]  decd_ctrl_id_func;                    
input           decd_ctrl_ill_expt;                   
input           decd_ctrl_inst_32bit;                 
input   [5 :0]  decd_ctrl_rd1;                        
input           decd_ctrl_rd1_vld;                    
input   [5 :0]  decd_ctrl_rd2;                        
input           decd_ctrl_rd2_vld;                    
input           decd_ctrl_sti_vld;                    
input           decd_ctrl_str_vld;                    
input   [5 :0]  decd_ctrl_unit_sel;                   
input           dp_ctrl_ex1_ex_st_rs2_vld;            
input           dp_ctrl_ex1_st_vld;                   
input           dp_ctrl_rs1_dep_ex1_dst;              
input           dp_ctrl_rs1_fwd_lsu;                  
input           dp_ctrl_rs1_stall_upd;                
input           dp_ctrl_rs2_dep_ex1_dst;              
input           dp_ctrl_rs2_fwd_lsu;                  
input           dp_ctrl_rs2_stall_upd;                
input           dp_ctrl_rs3_dep_ex1_dst;              
input           dp_ctrl_rs3_fwd_lsu;                  
input           dp_ctrl_rs3_stall_upd;                
input           dp_ctrl_rs_norm_stall;                
input   [5 :0]  fdecd_ctrl_dst_idx;                   
input           fdecd_ctrl_dst_vld;                   
input           fdecd_ctrl_fls;                       
input           fdecd_ctrl_fp_inst_vld;               
input           fdecd_ctrl_int_dst_vld;               
input           forever_cpuclk;                       
input           fpu_idu_ex1_stall;                    
input           fpu_xx_no_op;                         
input           gpr_ctrl_rd1_busy_div;                
input           gpr_ctrl_rd1_busy_lsu;                
input           gpr_ctrl_rd2_busy_div;                
input           gpr_ctrl_rd2_busy_lsu;                
input           gpr_ctrl_rs1_busy_div;                
input           gpr_ctrl_rs1_busy_lsu;                
input           gpr_ctrl_rs1_busy_lsu2;               
input           gpr_ctrl_rs2_busy_div;                
input           gpr_ctrl_rs2_busy_lsu;                
input           gpr_ctrl_rs2_busy_lsu2;               
input           gpr_ctrl_rs3_busy_div;                
input           gpr_ctrl_rs3_busy_lsu;                
input           gpr_ctrl_rs3_busy_lsu2;               
input           gpr_ctrl_rs4_busy_div;                
input           gpr_ctrl_rs4_busy_lsu;                
input           hs_ctrl_cancel;                       
input           hs_ctrl_inst_vld;                     
input           hs_ctrl_stall;                        
input           id_fp_ctrl_id_stall;                  
input           id_fp_ctrl_rs2_dep_ex1_dst;           
input           id_fp_ctrl_rs2_stall_upd;             
input           ifu_idu_id_expt_high;                 
input           ifu_idu_id_expt_vld;                  
input   [14:0]  ifu_idu_id_halt_info;                 
input           ifu_idu_id_inst_vld;                  
input   [1 :0]  ifu_idu_id_pred_taken;                
input           ifu_idu_warm_up;                      
input           iu_idu_bju_global_stall;              
input           iu_idu_bju_stall;                     
input           iu_idu_ex1_stall;                     
input           iu_idu_id_stall;                      
input           iu_xx_no_op;                          
input           iu_yy_xx_cancel;                      
input   [14:0]  lsu_idu_ex1_halt_info;                
input           lsu_idu_ex1_halt_info_update_en;      
input           lsu_idu_ex1_stall;                    
input           lsu_idu_global_stall;                 
input           lsu_xx_no_op;                         
input           pad_yy_icg_scan_en;                   
input           rtu_idu_ex1_int_dis_stall_gateclk_req; 
input           rtu_idu_ex1_int_dis_stall_req;        
input           rtu_idu_flush_fe;                     
input           rtu_idu_flush_stall;                  
input           rtu_idu_inst_retire;                  
input           rtu_idu_late_flush;                   
input           rtu_xx_ex1_stall;                     
input           rtu_xx_no_op;                         
input           rtu_yy_xx_flush;                      
input           split_ctrl_cancel;                    
input           split_ctrl_icg_en;                    
input           split_ctrl_stall;                     
output          ctrl_dp_ex1_bju_sel;                  
output          ctrl_dp_ex1_div_sel;                  
output  [5 :0]  ctrl_dp_ex1_dst_preg;                 
output          ctrl_dp_ex1_dst_vld;                  
output          ctrl_dp_ex1_fls;                      
output          ctrl_dp_ex1_inst_vld;                 
output          ctrl_dp_ex1_lsu_sel;                  
output          ctrl_dp_ex1_rs1_dep;                  
output          ctrl_dp_ex1_rs2_dep;                  
output          ctrl_dp_ex1_st_sel;                   
output          ctrl_dp_pipe_down;                    
output          ctrl_dp_pipe_down_gate;               
output          ctrl_fpr_ex1_int_spec;                
output          ctrl_gpr_div_inst;                    
output  [4 :0]  ctrl_gpr_ex1_dst_preg;                
output          ctrl_gpr_ex1_int_spec;                
output          ctrl_gpr_id_rd1_vld;                  
output          ctrl_gpr_id_rd2_vld;                  
output  [5 :0]  ctrl_gpr_id_wr_idx1;                  
output  [5 :0]  ctrl_gpr_id_wr_idx2;                  
output          ctrl_gpr_ld_inst;                     
output          ctrl_gpr_wr_issue1;                   
output          ctrl_hs_be_idle;                      
output          ctrl_hs_bkpt_vld;                     
output          ctrl_hs_no_op;                        
output          ctrl_hs_stall;                        
output          ctrl_id_fp_ex1_inst_vld;              
output          ctrl_id_fp_ex1_lsu_sel;               
output          ctrl_id_fp_id_expt_vld;               
output          ctrl_id_fp_id_inst_vld;               
output          ctrl_id_fp_id_stall;                  
output          ctrl_id_fp_pipe_down;                 
output          ctrl_id_fp_st_rs2_dep;                
output          ctrl_id_fp_uncmit;                    
output          ctrl_split_bkpt_vld;                  
output          ctrl_split_stall;                     
output          ctrl_top_bju_dep1_vld;                
output          ctrl_top_bju_dep2_vld;                
output          ctrl_top_cp0_stall;                   
output          ctrl_top_div_stall;                   
output          ctrl_top_ex1_fp_vld;                  
output  [5 :0]  ctrl_top_ex1_sel;                     
output          ctrl_top_ex1_stall;                   
output          ctrl_top_ex1_vld;                     
output          ctrl_top_id_cancel;                   
output          ctrl_top_id_inst_vld;                 
output          ctrl_top_id_stall;                    
output          ctrl_top_ld_stall;                    
output          ctrl_top_norm_stall;                  
output          ctrl_top_st_dep_vld;                  
output          idu_cp0_ex1_cmplt_dp_sel;             
output  [5 :0]  idu_cp0_ex1_dst_idx;                  
output          idu_cp0_ex1_dst_vld;                  
output          idu_cp0_ex1_expt_high;                
output          idu_cp0_ex1_expt_type;                
output          idu_cp0_ex1_expt_vld;                 
output          idu_cp0_ex1_gateclk_sel;              
output  [14:0]  idu_cp0_ex1_halt_info;                
output          idu_cp0_ex1_inst_len;                 
output          idu_cp0_ex1_sel;                      
output          idu_ifu_id_stall;                     
output          idu_iu_ex1_alu_cmplt_dp_sel;          
output          idu_iu_ex1_alu_gateclk_sel;           
output          idu_iu_ex1_alu_sel;                   
output  [1 :0]  idu_iu_ex1_bht_pred;                  
output          idu_iu_ex1_bju_cmplt_dp_sel;          
output          idu_iu_ex1_bju_depd_lsu_src0;         
output          idu_iu_ex1_bju_depd_lsu_src1;         
output          idu_iu_ex1_bju_gateclk_sel;           
output          idu_iu_ex1_bju_sel;                   
output          idu_iu_ex1_bju_use_pc;                
output          idu_iu_ex1_div_cmplt_dp_sel;          
output          idu_iu_ex1_div_gateclk_sel;           
output          idu_iu_ex1_div_sel;                   
output  [5 :0]  idu_iu_ex1_dst_preg;                  
output          idu_iu_ex1_gateclk_vld;               
output          idu_iu_ex1_inst_len;                  
output          idu_iu_ex1_inst_vld;                  
output          idu_iu_ex1_mul_cmplt_dp_sel;          
output          idu_iu_ex1_mul_gateclk_sel;           
output          idu_iu_ex1_mul_sel;                   
output          idu_iu_ex1_wb_vld;                    
output          idu_lsu_ex1_base_sel;                 
output  [5 :0]  idu_lsu_ex1_dest_reg;                 
output          idu_lsu_ex1_dest_vld;                 
output          idu_lsu_ex1_dp_sel;                   
output          idu_lsu_ex1_fls;                      
output          idu_lsu_ex1_gateclk_sel;              
output  [14:0]  idu_lsu_ex1_halt_info;                
output          idu_lsu_ex1_length;                   
output          idu_lsu_ex1_sel;                      
output          idu_lsu_ex1_src1_depd;                
output          idu_misc_cpuclk;                      

// &Regs; @25
reg             ctrl_ex1_bju_rs1_dep;                 
reg             ctrl_ex1_bju_use_pc;                  
reg     [5 :0]  ctrl_ex1_dst_idx;                     
reg             ctrl_ex1_dst_vld;                     
reg             ctrl_ex1_expt_high;                   
reg             ctrl_ex1_expt_type;                   
reg             ctrl_ex1_expt_vld;                    
reg             ctrl_ex1_fls;                         
reg             ctrl_ex1_fp_inst_vld;                 
reg             ctrl_ex1_fp_int_spec;                 
reg     [14:0]  ctrl_ex1_halt_info;                   
reg             ctrl_ex1_inst_len;                    
reg             ctrl_ex1_inst_vld;                    
reg             ctrl_ex1_int_dst_vld;                 
reg             ctrl_ex1_int_spec;                    
reg             ctrl_ex1_int_stall;                   
reg     [1 :0]  ctrl_ex1_pred_taken;                  
reg             ctrl_ex1_rs2_dep;                     
reg     [5 :0]  ctrl_ex1_unit_sel;                    

// &Wires; @26
wire            cp0_idu_ex1_stall;                    
wire            cp0_idu_icg_en;                       
wire            cp0_yy_clk_en;                        
wire            cpurst_b;                             
wire            ctrl_bju_rs1_dep_vld;                 
wire            ctrl_bju_rs2_dep_vld;                 
wire            ctrl_cpuclk;                          
wire            ctrl_dep_div_stall;                   
wire            ctrl_dep_ld_stall;                    
wire            ctrl_dep_norm_stall;                  
wire            ctrl_dp_ex1_bju_sel;                  
wire            ctrl_dp_ex1_div_sel;                  
wire    [5 :0]  ctrl_dp_ex1_dst_preg;                 
wire            ctrl_dp_ex1_dst_vld;                  
wire            ctrl_dp_ex1_fls;                      
wire            ctrl_dp_ex1_inst_vld;                 
wire            ctrl_dp_ex1_lsu_sel;                  
wire            ctrl_dp_ex1_rs1_dep;                  
wire            ctrl_dp_ex1_rs2_dep;                  
wire            ctrl_dp_ex1_st_sel;                   
wire            ctrl_dp_pipe_down;                    
wire            ctrl_dp_pipe_down_gate;               
wire            ctrl_ex1_bju_sel;                     
wire            ctrl_ex1_cp0_sel;                     
wire            ctrl_ex1_div_sel;                     
wire            ctrl_ex1_lsu_sel;                     
wire            ctrl_ex1_uncmit;                      
wire            ctrl_fence_bkpt_stall;                
wire            ctrl_fence_cp0_stall;                 
wire            ctrl_fpr_ex1_int_spec;                
wire            ctrl_gpr_div_inst;                    
wire    [4 :0]  ctrl_gpr_ex1_dst_preg;                
wire            ctrl_gpr_ex1_int_spec;                
wire            ctrl_gpr_id_rd1_vld;                  
wire            ctrl_gpr_id_rd2_vld;                  
wire    [5 :0]  ctrl_gpr_id_wr_idx1;                  
wire    [5 :0]  ctrl_gpr_id_wr_idx2;                  
wire            ctrl_gpr_ld_inst;                     
wire            ctrl_gpr_wr_issue1;                   
wire            ctrl_hs_be_idle;                      
wire            ctrl_hs_bkpt_vld;                     
wire            ctrl_hs_no_op;                        
wire            ctrl_hs_stall;                        
wire            ctrl_icg_en;                          
wire            ctrl_id_bju_inst;                     
wire            ctrl_id_div_inst;                     
wire            ctrl_id_expt_type;                    
wire            ctrl_id_expt_vld;                     
wire            ctrl_id_flush;                        
wire            ctrl_id_fp_ex1_inst_vld;              
wire            ctrl_id_fp_ex1_lsu_sel;               
wire            ctrl_id_fp_id_expt_vld;               
wire            ctrl_id_fp_id_inst_vld;               
wire            ctrl_id_fp_id_stall;                  
wire            ctrl_id_fp_int_spec;                  
wire            ctrl_id_fp_pipe_down;                 
wire            ctrl_id_fp_st_rs2_dep;                
wire            ctrl_id_fp_uncmit;                    
wire            ctrl_id_inst_bkpt_vld;                
wire            ctrl_id_inst_flush;                   
wire            ctrl_id_inst_vld;                     
wire            ctrl_id_inst_vld_fin;                 
wire            ctrl_id_int_flush;                    
wire            ctrl_id_int_spec;                     
wire            ctrl_id_issue_cancel;                 
wire            ctrl_id_ld_inst;                      
wire            ctrl_id_pipe_stall;                   
wire            ctrl_id_st_inst;                      
wire            ctrl_id_stall;                        
wire    [5 :0]  ctrl_id_unit_sel;                     
wire            ctrl_issue_stall;                     
wire            ctrl_pipe_down;                       
wire            ctrl_split_bkpt_vld;                  
wire            ctrl_split_stall;                     
wire            ctrl_st_rs2_dep_vld;                  
wire            ctrl_st_rs3_dep_vld;                  
wire            ctrl_top_bju_dep1_vld;                
wire            ctrl_top_bju_dep2_vld;                
wire            ctrl_top_cp0_stall;                   
wire            ctrl_top_div_stall;                   
wire            ctrl_top_ex1_fp_vld;                  
wire    [5 :0]  ctrl_top_ex1_sel;                     
wire            ctrl_top_ex1_stall;                   
wire            ctrl_top_ex1_vld;                     
wire            ctrl_top_id_cancel;                   
wire            ctrl_top_id_inst_vld;                 
wire            ctrl_top_id_stall;                    
wire            ctrl_top_ld_stall;                    
wire            ctrl_top_norm_stall;                  
wire            ctrl_top_st_dep_vld;                  
wire            decd_ctrl_bju_use_pc;                 
wire    [4 :0]  decd_ctrl_id_func;                    
wire            decd_ctrl_ill_expt;                   
wire            decd_ctrl_inst_32bit;                 
wire    [5 :0]  decd_ctrl_rd1;                        
wire            decd_ctrl_rd1_vld;                    
wire    [5 :0]  decd_ctrl_rd2;                        
wire            decd_ctrl_rd2_vld;                    
wire            decd_ctrl_sti_vld;                    
wire            decd_ctrl_str_vld;                    
wire    [5 :0]  decd_ctrl_unit_sel;                   
wire            dp_ctrl_ex1_ex_st_rs2_vld;            
wire            dp_ctrl_ex1_st_vld;                   
wire            dp_ctrl_rs1_dep_ex1_dst;              
wire            dp_ctrl_rs1_fwd_lsu;                  
wire            dp_ctrl_rs1_stall_upd;                
wire            dp_ctrl_rs2_dep_ex1_dst;              
wire            dp_ctrl_rs2_fwd_lsu;                  
wire            dp_ctrl_rs2_stall_upd;                
wire            dp_ctrl_rs3_dep_ex1_dst;              
wire            dp_ctrl_rs3_fwd_lsu;                  
wire            dp_ctrl_rs3_stall_upd;                
wire            dp_ctrl_rs_norm_stall;                
wire    [5 :0]  fdecd_ctrl_dst_idx;                   
wire            fdecd_ctrl_dst_vld;                   
wire            fdecd_ctrl_fls;                       
wire            fdecd_ctrl_fp_inst_vld;               
wire            fdecd_ctrl_int_dst_vld;               
wire            forever_cpuclk;                       
wire            fpu_idu_ex1_stall;                    
wire            fpu_xx_no_op;                         
wire            gpr_ctrl_rd1_busy_div;                
wire            gpr_ctrl_rd1_busy_lsu;                
wire            gpr_ctrl_rd2_busy_div;                
wire            gpr_ctrl_rd2_busy_lsu;                
wire            gpr_ctrl_rs1_busy_div;                
wire            gpr_ctrl_rs1_busy_lsu;                
wire            gpr_ctrl_rs1_busy_lsu2;               
wire            gpr_ctrl_rs2_busy_div;                
wire            gpr_ctrl_rs2_busy_lsu;                
wire            gpr_ctrl_rs2_busy_lsu2;               
wire            gpr_ctrl_rs3_busy_div;                
wire            gpr_ctrl_rs3_busy_lsu;                
wire            gpr_ctrl_rs3_busy_lsu2;               
wire            gpr_ctrl_rs4_busy_div;                
wire            gpr_ctrl_rs4_busy_lsu;                
wire            hs_ctrl_cancel;                       
wire            hs_ctrl_inst_vld;                     
wire            hs_ctrl_stall;                        
wire            id_fp_ctrl_id_stall;                  
wire            id_fp_ctrl_rs2_dep_ex1_dst;           
wire            id_fp_ctrl_rs2_stall_upd;             
wire            idu_cp0_ex1_cmplt_dp_sel;             
wire    [5 :0]  idu_cp0_ex1_dst_idx;                  
wire            idu_cp0_ex1_dst_vld;                  
wire            idu_cp0_ex1_expt_high;                
wire            idu_cp0_ex1_expt_type;                
wire            idu_cp0_ex1_expt_vld;                 
wire            idu_cp0_ex1_gateclk_sel;              
wire    [14:0]  idu_cp0_ex1_halt_info;                
wire            idu_cp0_ex1_inst_len;                 
wire            idu_cp0_ex1_sel;                      
wire            idu_ifu_id_stall;                     
wire            idu_iu_ex1_alu_cmplt_dp_sel;          
wire            idu_iu_ex1_alu_gateclk_sel;           
wire            idu_iu_ex1_alu_sel;                   
wire    [1 :0]  idu_iu_ex1_bht_pred;                  
wire            idu_iu_ex1_bju_cmplt_dp_sel;          
wire            idu_iu_ex1_bju_depd_lsu_src0;         
wire            idu_iu_ex1_bju_depd_lsu_src1;         
wire            idu_iu_ex1_bju_gateclk_sel;           
wire            idu_iu_ex1_bju_sel;                   
wire            idu_iu_ex1_bju_use_pc;                
wire            idu_iu_ex1_div_cmplt_dp_sel;          
wire            idu_iu_ex1_div_gateclk_sel;           
wire            idu_iu_ex1_div_sel;                   
wire    [5 :0]  idu_iu_ex1_dst_preg;                  
wire            idu_iu_ex1_gateclk_vld;               
wire            idu_iu_ex1_inst_len;                  
wire            idu_iu_ex1_inst_vld;                  
wire            idu_iu_ex1_mul_cmplt_dp_sel;          
wire            idu_iu_ex1_mul_gateclk_sel;           
wire            idu_iu_ex1_mul_sel;                   
wire            idu_iu_ex1_wb_vld;                    
wire            idu_lsu_ex1_base_sel;                 
wire    [5 :0]  idu_lsu_ex1_dest_reg;                 
wire            idu_lsu_ex1_dest_vld;                 
wire            idu_lsu_ex1_dp_sel;                   
wire            idu_lsu_ex1_fls;                      
wire            idu_lsu_ex1_gateclk_sel;              
wire    [14:0]  idu_lsu_ex1_halt_info;                
wire            idu_lsu_ex1_length;                   
wire            idu_lsu_ex1_sel;                      
wire            idu_lsu_ex1_src1_depd;                
wire            idu_misc_cpuclk;                      
wire            ifu_idu_id_expt_high;                 
wire            ifu_idu_id_expt_vld;                  
wire    [14:0]  ifu_idu_id_halt_info;                 
wire            ifu_idu_id_inst_vld;                  
wire    [1 :0]  ifu_idu_id_pred_taken;                
wire            ifu_idu_warm_up;                      
wire            iu_idu_bju_global_stall;              
wire            iu_idu_bju_stall;                     
wire            iu_idu_ex1_stall;                     
wire            iu_idu_id_stall;                      
wire            iu_xx_no_op;                          
wire            iu_yy_xx_cancel;                      
wire    [14:0]  lsu_idu_ex1_halt_info;                
wire            lsu_idu_ex1_halt_info_update_en;      
wire            lsu_idu_ex1_stall;                    
wire            lsu_idu_global_stall;                 
wire            lsu_xx_no_op;                         
wire            misc_icg_en;                          
wire            pad_yy_icg_scan_en;                   
wire            rtu_idu_ex1_int_dis_stall_gateclk_req; 
wire            rtu_idu_ex1_int_dis_stall_req;        
wire            rtu_idu_flush_fe;                     
wire            rtu_idu_flush_stall;                  
wire            rtu_idu_inst_retire;                  
wire            rtu_idu_late_flush;                   
wire            rtu_xx_ex1_stall;                     
wire            rtu_xx_no_op;                         
wire            rtu_yy_xx_flush;                      
wire            split_ctrl_cancel;                    
wire            split_ctrl_icg_en;                    
wire            split_ctrl_stall;                     


//==========================================================
// Control Flow Module
// 1. ICG Instance
// 2. ID Ctrl: depend and stall
// 2. EX1 instruction valid and unit sel
// 3. EX1 instruction destination 
// 4. EX1 exception information
//==========================================================

//-----------------------------------------------
// 1. ICG Instance
//-----------------------------------------------
// &Force("output", "idu_misc_cpuclk"); @40
assign ctrl_icg_en = ifu_idu_id_inst_vld 
                  | ctrl_ex1_inst_vld
                  | hs_ctrl_inst_vld;
// &Instance("gated_clk_cell", "x_idu_ctrl_icg_cell"); @44
gated_clk_cell  x_idu_ctrl_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_cpuclk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_icg_en       ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @45
//          .external_en (1'b0), @46
//          .global_en   (cp0_yy_clk_en), @47
//          .module_en ( cp0_idu_icg_en ) , @48
//          .local_en    (ctrl_icg_en), @49
//          .clk_out     (ctrl_cpuclk)); @50
assign misc_icg_en = ifu_idu_id_inst_vld & ctrl_id_expt_vld
                  | ctrl_ex1_expt_vld
                  | ctrl_ex1_int_stall
                  | ctrl_ex1_int_spec
                  | ctrl_ex1_fp_int_spec
                  | rtu_idu_ex1_int_dis_stall_gateclk_req
                  | split_ctrl_icg_en
                  | ifu_idu_warm_up;
// &Instance("gated_clk_cell", "x_idu_misc_icg_cell"); @59
gated_clk_cell  x_idu_misc_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (idu_misc_cpuclk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (misc_icg_en       ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @60
//          .external_en (1'b0), @61
//          .global_en   (cp0_yy_clk_en), @62
//          .module_en ( cp0_idu_icg_en ) , @63
//          .local_en    (misc_icg_en), @64
//          .clk_out     (idu_misc_cpuclk)); @65

//-----------------------------------------------
// 5. ID Control Flow
//-----------------------------------------------
assign ctrl_id_st_inst  = decd_ctrl_unit_sel[4] & ~decd_ctrl_rd1_vld;
assign ctrl_id_ld_inst  = decd_ctrl_unit_sel[4] & decd_ctrl_rd1_vld;
assign ctrl_id_div_inst = decd_ctrl_unit_sel[2] & decd_ctrl_rd1_vld;
assign ctrl_id_bju_inst = decd_ctrl_unit_sel[3] & decd_ctrl_id_func[1]; // Only condition branch.
// &Force("bus", "decd_ctrl_id_func", 4, 0); @74

// RS Normal RAW Stall: Depend Normal Inst and No fwd vld
assign ctrl_dep_norm_stall = dp_ctrl_rs_norm_stall & ctrl_id_inst_vld_fin;

// RS Load RAW Stall: 
// 1. BUSY_LSU1 & No LSU Fwd & Not BJU on RS/Not Store on RS2
// 2. BUSY_LSU2 & No Write back & No LSU Fwd & Not BJU on RS/Not Store on RS2
// RD Load WAW Stall: 
// 1. BUSY_LSU1 & No LSU Write Issue
// 2. BUSY_LSU2 & No Write back & No LSU Write Issue
assign ctrl_dep_ld_stall = (gpr_ctrl_rs1_busy_lsu & ~(ctrl_id_bju_inst & ~gpr_ctrl_rs1_busy_lsu2)
                         | gpr_ctrl_rs2_busy_lsu & ~(ctrl_id_bju_inst & ~gpr_ctrl_rs2_busy_lsu2)
                           & ~(ctrl_id_st_inst & ~decd_ctrl_str_vld & ~gpr_ctrl_rs2_busy_lsu2)
                         | gpr_ctrl_rs3_busy_lsu & ~(decd_ctrl_sti_vld & ~gpr_ctrl_rs3_busy_lsu2)
                         | gpr_ctrl_rs4_busy_lsu
                         | gpr_ctrl_rd1_busy_lsu
                         | gpr_ctrl_rd2_busy_lsu)
                         & ctrl_id_inst_vld_fin;

// RS DIV RAW Stall: 
// 1. BUSY_DIV1 & No Fwd
// 2. BUSY_DIV2 & No Write back & No Fwd
// RD DIV WAW Stall: 
// 1. BUSY_DIV1 & No DIV Write Issue
// 2. BUSY_DIV2 & No Write back & No DIV Write Issue
// Note: FPU write back int reg included in div situation
assign ctrl_dep_div_stall = (gpr_ctrl_rs1_busy_div
                          | gpr_ctrl_rs2_busy_div 
                          | gpr_ctrl_rs3_busy_div 
                          | gpr_ctrl_rs4_busy_div 
                          | gpr_ctrl_rd1_busy_div 
                          | gpr_ctrl_rd2_busy_div) & ctrl_id_inst_vld_fin;

// id cp0 fence stall, wait for all ex1 and ex2 empty
assign ctrl_fence_cp0_stall = ~(iu_xx_no_op & rtu_xx_no_op & lsu_xx_no_op
                            & fpu_xx_no_op)
                        & ctrl_id_inst_vld_fin & decd_ctrl_unit_sel[5];

// id inst bkpt fence stall, wait for all ex1 and ex2 empty
assign ctrl_fence_bkpt_stall = ~(iu_xx_no_op & rtu_xx_no_op & lsu_xx_no_op
                            & fpu_xx_no_op) & ifu_idu_id_halt_info[0]
                        & ctrl_id_inst_vld_fin & ~ifu_idu_id_expt_vld;

// id store rs2 depend load
assign ctrl_st_rs2_dep_vld = (gpr_ctrl_rs2_busy_lsu & ~dp_ctrl_rs2_fwd_lsu & ~gpr_ctrl_rs2_busy_lsu2
                            | ctrl_ex1_lsu_sel & dp_ctrl_rs2_dep_ex1_dst & ~ctrl_ex1_fls
                            & ctrl_ex1_dst_vld & ~dp_ctrl_ex1_ex_st_rs2_vld
                            | id_fp_ctrl_rs2_dep_ex1_dst)
                          & ctrl_id_st_inst & ctrl_id_inst_vld_fin & ~decd_ctrl_str_vld;

assign ctrl_st_rs3_dep_vld = (gpr_ctrl_rs3_busy_lsu & ~dp_ctrl_rs3_fwd_lsu & ~gpr_ctrl_rs3_busy_lsu2
                            | ctrl_ex1_lsu_sel & dp_ctrl_rs3_dep_ex1_dst & ~ctrl_ex1_fls
                            & ctrl_ex1_dst_vld & dp_ctrl_ex1_ex_st_rs2_vld
                            )
                          & ctrl_id_st_inst & ctrl_id_inst_vld_fin;
// id branch rs1/rs2 depend load
assign ctrl_bju_rs1_dep_vld = ctrl_ex1_lsu_sel & dp_ctrl_rs1_dep_ex1_dst & ~ctrl_ex1_fls
                           & ~dp_ctrl_ex1_st_vld
                          | gpr_ctrl_rs1_busy_lsu & ~dp_ctrl_rs1_fwd_lsu & ~gpr_ctrl_rs1_busy_lsu2;
assign ctrl_bju_rs2_dep_vld = ctrl_ex1_lsu_sel & dp_ctrl_rs2_dep_ex1_dst & ~ctrl_ex1_fls
                           & ~dp_ctrl_ex1_st_vld
                          | gpr_ctrl_rs2_busy_lsu & ~dp_ctrl_rs2_fwd_lsu & ~gpr_ctrl_rs2_busy_lsu2;

// stall from id stage inst itself
// RAW/WAW hazard
// CP0 fence
// inst bkpt fence
// rtu flush wait
assign ctrl_id_pipe_stall = ctrl_dep_norm_stall | ctrl_dep_ld_stall | ctrl_dep_div_stall
                          | ctrl_fence_cp0_stall | ctrl_fence_bkpt_stall | id_fp_ctrl_id_stall
                          | iu_idu_id_stall;

// Cancel ID stage inst when
// ID Pipe Stall
// Split/HS Cancel 
// 
assign ctrl_id_issue_cancel = (ctrl_id_pipe_stall | split_ctrl_cancel | hs_ctrl_cancel)
                           & ~ctrl_issue_stall;

// Mask EX1 inst vld when uncommit
assign ctrl_ex1_uncmit = rtu_xx_ex1_stall | lsu_idu_global_stall | iu_idu_bju_global_stall | ctrl_ex1_int_stall;

// EX1 Pipeline Hold stall
// Hold EX1 Pipeline when
// Uncommit
// EX1 internal stall form IU/CP0/FPU/INT
assign ctrl_issue_stall = ctrl_ex1_uncmit 
                        | iu_idu_ex1_stall | cp0_idu_ex1_stall | lsu_idu_ex1_stall
                        | fpu_idu_ex1_stall | rtu_idu_flush_stall;

assign ctrl_id_stall = ctrl_id_pipe_stall | ctrl_issue_stall;

assign ctrl_id_inst_flush = rtu_idu_flush_fe & ~rtu_idu_late_flush 
                          | iu_yy_xx_cancel | ctrl_id_issue_cancel;
assign ctrl_id_int_flush  = ctrl_ex1_int_stall | rtu_idu_ex1_int_dis_stall_req;
assign ctrl_id_flush      = ctrl_id_inst_flush | ctrl_id_int_flush;

assign ctrl_pipe_down = ctrl_id_inst_vld_fin & ~ctrl_issue_stall;

//-----------------------------------------------
// 2. EX1 instruction valid 
//-----------------------------------------------
assign ctrl_id_inst_vld_fin = ifu_idu_id_inst_vld | hs_ctrl_inst_vld;

always @ (posedge ctrl_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_inst_vld <= 1'b0;
  end
  else if(ctrl_id_flush)
  begin
    ctrl_ex1_inst_vld <= 1'b0;
  end
  else if(~ctrl_issue_stall)
  begin
    ctrl_ex1_inst_vld <= ctrl_id_inst_vld_fin;
  end
  else
  begin
    ctrl_ex1_inst_vld <= ctrl_ex1_inst_vld;
  end
end

assign ctrl_id_inst_vld = ifu_idu_id_inst_vld;
always @ (posedge ctrl_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_fp_inst_vld <= 1'b0;
  end
  else if(ctrl_id_flush)
  begin
    ctrl_ex1_fp_inst_vld <= 1'b0;
  end
  else if(~ctrl_issue_stall)
  begin
    ctrl_ex1_fp_inst_vld <= ctrl_id_inst_vld & fdecd_ctrl_fp_inst_vld & ~ctrl_id_inst_bkpt_vld;
  end
  else
  begin
    ctrl_ex1_fp_inst_vld <= ctrl_ex1_fp_inst_vld;
  end
end

assign ctrl_id_inst_bkpt_vld = ifu_idu_id_halt_info[0] & ~hs_ctrl_inst_vld;
assign ctrl_id_unit_sel[5:0] = (ctrl_id_expt_vld | ctrl_id_inst_bkpt_vld) ? 6'b100000
                             : decd_ctrl_unit_sel[5:0];

always @ (posedge ctrl_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_unit_sel[5:0] <= 6'b0;
    ctrl_ex1_inst_len      <= 1'b0;
    ctrl_ex1_bju_use_pc    <= 1'b0;
    // ctrl_ex1_dcache_pa     <= 1'b0;
    ctrl_ex1_fls           <= 1'b0;
  end
  else if(ctrl_pipe_down)
  begin
    ctrl_ex1_unit_sel[5:0] <= ctrl_id_unit_sel[5:0];
    ctrl_ex1_inst_len      <= decd_ctrl_inst_32bit;
    ctrl_ex1_bju_use_pc    <= decd_ctrl_bju_use_pc;
    // ctrl_ex1_dcache_pa     <= decd_ctrl_dcache_pa;
    ctrl_ex1_fls           <= fdecd_ctrl_fls;
  end
  else
  begin
    ctrl_ex1_unit_sel[5:0] <= ctrl_ex1_unit_sel[5:0];
    ctrl_ex1_inst_len      <= ctrl_ex1_inst_len;
    ctrl_ex1_bju_use_pc    <= ctrl_ex1_bju_use_pc;
    // ctrl_ex1_dcache_pa     <= ctrl_ex1_dcache_pa;
    ctrl_ex1_fls           <= ctrl_ex1_fls;
  end
end

//assign ctrl_ex1_alu_sel = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[0];
//assign ctrl_ex1_mul_sel = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[1];
assign ctrl_ex1_div_sel = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[2];
assign ctrl_ex1_bju_sel = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[3];
assign ctrl_ex1_lsu_sel = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[4];
assign ctrl_ex1_cp0_sel = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[5];
assign idu_cp0_ex1_gateclk_sel  = ctrl_ex1_cp0_sel;
assign idu_cp0_ex1_cmplt_dp_sel  = ctrl_ex1_cp0_sel & ~(lsu_idu_global_stall | iu_idu_bju_global_stall);
//assign idu_bju_ex1_gateclk_sel  = ctrl_ex1_bju_sel;
//-----------------------------------------------
// 3. EX1 instruction destination 
//-----------------------------------------------
always @ (posedge ctrl_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_dst_vld <= 1'b0;
  end
  else if(ctrl_pipe_down)
  begin
    ctrl_ex1_dst_vld <= (decd_ctrl_rd1_vld | fdecd_ctrl_dst_vld);
  end
  else
  begin
    ctrl_ex1_dst_vld <= ctrl_ex1_dst_vld;
  end
end

always @ (posedge ctrl_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_int_dst_vld <= 1'b0;
  end
  else if(ctrl_pipe_down)
  begin
    ctrl_ex1_int_dst_vld <= decd_ctrl_rd1_vld;
  end
  else
  begin
    ctrl_ex1_int_dst_vld <= ctrl_ex1_int_dst_vld;
  end
end

always @ (posedge ctrl_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_dst_idx[5:0] <= 6'b0;
  end
  else if(ctrl_pipe_down & (decd_ctrl_rd1_vld | fdecd_ctrl_dst_vld))
  begin
    ctrl_ex1_dst_idx[5:0] <= fdecd_ctrl_dst_vld ? fdecd_ctrl_dst_idx[5:0] : decd_ctrl_rd1[5:0];
  end
  else
  begin
    ctrl_ex1_dst_idx[5:0] <= ctrl_ex1_dst_idx[5:0];
  end
end

always @ (posedge ctrl_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_pred_taken[1:0] <= 2'b0;
  end
  else if(ctrl_pipe_down)
  begin
    ctrl_ex1_pred_taken[1:0] <= ifu_idu_id_pred_taken[1:0];
  end
  else
  begin
    ctrl_ex1_pred_taken[1:0] <= ctrl_ex1_pred_taken[1:0];
  end
end

always @ (posedge ctrl_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_halt_info[`TDT_HINFO_WIDTH-1:0]  <= {`TDT_HINFO_WIDTH{1'b0}};
  end
  else if(ctrl_pipe_down)
  begin
    ctrl_ex1_halt_info[`TDT_HINFO_WIDTH-1:0]  <= ~{`TDT_HINFO_WIDTH{hs_ctrl_inst_vld}} & ifu_idu_id_halt_info[`TDT_HINFO_WIDTH-1:0];
  end
  else if(lsu_idu_ex1_halt_info_update_en)
  begin
    ctrl_ex1_halt_info[`TDT_HINFO_WIDTH-1:0]  <= lsu_idu_ex1_halt_info[`TDT_HINFO_WIDTH-1:0];
  end
  else
  begin
    ctrl_ex1_halt_info[`TDT_HINFO_WIDTH-1:0]  <= ctrl_ex1_halt_info[`TDT_HINFO_WIDTH-1:0];
  end
end
//-----------------------------------------------
// 4. EX1 exception information
//-----------------------------------------------
assign ctrl_id_expt_vld = (decd_ctrl_ill_expt & ifu_idu_id_inst_vld | ifu_idu_id_expt_vld);

always @ (posedge idu_misc_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_expt_vld <= 1'b0;
  end
  else if(ctrl_pipe_down)
  begin
    ctrl_ex1_expt_vld <= ctrl_id_expt_vld;
  end
  else
  begin
    ctrl_ex1_expt_vld <= ctrl_ex1_expt_vld;
  end
end

always @ (posedge idu_misc_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_int_stall <= 1'b0;
  end
  else if(rtu_yy_xx_flush)
  begin
    ctrl_ex1_int_stall <= 1'b0;
  end
  else if(rtu_idu_ex1_int_dis_stall_req)
  begin
    ctrl_ex1_int_stall <= 1'b1;
  end
  else if(rtu_idu_inst_retire & ctrl_ex1_int_stall)
  begin
    ctrl_ex1_int_stall <= 1'b0;
  end
  else
  begin
    ctrl_ex1_int_stall <= ctrl_ex1_int_stall;
  end
end

assign ctrl_id_int_spec = ctrl_ex1_inst_vld & ctrl_ex1_int_dst_vld 
                        & (lsu_idu_global_stall | iu_idu_bju_global_stall);
always @ (posedge idu_misc_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_int_spec <= 1'b0;
  end
  else if(rtu_yy_xx_flush)
  begin
    ctrl_ex1_int_spec <= 1'b0;
  end
  else if(rtu_idu_ex1_int_dis_stall_req)
  begin
    ctrl_ex1_int_spec <= ctrl_id_int_spec;
  end
  else if(rtu_idu_inst_retire & ctrl_ex1_int_spec)
  begin
    ctrl_ex1_int_spec <= 1'b0;
  end
  else
  begin
    ctrl_ex1_int_spec <= ctrl_ex1_int_spec;
  end
end
assign ctrl_id_fp_int_spec = ctrl_ex1_inst_vld 
                        & (ctrl_ex1_dst_vld & ~ctrl_ex1_int_dst_vld)
                        & (lsu_idu_global_stall | iu_idu_bju_global_stall);
always @ (posedge idu_misc_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_fp_int_spec <= 1'b0;
  end
  else if(rtu_yy_xx_flush)
  begin
    ctrl_ex1_fp_int_spec <= 1'b0;
  end
  else if(rtu_idu_ex1_int_dis_stall_req)
  begin
    ctrl_ex1_fp_int_spec <= ctrl_id_fp_int_spec;
  end
  else if(rtu_idu_inst_retire & ctrl_ex1_fp_int_spec)
  begin
    ctrl_ex1_fp_int_spec <= 1'b0;
  end
  else
  begin
    ctrl_ex1_fp_int_spec <= ctrl_ex1_fp_int_spec;
  end
end

// expt type, 1 for inst acc fault, 0 for illegal inst
assign ctrl_id_expt_type = ifu_idu_id_expt_vld;

always @ (posedge idu_misc_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_expt_type <= 1'b0;
  end
  else if(ctrl_pipe_down & ctrl_id_expt_vld)
  begin
    ctrl_ex1_expt_type <= ctrl_id_expt_type;
  end
  else
  begin
    ctrl_ex1_expt_type <= ctrl_ex1_expt_type;
  end
end

always @ (posedge idu_misc_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_expt_high <= 1'b0;
  end
  else if(ctrl_pipe_down & ctrl_id_expt_vld)
  begin
    ctrl_ex1_expt_high <= ifu_idu_id_expt_high;
  end
  else
  begin
    ctrl_ex1_expt_high <= ctrl_ex1_expt_high;
  end
end

always @ (posedge ctrl_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_rs2_dep <= 1'b0;
  end
  else if(ctrl_pipe_down & decd_ctrl_unit_sel[4])
  begin
    ctrl_ex1_rs2_dep <= ctrl_st_rs2_dep_vld | ctrl_st_rs3_dep_vld;
  end
  else if(ctrl_pipe_down & ctrl_id_unit_sel[3])
  begin
    ctrl_ex1_rs2_dep <= ctrl_bju_rs2_dep_vld;
  end
  else if(dp_ctrl_rs2_stall_upd | dp_ctrl_rs3_stall_upd | id_fp_ctrl_rs2_stall_upd)
  begin
    ctrl_ex1_rs2_dep <= 1'b0;
  end
  else
  begin
    ctrl_ex1_rs2_dep <= ctrl_ex1_rs2_dep;
  end
end

always @ (posedge ctrl_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    ctrl_ex1_bju_rs1_dep <= 1'b0;
  end
  else if(ctrl_pipe_down & decd_ctrl_unit_sel[3])
  begin
    ctrl_ex1_bju_rs1_dep <= ctrl_bju_rs1_dep_vld;
  end
  else if(dp_ctrl_rs1_stall_upd)
  begin
    ctrl_ex1_bju_rs1_dep <= 1'b0;
  end
  else
  begin
    ctrl_ex1_bju_rs1_dep <= ctrl_ex1_bju_rs1_dep;
  end
end

//==========================================================
// Rename for Output
//==========================================================

//-----------------------------------------------
// Output to IDU dp
//-----------------------------------------------
assign ctrl_dp_pipe_down         = ctrl_id_inst_vld_fin & ~ctrl_issue_stall;
assign ctrl_dp_pipe_down_gate    = ctrl_id_inst_vld_fin;
assign ctrl_dp_ex1_dst_preg[5:0] = ctrl_ex1_dst_idx[5:0];
assign ctrl_dp_ex1_inst_vld      = ctrl_ex1_inst_vld;
assign ctrl_dp_ex1_dst_vld       = ctrl_ex1_inst_vld & ctrl_ex1_int_dst_vld;
assign ctrl_dp_ex1_bju_sel       = ctrl_ex1_bju_sel;
assign ctrl_dp_ex1_div_sel       = ctrl_ex1_div_sel;
assign ctrl_dp_ex1_st_sel        = ctrl_ex1_lsu_sel & ~ctrl_ex1_dst_vld & ~ctrl_ex1_fls;
assign ctrl_dp_ex1_lsu_sel       = ctrl_ex1_lsu_sel;
assign ctrl_dp_ex1_rs1_dep       = ctrl_ex1_bju_rs1_dep;
assign ctrl_dp_ex1_rs2_dep       = ctrl_ex1_rs2_dep;

// to gpr
assign ctrl_gpr_id_rd1_vld       = ctrl_id_inst_vld_fin & decd_ctrl_rd1_vld;
assign ctrl_gpr_id_rd2_vld       = ctrl_id_inst_vld_fin & decd_ctrl_rd2_vld;
assign ctrl_gpr_wr_issue1        = ctrl_pipe_down & decd_ctrl_rd1_vld
                              & ~(ctrl_id_inst_flush | ctrl_ex1_int_stall | ctrl_id_stall);
//assign ctrl_gpr_wr_issue2        = ctrl_pipe_down & decd_ctrl_rd2_vld
//                              & ~(ctrl_id_inst_flush | ctrl_ex1_int_stall | ctrl_id_stall);
assign ctrl_gpr_id_wr_idx1[5:0]   = decd_ctrl_rd1[5:0];
assign ctrl_gpr_id_wr_idx2[5:0]   = decd_ctrl_rd2[5:0];
assign ctrl_gpr_ex1_int_spec      = ctrl_ex1_int_spec;
assign ctrl_gpr_ex1_dst_preg[4:0] = ctrl_ex1_dst_idx[4:0];
assign ctrl_gpr_ld_inst          = ctrl_id_ld_inst;
assign ctrl_gpr_div_inst         = ctrl_id_div_inst | fdecd_ctrl_int_dst_vld;

assign ctrl_id_fp_pipe_down    = ctrl_id_inst_vld & ~ctrl_issue_stall;
assign ctrl_id_fp_id_stall     = ctrl_id_stall;
assign ctrl_id_fp_uncmit       = ctrl_ex1_uncmit;
assign ctrl_id_fp_id_expt_vld  = ctrl_id_expt_vld;
assign ctrl_id_fp_id_inst_vld  = ctrl_id_inst_vld;
assign ctrl_id_fp_ex1_inst_vld = ctrl_ex1_fp_inst_vld;
assign ctrl_id_fp_ex1_lsu_sel  = ctrl_ex1_lsu_sel & ctrl_ex1_fls;
assign ctrl_id_fp_st_rs2_dep   = ctrl_ex1_rs2_dep;
assign ctrl_top_ex1_fp_vld   = ctrl_ex1_fp_inst_vld;
assign ctrl_fpr_ex1_int_spec   = ctrl_ex1_fp_int_spec;

assign ctrl_split_stall = ctrl_id_stall | rtu_idu_ex1_int_dis_stall_req;
assign ctrl_hs_stall    = ctrl_id_stall | rtu_idu_ex1_int_dis_stall_req;
//assign ctrl_hs_flush    = ctrl_id_inst_flush & !hs_ctrl_cancel;
assign ctrl_hs_no_op   = iu_xx_no_op & lsu_xx_no_op & fpu_xx_no_op;
assign ctrl_hs_be_idle = iu_xx_no_op & rtu_xx_no_op & lsu_xx_no_op & fpu_xx_no_op;
assign ctrl_hs_bkpt_vld = ifu_idu_id_halt_info[0];
assign ctrl_split_bkpt_vld = ifu_idu_id_halt_info[0];

// Output to top
assign ctrl_top_id_inst_vld  = ctrl_id_inst_vld_fin;
assign ctrl_top_norm_stall   = ctrl_dep_norm_stall;
assign ctrl_top_ld_stall     = ctrl_dep_ld_stall;
assign ctrl_top_div_stall    = ctrl_dep_div_stall;
assign ctrl_top_cp0_stall    = ctrl_fence_cp0_stall;
assign ctrl_top_st_dep_vld   = ctrl_st_rs2_dep_vld;
assign ctrl_top_bju_dep1_vld = ctrl_bju_rs1_dep_vld;
assign ctrl_top_bju_dep2_vld = ctrl_bju_rs2_dep_vld;
assign ctrl_top_ex1_sel[5:0] = ctrl_ex1_unit_sel[5:0];
assign ctrl_top_id_cancel    = rtu_idu_flush_fe;
assign ctrl_top_id_stall     = 1'b0;
assign ctrl_top_ex1_stall    = ctrl_ex1_uncmit;
assign ctrl_top_ex1_vld      = ctrl_ex1_inst_vld;

//-----------------------------------------------
// Output to IFU
//-----------------------------------------------
assign idu_ifu_id_stall = (ctrl_id_stall | split_ctrl_stall | hs_ctrl_stall) & ctrl_id_inst_vld_fin;
//assign idu_ifu_ex1_inst_len = ctrl_ex1_inst_len;

//-----------------------------------------------
// Output to IU
//-----------------------------------------------
assign idu_iu_ex1_inst_vld     = ctrl_ex1_inst_vld & ~ctrl_ex1_uncmit;
assign idu_iu_ex1_gateclk_vld  = ctrl_ex1_inst_vld;
assign idu_iu_ex1_inst_len     = ctrl_ex1_inst_len;

assign idu_iu_ex1_alu_sel      = ctrl_ex1_unit_sel[0];
assign idu_iu_ex1_mul_sel      = ctrl_ex1_unit_sel[1];
assign idu_iu_ex1_div_sel      = ctrl_ex1_unit_sel[2];
assign idu_iu_ex1_bju_sel      = ctrl_ex1_unit_sel[3] & ~iu_idu_bju_stall;
assign idu_iu_ex1_alu_gateclk_sel  = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[0];
assign idu_iu_ex1_mul_gateclk_sel  = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[1];
assign idu_iu_ex1_div_gateclk_sel  = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[2];
assign idu_iu_ex1_bju_gateclk_sel  = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[3];
assign idu_iu_ex1_alu_cmplt_dp_sel = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[0] & ~(lsu_idu_global_stall | iu_idu_bju_global_stall);
assign idu_iu_ex1_mul_cmplt_dp_sel = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[1] & ~(lsu_idu_global_stall | iu_idu_bju_global_stall);
assign idu_iu_ex1_div_cmplt_dp_sel = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[2] & ~(lsu_idu_global_stall | iu_idu_bju_global_stall);
assign idu_iu_ex1_bju_cmplt_dp_sel = ctrl_ex1_inst_vld & ctrl_ex1_unit_sel[3] & ~(lsu_idu_global_stall | iu_idu_bju_global_stall) & ~iu_idu_bju_stall;

assign idu_iu_ex1_wb_vld        = ctrl_ex1_dst_vld;
assign idu_iu_ex1_dst_preg[5:0] = ctrl_ex1_dst_idx[5:0];

assign idu_iu_ex1_bht_pred[1:0] = ctrl_ex1_pred_taken[1:0];

assign idu_iu_ex1_bju_depd_lsu_src0 = ctrl_ex1_bju_rs1_dep;
assign idu_iu_ex1_bju_depd_lsu_src1 = ctrl_ex1_rs2_dep;

assign idu_iu_ex1_bju_use_pc    = ctrl_ex1_bju_use_pc;
// assign idu_iu_ex1_dcache_pa     = ctrl_ex1_dcache_pa;
//-----------------------------------------------
// Output to LSU
//-----------------------------------------------
assign idu_lsu_ex1_sel           = ctrl_ex1_lsu_sel & ~ctrl_ex1_uncmit;
assign idu_lsu_ex1_dp_sel        = ctrl_ex1_lsu_sel & ~(lsu_idu_global_stall | iu_idu_bju_global_stall);
assign idu_lsu_ex1_gateclk_sel   = ctrl_ex1_lsu_sel;
assign idu_lsu_ex1_length       = ctrl_ex1_inst_len;
assign idu_lsu_ex1_base_sel      = ctrl_ex1_unit_sel[4];
assign idu_lsu_ex1_src1_depd     = ctrl_ex1_rs2_dep;
assign idu_lsu_ex1_dest_vld      = ctrl_ex1_dst_vld;
assign idu_lsu_ex1_dest_reg[5:0] = ctrl_ex1_dst_idx[5:0];
assign idu_lsu_ex1_halt_info[`TDT_HINFO_WIDTH-1:0] = ctrl_ex1_halt_info[`TDT_HINFO_WIDTH-1:0];
assign idu_lsu_ex1_fls           = ctrl_ex1_fls;
assign ctrl_dp_ex1_fls           = ctrl_ex1_fls;

//-----------------------------------------------
// Output to CP0
//-----------------------------------------------
assign idu_cp0_ex1_sel         = ctrl_ex1_cp0_sel & ~ctrl_ex1_uncmit;

assign idu_cp0_ex1_inst_len    = ctrl_ex1_inst_len;
assign idu_cp0_ex1_expt_vld    = ctrl_ex1_expt_vld;
assign idu_cp0_ex1_expt_type   = ctrl_ex1_expt_type;
assign idu_cp0_ex1_expt_high   = ctrl_ex1_expt_high;
assign idu_cp0_ex1_halt_info[`TDT_HINFO_WIDTH-1:0] = ctrl_ex1_halt_info[`TDT_HINFO_WIDTH-1:0];

assign idu_cp0_ex1_dst_vld      = ctrl_ex1_dst_vld;
assign idu_cp0_ex1_dst_idx[5:0] = ctrl_ex1_dst_idx[5:0];


// &Force("output", "ctrl_id_inst_vld_fin"); @682
// &ModuleEnd; @684
endmodule


