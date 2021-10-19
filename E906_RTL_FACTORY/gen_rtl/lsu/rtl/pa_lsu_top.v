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

// &Depend("cpu_cfig.h"); @18

// &ModuleBeg; @20
module pa_lsu_top(
  bmu_lsu_acc_err,
  bmu_lsu_grant,
  bmu_lsu_rdata,
  bmu_lsu_trans_cmplt,
  cp0_lsu_dcache_en,
  cp0_lsu_dcache_wa,
  cp0_lsu_dcache_wb,
  cp0_lsu_fence_req,
  cp0_lsu_icc_addr,
  cp0_lsu_icc_op,
  cp0_lsu_icc_req,
  cp0_lsu_icc_type,
  cp0_lsu_icg_en,
  cp0_lsu_mm,
  cp0_lsu_sync_req,
  cp0_xx_async_expt_en,
  cp0_yy_mach_mode,
  cpurst_b,
  dtu_lsu_addr_trig_en,
  dtu_lsu_data_trig_en,
  dtu_lsu_halt_info,
  dtu_lsu_halt_info_vld,
  forever_cpuclk,
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
  lsu_biu_amo_pmp_deny,
  lsu_biu_async_expt_ack,
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
  lsu_cp0_fence_ack,
  lsu_cp0_icc_done,
  lsu_cp0_sync_ack,
  lsu_dtu_debug_info,
  lsu_dtu_halt_info,
  lsu_dtu_last_check,
  lsu_dtu_ldst_addr,
  lsu_dtu_ldst_addr_vld,
  lsu_dtu_ldst_bytes_vld,
  lsu_dtu_ldst_data,
  lsu_dtu_ldst_data_vld,
  lsu_dtu_ldst_type,
  lsu_dtu_mem_access_size,
  lsu_hpcp_cache_read_access,
  lsu_hpcp_cache_read_access_gate,
  lsu_hpcp_cache_read_miss,
  lsu_hpcp_cache_read_miss_gate,
  lsu_hpcp_cache_write_access,
  lsu_hpcp_cache_write_access_gate,
  lsu_hpcp_cache_write_miss,
  lsu_hpcp_cache_write_miss_gate,
  lsu_hpcp_inst_store,
  lsu_hpcp_inst_store_gate,
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
  lsu_iu_ex1_base_wb,
  lsu_iu_ex1_src1_sel,
  lsu_iu_ex2_data,
  lsu_iu_ex2_data_vld,
  lsu_iu_ex2_dest_reg,
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
  lsu_rtu_ex2_stall,
  lsu_rtu_ex2_tval,
  lsu_rtu_fgpr_wb_data,
  lsu_rtu_fgpr_wb_reg,
  lsu_rtu_fgpr_wb_vld,
  lsu_rtu_sync_ack,
  lsu_rtu_wb_data,
  lsu_rtu_wb_preg,
  lsu_rtu_wb_vld,
  lsu_sysmap_pa,
  lsu_xx_flush,
  lsu_xx_no_op,
  lsu_xx_warm_up,
  pad_yy_icg_scan_en,
  pmp_lsu_acc_deny,
  rtu_lsu_async_expt_ack,
  rtu_lsu_expt_ack,
  rtu_lsu_expt_exit,
  rtu_lsu_fgpr_wb_data,
  rtu_lsu_fgpr_wb_reg,
  rtu_lsu_fgpr_wb_vld,
  rtu_lsu_inst_retire,
  rtu_lsu_sync_req,
  rtu_lsu_wb1_data,
  rtu_lsu_wb1_lsu_vld,
  rtu_lsu_wb1_preg,
  rtu_xx_ex1_stall,
  rtu_yy_xx_async_flush,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_flush,
  sysmap_lsu_flg
);

// &Ports; @21
input           bmu_lsu_acc_err;                 
input           bmu_lsu_grant;                   
input   [31:0]  bmu_lsu_rdata;                   
input           bmu_lsu_trans_cmplt;             
input           cp0_lsu_dcache_en;               
input           cp0_lsu_dcache_wa;               
input           cp0_lsu_dcache_wb;               
input           cp0_lsu_fence_req;               
input   [31:0]  cp0_lsu_icc_addr;                
input   [1 :0]  cp0_lsu_icc_op;                  
input           cp0_lsu_icc_req;                 
input   [1 :0]  cp0_lsu_icc_type;                
input           cp0_lsu_icg_en;                  
input           cp0_lsu_mm;                      
input           cp0_lsu_sync_req;                
input           cp0_xx_async_expt_en;            
input           cp0_yy_mach_mode;                
input           cpurst_b;                        
input           dtu_lsu_addr_trig_en;            
input           dtu_lsu_data_trig_en;            
input   [14:0]  dtu_lsu_halt_info;               
input           dtu_lsu_halt_info_vld;           
input           forever_cpuclk;                  
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
input           pad_yy_icg_scan_en;              
input           pmp_lsu_acc_deny;                
input           rtu_lsu_async_expt_ack;          
input           rtu_lsu_expt_ack;                
input           rtu_lsu_expt_exit;               
input   [31:0]  rtu_lsu_fgpr_wb_data;            
input   [4 :0]  rtu_lsu_fgpr_wb_reg;             
input           rtu_lsu_fgpr_wb_vld;             
input           rtu_lsu_inst_retire;             
input           rtu_lsu_sync_req;                
input   [31:0]  rtu_lsu_wb1_data;                
input           rtu_lsu_wb1_lsu_vld;             
input   [5 :0]  rtu_lsu_wb1_preg;                
input           rtu_xx_ex1_stall;                
input           rtu_yy_xx_async_flush;           
input           rtu_yy_xx_dbgon;                 
input           rtu_yy_xx_flush;                 
input   [4 :0]  sysmap_lsu_flg;                  
output          lsu_biu_amo_pmp_deny;            
output          lsu_biu_async_expt_ack;          
output          lsu_bmu_acc_deny;                
output  [31:0]  lsu_bmu_addr;                    
output  [2 :0]  lsu_bmu_burst;                   
output          lsu_bmu_lock;                    
output          lsu_bmu_lrsc;                    
output  [3 :0]  lsu_bmu_prot;                    
output          lsu_bmu_req;                     
output          lsu_bmu_req_dp;                  
output          lsu_bmu_seq;                     
output  [1 :0]  lsu_bmu_size;                    
output  [31:0]  lsu_bmu_wdata;                   
output          lsu_bmu_write;                   
output          lsu_cp0_fence_ack;               
output          lsu_cp0_icc_done;                
output          lsu_cp0_sync_ack;                
output  [78:0]  lsu_dtu_debug_info;              
output  [14:0]  lsu_dtu_halt_info;               
output          lsu_dtu_last_check;              
output  [31:0]  lsu_dtu_ldst_addr;               
output          lsu_dtu_ldst_addr_vld;           
output  [7 :0]  lsu_dtu_ldst_bytes_vld;          
output  [31:0]  lsu_dtu_ldst_data;               
output          lsu_dtu_ldst_data_vld;           
output  [1 :0]  lsu_dtu_ldst_type;               
output  [1 :0]  lsu_dtu_mem_access_size;         
output          lsu_hpcp_cache_read_access;      
output          lsu_hpcp_cache_read_access_gate; 
output          lsu_hpcp_cache_read_miss;        
output          lsu_hpcp_cache_read_miss_gate;   
output          lsu_hpcp_cache_write_access;     
output          lsu_hpcp_cache_write_access_gate; 
output          lsu_hpcp_cache_write_miss;       
output          lsu_hpcp_cache_write_miss_gate;  
output          lsu_hpcp_inst_store;             
output          lsu_hpcp_inst_store_gate;        
output  [14:0]  lsu_idu_ex1_halt_info;           
output          lsu_idu_ex1_halt_info_update_en; 
output          lsu_idu_ex1_src1_update_en;      
output          lsu_idu_ex1_src1_update_en_gate; 
output          lsu_idu_ex1_stall;               
output  [31:0]  lsu_idu_ex2_ffwd_data;           
output          lsu_idu_ex2_ffwd_vld;            
output  [31:0]  lsu_idu_ex2_fwd_data;            
output  [4 :0]  lsu_idu_ex2_fwd_freg;            
output  [5 :0]  lsu_idu_ex2_fwd_preg;            
output          lsu_idu_ex2_fwd_vld;             
output  [31:0]  lsu_idu_ex3_ffwd_data;           
output          lsu_idu_ex3_ffwd_vld;            
output  [31:0]  lsu_idu_ex3_fwd_data;            
output  [4 :0]  lsu_idu_ex3_fwd_freg;            
output  [5 :0]  lsu_idu_ex3_fwd_preg;            
output          lsu_idu_ex3_fwd_vld;             
output          lsu_idu_global_stall;            
output  [31:0]  lsu_idu_update_addr;             
output          lsu_idu_update_en;               
output          lsu_idu_update_en_gate;          
output  [31:0]  lsu_idu_update_offset;           
output          lsu_iu_ex1_base_wb;              
output          lsu_iu_ex1_src1_sel;             
output  [31:0]  lsu_iu_ex2_data;                 
output          lsu_iu_ex2_data_vld;             
output  [5 :0]  lsu_iu_ex2_dest_reg;             
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
output          lsu_rtu_ex2_stall;               
output  [31:0]  lsu_rtu_ex2_tval;                
output  [31:0]  lsu_rtu_fgpr_wb_data;            
output  [4 :0]  lsu_rtu_fgpr_wb_reg;             
output          lsu_rtu_fgpr_wb_vld;             
output          lsu_rtu_sync_ack;                
output  [31:0]  lsu_rtu_wb_data;                 
output  [5 :0]  lsu_rtu_wb_preg;                 
output          lsu_rtu_wb_vld;                  
output  [31:0]  lsu_sysmap_pa;                   
output          lsu_xx_flush;                    
output          lsu_xx_no_op;                    
output          lsu_xx_warm_up;                  

// &Regs; @22
reg     [31:0]  da_data;                         
reg     [5 :0]  da_dest_reg;                     
reg             da_fls;                          
reg             da_fls_double;                   
reg             da_inst_vld;                     
reg             da_sc_inst;                      
reg     [31:0]  data_align;                      
reg     [31:0]  data_align_ext;                  
reg     [3 :0]  mb_bytes_vld;                    
reg             mb_cur_state;                    
reg     [31:0]  mb_data;                         
reg     [5 :0]  mb_dest_reg;                     
reg             mb_fls;                          
reg             mb_flw;                          
reg             mb_next_state;                   
reg             mb_sign_ext;                     
reg     [1 :0]  mb_size;                         
reg             mb_split_checked;                

