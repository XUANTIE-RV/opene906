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
module pa_iu_bju(
  ag_bju_pc,
  bju_dp_ex1_cmplt_dp,
  bju_dp_ex1_rslt,
  bju_dp_ex1_rslt_vld,
  bju_dp_ex1_stall,
  bju_dp_no_op,
  bju_iu_debug_info,
  cp0_iu_adder_borrow_in,
  cp0_iu_adder_borrow_vld,
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  idu_iu_ex1_bht_pred,
  idu_iu_ex1_bju_cmplt_dp_sel,
  idu_iu_ex1_bju_depd_lsu_src0,
  idu_iu_ex1_bju_depd_lsu_src1,
  idu_iu_ex1_bju_gateclk_sel,
  idu_iu_ex1_bju_sel,
  idu_iu_ex1_dst_preg,
  idu_iu_ex1_func,
  idu_iu_ex1_gateclk_vld,
  idu_iu_ex1_inst_len,
  idu_iu_ex1_inst_vld,
  idu_iu_ex1_split,
  idu_iu_ex1_src0,
  idu_iu_ex1_src0_reg,
  idu_iu_ex1_src1,
  idu_iu_ex1_src1_reg,
  idu_iu_ex1_wb_vld,
  idu_iu_tail_fail,
  idu_iu_tail_fail_gate,
  ifu_iu_chgflw_pc,
  ifu_iu_chgflw_vld,
  ifu_iu_ex1_pc_pred,
  ifu_iu_reset_vld,
  ifu_iu_warm_up,
  iu_cp0_ex1_borrow_expt_pc,
  iu_ex1_cur_pc,
  iu_hpcp_inst_bht_mispred,
  iu_hpcp_inst_condbr,
  iu_hpcp_inst_condbr_gate,
  iu_idu_bju_global_stall,
  iu_idu_bju_stall,
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
  iu_rtu_ex1_bju_branch_inst,
  iu_rtu_ex1_bju_cmplt,
  iu_rtu_ex1_bju_cmplt_dp,
  iu_rtu_ex1_bju_cur_pc,
  iu_rtu_ex1_bju_inst_len,
  iu_rtu_ex1_bju_inst_vld,
  iu_rtu_ex1_bju_split_inst,
  iu_rtu_ex1_next_pc,
  iu_rtu_ex2_bju_flush,
  iu_rtu_ex2_bju_next_pc,
  iu_rtu_ex2_bju_next_pc_vld,
  iu_yy_xx_cancel,
  lsu_iu_ex2_data,
  lsu_iu_ex2_data_vld,
  lsu_iu_ex2_dest_reg,
  pad_yy_icg_scan_en,
  rtu_iu_bju_ex2_cur_pc,
  rtu_iu_ex1_cmplt_dp_vld,
  rtu_iu_ex1_cmplt_inst_len,
  rtu_iu_ex1_cmplt_split_inst,
  rtu_iu_ex1_cmplt_vld,
  rtu_xx_ex1_stall,
  sysio_iu_rst_addr
);

// &Ports; @24
input   [31:0]  ag_bju_pc;                     
input           cp0_iu_adder_borrow_in;        
input           cp0_iu_adder_borrow_vld;       
input           cp0_iu_icg_en;                 
input           cp0_yy_clk_en;                 
input           cpurst_b;                      
input           forever_cpuclk;                
input   [1 :0]  idu_iu_ex1_bht_pred;           
input           idu_iu_ex1_bju_cmplt_dp_sel;   
input           idu_iu_ex1_bju_depd_lsu_src0;  
input           idu_iu_ex1_bju_depd_lsu_src1;  
input           idu_iu_ex1_bju_gateclk_sel;    
input           idu_iu_ex1_bju_sel;            
input   [5 :0]  idu_iu_ex1_dst_preg;           
input   [19:0]  idu_iu_ex1_func;               
input           idu_iu_ex1_gateclk_vld;        
input           idu_iu_ex1_inst_len;           
input           idu_iu_ex1_inst_vld;           
input           idu_iu_ex1_split;              
input   [31:0]  idu_iu_ex1_src0;               
input   [5 :0]  idu_iu_ex1_src0_reg;           
input   [31:0]  idu_iu_ex1_src1;               
input   [5 :0]  idu_iu_ex1_src1_reg;           
input           idu_iu_ex1_wb_vld;             
input           idu_iu_tail_fail;              
input           idu_iu_tail_fail_gate;         
input   [31:0]  ifu_iu_chgflw_pc;              
input           ifu_iu_chgflw_vld;             
input   [31:0]  ifu_iu_ex1_pc_pred;            
input           ifu_iu_reset_vld;              
input           ifu_iu_warm_up;                
input   [31:0]  lsu_iu_ex2_data;               
input           lsu_iu_ex2_data_vld;           
input   [5 :0]  lsu_iu_ex2_dest_reg;           
input           pad_yy_icg_scan_en;            
input   [31:0]  rtu_iu_bju_ex2_cur_pc;         
input           rtu_iu_ex1_cmplt_dp_vld;       
input           rtu_iu_ex1_cmplt_inst_len;     
input           rtu_iu_ex1_cmplt_split_inst;   
input           rtu_iu_ex1_cmplt_vld;          
input           rtu_xx_ex1_stall;              
input   [31:0]  sysio_iu_rst_addr;             
output          bju_dp_ex1_cmplt_dp;           
output  [31:0]  bju_dp_ex1_rslt;               
output          bju_dp_ex1_rslt_vld;           
output          bju_dp_ex1_stall;              
output          bju_dp_no_op;                  
output  [3 :0]  bju_iu_debug_info;             
output  [31:0]  iu_cp0_ex1_borrow_expt_pc;     
output  [31:0]  iu_ex1_cur_pc;                 
output          iu_hpcp_inst_bht_mispred;      
output          iu_hpcp_inst_condbr;           
output          iu_hpcp_inst_condbr_gate;      
output          iu_idu_bju_global_stall;       
output          iu_idu_bju_stall;              
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
output          iu_rtu_ex1_bju_branch_inst;    
output          iu_rtu_ex1_bju_cmplt;          
output          iu_rtu_ex1_bju_cmplt_dp;       
output  [30:0]  iu_rtu_ex1_bju_cur_pc;         
output          iu_rtu_ex1_bju_inst_len;       
output          iu_rtu_ex1_bju_inst_vld;       
output          iu_rtu_ex1_bju_split_inst;     
output  [30:0]  iu_rtu_ex1_next_pc;            
output          iu_rtu_ex2_bju_flush;          
output  [30:0]  iu_rtu_ex2_bju_next_pc;        
output          iu_rtu_ex2_bju_next_pc_vld;    
output          iu_yy_xx_cancel;               

