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
module pa_ifu_icache(
  bmu_ifu_acc_err,
  cp0_ifu_icache_en,
  cp0_ifu_icache_inv_addr,
  cp0_ifu_icache_inv_req,
  cp0_ifu_icache_inv_type,
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_ifetch_req_abort,
  ctrl_ifetch_req_vld,
  forever_cpuclk,
  ibus_icache_cmplt,
  ibus_icache_data,
  ibus_icache_error,
  ibus_icache_grant,
  ibus_icache_not_busy,
  ibus_icache_uc_cmplt,
  ibus_icache_unalign,
  ibus_trans_abort,
  icache_ibus_acc_deny,
  icache_ibus_addr,
  icache_ibus_burst,
  icache_ibus_data_req,
  icache_ibus_prot,
  icache_ibus_req,
  icache_ibus_seq,
  icache_ifetch_addr,
  icache_ifetch_error,
  icache_ifetch_grant,
  icache_ifetch_idle,
  icache_ifetch_inst,
  icache_ifetch_inst_vld,
  icache_ifetch_inst_vld_gate,
  icache_ifetch_mach_mode,
  icache_ifetch_not_busy,
  icache_ifetch_rd_addr,
  icache_ifetch_uc_sel,
  icache_ifetch_unalign,
  icache_ifetch_vec_data_cmplt,
  icache_top_abort,
  icache_top_rd_vld,
  icache_top_ref_st,
  icache_top_uc_st,
  ifetch_outstanding,
  ifetch_req_addr,
  ifetch_req_ca,
  ifetch_req_prot,
  ifu_cp0_icache_inv_done,
  ifu_hpcp_icache_access,
  ifu_hpcp_icache_miss,
  pad_yy_icg_scan_en,
  pcgen_ifetch_chgflw_vld,
  pcgen_ifetch_seq_addr,
  pmp_ifu_acc_deny,
  vec_ifetch_data_fetch
);

// &Ports; @24
input           bmu_ifu_acc_err;             
input           cp0_ifu_icache_en;           
input   [31:0]  cp0_ifu_icache_inv_addr;     
input           cp0_ifu_icache_inv_req;      
input           cp0_ifu_icache_inv_type;     
input           cp0_ifu_icg_en;              
input           cp0_yy_clk_en;               
input           cpurst_b;                    
input           ctrl_ifetch_req_abort;       
input           ctrl_ifetch_req_vld;         
input           forever_cpuclk;              
input           ibus_icache_cmplt;           
input   [31:0]  ibus_icache_data;            
input           ibus_icache_error;           
input           ibus_icache_grant;           
input           ibus_icache_not_busy;        
input           ibus_icache_uc_cmplt;        
input           ibus_icache_unalign;         
input           ibus_trans_abort;            
input           ifetch_outstanding;          
input   [31:0]  ifetch_req_addr;             
input           ifetch_req_ca;               
input   [3 :0]  ifetch_req_prot;             
input           pad_yy_icg_scan_en;          
input           pcgen_ifetch_chgflw_vld;     
input   [31:0]  pcgen_ifetch_seq_addr;       
input           pmp_ifu_acc_deny;            
input           vec_ifetch_data_fetch;       
output          icache_ibus_acc_deny;        
output  [31:0]  icache_ibus_addr;            
output  [2 :0]  icache_ibus_burst;           
output          icache_ibus_data_req;        
output  [3 :0]  icache_ibus_prot;            
output          icache_ibus_req;             
output          icache_ibus_seq;             
output  [31:0]  icache_ifetch_addr;          
output          icache_ifetch_error;         
output          icache_ifetch_grant;         
output          icache_ifetch_idle;          
output  [31:0]  icache_ifetch_inst;          
output          icache_ifetch_inst_vld;      
output          icache_ifetch_inst_vld_gate; 
output          icache_ifetch_mach_mode;     
output          icache_ifetch_not_busy;      
output  [31:0]  icache_ifetch_rd_addr;       
output          icache_ifetch_uc_sel;        
output          icache_ifetch_unalign;       
output          icache_ifetch_vec_data_cmplt; 
output          icache_top_abort;            
output          icache_top_rd_vld;           
output  [1 :0]  icache_top_ref_st;           
output          icache_top_uc_st;            
output          ifu_cp0_icache_inv_done;     
output          ifu_hpcp_icache_access;      
output          ifu_hpcp_icache_miss;        

// &Regs; @25
reg     [26:0]  buf_hit_tag;                 
reg             buf_hit_way;                 
reg             direct_sel;                  
reg     [31:0]  icache_addr_ff;              
reg             icache_ca_ff;                
reg             icache_deny;                 
reg             icache_en;                   
reg             icache_en_f;                 
reg     [31:0]  icache_rd_addr;              
reg     [3 :0]  icache_rd_prot;              
reg             icache_rd_vld;               
reg     [31:0]  icache_refill_addr;          
reg             icache_refill_fifo;          
reg     [3 :0]  icache_refill_prot;          
reg             icache_vec_data;             
reg     [9 :0]  inv_cnt;                     
reg     [1 :0]  inv_cur_st;                  
reg     [1 :0]  inv_nxt_st;                  
reg     [1 :0]  ipa_way_sel;                 
reg     [2 :0]  ref_cnt;                     
reg     [1 :0]  ref_cur_st;                  
reg     [1 :0]  ref_nxt_st;                  
reg             ref_vld;                     
reg     [31:0]  refill_data;                 
reg             refill_data_abort;           
reg     [2 :0]  req_cnt;                     
reg             tag_hit_vld;                 
reg             uc_cur_st;                   
reg             uc_nxt_st;                   

