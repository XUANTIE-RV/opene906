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
module pa_iu_top(
  cp0_iu_adder_borrow_in,
  cp0_iu_adder_borrow_vld,
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  fpu_iu_ex1_cmplt,
  fpu_iu_ex1_cmplt_dp,
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
  ifu_iu_chgflw_pc,
  ifu_iu_chgflw_vld,
  ifu_iu_ex1_pc_pred,
  ifu_iu_reset_vld,
  ifu_iu_warm_up,
  iu_cp0_ex1_borrow_expt_pc,
  iu_dtu_debug_info,
  iu_hpcp_inst_bht_mispred,
  iu_hpcp_inst_condbr,
  iu_hpcp_inst_condbr_gate,
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
  iu_ifu_bht_cur_pc,
  iu_ifu_bht_mispred,
  iu_ifu_bht_mispred_gate,
  iu_ifu_bht_pred,
  iu_ifu_bht_taken,
  iu_ifu_br_vld,
  iu_ifu_br_vld_gate,
  iu_ifu_ind_link_vld,
  iu_ifu_link_vld,
  iu_ifu_link_vld_gate,
  iu_ifu_pc_mispred,
  iu_ifu_pc_mispred_gate,
  iu_ifu_ret_vld,
  iu_ifu_ret_vld_gate,
  iu_ifu_tar_pc,
  iu_ifu_tar_pc_vld,
  iu_ifu_tar_pc_vld_gate,
  iu_lsu_ex1_lsi_rst,
  iu_lsu_ex2_wb0_grant,
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
  iu_rtu_wb0_data,
  iu_rtu_wb0_preg,
  iu_rtu_wb0_vld,
  iu_xx_no_op,
  iu_yy_xx_cancel,
  lsu_iu_ex1_base_wb,
  lsu_iu_ex1_src1_sel,
  lsu_iu_ex2_data,
  lsu_iu_ex2_data_vld,
  lsu_iu_ex2_dest_reg,
  lsu_iu_ex2_lsi_dst_preg,
  lsu_iu_ex2_lsi_rslt,
  lsu_iu_ex2_lsi_rslt_vld,
  lsu_rtu_ex1_cmplt_dp,
  pad_yy_icg_scan_en,
  rtu_iu_bju_ex2_cur_pc,
  rtu_iu_ex1_cmplt_dp_vld,
  rtu_iu_ex1_cmplt_inst_len,
  rtu_iu_ex1_cmplt_split_inst,
  rtu_iu_ex1_cmplt_vld,
  rtu_iu_pending_spec_expt_vld,
  rtu_iu_pending_spec_halt_info_vld,
  rtu_xx_ex1_stall,
  rtu_yy_xx_async_flush,
  rtu_yy_xx_flush,
  sysio_iu_rst_addr
);

