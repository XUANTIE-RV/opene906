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

// &Depend("pa_idu_cfig.h"); @23
// &ModuleBeg; @24
module pa_idu_top(
  cp0_idu_ex1_stall,
  cp0_idu_fs,
  cp0_idu_icg_en,
  cp0_idu_mcause,
  cp0_idu_mepc,
  cp0_idu_rm,
  cp0_idu_sp_use_scratch,
  cp0_idu_sp_wdata,
  cp0_idu_sp_wen,
  cp0_idu_sp_wen_gate,
  cp0_idu_spec_push_en,
  cp0_idu_swap_sp_en,
  cp0_yy_clk_en,
  cp0_yy_cskyisaee,
  cp0_yy_mach_mode,
  cpurst_b,
  forever_cpuclk,
  fpu_idu_ex1_stall,
  fpu_idu_fwd_data,
  fpu_idu_fwd_freg,
  fpu_idu_fwd_vld,
  fpu_xx_no_op,
  idu_cp0_ex1_cmplt_dp_sel,
  idu_cp0_ex1_dst_idx,
  idu_cp0_ex1_dst_vld,
  idu_cp0_ex1_expt_high,
  idu_cp0_ex1_expt_type,
  idu_cp0_ex1_expt_vld,
  idu_cp0_ex1_func,
  idu_cp0_ex1_gateclk_sel,
  idu_cp0_ex1_halt_info,
  idu_cp0_ex1_inst_len,
  idu_cp0_ex1_ipush_spec_fail,
  idu_cp0_ex1_opcode,
  idu_cp0_ex1_rs1,
  idu_cp0_ex1_rs2,
  idu_cp0_ex1_sel,
  idu_cp0_ex1_split_inst,
  idu_cp0_ex1_tail_fail,
  idu_cp0_id_tail_vld,
  idu_cp0_ipop_data,
  idu_cp0_mcause_wen,
  idu_cp0_mepc_wen,
  idu_cp0_sp_reg,
  idu_cp0_sp_swap_pending,
  idu_cp0_sp_swap_req,
  idu_cp0_sp_swap_req_gate,
  idu_dtu_debug_info,
  idu_dtu_fpr_info,
  idu_fpu_ex1_cmplt_dp_sel,
  idu_fpu_ex1_dst_freg,
  idu_fpu_ex1_dst_freg_vld,
  idu_fpu_ex1_dst_preg,
  idu_fpu_ex1_eu_sel,
  idu_fpu_ex1_func,
  idu_fpu_ex1_gateclk_vld,
  idu_fpu_ex1_inst_vld,
  idu_fpu_ex1_rm,
  idu_fpu_ex1_srcf0,
  idu_fpu_ex1_srcf1,
  idu_fpu_ex1_srcf2,
  idu_fpu_ex1_srci,
  idu_ifu_id_stall,
  idu_ifu_tail_vld,
  idu_ifu_tail_vld_gate,
  idu_ifu_x1,
  idu_iu_ex1_ag_imm,
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
  idu_iu_ex1_func,
  idu_iu_ex1_gateclk_vld,
  idu_iu_ex1_inst_len,
  idu_iu_ex1_inst_vld,
  idu_iu_ex1_ipop_int_mask,
  idu_iu_ex1_ipush_mie_en,
  idu_iu_ex1_ipush_spec_fail,
  idu_iu_ex1_mul_cmplt_dp_sel,
  idu_iu_ex1_mul_gateclk_sel,
  idu_iu_ex1_mul_high_sel,
  idu_iu_ex1_mul_sel,
  idu_iu_ex1_rd_pair,
  idu_iu_ex1_split,
  idu_iu_ex1_src0,
  idu_iu_ex1_src0_reg,
  idu_iu_ex1_src1,
  idu_iu_ex1_src1_reg,
  idu_iu_ex1_src2,
  idu_iu_ex1_tail_int_vld,
  idu_iu_ex1_wb_vld,
  idu_iu_tail_fail,
  idu_iu_tail_fail_gate,
  idu_lsu_ex1_ag_imm,
  idu_lsu_ex1_base,
  idu_lsu_ex1_base_sel,
  idu_lsu_ex1_base_wb,
  idu_lsu_ex1_data,
  idu_lsu_ex1_dest_reg,
  idu_lsu_ex1_dest_vld,
  idu_lsu_ex1_dp_sel,
  idu_lsu_ex1_fls,
  idu_lsu_ex1_func,
  idu_lsu_ex1_gateclk_sel,
  idu_lsu_ex1_halt_info,
  idu_lsu_ex1_ipop_int_mask,
  idu_lsu_ex1_ipush_spec,
  idu_lsu_ex1_length,
  idu_lsu_ex1_offset_sel,
  idu_lsu_ex1_sel,
  idu_lsu_ex1_sign_extend,
  idu_lsu_ex1_size,
  idu_lsu_ex1_split,
  idu_lsu_ex1_src0_reg,
  idu_lsu_ex1_src1_depd,
  idu_lsu_ex1_src1_reg,
  idu_yy_xx_tail_ack,
  ifu_idu_chgflw_flush,
  ifu_idu_id_expt_high,
  ifu_idu_id_expt_vld,
  ifu_idu_id_halt_info,
  ifu_idu_id_inst,
  ifu_idu_id_inst_vld,
  ifu_idu_id_pred_taken,
  ifu_idu_warm_up,
  iu_idu_bju_global_stall,
  iu_idu_bju_stall,
  iu_idu_ex1_fwd_data,
  iu_idu_ex1_fwd_preg,
  iu_idu_ex1_fwd_vld,
  iu_idu_ex1_src1_update_value,
  iu_idu_ex1_stall,
  iu_idu_ex2_div_vld,
  iu_idu_ex2_fwd_data0,
  iu_idu_ex2_fwd_data1,
  iu_idu_ex2_fwd_preg0,
  iu_idu_ex2_fwd_preg1,
  iu_idu_ex2_fwd_vld0,
  iu_idu_ex2_fwd_vld1,
  iu_idu_ex2_inst_vld,
  iu_idu_ex2_rd_pair,
  iu_idu_id_stall,
  iu_xx_no_op,
  iu_yy_xx_cancel,
  lsu_idu_ex1_halt_info,
  lsu_idu_ex1_halt_info_update_en,
  lsu_idu_ex1_src1_update_en,
  lsu_idu_ex1_src1_update_en_gate,
  lsu_idu_ex1_stall,
  lsu_idu_ex2_ffwd_data,
  lsu_idu_ex2_ffwd_vld,
  lsu_idu_ex2_fwd_data,
  lsu_idu_ex2_fwd_freg,
  lsu_idu_ex2_fwd_preg,
  lsu_idu_ex2_fwd_vld,
  lsu_idu_ex3_ffwd_data,
  lsu_idu_ex3_ffwd_vld,
  lsu_idu_ex3_fwd_data,
  lsu_idu_ex3_fwd_freg,
  lsu_idu_ex3_fwd_preg,
  lsu_idu_ex3_fwd_vld,
  lsu_idu_global_stall,
  lsu_idu_update_addr,
  lsu_idu_update_en,
  lsu_idu_update_en_gate,
  lsu_idu_update_offset,
  lsu_xx_no_op,
  pad_yy_icg_scan_en,
  rtu_idu_ex1_int_dis_stall_gateclk_req,
  rtu_idu_ex1_int_dis_stall_req,
  rtu_idu_ex2_ipush_spec_inst_expt_vld,
  rtu_idu_ex2_ipush_spec_inst_halt_info_vld,
  rtu_idu_fgpr_wb_data,
  rtu_idu_fgpr_wb_flsu_vld,
  rtu_idu_fgpr_wb_reg,
  rtu_idu_fgpr_wb_vld,
  rtu_idu_flush_fe,
  rtu_idu_flush_stall,
  rtu_idu_id_tail_int_vld,
  rtu_idu_inst_retire,
  rtu_idu_late_flush,
  rtu_idu_wb0_data,
  rtu_idu_wb0_fpu_vld,
  rtu_idu_wb0_preg,
  rtu_idu_wb0_vld,
  rtu_idu_wb1_data,
  rtu_idu_wb1_lsu_vld,
  rtu_idu_wb1_preg,
  rtu_idu_wb1_vld,
  rtu_idu_wb2_data,
  rtu_idu_wb2_preg,
  rtu_idu_wb2_vld,
  rtu_xx_ex1_stall,
  rtu_xx_no_op,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vld,
  rtu_yy_xx_flush
);