// &Wires; @26
wire            addr_equal;                  
wire            bmu_ifu_acc_err;             
wire            buf_clr_en;                  
wire            buf_hit_upd;                 
wire            buf_rfl_upd;                 
wire            buf_upd_en;                  
wire            cen_mask_vld;                
wire            cp0_ifu_icache_en;           
wire    [31:0]  cp0_ifu_icache_inv_addr;     
wire            cp0_ifu_icache_inv_req;      
wire            cp0_ifu_icache_inv_type;     
wire            cp0_ifu_icg_en;              
wire            cp0_yy_clk_en;               
wire            cpurst_b;                    
wire            ctrl_ifetch_req_abort;       
wire            ctrl_ifetch_req_vld;         
wire            forever_cpuclk;              
wire            hit_clk;                     
wire    [26:0]  hit_tag;                     
wire            hit_way;                     
wire            ibus_icache_cmplt;           
wire    [31:0]  ibus_icache_data;            
wire            ibus_icache_error;           
wire            ibus_icache_grant;           
wire            ibus_icache_not_busy;        
wire            ibus_icache_uc_cmplt;        
wire            ibus_icache_unalign;         
wire            ibus_trans_abort;            
wire            icache_addr_clk;             
wire            icache_addr_icg_en;          
wire            icache_bypass_vld;           
wire    [21:0]  icache_cmp_tag;              
wire    [21:0]  icache_cmp_tag_fin;          
wire            icache_cmplt;                
wire    [31:0]  icache_data0_dout;           
wire    [31:0]  icache_data1_dout;           
wire    [1 :0]  icache_data_cen;             
wire    [31:0]  icache_data_din;             
wire    [12:0]  icache_data_idx;             
wire            icache_data_req;             
wire    [1 :0]  icache_data_wen;             
wire            icache_hit;                  
wire            icache_hit0;                 
wire            icache_hit1;                 
wire    [31:0]  icache_hit_inst;             
wire            icache_hit_vld;              
wire            icache_ibus_acc_deny;        
wire    [31:0]  icache_ibus_addr;            
wire    [2 :0]  icache_ibus_burst;           
wire            icache_ibus_data_req;        
wire    [3 :0]  icache_ibus_prot;            
wire            icache_ibus_req;             
wire            icache_ibus_seq;             
wire    [31:0]  icache_ifetch_addr;          
wire            icache_ifetch_error;         
wire            icache_ifetch_grant;         
wire            icache_ifetch_idle;          
wire    [31:0]  icache_ifetch_inst;          
wire            icache_ifetch_inst_vld;      
wire            icache_ifetch_inst_vld_gate; 
wire            icache_ifetch_mach_mode;     
wire            icache_ifetch_not_busy;      
wire    [31:0]  icache_ifetch_rd_addr;       
wire            icache_ifetch_uc_sel;        
wire            icache_ifetch_unalign;       
wire            icache_ifetch_vec_data_cmplt; 
wire            icache_inv_clk;              
wire    [46:0]  icache_inv_din;              
wire            icache_inv_done;             
wire            icache_inv_icg_en;           
wire    [9 :0]  icache_inv_idx;              
wire            icache_inv_rd;               
wire            icache_inv_req;              
wire    [2 :0]  icache_inv_wen;              
wire            icache_inv_wt;               
wire    [31:0]  icache_miss_addr;            
wire    [3 :0]  icache_miss_prot;            
wire            icache_miss_req;             
wire            icache_rd_clk;               
wire    [12:0]  icache_rd_data_idx;          
wire            icache_rd_icg_en;            
wire            icache_rd_req;               
wire            icache_rd_req_data;          
wire    [9 :0]  icache_rd_tag_idx;           
wire            icache_refdp_clk;            
wire            icache_refdp_icg_en;         
wire            icache_reffsm_clk;           
wire            icache_reffsm_icg_en;        
wire            icache_refill_ca;            
wire            icache_req;                  
wire            icache_req_vld;              
wire            icache_tag_cen;              
wire    [46:0]  icache_tag_din;              
wire    [46:0]  icache_tag_dout;             
wire            icache_tag_fifo;             
wire    [9 :0]  icache_tag_idx;              
wire    [21:0]  icache_tag_way0_dout;        
wire            icache_tag_way0_vld;         
wire    [21:0]  icache_tag_way1_dout;        
wire            icache_tag_way1_vld;         
wire    [2 :0]  icache_tag_wen;              
wire            icache_top_abort;            
wire            icache_top_rd_vld;           
wire    [1 :0]  icache_top_ref_st;           
wire            icache_top_uc_st;            
wire            icache_uc_data_req;          
wire            icache_uc_req;               
wire            icache_uc_sel;               
wire            icache_way0_hit;             
wire            icache_way1_hit;             
wire    [12:0]  icache_wr_data_idx;          
wire            icache_wr_data_req;          
wire            ifetch_outstanding;          
wire    [31:0]  ifetch_req_addr;             
wire            ifetch_req_ca;               
wire    [3 :0]  ifetch_req_prot;             
wire            ifu_cp0_icache_inv_done;     
wire            ifu_hpcp_icache_access;      
wire            ifu_hpcp_icache_miss;        
wire            inv_cnt_en;                  
wire    [9 :0]  inv_cnt_inc;                 
wire            inv_fsm_idle;                
wire            inv_fsm_write;               
wire            inv_tag_wen;                 
wire            inv_type_pa;                 
wire    [1 :0]  inv_way_sel;                 
wire            pad_yy_icg_scan_en;          
wire            pcgen_ifetch_chgflw_vld;     
wire    [31:0]  pcgen_ifetch_seq_addr;       
wire            pmp_ifu_acc_deny;            
wire            ref_cnt_done;                
wire    [2 :0]  ref_cnt_inc;                 
wire            ref_fsm_idle;                
wire            ref_fsm_ref;                 
wire            ref_fsm_req;                 
wire            ref_fsm_wfc;                 
wire            ref_rdy;                     
wire    [31:0]  refill_addr;                 
wire    [31:0]  refill_icache_addr;          
wire    [31:0]  refill_icache_data;          
wire            refill_icache_done;          
wire            refill_icache_fifo;          
wire            refill_icache_init;          
wire            refill_icache_req;           
wire    [46:0]  refill_inv_tag_din;          
wire    [9 :0]  refill_inv_tag_idx;          
wire            refill_inv_tag_req;          
wire    [2 :0]  refill_inv_tag_wen;          
wire    [46:0]  refill_tag_din;              
wire    [2 :0]  refill_tag_wen;              
wire            refill_tag_wr;               
wire    [31:0]  req_addr;                    
wire            req_cnt_done;                
wire            tag_hit_clk_en;              
wire            uc_fsm_idle;                 
wire            uc_fsm_wfc;                  
wire            vec_ifetch_data_fetch;       


