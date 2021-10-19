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
module pa_lsu_dc(
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
  ag_dc_split,
  ag_dc_split_first,
  ag_dc_split_last,
  ag_dc_src1_depd,
  ag_dc_src1_reg,
  ag_dc_st_data,
  ag_dc_wdata_shift,
  cp0_lsu_dcache_en,
  cp0_lsu_dcache_wa,
  cp0_lsu_icg_en,
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
  dc_ag_func,
  dc_ag_pmp_ld_inst,
  dc_ag_pmp_mtval,
  dc_ag_stall,
  dc_dbginfo,
  dc_icc_way0_data,
  dc_icc_way0_dirty,
  dc_icc_way0_tag,
  dc_icc_way1_data,
  dc_icc_way1_dirty,
  dc_icc_way1_tag,
  dc_idle,
  dc_lfb_addr,
  dc_lfb_buf,
  dc_lfb_ca,
  dc_lfb_ca_raw,
  dc_lfb_create_en,
  dc_lfb_create_en_gate,
  dc_lfb_inst_ld,
  dc_lfb_lock_trans,
  dc_lfb_lr_inst,
  dc_lfb_mach_mode,
  dc_lfb_size,
  dc_rdl_fifo,
  dc_rdl_way0_data,
  dc_rdl_way0_dirty,
  dc_rdl_way0_tag,
  dc_rdl_way0_vld,
  dc_rdl_way1_data,
  dc_rdl_way1_dirty,
  dc_rdl_way1_tag,
  dc_rdl_way1_vld,
  dc_stb_addr,
  dc_stb_attr,
  dc_stb_bytes_vld,
  dc_stb_cache_hit,
  dc_stb_create_en,
  dc_stb_create_en_gate,
  dc_stb_data,
  dc_stb_dcache_dirty,
  dc_stb_dcache_inst,
  dc_stb_dcache_type,
  dc_stb_dcache_way,
  dc_stb_fls,
  dc_stb_lock_trans,
  dc_stb_sc_inst,
  dc_stb_shift,
  dc_stb_size,
  dc_stb_split_first,
  dc_stb_src1_depd,
  dc_stb_src1_reg,
  dc_stb_wait_lfb,
  dc_vb_st_amold,
  dc_xx_addr,
  dc_xx_bytes_vld,
  dcache_data_dout_way0,
  dcache_data_dout_way1,
  dcache_dirty_dout,
  dcache_tag_dout,
  forever_cpuclk,
  ifu_lsu_warm_up,
  lfb_dc_async_expt,
  lfb_dc_busy,
  lfb_dc_hit_idx,
  lfb_dc_ld_cmplt,
  lfb_dc_ld_data,
  lfb_dc_ld_data_vld,
  lfb_dc_pop_en,
  lsu_hpcp_cache_read_access,
  lsu_hpcp_cache_read_access_gate,
  lsu_hpcp_cache_read_miss,
  lsu_hpcp_cache_read_miss_gate,
  lsu_hpcp_cache_write_access,
  lsu_hpcp_cache_write_access_gate,
  lsu_hpcp_cache_write_miss,
  lsu_hpcp_cache_write_miss_gate,
  lsu_mb_ex2_ca_addr_2,
  lsu_mb_ex2_ca_bytes_vld,
  lsu_mb_ex2_ca_data,
  lsu_mb_ex2_ca_data_vld,
  lsu_mb_ex2_ca_data_vld_gate,
  lsu_mb_ex2_ca_dest_reg,
  lsu_mb_ex2_ca_fld,
  lsu_mb_ex2_ca_fls,
  lsu_mb_ex2_ca_lock,
  lsu_mb_ex2_ca_sc_data_vld,
  lsu_mb_ex2_ca_sign_ext,
  lsu_mb_ex2_ca_size,
  lsu_mb_ex2_ca_split,
  lsu_mb_ex2_ca_split_last,
  lsu_mb_ex2_ca_stall,
  lsu_top_dc_vld,
  lsu_xx_ex2_ca_flush,
  pad_yy_icg_scan_en,
  rtu_lsu_fgpr_wb_data,
  rtu_lsu_fgpr_wb_reg,
  rtu_lsu_fgpr_wb_vld,
  rtu_yy_xx_async_flush,
  stb_dc_async_expt,
  stb_dc_busy,
  stb_dc_full,
  stb_dc_hit_addr,
  stb_dc_hit_dca,
  stb_dc_hit_idx,
  stb_dc_ld_data,
  stb_dc_ld_fwd_vld,
  stb_dc_mtval,
  stb_dc_multi_or_part_hit,
  stb_dc_pop_en,
  vb_dc_hit_dirty,
  vb_dc_ld_data,
  vb_dc_ld_fwd_vld,
  vb_dc_pop_en
);