// &Regs; @25
reg             bju_cur_state;                 
reg     [1 :0]  bju_ex2_bht_pred;              
reg     [3 :0]  bju_ex2_func_4_1;              
reg             bju_ex2_inst_len;              
reg     [31:0]  bju_ex2_not_pred_pc;           
reg     [31:0]  bju_ex2_src0;                  
reg     [31:0]  bju_ex2_src1;                  
reg             bju_next_state;                
reg     [30:0]  bju_pcgen_pc_31;               
reg             bju_ras_mispred_vld;           

// &Wires; @26
wire    [31:0]  ag_bju_pc;                     
wire    [31:0]  bju_ag_tar_pc;                 
wire            bju_ag_tar_pc_sel;             
wire    [31:0]  bju_auipc_res;                 
wire            bju_beq_taken;                 
wire    [31:0]  bju_bht_cur_pc;                
wire            bju_bht_mispred;               
wire            bju_bht_mispred_gate;          
wire    [1 :0]  bju_bht_pred;                  
wire            bju_bht_taken;                 
wire            bju_blt_taken;                 
wire            bju_br_jalr_clk;               
wire            bju_br_jalr_clk_en;            
wire            bju_br_vld;                    
wire            bju_br_vld_gate;               
wire            bju_clk;                       
wire            bju_clk_en;                    
wire            bju_cond_br_taken;             
wire            bju_cond_br_taken_raw;         
wire            bju_cond_sel;                  
wire            bju_dp_ex1_cmplt_dp;           
wire    [31:0]  bju_dp_ex1_rslt;               
wire            bju_dp_ex1_rslt_vld;           
wire            bju_dp_ex1_stall;              
wire            bju_dp_no_op;                  
wire            bju_ex1_auipc_sel;             
wire            bju_ex1_bht_mispred;           
wire            bju_ex1_bht_mispred_gate;      
wire            bju_ex1_cond_sel;              
wire            bju_ex1_depd_lsu;              
wire            bju_ex1_depd_lsu_cmplt;        
wire            bju_ex1_depd_lsu_fwd_vld;      
wire            bju_ex1_depd_lsu_fwd_vld_gate; 
wire            bju_ex1_depd_lsu_src0;         
wire            bju_ex1_depd_lsu_src1;         
wire    [7 :0]  bju_ex1_func;                  
wire            bju_ex1_inst_cmplt;            
wire            bju_ex1_inst_cmplt_dp;         
wire            bju_ex1_no_depd_lsu_cmplt;     
wire            bju_ex1_no_depd_lsu_cmplt_gate; 
wire    [31:0]  bju_ex1_not_pred_pc;           
wire    [31:0]  bju_ex1_src0;                  
wire    [31:0]  bju_ex1_src1;                  
wire            bju_ex1_tar_pc_vld;            
wire            bju_ex1_tar_pc_vld_gate;       
wire            bju_ex1_uncond_sel;            
wire            bju_ex2_bht_mispred;           
wire    [31:0]  bju_ex2_chgflw_pc;             
wire            bju_ex2_chgflw_vld;            
wire    [4 :0]  bju_func;                      
wire            bju_fwd_clk;                   
wire            bju_fwd_clk_en;                
wire            bju_hi_clk;                    
wire            bju_hi_clk_en;                 
wire            bju_hi_updt;                   
wire    [31:0]  bju_inc_pc;                    
wire    [30:0]  bju_inc_pc_31_1;               
wire            bju_ind_link_vld;              
wire            bju_inst_jalr;                 
wire            bju_is_ex1;                    
wire            bju_is_ex2;                    
wire    [3 :0]  bju_iu_debug_info;             
wire            bju_link_vld;                  
wire            bju_link_vld_raw;              
wire    [31:0]  bju_next_pc;                   
wire            bju_pc_cmp_fail;               
wire            bju_pc_mispred;                
wire            bju_pc_mispred_raw;            
wire    [31:0]  bju_pcgen_pc;                  
wire            bju_ras_clk;                   
wire            bju_ras_clk_en;                
wire            bju_ras_pc_mispred_set;        
wire            bju_ras_pc_mispred_set_gate;   
wire            bju_ret_vld;                   
wire            bju_ret_vld_raw;               
wire            bju_rs1_lt_rs2;                
wire            bju_rs1_lt_rs2_signed;         
wire    [31:0]  bju_src0;                      
wire    [31:0]  bju_src1;                      
wire            bju_src_dst_reg_equal;         
wire            cp0_iu_adder_borrow_in;        
wire            cp0_iu_adder_borrow_vld;       
wire            cp0_iu_icg_en;                 
wire            cp0_yy_clk_en;                 
wire            cpurst_b;                      
wire            forever_cpuclk;                
wire    [1 :0]  idu_iu_ex1_bht_pred;           
wire            idu_iu_ex1_bju_cmplt_dp_sel;   
wire            idu_iu_ex1_bju_depd_lsu_src0;  
wire            idu_iu_ex1_bju_depd_lsu_src1;  
wire            idu_iu_ex1_bju_gateclk_sel;    
wire            idu_iu_ex1_bju_sel;            
wire    [5 :0]  idu_iu_ex1_dst_preg;           
wire    [19:0]  idu_iu_ex1_func;               
wire            idu_iu_ex1_gateclk_vld;        
wire            idu_iu_ex1_inst_len;           
wire            idu_iu_ex1_inst_vld;           
wire            idu_iu_ex1_split;              
wire    [31:0]  idu_iu_ex1_src0;               
wire    [5 :0]  idu_iu_ex1_src0_reg;           
wire    [31:0]  idu_iu_ex1_src1;               
wire            idu_iu_ex1_wb_vld;             
wire            idu_iu_tail_fail;              
wire            idu_iu_tail_fail_gate;         
wire    [31:0]  ifu_iu_chgflw_pc;              
wire            ifu_iu_chgflw_vld;             
wire    [31:0]  ifu_iu_ex1_pc_pred;            
wire            ifu_iu_reset_vld;              
wire            ifu_iu_warm_up;                
wire    [31:0]  iu_cp0_ex1_borrow_expt_pc;     
wire    [31:0]  iu_ex1_cur_pc;                 
wire            iu_hpcp_inst_bht_mispred;      
wire            iu_hpcp_inst_condbr;           
wire            iu_hpcp_inst_condbr_gate;      
wire            iu_idu_bju_global_stall;       
wire            iu_idu_bju_stall;              
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
wire            iu_rtu_ex1_bju_branch_inst;    
wire            iu_rtu_ex1_bju_cmplt;          
wire            iu_rtu_ex1_bju_cmplt_dp;       
wire    [30:0]  iu_rtu_ex1_bju_cur_pc;         
wire            iu_rtu_ex1_bju_inst_len;       
wire            iu_rtu_ex1_bju_inst_vld;       
wire            iu_rtu_ex1_bju_split_inst;     
wire    [30:0]  iu_rtu_ex1_next_pc;            
wire            iu_rtu_ex2_bju_flush;          
wire    [30:0]  iu_rtu_ex2_bju_next_pc;        
wire            iu_rtu_ex2_bju_next_pc_vld;    
wire            iu_yy_xx_cancel;               
wire    [31:0]  lsu_iu_ex2_data;               
wire            lsu_iu_ex2_data_vld;           
wire            pad_yy_icg_scan_en;            
wire    [1 :0]  pc_inc_in;                     
wire            pcgen_pipedown;                
wire    [31:0]  rtu_iu_bju_ex2_cur_pc;         
wire            rtu_iu_ex1_cmplt_dp_vld;       
wire            rtu_iu_ex1_cmplt_inst_len;     
wire            rtu_iu_ex1_cmplt_split_inst;   
wire            rtu_iu_ex1_cmplt_vld;          
wire            rtu_xx_ex1_stall;              
wire    [31:0]  sysio_iu_rst_addr;             


