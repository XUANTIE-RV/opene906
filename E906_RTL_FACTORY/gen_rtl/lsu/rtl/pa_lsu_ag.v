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

// &Depend("cpu_cfig.h"); @19

// &ModuleBeg; @21
module pa_lsu_ag(
  ag_dc_addr,
  ag_dc_buf,
  ag_dc_bytes_vld,
  ag_dc_ca,
  ag_dc_dcache_grant,
  ag_dc_dest_reg,
  ag_dc_fls,
  ag_dc_func,
  ag_dc_inst_vld,
  ag_dc_inst_vld_gate,
  ag_dc_lm_pass,
  ag_dc_mach_mode,
  ag_dc_ori_size,
  ag_dc_pmp_expt,
  ag_dc_sign_ext,
  ag_dc_size,
  ag_dc_so,
  ag_dc_split,
  ag_dc_split_first,
  ag_dc_split_last,
  ag_dc_src1_depd,
  ag_dc_src1_reg,
  ag_dc_st_data,
  ag_dc_wdata_shift,
  ag_dtu_addr,
  ag_dtu_addr_ready,
  ag_dtu_amo_type,
  ag_dtu_bytes_vld,
  ag_dtu_data,
  ag_dtu_data_chk_mask,
  ag_dtu_data_vld,
  ag_dtu_halt_info,
  ag_dtu_mem_access_size,
  ag_dtu_pipe_down,
  ag_dtu_req,
  ag_dtu_req_gate,
  ag_dtu_split_last,
  ag_dtu_st_type,
  ag_ncb_addr,
  ag_ncb_inst_vld,
  ag_ncb_inst_vld_dp,
  ag_ncb_src1_reg,
  ag_ncb_st_data,
  ag_xx_inst_abort,
  ag_xx_split_done,
  arb_icc_data_grant,
  arb_rdl_grant,
  arb_stb_xx_grant,
  cp0_lsu_icg_en,
  cp0_lsu_mm,
  cp0_xx_async_expt_en,
  cp0_yy_mach_mode,
  cpurst_b,
  da_xx_fwd_data,
  da_xx_fwd_fls,
  da_xx_fwd_preg,
  da_xx_fwd_vld,
  dc_ag_async_expt_vld,
  dc_ag_async_ld_inst,
  dc_ag_async_mtval,
  dc_ag_cache_stall,
  dc_ag_dcache_addr,
  dc_ag_dcache_req,
  dc_ag_dcache_size,
  dc_ag_empty,
  dc_ag_func,
  dc_ag_pmp_ld_inst,
  dc_ag_pmp_mtval,
  dc_ag_stall,
  dcache_data_cen_way0_bank0,
  dcache_data_cen_way0_bank1,
  dcache_data_cen_way1_bank0,
  dcache_data_cen_way1_bank1,
  dcache_data_din,
  dcache_data_idx,
  dcache_data_wen,
  dcache_dirty_cen,
  dcache_dirty_din,
  dcache_dirty_idx,
  dcache_dirty_wen,
  dcache_tag_cen,
  dcache_tag_din,
  dcache_tag_idx,
  dcache_tag_wen,
  dtif_ag_cmplt_ready,
  dtif_ag_fsm_idle,
  dtif_ag_halt_info,
  dtif_ag_halt_info_up,
  dtif_ag_pipedown_mask,
  dtif_ag_stall,
  forever_cpuclk,
  icc_arb_data_bank,
  icc_arb_data_din,
  icc_arb_data_idx,
  icc_arb_data_req,
  icc_arb_data_way,
  icc_arb_data_wen,
  icc_arb_dirty_din,
  icc_arb_dirty_idx,
  icc_arb_dirty_req,
  icc_arb_dirty_wen,
  icc_arb_tag_din,
  icc_arb_tag_idx,
  icc_arb_tag_req,
  icc_arb_tag_wen,
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
  ifu_lsu_warm_up,
  iu_lsu_ex1_lsi_rst,
  iu_lsu_ex2_wb0_grant,
  lfb_arb_data_bank,
  lfb_arb_data_din,
  lfb_arb_data_idx,
  lfb_arb_data_req,
  lfb_arb_data_way,
  lfb_arb_data_wen,
  lfb_arb_dcache_sel,
  lfb_arb_dirty_din,
  lfb_arb_dirty_idx,
  lfb_arb_dirty_req,
  lfb_arb_dirty_wen,
  lfb_arb_tag_din,
  lfb_arb_tag_idx,
  lfb_arb_tag_req,
  lfb_arb_tag_wen,
  lm_clr,
  lm_lr_bus,
  lm_pass,
  lm_sc_bus,
  lm_set,
  lm_set_gate,
  lsu_acc_fault_vld,
  lsu_biu_async_expt_ack,
  lsu_dtu_ex2_expt_vld,
  lsu_ex2_stall_final,
  lsu_hpcp_inst_store,
  lsu_hpcp_inst_store_gate,
  lsu_idu_ex1_halt_info,
  lsu_idu_ex1_halt_info_update_en,
  lsu_idu_ex1_src1_update_en,
  lsu_idu_ex1_src1_update_en_gate,
  lsu_idu_ex1_stall,
  lsu_idu_global_stall,
  lsu_idu_update_addr,
  lsu_idu_update_en,
  lsu_idu_update_en_gate,
  lsu_idu_update_offset,
  lsu_iu_ex1_base_wb,
  lsu_iu_ex1_src1_sel,
  lsu_iu_ex2_lsi_dst_preg,
  lsu_iu_ex2_lsi_rslt,
  lsu_iu_ex2_lsi_rslt_vld,
  lsu_pmp_addr,
  lsu_pmp_write,
  lsu_rtu_async_expt_vld,
  lsu_rtu_async_ld_inst,
  lsu_rtu_async_tval,
  lsu_rtu_ex1_cmplt,
  lsu_rtu_ex1_cmplt_dp,
  lsu_rtu_ex1_halt_info,
  lsu_rtu_ex1_inst_len,
  lsu_rtu_ex1_inst_vld,
  lsu_rtu_ex1_ipop_int_mask,
  lsu_rtu_ex1_ipush_spec_inst,
  lsu_rtu_ex1_split_inst,
  lsu_rtu_ex2_bus_err,
  lsu_rtu_ex2_expt_inst,
  lsu_rtu_ex2_expt_vec,
  lsu_rtu_ex2_tval,
  lsu_sysmap_pa,
  ncb_ag_async_expt_vld,
  ncb_ag_async_ld_inst,
  ncb_ag_async_mtval,
  ncb_ag_pmp_ld_inst,
  ncb_ag_pmp_mtval,
  ncb_ag_stall,
  ncb_xx_no_op,
  pad_yy_icg_scan_en,
  pmp_lsu_acc_deny,
  rdl_arb_data_bank,
  rdl_arb_data_din,
  rdl_arb_data_idx,
  rdl_arb_data_req,
  rdl_arb_data_way,
  rdl_arb_data_wen,
  rdl_arb_dcache_sel,
  rdl_arb_dirty_din,
  rdl_arb_dirty_idx,
  rdl_arb_dirty_req,
  rdl_arb_dirty_wen,
  rdl_arb_tag_din,
  rdl_arb_tag_idx,
  rdl_arb_tag_req,
  rdl_arb_tag_wen,
  rtu_lsu_async_expt_ack,
  rtu_lsu_fgpr_wb_data,
  rtu_lsu_fgpr_wb_reg,
  rtu_lsu_fgpr_wb_vld,
  rtu_lsu_inst_retire,
  rtu_lsu_wb1_data,
  rtu_lsu_wb1_lsu_vld,
  rtu_lsu_wb1_preg,
  rtu_xx_ex1_stall,
  rtu_yy_xx_dbgon,
  stb_arb_data_bank,
  stb_arb_data_din,
  stb_arb_data_idx,
  stb_arb_data_req,
  stb_arb_data_way,
  stb_arb_data_wen,
  stb_arb_dcache_sel,
  stb_arb_dirty_din,
  stb_arb_dirty_idx,
  stb_arb_dirty_req,
  stb_arb_dirty_wen,
  sysmap_lsu_flg
);