// &Ports; @21
input   [31:0]  ag_dc_addr;                      
input           ag_dc_buf;                       
input   [3 :0]  ag_dc_bytes_vld;                 
input           ag_dc_ca;                        
input           ag_dc_dcache_grant;              
input   [5 :0]  ag_dc_dest_reg;                  
input           ag_dc_fls;                       
input   [3 :0]  ag_dc_func;                      
input           ag_dc_inst_vld;                  
input           ag_dc_inst_vld_gate;             
input           ag_dc_lm_pass;                   
input           ag_dc_mach_mode;                 
input   [1 :0]  ag_dc_ori_size;                  
input           ag_dc_pmp_expt;                  
input           ag_dc_sign_ext;                  
input   [1 :0]  ag_dc_size;                      
input           ag_dc_split;                     
input           ag_dc_split_first;               
input           ag_dc_split_last;                
input           ag_dc_src1_depd;                 
input   [5 :0]  ag_dc_src1_reg;                  
input   [31:0]  ag_dc_st_data;                   
input   [2 :0]  ag_dc_wdata_shift;               
input           cp0_lsu_dcache_en;               
input           cp0_lsu_dcache_wa;               
input           cp0_lsu_icg_en;                  
input           cpurst_b;                        
input   [31:0]  da_xx_fwd_data;                  
input           da_xx_fwd_fls;                   
input   [5 :0]  da_xx_fwd_preg;                  
input           da_xx_fwd_vld;                   
input   [63:0]  dcache_data_dout_way0;           
input   [63:0]  dcache_data_dout_way1;           
input   [2 :0]  dcache_dirty_dout;               
input   [45:0]  dcache_tag_dout;                 
input           forever_cpuclk;                  
input           ifu_lsu_warm_up;                 
input           lfb_dc_async_expt;               
input           lfb_dc_busy;                     
input           lfb_dc_hit_idx;                  
input           lfb_dc_ld_cmplt;                 
input   [31:0]  lfb_dc_ld_data;                  
input           lfb_dc_ld_data_vld;              
input           lfb_dc_pop_en;                   
input           pad_yy_icg_scan_en;              
input   [31:0]  rtu_lsu_fgpr_wb_data;            
input   [4 :0]  rtu_lsu_fgpr_wb_reg;             
input           rtu_lsu_fgpr_wb_vld;             
input           rtu_yy_xx_async_flush;           
input           stb_dc_async_expt;               
input           stb_dc_busy;                     
input           stb_dc_full;                     
input           stb_dc_hit_addr;                 
input           stb_dc_hit_dca;                  
input           stb_dc_hit_idx;                  
input   [31:0]  stb_dc_ld_data;                  
input           stb_dc_ld_fwd_vld;               
input   [31:0]  stb_dc_mtval;                    
input           stb_dc_multi_or_part_hit;        
input           stb_dc_pop_en;                   
input           vb_dc_hit_dirty;                 
input   [31:0]  vb_dc_ld_data;                   
input           vb_dc_ld_fwd_vld;                
input           vb_dc_pop_en;                    
output          dc_ag_async_expt_vld;            
output          dc_ag_async_ld_inst;             
output  [31:0]  dc_ag_async_mtval;               
output          dc_ag_cache_stall;               
output  [31:0]  dc_ag_dcache_addr;               
output          dc_ag_dcache_req;                
output  [1 :0]  dc_ag_dcache_size;               
output  [3 :0]  dc_ag_func;                      
output          dc_ag_pmp_ld_inst;               
output  [31:0]  dc_ag_pmp_mtval;                 
output          dc_ag_stall;                     
output  [14:0]  dc_dbginfo;                      
output  [63:0]  dc_icc_way0_data;                
output          dc_icc_way0_dirty;               
output  [21:0]  dc_icc_way0_tag;                 
output  [63:0]  dc_icc_way1_data;                
output          dc_icc_way1_dirty;               
output  [21:0]  dc_icc_way1_tag;                 
output          dc_idle;                         
output  [31:0]  dc_lfb_addr;                     
output          dc_lfb_buf;                      
output          dc_lfb_ca;                       
output          dc_lfb_ca_raw;                   
output          dc_lfb_create_en;                
output          dc_lfb_create_en_gate;           
output          dc_lfb_inst_ld;                  
output          dc_lfb_lock_trans;               
output          dc_lfb_lr_inst;                  
output          dc_lfb_mach_mode;                
output  [1 :0]  dc_lfb_size;                     
output          dc_rdl_fifo;                     
output  [63:0]  dc_rdl_way0_data;                
output          dc_rdl_way0_dirty;               
output  [21:0]  dc_rdl_way0_tag;                 
output          dc_rdl_way0_vld;                 
output  [63:0]  dc_rdl_way1_data;                
output          dc_rdl_way1_dirty;               
output  [21:0]  dc_rdl_way1_tag;                 
output          dc_rdl_way1_vld;                 
output  [31:0]  dc_stb_addr;                     
output  [2 :0]  dc_stb_attr;                     
output  [3 :0]  dc_stb_bytes_vld;                
output          dc_stb_cache_hit;                
output          dc_stb_create_en;                
output          dc_stb_create_en_gate;           
output  [31:0]  dc_stb_data;                     
output          dc_stb_dcache_dirty;             
output          dc_stb_dcache_inst;              
output  [1 :0]  dc_stb_dcache_type;              
output          dc_stb_dcache_way;               
output          dc_stb_fls;                      
output          dc_stb_lock_trans;               
output          dc_stb_sc_inst;                  
output  [2 :0]  dc_stb_shift;                    
output  [1 :0]  dc_stb_size;                     
output          dc_stb_split_first;              
output          dc_stb_src1_depd;                
output  [4 :0]  dc_stb_src1_reg;                 
output          dc_stb_wait_lfb;                 
output          dc_vb_st_amold;                  
output  [31:0]  dc_xx_addr;                      
output  [7 :0]  dc_xx_bytes_vld;                 
output          lsu_hpcp_cache_read_access;      
output          lsu_hpcp_cache_read_access_gate; 
output          lsu_hpcp_cache_read_miss;        
output          lsu_hpcp_cache_read_miss_gate;   
output          lsu_hpcp_cache_write_access;     
output          lsu_hpcp_cache_write_access_gate; 
output          lsu_hpcp_cache_write_miss;       
output          lsu_hpcp_cache_write_miss_gate;  
output          lsu_mb_ex2_ca_addr_2;            
output  [3 :0]  lsu_mb_ex2_ca_bytes_vld;         
output  [31:0]  lsu_mb_ex2_ca_data;              
output          lsu_mb_ex2_ca_data_vld;          
output          lsu_mb_ex2_ca_data_vld_gate;     
output  [5 :0]  lsu_mb_ex2_ca_dest_reg;          
output          lsu_mb_ex2_ca_fld;               
output          lsu_mb_ex2_ca_fls;               
output          lsu_mb_ex2_ca_lock;              
output          lsu_mb_ex2_ca_sc_data_vld;       
output          lsu_mb_ex2_ca_sign_ext;          
output  [1 :0]  lsu_mb_ex2_ca_size;              
output          lsu_mb_ex2_ca_split;             
output          lsu_mb_ex2_ca_split_last;        
output          lsu_mb_ex2_ca_stall;             
output          lsu_top_dc_vld;                  
output          lsu_xx_ex2_ca_flush;             

