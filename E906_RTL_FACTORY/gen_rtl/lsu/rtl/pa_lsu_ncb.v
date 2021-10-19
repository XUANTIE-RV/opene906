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

// &ModuleBeg; @19
module pa_lsu_ncb(
  ag_dc_buf,
  ag_dc_bytes_vld,
  ag_dc_ca,
  ag_dc_dest_reg,
  ag_dc_fls,
  ag_dc_func,
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
  ag_dc_wdata_shift,
  ag_ncb_addr,
  ag_ncb_inst_vld,
  ag_ncb_inst_vld_dp,
  ag_ncb_src1_reg,
  ag_ncb_st_data,
  cp0_lsu_icg_en,
  cp0_xx_async_expt_en,
  cpurst_b,
  da_xx_fwd_data,
  da_xx_fwd_fls,
  da_xx_fwd_preg,
  da_xx_fwd_vld,
  dahbif_ncb_acc_err,
  dahbif_ncb_cmplt,
  dahbif_ncb_data,
  dahbif_ncb_grant,
  dahbif_ncb_grant_2,
  forever_cpuclk,
  ifu_lsu_warm_up,
  lsu_biu_amo_pmp_deny,
  lsu_mb_ex2_uc_addr_2,
  lsu_mb_ex2_uc_bytes_vld,
  lsu_mb_ex2_uc_data,
  lsu_mb_ex2_uc_data_vld,
  lsu_mb_ex2_uc_data_vld_gate,
  lsu_mb_ex2_uc_dest_reg,
  lsu_mb_ex2_uc_fld,
  lsu_mb_ex2_uc_fls,
  lsu_mb_ex2_uc_lock,
  lsu_mb_ex2_uc_sc_data_vld,
  lsu_mb_ex2_uc_sign_ext,
  lsu_mb_ex2_uc_size,
  lsu_mb_ex2_uc_split,
  lsu_mb_ex2_uc_split_last,
  lsu_mb_ex2_uc_stall,
  lsu_xx_ex2_uc_flush,
  ncb_ag_async_expt_vld,
  ncb_ag_async_ld_inst,
  ncb_ag_async_mtval,
  ncb_ag_pmp_ld_inst,
  ncb_ag_pmp_mtval,
  ncb_ag_stall,
  ncb_dahbif_acc_deny,
  ncb_dahbif_lock,
  ncb_dahbif_lrsc,
  ncb_dahbif_ncb_wb_addr,
  ncb_dahbif_ncb_wb_sel,
  ncb_dahbif_prot,
  ncb_dahbif_req,
  ncb_dahbif_req_dp,
  ncb_dahbif_size,
  ncb_dahbif_uc_ld_addr,
  ncb_dahbif_wdata,
  ncb_dahbif_write,
  ncb_dbginfo,
  ncb_xx_no_op,
  pad_yy_icg_scan_en,
  rtu_lsu_fgpr_wb_data,
  rtu_lsu_fgpr_wb_reg,
  rtu_lsu_fgpr_wb_vld,
  rtu_lsu_sync_req,
  rtu_yy_xx_async_flush
);

// &Ports; @20
input           ag_dc_buf;                  
input   [3 :0]  ag_dc_bytes_vld;            
input           ag_dc_ca;                   
input   [5 :0]  ag_dc_dest_reg;             
input           ag_dc_fls;                  
input   [3 :0]  ag_dc_func;                 
input           ag_dc_lm_pass;              
input           ag_dc_mach_mode;            
input   [1 :0]  ag_dc_ori_size;             
input           ag_dc_pmp_expt;             
input           ag_dc_sign_ext;             
input   [1 :0]  ag_dc_size;                 
input           ag_dc_so;                   
input           ag_dc_split;                
input           ag_dc_split_first;          
input           ag_dc_split_last;           
input           ag_dc_src1_depd;            
input   [2 :0]  ag_dc_wdata_shift;          
input   [31:0]  ag_ncb_addr;                
input           ag_ncb_inst_vld;            
input           ag_ncb_inst_vld_dp;         
input   [5 :0]  ag_ncb_src1_reg;            
input   [31:0]  ag_ncb_st_data;             
input           cp0_lsu_icg_en;             
input           cp0_xx_async_expt_en;       
input           cpurst_b;                   
input   [31:0]  da_xx_fwd_data;             
input           da_xx_fwd_fls;              
input   [5 :0]  da_xx_fwd_preg;             
input           da_xx_fwd_vld;              
input           dahbif_ncb_acc_err;         
input           dahbif_ncb_cmplt;           
input   [31:0]  dahbif_ncb_data;            
input           dahbif_ncb_grant;           
input           dahbif_ncb_grant_2;         
input           forever_cpuclk;             
input           ifu_lsu_warm_up;            
input           pad_yy_icg_scan_en;         
input   [31:0]  rtu_lsu_fgpr_wb_data;       
input   [4 :0]  rtu_lsu_fgpr_wb_reg;        
input           rtu_lsu_fgpr_wb_vld;        
input           rtu_lsu_sync_req;           
input           rtu_yy_xx_async_flush;      
output          lsu_biu_amo_pmp_deny;       
output          lsu_mb_ex2_uc_addr_2;       
output  [3 :0]  lsu_mb_ex2_uc_bytes_vld;    
output  [31:0]  lsu_mb_ex2_uc_data;         
output          lsu_mb_ex2_uc_data_vld;     
output          lsu_mb_ex2_uc_data_vld_gate; 
output  [5 :0]  lsu_mb_ex2_uc_dest_reg;     
output          lsu_mb_ex2_uc_fld;          
output          lsu_mb_ex2_uc_fls;          
output          lsu_mb_ex2_uc_lock;         
output          lsu_mb_ex2_uc_sc_data_vld;  
output          lsu_mb_ex2_uc_sign_ext;     
output  [1 :0]  lsu_mb_ex2_uc_size;         
output          lsu_mb_ex2_uc_split;        
output          lsu_mb_ex2_uc_split_last;   
output          lsu_mb_ex2_uc_stall;        
output          lsu_xx_ex2_uc_flush;        
output          ncb_ag_async_expt_vld;      
output          ncb_ag_async_ld_inst;       
output  [31:0]  ncb_ag_async_mtval;         
output          ncb_ag_pmp_ld_inst;         
output  [31:0]  ncb_ag_pmp_mtval;           
output          ncb_ag_stall;               
output          ncb_dahbif_acc_deny;        
output          ncb_dahbif_lock;            
output          ncb_dahbif_lrsc;            
output  [31:0]  ncb_dahbif_ncb_wb_addr;     
output          ncb_dahbif_ncb_wb_sel;      
output  [3 :0]  ncb_dahbif_prot;            
output          ncb_dahbif_req;             
output          ncb_dahbif_req_dp;          
output  [1 :0]  ncb_dahbif_size;            
output  [31:0]  ncb_dahbif_uc_ld_addr;      
output  [31:0]  ncb_dahbif_wdata;           
output          ncb_dahbif_write;           
output  [10:0]  ncb_dbginfo;                
output          ncb_xx_no_op;               