// &Ports; @22
input           cp0_lsu_icg_en;                 
input           cp0_lsu_mm;                     
input           cp0_xx_async_expt_en;           
input           cp0_yy_mach_mode;               
input           cpurst_b;                       
input   [31:0]  da_xx_fwd_data;                 
input           da_xx_fwd_fls;                  
input   [5 :0]  da_xx_fwd_preg;                 
input           da_xx_fwd_vld;                  
input           dc_ag_async_expt_vld;           
input           dc_ag_async_ld_inst;            
input   [31:0]  dc_ag_async_mtval;              
input           dc_ag_cache_stall;              
input   [31:0]  dc_ag_dcache_addr;              
input           dc_ag_dcache_req;               
input   [1 :0]  dc_ag_dcache_size;              
input           dc_ag_empty;                    
input   [3 :0]  dc_ag_func;                     
input           dc_ag_pmp_ld_inst;              
input   [31:0]  dc_ag_pmp_mtval;                
input           dc_ag_stall;                    
input           dtif_ag_cmplt_ready;            
input           dtif_ag_fsm_idle;               
input   [14:0]  dtif_ag_halt_info;              
input           dtif_ag_halt_info_up;           
input           dtif_ag_pipedown_mask;          
input           dtif_ag_stall;                  
input           forever_cpuclk;                 
input   [1 :0]  icc_arb_data_bank;              
input   [63:0]  icc_arb_data_din;               
input   [11:0]  icc_arb_data_idx;               
input           icc_arb_data_req;               
input   [1 :0]  icc_arb_data_way;               
input   [3 :0]  icc_arb_data_wen;               
input   [2 :0]  icc_arb_dirty_din;              
input   [9 :0]  icc_arb_dirty_idx;              
input           icc_arb_dirty_req;              
input   [2 :0]  icc_arb_dirty_wen;              
input   [22:0]  icc_arb_tag_din;                
input   [9 :0]  icc_arb_tag_idx;                
input           icc_arb_tag_req;                
input   [1 :0]  icc_arb_tag_wen;                
input   [31:0]  idu_lsu_ex1_ag_imm;             
input   [31:0]  idu_lsu_ex1_base;               
input           idu_lsu_ex1_base_sel;           
input           idu_lsu_ex1_base_wb;            
input   [31:0]  idu_lsu_ex1_data;               
input   [5 :0]  idu_lsu_ex1_dest_reg;           
input           idu_lsu_ex1_dest_vld;           
input           idu_lsu_ex1_dp_sel;             
input           idu_lsu_ex1_fls;                
input   [3 :0]  idu_lsu_ex1_func;               
input           idu_lsu_ex1_gateclk_sel;        
input   [14:0]  idu_lsu_ex1_halt_info;          
input           idu_lsu_ex1_ipop_int_mask;      
input           idu_lsu_ex1_ipush_spec;         
input           idu_lsu_ex1_length;             
input           idu_lsu_ex1_offset_sel;         
input           idu_lsu_ex1_sel;                
input           idu_lsu_ex1_sign_extend;        
input   [1 :0]  idu_lsu_ex1_size;               
input           idu_lsu_ex1_split;              
input   [5 :0]  idu_lsu_ex1_src0_reg;           
input           idu_lsu_ex1_src1_depd;          
input   [5 :0]  idu_lsu_ex1_src1_reg;           
input           ifu_lsu_warm_up;                
input   [31:0]  iu_lsu_ex1_lsi_rst;             
input           iu_lsu_ex2_wb0_grant;           
input   [1 :0]  lfb_arb_data_bank;              
input   [63:0]  lfb_arb_data_din;               
input   [11:0]  lfb_arb_data_idx;               
input           lfb_arb_data_req;               
input   [1 :0]  lfb_arb_data_way;               
input   [3 :0]  lfb_arb_data_wen;               
input           lfb_arb_dcache_sel;             
input   [2 :0]  lfb_arb_dirty_din;              
input   [9 :0]  lfb_arb_dirty_idx;              
input           lfb_arb_dirty_req;              
input   [2 :0]  lfb_arb_dirty_wen;              
input   [22:0]  lfb_arb_tag_din;                
input   [9 :0]  lfb_arb_tag_idx;                
input           lfb_arb_tag_req;                
input   [1 :0]  lfb_arb_tag_wen;                
input           lm_pass;                        
input           lsu_ex2_stall_final;            
input           ncb_ag_async_expt_vld;          
input           ncb_ag_async_ld_inst;           
input   [31:0]  ncb_ag_async_mtval;             
input           ncb_ag_pmp_ld_inst;             
input   [31:0]  ncb_ag_pmp_mtval;               
input           ncb_ag_stall;                   
input           ncb_xx_no_op;                   
input           pad_yy_icg_scan_en;             
input           pmp_lsu_acc_deny;               
input   [1 :0]  rdl_arb_data_bank;              
input   [63:0]  rdl_arb_data_din;               
input   [11:0]  rdl_arb_data_idx;               
input           rdl_arb_data_req;               
input   [1 :0]  rdl_arb_data_way;               
input   [3 :0]  rdl_arb_data_wen;               
input           rdl_arb_dcache_sel;             
input   [2 :0]  rdl_arb_dirty_din;              
input   [9 :0]  rdl_arb_dirty_idx;              
input           rdl_arb_dirty_req;              
input   [2 :0]  rdl_arb_dirty_wen;              
input   [22:0]  rdl_arb_tag_din;                
input   [9 :0]  rdl_arb_tag_idx;                
input           rdl_arb_tag_req;                
input   [1 :0]  rdl_arb_tag_wen;                
input           rtu_lsu_async_expt_ack;         
input   [31:0]  rtu_lsu_fgpr_wb_data;           
input   [4 :0]  rtu_lsu_fgpr_wb_reg;            
input           rtu_lsu_fgpr_wb_vld;            
input           rtu_lsu_inst_retire;            
input   [31:0]  rtu_lsu_wb1_data;               
input           rtu_lsu_wb1_lsu_vld;            
input   [5 :0]  rtu_lsu_wb1_preg;               
input           rtu_xx_ex1_stall;               
input           rtu_yy_xx_dbgon;                
input   [1 :0]  stb_arb_data_bank;              
input   [63:0]  stb_arb_data_din;               
input   [11:0]  stb_arb_data_idx;               
input           stb_arb_data_req;               
input   [1 :0]  stb_arb_data_way;               
input   [3 :0]  stb_arb_data_wen;               
input           stb_arb_dcache_sel;             
input   [2 :0]  stb_arb_dirty_din;              
input   [9 :0]  stb_arb_dirty_idx;              
input           stb_arb_dirty_req;              
input   [2 :0]  stb_arb_dirty_wen;              
input   [4 :0]  sysmap_lsu_flg;                 
output  [31:0]  ag_dc_addr;                     
output          ag_dc_buf;                      
output  [3 :0]  ag_dc_bytes_vld;                
output          ag_dc_ca;                       
output          ag_dc_dcache_grant;             
output  [5 :0]  ag_dc_dest_reg;                 
output          ag_dc_fls;                      
output  [3 :0]  ag_dc_func;                     
output          ag_dc_inst_vld;                 
output          ag_dc_inst_vld_gate;            
output          ag_dc_lm_pass;                  
output          ag_dc_mach_mode;                
output  [1 :0]  ag_dc_ori_size;                 
output          ag_dc_pmp_expt;                 
output          ag_dc_sign_ext;                 
output  [1 :0]  ag_dc_size;                     
output          ag_dc_so;                       
output          ag_dc_split;                    
output          ag_dc_split_first;              
output          ag_dc_split_last;               
output          ag_dc_src1_depd;                
output  [5 :0]  ag_dc_src1_reg;                 
output  [31:0]  ag_dc_st_data;                  
output  [2 :0]  ag_dc_wdata_shift;              
output  [31:0]  ag_dtu_addr;                    
output          ag_dtu_addr_ready;              
output          ag_dtu_amo_type;                
output  [7 :0]  ag_dtu_bytes_vld;               
output  [31:0]  ag_dtu_data;                    
output          ag_dtu_data_chk_mask;           
output          ag_dtu_data_vld;                
output  [14:0]  ag_dtu_halt_info;               
output  [1 :0]  ag_dtu_mem_access_size;         
output          ag_dtu_pipe_down;               
output          ag_dtu_req;                     
output          ag_dtu_req_gate;                
output          ag_dtu_split_last;              
output          ag_dtu_st_type;                 
output  [31:0]  ag_ncb_addr;                    
output          ag_ncb_inst_vld;                
output          ag_ncb_inst_vld_dp;             
output  [5 :0]  ag_ncb_src1_reg;                
output  [31:0]  ag_ncb_st_data;                 
output          ag_xx_inst_abort;               
output          ag_xx_split_done;               
output          arb_icc_data_grant;             
output          arb_rdl_grant;                  
output          arb_stb_xx_grant;               
output          dcache_data_cen_way0_bank0;     
output          dcache_data_cen_way0_bank1;     
output          dcache_data_cen_way1_bank0;     
output          dcache_data_cen_way1_bank1;     
output  [63:0]  dcache_data_din;                
output  [11:0]  dcache_data_idx;                
output  [3 :0]  dcache_data_wen;                
output          dcache_dirty_cen;               
output  [2 :0]  dcache_dirty_din;               
output  [9 :0]  dcache_dirty_idx;               
output  [2 :0]  dcache_dirty_wen;               
output          dcache_tag_cen;                 
output  [22:0]  dcache_tag_din;                 
output  [9 :0]  dcache_tag_idx;                 
output  [1 :0]  dcache_tag_wen;                 
output          lm_clr;                         
output  [33:0]  lm_lr_bus;                      
output  [33:0]  lm_sc_bus;                      
output          lm_set;                         
output          lm_set_gate;                    
output          lsu_acc_fault_vld;              
output          lsu_biu_async_expt_ack;         
output          lsu_dtu_ex2_expt_vld;           
output          lsu_hpcp_inst_store;            
output          lsu_hpcp_inst_store_gate;       
output  [14:0]  lsu_idu_ex1_halt_info;          
output          lsu_idu_ex1_halt_info_update_en; 
output          lsu_idu_ex1_src1_update_en;     
output          lsu_idu_ex1_src1_update_en_gate; 
output          lsu_idu_ex1_stall;              
output          lsu_idu_global_stall;           
output  [31:0]  lsu_idu_update_addr;            
output          lsu_idu_update_en;              
output          lsu_idu_update_en_gate;         
output  [31:0]  lsu_idu_update_offset;          
output          lsu_iu_ex1_base_wb;             
output          lsu_iu_ex1_src1_sel;            
output  [5 :0]  lsu_iu_ex2_lsi_dst_preg;        
output  [31:0]  lsu_iu_ex2_lsi_rslt;            
output          lsu_iu_ex2_lsi_rslt_vld;        
output  [31:0]  lsu_pmp_addr;                   
output          lsu_pmp_write;                  
output          lsu_rtu_async_expt_vld;         
output          lsu_rtu_async_ld_inst;          
output  [31:0]  lsu_rtu_async_tval;             
output          lsu_rtu_ex1_cmplt;              
output          lsu_rtu_ex1_cmplt_dp;           
output  [14:0]  lsu_rtu_ex1_halt_info;          
output          lsu_rtu_ex1_inst_len;           
output          lsu_rtu_ex1_inst_vld;           
output          lsu_rtu_ex1_ipop_int_mask;      
output          lsu_rtu_ex1_ipush_spec_inst;    
output          lsu_rtu_ex1_split_inst;         
output          lsu_rtu_ex2_bus_err;            
output          lsu_rtu_ex2_expt_inst;          
output  [3 :0]  lsu_rtu_ex2_expt_vec;           
output  [31:0]  lsu_rtu_ex2_tval;               
output  [31:0]  lsu_sysmap_pa;                  

// &Regs; @23
reg     [2 :0]  ag_addr_ff;                     
reg     [3 :0]  ag_bytes_vld;                   
reg             ag_expt_ff;                     
reg     [3 :0]  ag_expt_vec_ff;                 
reg     [5 :0]  ag_lsi_dst_ff;                  
reg             ag_lsi_ff;                      
reg     [31:0]  ag_lsi_rst_ff;                  
reg             ag_misalign;                    
reg     [31:0]  ag_mtval_ff;                    
reg             async_cur_state;                
reg             async_ld_inst_f;                
reg     [31:0]  async_mtval_f;                  
reg             async_next_state;               
reg             debug_mode_async_err;           
reg     [1 :0]  pmp_cur_state;                  
reg     [1 :0]  pmp_next_state;                 
reg             split_acc_deny;                 
reg             split_acc_deny_ff;              
reg     [2 :0]  split_cur_state;                
reg     [2 :0]  split_next_state;               
reg             split_pmp_ld_inst;              
reg     [31:0]  split_pmp_mtval;                
reg     [2 :0]  split_wdata_shift;              
reg             target_ca_ff;                   