// &Force("bus", "idu_iu_ex1_func", 19, 0); @28
//==========================================================
//                   Operand  Prepare
//==========================================================
assign bju_ex1_func[7:0]       = { 8{idu_iu_ex1_bju_sel}} & idu_iu_ex1_func[7:0];
assign bju_ex1_uncond_sel      = bju_ex1_func[5];
assign bju_ex1_cond_sel        = bju_ex1_func[6];
assign bju_ex1_auipc_sel       = bju_ex1_func[7];
// operand mux
assign bju_ex1_src0[31:0]      = {32{idu_iu_ex1_bju_sel}} & idu_iu_ex1_src0[31:0];
assign bju_ex1_src1[31:0]      = {32{idu_iu_ex1_bju_sel}} & idu_iu_ex1_src1[31:0];

assign bju_ex1_depd_lsu_src0   = idu_iu_ex1_bju_depd_lsu_src0 && bju_ex1_cond_sel; //cond branch inst
assign bju_ex1_depd_lsu_src1   = idu_iu_ex1_bju_depd_lsu_src1 && bju_ex1_cond_sel;

assign bju_ex1_depd_lsu        = bju_ex1_depd_lsu_src0 || bju_ex1_depd_lsu_src1;

// ex1 inst vld will be clear when ex1 depd lsu or bju_in_ex2.
assign bju_ex1_no_depd_lsu_cmplt      = idu_iu_ex1_inst_vld && idu_iu_ex1_bju_sel && !bju_ex1_depd_lsu;
assign bju_ex1_no_depd_lsu_cmplt_gate = idu_iu_ex1_bju_gateclk_sel && !bju_ex1_depd_lsu;

