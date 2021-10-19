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
module pa_idu_dp(
  cp0_idu_icg_en,
  cp0_idu_mcause,
  cp0_idu_mepc,
  cp0_idu_sp_use_scratch,
  cp0_idu_sp_wdata,
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
  decd_dp_ag_imm,
  decd_dp_ag_imm_vld,
  decd_dp_csri_rs1,
  decd_dp_csri_vld,
  decd_dp_ex_st_rs2_vld,
  decd_dp_func,
  decd_dp_imm,
  decd_dp_imm_vld,
  decd_dp_lsr_vld,
  decd_dp_lsu_sel,
  decd_dp_mul_high_sel,
  decd_dp_rd2_vld,
  decd_dp_rs1_idx,
  decd_dp_rs1_vld,
  decd_dp_rs2_idx,
  decd_dp_rs2_vld,
  decd_dp_rs3_idx,
  decd_dp_rs3_vld,
  decd_dp_rs4_idx,
  decd_dp_rs4_vld,
  decd_dp_smal_vld,
  decd_dp_split,
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
  dp_decd_rs2_aft_fwd,
  dp_gpr_rs1_fwd_div,
  dp_gpr_rs1_fwd_lsu,
  dp_gpr_rs2_fwd_div,
  dp_gpr_rs2_fwd_lsu,
  dp_gpr_rs3_fwd_div,
  dp_gpr_rs3_fwd_lsu,
  dp_gpr_rs4_fwd_div,
  dp_gpr_rs4_fwd_lsu,
  dp_gpr_x2_busy,
  dp_gpr_x2_busy2,
  dp_id_fp_ex1_rs2_idx,
  fdecd_dp_rs1_int_vld,
  fdecd_dp_rs2_idx,
  fdecd_dp_rs2_vld,
  forever_cpuclk,
  gpr_dp_id_x2_wr,
  gpr_dp_rs1,
  gpr_dp_rs2,
  gpr_dp_rs3,
  gpr_dp_rs4,
  hd_dp_rs2_sel,
  hs_dp_ipop_int_mask,
  hs_dp_ipop_tail,
  hs_dp_ipop_tail_gate,
  hs_dp_ipush_spec_fail,
  hs_dp_mie_en,
  hs_dp_rs2_mcause,
  hs_dp_rs2_mepc,
  hs_dp_sp_wb_pending,
  id_fp_dp_srcf1,
  idu_cp0_ex1_func,
  idu_cp0_ex1_ipush_spec_fail,
  idu_cp0_ex1_opcode,
  idu_cp0_ex1_rs1,
  idu_cp0_ex1_rs2,
  idu_cp0_ex1_split_inst,
  idu_fpu_ex1_srci,
  idu_ifu_tail_vld,
  idu_ifu_tail_vld_gate,
  idu_iu_ex1_ag_imm,
  idu_iu_ex1_func,
  idu_iu_ex1_ipop_int_mask,
  idu_iu_ex1_ipush_mie_en,
  idu_iu_ex1_ipush_spec_fail,
  idu_iu_ex1_mul_high_sel,
  idu_iu_ex1_rd_pair,
  idu_iu_ex1_split,
  idu_iu_ex1_src0,
  idu_iu_ex1_src0_reg,
  idu_iu_ex1_src1,
  idu_iu_ex1_src1_reg,
  idu_iu_ex1_src2,
  idu_iu_ex1_tail_int_vld,
  idu_lsu_ex1_ag_imm,
  idu_lsu_ex1_base,
  idu_lsu_ex1_base_wb,
  idu_lsu_ex1_data,
  idu_lsu_ex1_func,
  idu_lsu_ex1_ipop_int_mask,
  idu_lsu_ex1_offset_sel,
  idu_lsu_ex1_sign_extend,
  idu_lsu_ex1_size,
  idu_lsu_ex1_split,
  idu_lsu_ex1_src0_reg,
  idu_lsu_ex1_src1_reg,
  ifu_idu_warm_up,
  iu_idu_ex1_fwd_data,
  iu_idu_ex1_fwd_preg,
  iu_idu_ex1_fwd_vld,
  iu_idu_ex1_src1_update_value,
  iu_idu_ex2_div_vld,
  iu_idu_ex2_fwd_data0,
  iu_idu_ex2_fwd_data1,
  iu_idu_ex2_fwd_preg0,
  iu_idu_ex2_fwd_preg1,
  iu_idu_ex2_fwd_vld0,
  iu_idu_ex2_fwd_vld1,
  iu_idu_ex2_inst_vld,
  iu_idu_ex2_rd_pair,
  lsu_idu_ex1_src1_update_en,
  lsu_idu_ex1_src1_update_en_gate,
  lsu_idu_ex2_fwd_data,
  lsu_idu_ex2_fwd_preg,
  lsu_idu_ex2_fwd_vld,
  lsu_idu_ex3_fwd_data,
  lsu_idu_ex3_fwd_preg,
  lsu_idu_ex3_fwd_vld,
  lsu_idu_update_addr,
  lsu_idu_update_en,
  lsu_idu_update_en_gate,
  lsu_idu_update_offset,
  pad_yy_icg_scan_en
);