//==========================================================
// Instruction Cache Module
// 1. Instance ICG cell
// 2. I-Cache Request Generation
// 3. Instance I-Cache Array
// 4. I-Cache Hit Judge and Data Select
// 5. I-Cache Refill Control
//==========================================================

//------------------------------------------------
// 1. Instance ICG cell
//------------------------------------------------
assign icache_rd_icg_en = icache_rd_req & ref_rdy
                       | direct_sel;
// &Instance("gated_clk_cell", "x_ifu_icache_rd_icg_cell"); @42
gated_clk_cell  x_ifu_icache_rd_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icache_rd_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (icache_rd_icg_en  ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @43
//          .external_en (1'b0), @44
//          .global_en   (cp0_yy_clk_en), @45
//          .module_en   (cp0_ifu_icg_en), @46
//          .local_en    (icache_rd_icg_en), @47
//          .clk_out     (icache_rd_clk) @48
//        ); @49

assign icache_refdp_icg_en = icache_miss_req & ref_fsm_idle;
// &Instance("gated_clk_cell", "x_ifu_icache_refdp_icg_cell"); @52
gated_clk_cell  x_ifu_icache_refdp_icg_cell (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (icache_refdp_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (icache_refdp_icg_en),
  .module_en           (cp0_ifu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @53
//          .external_en (1'b0), @54
//          .global_en   (cp0_yy_clk_en), @55
//          .module_en   (cp0_ifu_icg_en), @56
//          .local_en    (icache_refdp_icg_en), @57
//          .clk_out     (icache_refdp_clk) @58
//        ); @59

assign icache_reffsm_icg_en = icache_miss_req | ~ref_fsm_idle
                            | icache_uc_req | ~uc_fsm_idle;
// &Instance("gated_clk_cell", "x_ifu_icache_reffsm_icg_cell"); @63
gated_clk_cell  x_ifu_icache_reffsm_icg_cell (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (icache_reffsm_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (icache_reffsm_icg_en),
  .module_en            (cp0_ifu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in      (forever_cpuclk), @64
//          .external_en (1'b0), @65
//          .global_en   (cp0_yy_clk_en), @66
//          .module_en   (cp0_ifu_icg_en), @67
//          .local_en    (icache_reffsm_icg_en), @68
//          .clk_out     (icache_reffsm_clk) @69
//        ); @70

assign icache_addr_icg_en = icache_rd_req_data
                          | icache_uc_data_req;
// &Instance("gated_clk_cell", "x_ifu_icache_addr_icg_cell"); @74
gated_clk_cell  x_ifu_icache_addr_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icache_addr_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (icache_addr_icg_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @75
//          .external_en (1'b0), @76
//          .global_en   (cp0_yy_clk_en), @77
//          .module_en   (cp0_ifu_icg_en), @78
//          .local_en    (icache_addr_icg_en), @79
//          .clk_out     (icache_addr_clk) @80
//        ); @81

assign icache_inv_icg_en = ~inv_fsm_idle;
// &Instance("gated_clk_cell", "x_ifu_icache_inv_icg_cell"); @84
gated_clk_cell  x_ifu_icache_inv_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icache_inv_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (icache_inv_icg_en ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @85
//          .external_en (1'b0), @86
//          .global_en   (cp0_yy_clk_en), @87
//          .module_en   (cp0_ifu_icg_en), @88
//          .local_en    (icache_inv_icg_en), @89
//          .clk_out     (icache_inv_clk) @90
//        ); @91

//------------------------------------------------
// 2. I-Cache Request Generation
// a. I-Cache Read Request
// b. I-Cache Write Request
// c. I-Cache Tag hit buffer
// d. I-Cache Request
//------------------------------------------------

// a. I-Cache Read Request
// Generate Chip Enable and Index

// Read Chip Enable
// request valid when i-cache enable and sysmap cacheable
assign icache_req_vld = (ctrl_ifetch_req_vld | vec_ifetch_data_fetch) 
                      & inv_fsm_idle & ref_fsm_idle & uc_fsm_idle;
assign icache_rd_req = icache_req_vld & ifetch_req_ca & cp0_ifu_icache_en;
assign icache_rd_req_data = icache_req_vld & icache_ca_ff;
assign icache_uc_req = (ctrl_ifetch_req_vld | vec_ifetch_data_fetch) 
                     & inv_fsm_idle & ref_fsm_idle & ~icache_rd_vld
                     & ~(ifetch_req_ca & cp0_ifu_icache_en);
assign icache_uc_data_req = (ctrl_ifetch_req_vld | vec_ifetch_data_fetch) 
                     & inv_fsm_idle & ref_fsm_idle & ~icache_rd_vld;
assign icache_uc_sel = inv_fsm_idle & ref_fsm_idle & ~icache_rd_vld
                     & ~(ifetch_req_ca & cp0_ifu_icache_en)
                     | uc_fsm_wfc;

// Read Index
// calculate icache read index depending on cache capcity
// cache line size: 32-Bytes
//  2KB: tag index: addr[10:5], data index: addr[10:2]
//  4KB: tag index: addr[11:5], data index: addr[11:2]
//                 ...
// 64KB: tag index: addr[15:5], data index: addr[15:2]
assign icache_rd_tag_idx[9:0]   = ifetch_req_addr[14:5];
assign icache_rd_data_idx[12:0] = ifetch_req_addr[14:2];

// b. I-Cache Write Request
// Generate Chip Enable, Index

// Write Chip Enable
// request valid when invalid request or refill request
assign refill_tag_wr = refill_icache_req & 
                          (refill_icache_done | refill_icache_init);
assign refill_tag_wen[2:0] = {3{refill_tag_wr}} & {refill_icache_init, 
                                                   icache_refill_fifo,
                                                  ~icache_refill_fifo};
assign refill_tag_din[46:0] = {~refill_icache_fifo,
                               refill_icache_done, refill_icache_addr[31:10],
                               refill_icache_done, refill_icache_addr[31:10]};

assign refill_inv_tag_req       = refill_tag_wr | icache_inv_req;
assign refill_inv_tag_wen[2:0]  = icache_inv_req ? icache_inv_wen[2:0]
                                                 : refill_tag_wen[2:0];
assign refill_inv_tag_idx[9:0]  = icache_inv_req ? icache_inv_idx[9:0]
                                                 : refill_icache_addr[14:5];
assign refill_inv_tag_din[46:0] = icache_inv_req ? icache_inv_din[46:0]
                                                 : refill_tag_din[46:0];

assign icache_wr_data_req       = refill_icache_req;
assign icache_wr_data_idx[12:0] = refill_icache_addr[14:2];

// c. I-Cache Tag hit buffer
// Tag Hit Buffer for cache memory low power
// including buffer valid, hit tag, hit way
// Instance ICG
assign tag_hit_clk_en = buf_upd_en | buf_clr_en;
// &Instance("gated_clk_cell","x_gated_hit_clk_cell"); @159
gated_clk_cell  x_gated_hit_clk_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (hit_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (tag_hit_clk_en    ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in     (forever_cpuclk), @160
//          .global_en  (cp0_yy_clk_en ), @161
//          .module_en  (cp0_ifu_icg_en), @162
//          .local_en   (tag_hit_clk_en), @163
//          .external_en(1'b0          ), @164
//          .clk_out    (hit_clk       )); @165

// buffer update:
// update when refill final or read hit
assign buf_rfl_upd = refill_icache_req & refill_icache_done;
assign buf_hit_upd = icache_rd_vld & ~direct_sel 
                 & (icache_way1_hit | icache_way0_hit);

// buf update when refill last or hit valid
assign buf_upd_en = buf_rfl_upd | buf_hit_upd;

// buf clear when refill first req or invalid one req or invalid all last
assign buf_clr_en = refill_icache_req & refill_icache_init | cp0_ifu_icache_inv_req;


always @ (posedge hit_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    tag_hit_vld <= 1'b0;
  else if(buf_clr_en)
    tag_hit_vld <= 1'b0;
  else if(buf_upd_en)
    tag_hit_vld <= 1'b1;
  else
    tag_hit_vld <= tag_hit_vld;
end

always @ (posedge icache_rd_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    direct_sel <= 1'b0;
  else if(icache_rd_req & ref_rdy & cen_mask_vld)
    direct_sel <= 1'b1;
  else if(direct_sel)
    direct_sel <= 1'b0;
  else
    direct_sel <= direct_sel;
end

assign hit_tag[26:0] = buf_rfl_upd ? refill_icache_addr[31:5] : icache_rd_addr[31:5];
assign hit_way       = buf_rfl_upd ? icache_data_wen[1] : icache_way1_hit;
always @ (posedge hit_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    buf_hit_tag[26:0] <= 27'b0;
    buf_hit_way       <= 1'b0;
  end
  else if(buf_upd_en)
  begin
    buf_hit_tag[26:0] <= hit_tag[26:0];
    buf_hit_way       <= hit_way;
  end
end

assign addr_equal   = pcgen_ifetch_seq_addr[31:5] == buf_hit_tag[26:0];

assign cen_mask_vld = tag_hit_vld & addr_equal & ~pcgen_ifetch_chgflw_vld & ~buf_upd_en;

// d. I-Cache Request
// Generate Chip Enable, Write Enable, Index, Tag In and Data In
// request priority : refill > inv > cache_rd

assign icache_tag_cen       = icache_rd_req_data & ~cen_mask_vld
                           | refill_inv_tag_req;
assign icache_tag_wen[2:0]  = icache_rd_req_data ? 3'b0 : refill_inv_tag_wen[2:0];
assign icache_tag_idx[9:0]  = icache_rd_req_data ? icache_rd_tag_idx[9:0]
                                            : refill_inv_tag_idx[9:0];
assign icache_tag_din[46:0] = refill_inv_tag_din[46:0];

//data ram access
assign icache_data_cen[1:0] = {(cen_mask_vld ?  buf_hit_way : icache_rd_req_data)
                            | icache_data_wen[1],
                               (cen_mask_vld ? ~buf_hit_way : icache_rd_req_data)
                            | icache_data_wen[0]};
assign icache_data_wen[1:0] = {icache_wr_data_req &  icache_refill_fifo,
                               icache_wr_data_req & ~icache_refill_fifo};
assign icache_data_idx[12:0] = icache_rd_req_data ? icache_rd_data_idx[12:0]
                                             : icache_wr_data_idx[12:0];
assign icache_data_din[31:0] = refill_icache_data[31:0];

//------------------------------------------------
// 3. Instance I-Cache Array
//------------------------------------------------
// &Instance("pa_ifu_icache_tag_array", "x_pa_ifu_icache_tag_array"); @249
pa_ifu_icache_tag_array  x_pa_ifu_icache_tag_array (
  .cp0_ifu_icg_en     (cp0_ifu_icg_en    ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .icache_tag_cen     (icache_tag_cen    ),
  .icache_tag_din     (icache_tag_din    ),
  .icache_tag_dout    (icache_tag_dout   ),
  .icache_tag_idx     (icache_tag_idx    ),
  .icache_tag_wen     (icache_tag_wen    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_ifu_icache_data_array", "x_pa_ifu_icache_data_array"); @250
pa_ifu_icache_data_array  x_pa_ifu_icache_data_array (
  .cp0_ifu_icg_en     (cp0_ifu_icg_en    ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .forever_cpuclk     (forever_cpuclk    ),
  .icache_data0_dout  (icache_data0_dout ),
  .icache_data1_dout  (icache_data1_dout ),
  .icache_data_cen    (icache_data_cen   ),
  .icache_data_din    (icache_data_din   ),
  .icache_data_idx    (icache_data_idx   ),
  .icache_data_wen    (icache_data_wen   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);


//------------------------------------------------
// 4. I-Cache Hit Judge and Data Select
// a. Cache Tag and Data output
// b. Cache Tag Compare
// c. Cache Data Select
// d. Cache Miss Generation
//------------------------------------------------

// a. Cache Tag and Data output
assign icache_tag_fifo            = icache_tag_dout[46];
assign icache_tag_way1_vld        = icache_tag_dout[45];
assign icache_tag_way1_dout[21:0] = icache_tag_dout[44:23];
assign icache_tag_way0_vld        = icache_tag_dout[22];
assign icache_tag_way0_dout[21:0] = icache_tag_dout[21:0];

// b. Cache Tag Compare
always @ (posedge forever_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    icache_rd_vld <= 1'b0;
  else if(icache_rd_req & ref_rdy & icache_ca_ff)
    icache_rd_vld <= 1'b1;
  else
    icache_rd_vld <= 1'b0;
end
assign icache_ifetch_idle = ~icache_rd_vld & ref_fsm_idle
                          & uc_fsm_idle;

always @ (posedge icache_rd_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    icache_rd_addr[31:0] <= 32'b0;
    icache_rd_prot[3:0]  <= 4'b0;
    icache_vec_data      <= 1'b0;
    icache_en            <= 1'b0;
    icache_deny          <= 1'b0;
  end
  else if(icache_rd_req & ref_rdy & icache_ca_ff)
  begin
    icache_rd_addr[31:0] <= ifetch_req_addr[31:0];
    icache_rd_prot[3:0]  <= ifetch_req_prot[3:0];
    icache_vec_data      <= vec_ifetch_data_fetch;
    icache_en            <= cp0_ifu_icache_en;
    icache_deny          <= pmp_ifu_acc_deny;
  end
  else
  begin
    icache_rd_addr[31:0] <= icache_rd_addr[31:0];
    icache_rd_prot[3:0]  <= icache_rd_prot[3:0];
    icache_vec_data      <= icache_vec_data;
    icache_en            <= icache_en;
    icache_deny          <= icache_deny;
  end
end
always @ (posedge icache_rd_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    icache_ca_ff <= 1'b0;
  else if(icache_rd_req)
    icache_ca_ff <= ifetch_req_ca & cp0_ifu_icache_en;
  else
    icache_ca_ff <= icache_ca_ff;
end
// &Force("nonport", "icache_cmp_tag"); @316
// &Force("nonport", "icache_cmp_tag_fin"); @317
// &Force("nonport", "icache_inv_done"); @318
// &Force("nonport", "inv_cnt_inc"); @319
// &Force("bus", "pcgen_ifetch_seq_addr", 31, 0); @320

assign icache_cmp_tag[21:0] = inv_tag_wen ? cp0_ifu_icache_inv_addr[31:10] : icache_rd_addr[31:10];
//csky vperl_off
`ifdef ICACHE_2K
assign icache_cmp_tag_fin[21:0] = icache_cmp_tag[21:0];
`else
assign icache_cmp_tag_fin[21:0] = {{(22-`I_TAG_TAG_WIDTH){1'b0}}, 
                   icache_cmp_tag[21:22-`I_TAG_TAG_WIDTH]};
                                                   
`endif
//csky vperl_on
assign icache_way1_hit = {icache_tag_way1_vld, icache_tag_way1_dout[21:0]}
                      == {1'b1,  icache_cmp_tag_fin[21:0]};
assign icache_way0_hit = {icache_tag_way0_vld, icache_tag_way0_dout[21:0]}
                      == {1'b1,  icache_cmp_tag_fin[21:0]};

assign icache_hit      = (icache_way1_hit | icache_way0_hit) & icache_en
                       | icache_deny | direct_sel;

assign icache_hit_vld        = icache_hit & icache_rd_vld;
assign icache_hit1     = direct_sel ?  buf_hit_way : icache_way1_hit;
assign icache_hit0     = direct_sel ? ~buf_hit_way : icache_way0_hit;
assign icache_hit_inst[31:0] = {32{icache_hit1}} & icache_data1_dout[31:0]
                             | {32{icache_hit0}} & icache_data0_dout[31:0];

// d. Cache Miss Generation
assign icache_miss_req        = ~icache_hit & icache_rd_vld;
assign icache_miss_addr[31:0] = icache_rd_addr[31:0];
assign icache_miss_prot[3:0]  = icache_rd_prot[3:0];

//------------------------------------------------
// 5. I-Cache Refill Control
// a. Refill control to ibus
// b. Refill Request to icache
//------------------------------------------------

// a. Refill control to ibus
always @ (posedge icache_refdp_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    icache_refill_addr[31:0]   <= 32'b0;
    icache_refill_fifo         <= 1'b0;
    icache_refill_prot[3:0]    <= 4'b0;
    icache_en_f                <= 1'b0;
  end
  else if(icache_miss_req & ref_fsm_idle)
  begin
    icache_refill_addr[31:0]   <= {icache_miss_addr[31:1], 1'b0};
    icache_refill_fifo         <= icache_tag_fifo;
    icache_refill_prot[3:0]    <= icache_miss_prot[3:0];
    icache_en_f                <= icache_en;
  end
end
assign icache_refill_ca = icache_refill_prot[3] & icache_en_f;

// Refill FSM
// including IDLE state, wait for data state,
parameter IDLE = 2'b00,
          REQ  = 2'b01,
          WFC  = 2'b10,
          RFL  = 2'b11;

always @ (posedge icache_reffsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ref_cur_st[1:0] <= IDLE;
  else
    ref_cur_st[1:0] <= ref_nxt_st[1:0];
end

// &CombBeg; @392
always @( icache_refill_ca
       or ref_cnt_done
       or ibus_icache_error
       or icache_miss_req
       or ref_cur_st[1:0]
       or ibus_icache_cmplt
       or ibus_icache_grant)
begin
case(ref_cur_st[1:0])
  IDLE:
  begin
    if(icache_miss_req)
      ref_nxt_st[1:0] = REQ;
    else
      ref_nxt_st[1:0] = IDLE;
  end
  REQ: 
  begin
    if (ibus_icache_grant)
      ref_nxt_st[1:0] = WFC;
    else
      ref_nxt_st[1:0] = REQ;
  end
  WFC:
  begin
    if(ibus_icache_cmplt)
      if(ibus_icache_error)
        ref_nxt_st[1:0] = IDLE;
      else
        ref_nxt_st[1:0] = icache_refill_ca ? RFL : IDLE;
    else
      ref_nxt_st[1:0] = WFC;
  end
  RFL:
  begin
    if(ref_cnt_done | ibus_icache_error)
      ref_nxt_st[1:0] = IDLE;
    else
      ref_nxt_st[1:0] = RFL;
  end
  default:
  begin
    ref_nxt_st[1:0] = IDLE;
  end
endcase
// &CombEnd; @430
end

// state information 
assign ref_fsm_idle = ref_cur_st[1:0] == IDLE;
assign ref_fsm_req  = ref_cur_st[1:0] == REQ;
assign ref_fsm_wfc  = ref_cur_st[1:0] == WFC;
assign ref_fsm_ref  = ref_cur_st[1:0] == RFL;

//refill abort
always @ (posedge icache_reffsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    refill_data_abort <= 1'b0;
  else if (ctrl_ifetch_req_abort & !ref_rdy)
    refill_data_abort <= 1'b1;
  else if (ref_fsm_idle & icache_miss_req)
    refill_data_abort <= 1'b0;
end

// request counter
always @ (posedge icache_reffsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    req_cnt[2:0] <= 3'b000;
  else if(ref_fsm_idle & icache_miss_req)
    req_cnt[2:0] <= icache_miss_addr[4:2];
  else if(icache_req & ibus_icache_grant & icache_refill_ca)
    req_cnt[2:0] <= req_cnt[2:0] + 3'b001;
  else
    req_cnt[2:0] <= req_cnt[2:0];
end

// req done when req_cnt wrap back to miss req addr
assign req_cnt_done   = req_cnt[2:0] == icache_refill_addr[4:2];
assign req_addr[31:0] = {icache_refill_addr[31:5], req_cnt[2:0], 2'b00};

//refill valid
always @ (posedge icache_reffsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ref_vld <= 1'b0;
  else if (ref_fsm_ref | ref_fsm_wfc & icache_refill_ca)
    ref_vld <= ibus_icache_cmplt & ~ibus_icache_error;
end

// refill address gen
always @ (posedge icache_reffsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ref_cnt[2:0] <= 3'b000;
  else if(ref_fsm_idle & icache_miss_req)
    ref_cnt[2:0] <= icache_miss_addr[4:2];
  else if(ref_fsm_ref & ibus_icache_cmplt & ~ibus_icache_error)
    ref_cnt[2:0] <= ref_cnt_inc[2:0];
  else
    ref_cnt[2:0] <= ref_cnt[2:0];
end

assign ref_cnt_inc[2:0] = ref_cnt[2:0] + 3'b001;

assign ref_cnt_done = ref_cnt_inc[2:0] == icache_miss_addr[4:2];

assign refill_addr[31:0] = {icache_refill_addr[31:5], ref_cnt[2:0], 2'b0};

always @ (posedge icache_reffsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    refill_data[31:0] <= 32'b0;
  else if (ibus_icache_cmplt & ~ibus_icache_error)
    refill_data[31:0] <= ibus_icache_data[31:0];
end

// Un-Cache FSM
// including IDLE state, wait for data state,
parameter UIDLE = 1'b0,
          UWFC  = 1'b1;

always @ (posedge icache_reffsm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    uc_cur_st <= UIDLE;
  else
    uc_cur_st <= uc_nxt_st;
end

// &CombBeg; @515
always @( bmu_ifu_acc_err
       or ibus_icache_uc_cmplt
       or ifetch_outstanding
       or icache_uc_req
       or uc_cur_st)
begin
case(uc_cur_st)
  UIDLE:
  begin
    if(icache_uc_req)
      uc_nxt_st = UWFC;
    else
      uc_nxt_st = UIDLE;
  end
  UWFC:
  begin
    if(ibus_icache_uc_cmplt)
      if(bmu_ifu_acc_err)
        uc_nxt_st = UIDLE;
      else if(icache_uc_req)
        uc_nxt_st = UWFC;
      else if(~ifetch_outstanding)
        uc_nxt_st = UIDLE;
      else
        uc_nxt_st = UWFC;
    else
      uc_nxt_st = UWFC;
  end
  default:
  begin
    uc_nxt_st = UIDLE;
  end
endcase
// &CombEnd; @543
end

assign uc_fsm_idle = uc_cur_st == UIDLE;
assign uc_fsm_wfc  = uc_cur_st == UWFC;

always @ (posedge icache_addr_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    icache_addr_ff[31:0] <= 32'b0;
  else if(icache_rd_req | icache_uc_req)
    icache_addr_ff[31:0] <= ifetch_req_addr[31:0];
end

// refill ibus request 
assign icache_req             = ref_fsm_req 
                              | ref_fsm_wfc & icache_refill_ca
                              | ref_fsm_ref & ~req_cnt_done
                              | icache_uc_req;

assign icache_data_req        = ref_fsm_req 
                              | ref_fsm_wfc & icache_refill_ca
                              | ref_fsm_ref & ~req_cnt_done
                              | icache_uc_data_req;

assign icache_ibus_req        = icache_req;
assign icache_ibus_data_req   = icache_data_req;
assign icache_ibus_addr[31:0] = ref_fsm_idle ? ifetch_req_addr[31:0] 
                                             : req_addr[31:0];
assign icache_ibus_prot[3:0]  = ref_fsm_idle ? ifetch_req_prot[3:0]
                                             : icache_refill_prot[3:0];
assign icache_ibus_seq        = ref_fsm_wfc & icache_refill_ca
                              | ref_fsm_ref & ~req_cnt_done;
assign icache_ibus_burst[2:0] = ref_fsm_idle ? 3'b000 : 3'b100;
assign icache_ibus_acc_deny   = ref_fsm_idle & pmp_ifu_acc_deny;

// refill icache request 
assign refill_icache_req        = ref_fsm_ref & ref_vld;
assign refill_icache_init       = ref_cnt[2:0] == icache_miss_addr[4:2];
assign refill_icache_done       = ref_cnt_done;
assign refill_icache_addr[31:0] = refill_addr[31:0];
assign refill_icache_fifo       = icache_refill_fifo;
assign refill_icache_data[31:0] = refill_data[31:0];

// icache result to ifetch
assign icache_cmplt             = ref_fsm_wfc & ibus_icache_cmplt & ~refill_data_abort;
assign icache_bypass_vld        = icache_cmplt // & ~icache_vec_data
                               | uc_fsm_wfc & ibus_icache_cmplt;
assign icache_ifetch_inst_vld   = icache_bypass_vld | icache_hit_vld;// & ~icache_vec_data;
assign icache_ifetch_inst_vld_gate = icache_bypass_vld | icache_rd_vld;
assign icache_ifetch_inst[31:0] = icache_bypass_vld ? ibus_icache_data[31:0]
                                                    : icache_hit_inst[31:0];
assign icache_ifetch_error      = icache_bypass_vld ? ibus_icache_error
                                                    : icache_deny;
assign icache_ifetch_unalign    = icache_bypass_vld ? uc_fsm_wfc ? ibus_icache_unalign
                                                    : icache_refill_addr[1]
                                                    : icache_rd_addr[1];
assign icache_ifetch_grant      = ref_rdy & icache_rd_req & icache_ca_ff
                               | icache_uc_req & ibus_icache_grant
                               | icache_uc_sel & ifetch_outstanding & ibus_icache_grant;
assign ref_rdy                  = ref_fsm_idle & ~icache_miss_req;
assign icache_ifetch_vec_data_cmplt = (icache_cmplt | icache_hit_vld) & icache_vec_data
                                   | uc_fsm_wfc & ibus_icache_cmplt;

assign icache_ifetch_rd_addr[31:0] = ifetch_req_addr[31:0];
assign icache_ifetch_addr[31:0]    = icache_addr_ff[31:0];
assign icache_ifetch_mach_mode     = ifetch_req_prot[1];
assign icache_ifetch_not_busy      = (~ref_fsm_idle | icache_rd_vld) & ~ibus_trans_abort
                                  | ibus_icache_not_busy;
assign icache_ifetch_uc_sel        = uc_fsm_wfc;

// e. ICache Invalid Request
parameter INV_IDLE = 2'b00;
parameter INV_WRTE = 2'b10;
parameter INV_READ = 2'b01;
parameter INV_FLOP = 2'b11;

// Invalid FSM, for Array Invalid
// IDLE: default state
// WRTE: invalid iteration state
always @ (posedge icache_inv_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    inv_cur_st[1:0] <= INV_IDLE;
  else
    inv_cur_st[1:0] <= inv_nxt_st[1:0];
end

assign inv_type_pa = cp0_ifu_icache_inv_type;

// &CombBeg; @632
always @( inv_type_pa
       or inv_cur_st[1:0]
       or cp0_ifu_icache_inv_req
       or ref_rdy
       or icache_inv_done)
begin
case(inv_cur_st[1:0])
  INV_IDLE: begin
    if(cp0_ifu_icache_inv_req & ref_rdy)
      inv_nxt_st[1:0] = inv_type_pa ? INV_READ : INV_WRTE;
    else
      inv_nxt_st[1:0] = INV_IDLE;
  end
  INV_WRTE: begin
    if(icache_inv_done)
      inv_nxt_st[1:0] = INV_IDLE;
    else
      inv_nxt_st[1:0] = INV_WRTE;
  end
  INV_READ: inv_nxt_st[1:0] = INV_FLOP;
  INV_FLOP: inv_nxt_st[1:0] = INV_WRTE;
  default:  inv_nxt_st[1:0] = INV_IDLE;
endcase
// &CombEnd; @650
end

assign inv_fsm_idle    = inv_cur_st[1:0] == INV_IDLE & ~cp0_ifu_icache_inv_req;
assign inv_fsm_write   = inv_cur_st[1:0] == INV_WRTE;
assign inv_tag_wen     = inv_cur_st[1:0] == INV_FLOP;

always @ (posedge icache_inv_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ipa_way_sel[1:0] <= 2'b0;
  else if (inv_tag_wen)
    ipa_way_sel[1:0] <= {icache_way1_hit,icache_way0_hit};
end

assign inv_way_sel[1:0] = inv_type_pa ? ipa_way_sel[1:0] : 2'b11;

assign icache_inv_rd   = inv_cur_st[1:0] == INV_READ;
assign icache_inv_wt   = inv_fsm_write & (|inv_way_sel[1:0]);

assign icache_inv_req  = icache_inv_rd | icache_inv_wt;
assign icache_inv_wen[2:0] = {3{icache_inv_wt}}
                           & {~inv_type_pa, inv_way_sel[1:0]};
assign icache_inv_din[46:0] = {1'b1, 46'b0};
assign icache_inv_idx[9:0]  = inv_type_pa ? cp0_ifu_icache_inv_addr[14:5]
                                          : inv_cnt[9:0];

assign inv_cnt_en = inv_fsm_write & ~inv_type_pa;

always @ (posedge icache_inv_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    inv_cnt[9:0] <= {10{1'b0}};
  else if(inv_cnt_en)
    inv_cnt[9:0] <= inv_cnt_inc[9:0];
  else
    inv_cnt[9:0] <= inv_cnt[9:0];
end

//csky vperl_off
`ifdef ICACHE_64K
assign inv_cnt_inc[9:0] = inv_cnt[9:0] + 1'b1;
`else
assign inv_cnt_inc[9:0] = {{(10-`I_TAG_INDEX_WIDTH){1'b0}},
                        inv_cnt[`I_TAG_INDEX_WIDTH-1:0] + 1'b1};
`endif
assign icache_inv_done = inv_type_pa & inv_fsm_write |
                         ~inv_type_pa & inv_cnt_inc[`I_TAG_INDEX_WIDTH-1:0] 
                                                == {`I_TAG_INDEX_WIDTH{1'b0}};
//csky vperl_on
assign ifu_cp0_icache_inv_done = icache_inv_done;

//==========================================================
// Rename for Output
//==========================================================
// &Force("input", "cp0_ifu_icache_inv_addr"); @704
// &Force("bus", "cp0_ifu_icache_inv_addr", 31, 0); @705
//assign cp0_ifu_icache_inv_addr[31:0] = 32'b0;

// Output to HPCP
assign ifu_hpcp_icache_access = icache_rd_vld & ref_fsm_idle;
assign ifu_hpcp_icache_miss   = icache_miss_req;

// Output to top
assign icache_top_rd_vld      = icache_rd_vld;
assign icache_top_ref_st[1:0] = ref_cur_st[1:0];
assign icache_top_abort       = refill_data_abort;
assign icache_top_uc_st       = uc_cur_st;

// &ModuleEnd; @718
endmodule