// &Wires; @23
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
wire    [31:0]  ag_ncb_addr;                     
wire            ag_ncb_inst_vld;                 
wire            ag_ncb_inst_vld_dp;              
wire    [5 :0]  ag_ncb_src1_reg;                 
wire    [31:0]  ag_ncb_st_data;                  
wire            ag_xx_inst_abort;                
wire            ag_xx_split_done;                
wire            arb_icc_data_grant;              
wire            arb_rdl_grant;                   
wire            arb_stb_xx_grant;                
wire            bmu_lsu_acc_err;                 
wire            bmu_lsu_grant;                   
wire    [31:0]  bmu_lsu_rdata;                   
wire            bmu_lsu_trans_cmplt;             
wire    [3 :0]  bytes_vld;                       
wire            cp0_lsu_dcache_en;               
wire            cp0_lsu_dcache_wa;               
wire            cp0_lsu_dcache_wb;               
wire            cp0_lsu_fence_req;               
wire    [31:0]  cp0_lsu_icc_addr;                
wire    [1 :0]  cp0_lsu_icc_op;                  
wire            cp0_lsu_icc_req;                 
wire    [1 :0]  cp0_lsu_icc_type;                
wire            cp0_lsu_icg_en;                  
wire            cp0_lsu_mm;                      
wire            cp0_xx_async_expt_en;            
wire            cp0_yy_mach_mode;                
wire            cpurst_b;                        
wire            da_clk;                          
wire            da_clk_en;                       
wire            da_data_vld;                     
wire            da_dp_clk;                       
wire            da_dp_clk_en;                    
wire    [31:0]  da_dtu_data;                     
wire            da_dtu_data_expt_vld;            
wire            da_dtu_data_vld;                 
wire    [31:0]  da_xx_fwd_data;                  
wire            da_xx_fwd_fls;                   
wire    [5 :0]  da_xx_fwd_preg;                  
wire            da_xx_fwd_vld;                   
wire            da_xx_no_op;                     
wire    [4 :0]  dahbif_dbginfo;                  
wire            dahbif_lfb_acc_err;              
wire            dahbif_lfb_cmplt;                
wire    [31:0]  dahbif_lfb_data;                 
wire            dahbif_lfb_grant;                
wire            dahbif_ncb_acc_err;              
wire            dahbif_ncb_cmplt;                
wire    [31:0]  dahbif_ncb_data;                 
wire            dahbif_ncb_grant;                
wire            dahbif_ncb_grant_2;              
wire            dahbif_stb_acc_ecc;              
wire            dahbif_stb_cmplt;                
wire            dahbif_stb_grant;                
wire            dahbif_stb_grant_2;              
wire            dahbif_vb_acc_ecc;               
wire            dahbif_vb_cmplt;                 
wire            dahbif_vb_grant;                 
wire    [31:0]  data;                            
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
wire    [31:0]  dc_da_data;                      
wire            dc_da_data_vld;                  
wire            dc_da_data_vld_dp;               
wire    [5 :0]  dc_da_dest_reg;                  
wire            dc_da_fls;                       
wire            dc_da_fls_double;                
wire            dc_da_sc_data_vld;               
wire    [14:0]  dc_dbginfo;                      
wire    [63:0]  dc_icc_way0_data;                
wire            dc_icc_way0_dirty;               
wire    [21:0]  dc_icc_way0_tag;                 
wire    [63:0]  dc_icc_way1_data;                
wire            dc_icc_way1_dirty;               
wire    [21:0]  dc_icc_way1_tag;                 
wire            dc_idle;                         
wire    [31:0]  dc_lfb_addr;                     
wire            dc_lfb_buf;                      
wire            dc_lfb_ca;                       
wire            dc_lfb_ca_raw;                   
wire            dc_lfb_create_en;                
wire            dc_lfb_create_en_gate;           
wire            dc_lfb_inst_ld;                  
wire            dc_lfb_lock_trans;               
wire            dc_lfb_lr_inst;                  
wire            dc_lfb_mach_mode;                
wire    [1 :0]  dc_lfb_size;                     
wire            dc_rdl_fifo;                     
wire    [63:0]  dc_rdl_way0_data;                
wire            dc_rdl_way0_dirty;               
wire    [21:0]  dc_rdl_way0_tag;                 
wire            dc_rdl_way0_vld;                 
wire    [63:0]  dc_rdl_way1_data;                
wire            dc_rdl_way1_dirty;               
wire    [21:0]  dc_rdl_way1_tag;                 
wire            dc_rdl_way1_vld;                 
wire    [31:0]  dc_stb_addr;                     
wire    [2 :0]  dc_stb_attr;                     
wire    [3 :0]  dc_stb_bytes_vld;                
wire            dc_stb_cache_hit;                
wire            dc_stb_create_en;                
wire            dc_stb_create_en_gate;           
wire    [31:0]  dc_stb_data;                     
wire            dc_stb_dcache_dirty;             
wire            dc_stb_dcache_inst;              
wire    [1 :0]  dc_stb_dcache_type;              
wire            dc_stb_dcache_way;               
wire            dc_stb_fls;                      
wire            dc_stb_lock_trans;               
wire            dc_stb_sc_inst;                  
wire    [2 :0]  dc_stb_shift;                    
wire    [1 :0]  dc_stb_size;                     
wire            dc_stb_split_first;              
wire            dc_stb_src1_depd;                
wire    [4 :0]  dc_stb_src1_reg;                 
wire            dc_stb_wait_lfb;                 
wire            dc_vb_st_amold;                  
wire    [31:0]  dc_xx_addr;                      
wire    [7 :0]  dc_xx_bytes_vld;                 
wire            dcache_data_cen_way0_bank0;      
wire            dcache_data_cen_way0_bank1;      
wire            dcache_data_cen_way1_bank0;      
wire            dcache_data_cen_way1_bank1;      
wire    [63:0]  dcache_data_din;                 
wire    [63:0]  dcache_data_dout_way0;           
wire    [63:0]  dcache_data_dout_way1;           
wire    [11:0]  dcache_data_idx;                 
wire    [3 :0]  dcache_data_wen;                 
wire            dcache_dirty_cen;                
wire    [2 :0]  dcache_dirty_din;                
wire    [2 :0]  dcache_dirty_dout;               
wire    [9 :0]  dcache_dirty_idx;                
wire    [2 :0]  dcache_dirty_wen;                
wire            dcache_tag_cen;                  
wire    [22:0]  dcache_tag_din;                  
wire    [45:0]  dcache_tag_dout;                 
wire    [9 :0]  dcache_tag_idx;                  
wire    [1 :0]  dcache_tag_wen;                  
wire    [5 :0]  dest_reg;                        
wire            dtif_ag_cmplt_ready;             
wire            dtif_ag_fsm_idle;                
wire    [14:0]  dtif_ag_halt_info;               
wire            dtif_ag_halt_info_up;            
wire            dtif_ag_pipedown_mask;           
wire            dtif_ag_stall;                   
wire            dtu_lsu_addr_trig_en;            
wire            dtu_lsu_data_trig_en;            
wire    [14:0]  dtu_lsu_halt_info;               
wire            dtu_lsu_halt_info_vld;           
wire            fls;                             
wire            flw;                             
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
wire    [26:0]  icc_vb_addr;                     
wire            icc_vb_clr_vld;                  
wire            icc_vb_create_en;                
wire    [63:0]  icc_vb_data;                     
wire    [1 :0]  icc_vb_data_cnt;                 
wire            icc_vb_data_create;              
wire            icc_vb_line_dirty;               
wire            icc_xx_idle;                     
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
wire    [31:0]  lfb_dahbif_addr;                 
wire    [2 :0]  lfb_dahbif_burst;                
wire            lfb_dahbif_lock;                 
wire            lfb_dahbif_lr_inst;              
wire    [3 :0]  lfb_dahbif_prot;                 
wire            lfb_dahbif_req;                  
wire    [1 :0]  lfb_dahbif_size;                 
wire    [3 :0]  lfb_dbginfo;                     
wire            lfb_dc_async_expt;               
wire            lfb_dc_busy;                     
wire            lfb_dc_hit_idx;                  
wire            lfb_dc_ld_cmplt;                 
wire    [31:0]  lfb_dc_ld_data;                  
wire            lfb_dc_ld_data_vld;              
wire            lfb_dc_pop_en;                   
wire    [9 :0]  lfb_rdl_index;                   
wire            lfb_rdl_start;                   
wire            lfb_rdl_start_gate;              
wire            lfb_stb_done;                    
wire            lfb_stb_err;                     
wire            lfb_stb_fifo;                    
wire            lfb_stb_fifo_update;             
wire            lfb_xx_idle;                     
wire            lm_clr;                          
wire    [33:0]  lm_lr_bus;                       
wire            lm_pass;                         
wire    [33:0]  lm_sc_bus;                       
wire            lm_set;                          
wire            lm_set_gate;                     
wire            lsu_acc_fault_vld;               
wire            lsu_biu_amo_pmp_deny;            
wire            lsu_biu_async_expt_ack;          
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
wire            lsu_cp0_fence_ack;               
wire            lsu_cp0_icc_done;                
wire            lsu_cp0_sync_ack;                
wire    [78:0]  lsu_dtu_debug_info;              
wire            lsu_dtu_ex2_expt_vld;            
wire    [14:0]  lsu_dtu_halt_info;               
wire            lsu_dtu_last_check;              
wire    [31:0]  lsu_dtu_ldst_addr;               
wire            lsu_dtu_ldst_addr_vld;           
wire    [7 :0]  lsu_dtu_ldst_bytes_vld;          
wire    [31:0]  lsu_dtu_ldst_data;               
wire            lsu_dtu_ldst_data_vld;           
wire    [1 :0]  lsu_dtu_ldst_type;               
wire    [1 :0]  lsu_dtu_mem_access_size;         
wire            lsu_ex2_addr_2;                  
wire    [3 :0]  lsu_ex2_bytes_vld;               
wire    [3 :0]  lsu_ex2_bytes_vld_ext;           
wire            lsu_ex2_checked;                 
wire    [31:0]  lsu_ex2_data;                    
wire            lsu_ex2_data_vld;                
wire            lsu_ex2_data_vld_gate;           
wire    [5 :0]  lsu_ex2_dest_reg;                
wire            lsu_ex2_fld;                     
wire            lsu_ex2_fls;                     
wire            lsu_ex2_flw;                     
wire            lsu_ex2_lock;                    
wire            lsu_ex2_sc_data_vld;             
wire            lsu_ex2_sign_ext;                
wire    [1 :0]  lsu_ex2_size;                    
wire            lsu_ex2_split;                   
wire            lsu_ex2_split_last;              
wire            lsu_ex2_stall;                   
wire            lsu_ex2_stall_final;             
wire            lsu_hpcp_cache_read_access;      
wire            lsu_hpcp_cache_read_access_gate; 
wire            lsu_hpcp_cache_read_miss;        
wire            lsu_hpcp_cache_read_miss_gate;   
wire            lsu_hpcp_cache_write_access;     
wire            lsu_hpcp_cache_write_access_gate; 
wire            lsu_hpcp_cache_write_miss;       
wire            lsu_hpcp_cache_write_miss_gate;  
wire            lsu_hpcp_inst_store;             
wire            lsu_hpcp_inst_store_gate;        
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
wire            lsu_iu_ex1_base_wb;              
wire            lsu_iu_ex1_src1_sel;             
wire    [31:0]  lsu_iu_ex2_data;                 
wire            lsu_iu_ex2_data_vld;             
wire    [5 :0]  lsu_iu_ex2_dest_reg;             
wire    [5 :0]  lsu_iu_ex2_lsi_dst_preg;         
wire    [31:0]  lsu_iu_ex2_lsi_rslt;             
wire            lsu_iu_ex2_lsi_rslt_vld;         
wire            lsu_mb_ex2_ca_addr_2;            
wire    [3 :0]  lsu_mb_ex2_ca_bytes_vld;         
wire    [31:0]  lsu_mb_ex2_ca_data;              
wire            lsu_mb_ex2_ca_data_vld;          
wire            lsu_mb_ex2_ca_data_vld_gate;     
wire    [5 :0]  lsu_mb_ex2_ca_dest_reg;          
wire            lsu_mb_ex2_ca_fld;               
wire            lsu_mb_ex2_ca_fls;               
wire            lsu_mb_ex2_ca_lock;              
wire            lsu_mb_ex2_ca_sc_data_vld;       
wire            lsu_mb_ex2_ca_sign_ext;          
wire    [1 :0]  lsu_mb_ex2_ca_size;              
wire            lsu_mb_ex2_ca_split;             
wire            lsu_mb_ex2_ca_split_last;        
wire            lsu_mb_ex2_ca_stall;             
wire            lsu_mb_ex2_uc_addr_2;            
wire    [3 :0]  lsu_mb_ex2_uc_bytes_vld;         
wire    [31:0]  lsu_mb_ex2_uc_data;              
wire            lsu_mb_ex2_uc_data_vld;          
wire            lsu_mb_ex2_uc_data_vld_gate;     
wire    [5 :0]  lsu_mb_ex2_uc_dest_reg;          
wire            lsu_mb_ex2_uc_fld;               
wire            lsu_mb_ex2_uc_fls;               
wire            lsu_mb_ex2_uc_lock;              
wire            lsu_mb_ex2_uc_sc_data_vld;       
wire            lsu_mb_ex2_uc_sign_ext;          
wire    [1 :0]  lsu_mb_ex2_uc_size;              
wire            lsu_mb_ex2_uc_split;             
wire            lsu_mb_ex2_uc_split_last;        
wire            lsu_mb_ex2_uc_stall;             
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
wire    [31:0]  lsu_rtu_ex2_data;                
wire            lsu_rtu_ex2_data_vld;            
wire            lsu_rtu_ex2_data_vld_gate;       
wire    [5 :0]  lsu_rtu_ex2_dest_reg;            
wire            lsu_rtu_ex2_expt_inst;           
wire    [3 :0]  lsu_rtu_ex2_expt_vec;            
wire            lsu_rtu_ex2_fls;                 
wire            lsu_rtu_ex2_stall;               
wire    [31:0]  lsu_rtu_ex2_tval;                
wire    [31:0]  lsu_rtu_fgpr_wb_data;            
wire    [4 :0]  lsu_rtu_fgpr_wb_reg;             
wire            lsu_rtu_fgpr_wb_vld;             
wire            lsu_rtu_sync_ack;                
wire    [31:0]  lsu_rtu_wb_data;                 
wire    [5 :0]  lsu_rtu_wb_preg;                 
wire            lsu_rtu_wb_vld;                  
wire    [31:0]  lsu_sysmap_pa;                   
wire            lsu_top_dc_vld;                  
wire            lsu_xx_ex2_ca_flush;             
wire            lsu_xx_ex2_uc_flush;             
wire            lsu_xx_flush;                    
wire            lsu_xx_no_op;                    
wire            lsu_xx_warm_up;                  
wire            mb_clk;                          
wire            mb_clk_en;                       
wire            mb_create_en;                    
wire    [31:0]  mb_data_bits_vld;                
wire            mb_data_clk;                     
wire            mb_data_clk_en;                  
wire            mb_data_create_en;               
wire            mb_dp_clk;                       
wire            mb_dp_clk_en;                    
wire            ncb_ag_async_expt_vld;           
wire            ncb_ag_async_ld_inst;            
wire    [31:0]  ncb_ag_async_mtval;              
wire            ncb_ag_pmp_ld_inst;              
wire    [31:0]  ncb_ag_pmp_mtval;                
wire            ncb_ag_stall;                    
wire            ncb_dahbif_acc_deny;             
wire            ncb_dahbif_lock;                 
wire            ncb_dahbif_lrsc;                 
wire    [31:0]  ncb_dahbif_ncb_wb_addr;          
wire            ncb_dahbif_ncb_wb_sel;           
wire    [3 :0]  ncb_dahbif_prot;                 
wire            ncb_dahbif_req;                  
wire            ncb_dahbif_req_dp;               
wire    [1 :0]  ncb_dahbif_size;                 
wire    [31:0]  ncb_dahbif_uc_ld_addr;           
wire    [31:0]  ncb_dahbif_wdata;                
wire            ncb_dahbif_write;                
wire    [10:0]  ncb_dbginfo;                     
wire            ncb_xx_no_op;                    
wire            pad_yy_icg_scan_en;              
wire            pmp_lsu_acc_deny;                
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
wire    [2 :0]  rdl_dbginfo;                     
wire            rdl_lfb_done;                    
wire            rdl_lfb_fifo;                    
wire            rdl_lfb_fifo_save;               
wire            rdl_lfb_grant;                   
wire    [1 :0]  rdl_stb_cmplt_id;                
wire            rdl_stb_dca_cmplt;               
wire            rdl_stb_dca_grant;               
wire    [26:0]  rdl_vb_addr;                     
wire            rdl_vb_create_en;                
wire    [63:0]  rdl_vb_data;                     
wire    [1 :0]  rdl_vb_data_cnt;                 
wire            rdl_vb_data_create;              
wire            rdl_vb_line_dirty;               
wire            rdl_vb_warm_up;                  
wire            rtu_lsu_async_expt_ack;          
wire            rtu_lsu_expt_ack;                
wire            rtu_lsu_expt_exit;               
wire    [31:0]  rtu_lsu_fgpr_wb_data;            
wire    [4 :0]  rtu_lsu_fgpr_wb_reg;             
wire            rtu_lsu_fgpr_wb_vld;             
wire            rtu_lsu_inst_retire;             
wire            rtu_lsu_sync_req;                
wire    [31:0]  rtu_lsu_wb1_data;                
wire            rtu_lsu_wb1_lsu_vld;             
wire    [5 :0]  rtu_lsu_wb1_preg;                
wire            rtu_xx_ex1_stall;                
wire            rtu_yy_xx_async_flush;           
wire            rtu_yy_xx_dbgon;                 
wire            rtu_yy_xx_flush;                 
wire            sign_ext;                        
wire    [1 :0]  size;                            
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
wire    [31:0]  stb_dahbif_addr;                 
wire    [31:0]  stb_dahbif_data;                 
wire            stb_dahbif_lock;                 
wire    [3 :0]  stb_dahbif_prot;                 
wire            stb_dahbif_req;                  
wire            stb_dahbif_sc_inst;              
wire    [1 :0]  stb_dahbif_size;                 
wire    [23:0]  stb_dbginfo;                     
wire            stb_dc_async_expt;               
wire            stb_dc_busy;                     
wire            stb_dc_full;                     
wire            stb_dc_hit_addr;                 
wire            stb_dc_hit_dca;                  
wire            stb_dc_hit_idx;                  
wire    [31:0]  stb_dc_ld_data;                  
wire            stb_dc_ld_fwd_vld;               
wire    [31:0]  stb_dc_mtval;                    
wire            stb_dc_multi_or_part_hit;        
wire            stb_dc_pop_en;                   
wire            stb_idle;                        
wire    [26:0]  stb_rdl_addr;                    
wire    [1 :0]  stb_rdl_dca_type;                
wire            stb_rdl_dirty;                   
wire    [1 :0]  stb_rdl_id;                      
wire            stb_rdl_start;                   
wire            stb_rdl_way;                     
wire    [4 :0]  sysmap_lsu_flg;                  
wire    [31:0]  vb_dahbif_addr;                  
wire    [31:0]  vb_dahbif_data;                  
wire    [3 :0]  vb_dahbif_prot;                  
wire            vb_dahbif_req;                   
wire    [7 :0]  vb_dbginfo;                      
wire            vb_dc_hit_dirty;                 
wire    [31:0]  vb_dc_ld_data;                   
wire            vb_dc_ld_fwd_vld;                
wire            vb_dc_pop_en;                    
wire            vb_icc_empty;                    
wire            vb_icc_grant;                    
wire            vb_idle;                         
wire            vb_rdl_grant;                    
wire            vb_wb_idle;                      