// &Ports; @24
input           cp0_idu_icg_en;                 
input   [31:0]  cp0_idu_mcause;                 
input   [31:0]  cp0_idu_mepc;                   
input           cp0_idu_sp_use_scratch;         
input   [31:0]  cp0_idu_sp_wdata;               
input           cp0_yy_clk_en;                  
input           cpurst_b;                       
input           ctrl_dp_ex1_bju_sel;            
input           ctrl_dp_ex1_div_sel;            
input   [5 :0]  ctrl_dp_ex1_dst_preg;           
input           ctrl_dp_ex1_dst_vld;            
input           ctrl_dp_ex1_fls;                
input           ctrl_dp_ex1_inst_vld;           
input           ctrl_dp_ex1_lsu_sel;            
input           ctrl_dp_ex1_rs1_dep;            
input           ctrl_dp_ex1_rs2_dep;            
input           ctrl_dp_ex1_st_sel;             
input           ctrl_dp_pipe_down;              
input           ctrl_dp_pipe_down_gate;         
input   [31:0]  decd_dp_ag_imm;                 
input           decd_dp_ag_imm_vld;             
input   [4 :0]  decd_dp_csri_rs1;               
input           decd_dp_csri_vld;               
input           decd_dp_ex_st_rs2_vld;          
input   [19:0]  decd_dp_func;                   
input   [31:0]  decd_dp_imm;                    
input           decd_dp_imm_vld;                
input           decd_dp_lsr_vld;                
input           decd_dp_lsu_sel;                
input           decd_dp_mul_high_sel;           
input           decd_dp_rd2_vld;                
input   [5 :0]  decd_dp_rs1_idx;                
input           decd_dp_rs1_vld;                
input   [5 :0]  decd_dp_rs2_idx;                
input           decd_dp_rs2_vld;                
input   [5 :0]  decd_dp_rs3_idx;                
input           decd_dp_rs3_vld;                
input   [5 :0]  decd_dp_rs4_idx;                
input           decd_dp_rs4_vld;                
input           decd_dp_smal_vld;               
input           decd_dp_split;                  
input           fdecd_dp_rs1_int_vld;           
input   [5 :0]  fdecd_dp_rs2_idx;               
input           fdecd_dp_rs2_vld;               
input           forever_cpuclk;                 
input           gpr_dp_id_x2_wr;                
input   [31:0]  gpr_dp_rs1;                     
input   [31:0]  gpr_dp_rs2;                     
input   [31:0]  gpr_dp_rs3;                     
input   [31:0]  gpr_dp_rs4;                     
input           hd_dp_rs2_sel;                  
input           hs_dp_ipop_int_mask;            
input           hs_dp_ipop_tail;                
input           hs_dp_ipop_tail_gate;           
input           hs_dp_ipush_spec_fail;          
input           hs_dp_mie_en;                   
input           hs_dp_rs2_mcause;               
input           hs_dp_rs2_mepc;                 
input           hs_dp_sp_wb_pending;            
input   [31:0]  id_fp_dp_srcf1;                 
input           ifu_idu_warm_up;                
input   [31:0]  iu_idu_ex1_fwd_data;            
input   [5 :0]  iu_idu_ex1_fwd_preg;            
input           iu_idu_ex1_fwd_vld;             
input   [31:0]  iu_idu_ex1_src1_update_value;   
input           iu_idu_ex2_div_vld;             
input   [31:0]  iu_idu_ex2_fwd_data0;           
input   [31:0]  iu_idu_ex2_fwd_data1;           
input   [5 :0]  iu_idu_ex2_fwd_preg0;           
input   [5 :0]  iu_idu_ex2_fwd_preg1;           
input           iu_idu_ex2_fwd_vld0;            
input           iu_idu_ex2_fwd_vld1;            
input           iu_idu_ex2_inst_vld;            
input           iu_idu_ex2_rd_pair;             
input           lsu_idu_ex1_src1_update_en;     
input           lsu_idu_ex1_src1_update_en_gate; 
input   [31:0]  lsu_idu_ex2_fwd_data;           
input   [5 :0]  lsu_idu_ex2_fwd_preg;           
input           lsu_idu_ex2_fwd_vld;            
input   [31:0]  lsu_idu_ex3_fwd_data;           
input   [5 :0]  lsu_idu_ex3_fwd_preg;           
input           lsu_idu_ex3_fwd_vld;            
input   [31:0]  lsu_idu_update_addr;            
input           lsu_idu_update_en;              
input           lsu_idu_update_en_gate;         
input   [31:0]  lsu_idu_update_offset;          
input           pad_yy_icg_scan_en;             
output          dp_ctrl_ex1_ex_st_rs2_vld;      
output          dp_ctrl_ex1_st_vld;             
output          dp_ctrl_rs1_dep_ex1_dst;        
output          dp_ctrl_rs1_fwd_lsu;            
output          dp_ctrl_rs1_stall_upd;          
output          dp_ctrl_rs2_dep_ex1_dst;        
output          dp_ctrl_rs2_fwd_lsu;            
output          dp_ctrl_rs2_stall_upd;          
output          dp_ctrl_rs3_dep_ex1_dst;        
output          dp_ctrl_rs3_fwd_lsu;            
output          dp_ctrl_rs3_stall_upd;          
output          dp_ctrl_rs_norm_stall;          
output  [31:0]  dp_decd_rs2_aft_fwd;            
output          dp_gpr_rs1_fwd_div;             
output          dp_gpr_rs1_fwd_lsu;             
output          dp_gpr_rs2_fwd_div;             
output          dp_gpr_rs2_fwd_lsu;             
output          dp_gpr_rs3_fwd_div;             
output          dp_gpr_rs3_fwd_lsu;             
output          dp_gpr_rs4_fwd_div;             
output          dp_gpr_rs4_fwd_lsu;             
output          dp_gpr_x2_busy;                 
output          dp_gpr_x2_busy2;                
output  [4 :0]  dp_id_fp_ex1_rs2_idx;           
output  [19:0]  idu_cp0_ex1_func;               
output          idu_cp0_ex1_ipush_spec_fail;    
output  [31:0]  idu_cp0_ex1_opcode;             
output  [31:0]  idu_cp0_ex1_rs1;                
output  [11:0]  idu_cp0_ex1_rs2;                
output          idu_cp0_ex1_split_inst;         
output  [31:0]  idu_fpu_ex1_srci;               
output          idu_ifu_tail_vld;               
output          idu_ifu_tail_vld_gate;          
output  [31:0]  idu_iu_ex1_ag_imm;              
output  [19:0]  idu_iu_ex1_func;                
output          idu_iu_ex1_ipop_int_mask;       
output          idu_iu_ex1_ipush_mie_en;        
output          idu_iu_ex1_ipush_spec_fail;     
output          idu_iu_ex1_mul_high_sel;        
output          idu_iu_ex1_rd_pair;             
output          idu_iu_ex1_split;               
output  [31:0]  idu_iu_ex1_src0;                
output  [5 :0]  idu_iu_ex1_src0_reg;            
output  [31:0]  idu_iu_ex1_src1;                
output  [5 :0]  idu_iu_ex1_src1_reg;            
output  [31:0]  idu_iu_ex1_src2;                
output          idu_iu_ex1_tail_int_vld;        
output  [31:0]  idu_lsu_ex1_ag_imm;             
output  [31:0]  idu_lsu_ex1_base;               
output          idu_lsu_ex1_base_wb;            
output  [31:0]  idu_lsu_ex1_data;               
output  [3 :0]  idu_lsu_ex1_func;               
output          idu_lsu_ex1_ipop_int_mask;      
output          idu_lsu_ex1_offset_sel;         
output          idu_lsu_ex1_sign_extend;        
output  [1 :0]  idu_lsu_ex1_size;               
output          idu_lsu_ex1_split;              
output  [5 :0]  idu_lsu_ex1_src0_reg;           
output  [5 :0]  idu_lsu_ex1_src1_reg;           

// &Regs; @25
reg     [31:0]  dp_ex1_ag_imm;                  
reg             dp_ex1_ex_st_rs2_vld;           
reg     [19:0]  dp_ex1_func;                    
reg             dp_ex1_ipop_int_mask;           
reg             dp_ex1_ipop_tail;               
reg             dp_ex1_ipush_spec_fail;         
reg             dp_ex1_mie_en;                  
reg             dp_ex1_mul_high_sel;            
reg             dp_ex1_offset_sel;              
reg             dp_ex1_rd_pair;                 
reg             dp_ex1_rs2_mcause;              
reg             dp_ex1_rs2_mepc;                
reg             dp_ex1_smal_vld;                
reg             dp_ex1_split;                   
reg     [31:0]  dp_ex1_src0;                    
reg     [5 :0]  dp_ex1_src0_reg;                
reg     [31:0]  dp_ex1_src1;                    
reg     [5 :0]  dp_ex1_src1_reg;                
reg     [31:0]  dp_ex1_src2;                    
reg     [5 :0]  dp_ex1_src2_reg;                
reg             dp_ex1_src2_sel;                
reg     [31:0]  dp_ex1_src3;                    