// &Ports; @24
input           cp0_iu_adder_borrow_in;           
input           cp0_iu_adder_borrow_vld;          
input           cp0_iu_icg_en;                    
input           cp0_yy_clk_en;                    
input           cpurst_b;                         
input           forever_cpuclk;                   
input           fpu_iu_ex1_cmplt;                 
input           fpu_iu_ex1_cmplt_dp;              
input   [31:0]  idu_iu_ex1_ag_imm;                
input           idu_iu_ex1_alu_cmplt_dp_sel;      
input           idu_iu_ex1_alu_gateclk_sel;       
input           idu_iu_ex1_alu_sel;               
input   [1 :0]  idu_iu_ex1_bht_pred;              
input           idu_iu_ex1_bju_cmplt_dp_sel;      
input           idu_iu_ex1_bju_depd_lsu_src0;     
input           idu_iu_ex1_bju_depd_lsu_src1;     
input           idu_iu_ex1_bju_gateclk_sel;       
input           idu_iu_ex1_bju_sel;               
input           idu_iu_ex1_bju_use_pc;            
input           idu_iu_ex1_div_cmplt_dp_sel;      
input           idu_iu_ex1_div_gateclk_sel;       
input           idu_iu_ex1_div_sel;               
input   [5 :0]  idu_iu_ex1_dst_preg;              
input   [19:0]  idu_iu_ex1_func;                  
input           idu_iu_ex1_gateclk_vld;           
input           idu_iu_ex1_inst_len;              
input           idu_iu_ex1_inst_vld;              
input           idu_iu_ex1_ipop_int_mask;         
input           idu_iu_ex1_ipush_mie_en;          
input           idu_iu_ex1_ipush_spec_fail;       
input           idu_iu_ex1_mul_cmplt_dp_sel;      
input           idu_iu_ex1_mul_gateclk_sel;       
input           idu_iu_ex1_mul_high_sel;          
input           idu_iu_ex1_mul_sel;               
input           idu_iu_ex1_rd_pair;               
input           idu_iu_ex1_split;                 
input   [31:0]  idu_iu_ex1_src0;                  
input   [5 :0]  idu_iu_ex1_src0_reg;              
input   [31:0]  idu_iu_ex1_src1;                  
input   [5 :0]  idu_iu_ex1_src1_reg;              
input   [31:0]  idu_iu_ex1_src2;                  
input           idu_iu_ex1_tail_int_vld;          
input           idu_iu_ex1_wb_vld;                
input           idu_iu_tail_fail;                 
input           idu_iu_tail_fail_gate;            
input   [31:0]  ifu_iu_chgflw_pc;                 
input           ifu_iu_chgflw_vld;                
input   [31:0]  ifu_iu_ex1_pc_pred;               
input           ifu_iu_reset_vld;                 
input           ifu_iu_warm_up;                   
input           lsu_iu_ex1_base_wb;               
input           lsu_iu_ex1_src1_sel;              
input   [31:0]  lsu_iu_ex2_data;                  
input           lsu_iu_ex2_data_vld;              
input   [5 :0]  lsu_iu_ex2_dest_reg;              
input   [5 :0]  lsu_iu_ex2_lsi_dst_preg;          
input   [31:0]  lsu_iu_ex2_lsi_rslt;              
input           lsu_iu_ex2_lsi_rslt_vld;          
input           lsu_rtu_ex1_cmplt_dp;             
input           pad_yy_icg_scan_en;               
input   [31:0]  rtu_iu_bju_ex2_cur_pc;            
input           rtu_iu_ex1_cmplt_dp_vld;          
input           rtu_iu_ex1_cmplt_inst_len;        
input           rtu_iu_ex1_cmplt_split_inst;      
input           rtu_iu_ex1_cmplt_vld;             
input           rtu_iu_pending_spec_expt_vld;     
input           rtu_iu_pending_spec_halt_info_vld; 
input           rtu_xx_ex1_stall;                 
input           rtu_yy_xx_async_flush;            
input           rtu_yy_xx_flush;                  
input   [31:0]  sysio_iu_rst_addr;                
output  [31:0]  iu_cp0_ex1_borrow_expt_pc;        
output  [8 :0]  iu_dtu_debug_info;                
output          iu_hpcp_inst_bht_mispred;         
output          iu_hpcp_inst_condbr;              
output          iu_hpcp_inst_condbr_gate;         
output          iu_idu_bju_global_stall;          
output          iu_idu_bju_stall;                 
output  [31:0]  iu_idu_ex1_fwd_data;              
output  [5 :0]  iu_idu_ex1_fwd_preg;              
output          iu_idu_ex1_fwd_vld;               
output  [31:0]  iu_idu_ex1_src1_update_value;     
output          iu_idu_ex1_stall;                 
output          iu_idu_ex2_div_vld;               
output  [31:0]  iu_idu_ex2_fwd_data0;             
output  [31:0]  iu_idu_ex2_fwd_data1;             
output  [5 :0]  iu_idu_ex2_fwd_preg0;             
output  [5 :0]  iu_idu_ex2_fwd_preg1;             
output          iu_idu_ex2_fwd_vld0;              
output          iu_idu_ex2_fwd_vld1;              
output          iu_idu_ex2_inst_vld;              
output          iu_idu_ex2_rd_pair;               
output          iu_idu_id_stall;                  
output  [31:0]  iu_ifu_bht_cur_pc;                
output          iu_ifu_bht_mispred;               
output          iu_ifu_bht_mispred_gate;          
output  [1 :0]  iu_ifu_bht_pred;                  
output          iu_ifu_bht_taken;                 
output          iu_ifu_br_vld;                    
output          iu_ifu_br_vld_gate;               
output          iu_ifu_ind_link_vld;              
output          iu_ifu_link_vld;                  
output          iu_ifu_link_vld_gate;             
output          iu_ifu_pc_mispred;                
output          iu_ifu_pc_mispred_gate;           
output          iu_ifu_ret_vld;                   
output          iu_ifu_ret_vld_gate;              
output  [31:0]  iu_ifu_tar_pc;                    
output          iu_ifu_tar_pc_vld;                
output          iu_ifu_tar_pc_vld_gate;           
output  [31:0]  iu_lsu_ex1_lsi_rst;               
output          iu_lsu_ex2_wb0_grant;             
output          iu_rtu_ex1_bju_branch_inst;       
output          iu_rtu_ex1_bju_cmplt;             
output          iu_rtu_ex1_bju_cmplt_dp;          
output  [30:0]  iu_rtu_ex1_bju_cur_pc;            
output          iu_rtu_ex1_bju_inst_len;          
output          iu_rtu_ex1_bju_inst_vld;          
output          iu_rtu_ex1_bju_split_inst;        
output          iu_rtu_ex1_cmplt;                 
output          iu_rtu_ex1_cmplt_dp;              
output          iu_rtu_ex1_inst_len;              
output          iu_rtu_ex1_inst_vld;              
output          iu_rtu_ex1_ipop_int_mask;         
output          iu_rtu_ex1_ipush_mie_en;          
output          iu_rtu_ex1_ipush_spec_fail;       
output  [30:0]  iu_rtu_ex1_next_pc;               
output          iu_rtu_ex1_split_inst;            
output          iu_rtu_ex1_tail_int_vld;          
output          iu_rtu_ex2_bju_flush;             
output  [30:0]  iu_rtu_ex2_bju_next_pc;           
output          iu_rtu_ex2_bju_next_pc_vld;       
output  [31:0]  iu_rtu_wb0_data;                  
output  [5 :0]  iu_rtu_wb0_preg;                  
output          iu_rtu_wb0_vld;                   
output          iu_xx_no_op;                      
output          iu_yy_xx_cancel;                  