// &Wires; @24
wire            acc_deny_vld;                   
wire    [31:0]  ag_addr;                        
wire    [1 :0]  ag_arb_data_bank;               
wire    [63:0]  ag_arb_data_din;                
wire    [11:0]  ag_arb_data_idx;                
wire            ag_arb_data_req;                
wire            ag_arb_data_req_dp;             
wire    [3 :0]  ag_arb_data_wen;                
wire    [2 :0]  ag_arb_dirty_din;               
wire    [9 :0]  ag_arb_dirty_idx;               
wire            ag_arb_dirty_req;               
wire            ag_arb_dirty_req_dp;            
wire    [2 :0]  ag_arb_dirty_wen;               
wire    [22:0]  ag_arb_tag_din;                 
wire    [9 :0]  ag_arb_tag_idx;                 
wire            ag_arb_tag_req;                 
wire            ag_arb_tag_req_dp;              
wire    [1 :0]  ag_arb_tag_wen;                 
wire            ag_clk;                         
wire            ag_clk_en;                      
wire    [31:0]  ag_dc_addr;                     
wire            ag_dc_buf;                      
wire    [3 :0]  ag_dc_bytes_vld;                
wire            ag_dc_ca;                       
wire            ag_dc_dcache_grant;             
wire    [5 :0]  ag_dc_dest_reg;                 
wire            ag_dc_fls;                      
wire    [3 :0]  ag_dc_func;                     
wire            ag_dc_inst_vld;                 
wire            ag_dc_inst_vld_gate;            
wire            ag_dc_lm_pass;                  
wire            ag_dc_mach_mode;                
wire            ag_dc_misalign;                 
wire    [1 :0]  ag_dc_ori_size;                 
wire            ag_dc_pmp_expt;                 
wire            ag_dc_sign_ext;                 
wire    [1 :0]  ag_dc_size;                     
wire            ag_dc_so;                       
wire            ag_dc_split;                    
wire            ag_dc_split_first;              
wire            ag_dc_split_last;               
wire            ag_dc_src1_depd;                
wire    [5 :0]  ag_dc_src1_reg;                 
wire    [31:0]  ag_dc_st_data;                  
wire    [2 :0]  ag_dc_wdata_shift;              
wire            ag_dt_cancel;                   
wire    [31:0]  ag_dtu_addr;                    
wire            ag_dtu_addr_ready;              
wire            ag_dtu_amo_type;                
wire    [7 :0]  ag_dtu_bytes_vld;               
wire    [31:0]  ag_dtu_data;                    
wire            ag_dtu_data_chk_mask;           
wire            ag_dtu_data_vld;                
wire    [14:0]  ag_dtu_halt_info;               
wire    [1 :0]  ag_dtu_mem_access_size;         
wire            ag_dtu_pipe_down;               
wire            ag_dtu_req;                     
wire            ag_dtu_req_gate;                
wire            ag_dtu_split_last;              
wire            ag_dtu_st_type;                 
wire            ag_expt_clr;                    
wire            ag_expt_mask;                   
wire            ag_expt_save;                   
wire    [3 :0]  ag_expt_vec;                    
wire            ag_expt_vld;                    
wire            ag_fwd_fpu;                     
wire    [31:0]  ag_fwd_fpu_data;                
wire            ag_fwd_lsu;                     
wire            ag_inst_atomic;                 
wire            ag_inst_dca;                    
wire            ag_inst_dca_st;                 
wire            ag_inst_ld;                     
wire            ag_inst_st;                     
wire            ag_inst_vld;                    
wire            ag_inst_vld_aft_cancel;         
wire            ag_inst_vld_dp;                 
wire            ag_last_inst;                   
wire            ag_lr_inst;                     
wire            ag_lsi_save;                    
wire            ag_lsi_save_dp;                 
wire            ag_lsi_stall;                   
wire            ag_misalign_final;              
wire            ag_mls;                         
wire    [31:0]  ag_mtval;                       
wire    [31:0]  ag_ncb_addr;                    
wire            ag_ncb_inst_vld;                
wire            ag_ncb_inst_vld_dp;             
wire    [5 :0]  ag_ncb_src1_reg;                
wire    [31:0]  ag_ncb_st_data;                 
wire            ag_sc_inst;                     
wire            ag_self_stall;                  
wire            ag_size_dw;                     
wire            ag_size_half;                   
wire            ag_size_word;                   
wire            ag_split_req;                   
wire            ag_split_req_gate;              
wire            ag_split_sel;                   
wire    [31:0]  ag_st_fwd_data;                 
wire            ag_st_fwd_vld;                  
wire            ag_stall;                       
wire            ag_stall_final;                 
wire            ag_stall_raw;                   
wire            ag_t1_save;                     
wire            ag_xx_inst_abort;               
wire            ag_xx_split_done;               
wire            arb_ag_grant;                   
wire            arb_icc_data_grant;             
wire            arb_rdl_grant;                  
wire            arb_stb_xx_grant;               
wire            async_expt_vld;                 
wire            async_expt_vld_f;               
wire            async_ld_inst;                  
wire    [31:0]  async_mtval;                    
wire            cp0_lsu_icg_en;                 
wire            cp0_lsu_mm;                     
wire            cp0_xx_async_expt_en;           
wire            cp0_yy_mach_mode;               
wire            cpurst_b;                       
wire    [31:0]  da_xx_fwd_data;                 
wire            da_xx_fwd_fls;                  
wire    [5 :0]  da_xx_fwd_preg;                 
wire            da_xx_fwd_vld;                  
wire            dc_ag_async_expt_vld;           
wire            dc_ag_async_ld_inst;            
wire    [31:0]  dc_ag_async_mtval;              
wire            dc_ag_cache_stall;              
wire    [31:0]  dc_ag_dcache_addr;              
wire            dc_ag_dcache_req;               
wire    [1 :0]  dc_ag_dcache_size;              
wire            dc_ag_empty;                    
wire    [3 :0]  dc_ag_func;                     
wire            dc_ag_pmp_ld_inst;              
wire    [31:0]  dc_ag_pmp_mtval;                
wire            dc_ag_stall;                    
wire            dcache_data_cen_way0_bank0;     
wire            dcache_data_cen_way0_bank1;     
wire            dcache_data_cen_way1_bank0;     
wire            dcache_data_cen_way1_bank1;     
wire    [63:0]  dcache_data_din;                
wire    [11:0]  dcache_data_idx;                
wire    [3 :0]  dcache_data_wen;                
wire            dcache_dirty_cen;               
wire    [2 :0]  dcache_dirty_din;               
wire    [9 :0]  dcache_dirty_idx;               
wire    [2 :0]  dcache_dirty_wen;               
wire    [12:0]  dcache_index;                   
wire    [1 :0]  dcache_size;                    
wire            dcache_tag_cen;                 
wire    [22:0]  dcache_tag_din;                 
wire    [9 :0]  dcache_tag_idx;                 
wire    [1 :0]  dcache_tag_wen;                 
wire            dtif_ag_cmplt_ready;            
wire            dtif_ag_fsm_idle;               
wire    [14:0]  dtif_ag_halt_info;              
wire            dtif_ag_halt_info_up;           
wire            dtif_ag_pipedown_mask;          
wire            dtif_ag_stall;                  
wire            ex2_expt_vld;                   
wire            ex2_sync_acc_fault_ld;          
wire    [31:0]  ex2_sync_expt_tval;             
wire    [3 :0]  ex2_sync_expt_vec;              
wire            ex2_sync_expt_vld;              
wire            expt_clk;                       
wire            expt_clk_en;                    
wire            expt_ff_clk;                    
wire            expt_ff_clk_en;                 
wire            forever_cpuclk;                 
wire    [1 :0]  icc_arb_data_bank;              
wire    [63:0]  icc_arb_data_din;               
wire    [11:0]  icc_arb_data_idx;               
wire            icc_arb_data_req;               
wire    [1 :0]  icc_arb_data_way;               
wire    [3 :0]  icc_arb_data_wen;               
wire    [2 :0]  icc_arb_dirty_din;              
wire    [9 :0]  icc_arb_dirty_idx;              
wire            icc_arb_dirty_req;              
wire    [2 :0]  icc_arb_dirty_wen;              
wire    [22:0]  icc_arb_tag_din;                
wire    [9 :0]  icc_arb_tag_idx;                
wire            icc_arb_tag_req;                
wire    [1 :0]  icc_arb_tag_wen;                
wire    [31:0]  idu_lsu_ex1_ag_imm;             
wire    [31:0]  idu_lsu_ex1_base;               
wire            idu_lsu_ex1_base_sel;           
wire            idu_lsu_ex1_base_wb;            
wire    [31:0]  idu_lsu_ex1_data;               
wire    [5 :0]  idu_lsu_ex1_dest_reg;           
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
wire            ifu_lsu_warm_up;                
wire    [31:0]  iu_lsu_ex1_lsi_rst;             
wire            iu_lsu_ex2_wb0_grant;           
wire    [1 :0]  lfb_arb_data_bank;              
wire    [63:0]  lfb_arb_data_din;               
wire    [11:0]  lfb_arb_data_idx;               
wire            lfb_arb_data_req;               
wire    [1 :0]  lfb_arb_data_way;               
wire    [3 :0]  lfb_arb_data_wen;               
wire            lfb_arb_dcache_sel;             
wire    [2 :0]  lfb_arb_dirty_din;              
wire    [9 :0]  lfb_arb_dirty_idx;              
wire            lfb_arb_dirty_req;              
wire    [2 :0]  lfb_arb_dirty_wen;              
wire    [22:0]  lfb_arb_tag_din;                
wire    [9 :0]  lfb_arb_tag_idx;                
wire            lfb_arb_tag_req;                
wire    [1 :0]  lfb_arb_tag_wen;                
wire            lm_clr;                         
wire    [33:0]  lm_lr_bus;                      
wire            lm_pass;                        
wire    [33:0]  lm_sc_bus;                      
wire            lm_set;                         
wire            lm_set_gate;                    
wire            lsi_clk;                        
wire            lsi_clk_en;                     
wire            lsi_expt_cancel;                
wire            lsi_wb_grant;                   
wire            lsu_acc_fault_vld;              
wire            lsu_biu_async_expt_ack;         
wire            lsu_dtu_ex2_expt_vld;           
wire            lsu_ex1_dp_sel;                 
wire            lsu_ex1_sel;                    
wire            lsu_ex2_stall_final;            
wire            lsu_hpcp_inst_store;            
wire            lsu_hpcp_inst_store_gate;       
wire    [14:0]  lsu_idu_ex1_halt_info;          
wire            lsu_idu_ex1_halt_info_update_en; 
wire            lsu_idu_ex1_src1_update_en;     
wire            lsu_idu_ex1_src1_update_en_gate; 
wire            lsu_idu_ex1_stall;              
wire            lsu_idu_global_stall;           
wire    [31:0]  lsu_idu_update_addr;            
wire            lsu_idu_update_en;              
wire            lsu_idu_update_en_gate;         
wire    [31:0]  lsu_idu_update_offset;          
wire            lsu_iu_ex1_base_wb;             
wire            lsu_iu_ex1_src1_sel;            
wire    [5 :0]  lsu_iu_ex2_lsi_dst_preg;        
wire    [31:0]  lsu_iu_ex2_lsi_rslt;            
wire            lsu_iu_ex2_lsi_rslt_vld;        
wire    [31:0]  lsu_pmp_addr;                   
wire            lsu_pmp_write;                  
wire            lsu_rtu_async_expt_vld;         
wire            lsu_rtu_async_ld_inst;          
wire    [31:0]  lsu_rtu_async_tval;             
wire            lsu_rtu_ex1_cmplt;              
wire            lsu_rtu_ex1_cmplt_dp;           
wire    [14:0]  lsu_rtu_ex1_halt_info;          
wire            lsu_rtu_ex1_inst_len;           
wire            lsu_rtu_ex1_inst_vld;           
wire            lsu_rtu_ex1_ipop_int_mask;      
wire            lsu_rtu_ex1_ipush_spec_inst;    
wire            lsu_rtu_ex1_split_inst;         
wire            lsu_rtu_ex2_bus_err;            
wire            lsu_rtu_ex2_expt_inst;          
wire    [3 :0]  lsu_rtu_ex2_expt_vec;           
wire    [31:0]  lsu_rtu_ex2_tval;               
wire            lsu_rtu_pmp_deny;               
wire    [31:0]  lsu_sysmap_pa;                  
wire    [3 :0]  misalign_expt_vec;              
wire            ncb_ag_async_expt_vld;          
wire            ncb_ag_async_ld_inst;           
wire    [31:0]  ncb_ag_async_mtval;             
wire            ncb_ag_pmp_ld_inst;             
wire    [31:0]  ncb_ag_pmp_mtval;               
wire            ncb_ag_stall;                   
wire            ncb_xx_no_op;                   
wire            pad_yy_icg_scan_en;             
wire            pmp_deny_ld_inst;               
wire            pmp_deny_ld_inst_ex2;           
wire    [31:0]  pmp_deny_mtval;                 
wire    [31:0]  pmp_deny_mtval_ex2;             
wire            pmp_lsu_acc_deny;               
wire            pmp_mtval_from_async;           
wire            pmp_mtval_from_split;           
wire            pmp_mtval_save_en;              
wire    [1 :0]  rdl_arb_data_bank;              
wire    [63:0]  rdl_arb_data_din;               
wire    [11:0]  rdl_arb_data_idx;               
wire            rdl_arb_data_req;               
wire    [1 :0]  rdl_arb_data_way;               
wire    [3 :0]  rdl_arb_data_wen;               
wire            rdl_arb_dcache_sel;             
wire    [2 :0]  rdl_arb_dirty_din;              
wire    [9 :0]  rdl_arb_dirty_idx;              
wire            rdl_arb_dirty_req;              
wire    [2 :0]  rdl_arb_dirty_wen;              
wire    [22:0]  rdl_arb_tag_din;                
wire    [9 :0]  rdl_arb_tag_idx;                
wire            rdl_arb_tag_req;                
wire    [1 :0]  rdl_arb_tag_wen;                
wire            rtu_lsu_async_expt_ack;         
wire    [31:0]  rtu_lsu_fgpr_wb_data;           
wire    [4 :0]  rtu_lsu_fgpr_wb_reg;            
wire            rtu_lsu_fgpr_wb_vld;            
wire            rtu_lsu_inst_retire;            
wire            rtu_sync_ack;                   
wire            rtu_xx_ex1_stall;               
wire            rtu_yy_xx_dbgon;                
wire    [2 :0]  size_onehot;                    
wire            split_acc_clk_en;               
wire            split_acc_deny_vld;             
wire            split_busy;                     
wire            split_clk;                      
wire            split_clk_en;                   
wire            split_cur_abort;                
wire            split_cur_busy;                 
wire            split_cur_first;                
wire            split_cur_forth;                
wire            split_cur_secd;                 
wire            split_cur_thrd;                 
wire            split_err_clk;                  
wire            split_first;                    
wire    [1 :0]  split_first_size;               
wire            split_first_size_half;          
wire            split_first_size_word;          
wire            split_flush;                    
wire    [1 :0]  split_forth_size;               
wire            split_last;                     
wire            split_secd_last;                
wire    [1 :0]  split_secd_size;                
wire            split_secd_size_byte;           
wire            split_secd_size_word;           
wire    [1 :0]  split_size;                     
wire            split_thrd_last;                
wire    [1 :0]  split_thrd_size;                
wire            split_thrd_size_byte;           
wire            split_thrd_size_word;           
wire    [31:0]  st_ex1_data;                    
wire    [1 :0]  stb_arb_data_bank;              
wire    [63:0]  stb_arb_data_din;               
wire    [11:0]  stb_arb_data_idx;               
wire            stb_arb_data_req;               
wire    [1 :0]  stb_arb_data_way;               
wire    [3 :0]  stb_arb_data_wen;               
wire            stb_arb_dcache_sel;             
wire    [2 :0]  stb_arb_dirty_din;              
wire    [9 :0]  stb_arb_dirty_idx;              
wire            stb_arb_dirty_req;              
wire    [2 :0]  stb_arb_dirty_wen;              
wire            sync_bus_err;                   
wire    [4 :0]  sysmap_lsu_flg;                 
wire            target_ca;                      
wire    [2 :0]  update_offset;                  
wire    [2 :0]  wdata_shift;                    