// &Regs; @22
reg     [31:0]  dc_addr;                         
reg             dc_buf;                          
reg     [3 :0]  dc_bytes_vld;                    
reg             dc_ca;                           
reg     [2 :0]  dc_cur_state;                    
reg     [5 :0]  dc_dest_reg;                     
reg             dc_ex2_stall;                    
reg             dc_fls;                          
reg     [3 :0]  dc_func;                         
reg             dc_lm_pass;                      
reg             dc_mach_mode;                    
reg     [2 :0]  dc_next_state;                   
reg     [1 :0]  dc_ori_size;                     
reg             dc_pmp_deny;                     
reg             dc_sign_ext;                     
reg     [1 :0]  dc_size;                         
reg             dc_split;                        
reg             dc_split_first;                  
reg             dc_split_last;                   
reg             dc_src1_depd;                    
reg     [5 :0]  dc_src1_reg;                     
reg     [31:0]  dc_st_data_pre;                  
reg     [2 :0]  dc_wdata_shift;                  

// &Wires; @23
wire    [31:0]  ag_dc_addr;                      
wire            ag_dc_buf;                       
wire    [3 :0]  ag_dc_bytes_vld;                 
wire            ag_dc_ca;                        
wire            ag_dc_create_vld;                
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
wire            ag_dc_split;                     
wire            ag_dc_split_first;               
wire            ag_dc_split_last;                
wire            ag_dc_src1_depd;                 
wire    [5 :0]  ag_dc_src1_reg;                  
wire            ag_dc_st_create_vld;             
wire    [31:0]  ag_dc_st_data;                   
wire    [2 :0]  ag_dc_wdata_shift;               
wire            ag_ld_inst;                      
wire            ag_st_inst;                      
wire            async_expt_vld;                  
wire            async_ld_inst;                   
wire    [31:0]  async_mtval;                     
wire            cp0_lsu_dcache_en;               
wire            cp0_lsu_dcache_wa;               
wire            cp0_lsu_icg_en;                  
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
wire    [3 :0]  dc_ag_func;                      
wire            dc_ag_pmp_ld_inst;               
wire    [31:0]  dc_ag_pmp_mtval;                 
wire            dc_ag_stall;                     
wire    [2 :0]  dc_attr;                         
wire            dc_ca_after;                     
wire            dc_cache_hit;                    
wire            dc_cache_hit_raw;                
wire            dc_clk;                          
wire            dc_clk_en;                       
wire            dc_cmplt;                        
wire            dc_data_sel;                     
wire    [14:0]  dc_dbginfo;                      
wire            dc_dca_inst;                     
wire            dc_dcache_reply;                 
wire            dc_dp_clk;                       
wire            dc_dp_clk_en;                    
wire            dc_expt_vld;                     
wire            dc_fld_inst;                     
wire            dc_fwd_fwb;                      
wire            dc_fwd_lsu;                      
wire    [63:0]  dc_icc_way0_data;                
wire            dc_icc_way0_dirty;               
wire    [21:0]  dc_icc_way0_tag;                 
wire    [63:0]  dc_icc_way1_data;                
wire            dc_icc_way1_dirty;               
wire    [21:0]  dc_icc_way1_tag;                 
wire            dc_idle;                         
wire            dc_inst_vld;                     
wire            dc_ld_cmplt;                     
wire    [31:0]  dc_ld_data_from_dcache;          
wire    [31:0]  dc_ld_data_fwd;                  
wire            dc_ld_data_vld;                  
wire            dc_ld_fwd_sel;                   
wire            dc_ld_inst;                      
wire            dc_ld_reply;                     
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
wire            dc_lock_trans;                   
wire            dc_lr_inst;                      
wire            dc_rdl_fifo;                     
wire    [63:0]  dc_rdl_way0_data;                
wire            dc_rdl_way0_dirty;               
wire    [21:0]  dc_rdl_way0_tag;                 
wire            dc_rdl_way0_vld;                 
wire    [63:0]  dc_rdl_way1_data;                
wire            dc_rdl_way1_dirty;               
wire    [21:0]  dc_rdl_way1_tag;                 
wire            dc_rdl_way1_vld;                 
wire            dc_reply;                        
wire            dc_sc_data_sel;                  
wire            dc_sc_data_vld;                  
wire            dc_sc_inst;                      
wire            dc_st_alct;                      
wire            dc_st_cmplt;                     
wire            dc_st_dp_clk;                    
wire            dc_st_dp_clk_en;                 
wire    [31:0]  dc_st_fwd_data;                  
wire            dc_st_fwd_vld;                   
wire            dc_st_inst;                      
wire    [31:0]  dc_st_rdata;                     
wire            dc_st_reply;                     
wire    [31:0]  dc_st_wdata;                     
wire            dc_stage_pipedown;               
wire            dc_stage_vld;                    
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
wire            dc_wakeup;                       
wire    [31:0]  dc_way0_data_dout;               
wire    [31:0]  dc_way1_data_dout;               
wire    [31:0]  dc_xx_addr;                      
wire    [7 :0]  dc_xx_bytes_vld;                 
wire    [63:0]  dcache_data_dout_way0;           
wire    [63:0]  dcache_data_dout_way1;           
wire    [2 :0]  dcache_dirty_dout;               
wire            dcache_hit_way;                  
wire            dcache_hit_way_dirty;            
wire    [45:0]  dcache_tag_dout;                 
wire            fifo;                            
wire            forever_cpuclk;                  
wire            ifu_lsu_warm_up;                 
wire            ld_fwd_vld;                      
wire            lfb_data_sel;                    
wire            lfb_dc_async_expt;               
wire            lfb_dc_busy;                     
wire    [31:0]  lfb_dc_data;                     
wire            lfb_dc_hit_idx;                  
wire            lfb_dc_ld_cmplt;                 
wire    [31:0]  lfb_dc_ld_data;                  
wire            lfb_dc_ld_data_vld;              
wire            lfb_dc_pop_en;                   
wire            lfb_dc_sc_ldfwd_sel;             
wire    [31:0]  lsu_ex2_data;                    
wire            lsu_ex2_data_vld;                
wire            lsu_hpcp_cache_read_access;      
wire            lsu_hpcp_cache_read_access_gate; 
wire            lsu_hpcp_cache_read_miss;        
wire            lsu_hpcp_cache_read_miss_gate;   
wire            lsu_hpcp_cache_write_access;     
wire            lsu_hpcp_cache_write_access_gate; 
wire            lsu_hpcp_cache_write_miss;       
wire            lsu_hpcp_cache_write_miss_gate;  
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
wire            lsu_top_dc_vld;                  
wire            lsu_xx_ex2_ca_flush;             
wire            pad_yy_icg_scan_en;              
wire    [31:0]  rtu_lsu_fgpr_wb_data;            
wire    [4 :0]  rtu_lsu_fgpr_wb_reg;             
wire            rtu_lsu_fgpr_wb_vld;             
wire            rtu_yy_xx_async_flush;           
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
wire            vb_dc_hit_dirty;                 
wire    [31:0]  vb_dc_ld_data;                   
wire            vb_dc_ld_fwd_vld;                
wire            vb_dc_pop_en;                    
wire    [63:0]  way0_data_dout;                  
wire            way0_dirty;                      
wire            way0_tag_hit;                    
wire            way0_tag_vld;                    
wire    [63:0]  way1_data_dout;                  
wire            way1_dirty;                      
wire            way1_tag_hit;                    
wire            way1_tag_vld;                    