// &Regs; @25

// &Wires; @26
wire    [31:0]  ag_bju_pc;                        
wire    [5 :0]  ag_dp_ex1_dst_preg;               
wire    [31:0]  ag_dp_ex1_fwd_data;               
wire            ag_dp_ex1_fwd_vld;                
wire            alu_dp_ex1_cmplt;                 
wire            alu_dp_ex1_cmplt_dp;              
wire            alu_dp_ex1_fwd_vld;               
wire    [31:0]  alu_dp_ex1_rslt;                  
wire            bju_dp_ex1_cmplt_dp;              
wire    [31:0]  bju_dp_ex1_rslt;                  
wire            bju_dp_ex1_rslt_vld;              
wire            bju_dp_ex1_stall;                 
wire            bju_dp_no_op;                     
wire    [3 :0]  bju_iu_debug_info;                
wire            cp0_iu_adder_borrow_in;           
wire            cp0_iu_adder_borrow_vld;          
wire            cp0_iu_icg_en;                    
wire            cp0_yy_clk_en;                    
wire            cpurst_b;                         
wire            div_ctrl_itering;                 
wire            div_dp_ex1_cmplt;                 
wire            div_dp_ex1_cmplt_dp;              
wire    [31:0]  div_dp_ex1_fwd_data;              
wire            div_dp_ex1_fwd_vld;               
wire            div_dp_ex1_stall;                 
wire    [5 :0]  div_dp_ex2_dst_preg;              
wire    [31:0]  div_dp_ex2_rslt;                  
wire            div_dp_ex2_rslt_vld;              
wire    [4 :0]  div_iu_debug_info;                
wire            dp_xx_ex1_stall;                  
wire            dp_xx_ex2_stall;                  
wire            forever_cpuclk;                   
wire            fpu_iu_ex1_cmplt;                 
wire            fpu_iu_ex1_cmplt_dp;              
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
wire    [31:0]  ifu_iu_chgflw_pc;                 
wire            ifu_iu_chgflw_vld;                
wire    [31:0]  ifu_iu_ex1_pc_pred;               
wire            ifu_iu_reset_vld;                 
wire            ifu_iu_warm_up;                   
wire    [31:0]  iu_cp0_ex1_borrow_expt_pc;        
wire    [8 :0]  iu_dtu_debug_info;                
wire    [31:0]  iu_ex1_cur_pc;                    
wire            iu_ex2_div_grant;                 
wire            iu_hpcp_inst_bht_mispred;         
wire            iu_hpcp_inst_condbr;              
wire            iu_hpcp_inst_condbr_gate;         
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
wire    [31:0]  iu_ifu_bht_cur_pc;                
wire            iu_ifu_bht_mispred;               
wire            iu_ifu_bht_mispred_gate;          
wire    [1 :0]  iu_ifu_bht_pred;                  
wire            iu_ifu_bht_taken;                 
wire            iu_ifu_br_vld;                    
wire            iu_ifu_br_vld_gate;               
wire            iu_ifu_ind_link_vld;              
wire            iu_ifu_link_vld;                  
wire            iu_ifu_link_vld_gate;             
wire            iu_ifu_pc_mispred;                
wire            iu_ifu_pc_mispred_gate;           
wire            iu_ifu_ret_vld;                   
wire            iu_ifu_ret_vld_gate;              
wire    [31:0]  iu_ifu_tar_pc;                    
wire            iu_ifu_tar_pc_vld;                
wire            iu_ifu_tar_pc_vld_gate;           
wire    [31:0]  iu_lsu_ex1_lsi_rst;               
wire            iu_lsu_ex2_wb0_grant;             
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
wire    [31:0]  iu_rtu_wb0_data;                  
wire    [5 :0]  iu_rtu_wb0_preg;                  
wire            iu_rtu_wb0_vld;                   
wire            iu_xx_no_op;                      
wire            iu_yy_xx_cancel;                  
wire            lsu_iu_ex1_base_wb;               
wire            lsu_iu_ex1_src1_sel;              
wire    [31:0]  lsu_iu_ex2_data;                  
wire            lsu_iu_ex2_data_vld;              
wire    [5 :0]  lsu_iu_ex2_dest_reg;              
wire    [5 :0]  lsu_iu_ex2_lsi_dst_preg;          
wire    [31:0]  lsu_iu_ex2_lsi_rslt;              
wire            lsu_iu_ex2_lsi_rslt_vld;          
wire            lsu_rtu_ex1_cmplt_dp;             
wire            mul_dp_ex1_cmplt;                 
wire            mul_dp_ex1_cmplt_dp;              
wire            mul_dp_ex2_inst_vld;              
wire    [31:0]  mul_dp_ex2_rslt0;                 
wire            mul_dp_ex2_rslt0_vld;             
wire            pad_yy_icg_scan_en;               
wire    [31:0]  rtu_iu_bju_ex2_cur_pc;            
wire            rtu_iu_ex1_cmplt_dp_vld;          
wire            rtu_iu_ex1_cmplt_inst_len;        
wire            rtu_iu_ex1_cmplt_split_inst;      
wire            rtu_iu_ex1_cmplt_vld;             
wire            rtu_iu_pending_spec_expt_vld;     
wire            rtu_iu_pending_spec_halt_info_vld; 
wire            rtu_xx_ex1_stall;                 
wire            rtu_yy_xx_async_flush;            
wire            rtu_yy_xx_flush;                  
wire    [31:0]  sysio_iu_rst_addr;                