// &Regs; @21
reg     [1 :0]  bytes_vld_decode;           
reg             data_last;                  
reg     [1 :0]  nc_cur_state;               
reg     [1 :0]  nc_next_state;              
reg     [31:0]  ncb_addr;                   
reg     [3 :0]  ncb_bytes_vld;              
reg     [5 :0]  ncb_dest_reg;               
reg             ncb_fls;                    
reg             ncb_ld_inst;                
reg             ncb_lock;                   
reg             ncb_lrsc;                   
reg     [1 :0]  ncb_ori_size;               
reg             ncb_pmp_expt;               
reg     [3 :0]  ncb_prot;                   
reg             ncb_sign_ext;               
reg     [1 :0]  ncb_size;                   
reg             ncb_split;                  
reg             ncb_split_first;            
reg             ncb_split_last;             
reg             req_cnt;                    
reg             uc_ex2_stall;               
reg             wb_addr_pmp_deny;           
reg             wb_addr_pop_ptr;            
reg             wb_addr_sc_fail;            
reg             wb_create_ptr;              
reg             wb_data_pop_ptr;            
reg     [31:0]  wb_dbus_addr;               
reg     [5 :0]  wb_dbus_dest_preg;          
reg             wb_dbus_fls;                
reg             wb_dbus_lock;               
reg             wb_dbus_lrsc;               
reg     [3 :0]  wb_dbus_prot;               
reg             wb_dbus_req;                
reg     [1 :0]  wb_dbus_size;               
reg     [31:0]  wb_dbus_wdata_pre;          

// &Wires; @22
wire            ag_dc_buf;                  
wire    [3 :0]  ag_dc_bytes_vld;            
wire            ag_dc_ca;                   
wire    [5 :0]  ag_dc_dest_reg;             
wire            ag_dc_fls;                  
wire    [3 :0]  ag_dc_func;                 
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
wire    [2 :0]  ag_dc_wdata_shift;          
wire            ag_dca_inst;                
wire            ag_ld_hit_wb;               
wire            ag_ld_hit_wb_f;             
wire            ag_ld_inst;                 
wire            ag_ld_req;                  
wire            ag_ld_req_dp;               
wire            ag_ld_sel;                  
wire            ag_lock_inst;               
wire            ag_lr_inst;                 
wire            ag_lrsc_inst;               
wire    [31:0]  ag_ncb_addr;                
wire            ag_ncb_inst_vld;            
wire            ag_ncb_inst_vld_dp;         
wire    [5 :0]  ag_ncb_src1_reg;            
wire    [31:0]  ag_ncb_st_data;             
wire    [3 :0]  ag_prot;                    
wire            ag_sc_inst;                 
wire            ag_st_inst;                 
wire            ag_st_req;                  
wire            ag_st_req_dp;               
wire            block_acc_en;               
wire            cp0_lsu_icg_en;             
wire            cp0_xx_async_expt_en;       
wire            cpurst_b;                   
wire    [31:0]  da_xx_fwd_data;             
wire            da_xx_fwd_fls;              
wire    [5 :0]  da_xx_fwd_preg;             
wire            da_xx_fwd_vld;              
wire            dahbif_ncb_acc_err;         
wire            dahbif_ncb_cmplt;           
wire    [31:0]  dahbif_ncb_data;            
wire            dahbif_ncb_grant;           
wire            dahbif_ncb_grant_2;         
wire            forever_cpuclk;             
wire            ifu_lsu_warm_up;            
wire    [31:0]  ld_data;                    
wire    [1 :0]  ld_hit_wb;                  
wire    [1 :0]  ld_hit_wb_f;                
wire            ld_sc_pass_data_vld;        
wire            ld_sc_pass_data_vld_gate;   
wire            ld_stall;                   
wire            ld_stall_dp;                
wire            lock_stall;                 
wire            lock_stall_dp;              
wire            lsu_biu_amo_pmp_deny;       
wire            lsu_ex2_addr_2;             
wire    [3 :0]  lsu_ex2_bytes_vld;          
wire            lsu_ex2_data_vld;           
wire            lsu_ex2_data_vld_gate;      
wire    [5 :0]  lsu_ex2_dest_reg;           
wire            lsu_ex2_fld;                
wire            lsu_ex2_fls;                
wire            lsu_ex2_lock;               
wire            lsu_ex2_sign_ext;           
wire    [1 :0]  lsu_ex2_size;               
wire            lsu_ex2_split;              
wire            lsu_ex2_split_last;         
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
wire            lsu_xx_ex2_uc_flush;        
wire    [31:0]  nc_addr;                    
wire            nc_burst;                   
wire    [3 :0]  nc_bytes_vld;               
wire            nc_cur_err;                 
wire            nc_cur_rdy;                 
wire            nc_cur_rdy_dp;              
wire            nc_cur_wfc;                 
wire            nc_cur_wfg;                 
wire    [5 :0]  nc_dest_reg;                
wire            nc_fls;                     
wire            nc_ld;                      
wire            nc_lock;                    
wire            nc_lrsc;                    
wire    [1 :0]  nc_ori_size;                
wire            nc_pmp_expt;                
wire    [3 :0]  nc_prot;                    
wire            nc_req_vld;                 
wire            nc_req_vld_dp;              
wire            nc_sign_ext;                
wire    [1 :0]  nc_size;                    
wire            nc_split;                   
wire            nc_split_first;             
wire            nc_split_last;              
wire            nc_st;                      
wire            ncb_ag_async_expt_vld;      
wire            ncb_ag_async_ld_inst;       
wire    [31:0]  ncb_ag_async_mtval;         
wire            ncb_ag_pmp_ld_inst;         
wire    [31:0]  ncb_ag_pmp_mtval;           
wire            ncb_ag_stall;               
wire            ncb_burst;                  
wire            ncb_clk;                    
wire            ncb_clk_en;                 
wire            ncb_cmplt;                  
wire            ncb_cmplt_norm;             
wire            ncb_create_en;              
wire            ncb_create_en_gate;         
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
wire            ncb_dp_clk;                 
wire            ncb_dp_clk_en;              
wire            ncb_fld;                    
wire            ncb_idle;                   
wire            ncb_ld_create_en;           
wire            ncb_ld_create_en_gate;      
wire            ncb_ld_dp_clk;              
wire            ncb_ld_dp_clk_en;           
wire            ncb_sc_inst;                
wire            ncb_st_inst;                
wire            ncb_vld;                    
wire            ncb_wb_cmplt;               
wire            ncb_wb_grant;               
wire            ncb_xx_no_op;               
wire            pad_yy_icg_scan_en;         
wire            req_done;                   
wire    [31:0]  rtu_lsu_fgpr_wb_data;       
wire    [4 :0]  rtu_lsu_fgpr_wb_reg;        
wire            rtu_lsu_fgpr_wb_vld;        
wire            rtu_lsu_sync_req;           
wire            rtu_yy_xx_async_flush;      
wire    [31:0]  sc_data;                    
wire    [1 :0]  shift_from_bytes;           
wire            st_stall;                   
wire            st_stall_dp;                
wire    [1 :0]  wb_addr_pop_en;             
wire            wb_addr_pop_vld;            
wire            wb_clk;                     
wire            wb_clk_en;                  
wire    [31:0]  wb_create_addr;             
wire            wb_create_buf;              
wire    [7 :0]  wb_create_bytes_vld;        
wire            wb_create_ca;               
wire    [31:0]  wb_create_data;             
wire    [5 :0]  wb_create_dest_preg;        
wire            wb_create_dw;               
wire    [1 :0]  wb_create_en;               
wire    [1 :0]  wb_create_en_dp;            
wire            wb_create_fls;              
wire            wb_create_lock;             
wire            wb_create_mach_mode;        
wire            wb_create_pmp_deny;         
wire            wb_create_sc_fail;          
wire            wb_create_sc_inst;          
wire    [3 :0]  wb_create_shift;            
wire    [2 :0]  wb_create_shift_raw;        
wire    [1 :0]  wb_create_size;             
wire            wb_create_so;               
wire            wb_create_split_first;      
wire            wb_create_src1_depd;        
wire    [5 :0]  wb_create_src1_reg;         
wire            wb_create_vld;              
wire            wb_create_vld_dp;           
wire            wb_data_entry_vld;          
wire            wb_data_pmp_deny;           
wire    [1 :0]  wb_data_pop_en;             
wire            wb_data_pop_vld;            
wire            wb_data_sc_fail;            
wire            wb_dbus_req_vld;            
wire            wb_dbus_split_first;        
wire    [31:0]  wb_dbus_wdata;              
wire            wb_empty;                   
wire    [31:0]  wb_entry0_addr;             
wire    [2 :0]  wb_entry0_dbginfo;          
wire    [5 :0]  wb_entry0_dest_preg;        
wire    [3 :0]  wb_entry0_prot;             
wire    [2 :0]  wb_entry0_shift;            
wire    [1 :0]  wb_entry0_size;             
wire    [31:0]  wb_entry0_wdata;            
wire    [31:0]  wb_entry1_addr;             
wire    [2 :0]  wb_entry1_dbginfo;          
wire    [5 :0]  wb_entry1_dest_preg;        
wire    [3 :0]  wb_entry1_prot;             
wire    [2 :0]  wb_entry1_shift;            
wire    [1 :0]  wb_entry1_size;             
wire    [31:0]  wb_entry1_wdata;            
wire    [1 :0]  wb_entry_addr_vld;          
wire    [1 :0]  wb_entry_data_vld;          
wire    [1 :0]  wb_entry_fls;               
wire    [1 :0]  wb_entry_lock;              
wire    [1 :0]  wb_entry_lrsc;              
wire    [1 :0]  wb_entry_pmp_deny;          
wire    [1 :0]  wb_entry_sc_fail;           
wire    [1 :0]  wb_entry_split_first;       
wire    [1 :0]  wb_entry_vld;               
wire            wb_full;                    
wire            wb_lock;                    
wire    [31:0]  wb_pmp_addr;                
wire            wb_pmp_deny;                
wire            wb_req_vld;                 
wire            wb_sc_fail_vld;             
wire            wb_sc_req;                  
wire            wb_so;                      
wire    [1 :0]  wb_so_req;                  
wire    [31:0]  wb_wdata;                   
wire    [2 :0]  wb_wdata_shift;             


