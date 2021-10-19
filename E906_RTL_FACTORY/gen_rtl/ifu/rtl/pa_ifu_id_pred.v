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

// &ModuleBeg; @24
module pa_ifu_id_pred(
  bht_top_cur_st,
  cp0_ifu_bht_en,
  cp0_ifu_bht_inv,
  cp0_ifu_icg_en,
  cp0_ifu_ras_en,
  cp0_yy_clk_en,
  cpurst_b,
  dtu_ifu_halt_info0,
  dtu_ifu_halt_info1,
  forever_cpuclk,
  ibuf_id_pred_hungry,
  ibuf_ipack_stall,
  ibuf_pred_stall,
  id_pred_btb_cur_pc,
  id_pred_btb_mis_pred,
  id_pred_btb_mis_predg,
  id_pred_btb_tar_pc,
  id_pred_btb_upd_vld,
  id_pred_btb_upd_vldg,
  id_pred_ctrl_stall,
  id_pred_ibuf_br_taken0,
  id_pred_ibuf_br_taken1,
  id_pred_ibuf_chgflw_vld0,
  id_pred_ibuf_halt_info0,
  id_pred_ibuf_halt_info1,
  id_pred_ipack_chgflw_vld0,
  id_pred_ipack_delay_stall,
  id_pred_ipack_mask,
  id_pred_ipack_ret_stall,
  id_pred_pcgen_chgflw_pc,
  id_pred_pcgen_chgflw_vld,
  id_pred_pcgen_inst_vld,
  idu_ifu_x1,
  ifu_cp0_bht_inv_done,
  ifu_dtu_addr_vld0,
  ifu_dtu_addr_vld1,
  ifu_dtu_data_vld0,
  ifu_dtu_data_vld1,
  ifu_dtu_exe_addr0,
  ifu_dtu_exe_addr1,
  ifu_dtu_exe_data0,
  ifu_dtu_exe_data1,
  ifu_iu_ex1_pc_pred,
  ipack_id_pred_h0_create,
  ipack_id_pred_h0_vld,
  ipack_id_pred_inst0,
  ipack_id_pred_inst0_expt,
  ipack_id_pred_inst0_vld,
  ipack_id_pred_inst1,
  ipack_id_pred_inst1_expt,
  ipack_id_pred_inst1_vld,
  ipack_id_pred_new_vld,
  ipack_id_pred_unalign,
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
  iu_yy_xx_cancel,
  pad_yy_icg_scan_en,
  pcgen_id_pred_btb_tar_pc,
  pcgen_id_pred_btb_tar_vld,
  pcgen_id_pred_flush_vld,
  pcgen_id_pred_idpc,
  pcgen_id_pred_ifpc,
  pred_top_delay_chgflw,
  pred_top_ras_st,
  rtu_ifu_flush_fe
);

// &Ports; @25
input           cp0_ifu_bht_en;           
input           cp0_ifu_bht_inv;          
input           cp0_ifu_icg_en;           
input           cp0_ifu_ras_en;           
input           cp0_yy_clk_en;            
input           cpurst_b;                 
input   [14:0]  dtu_ifu_halt_info0;       
input   [14:0]  dtu_ifu_halt_info1;       
input           forever_cpuclk;           
input           ibuf_id_pred_hungry;      
input           ibuf_ipack_stall;         
input           ibuf_pred_stall;          
input   [31:0]  idu_ifu_x1;               
input           ipack_id_pred_h0_create;  
input           ipack_id_pred_h0_vld;     
input   [31:0]  ipack_id_pred_inst0;      
input           ipack_id_pred_inst0_expt; 
input           ipack_id_pred_inst0_vld;  
input   [15:0]  ipack_id_pred_inst1;      
input           ipack_id_pred_inst1_expt; 
input           ipack_id_pred_inst1_vld;  
input           ipack_id_pred_new_vld;    
input           ipack_id_pred_unalign;    
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
input           iu_yy_xx_cancel;          
input           pad_yy_icg_scan_en;       
input   [31:0]  pcgen_id_pred_btb_tar_pc; 
input           pcgen_id_pred_btb_tar_vld; 
input           pcgen_id_pred_flush_vld;  
input   [31:0]  pcgen_id_pred_idpc;       
input   [31:0]  pcgen_id_pred_ifpc;       
input           rtu_ifu_flush_fe;         
output  [1 :0]  bht_top_cur_st;           
output  [31:0]  id_pred_btb_cur_pc;       
output          id_pred_btb_mis_pred;     
output          id_pred_btb_mis_predg;    
output  [31:0]  id_pred_btb_tar_pc;       
output          id_pred_btb_upd_vld;      
output          id_pred_btb_upd_vldg;     
output          id_pred_ctrl_stall;       
output  [1 :0]  id_pred_ibuf_br_taken0;   
output  [1 :0]  id_pred_ibuf_br_taken1;   
output          id_pred_ibuf_chgflw_vld0; 
output  [14:0]  id_pred_ibuf_halt_info0;  
output  [14:0]  id_pred_ibuf_halt_info1;  
output          id_pred_ipack_chgflw_vld0; 
output          id_pred_ipack_delay_stall; 
output          id_pred_ipack_mask;       
output          id_pred_ipack_ret_stall;  
output  [31:0]  id_pred_pcgen_chgflw_pc;  
output          id_pred_pcgen_chgflw_vld; 
output          id_pred_pcgen_inst_vld;   
output          ifu_cp0_bht_inv_done;     
output          ifu_dtu_addr_vld0;        
output          ifu_dtu_addr_vld1;        
output          ifu_dtu_data_vld0;        
output          ifu_dtu_data_vld1;        
output  [31:0]  ifu_dtu_exe_addr0;        
output  [31:0]  ifu_dtu_exe_addr1;        
output  [31:0]  ifu_dtu_exe_data0;        
output  [31:0]  ifu_dtu_exe_data1;        
output  [31:0]  ifu_iu_ex1_pc_pred;       
output          pred_top_delay_chgflw;    
output          pred_top_ras_st;          

