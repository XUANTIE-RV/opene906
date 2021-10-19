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
module pa_idu_id_fp(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  ctrl_id_fp_ex1_inst_vld,
  ctrl_id_fp_ex1_lsu_sel,
  ctrl_id_fp_id_expt_vld,
  ctrl_id_fp_id_inst_vld,
  ctrl_id_fp_id_stall,
  ctrl_id_fp_pipe_down,
  ctrl_id_fp_st_rs2_dep,
  ctrl_id_fp_uncmit,
  decd_fp_id_dp_func,
  decd_fp_id_fp_dst_idx,
  decd_fp_id_fp_dst_vld,
  decd_fp_id_fp_inst_vld,
  decd_fp_id_fp_lsu_sel,
  decd_fp_id_fp_rs1_idx,
  decd_fp_id_fp_rs1_vld,
  decd_fp_id_fp_rs2_idx,
  decd_fp_id_fp_rs2_vld,
  decd_fp_id_fp_rs3_idx,
  decd_fp_id_fp_rs3_vld,
  decd_fp_id_fp_unit_sel,
  decd_fp_id_rm,
  dp_id_fp_ex1_rs2_idx,
  forever_cpuclk,
  fpr_id_fp_rd_busy,
  fpr_id_fp_rd_busy_lsu,
  fpr_id_fp_rs1,
  fpr_id_fp_rs1_busy,
  fpr_id_fp_rs1_busy_lsu,
  fpr_id_fp_rs2,
  fpr_id_fp_rs2_busy,
  fpr_id_fp_rs2_busy_lsu,
  fpr_id_fp_rs3,
  fpr_id_fp_rs3_busy,
  fpr_id_fp_rs3_busy_lsu,
  fpu_idu_fwd_data,
  fpu_idu_fwd_freg,
  fpu_idu_fwd_vld,
  id_fp_ctrl_id_stall,
  id_fp_ctrl_rs2_dep_ex1_dst,
  id_fp_ctrl_rs2_stall_upd,
  id_fp_dp_srcf1,
  id_fp_fpr_dst_freg,
  id_fp_fpr_id_dst_vld,
  id_fp_fpr_ld_inst,
  id_fp_fpr_wr_issue,
  idu_fpu_ex1_cmplt_dp_sel,
  idu_fpu_ex1_dst_freg,
  idu_fpu_ex1_dst_freg_vld,
  idu_fpu_ex1_dst_preg,
  idu_fpu_ex1_eu_sel,
  idu_fpu_ex1_func,
  idu_fpu_ex1_gateclk_vld,
  idu_fpu_ex1_inst_vld,
  idu_fpu_ex1_rm,
  idu_fpu_ex1_srcf0,
  idu_fpu_ex1_srcf1,
  idu_fpu_ex1_srcf2,
  ifu_idu_chgflw_flush,
  ifu_idu_warm_up,
  iu_idu_bju_global_stall,
  lsu_idu_ex2_ffwd_data,
  lsu_idu_ex2_ffwd_vld,
  lsu_idu_ex2_fwd_freg,
  lsu_idu_ex3_ffwd_data,
  lsu_idu_ex3_ffwd_vld,
  lsu_idu_ex3_fwd_freg,
  lsu_idu_global_stall,
  pad_yy_icg_scan_en,
  rtu_idu_fgpr_wb_data,
  rtu_idu_fgpr_wb_reg,
  rtu_idu_fgpr_wb_vld,
  rtu_idu_flush_fe
);