parameter DATAW = `FLEN;
//======================================
//    NCB STALL
//======================================
// &Force("bus","ag_dc_func",3,0); @28

assign block_acc_en   = !cp0_xx_async_expt_en | ncb_lock;
assign ag_ld_hit_wb   = |ld_hit_wb[1:0];
assign ag_ld_hit_wb_f = |ld_hit_wb_f[1:0];
assign wb_so          = |wb_so_req[1:0];
assign wb_pmp_deny    = |(wb_entry_vld[1:0] & wb_entry_pmp_deny[1:0]);
assign wb_lock        = |(wb_entry_vld[1:0] & wb_entry_lock[1:0]);

assign ag_st_inst     =  ag_dc_func[0] & !ag_dc_func[3];
assign ag_ld_inst     = !ag_dc_func[0] & !ag_dc_func[3];
assign ag_lock_inst   = !ag_dc_func[3] & (ag_dc_func[1] | ag_dc_func[2]);

//1,AG is amo.ld/st or lr/sr -> ag_inst_lock
//  lock should wait all preceeding requests done

assign lock_stall    = !nc_cur_rdy | !wb_empty;
assign lock_stall_dp = !nc_cur_rdy_dp | !wb_empty;

//2.AG is normal load
//  a)nc_fsm_busy
//  b)wb has higher priority
//     i)  address hit wb
//     ii) wb request with pmp_deny, or request if amo.st or sc, or request address is strong order

assign ld_stall =  ag_ld_hit_wb_f | ag_ld_hit_wb |
                   wb_pmp_deny | wb_lock | wb_so;

assign ld_stall_dp = ag_ld_hit_wb_f | 
                     wb_pmp_deny | wb_lock | wb_so;

// 3.AG is normal store
//   a) wb full
//   b) wb request with pmp_deny or wb request is amo.st or sc
//   c) for precise exception, to make sure that no followed store has been created into WB
//      when ncb return access error, store must not be created into WB until ncb_ld is empty

assign st_stall    = wb_full | 
                     wb_pmp_deny | wb_lock |
                     block_acc_en & !nc_cur_rdy;

assign st_stall_dp = wb_full | 
                     wb_pmp_deny | wb_lock |
                     block_acc_en & !nc_cur_rdy_dp;

//ncb_ag_stall
assign ncb_ag_stall = ag_lock_inst 
                    ? lock_stall
                    : (ag_st_inst ? st_stall 
                                  : (!nc_cur_rdy | ld_stall));

assign ncb_xx_no_op = ncb_idle & wb_empty;


//==============================================================================
//                  write buffer for store
//==============================================================================
assign ag_st_req    = ag_ncb_inst_vld & ag_st_inst & 
                      (ag_lock_inst & !lock_stall |
                      !ag_lock_inst & !st_stall);

assign ag_st_req_dp = ag_ncb_inst_vld_dp & ag_st_inst & 
                      (ag_lock_inst & !lock_stall_dp |
                      !ag_lock_inst & !st_stall_dp);

//================================================
//  write buffer: create pointer
//================================================

assign wb_create_vld    = ag_st_req; 
assign wb_create_vld_dp = ag_st_req_dp;

always@(posedge wb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wb_create_ptr <= 1'b0;
  else if (rtu_yy_xx_async_flush)
    wb_create_ptr <= 1'b0;
  else if (wb_create_vld)
    wb_create_ptr <= ~wb_create_ptr;
end

assign wb_create_en[1:0]        = {wb_create_ptr,~wb_create_ptr} & {2{wb_create_vld}};
assign wb_create_en_dp[1:0]     = {wb_create_ptr,~wb_create_ptr} & {2{wb_create_vld_dp}};
assign wb_create_addr[31:0]     = ag_ncb_addr[31:0];
assign wb_create_size[1:0]      = ag_dc_size[1:0];
assign wb_create_ca             = ag_dc_ca;       
assign wb_create_buf            = ag_dc_buf;
assign wb_create_so             = ag_dc_so;
assign wb_create_mach_mode      = ag_dc_mach_mode;
assign wb_create_lock           = ag_dc_func[2] | ag_dc_func[1];
assign wb_create_sc_inst        = ag_dc_func[1];
assign wb_create_pmp_deny       = ag_dc_pmp_expt;
assign wb_create_sc_fail        = ag_sc_inst & !ag_dc_lm_pass;
assign wb_create_dest_preg[5:0] = ag_dc_dest_reg[5:0];
assign wb_create_fls            = ag_dc_fls;
assign wb_create_split_first    = ag_dc_split_first;

assign wb_create_dw             = ag_dc_size[1:0] == 2'b11;
assign wb_create_bytes_vld[7:0] = ag_ncb_addr[2] 
                                ? {ag_dc_bytes_vld[3:0],4'b0000}
                                : {{4{wb_create_dw}}, ag_dc_bytes_vld[3:0]};

assign wb_create_src1_reg[5:0]  = ag_ncb_src1_reg[5:0];
assign wb_create_src1_depd      = ag_dc_src1_depd;
assign wb_create_data[DATAW-1:0]= ag_ncb_st_data[DATAW-1:0];

// &CombBeg; @135
always @( ag_dc_bytes_vld[3:0])
begin
  casez(ag_dc_bytes_vld[3:0])
  4'b???1: bytes_vld_decode[1:0] = 2'b00;
  4'b??10: bytes_vld_decode[1:0] = 2'b01;
  4'b?100: bytes_vld_decode[1:0] = 2'b10;
  4'b1000: bytes_vld_decode[1:0] = 2'b11;
  default: bytes_vld_decode[1:0] = 2'b00;
  endcase
// &CombEnd; @143
end

// &Force("bus","ag_dc_wdata_shift",2,0); @153
assign shift_from_bytes[1:0] = bytes_vld_decode[1:0];
assign wb_create_shift_raw[2:0] = {1'b0,shift_from_bytes[1:0]} + (3'b100 - {1'b0,ag_dc_wdata_shift[1:0]});
assign wb_create_shift[1:0]  = wb_create_shift_raw[1:0];
assign wb_create_shift[3:2]  = 2'b0;

//wb_full
assign wb_full  = &(wb_entry_vld[1:0] & ~wb_data_pop_en[1:0]);
assign wb_empty = !(|wb_entry_vld[1:0]);

//================================================
//     address pop ptr
//================================================
assign wb_addr_pop_vld = ncb_wb_grant | 
                         wb_dbus_req & (wb_addr_pmp_deny | wb_addr_sc_fail);

always@(posedge wb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wb_addr_pop_ptr <= 1'b0;
  else if (rtu_yy_xx_async_flush)
    wb_addr_pop_ptr <= 1'b0;
  else if (wb_addr_pop_vld)
    wb_addr_pop_ptr <= ~wb_addr_pop_ptr;
end

assign wb_addr_pop_en[1:0] = {wb_addr_pop_ptr,~wb_addr_pop_ptr} & {2{wb_addr_pop_vld}};

// &CombBeg; @182
always @( wb_entry_addr_vld[1:0]
       or wb_entry_sc_fail[1:0]
       or wb_entry_lrsc[1:0]
       or wb_entry_fls[1:0]
       or wb_entry1_dest_preg[5:0]
       or wb_addr_pop_ptr
       or wb_entry0_prot[3:0]
       or wb_entry1_prot[3:0]
       or wb_entry0_addr[31:0]
       or wb_entry1_size[1:0]
       or wb_entry0_dest_preg[5:0]
       or wb_entry_lock[1:0]
       or wb_entry0_size[1:0]
       or wb_entry1_addr[31:0]
       or wb_entry_pmp_deny[1:0])
begin
  case(wb_addr_pop_ptr)
    1'b0 :  begin
            wb_dbus_req        = wb_entry_addr_vld[0];
            wb_dbus_addr[31:0] = wb_entry0_addr[31:0];                
            wb_dbus_prot[3:0]  = wb_entry0_prot[3:0];
            wb_dbus_size[1:0]  = wb_entry0_size[1:0];
            wb_dbus_fls        = wb_entry_fls[0];
            wb_dbus_lock       = wb_entry_lock[0];
            wb_dbus_lrsc       = wb_entry_lrsc[0];
            wb_addr_pmp_deny   = wb_entry_pmp_deny[0];
            wb_addr_sc_fail    = wb_entry_sc_fail[0];
            wb_dbus_dest_preg[5:0] = wb_entry0_dest_preg[5:0];
            end
    1'b1 :  begin
            wb_dbus_req        = wb_entry_addr_vld[1];
            wb_dbus_addr[31:0] = wb_entry1_addr[31:0];                
            wb_dbus_prot[3:0]  = wb_entry1_prot[3:0];
            wb_dbus_size[1:0]  = wb_entry1_size[1:0];
            wb_dbus_fls        = wb_entry_fls[1];
            wb_dbus_lock       = wb_entry_lock[1];
            wb_dbus_lrsc       = wb_entry_lrsc[1];
            wb_addr_pmp_deny   = wb_entry_pmp_deny[1];
            wb_addr_sc_fail    = wb_entry_sc_fail[1];
            wb_dbus_dest_preg[5:0] = wb_entry1_dest_preg[5:0];
            end
    default:begin
            wb_dbus_req        = 1'b0;
            wb_dbus_addr[31:0] = {32{1'bx}};             
            wb_dbus_prot[3:0]  = {4{1'bx}};
            wb_dbus_size[1:0]  = {2{1'bx}};
            wb_dbus_fls        = 1'bx;
            wb_dbus_lock       = 1'bx;
            wb_dbus_lrsc       = 1'bx;
            wb_addr_pmp_deny   = 1'bx;
            wb_addr_sc_fail    = 1'bx;
            wb_dbus_dest_preg[5:0] = {6{1'bx}};
            end
  endcase
// &CombEnd; @221
end

assign wb_dbus_split_first = wb_entry_split_first[wb_addr_pop_ptr];

assign wb_dbus_req_vld = wb_dbus_req & !wb_addr_pmp_deny & !wb_addr_sc_fail;

//================================================
//     data pop ptr
//================================================
assign wb_data_pop_vld = ncb_wb_cmplt | 
                         wb_data_entry_vld & (wb_data_pmp_deny | wb_data_sc_fail);

always@(posedge wb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wb_data_pop_ptr <= 1'b0;
  else if (rtu_yy_xx_async_flush)
    wb_data_pop_ptr <= 1'b0;
  else if (wb_data_pop_vld)
    wb_data_pop_ptr <= ~wb_data_pop_ptr;
end

assign wb_data_pop_en[1:0] = {wb_data_pop_ptr, ~wb_data_pop_ptr} & {2{wb_data_pop_vld}};

assign wb_data_entry_vld   = wb_entry_data_vld[wb_data_pop_ptr];
assign wb_data_pmp_deny    = wb_entry_pmp_deny[wb_data_pop_ptr]; 
assign wb_data_sc_fail     = wb_entry_sc_fail[wb_data_pop_ptr];
assign wb_wdata[DATAW-1:0] = wb_data_pop_ptr ? wb_entry1_wdata[DATAW-1:0] : wb_entry0_wdata[DATAW-1:0];
assign wb_wdata_shift[2:0] = wb_data_pop_ptr ? wb_entry1_shift[2:0]       : wb_entry0_shift[2:0];

// &CombBeg; @252
// &CombEnd; @264
// &CombBeg; @271
always @( wb_wdata[31:0]
       or wb_wdata_shift[1:0])
begin
  case(wb_wdata_shift[1:0])
    2'b00:   wb_dbus_wdata_pre[31:0] = wb_wdata[31:0];
    2'b01:   wb_dbus_wdata_pre[31:0] = {wb_wdata[23:0], wb_wdata[31:24]};
    2'b10:   wb_dbus_wdata_pre[31:0] = {wb_wdata[15:0], wb_wdata[31:16]};
    2'b11:   wb_dbus_wdata_pre[31:0] = {wb_wdata[7:0],  wb_wdata[31:8]};
    default: wb_dbus_wdata_pre[31:0] = wb_wdata[31:0];
  endcase
// &CombEnd; @279
end

assign wb_dbus_wdata[31:0] = wb_dbus_wdata_pre[31:0];


//==============================================================================
//                           NCB
//==============================================================================
assign ag_lr_inst   =  ag_dc_func[1] & !ag_dc_func[0]; 
assign ag_sc_inst   =  ag_dc_func[1] &  ag_dc_func[0];
assign ag_lrsc_inst =  ag_lr_inst | ag_sc_inst;
assign ag_dca_inst  = ag_dc_func[3];

assign ag_prot[3:0] = {ag_dc_ca, ag_dc_buf, ag_dc_mach_mode, 1'b1};

assign ag_ld_req    = ag_ncb_inst_vld & ag_ld_inst & 
                      (ag_lock_inst & wb_empty |
                      !ag_lock_inst & !ld_stall);

assign ag_ld_req_dp = ag_ncb_inst_vld_dp & (ag_ld_inst | ag_dca_inst) &
                      !rtu_lsu_sync_req & 
                      (ag_lock_inst & wb_empty |
                      !ag_lock_inst & !ld_stall_dp);

//================================================
//         request arbitration
//================================================

assign ag_ld_sel        = ag_ld_req_dp & nc_cur_rdy_dp | ifu_lsu_warm_up;

assign wb_req_vld       = !ag_ld_sel & wb_dbus_req_vld;

assign nc_req_vld       = ag_ld_sel ? ag_ld_req : wb_req_vld; 
assign nc_req_vld_dp    = ag_ld_sel | wb_req_vld; 
assign nc_addr[31:0]    = ag_ld_sel ? ag_ncb_addr[31:0]   : wb_dbus_addr[31:0];
assign nc_size[1:0]     = ag_ld_sel ? ag_dc_size[1:0]     : wb_dbus_size[1:0];
assign nc_ori_size[1:0] = ag_ld_sel ? ag_dc_ori_size[1:0] : wb_dbus_size[1:0];
assign nc_fls           = ag_ld_sel ? ag_dc_fls           : wb_dbus_fls;
assign nc_prot[3:0]     = ag_ld_sel ? ag_prot[3:0]        : wb_dbus_prot[3:0];
assign nc_lock          = ag_ld_sel ? ag_lock_inst        : wb_dbus_lock;
assign nc_lrsc          = ag_ld_sel ? ag_lrsc_inst        : wb_dbus_lrsc;
assign nc_pmp_expt      = ag_ld_sel & ag_dc_pmp_expt;
assign nc_ld            = ag_ld_sel;
assign nc_st            =!ag_ld_sel;
assign nc_split         = ag_ld_sel & ag_dc_split;
assign nc_split_last    = ag_ld_sel & ag_dc_split_last;
assign nc_split_first   = ag_ld_sel ? ag_dc_split_first : wb_dbus_split_first;

assign nc_sign_ext       = ag_ld_sel & ag_dc_sign_ext;
assign nc_dest_reg[5:0]  = ag_ld_sel ? ag_dc_dest_reg[5:0] : wb_dbus_dest_preg[5:0];
assign nc_bytes_vld[3:0] = {4{ag_ld_sel}} & ag_dc_bytes_vld[3:0];

assign ncb_wb_grant    = nc_cur_rdy & wb_req_vld;
assign ncb_wb_cmplt    = ncb_st_inst & ncb_cmplt;

//==========================================================
//     NCB REQ BUS FSM
//==========================================================
parameter NC_REQ = 2'b00;
parameter NC_WFG = 2'b01;
parameter NC_WFC = 2'b10;
parameter NC_ERR = 2'b11;

always@(posedge ncb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    nc_cur_state[1:0] <= NC_REQ;
  else if (rtu_yy_xx_async_flush)
    nc_cur_state[1:0] <= NC_REQ;
  else
    nc_cur_state[1:0] <= nc_next_state[1:0];
end

// &CombBeg; @353
always @( nc_cur_state[1:0]
       or nc_req_vld
       or data_last
       or dahbif_ncb_cmplt
       or dahbif_ncb_acc_err
       or dahbif_ncb_grant)
begin
  case(nc_cur_state[1:0])
    NC_REQ: begin
      if (nc_req_vld)
        nc_next_state[1:0] = dahbif_ncb_grant ? NC_WFC : NC_WFG;
      else
        nc_next_state[1:0] = NC_REQ;
    end
    NC_WFG: begin
      if (dahbif_ncb_grant)
        nc_next_state[1:0] = NC_WFC;
      else
        nc_next_state[1:0] = NC_WFG;
    end
    NC_WFC: begin
      if (dahbif_ncb_acc_err) 
        nc_next_state[1:0] = NC_ERR;
      else if (dahbif_ncb_cmplt & data_last & nc_req_vld)
          nc_next_state[1:0] = dahbif_ncb_grant ? NC_WFC : NC_WFG;
      else if (dahbif_ncb_cmplt & data_last) 
        nc_next_state[1:0] = NC_REQ;
      else
        nc_next_state[1:0] = NC_WFC;
    end
    NC_ERR: begin
      nc_next_state[1:0] = NC_REQ;
    end
    default: nc_next_state[1:0] = NC_REQ;
  endcase
// &CombEnd; @382
end

assign ncb_cmplt_norm = nc_cur_wfc & 
                        dahbif_ncb_cmplt & data_last & 
                       !dahbif_ncb_acc_err;

assign ncb_cmplt     = ncb_cmplt_norm | nc_cur_err;

assign nc_cur_rdy    = ncb_idle | ncb_cmplt_norm;
assign nc_cur_rdy_dp = ncb_idle | nc_cur_wfc & data_last & req_done;

assign nc_cur_wfg  = nc_cur_state[1:0] == NC_WFG;
assign nc_cur_wfc  = nc_cur_state[1:0] == NC_WFC;
assign nc_cur_err  = nc_cur_state[1:0] == NC_ERR;
assign ncb_idle    = nc_cur_state[1:0] == NC_REQ;
assign ncb_vld     = !ncb_idle;

always@(posedge ncb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    data_last <= 1'b0;
  else if (ncb_dahbif_req & dahbif_ncb_grant)
    data_last <= !nc_burst;
  else if (dahbif_ncb_cmplt)
    data_last <= 1'b1;
end

always@(posedge ncb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    req_cnt <= 1'b0;
  else if (ncb_dahbif_req)
    req_cnt <= dahbif_ncb_grant ? 1'b1 : 1'b0;
  else if (!ncb_idle & dahbif_ncb_grant_2 & ncb_burst)
    req_cnt <= ~req_cnt;
end

assign req_done = ~ncb_burst | ~req_cnt;

//======================================
//  request address and control
//======================================
//ncb should not be updated when req is granted by dahbif, since information
//like split or preg, size and so on should be used when it return data to RTU

assign ncb_create_en      = nc_cur_rdy & nc_req_vld_dp;
assign ncb_create_en_gate = nc_cur_rdy_dp & nc_req_vld_dp;

always@(posedge ncb_dp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncb_addr[31:0] <= 32'b0;
  else if (ncb_create_en)
    ncb_addr[31:0] <= nc_addr[31:0];
end

always@(posedge ncb_dp_clk)
begin
  if (ncb_create_en | ifu_lsu_warm_up) begin
    ncb_size[1:0]     <= nc_size[1:0];
    ncb_ori_size[1:0] <= nc_ori_size[1:0];
    ncb_fls           <= nc_fls;
    ncb_prot[3:0]     <= nc_prot[3:0];
    ncb_lock          <= nc_lock;
    ncb_lrsc          <= nc_lrsc;
    ncb_ld_inst       <= nc_ld;
    ncb_pmp_expt      <= nc_pmp_expt;
    ncb_split         <= nc_split;
    ncb_split_first   <= nc_split_first;
  end
end

assign ncb_ld_create_en      = nc_cur_rdy & 
                              (ag_ld_sel | wb_req_vld & wb_dbus_lrsc);
assign ncb_ld_create_en_gate = nc_cur_rdy_dp & 
                              (ag_ld_sel | wb_req_vld & wb_dbus_lrsc);

always@(posedge ncb_ld_dp_clk)
begin
  if (ncb_ld_create_en | ifu_lsu_warm_up) begin
    ncb_sign_ext      <= nc_sign_ext;
    ncb_dest_reg[5:0] <= nc_dest_reg[5:0];
    ncb_bytes_vld[3:0]<= nc_bytes_vld[3:0];
    ncb_split_last    <= nc_split_last;
  end
end

// &Force("output", "ncb_dahbif_size"); @517
assign nc_burst = ncb_dahbif_size[1:0] == 2'b11;
assign ncb_burst = ncb_size[1:0] == 2'b11;


assign ncb_st_inst   = !ncb_ld_inst;
assign ncb_sc_inst   =  ncb_st_inst & ncb_lrsc;

//======================================
//   LSU BMU 
//======================================
// &Force("output", "ncb_dahbif_req"); @528

assign ncb_dahbif_req_dp      = nc_cur_wfg | nc_cur_rdy_dp & nc_req_vld_dp;
assign ncb_dahbif_req         = nc_cur_wfg | nc_cur_rdy_dp & nc_req_vld;
assign ncb_dahbif_write       = nc_cur_rdy_dp ? nc_st         : ncb_st_inst;
assign ncb_dahbif_prot[3:0]   = nc_cur_rdy_dp ? nc_prot[3:0]  : ncb_prot[3:0];
assign ncb_dahbif_size[1:0]   = nc_cur_rdy_dp ? nc_size[1:0]  : ncb_size[1:0];
assign ncb_dahbif_lock        = nc_cur_rdy_dp ? nc_lock       : ncb_lock;
assign ncb_dahbif_lrsc        = nc_cur_rdy_dp ? nc_lrsc       : ncb_lrsc;
assign ncb_dahbif_acc_deny    = nc_cur_rdy_dp ? nc_pmp_expt   : ncb_pmp_expt;
assign ncb_dahbif_wdata[31:0] = wb_dbus_wdata[31:0];

//for address timing
assign ncb_dahbif_ncb_wb_sel        = !ag_ld_sel | !nc_cur_rdy_dp;
assign ncb_dahbif_ncb_wb_addr[31:0] = nc_cur_rdy_dp ? wb_dbus_addr[31:0] : ncb_addr[31:0];
assign ncb_dahbif_uc_ld_addr[31:0]  = ag_ncb_addr[31:0];

//to biu, for pmp_deny timing, lock_fsm in BIU will start up, even when there
//is pmp deny, which will be flushed when this amo.ld is granted from biu.
assign lsu_biu_amo_pmp_deny = !ncb_idle & ncb_lock & !ncb_lrsc & ncb_pmp_expt;

//======================================
//   LSU RTU DATA
//======================================
// &Instance("gated_clk_cell", "x_pa_lsu_ncb_rdata_gated_clk"); @554
// &Connect(.clk_in      (forever_cpuclk), @555
//          .external_en (1'b0), @556
//          .global_en   (1'b1), @557
//          .module_en     (cp0_lsu_icg_en     ), @558
//          .local_en    (ncb_rdata_clk_en), @559
//          .clk_out     (ncb_rdata_clk)); @560
assign ncb_fld        = 1'b0;
assign ld_data[31:0]  = dahbif_ncb_data[31:0];

assign wb_sc_req      = |(wb_entry_vld[1:0] & wb_entry_lrsc[1:0]);
assign wb_sc_fail_vld = wb_data_entry_vld & wb_data_sc_fail & ncb_idle & !wb_data_pmp_deny;

assign sc_data[DATAW-1:0]      = wb_sc_fail_vld 
                               ? {{(DATAW-1){1'b0}},1'b1} 
                               : {DATAW{1'b0}};

assign ld_sc_pass_data_vld      = (ncb_ld_inst | ncb_sc_inst) & 
                                  !ncb_pmp_expt & ncb_cmplt;
assign ld_sc_pass_data_vld_gate = (ncb_ld_inst | ncb_sc_inst) & 
                                  !ncb_pmp_expt & (nc_cur_wfc | nc_cur_err);

assign lsu_ex2_data_vld        = ld_sc_pass_data_vld | wb_sc_fail_vld;
assign lsu_ex2_data_vld_gate   = ld_sc_pass_data_vld_gate | wb_sc_fail_vld;

assign lsu_ex2_dest_reg[5:0]   = (wb_sc_req & ncb_idle) ? wb_dbus_dest_preg[5:0] : ncb_dest_reg[5:0];
assign lsu_ex2_fls             = (wb_sc_req & ncb_idle) ? wb_dbus_fls : ncb_fls;
assign lsu_ex2_fld             = (wb_sc_req & ncb_idle) ? 1'b0 : ncb_fld;
assign lsu_ex2_split           = (wb_sc_req & ncb_idle) ? 1'b0 : ncb_split;
assign lsu_ex2_split_last      = (wb_sc_req & ncb_idle) ? 1'b0 : ncb_split_last;
assign lsu_ex2_bytes_vld[3:0]  = (wb_sc_req & ncb_idle) ? 4'b1111 : ncb_bytes_vld[3:0];
assign lsu_ex2_sign_ext        = (wb_sc_req & ncb_idle) ? 1'b0 : ncb_sign_ext;
assign lsu_ex2_addr_2          = (wb_sc_req & ncb_idle) ? wb_dbus_addr[2] : ncb_addr[2];
assign lsu_ex2_lock            = ncb_lock;
assign lsu_ex2_size[1:0]       = (wb_sc_req & ncb_idle) ? 2'b10 : ncb_ori_size[1:0];
// &Force("nonport", "ncb_ori_size"); @614

assign lsu_mb_ex2_uc_data_vld           = lsu_ex2_data_vld;
assign lsu_mb_ex2_uc_data_vld_gate      = lsu_ex2_data_vld_gate;
assign lsu_mb_ex2_uc_data[DATAW-1:0]    = wb_sc_req ? sc_data[DATAW-1:0] : ld_data[DATAW-1:0];
assign lsu_mb_ex2_uc_sc_data_vld        = wb_sc_req;
//assign lsu_mb_ex2_uc_ld_data[DATAW-1:0] = ld_data[DATAW-1:0];
//assign lsu_mb_ex2_uc_sc_data[DATAW-1:0] = sc_data[DATAW-1:0];
assign lsu_mb_ex2_uc_dest_reg[5:0]      = lsu_ex2_dest_reg[5:0];
assign lsu_mb_ex2_uc_fls                = lsu_ex2_fls;
assign lsu_mb_ex2_uc_fld                = lsu_ex2_fld;
assign lsu_mb_ex2_uc_split              = lsu_ex2_split;
assign lsu_mb_ex2_uc_split_last         = lsu_ex2_split_last;
assign lsu_mb_ex2_uc_bytes_vld[3:0]     = lsu_ex2_bytes_vld[3:0];
assign lsu_mb_ex2_uc_sign_ext           = lsu_ex2_sign_ext;
assign lsu_mb_ex2_uc_size[1:0]          = lsu_ex2_size[1:0];
assign lsu_mb_ex2_uc_addr_2             = lsu_ex2_addr_2;
assign lsu_mb_ex2_uc_lock               = lsu_ex2_lock;
assign lsu_xx_ex2_uc_flush              = wb_dbus_req & wb_addr_pmp_deny;
//assign lsu_mb_ex2_uc_ld_vld             = ncb_vld & ncb_ld_inst;

//======================================
// async exception
//======================================
assign ncb_ag_async_expt_vld    = dahbif_ncb_acc_err & ncb_split_first;
assign ncb_ag_async_mtval[31:0] = ncb_addr[31:0];
assign ncb_ag_async_ld_inst     = ncb_ld_inst & !ncb_lock;

//======================================
// pmp_deny mtval
//======================================
assign wb_pmp_addr[31:0] = {32{wb_entry_vld[1] & wb_entry_pmp_deny[1]}} & wb_entry1_addr[31:0] |
                           {32{wb_entry_vld[0] & wb_entry_pmp_deny[0]}} & wb_entry0_addr[31:0];
//assign ncb_pmp_deny           = ncb_vld & ncb_pmp_expt;
assign ncb_ag_pmp_mtval[31:0] = wb_pmp_deny ? wb_pmp_addr[31:0] : ncb_addr[31:0];
assign ncb_ag_pmp_ld_inst     = wb_pmp_deny ? 1'b0 : ncb_ld_inst & !ncb_lock;
//======================================
//ex2 stall
//======================================
//assign lsu_mb_ex2_uc_stall = ncb_ld_inst & 
//                               (nc_cur_wfg |
//                                nc_cur_wfc & (!data_last | 
//                                              !dahbif_ncb_cmplt | 
//                                               dahbif_ncb_acc_err));

//assign lsu_mb_ex2_uc_vld = ncb_ld_inst & 
//                           (nc_cur_wfg | nc_cur_wfc);

//for timing, cut ex2 stall
always@(posedge ncb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    uc_ex2_stall <= 1'b0;
  else if (rtu_yy_xx_async_flush)
    uc_ex2_stall <= 1'b0;
  else if (nc_req_vld & nc_ld)
    uc_ex2_stall <= 1'b1;
  else if (ncb_cmplt)
    uc_ex2_stall <= 1'b0;
end

assign lsu_mb_ex2_uc_stall = uc_ex2_stall;

//======================================
//     ICG 
//======================================
assign ncb_clk_en = ag_ncb_inst_vld_dp | ncb_vld | (|wb_entry_vld[1:0]);
// &Instance("gated_clk_cell", "x_pa_lsu_ncb_gated_clk"); @685
gated_clk_cell  x_pa_lsu_ncb_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ncb_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ncb_clk_en        ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @686
//          .external_en (1'b0), @687
//          .global_en   (1'b1), @688
//          .module_en     (cp0_lsu_icg_en     ), @689
//          .local_en    (ncb_clk_en), @690
//          .clk_out     (ncb_clk)); @691

assign ncb_dp_clk_en = ncb_create_en_gate | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_ncb_dp_gated_clk"); @694
gated_clk_cell  x_pa_lsu_ncb_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ncb_dp_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ncb_dp_clk_en     ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @695
//          .external_en (1'b0), @696
//          .global_en   (1'b1), @697
//          .module_en     (cp0_lsu_icg_en     ), @698
//          .local_en    (ncb_dp_clk_en), @699
//          .clk_out     (ncb_dp_clk)); @700

assign ncb_ld_dp_clk_en = ncb_ld_create_en_gate | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_ncb_ld_dp_gated_clk"); @703
gated_clk_cell  x_pa_lsu_ncb_ld_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ncb_ld_dp_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ncb_ld_dp_clk_en  ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @704
//          .external_en (1'b0), @705
//          .global_en   (1'b1), @706
//          .module_en     (cp0_lsu_icg_en     ), @707
//          .local_en    (ncb_ld_dp_clk_en), @708
//          .clk_out     (ncb_ld_dp_clk)); @709

assign wb_clk_en = wb_create_vld_dp | (|wb_entry_vld[1:0]) | rtu_yy_xx_async_flush;
// &Instance("gated_clk_cell", "x_pa_lsu_wb_ctrl_gated_clk"); @712
gated_clk_cell  x_pa_lsu_wb_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wb_clk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (wb_clk_en         ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @713
//          .external_en (1'b0), @714
//          .global_en   (1'b1), @715
//          .module_en     (cp0_lsu_icg_en     ), @716
//          .local_en    (wb_clk_en), @717
//          .clk_out     (wb_clk)); @718

// &ConnRule(s/_x$/[0]/); @720
// &ConnRule(s/entryx/entry0/); @721
// &Instance("pa_lsu_wb_entry","x_pa_lsu_wb_entry_0"); @722
pa_lsu_wb_entry  x_pa_lsu_wb_entry_0 (
  .ag_ld_inst              (ag_ld_inst             ),
  .ag_ncb_inst_vld_dp      (ag_ncb_inst_vld_dp     ),
  .cp0_lsu_icg_en          (cp0_lsu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .da_xx_fwd_data          (da_xx_fwd_data         ),
  .da_xx_fwd_fls           (da_xx_fwd_fls          ),
  .da_xx_fwd_preg          (da_xx_fwd_preg         ),
  .da_xx_fwd_vld           (da_xx_fwd_vld          ),
  .forever_cpuclk          (forever_cpuclk         ),
  .ifu_lsu_warm_up         (ifu_lsu_warm_up        ),
  .ld_hit_wb_f_x           (ld_hit_wb_f[0]         ),
  .ld_hit_wb_x             (ld_hit_wb[0]           ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .rtu_lsu_fgpr_wb_data    (rtu_lsu_fgpr_wb_data   ),
  .rtu_lsu_fgpr_wb_reg     (rtu_lsu_fgpr_wb_reg    ),
  .rtu_lsu_fgpr_wb_vld     (rtu_lsu_fgpr_wb_vld    ),
  .rtu_yy_xx_async_flush   (rtu_yy_xx_async_flush  ),
  .wb_addr_pop_en_x        (wb_addr_pop_en[0]      ),
  .wb_clk                  (wb_clk                 ),
  .wb_create_addr          (wb_create_addr         ),
  .wb_create_buf           (wb_create_buf          ),
  .wb_create_bytes_vld     (wb_create_bytes_vld    ),
  .wb_create_ca            (wb_create_ca           ),
  .wb_create_data          (wb_create_data         ),
  .wb_create_dest_preg     (wb_create_dest_preg    ),
  .wb_create_en_dp_x       (wb_create_en_dp[0]     ),
  .wb_create_en_x          (wb_create_en[0]        ),
  .wb_create_fls           (wb_create_fls          ),
  .wb_create_lock          (wb_create_lock         ),
  .wb_create_mach_mode     (wb_create_mach_mode    ),
  .wb_create_pmp_deny      (wb_create_pmp_deny     ),
  .wb_create_sc_fail       (wb_create_sc_fail      ),
  .wb_create_sc_inst       (wb_create_sc_inst      ),
  .wb_create_shift         (wb_create_shift        ),
  .wb_create_size          (wb_create_size         ),
  .wb_create_so            (wb_create_so           ),
  .wb_create_split_first   (wb_create_split_first  ),
  .wb_create_src1_depd     (wb_create_src1_depd    ),
  .wb_create_src1_reg      (wb_create_src1_reg     ),
  .wb_data_pop_en_x        (wb_data_pop_en[0]      ),
  .wb_entry_addr_vld_x     (wb_entry_addr_vld[0]   ),
  .wb_entry_data_vld_x     (wb_entry_data_vld[0]   ),
  .wb_entry_fls_x          (wb_entry_fls[0]        ),
  .wb_entry_lock_x         (wb_entry_lock[0]       ),
  .wb_entry_lrsc_x         (wb_entry_lrsc[0]       ),
  .wb_entry_pmp_deny_x     (wb_entry_pmp_deny[0]   ),
  .wb_entry_sc_fail_x      (wb_entry_sc_fail[0]    ),
  .wb_entry_split_first_x  (wb_entry_split_first[0]),
  .wb_entry_vld_x          (wb_entry_vld[0]        ),
  .wb_entryx_addr          (wb_entry0_addr         ),
  .wb_entryx_dbginfo       (wb_entry0_dbginfo      ),
  .wb_entryx_dest_preg     (wb_entry0_dest_preg    ),
  .wb_entryx_prot          (wb_entry0_prot         ),
  .wb_entryx_shift         (wb_entry0_shift        ),
  .wb_entryx_size          (wb_entry0_size         ),
  .wb_entryx_wdata         (wb_entry0_wdata        ),
  .wb_so_req_x             (wb_so_req[0]           )
);


// &ConnRule(s/_x$/[1]/); @724
// &ConnRule(s/entryx/entry1/); @725
// &Instance("pa_lsu_wb_entry","x_pa_lsu_wb_entry_1"); @726
pa_lsu_wb_entry  x_pa_lsu_wb_entry_1 (
  .ag_ld_inst              (ag_ld_inst             ),
  .ag_ncb_inst_vld_dp      (ag_ncb_inst_vld_dp     ),
  .cp0_lsu_icg_en          (cp0_lsu_icg_en         ),
  .cpurst_b                (cpurst_b               ),
  .da_xx_fwd_data          (da_xx_fwd_data         ),
  .da_xx_fwd_fls           (da_xx_fwd_fls          ),
  .da_xx_fwd_preg          (da_xx_fwd_preg         ),
  .da_xx_fwd_vld           (da_xx_fwd_vld          ),
  .forever_cpuclk          (forever_cpuclk         ),
  .ifu_lsu_warm_up         (ifu_lsu_warm_up        ),
  .ld_hit_wb_f_x           (ld_hit_wb_f[1]         ),
  .ld_hit_wb_x             (ld_hit_wb[1]           ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .rtu_lsu_fgpr_wb_data    (rtu_lsu_fgpr_wb_data   ),
  .rtu_lsu_fgpr_wb_reg     (rtu_lsu_fgpr_wb_reg    ),
  .rtu_lsu_fgpr_wb_vld     (rtu_lsu_fgpr_wb_vld    ),
  .rtu_yy_xx_async_flush   (rtu_yy_xx_async_flush  ),
  .wb_addr_pop_en_x        (wb_addr_pop_en[1]      ),
  .wb_clk                  (wb_clk                 ),
  .wb_create_addr          (wb_create_addr         ),
  .wb_create_buf           (wb_create_buf          ),
  .wb_create_bytes_vld     (wb_create_bytes_vld    ),
  .wb_create_ca            (wb_create_ca           ),
  .wb_create_data          (wb_create_data         ),
  .wb_create_dest_preg     (wb_create_dest_preg    ),
  .wb_create_en_dp_x       (wb_create_en_dp[1]     ),
  .wb_create_en_x          (wb_create_en[1]        ),
  .wb_create_fls           (wb_create_fls          ),
  .wb_create_lock          (wb_create_lock         ),
  .wb_create_mach_mode     (wb_create_mach_mode    ),
  .wb_create_pmp_deny      (wb_create_pmp_deny     ),
  .wb_create_sc_fail       (wb_create_sc_fail      ),
  .wb_create_sc_inst       (wb_create_sc_inst      ),
  .wb_create_shift         (wb_create_shift        ),
  .wb_create_size          (wb_create_size         ),
  .wb_create_so            (wb_create_so           ),
  .wb_create_split_first   (wb_create_split_first  ),
  .wb_create_src1_depd     (wb_create_src1_depd    ),
  .wb_create_src1_reg      (wb_create_src1_reg     ),
  .wb_data_pop_en_x        (wb_data_pop_en[1]      ),
  .wb_entry_addr_vld_x     (wb_entry_addr_vld[1]   ),
  .wb_entry_data_vld_x     (wb_entry_data_vld[1]   ),
  .wb_entry_fls_x          (wb_entry_fls[1]        ),
  .wb_entry_lock_x         (wb_entry_lock[1]       ),
  .wb_entry_lrsc_x         (wb_entry_lrsc[1]       ),
  .wb_entry_pmp_deny_x     (wb_entry_pmp_deny[1]   ),
  .wb_entry_sc_fail_x      (wb_entry_sc_fail[1]    ),
  .wb_entry_split_first_x  (wb_entry_split_first[1]),
  .wb_entry_vld_x          (wb_entry_vld[1]        ),
  .wb_entryx_addr          (wb_entry1_addr         ),
  .wb_entryx_dbginfo       (wb_entry1_dbginfo      ),
  .wb_entryx_dest_preg     (wb_entry1_dest_preg    ),
  .wb_entryx_prot          (wb_entry1_prot         ),
  .wb_entryx_shift         (wb_entry1_shift        ),
  .wb_entryx_size          (wb_entry1_size         ),
  .wb_entryx_wdata         (wb_entry1_wdata        ),
  .wb_so_req_x             (wb_so_req[1]           )
);


assign ncb_dbginfo[10:0] = {wb_data_pop_ptr,wb_addr_pop_ptr,wb_create_ptr,
                            wb_entry1_dbginfo[2:0],wb_entry0_dbginfo[2:0],nc_cur_state[1:0]};

// &ModuleEnd; @731
endmodule