parameter DATAW = `FLEN;

parameter S_BYTE  = 2'b00;
parameter S_HALF  = 2'b01;
parameter S_WORD  = 2'b10;
parameter S_DWORD = 2'b11;

// &Force("output", "ag_dc_addr"); @33
// &Force("output", "ag_dc_func"); @34
// &Force("output", "ag_dc_size"); @35
// &Force("input", "idu_lsu_ex1_dest_vld"); @36

//==============================================================================
//              address generator
//==============================================================================
assign ag_addr[31:0] = ({32{idu_lsu_ex1_base_sel}} & idu_lsu_ex1_base[31:0])
                     + ({32{idu_lsu_ex1_offset_sel}} & idu_lsu_ex1_ag_imm[31:0]);

assign lsu_iu_ex1_base_wb = lsu_ex1_dp_sel & idu_lsu_ex1_base_wb;

//================================================
//base update ld/st reuse src1 to 
//save its original address if unalign
//================================================
assign lsu_iu_ex1_src1_sel             = !split_cur_first & idu_lsu_ex1_base_wb;
assign lsu_idu_ex1_src1_update_en      =  split_cur_first & ag_split_req & idu_lsu_ex1_base_wb & !ag_stall;
assign lsu_idu_ex1_src1_update_en_gate =  split_cur_first & ag_split_req_gate & idu_lsu_ex1_base_wb;

//================================================
//   address and offset update to IDU
//================================================
assign lsu_idu_update_en      = !ag_stall & 
                                (split_cur_first & ag_split_req |
                                 split_cur_busy  & !split_last);
assign lsu_idu_update_en_gate =  split_cur_first & ag_split_req_gate |
                                 split_cur_busy  & !split_last;

assign update_offset[2:0] = (split_size[1:0] == S_BYTE)
                          ? 3'b1
                          : ((split_size[1:0] == S_HALF) ? 3'b010 : 3'b100);

assign lsu_idu_update_addr[31:0]   = ag_addr[31:0];
assign lsu_idu_update_offset[31:0] = {29'b0,update_offset[2:0]};


assign lsu_idu_global_stall = 1'b0;
assign lsu_idu_ex1_stall    = lsu_ex1_sel & ag_stall_final;

//================================================
//        lsi borrow
//================================================
//for timing and lsi,now lsu borrow iu wb in ex2 stage
assign lsi_clk_en = ag_inst_vld_dp
                      & idu_lsu_ex1_base_wb
                    | ifu_lsu_warm_up 
                    | ag_lsi_ff;

// &Instance("gated_clk_cell", "x_pa_lsu_lsi_gated_clk"); @93
gated_clk_cell  x_pa_lsu_lsi_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lsi_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (lsi_clk_en        ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @94
//          .external_en (1'b0), @95
//          .global_en   (1'b1), @96
//          .module_en   (cp0_lsu_icg_en), @97
//          .local_en    (lsi_clk_en), @98
//          .clk_out     (lsi_clk)); @99

assign ag_lsi_save = ag_inst_vld
                     & idu_lsu_ex1_base_wb
                     & !ag_stall_final;

assign ag_lsi_save_dp = ag_inst_vld_dp
                        & idu_lsu_ex1_base_wb
                        & !ag_lsi_stall;

assign lsi_expt_cancel = ex2_expt_vld;
assign lsi_wb_grant    = iu_lsu_ex2_wb0_grant;

always@(posedge lsi_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ag_lsi_ff <= 1'b0;
  else if (ag_lsi_save)
    ag_lsi_ff <= 1'b1;
  else if (lsi_expt_cancel | lsi_wb_grant)
    ag_lsi_ff <= 1'b0;
end

always@(posedge lsi_clk)
begin
  if (ag_lsi_save_dp | ifu_lsu_warm_up)
  begin
    ag_lsi_dst_ff[5:0]  <= idu_lsu_ex1_src0_reg[5:0];
    ag_lsi_rst_ff[31:0] <= iu_lsu_ex1_lsi_rst[31:0];
  end
end

//when multi lsi,may trigger ag stall
assign ag_lsi_stall = ag_lsi_ff
                      & !(lsi_expt_cancel | lsi_wb_grant)
                      & idu_lsu_ex1_base_wb;

assign ag_self_stall = ag_lsi_stall | dtif_ag_stall;

assign lsu_iu_ex2_lsi_rslt_vld     = ag_lsi_ff & !lsu_ex2_stall_final & !lsi_expt_cancel; 
assign lsu_iu_ex2_lsi_dst_preg[5:0]= ag_lsi_dst_ff[5:0];
assign lsu_iu_ex2_lsi_rslt[31:0]   = ag_lsi_rst_ff[31:0];
//================================================
// request information to DC 
//================================================
assign lsu_ex1_sel    = idu_lsu_ex1_sel | split_cur_busy;
assign lsu_ex1_dp_sel = idu_lsu_ex1_dp_sel | split_cur_busy;

assign ag_inst_vld            = lsu_ex1_sel & !acc_deny_vld;// & !async_expt_vld_f;
assign ag_inst_vld_dp         = lsu_ex1_dp_sel & !acc_deny_vld;
assign ag_inst_vld_aft_cancel = ag_inst_vld &
                               !ag_dt_cancel &
                               !ag_dc_misalign;

assign ag_dc_addr[31:0]     = ag_addr[31:0] & {32{target_ca_ff}};
assign ag_ncb_addr[31:0]    = ag_addr[31:0] & {32{!target_ca_ff}};
assign ag_dc_func[3:0]      = idu_lsu_ex1_func[3:0];
assign ag_mls               = idu_lsu_ex1_split;
assign ag_dc_fls            = idu_lsu_ex1_fls;

assign ag_dc_split          = ag_split_sel; 
assign ag_dc_split_last     = split_last;
assign ag_dc_split_first    = split_first;
assign ag_dc_size[1:0]      = split_size[1:0];// : idu_lsu_ex1_size[1:0];
assign ag_dc_ori_size[1:0]  = idu_lsu_ex1_size[1:0];
assign ag_dc_sign_ext       = idu_lsu_ex1_sign_extend;
assign ag_dc_dest_reg[5:0]  = idu_lsu_ex1_dest_reg[5:0];
assign ag_dc_src1_depd      = idu_lsu_ex1_src1_depd & !ag_st_fwd_vld;
assign ag_dc_src1_reg[5:0]  = idu_lsu_ex1_src1_reg[5:0] & {6{target_ca_ff}};
assign ag_ncb_src1_reg[5:0] = idu_lsu_ex1_src1_reg[5:0] & {6{!target_ca_ff}};
assign ag_dc_st_data[DATAW-1:0]  = st_ex1_data[DATAW-1:0] & {DATAW{target_ca_ff}};
assign ag_ncb_st_data[DATAW-1:0] = st_ex1_data[DATAW-1:0] & {DATAW{!target_ca_ff}};

// &Force("input", "rtu_lsu_wb1_lsu_vld"); @199
// &Force("input", "rtu_lsu_wb1_data"); @200
// &Force("input", "rtu_lsu_wb1_preg"); @201
// &Force("bus", "rtu_lsu_wb1_preg",5,0); @202
// &Force("bus", "rtu_lsu_wb1_data",31,0); @203
//assign ag_depd_ex2  = lsu_xx_ex2_data_vld &
//                      (idu_lsu_ex1_fls == lsu_xx_ex2_fls) &
//                      (idu_lsu_ex1_src1_reg[5:0] == lsu_xx_ex2_preg[5:0]);
assign ag_fwd_lsu   = da_xx_fwd_vld
                      & (idu_lsu_ex1_fls == da_xx_fwd_fls)
                      & (idu_lsu_ex1_src1_reg[5:0] == da_xx_fwd_preg[5:0]);

assign ag_fwd_fpu   = rtu_lsu_fgpr_wb_vld & idu_lsu_ex1_fls &
                      (idu_lsu_ex1_src1_reg[4:0] == rtu_lsu_fgpr_wb_reg[4:0]);
assign ag_fwd_fpu_data[DATAW-1:0] = rtu_lsu_fgpr_wb_data[DATAW-1:0];

assign ag_st_fwd_vld = idu_lsu_ex1_src1_depd & (ag_fwd_lsu | ag_fwd_fpu);

assign ag_st_fwd_data[DATAW-1:0] = ag_fwd_lsu
                                   ? da_xx_fwd_data[DATAW-1:0]
                                   : ag_fwd_fpu_data[DATAW-1:0]; 

assign st_ex1_data[DATAW-1:0] = ag_st_fwd_vld ? ag_st_fwd_data[DATAW-1:0] : idu_lsu_ex1_data[DATAW-1:0];


assign ag_dc_wdata_shift[2:0] = wdata_shift[2:0];

// &CombBeg; @231
always @( ag_addr[1:0]
       or ag_dc_size[1:0])
begin
  casez({ag_dc_size[1:0],ag_addr[1:0]})
    4'b0000: ag_bytes_vld[3:0] = 4'b0001;
    4'b0001: ag_bytes_vld[3:0] = 4'b0010;
    4'b0010: ag_bytes_vld[3:0] = 4'b0100;
    4'b0011: ag_bytes_vld[3:0] = 4'b1000;
    4'b0100: ag_bytes_vld[3:0] = 4'b0011;
    4'b0110: ag_bytes_vld[3:0] = 4'b1100;
    4'b1?00: ag_bytes_vld[3:0] = 4'b1111;
    default: ag_bytes_vld[3:0] = 4'b1111;
  endcase
// &CombEnd; @242
end

assign ag_dc_bytes_vld[3:0] = ag_bytes_vld[3:0];

//================================================
//   memory bkpt
//================================================
// &Force("nonport", "ag_inst_st"); @249
// &Force("nonport", "ag_inst_ld"); @250
assign ag_inst_st = !ag_dc_func[3] & ag_dc_func[0];
assign ag_inst_ld = !ag_dc_func[3] & !ag_dc_func[0];
//req info
assign ag_dtu_req                 = ag_inst_vld
                                    & !ag_expt_mask 
                                    & !ag_dc_func[3]; 
assign ag_dtu_req_gate            = ag_inst_vld_dp
                                    & !ag_expt_mask 
                                    & !ag_dc_func[3]; 
assign ag_dtu_addr_ready          = 1'b1;
assign ag_dtu_data_vld            = ag_inst_vld
                                    & ag_inst_st
                                    & !idu_lsu_ex1_src1_depd;
assign ag_dtu_addr[31:0]          = ag_addr[31:0];
assign ag_dtu_bytes_vld[7:0]      = (ag_dc_size[1:0] == 2'b11)
                                    ? 8'hff
                                    : ag_addr[2]
                                      ? {ag_bytes_vld[3:0],4'b0}
                                      : {4'b0,ag_bytes_vld[3:0]};
assign ag_dtu_data[31:0]          = st_ex1_data[31:0];

assign ag_dtu_halt_info[`TDT_HINFO_WIDTH-1:0] = idu_lsu_ex1_halt_info[`TDT_HINFO_WIDTH-1:0];

//lsu inst info
assign ag_dtu_st_type              = ag_inst_st;
assign ag_dtu_amo_type             = 1'b0;
assign ag_dtu_mem_access_size[1:0] = ag_dc_size[1:0];
assign ag_dtu_split_last           = ag_last_inst;
assign ag_dtu_data_chk_mask        = (ag_dc_size[1:0] == 2'b11) 
                                     | ag_split_sel & ag_inst_ld & !split_last
                                     | split_last & ag_inst_st;
                                     
//cmplt and pipe info
assign ag_dtu_pipe_down  = ag_inst_vld
                           & !split_cur_abort
                           & !ag_stall;

assign lsu_idu_ex1_halt_info_update_en             = dtif_ag_halt_info_up;
assign lsu_idu_ex1_halt_info[`TDT_HINFO_WIDTH-1:0] = dtif_ag_halt_info[`TDT_HINFO_WIDTH-1:0];

assign ag_dt_cancel = idu_lsu_ex1_halt_info[`TDT_HINFO_CANCEL];