// &Ports; @25
input           cp0_idu_ex1_stall;                        
input   [1 :0]  cp0_idu_fs;                               
input           cp0_idu_icg_en;                           
input   [31:0]  cp0_idu_mcause;                           
input   [31:0]  cp0_idu_mepc;                             
input   [2 :0]  cp0_idu_rm;                               
input           cp0_idu_sp_use_scratch;                   
input   [31:0]  cp0_idu_sp_wdata;                         
input           cp0_idu_sp_wen;                           
input           cp0_idu_sp_wen_gate;                      
input           cp0_idu_spec_push_en;                     
input           cp0_idu_swap_sp_en;                       
input           cp0_yy_clk_en;                            
input           cp0_yy_cskyisaee;                         
input           cp0_yy_mach_mode;                         
input           cpurst_b;                                 
input           forever_cpuclk;                           
input           fpu_idu_ex1_stall;                        
input   [31:0]  fpu_idu_fwd_data;                         
input   [4 :0]  fpu_idu_fwd_freg;                         
input           fpu_idu_fwd_vld;                          
input           fpu_xx_no_op;                             
input           ifu_idu_chgflw_flush;                     
input           ifu_idu_id_expt_high;                     
input           ifu_idu_id_expt_vld;                      
input   [14:0]  ifu_idu_id_halt_info;                     
input   [31:0]  ifu_idu_id_inst;                          
input           ifu_idu_id_inst_vld;                      
input   [1 :0]  ifu_idu_id_pred_taken;                    
input           ifu_idu_warm_up;                          
input           iu_idu_bju_global_stall;                  
input           iu_idu_bju_stall;                         
input   [31:0]  iu_idu_ex1_fwd_data;                      
input   [5 :0]  iu_idu_ex1_fwd_preg;                      
input           iu_idu_ex1_fwd_vld;                       
input   [31:0]  iu_idu_ex1_src1_update_value;             
input           iu_idu_ex1_stall;                         
input           iu_idu_ex2_div_vld;                       
input   [31:0]  iu_idu_ex2_fwd_data0;                     
input   [31:0]  iu_idu_ex2_fwd_data1;                     
input   [5 :0]  iu_idu_ex2_fwd_preg0;                     
input   [5 :0]  iu_idu_ex2_fwd_preg1;                     
input           iu_idu_ex2_fwd_vld0;                      
input           iu_idu_ex2_fwd_vld1;                      
input           iu_idu_ex2_inst_vld;                      
input           iu_idu_ex2_rd_pair;                       
input           iu_idu_id_stall;                          
input           iu_xx_no_op;                              
input           iu_yy_xx_cancel;                          
input   [14:0]  lsu_idu_ex1_halt_info;                    
input           lsu_idu_ex1_halt_info_update_en;          
input           lsu_idu_ex1_src1_update_en;               
input           lsu_idu_ex1_src1_update_en_gate;          
input           lsu_idu_ex1_stall;                        
input   [31:0]  lsu_idu_ex2_ffwd_data;                    
input           lsu_idu_ex2_ffwd_vld;                     
input   [31:0]  lsu_idu_ex2_fwd_data;                     
input   [4 :0]  lsu_idu_ex2_fwd_freg;                     
input   [5 :0]  lsu_idu_ex2_fwd_preg;                     
input           lsu_idu_ex2_fwd_vld;                      
input   [31:0]  lsu_idu_ex3_ffwd_data;                    
input           lsu_idu_ex3_ffwd_vld;                     
input   [31:0]  lsu_idu_ex3_fwd_data;                     
input   [4 :0]  lsu_idu_ex3_fwd_freg;                     
input   [5 :0]  lsu_idu_ex3_fwd_preg;                     
input           lsu_idu_ex3_fwd_vld;                      
input           lsu_idu_global_stall;                     
input   [31:0]  lsu_idu_update_addr;                      
input           lsu_idu_update_en;                        
input           lsu_idu_update_en_gate;                   
input   [31:0]  lsu_idu_update_offset;                    
input           lsu_xx_no_op;                             
input           pad_yy_icg_scan_en;                       
input           rtu_idu_ex1_int_dis_stall_gateclk_req;    
input           rtu_idu_ex1_int_dis_stall_req;            
input           rtu_idu_ex2_ipush_spec_inst_expt_vld;     
input           rtu_idu_ex2_ipush_spec_inst_halt_info_vld; 
input   [31:0]  rtu_idu_fgpr_wb_data;                     
input           rtu_idu_fgpr_wb_flsu_vld;                 
input   [4 :0]  rtu_idu_fgpr_wb_reg;                      
input           rtu_idu_fgpr_wb_vld;                      
input           rtu_idu_flush_fe;                         
input           rtu_idu_flush_stall;                      
input           rtu_idu_id_tail_int_vld;                  
input           rtu_idu_inst_retire;                      
input           rtu_idu_late_flush;                       
input   [31:0]  rtu_idu_wb0_data;                         
input           rtu_idu_wb0_fpu_vld;                      
input   [5 :0]  rtu_idu_wb0_preg;                         
input           rtu_idu_wb0_vld;                          
input   [31:0]  rtu_idu_wb1_data;                         
input           rtu_idu_wb1_lsu_vld;                      
input   [5 :0]  rtu_idu_wb1_preg;                         
input           rtu_idu_wb1_vld;                          
input   [31:0]  rtu_idu_wb2_data;                         
input   [5 :0]  rtu_idu_wb2_preg;                         
input           rtu_idu_wb2_vld;                          
input           rtu_xx_ex1_stall;                         
input           rtu_xx_no_op;                             
input           rtu_yy_xx_dbgon;                          
input           rtu_yy_xx_expt_int;                       
input           rtu_yy_xx_expt_vld;                       
input           rtu_yy_xx_flush;                          
output          idu_cp0_ex1_cmplt_dp_sel;                 
output  [5 :0]  idu_cp0_ex1_dst_idx;                      
output          idu_cp0_ex1_dst_vld;                      
output          idu_cp0_ex1_expt_high;                    
output          idu_cp0_ex1_expt_type;                    
output          idu_cp0_ex1_expt_vld;                     
output  [19:0]  idu_cp0_ex1_func;                         
output          idu_cp0_ex1_gateclk_sel;                  
output  [14:0]  idu_cp0_ex1_halt_info;                    
output          idu_cp0_ex1_inst_len;                     
output          idu_cp0_ex1_ipush_spec_fail;              
output  [31:0]  idu_cp0_ex1_opcode;                       
output  [31:0]  idu_cp0_ex1_rs1;                          
output  [11:0]  idu_cp0_ex1_rs2;                          
output          idu_cp0_ex1_sel;                          
output          idu_cp0_ex1_split_inst;                   
output          idu_cp0_ex1_tail_fail;                    
output          idu_cp0_id_tail_vld;                      
output  [31:0]  idu_cp0_ipop_data;                        
output          idu_cp0_mcause_wen;                       
output          idu_cp0_mepc_wen;                         
output  [31:0]  idu_cp0_sp_reg;                           
output          idu_cp0_sp_swap_pending;                  
output          idu_cp0_sp_swap_req;                      
output          idu_cp0_sp_swap_req_gate;                 
output  [21:0]  idu_dtu_debug_info;                       
output  [95:0]  idu_dtu_fpr_info;                         
output          idu_fpu_ex1_cmplt_dp_sel;                 
output  [4 :0]  idu_fpu_ex1_dst_freg;                     
output          idu_fpu_ex1_dst_freg_vld;                 
output  [4 :0]  idu_fpu_ex1_dst_preg;                     
output  [2 :0]  idu_fpu_ex1_eu_sel;                       
output  [9 :0]  idu_fpu_ex1_func;                         
output          idu_fpu_ex1_gateclk_vld;                  
output          idu_fpu_ex1_inst_vld;                     
output  [2 :0]  idu_fpu_ex1_rm;                           
output  [31:0]  idu_fpu_ex1_srcf0;                        
output  [31:0]  idu_fpu_ex1_srcf1;                        
output  [31:0]  idu_fpu_ex1_srcf2;                        
output  [31:0]  idu_fpu_ex1_srci;                         
output          idu_ifu_id_stall;                         
output          idu_ifu_tail_vld;                         
output          idu_ifu_tail_vld_gate;                    
output  [31:0]  idu_ifu_x1;                               
output  [31:0]  idu_iu_ex1_ag_imm;                        
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
output  [19:0]  idu_iu_ex1_func;                          
output          idu_iu_ex1_gateclk_vld;                   
output          idu_iu_ex1_inst_len;                      
output          idu_iu_ex1_inst_vld;                      
output          idu_iu_ex1_ipop_int_mask;                 
output          idu_iu_ex1_ipush_mie_en;                  
output          idu_iu_ex1_ipush_spec_fail;               
output          idu_iu_ex1_mul_cmplt_dp_sel;              
output          idu_iu_ex1_mul_gateclk_sel;               
output          idu_iu_ex1_mul_high_sel;                  
output          idu_iu_ex1_mul_sel;                       
output          idu_iu_ex1_rd_pair;                       
output          idu_iu_ex1_split;                         
output  [31:0]  idu_iu_ex1_src0;                          
output  [5 :0]  idu_iu_ex1_src0_reg;                      
output  [31:0]  idu_iu_ex1_src1;                          
output  [5 :0]  idu_iu_ex1_src1_reg;                      
output  [31:0]  idu_iu_ex1_src2;                          
output          idu_iu_ex1_tail_int_vld;                  
output          idu_iu_ex1_wb_vld;                        
output          idu_iu_tail_fail;                         
output          idu_iu_tail_fail_gate;                    
output  [31:0]  idu_lsu_ex1_ag_imm;                       
output  [31:0]  idu_lsu_ex1_base;                         
output          idu_lsu_ex1_base_sel;                     
output          idu_lsu_ex1_base_wb;                      
output  [31:0]  idu_lsu_ex1_data;                         
output  [5 :0]  idu_lsu_ex1_dest_reg;                     
output          idu_lsu_ex1_dest_vld;                     
output          idu_lsu_ex1_dp_sel;                       
output          idu_lsu_ex1_fls;                          
output  [3 :0]  idu_lsu_ex1_func;                         
output          idu_lsu_ex1_gateclk_sel;                  
output  [14:0]  idu_lsu_ex1_halt_info;                    
output          idu_lsu_ex1_ipop_int_mask;                
output          idu_lsu_ex1_ipush_spec;                   
output          idu_lsu_ex1_length;                       
output          idu_lsu_ex1_offset_sel;                   
output          idu_lsu_ex1_sel;                          
output          idu_lsu_ex1_sign_extend;                  
output  [1 :0]  idu_lsu_ex1_size;                         
output          idu_lsu_ex1_split;                        
output  [5 :0]  idu_lsu_ex1_src0_reg;                     
output          idu_lsu_ex1_src1_depd;                    
output  [5 :0]  idu_lsu_ex1_src1_reg;                     
output          idu_yy_xx_tail_ack;                       

// &Regs; @26