// &Wires; @26
wire            cp0_idu_icg_en;                 
wire    [31:0]  cp0_idu_mcause;                 
wire    [31:0]  cp0_idu_mepc;                   
wire            cp0_idu_sp_use_scratch;         
wire    [31:0]  cp0_idu_sp_wdata;               
wire            cp0_yy_clk_en;                  
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
wire            dp_cpuclk;                      
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
wire            dp_ex1_abnormal_sel;            
wire    [31:0]  dp_ex1_st_int_wdata;            
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
wire            dp_icg_en;                      
wire    [31:0]  dp_id_fin_rs1;                  
wire    [31:0]  dp_id_fin_rs2;                  
wire    [31:0]  dp_id_fin_rs3;                  
wire    [31:0]  dp_id_fin_rs4;                  
wire    [4 :0]  dp_id_fp_ex1_rs2_idx;           
wire            dp_imm_cpuclk;                  
wire            dp_imm_icg_en;                  
wire    [31:0]  dp_rs1_aft_fwd_ex2;             
wire    [31:0]  dp_rs1_aft_fwd_ex3;             
wire    [31:0]  dp_rs1_aft_fwd_no_lsu;          
wire    [31:0]  dp_rs1_aft_imm;                 
wire    [31:0]  dp_rs1_aft_wbbr;                
wire            dp_rs1_cpuclk;                  
wire            dp_rs1_dep_ex1;                 
wire            dp_rs1_dep_ex1_lsinc;           
wire            dp_rs1_dep_ex1_pair;            
wire            dp_rs1_dep_ex2_rbus0;           
wire            dp_rs1_dep_ex2_rbus1;           
wire            dp_rs1_fwd_ex1;                 
wire            dp_rs1_fwd_ex1_lsinc;           
wire            dp_rs1_fwd_ex2_lsu;             
wire            dp_rs1_fwd_ex2_rbus;            
wire            dp_rs1_fwd_ex2_rbus0;           
wire            dp_rs1_fwd_ex2_rbus1;           
wire            dp_rs1_fwd_ex3;                 
wire            dp_rs1_fwd_ex3_lsu;             
wire            dp_rs1_icg_en;                  
wire            dp_rs1_rbus_stall;              
wire            dp_rs1_stall_upd;               
wire            dp_rs1_stall_upd_lsu;           
wire    [31:0]  dp_rs2_aft_fwd_ex2;             
wire    [31:0]  dp_rs2_aft_fwd_ex3;             
wire    [31:0]  dp_rs2_aft_fwd_no_lsu;          
wire    [31:0]  dp_rs2_aft_imm;                 
wire    [31:0]  dp_rs2_aft_wbbr;                
wire            dp_rs2_cpuclk;                  
wire            dp_rs2_dep_ex1;                 
wire            dp_rs2_dep_ex1_lsinc;           
wire            dp_rs2_dep_ex1_pair;            
wire            dp_rs2_dep_ex2_rbus0;           
wire            dp_rs2_dep_ex2_rbus1;           
wire            dp_rs2_fwd_ex1;                 
wire            dp_rs2_fwd_ex1_lsinc;           
wire            dp_rs2_fwd_ex2_lsu;             
wire            dp_rs2_fwd_ex2_rbus;            
wire            dp_rs2_fwd_ex2_rbus0;           
wire            dp_rs2_fwd_ex2_rbus1;           
wire            dp_rs2_fwd_ex3;                 
wire            dp_rs2_fwd_ex3_lsu;             
wire            dp_rs2_icg_en;                  
wire            dp_rs2_rbus_stall;              
wire            dp_rs2_stall_upd;               
wire            dp_rs2_stall_upd_lsu;           
wire    [31:0]  dp_rs3_aft_fwd_ex2;             
wire    [31:0]  dp_rs3_aft_fwd_ex3;             
wire    [31:0]  dp_rs3_aft_fwd_no_lsu;          
wire            dp_rs3_cpuclk;                  
wire            dp_rs3_dep_ex1;                 
wire            dp_rs3_dep_ex1_lsinc;           
wire            dp_rs3_dep_ex1_pair;            
wire            dp_rs3_dep_ex2_rbus0;           
wire            dp_rs3_dep_ex2_rbus1;           
wire            dp_rs3_fwd_ex1;                 
wire            dp_rs3_fwd_ex1_lsinc;           
wire            dp_rs3_fwd_ex2_lsu;             
wire            dp_rs3_fwd_ex2_rbus;            
wire            dp_rs3_fwd_ex2_rbus0;           
wire            dp_rs3_fwd_ex2_rbus1;           
wire            dp_rs3_fwd_ex3;                 
wire            dp_rs3_fwd_ex3_lsu;             
wire            dp_rs3_icg_en;                  
wire            dp_rs3_rbus_stall;              
wire            dp_rs3_stall_upd;               
wire    [31:0]  dp_rs4_aft_fwd_ex2;             
wire    [31:0]  dp_rs4_aft_fwd_ex3;             
wire    [31:0]  dp_rs4_aft_fwd_no_lsu;          
wire            dp_rs4_dep_ex1;                 
wire            dp_rs4_dep_ex1_lsinc;           
wire            dp_rs4_dep_ex1_pair;            
wire            dp_rs4_dep_ex2_rbus0;           
wire            dp_rs4_dep_ex2_rbus1;           
wire            dp_rs4_fwd_ex1;                 
wire            dp_rs4_fwd_ex1_lsinc;           
wire            dp_rs4_fwd_ex2_lsu;             
wire            dp_rs4_fwd_ex2_rbus;            
wire            dp_rs4_fwd_ex3;                 
wire            dp_rs4_fwd_ex3_lsu;             
wire            dp_rs4_rbus_stall;              
wire    [31:0]  dp_rs_upd_data;                 
wire            dp_x2_busy;                     
wire            dp_x2_busy2;                    
wire            dp_x2_waw_stall;                
wire            fdecd_dp_rs1_int_vld;           
wire    [5 :0]  fdecd_dp_rs2_idx;               
wire            fdecd_dp_rs2_vld;               
wire            forever_cpuclk;                 
wire            gpr_dp_id_x2_wr;                
wire    [31:0]  gpr_dp_rs1;                     
wire    [31:0]  gpr_dp_rs2;                     
wire    [31:0]  gpr_dp_rs3;                     
wire    [31:0]  gpr_dp_rs4;                     
wire            hd_dp_rs2_sel;                  
wire            hs_dp_ipop_int_mask;            
wire            hs_dp_ipop_tail;                
wire            hs_dp_ipop_tail_gate;           
wire            hs_dp_ipush_spec_fail;          
wire            hs_dp_mie_en;                   
wire            hs_dp_rs2_mcause;               
wire            hs_dp_rs2_mepc;                 
wire            hs_dp_sp_wb_pending;            
wire    [31:0]  id_fp_dp_srcf1;                 
wire    [19:0]  idu_cp0_ex1_func;               
wire            idu_cp0_ex1_ipush_spec_fail;    
wire    [31:0]  idu_cp0_ex1_opcode;             
wire    [31:0]  idu_cp0_ex1_rs1;                
wire    [11:0]  idu_cp0_ex1_rs2;                
wire            idu_cp0_ex1_split_inst;         
wire    [31:0]  idu_fpu_ex1_srci;               
wire            idu_ifu_tail_vld;               
wire            idu_ifu_tail_vld_gate;          
wire    [31:0]  idu_iu_ex1_ag_imm;              
wire    [19:0]  idu_iu_ex1_func;                
wire            idu_iu_ex1_ipop_int_mask;       
wire            idu_iu_ex1_ipush_mie_en;        
wire            idu_iu_ex1_ipush_spec_fail;     
wire            idu_iu_ex1_mul_high_sel;        
wire            idu_iu_ex1_rd_pair;             
wire            idu_iu_ex1_split;               
wire    [31:0]  idu_iu_ex1_src0;                
wire    [5 :0]  idu_iu_ex1_src0_reg;            
wire    [31:0]  idu_iu_ex1_src1;                
wire    [5 :0]  idu_iu_ex1_src1_reg;            
wire    [31:0]  idu_iu_ex1_src2;                
wire            idu_iu_ex1_tail_int_vld;        
wire    [31:0]  idu_lsu_ex1_ag_imm;             
wire    [31:0]  idu_lsu_ex1_base;               
wire            idu_lsu_ex1_base_wb;            
wire    [31:0]  idu_lsu_ex1_data;               
wire    [3 :0]  idu_lsu_ex1_func;               
wire            idu_lsu_ex1_ipop_int_mask;      
wire            idu_lsu_ex1_offset_sel;         
wire            idu_lsu_ex1_sign_extend;        
wire    [1 :0]  idu_lsu_ex1_size;               
wire            idu_lsu_ex1_split;              
wire    [5 :0]  idu_lsu_ex1_src0_reg;           
wire    [5 :0]  idu_lsu_ex1_src1_reg;           
wire            ifu_idu_warm_up;                
wire    [31:0]  iu_idu_ex1_fwd_data;            
wire            iu_idu_ex1_fwd_vld;             
wire    [31:0]  iu_idu_ex1_src1_update_value;   
wire            iu_idu_ex2_div_vld;             
wire    [31:0]  iu_idu_ex2_fwd_data0;           
wire    [31:0]  iu_idu_ex2_fwd_data1;           
wire    [5 :0]  iu_idu_ex2_fwd_preg0;           
wire    [5 :0]  iu_idu_ex2_fwd_preg1;           
wire            iu_idu_ex2_fwd_vld0;            
wire            iu_idu_ex2_fwd_vld1;            
wire            iu_idu_ex2_inst_vld;            
wire            iu_idu_ex2_rd_pair;             
wire            lsu_idu_ex1_src1_update_en;     
wire            lsu_idu_ex1_src1_update_en_gate; 
wire    [31:0]  lsu_idu_ex2_fwd_data;           
wire    [5 :0]  lsu_idu_ex2_fwd_preg;           
wire            lsu_idu_ex2_fwd_vld;            
wire    [31:0]  lsu_idu_ex3_fwd_data;           
wire    [5 :0]  lsu_idu_ex3_fwd_preg;           
wire            lsu_idu_ex3_fwd_vld;            
wire    [31:0]  lsu_idu_update_addr;            
wire            lsu_idu_update_en;              
wire            lsu_idu_update_en_gate;         
wire    [31:0]  lsu_idu_update_offset;          
wire            pad_yy_icg_scan_en;             


parameter FUNC_WIDTH      = 20;
parameter SUB_FUNC_WIDTH  = 5;

//=========================================================
// Data Path Module
// 1. ICG instance
// 2. Operand generation
// 3. Pipeline Registers for Data Path
// 4. Rename for Output
//=========================================================

//-----------------------------------------------
// 1. ICG instance
//-----------------------------------------------
assign dp_icg_en = ctrl_dp_pipe_down_gate
                | ifu_idu_warm_up;
