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
module pa_ifu_top(
  bmu_ifu_acc_err,
  bmu_ifu_grant,
  bmu_ifu_rdata,
  bmu_ifu_trans_cmplt,
  cp0_ifu_bht_en,
  cp0_ifu_bht_inv,
  cp0_ifu_btb_clr,
  cp0_ifu_btb_en,
  cp0_ifu_icache_en,
  cp0_ifu_icache_inv_addr,
  cp0_ifu_icache_inv_req,
  cp0_ifu_icache_inv_type,
  cp0_ifu_icg_en,
  cp0_ifu_in_lpmd,
  cp0_ifu_lpmd_req,
  cp0_ifu_mtvec,
  cp0_ifu_ras_en,
  cp0_ifu_rst_inv_done,
  cp0_ifu_srst_mask,
  cp0_ifu_srst_req,
  cp0_yy_clk_en,
  cp0_yy_mach_mode,
  cpurst_b,
  dtu_ifu_debug_inst,
  dtu_ifu_debug_inst_vld,
  dtu_ifu_halt_info0,
  dtu_ifu_halt_info1,
  dtu_ifu_halt_info_vld,
  dtu_ifu_halt_on_reset,
  forever_cpuclk,
  idu_ifu_id_stall,
  idu_ifu_tail_vld,
  idu_ifu_tail_vld_gate,
  idu_ifu_x1,
  ifu_bmu_acc_deny,
  ifu_bmu_addr,
  ifu_bmu_burst,
  ifu_bmu_data_req,
  ifu_bmu_prot,
  ifu_bmu_req,
  ifu_bmu_seq,
  ifu_bmu_size,
  ifu_clic_warm_up,
  ifu_cp0_bht_inv_done,
  ifu_cp0_icache_inv_done,
  ifu_cp0_lpmd_ack,
  ifu_cp0_rst_inv_req,
  ifu_cp0_srst_ack,
  ifu_cp0_vec_err,
  ifu_cp0_vec_succeed,
  ifu_cp0_warm_up,
  ifu_dtu_addr_vld0,
  ifu_dtu_addr_vld1,
  ifu_dtu_data_vld0,
  ifu_dtu_data_vld1,
  ifu_dtu_debug_info,
  ifu_dtu_exe_addr0,
  ifu_dtu_exe_addr1,
  ifu_dtu_exe_data0,
  ifu_dtu_exe_data1,
  ifu_fpu_warm_up,
  ifu_hpcp_icache_access,
  ifu_hpcp_icache_miss,
  ifu_idu_chgflw_flush,
  ifu_idu_id_expt_high,
  ifu_idu_id_expt_vld,
  ifu_idu_id_halt_info,
  ifu_idu_id_inst,
  ifu_idu_id_inst_vld,
  ifu_idu_id_pred_taken,
  ifu_idu_warm_up,
  ifu_iu_chgflw_pc,
  ifu_iu_chgflw_vld,
  ifu_iu_ex1_pc_pred,
  ifu_iu_reset_vld,
  ifu_iu_warm_up,
  ifu_lsu_warm_up,
  ifu_pmp_addr,
  ifu_pmp_machine_mode,
  ifu_rtu_lockup_ack,
  ifu_rtu_reset_halt_req,
  ifu_rtu_warm_up,
  ifu_sysmap_pa,
  ifu_sysmap_rst_sample,
  ifu_xx_in_warm_up,
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
  iu_yy_xx_cancel,
  pad_yy_icg_scan_en,
  pmp_ifu_acc_deny,
  rtu_ifu_chgflw_pc,
  rtu_ifu_chgflw_vld,
  rtu_ifu_dbg_mask,
  rtu_ifu_flush_fe,
  rtu_ifu_lockup_expt_vld,
  rtu_ifu_lockup_mask,
  rtu_ifu_lockup_req,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vld,
  rtu_yy_xx_int_hv,
  rtu_yy_xx_tail_int_vld,
  sysio_ifu_rst_addr,
  sysio_ifu_rst_addr_done,
  sysio_xx_halt_req,
  sysmap_ifu_flg
);