// &Ports; @24
input           cp0_idu_icg_en;            
input           cp0_yy_clk_en;             
input           ctrl_id_fp_ex1_inst_vld;   
input           ctrl_id_fp_ex1_lsu_sel;    
input           ctrl_id_fp_id_expt_vld;    
input           ctrl_id_fp_id_inst_vld;    
input           ctrl_id_fp_id_stall;       
input           ctrl_id_fp_pipe_down;      
input           ctrl_id_fp_st_rs2_dep;     
input           ctrl_id_fp_uncmit;         
input   [9 :0]  decd_fp_id_dp_func;        
input   [4 :0]  decd_fp_id_fp_dst_idx;     
input           decd_fp_id_fp_dst_vld;     
input           decd_fp_id_fp_inst_vld;    
input           decd_fp_id_fp_lsu_sel;     
input   [4 :0]  decd_fp_id_fp_rs1_idx;     
input           decd_fp_id_fp_rs1_vld;     
input   [4 :0]  decd_fp_id_fp_rs2_idx;     
input           decd_fp_id_fp_rs2_vld;     
input   [4 :0]  decd_fp_id_fp_rs3_idx;     
input           decd_fp_id_fp_rs3_vld;     
input   [2 :0]  decd_fp_id_fp_unit_sel;    
input   [2 :0]  decd_fp_id_rm;             
input   [4 :0]  dp_id_fp_ex1_rs2_idx;      
input           forever_cpuclk;            
input           fpr_id_fp_rd_busy;         
input           fpr_id_fp_rd_busy_lsu;     
input   [31:0]  fpr_id_fp_rs1;             
input           fpr_id_fp_rs1_busy;        
input           fpr_id_fp_rs1_busy_lsu;    
input   [31:0]  fpr_id_fp_rs2;             
input           fpr_id_fp_rs2_busy;        
input           fpr_id_fp_rs2_busy_lsu;    
input   [31:0]  fpr_id_fp_rs3;             
input           fpr_id_fp_rs3_busy;        
input           fpr_id_fp_rs3_busy_lsu;    
input   [31:0]  fpu_idu_fwd_data;          
input   [4 :0]  fpu_idu_fwd_freg;          
input           fpu_idu_fwd_vld;           
input           ifu_idu_chgflw_flush;      
input           ifu_idu_warm_up;           
input           iu_idu_bju_global_stall;   
input   [31:0]  lsu_idu_ex2_ffwd_data;     
input           lsu_idu_ex2_ffwd_vld;      
input   [4 :0]  lsu_idu_ex2_fwd_freg;      
input   [31:0]  lsu_idu_ex3_ffwd_data;     
input           lsu_idu_ex3_ffwd_vld;      
input   [4 :0]  lsu_idu_ex3_fwd_freg;      
input           lsu_idu_global_stall;      
input           pad_yy_icg_scan_en;        
input   [31:0]  rtu_idu_fgpr_wb_data;      
input   [4 :0]  rtu_idu_fgpr_wb_reg;       
input           rtu_idu_fgpr_wb_vld;       
input           rtu_idu_flush_fe;          
output          id_fp_ctrl_id_stall;       
output          id_fp_ctrl_rs2_dep_ex1_dst; 
output          id_fp_ctrl_rs2_stall_upd;  
output  [31:0]  id_fp_dp_srcf1;            
output  [4 :0]  id_fp_fpr_dst_freg;        
output          id_fp_fpr_id_dst_vld;      
output          id_fp_fpr_ld_inst;         
output          id_fp_fpr_wr_issue;        
output          idu_fpu_ex1_cmplt_dp_sel;  
output  [4 :0]  idu_fpu_ex1_dst_freg;      
output          idu_fpu_ex1_dst_freg_vld;  
output  [4 :0]  idu_fpu_ex1_dst_preg;      
output  [2 :0]  idu_fpu_ex1_eu_sel;        
output  [9 :0]  idu_fpu_ex1_func;          
output          idu_fpu_ex1_gateclk_vld;   
output          idu_fpu_ex1_inst_vld;      
output  [2 :0]  idu_fpu_ex1_rm;            
output  [31:0]  idu_fpu_ex1_srcf0;         
output  [31:0]  idu_fpu_ex1_srcf1;         
output  [31:0]  idu_fpu_ex1_srcf2;         