parameter D_TAG_TAG_LEN = `D_TAG_TAG_WIDTH;
parameter DATAW         = `FLEN; 

//================================================
// Interface to dcache
//================================================
assign way0_dirty = dcache_dirty_dout[0];
assign way1_dirty = dcache_dirty_dout[1];
assign fifo       = dcache_dirty_dout[2];

assign way0_tag_vld = dcache_tag_dout[22];
assign way1_tag_vld = dcache_tag_dout[45];

assign way0_data_dout[63:0] = dcache_data_dout_way0[63:0];
assign way1_data_dout[63:0] = dcache_data_dout_way1[63:0];

//================================================
//   to DC 
//================================================
assign dc_way0_data_dout[31:0] = dc_addr[2] ? way0_data_dout[63:32] : way0_data_dout[31:0];
assign dc_way1_data_dout[31:0] = dc_addr[2] ? way1_data_dout[63:32] : way1_data_dout[31:0];
//================================================
//   to ICC 
//================================================
assign dc_icc_way0_dirty      = way0_tag_vld & way0_dirty;
assign dc_icc_way1_dirty      = way1_tag_vld & way1_dirty;
assign dc_icc_way0_data[63:0] = way0_data_dout[63:0];
assign dc_icc_way1_data[63:0] = way1_data_dout[63:0];
assign dc_icc_way0_tag[21:0]  = dcache_tag_dout[21:0];
assign dc_icc_way1_tag[21:0]  = dcache_tag_dout[44:23];

//================================================
//   to RDL
//================================================
assign dc_rdl_way0_vld   = way0_tag_vld;
assign dc_rdl_way1_vld   = way1_tag_vld;
assign dc_rdl_way0_dirty = way0_dirty;
assign dc_rdl_way1_dirty = way1_dirty;
assign dc_rdl_fifo       = fifo;
assign dc_rdl_way0_data[63:0] = way0_data_dout[63:0];
assign dc_rdl_way1_data[63:0] = way1_data_dout[63:0];
assign dc_rdl_way0_tag[21:0]  = dcache_tag_dout[21:0];
assign dc_rdl_way1_tag[21:0]  = dcache_tag_dout[44:23];

//==============================================================================
//                    DC pipeline 
//==============================================================================
parameter IDLE  = 3'b000;
parameter DCS   = 3'b001;
parameter FRZ   = 3'b010;
parameter REPLY = 3'b011;
parameter WFC   = 3'b100;