// &Wires; @27
wire            cp0_idu_ex1_stall;                        
wire    [1 :0]  cp0_idu_fs;                               
wire            cp0_idu_icg_en;                           
wire    [31:0]  cp0_idu_mcause;                           
wire    [31:0]  cp0_idu_mepc;                             
wire    [2 :0]  cp0_idu_rm;                               
wire            cp0_idu_sp_use_scratch;                   
wire    [31:0]  cp0_idu_sp_wdata;                         
wire            cp0_idu_sp_wen;                           
wire            cp0_idu_sp_wen_gate;                      
wire            cp0_idu_spec_push_en;                     
wire            cp0_idu_swap_sp_en;                       
wire            cp0_yy_clk_en;                            
wire            cp0_yy_cskyisaee;                         
wire            cp0_yy_mach_mode;                         
wire            cpurst_b;                                 
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
wire            ctrl_id_fp_ex1_inst_vld;                  
wire            ctrl_id_fp_ex1_lsu_sel;                   
wire            ctrl_id_fp_id_expt_vld;                   
wire            ctrl_id_fp_id_inst_vld;                   
wire            ctrl_id_fp_id_stall;                      
wire            ctrl_id_fp_pipe_down;                     
wire            ctrl_id_fp_st_rs2_dep;                    
wire            ctrl_id_fp_uncmit;                        
wire            ctrl_split_bkpt_vld;                      
wire            ctrl_split_stall;                         
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
wire    [31:0]  decd_dp_ag_imm;                           
wire            decd_dp_ag_imm_vld;                       
wire    [4 :0]  decd_dp_csri_rs1;                         
wire            decd_dp_csri_vld;                         
wire            decd_dp_ex_st_rs2_vld;                    
wire    [19:0]  decd_dp_func;                             
wire    [31:0]  decd_dp_imm;                              
wire            decd_dp_imm_vld;                          
wire            decd_dp_lsr_vld;                          
wire            decd_dp_lsu_sel;                          
wire            decd_dp_mul_high_sel;                     
wire            decd_dp_rd2_vld;                          
wire    [5 :0]  decd_dp_rs1_idx;                          
wire            decd_dp_rs1_vld;                          
wire    [5 :0]  decd_dp_rs2_idx;                          
wire            decd_dp_rs2_vld;                          
wire    [5 :0]  decd_dp_rs3_idx;                          
wire            decd_dp_rs3_vld;                          
wire    [5 :0]  decd_dp_rs4_idx;                          
wire            decd_dp_rs4_vld;                          
wire            decd_dp_smal_vld;                         
wire            decd_dp_split;                            
wire    [4 :0]  decd_fp_fpr_rd;                           
wire            decd_fp_fpr_rd_vld;                       
wire    [4 :0]  decd_fp_fpr_rs1;                          
wire            decd_fp_fpr_rs1_vld;                      
wire    [4 :0]  decd_fp_fpr_rs2;                          
wire            decd_fp_fpr_rs2_vld;                      
wire    [4 :0]  decd_fp_fpr_rs3;                          
wire            decd_fp_fpr_rs3_vld;                      
wire    [9 :0]  decd_fp_id_dp_func;                       
wire    [4 :0]  decd_fp_id_fp_dst_idx;                    
wire            decd_fp_id_fp_dst_vld;                    
wire            decd_fp_id_fp_inst_vld;                   
wire            decd_fp_id_fp_lsu_sel;                    
wire    [4 :0]  decd_fp_id_fp_rs1_idx;                    
wire            decd_fp_id_fp_rs1_vld;                    
wire    [4 :0]  decd_fp_id_fp_rs2_idx;                    
wire            decd_fp_id_fp_rs2_vld;                    
wire    [4 :0]  decd_fp_id_fp_rs3_idx;                    
wire            decd_fp_id_fp_rs3_vld;                    
wire    [2 :0]  decd_fp_id_fp_unit_sel;                   
wire    [2 :0]  decd_fp_id_rm;                            
wire    [5 :0]  decd_gpr_dep_rs1;                         
wire    [5 :0]  decd_gpr_dep_rs2;                         
wire            decd_gpr_rd1_vld;                         
wire            decd_gpr_rd2_vld;                         
wire    [5 :0]  decd_gpr_rs1;                             
wire            decd_gpr_rs1_vld;                         
wire    [5 :0]  decd_gpr_rs2;                             
wire            decd_gpr_rs2_vld;                         
wire    [5 :0]  decd_gpr_rs3;                             
wire            decd_gpr_rs3_vld;                         
wire    [5 :0]  decd_gpr_rs4;                             
wire            decd_gpr_rs4_vld;                         
wire            decd_hs_ipop_vld;                         
wire            decd_hs_ipush_vld;                        
wire    [4 :0]  decd_split_dst_idx;                       
wire    [6 :0]  decd_split_opcode;                        
wire            decd_split_req;                           
wire    [4 :0]  decd_split_rs1_idx;                       
wire    [4 :0]  decd_split_rs2_idx;                       
wire            decd_split_rs2_vld;                       
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
wire    [31:0]  dp_decd_rs2_aft_fwd;                      
wire            dp_gpr_rs1_fwd_div;                       
wire            dp_gpr_rs1_fwd_lsu;                       
wire            dp_gpr_rs2_fwd_div;                       
wire            dp_gpr_rs2_fwd_lsu;                       
wire            dp_gpr_rs3_fwd_div;                       
wire            dp_gpr_rs3_fwd_lsu;                       
wire            dp_gpr_rs4_fwd_div;                       
wire            dp_gpr_rs4_fwd_lsu;                       
wire            dp_gpr_x2_busy;                           
wire            dp_gpr_x2_busy2;                          
wire    [4 :0]  dp_id_fp_ex1_rs2_idx;                     
wire    [5 :0]  fdecd_ctrl_dst_idx;                       
wire            fdecd_ctrl_dst_vld;                       
wire            fdecd_ctrl_fls;                           
wire            fdecd_ctrl_fp_inst_vld;                   
wire            fdecd_ctrl_int_dst_vld;                   
wire            fdecd_decd_fp_inst_vld;                   
wire            fdecd_decd_ill_expt;                      
wire    [31:0]  fdecd_decd_imm;                           
wire            fdecd_decd_imm_vld;                       
wire            fdecd_decd_rd_int_vld;                    
wire            fdecd_decd_rs1_int_vld;                   
wire            fdecd_dp_rs1_int_vld;                     
wire    [5 :0]  fdecd_dp_rs2_idx;                         
wire            fdecd_dp_rs2_vld;                         
wire            forever_cpuclk;                           
wire            fpr_id_fp_rd_busy;                        
wire            fpr_id_fp_rd_busy_lsu;                    
wire    [31:0]  fpr_id_fp_rs1;                            
wire            fpr_id_fp_rs1_busy;                       
wire            fpr_id_fp_rs1_busy_lsu;                   
wire    [31:0]  fpr_id_fp_rs2;                            
wire            fpr_id_fp_rs2_busy;                       
wire            fpr_id_fp_rs2_busy_lsu;                   
wire    [31:0]  fpr_id_fp_rs3;                            
wire            fpr_id_fp_rs3_busy;                       
wire            fpr_id_fp_rs3_busy_lsu;                   
wire    [31:0]  fpr_top_reg_busy;                         
wire    [31:0]  fpr_top_reg_busy_div;                     
wire    [31:0]  fpr_top_reg_busy_lsu;                     
wire            fpu_idu_ex1_stall;                        
wire    [31:0]  fpu_idu_fwd_data;                         
wire    [4 :0]  fpu_idu_fwd_freg;                         
wire            fpu_idu_fwd_vld;                          
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
wire            gpr_dp_id_x2_wr;                          
wire    [31:0]  gpr_dp_rs1;                               
wire    [31:0]  gpr_dp_rs2;                               
wire    [31:0]  gpr_dp_rs3;                               
wire    [31:0]  gpr_dp_rs4;                               
wire            gpr_hs_sp_busy;                           
wire            gpr_hs_sp_busy2;                          
wire            gpr_hs_sp_wb;                             
wire            hd_dp_rs2_sel;                            
wire            hs_ctrl_cancel;                           
wire            hs_ctrl_inst_vld;                         
wire            hs_ctrl_stall;                            
wire            hs_decd_dp_vld;                           
wire            hs_decd_dst_vld;                          
wire    [19:0]  hs_decd_func;                             
wire    [31:0]  hs_decd_imm;                              
wire            hs_decd_imm_vld;                          
wire    [5 :0]  hs_decd_rd;                               
wire    [5 :0]  hs_decd_rs1;                              
wire            hs_decd_rs1_vld;                          
wire    [5 :0]  hs_decd_rs2;                              
wire            hs_decd_rs2_imm_vld;                      
wire            hs_decd_rs2_vld;                          
wire    [5 :0]  hs_decd_sel;                              
wire            hs_decd_split;                            
wire            hs_dp_ipop_int_mask;                      
wire            hs_dp_ipop_tail;                          
wire            hs_dp_ipop_tail_gate;                     
wire            hs_dp_ipush_spec_fail;                    
wire            hs_dp_mie_en;                             
wire            hs_dp_rs2_mcause;                         
wire            hs_dp_rs2_mepc;                           
wire            hs_dp_sp_wb_pending;                      
wire            hs_fdecd_dp_vld;                          
wire            hs_gpr_wb_mask;                           
wire            hs_gpr_wr_mask;                           
wire            id_fp_ctrl_id_stall;                      
wire            id_fp_ctrl_rs2_dep_ex1_dst;               
wire            id_fp_ctrl_rs2_stall_upd;                 
wire    [31:0]  id_fp_dp_srcf1;                           
wire    [4 :0]  id_fp_fpr_dst_freg;                       
wire            id_fp_fpr_id_dst_vld;                     
wire            id_fp_fpr_ld_inst;                        
wire            id_fp_fpr_wr_issue;                       
wire            idu_cp0_ex1_cmplt_dp_sel;                 
wire    [5 :0]  idu_cp0_ex1_dst_idx;                      
wire            idu_cp0_ex1_dst_vld;                      
wire            idu_cp0_ex1_expt_high;                    
wire            idu_cp0_ex1_expt_type;                    
wire            idu_cp0_ex1_expt_vld;                     
wire    [19:0]  idu_cp0_ex1_func;                         
wire            idu_cp0_ex1_gateclk_sel;                  
wire    [14:0]  idu_cp0_ex1_halt_info;                    
wire            idu_cp0_ex1_inst_len;                     
wire            idu_cp0_ex1_ipush_spec_fail;              
wire    [31:0]  idu_cp0_ex1_opcode;                       
wire    [31:0]  idu_cp0_ex1_rs1;                          
wire    [11:0]  idu_cp0_ex1_rs2;                          
wire            idu_cp0_ex1_sel;                          
wire            idu_cp0_ex1_split_inst;                   
wire            idu_cp0_ex1_tail_fail;                    
wire            idu_cp0_id_tail_vld;                      
wire    [31:0]  idu_cp0_ipop_data;                        
wire            idu_cp0_mcause_wen;                       
wire            idu_cp0_mepc_wen;                         
wire    [31:0]  idu_cp0_sp_reg;                           
wire            idu_cp0_sp_swap_pending;                  
wire            idu_cp0_sp_swap_req;                      
wire            idu_cp0_sp_swap_req_gate;                 
wire    [21:0]  idu_dtu_debug_info;                       
wire    [95:0]  idu_dtu_fpr_info;                         
wire            idu_fpu_ex1_cmplt_dp_sel;                 
wire    [4 :0]  idu_fpu_ex1_dst_freg;                     
wire            idu_fpu_ex1_dst_freg_vld;                 
wire    [4 :0]  idu_fpu_ex1_dst_preg;                     
wire    [2 :0]  idu_fpu_ex1_eu_sel;                       
wire    [9 :0]  idu_fpu_ex1_func;                         
wire            idu_fpu_ex1_gateclk_vld;                  
wire            idu_fpu_ex1_inst_vld;                     
wire    [2 :0]  idu_fpu_ex1_rm;                           
wire    [31:0]  idu_fpu_ex1_srcf0;                        
wire    [31:0]  idu_fpu_ex1_srcf1;                        
wire    [31:0]  idu_fpu_ex1_srcf2;                        
wire    [31:0]  idu_fpu_ex1_srci;                         
wire            idu_ifu_id_stall;                         
wire            idu_ifu_tail_vld;                         
wire            idu_ifu_tail_vld_gate;                    
wire    [31:0]  idu_ifu_x1;                               
wire    [31:0]  idu_iu_ex1_ag_imm;                        
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
wire    [19:0]  idu_iu_ex1_func;                          
wire            idu_iu_ex1_gateclk_vld;                   
wire            idu_iu_ex1_inst_len;                      
wire            idu_iu_ex1_inst_vld;                      
wire            idu_iu_ex1_ipop_int_mask;                 
wire            idu_iu_ex1_ipush_mie_en;                  
wire            idu_iu_ex1_ipush_spec_fail;               
wire            idu_iu_ex1_mul_cmplt_dp_sel;              
wire            idu_iu_ex1_mul_gateclk_sel;               
wire            idu_iu_ex1_mul_high_sel;                  
wire            idu_iu_ex1_mul_sel;                       
wire            idu_iu_ex1_rd_pair;                       
wire            idu_iu_ex1_split;                         
wire    [31:0]  idu_iu_ex1_src0;                          
wire    [5 :0]  idu_iu_ex1_src0_reg;                      
wire    [31:0]  idu_iu_ex1_src1;                          
wire    [5 :0]  idu_iu_ex1_src1_reg;                      
wire    [31:0]  idu_iu_ex1_src2;                          
wire            idu_iu_ex1_tail_int_vld;                  
wire            idu_iu_ex1_wb_vld;                        
wire            idu_iu_tail_fail;                         
wire            idu_iu_tail_fail_gate;                    
wire    [31:0]  idu_lsu_ex1_ag_imm;                       
wire    [31:0]  idu_lsu_ex1_base;                         
wire            idu_lsu_ex1_base_sel;                     
wire            idu_lsu_ex1_base_wb;                      
wire    [31:0]  idu_lsu_ex1_data;                         
wire    [5 :0]  idu_lsu_ex1_dest_reg;                     
wire            idu_lsu_ex1_dest_vld;                     
wire            idu_lsu_ex1_dp_sel;                       
wire            idu_lsu_ex1_fls;                          
wire    [3 :0]  idu_lsu_ex1_func;                         
wire            idu_lsu_ex1_gateclk_sel;                  
wire    [14:0]  idu_lsu_ex1_halt_info;                    
wire            idu_lsu_ex1_ipop_int_mask;                
wire            idu_lsu_ex1_ipush_spec;                   
wire            idu_lsu_ex1_length;                       
wire            idu_lsu_ex1_offset_sel;                   
wire            idu_lsu_ex1_sel;                          
wire            idu_lsu_ex1_sign_extend;                  
wire    [1 :0]  idu_lsu_ex1_size;                         
wire            idu_lsu_ex1_split;                        
wire    [5 :0]  idu_lsu_ex1_src0_reg;                     
wire            idu_lsu_ex1_src1_depd;                    
wire    [5 :0]  idu_lsu_ex1_src1_reg;                     
wire            idu_misc_cpuclk;                          
wire            idu_yy_xx_tail_ack;                       
wire            ifu_idu_chgflw_flush;                     
wire            ifu_idu_id_expt_high;                     
wire            ifu_idu_id_expt_vld;                      
wire    [14:0]  ifu_idu_id_halt_info;                     
wire    [31:0]  ifu_idu_id_inst;                          
wire            ifu_idu_id_inst_vld;                      
wire    [1 :0]  ifu_idu_id_pred_taken;                    
wire            ifu_idu_warm_up;                          
wire            iu_idu_bju_global_stall;                  
wire            iu_idu_bju_stall;                         
wire    [31:0]  iu_idu_ex1_fwd_data;                      
wire    [5 :0]  iu_idu_ex1_fwd_preg;                      
wire            iu_idu_ex1_fwd_vld;                       
wire    [31:0]  iu_idu_ex1_src1_update_value;             
wire            iu_idu_ex1_stall;                         
wire            iu_idu_ex2_div_vld;                       
wire    [31:0]  iu_idu_ex2_fwd_data0;                     
wire    [31:0]  iu_idu_ex2_fwd_data1;                     
wire    [5 :0]  iu_idu_ex2_fwd_preg0;                     
wire    [5 :0]  iu_idu_ex2_fwd_preg1;                     
wire            iu_idu_ex2_fwd_vld0;                      
wire            iu_idu_ex2_fwd_vld1;                      
wire            iu_idu_ex2_inst_vld;                      
wire            iu_idu_ex2_rd_pair;                       
wire            iu_idu_id_stall;                          
wire            iu_xx_no_op;                              
wire            iu_yy_xx_cancel;                          
wire    [14:0]  lsu_idu_ex1_halt_info;                    
wire            lsu_idu_ex1_halt_info_update_en;          
wire            lsu_idu_ex1_src1_update_en;               
wire            lsu_idu_ex1_src1_update_en_gate;          
wire            lsu_idu_ex1_stall;                        
wire    [31:0]  lsu_idu_ex2_ffwd_data;                    
wire            lsu_idu_ex2_ffwd_vld;                     
wire    [31:0]  lsu_idu_ex2_fwd_data;                     
wire    [4 :0]  lsu_idu_ex2_fwd_freg;                     
wire    [5 :0]  lsu_idu_ex2_fwd_preg;                     
wire            lsu_idu_ex2_fwd_vld;                      
wire    [31:0]  lsu_idu_ex3_ffwd_data;                    
wire            lsu_idu_ex3_ffwd_vld;                     
wire    [31:0]  lsu_idu_ex3_fwd_data;                     
wire    [4 :0]  lsu_idu_ex3_fwd_freg;                     
wire    [5 :0]  lsu_idu_ex3_fwd_preg;                     
wire            lsu_idu_ex3_fwd_vld;                      
wire            lsu_idu_global_stall;                     
wire    [31:0]  lsu_idu_update_addr;                      
wire            lsu_idu_update_en;                        
wire            lsu_idu_update_en_gate;                   
wire    [31:0]  lsu_idu_update_offset;                    
wire            lsu_xx_no_op;                             
wire            pad_yy_icg_scan_en;                       
wire            rtu_idu_ex1_int_dis_stall_gateclk_req;    
wire            rtu_idu_ex1_int_dis_stall_req;            
wire            rtu_idu_ex2_ipush_spec_inst_expt_vld;     
wire            rtu_idu_ex2_ipush_spec_inst_halt_info_vld; 
wire    [31:0]  rtu_idu_fgpr_wb_data;                     
wire            rtu_idu_fgpr_wb_flsu_vld;                 
wire    [4 :0]  rtu_idu_fgpr_wb_reg;                      
wire            rtu_idu_fgpr_wb_vld;                      
wire            rtu_idu_flush_fe;                         
wire            rtu_idu_flush_stall;                      
wire            rtu_idu_id_tail_int_vld;                  
wire            rtu_idu_inst_retire;                      
wire            rtu_idu_late_flush;                       
wire    [31:0]  rtu_idu_wb0_data;                         
wire            rtu_idu_wb0_fpu_vld;                      
wire    [5 :0]  rtu_idu_wb0_preg;                         
wire            rtu_idu_wb0_vld;                          
wire    [31:0]  rtu_idu_wb1_data;                         
wire            rtu_idu_wb1_lsu_vld;                      
wire    [5 :0]  rtu_idu_wb1_preg;                         
wire            rtu_idu_wb1_vld;                          
wire    [31:0]  rtu_idu_wb2_data;                         
wire    [5 :0]  rtu_idu_wb2_preg;                         
wire            rtu_idu_wb2_vld;                          
wire            rtu_xx_ex1_stall;                         
wire            rtu_xx_no_op;                             
wire            rtu_yy_xx_dbgon;                          
wire            rtu_yy_xx_expt_int;                       
wire            rtu_yy_xx_expt_vld;                       
wire            rtu_yy_xx_flush;                          
wire            split_ctrl_cancel;                        
wire            split_ctrl_icg_en;                        
wire            split_ctrl_stall;                         
wire    [31:0]  split_decd_ag_imm;                        
wire            split_decd_ag_imm_vld;                    
wire            split_decd_dp_sel;                        
wire    [5 :0]  split_decd_dst_idx;                       
wire            split_decd_dst_vld;                       
wire    [19:0]  split_decd_func;                          
wire    [5 :0]  split_decd_rs1_idx;                       
wire            split_decd_rs1_vld;                       
wire    [5 :0]  split_decd_rs2_idx;                       
wire    [31:0]  split_decd_rs2_imm;                       
wire            split_decd_rs2_imm_vld;                   
wire            split_decd_rs2_vld;                       
wire    [5 :0]  split_decd_sel;                           
wire            split_decd_split;                         
wire    [2 :0]  split_top_cur_st;                         
wire    [21:0]  top_debug_info;                           
wire    [95:0]  top_fpr_debug_info;                       