// &Regs; @25
reg     [4 :0]  id_fp_ex1_dst_idx;         
reg             id_fp_ex1_dst_vld;         
reg     [9 :0]  id_fp_ex1_func;            
reg     [2 :0]  id_fp_ex1_rm;              
reg     [31:0]  id_fp_ex1_src0;            
reg     [31:0]  id_fp_ex1_src1;            
reg     [31:0]  id_fp_ex1_src2;            
reg     [2 :0]  id_fp_ex1_unit_sel;        

// &Wires; @26
wire            cp0_idu_icg_en;            
wire            cp0_yy_clk_en;             
wire            ctrl_id_fp_ex1_inst_vld;   
wire            ctrl_id_fp_ex1_lsu_sel;    
wire            ctrl_id_fp_id_expt_vld;    
wire            ctrl_id_fp_id_inst_vld;    
wire            ctrl_id_fp_id_stall;       
wire            ctrl_id_fp_pipe_down;      
wire            ctrl_id_fp_st_rs2_dep;     
wire            ctrl_id_fp_uncmit;         
wire    [9 :0]  decd_fp_id_dp_func;        
wire    [4 :0]  decd_fp_id_fp_dst_idx;     
wire            decd_fp_id_fp_dst_vld;     
wire            decd_fp_id_fp_inst_vld;    
wire            decd_fp_id_fp_lsu_sel;     
wire    [4 :0]  decd_fp_id_fp_rs1_idx;     
wire            decd_fp_id_fp_rs1_vld;     
wire    [4 :0]  decd_fp_id_fp_rs2_idx;     
wire            decd_fp_id_fp_rs2_vld;     
wire    [4 :0]  decd_fp_id_fp_rs3_idx;     
wire            decd_fp_id_fp_rs3_vld;     
wire    [2 :0]  decd_fp_id_fp_unit_sel;    
wire    [2 :0]  decd_fp_id_rm;             
wire    [4 :0]  dp_id_fp_ex1_rs2_idx;      
wire            forever_cpuclk;            
wire            fpr_id_fp_rd_busy;         
wire            fpr_id_fp_rd_busy_lsu;     
wire    [31:0]  fpr_id_fp_rs1;             
wire            fpr_id_fp_rs1_busy;        
wire            fpr_id_fp_rs1_busy_lsu;    
wire    [31:0]  fpr_id_fp_rs2;             
wire            fpr_id_fp_rs2_busy;        
wire            fpr_id_fp_rs2_busy_lsu;    
wire    [31:0]  fpr_id_fp_rs3;             
wire            fpr_id_fp_rs3_busy;        
wire            fpr_id_fp_rs3_busy_lsu;    
wire    [31:0]  fpu_idu_fwd_data;          
wire    [4 :0]  fpu_idu_fwd_freg;          
wire            fpu_idu_fwd_vld;           
wire            id_fp_ctrl_id_stall;       
wire            id_fp_ctrl_rs2_dep_ex1_dst; 
wire            id_fp_ctrl_rs2_stall_upd;  
wire            id_fp_dep_ld_stall;        
wire            id_fp_dep_norm_stall;      
wire    [31:0]  id_fp_dp_srcf1;            
wire            id_fp_ex1_inst_vld;        
wire    [4 :0]  id_fp_fpr_dst_freg;        
wire            id_fp_fpr_id_dst_vld;      
wire            id_fp_fpr_ld_inst;         
wire            id_fp_fpr_wr_issue;        
wire    [31:0]  id_fp_id_fin_rs1;          
wire    [31:0]  id_fp_id_fin_rs2;          
wire    [31:0]  id_fp_id_fin_rs3;          
wire            id_fp_id_inst_vld;         
wire            id_fp_id_issue_cancel;     
wire            id_fp_id_ld_inst;          
wire            id_fp_id_st_inst;          
wire            id_fp_id_stall;            
wire            id_fp_issue_stall;         
wire            id_fp_pipe_down;           
wire    [31:0]  id_fp_rs1_aft_fwd_no_lsu;  
wire            id_fp_rs1_fwd;             
wire            id_fp_rs1_fwd_lsu;         
wire            id_fp_rs1_fwd_lsu_ex3;     
wire    [31:0]  id_fp_rs2_aft_fwd_no_lsu;  
wire            id_fp_rs2_dep_ex1;         
wire            id_fp_rs2_fwd;             
wire            id_fp_rs2_fwd_lsu;         
wire            id_fp_rs2_fwd_lsu_ex3;     
wire            id_fp_rs2_stall_upd;       
wire            id_fp_rs2_stall_upd_fpu;   
wire            id_fp_rs2_stall_upd_lsu;   
wire            id_fp_rs2_stall_upd_wb;    
wire    [31:0]  id_fp_rs3_aft_fwd_no_lsu;  
wire            id_fp_rs3_fwd;             
wire            id_fp_rs3_fwd_lsu;         
wire            id_fp_rs3_fwd_lsu_ex3;     
wire            id_fp_st_rs2_dep_vld;      
wire    [2 :0]  id_fp_unit_sel;            
wire            idfp_cpuclk;               
wire            idfp_icg_en;               
wire            idu_fpu_ex1_cmplt_dp_sel;  
wire    [4 :0]  idu_fpu_ex1_dst_freg;      
wire            idu_fpu_ex1_dst_freg_vld;  
wire    [4 :0]  idu_fpu_ex1_dst_preg;      
wire    [2 :0]  idu_fpu_ex1_eu_sel;        
wire    [9 :0]  idu_fpu_ex1_func;          
wire            idu_fpu_ex1_gateclk_vld;   
wire            idu_fpu_ex1_inst_vld;      
wire    [2 :0]  idu_fpu_ex1_rm;            
wire    [31:0]  idu_fpu_ex1_srcf0;         
wire    [31:0]  idu_fpu_ex1_srcf1;         
wire    [31:0]  idu_fpu_ex1_srcf2;         
wire            ifu_idu_chgflw_flush;      
wire            ifu_idu_warm_up;           
wire            iu_idu_bju_global_stall;   
wire    [31:0]  lsu_idu_ex2_ffwd_data;     
wire            lsu_idu_ex2_ffwd_vld;      
wire    [4 :0]  lsu_idu_ex2_fwd_freg;      
wire    [31:0]  lsu_idu_ex3_ffwd_data;     
wire            lsu_idu_ex3_ffwd_vld;      
wire    [4 :0]  lsu_idu_ex3_fwd_freg;      
wire            lsu_idu_global_stall;      
wire            pad_yy_icg_scan_en;        
wire    [31:0]  rtu_idu_fgpr_wb_data;      
wire    [4 :0]  rtu_idu_fgpr_wb_reg;       
wire            rtu_idu_fgpr_wb_vld;       
wire            rtu_idu_flush_fe;          