always@(posedge dc_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dc_cur_state[2:0] <= IDLE;
  else if (rtu_yy_xx_async_flush)
    dc_cur_state[2:0] <= IDLE;
  else
    dc_cur_state[2:0] <= dc_next_state[2:0];
end

// &CombBeg; @93
always @( ag_dc_dcache_grant
       or dc_cur_state[2:0]
       or dc_wakeup
       or dc_reply
       or lfb_dc_ld_cmplt
       or ag_dc_inst_vld
       or dc_cmplt)
begin
  case(dc_cur_state[2:0])
  IDLE: begin
    if (ag_dc_inst_vld)
      dc_next_state[2:0] = DCS;
    else
      dc_next_state[2:0] = IDLE;
  end
  DCS: begin
    if (dc_cmplt)
      dc_next_state[2:0] = ag_dc_inst_vld ? DCS : IDLE;
    else if (dc_reply & !dc_wakeup)
      dc_next_state[2:0] = FRZ;
    else if (dc_reply)
      dc_next_state[2:0] = REPLY;
    else
      dc_next_state[2:0] = WFC;
  end
  WFC: begin
    if (lfb_dc_ld_cmplt)
      dc_next_state[2:0] = ag_dc_inst_vld ? DCS : IDLE;
    else
      dc_next_state[2:0] = WFC;
  end
  FRZ: begin
    if (dc_wakeup)
      dc_next_state[2:0] = REPLY;
    else
      dc_next_state[2:0] = FRZ;
  end
  REPLY: begin
    if(ag_dc_dcache_grant)     
      dc_next_state[2:0] = DCS;
    else
      dc_next_state[2:0] = REPLY;
  end
  default: dc_next_state[2:0] = IDLE;
  endcase
// &CombEnd; @131
end


assign dc_stage_vld      =!(dc_cur_state[2:0] == IDLE);
assign dc_inst_vld       = (dc_cur_state[2:0] == DCS) & !dc_pmp_deny;
assign dc_expt_vld       = (dc_cur_state[2:0] == DCS) & dc_pmp_deny;

assign dc_stage_pipedown = (dc_cur_state[2:0] == IDLE) |
                           (dc_cur_state[2:0] == DCS) & dc_cmplt |
                           (dc_cur_state[2:0] == WFC) & lfb_dc_ld_cmplt;
assign dc_idle = !dc_stage_vld;

assign lsu_xx_ex2_ca_flush = dc_expt_vld & dc_func[3:0] == 4'b0101;

//----------------------------
//dc stall
//----------------------------
assign dc_ag_stall       = !dc_stage_pipedown;
assign dc_ag_cache_stall = dc_cur_state[2:0] == FRZ | 
                           dc_cur_state[2:0] == REPLY |
                           dc_cur_state[2:0] == WFC & !lfb_dc_ld_cmplt;
//assign lsu_mb_ex2_ca_stall = !dc_stage_pipedown;// & (!cp0_xx_async_expt_en | dc_lock_trans); 
assign lsu_mb_ex2_ca_lock  = dc_lock_trans;
//assign lsu_mb_ex2_ca_vld   = dc_stage_vld;

//for timing, cut ex2 stall
always@(posedge dc_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dc_ex2_stall <= 1'b0;
  else if (rtu_yy_xx_async_flush)
    dc_ex2_stall <= 1'b0;
  else if (ag_dc_inst_vld)
    dc_ex2_stall <= 1'b1;
  else if (dc_stage_pipedown)
    dc_ex2_stall <= 1'b0;
end

assign lsu_mb_ex2_ca_stall = dc_ex2_stall;

//----------------------------
//dc req dcache
//----------------------------
assign dc_ag_dcache_req        = dc_cur_state[2:0] == REPLY;
assign dc_ag_dcache_addr[31:0] = dc_addr[31:0];
assign dc_ag_dcache_size[1:0]  = dc_size[1:0];
assign dc_ag_func[3:0]         = dc_func[3:0];

//----------------------------
// for pmp deny
//----------------------------
assign dc_ag_pmp_mtval[31:0] = dc_addr[31:0];
assign dc_ag_pmp_ld_inst     = (dc_func[3:0] == 4'b0000) | dc_func[3];
//==========================================================
//   DC STAGE information create
//==========================================================

assign ag_dc_create_vld = dc_stage_pipedown & ag_dc_inst_vld;

always@(posedge dc_dp_clk)
begin
  if (ag_dc_create_vld | ifu_lsu_warm_up) begin
    dc_addr[31:0]    <= ag_dc_addr[31:0];
    dc_func[3:0]     <= ag_dc_func[3:0];
    dc_fls           <= ag_dc_fls;
    dc_size[1:0]     <= ag_dc_size[1:0];
    dc_ori_size[1:0] <= ag_dc_ori_size[1:0];
    dc_sign_ext      <= ag_dc_sign_ext;
    dc_dest_reg[5:0] <= ag_dc_dest_reg[5:0];
    dc_ca            <= ag_dc_ca;
    dc_buf           <= ag_dc_buf;
    dc_mach_mode     <= ag_dc_mach_mode;
    dc_bytes_vld[3:0]<= ag_dc_bytes_vld[3:0];
    dc_pmp_deny      <= ag_dc_pmp_expt;
    dc_split         <= ag_dc_split;
    dc_split_last    <= ag_dc_split_last;
    dc_split_first   <= ag_dc_split_first;
  end
end

assign ag_st_inst = !ag_dc_func[3] & ag_dc_func[0];
assign ag_dc_st_create_vld = ag_dc_create_vld & ag_st_inst;

always@(posedge dc_st_dp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dc_lm_pass <= 1'b0;
  else if (ag_dc_st_create_vld & ag_dc_func[1])
    dc_lm_pass <= ag_dc_lm_pass;
end

assign dc_fwd_lsu   = da_xx_fwd_vld  
                      & (dc_fls == da_xx_fwd_fls)
                      & (dc_src1_reg[5:0] == da_xx_fwd_preg[5:0]);

assign dc_fwd_fwb   = rtu_lsu_fgpr_wb_vld & dc_fls &
                      (dc_src1_reg[4:0] == rtu_lsu_fgpr_wb_reg[4:0]);

assign dc_st_fwd_vld = dc_stage_vld & dc_src1_depd & (dc_fwd_fwb | dc_fwd_lsu);
assign dc_st_fwd_data[DATAW-1:0] = dc_fwd_lsu ? da_xx_fwd_data[DATAW-1:0] : rtu_lsu_fgpr_wb_data[DATAW-1:0];

always@(posedge dc_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dc_src1_depd <= 1'b0;
  else if (ag_dc_st_create_vld)
    dc_src1_depd <= ag_dc_src1_depd;
  else if (dc_st_fwd_vld)
    dc_src1_depd <= 1'b0;
end

always@(posedge dc_st_dp_clk)
begin
  if (ag_dc_st_create_vld | ifu_lsu_warm_up)begin
    dc_src1_reg[5:0]    <= ag_dc_src1_reg[5:0];
    dc_wdata_shift[2:0] <= ag_dc_wdata_shift[2:0];
  end
end

always@(posedge dc_st_dp_clk)
begin
  if (ag_dc_st_create_vld | ifu_lsu_warm_up)
    dc_st_data_pre[DATAW-1:0] <= ag_dc_st_data[DATAW-1:0];
  else if (dc_st_fwd_vld)
    dc_st_data_pre[DATAW-1:0] <= dc_st_fwd_data[DATAW-1:0];
end

assign dc_st_wdata[DATAW-1:0] = dc_st_fwd_vld ? dc_st_fwd_data[DATAW-1:0] : dc_st_data_pre[DATAW-1:0];

//================================================
//     TAG COMPARE
//================================================
assign way0_tag_hit = (dcache_tag_dout[D_TAG_TAG_LEN-1:0]     == dc_addr[31:31-D_TAG_TAG_LEN+1]) & way0_tag_vld & dc_ca;
assign way1_tag_hit = (dcache_tag_dout[23+D_TAG_TAG_LEN-1:23] == dc_addr[31:31-D_TAG_TAG_LEN+1]) & way1_tag_vld & dc_ca;

//for dcache va op, but st should not access dirty ,dcache should access
//dirty, so dcache and stb can not process in paralle.
assign dcache_hit_way_dirty = way0_tag_hit & way0_dirty | way1_tag_hit & way1_dirty;
assign dcache_hit_way       = way1_tag_hit;

assign dc_cache_hit_raw     = way0_tag_hit | way1_tag_hit;
assign dc_cache_hit         = dc_cache_hit_raw & cp0_lsu_dcache_en;

//================================================
//   LD DATA SEL and Align
//================================================
//data from cache
assign dc_ld_data_from_dcache[DATAW-1:0] = {DATAW{way0_tag_hit & dc_ld_inst}} & dc_way0_data_dout[DATAW-1:0] | 
                                           {DATAW{way1_tag_hit & dc_ld_inst}} & dc_way1_data_dout[DATAW-1:0];

//data forward from VB or STB
assign dc_ld_data_fwd[DATAW-1:0] = vb_dc_ld_fwd_vld ? vb_dc_ld_data[DATAW-1:0] : stb_dc_ld_data[DATAW-1:0];
assign ld_fwd_vld                = vb_dc_ld_fwd_vld | stb_dc_ld_fwd_vld;

//================================================
//      st data
//================================================
assign dc_st_rdata[DATAW-1:0] = dc_lm_pass ? {DATAW{1'b0}} : {{(DATAW-1){1'b0}}, 1'b1};

//================================================
//      data forward and complete
//================================================
//func[3]:dcache,[2]:atomic; [1]:exclusive;[0]:ld/st
assign dc_ld_inst  = !dc_func[0] & !dc_func[3];
assign dc_st_inst  = dc_func[0]  & !dc_func[3];
assign dc_dca_inst = dc_func[3];
assign dc_lr_inst  = dc_ld_inst & dc_func[1];
assign dc_sc_inst  = dc_st_inst & dc_func[1];
assign dc_fld_inst = dc_ld_inst & dc_fls & (dc_size[1:0] == 2'b11);
assign dc_lock_trans = !dc_func[3] & (|dc_func[2:1]);

assign dc_ld_data_vld = dc_ld_cmplt;
assign dc_sc_data_vld = dc_inst_vld & !dc_st_reply & dc_sc_inst;

assign lfb_data_sel           = dc_cur_state[2:0] == WFC;
assign dc_data_sel            = dc_cur_state[2:0] == DCS;
assign dc_sc_data_sel         = dc_data_sel & dc_sc_inst;
assign dc_ld_fwd_sel          = dc_data_sel & dc_ld_inst & ld_fwd_vld;

assign lfb_dc_sc_ldfwd_sel    = lfb_data_sel | dc_sc_data_sel | dc_ld_fwd_sel;
assign lfb_dc_data[DATAW-1:0] = {DATAW{lfb_data_sel}}   & lfb_dc_ld_data[DATAW-1:0] |
                                {DATAW{dc_sc_data_sel}} & dc_st_rdata[DATAW-1:0] |
                                {DATAW{dc_ld_fwd_sel}}  & dc_ld_data_fwd[DATAW-1:0];

assign lsu_ex2_data_vld        = dc_ld_data_vld | lfb_dc_ld_data_vld | dc_sc_data_vld ;
assign lsu_ex2_data[DATAW-1:0] = lfb_dc_sc_ldfwd_sel ? lfb_dc_data[DATAW-1:0] : dc_ld_data_from_dcache[DATAW-1:0];

assign lsu_mb_ex2_ca_data_vld        = lsu_ex2_data_vld; 
assign lsu_mb_ex2_ca_data_vld_gate   = dc_inst_vld & (dc_ld_inst | dc_sc_inst) | lfb_dc_ld_data_vld;
assign lsu_mb_ex2_ca_data[DATAW-1:0] = lsu_ex2_data[DATAW-1:0]; 
assign lsu_mb_ex2_ca_dest_reg[5:0]   = dc_dest_reg[5:0]; 
assign lsu_mb_ex2_ca_fls             = dc_fls;
assign lsu_mb_ex2_ca_fld             = dc_fld_inst;
assign lsu_mb_ex2_ca_sc_data_vld     = dc_sc_inst;
assign lsu_mb_ex2_ca_split           = dc_split;
assign lsu_mb_ex2_ca_split_last      = dc_split_last;
assign lsu_mb_ex2_ca_bytes_vld[3:0]  = dc_bytes_vld[3:0];
assign lsu_mb_ex2_ca_sign_ext        = dc_sign_ext;
assign lsu_mb_ex2_ca_addr_2          = dc_addr[2];
assign lsu_mb_ex2_ca_size[1:0]       = dc_ori_size[1:0];
// &Force("nonport","dc_ori_size"); @406

//assign lsu_mb_ex2_ca_ld_vld = dc_stage_vld & dc_ld_inst;

assign lsu_top_dc_vld = dc_stage_vld;
//dc_cmplt
assign dc_ld_cmplt = dc_inst_vld & !dc_ld_reply &
                     dc_ld_inst & (dc_cache_hit | vb_dc_ld_fwd_vld);
assign dc_st_cmplt = dc_inst_vld & 
                    (dc_st_inst & !dc_st_reply | 
                     dc_dca_inst & !dc_dcache_reply);

assign dc_cmplt    = dc_ld_cmplt | 
                     dc_st_cmplt |
                     dc_expt_vld;

//async exception
assign async_expt_vld    = stb_dc_async_expt | 
                           lfb_dc_async_expt & dc_split_first;

assign async_mtval[31:0] = {32{stb_dc_async_expt}} & stb_dc_mtval[31:0] |
                           {32{lfb_dc_async_expt}} & dc_addr[31:0];

assign async_ld_inst     = lfb_dc_async_expt & dc_ld_inst & !dc_lock_trans;

assign dc_ag_async_expt_vld    = async_expt_vld;
assign dc_ag_async_mtval[31:0] = async_mtval[31:0];
assign dc_ag_async_ld_inst     = async_ld_inst;

//================================================
//   lfb create
//================================================
assign dc_lfb_create_en = dc_inst_vld & 
                         !dc_reply & 
                         !dc_cache_hit & 
                             (dc_ld_inst & ~vb_dc_ld_fwd_vld | 
                              dc_st_inst & dc_st_alct);  // | dc_amo_ld 

assign dc_lfb_create_en_gate 
                        = dc_inst_vld & 
                         !dc_cache_hit & 
                             (dc_ld_inst |
                              dc_st_inst & dc_st_alct);  // | dc_amo_ld 

assign dc_lfb_addr[31:0]    = dc_addr[31:0];
assign dc_lfb_size[1:0]     = dc_size[1:0];
assign dc_lfb_ca            = dc_ca_after & !dc_lock_trans;
assign dc_lfb_ca_raw        = dc_ca;
assign dc_lfb_buf           = dc_buf;
assign dc_lfb_mach_mode     = dc_mach_mode;
assign dc_lfb_lock_trans    = dc_lock_trans;
assign dc_lfb_inst_ld       = dc_ld_inst;
assign dc_lfb_lr_inst       = dc_lr_inst;

//================================================
//   stb create_en
//================================================
assign dc_stb_create_en      = dc_inst_vld & !dc_reply & 
                              (dc_st_inst & !dc_sc_inst | 
                               dc_dca_inst & dc_cache_hit_raw | 
                               dc_sc_inst & dc_lm_pass);
assign dc_stb_create_en_gate = dc_inst_vld & 
                              (dc_st_inst & !dc_sc_inst | 
                               dc_dca_inst | 
                               dc_sc_inst & dc_lm_pass);

assign dc_ca_after           = dc_ca & cp0_lsu_dcache_en;
assign dc_st_alct            = dc_ca_after & cp0_lsu_dcache_wa & !dc_lock_trans;
assign dc_attr[2:0]          = {dc_ca, dc_buf, dc_mach_mode};

assign dc_stb_addr[31:0]     = dc_addr[31:0];
assign dc_stb_size[1:0]      = dc_size[1:0];
assign dc_stb_dcache_inst    = dc_dca_inst;
assign dc_stb_dcache_type[1:0]= dc_func[1:0];
assign dc_stb_bytes_vld[3:0] = dc_bytes_vld[3:0];
assign dc_stb_attr[2:0]      = dc_attr[2:0];
assign dc_stb_wait_lfb       = dc_st_alct & !dc_cache_hit;
assign dc_stb_cache_hit      = dc_cache_hit;
assign dc_stb_dcache_way     = dcache_hit_way; 
assign dc_stb_dcache_dirty   = dcache_hit_way_dirty;
assign dc_stb_lock_trans     = dc_lock_trans;
assign dc_stb_sc_inst        = dc_sc_inst;
assign dc_stb_src1_depd      = dc_src1_depd & !dc_st_fwd_vld;
assign dc_stb_data[DATAW-1:0]= dc_st_wdata[DATAW-1:0];
assign dc_stb_shift[2:0]     = dc_wdata_shift[2:0];
assign dc_stb_src1_reg[4:0]  = dc_src1_reg[4:0];
assign dc_stb_fls            = dc_fls;
assign dc_stb_split_first    = dc_split_first;

//================================================
//   dc_reply
//================================================
assign dc_ld_reply = lfb_dc_busy & !dc_cache_hit |
                     lfb_dc_hit_idx |
                     stb_dc_multi_or_part_hit | 
                     stb_dc_hit_dca |
                     stb_dc_hit_idx & !dc_cache_hit |
       //              dc_amo_ld & vb_dc_hit_dirty | 
                     dc_lock_trans & (lfb_dc_busy | stb_dc_busy);

assign dc_st_reply = lfb_dc_busy & !dc_cache_hit |
                     lfb_dc_hit_idx |
                     vb_dc_hit_dirty |
                     stb_dc_full |
                     stb_dc_hit_dca |
                     stb_dc_hit_addr |
                     dc_st_alct & !dc_cache_hit & stb_dc_hit_idx;

assign dc_dcache_reply = lfb_dc_busy & !dc_cache_hit_raw |
                         (stb_dc_full | stb_dc_hit_idx) & dc_cache_hit_raw;

assign dc_reply = dc_ld_inst  & dc_ld_reply |
                  dc_st_inst  & dc_st_reply |
                  dc_dca_inst & dc_dcache_reply;

assign dc_wakeup = vb_dc_pop_en  | 
                   stb_dc_pop_en |
                   lfb_dc_pop_en | lfb_dc_ld_cmplt;

//================================================
//   address for dependency check
//================================================

assign dc_xx_addr[31:0]     = dc_addr[31:0];
assign dc_xx_bytes_vld[7:0] = (dc_size[1:0] == 2'b11) 
                            ? {dc_bytes_vld[3:0],dc_bytes_vld[3:0]}
                            : (dc_addr[2] ? {dc_bytes_vld[3:0], 4'b0000}
                                          : {4'b0000, dc_bytes_vld[3:0]});
assign dc_vb_st_amold       = dc_st_inst;// | dc_amo_ld;

assign dc_clk_en = ag_dc_inst_vld_gate | dc_stage_vld;
// &Instance("gated_clk_cell", "x_pa_lsu_dc_gated_clk"); @539
gated_clk_cell  x_pa_lsu_dc_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dc_clk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dc_clk_en         ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @540
//          .external_en (1'b0), @541
//          .global_en   (1'b1), @542
//          .module_en     (cp0_lsu_icg_en     ), @543
//          .local_en    (dc_clk_en), @544
//          .clk_out     (dc_clk)); @545

assign dc_dp_clk_en = ag_dc_inst_vld_gate | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_dc_dp_gated_clk"); @548
gated_clk_cell  x_pa_lsu_dc_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dc_dp_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dc_dp_clk_en      ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @549
//          .external_en (1'b0), @550
//          .global_en   (1'b1), @551
//          .module_en     (cp0_lsu_icg_en     ), @552
//          .local_en    (dc_dp_clk_en), @553
//          .clk_out     (dc_dp_clk)); @554

assign dc_st_dp_clk_en = ag_dc_inst_vld_gate & ag_st_inst | dc_st_fwd_vld | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_dc_st_dp_gated_clk"); @557
gated_clk_cell  x_pa_lsu_dc_st_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dc_st_dp_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dc_st_dp_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @558
//          .external_en (1'b0), @559
//          .global_en   (1'b1), @560
//          .module_en     (cp0_lsu_icg_en     ), @561
//          .local_en    (dc_st_dp_clk_en), @562
//          .clk_out     (dc_st_dp_clk)); @563

assign dc_dbginfo[14:0] = {dc_func[3:0],dc_src1_reg[5:0], dc_src1_depd, stb_dc_hit_addr, dc_cur_state[2:0]};

//================================================
//      PMU
//================================================
// &Force("output","dc_lfb_create_en"); @571
// &Force("output","dc_stb_create_en"); @572
assign ag_ld_inst = !ag_dc_func[3] & !ag_dc_func[0]; 
assign lsu_hpcp_cache_read_access  = ag_dc_create_vld & ag_ld_inst;
assign lsu_hpcp_cache_read_miss    = dc_lfb_create_en & dc_ld_inst;
assign lsu_hpcp_cache_write_access = ag_dc_create_vld & ag_st_inst; 
assign lsu_hpcp_cache_write_miss   = dc_stb_create_en & !dc_cache_hit & dc_st_inst;
assign lsu_hpcp_cache_read_access_gate  = ag_dc_inst_vld_gate & ag_ld_inst;
assign lsu_hpcp_cache_read_miss_gate    = dc_inst_vld & dc_ld_inst;
assign lsu_hpcp_cache_write_access_gate = ag_dc_inst_vld_gate & ag_st_inst; 
assign lsu_hpcp_cache_write_miss_gate   = dc_inst_vld & dc_st_inst;
// &ModuleEnd; @592
endmodule