// Decode Module
// &Instance("pa_idu_decd_dsp"); @30
pa_idu_decd_dsp  x_pa_idu_decd_dsp (
  .cp0_yy_cskyisaee       (cp0_yy_cskyisaee      ),
  .cp0_yy_mach_mode       (cp0_yy_mach_mode      ),
  .decd_ctrl_bju_use_pc   (decd_ctrl_bju_use_pc  ),
  .decd_ctrl_id_func      (decd_ctrl_id_func     ),
  .decd_ctrl_ill_expt     (decd_ctrl_ill_expt    ),
  .decd_ctrl_inst_32bit   (decd_ctrl_inst_32bit  ),
  .decd_ctrl_rd1          (decd_ctrl_rd1         ),
  .decd_ctrl_rd1_vld      (decd_ctrl_rd1_vld     ),
  .decd_ctrl_rd2          (decd_ctrl_rd2         ),
  .decd_ctrl_rd2_vld      (decd_ctrl_rd2_vld     ),
  .decd_ctrl_sti_vld      (decd_ctrl_sti_vld     ),
  .decd_ctrl_str_vld      (decd_ctrl_str_vld     ),
  .decd_ctrl_unit_sel     (decd_ctrl_unit_sel    ),
  .decd_dp_ag_imm         (decd_dp_ag_imm        ),
  .decd_dp_ag_imm_vld     (decd_dp_ag_imm_vld    ),
  .decd_dp_csri_rs1       (decd_dp_csri_rs1      ),
  .decd_dp_csri_vld       (decd_dp_csri_vld      ),
  .decd_dp_ex_st_rs2_vld  (decd_dp_ex_st_rs2_vld ),
  .decd_dp_func           (decd_dp_func          ),
  .decd_dp_imm            (decd_dp_imm           ),
  .decd_dp_imm_vld        (decd_dp_imm_vld       ),
  .decd_dp_lsr_vld        (decd_dp_lsr_vld       ),
  .decd_dp_lsu_sel        (decd_dp_lsu_sel       ),
  .decd_dp_mul_high_sel   (decd_dp_mul_high_sel  ),
  .decd_dp_rd2_vld        (decd_dp_rd2_vld       ),
  .decd_dp_rs1_idx        (decd_dp_rs1_idx       ),
  .decd_dp_rs1_vld        (decd_dp_rs1_vld       ),
  .decd_dp_rs2_idx        (decd_dp_rs2_idx       ),
  .decd_dp_rs2_vld        (decd_dp_rs2_vld       ),
  .decd_dp_rs3_idx        (decd_dp_rs3_idx       ),
  .decd_dp_rs3_vld        (decd_dp_rs3_vld       ),
  .decd_dp_rs4_idx        (decd_dp_rs4_idx       ),
  .decd_dp_rs4_vld        (decd_dp_rs4_vld       ),
  .decd_dp_smal_vld       (decd_dp_smal_vld      ),
  .decd_dp_split          (decd_dp_split         ),
  .decd_gpr_dep_rs1       (decd_gpr_dep_rs1      ),
  .decd_gpr_dep_rs2       (decd_gpr_dep_rs2      ),
  .decd_gpr_rd1_vld       (decd_gpr_rd1_vld      ),
  .decd_gpr_rd2_vld       (decd_gpr_rd2_vld      ),
  .decd_gpr_rs1           (decd_gpr_rs1          ),
  .decd_gpr_rs1_vld       (decd_gpr_rs1_vld      ),
  .decd_gpr_rs2           (decd_gpr_rs2          ),
  .decd_gpr_rs2_vld       (decd_gpr_rs2_vld      ),
  .decd_gpr_rs3           (decd_gpr_rs3          ),
  .decd_gpr_rs3_vld       (decd_gpr_rs3_vld      ),
  .decd_gpr_rs4           (decd_gpr_rs4          ),
  .decd_gpr_rs4_vld       (decd_gpr_rs4_vld      ),
  .decd_hs_ipop_vld       (decd_hs_ipop_vld      ),
  .decd_hs_ipush_vld      (decd_hs_ipush_vld     ),
  .decd_split_dst_idx     (decd_split_dst_idx    ),
  .decd_split_opcode      (decd_split_opcode     ),
  .decd_split_req         (decd_split_req        ),
  .decd_split_rs1_idx     (decd_split_rs1_idx    ),
  .decd_split_rs2_idx     (decd_split_rs2_idx    ),
  .decd_split_rs2_vld     (decd_split_rs2_vld    ),
  .dp_decd_rs2_aft_fwd    (dp_decd_rs2_aft_fwd   ),
  .fdecd_decd_fp_inst_vld (fdecd_decd_fp_inst_vld),
  .fdecd_decd_ill_expt    (fdecd_decd_ill_expt   ),
  .fdecd_decd_imm         (fdecd_decd_imm        ),
  .fdecd_decd_imm_vld     (fdecd_decd_imm_vld    ),
  .fdecd_decd_rd_int_vld  (fdecd_decd_rd_int_vld ),
  .fdecd_decd_rs1_int_vld (fdecd_decd_rs1_int_vld),
  .hs_decd_dp_vld         (hs_decd_dp_vld        ),
  .hs_decd_dst_vld        (hs_decd_dst_vld       ),
  .hs_decd_func           (hs_decd_func          ),
  .hs_decd_imm            (hs_decd_imm           ),
  .hs_decd_imm_vld        (hs_decd_imm_vld       ),
  .hs_decd_rd             (hs_decd_rd            ),
  .hs_decd_rs1            (hs_decd_rs1           ),
  .hs_decd_rs1_vld        (hs_decd_rs1_vld       ),
  .hs_decd_rs2            (hs_decd_rs2           ),
  .hs_decd_rs2_imm_vld    (hs_decd_rs2_imm_vld   ),
  .hs_decd_rs2_vld        (hs_decd_rs2_vld       ),
  .hs_decd_sel            (hs_decd_sel           ),
  .hs_decd_split          (hs_decd_split         ),
  .ifu_idu_id_expt_vld    (ifu_idu_id_expt_vld   ),
  .ifu_idu_id_inst        (ifu_idu_id_inst       ),
  .rtu_yy_xx_dbgon        (rtu_yy_xx_dbgon       ),
  .split_decd_ag_imm      (split_decd_ag_imm     ),
  .split_decd_ag_imm_vld  (split_decd_ag_imm_vld ),
  .split_decd_dp_sel      (split_decd_dp_sel     ),
  .split_decd_dst_idx     (split_decd_dst_idx    ),
  .split_decd_dst_vld     (split_decd_dst_vld    ),
  .split_decd_func        (split_decd_func       ),
  .split_decd_rs1_idx     (split_decd_rs1_idx    ),
  .split_decd_rs1_vld     (split_decd_rs1_vld    ),
  .split_decd_rs2_idx     (split_decd_rs2_idx    ),
  .split_decd_rs2_imm     (split_decd_rs2_imm    ),
  .split_decd_rs2_imm_vld (split_decd_rs2_imm_vld),
  .split_decd_rs2_vld     (split_decd_rs2_vld    ),
  .split_decd_sel         (split_decd_sel        ),
  .split_decd_split       (split_decd_split      )
);