//TODO
// &Force("output", "iu_rtu_ex1_bju_cmplt");  @29

// &Instance("pa_iu_dsp_alu"); @32
// &Instance("pa_iu_alu"); @34
pa_iu_alu  x_pa_iu_alu (
  .alu_dp_ex1_cmplt            (alu_dp_ex1_cmplt           ),
  .alu_dp_ex1_cmplt_dp         (alu_dp_ex1_cmplt_dp        ),
  .alu_dp_ex1_fwd_vld          (alu_dp_ex1_fwd_vld         ),
  .alu_dp_ex1_rslt             (alu_dp_ex1_rslt            ),
  .dp_xx_ex1_stall             (dp_xx_ex1_stall            ),
  .idu_iu_ex1_alu_cmplt_dp_sel (idu_iu_ex1_alu_cmplt_dp_sel),
  .idu_iu_ex1_alu_gateclk_sel  (idu_iu_ex1_alu_gateclk_sel ),
  .idu_iu_ex1_alu_sel          (idu_iu_ex1_alu_sel         ),
  .idu_iu_ex1_func             (idu_iu_ex1_func            ),
  .idu_iu_ex1_inst_vld         (idu_iu_ex1_inst_vld        ),
  .idu_iu_ex1_src0             (idu_iu_ex1_src0            ),
  .idu_iu_ex1_src1             (idu_iu_ex1_src1            )
);