// &Instance("gated_clk_cell", "x_idu_dp_icg_cell"); @44
gated_clk_cell  x_idu_dp_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dp_cpuclk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (dp_icg_en         ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @45
//          .external_en (1'b0), @46
//          .global_en   (cp0_yy_clk_en), @47
//          .module_en   (cp0_idu_icg_en), @48
//          .local_en    (dp_icg_en), @49
//          .clk_out     (dp_cpuclk)); @50

assign dp_rs1_icg_en = ctrl_dp_pipe_down_gate & decd_dp_rs1_vld
                    | ifu_idu_warm_up
                    | ctrl_dp_ex1_rs1_dep
                    | lsu_idu_update_en_gate;
// &Instance("gated_clk_cell", "x_idu_dp_rs1_icg_cell"); @56
gated_clk_cell  x_idu_dp_rs1_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dp_rs1_cpuclk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (dp_rs1_icg_en     ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @57
//          .external_en (1'b0), @58
//          .global_en   (cp0_yy_clk_en), @59
//          .module_en ( cp0_idu_icg_en ) , @60
//          .local_en    (dp_rs1_icg_en), @61
//          .clk_out     (dp_rs1_cpuclk)); @62

assign dp_rs2_icg_en = ctrl_dp_pipe_down_gate & (decd_dp_rs2_vld | decd_dp_imm_vld)
                    | ifu_idu_warm_up
                    | ctrl_dp_ex1_rs2_dep
                    | lsu_idu_ex1_src1_update_en_gate;
// &Instance("gated_clk_cell", "x_idu_dp_rs2_icg_cell"); @68
gated_clk_cell  x_idu_dp_rs2_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dp_rs2_cpuclk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (dp_rs2_icg_en     ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @69
//          .external_en (1'b0), @70
//          .global_en   (cp0_yy_clk_en), @71
//          .module_en ( cp0_idu_icg_en ) , @72
//          .local_en    (dp_rs2_icg_en), @73
//          .clk_out     (dp_rs2_cpuclk)); @74

assign dp_rs3_icg_en = ctrl_dp_pipe_down_gate & decd_dp_rs3_vld
                    | ifu_idu_warm_up
                    | ctrl_dp_ex1_rs2_dep;
// &Instance("gated_clk_cell", "x_idu_dp_rs3_icg_cell"); @79
gated_clk_cell  x_idu_dp_rs3_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dp_rs3_cpuclk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (dp_rs3_icg_en     ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @80
//          .external_en (1'b0), @81
//          .global_en   (cp0_yy_clk_en), @82
//          .module_en ( cp0_idu_icg_en ) , @83
//          .local_en    (dp_rs3_icg_en), @84
//          .clk_out     (dp_rs3_cpuclk)); @85

assign dp_imm_icg_en = ctrl_dp_pipe_down_gate & decd_dp_ag_imm_vld
                    | ifu_idu_warm_up
                    | lsu_idu_update_en_gate;
// &Instance("gated_clk_cell", "x_idu_dp_imm_icg_cell"); @90
gated_clk_cell  x_idu_dp_imm_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dp_imm_cpuclk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (dp_imm_icg_en     ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @91
//          .external_en (1'b0), @92
//          .global_en   (cp0_yy_clk_en), @93
//          .module_en ( cp0_idu_icg_en ) , @94
//          .local_en    (dp_imm_icg_en), @95
//          .clk_out     (dp_imm_cpuclk)); @96

//-----------------------------------------------
// 2. Operand generation
// a. forward data and gpr data selection
// b. immediate data gpr data selection
//-----------------------------------------------

// a. forward data and gpr data selection
// priority: ex1 > ex2 > wb
// Note that wb fwd is already done in gpr
// &Force("input", "iu_idu_ex1_fwd_preg"); @107
// &Force("bus", "iu_idu_ex1_fwd_preg", 5, 0); @108
assign dp_rs1_dep_ex1 = decd_dp_rs1_idx[5:0] == ctrl_dp_ex1_dst_preg[5:0]
                     & ctrl_dp_ex1_dst_preg[5:0] != 6'b0
                     & ctrl_dp_ex1_dst_vld
                     & ~(ctrl_dp_ex1_lsu_sel & dp_ex1_func[8])
                     & (decd_dp_rs1_vld | fdecd_dp_rs1_int_vld);
assign dp_rs1_fwd_ex1 = dp_rs1_dep_ex1 & iu_idu_ex1_fwd_vld | dp_rs1_fwd_ex1_lsinc;

assign dp_rs2_dep_ex1 = decd_dp_rs2_idx[5:0] == ctrl_dp_ex1_dst_preg[5:0]
                     & ctrl_dp_ex1_dst_preg[5:0] != 6'b0
                     & ctrl_dp_ex1_dst_vld
                     & ~(ctrl_dp_ex1_lsu_sel & dp_ex1_func[8])
                     & decd_dp_rs2_vld;
assign dp_rs2_fwd_ex1 = dp_rs2_dep_ex1 & iu_idu_ex1_fwd_vld | dp_rs2_fwd_ex1_lsinc;

assign dp_rs3_dep_ex1 = decd_dp_rs3_idx[5:0] == ctrl_dp_ex1_dst_preg[5:0]
                     & ctrl_dp_ex1_dst_preg[5:0] != 6'b0
                     & ctrl_dp_ex1_dst_vld
                     & ~(ctrl_dp_ex1_lsu_sel & dp_ex1_func[8])
                     & decd_dp_rs3_vld;
assign dp_rs3_fwd_ex1 = dp_rs3_dep_ex1 & iu_idu_ex1_fwd_vld | dp_rs3_fwd_ex1_lsinc;

// fwd from ex1 rs1 when ld/st inc vld 
assign dp_rs1_dep_ex1_lsinc = decd_dp_rs1_idx[5:0] == dp_ex1_src0_reg[5:0]
                     & dp_ex1_src0_reg[5:0] != 6'b0
                     & ctrl_dp_ex1_lsu_sel & dp_ex1_func[8]
                     & (decd_dp_rs1_vld | fdecd_dp_rs1_int_vld);
assign dp_rs1_fwd_ex1_lsinc = dp_rs1_dep_ex1_lsinc & iu_idu_ex1_fwd_vld;

assign dp_rs2_dep_ex1_lsinc = decd_dp_rs2_idx[5:0] == dp_ex1_src0_reg[5:0]
                     & dp_ex1_src0_reg[5:0] != 6'b0
                     & ctrl_dp_ex1_lsu_sel & dp_ex1_func[8]
                     & decd_dp_rs2_vld;
assign dp_rs2_fwd_ex1_lsinc = dp_rs2_dep_ex1_lsinc & iu_idu_ex1_fwd_vld;

assign dp_rs3_dep_ex1_lsinc = decd_dp_rs3_idx[5:0] == dp_ex1_src0_reg[5:0]
                     & dp_ex1_src0_reg[5:0] != 6'b0
                     & ctrl_dp_ex1_lsu_sel & dp_ex1_func[8]
                     & decd_dp_rs3_vld;
assign dp_rs3_fwd_ex1_lsinc = dp_rs3_dep_ex1_lsinc & iu_idu_ex1_fwd_vld;

assign dp_rs4_dep_ex1_lsinc = decd_dp_rs4_idx[5:0] == dp_ex1_src0_reg[5:0]
                     & dp_ex1_src0_reg[5:0] != 6'b0
                     & ctrl_dp_ex1_lsu_sel & dp_ex1_func[8]
                     & decd_dp_rs4_vld;
assign dp_rs4_fwd_ex1_lsinc = dp_rs4_dep_ex1_lsinc & iu_idu_ex1_fwd_vld;

// fwd ex2 lsu
assign dp_rs1_fwd_ex2_lsu = decd_dp_rs1_idx[5:0] == lsu_idu_ex2_fwd_preg[5:0]
                         & decd_dp_rs1_idx[5:0] != 6'b0
                         & lsu_idu_ex2_fwd_vld
                         & ~(dp_rs1_dep_ex1 | dp_rs1_dep_ex1_lsinc)
                         & (decd_dp_rs1_vld | fdecd_dp_rs1_int_vld);
assign dp_rs2_fwd_ex2_lsu = decd_dp_rs2_idx[5:0] == lsu_idu_ex2_fwd_preg[5:0]
                          & decd_dp_rs2_idx[5:0] != 6'b0
                          & lsu_idu_ex2_fwd_vld
                          & ~(dp_rs2_dep_ex1 | dp_rs2_dep_ex1_lsinc | decd_dp_lsr_vld)
                          & decd_dp_rs2_vld;
assign dp_rs3_fwd_ex2_lsu = decd_dp_rs3_idx[5:0] == lsu_idu_ex2_fwd_preg[5:0]
                          & decd_dp_rs3_idx[5:0] != 6'b0
                          & lsu_idu_ex2_fwd_vld
                          & ~(dp_rs3_dep_ex1 | dp_rs3_fwd_ex1_lsinc)
                          & decd_dp_rs3_vld;

// fwd ex2 rbus
assign dp_rs1_fwd_ex2_rbus0 = decd_dp_rs1_idx[5:0] == iu_idu_ex2_fwd_preg0[5:0]
                          & iu_idu_ex2_fwd_vld0;
assign dp_rs2_fwd_ex2_rbus0 = decd_dp_rs2_idx[5:0] == iu_idu_ex2_fwd_preg0[5:0]
                          & iu_idu_ex2_fwd_vld0;
assign dp_rs3_fwd_ex2_rbus0 = decd_dp_rs3_idx[5:0] == iu_idu_ex2_fwd_preg0[5:0]
                          & iu_idu_ex2_fwd_vld0;
assign dp_rs1_fwd_ex2_rbus1 = decd_dp_rs1_idx[5:0] == iu_idu_ex2_fwd_preg1[5:0]
                          & iu_idu_ex2_fwd_vld1;
assign dp_rs2_fwd_ex2_rbus1 = decd_dp_rs2_idx[5:0] == iu_idu_ex2_fwd_preg1[5:0]
                          & iu_idu_ex2_fwd_vld1;
assign dp_rs3_fwd_ex2_rbus1 = decd_dp_rs3_idx[5:0] == iu_idu_ex2_fwd_preg1[5:0]
                          & iu_idu_ex2_fwd_vld1;
assign dp_rs1_fwd_ex2_rbus = decd_dp_rs1_idx[5:0] != 6'b0
                          & (dp_rs1_fwd_ex2_rbus0 | dp_rs1_fwd_ex2_rbus1)
                          & ~(dp_rs1_dep_ex1 | dp_rs1_dep_ex1_lsinc)
                          & (decd_dp_rs1_vld | fdecd_dp_rs1_int_vld);
assign dp_rs2_fwd_ex2_rbus = decd_dp_rs2_idx[5:0] != 6'b0
                          & (dp_rs2_fwd_ex2_rbus0 | dp_rs2_fwd_ex2_rbus1)
                          & ~(dp_rs2_dep_ex1 | dp_rs2_dep_ex1_lsinc)
                          & decd_dp_rs2_vld;
assign dp_rs3_fwd_ex2_rbus = decd_dp_rs3_idx[5:0] != 6'b0
                          & (dp_rs3_fwd_ex2_rbus0 | dp_rs3_fwd_ex2_rbus1)
                          & ~(dp_rs3_dep_ex1 | dp_rs3_dep_ex1_lsinc)
                          & decd_dp_rs3_vld;
assign dp_rs1_aft_fwd_ex2[31:0] =  dp_rs1_fwd_ex2_rbus0 ? iu_idu_ex2_fwd_data0[31:0]
                                                        : iu_idu_ex2_fwd_data1[31:0];
assign dp_rs2_aft_fwd_ex2[31:0] =  dp_rs2_fwd_ex2_rbus0 ? iu_idu_ex2_fwd_data0[31:0]
                                                        : iu_idu_ex2_fwd_data1[31:0];
assign dp_rs3_aft_fwd_ex2[31:0] =  dp_rs3_fwd_ex2_rbus0 ? iu_idu_ex2_fwd_data0[31:0]
                                                        : iu_idu_ex2_fwd_data1[31:0];

// fwd ex3 lsu
assign dp_rs1_fwd_ex3_lsu = decd_dp_rs1_idx[5:0] == lsu_idu_ex3_fwd_preg[5:0]
                         & decd_dp_rs1_idx[5:0] != 6'b0
                         & lsu_idu_ex3_fwd_vld
                         & ~(dp_rs1_dep_ex1 | dp_rs1_dep_ex1_lsinc)
                         & (decd_dp_rs1_vld | fdecd_dp_rs1_int_vld);
assign dp_rs2_fwd_ex3_lsu = decd_dp_rs2_idx[5:0] == lsu_idu_ex3_fwd_preg[5:0]
                          & decd_dp_rs2_idx[5:0] != 6'b0
                          & lsu_idu_ex3_fwd_vld
                          & ~(dp_rs2_dep_ex1 | dp_rs2_dep_ex1_lsinc)
                          & decd_dp_rs2_vld;
assign dp_rs3_fwd_ex3_lsu = decd_dp_rs3_idx[5:0] == lsu_idu_ex3_fwd_preg[5:0]
                          & decd_dp_rs3_idx[5:0] != 6'b0
                          & lsu_idu_ex3_fwd_vld
                          & ~(dp_rs3_dep_ex1 | dp_rs3_fwd_ex1_lsinc)
                          & decd_dp_rs3_vld;
assign dp_rs4_fwd_ex3_lsu = decd_dp_rs4_idx[5:0] == lsu_idu_ex3_fwd_preg[5:0]
                          & decd_dp_rs4_idx[5:0] != 6'b0
                          & lsu_idu_ex3_fwd_vld
                          & ~(dp_rs4_dep_ex1 | dp_rs4_fwd_ex1_lsinc)
                          & decd_dp_rs4_vld;

//assign dp_rs1_fwd_ex3_fpu = decd_dp_rs1_idx[5:0] != 6'b0
//                          & decd_dp_rs1_idx[5:0] == fpu_rtu_wb_preg[5:0]
//                          & ~(dp_rs1_dep_ex1 | dp_rs1_dep_ex1_lsinc)
//                          & (decd_dp_rs1_vld | fdecd_dp_rs1_int_vld)
//                          & fpu_rtu_wb_vld;
//assign dp_rs2_fwd_ex3_fpu = decd_dp_rs2_idx[5:0] != 6'b0
//                          & decd_dp_rs2_idx[5:0] == fpu_rtu_wb_preg[5:0]
//                          & ~(dp_rs2_dep_ex1 | dp_rs2_dep_ex1_lsinc)
//                          & decd_dp_rs2_vld
//                          & fpu_rtu_wb_vld;
//assign dp_rs3_fwd_ex3_fpu = decd_dp_rs3_idx[5:0] != 6'b0
//                          & decd_dp_rs3_idx[5:0] == fpu_rtu_wb_preg[5:0]
//                          & ~(dp_rs3_dep_ex1 | dp_rs3_dep_ex1_lsinc)
//                          & decd_dp_rs3_vld
//                          & fpu_rtu_wb_vld;
//assign dp_rs4_fwd_ex3_fpu = decd_dp_rs4_idx[5:0] != 6'b0
//                          & decd_dp_rs4_idx[5:0] == fpu_rtu_wb_preg[5:0]
//                          & ~(dp_rs4_dep_ex1 | dp_rs4_dep_ex1_lsinc)
//                          & decd_dp_rs4_vld
//                          & fpu_rtu_wb_vld;
//
//assign dp_rs1_aft_fwd_ex3[31:0] = dp_rs1_fwd_ex3_lsu ? lsu_idu_ex3_fwd_data[31:0]
//                                                     : fpu_rtu_wb_data[31:0];
//assign dp_rs2_aft_fwd_ex3[31:0] = dp_rs2_fwd_ex3_lsu ? lsu_idu_ex3_fwd_data[31:0]
//                                                     : fpu_rtu_wb_data[31:0];
//assign dp_rs3_aft_fwd_ex3[31:0] = dp_rs3_fwd_ex3_lsu ? lsu_idu_ex3_fwd_data[31:0]
//                                                     : fpu_rtu_wb_data[31:0];
//assign dp_rs4_aft_fwd_ex3[31:0] = dp_rs4_fwd_ex3_lsu ? lsu_idu_ex3_fwd_data[31:0]
//                                                     : fpu_rtu_wb_data[31:0];
assign dp_rs1_aft_fwd_ex3[31:0] = lsu_idu_ex3_fwd_data[31:0];
assign dp_rs2_aft_fwd_ex3[31:0] = lsu_idu_ex3_fwd_data[31:0];
assign dp_rs3_aft_fwd_ex3[31:0] = lsu_idu_ex3_fwd_data[31:0];
assign dp_rs4_aft_fwd_ex3[31:0] = lsu_idu_ex3_fwd_data[31:0];

assign dp_rs1_fwd_ex3      = dp_rs1_fwd_ex3_lsu;// | dp_rs1_fwd_ex3_fpu;
assign dp_rs2_fwd_ex3      = dp_rs2_fwd_ex3_lsu;// | dp_rs2_fwd_ex3_fpu;
assign dp_rs3_fwd_ex3      = dp_rs3_fwd_ex3_lsu;// | dp_rs3_fwd_ex3_fpu;
assign dp_rs4_fwd_ex3      = dp_rs4_fwd_ex3_lsu;// | dp_rs4_fwd_ex3_fpu;

assign dp_rs4_dep_ex1      = 1'b0;
assign dp_rs4_fwd_ex1      = 1'b0;
assign dp_rs4_fwd_ex2_rbus = 1'b0;
assign dp_rs4_fwd_ex2_lsu  = 1'b0;
assign dp_rs4_aft_fwd_ex2[31:0] = 32'b0;

assign dp_rs1_aft_fwd_no_lsu[31:0] = dp_rs1_fwd_ex1 ? iu_idu_ex1_fwd_data[31:0]
                                   : dp_rs1_fwd_ex2_rbus ? dp_rs1_aft_fwd_ex2[31:0]
                                   : dp_rs1_fwd_ex3      ? dp_rs1_aft_fwd_ex3[31:0]
                                   : gpr_dp_rs1[31:0];
assign dp_rs2_aft_fwd_no_lsu[31:0] = dp_rs2_fwd_ex1 ? iu_idu_ex1_fwd_data[31:0]
                                   : dp_rs2_fwd_ex2_rbus ? dp_rs2_aft_fwd_ex2[31:0]
                                   : dp_rs2_fwd_ex3      ? dp_rs2_aft_fwd_ex3[31:0]
                                   : gpr_dp_rs2[31:0];
assign dp_rs3_aft_fwd_no_lsu[31:0] = dp_rs3_fwd_ex1 ? iu_idu_ex1_fwd_data[31:0]
                                   : dp_rs3_fwd_ex2_rbus ? dp_rs3_aft_fwd_ex2[31:0]
                                   : dp_rs3_fwd_ex3      ? dp_rs3_aft_fwd_ex3[31:0]
                                   : gpr_dp_rs3[31:0];
assign dp_rs4_aft_fwd_no_lsu[31:0] = dp_rs4_fwd_ex1 ? iu_idu_ex1_fwd_data[31:0]
                                   : dp_rs4_fwd_ex2_rbus ? dp_rs4_aft_fwd_ex2[31:0]
                                   : dp_rs4_fwd_ex3      ? dp_rs4_aft_fwd_ex3[31:0]
                                   : gpr_dp_rs4[31:0];

// b. wbbr data and operand data selection
assign dp_rs1_aft_wbbr[31:0] = dp_rs1_aft_fwd_no_lsu[31:0];
assign dp_rs2_aft_wbbr[31:0] = dp_rs2_aft_fwd_no_lsu[31:0];

// c. immediate data gpr data selection
assign dp_rs1_aft_imm[31:0] = cp0_idu_sp_use_scratch ? cp0_idu_sp_wdata[31:0] : decd_dp_csri_vld ? {27'b0, decd_dp_csri_rs1[4:0]}
                                       : dp_rs1_aft_wbbr[31:0];
assign dp_rs2_aft_imm[31:0] = decd_dp_imm_vld ? decd_dp_imm[31:0]
                                              : dp_rs2_aft_wbbr[31:0];

assign dp_id_fin_rs1[31:0] = dp_rs1_fwd_ex2_lsu & ~dp_rs1_fwd_ex1
                          & ~decd_dp_csri_vld & ~cp0_idu_sp_use_scratch
                           ? lsu_idu_ex2_fwd_data[31:0]
                           : dp_rs1_aft_imm[31:0];
                              
assign dp_id_fin_rs2[31:0] = dp_rs2_fwd_ex2_lsu & ~dp_rs2_fwd_ex1 
                          & ~decd_dp_imm_vld
                           ? lsu_idu_ex2_fwd_data[31:0]
                           : dp_rs2_aft_imm[31:0];
                              
assign dp_id_fin_rs3[31:0] = dp_rs3_fwd_ex2_lsu & ~dp_rs3_fwd_ex1 
                           ? lsu_idu_ex2_fwd_data[31:0]
                           : dp_rs3_aft_fwd_no_lsu[31:0];
                              
assign dp_id_fin_rs4[31:0] = dp_rs4_fwd_ex2_lsu & ~dp_rs4_fwd_ex1 
                           ? lsu_idu_ex2_fwd_data[31:0]
                           : dp_rs4_aft_fwd_no_lsu[31:0];
                              
// d. store data update when lsu ex stall and ex2 fwd hit
assign dp_rs1_stall_upd_lsu = dp_ex1_src0_reg[5:0] == lsu_idu_ex2_fwd_preg[5:0]
                      & dp_ex1_src0_reg[5:0] != 6'b0
                      & lsu_idu_ex2_fwd_vld;
assign dp_rs1_stall_upd = dp_rs1_stall_upd_lsu & ctrl_dp_ex1_bju_sel;// | dp_rs1_stall_upd_rbus;
assign dp_rs2_stall_upd_lsu = dp_ex1_src1_reg[5:0] == lsu_idu_ex2_fwd_preg[5:0]
                      & dp_ex1_src1_reg[5:0] != 6'b0
                      & (ctrl_dp_ex1_bju_sel | ctrl_dp_ex1_st_sel & ~dp_ex1_ex_st_rs2_vld)
                      & lsu_idu_ex2_fwd_vld;
assign dp_rs3_stall_upd = dp_ex1_src2_reg[5:0] == lsu_idu_ex2_fwd_preg[5:0]
                      & dp_ex1_src2_reg[5:0] != 6'b0
                      & (ctrl_dp_ex1_st_sel & dp_ex1_ex_st_rs2_vld)
                      & lsu_idu_ex2_fwd_vld;
assign dp_rs2_stall_upd = dp_rs2_stall_upd_lsu;// | dp_rs2_stall_upd_rbus;
assign dp_rs_upd_data[31:0] = lsu_idu_ex2_fwd_data[31:0];

// when fwd not vld rbus stall
// //&Force("bus", "decd_dp_unit_sel", 5, 0); @425
assign dp_rs1_dep_ex1_pair = decd_dp_rs1_idx[5:0] == {ctrl_dp_ex1_dst_preg[5:1], 1'b1} & ctrl_dp_ex1_inst_vld
                     & dp_ex1_rd_pair & (decd_dp_rs1_vld | fdecd_dp_rs1_int_vld);
assign dp_rs2_dep_ex1_pair = decd_dp_rs2_idx[5:0] == {ctrl_dp_ex1_dst_preg[5:1], 1'b1} & ctrl_dp_ex1_inst_vld
                     & dp_ex1_rd_pair & decd_dp_rs2_vld;
assign dp_rs3_dep_ex1_pair = decd_dp_rs3_idx[5:0] == {ctrl_dp_ex1_dst_preg[5:1], 1'b1} & ctrl_dp_ex1_inst_vld
                     & dp_ex1_rd_pair & decd_dp_rs3_vld;
assign dp_rs4_dep_ex1_pair = decd_dp_rs4_idx[5:0] == {ctrl_dp_ex1_dst_preg[5:1], 1'b1} & ctrl_dp_ex1_inst_vld
                     & dp_ex1_rd_pair & decd_dp_rs4_vld;

assign dp_rs1_dep_ex2_rbus0 = decd_dp_rs1_vld & iu_idu_ex2_inst_vld & decd_dp_rs1_idx[5:0] == iu_idu_ex2_fwd_preg0[5:0];
assign dp_rs1_dep_ex2_rbus1 = decd_dp_rs1_vld & iu_idu_ex2_inst_vld & decd_dp_rs1_idx[5:0] == iu_idu_ex2_fwd_preg1[5:0] & iu_idu_ex2_rd_pair;
assign dp_rs2_dep_ex2_rbus0 = decd_dp_rs2_vld & iu_idu_ex2_inst_vld & decd_dp_rs2_idx[5:0] == iu_idu_ex2_fwd_preg0[5:0];
assign dp_rs2_dep_ex2_rbus1 = decd_dp_rs2_vld & iu_idu_ex2_inst_vld & decd_dp_rs2_idx[5:0] == iu_idu_ex2_fwd_preg1[5:0] & iu_idu_ex2_rd_pair;
assign dp_rs3_dep_ex2_rbus0 = decd_dp_rs3_vld & iu_idu_ex2_inst_vld & decd_dp_rs3_idx[5:0] == iu_idu_ex2_fwd_preg0[5:0];
assign dp_rs3_dep_ex2_rbus1 = decd_dp_rs3_vld & iu_idu_ex2_inst_vld & decd_dp_rs3_idx[5:0] == iu_idu_ex2_fwd_preg1[5:0] & iu_idu_ex2_rd_pair;
assign dp_rs4_dep_ex2_rbus0 = decd_dp_rs4_vld & iu_idu_ex2_inst_vld & decd_dp_rs4_idx[5:0] == iu_idu_ex2_fwd_preg0[5:0];
assign dp_rs4_dep_ex2_rbus1 = decd_dp_rs4_vld & iu_idu_ex2_inst_vld & decd_dp_rs4_idx[5:0] == iu_idu_ex2_fwd_preg1[5:0] & iu_idu_ex2_rd_pair;
assign dp_ex1_abnormal_sel  = ctrl_dp_ex1_lsu_sel | ctrl_dp_ex1_div_sel;
assign dp_rs1_rbus_stall = ctrl_dp_ex1_inst_vld & !dp_ex1_abnormal_sel & dp_rs1_dep_ex1 ? !iu_idu_ex1_fwd_vld
                         : iu_idu_ex2_inst_vld & (dp_rs1_dep_ex2_rbus0 & !iu_idu_ex2_fwd_vld0
                                                | dp_rs1_dep_ex2_rbus1 & !iu_idu_ex2_fwd_vld1);
assign dp_rs2_rbus_stall = ctrl_dp_ex1_inst_vld & !dp_ex1_abnormal_sel & dp_rs2_dep_ex1 ? !iu_idu_ex1_fwd_vld
                         : iu_idu_ex2_inst_vld & (dp_rs2_dep_ex2_rbus0 & !iu_idu_ex2_fwd_vld0
                                                | dp_rs2_dep_ex2_rbus1 & !iu_idu_ex2_fwd_vld1);
assign dp_rs3_rbus_stall = ctrl_dp_ex1_inst_vld & !dp_ex1_abnormal_sel & dp_rs3_dep_ex1 ? !iu_idu_ex1_fwd_vld
                         : iu_idu_ex2_inst_vld & (dp_rs3_dep_ex2_rbus0 & !iu_idu_ex2_fwd_vld0
                                                | dp_rs3_dep_ex2_rbus1 & !iu_idu_ex2_fwd_vld1);
assign dp_rs4_rbus_stall = ctrl_dp_ex1_inst_vld & !dp_ex1_abnormal_sel & dp_rs4_dep_ex1 ? !iu_idu_ex1_fwd_vld
                         : iu_idu_ex2_inst_vld & (dp_rs4_dep_ex2_rbus0 & !iu_idu_ex2_fwd_vld0
                                                | dp_rs4_dep_ex2_rbus1 & !iu_idu_ex2_fwd_vld1);

// x2 iu busy check
assign dp_x2_busy = iu_idu_ex2_inst_vld  & iu_idu_ex2_fwd_preg0[5:0] == 6'h2;
assign dp_x2_busy2 = 1'b0;
assign dp_x2_waw_stall = hs_dp_sp_wb_pending & gpr_dp_id_x2_wr;

//-----------------------------------------------
// 3. Pipeline Registers for Data Path
// a. Operation Function
// b. Operation Source
//-----------------------------------------------
always @ (posedge dp_cpuclk)
begin
  if(ctrl_dp_pipe_down | ifu_idu_warm_up)
  begin
    dp_ex1_func[FUNC_WIDTH-1:0]         <= decd_dp_func[FUNC_WIDTH-1:0];
    dp_ex1_src0_reg[5:0]                <= decd_dp_rs1_idx[5:0];
    dp_ex1_src1_reg[5:0]                <= decd_dp_ex_st_rs2_vld ? decd_dp_rs3_idx[5:0] : fdecd_dp_rs2_vld ? fdecd_dp_rs2_idx[5:0] : ({6{decd_dp_rs2_vld}}
                                         & decd_dp_rs2_idx[5:0]);
    dp_ex1_src2_reg[5:0]                <= decd_dp_rs3_idx[5:0];
    dp_ex1_split                        <= decd_dp_split;
    dp_ex1_ipop_tail                    <= hs_dp_ipop_tail;
    dp_ex1_mie_en                       <= hs_dp_mie_en;
    dp_ex1_ipop_int_mask                <= hs_dp_ipop_int_mask;
    dp_ex1_ex_st_rs2_vld                <= decd_dp_ex_st_rs2_vld;
  end
  else
  begin
    dp_ex1_func[FUNC_WIDTH-1:0]         <= dp_ex1_func[FUNC_WIDTH-1:0];
    dp_ex1_src0_reg[5:0]                <= dp_ex1_src0_reg[5:0];
    dp_ex1_src1_reg[5:0]                <= dp_ex1_src1_reg[5:0];
    dp_ex1_src2_reg[5:0]                <= dp_ex1_src2_reg[5:0];
    dp_ex1_split                        <= dp_ex1_split;
    dp_ex1_mie_en                       <= dp_ex1_mie_en;
    dp_ex1_ipop_int_mask                <= dp_ex1_ipop_int_mask;
    dp_ex1_ex_st_rs2_vld                <= dp_ex1_ex_st_rs2_vld;
  end
end

always @ (posedge dp_rs1_cpuclk)
begin
  if(ctrl_dp_pipe_down & decd_dp_rs1_vld | ifu_idu_warm_up)
    dp_ex1_src0[31:0] <= dp_id_fin_rs1[31:0];
  else if(dp_rs1_stall_upd & ctrl_dp_ex1_rs1_dep)
    dp_ex1_src0[31:0] <= dp_rs_upd_data[31:0];
  else if(lsu_idu_update_en)
    dp_ex1_src0[31:0] <= lsu_idu_update_addr[31:0];
end

always @ (posedge dp_rs2_cpuclk)
begin
  if(ctrl_dp_pipe_down & (decd_dp_rs2_vld | decd_dp_imm_vld) | ifu_idu_warm_up)
  //if(ctrl_dp_pipe_down | ifu_idu_warm_up)
    dp_ex1_src1[31:0] <= dp_id_fin_rs2[31:0];
  else if(dp_rs2_stall_upd & ctrl_dp_ex1_rs2_dep)
    dp_ex1_src1[31:0] <= dp_rs_upd_data[31:0];
  else if(lsu_idu_ex1_src1_update_en)
    dp_ex1_src1[31:0] <= iu_idu_ex1_src1_update_value[31:0];
  else
    dp_ex1_src1[31:0] <= dp_ex1_src1[31:0];
end

always @ (posedge dp_rs3_cpuclk)
begin
  //if(ctrl_dp_pipe_down | ifu_idu_warm_up)
  if(ctrl_dp_pipe_down  & decd_dp_rs3_vld | ifu_idu_warm_up)
    dp_ex1_src2[31:0] <= dp_id_fin_rs3[31:0];
  else if(dp_rs3_stall_upd & ctrl_dp_ex1_rs2_dep)
    dp_ex1_src2[31:0] <= dp_rs_upd_data[31:0];
  else
    dp_ex1_src2[31:0] <= dp_ex1_src2[31:0];
end

always @ (posedge dp_cpuclk)
begin
  //if(ctrl_dp_pipe_down | ifu_idu_warm_up)
  if(ctrl_dp_pipe_down & decd_dp_rs4_vld | ifu_idu_warm_up)
    dp_ex1_src3[31:0] <= dp_id_fin_rs4[31:0];
  else
    dp_ex1_src3[31:0] <= dp_ex1_src3[31:0];
end

always @ (posedge dp_imm_cpuclk)
begin
  if(ctrl_dp_pipe_down & decd_dp_ag_imm_vld | ifu_idu_warm_up)
  begin
    dp_ex1_ag_imm[31:0] <= decd_dp_ag_imm[31:0];
  end
  else if(lsu_idu_update_en)
  begin
    dp_ex1_ag_imm[31:0] <= lsu_idu_update_offset[31:0];
  end
  else
  begin
    dp_ex1_ag_imm[31:0] <= dp_ex1_ag_imm[31:0];
  end
end

always @ (posedge dp_cpuclk)
begin
  if(ctrl_dp_pipe_down | ifu_idu_warm_up)
    dp_ex1_mul_high_sel <= decd_dp_mul_high_sel;
  else
    dp_ex1_mul_high_sel <= dp_ex1_mul_high_sel;
end

always @ (posedge dp_cpuclk)
begin
  if(ctrl_dp_pipe_down | ifu_idu_warm_up)
    dp_ex1_smal_vld <= decd_dp_smal_vld;
  else
    dp_ex1_smal_vld <= dp_ex1_smal_vld;
end

always @ (posedge dp_cpuclk)
begin
  if(ctrl_dp_pipe_down | ifu_idu_warm_up)
    dp_ex1_rd_pair <= decd_dp_rd2_vld;
  else
    dp_ex1_rd_pair <= dp_ex1_rd_pair;
end

always @ (posedge dp_cpuclk)
begin
  if(ctrl_dp_pipe_down | ifu_idu_warm_up)
  begin
    dp_ex1_src2_sel   <= decd_dp_rs3_vld & decd_dp_lsu_sel;
  end
  else
  begin
    dp_ex1_src2_sel   <= dp_ex1_src2_sel;
  end
end

always @ (posedge dp_imm_cpuclk)
begin
  if(ctrl_dp_pipe_down & decd_dp_lsu_sel | ifu_idu_warm_up)
  begin
    dp_ex1_offset_sel <= ~decd_dp_func[9];
  end
  else if(lsu_idu_update_en)
  begin
    dp_ex1_offset_sel <= 1'b1;
  end
  else
  begin
    dp_ex1_offset_sel <= dp_ex1_offset_sel;
  end
end

always @ (posedge dp_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    dp_ex1_ipush_spec_fail <= 1'b0;
  end
  else if(ctrl_dp_pipe_down)
  begin
    dp_ex1_ipush_spec_fail <= hs_dp_ipush_spec_fail;
  end
  else
  begin
    dp_ex1_ipush_spec_fail <= dp_ex1_ipush_spec_fail;
  end
end

always @ (posedge dp_cpuclk)
begin
  if(ctrl_dp_pipe_down | ifu_idu_warm_up)
  begin
    dp_ex1_rs2_mepc   <= hs_dp_rs2_mepc & hd_dp_rs2_sel;
    dp_ex1_rs2_mcause <= hs_dp_rs2_mcause & hd_dp_rs2_sel;
  end
  else
  begin
    dp_ex1_rs2_mepc   <= dp_ex1_rs2_mepc;
    dp_ex1_rs2_mcause <= dp_ex1_rs2_mcause;
  end
end
assign dp_ex1_st_int_wdata[31:0] = dp_ex1_rs2_mepc ? cp0_idu_mepc[31:0] : dp_ex1_rs2_mcause ? cp0_idu_mcause[31:0]
                                 : dp_ex1_src2_sel ? dp_ex1_src2[31:0] : dp_ex1_src1[31:0];

//-----------------------------------------------
// 4. Rename for Output
//-----------------------------------------------
// Output to Ctrl
assign dp_ctrl_rs_norm_stall = dp_rs1_rbus_stall | dp_rs1_dep_ex1_pair
                             | dp_rs2_rbus_stall | dp_rs2_dep_ex1_pair
                             | dp_rs3_rbus_stall | dp_rs3_dep_ex1_pair
                             | dp_rs4_rbus_stall | dp_rs4_dep_ex1_pair
                             | dp_x2_waw_stall;
//assign dp_ctrl_oper_dep_ex1_dst = dp_rs2_dep_ex1
//                               | dp_rd_dep_ex1;
//assign dp_ctrl_oper_dep_ex2_ld = dp_rs2_dep_ex2_ld
//                               | dp_rd_dep_ex2_ld;
//assign dp_ctrl_oper_dep_ex2_div = dp_rs1_dep_ex2_div | dp_rs2_dep_ex2_div
//                               | dp_rd_dep_ex2_div;
//assign dp_ctrl_rd_dep_ex2_iu  = dp_rd_dep_ex2_iu;
//assign dp_ctrl_rs_dep_wb_iu    = dp_rs1_dep_wb_iu | dp_rs2_dep_wb_iu;
//assign dp_ctrl_rd_dep_wb_iu    = dp_rd_dep_wb_iu;
assign dp_ctrl_rs1_dep_ex1_dst = dp_rs1_dep_ex1;
//assign dp_ctrl_rs1_dep_ex2_ld  = dp_rs1_dep_ex2_ld;
assign dp_ctrl_rs2_dep_ex1_dst = dp_rs2_dep_ex1;
assign dp_ctrl_rs3_dep_ex1_dst = dp_rs3_dep_ex1;
//assign dp_ctrl_rs2_dep_ex2_ld  = dp_rs2_dep_ex2_ld;
//assign dp_ctrl_rs_dep_ex1      = dp_rs1_dep_ex1 | dp_rs2_dep_ex1 | dp_rs3_dep_ex1;
//assign dp_ctrl_rd_dep_ex1      = dp_rd_dep_ex1;
// assign dp_ctrl_stall_upd       = dp_rs1_stall_upd | dp_rs2_stall_upd;
assign dp_ctrl_rs1_fwd_lsu   = dp_rs1_fwd_ex2_lsu;
assign dp_ctrl_rs2_fwd_lsu   = dp_rs2_fwd_ex2_lsu;
assign dp_ctrl_rs3_fwd_lsu   = dp_rs3_fwd_ex2_lsu;
//assign dp_gpr_rs1_fwd       = dp_rs1_fwd_ex1 | dp_rs1_fwd_ex2_rbus | dp_rs1_fwd_ex3_rbus;
//assign dp_gpr_rs2_fwd       = dp_rs2_fwd_ex1 | dp_rs2_fwd_ex2_rbus | dp_rs2_fwd_ex3_rbus;
//assign dp_gpr_rs3_fwd       = dp_rs3_fwd_ex1 | dp_rs3_fwd_ex2_rbus | dp_rs3_fwd_ex3_rbus;
//assign dp_gpr_rs4_fwd       = dp_rs4_fwd_ex1 | dp_rs4_fwd_ex2_rbus | dp_rs4_fwd_ex3_rbus;
assign dp_gpr_rs1_fwd_lsu   = dp_rs1_fwd_ex2_lsu;
assign dp_gpr_rs2_fwd_lsu   = dp_rs2_fwd_ex2_lsu;
assign dp_gpr_rs3_fwd_lsu   = dp_rs3_fwd_ex2_lsu;
assign dp_gpr_rs4_fwd_lsu   = dp_rs4_fwd_ex2_lsu;
assign dp_gpr_rs1_fwd_div   = dp_rs1_fwd_ex2_rbus & iu_idu_ex2_div_vld | dp_rs1_fwd_ex1 & ctrl_dp_ex1_div_sel;
assign dp_gpr_rs2_fwd_div   = dp_rs2_fwd_ex2_rbus & iu_idu_ex2_div_vld | dp_rs2_fwd_ex1 & ctrl_dp_ex1_div_sel;
assign dp_gpr_rs3_fwd_div   = dp_rs3_fwd_ex2_rbus & iu_idu_ex2_div_vld | dp_rs3_fwd_ex1 & ctrl_dp_ex1_div_sel;
assign dp_gpr_rs4_fwd_div   = dp_rs4_fwd_ex2_rbus & iu_idu_ex2_div_vld | dp_rs4_fwd_ex1 & ctrl_dp_ex1_div_sel;
assign dp_gpr_x2_busy       = dp_x2_busy;
assign dp_gpr_x2_busy2      = dp_x2_busy2;
assign dp_ctrl_rs1_stall_upd = dp_rs1_stall_upd;
assign dp_ctrl_rs2_stall_upd = dp_rs2_stall_upd;
assign dp_ctrl_rs3_stall_upd = dp_rs3_stall_upd;
assign dp_ctrl_ex1_ex_st_rs2_vld = dp_ex1_ex_st_rs2_vld;
assign dp_ctrl_ex1_st_vld    = dp_ex1_func[0];

assign dp_decd_rs2_aft_fwd[31:0] = dp_rs2_aft_fwd_no_lsu[31:0];

// Output to IU
assign idu_iu_ex1_func[FUNC_WIDTH-1:0]         = dp_ex1_func[FUNC_WIDTH-1:0];
assign idu_iu_ex1_src0[31:0]                   = dp_ex1_src0[31:0];
assign idu_iu_ex1_src1[31:0]                   = dp_ex1_src1[31:0];
assign idu_iu_ex1_src2[31:0]                   = dp_ex1_src2[31:0];
assign idu_iu_ex1_rd_pair                      = 1'b0;
assign idu_iu_ex1_ag_imm[31:0]                 = dp_ex1_ag_imm[31:0];
assign idu_iu_ex1_split                        = dp_ex1_split;
assign idu_iu_ex1_src0_reg[5:0]                = dp_ex1_src0_reg[5:0];
assign idu_iu_ex1_src1_reg[5:0]                = dp_ex1_src1_reg[5:0];
assign idu_iu_ex1_mul_high_sel                 = dp_ex1_mul_high_sel;

assign idu_fpu_ex1_srci[31:0]                  = dp_ex1_src0[31:0];
assign dp_id_fp_ex1_rs2_idx[4:0]               = dp_ex1_src1_reg[4:0];

// Output to CP0
assign idu_cp0_ex1_func[FUNC_WIDTH-1:0]        = dp_ex1_func[FUNC_WIDTH-1:0];
assign idu_cp0_ex1_rs1[31:0]                   = dp_ex1_src0[31:0];
assign idu_cp0_ex1_rs2[11:0]                   = dp_ex1_src1[11:0];
assign idu_cp0_ex1_opcode[31:0]                = dp_ex1_ag_imm[31:0];
assign idu_cp0_ex1_ipush_spec_fail             = dp_ex1_ipush_spec_fail;
assign idu_cp0_ex1_split_inst                  = dp_ex1_split;

// Output to LSU
// Todo
assign idu_lsu_ex1_func[3:0]     = dp_ex1_func[3:0];
assign idu_lsu_ex1_size[1:0]     = dp_ex1_func[6:5];
assign idu_lsu_ex1_src0_reg[5:0] = dp_ex1_src0_reg[5:0];
assign idu_lsu_ex1_src1_reg[5:0] = dp_ex1_src1_reg[5:0];
assign idu_lsu_ex1_sign_extend   = dp_ex1_func[7];
assign idu_lsu_ex1_base[31:0]    = dp_ex1_src0[31:0];
assign idu_lsu_ex1_ag_imm[31:0]  = dp_ex1_ag_imm[31:0];
assign idu_lsu_ex1_base_wb       = dp_ex1_func[8];
assign idu_lsu_ex1_offset_sel    = dp_ex1_offset_sel;
assign idu_lsu_ex1_split         = dp_ex1_split;
assign idu_lsu_ex1_ipop_int_mask = dp_ex1_ipop_int_mask;

assign idu_lsu_ex1_data[31:0]    = ctrl_dp_ex1_fls ? id_fp_dp_srcf1[31:0]
                                 : dp_ex1_st_int_wdata[31:0]; 
// assign idu_lsu_ex1_opcode[31:0]  = dp_ex1_ag_imm[31:0];

// Output to IFU
assign idu_ifu_tail_vld = ctrl_dp_ex1_inst_vld & dp_ex1_ipop_tail | hs_dp_ipop_tail;
assign idu_ifu_tail_vld_gate = ctrl_dp_ex1_inst_vld & dp_ex1_ipop_tail | hs_dp_ipop_tail_gate;

// Output to RTU
assign idu_iu_ex1_ipush_spec_fail = dp_ex1_ipush_spec_fail;
assign idu_iu_ex1_tail_int_vld    = dp_ex1_ipop_tail;
assign idu_iu_ex1_ipush_mie_en     = dp_ex1_mie_en;
assign idu_iu_ex1_ipop_int_mask   = dp_ex1_ipop_int_mask;

// &ModuleEnd; @981
endmodule