// &Ports; @24
input           bmu_ifu_acc_err;           
input           bmu_ifu_grant;             
input   [31:0]  bmu_ifu_rdata;             
input           bmu_ifu_trans_cmplt;       
input           cp0_ifu_bht_en;            
input           cp0_ifu_bht_inv;           
input           cp0_ifu_btb_clr;           
input           cp0_ifu_btb_en;            
input           cp0_ifu_icache_en;         
input   [31:0]  cp0_ifu_icache_inv_addr;   
input           cp0_ifu_icache_inv_req;    
input           cp0_ifu_icache_inv_type;   
input           cp0_ifu_icg_en;            
input           cp0_ifu_in_lpmd;           
input           cp0_ifu_lpmd_req;          
input   [31:0]  cp0_ifu_mtvec;             
input           cp0_ifu_ras_en;            
input           cp0_ifu_rst_inv_done;      
input           cp0_ifu_srst_mask;         
input           cp0_ifu_srst_req;          
input           cp0_yy_clk_en;             
input           cp0_yy_mach_mode;          
input           cpurst_b;                  
input   [31:0]  dtu_ifu_debug_inst;        
input           dtu_ifu_debug_inst_vld;    
input   [14:0]  dtu_ifu_halt_info0;        
input   [14:0]  dtu_ifu_halt_info1;        
input           dtu_ifu_halt_info_vld;     
input           dtu_ifu_halt_on_reset;     
input           forever_cpuclk;            
input           idu_ifu_id_stall;          
input           idu_ifu_tail_vld;          
input           idu_ifu_tail_vld_gate;     
input   [31:0]  idu_ifu_x1;                
input   [31:0]  iu_ifu_bht_cur_pc;         
input           iu_ifu_bht_mispred;        
input           iu_ifu_bht_mispred_gate;   
input   [1 :0]  iu_ifu_bht_pred;           
input           iu_ifu_bht_taken;          
input           iu_ifu_br_vld;             
input           iu_ifu_br_vld_gate;        
input           iu_ifu_ind_link_vld;       
input           iu_ifu_link_vld;           
input           iu_ifu_link_vld_gate;      
input           iu_ifu_pc_mispred;         
input           iu_ifu_pc_mispred_gate;    
input           iu_ifu_ret_vld;            
input           iu_ifu_ret_vld_gate;       
input   [31:0]  iu_ifu_tar_pc;             
input           iu_ifu_tar_pc_vld;         
input           iu_ifu_tar_pc_vld_gate;    
input           iu_yy_xx_cancel;           
input           pad_yy_icg_scan_en;        
input           pmp_ifu_acc_deny;          
input   [31:0]  rtu_ifu_chgflw_pc;         
input           rtu_ifu_chgflw_vld;        
input           rtu_ifu_dbg_mask;          
input           rtu_ifu_flush_fe;          
input           rtu_ifu_lockup_expt_vld;   
input           rtu_ifu_lockup_mask;       
input           rtu_ifu_lockup_req;        
input           rtu_yy_xx_dbgon;           
input           rtu_yy_xx_expt_int;        
input           rtu_yy_xx_expt_vld;        
input           rtu_yy_xx_int_hv;          
input           rtu_yy_xx_tail_int_vld;    
input   [31:0]  sysio_ifu_rst_addr;        
input           sysio_ifu_rst_addr_done;   
input           sysio_xx_halt_req;         
input   [4 :0]  sysmap_ifu_flg;            
output          ifu_bmu_acc_deny;          
output  [31:0]  ifu_bmu_addr;              
output  [2 :0]  ifu_bmu_burst;             
output          ifu_bmu_data_req;          
output  [3 :0]  ifu_bmu_prot;              
output          ifu_bmu_req;               
output          ifu_bmu_seq;               
output  [1 :0]  ifu_bmu_size;              
output          ifu_clic_warm_up;          
output          ifu_cp0_bht_inv_done;      
output          ifu_cp0_icache_inv_done;   
output          ifu_cp0_lpmd_ack;          
output          ifu_cp0_rst_inv_req;       
output          ifu_cp0_srst_ack;          
output          ifu_cp0_vec_err;           
output          ifu_cp0_vec_succeed;       
output          ifu_cp0_warm_up;           
output          ifu_dtu_addr_vld0;         
output          ifu_dtu_addr_vld1;         
output          ifu_dtu_data_vld0;         
output          ifu_dtu_data_vld1;         
output  [26:0]  ifu_dtu_debug_info;        
output  [31:0]  ifu_dtu_exe_addr0;         
output  [31:0]  ifu_dtu_exe_addr1;         
output  [31:0]  ifu_dtu_exe_data0;         
output  [31:0]  ifu_dtu_exe_data1;         
output          ifu_fpu_warm_up;           
output          ifu_hpcp_icache_access;    
output          ifu_hpcp_icache_miss;      
output          ifu_idu_chgflw_flush;      
output          ifu_idu_id_expt_high;      
output          ifu_idu_id_expt_vld;       
output  [14:0]  ifu_idu_id_halt_info;      
output  [31:0]  ifu_idu_id_inst;           
output          ifu_idu_id_inst_vld;       
output  [1 :0]  ifu_idu_id_pred_taken;     
output          ifu_idu_warm_up;           
output  [31:0]  ifu_iu_chgflw_pc;          
output          ifu_iu_chgflw_vld;         
output  [31:0]  ifu_iu_ex1_pc_pred;        
output          ifu_iu_reset_vld;          
output          ifu_iu_warm_up;            
output          ifu_lsu_warm_up;           
output  [31:0]  ifu_pmp_addr;              
output          ifu_pmp_machine_mode;      
output          ifu_rtu_lockup_ack;        
output          ifu_rtu_reset_halt_req;    
output          ifu_rtu_warm_up;           
output  [31:0]  ifu_sysmap_pa;             
output          ifu_sysmap_rst_sample;     
output          ifu_xx_in_warm_up;         

// &Regs; @25