parameter FUNC_WIDTH = 10;
parameter REG_WIDTH  = `FLEN;

//==========================================================
// Control Flow Module
// 1. ICG Instance
// 2. ID -> EX1 instruction unit sel
// 3. ID -> EX1 instruction destination 
// 4. ID -> EX1 exception information
// 5. ID depend and stall
//==========================================================

//-----------------------------------------------
// 1. ICG Instance
//-----------------------------------------------
//-----------------------------------------------
// 1. ICG instance
//-----------------------------------------------
assign idfp_icg_en = id_fp_id_inst_vld
                  | ifu_idu_warm_up
                  | ctrl_id_fp_st_rs2_dep;
// &Instance("gated_clk_cell", "x_idu_dp_icg_cell"); @49
gated_clk_cell  x_idu_dp_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (idfp_cpuclk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (idfp_icg_en       ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @50
//          .external_en (1'b0), @51
//          .global_en   (cp0_yy_clk_en), @52
//          .module_en ( cp0_idu_icg_en ) , @53
//          .local_en    (idfp_icg_en), @54
//          .clk_out     (idfp_cpuclk)); @55

//-----------------------------------------------
// 2. EX1 instruction Infor
//-----------------------------------------------
assign id_fp_id_inst_vld  = ctrl_id_fp_id_inst_vld & decd_fp_id_fp_inst_vld;
assign id_fp_pipe_down    = ctrl_id_fp_pipe_down & decd_fp_id_fp_inst_vld;
assign id_fp_ex1_inst_vld = ctrl_id_fp_ex1_inst_vld;
assign id_fp_unit_sel[2:0] = ctrl_id_fp_id_expt_vld ? 3'b0
                           : decd_fp_id_fp_unit_sel[2:0];

always @ (posedge idfp_cpuclk)
begin
  if(id_fp_pipe_down | ifu_idu_warm_up)
  begin
    id_fp_ex1_unit_sel[2:0]        <= id_fp_unit_sel[2:0];
    id_fp_ex1_func[FUNC_WIDTH-1:0] <= decd_fp_id_dp_func[FUNC_WIDTH-1:0];
    id_fp_ex1_rm[2:0]              <= decd_fp_id_rm[2:0];
    id_fp_ex1_dst_vld              <= decd_fp_id_fp_dst_vld;
    id_fp_ex1_dst_idx[4:0]         <= decd_fp_id_fp_dst_idx[4:0];
    id_fp_ex1_src0[REG_WIDTH-1:0]  <= id_fp_id_fin_rs1[REG_WIDTH-1:0];
    id_fp_ex1_src2[REG_WIDTH-1:0]  <= id_fp_id_fin_rs3[REG_WIDTH-1:0];
  end
  else
  begin
    id_fp_ex1_unit_sel[2:0]        <= id_fp_ex1_unit_sel[2:0];
    id_fp_ex1_func[FUNC_WIDTH-1:0] <= id_fp_ex1_func[FUNC_WIDTH-1:0];
    id_fp_ex1_rm[2:0]              <= id_fp_ex1_rm[2:0];
    id_fp_ex1_dst_vld              <= id_fp_ex1_dst_vld;
    id_fp_ex1_dst_idx[4:0]         <= id_fp_ex1_dst_idx[4:0];
    id_fp_ex1_src0[REG_WIDTH-1:0]  <= id_fp_ex1_src0[REG_WIDTH-1:0];
    id_fp_ex1_src2[REG_WIDTH-1:0]  <= id_fp_ex1_src2[REG_WIDTH-1:0];
  end
end

always @ (posedge idfp_cpuclk)
begin
  if(id_fp_pipe_down | ifu_idu_warm_up)
  begin
    id_fp_ex1_src1[REG_WIDTH-1:0]  <= id_fp_id_fin_rs2[REG_WIDTH-1:0];
  end
  else if(id_fp_rs2_stall_upd & ctrl_id_fp_st_rs2_dep)
  begin
    id_fp_ex1_src1[REG_WIDTH-1:0]  <= id_fp_rs2_stall_upd_fpu ? fpu_idu_fwd_data[REG_WIDTH-1:0]
                                    : id_fp_rs2_stall_upd_wb ? rtu_idu_fgpr_wb_data[REG_WIDTH-1:0]
                                                             : lsu_idu_ex2_ffwd_data[REG_WIDTH-1:0];
  end
  else
  begin
    id_fp_ex1_src1[REG_WIDTH-1:0]  <= id_fp_ex1_src1[REG_WIDTH-1:0];
  end
end

//assign id_fp_ex1_falu_sel = id_fp_ex1_inst_vld & id_fp_ex1_unit_sel[0];
//assign id_fp_ex1_fmau_sel = id_fp_ex1_inst_vld & id_fp_ex1_unit_sel[1];
//assign id_fp_ex1_fdsu_sel = id_fp_ex1_inst_vld & id_fp_ex1_unit_sel[2];

//-----------------------------------------------
// 3. ID depend and stall
//-----------------------------------------------
assign id_fp_id_st_inst  = decd_fp_id_fp_lsu_sel & ~decd_fp_id_fp_dst_vld;
assign id_fp_id_ld_inst  = decd_fp_id_fp_lsu_sel &  decd_fp_id_fp_dst_vld;

//-----------------------------------------------
// a. forward data and fpr data selection
// b. wbbr data and operand data selection
// c. immediate data fpr data selection
//-----------------------------------------------

// a. forward data and fpr data selection
// priority: fwd > wb
// Note that wb fwd is already done in fpr
assign id_fp_rs1_fwd = decd_fp_id_fp_rs1_idx[4:0] == fpu_idu_fwd_freg[4:0]
                    & decd_fp_id_fp_rs1_vld & fpu_idu_fwd_vld;
assign id_fp_rs2_fwd = decd_fp_id_fp_rs2_idx[4:0] == fpu_idu_fwd_freg[4:0]
                    & decd_fp_id_fp_rs2_vld & fpu_idu_fwd_vld;
assign id_fp_rs3_fwd = decd_fp_id_fp_rs3_idx[4:0] == fpu_idu_fwd_freg[4:0]
                    & decd_fp_id_fp_rs3_vld & fpu_idu_fwd_vld;

// fwd flsu
assign id_fp_rs1_fwd_lsu = decd_fp_id_fp_rs1_idx[4:0] == lsu_idu_ex2_fwd_freg[4:0]
                        & decd_fp_id_fp_rs1_vld & lsu_idu_ex2_ffwd_vld;
assign id_fp_rs2_fwd_lsu = decd_fp_id_fp_rs2_idx[4:0] == lsu_idu_ex2_fwd_freg[4:0]
                        & decd_fp_id_fp_rs2_vld & lsu_idu_ex2_ffwd_vld;
assign id_fp_rs3_fwd_lsu = decd_fp_id_fp_rs3_idx[4:0] == lsu_idu_ex2_fwd_freg[4:0]
                        & decd_fp_id_fp_rs3_vld & lsu_idu_ex2_ffwd_vld;

// fwd flsu
assign id_fp_rs1_fwd_lsu_ex3 = decd_fp_id_fp_rs1_idx[4:0] == lsu_idu_ex3_fwd_freg[4:0]
                        & decd_fp_id_fp_rs1_vld & lsu_idu_ex3_ffwd_vld;
assign id_fp_rs2_fwd_lsu_ex3 = decd_fp_id_fp_rs2_idx[4:0] == lsu_idu_ex3_fwd_freg[4:0]
                        & decd_fp_id_fp_rs2_vld & lsu_idu_ex3_ffwd_vld;
assign id_fp_rs3_fwd_lsu_ex3 = decd_fp_id_fp_rs3_idx[4:0] == lsu_idu_ex3_fwd_freg[4:0]
                        & decd_fp_id_fp_rs3_vld & lsu_idu_ex3_ffwd_vld;

assign id_fp_rs1_aft_fwd_no_lsu[REG_WIDTH-1:0] = id_fp_rs1_fwd_lsu_ex3 ? lsu_idu_ex3_ffwd_data[REG_WIDTH-1:0]
                                               : id_fp_rs1_fwd ? fpu_idu_fwd_data[REG_WIDTH-1:0]
                                               : fpr_id_fp_rs1[REG_WIDTH-1:0];
assign id_fp_rs2_aft_fwd_no_lsu[REG_WIDTH-1:0] = id_fp_rs2_fwd_lsu_ex3 ? lsu_idu_ex3_ffwd_data[REG_WIDTH-1:0]
                                               : id_fp_rs2_fwd ? fpu_idu_fwd_data[REG_WIDTH-1:0]
                                               : fpr_id_fp_rs2[REG_WIDTH-1:0];
assign id_fp_rs3_aft_fwd_no_lsu[REG_WIDTH-1:0] = id_fp_rs3_fwd_lsu_ex3 ? lsu_idu_ex3_ffwd_data[REG_WIDTH-1:0]
                                               : id_fp_rs3_fwd ? fpu_idu_fwd_data[REG_WIDTH-1:0]
                                               : fpr_id_fp_rs3[REG_WIDTH-1:0];

// c. final fpr data selection
assign id_fp_id_fin_rs1[REG_WIDTH-1:0] = id_fp_rs1_fwd_lsu & ~id_fp_rs1_fwd 
                                       ? lsu_idu_ex2_ffwd_data[REG_WIDTH-1:0]
                                       : id_fp_rs1_aft_fwd_no_lsu[REG_WIDTH-1:0];
assign id_fp_id_fin_rs2[REG_WIDTH-1:0] = id_fp_rs2_fwd_lsu & ~id_fp_rs2_fwd 
                                       ? lsu_idu_ex2_ffwd_data[REG_WIDTH-1:0]
                                       : id_fp_rs2_aft_fwd_no_lsu[REG_WIDTH-1:0];
assign id_fp_id_fin_rs3[REG_WIDTH-1:0] = id_fp_rs3_fwd_lsu & ~id_fp_rs3_fwd 
                                       ? lsu_idu_ex2_ffwd_data[REG_WIDTH-1:0]
                                       : id_fp_rs3_aft_fwd_no_lsu[REG_WIDTH-1:0];
                              
// d. store data update when lsu ex stall and ex2 fwd hit
assign id_fp_rs2_stall_upd_lsu = dp_id_fp_ex1_rs2_idx[4:0] == lsu_idu_ex2_fwd_freg[4:0]
                              & lsu_idu_ex2_ffwd_vld;
assign id_fp_rs2_stall_upd_fpu = dp_id_fp_ex1_rs2_idx[4:0] == fpu_idu_fwd_freg[4:0]
                              & fpu_idu_fwd_vld;
assign id_fp_rs2_stall_upd_wb  = dp_id_fp_ex1_rs2_idx[4:0] == rtu_idu_fgpr_wb_reg[4:0]
                              & rtu_idu_fgpr_wb_vld;
assign id_fp_rs2_stall_upd = (id_fp_rs2_stall_upd_lsu | id_fp_rs2_stall_upd_fpu
                          | id_fp_rs2_stall_upd_wb) & ctrl_id_fp_ex1_lsu_sel;
assign id_fp_dep_ld_stall = (fpr_id_fp_rs1_busy_lsu & ~id_fp_rs1_fwd_lsu & ~id_fp_rs1_fwd_lsu_ex3
                          | fpr_id_fp_rs2_busy_lsu  & ~id_fp_rs2_fwd_lsu & ~id_fp_rs2_fwd_lsu_ex3
                          | fpr_id_fp_rs3_busy_lsu  & ~id_fp_rs3_fwd_lsu & ~id_fp_rs3_fwd_lsu_ex3
                          | fpr_id_fp_rd_busy_lsu)
                          & ~id_fp_id_st_inst
                          & id_fp_id_inst_vld;

// id rs depend div stall, id store inst included
// ex1 oper depend
// ex2 oper depend
//assign id_fp_dep_div_stall = (fpr_id_fp_rs1_busy_div & ~id_fp_id_fp_rs1_fwd_div
//                           | fpr_id_fp_rs2_busy_div & ~id_fp_id_fp_rs2_fwd_div
//                           | fpr_id_fp_rd_busy_div) & id_fp_id_inst_vld;

assign id_fp_dep_norm_stall = (fpr_id_fp_rs1_busy & ~id_fp_rs1_fwd
                            | fpr_id_fp_rs2_busy & ~id_fp_rs2_fwd
                            | fpr_id_fp_rs3_busy & ~id_fp_rs3_fwd
                            | fpr_id_fp_rd_busy)
                            & ~id_fp_id_st_inst
                            & id_fp_id_inst_vld;

// id store rs2 depend load
assign id_fp_rs2_dep_ex1 = decd_fp_id_fp_rs2_idx[4:0] == id_fp_ex1_dst_idx[4:0]
                        & decd_fp_id_fp_rs2_vld;
assign id_fp_st_rs2_dep_vld = (fpr_id_fp_rs2_busy_lsu & ~id_fp_rs2_fwd_lsu  & ~id_fp_rs2_fwd_lsu_ex3
                            | fpr_id_fp_rs2_busy & ~id_fp_rs2_fwd
                            | ctrl_id_fp_ex1_lsu_sel & id_fp_rs2_dep_ex1
                            & id_fp_ex1_dst_vld)
                            & id_fp_id_st_inst & id_fp_id_inst_vld;


assign id_fp_id_issue_cancel = (id_fp_dep_ld_stall | id_fp_dep_norm_stall)
                           & ~id_fp_issue_stall
                           | rtu_idu_flush_fe;

// Todo rtu ex1 stall only depend load
assign id_fp_issue_stall = 1'b0;//fpu_idu_ex1_stall;

assign id_fp_id_stall = id_fp_dep_ld_stall | id_fp_dep_norm_stall | id_fp_issue_stall;

//==========================================================
// Rename for Output
//==========================================================

//-----------------------------------------------
// Output to IDU FPR
//-----------------------------------------------
assign id_fp_fpr_wr_issue       = id_fp_id_inst_vld & id_fp_pipe_down & decd_fp_id_fp_dst_vld
                              & ~(rtu_idu_flush_fe | ifu_idu_chgflw_flush & ~id_fp_issue_stall
                               | id_fp_id_issue_cancel | ctrl_id_fp_id_stall);
assign id_fp_fpr_ld_inst        = id_fp_id_ld_inst;
assign id_fp_fpr_id_dst_vld     = id_fp_id_inst_vld & decd_fp_id_fp_dst_vld;
assign id_fp_fpr_dst_freg[4:0]  = id_fp_ex1_dst_idx[4:0];

//-----------------------------------------------
// Output to IDU Ctrl
//-----------------------------------------------
assign id_fp_ctrl_id_stall        = id_fp_id_stall;
assign id_fp_ctrl_rs2_dep_ex1_dst = id_fp_st_rs2_dep_vld;
assign id_fp_ctrl_rs2_stall_upd   = id_fp_rs2_stall_upd & ctrl_id_fp_st_rs2_dep;

//-----------------------------------------------
// Output to IDU DP
//-----------------------------------------------
assign id_fp_dp_srcf1[REG_WIDTH-1:0] = id_fp_ex1_src1[REG_WIDTH-1:0];

//-----------------------------------------------
// Output to FPU
//-----------------------------------------------
assign idu_fpu_ex1_inst_vld             = id_fp_ex1_inst_vld & ~ctrl_id_fp_uncmit;
assign idu_fpu_ex1_cmplt_dp_sel         = id_fp_ex1_inst_vld & ~(lsu_idu_global_stall | iu_idu_bju_global_stall);
assign idu_fpu_ex1_gateclk_vld          = id_fp_ex1_inst_vld;
assign idu_fpu_ex1_eu_sel[2:0]          = id_fp_ex1_unit_sel[2:0];
assign idu_fpu_ex1_func[FUNC_WIDTH-1:0] = id_fp_ex1_func[FUNC_WIDTH-1:0];
assign idu_fpu_ex1_rm[2:0]              = id_fp_ex1_rm[2:0];
assign idu_fpu_ex1_srcf0[REG_WIDTH-1:0] = id_fp_ex1_src0[REG_WIDTH-1:0];
assign idu_fpu_ex1_srcf1[REG_WIDTH-1:0] = id_fp_ex1_src1[REG_WIDTH-1:0];
assign idu_fpu_ex1_srcf2[REG_WIDTH-1:0] = id_fp_ex1_src2[REG_WIDTH-1:0];
assign idu_fpu_ex1_dst_freg_vld         = id_fp_ex1_dst_vld;
assign idu_fpu_ex1_dst_freg[4:0]        = id_fp_ex1_dst_idx[4:0];
assign idu_fpu_ex1_dst_preg[4:0]        = id_fp_ex1_dst_idx[4:0];

//-----------------------------------------------
// Output to LSU
//-----------------------------------------------
// Todo

// &ModuleEnd; @354
endmodule