// &Instance("pa_iu_div"); @37
pa_iu_div  x_pa_iu_div (
  .cp0_iu_icg_en               (cp0_iu_icg_en              ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .div_ctrl_itering            (div_ctrl_itering           ),
  .div_dp_ex1_cmplt            (div_dp_ex1_cmplt           ),
  .div_dp_ex1_cmplt_dp         (div_dp_ex1_cmplt_dp        ),
  .div_dp_ex1_fwd_data         (div_dp_ex1_fwd_data        ),
  .div_dp_ex1_fwd_vld          (div_dp_ex1_fwd_vld         ),
  .div_dp_ex1_stall            (div_dp_ex1_stall           ),
  .div_dp_ex2_dst_preg         (div_dp_ex2_dst_preg        ),
  .div_dp_ex2_rslt             (div_dp_ex2_rslt            ),
  .div_dp_ex2_rslt_vld         (div_dp_ex2_rslt_vld        ),
  .div_iu_debug_info           (div_iu_debug_info          ),
  .forever_cpuclk              (forever_cpuclk             ),
  .idu_iu_ex1_div_cmplt_dp_sel (idu_iu_ex1_div_cmplt_dp_sel),
  .idu_iu_ex1_div_gateclk_sel  (idu_iu_ex1_div_gateclk_sel ),
  .idu_iu_ex1_div_sel          (idu_iu_ex1_div_sel         ),
  .idu_iu_ex1_dst_preg         (idu_iu_ex1_dst_preg        ),
  .idu_iu_ex1_func             (idu_iu_ex1_func            ),
  .idu_iu_ex1_inst_vld         (idu_iu_ex1_inst_vld        ),
  .idu_iu_ex1_src0             (idu_iu_ex1_src0            ),
  .idu_iu_ex1_src1             (idu_iu_ex1_src1            ),
  .idu_iu_ex1_wb_vld           (idu_iu_ex1_wb_vld          ),
  .ifu_iu_warm_up              (ifu_iu_warm_up             ),
  .iu_ex2_div_grant            (iu_ex2_div_grant           ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .rtu_yy_xx_async_flush       (rtu_yy_xx_async_flush      )
);


// &Instance("pa_axi_iu_bju"); @40
// &Instance("pa_iu_bju"); @42
pa_iu_bju  x_pa_iu_bju (
  .ag_bju_pc                    (ag_bju_pc                   ),
  .bju_dp_ex1_cmplt_dp          (bju_dp_ex1_cmplt_dp         ),
  .bju_dp_ex1_rslt              (bju_dp_ex1_rslt             ),
  .bju_dp_ex1_rslt_vld          (bju_dp_ex1_rslt_vld         ),
  .bju_dp_ex1_stall             (bju_dp_ex1_stall            ),
  .bju_dp_no_op                 (bju_dp_no_op                ),
  .bju_iu_debug_info            (bju_iu_debug_info           ),
  .cp0_iu_adder_borrow_in       (cp0_iu_adder_borrow_in      ),
  .cp0_iu_adder_borrow_vld      (cp0_iu_adder_borrow_vld     ),
  .cp0_iu_icg_en                (cp0_iu_icg_en               ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .idu_iu_ex1_bht_pred          (idu_iu_ex1_bht_pred         ),
  .idu_iu_ex1_bju_cmplt_dp_sel  (idu_iu_ex1_bju_cmplt_dp_sel ),
  .idu_iu_ex1_bju_depd_lsu_src0 (idu_iu_ex1_bju_depd_lsu_src0),
  .idu_iu_ex1_bju_depd_lsu_src1 (idu_iu_ex1_bju_depd_lsu_src1),
  .idu_iu_ex1_bju_gateclk_sel   (idu_iu_ex1_bju_gateclk_sel  ),
  .idu_iu_ex1_bju_sel           (idu_iu_ex1_bju_sel          ),
  .idu_iu_ex1_dst_preg          (idu_iu_ex1_dst_preg         ),
  .idu_iu_ex1_func              (idu_iu_ex1_func             ),
  .idu_iu_ex1_gateclk_vld       (idu_iu_ex1_gateclk_vld      ),
  .idu_iu_ex1_inst_len          (idu_iu_ex1_inst_len         ),
  .idu_iu_ex1_inst_vld          (idu_iu_ex1_inst_vld         ),
  .idu_iu_ex1_split             (idu_iu_ex1_split            ),
  .idu_iu_ex1_src0              (idu_iu_ex1_src0             ),
  .idu_iu_ex1_src0_reg          (idu_iu_ex1_src0_reg         ),
  .idu_iu_ex1_src1              (idu_iu_ex1_src1             ),
  .idu_iu_ex1_src1_reg          (idu_iu_ex1_src1_reg         ),
  .idu_iu_ex1_wb_vld            (idu_iu_ex1_wb_vld           ),
  .idu_iu_tail_fail             (idu_iu_tail_fail            ),
  .idu_iu_tail_fail_gate        (idu_iu_tail_fail_gate       ),
  .ifu_iu_chgflw_pc             (ifu_iu_chgflw_pc            ),
  .ifu_iu_chgflw_vld            (ifu_iu_chgflw_vld           ),
  .ifu_iu_ex1_pc_pred           (ifu_iu_ex1_pc_pred          ),
  .ifu_iu_reset_vld             (ifu_iu_reset_vld            ),
  .ifu_iu_warm_up               (ifu_iu_warm_up              ),
  .iu_cp0_ex1_borrow_expt_pc    (iu_cp0_ex1_borrow_expt_pc   ),
  .iu_ex1_cur_pc                (iu_ex1_cur_pc               ),
  .iu_hpcp_inst_bht_mispred     (iu_hpcp_inst_bht_mispred    ),
  .iu_hpcp_inst_condbr          (iu_hpcp_inst_condbr         ),
  .iu_hpcp_inst_condbr_gate     (iu_hpcp_inst_condbr_gate    ),
  .iu_idu_bju_global_stall      (iu_idu_bju_global_stall     ),
  .iu_idu_bju_stall             (iu_idu_bju_stall            ),
  .iu_ifu_bht_cur_pc            (iu_ifu_bht_cur_pc           ),
  .iu_ifu_bht_mispred           (iu_ifu_bht_mispred          ),
  .iu_ifu_bht_mispred_gate      (iu_ifu_bht_mispred_gate     ),
  .iu_ifu_bht_pred              (iu_ifu_bht_pred             ),
  .iu_ifu_bht_taken             (iu_ifu_bht_taken            ),
  .iu_ifu_br_vld                (iu_ifu_br_vld               ),
  .iu_ifu_br_vld_gate           (iu_ifu_br_vld_gate          ),
  .iu_ifu_ind_link_vld          (iu_ifu_ind_link_vld         ),
  .iu_ifu_link_vld              (iu_ifu_link_vld             ),
  .iu_ifu_link_vld_gate         (iu_ifu_link_vld_gate        ),
  .iu_ifu_pc_mispred            (iu_ifu_pc_mispred           ),
  .iu_ifu_pc_mispred_gate       (iu_ifu_pc_mispred_gate      ),
  .iu_ifu_ret_vld               (iu_ifu_ret_vld              ),
  .iu_ifu_ret_vld_gate          (iu_ifu_ret_vld_gate         ),
  .iu_ifu_tar_pc                (iu_ifu_tar_pc               ),
  .iu_ifu_tar_pc_vld            (iu_ifu_tar_pc_vld           ),
  .iu_ifu_tar_pc_vld_gate       (iu_ifu_tar_pc_vld_gate      ),
  .iu_rtu_ex1_bju_branch_inst   (iu_rtu_ex1_bju_branch_inst  ),
  .iu_rtu_ex1_bju_cmplt         (iu_rtu_ex1_bju_cmplt        ),
  .iu_rtu_ex1_bju_cmplt_dp      (iu_rtu_ex1_bju_cmplt_dp     ),
  .iu_rtu_ex1_bju_cur_pc        (iu_rtu_ex1_bju_cur_pc       ),
  .iu_rtu_ex1_bju_inst_len      (iu_rtu_ex1_bju_inst_len     ),
  .iu_rtu_ex1_bju_inst_vld      (iu_rtu_ex1_bju_inst_vld     ),
  .iu_rtu_ex1_bju_split_inst    (iu_rtu_ex1_bju_split_inst   ),
  .iu_rtu_ex1_next_pc           (iu_rtu_ex1_next_pc          ),
  .iu_rtu_ex2_bju_flush         (iu_rtu_ex2_bju_flush        ),
  .iu_rtu_ex2_bju_next_pc       (iu_rtu_ex2_bju_next_pc      ),
  .iu_rtu_ex2_bju_next_pc_vld   (iu_rtu_ex2_bju_next_pc_vld  ),
  .iu_yy_xx_cancel              (iu_yy_xx_cancel             ),
  .lsu_iu_ex2_data              (lsu_iu_ex2_data             ),
  .lsu_iu_ex2_data_vld          (lsu_iu_ex2_data_vld         ),
  .lsu_iu_ex2_dest_reg          (lsu_iu_ex2_dest_reg         ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .rtu_iu_bju_ex2_cur_pc        (rtu_iu_bju_ex2_cur_pc       ),
  .rtu_iu_ex1_cmplt_dp_vld      (rtu_iu_ex1_cmplt_dp_vld     ),
  .rtu_iu_ex1_cmplt_inst_len    (rtu_iu_ex1_cmplt_inst_len   ),
  .rtu_iu_ex1_cmplt_split_inst  (rtu_iu_ex1_cmplt_split_inst ),
  .rtu_iu_ex1_cmplt_vld         (rtu_iu_ex1_cmplt_vld        ),
  .rtu_xx_ex1_stall             (rtu_xx_ex1_stall            ),
  .sysio_iu_rst_addr            (sysio_iu_rst_addr           )
);


// &Instance("pa_iu_addr_gen"); @45
pa_iu_addr_gen  x_pa_iu_addr_gen (
  .ag_bju_pc                    (ag_bju_pc                   ),
  .ag_dp_ex1_dst_preg           (ag_dp_ex1_dst_preg          ),
  .ag_dp_ex1_fwd_data           (ag_dp_ex1_fwd_data          ),
  .ag_dp_ex1_fwd_vld            (ag_dp_ex1_fwd_vld           ),
  .idu_iu_ex1_ag_imm            (idu_iu_ex1_ag_imm           ),
  .idu_iu_ex1_bju_sel           (idu_iu_ex1_bju_sel          ),
  .idu_iu_ex1_bju_use_pc        (idu_iu_ex1_bju_use_pc       ),
  .idu_iu_ex1_src0              (idu_iu_ex1_src0             ),
  .iu_ex1_cur_pc                (iu_ex1_cur_pc               ),
  .iu_idu_ex1_src1_update_value (iu_idu_ex1_src1_update_value),
  .iu_lsu_ex1_lsi_rst           (iu_lsu_ex1_lsi_rst          ),
  .lsu_iu_ex1_base_wb           (lsu_iu_ex1_base_wb          ),
  .lsu_iu_ex1_src1_sel          (lsu_iu_ex1_src1_sel         )
);


// &Instance("pa_iu_ctrl"); @47
pa_iu_ctrl  x_pa_iu_ctrl (
  .ag_dp_ex1_dst_preg                (ag_dp_ex1_dst_preg               ),
  .ag_dp_ex1_fwd_data                (ag_dp_ex1_fwd_data               ),
  .ag_dp_ex1_fwd_vld                 (ag_dp_ex1_fwd_vld                ),
  .alu_dp_ex1_cmplt                  (alu_dp_ex1_cmplt                 ),
  .alu_dp_ex1_cmplt_dp               (alu_dp_ex1_cmplt_dp              ),
  .alu_dp_ex1_fwd_vld                (alu_dp_ex1_fwd_vld               ),
  .alu_dp_ex1_rslt                   (alu_dp_ex1_rslt                  ),
  .bju_dp_ex1_cmplt_dp               (bju_dp_ex1_cmplt_dp              ),
  .bju_dp_ex1_rslt                   (bju_dp_ex1_rslt                  ),
  .bju_dp_ex1_rslt_vld               (bju_dp_ex1_rslt_vld              ),
  .bju_dp_ex1_stall                  (bju_dp_ex1_stall                 ),
  .bju_dp_no_op                      (bju_dp_no_op                     ),
  .cp0_iu_icg_en                     (cp0_iu_icg_en                    ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cpurst_b                          (cpurst_b                         ),
  .div_ctrl_itering                  (div_ctrl_itering                 ),
  .div_dp_ex1_cmplt                  (div_dp_ex1_cmplt                 ),
  .div_dp_ex1_cmplt_dp               (div_dp_ex1_cmplt_dp              ),
  .div_dp_ex1_fwd_data               (div_dp_ex1_fwd_data              ),
  .div_dp_ex1_fwd_vld                (div_dp_ex1_fwd_vld               ),
  .div_dp_ex1_stall                  (div_dp_ex1_stall                 ),
  .div_dp_ex2_dst_preg               (div_dp_ex2_dst_preg              ),
  .div_dp_ex2_rslt                   (div_dp_ex2_rslt                  ),
  .div_dp_ex2_rslt_vld               (div_dp_ex2_rslt_vld              ),
  .dp_xx_ex1_stall                   (dp_xx_ex1_stall                  ),
  .dp_xx_ex2_stall                   (dp_xx_ex2_stall                  ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .fpu_iu_ex1_cmplt                  (fpu_iu_ex1_cmplt                 ),
  .fpu_iu_ex1_cmplt_dp               (fpu_iu_ex1_cmplt_dp              ),
  .idu_iu_ex1_alu_sel                (idu_iu_ex1_alu_sel               ),
  .idu_iu_ex1_dst_preg               (idu_iu_ex1_dst_preg              ),
  .idu_iu_ex1_gateclk_vld            (idu_iu_ex1_gateclk_vld           ),
  .idu_iu_ex1_inst_len               (idu_iu_ex1_inst_len              ),
  .idu_iu_ex1_inst_vld               (idu_iu_ex1_inst_vld              ),
  .idu_iu_ex1_ipop_int_mask          (idu_iu_ex1_ipop_int_mask         ),
  .idu_iu_ex1_ipush_mie_en           (idu_iu_ex1_ipush_mie_en          ),
  .idu_iu_ex1_ipush_spec_fail        (idu_iu_ex1_ipush_spec_fail       ),
  .idu_iu_ex1_mul_sel                (idu_iu_ex1_mul_sel               ),
  .idu_iu_ex1_rd_pair                (idu_iu_ex1_rd_pair               ),
  .idu_iu_ex1_split                  (idu_iu_ex1_split                 ),
  .idu_iu_ex1_tail_int_vld           (idu_iu_ex1_tail_int_vld          ),
  .idu_iu_ex1_wb_vld                 (idu_iu_ex1_wb_vld                ),
  .ifu_iu_warm_up                    (ifu_iu_warm_up                   ),
  .iu_ex2_div_grant                  (iu_ex2_div_grant                 ),
  .iu_idu_ex1_fwd_data               (iu_idu_ex1_fwd_data              ),
  .iu_idu_ex1_fwd_preg               (iu_idu_ex1_fwd_preg              ),
  .iu_idu_ex1_fwd_vld                (iu_idu_ex1_fwd_vld               ),
  .iu_idu_ex1_stall                  (iu_idu_ex1_stall                 ),
  .iu_idu_ex2_div_vld                (iu_idu_ex2_div_vld               ),
  .iu_idu_ex2_fwd_data0              (iu_idu_ex2_fwd_data0             ),
  .iu_idu_ex2_fwd_data1              (iu_idu_ex2_fwd_data1             ),
  .iu_idu_ex2_fwd_preg0              (iu_idu_ex2_fwd_preg0             ),
  .iu_idu_ex2_fwd_preg1              (iu_idu_ex2_fwd_preg1             ),
  .iu_idu_ex2_fwd_vld0               (iu_idu_ex2_fwd_vld0              ),
  .iu_idu_ex2_fwd_vld1               (iu_idu_ex2_fwd_vld1              ),
  .iu_idu_ex2_inst_vld               (iu_idu_ex2_inst_vld              ),
  .iu_idu_ex2_rd_pair                (iu_idu_ex2_rd_pair               ),
  .iu_idu_id_stall                   (iu_idu_id_stall                  ),
  .iu_lsu_ex2_wb0_grant              (iu_lsu_ex2_wb0_grant             ),
  .iu_rtu_ex1_cmplt                  (iu_rtu_ex1_cmplt                 ),
  .iu_rtu_ex1_cmplt_dp               (iu_rtu_ex1_cmplt_dp              ),
  .iu_rtu_ex1_inst_len               (iu_rtu_ex1_inst_len              ),
  .iu_rtu_ex1_inst_vld               (iu_rtu_ex1_inst_vld              ),
  .iu_rtu_ex1_ipop_int_mask          (iu_rtu_ex1_ipop_int_mask         ),
  .iu_rtu_ex1_ipush_mie_en           (iu_rtu_ex1_ipush_mie_en          ),
  .iu_rtu_ex1_ipush_spec_fail        (iu_rtu_ex1_ipush_spec_fail       ),
  .iu_rtu_ex1_split_inst             (iu_rtu_ex1_split_inst            ),
  .iu_rtu_ex1_tail_int_vld           (iu_rtu_ex1_tail_int_vld          ),
  .iu_rtu_wb0_data                   (iu_rtu_wb0_data                  ),
  .iu_rtu_wb0_preg                   (iu_rtu_wb0_preg                  ),
  .iu_rtu_wb0_vld                    (iu_rtu_wb0_vld                   ),
  .iu_xx_no_op                       (iu_xx_no_op                      ),
  .lsu_iu_ex2_lsi_dst_preg           (lsu_iu_ex2_lsi_dst_preg          ),
  .lsu_iu_ex2_lsi_rslt               (lsu_iu_ex2_lsi_rslt              ),
  .lsu_iu_ex2_lsi_rslt_vld           (lsu_iu_ex2_lsi_rslt_vld          ),
  .lsu_rtu_ex1_cmplt_dp              (lsu_rtu_ex1_cmplt_dp             ),
  .mul_dp_ex1_cmplt                  (mul_dp_ex1_cmplt                 ),
  .mul_dp_ex1_cmplt_dp               (mul_dp_ex1_cmplt_dp              ),
  .mul_dp_ex2_inst_vld               (mul_dp_ex2_inst_vld              ),
  .mul_dp_ex2_rslt0                  (mul_dp_ex2_rslt0                 ),
  .mul_dp_ex2_rslt0_vld              (mul_dp_ex2_rslt0_vld             ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .rtu_iu_pending_spec_expt_vld      (rtu_iu_pending_spec_expt_vld     ),
  .rtu_iu_pending_spec_halt_info_vld (rtu_iu_pending_spec_halt_info_vld),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  )
);


// &Instance("pa_iu_dsp_mulu"); @50
// &Instance("pa_iu_mul"); @52
pa_iu_mul  x_pa_iu_mul (
  .cp0_iu_icg_en               (cp0_iu_icg_en              ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .dp_xx_ex1_stall             (dp_xx_ex1_stall            ),
  .dp_xx_ex2_stall             (dp_xx_ex2_stall            ),
  .forever_cpuclk              (forever_cpuclk             ),
  .idu_iu_ex1_func             (idu_iu_ex1_func            ),
  .idu_iu_ex1_gateclk_vld      (idu_iu_ex1_gateclk_vld     ),
  .idu_iu_ex1_inst_vld         (idu_iu_ex1_inst_vld        ),
  .idu_iu_ex1_mul_cmplt_dp_sel (idu_iu_ex1_mul_cmplt_dp_sel),
  .idu_iu_ex1_mul_gateclk_sel  (idu_iu_ex1_mul_gateclk_sel ),
  .idu_iu_ex1_mul_high_sel     (idu_iu_ex1_mul_high_sel    ),
  .idu_iu_ex1_mul_sel          (idu_iu_ex1_mul_sel         ),
  .idu_iu_ex1_src0             (idu_iu_ex1_src0            ),
  .idu_iu_ex1_src1             (idu_iu_ex1_src1            ),
  .idu_iu_ex1_src2             (idu_iu_ex1_src2            ),
  .ifu_iu_warm_up              (ifu_iu_warm_up             ),
  .mul_dp_ex1_cmplt            (mul_dp_ex1_cmplt           ),
  .mul_dp_ex1_cmplt_dp         (mul_dp_ex1_cmplt_dp        ),
  .mul_dp_ex2_inst_vld         (mul_dp_ex2_inst_vld        ),
  .mul_dp_ex2_rslt0            (mul_dp_ex2_rslt0           ),
  .mul_dp_ex2_rslt0_vld        (mul_dp_ex2_rslt0_vld       ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


assign iu_dtu_debug_info[8:0] = {bju_iu_debug_info[3:0], div_iu_debug_info[4:0]};


// &ModuleEnd; @71
endmodule