assign bju_ex1_depd_lsu_cmplt         = idu_iu_ex1_inst_vld && bju_ex1_depd_lsu && lsu_iu_ex2_data_vld;
assign bju_ex1_depd_lsu_fwd_vld       = bju_ex1_depd_lsu_cmplt;
// gate signal is for ICG.
assign bju_ex1_depd_lsu_fwd_vld_gate  = idu_iu_ex1_gateclk_vld && bju_ex1_depd_lsu && lsu_iu_ex2_data_vld;


//==========================================================
//                    BJU State Machine
//==========================================================
// bju_ex2 only occur when bju depd load.
parameter BJU_EX1 = 1'b0;
parameter BJU_EX2 = 1'b1;

always @ (posedge bju_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bju_cur_state <= BJU_EX1;
  else
    bju_cur_state <= bju_next_state;
end

// &CombBeg; @70
always @( bju_ex1_depd_lsu_fwd_vld
       or bju_cur_state)
begin
  case(bju_cur_state)
    BJU_EX1:
      if (bju_ex1_depd_lsu_fwd_vld)
        bju_next_state = BJU_EX2;
      else
        bju_next_state = BJU_EX1;
    BJU_EX2:
      bju_next_state = BJU_EX1;
    default:
      bju_next_state = BJU_EX1;
  endcase
// &CombEnd; @82
end

assign bju_is_ex1 = bju_cur_state == BJU_EX1;
assign bju_is_ex2 = bju_cur_state == BJU_EX2;

// this signal for bju no op
assign bju_dp_no_op  = !bju_is_ex2 & !bju_ras_mispred_vld;
//==========================================================
//                    EX1 to EX2 flop
//==========================================================
always @ (posedge bju_fwd_clk)
begin
  if (bju_ex1_depd_lsu_fwd_vld || ifu_iu_warm_up) begin
    bju_ex2_func_4_1[3:0]     <= bju_ex1_func[4:1];
    bju_ex2_inst_len          <= idu_iu_ex1_inst_len;
    bju_ex2_bht_pred[1:0]     <= idu_iu_ex1_bht_pred[1:0];
  end
end

always @ (posedge bju_br_jalr_clk)
begin
  if (bju_ex1_depd_lsu_fwd_vld || bju_ras_pc_mispred_set || ifu_iu_warm_up) begin
    bju_ex2_not_pred_pc[31:0] <= bju_ex1_not_pred_pc[31:0];
  end
end


always @ (posedge bju_fwd_clk)
begin
  if (bju_ex1_depd_lsu_fwd_vld && idu_iu_ex1_bju_depd_lsu_src0) begin
    bju_ex2_src0[31:0] <= lsu_iu_ex2_data[31:0];
  end
  else if (bju_ex1_depd_lsu_fwd_vld && !idu_iu_ex1_bju_depd_lsu_src0 || ifu_iu_warm_up) begin
    bju_ex2_src0[31:0] <= bju_ex1_src0[31:0];
  end
end

always @ (posedge bju_fwd_clk)
begin
  if (bju_ex1_depd_lsu_fwd_vld && idu_iu_ex1_bju_depd_lsu_src1) begin
    bju_ex2_src1[31:0] <= lsu_iu_ex2_data[31:0];
  end
  else if (bju_ex1_depd_lsu_fwd_vld && !idu_iu_ex1_bju_depd_lsu_src1 || ifu_iu_warm_up) begin
    bju_ex2_src1[31:0] <= bju_ex1_src1[31:0];
  end
end

assign bju_ex2_chgflw_vld      = bju_ex2_bht_mispred;
assign bju_ex2_chgflw_pc[31:0] = bju_ex2_not_pred_pc[31:0];

//==========================================================
//                    EX1/EX2 Select
//==========================================================
assign bju_func[4:0]       = bju_is_ex1 ? bju_ex1_func[4:0]
                                        : {bju_ex2_func_4_1[3:0], 1'b0};
assign bju_src0[31:0]      = bju_is_ex1 ? bju_ex1_src0[31:0]
                                        : bju_ex2_src0[31:0];
assign bju_src1[31:0]      = bju_is_ex1 ? bju_ex1_src1[31:0]
                                        : bju_ex2_src1[31:0];
assign bju_bht_pred[1:0]   = bju_is_ex1 ? idu_iu_ex1_bht_pred[1:0]
                                        : bju_ex2_bht_pred[1:0];
//==========================================================
//                        Inc PC
//==========================================================
// note: the CP0 ifu access fault expt will borrow this adder for the expt
// tval
assign pc_inc_in[1:0]                  = cp0_iu_adder_borrow_vld ? {1'b0,cp0_iu_adder_borrow_in}
                                                                 : {rtu_iu_ex1_cmplt_inst_len, !rtu_iu_ex1_cmplt_inst_len};
assign bju_inc_pc_31_1[30:0]           = bju_pcgen_pc[31:1] + {29'b0, pc_inc_in[1:0]};
assign bju_inc_pc[31:0]                = {bju_inc_pc_31_1[30:0], 1'b0};
assign iu_cp0_ex1_borrow_expt_pc[31:0] = {bju_inc_pc_31_1[30:0],1'b0};
//==========================================================
//                        AUIPC
//==========================================================
assign bju_auipc_res[31:0] = ag_bju_pc[31:0];

//==========================================================
//              Un-condition Branch & Jump
//==========================================================
assign bju_inst_jalr  = bju_ex1_uncond_sel & bju_ex1_func[2];

//------------ From Addr_gen -----------
assign bju_ag_tar_pc[31:0] = ag_bju_pc[31:0];


//==========================================================
//                  Condition Branch
//==========================================================
assign bju_cond_sel           = bju_ex1_cond_sel || bju_is_ex2;

assign bju_beq_taken  = bju_src0[31:0] == bju_src1[31:0];
assign bju_rs1_lt_rs2 = bju_src0[31:0] < bju_src1[31:0];
assign bju_rs1_lt_rs2_signed =  bju_src0[31] &&  bju_src1[31] && bju_rs1_lt_rs2
                            ||  bju_src0[31] && !bju_src1[31]
                            || !bju_src0[31] && !bju_src1[31] && bju_rs1_lt_rs2;
assign bju_blt_taken  = bju_func[4] ? bju_rs1_lt_rs2_signed
                                          : bju_rs1_lt_rs2;


assign bju_cond_br_taken_raw = (bju_beq_taken  ^ bju_func[3]) & bju_func[2]     // beq and bne taken
                             | (bju_blt_taken  ^ bju_func[3]) & bju_func[1];    // blt/bltu and bge/bgeu taken
assign bju_cond_br_taken     = bju_ex1_no_depd_lsu_cmplt || bju_is_ex2 ? bju_cond_br_taken_raw
                                                                       : idu_iu_ex1_bht_pred[1];

//==========================================================
//                     Next PC
//==========================================================
assign bju_ag_tar_pc_sel = bju_ex1_cond_sel && bju_cond_br_taken
                        || bju_ex1_uncond_sel;
assign bju_next_pc[31:0] = bju_ag_tar_pc_sel ? bju_ag_tar_pc[31:0]
                                             : bju_inc_pc[31:0];
//==========================================================
//               Branch & Jump Inst target PC
//==========================================================
// BHT predict result is in pred[1].
//   0-untaken, 1-taken.
assign bju_ex1_not_pred_pc[31:0] = bju_bht_pred[1] ? bju_inc_pc[31:0]
                                                   : bju_ag_tar_pc[31:0];

//------------- BHT Mispred ------------
assign bju_ex1_bht_mispred      = bju_ex1_cond_sel && (bju_cond_br_taken_raw ^ bju_bht_pred[1]) && 
                                  bju_ex1_no_depd_lsu_cmplt;

assign bju_ex1_bht_mispred_gate = bju_ex1_cond_sel && (bju_cond_br_taken_raw ^ bju_bht_pred[1]) && 
                                  bju_ex1_no_depd_lsu_cmplt_gate;

assign bju_ex2_bht_mispred      = bju_is_ex2 && (bju_cond_br_taken_raw ^ bju_bht_pred[1]);

assign bju_br_vld  = bju_cond_sel && (bju_ex1_no_depd_lsu_cmplt || bju_is_ex2);
assign bju_br_vld_gate = bju_cond_sel && (bju_ex1_no_depd_lsu_cmplt_gate || bju_is_ex2);
assign bju_bht_taken = bju_cond_sel && bju_cond_br_taken;

// &Force("bus", "idu_iu_ex1_dst_preg", 5, 0); @270
// &Force("bus", "idu_iu_ex1_src0_reg", 5, 0); @271

//------------- PC Mispred -------------
// bju_pc_cmp_fail will set ex2_chgflw because of timing.
assign bju_pc_cmp_fail     = bju_inst_jalr
                          && idu_iu_ex1_src0_reg[4:0] == 5'b1
                          && (bju_src_dst_reg_equal || bju_ag_tar_pc[31:0] != ifu_iu_ex1_pc_pred[31:0]);

assign bju_ras_pc_mispred_set = idu_iu_ex1_inst_vld & idu_iu_ex1_bju_sel & bju_pc_cmp_fail;
assign bju_ras_pc_mispred_set_gate = idu_iu_ex1_gateclk_vld & idu_iu_ex1_bju_sel & bju_pc_cmp_fail;

always@ (posedge bju_ras_clk or negedge cpurst_b)
begin
    if(!cpurst_b)
      bju_ras_mispred_vld <= 1'b0;
    else if(bju_ras_pc_mispred_set)
      bju_ras_mispred_vld <= 1'b1;
    else
      bju_ras_mispred_vld <= 1'b0;
end

assign bju_pc_mispred_raw = bju_inst_jalr && 
                            idu_iu_ex1_src0_reg[4:0] != 5'b1;

assign bju_pc_mispred     = bju_pc_mispred_raw && idu_iu_ex1_inst_vld;

assign bju_ex1_tar_pc_vld      = bju_ex1_bht_mispred      || bju_pc_mispred;
assign bju_ex1_tar_pc_vld_gate = bju_ex1_bht_mispred_gate || bju_pc_mispred_raw;
                            
assign bju_bht_mispred      = bju_ex1_bht_mispred      || bju_ex2_bht_mispred;
assign bju_bht_mispred_gate = bju_ex1_bht_mispred_gate || bju_ex2_bht_mispred;

assign bju_src_dst_reg_equal = (idu_iu_ex1_src0_reg[5:0] == idu_iu_ex1_dst_preg[5:0]) && idu_iu_ex1_wb_vld;
assign bju_ret_vld_raw   = idu_iu_ex1_src0_reg[4:0] == 5'b1 && bju_inst_jalr && !bju_src_dst_reg_equal;
assign bju_ret_vld       = idu_iu_ex1_inst_vld && bju_ret_vld_raw;
assign bju_link_vld_raw  = idu_iu_ex1_dst_preg[4:0] == 5'b1 && bju_ex1_uncond_sel && idu_iu_ex1_wb_vld;
assign bju_link_vld      = idu_iu_ex1_inst_vld && bju_link_vld_raw;
assign bju_ind_link_vld  = idu_iu_ex1_inst_vld && bju_link_vld_raw && bju_inst_jalr;

assign bju_ex1_inst_cmplt    = |bju_ex1_func[7:5] && (bju_ex1_no_depd_lsu_cmplt ||
                                                      bju_ex1_depd_lsu_cmplt);
assign bju_ex1_inst_cmplt_dp = |bju_ex1_func[7:5] && idu_iu_ex1_bju_cmplt_dp_sel;

//==========================================================
//                     PC Generator
//==========================================================
assign pcgen_pipedown = !rtu_xx_ex1_stall;

// &Force("bus", "sysio_iu_rst_addr", 31, 0); @319
// &Force("bus", "ifu_iu_chgflw_pc", 31, 0); @320
// bju_pcgen_pc_31[10:0] == pcgen_pc[11:1]
always @ (posedge bju_clk)
begin
  if (ifu_iu_reset_vld)
    bju_pcgen_pc_31[10:0] <= sysio_iu_rst_addr[11:1];
  else if (ifu_iu_chgflw_vld)
    bju_pcgen_pc_31[10:0] <= ifu_iu_chgflw_pc[11:1];
  else if (idu_iu_tail_fail)
    bju_pcgen_pc_31[10:0] <= rtu_iu_bju_ex2_cur_pc[11:1];
  else if (rtu_iu_ex1_cmplt_vld && pcgen_pipedown && !rtu_iu_ex1_cmplt_split_inst)
    bju_pcgen_pc_31[10:0] <= bju_next_pc[11:1];
end

// bju_pcgen_pc_31[30:11] == pcgen_pc[31:12]
always @ (posedge bju_hi_clk)
begin
  if (ifu_iu_reset_vld)
    bju_pcgen_pc_31[30:11] <= sysio_iu_rst_addr[31:12];
  else if (ifu_iu_chgflw_vld)
    bju_pcgen_pc_31[30:11] <= ifu_iu_chgflw_pc[31:12];
  else if (idu_iu_tail_fail)
    bju_pcgen_pc_31[30:11] <= rtu_iu_bju_ex2_cur_pc[31:12];
  else if (rtu_iu_ex1_cmplt_vld && pcgen_pipedown && !rtu_iu_ex1_cmplt_split_inst)
    bju_pcgen_pc_31[30:11] <= bju_next_pc[31:12];
end

assign bju_pcgen_pc[31:0] = {bju_pcgen_pc_31[30:0], 1'b0};

assign bju_hi_updt = bju_pcgen_pc[31:12] != bju_next_pc[31:12];

assign iu_ex1_cur_pc[31:0] = bju_pcgen_pc[31:0];
assign bju_bht_cur_pc[31:0] = bju_is_ex1 ? bju_pcgen_pc[31:0]
                                         : rtu_iu_bju_ex2_cur_pc[31:0];
//==========================================================
//                  BJU gateclk
//==========================================================
// bju_clk include:
//   1. bju_pcgen;
//   2. bju PMU counter;
//   3. tar_pc_vld_mask.

assign bju_clk_en = ifu_iu_chgflw_vld
                 || idu_iu_ex1_gateclk_vld
                 || bju_is_ex2
                 || idu_iu_tail_fail_gate
                 || rtu_iu_ex1_cmplt_dp_vld
                 || ifu_iu_warm_up
                 || ifu_iu_reset_vld;

// &Instance("gated_clk_cell", "x_bju_clk"); @402
gated_clk_cell  x_bju_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bju_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (bju_clk_en        ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @403
//          .external_en (1'b0), @404
//          .global_en   (cp0_yy_clk_en), @405
//          .module_en   (cp0_iu_icg_en), @406
//          .local_en    (bju_clk_en), @407
//          .clk_out     (bju_clk)); @408

assign bju_hi_clk_en = ifu_iu_chgflw_vld
                    || idu_iu_ex1_gateclk_vld && bju_hi_updt
                    || idu_iu_tail_fail_gate
                    || rtu_iu_ex1_cmplt_dp_vld
                    || ifu_iu_warm_up
                    || ifu_iu_reset_vld;

assign bju_ras_clk_en = bju_ras_pc_mispred_set_gate 
                        || ifu_iu_warm_up
                        || bju_ras_mispred_vld;

assign bju_br_jalr_clk_en = bju_ras_pc_mispred_set_gate 
                          || bju_ex1_depd_lsu_fwd_vld_gate
                          || ifu_iu_warm_up;

// &Instance("gated_clk_cell", "x_bju_hi_clk"); @425
gated_clk_cell  x_bju_hi_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bju_hi_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (bju_hi_clk_en     ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @426
//          .external_en (1'b0), @427
//          .global_en   (cp0_yy_clk_en), @428
//          .module_en   (cp0_iu_icg_en), @429
//          .local_en    (bju_hi_clk_en), @430
//          .clk_out     (bju_hi_clk)); @431

assign bju_fwd_clk_en = bju_ex1_depd_lsu_fwd_vld_gate
                     || ifu_iu_warm_up;

// &Instance("gated_clk_cell", "x_bju_fwd_clk"); @436
gated_clk_cell  x_bju_fwd_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bju_fwd_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (bju_fwd_clk_en    ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @437
//          .external_en (1'b0), @438
//          .global_en   (cp0_yy_clk_en), @439
//          .module_en   (cp0_iu_icg_en), @440
//          .local_en    (bju_fwd_clk_en), @441
//          .clk_out     (bju_fwd_clk)); @442

// &Instance("gated_clk_cell", "x_bju_ras_clk"); @444
gated_clk_cell  x_bju_ras_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bju_ras_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (bju_ras_clk_en    ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @445
//          .external_en (1'b0), @446
//          .global_en   (cp0_yy_clk_en), @447
//          .module_en   (cp0_iu_icg_en), @448
//          .local_en    (bju_ras_clk_en), @449
//          .clk_out     (bju_ras_clk)); @450

// &Instance("gated_clk_cell", "x_bju_br_jalr_clk"); @452
gated_clk_cell  x_bju_br_jalr_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bju_br_jalr_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (bju_br_jalr_clk_en),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @453
//          .external_en (1'b0), @454
//          .global_en   (cp0_yy_clk_en), @455
//          .module_en   (cp0_iu_icg_en), @456
//          .local_en    (bju_br_jalr_clk_en), @457
//          .clk_out     (bju_br_jalr_clk)); @458


//==========================================================
//                       STALL
//==========================================================
assign bju_dp_ex1_stall = idu_iu_ex1_bju_gateclk_sel && bju_ex1_depd_lsu && !bju_ex1_depd_lsu_fwd_vld || 
                          idu_iu_ex1_bju_gateclk_sel && bju_is_ex2;


assign iu_idu_bju_global_stall = 1'b0;
assign iu_idu_bju_stall        = bju_is_ex2;
//==========================================================
//                      OUTPUT SIGNAL
//==========================================================

//----------------------------------------------------------
//                        IFU SIGNAL
//----------------------------------------------------------
assign iu_ifu_tar_pc_vld        = bju_ex1_tar_pc_vld      || bju_ex2_bht_mispred || bju_ras_mispred_vld;
assign iu_ifu_tar_pc_vld_gate   = bju_ex1_tar_pc_vld_gate || bju_ex2_bht_mispred || bju_ras_mispred_vld;
assign iu_ifu_tar_pc[31:0]      = (bju_ex2_bht_mispred || bju_ras_mispred_vld) ? bju_ex2_not_pred_pc[31:0] :
                                                                                 bju_next_pc[31:0];

assign iu_yy_xx_cancel          = bju_ex1_tar_pc_vld || bju_ex2_bht_mispred || bju_ras_mispred_vld;
//---------------- BHT -----------------
assign iu_ifu_br_vld            = bju_br_vld;
assign iu_ifu_br_vld_gate       = bju_br_vld_gate;
assign iu_ifu_bht_cur_pc[31:0]  = bju_bht_cur_pc[31:0];
assign iu_ifu_bht_taken         = bju_bht_taken;
assign iu_ifu_bht_pred[1:0]     = bju_bht_pred[1:0];
assign iu_ifu_bht_mispred       = bju_bht_mispred;
assign iu_ifu_bht_mispred_gate  = bju_bht_mispred_gate;

//---------------- RAS -----------------
assign iu_ifu_ret_vld         = bju_ret_vld;
assign iu_ifu_ret_vld_gate    = bju_ret_vld_raw;
assign iu_ifu_link_vld        = bju_link_vld;
assign iu_ifu_ind_link_vld    = bju_ind_link_vld;
assign iu_ifu_link_vld_gate   = bju_link_vld_raw;
assign iu_ifu_pc_mispred      = bju_pc_mispred;
assign iu_ifu_pc_mispred_gate = bju_pc_mispred_raw;


assign bju_iu_debug_info[3:0] = {1'b0, bju_cur_state, bju_ras_mispred_vld, bju_bht_mispred};

//==========================================================
//                        CP0
//==========================================================
//assign iu_cp0_ex1_cur_pc[31:0] = bju_pcgen_pc[31:0];

//==========================================================
//                        IU Ctrl Signal
//==========================================================
assign bju_dp_ex1_cmplt_dp   = bju_ex1_inst_cmplt_dp;
assign bju_dp_ex1_rslt_vld   = (bju_ex1_uncond_sel || bju_ex1_auipc_sel)
                                 && idu_iu_ex1_wb_vld && idu_iu_ex1_inst_vld;
assign bju_dp_ex1_rslt[31:0] = bju_ex1_auipc_sel ? bju_auipc_res[31:0]
                                                  : bju_inc_pc[31:0];
//==========================================================
//                        RTU Signal
//==========================================================
assign iu_rtu_ex1_bju_inst_vld       = idu_iu_ex1_gateclk_vld && idu_iu_ex1_bju_sel || bju_is_ex2 ;

assign iu_rtu_ex1_bju_cmplt          = bju_ex1_inst_cmplt;
assign iu_rtu_ex1_bju_cmplt_dp       = bju_ex1_inst_cmplt_dp;
assign iu_rtu_ex1_bju_inst_len       = bju_is_ex2 ? bju_ex2_inst_len : idu_iu_ex1_inst_len;

assign iu_rtu_ex1_next_pc[30:0]      = bju_next_pc[31:1];
assign iu_rtu_ex1_bju_cur_pc[30:0]   = bju_pcgen_pc[31:1];

assign iu_rtu_ex1_bju_split_inst     = idu_iu_ex1_split;
assign iu_rtu_ex1_bju_branch_inst    = |bju_ex1_func[7:5] && !bju_ex1_auipc_sel;

assign iu_rtu_ex2_bju_next_pc_vld    = bju_ex2_chgflw_vld;
assign iu_rtu_ex2_bju_next_pc[30:0]  = bju_ex2_chgflw_pc [31:1];
assign iu_rtu_ex2_bju_flush          = bju_ras_mispred_vld | bju_ex2_chgflw_vld;

//==========================================================
//                       HPCP Signal
//==========================================================
assign iu_hpcp_inst_condbr = bju_ex1_cond_sel && bju_ex1_inst_cmplt;
assign iu_hpcp_inst_condbr_gate = bju_ex1_cond_sel && bju_ex1_inst_cmplt_dp;
assign iu_hpcp_inst_bht_mispred = bju_bht_mispred;

//==========================================================
//random signals compared with e907
// &Force("input","idu_iu_ex1_src1_reg"); @545
// &Force("input","lsu_iu_ex2_dest_reg"); @546

// &Force("bus", "idu_iu_ex1_src1_reg", 5, 0); @548
// &Force("bus", "lsu_iu_ex2_dest_reg", 5, 0); @549
//==========================================================
//

// &ModuleEnd; @666
endmodule