// &Regs; @26
reg     [31:0]  chgflw_pc;                
reg             delay_chgflw;             
reg             h0_br_vld;                
reg     [31:0]  id_pred_cur_pc;           
reg     [31:0]  id_pred_h0_pc;            
reg     [1 :0]  ras_cur_st;               
reg     [1 :0]  ras_nxt_st;               
reg     [31:0]  ras_pred_pc;              

// &Wires; @27
wire            bht_id_pred_mem_taken;    
wire    [1 :0]  bht_id_pred_rslt;         
wire    [1 :0]  bht_top_cur_st;           
wire            btb_mis_pred;             
wire            cp0_ifu_bht_en;           
wire            cp0_ifu_bht_inv;          
wire            cp0_ifu_icg_en;           
wire            cp0_ifu_ras_en;           
wire            cp0_yy_clk_en;            
wire            cpurst_b;                 
wire    [14:0]  dtu_ifu_halt_info0;       
wire    [14:0]  dtu_ifu_halt_info1;       
wire            forever_cpuclk;           
wire            ibuf_id_pred_hungry;      
wire            ibuf_ipack_stall;         
wire            ibuf_pred_stall;          
wire            id_pred_bht_br_vld;       
wire    [2 :0]  id_pred_bht_pc;           
wire    [31:0]  id_pred_br_imm;           
wire    [1 :0]  id_pred_br_rslt0;         
wire    [1 :0]  id_pred_br_rslt1;         
wire            id_pred_br_sel1;          
wire            id_pred_br_taken;         
wire            id_pred_br_taken0;        
wire            id_pred_br_taken1;        
wire    [31:0]  id_pred_br_tar;           
wire            id_pred_br_vld0;          
wire            id_pred_br_vld1;          
wire            id_pred_br_vld1_raw;      
wire    [31:0]  id_pred_btb_cur_pc;       
wire            id_pred_btb_mis_pred;     
wire            id_pred_btb_mis_predg;    
wire    [31:0]  id_pred_btb_tar_pc;       
wire            id_pred_btb_upd_vld;      
wire            id_pred_btb_upd_vldg;     
wire            id_pred_chgflw;           
wire            id_pred_chgflw_fin;       
wire    [31:0]  id_pred_chgflw_fin_tar;   
wire    [31:0]  id_pred_chgflw_fin_tar1;  
wire    [31:0]  id_pred_chgflw_tar;       
wire            id_pred_chgflw_vld;       
wire            id_pred_chgflw_vld0;      
wire            id_pred_chgflw_vld1;      
wire            id_pred_clk;              
wire            id_pred_ctrl_stall;       
wire            id_pred_delay_br;         
wire            id_pred_delay_br1;        
wire            id_pred_delay_br_raw;     
wire    [1 :0]  id_pred_ibuf_br_taken0;   
wire    [1 :0]  id_pred_ibuf_br_taken1;   
wire            id_pred_ibuf_chgflw_vld0; 
wire    [14:0]  id_pred_ibuf_halt_info0;  
wire    [14:0]  id_pred_ibuf_halt_info1;  
wire            id_pred_icg_en;           
wire    [31:0]  id_pred_idpc;             
wire    [31:0]  id_pred_imm0;             
wire    [31:0]  id_pred_imm1;             
wire            id_pred_ind_link_vld0;    
wire            id_pred_ind_link_vld1;    
wire            id_pred_inst0_32;         
wire            id_pred_inst0_bjtype;     
wire    [31:0]  id_pred_inst0_bkpt_pc;    
wire            id_pred_inst0_taken;      
wire    [31:0]  id_pred_inst1_bkpt_pc;    
wire            id_pred_inst1_taken;      
wire            id_pred_ipack_chgflw_vld0; 
wire            id_pred_ipack_delay_stall; 
wire            id_pred_ipack_mask;       
wire            id_pred_ipack_ret_stall;  
wire            id_pred_jmp_vld0;         
wire            id_pred_jmp_vld1;         
wire            id_pred_link_vld0;        
wire            id_pred_link_vld1;        
wire    [31:0]  id_pred_nxt_offset;       
wire    [31:0]  id_pred_nxt_pc;           
wire    [31:0]  id_pred_pcgen_chgflw_pc;  
wire            id_pred_pcgen_chgflw_vld; 
wire            id_pred_pcgen_inst_vld;   
wire            id_pred_ras_ind_link;     
wire            id_pred_ras_ind_link_vld; 
wire    [23:0]  id_pred_ras_link_pc;      
wire            id_pred_ras_link_vld;     
wire            id_pred_ras_link_vld0;    
wire            id_pred_ras_link_vld1;    
wire            id_pred_ras_ret_chgflw;   
wire            id_pred_ras_ret_req;      
wire            id_pred_ras_ret_req1;     
wire            id_pred_ras_ret_vld;      
wire            id_pred_ras_ret_vld0;     
wire            id_pred_ras_ret_vld1;     
wire            id_pred_ras_sel1;         
wire    [31:0]  id_pred_ras_tar;          
wire            id_pred_ret_stall;        
wire            id_pred_ret_vld0;         
wire            id_pred_ret_vld1;         
wire            id_ras_clk;               
wire            id_ras_icg_en;            
wire            ifu_cp0_bht_inv_done;     
wire            ifu_dtu_addr_vld0;        
wire            ifu_dtu_addr_vld1;        
wire            ifu_dtu_data_vld0;        
wire            ifu_dtu_data_vld1;        
wire    [31:0]  ifu_dtu_exe_addr0;        
wire    [31:0]  ifu_dtu_exe_addr1;        
wire    [31:0]  ifu_dtu_exe_data0;        
wire    [31:0]  ifu_dtu_exe_data1;        
wire    [31:0]  ifu_iu_ex1_pc_pred;       
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
wire            iu_yy_xx_cancel;          
wire            pad_yy_icg_scan_en;       
wire    [31:0]  pcgen_id_pred_btb_tar_pc; 
wire            pcgen_id_pred_btb_tar_vld; 
wire            pcgen_id_pred_flush_vld;  
wire    [31:0]  pcgen_id_pred_idpc;       
wire    [31:0]  pcgen_id_pred_ifpc;       
wire            pred_top_delay_chgflw;    
wire            pred_top_ras_st;          
wire            ras_cur_jalr;             
wire            ras_cur_ret;              
wire    [23:0]  ras_id_pred_tar_pc;       
wire    [23:0]  ras_link_offset;          
wire            ras_pred_pc_update;       
wire            rtu_ifu_flush_fe;         