// &Wires; @26
wire    [1 :0]  bht_top_cur_st;            
wire            bmu_ifu_acc_err;           
wire            bmu_ifu_grant;             
wire    [31:0]  bmu_ifu_rdata;             
wire            bmu_ifu_trans_cmplt;       
wire    [31:0]  btb_pcgen_tar_pc;          
wire            btb_xx_chgflw_vld;         
wire            cp0_ifu_bht_en;            
wire            cp0_ifu_bht_inv;           
wire            cp0_ifu_btb_clr;           
wire            cp0_ifu_btb_en;            
wire            cp0_ifu_icache_en;         
wire    [31:0]  cp0_ifu_icache_inv_addr;   
wire            cp0_ifu_icache_inv_req;    
wire            cp0_ifu_icache_inv_type;   
wire            cp0_ifu_icg_en;            
wire            cp0_ifu_in_lpmd;           
wire            cp0_ifu_lpmd_req;          
wire    [31:0]  cp0_ifu_mtvec;             
wire            cp0_ifu_ras_en;            
wire            cp0_ifu_rst_inv_done;      
wire            cp0_ifu_srst_mask;         
wire            cp0_ifu_srst_req;          
wire            cp0_yy_clk_en;             
wire            cp0_yy_mach_mode;          
wire            cpurst_b;                  
wire            ctrl_btb_inst_fetch;       
wire            ctrl_ibuf_pop_en;          
wire            ctrl_ifetch_req_abort;     
wire            ctrl_ifetch_req_vld;       
wire            ctrl_pcgen_inst_vld;       
wire            ctrl_pcgen_pipedown;       
wire    [31:0]  dtu_ifu_debug_inst;        
wire            dtu_ifu_debug_inst_vld;    
wire    [14:0]  dtu_ifu_halt_info0;        
wire    [14:0]  dtu_ifu_halt_info1;        
wire            dtu_ifu_halt_info_vld;     
wire            dtu_ifu_halt_on_reset;     
wire            forever_cpuclk;            
wire            ibuf_ctrl_inst_fetch;      
wire            ibuf_id_pred_hungry;       
wire            ibuf_ipack_stall;          
wire            ibuf_pred_stall;           
wire            ibuf_top_id_stall;         
wire    [2 :0]  ibuf_top_vld_num;          
wire            icache_top_abort;          
wire            icache_top_rd_vld;         
wire    [1 :0]  icache_top_ref_st;         
wire            icache_top_uc_st;          
wire    [31:0]  id_pred_btb_cur_pc;        
wire            id_pred_btb_mis_pred;      
wire            id_pred_btb_mis_predg;     
wire    [31:0]  id_pred_btb_tar_pc;        
wire            id_pred_btb_upd_vld;       
wire            id_pred_btb_upd_vldg;      
wire            id_pred_ctrl_stall;        
wire    [1 :0]  id_pred_ibuf_br_taken0;    
wire    [1 :0]  id_pred_ibuf_br_taken1;    
wire            id_pred_ibuf_chgflw_vld0;  
wire    [14:0]  id_pred_ibuf_halt_info0;   
wire    [14:0]  id_pred_ibuf_halt_info1;   
wire            id_pred_ipack_chgflw_vld0; 
wire            id_pred_ipack_delay_stall; 
wire            id_pred_ipack_mask;        
wire            id_pred_ipack_ret_stall;   
wire    [31:0]  id_pred_pcgen_chgflw_pc;   
wire            id_pred_pcgen_chgflw_vld;  
wire            id_pred_pcgen_inst_vld;    
wire            idu_ifu_id_stall;          
wire            idu_ifu_tail_vld;          
wire            idu_ifu_tail_vld_gate;     
wire    [31:0]  idu_ifu_x1;                
wire            ifetch_ctrl_inst_vld;      
wire            ifetch_ibuf_idle;          
wire            ifetch_ipack_acc_err;      
wire    [31:0]  ifetch_ipack_inst;         
wire            ifetch_ipack_inst_vld;     
wire            ifetch_ipack_inst_vld_gate; 
wire            ifetch_ipack_unalign;      
wire    [31:0]  ifetch_pcgen_addr;         
wire    [31:0]  ifetch_pcgen_data;         
wire            ifetch_pcgen_grant;        
wire            ifetch_pcgen_grant_dp;     
wire    [1 :0]  ifetch_top_abt_st;         
wire    [2 :0]  ifetch_top_cur_st;         
wire            ifetch_vec_acc_err;        
wire            ifetch_vec_cmplt;          
wire            ifetch_vec_grant;          
wire            ifetch_vec_idle;           
wire            ifetch_xx_not_busy;        
wire            ifu_bmu_acc_deny;          
wire    [31:0]  ifu_bmu_addr;              
wire    [2 :0]  ifu_bmu_burst;             
wire            ifu_bmu_data_req;          
wire    [3 :0]  ifu_bmu_prot;              
wire            ifu_bmu_req;               
wire            ifu_bmu_seq;               
wire    [1 :0]  ifu_bmu_size;              
wire            ifu_clic_warm_up;          
wire            ifu_cp0_bht_inv_done;      
wire            ifu_cp0_icache_inv_done;   
wire            ifu_cp0_lpmd_ack;          
wire            ifu_cp0_rst_inv_req;       
wire            ifu_cp0_srst_ack;          
wire            ifu_cp0_vec_err;           
wire            ifu_cp0_vec_succeed;       
wire            ifu_cp0_warm_up;           
wire            ifu_dtu_addr_vld0;         
wire            ifu_dtu_addr_vld1;         
wire            ifu_dtu_data_vld0;         
wire            ifu_dtu_data_vld1;         
wire    [26:0]  ifu_dtu_debug_info;        
wire    [31:0]  ifu_dtu_exe_addr0;         
wire    [31:0]  ifu_dtu_exe_addr1;         
wire    [31:0]  ifu_dtu_exe_data0;         
wire    [31:0]  ifu_dtu_exe_data1;         
wire            ifu_fpu_warm_up;           
wire            ifu_hpcp_icache_access;    
wire            ifu_hpcp_icache_miss;      
wire            ifu_idu_chgflw_flush;      
wire            ifu_idu_id_expt_high;      
wire            ifu_idu_id_expt_vld;       
wire    [14:0]  ifu_idu_id_halt_info;      
wire    [31:0]  ifu_idu_id_inst;           
wire            ifu_idu_id_inst_vld;       
wire    [1 :0]  ifu_idu_id_pred_taken;     
wire            ifu_idu_warm_up;           
wire    [31:0]  ifu_iu_chgflw_pc;          
wire            ifu_iu_chgflw_vld;         
wire    [31:0]  ifu_iu_ex1_pc_pred;        
wire            ifu_iu_reset_vld;          
wire            ifu_iu_warm_up;            
wire            ifu_lsu_warm_up;           
wire    [31:0]  ifu_pmp_addr;              
wire            ifu_pmp_machine_mode;      
wire            ifu_rtu_lockup_ack;        
wire            ifu_rtu_reset_halt_req;    
wire            ifu_rtu_warm_up;           
wire    [31:0]  ifu_sysmap_pa;             
wire            ifu_sysmap_rst_sample;     
wire            ifu_xx_in_warm_up;         
wire    [2 :0]  ipack_ibuf_acc_err;        
wire    [47:0]  ipack_ibuf_inst;           
wire            ipack_ibuf_inst_all;       
wire            ipack_ibuf_inst_empty;     
wire            ipack_ibuf_inst_full;      
wire            ipack_ibuf_inst_one;       
wire            ipack_ibuf_inst_one_raw;   
wire            ipack_ibuf_inst_two;       
wire            ipack_ibuf_inst_vld;       
wire            ipack_ibuf_inst_vld_raw;   
wire            ipack_id_pred_h0_create;   
wire            ipack_id_pred_h0_vld;      
wire    [31:0]  ipack_id_pred_inst0;       
wire            ipack_id_pred_inst0_expt;  
wire            ipack_id_pred_inst0_vld;   
wire    [15:0]  ipack_id_pred_inst1;       
wire            ipack_id_pred_inst1_expt;  
wire            ipack_id_pred_inst1_vld;   
wire            ipack_id_pred_new_vld;     
wire            ipack_id_pred_unalign;     
wire            ipack_pcgen_reissue;       
wire            ipack_pcgen_reissue_gate;  
wire            ipack_top_entry0_vld;      
wire            ipack_top_entry1_vld;      
wire            ipack_top_entry2_vld;      
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
wire            iu_yy_xx_cancel;           
wire            pad_yy_icg_scan_en;        
wire    [31:0]  pcgen_btb_addr;            
wire    [31:0]  pcgen_btb_pc;              
wire            pcgen_ctrl_chgflw_vld;     
wire            pcgen_ibuf_chgflw_vld;     
wire    [31:0]  pcgen_id_pred_btb_tar_pc;  
wire            pcgen_id_pred_btb_tar_vld; 
wire            pcgen_id_pred_flush_vld;   
wire    [31:0]  pcgen_id_pred_idpc;        
wire    [31:0]  pcgen_id_pred_ifpc;        
wire    [31:0]  pcgen_ifetch_addr;         
wire            pcgen_ifetch_chgflw_vld;   
wire    [31:0]  pcgen_ifetch_ifpc;         
wire    [31:0]  pcgen_ifetch_seq_addr;     
wire            pcgen_ipack_chgflw_vld;    
wire            pcgen_top_btb_tar_vld;     
wire            pcgen_top_buf_chgflw;      
wire            pmp_ifu_acc_deny;          
wire            pred_top_delay_chgflw;     
wire            pred_top_ras_st;           
wire    [31:0]  rtu_ifu_chgflw_pc;         
wire            rtu_ifu_chgflw_vld;        
wire            rtu_ifu_dbg_mask;          
wire            rtu_ifu_flush_fe;          
wire            rtu_ifu_lockup_expt_vld;   
wire            rtu_ifu_lockup_mask;       
wire            rtu_ifu_lockup_req;        
wire            rtu_yy_xx_dbgon;           
wire            rtu_yy_xx_expt_int;        
wire            rtu_yy_xx_expt_vld;        
wire            rtu_yy_xx_int_hv;          
wire            rtu_yy_xx_tail_int_vld;    
wire    [31:0]  sysio_ifu_rst_addr;        
wire            sysio_ifu_rst_addr_done;   
wire            sysio_xx_halt_req;         
wire    [4 :0]  sysmap_ifu_flg;            
wire            vec_ctrl_reset_mask;       
wire            vec_ctrl_seq_mask;         
wire            vec_ibuf_warm_up;          
wire            vec_ifetch_data_fetch;     
wire            vec_ipack_inst_mask;       
wire            vec_pcgen_chgflw_vld;      
wire            vec_pcgen_idle;            
wire            vec_pcgen_inst_fetch;      
wire            vec_pcgen_iu_chgflw;       
wire            vec_pcgen_pc_flop;         
wire            vec_pcgen_rst_vld;         
wire    [31:0]  vec_pcgen_tar_pc;          
wire    [3 :0]  vec_top_cur_st;            