// GPR Access Module
// &Instance("pa_idu_gpr"); @33
pa_idu_gpr  x_pa_idu_gpr (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_idu_sp_wdata              (cp0_idu_sp_wdata             ),
  .cp0_idu_sp_wen                (cp0_idu_sp_wen               ),
  .cp0_idu_sp_wen_gate           (cp0_idu_sp_wen_gate          ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ex1_dst_preg         (ctrl_gpr_ex1_dst_preg        ),
  .ctrl_gpr_ex1_int_spec         (ctrl_gpr_ex1_int_spec        ),
  .ctrl_gpr_id_rd1_vld           (ctrl_gpr_id_rd1_vld          ),
  .ctrl_gpr_id_rd2_vld           (ctrl_gpr_id_rd2_vld          ),
  .ctrl_gpr_id_wr_idx1           (ctrl_gpr_id_wr_idx1          ),
  .ctrl_gpr_id_wr_idx2           (ctrl_gpr_id_wr_idx2          ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ctrl_gpr_wr_issue1            (ctrl_gpr_wr_issue1           ),
  .decd_gpr_dep_rs1              (decd_gpr_dep_rs1             ),
  .decd_gpr_dep_rs2              (decd_gpr_dep_rs2             ),
  .decd_gpr_rd1_vld              (decd_gpr_rd1_vld             ),
  .decd_gpr_rd2_vld              (decd_gpr_rd2_vld             ),
  .decd_gpr_rs1                  (decd_gpr_rs1                 ),
  .decd_gpr_rs1_vld              (decd_gpr_rs1_vld             ),
  .decd_gpr_rs2                  (decd_gpr_rs2                 ),
  .decd_gpr_rs2_vld              (decd_gpr_rs2_vld             ),
  .decd_gpr_rs3                  (decd_gpr_rs3                 ),
  .decd_gpr_rs3_vld              (decd_gpr_rs3_vld             ),
  .decd_gpr_rs4                  (decd_gpr_rs4                 ),
  .decd_gpr_rs4_vld              (decd_gpr_rs4_vld             ),
  .dp_gpr_rs1_fwd_div            (dp_gpr_rs1_fwd_div           ),
  .dp_gpr_rs1_fwd_lsu            (dp_gpr_rs1_fwd_lsu           ),
  .dp_gpr_rs2_fwd_div            (dp_gpr_rs2_fwd_div           ),
  .dp_gpr_rs2_fwd_lsu            (dp_gpr_rs2_fwd_lsu           ),
  .dp_gpr_rs3_fwd_div            (dp_gpr_rs3_fwd_div           ),
  .dp_gpr_rs3_fwd_lsu            (dp_gpr_rs3_fwd_lsu           ),
  .dp_gpr_rs4_fwd_div            (dp_gpr_rs4_fwd_div           ),
  .dp_gpr_rs4_fwd_lsu            (dp_gpr_rs4_fwd_lsu           ),
  .dp_gpr_x2_busy                (dp_gpr_x2_busy               ),
  .dp_gpr_x2_busy2               (dp_gpr_x2_busy2              ),
  .forever_cpuclk                (forever_cpuclk               ),
  .gpr_ctrl_rd1_busy_div         (gpr_ctrl_rd1_busy_div        ),
  .gpr_ctrl_rd1_busy_lsu         (gpr_ctrl_rd1_busy_lsu        ),
  .gpr_ctrl_rd2_busy_div         (gpr_ctrl_rd2_busy_div        ),
  .gpr_ctrl_rd2_busy_lsu         (gpr_ctrl_rd2_busy_lsu        ),
  .gpr_ctrl_rs1_busy_div         (gpr_ctrl_rs1_busy_div        ),
  .gpr_ctrl_rs1_busy_lsu         (gpr_ctrl_rs1_busy_lsu        ),
  .gpr_ctrl_rs1_busy_lsu2        (gpr_ctrl_rs1_busy_lsu2       ),
  .gpr_ctrl_rs2_busy_div         (gpr_ctrl_rs2_busy_div        ),
  .gpr_ctrl_rs2_busy_lsu         (gpr_ctrl_rs2_busy_lsu        ),
  .gpr_ctrl_rs2_busy_lsu2        (gpr_ctrl_rs2_busy_lsu2       ),
  .gpr_ctrl_rs3_busy_div         (gpr_ctrl_rs3_busy_div        ),
  .gpr_ctrl_rs3_busy_lsu         (gpr_ctrl_rs3_busy_lsu        ),
  .gpr_ctrl_rs3_busy_lsu2        (gpr_ctrl_rs3_busy_lsu2       ),
  .gpr_ctrl_rs4_busy_div         (gpr_ctrl_rs4_busy_div        ),
  .gpr_ctrl_rs4_busy_lsu         (gpr_ctrl_rs4_busy_lsu        ),
  .gpr_dp_id_x2_wr               (gpr_dp_id_x2_wr              ),
  .gpr_dp_rs1                    (gpr_dp_rs1                   ),
  .gpr_dp_rs2                    (gpr_dp_rs2                   ),
  .gpr_dp_rs3                    (gpr_dp_rs3                   ),
  .gpr_dp_rs4                    (gpr_dp_rs4                   ),
  .gpr_hs_sp_busy                (gpr_hs_sp_busy               ),
  .gpr_hs_sp_busy2               (gpr_hs_sp_busy2              ),
  .gpr_hs_sp_wb                  (gpr_hs_sp_wb                 ),
  .hs_gpr_wb_mask                (hs_gpr_wb_mask               ),
  .hs_gpr_wr_mask                (hs_gpr_wr_mask               ),
  .idu_cp0_ipop_data             (idu_cp0_ipop_data            ),
  .idu_cp0_mcause_wen            (idu_cp0_mcause_wen           ),
  .idu_cp0_mepc_wen              (idu_cp0_mepc_wen             ),
  .idu_cp0_sp_reg                (idu_cp0_sp_reg               ),
  .idu_ifu_x1                    (idu_ifu_x1                   ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .iu_idu_ex2_div_vld            (iu_idu_ex2_div_vld           ),
  .iu_idu_ex2_fwd_preg0          (iu_idu_ex2_fwd_preg0         ),
  .iu_idu_ex2_fwd_vld0           (iu_idu_ex2_fwd_vld0          ),
  .lsu_idu_ex2_fwd_preg          (lsu_idu_ex2_fwd_preg         ),
  .lsu_idu_ex2_fwd_vld           (lsu_idu_ex2_fwd_vld          ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .rtu_idu_wb0_data              (rtu_idu_wb0_data             ),
  .rtu_idu_wb0_fpu_vld           (rtu_idu_wb0_fpu_vld          ),
  .rtu_idu_wb0_preg              (rtu_idu_wb0_preg             ),
  .rtu_idu_wb0_vld               (rtu_idu_wb0_vld              ),
  .rtu_idu_wb1_data              (rtu_idu_wb1_data             ),
  .rtu_idu_wb1_lsu_vld           (rtu_idu_wb1_lsu_vld          ),
  .rtu_idu_wb1_preg              (rtu_idu_wb1_preg             ),
  .rtu_idu_wb1_vld               (rtu_idu_wb1_vld              ),
  .rtu_idu_wb2_data              (rtu_idu_wb2_data             ),
  .rtu_idu_wb2_preg              (rtu_idu_wb2_preg             ),
  .rtu_idu_wb2_vld               (rtu_idu_wb2_vld              ),
  .rtu_yy_xx_expt_int            (rtu_yy_xx_expt_int           )
);


// Control Module
// &Instance("pa_idu_ctrl"); @36
pa_idu_ctrl  x_pa_idu_ctrl (
  .cp0_idu_ex1_stall                     (cp0_idu_ex1_stall                    ),
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_dp_ex1_bju_sel                   (ctrl_dp_ex1_bju_sel                  ),
  .ctrl_dp_ex1_div_sel                   (ctrl_dp_ex1_div_sel                  ),
  .ctrl_dp_ex1_dst_preg                  (ctrl_dp_ex1_dst_preg                 ),
  .ctrl_dp_ex1_dst_vld                   (ctrl_dp_ex1_dst_vld                  ),
  .ctrl_dp_ex1_fls                       (ctrl_dp_ex1_fls                      ),
  .ctrl_dp_ex1_inst_vld                  (ctrl_dp_ex1_inst_vld                 ),
  .ctrl_dp_ex1_lsu_sel                   (ctrl_dp_ex1_lsu_sel                  ),
  .ctrl_dp_ex1_rs1_dep                   (ctrl_dp_ex1_rs1_dep                  ),
  .ctrl_dp_ex1_rs2_dep                   (ctrl_dp_ex1_rs2_dep                  ),
  .ctrl_dp_ex1_st_sel                    (ctrl_dp_ex1_st_sel                   ),
  .ctrl_dp_pipe_down                     (ctrl_dp_pipe_down                    ),
  .ctrl_dp_pipe_down_gate                (ctrl_dp_pipe_down_gate               ),
  .ctrl_fpr_ex1_int_spec                 (ctrl_fpr_ex1_int_spec                ),
  .ctrl_gpr_div_inst                     (ctrl_gpr_div_inst                    ),
  .ctrl_gpr_ex1_dst_preg                 (ctrl_gpr_ex1_dst_preg                ),
  .ctrl_gpr_ex1_int_spec                 (ctrl_gpr_ex1_int_spec                ),
  .ctrl_gpr_id_rd1_vld                   (ctrl_gpr_id_rd1_vld                  ),
  .ctrl_gpr_id_rd2_vld                   (ctrl_gpr_id_rd2_vld                  ),
  .ctrl_gpr_id_wr_idx1                   (ctrl_gpr_id_wr_idx1                  ),
  .ctrl_gpr_id_wr_idx2                   (ctrl_gpr_id_wr_idx2                  ),
  .ctrl_gpr_ld_inst                      (ctrl_gpr_ld_inst                     ),
  .ctrl_gpr_wr_issue1                    (ctrl_gpr_wr_issue1                   ),
  .ctrl_hs_be_idle                       (ctrl_hs_be_idle                      ),
  .ctrl_hs_bkpt_vld                      (ctrl_hs_bkpt_vld                     ),
  .ctrl_hs_no_op                         (ctrl_hs_no_op                        ),
  .ctrl_hs_stall                         (ctrl_hs_stall                        ),
  .ctrl_id_fp_ex1_inst_vld               (ctrl_id_fp_ex1_inst_vld              ),
  .ctrl_id_fp_ex1_lsu_sel                (ctrl_id_fp_ex1_lsu_sel               ),
  .ctrl_id_fp_id_expt_vld                (ctrl_id_fp_id_expt_vld               ),
  .ctrl_id_fp_id_inst_vld                (ctrl_id_fp_id_inst_vld               ),
  .ctrl_id_fp_id_stall                   (ctrl_id_fp_id_stall                  ),
  .ctrl_id_fp_pipe_down                  (ctrl_id_fp_pipe_down                 ),
  .ctrl_id_fp_st_rs2_dep                 (ctrl_id_fp_st_rs2_dep                ),
  .ctrl_id_fp_uncmit                     (ctrl_id_fp_uncmit                    ),
  .ctrl_split_bkpt_vld                   (ctrl_split_bkpt_vld                  ),
  .ctrl_split_stall                      (ctrl_split_stall                     ),
  .ctrl_top_bju_dep1_vld                 (ctrl_top_bju_dep1_vld                ),
  .ctrl_top_bju_dep2_vld                 (ctrl_top_bju_dep2_vld                ),
  .ctrl_top_cp0_stall                    (ctrl_top_cp0_stall                   ),
  .ctrl_top_div_stall                    (ctrl_top_div_stall                   ),
  .ctrl_top_ex1_fp_vld                   (ctrl_top_ex1_fp_vld                  ),
  .ctrl_top_ex1_sel                      (ctrl_top_ex1_sel                     ),
  .ctrl_top_ex1_stall                    (ctrl_top_ex1_stall                   ),
  .ctrl_top_ex1_vld                      (ctrl_top_ex1_vld                     ),
  .ctrl_top_id_cancel                    (ctrl_top_id_cancel                   ),
  .ctrl_top_id_inst_vld                  (ctrl_top_id_inst_vld                 ),
  .ctrl_top_id_stall                     (ctrl_top_id_stall                    ),
  .ctrl_top_ld_stall                     (ctrl_top_ld_stall                    ),
  .ctrl_top_norm_stall                   (ctrl_top_norm_stall                  ),
  .ctrl_top_st_dep_vld                   (ctrl_top_st_dep_vld                  ),
  .decd_ctrl_bju_use_pc                  (decd_ctrl_bju_use_pc                 ),
  .decd_ctrl_id_func                     (decd_ctrl_id_func                    ),
  .decd_ctrl_ill_expt                    (decd_ctrl_ill_expt                   ),
  .decd_ctrl_inst_32bit                  (decd_ctrl_inst_32bit                 ),
  .decd_ctrl_rd1                         (decd_ctrl_rd1                        ),
  .decd_ctrl_rd1_vld                     (decd_ctrl_rd1_vld                    ),
  .decd_ctrl_rd2                         (decd_ctrl_rd2                        ),
  .decd_ctrl_rd2_vld                     (decd_ctrl_rd2_vld                    ),
  .decd_ctrl_sti_vld                     (decd_ctrl_sti_vld                    ),
  .decd_ctrl_str_vld                     (decd_ctrl_str_vld                    ),
  .decd_ctrl_unit_sel                    (decd_ctrl_unit_sel                   ),
  .dp_ctrl_ex1_ex_st_rs2_vld             (dp_ctrl_ex1_ex_st_rs2_vld            ),
  .dp_ctrl_ex1_st_vld                    (dp_ctrl_ex1_st_vld                   ),
  .dp_ctrl_rs1_dep_ex1_dst               (dp_ctrl_rs1_dep_ex1_dst              ),
  .dp_ctrl_rs1_fwd_lsu                   (dp_ctrl_rs1_fwd_lsu                  ),
  .dp_ctrl_rs1_stall_upd                 (dp_ctrl_rs1_stall_upd                ),
  .dp_ctrl_rs2_dep_ex1_dst               (dp_ctrl_rs2_dep_ex1_dst              ),
  .dp_ctrl_rs2_fwd_lsu                   (dp_ctrl_rs2_fwd_lsu                  ),
  .dp_ctrl_rs2_stall_upd                 (dp_ctrl_rs2_stall_upd                ),
  .dp_ctrl_rs3_dep_ex1_dst               (dp_ctrl_rs3_dep_ex1_dst              ),
  .dp_ctrl_rs3_fwd_lsu                   (dp_ctrl_rs3_fwd_lsu                  ),
  .dp_ctrl_rs3_stall_upd                 (dp_ctrl_rs3_stall_upd                ),
  .dp_ctrl_rs_norm_stall                 (dp_ctrl_rs_norm_stall                ),
  .fdecd_ctrl_dst_idx                    (fdecd_ctrl_dst_idx                   ),
  .fdecd_ctrl_dst_vld                    (fdecd_ctrl_dst_vld                   ),
  .fdecd_ctrl_fls                        (fdecd_ctrl_fls                       ),
  .fdecd_ctrl_fp_inst_vld                (fdecd_ctrl_fp_inst_vld               ),
  .fdecd_ctrl_int_dst_vld                (fdecd_ctrl_int_dst_vld               ),
  .forever_cpuclk                        (forever_cpuclk                       ),
  .fpu_idu_ex1_stall                     (fpu_idu_ex1_stall                    ),
  .fpu_xx_no_op                          (fpu_xx_no_op                         ),
  .gpr_ctrl_rd1_busy_div                 (gpr_ctrl_rd1_busy_div                ),
  .gpr_ctrl_rd1_busy_lsu                 (gpr_ctrl_rd1_busy_lsu                ),
  .gpr_ctrl_rd2_busy_div                 (gpr_ctrl_rd2_busy_div                ),
  .gpr_ctrl_rd2_busy_lsu                 (gpr_ctrl_rd2_busy_lsu                ),
  .gpr_ctrl_rs1_busy_div                 (gpr_ctrl_rs1_busy_div                ),
  .gpr_ctrl_rs1_busy_lsu                 (gpr_ctrl_rs1_busy_lsu                ),
  .gpr_ctrl_rs1_busy_lsu2                (gpr_ctrl_rs1_busy_lsu2               ),
  .gpr_ctrl_rs2_busy_div                 (gpr_ctrl_rs2_busy_div                ),
  .gpr_ctrl_rs2_busy_lsu                 (gpr_ctrl_rs2_busy_lsu                ),
  .gpr_ctrl_rs2_busy_lsu2                (gpr_ctrl_rs2_busy_lsu2               ),
  .gpr_ctrl_rs3_busy_div                 (gpr_ctrl_rs3_busy_div                ),
  .gpr_ctrl_rs3_busy_lsu                 (gpr_ctrl_rs3_busy_lsu                ),
  .gpr_ctrl_rs3_busy_lsu2                (gpr_ctrl_rs3_busy_lsu2               ),
  .gpr_ctrl_rs4_busy_div                 (gpr_ctrl_rs4_busy_div                ),
  .gpr_ctrl_rs4_busy_lsu                 (gpr_ctrl_rs4_busy_lsu                ),
  .hs_ctrl_cancel                        (hs_ctrl_cancel                       ),
  .hs_ctrl_inst_vld                      (hs_ctrl_inst_vld                     ),
  .hs_ctrl_stall                         (hs_ctrl_stall                        ),
  .id_fp_ctrl_id_stall                   (id_fp_ctrl_id_stall                  ),
  .id_fp_ctrl_rs2_dep_ex1_dst            (id_fp_ctrl_rs2_dep_ex1_dst           ),
  .id_fp_ctrl_rs2_stall_upd              (id_fp_ctrl_rs2_stall_upd             ),
  .idu_cp0_ex1_cmplt_dp_sel              (idu_cp0_ex1_cmplt_dp_sel             ),
  .idu_cp0_ex1_dst_idx                   (idu_cp0_ex1_dst_idx                  ),
  .idu_cp0_ex1_dst_vld                   (idu_cp0_ex1_dst_vld                  ),
  .idu_cp0_ex1_expt_high                 (idu_cp0_ex1_expt_high                ),
  .idu_cp0_ex1_expt_type                 (idu_cp0_ex1_expt_type                ),
  .idu_cp0_ex1_expt_vld                  (idu_cp0_ex1_expt_vld                 ),
  .idu_cp0_ex1_gateclk_sel               (idu_cp0_ex1_gateclk_sel              ),
  .idu_cp0_ex1_halt_info                 (idu_cp0_ex1_halt_info                ),
  .idu_cp0_ex1_inst_len                  (idu_cp0_ex1_inst_len                 ),
  .idu_cp0_ex1_sel                       (idu_cp0_ex1_sel                      ),
  .idu_ifu_id_stall                      (idu_ifu_id_stall                     ),
  .idu_iu_ex1_alu_cmplt_dp_sel           (idu_iu_ex1_alu_cmplt_dp_sel          ),
  .idu_iu_ex1_alu_gateclk_sel            (idu_iu_ex1_alu_gateclk_sel           ),
  .idu_iu_ex1_alu_sel                    (idu_iu_ex1_alu_sel                   ),
  .idu_iu_ex1_bht_pred                   (idu_iu_ex1_bht_pred                  ),
  .idu_iu_ex1_bju_cmplt_dp_sel           (idu_iu_ex1_bju_cmplt_dp_sel          ),
  .idu_iu_ex1_bju_depd_lsu_src0          (idu_iu_ex1_bju_depd_lsu_src0         ),
  .idu_iu_ex1_bju_depd_lsu_src1          (idu_iu_ex1_bju_depd_lsu_src1         ),
  .idu_iu_ex1_bju_gateclk_sel            (idu_iu_ex1_bju_gateclk_sel           ),
  .idu_iu_ex1_bju_sel                    (idu_iu_ex1_bju_sel                   ),
  .idu_iu_ex1_bju_use_pc                 (idu_iu_ex1_bju_use_pc                ),
  .idu_iu_ex1_div_cmplt_dp_sel           (idu_iu_ex1_div_cmplt_dp_sel          ),
  .idu_iu_ex1_div_gateclk_sel            (idu_iu_ex1_div_gateclk_sel           ),
  .idu_iu_ex1_div_sel                    (idu_iu_ex1_div_sel                   ),
  .idu_iu_ex1_dst_preg                   (idu_iu_ex1_dst_preg                  ),
  .idu_iu_ex1_gateclk_vld                (idu_iu_ex1_gateclk_vld               ),
  .idu_iu_ex1_inst_len                   (idu_iu_ex1_inst_len                  ),
  .idu_iu_ex1_inst_vld                   (idu_iu_ex1_inst_vld                  ),
  .idu_iu_ex1_mul_cmplt_dp_sel           (idu_iu_ex1_mul_cmplt_dp_sel          ),
  .idu_iu_ex1_mul_gateclk_sel            (idu_iu_ex1_mul_gateclk_sel           ),
  .idu_iu_ex1_mul_sel                    (idu_iu_ex1_mul_sel                   ),
  .idu_iu_ex1_wb_vld                     (idu_iu_ex1_wb_vld                    ),
  .idu_lsu_ex1_base_sel                  (idu_lsu_ex1_base_sel                 ),
  .idu_lsu_ex1_dest_reg                  (idu_lsu_ex1_dest_reg                 ),
  .idu_lsu_ex1_dest_vld                  (idu_lsu_ex1_dest_vld                 ),
  .idu_lsu_ex1_dp_sel                    (idu_lsu_ex1_dp_sel                   ),
  .idu_lsu_ex1_fls                       (idu_lsu_ex1_fls                      ),
  .idu_lsu_ex1_gateclk_sel               (idu_lsu_ex1_gateclk_sel              ),
  .idu_lsu_ex1_halt_info                 (idu_lsu_ex1_halt_info                ),
  .idu_lsu_ex1_length                    (idu_lsu_ex1_length                   ),
  .idu_lsu_ex1_sel                       (idu_lsu_ex1_sel                      ),
  .idu_lsu_ex1_src1_depd                 (idu_lsu_ex1_src1_depd                ),
  .idu_misc_cpuclk                       (idu_misc_cpuclk                      ),
  .ifu_idu_id_expt_high                  (ifu_idu_id_expt_high                 ),
  .ifu_idu_id_expt_vld                   (ifu_idu_id_expt_vld                  ),
  .ifu_idu_id_halt_info                  (ifu_idu_id_halt_info                 ),
  .ifu_idu_id_inst_vld                   (ifu_idu_id_inst_vld                  ),
  .ifu_idu_id_pred_taken                 (ifu_idu_id_pred_taken                ),
  .ifu_idu_warm_up                       (ifu_idu_warm_up                      ),
  .iu_idu_bju_global_stall               (iu_idu_bju_global_stall              ),
  .iu_idu_bju_stall                      (iu_idu_bju_stall                     ),
  .iu_idu_ex1_stall                      (iu_idu_ex1_stall                     ),
  .iu_idu_id_stall                       (iu_idu_id_stall                      ),
  .iu_xx_no_op                           (iu_xx_no_op                          ),
  .iu_yy_xx_cancel                       (iu_yy_xx_cancel                      ),
  .lsu_idu_ex1_halt_info                 (lsu_idu_ex1_halt_info                ),
  .lsu_idu_ex1_halt_info_update_en       (lsu_idu_ex1_halt_info_update_en      ),
  .lsu_idu_ex1_stall                     (lsu_idu_ex1_stall                    ),
  .lsu_idu_global_stall                  (lsu_idu_global_stall                 ),
  .lsu_xx_no_op                          (lsu_xx_no_op                         ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_ex1_int_dis_stall_gateclk_req (rtu_idu_ex1_int_dis_stall_gateclk_req),
  .rtu_idu_ex1_int_dis_stall_req         (rtu_idu_ex1_int_dis_stall_req        ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_stall                   (rtu_idu_flush_stall                  ),
  .rtu_idu_inst_retire                   (rtu_idu_inst_retire                  ),
  .rtu_idu_late_flush                    (rtu_idu_late_flush                   ),
  .rtu_xx_ex1_stall                      (rtu_xx_ex1_stall                     ),
  .rtu_xx_no_op                          (rtu_xx_no_op                         ),
  .rtu_yy_xx_flush                       (rtu_yy_xx_flush                      ),
  .split_ctrl_cancel                     (split_ctrl_cancel                    ),
  .split_ctrl_icg_en                     (split_ctrl_icg_en                    ),
  .split_ctrl_stall                      (split_ctrl_stall                     )
);


// Datapath Module
// &Instance("pa_idu_dp"); @39
pa_idu_dp  x_pa_idu_dp (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_idu_mcause                  (cp0_idu_mcause                 ),
  .cp0_idu_mepc                    (cp0_idu_mepc                   ),
  .cp0_idu_sp_use_scratch          (cp0_idu_sp_use_scratch         ),
  .cp0_idu_sp_wdata                (cp0_idu_sp_wdata               ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .ctrl_dp_ex1_bju_sel             (ctrl_dp_ex1_bju_sel            ),
  .ctrl_dp_ex1_div_sel             (ctrl_dp_ex1_div_sel            ),
  .ctrl_dp_ex1_dst_preg            (ctrl_dp_ex1_dst_preg           ),
  .ctrl_dp_ex1_dst_vld             (ctrl_dp_ex1_dst_vld            ),
  .ctrl_dp_ex1_fls                 (ctrl_dp_ex1_fls                ),
  .ctrl_dp_ex1_inst_vld            (ctrl_dp_ex1_inst_vld           ),
  .ctrl_dp_ex1_lsu_sel             (ctrl_dp_ex1_lsu_sel            ),
  .ctrl_dp_ex1_rs1_dep             (ctrl_dp_ex1_rs1_dep            ),
  .ctrl_dp_ex1_rs2_dep             (ctrl_dp_ex1_rs2_dep            ),
  .ctrl_dp_ex1_st_sel              (ctrl_dp_ex1_st_sel             ),
  .ctrl_dp_pipe_down               (ctrl_dp_pipe_down              ),
  .ctrl_dp_pipe_down_gate          (ctrl_dp_pipe_down_gate         ),
  .decd_dp_ag_imm                  (decd_dp_ag_imm                 ),
  .decd_dp_ag_imm_vld              (decd_dp_ag_imm_vld             ),
  .decd_dp_csri_rs1                (decd_dp_csri_rs1               ),
  .decd_dp_csri_vld                (decd_dp_csri_vld               ),
  .decd_dp_ex_st_rs2_vld           (decd_dp_ex_st_rs2_vld          ),
  .decd_dp_func                    (decd_dp_func                   ),
  .decd_dp_imm                     (decd_dp_imm                    ),
  .decd_dp_imm_vld                 (decd_dp_imm_vld                ),
  .decd_dp_lsr_vld                 (decd_dp_lsr_vld                ),
  .decd_dp_lsu_sel                 (decd_dp_lsu_sel                ),
  .decd_dp_mul_high_sel            (decd_dp_mul_high_sel           ),
  .decd_dp_rd2_vld                 (decd_dp_rd2_vld                ),
  .decd_dp_rs1_idx                 (decd_dp_rs1_idx                ),
  .decd_dp_rs1_vld                 (decd_dp_rs1_vld                ),
  .decd_dp_rs2_idx                 (decd_dp_rs2_idx                ),
  .decd_dp_rs2_vld                 (decd_dp_rs2_vld                ),
  .decd_dp_rs3_idx                 (decd_dp_rs3_idx                ),
  .decd_dp_rs3_vld                 (decd_dp_rs3_vld                ),
  .decd_dp_rs4_idx                 (decd_dp_rs4_idx                ),
  .decd_dp_rs4_vld                 (decd_dp_rs4_vld                ),
  .decd_dp_smal_vld                (decd_dp_smal_vld               ),
  .decd_dp_split                   (decd_dp_split                  ),
  .dp_ctrl_ex1_ex_st_rs2_vld       (dp_ctrl_ex1_ex_st_rs2_vld      ),
  .dp_ctrl_ex1_st_vld              (dp_ctrl_ex1_st_vld             ),
  .dp_ctrl_rs1_dep_ex1_dst         (dp_ctrl_rs1_dep_ex1_dst        ),
  .dp_ctrl_rs1_fwd_lsu             (dp_ctrl_rs1_fwd_lsu            ),
  .dp_ctrl_rs1_stall_upd           (dp_ctrl_rs1_stall_upd          ),
  .dp_ctrl_rs2_dep_ex1_dst         (dp_ctrl_rs2_dep_ex1_dst        ),
  .dp_ctrl_rs2_fwd_lsu             (dp_ctrl_rs2_fwd_lsu            ),
  .dp_ctrl_rs2_stall_upd           (dp_ctrl_rs2_stall_upd          ),
  .dp_ctrl_rs3_dep_ex1_dst         (dp_ctrl_rs3_dep_ex1_dst        ),
  .dp_ctrl_rs3_fwd_lsu             (dp_ctrl_rs3_fwd_lsu            ),
  .dp_ctrl_rs3_stall_upd           (dp_ctrl_rs3_stall_upd          ),
  .dp_ctrl_rs_norm_stall           (dp_ctrl_rs_norm_stall          ),
  .dp_decd_rs2_aft_fwd             (dp_decd_rs2_aft_fwd            ),
  .dp_gpr_rs1_fwd_div              (dp_gpr_rs1_fwd_div             ),
  .dp_gpr_rs1_fwd_lsu              (dp_gpr_rs1_fwd_lsu             ),
  .dp_gpr_rs2_fwd_div              (dp_gpr_rs2_fwd_div             ),
  .dp_gpr_rs2_fwd_lsu              (dp_gpr_rs2_fwd_lsu             ),
  .dp_gpr_rs3_fwd_div              (dp_gpr_rs3_fwd_div             ),
  .dp_gpr_rs3_fwd_lsu              (dp_gpr_rs3_fwd_lsu             ),
  .dp_gpr_rs4_fwd_div              (dp_gpr_rs4_fwd_div             ),
  .dp_gpr_rs4_fwd_lsu              (dp_gpr_rs4_fwd_lsu             ),
  .dp_gpr_x2_busy                  (dp_gpr_x2_busy                 ),
  .dp_gpr_x2_busy2                 (dp_gpr_x2_busy2                ),
  .dp_id_fp_ex1_rs2_idx            (dp_id_fp_ex1_rs2_idx           ),
  .fdecd_dp_rs1_int_vld            (fdecd_dp_rs1_int_vld           ),
  .fdecd_dp_rs2_idx                (fdecd_dp_rs2_idx               ),
  .fdecd_dp_rs2_vld                (fdecd_dp_rs2_vld               ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .gpr_dp_id_x2_wr                 (gpr_dp_id_x2_wr                ),
  .gpr_dp_rs1                      (gpr_dp_rs1                     ),
  .gpr_dp_rs2                      (gpr_dp_rs2                     ),
  .gpr_dp_rs3                      (gpr_dp_rs3                     ),
  .gpr_dp_rs4                      (gpr_dp_rs4                     ),
  .hd_dp_rs2_sel                   (hd_dp_rs2_sel                  ),
  .hs_dp_ipop_int_mask             (hs_dp_ipop_int_mask            ),
  .hs_dp_ipop_tail                 (hs_dp_ipop_tail                ),
  .hs_dp_ipop_tail_gate            (hs_dp_ipop_tail_gate           ),
  .hs_dp_ipush_spec_fail           (hs_dp_ipush_spec_fail          ),
  .hs_dp_mie_en                    (hs_dp_mie_en                   ),
  .hs_dp_rs2_mcause                (hs_dp_rs2_mcause               ),
  .hs_dp_rs2_mepc                  (hs_dp_rs2_mepc                 ),
  .hs_dp_sp_wb_pending             (hs_dp_sp_wb_pending            ),
  .id_fp_dp_srcf1                  (id_fp_dp_srcf1                 ),
  .idu_cp0_ex1_func                (idu_cp0_ex1_func               ),
  .idu_cp0_ex1_ipush_spec_fail     (idu_cp0_ex1_ipush_spec_fail    ),
  .idu_cp0_ex1_opcode              (idu_cp0_ex1_opcode             ),
  .idu_cp0_ex1_rs1                 (idu_cp0_ex1_rs1                ),
  .idu_cp0_ex1_rs2                 (idu_cp0_ex1_rs2                ),
  .idu_cp0_ex1_split_inst          (idu_cp0_ex1_split_inst         ),
  .idu_fpu_ex1_srci                (idu_fpu_ex1_srci               ),
  .idu_ifu_tail_vld                (idu_ifu_tail_vld               ),
  .idu_ifu_tail_vld_gate           (idu_ifu_tail_vld_gate          ),
  .idu_iu_ex1_ag_imm               (idu_iu_ex1_ag_imm              ),
  .idu_iu_ex1_func                 (idu_iu_ex1_func                ),
  .idu_iu_ex1_ipop_int_mask        (idu_iu_ex1_ipop_int_mask       ),
  .idu_iu_ex1_ipush_mie_en         (idu_iu_ex1_ipush_mie_en        ),
  .idu_iu_ex1_ipush_spec_fail      (idu_iu_ex1_ipush_spec_fail     ),
  .idu_iu_ex1_mul_high_sel         (idu_iu_ex1_mul_high_sel        ),
  .idu_iu_ex1_rd_pair              (idu_iu_ex1_rd_pair             ),
  .idu_iu_ex1_split                (idu_iu_ex1_split               ),
  .idu_iu_ex1_src0                 (idu_iu_ex1_src0                ),
  .idu_iu_ex1_src0_reg             (idu_iu_ex1_src0_reg            ),
  .idu_iu_ex1_src1                 (idu_iu_ex1_src1                ),
  .idu_iu_ex1_src1_reg             (idu_iu_ex1_src1_reg            ),
  .idu_iu_ex1_src2                 (idu_iu_ex1_src2                ),
  .idu_iu_ex1_tail_int_vld         (idu_iu_ex1_tail_int_vld        ),
  .idu_lsu_ex1_ag_imm              (idu_lsu_ex1_ag_imm             ),
  .idu_lsu_ex1_base                (idu_lsu_ex1_base               ),
  .idu_lsu_ex1_base_wb             (idu_lsu_ex1_base_wb            ),
  .idu_lsu_ex1_data                (idu_lsu_ex1_data               ),
  .idu_lsu_ex1_func                (idu_lsu_ex1_func               ),
  .idu_lsu_ex1_ipop_int_mask       (idu_lsu_ex1_ipop_int_mask      ),
  .idu_lsu_ex1_offset_sel          (idu_lsu_ex1_offset_sel         ),
  .idu_lsu_ex1_sign_extend         (idu_lsu_ex1_sign_extend        ),
  .idu_lsu_ex1_size                (idu_lsu_ex1_size               ),
  .idu_lsu_ex1_split               (idu_lsu_ex1_split              ),
  .idu_lsu_ex1_src0_reg            (idu_lsu_ex1_src0_reg           ),
  .idu_lsu_ex1_src1_reg            (idu_lsu_ex1_src1_reg           ),
  .ifu_idu_warm_up                 (ifu_idu_warm_up                ),
  .iu_idu_ex1_fwd_data             (iu_idu_ex1_fwd_data            ),
  .iu_idu_ex1_fwd_preg             (iu_idu_ex1_fwd_preg            ),
  .iu_idu_ex1_fwd_vld              (iu_idu_ex1_fwd_vld             ),
  .iu_idu_ex1_src1_update_value    (iu_idu_ex1_src1_update_value   ),
  .iu_idu_ex2_div_vld              (iu_idu_ex2_div_vld             ),
  .iu_idu_ex2_fwd_data0            (iu_idu_ex2_fwd_data0           ),
  .iu_idu_ex2_fwd_data1            (iu_idu_ex2_fwd_data1           ),
  .iu_idu_ex2_fwd_preg0            (iu_idu_ex2_fwd_preg0           ),
  .iu_idu_ex2_fwd_preg1            (iu_idu_ex2_fwd_preg1           ),
  .iu_idu_ex2_fwd_vld0             (iu_idu_ex2_fwd_vld0            ),
  .iu_idu_ex2_fwd_vld1             (iu_idu_ex2_fwd_vld1            ),
  .iu_idu_ex2_inst_vld             (iu_idu_ex2_inst_vld            ),
  .iu_idu_ex2_rd_pair              (iu_idu_ex2_rd_pair             ),
  .lsu_idu_ex1_src1_update_en      (lsu_idu_ex1_src1_update_en     ),
  .lsu_idu_ex1_src1_update_en_gate (lsu_idu_ex1_src1_update_en_gate),
  .lsu_idu_ex2_fwd_data            (lsu_idu_ex2_fwd_data           ),
  .lsu_idu_ex2_fwd_preg            (lsu_idu_ex2_fwd_preg           ),
  .lsu_idu_ex2_fwd_vld             (lsu_idu_ex2_fwd_vld            ),
  .lsu_idu_ex3_fwd_data            (lsu_idu_ex3_fwd_data           ),
  .lsu_idu_ex3_fwd_preg            (lsu_idu_ex3_fwd_preg           ),
  .lsu_idu_ex3_fwd_vld             (lsu_idu_ex3_fwd_vld            ),
  .lsu_idu_update_addr             (lsu_idu_update_addr            ),
  .lsu_idu_update_en               (lsu_idu_update_en              ),
  .lsu_idu_update_en_gate          (lsu_idu_update_en_gate         ),
  .lsu_idu_update_offset           (lsu_idu_update_offset          ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             )
);


// Split Module
// &Instance("pa_idu_split"); @42
pa_idu_split  x_pa_idu_split (
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_split_bkpt_vld           (ctrl_split_bkpt_vld          ),
  .ctrl_split_stall              (ctrl_split_stall             ),
  .decd_split_dst_idx            (decd_split_dst_idx           ),
  .decd_split_opcode             (decd_split_opcode            ),
  .decd_split_req                (decd_split_req               ),
  .decd_split_rs1_idx            (decd_split_rs1_idx           ),
  .decd_split_rs2_idx            (decd_split_rs2_idx           ),
  .decd_split_rs2_vld            (decd_split_rs2_vld           ),
  .idu_misc_cpuclk               (idu_misc_cpuclk              ),
  .ifu_idu_chgflw_flush          (ifu_idu_chgflw_flush         ),
  .ifu_idu_id_inst_vld           (ifu_idu_id_inst_vld          ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .split_ctrl_cancel             (split_ctrl_cancel            ),
  .split_ctrl_icg_en             (split_ctrl_icg_en            ),
  .split_ctrl_stall              (split_ctrl_stall             ),
  .split_decd_ag_imm             (split_decd_ag_imm            ),
  .split_decd_ag_imm_vld         (split_decd_ag_imm_vld        ),
  .split_decd_dp_sel             (split_decd_dp_sel            ),
  .split_decd_dst_idx            (split_decd_dst_idx           ),
  .split_decd_dst_vld            (split_decd_dst_vld           ),
  .split_decd_func               (split_decd_func              ),
  .split_decd_rs1_idx            (split_decd_rs1_idx           ),
  .split_decd_rs1_vld            (split_decd_rs1_vld           ),
  .split_decd_rs2_idx            (split_decd_rs2_idx           ),
  .split_decd_rs2_imm            (split_decd_rs2_imm           ),
  .split_decd_rs2_imm_vld        (split_decd_rs2_imm_vld       ),
  .split_decd_rs2_vld            (split_decd_rs2_vld           ),
  .split_decd_sel                (split_decd_sel               ),
  .split_decd_split              (split_decd_split             ),
  .split_top_cur_st              (split_top_cur_st             )
);


// Hardware Stack Module
// &Instance("pa_idu_hs"); @46
pa_idu_hs  x_pa_idu_hs (
  .cp0_idu_icg_en                            (cp0_idu_icg_en                           ),
  .cp0_idu_spec_push_en                      (cp0_idu_spec_push_en                     ),
  .cp0_idu_swap_sp_en                        (cp0_idu_swap_sp_en                       ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cpurst_b                                  (cpurst_b                                 ),
  .ctrl_hs_be_idle                           (ctrl_hs_be_idle                          ),
  .ctrl_hs_bkpt_vld                          (ctrl_hs_bkpt_vld                         ),
  .ctrl_hs_no_op                             (ctrl_hs_no_op                            ),
  .ctrl_hs_stall                             (ctrl_hs_stall                            ),
  .decd_hs_ipop_vld                          (decd_hs_ipop_vld                         ),
  .decd_hs_ipush_vld                         (decd_hs_ipush_vld                        ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .gpr_hs_sp_busy                            (gpr_hs_sp_busy                           ),
  .gpr_hs_sp_busy2                           (gpr_hs_sp_busy2                          ),
  .gpr_hs_sp_wb                              (gpr_hs_sp_wb                             ),
  .hd_dp_rs2_sel                             (hd_dp_rs2_sel                            ),
  .hs_ctrl_cancel                            (hs_ctrl_cancel                           ),
  .hs_ctrl_inst_vld                          (hs_ctrl_inst_vld                         ),
  .hs_ctrl_stall                             (hs_ctrl_stall                            ),
  .hs_decd_dp_vld                            (hs_decd_dp_vld                           ),
  .hs_decd_dst_vld                           (hs_decd_dst_vld                          ),
  .hs_decd_func                              (hs_decd_func                             ),
  .hs_decd_imm                               (hs_decd_imm                              ),
  .hs_decd_imm_vld                           (hs_decd_imm_vld                          ),
  .hs_decd_rd                                (hs_decd_rd                               ),
  .hs_decd_rs1                               (hs_decd_rs1                              ),
  .hs_decd_rs1_vld                           (hs_decd_rs1_vld                          ),
  .hs_decd_rs2                               (hs_decd_rs2                              ),
  .hs_decd_rs2_imm_vld                       (hs_decd_rs2_imm_vld                      ),
  .hs_decd_rs2_vld                           (hs_decd_rs2_vld                          ),
  .hs_decd_sel                               (hs_decd_sel                              ),
  .hs_decd_split                             (hs_decd_split                            ),
  .hs_dp_ipop_int_mask                       (hs_dp_ipop_int_mask                      ),
  .hs_dp_ipop_tail                           (hs_dp_ipop_tail                          ),
  .hs_dp_ipop_tail_gate                      (hs_dp_ipop_tail_gate                     ),
  .hs_dp_ipush_spec_fail                     (hs_dp_ipush_spec_fail                    ),
  .hs_dp_mie_en                              (hs_dp_mie_en                             ),
  .hs_dp_rs2_mcause                          (hs_dp_rs2_mcause                         ),
  .hs_dp_rs2_mepc                            (hs_dp_rs2_mepc                           ),
  .hs_dp_sp_wb_pending                       (hs_dp_sp_wb_pending                      ),
  .hs_fdecd_dp_vld                           (hs_fdecd_dp_vld                          ),
  .hs_gpr_wb_mask                            (hs_gpr_wb_mask                           ),
  .hs_gpr_wr_mask                            (hs_gpr_wr_mask                           ),
  .idu_cp0_ex1_tail_fail                     (idu_cp0_ex1_tail_fail                    ),
  .idu_cp0_id_tail_vld                       (idu_cp0_id_tail_vld                      ),
  .idu_cp0_sp_swap_pending                   (idu_cp0_sp_swap_pending                  ),
  .idu_cp0_sp_swap_req                       (idu_cp0_sp_swap_req                      ),
  .idu_cp0_sp_swap_req_gate                  (idu_cp0_sp_swap_req_gate                 ),
  .idu_iu_tail_fail                          (idu_iu_tail_fail                         ),
  .idu_iu_tail_fail_gate                     (idu_iu_tail_fail_gate                    ),
  .idu_lsu_ex1_ipush_spec                    (idu_lsu_ex1_ipush_spec                   ),
  .idu_yy_xx_tail_ack                        (idu_yy_xx_tail_ack                       ),
  .ifu_idu_id_inst_vld                       (ifu_idu_id_inst_vld                      ),
  .iu_yy_xx_cancel                           (iu_yy_xx_cancel                          ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_idu_ex2_ipush_spec_inst_expt_vld      (rtu_idu_ex2_ipush_spec_inst_expt_vld     ),
  .rtu_idu_ex2_ipush_spec_inst_halt_info_vld (rtu_idu_ex2_ipush_spec_inst_halt_info_vld),
  .rtu_idu_flush_fe                          (rtu_idu_flush_fe                         ),
  .rtu_idu_id_tail_int_vld                   (rtu_idu_id_tail_int_vld                  ),
  .rtu_yy_xx_expt_int                        (rtu_yy_xx_expt_int                       ),
  .rtu_yy_xx_expt_vld                        (rtu_yy_xx_expt_vld                       ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          )
);

// &Instance("pa_idu_hs_dummy"); @48

// FP Decd Module
// &Instance("pa_idu_decd_fp"); @53
pa_idu_decd_fp  x_pa_idu_decd_fp (
  .cp0_idu_fs             (cp0_idu_fs            ),
  .cp0_idu_rm             (cp0_idu_rm            ),
  .decd_fp_fpr_rd         (decd_fp_fpr_rd        ),
  .decd_fp_fpr_rd_vld     (decd_fp_fpr_rd_vld    ),
  .decd_fp_fpr_rs1        (decd_fp_fpr_rs1       ),
  .decd_fp_fpr_rs1_vld    (decd_fp_fpr_rs1_vld   ),
  .decd_fp_fpr_rs2        (decd_fp_fpr_rs2       ),
  .decd_fp_fpr_rs2_vld    (decd_fp_fpr_rs2_vld   ),
  .decd_fp_fpr_rs3        (decd_fp_fpr_rs3       ),
  .decd_fp_fpr_rs3_vld    (decd_fp_fpr_rs3_vld   ),
  .decd_fp_id_dp_func     (decd_fp_id_dp_func    ),
  .decd_fp_id_fp_dst_idx  (decd_fp_id_fp_dst_idx ),
  .decd_fp_id_fp_dst_vld  (decd_fp_id_fp_dst_vld ),
  .decd_fp_id_fp_inst_vld (decd_fp_id_fp_inst_vld),
  .decd_fp_id_fp_lsu_sel  (decd_fp_id_fp_lsu_sel ),
  .decd_fp_id_fp_rs1_idx  (decd_fp_id_fp_rs1_idx ),
  .decd_fp_id_fp_rs1_vld  (decd_fp_id_fp_rs1_vld ),
  .decd_fp_id_fp_rs2_idx  (decd_fp_id_fp_rs2_idx ),
  .decd_fp_id_fp_rs2_vld  (decd_fp_id_fp_rs2_vld ),
  .decd_fp_id_fp_rs3_idx  (decd_fp_id_fp_rs3_idx ),
  .decd_fp_id_fp_rs3_vld  (decd_fp_id_fp_rs3_vld ),
  .decd_fp_id_fp_unit_sel (decd_fp_id_fp_unit_sel),
  .decd_fp_id_rm          (decd_fp_id_rm         ),
  .fdecd_ctrl_dst_idx     (fdecd_ctrl_dst_idx    ),
  .fdecd_ctrl_dst_vld     (fdecd_ctrl_dst_vld    ),
  .fdecd_ctrl_fls         (fdecd_ctrl_fls        ),
  .fdecd_ctrl_fp_inst_vld (fdecd_ctrl_fp_inst_vld),
  .fdecd_ctrl_int_dst_vld (fdecd_ctrl_int_dst_vld),
  .fdecd_decd_fp_inst_vld (fdecd_decd_fp_inst_vld),
  .fdecd_decd_ill_expt    (fdecd_decd_ill_expt   ),
  .fdecd_decd_imm         (fdecd_decd_imm        ),
  .fdecd_decd_imm_vld     (fdecd_decd_imm_vld    ),
  .fdecd_decd_rd_int_vld  (fdecd_decd_rd_int_vld ),
  .fdecd_decd_rs1_int_vld (fdecd_decd_rs1_int_vld),
  .fdecd_dp_rs1_int_vld   (fdecd_dp_rs1_int_vld  ),
  .fdecd_dp_rs2_idx       (fdecd_dp_rs2_idx      ),
  .fdecd_dp_rs2_vld       (fdecd_dp_rs2_vld      ),
  .hs_fdecd_dp_vld        (hs_fdecd_dp_vld       ),
  .ifu_idu_id_inst        (ifu_idu_id_inst       ),
  .ifu_idu_id_inst_vld    (ifu_idu_id_inst_vld   )
);


// FP Register Module
// &Instance("pa_idu_fpr"); @56
pa_idu_fpr  x_pa_idu_fpr (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_fpr_ex1_int_spec         (ctrl_fpr_ex1_int_spec        ),
  .decd_fp_fpr_rd                (decd_fp_fpr_rd               ),
  .decd_fp_fpr_rd_vld            (decd_fp_fpr_rd_vld           ),
  .decd_fp_fpr_rs1               (decd_fp_fpr_rs1              ),
  .decd_fp_fpr_rs1_vld           (decd_fp_fpr_rs1_vld          ),
  .decd_fp_fpr_rs2               (decd_fp_fpr_rs2              ),
  .decd_fp_fpr_rs2_vld           (decd_fp_fpr_rs2_vld          ),
  .decd_fp_fpr_rs3               (decd_fp_fpr_rs3              ),
  .decd_fp_fpr_rs3_vld           (decd_fp_fpr_rs3_vld          ),
  .forever_cpuclk                (forever_cpuclk               ),
  .fpr_id_fp_rd_busy             (fpr_id_fp_rd_busy            ),
  .fpr_id_fp_rd_busy_lsu         (fpr_id_fp_rd_busy_lsu        ),
  .fpr_id_fp_rs1                 (fpr_id_fp_rs1                ),
  .fpr_id_fp_rs1_busy            (fpr_id_fp_rs1_busy           ),
  .fpr_id_fp_rs1_busy_lsu        (fpr_id_fp_rs1_busy_lsu       ),
  .fpr_id_fp_rs2                 (fpr_id_fp_rs2                ),
  .fpr_id_fp_rs2_busy            (fpr_id_fp_rs2_busy           ),
  .fpr_id_fp_rs2_busy_lsu        (fpr_id_fp_rs2_busy_lsu       ),
  .fpr_id_fp_rs3                 (fpr_id_fp_rs3                ),
  .fpr_id_fp_rs3_busy            (fpr_id_fp_rs3_busy           ),
  .fpr_id_fp_rs3_busy_lsu        (fpr_id_fp_rs3_busy_lsu       ),
  .fpr_top_reg_busy              (fpr_top_reg_busy             ),
  .fpr_top_reg_busy_div          (fpr_top_reg_busy_div         ),
  .fpr_top_reg_busy_lsu          (fpr_top_reg_busy_lsu         ),
  .id_fp_fpr_dst_freg            (id_fp_fpr_dst_freg           ),
  .id_fp_fpr_id_dst_vld          (id_fp_fpr_id_dst_vld         ),
  .id_fp_fpr_ld_inst             (id_fp_fpr_ld_inst            ),
  .id_fp_fpr_wr_issue            (id_fp_fpr_wr_issue           ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_data          (rtu_idu_fgpr_wb_data         ),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_fgpr_wb_reg           (rtu_idu_fgpr_wb_reg          ),
  .rtu_idu_fgpr_wb_vld           (rtu_idu_fgpr_wb_vld          ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .rtu_yy_xx_expt_int            (rtu_yy_xx_expt_int           )
);


// FP ID Pipe Module
// &Instance("pa_idu_id_fp"); @59
pa_idu_id_fp  x_pa_idu_id_fp (
  .cp0_idu_icg_en             (cp0_idu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .ctrl_id_fp_ex1_inst_vld    (ctrl_id_fp_ex1_inst_vld   ),
  .ctrl_id_fp_ex1_lsu_sel     (ctrl_id_fp_ex1_lsu_sel    ),
  .ctrl_id_fp_id_expt_vld     (ctrl_id_fp_id_expt_vld    ),
  .ctrl_id_fp_id_inst_vld     (ctrl_id_fp_id_inst_vld    ),
  .ctrl_id_fp_id_stall        (ctrl_id_fp_id_stall       ),
  .ctrl_id_fp_pipe_down       (ctrl_id_fp_pipe_down      ),
  .ctrl_id_fp_st_rs2_dep      (ctrl_id_fp_st_rs2_dep     ),
  .ctrl_id_fp_uncmit          (ctrl_id_fp_uncmit         ),
  .decd_fp_id_dp_func         (decd_fp_id_dp_func        ),
  .decd_fp_id_fp_dst_idx      (decd_fp_id_fp_dst_idx     ),
  .decd_fp_id_fp_dst_vld      (decd_fp_id_fp_dst_vld     ),
  .decd_fp_id_fp_inst_vld     (decd_fp_id_fp_inst_vld    ),
  .decd_fp_id_fp_lsu_sel      (decd_fp_id_fp_lsu_sel     ),
  .decd_fp_id_fp_rs1_idx      (decd_fp_id_fp_rs1_idx     ),
  .decd_fp_id_fp_rs1_vld      (decd_fp_id_fp_rs1_vld     ),
  .decd_fp_id_fp_rs2_idx      (decd_fp_id_fp_rs2_idx     ),
  .decd_fp_id_fp_rs2_vld      (decd_fp_id_fp_rs2_vld     ),
  .decd_fp_id_fp_rs3_idx      (decd_fp_id_fp_rs3_idx     ),
  .decd_fp_id_fp_rs3_vld      (decd_fp_id_fp_rs3_vld     ),
  .decd_fp_id_fp_unit_sel     (decd_fp_id_fp_unit_sel    ),
  .decd_fp_id_rm              (decd_fp_id_rm             ),
  .dp_id_fp_ex1_rs2_idx       (dp_id_fp_ex1_rs2_idx      ),
  .forever_cpuclk             (forever_cpuclk            ),
  .fpr_id_fp_rd_busy          (fpr_id_fp_rd_busy         ),
  .fpr_id_fp_rd_busy_lsu      (fpr_id_fp_rd_busy_lsu     ),
  .fpr_id_fp_rs1              (fpr_id_fp_rs1             ),
  .fpr_id_fp_rs1_busy         (fpr_id_fp_rs1_busy        ),
  .fpr_id_fp_rs1_busy_lsu     (fpr_id_fp_rs1_busy_lsu    ),
  .fpr_id_fp_rs2              (fpr_id_fp_rs2             ),
  .fpr_id_fp_rs2_busy         (fpr_id_fp_rs2_busy        ),
  .fpr_id_fp_rs2_busy_lsu     (fpr_id_fp_rs2_busy_lsu    ),
  .fpr_id_fp_rs3              (fpr_id_fp_rs3             ),
  .fpr_id_fp_rs3_busy         (fpr_id_fp_rs3_busy        ),
  .fpr_id_fp_rs3_busy_lsu     (fpr_id_fp_rs3_busy_lsu    ),
  .fpu_idu_fwd_data           (fpu_idu_fwd_data          ),
  .fpu_idu_fwd_freg           (fpu_idu_fwd_freg          ),
  .fpu_idu_fwd_vld            (fpu_idu_fwd_vld           ),
  .id_fp_ctrl_id_stall        (id_fp_ctrl_id_stall       ),
  .id_fp_ctrl_rs2_dep_ex1_dst (id_fp_ctrl_rs2_dep_ex1_dst),
  .id_fp_ctrl_rs2_stall_upd   (id_fp_ctrl_rs2_stall_upd  ),
  .id_fp_dp_srcf1             (id_fp_dp_srcf1            ),
  .id_fp_fpr_dst_freg         (id_fp_fpr_dst_freg        ),
  .id_fp_fpr_id_dst_vld       (id_fp_fpr_id_dst_vld      ),
  .id_fp_fpr_ld_inst          (id_fp_fpr_ld_inst         ),
  .id_fp_fpr_wr_issue         (id_fp_fpr_wr_issue        ),
  .idu_fpu_ex1_cmplt_dp_sel   (idu_fpu_ex1_cmplt_dp_sel  ),
  .idu_fpu_ex1_dst_freg       (idu_fpu_ex1_dst_freg      ),
  .idu_fpu_ex1_dst_freg_vld   (idu_fpu_ex1_dst_freg_vld  ),
  .idu_fpu_ex1_dst_preg       (idu_fpu_ex1_dst_preg      ),
  .idu_fpu_ex1_eu_sel         (idu_fpu_ex1_eu_sel        ),
  .idu_fpu_ex1_func           (idu_fpu_ex1_func          ),
  .idu_fpu_ex1_gateclk_vld    (idu_fpu_ex1_gateclk_vld   ),
  .idu_fpu_ex1_inst_vld       (idu_fpu_ex1_inst_vld      ),
  .idu_fpu_ex1_rm             (idu_fpu_ex1_rm            ),
  .idu_fpu_ex1_srcf0          (idu_fpu_ex1_srcf0         ),
  .idu_fpu_ex1_srcf1          (idu_fpu_ex1_srcf1         ),
  .idu_fpu_ex1_srcf2          (idu_fpu_ex1_srcf2         ),
  .ifu_idu_chgflw_flush       (ifu_idu_chgflw_flush      ),
  .ifu_idu_warm_up            (ifu_idu_warm_up           ),
  .iu_idu_bju_global_stall    (iu_idu_bju_global_stall   ),
  .lsu_idu_ex2_ffwd_data      (lsu_idu_ex2_ffwd_data     ),
  .lsu_idu_ex2_ffwd_vld       (lsu_idu_ex2_ffwd_vld      ),
  .lsu_idu_ex2_fwd_freg       (lsu_idu_ex2_fwd_freg      ),
  .lsu_idu_ex3_ffwd_data      (lsu_idu_ex3_ffwd_data     ),
  .lsu_idu_ex3_ffwd_vld       (lsu_idu_ex3_ffwd_vld      ),
  .lsu_idu_ex3_fwd_freg       (lsu_idu_ex3_fwd_freg      ),
  .lsu_idu_global_stall       (lsu_idu_global_stall      ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .rtu_idu_fgpr_wb_data       (rtu_idu_fgpr_wb_data      ),
  .rtu_idu_fgpr_wb_reg        (rtu_idu_fgpr_wb_reg       ),
  .rtu_idu_fgpr_wb_vld        (rtu_idu_fgpr_wb_vld       ),
  .rtu_idu_flush_fe           (rtu_idu_flush_fe          )
);


assign top_debug_info[21:0] = {
                              ctrl_top_ex1_fp_vld,
                              ctrl_top_ex1_vld,
                              ctrl_top_ex1_stall,
                              ctrl_top_id_stall,
                              ctrl_top_id_cancel,
                              ctrl_top_ex1_sel[5:0],
                              ctrl_top_bju_dep2_vld,
                              ctrl_top_bju_dep1_vld,
                              ctrl_top_st_dep_vld,
                              ctrl_top_cp0_stall,
                              ctrl_top_div_stall,
                              ctrl_top_ld_stall,
                              ctrl_top_norm_stall,
                              ctrl_top_id_inst_vld,
                              split_top_cur_st[2:0]
                             };
assign top_fpr_debug_info[95:0] = {
                                  fpr_top_reg_busy_div[31:0],
                                  fpr_top_reg_busy_lsu[31:0],
                                  fpr_top_reg_busy[31:0]
                                  };
assign idu_dtu_debug_info[21:0] = top_debug_info[21:0];
assign idu_dtu_fpr_info[95:0]   = top_fpr_debug_info[95:0];

// &ModuleEnd; @150
endmodule