//================================================
//       to PMP
//================================================
assign lsu_pmp_write       = ag_inst_st;
assign lsu_pmp_addr[31:0]  = ag_addr[31:0];
assign ag_dc_pmp_expt      = pmp_lsu_acc_deny;

//================================================
//sysmap
//[4:0]: Strong Order, Cacheable, Bufferable, Shareable, Security
//================================================
// &Force("bus","sysmap_lsu_flg",4,0); @316
// &Force("output", "ag_dc_ca"); @317
// &Force("output", "ag_dc_so"); @318
// &Force("output", "ag_dc_mach_mode"); @319

assign lsu_sysmap_pa[31:0] = ag_addr[31:0];
assign ag_dc_ca            = sysmap_lsu_flg[3]; 
assign ag_dc_buf           = sysmap_lsu_flg[2];
assign ag_dc_so            = sysmap_lsu_flg[4];

assign ag_dc_mach_mode     = cp0_yy_mach_mode;

//================================================
//   PMP DENY
//================================================
//acc_deny_vld to indicate the instruction with pmp_deny, so it is set
//when cmplt, and clear when retired.
parameter PMP_IDLE  = 2'b00;
parameter PMP_LAST  = 2'b10;
parameter PMP_SPLIT = 2'b11;
parameter PMP_STALL = 2'b01;