//==========================================================
// ID Stage Predication Module
// 1. Instance ICG Cell
// 2. ID Pre-decode for prediction
// 3. Current PC Generation
// 4. Branch Taken Result
// 5. RAS Target Result
// 6. ID Prediction Address Generation
// 7. Inst bkpt judgement
//==========================================================

//------------------------------------------------
// 1. Instance ICG Cell
//------------------------------------------------
assign id_pred_icg_en = ipack_id_pred_h0_create | h0_br_vld
                     | id_pred_br_vld0 | id_pred_chgflw
                     | delay_chgflw;

// &Instance("gated_clk_cell", "x_pa_ifu_id_pred_icg_cell"); @47
gated_clk_cell  x_pa_ifu_id_pred_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (id_pred_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (id_pred_icg_en    ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @48
//          .external_en (1'b0), @49
//          .global_en   (cp0_yy_clk_en), @50
//          .module_en   (cp0_ifu_icg_en), @51
//          .local_en    (id_pred_icg_en), @52
//          .clk_out     (id_pred_clk)  @53
// ); @54

assign id_ras_icg_en = pcgen_id_pred_flush_vld
                     | id_pred_ras_ret_chgflw
                     | id_pred_ras_ind_link
                     | iu_ifu_ret_vld
                     | ras_cur_ret
                     | ras_cur_jalr;
// &Instance("gated_clk_cell", "x_pa_ifu_id_ras_icg_cell"); @62
gated_clk_cell  x_pa_ifu_id_ras_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (id_ras_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (id_ras_icg_en     ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @63
//          .external_en (1'b0), @64
//          .global_en   (cp0_yy_clk_en), @65
//          .module_en   (cp0_ifu_icg_en), @66
//          .local_en    (id_ras_icg_en), @67
//          .clk_out     (id_ras_clk)  @68
// ); @69

//------------------------------------------------
// 2. ID Pre-decode for prediction
//------------------------------------------------
// &Instance("pa_ifu_pre_decd", "x_pa_ifu_pre_decd"); @74
pa_ifu_pre_decd  x_pa_ifu_pre_decd (
  .id_pred_br_vld0         (id_pred_br_vld0        ),
  .id_pred_br_vld1         (id_pred_br_vld1        ),
  .id_pred_br_vld1_raw     (id_pred_br_vld1_raw    ),
  .id_pred_imm0            (id_pred_imm0           ),
  .id_pred_imm1            (id_pred_imm1           ),
  .id_pred_ind_link_vld0   (id_pred_ind_link_vld0  ),
  .id_pred_ind_link_vld1   (id_pred_ind_link_vld1  ),
  .id_pred_inst0_32        (id_pred_inst0_32       ),
  .id_pred_jmp_vld0        (id_pred_jmp_vld0       ),
  .id_pred_jmp_vld1        (id_pred_jmp_vld1       ),
  .id_pred_link_vld0       (id_pred_link_vld0      ),
  .id_pred_link_vld1       (id_pred_link_vld1      ),
  .id_pred_ret_vld0        (id_pred_ret_vld0       ),
  .id_pred_ret_vld1        (id_pred_ret_vld1       ),
  .ipack_id_pred_inst0     (ipack_id_pred_inst0    ),
  .ipack_id_pred_inst0_vld (ipack_id_pred_inst0_vld),
  .ipack_id_pred_inst1     (ipack_id_pred_inst1    ),
  .ipack_id_pred_inst1_vld (ipack_id_pred_inst1_vld)
);


//------------------------------------------------
// 3. Current PC Generation
//------------------------------------------------
assign id_pred_idpc[31:0] = pcgen_id_pred_idpc[31:0];

always @ (posedge id_pred_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    id_pred_h0_pc[31:0] <= 32'b0;
  else if(ipack_id_pred_h0_create)
    id_pred_h0_pc[31:0] <= {id_pred_idpc[31:2], 2'b10};
  else
    id_pred_h0_pc[31:0] <= id_pred_h0_pc[31:0];
end

//&CombBeg;
//if(id_pred_br_taken0 & ~delay_chgflw)
//  if(ipack_id_pred_h0_vld)
//    id_pred_cur_pc[31:0] = id_pred_h0_pc[31:0];
//  else
//    id_pred_cur_pc[31:0] = id_pred_idpc[31:0];
//else if(id_pred_br_taken1 | id_pred_ras_sel1 | delay_chgflw)
//  id_pred_cur_pc[31:0] = {id_pred_idpc[31:2], 2'b10};
//else  if(ipack_id_pred_h0_vld)// & ~ipack_id_pred_inst_full)
//  id_pred_cur_pc[31:0] = id_pred_h0_pc[31:0];
//else
//  id_pred_cur_pc[31:0] = id_pred_idpc[31:0];
//&CombEnd;
// &CombBeg; @104
always @( id_pred_br_taken0
       or id_pred_h0_pc[31:0]
       or id_pred_delay_br_raw
       or delay_chgflw
       or id_pred_br_sel1
       or id_pred_ras_sel1
       or id_pred_idpc[31:0]
       or id_pred_link_vld0
       or ipack_id_pred_h0_vld)
begin
  if(id_pred_br_taken0 & ~delay_chgflw | id_pred_link_vld0)
    if(ipack_id_pred_h0_vld)
      id_pred_cur_pc[31:0] = id_pred_h0_pc[31:0];
    else
      id_pred_cur_pc[31:0] = id_pred_idpc[31:0];
  else if(id_pred_br_sel1 | id_pred_ras_sel1 | id_pred_delay_br_raw | delay_chgflw)
    id_pred_cur_pc[31:0] = {id_pred_idpc[31:2], 2'b10};
  else
    id_pred_cur_pc[31:0] = id_pred_idpc[31:0];
// &CombEnd; @114
end


assign id_pred_nxt_offset[31:0] = (ipack_id_pred_unalign | id_pred_delay_br_raw) ? 32'h2 : 32'h4;
assign id_pred_nxt_pc[31:0] = id_pred_cur_pc[31:0] + id_pred_nxt_offset[31:0];

//------------------------------------------------
// 4. Branch Taken Result
// a. BHT Access Signal
// b. Instance BHT
// c. BHT Result
//------------------------------------------------
// a. BHT Access Signal
assign id_pred_bht_br_vld   = (id_pred_br_vld0 | id_pred_br_vld1)
                           & ~ibuf_ipack_stall;

always @ (posedge id_pred_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    h0_br_vld <= 1'b0;
  else if(pcgen_id_pred_flush_vld)
    h0_br_vld <= 1'b0;
  else if(ipack_id_pred_h0_create)
    h0_br_vld <= id_pred_br_vld1_raw;
  else if(h0_br_vld & ~ibuf_ipack_stall)
    h0_br_vld <= 1'b0;
  else
    h0_br_vld <= h0_br_vld;
end

assign id_pred_bht_pc[2:0]  = h0_br_vld ? id_pred_h0_pc[3:1]
                            : (ipack_id_pred_unalign | ~id_pred_br_vld0) ? {id_pred_idpc[3:2], 1'b1}
                            : id_pred_idpc[3:1];
                           
//assign id_pred_bht_mem_pc[2:0] = {id_pred_idpc[3:2], 1'b1};

// b. Instance BHT
// &Instance("pa_ifu_bht", "x_pa_ifu_bht"); @152
pa_ifu_bht  x_pa_ifu_bht (
  .bht_id_pred_mem_taken   (bht_id_pred_mem_taken  ),
  .bht_id_pred_rslt        (bht_id_pred_rslt       ),
  .bht_top_cur_st          (bht_top_cur_st         ),
  .cp0_ifu_bht_en          (cp0_ifu_bht_en         ),
  .cp0_ifu_bht_inv         (cp0_ifu_bht_inv        ),
  .cp0_ifu_icg_en          (cp0_ifu_icg_en         ),
  .cp0_yy_clk_en           (cp0_yy_clk_en          ),
  .cpurst_b                (cpurst_b               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .id_pred_bht_br_vld      (id_pred_bht_br_vld     ),
  .id_pred_bht_pc          (id_pred_bht_pc         ),
  .ifu_cp0_bht_inv_done    (ifu_cp0_bht_inv_done   ),
  .iu_ifu_bht_cur_pc       (iu_ifu_bht_cur_pc      ),
  .iu_ifu_bht_mispred      (iu_ifu_bht_mispred     ),
  .iu_ifu_bht_mispred_gate (iu_ifu_bht_mispred_gate),
  .iu_ifu_bht_pred         (iu_ifu_bht_pred        ),
  .iu_ifu_bht_taken        (iu_ifu_bht_taken       ),
  .iu_ifu_br_vld           (iu_ifu_br_vld          ),
  .iu_ifu_br_vld_gate      (iu_ifu_br_vld_gate     ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Force("nonport", "id_pred_br_vld1_raw"); @154
// &Force("input", "ipack_id_pred_new_vld"); @155
// &Force("input", "iu_ifu_bht_mispred"); @156
// &Force("input", "iu_ifu_bht_mispred_gate"); @157
// &Force("input", "iu_ifu_br_vld"); @158
// &Force("input", "iu_ifu_br_vld_gate"); @159
// &Force("input", "iu_ifu_bht_cur_pc"); &Force("bus", "iu_ifu_bht_cur_pc", 31, 0); @160
// &Force("input", "iu_ifu_bht_taken"); @161
// &Force("input", "iu_ifu_bht_pred"); &Force("bus", "iu_ifu_bht_pred", 1, 0); @162
assign id_pred_delay_br_raw = id_pred_br_vld0 && !bht_id_pred_rslt[1]
                           && id_pred_br_vld1;

assign id_pred_delay_br = id_pred_br_vld0 & ~bht_id_pred_rslt[1]
                       & (id_pred_br_vld1 & (bht_id_pred_mem_taken
                            | ipack_id_pred_new_vld)
                          | id_pred_ret_vld1)
                       & ~ibuf_ipack_stall;

assign id_pred_delay_br1 = id_pred_chgflw
                       & ~ibuf_ipack_stall;
//assign id_pred_delay_br1= id_pred_br_vld0 & ~bht_id_pred_rslt[1]
//                       & id_pred_br_vld1;
always @ (posedge id_pred_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    delay_chgflw <= 1'b0;
  else if(pcgen_id_pred_flush_vld)
    delay_chgflw <= 1'b0;
  else if(id_pred_delay_br | id_pred_delay_br1)
    delay_chgflw <= 1'b1;
  else if(delay_chgflw & ~ibuf_ipack_stall)
    delay_chgflw <= 1'b0;
  else
    delay_chgflw <= delay_chgflw;
end
always @ (posedge id_pred_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    chgflw_pc[31:0] <= 32'b0;
  else if(id_pred_delay_br | id_pred_delay_br1)
    chgflw_pc[31:0] <= id_pred_chgflw_fin_tar1[31:0];
end
  
// c. BHT Result
// all branch and jump taken result
assign id_pred_inst0_bjtype = id_pred_br_vld0 | id_pred_jmp_vld0;
assign id_pred_inst0_taken  = id_pred_br_vld0 & bht_id_pred_rslt[1]
                           | id_pred_jmp_vld0;
assign id_pred_inst1_taken  = ~id_pred_br_vld0
                            & id_pred_br_vld1 & bht_id_pred_rslt[1]
                           | ~id_pred_inst0_taken & id_pred_br_vld0
                            & id_pred_br_vld1 & bht_id_pred_mem_taken
                           | ~id_pred_inst0_taken & id_pred_jmp_vld1;
assign id_pred_br_taken0    = id_pred_inst0_taken;
assign id_pred_br_taken1    = id_pred_inst1_taken;
assign id_pred_br_taken     = (id_pred_br_taken0 | id_pred_br_taken1) & ~delay_chgflw;

assign id_pred_br_sel1      = id_pred_inst1_taken & ~id_pred_ras_link_vld0;

assign id_pred_br_imm[31:0] = id_pred_inst0_taken ? id_pred_imm0[31:0]
                                                  : id_pred_imm1[31:0];
assign id_pred_br_tar[31:0] = id_pred_cur_pc[31:0] + id_pred_br_imm[31:0];
assign id_pred_br_rslt0[1:0] = {2{id_pred_br_vld0}} & bht_id_pred_rslt[1:0];
assign id_pred_br_rslt1[1:0] = {2{id_pred_br_vld1 & ~id_pred_inst0_bjtype}} & bht_id_pred_rslt[1:0];

//------------------------------------------------
// 5. RAS Target Result
// a. RAS Access Signal
// b. Instance RAS
// c. RAS Result
// d. RAS Stall FSM
//------------------------------------------------

// a. RAS Access Signal
assign id_pred_ras_link_vld0 = id_pred_link_vld0;
assign id_pred_ras_link_vld1 = id_pred_link_vld1 & ~id_pred_inst0_taken;
assign id_pred_ras_link_vld  = (id_pred_ras_link_vld0 | id_pred_ras_link_vld1)
                            & cp0_ifu_ras_en
                            & ~ras_cur_jalr
                            & ~ibuf_ipack_stall;

assign id_pred_ras_ret_vld0  = id_pred_ret_vld0;
assign id_pred_ras_ret_vld1  = id_pred_ret_vld1 & ~id_pred_inst0_bjtype;
assign id_pred_ras_ret_req1  = id_pred_ret_vld1 & ~id_pred_inst0_taken;
assign id_pred_ras_ret_chgflw = (id_pred_ras_ret_vld0 | id_pred_ras_ret_vld1);
assign id_pred_ras_ret_req   = (id_pred_ras_ret_vld0 | id_pred_ras_ret_req1);
                             //& cp0_ifu_ras_en; // & ~ibuf_ipack_stall;
assign id_pred_ras_sel1    = id_pred_ras_link_vld1 & ~id_pred_ras_link_vld0;

assign id_pred_ras_ret_vld = id_pred_ras_ret_chgflw & ~ras_cur_jalr & ~ibuf_ipack_stall;

assign id_pred_ras_ind_link = (id_pred_ind_link_vld0 | id_pred_ind_link_vld1);
assign id_pred_ras_ind_link_vld = (id_pred_ind_link_vld0
                                | id_pred_ind_link_vld1 & ~id_pred_inst0_taken)
                                & ~ibuf_ipack_stall
                                & cp0_ifu_ras_en;

assign ras_link_offset[23:0] = id_pred_ras_link_vld0 & id_pred_inst0_32 
                             ? 24'h4 : 24'h2;

assign id_pred_ras_link_pc[23:0] = id_pred_cur_pc[23:0] + ras_link_offset[23:0];

// b. Instance RAS
// &Instance("pa_ifu_ras", "x_pa_ifu_ras"); @267
pa_ifu_ras  x_pa_ifu_ras (
  .cp0_ifu_icg_en          (cp0_ifu_icg_en         ),
  .cp0_yy_clk_en           (cp0_yy_clk_en          ),
  .cpurst_b                (cpurst_b               ),
  .forever_cpuclk          (forever_cpuclk         ),
  .id_pred_ras_link_pc     (id_pred_ras_link_pc    ),
  .id_pred_ras_link_vld    (id_pred_ras_link_vld   ),
  .id_pred_ras_ret_vld     (id_pred_ras_ret_vld    ),
  .iu_ifu_bht_mispred      (iu_ifu_bht_mispred     ),
  .iu_ifu_bht_mispred_gate (iu_ifu_bht_mispred_gate),
  .iu_ifu_link_vld         (iu_ifu_link_vld        ),
  .iu_ifu_link_vld_gate    (iu_ifu_link_vld_gate   ),
  .iu_ifu_pc_mispred       (iu_ifu_pc_mispred      ),
  .iu_ifu_pc_mispred_gate  (iu_ifu_pc_mispred_gate ),
  .iu_ifu_ret_vld          (iu_ifu_ret_vld         ),
  .iu_ifu_ret_vld_gate     (iu_ifu_ret_vld_gate    ),
  .iu_yy_xx_cancel         (iu_yy_xx_cancel        ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .ras_cur_ret             (ras_cur_ret            ),
  .ras_id_pred_tar_pc      (ras_id_pred_tar_pc     ),
  .rtu_ifu_flush_fe        (rtu_ifu_flush_fe       )
);


// c. RAS Result
// &Force("input", "idu_ifu_x1"); @270
// &Force("bus", "idu_ifu_x1", 31, 0); @271
assign id_pred_ras_tar[31:0] = {id_pred_idpc[31:24], ras_id_pred_tar_pc[23:0]};

// &Force("nonport", "id_pred_inst0_32"); @277
// &Force("nonport", "id_pred_ras_link_vld"); @278
// &Force("input", "iu_ifu_ret_vld"); @279
// &Force("input", "iu_ifu_ret_vld_gate"); @280
// &Force("input", "iu_ifu_link_vld"); @281
// &Force("input", "iu_ifu_link_vld_gate"); @282
// &Force("input", "iu_ifu_ind_link_vld"); @283
// &Force("input", "iu_ifu_pc_mispred"); @284
// &Force("input", "iu_ifu_pc_mispred_gate"); @285

// d. RAS Stall FSM
parameter RAS_IDLE = 2'b00;
parameter RAS_RET  = 2'b01;
parameter RAS_JALR = 2'b11;

always @ (posedge id_ras_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ras_cur_st[1:0] <= RAS_IDLE;
  else if(pcgen_id_pred_flush_vld | rtu_ifu_flush_fe)
    ras_cur_st[1:0] <= RAS_IDLE;
  else
    ras_cur_st[1:0] <= ras_nxt_st[1:0];
end

// &CombBeg; @306
always @( id_pred_ras_ind_link_vld
       or iu_ifu_ret_vld
       or iu_ifu_ind_link_vld
       or ras_cur_st[1:0]
       or id_pred_ras_ret_vld)
begin
case(ras_cur_st[1:0])
  RAS_IDLE:
    if(id_pred_ras_ret_vld)
      ras_nxt_st[1:0] = RAS_RET;
    else if(id_pred_ras_ind_link_vld)
      ras_nxt_st[1:0] = RAS_JALR;
    else
      ras_nxt_st[1:0] = RAS_IDLE;
  RAS_RET:
    if(iu_ifu_ret_vld)
      ras_nxt_st[1:0] = RAS_IDLE;
    else
      ras_nxt_st[1:0] = RAS_RET;
  RAS_JALR:
    if(iu_ifu_ind_link_vld)
      ras_nxt_st[1:0] = RAS_IDLE;
    else
      ras_nxt_st[1:0] = RAS_JALR;
  default:
      ras_nxt_st[1:0] = RAS_IDLE;
endcase
// &CombEnd; @328
end

assign ras_cur_ret  = ras_cur_st[1:0] == RAS_RET;
assign ras_cur_jalr = ras_cur_st[1:0] == RAS_JALR;
assign id_pred_ret_stall = ras_cur_ret & id_pred_ras_ret_vld
                         | ras_cur_jalr;

assign ras_pred_pc_update = id_pred_ras_ret_vld & ras_cur_st[1:0] == RAS_IDLE;
always @ (posedge id_ras_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ras_pred_pc[31:0] <= 32'b0;
  else if(ras_pred_pc_update)
    ras_pred_pc[31:0] <= id_pred_ras_tar[31:0];
  else
    ras_pred_pc[31:0] <= ras_pred_pc[31:0];
end

//------------------------------------------------
// 6. ID Prediction Address Generation
// a. ID Prediction Change Flow
// b. IF Miss-Prediction Judgement
//------------------------------------------------
assign id_pred_chgflw_vld0 = id_pred_br_taken0 | id_pred_ras_ret_vld0;
assign id_pred_chgflw_vld1 = id_pred_br_taken1 | id_pred_ras_ret_req1;
assign id_pred_chgflw_vld  = id_pred_chgflw_vld0 | id_pred_chgflw_vld1;
assign id_pred_chgflw_tar[31:0] = id_pred_ras_ret_req ? id_pred_ras_tar[31:0]
                                                      : id_pred_br_tar[31:0];

// b. IF Miss-Prediction Judgement
assign btb_mis_pred = (id_pred_br_tar[31:0] 
                    != pcgen_id_pred_btb_tar_pc[31:0]
                    | ~id_pred_chgflw_vld) & pcgen_id_pred_btb_tar_vld
                      & (ipack_id_pred_inst0_vld
                       | ipack_id_pred_inst1_vld);
// TODO: btb pc whole compare
// &Force("input", "pcgen_id_pred_btb_tar_pc"); @364
// &Force("bus", "pcgen_id_pred_btb_tar_pc", 31, 0); @365
//assign btb_mis_pred = ~id_pred_br_taken & pcgen_id_pred_btb_tar_vld
//                      & (ipack_id_pred_inst0_vld
//                       | ipack_id_pred_inst1_vld);

assign id_pred_chgflw       = (pcgen_id_pred_btb_tar_vld ? btb_mis_pred
                                                         : id_pred_br_taken)
                           ;// | id_pred_ras_ret_vld;// | delay_chgflw;
assign id_pred_chgflw_fin   = id_pred_ras_ret_chgflw | delay_chgflw;
assign id_pred_chgflw_fin_tar1[31:0] = id_pred_chgflw_vld
                                    ? id_pred_chgflw_tar[31:0]
                                    : id_pred_nxt_pc[31:0];
assign id_pred_chgflw_fin_tar[31:0] = delay_chgflw ? chgflw_pc[31:0]
                                                   : id_pred_ras_tar[31:0];

//------------------------------------------------
// 7. Inst bkpt judgement
//------------------------------------------------
assign id_pred_inst0_bkpt_pc[31:0] = ipack_id_pred_h0_vld ? id_pred_h0_pc[31:0]
                                   : id_pred_idpc[31:0];
assign id_pred_inst1_bkpt_pc[31:0] = {id_pred_idpc[31:2], 2'b10};

assign ifu_dtu_addr_vld0  = ipack_id_pred_inst0_vld;
assign ifu_dtu_data_vld0  = ipack_id_pred_inst0_vld & ~ipack_id_pred_inst0_expt;
assign ifu_dtu_exe_addr0[31:0] = id_pred_inst0_bkpt_pc[31:0];
assign ifu_dtu_exe_data0[31:0] = ipack_id_pred_inst0[31:0];

assign ifu_dtu_addr_vld1  = ipack_id_pred_inst1_vld;
assign ifu_dtu_data_vld1  = ipack_id_pred_inst1_vld & ~ipack_id_pred_inst1_expt;
assign ifu_dtu_exe_addr1[31:0] = id_pred_inst1_bkpt_pc[31:0];
assign ifu_dtu_exe_data1[31:0] = {16'b0, ipack_id_pred_inst1[15:0]};

//==========================================================
// Rename for Output
//==========================================================

// Output to pcgen
assign id_pred_pcgen_chgflw_vld      = id_pred_chgflw_fin;
assign id_pred_pcgen_inst_vld        = (ipack_id_pred_inst0_vld
                                     | ipack_id_pred_inst1_vld) & ~ibuf_ipack_stall;
assign id_pred_pcgen_chgflw_pc[31:0] = id_pred_chgflw_fin_tar[31:0];

// Output to ipack
assign id_pred_ipack_chgflw_vld0 = id_pred_chgflw_vld0; 

// Output to ibuf
assign id_pred_ibuf_chgflw_vld0     = id_pred_chgflw_vld0;
assign id_pred_ibuf_br_taken0[1:0]  = id_pred_br_rslt0[1:0];
assign id_pred_ibuf_br_taken1[1:0]  = id_pred_br_rslt1[1:0];
assign id_pred_ibuf_halt_info0[`TDT_HINFO_WIDTH-1:0] = dtu_ifu_halt_info0[`TDT_HINFO_WIDTH-1:0];
assign id_pred_ibuf_halt_info1[`TDT_HINFO_WIDTH-1:0] = dtu_ifu_halt_info1[`TDT_HINFO_WIDTH-1:0];
assign id_pred_ipack_ret_stall      = id_pred_ret_stall;
assign id_pred_ipack_delay_stall    = id_pred_delay_br;
assign id_pred_ipack_mask           = id_pred_delay_br1;

// Output to ctrl
assign id_pred_ctrl_stall          = id_pred_ret_stall | id_pred_delay_br | id_pred_delay_br1 | ibuf_pred_stall;

// Output to top
assign pred_top_delay_chgflw = delay_chgflw;
assign pred_top_ras_st       = ras_cur_st[0];

// &Force("bus", "pcgen_id_pred_ifpc", 31, 0); @427
// Output to btb
assign id_pred_btb_upd_vld      = id_pred_br_taken & ~btb_mis_pred 
                               & ibuf_id_pred_hungry;
assign id_pred_btb_upd_vldg     = id_pred_br_taken  
                               & ibuf_id_pred_hungry;
assign id_pred_btb_mis_pred     = btb_mis_pred;
assign id_pred_btb_mis_predg     =  pcgen_id_pred_btb_tar_vld
                      & (ipack_id_pred_inst0_vld
                                             | ipack_id_pred_inst1_vld);
assign id_pred_btb_cur_pc[31:0] = ipack_id_pred_unalign ? {pcgen_id_pred_ifpc[31:2], 2'b0}
                                                        : {id_pred_idpc[31:2], 2'b0};
assign id_pred_btb_tar_pc[31:0] = id_pred_br_tar[31:0];
// &Force("input", "ibuf_id_pred_hungry"); @442
// &Force("input", "pcgen_id_pred_ifpc"); @443

// Output to IU
assign ifu_iu_ex1_pc_pred[31:0] = ras_pred_pc[31:0];

// &ModuleEnd; @449
endmodule