// PC-Generation Module
// &Instance("pa_ifu_pcgen"); @29
pa_ifu_pcgen  x_pa_ifu_pcgen (
  .btb_pcgen_tar_pc          (btb_pcgen_tar_pc         ),
  .btb_xx_chgflw_vld         (btb_xx_chgflw_vld        ),
  .cp0_ifu_icg_en            (cp0_ifu_icg_en           ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .ctrl_pcgen_inst_vld       (ctrl_pcgen_inst_vld      ),
  .ctrl_pcgen_pipedown       (ctrl_pcgen_pipedown      ),
  .forever_cpuclk            (forever_cpuclk           ),
  .id_pred_pcgen_chgflw_pc   (id_pred_pcgen_chgflw_pc  ),
  .id_pred_pcgen_chgflw_vld  (id_pred_pcgen_chgflw_vld ),
  .id_pred_pcgen_inst_vld    (id_pred_pcgen_inst_vld   ),
  .ifetch_pcgen_addr         (ifetch_pcgen_addr        ),
  .ifetch_pcgen_data         (ifetch_pcgen_data        ),
  .ifetch_pcgen_grant        (ifetch_pcgen_grant       ),
  .ifetch_pcgen_grant_dp     (ifetch_pcgen_grant_dp    ),
  .ifetch_xx_not_busy        (ifetch_xx_not_busy       ),
  .ifu_idu_chgflw_flush      (ifu_idu_chgflw_flush     ),
  .ifu_iu_chgflw_pc          (ifu_iu_chgflw_pc         ),
  .ifu_iu_chgflw_vld         (ifu_iu_chgflw_vld        ),
  .ipack_pcgen_reissue       (ipack_pcgen_reissue      ),
  .ipack_pcgen_reissue_gate  (ipack_pcgen_reissue_gate ),
  .iu_ifu_tar_pc             (iu_ifu_tar_pc            ),
  .iu_ifu_tar_pc_vld         (iu_ifu_tar_pc_vld        ),
  .iu_ifu_tar_pc_vld_gate    (iu_ifu_tar_pc_vld_gate   ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .pcgen_btb_addr            (pcgen_btb_addr           ),
  .pcgen_btb_pc              (pcgen_btb_pc             ),
  .pcgen_ctrl_chgflw_vld     (pcgen_ctrl_chgflw_vld    ),
  .pcgen_ibuf_chgflw_vld     (pcgen_ibuf_chgflw_vld    ),
  .pcgen_id_pred_btb_tar_pc  (pcgen_id_pred_btb_tar_pc ),
  .pcgen_id_pred_btb_tar_vld (pcgen_id_pred_btb_tar_vld),
  .pcgen_id_pred_flush_vld   (pcgen_id_pred_flush_vld  ),
  .pcgen_id_pred_idpc        (pcgen_id_pred_idpc       ),
  .pcgen_id_pred_ifpc        (pcgen_id_pred_ifpc       ),
  .pcgen_ifetch_addr         (pcgen_ifetch_addr        ),
  .pcgen_ifetch_chgflw_vld   (pcgen_ifetch_chgflw_vld  ),
  .pcgen_ifetch_ifpc         (pcgen_ifetch_ifpc        ),
  .pcgen_ifetch_seq_addr     (pcgen_ifetch_seq_addr    ),
  .pcgen_ipack_chgflw_vld    (pcgen_ipack_chgflw_vld   ),
  .pcgen_top_btb_tar_vld     (pcgen_top_btb_tar_vld    ),
  .pcgen_top_buf_chgflw      (pcgen_top_buf_chgflw     ),
  .rtu_ifu_chgflw_pc         (rtu_ifu_chgflw_pc        ),
  .rtu_ifu_chgflw_vld        (rtu_ifu_chgflw_vld       ),
  .rtu_ifu_flush_fe          (rtu_ifu_flush_fe         ),
  .sysio_ifu_rst_addr        (sysio_ifu_rst_addr       ),
  .vec_pcgen_chgflw_vld      (vec_pcgen_chgflw_vld     ),
  .vec_pcgen_idle            (vec_pcgen_idle           ),
  .vec_pcgen_inst_fetch      (vec_pcgen_inst_fetch     ),
  .vec_pcgen_iu_chgflw       (vec_pcgen_iu_chgflw      ),
  .vec_pcgen_pc_flop         (vec_pcgen_pc_flop        ),
  .vec_pcgen_rst_vld         (vec_pcgen_rst_vld        ),
  .vec_pcgen_tar_pc          (vec_pcgen_tar_pc         )
);


// Instruction-Fetch Module
// &Instance("pa_ifu_ifetch_axi"); @33
// &Instance("pa_ifu_ifetch"); @35
pa_ifu_ifetch  x_pa_ifu_ifetch (
  .bmu_ifu_acc_err            (bmu_ifu_acc_err           ),
  .bmu_ifu_grant              (bmu_ifu_grant             ),
  .bmu_ifu_rdata              (bmu_ifu_rdata             ),
  .bmu_ifu_trans_cmplt        (bmu_ifu_trans_cmplt       ),
  .cp0_ifu_icache_en          (cp0_ifu_icache_en         ),
  .cp0_ifu_icache_inv_addr    (cp0_ifu_icache_inv_addr   ),
  .cp0_ifu_icache_inv_req     (cp0_ifu_icache_inv_req    ),
  .cp0_ifu_icache_inv_type    (cp0_ifu_icache_inv_type   ),
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_ifu_lpmd_req           (cp0_ifu_lpmd_req          ),
  .cp0_ifu_srst_req           (cp0_ifu_srst_req          ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cp0_yy_mach_mode           (cp0_yy_mach_mode          ),
  .cpurst_b                   (cpurst_b                  ),
  .ctrl_ifetch_req_abort      (ctrl_ifetch_req_abort     ),
  .ctrl_ifetch_req_vld        (ctrl_ifetch_req_vld       ),
  .forever_cpuclk             (forever_cpuclk            ),
  .icache_top_abort           (icache_top_abort          ),
  .icache_top_rd_vld          (icache_top_rd_vld         ),
  .icache_top_ref_st          (icache_top_ref_st         ),
  .icache_top_uc_st           (icache_top_uc_st          ),
  .ifetch_ctrl_inst_vld       (ifetch_ctrl_inst_vld      ),
  .ifetch_ibuf_idle           (ifetch_ibuf_idle          ),
  .ifetch_ipack_acc_err       (ifetch_ipack_acc_err      ),
  .ifetch_ipack_inst          (ifetch_ipack_inst         ),
  .ifetch_ipack_inst_vld      (ifetch_ipack_inst_vld     ),
  .ifetch_ipack_inst_vld_gate (ifetch_ipack_inst_vld_gate),
  .ifetch_ipack_unalign       (ifetch_ipack_unalign      ),
  .ifetch_pcgen_addr          (ifetch_pcgen_addr         ),
  .ifetch_pcgen_data          (ifetch_pcgen_data         ),
  .ifetch_pcgen_grant         (ifetch_pcgen_grant        ),
  .ifetch_pcgen_grant_dp      (ifetch_pcgen_grant_dp     ),
  .ifetch_top_abt_st          (ifetch_top_abt_st         ),
  .ifetch_top_cur_st          (ifetch_top_cur_st         ),
  .ifetch_vec_acc_err         (ifetch_vec_acc_err        ),
  .ifetch_vec_cmplt           (ifetch_vec_cmplt          ),
  .ifetch_vec_grant           (ifetch_vec_grant          ),
  .ifetch_vec_idle            (ifetch_vec_idle           ),
  .ifetch_xx_not_busy         (ifetch_xx_not_busy        ),
  .ifu_bmu_acc_deny           (ifu_bmu_acc_deny          ),
  .ifu_bmu_addr               (ifu_bmu_addr              ),
  .ifu_bmu_burst              (ifu_bmu_burst             ),
  .ifu_bmu_data_req           (ifu_bmu_data_req          ),
  .ifu_bmu_prot               (ifu_bmu_prot              ),
  .ifu_bmu_req                (ifu_bmu_req               ),
  .ifu_bmu_seq                (ifu_bmu_seq               ),
  .ifu_bmu_size               (ifu_bmu_size              ),
  .ifu_cp0_icache_inv_done    (ifu_cp0_icache_inv_done   ),
  .ifu_cp0_lpmd_ack           (ifu_cp0_lpmd_ack          ),
  .ifu_cp0_srst_ack           (ifu_cp0_srst_ack          ),
  .ifu_hpcp_icache_access     (ifu_hpcp_icache_access    ),
  .ifu_hpcp_icache_miss       (ifu_hpcp_icache_miss      ),
  .ifu_pmp_addr               (ifu_pmp_addr              ),
  .ifu_pmp_machine_mode       (ifu_pmp_machine_mode      ),
  .ifu_rtu_lockup_ack         (ifu_rtu_lockup_ack        ),
  .ifu_sysmap_pa              (ifu_sysmap_pa             ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcgen_ifetch_addr          (pcgen_ifetch_addr         ),
  .pcgen_ifetch_chgflw_vld    (pcgen_ifetch_chgflw_vld   ),
  .pcgen_ifetch_ifpc          (pcgen_ifetch_ifpc         ),
  .pcgen_ifetch_seq_addr      (pcgen_ifetch_seq_addr     ),
  .pmp_ifu_acc_deny           (pmp_ifu_acc_deny          ),
  .rtu_ifu_lockup_mask        (rtu_ifu_lockup_mask       ),
  .rtu_ifu_lockup_req         (rtu_ifu_lockup_req        ),
  .rtu_yy_xx_dbgon            (rtu_yy_xx_dbgon           ),
  .sysmap_ifu_flg             (sysmap_ifu_flg            ),
  .vec_ifetch_data_fetch      (vec_ifetch_data_fetch     )
);


// L0-BTB Module
// &Instance("pa_ifu_btb"); @39
pa_ifu_btb  x_pa_ifu_btb (
  .btb_pcgen_tar_pc      (btb_pcgen_tar_pc     ),
  .btb_xx_chgflw_vld     (btb_xx_chgflw_vld    ),
  .cp0_ifu_btb_clr       (cp0_ifu_btb_clr      ),
  .cp0_ifu_btb_en        (cp0_ifu_btb_en       ),
  .cp0_ifu_icg_en        (cp0_ifu_icg_en       ),
  .cp0_yy_clk_en         (cp0_yy_clk_en        ),
  .cpurst_b              (cpurst_b             ),
  .ctrl_btb_inst_fetch   (ctrl_btb_inst_fetch  ),
  .forever_cpuclk        (forever_cpuclk       ),
  .id_pred_btb_cur_pc    (id_pred_btb_cur_pc   ),
  .id_pred_btb_mis_pred  (id_pred_btb_mis_pred ),
  .id_pred_btb_mis_predg (id_pred_btb_mis_predg),
  .id_pred_btb_tar_pc    (id_pred_btb_tar_pc   ),
  .id_pred_btb_upd_vld   (id_pred_btb_upd_vld  ),
  .id_pred_btb_upd_vldg  (id_pred_btb_upd_vldg ),
  .ifetch_pcgen_grant    (ifetch_pcgen_grant   ),
  .iu_ifu_tar_pc_vld     (iu_ifu_tar_pc_vld    ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .pcgen_btb_addr        (pcgen_btb_addr       ),
  .pcgen_btb_pc          (pcgen_btb_pc         )
);


// Instruction Package Module
// &Instance("pa_ifu_ipack"); @42
pa_ifu_ipack  x_pa_ifu_ipack (
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .ibuf_ipack_stall           (ibuf_ipack_stall          ),
  .id_pred_ipack_chgflw_vld0  (id_pred_ipack_chgflw_vld0 ),
  .id_pred_ipack_delay_stall  (id_pred_ipack_delay_stall ),
  .id_pred_ipack_mask         (id_pred_ipack_mask        ),
  .id_pred_ipack_ret_stall    (id_pred_ipack_ret_stall   ),
  .idu_ifu_tail_vld           (idu_ifu_tail_vld          ),
  .ifetch_ipack_acc_err       (ifetch_ipack_acc_err      ),
  .ifetch_ipack_inst          (ifetch_ipack_inst         ),
  .ifetch_ipack_inst_vld      (ifetch_ipack_inst_vld     ),
  .ifetch_ipack_inst_vld_gate (ifetch_ipack_inst_vld_gate),
  .ifetch_ipack_unalign       (ifetch_ipack_unalign      ),
  .ipack_ibuf_acc_err         (ipack_ibuf_acc_err        ),
  .ipack_ibuf_inst            (ipack_ibuf_inst           ),
  .ipack_ibuf_inst_all        (ipack_ibuf_inst_all       ),
  .ipack_ibuf_inst_empty      (ipack_ibuf_inst_empty     ),
  .ipack_ibuf_inst_full       (ipack_ibuf_inst_full      ),
  .ipack_ibuf_inst_one        (ipack_ibuf_inst_one       ),
  .ipack_ibuf_inst_one_raw    (ipack_ibuf_inst_one_raw   ),
  .ipack_ibuf_inst_two        (ipack_ibuf_inst_two       ),
  .ipack_ibuf_inst_vld        (ipack_ibuf_inst_vld       ),
  .ipack_ibuf_inst_vld_raw    (ipack_ibuf_inst_vld_raw   ),
  .ipack_id_pred_h0_create    (ipack_id_pred_h0_create   ),
  .ipack_id_pred_h0_vld       (ipack_id_pred_h0_vld      ),
  .ipack_id_pred_inst0        (ipack_id_pred_inst0       ),
  .ipack_id_pred_inst0_expt   (ipack_id_pred_inst0_expt  ),
  .ipack_id_pred_inst0_vld    (ipack_id_pred_inst0_vld   ),
  .ipack_id_pred_inst1        (ipack_id_pred_inst1       ),
  .ipack_id_pred_inst1_expt   (ipack_id_pred_inst1_expt  ),
  .ipack_id_pred_inst1_vld    (ipack_id_pred_inst1_vld   ),
  .ipack_id_pred_new_vld      (ipack_id_pred_new_vld     ),
  .ipack_id_pred_unalign      (ipack_id_pred_unalign     ),
  .ipack_pcgen_reissue        (ipack_pcgen_reissue       ),
  .ipack_pcgen_reissue_gate   (ipack_pcgen_reissue_gate  ),
  .ipack_top_entry0_vld       (ipack_top_entry0_vld      ),
  .ipack_top_entry1_vld       (ipack_top_entry1_vld      ),
  .ipack_top_entry2_vld       (ipack_top_entry2_vld      ),
  .iu_ifu_tar_pc_vld          (iu_ifu_tar_pc_vld         ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .pcgen_ipack_chgflw_vld     (pcgen_ipack_chgflw_vld    ),
  .rtu_ifu_chgflw_vld         (rtu_ifu_chgflw_vld        ),
  .rtu_ifu_flush_fe           (rtu_ifu_flush_fe          ),
  .rtu_yy_xx_expt_vld         (rtu_yy_xx_expt_vld        ),
  .rtu_yy_xx_tail_int_vld     (rtu_yy_xx_tail_int_vld    ),
  .vec_ipack_inst_mask        (vec_ipack_inst_mask       )
);


// Instruction Buffer Module
// &Instance("pa_ifu_ibuf"); @45
pa_ifu_ibuf  x_pa_ifu_ibuf (
  .cp0_ifu_icg_en           (cp0_ifu_icg_en          ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .ctrl_ibuf_pop_en         (ctrl_ibuf_pop_en        ),
  .dtu_ifu_debug_inst       (dtu_ifu_debug_inst      ),
  .dtu_ifu_debug_inst_vld   (dtu_ifu_debug_inst_vld  ),
  .dtu_ifu_halt_info_vld    (dtu_ifu_halt_info_vld   ),
  .forever_cpuclk           (forever_cpuclk          ),
  .ibuf_ctrl_inst_fetch     (ibuf_ctrl_inst_fetch    ),
  .ibuf_id_pred_hungry      (ibuf_id_pred_hungry     ),
  .ibuf_ipack_stall         (ibuf_ipack_stall        ),
  .ibuf_pred_stall          (ibuf_pred_stall         ),
  .ibuf_top_id_stall        (ibuf_top_id_stall       ),
  .ibuf_top_vld_num         (ibuf_top_vld_num        ),
  .id_pred_ibuf_br_taken0   (id_pred_ibuf_br_taken0  ),
  .id_pred_ibuf_br_taken1   (id_pred_ibuf_br_taken1  ),
  .id_pred_ibuf_chgflw_vld0 (id_pred_ibuf_chgflw_vld0),
  .id_pred_ibuf_halt_info0  (id_pred_ibuf_halt_info0 ),
  .id_pred_ibuf_halt_info1  (id_pred_ibuf_halt_info1 ),
  .idu_ifu_id_stall         (idu_ifu_id_stall        ),
  .idu_ifu_tail_vld         (idu_ifu_tail_vld        ),
  .idu_ifu_tail_vld_gate    (idu_ifu_tail_vld_gate   ),
  .ifetch_ibuf_idle         (ifetch_ibuf_idle        ),
  .ifetch_xx_not_busy       (ifetch_xx_not_busy      ),
  .ifu_idu_id_expt_high     (ifu_idu_id_expt_high    ),
  .ifu_idu_id_expt_vld      (ifu_idu_id_expt_vld     ),
  .ifu_idu_id_halt_info     (ifu_idu_id_halt_info    ),
  .ifu_idu_id_inst          (ifu_idu_id_inst         ),
  .ifu_idu_id_inst_vld      (ifu_idu_id_inst_vld     ),
  .ifu_idu_id_pred_taken    (ifu_idu_id_pred_taken   ),
  .ipack_ibuf_acc_err       (ipack_ibuf_acc_err      ),
  .ipack_ibuf_inst          (ipack_ibuf_inst         ),
  .ipack_ibuf_inst_all      (ipack_ibuf_inst_all     ),
  .ipack_ibuf_inst_empty    (ipack_ibuf_inst_empty   ),
  .ipack_ibuf_inst_full     (ipack_ibuf_inst_full    ),
  .ipack_ibuf_inst_one      (ipack_ibuf_inst_one     ),
  .ipack_ibuf_inst_one_raw  (ipack_ibuf_inst_one_raw ),
  .ipack_ibuf_inst_two      (ipack_ibuf_inst_two     ),
  .ipack_ibuf_inst_vld      (ipack_ibuf_inst_vld     ),
  .ipack_ibuf_inst_vld_raw  (ipack_ibuf_inst_vld_raw ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .pcgen_ibuf_chgflw_vld    (pcgen_ibuf_chgflw_vld   ),
  .rtu_ifu_flush_fe         (rtu_ifu_flush_fe        ),
  .rtu_yy_xx_dbgon          (rtu_yy_xx_dbgon         ),
  .rtu_yy_xx_expt_vld       (rtu_yy_xx_expt_vld      ),
  .rtu_yy_xx_tail_int_vld   (rtu_yy_xx_tail_int_vld  ),
  .vec_ibuf_warm_up         (vec_ibuf_warm_up        )
);


// Control Module
// &Instance("pa_ifu_ctrl"); @48
pa_ifu_ctrl  x_pa_ifu_ctrl (
  .cp0_ifu_in_lpmd        (cp0_ifu_in_lpmd       ),
  .cp0_ifu_lpmd_req       (cp0_ifu_lpmd_req      ),
  .cp0_ifu_srst_mask      (cp0_ifu_srst_mask     ),
  .cp0_ifu_srst_req       (cp0_ifu_srst_req      ),
  .ctrl_btb_inst_fetch    (ctrl_btb_inst_fetch   ),
  .ctrl_ibuf_pop_en       (ctrl_ibuf_pop_en      ),
  .ctrl_ifetch_req_abort  (ctrl_ifetch_req_abort ),
  .ctrl_ifetch_req_vld    (ctrl_ifetch_req_vld   ),
  .ctrl_pcgen_inst_vld    (ctrl_pcgen_inst_vld   ),
  .ctrl_pcgen_pipedown    (ctrl_pcgen_pipedown   ),
  .ibuf_ctrl_inst_fetch   (ibuf_ctrl_inst_fetch  ),
  .id_pred_ctrl_stall     (id_pred_ctrl_stall    ),
  .idu_ifu_id_stall       (idu_ifu_id_stall      ),
  .idu_ifu_tail_vld       (idu_ifu_tail_vld      ),
  .ifetch_ctrl_inst_vld   (ifetch_ctrl_inst_vld  ),
  .pcgen_ctrl_chgflw_vld  (pcgen_ctrl_chgflw_vld ),
  .rtu_ifu_dbg_mask       (rtu_ifu_dbg_mask      ),
  .rtu_ifu_flush_fe       (rtu_ifu_flush_fe      ),
  .rtu_ifu_lockup_mask    (rtu_ifu_lockup_mask   ),
  .rtu_ifu_lockup_req     (rtu_ifu_lockup_req    ),
  .rtu_yy_xx_dbgon        (rtu_yy_xx_dbgon       ),
  .rtu_yy_xx_tail_int_vld (rtu_yy_xx_tail_int_vld),
  .sysio_xx_halt_req      (sysio_xx_halt_req     ),
  .vec_ctrl_reset_mask    (vec_ctrl_reset_mask   ),
  .vec_ctrl_seq_mask      (vec_ctrl_seq_mask     )
);


// ID Stage Prediction Module
// &Instance("pa_ifu_id_pred"); @51
pa_ifu_id_pred  x_pa_ifu_id_pred (
  .bht_top_cur_st            (bht_top_cur_st           ),
  .cp0_ifu_bht_en            (cp0_ifu_bht_en           ),
  .cp0_ifu_bht_inv           (cp0_ifu_bht_inv          ),
  .cp0_ifu_icg_en            (cp0_ifu_icg_en           ),
  .cp0_ifu_ras_en            (cp0_ifu_ras_en           ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .dtu_ifu_halt_info0        (dtu_ifu_halt_info0       ),
  .dtu_ifu_halt_info1        (dtu_ifu_halt_info1       ),
  .forever_cpuclk            (forever_cpuclk           ),
  .ibuf_id_pred_hungry       (ibuf_id_pred_hungry      ),
  .ibuf_ipack_stall          (ibuf_ipack_stall         ),
  .ibuf_pred_stall           (ibuf_pred_stall          ),
  .id_pred_btb_cur_pc        (id_pred_btb_cur_pc       ),
  .id_pred_btb_mis_pred      (id_pred_btb_mis_pred     ),
  .id_pred_btb_mis_predg     (id_pred_btb_mis_predg    ),
  .id_pred_btb_tar_pc        (id_pred_btb_tar_pc       ),
  .id_pred_btb_upd_vld       (id_pred_btb_upd_vld      ),
  .id_pred_btb_upd_vldg      (id_pred_btb_upd_vldg     ),
  .id_pred_ctrl_stall        (id_pred_ctrl_stall       ),
  .id_pred_ibuf_br_taken0    (id_pred_ibuf_br_taken0   ),
  .id_pred_ibuf_br_taken1    (id_pred_ibuf_br_taken1   ),
  .id_pred_ibuf_chgflw_vld0  (id_pred_ibuf_chgflw_vld0 ),
  .id_pred_ibuf_halt_info0   (id_pred_ibuf_halt_info0  ),
  .id_pred_ibuf_halt_info1   (id_pred_ibuf_halt_info1  ),
  .id_pred_ipack_chgflw_vld0 (id_pred_ipack_chgflw_vld0),
  .id_pred_ipack_delay_stall (id_pred_ipack_delay_stall),
  .id_pred_ipack_mask        (id_pred_ipack_mask       ),
  .id_pred_ipack_ret_stall   (id_pred_ipack_ret_stall  ),
  .id_pred_pcgen_chgflw_pc   (id_pred_pcgen_chgflw_pc  ),
  .id_pred_pcgen_chgflw_vld  (id_pred_pcgen_chgflw_vld ),
  .id_pred_pcgen_inst_vld    (id_pred_pcgen_inst_vld   ),
  .idu_ifu_x1                (idu_ifu_x1               ),
  .ifu_cp0_bht_inv_done      (ifu_cp0_bht_inv_done     ),
  .ifu_dtu_addr_vld0         (ifu_dtu_addr_vld0        ),
  .ifu_dtu_addr_vld1         (ifu_dtu_addr_vld1        ),
  .ifu_dtu_data_vld0         (ifu_dtu_data_vld0        ),
  .ifu_dtu_data_vld1         (ifu_dtu_data_vld1        ),
  .ifu_dtu_exe_addr0         (ifu_dtu_exe_addr0        ),
  .ifu_dtu_exe_addr1         (ifu_dtu_exe_addr1        ),
  .ifu_dtu_exe_data0         (ifu_dtu_exe_data0        ),
  .ifu_dtu_exe_data1         (ifu_dtu_exe_data1        ),
  .ifu_iu_ex1_pc_pred        (ifu_iu_ex1_pc_pred       ),
  .ipack_id_pred_h0_create   (ipack_id_pred_h0_create  ),
  .ipack_id_pred_h0_vld      (ipack_id_pred_h0_vld     ),
  .ipack_id_pred_inst0       (ipack_id_pred_inst0      ),
  .ipack_id_pred_inst0_expt  (ipack_id_pred_inst0_expt ),
  .ipack_id_pred_inst0_vld   (ipack_id_pred_inst0_vld  ),
  .ipack_id_pred_inst1       (ipack_id_pred_inst1      ),
  .ipack_id_pred_inst1_expt  (ipack_id_pred_inst1_expt ),
  .ipack_id_pred_inst1_vld   (ipack_id_pred_inst1_vld  ),
  .ipack_id_pred_new_vld     (ipack_id_pred_new_vld    ),
  .ipack_id_pred_unalign     (ipack_id_pred_unalign    ),
  .iu_ifu_bht_cur_pc         (iu_ifu_bht_cur_pc        ),
  .iu_ifu_bht_mispred        (iu_ifu_bht_mispred       ),
  .iu_ifu_bht_mispred_gate   (iu_ifu_bht_mispred_gate  ),
  .iu_ifu_bht_pred           (iu_ifu_bht_pred          ),
  .iu_ifu_bht_taken          (iu_ifu_bht_taken         ),
  .iu_ifu_br_vld             (iu_ifu_br_vld            ),
  .iu_ifu_br_vld_gate        (iu_ifu_br_vld_gate       ),
  .iu_ifu_ind_link_vld       (iu_ifu_ind_link_vld      ),
  .iu_ifu_link_vld           (iu_ifu_link_vld          ),
  .iu_ifu_link_vld_gate      (iu_ifu_link_vld_gate     ),
  .iu_ifu_pc_mispred         (iu_ifu_pc_mispred        ),
  .iu_ifu_pc_mispred_gate    (iu_ifu_pc_mispred_gate   ),
  .iu_ifu_ret_vld            (iu_ifu_ret_vld           ),
  .iu_ifu_ret_vld_gate       (iu_ifu_ret_vld_gate      ),
  .iu_yy_xx_cancel           (iu_yy_xx_cancel          ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .pcgen_id_pred_btb_tar_pc  (pcgen_id_pred_btb_tar_pc ),
  .pcgen_id_pred_btb_tar_vld (pcgen_id_pred_btb_tar_vld),
  .pcgen_id_pred_flush_vld   (pcgen_id_pred_flush_vld  ),
  .pcgen_id_pred_idpc        (pcgen_id_pred_idpc       ),
  .pcgen_id_pred_ifpc        (pcgen_id_pred_ifpc       ),
  .pred_top_delay_chgflw     (pred_top_delay_chgflw    ),
  .pred_top_ras_st           (pred_top_ras_st          ),
  .rtu_ifu_flush_fe          (rtu_ifu_flush_fe         )
);


// Vector Module
// &Instance("pa_ifu_vec"); @54
pa_ifu_vec  x_pa_ifu_vec (
  .cp0_ifu_icg_en          (cp0_ifu_icg_en         ),
  .cp0_ifu_mtvec           (cp0_ifu_mtvec          ),
  .cp0_ifu_rst_inv_done    (cp0_ifu_rst_inv_done   ),
  .cp0_yy_clk_en           (cp0_yy_clk_en          ),
  .cpurst_b                (cpurst_b               ),
  .dtu_ifu_halt_on_reset   (dtu_ifu_halt_on_reset  ),
  .forever_cpuclk          (forever_cpuclk         ),
  .ifetch_vec_acc_err      (ifetch_vec_acc_err     ),
  .ifetch_vec_cmplt        (ifetch_vec_cmplt       ),
  .ifetch_vec_grant        (ifetch_vec_grant       ),
  .ifetch_vec_idle         (ifetch_vec_idle        ),
  .ifu_clic_warm_up        (ifu_clic_warm_up       ),
  .ifu_cp0_rst_inv_req     (ifu_cp0_rst_inv_req    ),
  .ifu_cp0_vec_err         (ifu_cp0_vec_err        ),
  .ifu_cp0_vec_succeed     (ifu_cp0_vec_succeed    ),
  .ifu_cp0_warm_up         (ifu_cp0_warm_up        ),
  .ifu_fpu_warm_up         (ifu_fpu_warm_up        ),
  .ifu_idu_warm_up         (ifu_idu_warm_up        ),
  .ifu_iu_reset_vld        (ifu_iu_reset_vld       ),
  .ifu_iu_warm_up          (ifu_iu_warm_up         ),
  .ifu_lsu_warm_up         (ifu_lsu_warm_up        ),
  .ifu_rtu_reset_halt_req  (ifu_rtu_reset_halt_req ),
  .ifu_rtu_warm_up         (ifu_rtu_warm_up        ),
  .ifu_sysmap_rst_sample   (ifu_sysmap_rst_sample  ),
  .ifu_xx_in_warm_up       (ifu_xx_in_warm_up      ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .rtu_ifu_lockup_expt_vld (rtu_ifu_lockup_expt_vld),
  .rtu_yy_xx_dbgon         (rtu_yy_xx_dbgon        ),
  .rtu_yy_xx_expt_int      (rtu_yy_xx_expt_int     ),
  .rtu_yy_xx_expt_vld      (rtu_yy_xx_expt_vld     ),
  .rtu_yy_xx_int_hv        (rtu_yy_xx_int_hv       ),
  .rtu_yy_xx_tail_int_vld  (rtu_yy_xx_tail_int_vld ),
  .sysio_ifu_rst_addr_done (sysio_ifu_rst_addr_done),
  .vec_ctrl_reset_mask     (vec_ctrl_reset_mask    ),
  .vec_ctrl_seq_mask       (vec_ctrl_seq_mask      ),
  .vec_ibuf_warm_up        (vec_ibuf_warm_up       ),
  .vec_ifetch_data_fetch   (vec_ifetch_data_fetch  ),
  .vec_ipack_inst_mask     (vec_ipack_inst_mask    ),
  .vec_pcgen_chgflw_vld    (vec_pcgen_chgflw_vld   ),
  .vec_pcgen_idle          (vec_pcgen_idle         ),
  .vec_pcgen_inst_fetch    (vec_pcgen_inst_fetch   ),
  .vec_pcgen_iu_chgflw     (vec_pcgen_iu_chgflw    ),
  .vec_pcgen_pc_flop       (vec_pcgen_pc_flop      ),
  .vec_pcgen_rst_vld       (vec_pcgen_rst_vld      ),
  .vec_pcgen_tar_pc        (vec_pcgen_tar_pc       ),
  .vec_top_cur_st          (vec_top_cur_st         )
);


assign ifu_dtu_debug_info[26:0] = {
                              bht_top_cur_st[1:0],
                              pred_top_ras_st,
                              pred_top_delay_chgflw,
                              ibuf_top_id_stall,
                              ibuf_top_vld_num[2:0],
                              ipack_top_entry2_vld,
                              ipack_top_entry1_vld,
                              ipack_top_entry0_vld,
                              icache_top_uc_st,
                              icache_top_abort,
                              icache_top_ref_st[1:0],
                              icache_top_rd_vld,
                              ifetch_top_abt_st[1:0],
                              ifetch_top_cur_st[2:0],
                              pcgen_top_btb_tar_vld,
                              pcgen_top_buf_chgflw,
                              vec_top_cur_st[3:0]
                              };


// &ModuleEnd; @253
endmodule