always@(posedge ag_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pmp_cur_state[1:0] <= PMP_IDLE;
  else 
    pmp_cur_state[1:0] <= pmp_next_state[1:0];
end

// &CombBeg; @347
always @( ag_inst_vld_aft_cancel
       or split_acc_deny_vld
       or ag_stall_final
       or pmp_lsu_acc_deny
       or pmp_cur_state[1:0]
       or lsu_ex2_stall_final)
begin
  case(pmp_cur_state[1:0])
    PMP_IDLE: begin
      if (!ag_stall_final & ag_inst_vld_aft_cancel) begin
        if (split_acc_deny_vld)
          pmp_next_state[1:0] = PMP_SPLIT;
        else if (pmp_lsu_acc_deny)
          pmp_next_state[1:0] = PMP_LAST;
        else
          pmp_next_state[1:0] = PMP_IDLE;
      end
      else 
        pmp_next_state[1:0] = PMP_IDLE;
    end
    PMP_SPLIT:begin
      if (lsu_ex2_stall_final)
        pmp_next_state[1:0] = PMP_STALL;
      else
        pmp_next_state[1:0] = PMP_IDLE;
    end
    PMP_LAST:begin
      if (lsu_ex2_stall_final)
        pmp_next_state[1:0] = PMP_STALL;
      else
        pmp_next_state[1:0] = PMP_IDLE;
    end
    PMP_STALL:begin
      if (!lsu_ex2_stall_final)
        pmp_next_state[1:0] = PMP_IDLE;
      else
        pmp_next_state[1:0] = PMP_STALL;
    end
    default: pmp_next_state[1:0] = PMP_IDLE;
  endcase
// &CombEnd; @381
end

assign acc_deny_vld         = pmp_cur_state[1:0] != PMP_IDLE;
assign pmp_mtval_from_split = pmp_cur_state[1:0] == PMP_SPLIT;
assign pmp_mtval_from_async = pmp_cur_state[1:0] == PMP_STALL;

assign pmp_mtval_save_en = (pmp_cur_state[1:0] == PMP_SPLIT |
                            pmp_cur_state[1:0] == PMP_LAST);

assign pmp_deny_mtval_ex2[31:0] = dc_ag_empty ? ncb_ag_pmp_mtval[31:0] : dc_ag_pmp_mtval[31:0];
assign pmp_deny_ld_inst_ex2     = dc_ag_empty ? ncb_ag_pmp_ld_inst     : dc_ag_pmp_ld_inst;

assign pmp_deny_mtval[31:0] = pmp_mtval_from_split ? split_pmp_mtval[31:0] : pmp_deny_mtval_ex2[31:0];
assign pmp_deny_ld_inst     = pmp_mtval_from_split ? split_pmp_ld_inst     : pmp_deny_ld_inst_ex2;

assign ag_clk_en = idu_lsu_ex1_gateclk_sel | acc_deny_vld;
// &Instance("gated_clk_cell", "x_pa_lsu_ag_gated_clk"); @397
gated_clk_cell  x_pa_lsu_ag_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ag_clk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ag_clk_en         ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @398
//          .external_en (1'b0), @399
//          .global_en   (1'b1), @400
//          .module_en     (cp0_lsu_icg_en     ), @401
//          .local_en    (ag_clk_en), @402
//          .clk_out     (ag_clk)); @403
// &Instance("gated_clk_cell", "x_pa_lsu_ag_gated_clk"); @412
// &Connect(.clk_in      (forever_cpuclk), @413
//          .external_en (1'b0), @414
//          .global_en   (1'b1), @415
//          .module_en     (cp0_lsu_icg_en     ), @416
//          .local_en    (ag_clk_en), @417
//          .clk_out     (ag_clk)); @418

assign lsu_rtu_pmp_deny = acc_deny_vld & !async_expt_vld_f;

//================================================
//       async exception
//================================================
assign expt_clk_en = async_expt_vld | async_expt_vld_f | pmp_mtval_save_en | debug_mode_async_err;
// &Instance("gated_clk_cell", "x_pa_lsu_expt_gated_clk"); @428
gated_clk_cell  x_pa_lsu_expt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (expt_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (expt_clk_en       ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @429
//          .external_en (1'b0), @430
//          .global_en   (1'b1), @431
//          .module_en     (cp0_lsu_icg_en     ), @432
//          .local_en    (expt_clk_en), @433
//          .clk_out     (expt_clk)); @434

assign async_expt_vld    = ncb_ag_async_expt_vld | dc_ag_async_expt_vld;
assign async_mtval[31:0] = ncb_ag_async_expt_vld ? ncb_ag_async_mtval[31:0]
                                                 : dc_ag_async_mtval[31:0];
assign async_ld_inst     = ncb_ag_async_expt_vld ? ncb_ag_async_ld_inst
                                                 : dc_ag_async_ld_inst;

parameter ASYNC_IDLE = 1'b0;
parameter ASYNC_VLD  = 1'b1;

always@(posedge expt_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    async_cur_state <= ASYNC_IDLE;
  else
    async_cur_state <= async_next_state;
end

// &CombBeg; @453
always @( async_cur_state
       or async_expt_vld
       or rtu_sync_ack
       or rtu_yy_xx_dbgon
       or rtu_lsu_async_expt_ack)
begin
  case (async_cur_state)
  ASYNC_IDLE: begin
    if (async_expt_vld & !rtu_yy_xx_dbgon)
      async_next_state = ASYNC_VLD;
    else
      async_next_state = ASYNC_IDLE;
  end
  ASYNC_VLD: begin
    if (rtu_lsu_async_expt_ack & !rtu_yy_xx_dbgon | rtu_sync_ack)
      async_next_state = ASYNC_IDLE;
    else
      async_next_state = ASYNC_VLD;
  end
  default: async_next_state = ASYNC_IDLE;
  endcase
// &CombEnd; @469
end

assign lsu_biu_async_expt_ack = rtu_lsu_async_expt_ack;

assign async_expt_vld_f = async_cur_state == ASYNC_VLD;

always@(posedge expt_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    async_mtval_f[31:0] <= 32'b0;
    async_ld_inst_f     <= 1'b0;
  end
  else if (async_expt_vld & (!async_expt_vld_f | rtu_lsu_async_expt_ack & !rtu_yy_xx_dbgon | rtu_sync_ack)) begin
    async_mtval_f[31:0] <= async_mtval[31:0];
    async_ld_inst_f     <= async_ld_inst;
  end
  else if (pmp_mtval_save_en & lsu_ex2_stall_final & !async_expt_vld_f) begin
    async_mtval_f[31:0] <= pmp_deny_mtval[31:0];
    async_ld_inst_f     <= pmp_deny_ld_inst;
  end
end

assign lsu_acc_fault_vld = async_expt_vld_f;

//----------------------async expt on debug---------------------------------------
//when dbgon, async_expt req should use seperate signal
//async_expt info in debug mode is not needed
always@(posedge expt_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    debug_mode_async_err <= 1'b0;
  else if (rtu_yy_xx_dbgon & async_expt_vld)
    debug_mode_async_err <= 1'b1;
  else if (!rtu_yy_xx_dbgon | rtu_lsu_async_expt_ack & rtu_yy_xx_dbgon)
    debug_mode_async_err <= 1'b0;
end

//----------------------async expt return-------------------------------
assign lsu_rtu_async_expt_vld    = async_expt_vld_f & (cp0_xx_async_expt_en | !async_ld_inst_f) & !rtu_yy_xx_dbgon 
                                   | debug_mode_async_err & rtu_yy_xx_dbgon;
assign lsu_rtu_async_tval[31:0]  = (async_expt_vld_f | pmp_mtval_from_async) ? async_mtval_f[31:0] : pmp_deny_mtval[31:0];
assign lsu_rtu_async_ld_inst     = (async_expt_vld_f | pmp_mtval_from_async) ? async_ld_inst_f     : pmp_deny_ld_inst;
//================================================
//      expt return
//================================================
assign expt_ff_clk_en = ifu_lsu_warm_up | ag_expt_ff | idu_lsu_ex1_gateclk_sel | ex2_sync_expt_vld;
// &Instance("gated_clk_cell", "x_pa_lsu_expt_ff_gated_clk"); @515
gated_clk_cell  x_pa_lsu_expt_ff_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (expt_ff_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (expt_ff_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @516
//          .external_en (1'b0), @517
//          .global_en   (1'b1), @518
//          .module_en   (cp0_lsu_icg_en), @519
//          .local_en    (expt_ff_clk_en), @520
//          .clk_out     (expt_ff_clk)  ); @521

//for timing,now expt returns in ex2
assign ag_expt_vld      = ag_inst_vld & (ag_dc_misalign | ag_dt_cancel);
assign ag_expt_vec[3:0] = misalign_expt_vec[3:0];
//assign ag_inst_ld       = !ag_dc_func[0] & !ag_dc_func[3];
assign ag_mtval[31:0]   = ag_dt_cancel & idu_lsu_ex1_split
                          ? {32{1'b0}}
                          : ag_addr[31:0];

assign ag_expt_mask    = ag_expt_ff & !split_cur_first;

assign ag_expt_save = ag_expt_vld
                      & !ag_expt_mask;
assign ag_expt_clr  = ag_inst_vld
                      & !ag_expt_mask
                      & !dtif_ag_pipedown_mask
                      & !ag_stall;

assign ag_t1_save = dtif_ag_halt_info_up 
                    & dtif_ag_halt_info[`TDT_HINFO_MATCH]
                    & !idu_lsu_ex1_halt_info[`TDT_HINFO_MATCH];

always@(posedge expt_ff_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ag_expt_ff <= 1'b0;
  else if(ag_expt_save | ex2_sync_expt_vld & !ag_expt_ff)
    ag_expt_ff <= 1'b1;
  else if(ag_expt_clr)
    ag_expt_ff <= 1'b0;
end

always@(posedge expt_ff_clk)
begin
  if (ag_expt_save | ag_t1_save | ifu_lsu_warm_up)
  begin
    ag_expt_vec_ff[3:0] <= ag_expt_vec[3:0];
    ag_mtval_ff[31:0]   <= ag_mtval[31:0];
  end
  else if (ex2_sync_expt_vld & !ag_expt_ff)
  begin
    ag_expt_vec_ff[3:0] <= ex2_sync_expt_vec[3:0];
    ag_mtval_ff[31:0]   <= ex2_sync_expt_tval[31:0];
  end
end

assign sync_bus_err = async_expt_vld_f & !cp0_xx_async_expt_en & async_ld_inst_f;

assign ex2_sync_expt_vld = ag_expt_ff 
                           | lsu_rtu_pmp_deny
                           | sync_bus_err;

assign ex2_sync_acc_fault_ld  = lsu_rtu_pmp_deny & !pmp_mtval_from_async
                                ? pmp_deny_ld_inst
                                : async_ld_inst_f;

assign ex2_sync_expt_vec[3:0] = ag_expt_ff
                                ? ag_expt_vec_ff[3:0]
                                : ex2_sync_acc_fault_ld
                                  ? 4'd5
                                  : 4'd7;

//for t1,ag_tval should be default
assign ex2_sync_expt_tval[31:0] = lsu_rtu_pmp_deny & !pmp_mtval_from_async
                                  ? pmp_deny_mtval[31:0]
                                  : (async_expt_vld_f | lsu_rtu_pmp_deny) & !ag_expt_ff
                                    ? async_mtval_f[31:0]
                                    : ag_mtval_ff[31:0];
                                  

assign lsu_rtu_ex2_expt_inst     = ex2_sync_expt_vld;
assign lsu_rtu_ex2_bus_err       = sync_bus_err;
assign lsu_rtu_ex2_expt_vec[3:0] = ex2_sync_expt_vec[3:0];
assign lsu_rtu_ex2_tval[31:0]    = ex2_sync_expt_tval[31:0];

assign ex2_expt_vld = ag_expt_ff | lsu_rtu_pmp_deny | async_expt_vld_f;

assign lsu_dtu_ex2_expt_vld = ex2_expt_vld;

//for rtu ack
assign rtu_sync_ack = rtu_lsu_inst_retire & sync_bus_err; 
//================================================
//      local monitor
//================================================
// &Force("output", "ag_dc_lm_pass"); @626
assign ag_lr_inst     = ag_dc_func[3:0] == 4'b0010;
assign ag_sc_inst     = ag_dc_func[3:0] == 4'b0011;
assign ag_inst_atomic = |ag_dc_func[2:1] & !ag_dc_func[3]; 
assign lm_set = ag_inst_vld_aft_cancel &  ag_lr_inst & !ag_stall;
assign lm_clr = ag_inst_vld_aft_cancel & ag_inst_atomic & !ag_lr_inst & !ag_stall;
assign lm_set_gate = ag_inst_vld_dp & ag_lr_inst;
assign lm_lr_bus[33:0] = {ag_addr[31:0], ag_dc_size[1:0]} & {34{ag_lr_inst}};
assign lm_sc_bus[33:0] = {ag_addr[31:0], ag_dc_size[1:0]} & {34{ag_sc_inst}};
assign ag_dc_lm_pass   = ag_sc_inst & lm_pass;

//==============================================================================
//             split for misalign
//==============================================================================

//================================================
//       misalign
//================================================
// &CombBeg; @647
always @( idu_lsu_ex1_size[1:0]
       or ag_addr[2:0])
begin
  case(idu_lsu_ex1_size[1:0])
    S_HALF : ag_misalign = ag_addr[0];
    S_WORD : ag_misalign = |ag_addr[1:0];
    S_DWORD: ag_misalign = |ag_addr[2:0];
    default : ag_misalign = 1'b0;
  endcase
// &CombEnd; @654
end

assign ag_misalign_final = ag_misalign & (
                          !cp0_lsu_mm |
                           ag_dc_so |
                           ag_dc_func[2] | ag_dc_func[1] | ag_mls);

assign ag_dc_misalign = split_cur_first & !ag_dc_func[3] & ag_misalign_final |
                       !split_cur_first & ag_dc_so & !split_acc_deny;

// &Force("nonport", "ag_mls"); @666

assign misalign_expt_vec[3:0] = (ag_dc_func[2] | ag_dc_func[1] | ag_dc_func[0]) ? 4'b0110 : 4'b0100;

//================================================
//   split fsm 
//================================================
parameter S_FIRST  = 3'b000;
parameter S_SECD   = 3'b001;
parameter S_THIRD  = 3'b010;
parameter S_FOURTH = 3'b011;
parameter S_ABORT  = 3'b100;

assign split_flush = split_cur_busy & !split_last & !ag_stall &
                    (pmp_lsu_acc_deny | ag_dc_so | ag_dt_cancel);

always@(posedge split_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    split_cur_state[2:0] <= S_FIRST;
  else if (split_flush)
    split_cur_state[2:0] <= S_ABORT;
  else
    split_cur_state[2:0] <= split_next_state[2:0];
end

assign ag_split_req      = ag_inst_vld & !ag_dc_func[3] &
                           ag_misalign & !ag_misalign_final;
assign ag_split_req_gate = ag_inst_vld_dp & !ag_dc_func[3] &
                           ag_misalign;

// &CombBeg; @700
always @( split_cur_state[2:0]
       or split_secd_last
       or ag_dt_cancel
       or ag_split_req
       or split_thrd_last
       or pmp_lsu_acc_deny
       or ag_stall
       or dtif_ag_pipedown_mask)
begin
  case(split_cur_state[2:0])
  S_FIRST: begin
    if (ag_split_req & !ag_stall & !ag_dt_cancel & !dtif_ag_pipedown_mask)
      split_next_state[2:0] = pmp_lsu_acc_deny ? S_ABORT : S_SECD;
    else
      split_next_state[2:0] = S_FIRST;
  end
  S_SECD: begin
    if (!ag_stall) begin
      if (split_secd_last)
        split_next_state[2:0] = S_FIRST;
      else
        split_next_state[2:0] = S_THIRD;
      end
    else
      split_next_state[2:0] = S_SECD;
  end
  S_THIRD:begin
    if (!ag_stall) begin
      if (split_thrd_last)
        split_next_state[2:0] = S_FIRST;
      else
        split_next_state[2:0] = S_FOURTH;
      end
    else
      split_next_state[2:0] = S_THIRD;
  end
  S_FOURTH:begin
    if (!ag_stall) 
      split_next_state[2:0] = S_FIRST;
    else
      split_next_state[2:0] = S_FOURTH;
  end
  S_ABORT:begin
    if (!ag_stall)
      split_next_state[2:0] = S_FIRST;
    else
      split_next_state[2:0] = S_ABORT;
  end
  default:split_next_state[2:0] = S_FIRST;
  endcase
// &CombEnd; @742
end

assign split_cur_first = split_cur_state[2:0] == S_FIRST;
assign split_cur_secd  = split_cur_state[2:0] == S_SECD;
assign split_cur_thrd  = split_cur_state[2:0] == S_THIRD;
assign split_cur_forth = split_cur_state[2:0] == S_FOURTH;
assign split_cur_abort = split_cur_state[2:0] == S_ABORT;

assign split_cur_busy  = split_cur_secd | 
                         split_cur_thrd | 
                         split_cur_forth;

assign ag_split_sel    = split_cur_first & ag_split_req | 
                         split_cur_busy; 

assign split_last      = split_cur_secd & split_secd_last |
                         split_cur_thrd & split_thrd_last |
                         split_cur_forth;
assign split_first     = split_cur_first;

assign split_secd_last = ag_size_half | 
                         ag_size_word & !ag_addr_ff[0] | 
                         ag_size_dw   & !ag_addr_ff[1] & !ag_addr_ff[0];
assign split_thrd_last = ag_size_word |
                         ag_size_dw & !ag_addr_ff[0];

//================================================
// split size 
//================================================
assign ag_size_half = idu_lsu_ex1_size[1:0] == S_HALF;
assign ag_size_word = idu_lsu_ex1_size[1:0] == S_WORD;
assign ag_size_dw   = idu_lsu_ex1_size[1:0] == S_DWORD;

assign split_first_size_half = ag_size_word & !ag_addr[0] |
                               ag_size_dw   & ag_addr[1] & !ag_addr[0];
assign split_first_size_word = ag_size_dw   & (ag_addr[2:0] == 3'b100);
assign split_first_size[1:0] = ag_misalign 
                             ? (split_first_size_word ? S_WORD 
                                                      : (split_first_size_half ? S_HALF : S_BYTE))
                             : idu_lsu_ex1_size[1:0];

assign split_secd_size_byte = ag_size_half & ag_addr_ff[0];
assign split_secd_size_word = ag_size_dw   & (ag_addr_ff[1:0] != 2'b01);
assign split_secd_size[1:0] = split_secd_size_byte
                            ? S_BYTE 
                            : split_secd_size_word ? S_WORD : S_HALF;

assign split_thrd_size_byte = ag_size_word;
assign split_thrd_size_word = ag_size_dw & (ag_addr_ff[1:0] == 2'b01);
assign split_thrd_size[1:0] = split_thrd_size_word
                            ? S_WORD 
                            : (split_thrd_size_byte ? S_BYTE : S_HALF);

assign split_forth_size[1:0] = S_BYTE;
assign split_size[1:0] = {2{split_cur_first}} & split_first_size[1:0] |
                         {2{split_cur_secd}}  & split_secd_size[1:0]  |
                         {2{split_cur_thrd}}  & split_thrd_size[1:0]  |
                         {2{split_cur_forth}} & split_forth_size[1:0];

always@(posedge split_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ag_addr_ff[2:0] <= 3'b0;
  else if (split_cur_first & ag_split_req & !ag_stall)
    ag_addr_ff[2:0] <= ag_addr[2:0];
end

//================================================
//   data_abort to preceding load
//================================================
//when there is a pmp_deny or misalign_extp in split and a load request has already 
//been processed in DC or NCB, inst_abort should be generated to abort the request.
//================================================
//pmp_deny or misalign is valid when in 
//1.split_first: since no actual request is sent to DC, so there is no need to abort;
//2.split_busy: 
//  a)split_last: directly set inst_abort to flush MB FSM.
//  b)!split_last: split_fsm jump to S_ABORT state, and then abort MB.
assign ag_xx_inst_abort = split_cur_abort | split_last & (pmp_lsu_acc_deny | ag_dc_so | ag_dt_cancel);

//================================================
//    split_done
//================================================
//to avoid abort other normal loads, implement split done
//1.in split last, there is no pmp_deny or misalign, split_done is valid

assign ag_xx_split_done = split_last & !ag_stall & !pmp_lsu_acc_deny & !ag_dc_so & !ag_dt_cancel;

//================================================
//   split_acc_deny
//================================================
always@(posedge split_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    split_acc_deny <= 1'b0;
  else if (!ag_stall & ag_split_sel & ag_inst_vld_aft_cancel & !split_last)
    split_acc_deny <= pmp_lsu_acc_deny;
  else if (!ag_stall_final & ag_inst_vld_aft_cancel & split_acc_deny_vld)
    split_acc_deny <= 1'b0;
end

assign split_acc_deny_vld = split_cur_abort & split_acc_deny;

always@(posedge split_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    split_acc_deny_ff <= 1'b0;
  else if (split_acc_deny_vld ^ split_acc_deny_ff)
    split_acc_deny_ff <= split_acc_deny_vld;
end

always@(posedge split_err_clk)
begin
  if (!split_acc_deny_ff & split_acc_deny_vld | ifu_lsu_warm_up) begin
    split_pmp_mtval[31:0] <= pmp_deny_mtval_ex2[31:0];
    split_pmp_ld_inst     <= pmp_deny_ld_inst_ex2;
  end
end

assign split_acc_clk_en = split_acc_deny_vld;
// &Instance("gated_clk_cell", "x_pa_lsu_split_err_gated_clk"); @877
gated_clk_cell  x_pa_lsu_split_err_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (split_err_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (split_acc_clk_en  ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @878
//          .external_en (1'b0), @879
//          .global_en   (1'b1), @880
//          .module_en     (cp0_lsu_icg_en     ), @881
//          .local_en    (split_acc_clk_en), @882
//          .clk_out     (split_err_clk)); @883

//================================================
//       ICG
//================================================
assign split_clk_en = ag_split_req_gate | !split_cur_first;

// &Instance("gated_clk_cell", "x_pa_lsu_ag_split_gated_clk"); @893
gated_clk_cell  x_pa_lsu_ag_split_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (split_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (split_clk_en      ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @894
//          .external_en (1'b0), @895
//          .global_en   (1'b1), @896
//          .module_en     (cp0_lsu_icg_en     ), @897
//          .local_en    (split_clk_en), @898
//          .clk_out     (split_clk)); @899

//================================================
//    memory data bkpt
//================================================


//================================================
//      store wdata shift
//================================================
assign size_onehot[2:0] = ag_dc_size[1:0] == S_BYTE 
                        ? 3'b001 
                        : ag_dc_size[1:0] == S_HALF ? 3'b010 : 3'b100;

always@(posedge split_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    split_wdata_shift[2:0] <= 3'b0;
  else if (!ag_stall & ag_split_sel)
    split_wdata_shift[2:0] <= wdata_shift[2:0] + size_onehot[2:0];
end

//assign split_wdata_shift_inc[2:0] = wdata_shift[2:0] + size_onehot[2:0];

assign wdata_shift[2:0] = split_cur_first 
                        ? 3'b000
                        : split_wdata_shift[2:0];



//==============================================================================
//                     Fast complete to RTU
//==============================================================================
// &Force("output", "lsu_rtu_ex1_cmplt"); @942
assign target_ca = ag_dc_ca;// & cp0_lsu_dcache_en | ag_dc_func[3];
always@(posedge ag_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    target_ca_ff <= 1'b0;
  else if (lsu_ex1_sel)
    target_ca_ff <= target_ca;
end


assign ag_dc_inst_vld  = ag_inst_vld & target_ca & target_ca_ff & 
                        !split_cur_abort &
                        !ag_dc_misalign & 
                        !ag_dt_cancel & 
                        !dtif_ag_pipedown_mask & 
                        !ag_self_stall &
                        !lsu_ex2_stall_final &
                         arb_ag_grant & ncb_xx_no_op;

assign ag_dc_inst_vld_gate = ag_inst_vld_dp & target_ca_ff &
                            !split_cur_abort &
                             arb_ag_grant & ncb_xx_no_op;

// ag_ncb_inst_vld_dp can't be masked by misalign
assign ag_ncb_inst_vld    = ag_inst_vld & !target_ca & !target_ca_ff & 
                           !split_cur_abort & 
                           !ag_dc_misalign &
                           !ag_dt_cancel &
                           !dtif_ag_pipedown_mask & 
                           !ag_self_stall &
                           !lsu_ex2_stall_final &
                            dc_ag_empty;

assign ag_ncb_inst_vld_dp = ag_inst_vld_dp & !target_ca_ff & 
                           !split_cur_abort & 
                           !lsu_ex2_stall_final &
                            dc_ag_empty;

//assign ag_ncb_ca_req   = ag_inst_vld & target_ca;

assign ag_stall_raw   = target_ca ? (dc_ag_stall  | ag_self_stall | !arb_ag_grant | !target_ca_ff | !ncb_xx_no_op)
                                  : (ncb_ag_stall | ag_self_stall | target_ca_ff | !dc_ag_empty );
assign ag_stall       = ag_stall_raw | rtu_xx_ex1_stall;

assign split_busy     = split_cur_first & ag_split_req |
                        split_cur_busy  & !split_last;
assign ag_last_inst   = !split_busy;

assign ag_stall_final = !ag_last_inst
                        | !dtif_ag_fsm_idle & !dtif_ag_cmplt_ready
                        | ag_stall;

//assign lsu_rtu_ex1_stall         = idu_lsu_ex1_sel &  ag_stall_final;
assign lsu_rtu_ex1_cmplt         = lsu_ex1_sel & !ag_stall_final;
assign lsu_rtu_ex1_cmplt_dp      = lsu_ex1_dp_sel;

assign lsu_rtu_ex1_inst_vld        = idu_lsu_ex1_gateclk_sel;
assign lsu_rtu_ex1_inst_len        = idu_lsu_ex1_length;
assign lsu_rtu_ex1_split_inst      = idu_lsu_ex1_split;
assign lsu_rtu_ex1_ipush_spec_inst = idu_lsu_ex1_ipush_spec;
assign lsu_rtu_ex1_ipop_int_mask   = idu_lsu_ex1_ipop_int_mask;

assign lsu_rtu_ex1_halt_info[`TDT_HINFO_WIDTH-1:0] = idu_lsu_ex1_halt_info[`TDT_HINFO_WIDTH-1:0];

//==============================================================================
//            D-CACHE Interface
//==============================================================================
// &Force("bus","dc_ag_dcache_addr",31,0); @1020
// &Force("bus","dc_ag_func",3,0); @1021

parameter D_DATA_INDEX_LEN = `D_DATA_INDEX_WIDTH;
parameter D_TAG_TAG_LEN    = `D_TAG_TAG_WIDTH;
parameter D_TAG_INDEX_LEN  = `D_TAG_INDEX_WIDTH;

assign dcache_size[1:0]
                      = dc_ag_dcache_req
                      ? dc_ag_dcache_size[1:0]
                      : ag_dc_size[1:0];
assign dcache_index[12:0] 
                      = dc_ag_dcache_req
                      ? dc_ag_dcache_addr[14:2]
                      : ag_dc_addr[14:2];
assign ag_inst_dca_st = dc_ag_dcache_req 
                      ? (dc_ag_func[3] | dc_ag_func[0])
                      : (ag_dc_func[3] | ag_dc_func[0]);
assign ag_inst_dca    = dc_ag_dcache_req
                      ? dc_ag_func[3]
                      : ag_dc_func[3];

assign ag_arb_tag_req       = dc_ag_dcache_req | 
                              ag_inst_vld & target_ca_ff & !dc_ag_cache_stall;
assign ag_arb_tag_req_dp    = ag_arb_tag_req; 
assign ag_arb_tag_wen[1:0]  = 2'b0;
assign ag_arb_tag_din[22:0] = 23'b0;
assign ag_arb_tag_idx[9:0]  = dcache_index[12:3];

assign ag_arb_dirty_req      = ag_arb_tag_req & ag_inst_dca;
assign ag_arb_dirty_req_dp   = ag_arb_tag_req_dp & ag_inst_dca;
assign ag_arb_dirty_wen[2:0] = 3'b0;
assign ag_arb_dirty_din[2:0] = 3'b0;
assign ag_arb_dirty_idx[9:0] = dcache_index[12:3];

assign ag_arb_data_req       = ag_arb_tag_req & !ag_inst_dca_st;
assign ag_arb_data_req_dp    = ag_arb_tag_req_dp & !ag_inst_dca_st;
assign ag_arb_data_wen[3:0]  = 4'b0;
assign ag_arb_data_din[63:0] = 64'b0;
assign ag_arb_data_idx[11:0] = dcache_index[12:1];
assign ag_arb_data_bank[1]   = dcache_size[1:0] == 2'b11 |  dcache_index[0];
assign ag_arb_data_bank[0]   = dcache_size[1:0] == 2'b11 | ~dcache_index[0];                            
assign ag_dc_dcache_grant = arb_ag_grant;

// &Instance("pa_lsu_arb", "x_pa_lsu_arb"); @1064
pa_lsu_arb  x_pa_lsu_arb (
  .ag_arb_data_bank           (ag_arb_data_bank          ),
  .ag_arb_data_din            (ag_arb_data_din           ),
  .ag_arb_data_idx            (ag_arb_data_idx           ),
  .ag_arb_data_req            (ag_arb_data_req           ),
  .ag_arb_data_req_dp         (ag_arb_data_req_dp        ),
  .ag_arb_data_wen            (ag_arb_data_wen           ),
  .ag_arb_dirty_din           (ag_arb_dirty_din          ),
  .ag_arb_dirty_idx           (ag_arb_dirty_idx          ),
  .ag_arb_dirty_req           (ag_arb_dirty_req          ),
  .ag_arb_dirty_req_dp        (ag_arb_dirty_req_dp       ),
  .ag_arb_dirty_wen           (ag_arb_dirty_wen          ),
  .ag_arb_tag_din             (ag_arb_tag_din            ),
  .ag_arb_tag_idx             (ag_arb_tag_idx            ),
  .ag_arb_tag_req             (ag_arb_tag_req            ),
  .ag_arb_tag_wen             (ag_arb_tag_wen            ),
  .arb_ag_grant               (arb_ag_grant              ),
  .arb_icc_data_grant         (arb_icc_data_grant        ),
  .arb_rdl_grant              (arb_rdl_grant             ),
  .arb_stb_xx_grant           (arb_stb_xx_grant          ),
  .dcache_data_cen_way0_bank0 (dcache_data_cen_way0_bank0),
  .dcache_data_cen_way0_bank1 (dcache_data_cen_way0_bank1),
  .dcache_data_cen_way1_bank0 (dcache_data_cen_way1_bank0),
  .dcache_data_cen_way1_bank1 (dcache_data_cen_way1_bank1),
  .dcache_data_din            (dcache_data_din           ),
  .dcache_data_idx            (dcache_data_idx           ),
  .dcache_data_wen            (dcache_data_wen           ),
  .dcache_dirty_cen           (dcache_dirty_cen          ),
  .dcache_dirty_din           (dcache_dirty_din          ),
  .dcache_dirty_idx           (dcache_dirty_idx          ),
  .dcache_dirty_wen           (dcache_dirty_wen          ),
  .dcache_tag_cen             (dcache_tag_cen            ),
  .dcache_tag_din             (dcache_tag_din            ),
  .dcache_tag_idx             (dcache_tag_idx            ),
  .dcache_tag_wen             (dcache_tag_wen            ),
  .icc_arb_data_bank          (icc_arb_data_bank         ),
  .icc_arb_data_din           (icc_arb_data_din          ),
  .icc_arb_data_idx           (icc_arb_data_idx          ),
  .icc_arb_data_req           (icc_arb_data_req          ),
  .icc_arb_data_way           (icc_arb_data_way          ),
  .icc_arb_data_wen           (icc_arb_data_wen          ),
  .icc_arb_dirty_din          (icc_arb_dirty_din         ),
  .icc_arb_dirty_idx          (icc_arb_dirty_idx         ),
  .icc_arb_dirty_req          (icc_arb_dirty_req         ),
  .icc_arb_dirty_wen          (icc_arb_dirty_wen         ),
  .icc_arb_tag_din            (icc_arb_tag_din           ),
  .icc_arb_tag_idx            (icc_arb_tag_idx           ),
  .icc_arb_tag_req            (icc_arb_tag_req           ),
  .icc_arb_tag_wen            (icc_arb_tag_wen           ),
  .lfb_arb_data_bank          (lfb_arb_data_bank         ),
  .lfb_arb_data_din           (lfb_arb_data_din          ),
  .lfb_arb_data_idx           (lfb_arb_data_idx          ),
  .lfb_arb_data_req           (lfb_arb_data_req          ),
  .lfb_arb_data_way           (lfb_arb_data_way          ),
  .lfb_arb_data_wen           (lfb_arb_data_wen          ),
  .lfb_arb_dcache_sel         (lfb_arb_dcache_sel        ),
  .lfb_arb_dirty_din          (lfb_arb_dirty_din         ),
  .lfb_arb_dirty_idx          (lfb_arb_dirty_idx         ),
  .lfb_arb_dirty_req          (lfb_arb_dirty_req         ),
  .lfb_arb_dirty_wen          (lfb_arb_dirty_wen         ),
  .lfb_arb_tag_din            (lfb_arb_tag_din           ),
  .lfb_arb_tag_idx            (lfb_arb_tag_idx           ),
  .lfb_arb_tag_req            (lfb_arb_tag_req           ),
  .lfb_arb_tag_wen            (lfb_arb_tag_wen           ),
  .rdl_arb_data_bank          (rdl_arb_data_bank         ),
  .rdl_arb_data_din           (rdl_arb_data_din          ),
  .rdl_arb_data_idx           (rdl_arb_data_idx          ),
  .rdl_arb_data_req           (rdl_arb_data_req          ),
  .rdl_arb_data_way           (rdl_arb_data_way          ),
  .rdl_arb_data_wen           (rdl_arb_data_wen          ),
  .rdl_arb_dcache_sel         (rdl_arb_dcache_sel        ),
  .rdl_arb_dirty_din          (rdl_arb_dirty_din         ),
  .rdl_arb_dirty_idx          (rdl_arb_dirty_idx         ),
  .rdl_arb_dirty_req          (rdl_arb_dirty_req         ),
  .rdl_arb_dirty_wen          (rdl_arb_dirty_wen         ),
  .rdl_arb_tag_din            (rdl_arb_tag_din           ),
  .rdl_arb_tag_idx            (rdl_arb_tag_idx           ),
  .rdl_arb_tag_req            (rdl_arb_tag_req           ),
  .rdl_arb_tag_wen            (rdl_arb_tag_wen           ),
  .stb_arb_data_bank          (stb_arb_data_bank         ),
  .stb_arb_data_din           (stb_arb_data_din          ),
  .stb_arb_data_idx           (stb_arb_data_idx          ),
  .stb_arb_data_req           (stb_arb_data_req          ),
  .stb_arb_data_way           (stb_arb_data_way          ),
  .stb_arb_data_wen           (stb_arb_data_wen          ),
  .stb_arb_dcache_sel         (stb_arb_dcache_sel        ),
  .stb_arb_dirty_din          (stb_arb_dirty_din         ),
  .stb_arb_dirty_idx          (stb_arb_dirty_idx         ),
  .stb_arb_dirty_req          (stb_arb_dirty_req         ),
  .stb_arb_dirty_wen          (stb_arb_dirty_wen         )
);



//================================================
//      PMU
//================================================
assign lsu_hpcp_inst_store = ag_inst_vld & ag_inst_st;
assign lsu_hpcp_inst_store_gate = ag_inst_vld_dp & ag_inst_st;

// &ModuleEnd; @1079
endmodule