parameter DATAW = `FLEN;

// &Instance("pa_lsu_ag", "x_pa_lsu_ag"); @27
pa_lsu_ag  x_pa_lsu_ag (
  .ag_dc_addr                      (ag_dc_addr                     ),
  .ag_dc_buf                       (ag_dc_buf                      ),
  .ag_dc_bytes_vld                 (ag_dc_bytes_vld                ),
  .ag_dc_ca                        (ag_dc_ca                       ),
  .ag_dc_dcache_grant              (ag_dc_dcache_grant             ),
  .ag_dc_dest_reg                  (ag_dc_dest_reg                 ),
  .ag_dc_fls                       (ag_dc_fls                      ),
  .ag_dc_func                      (ag_dc_func                     ),
  .ag_dc_inst_vld                  (ag_dc_inst_vld                 ),
  .ag_dc_inst_vld_gate             (ag_dc_inst_vld_gate            ),
  .ag_dc_lm_pass                   (ag_dc_lm_pass                  ),
  .ag_dc_mach_mode                 (ag_dc_mach_mode                ),
  .ag_dc_ori_size                  (ag_dc_ori_size                 ),
  .ag_dc_pmp_expt                  (ag_dc_pmp_expt                 ),
  .ag_dc_sign_ext                  (ag_dc_sign_ext                 ),
  .ag_dc_size                      (ag_dc_size                     ),
  .ag_dc_so                        (ag_dc_so                       ),
  .ag_dc_split                     (ag_dc_split                    ),
  .ag_dc_split_first               (ag_dc_split_first              ),
  .ag_dc_split_last                (ag_dc_split_last               ),
  .ag_dc_src1_depd                 (ag_dc_src1_depd                ),
  .ag_dc_src1_reg                  (ag_dc_src1_reg                 ),
  .ag_dc_st_data                   (ag_dc_st_data                  ),
  .ag_dc_wdata_shift               (ag_dc_wdata_shift              ),
  .ag_dtu_addr                     (ag_dtu_addr                    ),
  .ag_dtu_addr_ready               (ag_dtu_addr_ready              ),
  .ag_dtu_amo_type                 (ag_dtu_amo_type                ),
  .ag_dtu_bytes_vld                (ag_dtu_bytes_vld               ),
  .ag_dtu_data                     (ag_dtu_data                    ),
  .ag_dtu_data_chk_mask            (ag_dtu_data_chk_mask           ),
  .ag_dtu_data_vld                 (ag_dtu_data_vld                ),
  .ag_dtu_halt_info                (ag_dtu_halt_info               ),
  .ag_dtu_mem_access_size          (ag_dtu_mem_access_size         ),
  .ag_dtu_pipe_down                (ag_dtu_pipe_down               ),
  .ag_dtu_req                      (ag_dtu_req                     ),
  .ag_dtu_req_gate                 (ag_dtu_req_gate                ),
  .ag_dtu_split_last               (ag_dtu_split_last              ),
  .ag_dtu_st_type                  (ag_dtu_st_type                 ),
  .ag_ncb_addr                     (ag_ncb_addr                    ),
  .ag_ncb_inst_vld                 (ag_ncb_inst_vld                ),
  .ag_ncb_inst_vld_dp              (ag_ncb_inst_vld_dp             ),
  .ag_ncb_src1_reg                 (ag_ncb_src1_reg                ),
  .ag_ncb_st_data                  (ag_ncb_st_data                 ),
  .ag_xx_inst_abort                (ag_xx_inst_abort               ),
  .ag_xx_split_done                (ag_xx_split_done               ),
  .arb_icc_data_grant              (arb_icc_data_grant             ),
  .arb_rdl_grant                   (arb_rdl_grant                  ),
  .arb_stb_xx_grant                (arb_stb_xx_grant               ),
  .cp0_lsu_icg_en                  (cp0_lsu_icg_en                 ),
  .cp0_lsu_mm                      (cp0_lsu_mm                     ),
  .cp0_xx_async_expt_en            (cp0_xx_async_expt_en           ),
  .cp0_yy_mach_mode                (cp0_yy_mach_mode               ),
  .cpurst_b                        (cpurst_b                       ),
  .da_xx_fwd_data                  (da_xx_fwd_data                 ),
  .da_xx_fwd_fls                   (da_xx_fwd_fls                  ),
  .da_xx_fwd_preg                  (da_xx_fwd_preg                 ),
  .da_xx_fwd_vld                   (da_xx_fwd_vld                  ),
  .dc_ag_async_expt_vld            (dc_ag_async_expt_vld           ),
  .dc_ag_async_ld_inst             (dc_ag_async_ld_inst            ),
  .dc_ag_async_mtval               (dc_ag_async_mtval              ),
  .dc_ag_cache_stall               (dc_ag_cache_stall              ),
  .dc_ag_dcache_addr               (dc_ag_dcache_addr              ),
  .dc_ag_dcache_req                (dc_ag_dcache_req               ),
  .dc_ag_dcache_size               (dc_ag_dcache_size              ),
  .dc_ag_empty                     (dc_ag_empty                    ),
  .dc_ag_func                      (dc_ag_func                     ),
  .dc_ag_pmp_ld_inst               (dc_ag_pmp_ld_inst              ),
  .dc_ag_pmp_mtval                 (dc_ag_pmp_mtval                ),
  .dc_ag_stall                     (dc_ag_stall                    ),
  .dcache_data_cen_way0_bank0      (dcache_data_cen_way0_bank0     ),
  .dcache_data_cen_way0_bank1      (dcache_data_cen_way0_bank1     ),
  .dcache_data_cen_way1_bank0      (dcache_data_cen_way1_bank0     ),
  .dcache_data_cen_way1_bank1      (dcache_data_cen_way1_bank1     ),
  .dcache_data_din                 (dcache_data_din                ),
  .dcache_data_idx                 (dcache_data_idx                ),
  .dcache_data_wen                 (dcache_data_wen                ),
  .dcache_dirty_cen                (dcache_dirty_cen               ),
  .dcache_dirty_din                (dcache_dirty_din               ),
  .dcache_dirty_idx                (dcache_dirty_idx               ),
  .dcache_dirty_wen                (dcache_dirty_wen               ),
  .dcache_tag_cen                  (dcache_tag_cen                 ),
  .dcache_tag_din                  (dcache_tag_din                 ),
  .dcache_tag_idx                  (dcache_tag_idx                 ),
  .dcache_tag_wen                  (dcache_tag_wen                 ),
  .dtif_ag_cmplt_ready             (dtif_ag_cmplt_ready            ),
  .dtif_ag_fsm_idle                (dtif_ag_fsm_idle               ),
  .dtif_ag_halt_info               (dtif_ag_halt_info              ),
  .dtif_ag_halt_info_up            (dtif_ag_halt_info_up           ),
  .dtif_ag_pipedown_mask           (dtif_ag_pipedown_mask          ),
  .dtif_ag_stall                   (dtif_ag_stall                  ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .icc_arb_data_bank               (icc_arb_data_bank              ),
  .icc_arb_data_din                (icc_arb_data_din               ),
  .icc_arb_data_idx                (icc_arb_data_idx               ),
  .icc_arb_data_req                (icc_arb_data_req               ),
  .icc_arb_data_way                (icc_arb_data_way               ),
  .icc_arb_data_wen                (icc_arb_data_wen               ),
  .icc_arb_dirty_din               (icc_arb_dirty_din              ),
  .icc_arb_dirty_idx               (icc_arb_dirty_idx              ),
  .icc_arb_dirty_req               (icc_arb_dirty_req              ),
  .icc_arb_dirty_wen               (icc_arb_dirty_wen              ),
  .icc_arb_tag_din                 (icc_arb_tag_din                ),
  .icc_arb_tag_idx                 (icc_arb_tag_idx                ),
  .icc_arb_tag_req                 (icc_arb_tag_req                ),
  .icc_arb_tag_wen                 (icc_arb_tag_wen                ),
  .idu_lsu_ex1_ag_imm              (idu_lsu_ex1_ag_imm             ),
  .idu_lsu_ex1_base                (idu_lsu_ex1_base               ),
  .idu_lsu_ex1_base_sel            (idu_lsu_ex1_base_sel           ),
  .idu_lsu_ex1_base_wb             (idu_lsu_ex1_base_wb            ),
  .idu_lsu_ex1_data                (idu_lsu_ex1_data               ),
  .idu_lsu_ex1_dest_reg            (idu_lsu_ex1_dest_reg           ),
  .idu_lsu_ex1_dest_vld            (idu_lsu_ex1_dest_vld           ),
  .idu_lsu_ex1_dp_sel              (idu_lsu_ex1_dp_sel             ),
  .idu_lsu_ex1_fls                 (idu_lsu_ex1_fls                ),
  .idu_lsu_ex1_func                (idu_lsu_ex1_func               ),
  .idu_lsu_ex1_gateclk_sel         (idu_lsu_ex1_gateclk_sel        ),
  .idu_lsu_ex1_halt_info           (idu_lsu_ex1_halt_info          ),
  .idu_lsu_ex1_ipop_int_mask       (idu_lsu_ex1_ipop_int_mask      ),
  .idu_lsu_ex1_ipush_spec          (idu_lsu_ex1_ipush_spec         ),
  .idu_lsu_ex1_length              (idu_lsu_ex1_length             ),
  .idu_lsu_ex1_offset_sel          (idu_lsu_ex1_offset_sel         ),
  .idu_lsu_ex1_sel                 (idu_lsu_ex1_sel                ),
  .idu_lsu_ex1_sign_extend         (idu_lsu_ex1_sign_extend        ),
  .idu_lsu_ex1_size                (idu_lsu_ex1_size               ),
  .idu_lsu_ex1_split               (idu_lsu_ex1_split              ),
  .idu_lsu_ex1_src0_reg            (idu_lsu_ex1_src0_reg           ),
  .idu_lsu_ex1_src1_depd           (idu_lsu_ex1_src1_depd          ),
  .idu_lsu_ex1_src1_reg            (idu_lsu_ex1_src1_reg           ),
  .ifu_lsu_warm_up                 (ifu_lsu_warm_up                ),
  .iu_lsu_ex1_lsi_rst              (iu_lsu_ex1_lsi_rst             ),
  .iu_lsu_ex2_wb0_grant            (iu_lsu_ex2_wb0_grant           ),
  .lfb_arb_data_bank               (lfb_arb_data_bank              ),
  .lfb_arb_data_din                (lfb_arb_data_din               ),
  .lfb_arb_data_idx                (lfb_arb_data_idx               ),
  .lfb_arb_data_req                (lfb_arb_data_req               ),
  .lfb_arb_data_way                (lfb_arb_data_way               ),
  .lfb_arb_data_wen                (lfb_arb_data_wen               ),
  .lfb_arb_dcache_sel              (lfb_arb_dcache_sel             ),
  .lfb_arb_dirty_din               (lfb_arb_dirty_din              ),
  .lfb_arb_dirty_idx               (lfb_arb_dirty_idx              ),
  .lfb_arb_dirty_req               (lfb_arb_dirty_req              ),
  .lfb_arb_dirty_wen               (lfb_arb_dirty_wen              ),
  .lfb_arb_tag_din                 (lfb_arb_tag_din                ),
  .lfb_arb_tag_idx                 (lfb_arb_tag_idx                ),
  .lfb_arb_tag_req                 (lfb_arb_tag_req                ),
  .lfb_arb_tag_wen                 (lfb_arb_tag_wen                ),
  .lm_clr                          (lm_clr                         ),
  .lm_lr_bus                       (lm_lr_bus                      ),
  .lm_pass                         (lm_pass                        ),
  .lm_sc_bus                       (lm_sc_bus                      ),
  .lm_set                          (lm_set                         ),
  .lm_set_gate                     (lm_set_gate                    ),
  .lsu_acc_fault_vld               (lsu_acc_fault_vld              ),
  .lsu_biu_async_expt_ack          (lsu_biu_async_expt_ack         ),
  .lsu_dtu_ex2_expt_vld            (lsu_dtu_ex2_expt_vld           ),
  .lsu_ex2_stall_final             (lsu_ex2_stall_final            ),
  .lsu_hpcp_inst_store             (lsu_hpcp_inst_store            ),
  .lsu_hpcp_inst_store_gate        (lsu_hpcp_inst_store_gate       ),
  .lsu_idu_ex1_halt_info           (lsu_idu_ex1_halt_info          ),
  .lsu_idu_ex1_halt_info_update_en (lsu_idu_ex1_halt_info_update_en),
  .lsu_idu_ex1_src1_update_en      (lsu_idu_ex1_src1_update_en     ),
  .lsu_idu_ex1_src1_update_en_gate (lsu_idu_ex1_src1_update_en_gate),
  .lsu_idu_ex1_stall               (lsu_idu_ex1_stall              ),
  .lsu_idu_global_stall            (lsu_idu_global_stall           ),
  .lsu_idu_update_addr             (lsu_idu_update_addr            ),
  .lsu_idu_update_en               (lsu_idu_update_en              ),
  .lsu_idu_update_en_gate          (lsu_idu_update_en_gate         ),
  .lsu_idu_update_offset           (lsu_idu_update_offset          ),
  .lsu_iu_ex1_base_wb              (lsu_iu_ex1_base_wb             ),
  .lsu_iu_ex1_src1_sel             (lsu_iu_ex1_src1_sel            ),
  .lsu_iu_ex2_lsi_dst_preg         (lsu_iu_ex2_lsi_dst_preg        ),
  .lsu_iu_ex2_lsi_rslt             (lsu_iu_ex2_lsi_rslt            ),
  .lsu_iu_ex2_lsi_rslt_vld         (lsu_iu_ex2_lsi_rslt_vld        ),
  .lsu_pmp_addr                    (lsu_pmp_addr                   ),
  .lsu_pmp_write                   (lsu_pmp_write                  ),
  .lsu_rtu_async_expt_vld          (lsu_rtu_async_expt_vld         ),
  .lsu_rtu_async_ld_inst           (lsu_rtu_async_ld_inst          ),
  .lsu_rtu_async_tval              (lsu_rtu_async_tval             ),
  .lsu_rtu_ex1_cmplt               (lsu_rtu_ex1_cmplt              ),
  .lsu_rtu_ex1_cmplt_dp            (lsu_rtu_ex1_cmplt_dp           ),
  .lsu_rtu_ex1_halt_info           (lsu_rtu_ex1_halt_info          ),
  .lsu_rtu_ex1_inst_len            (lsu_rtu_ex1_inst_len           ),
  .lsu_rtu_ex1_inst_vld            (lsu_rtu_ex1_inst_vld           ),
  .lsu_rtu_ex1_ipop_int_mask       (lsu_rtu_ex1_ipop_int_mask      ),
  .lsu_rtu_ex1_ipush_spec_inst     (lsu_rtu_ex1_ipush_spec_inst    ),
  .lsu_rtu_ex1_split_inst          (lsu_rtu_ex1_split_inst         ),
  .lsu_rtu_ex2_bus_err             (lsu_rtu_ex2_bus_err            ),
  .lsu_rtu_ex2_expt_inst           (lsu_rtu_ex2_expt_inst          ),
  .lsu_rtu_ex2_expt_vec            (lsu_rtu_ex2_expt_vec           ),
  .lsu_rtu_ex2_tval                (lsu_rtu_ex2_tval               ),
  .lsu_sysmap_pa                   (lsu_sysmap_pa                  ),
  .ncb_ag_async_expt_vld           (ncb_ag_async_expt_vld          ),
  .ncb_ag_async_ld_inst            (ncb_ag_async_ld_inst           ),
  .ncb_ag_async_mtval              (ncb_ag_async_mtval             ),
  .ncb_ag_pmp_ld_inst              (ncb_ag_pmp_ld_inst             ),
  .ncb_ag_pmp_mtval                (ncb_ag_pmp_mtval               ),
  .ncb_ag_stall                    (ncb_ag_stall                   ),
  .ncb_xx_no_op                    (ncb_xx_no_op                   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .pmp_lsu_acc_deny                (pmp_lsu_acc_deny               ),
  .rdl_arb_data_bank               (rdl_arb_data_bank              ),
  .rdl_arb_data_din                (rdl_arb_data_din               ),
  .rdl_arb_data_idx                (rdl_arb_data_idx               ),
  .rdl_arb_data_req                (rdl_arb_data_req               ),
  .rdl_arb_data_way                (rdl_arb_data_way               ),
  .rdl_arb_data_wen                (rdl_arb_data_wen               ),
  .rdl_arb_dcache_sel              (rdl_arb_dcache_sel             ),
  .rdl_arb_dirty_din               (rdl_arb_dirty_din              ),
  .rdl_arb_dirty_idx               (rdl_arb_dirty_idx              ),
  .rdl_arb_dirty_req               (rdl_arb_dirty_req              ),
  .rdl_arb_dirty_wen               (rdl_arb_dirty_wen              ),
  .rdl_arb_tag_din                 (rdl_arb_tag_din                ),
  .rdl_arb_tag_idx                 (rdl_arb_tag_idx                ),
  .rdl_arb_tag_req                 (rdl_arb_tag_req                ),
  .rdl_arb_tag_wen                 (rdl_arb_tag_wen                ),
  .rtu_lsu_async_expt_ack          (rtu_lsu_async_expt_ack         ),
  .rtu_lsu_fgpr_wb_data            (rtu_lsu_fgpr_wb_data           ),
  .rtu_lsu_fgpr_wb_reg             (rtu_lsu_fgpr_wb_reg            ),
  .rtu_lsu_fgpr_wb_vld             (rtu_lsu_fgpr_wb_vld            ),
  .rtu_lsu_inst_retire             (rtu_lsu_inst_retire            ),
  .rtu_lsu_wb1_data                (rtu_lsu_wb1_data               ),
  .rtu_lsu_wb1_lsu_vld             (rtu_lsu_wb1_lsu_vld            ),
  .rtu_lsu_wb1_preg                (rtu_lsu_wb1_preg               ),
  .rtu_xx_ex1_stall                (rtu_xx_ex1_stall               ),
  .rtu_yy_xx_dbgon                 (rtu_yy_xx_dbgon                ),
  .stb_arb_data_bank               (stb_arb_data_bank              ),
  .stb_arb_data_din                (stb_arb_data_din               ),
  .stb_arb_data_idx                (stb_arb_data_idx               ),
  .stb_arb_data_req                (stb_arb_data_req               ),
  .stb_arb_data_way                (stb_arb_data_way               ),
  .stb_arb_data_wen                (stb_arb_data_wen               ),
  .stb_arb_dcache_sel              (stb_arb_dcache_sel             ),
  .stb_arb_dirty_din               (stb_arb_dirty_din              ),
  .stb_arb_dirty_idx               (stb_arb_dirty_idx              ),
  .stb_arb_dirty_req               (stb_arb_dirty_req              ),
  .stb_arb_dirty_wen               (stb_arb_dirty_wen              ),
  .sysmap_lsu_flg                  (sysmap_lsu_flg                 )
);

// &Instance("pa_lsu_lm", "x_pa_lsu_lm"); @28
pa_lsu_lm  x_pa_lsu_lm (
  .cp0_lsu_icg_en     (cp0_lsu_icg_en    ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .ifu_lsu_warm_up    (ifu_lsu_warm_up   ),
  .lm_clr             (lm_clr            ),
  .lm_lr_bus          (lm_lr_bus         ),
  .lm_pass            (lm_pass           ),
  .lm_sc_bus          (lm_sc_bus         ),
  .lm_set             (lm_set            ),
  .lm_set_gate        (lm_set_gate       ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .rtu_lsu_expt_ack   (rtu_lsu_expt_ack  ),
  .rtu_lsu_expt_exit  (rtu_lsu_expt_exit )
);

// &Instance("pa_lsu_ncb", "x_pa_lsu_ncb"); @29
pa_lsu_ncb  x_pa_lsu_ncb (
  .ag_dc_buf                   (ag_dc_buf                  ),
  .ag_dc_bytes_vld             (ag_dc_bytes_vld            ),
  .ag_dc_ca                    (ag_dc_ca                   ),
  .ag_dc_dest_reg              (ag_dc_dest_reg             ),
  .ag_dc_fls                   (ag_dc_fls                  ),
  .ag_dc_func                  (ag_dc_func                 ),
  .ag_dc_lm_pass               (ag_dc_lm_pass              ),
  .ag_dc_mach_mode             (ag_dc_mach_mode            ),
  .ag_dc_ori_size              (ag_dc_ori_size             ),
  .ag_dc_pmp_expt              (ag_dc_pmp_expt             ),
  .ag_dc_sign_ext              (ag_dc_sign_ext             ),
  .ag_dc_size                  (ag_dc_size                 ),
  .ag_dc_so                    (ag_dc_so                   ),
  .ag_dc_split                 (ag_dc_split                ),
  .ag_dc_split_first           (ag_dc_split_first          ),
  .ag_dc_split_last            (ag_dc_split_last           ),
  .ag_dc_src1_depd             (ag_dc_src1_depd            ),
  .ag_dc_wdata_shift           (ag_dc_wdata_shift          ),
  .ag_ncb_addr                 (ag_ncb_addr                ),
  .ag_ncb_inst_vld             (ag_ncb_inst_vld            ),
  .ag_ncb_inst_vld_dp          (ag_ncb_inst_vld_dp         ),
  .ag_ncb_src1_reg             (ag_ncb_src1_reg            ),
  .ag_ncb_st_data              (ag_ncb_st_data             ),
  .cp0_lsu_icg_en              (cp0_lsu_icg_en             ),
  .cp0_xx_async_expt_en        (cp0_xx_async_expt_en       ),
  .cpurst_b                    (cpurst_b                   ),
  .da_xx_fwd_data              (da_xx_fwd_data             ),
  .da_xx_fwd_fls               (da_xx_fwd_fls              ),
  .da_xx_fwd_preg              (da_xx_fwd_preg             ),
  .da_xx_fwd_vld               (da_xx_fwd_vld              ),
  .dahbif_ncb_acc_err          (dahbif_ncb_acc_err         ),
  .dahbif_ncb_cmplt            (dahbif_ncb_cmplt           ),
  .dahbif_ncb_data             (dahbif_ncb_data            ),
  .dahbif_ncb_grant            (dahbif_ncb_grant           ),
  .dahbif_ncb_grant_2          (dahbif_ncb_grant_2         ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ifu_lsu_warm_up             (ifu_lsu_warm_up            ),
  .lsu_biu_amo_pmp_deny        (lsu_biu_amo_pmp_deny       ),
  .lsu_mb_ex2_uc_addr_2        (lsu_mb_ex2_uc_addr_2       ),
  .lsu_mb_ex2_uc_bytes_vld     (lsu_mb_ex2_uc_bytes_vld    ),
  .lsu_mb_ex2_uc_data          (lsu_mb_ex2_uc_data         ),
  .lsu_mb_ex2_uc_data_vld      (lsu_mb_ex2_uc_data_vld     ),
  .lsu_mb_ex2_uc_data_vld_gate (lsu_mb_ex2_uc_data_vld_gate),
  .lsu_mb_ex2_uc_dest_reg      (lsu_mb_ex2_uc_dest_reg     ),
  .lsu_mb_ex2_uc_fld           (lsu_mb_ex2_uc_fld          ),
  .lsu_mb_ex2_uc_fls           (lsu_mb_ex2_uc_fls          ),
  .lsu_mb_ex2_uc_lock          (lsu_mb_ex2_uc_lock         ),
  .lsu_mb_ex2_uc_sc_data_vld   (lsu_mb_ex2_uc_sc_data_vld  ),
  .lsu_mb_ex2_uc_sign_ext      (lsu_mb_ex2_uc_sign_ext     ),
  .lsu_mb_ex2_uc_size          (lsu_mb_ex2_uc_size         ),
  .lsu_mb_ex2_uc_split         (lsu_mb_ex2_uc_split        ),
  .lsu_mb_ex2_uc_split_last    (lsu_mb_ex2_uc_split_last   ),
  .lsu_mb_ex2_uc_stall         (lsu_mb_ex2_uc_stall        ),
  .lsu_xx_ex2_uc_flush         (lsu_xx_ex2_uc_flush        ),
  .ncb_ag_async_expt_vld       (ncb_ag_async_expt_vld      ),
  .ncb_ag_async_ld_inst        (ncb_ag_async_ld_inst       ),
  .ncb_ag_async_mtval          (ncb_ag_async_mtval         ),
  .ncb_ag_pmp_ld_inst          (ncb_ag_pmp_ld_inst         ),
  .ncb_ag_pmp_mtval            (ncb_ag_pmp_mtval           ),
  .ncb_ag_stall                (ncb_ag_stall               ),
  .ncb_dahbif_acc_deny         (ncb_dahbif_acc_deny        ),
  .ncb_dahbif_lock             (ncb_dahbif_lock            ),
  .ncb_dahbif_lrsc             (ncb_dahbif_lrsc            ),
  .ncb_dahbif_ncb_wb_addr      (ncb_dahbif_ncb_wb_addr     ),
  .ncb_dahbif_ncb_wb_sel       (ncb_dahbif_ncb_wb_sel      ),
  .ncb_dahbif_prot             (ncb_dahbif_prot            ),
  .ncb_dahbif_req              (ncb_dahbif_req             ),
  .ncb_dahbif_req_dp           (ncb_dahbif_req_dp          ),
  .ncb_dahbif_size             (ncb_dahbif_size            ),
  .ncb_dahbif_uc_ld_addr       (ncb_dahbif_uc_ld_addr      ),
  .ncb_dahbif_wdata            (ncb_dahbif_wdata           ),
  .ncb_dahbif_write            (ncb_dahbif_write           ),
  .ncb_dbginfo                 (ncb_dbginfo                ),
  .ncb_xx_no_op                (ncb_xx_no_op               ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .rtu_lsu_fgpr_wb_data        (rtu_lsu_fgpr_wb_data       ),
  .rtu_lsu_fgpr_wb_reg         (rtu_lsu_fgpr_wb_reg        ),
  .rtu_lsu_fgpr_wb_vld         (rtu_lsu_fgpr_wb_vld        ),
  .rtu_lsu_sync_req            (rtu_lsu_sync_req           ),
  .rtu_yy_xx_async_flush       (rtu_yy_xx_async_flush      )
);

// &Force("output", "lsu_xx_no_op"); @30
assign lsu_xx_no_op = dc_idle & lfb_xx_idle & stb_idle & vb_idle & vb_wb_idle & icc_xx_idle & ncb_xx_no_op & da_xx_no_op;
assign lsu_xx_warm_up = ifu_lsu_warm_up;

assign lsu_cp0_fence_ack = lsu_xx_no_op;
assign lsu_cp0_sync_ack  = lsu_xx_no_op;
assign lsu_rtu_sync_ack  = lsu_xx_no_op;

assign dc_ag_empty  = dc_idle & lfb_xx_idle & stb_idle & icc_xx_idle & vb_wb_idle;
// &Instance("pa_lsu_dc", "x_pa_lsu_dc"); @40
pa_lsu_dc  x_pa_lsu_dc (
  .ag_dc_addr                       (ag_dc_addr                      ),
  .ag_dc_buf                        (ag_dc_buf                       ),
  .ag_dc_bytes_vld                  (ag_dc_bytes_vld                 ),
  .ag_dc_ca                         (ag_dc_ca                        ),
  .ag_dc_dcache_grant               (ag_dc_dcache_grant              ),
  .ag_dc_dest_reg                   (ag_dc_dest_reg                  ),
  .ag_dc_fls                        (ag_dc_fls                       ),
  .ag_dc_func                       (ag_dc_func                      ),
  .ag_dc_inst_vld                   (ag_dc_inst_vld                  ),
  .ag_dc_inst_vld_gate              (ag_dc_inst_vld_gate             ),
  .ag_dc_lm_pass                    (ag_dc_lm_pass                   ),
  .ag_dc_mach_mode                  (ag_dc_mach_mode                 ),
  .ag_dc_ori_size                   (ag_dc_ori_size                  ),
  .ag_dc_pmp_expt                   (ag_dc_pmp_expt                  ),
  .ag_dc_sign_ext                   (ag_dc_sign_ext                  ),
  .ag_dc_size                       (ag_dc_size                      ),
  .ag_dc_split                      (ag_dc_split                     ),
  .ag_dc_split_first                (ag_dc_split_first               ),
  .ag_dc_split_last                 (ag_dc_split_last                ),
  .ag_dc_src1_depd                  (ag_dc_src1_depd                 ),
  .ag_dc_src1_reg                   (ag_dc_src1_reg                  ),
  .ag_dc_st_data                    (ag_dc_st_data                   ),
  .ag_dc_wdata_shift                (ag_dc_wdata_shift               ),
  .cp0_lsu_dcache_en                (cp0_lsu_dcache_en               ),
  .cp0_lsu_dcache_wa                (cp0_lsu_dcache_wa               ),
  .cp0_lsu_icg_en                   (cp0_lsu_icg_en                  ),
  .cpurst_b                         (cpurst_b                        ),
  .da_xx_fwd_data                   (da_xx_fwd_data                  ),
  .da_xx_fwd_fls                    (da_xx_fwd_fls                   ),
  .da_xx_fwd_preg                   (da_xx_fwd_preg                  ),
  .da_xx_fwd_vld                    (da_xx_fwd_vld                   ),
  .dc_ag_async_expt_vld             (dc_ag_async_expt_vld            ),
  .dc_ag_async_ld_inst              (dc_ag_async_ld_inst             ),
  .dc_ag_async_mtval                (dc_ag_async_mtval               ),
  .dc_ag_cache_stall                (dc_ag_cache_stall               ),
  .dc_ag_dcache_addr                (dc_ag_dcache_addr               ),
  .dc_ag_dcache_req                 (dc_ag_dcache_req                ),
  .dc_ag_dcache_size                (dc_ag_dcache_size               ),
  .dc_ag_func                       (dc_ag_func                      ),
  .dc_ag_pmp_ld_inst                (dc_ag_pmp_ld_inst               ),
  .dc_ag_pmp_mtval                  (dc_ag_pmp_mtval                 ),
  .dc_ag_stall                      (dc_ag_stall                     ),
  .dc_dbginfo                       (dc_dbginfo                      ),
  .dc_icc_way0_data                 (dc_icc_way0_data                ),
  .dc_icc_way0_dirty                (dc_icc_way0_dirty               ),
  .dc_icc_way0_tag                  (dc_icc_way0_tag                 ),
  .dc_icc_way1_data                 (dc_icc_way1_data                ),
  .dc_icc_way1_dirty                (dc_icc_way1_dirty               ),
  .dc_icc_way1_tag                  (dc_icc_way1_tag                 ),
  .dc_idle                          (dc_idle                         ),
  .dc_lfb_addr                      (dc_lfb_addr                     ),
  .dc_lfb_buf                       (dc_lfb_buf                      ),
  .dc_lfb_ca                        (dc_lfb_ca                       ),
  .dc_lfb_ca_raw                    (dc_lfb_ca_raw                   ),
  .dc_lfb_create_en                 (dc_lfb_create_en                ),
  .dc_lfb_create_en_gate            (dc_lfb_create_en_gate           ),
  .dc_lfb_inst_ld                   (dc_lfb_inst_ld                  ),
  .dc_lfb_lock_trans                (dc_lfb_lock_trans               ),
  .dc_lfb_lr_inst                   (dc_lfb_lr_inst                  ),
  .dc_lfb_mach_mode                 (dc_lfb_mach_mode                ),
  .dc_lfb_size                      (dc_lfb_size                     ),
  .dc_rdl_fifo                      (dc_rdl_fifo                     ),
  .dc_rdl_way0_data                 (dc_rdl_way0_data                ),
  .dc_rdl_way0_dirty                (dc_rdl_way0_dirty               ),
  .dc_rdl_way0_tag                  (dc_rdl_way0_tag                 ),
  .dc_rdl_way0_vld                  (dc_rdl_way0_vld                 ),
  .dc_rdl_way1_data                 (dc_rdl_way1_data                ),
  .dc_rdl_way1_dirty                (dc_rdl_way1_dirty               ),
  .dc_rdl_way1_tag                  (dc_rdl_way1_tag                 ),
  .dc_rdl_way1_vld                  (dc_rdl_way1_vld                 ),
  .dc_stb_addr                      (dc_stb_addr                     ),
  .dc_stb_attr                      (dc_stb_attr                     ),
  .dc_stb_bytes_vld                 (dc_stb_bytes_vld                ),
  .dc_stb_cache_hit                 (dc_stb_cache_hit                ),
  .dc_stb_create_en                 (dc_stb_create_en                ),
  .dc_stb_create_en_gate            (dc_stb_create_en_gate           ),
  .dc_stb_data                      (dc_stb_data                     ),
  .dc_stb_dcache_dirty              (dc_stb_dcache_dirty             ),
  .dc_stb_dcache_inst               (dc_stb_dcache_inst              ),
  .dc_stb_dcache_type               (dc_stb_dcache_type              ),
  .dc_stb_dcache_way                (dc_stb_dcache_way               ),
  .dc_stb_fls                       (dc_stb_fls                      ),
  .dc_stb_lock_trans                (dc_stb_lock_trans               ),
  .dc_stb_sc_inst                   (dc_stb_sc_inst                  ),
  .dc_stb_shift                     (dc_stb_shift                    ),
  .dc_stb_size                      (dc_stb_size                     ),
  .dc_stb_split_first               (dc_stb_split_first              ),
  .dc_stb_src1_depd                 (dc_stb_src1_depd                ),
  .dc_stb_src1_reg                  (dc_stb_src1_reg                 ),
  .dc_stb_wait_lfb                  (dc_stb_wait_lfb                 ),
  .dc_vb_st_amold                   (dc_vb_st_amold                  ),
  .dc_xx_addr                       (dc_xx_addr                      ),
  .dc_xx_bytes_vld                  (dc_xx_bytes_vld                 ),
  .dcache_data_dout_way0            (dcache_data_dout_way0           ),
  .dcache_data_dout_way1            (dcache_data_dout_way1           ),
  .dcache_dirty_dout                (dcache_dirty_dout               ),
  .dcache_tag_dout                  (dcache_tag_dout                 ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .ifu_lsu_warm_up                  (ifu_lsu_warm_up                 ),
  .lfb_dc_async_expt                (lfb_dc_async_expt               ),
  .lfb_dc_busy                      (lfb_dc_busy                     ),
  .lfb_dc_hit_idx                   (lfb_dc_hit_idx                  ),
  .lfb_dc_ld_cmplt                  (lfb_dc_ld_cmplt                 ),
  .lfb_dc_ld_data                   (lfb_dc_ld_data                  ),
  .lfb_dc_ld_data_vld               (lfb_dc_ld_data_vld              ),
  .lfb_dc_pop_en                    (lfb_dc_pop_en                   ),
  .lsu_hpcp_cache_read_access       (lsu_hpcp_cache_read_access      ),
  .lsu_hpcp_cache_read_access_gate  (lsu_hpcp_cache_read_access_gate ),
  .lsu_hpcp_cache_read_miss         (lsu_hpcp_cache_read_miss        ),
  .lsu_hpcp_cache_read_miss_gate    (lsu_hpcp_cache_read_miss_gate   ),
  .lsu_hpcp_cache_write_access      (lsu_hpcp_cache_write_access     ),
  .lsu_hpcp_cache_write_access_gate (lsu_hpcp_cache_write_access_gate),
  .lsu_hpcp_cache_write_miss        (lsu_hpcp_cache_write_miss       ),
  .lsu_hpcp_cache_write_miss_gate   (lsu_hpcp_cache_write_miss_gate  ),
  .lsu_mb_ex2_ca_addr_2             (lsu_mb_ex2_ca_addr_2            ),
  .lsu_mb_ex2_ca_bytes_vld          (lsu_mb_ex2_ca_bytes_vld         ),
  .lsu_mb_ex2_ca_data               (lsu_mb_ex2_ca_data              ),
  .lsu_mb_ex2_ca_data_vld           (lsu_mb_ex2_ca_data_vld          ),
  .lsu_mb_ex2_ca_data_vld_gate      (lsu_mb_ex2_ca_data_vld_gate     ),
  .lsu_mb_ex2_ca_dest_reg           (lsu_mb_ex2_ca_dest_reg          ),
  .lsu_mb_ex2_ca_fld                (lsu_mb_ex2_ca_fld               ),
  .lsu_mb_ex2_ca_fls                (lsu_mb_ex2_ca_fls               ),
  .lsu_mb_ex2_ca_lock               (lsu_mb_ex2_ca_lock              ),
  .lsu_mb_ex2_ca_sc_data_vld        (lsu_mb_ex2_ca_sc_data_vld       ),
  .lsu_mb_ex2_ca_sign_ext           (lsu_mb_ex2_ca_sign_ext          ),
  .lsu_mb_ex2_ca_size               (lsu_mb_ex2_ca_size              ),
  .lsu_mb_ex2_ca_split              (lsu_mb_ex2_ca_split             ),
  .lsu_mb_ex2_ca_split_last         (lsu_mb_ex2_ca_split_last        ),
  .lsu_mb_ex2_ca_stall              (lsu_mb_ex2_ca_stall             ),
  .lsu_top_dc_vld                   (lsu_top_dc_vld                  ),
  .lsu_xx_ex2_ca_flush              (lsu_xx_ex2_ca_flush             ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .rtu_lsu_fgpr_wb_data             (rtu_lsu_fgpr_wb_data            ),
  .rtu_lsu_fgpr_wb_reg              (rtu_lsu_fgpr_wb_reg             ),
  .rtu_lsu_fgpr_wb_vld              (rtu_lsu_fgpr_wb_vld             ),
  .rtu_yy_xx_async_flush            (rtu_yy_xx_async_flush           ),
  .stb_dc_async_expt                (stb_dc_async_expt               ),
  .stb_dc_busy                      (stb_dc_busy                     ),
  .stb_dc_full                      (stb_dc_full                     ),
  .stb_dc_hit_addr                  (stb_dc_hit_addr                 ),
  .stb_dc_hit_dca                   (stb_dc_hit_dca                  ),
  .stb_dc_hit_idx                   (stb_dc_hit_idx                  ),
  .stb_dc_ld_data                   (stb_dc_ld_data                  ),
  .stb_dc_ld_fwd_vld                (stb_dc_ld_fwd_vld               ),
  .stb_dc_mtval                     (stb_dc_mtval                    ),
  .stb_dc_multi_or_part_hit         (stb_dc_multi_or_part_hit        ),
  .stb_dc_pop_en                    (stb_dc_pop_en                   ),
  .vb_dc_hit_dirty                  (vb_dc_hit_dirty                 ),
  .vb_dc_ld_data                    (vb_dc_ld_data                   ),
  .vb_dc_ld_fwd_vld                 (vb_dc_ld_fwd_vld                ),
  .vb_dc_pop_en                     (vb_dc_pop_en                    )
);

// &Instance("pa_lsu_icc", "x_pa_lsu_icc"); @41
pa_lsu_icc  x_pa_lsu_icc (
  .arb_icc_data_grant (arb_icc_data_grant),
  .cp0_lsu_icc_addr   (cp0_lsu_icc_addr  ),
  .cp0_lsu_icc_op     (cp0_lsu_icc_op    ),
  .cp0_lsu_icc_req    (cp0_lsu_icc_req   ),
  .cp0_lsu_icc_type   (cp0_lsu_icc_type  ),
  .cp0_lsu_icg_en     (cp0_lsu_icg_en    ),
  .cpurst_b           (cpurst_b          ),
  .dc_icc_way0_data   (dc_icc_way0_data  ),
  .dc_icc_way0_dirty  (dc_icc_way0_dirty ),
  .dc_icc_way0_tag    (dc_icc_way0_tag   ),
  .dc_icc_way1_data   (dc_icc_way1_data  ),
  .dc_icc_way1_dirty  (dc_icc_way1_dirty ),
  .dc_icc_way1_tag    (dc_icc_way1_tag   ),
  .forever_cpuclk     (forever_cpuclk    ),
  .icc_arb_data_bank  (icc_arb_data_bank ),
  .icc_arb_data_din   (icc_arb_data_din  ),
  .icc_arb_data_idx   (icc_arb_data_idx  ),
  .icc_arb_data_req   (icc_arb_data_req  ),
  .icc_arb_data_way   (icc_arb_data_way  ),
  .icc_arb_data_wen   (icc_arb_data_wen  ),
  .icc_arb_dirty_din  (icc_arb_dirty_din ),
  .icc_arb_dirty_idx  (icc_arb_dirty_idx ),
  .icc_arb_dirty_req  (icc_arb_dirty_req ),
  .icc_arb_dirty_wen  (icc_arb_dirty_wen ),
  .icc_arb_tag_din    (icc_arb_tag_din   ),
  .icc_arb_tag_idx    (icc_arb_tag_idx   ),
  .icc_arb_tag_req    (icc_arb_tag_req   ),
  .icc_arb_tag_wen    (icc_arb_tag_wen   ),
  .icc_vb_addr        (icc_vb_addr       ),
  .icc_vb_clr_vld     (icc_vb_clr_vld    ),
  .icc_vb_create_en   (icc_vb_create_en  ),
  .icc_vb_data        (icc_vb_data       ),
  .icc_vb_data_cnt    (icc_vb_data_cnt   ),
  .icc_vb_data_create (icc_vb_data_create),
  .icc_vb_line_dirty  (icc_vb_line_dirty ),
  .icc_xx_idle        (icc_xx_idle       ),
  .ifu_lsu_warm_up    (ifu_lsu_warm_up   ),
  .lsu_cp0_icc_done   (lsu_cp0_icc_done  ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .vb_icc_empty       (vb_icc_empty      ),
  .vb_icc_grant       (vb_icc_grant      )
);

// &Instance("pa_lsu_lfb", "x_pa_lsu_lfb"); @42
pa_lsu_lfb  x_pa_lsu_lfb (
  .cp0_lsu_icg_en        (cp0_lsu_icg_en       ),
  .cpurst_b              (cpurst_b             ),
  .dahbif_lfb_acc_err    (dahbif_lfb_acc_err   ),
  .dahbif_lfb_cmplt      (dahbif_lfb_cmplt     ),
  .dahbif_lfb_data       (dahbif_lfb_data      ),
  .dahbif_lfb_grant      (dahbif_lfb_grant     ),
  .dc_lfb_addr           (dc_lfb_addr          ),
  .dc_lfb_buf            (dc_lfb_buf           ),
  .dc_lfb_ca             (dc_lfb_ca            ),
  .dc_lfb_ca_raw         (dc_lfb_ca_raw        ),
  .dc_lfb_create_en      (dc_lfb_create_en     ),
  .dc_lfb_create_en_gate (dc_lfb_create_en_gate),
  .dc_lfb_inst_ld        (dc_lfb_inst_ld       ),
  .dc_lfb_lock_trans     (dc_lfb_lock_trans    ),
  .dc_lfb_lr_inst        (dc_lfb_lr_inst       ),
  .dc_lfb_mach_mode      (dc_lfb_mach_mode     ),
  .dc_lfb_size           (dc_lfb_size          ),
  .dc_xx_addr            (dc_xx_addr           ),
  .forever_cpuclk        (forever_cpuclk       ),
  .ifu_lsu_warm_up       (ifu_lsu_warm_up      ),
  .lfb_arb_data_bank     (lfb_arb_data_bank    ),
  .lfb_arb_data_din      (lfb_arb_data_din     ),
  .lfb_arb_data_idx      (lfb_arb_data_idx     ),
  .lfb_arb_data_req      (lfb_arb_data_req     ),
  .lfb_arb_data_way      (lfb_arb_data_way     ),
  .lfb_arb_data_wen      (lfb_arb_data_wen     ),
  .lfb_arb_dcache_sel    (lfb_arb_dcache_sel   ),
  .lfb_arb_dirty_din     (lfb_arb_dirty_din    ),
  .lfb_arb_dirty_idx     (lfb_arb_dirty_idx    ),
  .lfb_arb_dirty_req     (lfb_arb_dirty_req    ),
  .lfb_arb_dirty_wen     (lfb_arb_dirty_wen    ),
  .lfb_arb_tag_din       (lfb_arb_tag_din      ),
  .lfb_arb_tag_idx       (lfb_arb_tag_idx      ),
  .lfb_arb_tag_req       (lfb_arb_tag_req      ),
  .lfb_arb_tag_wen       (lfb_arb_tag_wen      ),
  .lfb_dahbif_addr       (lfb_dahbif_addr      ),
  .lfb_dahbif_burst      (lfb_dahbif_burst     ),
  .lfb_dahbif_lock       (lfb_dahbif_lock      ),
  .lfb_dahbif_lr_inst    (lfb_dahbif_lr_inst   ),
  .lfb_dahbif_prot       (lfb_dahbif_prot      ),
  .lfb_dahbif_req        (lfb_dahbif_req       ),
  .lfb_dahbif_size       (lfb_dahbif_size      ),
  .lfb_dbginfo           (lfb_dbginfo          ),
  .lfb_dc_async_expt     (lfb_dc_async_expt    ),
  .lfb_dc_busy           (lfb_dc_busy          ),
  .lfb_dc_hit_idx        (lfb_dc_hit_idx       ),
  .lfb_dc_ld_cmplt       (lfb_dc_ld_cmplt      ),
  .lfb_dc_ld_data        (lfb_dc_ld_data       ),
  .lfb_dc_ld_data_vld    (lfb_dc_ld_data_vld   ),
  .lfb_dc_pop_en         (lfb_dc_pop_en        ),
  .lfb_rdl_index         (lfb_rdl_index        ),
  .lfb_rdl_start         (lfb_rdl_start        ),
  .lfb_rdl_start_gate    (lfb_rdl_start_gate   ),
  .lfb_stb_done          (lfb_stb_done         ),
  .lfb_stb_err           (lfb_stb_err          ),
  .lfb_stb_fifo          (lfb_stb_fifo         ),
  .lfb_stb_fifo_update   (lfb_stb_fifo_update  ),
  .lfb_xx_idle           (lfb_xx_idle          ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rdl_lfb_done          (rdl_lfb_done         ),
  .rdl_lfb_fifo          (rdl_lfb_fifo         ),
  .rdl_lfb_fifo_save     (rdl_lfb_fifo_save    ),
  .rdl_lfb_grant         (rdl_lfb_grant        ),
  .rtu_yy_xx_async_flush (rtu_yy_xx_async_flush)
);

// &Instance("pa_lsu_rdl", "x_pa_lsu_rdl"); @43
pa_lsu_rdl  x_pa_lsu_rdl (
  .arb_rdl_grant         (arb_rdl_grant        ),
  .cp0_lsu_icg_en        (cp0_lsu_icg_en       ),
  .cpurst_b              (cpurst_b             ),
  .dc_rdl_fifo           (dc_rdl_fifo          ),
  .dc_rdl_way0_data      (dc_rdl_way0_data     ),
  .dc_rdl_way0_dirty     (dc_rdl_way0_dirty    ),
  .dc_rdl_way0_tag       (dc_rdl_way0_tag      ),
  .dc_rdl_way0_vld       (dc_rdl_way0_vld      ),
  .dc_rdl_way1_data      (dc_rdl_way1_data     ),
  .dc_rdl_way1_dirty     (dc_rdl_way1_dirty    ),
  .dc_rdl_way1_tag       (dc_rdl_way1_tag      ),
  .dc_rdl_way1_vld       (dc_rdl_way1_vld      ),
  .forever_cpuclk        (forever_cpuclk       ),
  .ifu_lsu_warm_up       (ifu_lsu_warm_up      ),
  .lfb_rdl_index         (lfb_rdl_index        ),
  .lfb_rdl_start         (lfb_rdl_start        ),
  .lfb_rdl_start_gate    (lfb_rdl_start_gate   ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rdl_arb_data_bank     (rdl_arb_data_bank    ),
  .rdl_arb_data_din      (rdl_arb_data_din     ),
  .rdl_arb_data_idx      (rdl_arb_data_idx     ),
  .rdl_arb_data_req      (rdl_arb_data_req     ),
  .rdl_arb_data_way      (rdl_arb_data_way     ),
  .rdl_arb_data_wen      (rdl_arb_data_wen     ),
  .rdl_arb_dcache_sel    (rdl_arb_dcache_sel   ),
  .rdl_arb_dirty_din     (rdl_arb_dirty_din    ),
  .rdl_arb_dirty_idx     (rdl_arb_dirty_idx    ),
  .rdl_arb_dirty_req     (rdl_arb_dirty_req    ),
  .rdl_arb_dirty_wen     (rdl_arb_dirty_wen    ),
  .rdl_arb_tag_din       (rdl_arb_tag_din      ),
  .rdl_arb_tag_idx       (rdl_arb_tag_idx      ),
  .rdl_arb_tag_req       (rdl_arb_tag_req      ),
  .rdl_arb_tag_wen       (rdl_arb_tag_wen      ),
  .rdl_dbginfo           (rdl_dbginfo          ),
  .rdl_lfb_done          (rdl_lfb_done         ),
  .rdl_lfb_fifo          (rdl_lfb_fifo         ),
  .rdl_lfb_fifo_save     (rdl_lfb_fifo_save    ),
  .rdl_lfb_grant         (rdl_lfb_grant        ),
  .rdl_stb_cmplt_id      (rdl_stb_cmplt_id     ),
  .rdl_stb_dca_cmplt     (rdl_stb_dca_cmplt    ),
  .rdl_stb_dca_grant     (rdl_stb_dca_grant    ),
  .rdl_vb_addr           (rdl_vb_addr          ),
  .rdl_vb_create_en      (rdl_vb_create_en     ),
  .rdl_vb_data           (rdl_vb_data          ),
  .rdl_vb_data_cnt       (rdl_vb_data_cnt      ),
  .rdl_vb_data_create    (rdl_vb_data_create   ),
  .rdl_vb_line_dirty     (rdl_vb_line_dirty    ),
  .rdl_vb_warm_up        (rdl_vb_warm_up       ),
  .rtu_yy_xx_async_flush (rtu_yy_xx_async_flush),
  .stb_rdl_addr          (stb_rdl_addr         ),
  .stb_rdl_dca_type      (stb_rdl_dca_type     ),
  .stb_rdl_dirty         (stb_rdl_dirty        ),
  .stb_rdl_id            (stb_rdl_id           ),
  .stb_rdl_start         (stb_rdl_start        ),
  .stb_rdl_way           (stb_rdl_way          ),
  .vb_rdl_grant          (vb_rdl_grant         )
);

// &Instance("pa_lsu_stb", "x_pa_lsu_stb"); @44
pa_lsu_stb  x_pa_lsu_stb (
  .arb_stb_xx_grant         (arb_stb_xx_grant        ),
  .cp0_lsu_dcache_wb        (cp0_lsu_dcache_wb       ),
  .cp0_lsu_icg_en           (cp0_lsu_icg_en          ),
  .cpurst_b                 (cpurst_b                ),
  .dahbif_stb_acc_ecc       (dahbif_stb_acc_ecc      ),
  .dahbif_stb_cmplt         (dahbif_stb_cmplt        ),
  .dahbif_stb_grant         (dahbif_stb_grant        ),
  .dahbif_stb_grant_2       (dahbif_stb_grant_2      ),
  .dc_stb_addr              (dc_stb_addr             ),
  .dc_stb_attr              (dc_stb_attr             ),
  .dc_stb_bytes_vld         (dc_stb_bytes_vld        ),
  .dc_stb_cache_hit         (dc_stb_cache_hit        ),
  .dc_stb_create_en         (dc_stb_create_en        ),
  .dc_stb_create_en_gate    (dc_stb_create_en_gate   ),
  .dc_stb_data              (dc_stb_data             ),
  .dc_stb_dcache_dirty      (dc_stb_dcache_dirty     ),
  .dc_stb_dcache_inst       (dc_stb_dcache_inst      ),
  .dc_stb_dcache_type       (dc_stb_dcache_type      ),
  .dc_stb_dcache_way        (dc_stb_dcache_way       ),
  .dc_stb_fls               (dc_stb_fls              ),
  .dc_stb_lock_trans        (dc_stb_lock_trans       ),
  .dc_stb_sc_inst           (dc_stb_sc_inst          ),
  .dc_stb_shift             (dc_stb_shift            ),
  .dc_stb_size              (dc_stb_size             ),
  .dc_stb_split_first       (dc_stb_split_first      ),
  .dc_stb_src1_depd         (dc_stb_src1_depd        ),
  .dc_stb_src1_reg          (dc_stb_src1_reg         ),
  .dc_stb_wait_lfb          (dc_stb_wait_lfb         ),
  .dc_xx_addr               (dc_xx_addr              ),
  .dc_xx_bytes_vld          (dc_xx_bytes_vld         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .ifu_lsu_warm_up          (ifu_lsu_warm_up         ),
  .lfb_stb_done             (lfb_stb_done            ),
  .lfb_stb_err              (lfb_stb_err             ),
  .lfb_stb_fifo             (lfb_stb_fifo            ),
  .lfb_stb_fifo_update      (lfb_stb_fifo_update     ),
  .lfb_xx_idle              (lfb_xx_idle             ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .rdl_stb_cmplt_id         (rdl_stb_cmplt_id        ),
  .rdl_stb_dca_cmplt        (rdl_stb_dca_cmplt       ),
  .rdl_stb_dca_grant        (rdl_stb_dca_grant       ),
  .rtu_lsu_fgpr_wb_data     (rtu_lsu_fgpr_wb_data    ),
  .rtu_lsu_fgpr_wb_reg      (rtu_lsu_fgpr_wb_reg     ),
  .rtu_lsu_fgpr_wb_vld      (rtu_lsu_fgpr_wb_vld     ),
  .rtu_yy_xx_async_flush    (rtu_yy_xx_async_flush   ),
  .stb_arb_data_bank        (stb_arb_data_bank       ),
  .stb_arb_data_din         (stb_arb_data_din        ),
  .stb_arb_data_idx         (stb_arb_data_idx        ),
  .stb_arb_data_req         (stb_arb_data_req        ),
  .stb_arb_data_way         (stb_arb_data_way        ),
  .stb_arb_data_wen         (stb_arb_data_wen        ),
  .stb_arb_dcache_sel       (stb_arb_dcache_sel      ),
  .stb_arb_dirty_din        (stb_arb_dirty_din       ),
  .stb_arb_dirty_idx        (stb_arb_dirty_idx       ),
  .stb_arb_dirty_req        (stb_arb_dirty_req       ),
  .stb_arb_dirty_wen        (stb_arb_dirty_wen       ),
  .stb_dahbif_addr          (stb_dahbif_addr         ),
  .stb_dahbif_data          (stb_dahbif_data         ),
  .stb_dahbif_lock          (stb_dahbif_lock         ),
  .stb_dahbif_prot          (stb_dahbif_prot         ),
  .stb_dahbif_req           (stb_dahbif_req          ),
  .stb_dahbif_sc_inst       (stb_dahbif_sc_inst      ),
  .stb_dahbif_size          (stb_dahbif_size         ),
  .stb_dbginfo              (stb_dbginfo             ),
  .stb_dc_async_expt        (stb_dc_async_expt       ),
  .stb_dc_busy              (stb_dc_busy             ),
  .stb_dc_full              (stb_dc_full             ),
  .stb_dc_hit_addr          (stb_dc_hit_addr         ),
  .stb_dc_hit_dca           (stb_dc_hit_dca          ),
  .stb_dc_hit_idx           (stb_dc_hit_idx          ),
  .stb_dc_ld_data           (stb_dc_ld_data          ),
  .stb_dc_ld_fwd_vld        (stb_dc_ld_fwd_vld       ),
  .stb_dc_mtval             (stb_dc_mtval            ),
  .stb_dc_multi_or_part_hit (stb_dc_multi_or_part_hit),
  .stb_dc_pop_en            (stb_dc_pop_en           ),
  .stb_idle                 (stb_idle                ),
  .stb_rdl_addr             (stb_rdl_addr            ),
  .stb_rdl_dca_type         (stb_rdl_dca_type        ),
  .stb_rdl_dirty            (stb_rdl_dirty           ),
  .stb_rdl_id               (stb_rdl_id              ),
  .stb_rdl_start            (stb_rdl_start           ),
  .stb_rdl_way              (stb_rdl_way             )
);

// &Instance("pa_lsu_vb", "x_pa_lsu_vb"); @45
pa_lsu_vb  x_pa_lsu_vb (
  .cp0_lsu_fence_req     (cp0_lsu_fence_req    ),
  .cp0_lsu_icg_en        (cp0_lsu_icg_en       ),
  .cpurst_b              (cpurst_b             ),
  .dahbif_vb_acc_ecc     (dahbif_vb_acc_ecc    ),
  .dahbif_vb_cmplt       (dahbif_vb_cmplt      ),
  .dahbif_vb_grant       (dahbif_vb_grant      ),
  .dc_vb_st_amold        (dc_vb_st_amold       ),
  .dc_xx_addr            (dc_xx_addr           ),
  .forever_cpuclk        (forever_cpuclk       ),
  .icc_vb_addr           (icc_vb_addr          ),
  .icc_vb_clr_vld        (icc_vb_clr_vld       ),
  .icc_vb_create_en      (icc_vb_create_en     ),
  .icc_vb_data           (icc_vb_data          ),
  .icc_vb_data_cnt       (icc_vb_data_cnt      ),
  .icc_vb_data_create    (icc_vb_data_create   ),
  .icc_vb_line_dirty     (icc_vb_line_dirty    ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rdl_vb_addr           (rdl_vb_addr          ),
  .rdl_vb_create_en      (rdl_vb_create_en     ),
  .rdl_vb_data           (rdl_vb_data          ),
  .rdl_vb_data_cnt       (rdl_vb_data_cnt      ),
  .rdl_vb_data_create    (rdl_vb_data_create   ),
  .rdl_vb_line_dirty     (rdl_vb_line_dirty    ),
  .rdl_vb_warm_up        (rdl_vb_warm_up       ),
  .rtu_yy_xx_async_flush (rtu_yy_xx_async_flush),
  .vb_dahbif_addr        (vb_dahbif_addr       ),
  .vb_dahbif_data        (vb_dahbif_data       ),
  .vb_dahbif_prot        (vb_dahbif_prot       ),
  .vb_dahbif_req         (vb_dahbif_req        ),
  .vb_dbginfo            (vb_dbginfo           ),
  .vb_dc_hit_dirty       (vb_dc_hit_dirty      ),
  .vb_dc_ld_data         (vb_dc_ld_data        ),
  .vb_dc_ld_fwd_vld      (vb_dc_ld_fwd_vld     ),
  .vb_dc_pop_en          (vb_dc_pop_en         ),
  .vb_icc_empty          (vb_icc_empty         ),
  .vb_icc_grant          (vb_icc_grant         ),
  .vb_idle               (vb_idle              ),
  .vb_rdl_grant          (vb_rdl_grant         ),
  .vb_wb_idle            (vb_wb_idle           )
);

// &Instance("pa_dcache_top", "x_pa_dcache_top"); @46
pa_dcache_top  x_pa_dcache_top (
  .cp0_lsu_icg_en             (cp0_lsu_icg_en            ),
  .dcache_data_cen_way0_bank0 (dcache_data_cen_way0_bank0),
  .dcache_data_cen_way0_bank1 (dcache_data_cen_way0_bank1),
  .dcache_data_cen_way1_bank0 (dcache_data_cen_way1_bank0),
  .dcache_data_cen_way1_bank1 (dcache_data_cen_way1_bank1),
  .dcache_data_din            (dcache_data_din           ),
  .dcache_data_dout_way0      (dcache_data_dout_way0     ),
  .dcache_data_dout_way1      (dcache_data_dout_way1     ),
  .dcache_data_idx            (dcache_data_idx           ),
  .dcache_data_wen            (dcache_data_wen           ),
  .dcache_dirty_cen           (dcache_dirty_cen          ),
  .dcache_dirty_din           (dcache_dirty_din          ),
  .dcache_dirty_dout          (dcache_dirty_dout         ),
  .dcache_dirty_idx           (dcache_dirty_idx          ),
  .dcache_dirty_wen           (dcache_dirty_wen          ),
  .dcache_tag_cen             (dcache_tag_cen            ),
  .dcache_tag_din             (dcache_tag_din            ),
  .dcache_tag_dout            (dcache_tag_dout           ),
  .dcache_tag_idx             (dcache_tag_idx            ),
  .dcache_tag_wen             (dcache_tag_wen            ),
  .forever_cpuclk             (forever_cpuclk            ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);

// &Instance("pa_lsu_dahbif", "x_pa_lsu_dahbif"); @47
pa_lsu_dahbif  x_pa_lsu_dahbif (
  .bmu_lsu_acc_err        (bmu_lsu_acc_err       ),
  .bmu_lsu_grant          (bmu_lsu_grant         ),
  .bmu_lsu_rdata          (bmu_lsu_rdata         ),
  .bmu_lsu_trans_cmplt    (bmu_lsu_trans_cmplt   ),
  .cp0_lsu_icg_en         (cp0_lsu_icg_en        ),
  .cpurst_b               (cpurst_b              ),
  .dahbif_dbginfo         (dahbif_dbginfo        ),
  .dahbif_lfb_acc_err     (dahbif_lfb_acc_err    ),
  .dahbif_lfb_cmplt       (dahbif_lfb_cmplt      ),
  .dahbif_lfb_data        (dahbif_lfb_data       ),
  .dahbif_lfb_grant       (dahbif_lfb_grant      ),
  .dahbif_ncb_acc_err     (dahbif_ncb_acc_err    ),
  .dahbif_ncb_cmplt       (dahbif_ncb_cmplt      ),
  .dahbif_ncb_data        (dahbif_ncb_data       ),
  .dahbif_ncb_grant       (dahbif_ncb_grant      ),
  .dahbif_ncb_grant_2     (dahbif_ncb_grant_2    ),
  .dahbif_stb_acc_ecc     (dahbif_stb_acc_ecc    ),
  .dahbif_stb_cmplt       (dahbif_stb_cmplt      ),
  .dahbif_stb_grant       (dahbif_stb_grant      ),
  .dahbif_stb_grant_2     (dahbif_stb_grant_2    ),
  .dahbif_vb_acc_ecc      (dahbif_vb_acc_ecc     ),
  .dahbif_vb_cmplt        (dahbif_vb_cmplt       ),
  .dahbif_vb_grant        (dahbif_vb_grant       ),
  .forever_cpuclk         (forever_cpuclk        ),
  .lfb_dahbif_addr        (lfb_dahbif_addr       ),
  .lfb_dahbif_burst       (lfb_dahbif_burst      ),
  .lfb_dahbif_lock        (lfb_dahbif_lock       ),
  .lfb_dahbif_lr_inst     (lfb_dahbif_lr_inst    ),
  .lfb_dahbif_prot        (lfb_dahbif_prot       ),
  .lfb_dahbif_req         (lfb_dahbif_req        ),
  .lfb_dahbif_size        (lfb_dahbif_size       ),
  .lsu_bmu_acc_deny       (lsu_bmu_acc_deny      ),
  .lsu_bmu_addr           (lsu_bmu_addr          ),
  .lsu_bmu_burst          (lsu_bmu_burst         ),
  .lsu_bmu_lock           (lsu_bmu_lock          ),
  .lsu_bmu_lrsc           (lsu_bmu_lrsc          ),
  .lsu_bmu_prot           (lsu_bmu_prot          ),
  .lsu_bmu_req            (lsu_bmu_req           ),
  .lsu_bmu_req_dp         (lsu_bmu_req_dp        ),
  .lsu_bmu_seq            (lsu_bmu_seq           ),
  .lsu_bmu_size           (lsu_bmu_size          ),
  .lsu_bmu_wdata          (lsu_bmu_wdata         ),
  .lsu_bmu_write          (lsu_bmu_write         ),
  .ncb_dahbif_acc_deny    (ncb_dahbif_acc_deny   ),
  .ncb_dahbif_lock        (ncb_dahbif_lock       ),
  .ncb_dahbif_lrsc        (ncb_dahbif_lrsc       ),
  .ncb_dahbif_ncb_wb_addr (ncb_dahbif_ncb_wb_addr),
  .ncb_dahbif_ncb_wb_sel  (ncb_dahbif_ncb_wb_sel ),
  .ncb_dahbif_prot        (ncb_dahbif_prot       ),
  .ncb_dahbif_req         (ncb_dahbif_req        ),
  .ncb_dahbif_req_dp      (ncb_dahbif_req_dp     ),
  .ncb_dahbif_size        (ncb_dahbif_size       ),
  .ncb_dahbif_uc_ld_addr  (ncb_dahbif_uc_ld_addr ),
  .ncb_dahbif_wdata       (ncb_dahbif_wdata      ),
  .ncb_dahbif_write       (ncb_dahbif_write      ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    ),
  .rtu_yy_xx_async_flush  (rtu_yy_xx_async_flush ),
  .stb_dahbif_addr        (stb_dahbif_addr       ),
  .stb_dahbif_data        (stb_dahbif_data       ),
  .stb_dahbif_lock        (stb_dahbif_lock       ),
  .stb_dahbif_prot        (stb_dahbif_prot       ),
  .stb_dahbif_req         (stb_dahbif_req        ),
  .stb_dahbif_sc_inst     (stb_dahbif_sc_inst    ),
  .stb_dahbif_size        (stb_dahbif_size       ),
  .vb_dahbif_addr         (vb_dahbif_addr        ),
  .vb_dahbif_data         (vb_dahbif_data        ),
  .vb_dahbif_prot         (vb_dahbif_prot        ),
  .vb_dahbif_req          (vb_dahbif_req         )
);

// &Instance("pa_lsu_dc_dummy","x_pa_lsu_dc_dummy"); @49
// &Instance("pa_lsu_dahbif_uc","x_pa_lsu_dahbif"); @50
// &Force("input", "cp0_lsu_icc_addr");    &Force("bus", "cp0_lsu_icc_addr", 31, 0); @51
// &Force("input", "cp0_lsu_icc_op");      &Force("bus", "cp0_lsu_icc_op", 1, 0); @52
// &Force("input", "cp0_lsu_icc_req"); @53
// &Force("input", "cp0_lsu_icc_type");    &Force("bus", "cp0_lsu_icc_type", 1, 0); @54
// &Force("input", "cp0_lsu_fence_req"); @55
// &Force("input", "cp0_lsu_sync_req"); @58
// &Force("input", "rtu_lsu_sync_req"); @59

// &Instance("pa_lsu_dtif", "x_pa_lsu_dtif"); @62
pa_lsu_dtif  x_pa_lsu_dtif (
  .ag_dtu_addr             (ag_dtu_addr            ),
  .ag_dtu_addr_ready       (ag_dtu_addr_ready      ),
  .ag_dtu_amo_type         (ag_dtu_amo_type        ),
  .ag_dtu_bytes_vld        (ag_dtu_bytes_vld       ),
  .ag_dtu_data             (ag_dtu_data            ),
  .ag_dtu_data_chk_mask    (ag_dtu_data_chk_mask   ),
  .ag_dtu_data_vld         (ag_dtu_data_vld        ),
  .ag_dtu_halt_info        (ag_dtu_halt_info       ),
  .ag_dtu_mem_access_size  (ag_dtu_mem_access_size ),
  .ag_dtu_pipe_down        (ag_dtu_pipe_down       ),
  .ag_dtu_req              (ag_dtu_req             ),
  .ag_dtu_req_gate         (ag_dtu_req_gate        ),
  .ag_dtu_split_last       (ag_dtu_split_last      ),
  .ag_dtu_st_type          (ag_dtu_st_type         ),
  .cp0_lsu_icg_en          (cp0_lsu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .da_dtu_data             (da_dtu_data            ),
  .da_dtu_data_expt_vld    (da_dtu_data_expt_vld   ),
  .da_dtu_data_vld         (da_dtu_data_vld        ),
  .dtif_ag_cmplt_ready     (dtif_ag_cmplt_ready    ),
  .dtif_ag_fsm_idle        (dtif_ag_fsm_idle       ),
  .dtif_ag_halt_info       (dtif_ag_halt_info      ),
  .dtif_ag_halt_info_up    (dtif_ag_halt_info_up   ),
  .dtif_ag_pipedown_mask   (dtif_ag_pipedown_mask  ),
  .dtif_ag_stall           (dtif_ag_stall          ),
  .dtu_lsu_addr_trig_en    (dtu_lsu_addr_trig_en   ),
  .dtu_lsu_data_trig_en    (dtu_lsu_data_trig_en   ),
  .dtu_lsu_halt_info       (dtu_lsu_halt_info      ),
  .dtu_lsu_halt_info_vld   (dtu_lsu_halt_info_vld  ),
  .forever_cpuclk          (forever_cpuclk         ),
  .ifu_lsu_warm_up         (ifu_lsu_warm_up        ),
  .lsu_dtu_halt_info       (lsu_dtu_halt_info      ),
  .lsu_dtu_last_check      (lsu_dtu_last_check     ),
  .lsu_dtu_ldst_addr       (lsu_dtu_ldst_addr      ),
  .lsu_dtu_ldst_addr_vld   (lsu_dtu_ldst_addr_vld  ),
  .lsu_dtu_ldst_bytes_vld  (lsu_dtu_ldst_bytes_vld ),
  .lsu_dtu_ldst_data       (lsu_dtu_ldst_data      ),
  .lsu_dtu_ldst_data_vld   (lsu_dtu_ldst_data_vld  ),
  .lsu_dtu_ldst_type       (lsu_dtu_ldst_type      ),
  .lsu_dtu_mem_access_size (lsu_dtu_mem_access_size),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .rtu_yy_xx_flush         (rtu_yy_xx_flush        )
);

// &Force("nonport", "ag_dbginfo"); @64
// &Force("nonport", "dc_dbginfo"); @65
// &Force("nonport", "lfb_dbginfo"); @66
// &Force("nonport", "rdl_dbginfo"); @67
// &Force("nonport", "stb_dbginfo"); @68
// &Force("nonport", "vb_dbginfo"); @69
// &Force("nonport", "lsu_dtu_debug_info"); @70

// &Force("output","lsu_xx_warm_up"); @73
// //&Force("output","lsu_rtu_ex2_data_vld_gate"); @74

parameter S_BYTE = 2'b00;
parameter S_HALF = 2'b01;

//==============================================================================
//         DATA MERGE BUFFER FOR SPLIT 
//==============================================================================
//VB or STQ generate async_expt should flush mb_cur_state.
parameter MB_IDLE = 1'b0;
parameter MB_BUSY = 1'b1;

always@(posedge mb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mb_cur_state <= MB_IDLE;
  else if (rtu_lsu_async_expt_ack)
    mb_cur_state <= MB_IDLE;
  else
    mb_cur_state <= mb_next_state;
end

// &CombBeg; @97
always @( lsu_ex2_data_vld
       or mb_cur_state
       or lsu_ex2_split
       or lsu_ex2_split_last
       or ag_xx_inst_abort
       or mb_split_checked)
begin
  case(mb_cur_state)
  MB_IDLE : begin
    if (lsu_ex2_data_vld & lsu_ex2_split & !lsu_ex2_split_last & !ag_xx_inst_abort)
      mb_next_state = MB_BUSY;
    else
      mb_next_state = MB_IDLE;
  end
  MB_BUSY : begin
    if (lsu_ex2_data_vld & lsu_ex2_split_last |
        ag_xx_inst_abort & !mb_split_checked)
      mb_next_state = MB_IDLE;
    else
      mb_next_state = MB_BUSY;
  end
  default: mb_next_state = MB_IDLE;
  endcase
// &CombEnd; @114
end

assign lsu_ex2_checked = !lsu_ex2_split | lsu_ex2_split_last;
assign mb_create_en    = lsu_ex2_data_vld & lsu_ex2_split & !mb_cur_state; 

always@(posedge mb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mb_split_checked <= 1'b0;
  else if (ag_xx_split_done)
    mb_split_checked <= 1'b1;
  else if (mb_create_en)
    mb_split_checked <= lsu_ex2_checked;
end

always@(posedge mb_dp_clk)
begin
  if (mb_create_en | lsu_xx_warm_up) begin
    mb_fls            <= lsu_ex2_fls;
    mb_flw            <= lsu_ex2_flw;
    mb_sign_ext       <= lsu_ex2_sign_ext;
    mb_size[1:0]      <= lsu_ex2_size[1:0];
    mb_dest_reg[5:0]  <= lsu_ex2_dest_reg[5:0];
    mb_bytes_vld[3:0] <= lsu_ex2_bytes_vld_ext[3:0];
  end
end

assign mb_data_create_en = lsu_ex2_data_vld & lsu_ex2_split & !lsu_ex2_split_last;

always@(posedge mb_data_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mb_data[DATAW-1:0] <= {DATAW{1'b0}};
  else if (mb_data_create_en)
    mb_data[DATAW-1:0] <= data[DATAW-1:0];
end


assign data[DATAW-1:0] = mb_data_bits_vld[DATAW-1:0] & lsu_ex2_data[DATAW-1:0] |
                        ~mb_data_bits_vld[DATAW-1:0] & mb_data[DATAW-1:0] & {DATAW{mb_cur_state}};
assign mb_data_bits_vld[31:0] = {{8{lsu_ex2_bytes_vld_ext[3]}}, 
                                 {8{lsu_ex2_bytes_vld_ext[2]}}, 
                                 {8{lsu_ex2_bytes_vld_ext[1]}}, 
                                 {8{lsu_ex2_bytes_vld_ext[0]}}};
assign bytes_vld[3:0]  = mb_cur_state ? mb_bytes_vld[3:0] : lsu_ex2_bytes_vld_ext[3:0];
assign sign_ext        = mb_cur_state ? mb_sign_ext       : lsu_ex2_sign_ext;
assign size[1:0]       = mb_cur_state ? mb_size[1:0]      : lsu_ex2_size[1:0];
assign flw             = mb_cur_state ? mb_flw            : lsu_ex2_flw;
assign fls             = mb_cur_state ? mb_fls            : lsu_ex2_fls;
assign dest_reg[5:0]   = mb_cur_state ? mb_dest_reg[5:0]  : lsu_ex2_dest_reg[5:0];
// &Force("input","cp0_lsu_mm"); @222

//input
assign lsu_ex2_stall           = lsu_mb_ex2_ca_stall    | lsu_mb_ex2_uc_stall;
assign lsu_ex2_data_vld        = lsu_mb_ex2_uc_data_vld | lsu_mb_ex2_ca_data_vld;
assign lsu_ex2_data_vld_gate   = lsu_mb_ex2_uc_data_vld_gate | lsu_mb_ex2_ca_data_vld_gate;
assign lsu_ex2_split           = lsu_top_dc_vld ? lsu_mb_ex2_ca_split           : lsu_mb_ex2_uc_split;
assign lsu_ex2_split_last      = lsu_top_dc_vld ? lsu_mb_ex2_ca_split_last      : lsu_mb_ex2_uc_split_last;
assign lsu_ex2_fls             = lsu_top_dc_vld ? lsu_mb_ex2_ca_fls             : lsu_mb_ex2_uc_fls;
assign lsu_ex2_fld             = lsu_top_dc_vld ? lsu_mb_ex2_ca_fld             : lsu_mb_ex2_uc_fld;
assign lsu_ex2_sc_data_vld     = lsu_top_dc_vld ? lsu_mb_ex2_ca_sc_data_vld     : lsu_mb_ex2_uc_sc_data_vld;
assign lsu_ex2_sign_ext        = lsu_top_dc_vld ? lsu_mb_ex2_ca_sign_ext        : lsu_mb_ex2_uc_sign_ext;
assign lsu_ex2_size[1:0]       = lsu_top_dc_vld ? lsu_mb_ex2_ca_size[1:0]       : lsu_mb_ex2_uc_size[1:0];
assign lsu_ex2_dest_reg[5:0]   = lsu_top_dc_vld ? lsu_mb_ex2_ca_dest_reg[5:0]   : lsu_mb_ex2_uc_dest_reg[5:0];
assign lsu_ex2_addr_2          = lsu_top_dc_vld ? lsu_mb_ex2_ca_addr_2          : lsu_mb_ex2_uc_addr_2;
assign lsu_ex2_bytes_vld[3:0]  = lsu_top_dc_vld ? lsu_mb_ex2_ca_bytes_vld[3:0]  : lsu_mb_ex2_uc_bytes_vld[3:0];
assign lsu_ex2_data[DATAW-1:0] = lsu_top_dc_vld ? lsu_mb_ex2_ca_data[DATAW-1:0] : lsu_mb_ex2_uc_data[DATAW-1:0];
assign lsu_ex2_lock            = lsu_top_dc_vld ? lsu_mb_ex2_ca_lock            : lsu_mb_ex2_uc_lock;
//assign lsu_ex2_vld             = lsu_top_dc_vld ? lsu_mb_ex2_ca_vld             : lsu_mb_ex2_uc_vld;

assign lsu_ex2_flw             = lsu_ex2_fls & lsu_ex2_size[1:0] == 2'b10;
// &CombBeg; @251
// &CombEnd; @263
// &Force("nonport", "lsu_ex2_addr_2"); @265
// &Force("nonport", "lsu_ex2_fld"); @266
assign lsu_ex2_bytes_vld_ext[3:0] = lsu_ex2_bytes_vld[3:0];

// &CombBeg; @269
always @( bytes_vld[3:0]
       or data[31:0])
begin
  casez(bytes_vld[3:0])
  4'b???1 : data_align[31:0] = data[31:0];
  4'b??10 : data_align[31:0] = {data[7:0], data[31:8]};
  4'b?100 : data_align[31:0] = {data[15:0],data[31:16]};
  4'b1000 : data_align[31:0] = {data[23:0],data[31:24]};
  default : data_align[31:0] = data[31:0];
  endcase
// &CombEnd; @277
end

// &CombBeg; @280
always @( size[1:0]
       or data_align[31:0]
       or sign_ext)
begin
  case({sign_ext, size[1:0]})
  {1'b0,S_BYTE} : data_align_ext[31:0] = {24'b0,data_align[7:0]};
  {1'b0,S_HALF} : data_align_ext[31:0] = {16'b0,data_align[15:0]};
  {1'b1,S_BYTE} : data_align_ext[31:0] = {{24{data_align[7]}},data_align[7:0]};
  {1'b1,S_HALF} : data_align_ext[31:0] = {{16{data_align[15]}},data_align[15:0]};
  default     : data_align_ext[31:0] = data_align[31:0];
  endcase
// &CombEnd; @288
end


assign lsu_rtu_ex2_data_vld      = lsu_ex2_data_vld & (!lsu_ex2_split | lsu_ex2_split_last) & 
                                   (cp0_xx_async_expt_en | !lsu_acc_fault_vld);
assign lsu_rtu_ex2_data_vld_gate = lsu_ex2_data_vld_gate & (!lsu_ex2_split | lsu_ex2_split_last);
assign lsu_rtu_ex2_data[31:0]    = data_align_ext[31:0];
assign lsu_rtu_ex2_dest_reg[5:0] = dest_reg[5:0];
assign lsu_rtu_ex2_fls           = fls;
//assign lsu_rtu_ex2_single        = flw;

assign lsu_xx_flush         = lsu_xx_ex2_ca_flush | lsu_xx_ex2_uc_flush;

//-----------------------------------------------
//   da stage
//-----------------------------------------------
assign dc_da_data_vld        = lsu_rtu_ex2_data_vld;
assign dc_da_data_vld_dp     = lsu_rtu_ex2_data_vld_gate;
assign dc_da_fls             = lsu_rtu_ex2_fls;
assign dc_da_fls_double      = lsu_rtu_ex2_fls & !flw;
assign dc_da_sc_data_vld     = lsu_ex2_sc_data_vld;
assign dc_da_dest_reg[5:0]   = lsu_rtu_ex2_dest_reg[5:0];
assign dc_da_data[DATAW-1:0] = lsu_rtu_ex2_data[DATAW-1:0]; 

always@(posedge da_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    da_inst_vld <= 1'b0;
  else if (rtu_yy_xx_async_flush)
    da_inst_vld <= 1'b0;
  else if (dc_da_data_vld)
    da_inst_vld <= 1'b1;
  else if (da_inst_vld)
    da_inst_vld <= 1'b0;
end

always@(posedge da_dp_clk)
begin
  if (dc_da_data_vld_dp | ifu_lsu_warm_up) begin
    da_fls             <= dc_da_fls;
    da_fls_double      <= dc_da_fls_double;
    da_sc_inst         <= dc_da_sc_data_vld;
    da_dest_reg[5:0]   <= dc_da_dest_reg[5:0];
    da_data[DATAW-1:0] <= dc_da_data[DATAW-1:0];
  end  
end

assign da_data_vld = da_inst_vld;
assign da_xx_no_op = !da_inst_vld;
//-----------------------------------------------
//   DA Internal FWD
//-----------------------------------------------
assign da_xx_fwd_vld             = da_data_vld;  
assign da_xx_fwd_fls             = da_fls;  
assign da_xx_fwd_preg[5:0]       = da_dest_reg[5:0];
assign da_xx_fwd_data[DATAW-1:0] = da_data[DATAW-1:0];
//-----------------------------------------------
//   to IDU
//-----------------------------------------------
assign lsu_idu_ex2_fwd_vld              = lsu_rtu_ex2_data_vld & !lsu_rtu_ex2_fls;
assign lsu_idu_ex2_fwd_preg[5:0]        = lsu_rtu_ex2_dest_reg[5:0];
assign lsu_idu_ex2_fwd_data[31:0]       = lsu_rtu_ex2_data[31:0]; 

assign lsu_idu_ex3_fwd_vld              = da_data_vld & !da_fls;
assign lsu_idu_ex3_fwd_preg[5:0]        = da_dest_reg[5:0];
assign lsu_idu_ex3_fwd_data[31:0]       = da_data[31:0]; 

assign lsu_idu_ex2_ffwd_vld             = lsu_rtu_ex2_data_vld & lsu_rtu_ex2_fls;
assign lsu_idu_ex2_fwd_freg[4:0]        = lsu_rtu_ex2_dest_reg[4:0];
assign lsu_idu_ex2_ffwd_data[DATAW-1:0] = lsu_rtu_ex2_data[DATAW-1:0];

assign lsu_idu_ex3_ffwd_vld             = da_data_vld & da_fls;
assign lsu_idu_ex3_fwd_freg[4:0]        = da_dest_reg[4:0];
assign lsu_idu_ex3_ffwd_data[DATAW-1:0] = da_data[DATAW-1:0]; 

//-----------------------------------------------
//   to IU
//-----------------------------------------------
assign lsu_iu_ex2_data_vld      = lsu_rtu_ex2_data_vld & !lsu_rtu_ex2_fls;
assign lsu_iu_ex2_dest_reg[5:0] = lsu_rtu_ex2_dest_reg[5:0];
assign lsu_iu_ex2_data[31:0]    = lsu_rtu_ex2_data[31:0];
//-----------------------------------------------
//   to dtif
//-----------------------------------------------
assign da_dtu_data_vld      = da_data_vld & !da_fls_double & !da_sc_inst;
assign da_dtu_data_expt_vld = lsu_dtu_ex2_expt_vld; 
assign da_dtu_data[31:0]    = da_data[31:0];
// &Force("nonport","lsu_dtu_ex2_expt_vld"); @402
// &Force("nonport","da_fls_double"); @403
// &Force("nonport","da_sc_inst"); @404
//-----------------------------------------------
//   to RTU
//-----------------------------------------------
assign lsu_rtu_wb_vld        = da_data_vld & !da_fls;  
assign lsu_rtu_wb_preg[5:0]  = da_dest_reg[5:0];
assign lsu_rtu_wb_data[31:0] = da_data[31:0];

assign lsu_rtu_fgpr_wb_vld             = da_data_vld & da_fls;
assign lsu_rtu_fgpr_wb_reg[4:0]        = da_dest_reg[4:0];
assign lsu_rtu_fgpr_wb_data[DATAW-1:0] = da_data[DATAW-1:0];

//----------------------rtu expt return-------------------------------
assign lsu_ex2_stall_final = lsu_ex2_stall & 
                             (!lsu_ex2_split | lsu_ex2_split_last) & 
                             (!cp0_xx_async_expt_en | lsu_ex2_lock);

assign lsu_rtu_ex2_stall         = lsu_ex2_stall_final; 
//assign lsu_rtu_ex2_stall_gate    = lsu_ex2_vld &
//                                   (!cp0_xx_async_expt_en | lsu_ex2_lock);


// &Force("output","lsu_rtu_async_expt_vld"); @429
// //&Force("output","lsu_rtu_ex2_data_vld"); @430
// //&Force("output","lsu_rtu_ex2_dest_reg"); @431
// //&Force("output","lsu_rtu_ex2_data"); @432
// //&Force("output","lsu_rtu_ex2_fls"); @434

// &Force("nonport","lsu_rtu_ex2_single"); @439
// &Force("nonport","flw"); @440


assign lsu_dtu_debug_info[78:0] = {8'b0,
                                   dahbif_dbginfo[4:0],
                                   ncb_dbginfo[10:0],
                                   vb_dbginfo[7:0],
                                   stb_dbginfo[23:0],
                                   rdl_dbginfo[2:0],
                                   lfb_dbginfo[3:0],
                                   dc_dbginfo[14:0],
                                   idu_lsu_ex1_sel};

//================================================
//  ICG
//================================================
assign mb_clk_en = lsu_ex2_data_vld_gate & lsu_ex2_split | mb_cur_state;
// &Instance("gated_clk_cell", "x_pa_lsu_mb_ctrl_gated_clk"); @468
gated_clk_cell  x_pa_lsu_mb_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (mb_clk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (mb_clk_en         ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @469
//          .external_en (1'b0), @470
//          .global_en   (1'b1), @471
//          .module_en     (cp0_lsu_icg_en     ), @472
//          .local_en    (mb_clk_en), @473
//          .clk_out     (mb_clk)); @474

assign mb_dp_clk_en = lsu_ex2_data_vld_gate & lsu_ex2_split & !mb_cur_state | lsu_xx_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_mb_dp_gated_clk"); @477
gated_clk_cell  x_pa_lsu_mb_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (mb_dp_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (mb_dp_clk_en      ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @478
//          .external_en (1'b0), @479
//          .global_en   (1'b1), @480
//          .module_en     (cp0_lsu_icg_en     ), @481
//          .local_en    (mb_dp_clk_en), @482
//          .clk_out     (mb_dp_clk)); @483

assign mb_data_clk_en = lsu_ex2_data_vld_gate & lsu_ex2_split;
// &Instance("gated_clk_cell", "x_pa_lsu_mb_data_gated_clk"); @486
gated_clk_cell  x_pa_lsu_mb_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (mb_data_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (mb_data_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @487
//          .external_en (1'b0), @488
//          .global_en   (1'b1), @489
//          .module_en     (cp0_lsu_icg_en     ), @490
//          .local_en    (mb_data_clk_en), @491
//          .clk_out     (mb_data_clk)); @492
// &Force("nonport","lsu_ex2_data_vld_gate"); @494

assign da_clk_en = dc_da_data_vld_dp | ifu_lsu_warm_up | da_inst_vld;
// &Instance("gated_clk_cell", "x_pa_lsu_da_gated_clk"); @498
gated_clk_cell  x_pa_lsu_da_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (da_clk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (da_clk_en         ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @499
//          .external_en (1'b0), @500
//          .global_en   (1'b1), @501
//          .module_en   (cp0_lsu_icg_en), @502
//          .local_en    (da_clk_en), @503
//          .clk_out     (da_clk)); @504

assign da_dp_clk_en = dc_da_data_vld_dp | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_da_data_gated_clk"); @507
gated_clk_cell  x_pa_lsu_da_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (da_dp_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (da_dp_clk_en      ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @508
//          .external_en (1'b0), @509
//          .global_en   (1'b1), @510
//          .module_en   (cp0_lsu_icg_en), @511
//          .local_en    (da_dp_clk_en), @512
//          .clk_out     (da_dp_clk)); @513




// &ModuleEnd; @574
endmodule


