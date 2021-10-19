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
module pa_idu_gpr(
  cp0_idu_icg_en,
  cp0_idu_sp_wdata,
  cp0_idu_sp_wen,
  cp0_idu_sp_wen_gate,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_gpr_div_inst,
  ctrl_gpr_ex1_dst_preg,
  ctrl_gpr_ex1_int_spec,
  ctrl_gpr_id_rd1_vld,
  ctrl_gpr_id_rd2_vld,
  ctrl_gpr_id_wr_idx1,
  ctrl_gpr_id_wr_idx2,
  ctrl_gpr_ld_inst,
  ctrl_gpr_wr_issue1,
  decd_gpr_dep_rs1,
  decd_gpr_dep_rs2,
  decd_gpr_rd1_vld,
  decd_gpr_rd2_vld,
  decd_gpr_rs1,
  decd_gpr_rs1_vld,
  decd_gpr_rs2,
  decd_gpr_rs2_vld,
  decd_gpr_rs3,
  decd_gpr_rs3_vld,
  decd_gpr_rs4,
  decd_gpr_rs4_vld,
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
  forever_cpuclk,
  gpr_ctrl_rd1_busy_div,
  gpr_ctrl_rd1_busy_lsu,
  gpr_ctrl_rd2_busy_div,
  gpr_ctrl_rd2_busy_lsu,
  gpr_ctrl_rs1_busy_div,
  gpr_ctrl_rs1_busy_lsu,
  gpr_ctrl_rs1_busy_lsu2,
  gpr_ctrl_rs2_busy_div,
  gpr_ctrl_rs2_busy_lsu,
  gpr_ctrl_rs2_busy_lsu2,
  gpr_ctrl_rs3_busy_div,
  gpr_ctrl_rs3_busy_lsu,
  gpr_ctrl_rs3_busy_lsu2,
  gpr_ctrl_rs4_busy_div,
  gpr_ctrl_rs4_busy_lsu,
  gpr_dp_id_x2_wr,
  gpr_dp_rs1,
  gpr_dp_rs2,
  gpr_dp_rs3,
  gpr_dp_rs4,
  gpr_hs_sp_busy,
  gpr_hs_sp_busy2,
  gpr_hs_sp_wb,
  hs_gpr_wb_mask,
  hs_gpr_wr_mask,
  idu_cp0_ipop_data,
  idu_cp0_mcause_wen,
  idu_cp0_mepc_wen,
  idu_cp0_sp_reg,
  idu_ifu_x1,
  ifu_idu_warm_up,
  iu_idu_ex2_div_vld,
  iu_idu_ex2_fwd_preg0,
  iu_idu_ex2_fwd_vld0,
  lsu_idu_ex2_fwd_preg,
  lsu_idu_ex2_fwd_vld,
  pad_yy_icg_scan_en,
  rtu_idu_ex1_int_dis_stall_req,
  rtu_idu_flush_fe,
  rtu_idu_wb0_data,
  rtu_idu_wb0_fpu_vld,
  rtu_idu_wb0_preg,
  rtu_idu_wb0_vld,
  rtu_idu_wb1_data,
  rtu_idu_wb1_lsu_vld,
  rtu_idu_wb1_preg,
  rtu_idu_wb1_vld,
  rtu_idu_wb2_data,
  rtu_idu_wb2_preg,
  rtu_idu_wb2_vld,
  rtu_yy_xx_expt_int
);

// &Ports; @24
input           cp0_idu_icg_en;               
input   [31:0]  cp0_idu_sp_wdata;             
input           cp0_idu_sp_wen;               
input           cp0_idu_sp_wen_gate;          
input           cp0_yy_clk_en;                
input           cpurst_b;                     
input           ctrl_gpr_div_inst;            
input   [4 :0]  ctrl_gpr_ex1_dst_preg;        
input           ctrl_gpr_ex1_int_spec;        
input           ctrl_gpr_id_rd1_vld;          
input           ctrl_gpr_id_rd2_vld;          
input   [5 :0]  ctrl_gpr_id_wr_idx1;          
input   [5 :0]  ctrl_gpr_id_wr_idx2;          
input           ctrl_gpr_ld_inst;             
input           ctrl_gpr_wr_issue1;           
input   [5 :0]  decd_gpr_dep_rs1;             
input   [5 :0]  decd_gpr_dep_rs2;             
input           decd_gpr_rd1_vld;             
input           decd_gpr_rd2_vld;             
input   [5 :0]  decd_gpr_rs1;                 
input           decd_gpr_rs1_vld;             
input   [5 :0]  decd_gpr_rs2;                 
input           decd_gpr_rs2_vld;             
input   [5 :0]  decd_gpr_rs3;                 
input           decd_gpr_rs3_vld;             
input   [5 :0]  decd_gpr_rs4;                 
input           decd_gpr_rs4_vld;             
input           dp_gpr_rs1_fwd_div;           
input           dp_gpr_rs1_fwd_lsu;           
input           dp_gpr_rs2_fwd_div;           
input           dp_gpr_rs2_fwd_lsu;           
input           dp_gpr_rs3_fwd_div;           
input           dp_gpr_rs3_fwd_lsu;           
input           dp_gpr_rs4_fwd_div;           
input           dp_gpr_rs4_fwd_lsu;           
input           dp_gpr_x2_busy;               
input           dp_gpr_x2_busy2;              
input           forever_cpuclk;               
input           hs_gpr_wb_mask;               
input           hs_gpr_wr_mask;               
input           ifu_idu_warm_up;              
input           iu_idu_ex2_div_vld;           
input   [5 :0]  iu_idu_ex2_fwd_preg0;         
input           iu_idu_ex2_fwd_vld0;          
input   [5 :0]  lsu_idu_ex2_fwd_preg;         
input           lsu_idu_ex2_fwd_vld;          
input           pad_yy_icg_scan_en;           
input           rtu_idu_ex1_int_dis_stall_req; 
input           rtu_idu_flush_fe;             
input   [31:0]  rtu_idu_wb0_data;             
input           rtu_idu_wb0_fpu_vld;          
input   [5 :0]  rtu_idu_wb0_preg;             
input           rtu_idu_wb0_vld;              
input   [31:0]  rtu_idu_wb1_data;             
input           rtu_idu_wb1_lsu_vld;          
input   [5 :0]  rtu_idu_wb1_preg;             
input           rtu_idu_wb1_vld;              
input   [31:0]  rtu_idu_wb2_data;             
input   [5 :0]  rtu_idu_wb2_preg;             
input           rtu_idu_wb2_vld;              
input           rtu_yy_xx_expt_int;           
output          gpr_ctrl_rd1_busy_div;        
output          gpr_ctrl_rd1_busy_lsu;        
output          gpr_ctrl_rd2_busy_div;        
output          gpr_ctrl_rd2_busy_lsu;        
output          gpr_ctrl_rs1_busy_div;        
output          gpr_ctrl_rs1_busy_lsu;        
output          gpr_ctrl_rs1_busy_lsu2;       
output          gpr_ctrl_rs2_busy_div;        
output          gpr_ctrl_rs2_busy_lsu;        
output          gpr_ctrl_rs2_busy_lsu2;       
output          gpr_ctrl_rs3_busy_div;        
output          gpr_ctrl_rs3_busy_lsu;        
output          gpr_ctrl_rs3_busy_lsu2;       
output          gpr_ctrl_rs4_busy_div;        
output          gpr_ctrl_rs4_busy_lsu;        
output          gpr_dp_id_x2_wr;              
output  [31:0]  gpr_dp_rs1;                   
output  [31:0]  gpr_dp_rs2;                   
output  [31:0]  gpr_dp_rs3;                   
output  [31:0]  gpr_dp_rs4;                   
output          gpr_hs_sp_busy;               
output          gpr_hs_sp_busy2;              
output          gpr_hs_sp_wb;                 
output  [31:0]  idu_cp0_ipop_data;            
output          idu_cp0_mcause_wen;           
output          idu_cp0_mepc_wen;             
output  [31:0]  idu_cp0_sp_reg;               
output  [31:0]  idu_ifu_x1;                   

// &Regs; @25
reg     [31:0]  div_fwd_sel0;                 
reg     [31:0]  fpu_fwd_sel0;                 
reg     [2 :0]  gpr_rd1_busy_st;              
reg     [2 :0]  gpr_rd2_busy_st;              
reg     [31:0]  gpr_read_data1;               
reg     [31:0]  gpr_read_data2;               
reg     [31:0]  gpr_read_data3;               
reg     [31:0]  gpr_read_data4;               
reg     [2 :0]  gpr_rs1_busy_st;              
reg     [2 :0]  gpr_rs2_busy_st;              
reg     [2 :0]  gpr_rs3_busy_st;              
reg     [2 :0]  gpr_rs4_busy_st;              
reg     [31:0]  reg_fwd_sel1;                 
reg     [31:0]  reg_fwd_sel2;                 
reg     [31:0]  reg_issue0;                   
reg     [31:0]  reg_sel0;                     
reg     [31:0]  reg_sel1;                     
reg     [31:0]  reg_sel2;                     

// &Wires; @26
wire            cp0_idu_icg_en;               
wire    [31:0]  cp0_idu_sp_wdata;             
wire            cp0_idu_sp_wen;               
wire            cp0_idu_sp_wen_gate;          
wire            cp0_yy_clk_en;                
wire            cpurst_b;                     
wire            ctrl_gpr_div_inst;            
wire    [4 :0]  ctrl_gpr_ex1_dst_preg;        
wire            ctrl_gpr_ex1_int_spec;        
wire            ctrl_gpr_id_rd1_vld;          
wire            ctrl_gpr_id_rd2_vld;          
wire    [5 :0]  ctrl_gpr_id_wr_idx1;          
wire    [5 :0]  ctrl_gpr_id_wr_idx2;          
wire            ctrl_gpr_ld_inst;             
wire            ctrl_gpr_wr_issue1;           
wire    [5 :0]  decd_gpr_dep_rs1;             
wire    [5 :0]  decd_gpr_dep_rs2;             
wire            decd_gpr_rd1_vld;             
wire            decd_gpr_rd2_vld;             
wire    [5 :0]  decd_gpr_rs1;                 
wire            decd_gpr_rs1_vld;             
wire    [5 :0]  decd_gpr_rs2;                 
wire            decd_gpr_rs2_vld;             
wire    [5 :0]  decd_gpr_rs3;                 
wire            decd_gpr_rs3_vld;             
wire    [5 :0]  decd_gpr_rs4;                 
wire            decd_gpr_rs4_vld;             
wire    [4 :0]  div_fwd_index;                
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
wire            forever_cpuclk;               
wire    [4 :0]  fpu_fwd0_reg;                 
wire            fpu_fwd0_vld;                 
wire    [4 :0]  fpu_fwd_index;                
wire    [4 :0]  fwd_index1_sel;               
wire    [4 :0]  fwd_index2_sel;               
wire            gpr_ctrl_rd1_busy_div;        
wire            gpr_ctrl_rd1_busy_lsu;        
wire            gpr_ctrl_rd2_busy_div;        
wire            gpr_ctrl_rd2_busy_lsu;        
wire            gpr_ctrl_rs1_busy_div;        
wire            gpr_ctrl_rs1_busy_lsu;        
wire            gpr_ctrl_rs1_busy_lsu2;       
wire            gpr_ctrl_rs2_busy_div;        
wire            gpr_ctrl_rs2_busy_lsu;        
wire            gpr_ctrl_rs2_busy_lsu2;       
wire            gpr_ctrl_rs3_busy_div;        
wire            gpr_ctrl_rs3_busy_lsu;        
wire            gpr_ctrl_rs3_busy_lsu2;       
wire            gpr_ctrl_rs4_busy_div;        
wire            gpr_ctrl_rs4_busy_lsu;        
wire            gpr_dp_id_x2_wr;              
wire    [31:0]  gpr_dp_rs1;                   
wire    [31:0]  gpr_dp_rs2;                   
wire    [31:0]  gpr_dp_rs3;                   
wire    [31:0]  gpr_dp_rs4;                   
wire            gpr_hs_sp_busy;               
wire            gpr_hs_sp_busy2;              
wire            gpr_hs_sp_wb;                 
wire            gpr_rd1_busy_div;             
wire            gpr_rd1_busy_lsu;             
wire    [31:0]  gpr_rd1_fwd_div;              
wire            gpr_rd1_fwd_lsu;              
wire            gpr_rd2_busy_div;             
wire            gpr_rd2_busy_lsu;             
wire    [31:0]  gpr_rd2_fwd_div;              
wire            gpr_rd2_fwd_lsu;              
wire    [31:0]  gpr_read_data1_after_hint;    
wire    [31:0]  gpr_read_data2_after_hint;    
wire            gpr_rs1_busy_div;             
wire            gpr_rs1_busy_lsu;             
wire    [31:0]  gpr_rs1_fwd_div;              
wire            gpr_rs2_busy_div;             
wire            gpr_rs2_busy_lsu;             
wire    [31:0]  gpr_rs2_fwd_div;              
wire            gpr_rs3_busy_div;             
wire            gpr_rs3_busy_lsu;             
wire    [31:0]  gpr_rs3_fwd_div;              
wire            gpr_rs4_busy_div;             
wire            gpr_rs4_busy_lsu;             
wire    [31:0]  gpr_rs4_fwd_div;              
wire            gpr_sync_rst_b;               
wire            gpr_wb_sp;                    
wire    [31:0]  hint_read_data1;              
wire    [31:0]  hint_read_data2;              
wire            hs_gpr_wb_mask;               
wire            hs_gpr_wr_mask;               
wire    [31:0]  idu_cp0_ipop_data;            
wire            idu_cp0_mcause_wen;           
wire            idu_cp0_mepc_wen;             
wire    [31:0]  idu_cp0_sp_reg;               
wire    [31:0]  idu_ifu_x1;                   
wire            ifu_idu_warm_up;              
wire            iu_idu_ex2_div_vld;           
wire    [5 :0]  iu_idu_ex2_fwd_preg0;         
wire            iu_idu_ex2_fwd_vld0;          
wire    [5 :0]  lsu_idu_ex2_fwd_preg;         
wire            lsu_idu_ex2_fwd_vld;          
wire            pad_yy_icg_scan_en;           
wire    [2 :0]  reg_busy_st_1;                
wire    [2 :0]  reg_busy_st_10;               
wire    [2 :0]  reg_busy_st_11;               
wire    [2 :0]  reg_busy_st_12;               
wire    [2 :0]  reg_busy_st_13;               
wire    [2 :0]  reg_busy_st_14;               
wire    [2 :0]  reg_busy_st_15;               
wire    [2 :0]  reg_busy_st_16;               
wire    [2 :0]  reg_busy_st_17;               
wire    [2 :0]  reg_busy_st_18;               
wire    [2 :0]  reg_busy_st_19;               
wire    [2 :0]  reg_busy_st_2;                
wire    [2 :0]  reg_busy_st_20;               
wire    [2 :0]  reg_busy_st_21;               
wire    [2 :0]  reg_busy_st_22;               
wire    [2 :0]  reg_busy_st_23;               
wire    [2 :0]  reg_busy_st_24;               
wire    [2 :0]  reg_busy_st_25;               
wire    [2 :0]  reg_busy_st_26;               
wire    [2 :0]  reg_busy_st_27;               
wire    [2 :0]  reg_busy_st_28;               
wire    [2 :0]  reg_busy_st_29;               
wire    [2 :0]  reg_busy_st_3;                
wire    [2 :0]  reg_busy_st_30;               
wire    [2 :0]  reg_busy_st_31;               
wire    [2 :0]  reg_busy_st_32;               
wire    [2 :0]  reg_busy_st_33;               
wire    [2 :0]  reg_busy_st_4;                
wire    [2 :0]  reg_busy_st_5;                
wire    [2 :0]  reg_busy_st_6;                
wire    [2 :0]  reg_busy_st_7;                
wire    [2 :0]  reg_busy_st_8;                
wire    [2 :0]  reg_busy_st_9;                
wire    [31:0]  reg_dout_1;                   
wire    [31:0]  reg_dout_10;                  
wire    [31:0]  reg_dout_11;                  
wire    [31:0]  reg_dout_12;                  
wire    [31:0]  reg_dout_13;                  
wire    [31:0]  reg_dout_14;                  
wire    [31:0]  reg_dout_15;                  
wire    [31:0]  reg_dout_16;                  
wire    [31:0]  reg_dout_17;                  
wire    [31:0]  reg_dout_18;                  
wire    [31:0]  reg_dout_19;                  
wire    [31:0]  reg_dout_2;                   
wire    [31:0]  reg_dout_20;                  
wire    [31:0]  reg_dout_21;                  
wire    [31:0]  reg_dout_22;                  
wire    [31:0]  reg_dout_23;                  
wire    [31:0]  reg_dout_24;                  
wire    [31:0]  reg_dout_25;                  
wire    [31:0]  reg_dout_26;                  
wire    [31:0]  reg_dout_27;                  
wire    [31:0]  reg_dout_28;                  
wire    [31:0]  reg_dout_29;                  
wire    [31:0]  reg_dout_3;                   
wire    [31:0]  reg_dout_30;                  
wire    [31:0]  reg_dout_31;                  
wire    [31:0]  reg_dout_32;                  
wire    [31:0]  reg_dout_33;                  
wire    [31:0]  reg_dout_4;                   
wire    [31:0]  reg_dout_5;                   
wire    [31:0]  reg_dout_6;                   
wire    [31:0]  reg_dout_7;                   
wire    [31:0]  reg_dout_8;                   
wire    [31:0]  reg_dout_9;                   
wire    [33:0]  reg_fwd_en0;                  
wire    [33:0]  reg_fwd_en1;                  
wire    [33:0]  reg_fwd_en2;                  
wire            reg_fwd_en_high0;             
wire            reg_fwd_en_high1;             
wire            reg_high_clk_en;              
wire            reg_high_cpuclk;              
wire    [1 :0]  reg_hint_is0;                 
wire    [1 :0]  reg_hint_sel0;                
wire    [1 :0]  reg_hint_sel1;                
wire    [4 :0]  reg_issue0_sel;               
wire    [33:0]  reg_write_en0;                
wire    [33:0]  reg_write_en1;                
wire    [33:0]  reg_write_en2;                
wire    [33:0]  reg_write_en_gate0;           
wire    [33:0]  reg_write_en_gate1;           
wire    [33:0]  reg_write_en_gate2;           
wire    [1 :0]  reg_write_en_hint0;           
wire    [1 :0]  reg_write_en_hint1;           
wire            reg_write_en_sp;              
wire            reg_write_en_sp_gate;         
wire    [33:0]  reg_write_is0;                
wire    [33:0]  reg_write_is_gate0;           
wire            reg_write_is_high0;           
wire            rtu_idu_ex1_int_dis_stall_req; 
wire            rtu_idu_flush_fe;             
wire    [31:0]  rtu_idu_wb0_data;             
wire            rtu_idu_wb0_fpu_vld;          
wire    [5 :0]  rtu_idu_wb0_preg;             
wire            rtu_idu_wb0_vld;              
wire    [31:0]  rtu_idu_wb1_data;             
wire    [5 :0]  rtu_idu_wb1_preg;             
wire            rtu_idu_wb1_vld;              
wire    [31:0]  rtu_idu_wb2_data;             
wire    [5 :0]  rtu_idu_wb2_preg;             
wire            rtu_idu_wb2_vld;              
wire            rtu_yy_xx_expt_int;           
wire    [31:0]  write_data0;                  
wire    [31:0]  write_data1;                  
wire    [31:0]  write_data2;                  
wire    [31:0]  write_data_sp;                
wire    [5 :0]  write_index0;                 
wire    [4 :0]  write_index0_sel;             
wire    [5 :0]  write_index1;                 
wire    [5 :0]  write_index2;                 


//=========================================================
// GRP Module
// 1. Instance all GRP modules
// 2. One write port
// 3. Two read ports
//=========================================================
assign reg_write_is_high0 = ctrl_gpr_id_rd1_vld & ctrl_gpr_id_wr_idx1[4] & ~hs_gpr_wr_mask;
//assign reg_write_is_high1 = ctrl_gpr_id_rd2_vld & ctrl_gpr_id_wr_idx2[4];
assign reg_fwd_en_high0 = iu_idu_ex2_fwd_vld0 & iu_idu_ex2_div_vld & iu_idu_ex2_fwd_preg0[4]
                        | fpu_fwd0_vld & fpu_fwd0_reg[4]
                        | rtu_yy_xx_expt_int & ctrl_gpr_ex1_dst_preg[4];
assign reg_fwd_en_high1 = lsu_idu_ex2_fwd_vld & lsu_idu_ex2_fwd_preg[4]
                        | rtu_yy_xx_expt_int & ctrl_gpr_ex1_dst_preg[4];
assign reg_high_clk_en = reg_write_is_high0 //| reg_write_is_high1
                      | reg_fwd_en_high0 | reg_fwd_en_high1
                      | rtu_idu_flush_fe;
// &Instance("gated_clk_cell", "x_reg_high_gated_clk"); @44
gated_clk_cell  x_reg_high_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (reg_high_cpuclk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (reg_high_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @45
//          .external_en (1'b0), @46
//          .global_en   (cp0_yy_clk_en), @47
//          .module_en ( cp0_idu_icg_en ) , @48
//          .local_en    (reg_high_clk_en), @49
//          .clk_out     (reg_high_cpuclk)); @50

//-----------------------------------------------
// 1. Instance all GRP modules
//-----------------------------------------------
// &ConnRule(s/_x$/[1]/); @55
// &ConnRule(s/_y$/_1/); @56
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_1"); @57
pa_idu_reg32  x_pa_idu_reg32_1 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_1                ),
  .reg_dout_y                    (reg_dout_1                   ),
  .reg_fwd_en0_x                 (reg_fwd_en0[1]               ),
  .reg_fwd_en1_x                 (reg_fwd_en1[1]               ),
  .reg_fwd_en2_x                 (reg_fwd_en2[1]               ),
  .reg_write_en0_x               (reg_write_en0[1]             ),
  .reg_write_en1_x               (reg_write_en1[1]             ),
  .reg_write_en2_x               (reg_write_en2[1]             ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[1]        ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[1]        ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[1]        ),
  .reg_write_is0_x               (reg_write_is0[1]             ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[1]        ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[2]/); @59
// &ConnRule(s/_y$/_2/); @60
// &Instance("pa_idu_reg_sp", "x_pa_idu_reg32_2"); @61
pa_idu_reg_sp  x_pa_idu_reg32_2 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_2                ),
  .reg_dout_y                    (reg_dout_2                   ),
  .reg_fwd_en0_x                 (reg_fwd_en0[2]               ),
  .reg_fwd_en1_x                 (reg_fwd_en1[2]               ),
  .reg_fwd_en2_x                 (reg_fwd_en2[2]               ),
  .reg_write_en0_x               (reg_write_en0[2]             ),
  .reg_write_en1_x               (reg_write_en1[2]             ),
  .reg_write_en2_x               (reg_write_en2[2]             ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[2]        ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[2]        ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[2]        ),
  .reg_write_en_sp               (reg_write_en_sp              ),
  .reg_write_en_sp_gate          (reg_write_en_sp_gate         ),
  .reg_write_is0_x               (reg_write_is0[2]             ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[2]        ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  ),
  .write_data_sp                 (write_data_sp                )
);


// &ConnRule(s/_x$/[3]/); @63
// &ConnRule(s/_y$/_3/); @64
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_3"); @65
pa_idu_reg32  x_pa_idu_reg32_3 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_3                ),
  .reg_dout_y                    (reg_dout_3                   ),
  .reg_fwd_en0_x                 (reg_fwd_en0[3]               ),
  .reg_fwd_en1_x                 (reg_fwd_en1[3]               ),
  .reg_fwd_en2_x                 (reg_fwd_en2[3]               ),
  .reg_write_en0_x               (reg_write_en0[3]             ),
  .reg_write_en1_x               (reg_write_en1[3]             ),
  .reg_write_en2_x               (reg_write_en2[3]             ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[3]        ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[3]        ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[3]        ),
  .reg_write_is0_x               (reg_write_is0[3]             ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[3]        ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[4]/); @67
// &ConnRule(s/_y$/_4/); @68
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_4"); @69
pa_idu_reg32  x_pa_idu_reg32_4 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_4                ),
  .reg_dout_y                    (reg_dout_4                   ),
  .reg_fwd_en0_x                 (reg_fwd_en0[4]               ),
  .reg_fwd_en1_x                 (reg_fwd_en1[4]               ),
  .reg_fwd_en2_x                 (reg_fwd_en2[4]               ),
  .reg_write_en0_x               (reg_write_en0[4]             ),
  .reg_write_en1_x               (reg_write_en1[4]             ),
  .reg_write_en2_x               (reg_write_en2[4]             ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[4]        ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[4]        ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[4]        ),
  .reg_write_is0_x               (reg_write_is0[4]             ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[4]        ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[5]/); @71
// &ConnRule(s/_y$/_5/); @72
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_5"); @73
pa_idu_reg32  x_pa_idu_reg32_5 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_5                ),
  .reg_dout_y                    (reg_dout_5                   ),
  .reg_fwd_en0_x                 (reg_fwd_en0[5]               ),
  .reg_fwd_en1_x                 (reg_fwd_en1[5]               ),
  .reg_fwd_en2_x                 (reg_fwd_en2[5]               ),
  .reg_write_en0_x               (reg_write_en0[5]             ),
  .reg_write_en1_x               (reg_write_en1[5]             ),
  .reg_write_en2_x               (reg_write_en2[5]             ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[5]        ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[5]        ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[5]        ),
  .reg_write_is0_x               (reg_write_is0[5]             ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[5]        ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[6]/); @75
// &ConnRule(s/_y$/_6/); @76
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_6"); @77
pa_idu_reg32  x_pa_idu_reg32_6 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_6                ),
  .reg_dout_y                    (reg_dout_6                   ),
  .reg_fwd_en0_x                 (reg_fwd_en0[6]               ),
  .reg_fwd_en1_x                 (reg_fwd_en1[6]               ),
  .reg_fwd_en2_x                 (reg_fwd_en2[6]               ),
  .reg_write_en0_x               (reg_write_en0[6]             ),
  .reg_write_en1_x               (reg_write_en1[6]             ),
  .reg_write_en2_x               (reg_write_en2[6]             ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[6]        ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[6]        ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[6]        ),
  .reg_write_is0_x               (reg_write_is0[6]             ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[6]        ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[7]/); @79
// &ConnRule(s/_y$/_7/); @80
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_7"); @81
pa_idu_reg32  x_pa_idu_reg32_7 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_7                ),
  .reg_dout_y                    (reg_dout_7                   ),
  .reg_fwd_en0_x                 (reg_fwd_en0[7]               ),
  .reg_fwd_en1_x                 (reg_fwd_en1[7]               ),
  .reg_fwd_en2_x                 (reg_fwd_en2[7]               ),
  .reg_write_en0_x               (reg_write_en0[7]             ),
  .reg_write_en1_x               (reg_write_en1[7]             ),
  .reg_write_en2_x               (reg_write_en2[7]             ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[7]        ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[7]        ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[7]        ),
  .reg_write_is0_x               (reg_write_is0[7]             ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[7]        ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[8]/); @83
// &ConnRule(s/_y$/_8/); @84
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_8"); @85
pa_idu_reg32  x_pa_idu_reg32_8 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_8                ),
  .reg_dout_y                    (reg_dout_8                   ),
  .reg_fwd_en0_x                 (reg_fwd_en0[8]               ),
  .reg_fwd_en1_x                 (reg_fwd_en1[8]               ),
  .reg_fwd_en2_x                 (reg_fwd_en2[8]               ),
  .reg_write_en0_x               (reg_write_en0[8]             ),
  .reg_write_en1_x               (reg_write_en1[8]             ),
  .reg_write_en2_x               (reg_write_en2[8]             ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[8]        ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[8]        ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[8]        ),
  .reg_write_is0_x               (reg_write_is0[8]             ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[8]        ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[9]/); @87
// &ConnRule(s/_y$/_9/); @88
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_9"); @89
pa_idu_reg32  x_pa_idu_reg32_9 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_9                ),
  .reg_dout_y                    (reg_dout_9                   ),
  .reg_fwd_en0_x                 (reg_fwd_en0[9]               ),
  .reg_fwd_en1_x                 (reg_fwd_en1[9]               ),
  .reg_fwd_en2_x                 (reg_fwd_en2[9]               ),
  .reg_write_en0_x               (reg_write_en0[9]             ),
  .reg_write_en1_x               (reg_write_en1[9]             ),
  .reg_write_en2_x               (reg_write_en2[9]             ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[9]        ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[9]        ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[9]        ),
  .reg_write_is0_x               (reg_write_is0[9]             ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[9]        ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[10]/); @91
// &ConnRule(s/_y$/_10/); @92
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_10"); @93
pa_idu_reg32  x_pa_idu_reg32_10 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_10               ),
  .reg_dout_y                    (reg_dout_10                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[10]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[10]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[10]              ),
  .reg_write_en0_x               (reg_write_en0[10]            ),
  .reg_write_en1_x               (reg_write_en1[10]            ),
  .reg_write_en2_x               (reg_write_en2[10]            ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[10]       ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[10]       ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[10]       ),
  .reg_write_is0_x               (reg_write_is0[10]            ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[10]       ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[11]/); @95
// &ConnRule(s/_y$/_11/); @96
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_11"); @97
pa_idu_reg32  x_pa_idu_reg32_11 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_11               ),
  .reg_dout_y                    (reg_dout_11                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[11]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[11]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[11]              ),
  .reg_write_en0_x               (reg_write_en0[11]            ),
  .reg_write_en1_x               (reg_write_en1[11]            ),
  .reg_write_en2_x               (reg_write_en2[11]            ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[11]       ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[11]       ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[11]       ),
  .reg_write_is0_x               (reg_write_is0[11]            ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[11]       ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[12]/); @99
// &ConnRule(s/_y$/_12/); @100
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_12"); @101
pa_idu_reg32  x_pa_idu_reg32_12 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_12               ),
  .reg_dout_y                    (reg_dout_12                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[12]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[12]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[12]              ),
  .reg_write_en0_x               (reg_write_en0[12]            ),
  .reg_write_en1_x               (reg_write_en1[12]            ),
  .reg_write_en2_x               (reg_write_en2[12]            ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[12]       ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[12]       ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[12]       ),
  .reg_write_is0_x               (reg_write_is0[12]            ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[12]       ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[13]/); @103
// &ConnRule(s/_y$/_13/); @104
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_13"); @105
pa_idu_reg32  x_pa_idu_reg32_13 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_13               ),
  .reg_dout_y                    (reg_dout_13                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[13]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[13]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[13]              ),
  .reg_write_en0_x               (reg_write_en0[13]            ),
  .reg_write_en1_x               (reg_write_en1[13]            ),
  .reg_write_en2_x               (reg_write_en2[13]            ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[13]       ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[13]       ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[13]       ),
  .reg_write_is0_x               (reg_write_is0[13]            ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[13]       ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[14]/); @107
// &ConnRule(s/_y$/_14/); @108
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_14"); @109
pa_idu_reg32  x_pa_idu_reg32_14 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_14               ),
  .reg_dout_y                    (reg_dout_14                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[14]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[14]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[14]              ),
  .reg_write_en0_x               (reg_write_en0[14]            ),
  .reg_write_en1_x               (reg_write_en1[14]            ),
  .reg_write_en2_x               (reg_write_en2[14]            ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[14]       ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[14]       ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[14]       ),
  .reg_write_is0_x               (reg_write_is0[14]            ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[14]       ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[15]/); @111
// &ConnRule(s/_y$/_15/); @112
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_15"); @113
pa_idu_reg32  x_pa_idu_reg32_15 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_15               ),
  .reg_dout_y                    (reg_dout_15                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[15]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[15]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[15]              ),
  .reg_write_en0_x               (reg_write_en0[15]            ),
  .reg_write_en1_x               (reg_write_en1[15]            ),
  .reg_write_en2_x               (reg_write_en2[15]            ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[15]       ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[15]       ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[15]       ),
  .reg_write_is0_x               (reg_write_is0[15]            ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[15]       ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[16]/); @115
// &ConnRule(s/_y$/_16/); @116
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_16"); @117
pa_idu_reg32  x_pa_idu_reg32_16 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_16               ),
  .reg_dout_y                    (reg_dout_16                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[16]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[16]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[16]              ),
  .reg_write_en0_x               (reg_write_en0[16]            ),
  .reg_write_en1_x               (reg_write_en1[16]            ),
  .reg_write_en2_x               (reg_write_en2[16]            ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[16]       ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[16]       ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[16]       ),
  .reg_write_is0_x               (reg_write_is0[16]            ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[16]       ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[17]/); @119
// &ConnRule(s/_y$/_17/); @120
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_17"); @121
pa_idu_reg32_high  x_pa_idu_reg32_high_17 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_17               ),
  .reg_dout_y                    (reg_dout_17                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[17]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[17]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[17]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[17]            ),
  .reg_write_en1_x               (reg_write_en1[17]            ),
  .reg_write_en2_x               (reg_write_en2[17]            ),
  .reg_write_is0_x               (reg_write_is0[17]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[18]/); @123
// &ConnRule(s/_y$/_18/); @124
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_18"); @125
pa_idu_reg32_high  x_pa_idu_reg32_high_18 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_18               ),
  .reg_dout_y                    (reg_dout_18                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[18]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[18]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[18]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[18]            ),
  .reg_write_en1_x               (reg_write_en1[18]            ),
  .reg_write_en2_x               (reg_write_en2[18]            ),
  .reg_write_is0_x               (reg_write_is0[18]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[19]/); @127
// &ConnRule(s/_y$/_19/); @128
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_19"); @129
pa_idu_reg32_high  x_pa_idu_reg32_high_19 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_19               ),
  .reg_dout_y                    (reg_dout_19                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[19]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[19]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[19]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[19]            ),
  .reg_write_en1_x               (reg_write_en1[19]            ),
  .reg_write_en2_x               (reg_write_en2[19]            ),
  .reg_write_is0_x               (reg_write_is0[19]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[20]/); @131
// &ConnRule(s/_y$/_20/); @132
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_20"); @133
pa_idu_reg32_high  x_pa_idu_reg32_high_20 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_20               ),
  .reg_dout_y                    (reg_dout_20                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[20]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[20]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[20]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[20]            ),
  .reg_write_en1_x               (reg_write_en1[20]            ),
  .reg_write_en2_x               (reg_write_en2[20]            ),
  .reg_write_is0_x               (reg_write_is0[20]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[21]/); @135
// &ConnRule(s/_y$/_21/); @136
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_21"); @137
pa_idu_reg32_high  x_pa_idu_reg32_high_21 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_21               ),
  .reg_dout_y                    (reg_dout_21                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[21]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[21]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[21]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[21]            ),
  .reg_write_en1_x               (reg_write_en1[21]            ),
  .reg_write_en2_x               (reg_write_en2[21]            ),
  .reg_write_is0_x               (reg_write_is0[21]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[22]/); @139
// &ConnRule(s/_y$/_22/); @140
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_22"); @141
pa_idu_reg32_high  x_pa_idu_reg32_high_22 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_22               ),
  .reg_dout_y                    (reg_dout_22                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[22]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[22]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[22]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[22]            ),
  .reg_write_en1_x               (reg_write_en1[22]            ),
  .reg_write_en2_x               (reg_write_en2[22]            ),
  .reg_write_is0_x               (reg_write_is0[22]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[23]/); @143
// &ConnRule(s/_y$/_23/); @144
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_23"); @145
pa_idu_reg32_high  x_pa_idu_reg32_high_23 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_23               ),
  .reg_dout_y                    (reg_dout_23                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[23]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[23]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[23]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[23]            ),
  .reg_write_en1_x               (reg_write_en1[23]            ),
  .reg_write_en2_x               (reg_write_en2[23]            ),
  .reg_write_is0_x               (reg_write_is0[23]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[24]/); @147
// &ConnRule(s/_y$/_24/); @148
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_24"); @149
pa_idu_reg32_high  x_pa_idu_reg32_high_24 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_24               ),
  .reg_dout_y                    (reg_dout_24                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[24]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[24]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[24]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[24]            ),
  .reg_write_en1_x               (reg_write_en1[24]            ),
  .reg_write_en2_x               (reg_write_en2[24]            ),
  .reg_write_is0_x               (reg_write_is0[24]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[25]/); @151
// &ConnRule(s/_y$/_25/); @152
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_25"); @153
pa_idu_reg32_high  x_pa_idu_reg32_high_25 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_25               ),
  .reg_dout_y                    (reg_dout_25                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[25]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[25]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[25]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[25]            ),
  .reg_write_en1_x               (reg_write_en1[25]            ),
  .reg_write_en2_x               (reg_write_en2[25]            ),
  .reg_write_is0_x               (reg_write_is0[25]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[26]/); @155
// &ConnRule(s/_y$/_26/); @156
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_26"); @157
pa_idu_reg32_high  x_pa_idu_reg32_high_26 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_26               ),
  .reg_dout_y                    (reg_dout_26                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[26]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[26]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[26]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[26]            ),
  .reg_write_en1_x               (reg_write_en1[26]            ),
  .reg_write_en2_x               (reg_write_en2[26]            ),
  .reg_write_is0_x               (reg_write_is0[26]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[27]/); @159
// &ConnRule(s/_y$/_27/); @160
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_27"); @161
pa_idu_reg32_high  x_pa_idu_reg32_high_27 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_27               ),
  .reg_dout_y                    (reg_dout_27                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[27]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[27]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[27]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[27]            ),
  .reg_write_en1_x               (reg_write_en1[27]            ),
  .reg_write_en2_x               (reg_write_en2[27]            ),
  .reg_write_is0_x               (reg_write_is0[27]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[28]/); @163
// &ConnRule(s/_y$/_28/); @164
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_28"); @165
pa_idu_reg32_high  x_pa_idu_reg32_high_28 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_28               ),
  .reg_dout_y                    (reg_dout_28                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[28]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[28]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[28]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[28]            ),
  .reg_write_en1_x               (reg_write_en1[28]            ),
  .reg_write_en2_x               (reg_write_en2[28]            ),
  .reg_write_is0_x               (reg_write_is0[28]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[29]/); @167
// &ConnRule(s/_y$/_29/); @168
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_29"); @169
pa_idu_reg32_high  x_pa_idu_reg32_high_29 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_29               ),
  .reg_dout_y                    (reg_dout_29                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[29]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[29]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[29]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[29]            ),
  .reg_write_en1_x               (reg_write_en1[29]            ),
  .reg_write_en2_x               (reg_write_en2[29]            ),
  .reg_write_is0_x               (reg_write_is0[29]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[30]/); @171
// &ConnRule(s/_y$/_30/); @172
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_30"); @173
pa_idu_reg32_high  x_pa_idu_reg32_high_30 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_30               ),
  .reg_dout_y                    (reg_dout_30                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[30]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[30]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[30]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[30]            ),
  .reg_write_en1_x               (reg_write_en1[30]            ),
  .reg_write_en2_x               (reg_write_en2[30]            ),
  .reg_write_is0_x               (reg_write_is0[30]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[31]/); @175
// &ConnRule(s/_y$/_31/); @176
// &Instance("pa_idu_reg32_high", "x_pa_idu_reg32_high_31"); @177
pa_idu_reg32_high  x_pa_idu_reg32_high_31 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_31               ),
  .reg_dout_y                    (reg_dout_31                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[31]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[31]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[31]              ),
  .reg_high_cpuclk               (reg_high_cpuclk              ),
  .reg_write_en0_x               (reg_write_en0[31]            ),
  .reg_write_en1_x               (reg_write_en1[31]            ),
  .reg_write_en2_x               (reg_write_en2[31]            ),
  .reg_write_is0_x               (reg_write_is0[31]            ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[32]/); @179
// &ConnRule(s/_y$/_32/); @180
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_hint_0"); @181
pa_idu_reg32  x_pa_idu_reg32_hint_0 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_32               ),
  .reg_dout_y                    (reg_dout_32                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[32]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[32]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[32]              ),
  .reg_write_en0_x               (reg_write_en0[32]            ),
  .reg_write_en1_x               (reg_write_en1[32]            ),
  .reg_write_en2_x               (reg_write_en2[32]            ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[32]       ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[32]       ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[32]       ),
  .reg_write_is0_x               (reg_write_is0[32]            ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[32]       ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


// &ConnRule(s/_x$/[33]/); @183
// &ConnRule(s/_y$/_33/); @184
// &Instance("pa_idu_reg32", "x_pa_idu_reg32_hint_1"); @185
pa_idu_reg32  x_pa_idu_reg32_hint_1 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_div_inst             (ctrl_gpr_div_inst            ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_st_y                 (reg_busy_st_33               ),
  .reg_dout_y                    (reg_dout_33                  ),
  .reg_fwd_en0_x                 (reg_fwd_en0[33]              ),
  .reg_fwd_en1_x                 (reg_fwd_en1[33]              ),
  .reg_fwd_en2_x                 (reg_fwd_en2[33]              ),
  .reg_write_en0_x               (reg_write_en0[33]            ),
  .reg_write_en1_x               (reg_write_en1[33]            ),
  .reg_write_en2_x               (reg_write_en2[33]            ),
  .reg_write_en_gate0_x          (reg_write_en_gate0[33]       ),
  .reg_write_en_gate1_x          (reg_write_en_gate1[33]       ),
  .reg_write_en_gate2_x          (reg_write_en_gate2[33]       ),
  .reg_write_is0_x               (reg_write_is0[33]            ),
  .reg_write_is_gate0_x          (reg_write_is_gate0[33]       ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data0                   (write_data0                  ),
  .write_data1                   (write_data1                  ),
  .write_data2                   (write_data2                  )
);


//-----------------------------------------------
// 2. Two write port
//-----------------------------------------------
assign gpr_sync_rst_b = 1'b1;
assign write_index0[5:0] = rtu_idu_wb0_preg[5:0];
assign write_data0[31:0] = {32{gpr_sync_rst_b}} & rtu_idu_wb0_data[31:0];

// &Force("input", "rtu_idu_wb1_lsu_vld"); @194
// write index decoder
assign write_index0_sel[4:0] = rtu_idu_wb0_preg[4:0] & {5{rtu_idu_wb0_vld}};
// &CombBeg; @197
always @( write_index0_sel[4:0])
begin
  reg_sel0[31:0] = {32{1'b0}};
  case(write_index0_sel[4:0])
    5'h00 : reg_sel0[0]  = 1'b1;
    5'h01 : reg_sel0[1]  = 1'b1;
    5'h02 : reg_sel0[2]  = 1'b1;
    5'h03 : reg_sel0[3]  = 1'b1;
    5'h04 : reg_sel0[4]  = 1'b1;
    5'h05 : reg_sel0[5]  = 1'b1;
    5'h06 : reg_sel0[6]  = 1'b1;
    5'h07 : reg_sel0[7]  = 1'b1;
    5'h08 : reg_sel0[8]  = 1'b1;
    5'h09 : reg_sel0[9]  = 1'b1;
    5'h0a : reg_sel0[10] = 1'b1;
    5'h0b : reg_sel0[11] = 1'b1;
    5'h0c : reg_sel0[12] = 1'b1;
    5'h0d : reg_sel0[13] = 1'b1;
    5'h0e : reg_sel0[14] = 1'b1;
    5'h0f : reg_sel0[15] = 1'b1;
    5'h10 : reg_sel0[16] = 1'b1;
    5'h11 : reg_sel0[17] = 1'b1;
    5'h12 : reg_sel0[18] = 1'b1;
    5'h13 : reg_sel0[19] = 1'b1;
    5'h14 : reg_sel0[20] = 1'b1;
    5'h15 : reg_sel0[21] = 1'b1;
    5'h16 : reg_sel0[22] = 1'b1;
    5'h17 : reg_sel0[23] = 1'b1;
    5'h18 : reg_sel0[24] = 1'b1;
    5'h19 : reg_sel0[25] = 1'b1;
    5'h1a : reg_sel0[26] = 1'b1;
    5'h1b : reg_sel0[27] = 1'b1;
    5'h1c : reg_sel0[28] = 1'b1;
    5'h1d : reg_sel0[29] = 1'b1;
    5'h1e : reg_sel0[30] = 1'b1;
    5'h1f : reg_sel0[31] = 1'b1;
  endcase
// &CombEnd; @233
end

assign reg_hint_sel0[1:0]     = {2{rtu_idu_wb0_preg[5]}} & (2'b1 << write_index0[0]);
assign reg_write_en_hint0[1:0] = reg_hint_sel0[1:0] & {2{rtu_idu_wb0_vld & gpr_sync_rst_b}};

assign reg_write_en0[31:0] = reg_sel0[31:0] & {32{rtu_idu_wb0_vld & ~write_index0[5]}}
                          & {32{gpr_sync_rst_b}};
assign reg_write_en0[32] = reg_write_en_hint0[0];
assign reg_write_en0[33] = reg_write_en_hint0[1];
assign reg_write_en_gate0[33:0] = reg_write_en0[33:0];

assign write_index1[5:0] = rtu_idu_wb1_preg[5:0];
assign write_data1[31:0] = {32{gpr_sync_rst_b}} & rtu_idu_wb1_data[31:0];

// write index decoder
// &CombBeg; @248
always @( write_index1[4:0])
begin
  reg_sel1[31:0] = {32{1'b0}};
  case(write_index1[4:0])
    5'h00 : reg_sel1[0]  = 1'b1;
    5'h01 : reg_sel1[1]  = 1'b1;
    5'h02 : reg_sel1[2]  = 1'b1;
    5'h03 : reg_sel1[3]  = 1'b1;
    5'h04 : reg_sel1[4]  = 1'b1;
    5'h05 : reg_sel1[5]  = 1'b1;
    5'h06 : reg_sel1[6]  = 1'b1;
    5'h07 : reg_sel1[7]  = 1'b1;
    5'h08 : reg_sel1[8]  = 1'b1;
    5'h09 : reg_sel1[9]  = 1'b1;
    5'h0a : reg_sel1[10] = 1'b1;
    5'h0b : reg_sel1[11] = 1'b1;
    5'h0c : reg_sel1[12] = 1'b1;
    5'h0d : reg_sel1[13] = 1'b1;
    5'h0e : reg_sel1[14] = 1'b1;
    5'h0f : reg_sel1[15] = 1'b1;
    5'h10 : reg_sel1[16] = 1'b1;
    5'h11 : reg_sel1[17] = 1'b1;
    5'h12 : reg_sel1[18] = 1'b1;
    5'h13 : reg_sel1[19] = 1'b1;
    5'h14 : reg_sel1[20] = 1'b1;
    5'h15 : reg_sel1[21] = 1'b1;
    5'h16 : reg_sel1[22] = 1'b1;
    5'h17 : reg_sel1[23] = 1'b1;
    5'h18 : reg_sel1[24] = 1'b1;
    5'h19 : reg_sel1[25] = 1'b1;
    5'h1a : reg_sel1[26] = 1'b1;
    5'h1b : reg_sel1[27] = 1'b1;
    5'h1c : reg_sel1[28] = 1'b1;
    5'h1d : reg_sel1[29] = 1'b1;
    5'h1e : reg_sel1[30] = 1'b1;
    5'h1f : reg_sel1[31] = 1'b1;
  endcase
// &CombEnd; @284
end

assign reg_hint_sel1[1:0]     = {2{rtu_idu_wb1_preg[5]}} & (2'b1 << write_index1[0]);
assign reg_write_en_hint1[1:0] = reg_hint_sel1[1:0] & {2{rtu_idu_wb1_vld & gpr_sync_rst_b}};

assign reg_write_en1[31:0] = reg_sel1[31:0] & {32{rtu_idu_wb1_vld & ~write_index1[5]}}
                          & {32{gpr_sync_rst_b}};
assign reg_write_en1[32] = reg_write_en_hint1[0] & ~hs_gpr_wb_mask;
assign reg_write_en1[33] = reg_write_en_hint1[1] & ~hs_gpr_wb_mask;
assign reg_write_en_gate1[33:0] = reg_write_en1[33:0];

assign write_index2[5:0] = rtu_idu_wb2_preg[5:0];
assign write_data2[31:0] = {32{gpr_sync_rst_b}} & rtu_idu_wb2_data[31:0];

// write index decoder
// &CombBeg; @299
always @( write_index2[4:0])
begin
  reg_sel2[31:0] = {32{1'b0}};
  case(write_index2[4:0])
    5'h00 : reg_sel2[0]  = 1'b1;
    5'h01 : reg_sel2[1]  = 1'b1;
    5'h02 : reg_sel2[2]  = 1'b1;
    5'h03 : reg_sel2[3]  = 1'b1;
    5'h04 : reg_sel2[4]  = 1'b1;
    5'h05 : reg_sel2[5]  = 1'b1;
    5'h06 : reg_sel2[6]  = 1'b1;
    5'h07 : reg_sel2[7]  = 1'b1;
    5'h08 : reg_sel2[8]  = 1'b1;
    5'h09 : reg_sel2[9]  = 1'b1;
    5'h0a : reg_sel2[10] = 1'b1;
    5'h0b : reg_sel2[11] = 1'b1;
    5'h0c : reg_sel2[12] = 1'b1;
    5'h0d : reg_sel2[13] = 1'b1;
    5'h0e : reg_sel2[14] = 1'b1;
    5'h0f : reg_sel2[15] = 1'b1;
    5'h10 : reg_sel2[16] = 1'b1;
    5'h11 : reg_sel2[17] = 1'b1;
    5'h12 : reg_sel2[18] = 1'b1;
    5'h13 : reg_sel2[19] = 1'b1;
    5'h14 : reg_sel2[20] = 1'b1;
    5'h15 : reg_sel2[21] = 1'b1;
    5'h16 : reg_sel2[22] = 1'b1;
    5'h17 : reg_sel2[23] = 1'b1;
    5'h18 : reg_sel2[24] = 1'b1;
    5'h19 : reg_sel2[25] = 1'b1;
    5'h1a : reg_sel2[26] = 1'b1;
    5'h1b : reg_sel2[27] = 1'b1;
    5'h1c : reg_sel2[28] = 1'b1;
    5'h1d : reg_sel2[29] = 1'b1;
    5'h1e : reg_sel2[30] = 1'b1;
    5'h1f : reg_sel2[31] = 1'b1;
  endcase
// &CombEnd; @335
end

assign reg_write_en2[31:0] = reg_sel2[31:0] & {32{rtu_idu_wb2_vld & ~write_index2[5]}}
                          & {32{gpr_sync_rst_b}};
assign reg_write_en2[32] = 1'b0;
assign reg_write_en2[33] = 1'b0;
assign reg_write_en_gate2[33:0] = reg_write_en2[33:0];

// for sp auto swap
assign reg_write_en_sp = cp0_idu_sp_wen;
assign reg_write_en_sp_gate = cp0_idu_sp_wen_gate;
assign write_data_sp[31:0] = cp0_idu_sp_wdata[31:0];

assign gpr_wb_sp = reg_write_en0[2] | reg_write_en1[2] | reg_write_en2[2];

// Write Reg Issue0
// write issue index decoder
assign reg_issue0_sel[4:0] = ctrl_gpr_id_wr_idx1[4:0] & {5{ctrl_gpr_id_rd1_vld}};
// &CombBeg; @353
always @( reg_issue0_sel[4:0])
begin
  reg_issue0[31:0] = {32{1'b0}};
  case(reg_issue0_sel[4:0])
    5'h00 : reg_issue0[0]  = 1'b1;
    5'h01 : reg_issue0[1]  = 1'b1;
    5'h02 : reg_issue0[2]  = 1'b1;
    5'h03 : reg_issue0[3]  = 1'b1;
    5'h04 : reg_issue0[4]  = 1'b1;
    5'h05 : reg_issue0[5]  = 1'b1;
    5'h06 : reg_issue0[6]  = 1'b1;
    5'h07 : reg_issue0[7]  = 1'b1;
    5'h08 : reg_issue0[8]  = 1'b1;
    5'h09 : reg_issue0[9]  = 1'b1;
    5'h0a : reg_issue0[10] = 1'b1;
    5'h0b : reg_issue0[11] = 1'b1;
    5'h0c : reg_issue0[12] = 1'b1;
    5'h0d : reg_issue0[13] = 1'b1;
    5'h0e : reg_issue0[14] = 1'b1;
    5'h0f : reg_issue0[15] = 1'b1;
    5'h10 : reg_issue0[16] = 1'b1;
    5'h11 : reg_issue0[17] = 1'b1;
    5'h12 : reg_issue0[18] = 1'b1;
    5'h13 : reg_issue0[19] = 1'b1;
    5'h14 : reg_issue0[20] = 1'b1;
    5'h15 : reg_issue0[21] = 1'b1;
    5'h16 : reg_issue0[22] = 1'b1;
    5'h17 : reg_issue0[23] = 1'b1;
    5'h18 : reg_issue0[24] = 1'b1;
    5'h19 : reg_issue0[25] = 1'b1;
    5'h1a : reg_issue0[26] = 1'b1;
    5'h1b : reg_issue0[27] = 1'b1;
    5'h1c : reg_issue0[28] = 1'b1;
    5'h1d : reg_issue0[29] = 1'b1;
    5'h1e : reg_issue0[30] = 1'b1;
    5'h1f : reg_issue0[31] = 1'b1;
  endcase
// &CombEnd; @389
end

assign reg_write_is0[31:0]  = {32{ctrl_gpr_wr_issue1 & ~ctrl_gpr_id_wr_idx1[5] & ~hs_gpr_wr_mask}}
                           & reg_issue0[31:0];
assign reg_hint_is0[1:0]    = {2{ctrl_gpr_id_wr_idx1[5]}} & (2'b1 << ctrl_gpr_id_wr_idx1[0]);
assign reg_write_is0[33:32] = {2{ctrl_gpr_wr_issue1 & ~hs_gpr_wr_mask}} & reg_hint_is0[1:0];

assign reg_write_is_gate0[31:0]  = {32{ctrl_gpr_id_rd1_vld & ~ctrl_gpr_id_wr_idx1[5] & ~hs_gpr_wr_mask}}
                                 & reg_issue0[31:0];
assign reg_write_is_gate0[33:32] = {2{ctrl_gpr_id_rd1_vld & ~hs_gpr_wr_mask}} & reg_hint_is0[1:0];

// Write Reg Issue1
// write issue index decoder
//assign reg_issue1_sel[4:0] = ctrl_gpr_id_wr_idx2[4:0] & {5{ctrl_gpr_id_rd2_vld}};
//&CombBeg;
//  reg_issue1[31:0] = {32{1'b0}};
//  case(reg_issue1_sel[4:0])
//    5'h00 : reg_issue1[0]  = 1'b1;
//    5'h01 : reg_issue1[1]  = 1'b1;
//    5'h02 : reg_issue1[2]  = 1'b1;
//    5'h03 : reg_issue1[3]  = 1'b1;
//    5'h04 : reg_issue1[4]  = 1'b1;
//    5'h05 : reg_issue1[5]  = 1'b1;
//    5'h06 : reg_issue1[6]  = 1'b1;
//    5'h07 : reg_issue1[7]  = 1'b1;
//    5'h08 : reg_issue1[8]  = 1'b1;
//    5'h09 : reg_issue1[9]  = 1'b1;
//    5'h0a : reg_issue1[10] = 1'b1;
//    5'h0b : reg_issue1[11] = 1'b1;
//    5'h0c : reg_issue1[12] = 1'b1;
//    5'h0d : reg_issue1[13] = 1'b1;
//    5'h0e : reg_issue1[14] = 1'b1;
//    5'h0f : reg_issue1[15] = 1'b1;
//    5'h10 : reg_issue1[16] = 1'b1;
//    5'h11 : reg_issue1[17] = 1'b1;
//    5'h12 : reg_issue1[18] = 1'b1;
//    5'h13 : reg_issue1[19] = 1'b1;
//    5'h14 : reg_issue1[20] = 1'b1;
//    5'h15 : reg_issue1[21] = 1'b1;
//    5'h16 : reg_issue1[22] = 1'b1;
//    5'h17 : reg_issue1[23] = 1'b1;
//    5'h18 : reg_issue1[24] = 1'b1;
//    5'h19 : reg_issue1[25] = 1'b1;
//    5'h1a : reg_issue1[26] = 1'b1;
//    5'h1b : reg_issue1[27] = 1'b1;
//    5'h1c : reg_issue1[28] = 1'b1;
//    5'h1d : reg_issue1[29] = 1'b1;
//    5'h1e : reg_issue1[30] = 1'b1;
//    5'h1f : reg_issue1[31] = 1'b1;
//  endcase
//&CombEnd;
//
//assign reg_write_is1[31:0]  = {32{ctrl_gpr_wr_issue2}} & reg_issue1[31:0];
//assign reg_write_is1[33:32] = 2'b0;
//
//assign reg_write_is_gate1[31:0]  = {32{ctrl_gpr_id_rd2_vld}} & reg_issue1[31:0];
//assign reg_write_is_gate1[33:32] = 2'b0;

// write index decoder
// &Force("bus", "iu_idu_ex2_fwd_preg0", 5, 0); @448
assign fpu_fwd0_vld      = rtu_idu_wb0_vld & rtu_idu_wb0_fpu_vld;
assign fpu_fwd0_reg[4:0] = rtu_idu_wb0_preg[4:0];
assign div_fwd_index[4:0] = {5{iu_idu_ex2_fwd_vld0 & iu_idu_ex2_div_vld}} & iu_idu_ex2_fwd_preg0[4:0];
assign fpu_fwd_index[4:0] = {5{fpu_fwd0_vld}} & fpu_fwd0_reg[4:0];
// &CombBeg; @458
always @( div_fwd_index[4:0])
begin
  div_fwd_sel0[31:0] = {32{1'b0}};
  case(div_fwd_index[4:0])
    5'h00 : div_fwd_sel0[0]  = 1'b1;
    5'h01 : div_fwd_sel0[1]  = 1'b1;
    5'h02 : div_fwd_sel0[2]  = 1'b1;
    5'h03 : div_fwd_sel0[3]  = 1'b1;
    5'h04 : div_fwd_sel0[4]  = 1'b1;
    5'h05 : div_fwd_sel0[5]  = 1'b1;
    5'h06 : div_fwd_sel0[6]  = 1'b1;
    5'h07 : div_fwd_sel0[7]  = 1'b1;
    5'h08 : div_fwd_sel0[8]  = 1'b1;
    5'h09 : div_fwd_sel0[9]  = 1'b1;
    5'h0a : div_fwd_sel0[10] = 1'b1;
    5'h0b : div_fwd_sel0[11] = 1'b1;
    5'h0c : div_fwd_sel0[12] = 1'b1;
    5'h0d : div_fwd_sel0[13] = 1'b1;
    5'h0e : div_fwd_sel0[14] = 1'b1;
    5'h0f : div_fwd_sel0[15] = 1'b1;
    5'h10 : div_fwd_sel0[16] = 1'b1;
    5'h11 : div_fwd_sel0[17] = 1'b1;
    5'h12 : div_fwd_sel0[18] = 1'b1;
    5'h13 : div_fwd_sel0[19] = 1'b1;
    5'h14 : div_fwd_sel0[20] = 1'b1;
    5'h15 : div_fwd_sel0[21] = 1'b1;
    5'h16 : div_fwd_sel0[22] = 1'b1;
    5'h17 : div_fwd_sel0[23] = 1'b1;
    5'h18 : div_fwd_sel0[24] = 1'b1;
    5'h19 : div_fwd_sel0[25] = 1'b1;
    5'h1a : div_fwd_sel0[26] = 1'b1;
    5'h1b : div_fwd_sel0[27] = 1'b1;
    5'h1c : div_fwd_sel0[28] = 1'b1;
    5'h1d : div_fwd_sel0[29] = 1'b1;
    5'h1e : div_fwd_sel0[30] = 1'b1;
    5'h1f : div_fwd_sel0[31] = 1'b1;
  endcase
// &CombEnd; @494
end
// &CombBeg; @495
always @( fpu_fwd_index[4:0])
begin
  fpu_fwd_sel0[31:0] = {32{1'b0}};
  case(fpu_fwd_index[4:0])
    5'h00 : fpu_fwd_sel0[0]  = 1'b1;
    5'h01 : fpu_fwd_sel0[1]  = 1'b1;
    5'h02 : fpu_fwd_sel0[2]  = 1'b1;
    5'h03 : fpu_fwd_sel0[3]  = 1'b1;
    5'h04 : fpu_fwd_sel0[4]  = 1'b1;
    5'h05 : fpu_fwd_sel0[5]  = 1'b1;
    5'h06 : fpu_fwd_sel0[6]  = 1'b1;
    5'h07 : fpu_fwd_sel0[7]  = 1'b1;
    5'h08 : fpu_fwd_sel0[8]  = 1'b1;
    5'h09 : fpu_fwd_sel0[9]  = 1'b1;
    5'h0a : fpu_fwd_sel0[10] = 1'b1;
    5'h0b : fpu_fwd_sel0[11] = 1'b1;
    5'h0c : fpu_fwd_sel0[12] = 1'b1;
    5'h0d : fpu_fwd_sel0[13] = 1'b1;
    5'h0e : fpu_fwd_sel0[14] = 1'b1;
    5'h0f : fpu_fwd_sel0[15] = 1'b1;
    5'h10 : fpu_fwd_sel0[16] = 1'b1;
    5'h11 : fpu_fwd_sel0[17] = 1'b1;
    5'h12 : fpu_fwd_sel0[18] = 1'b1;
    5'h13 : fpu_fwd_sel0[19] = 1'b1;
    5'h14 : fpu_fwd_sel0[20] = 1'b1;
    5'h15 : fpu_fwd_sel0[21] = 1'b1;
    5'h16 : fpu_fwd_sel0[22] = 1'b1;
    5'h17 : fpu_fwd_sel0[23] = 1'b1;
    5'h18 : fpu_fwd_sel0[24] = 1'b1;
    5'h19 : fpu_fwd_sel0[25] = 1'b1;
    5'h1a : fpu_fwd_sel0[26] = 1'b1;
    5'h1b : fpu_fwd_sel0[27] = 1'b1;
    5'h1c : fpu_fwd_sel0[28] = 1'b1;
    5'h1d : fpu_fwd_sel0[29] = 1'b1;
    5'h1e : fpu_fwd_sel0[30] = 1'b1;
    5'h1f : fpu_fwd_sel0[31] = 1'b1;
  endcase
// &CombEnd; @531
end
assign reg_fwd_en0[31:0] = div_fwd_sel0[31:0] & {32{iu_idu_ex2_fwd_vld0 & iu_idu_ex2_div_vld}}
                         | fpu_fwd_sel0[31:0] & {32{fpu_fwd0_vld}};
assign reg_fwd_en0[32] = 1'b0;
assign reg_fwd_en0[33] = 1'b0;

assign fwd_index1_sel[4:0] = lsu_idu_ex2_fwd_preg[4:0] & {5{lsu_idu_ex2_fwd_vld}};
// &CombBeg; @538
always @( fwd_index1_sel[4:0])
begin
  reg_fwd_sel1[31:0] = {32{1'b0}};
  case(fwd_index1_sel[4:0])
    5'h00 : reg_fwd_sel1[0]  = 1'b1;
    5'h01 : reg_fwd_sel1[1]  = 1'b1;
    5'h02 : reg_fwd_sel1[2]  = 1'b1;
    5'h03 : reg_fwd_sel1[3]  = 1'b1;
    5'h04 : reg_fwd_sel1[4]  = 1'b1;
    5'h05 : reg_fwd_sel1[5]  = 1'b1;
    5'h06 : reg_fwd_sel1[6]  = 1'b1;
    5'h07 : reg_fwd_sel1[7]  = 1'b1;
    5'h08 : reg_fwd_sel1[8]  = 1'b1;
    5'h09 : reg_fwd_sel1[9]  = 1'b1;
    5'h0a : reg_fwd_sel1[10] = 1'b1;
    5'h0b : reg_fwd_sel1[11] = 1'b1;
    5'h0c : reg_fwd_sel1[12] = 1'b1;
    5'h0d : reg_fwd_sel1[13] = 1'b1;
    5'h0e : reg_fwd_sel1[14] = 1'b1;
    5'h0f : reg_fwd_sel1[15] = 1'b1;
    5'h10 : reg_fwd_sel1[16] = 1'b1;
    5'h11 : reg_fwd_sel1[17] = 1'b1;
    5'h12 : reg_fwd_sel1[18] = 1'b1;
    5'h13 : reg_fwd_sel1[19] = 1'b1;
    5'h14 : reg_fwd_sel1[20] = 1'b1;
    5'h15 : reg_fwd_sel1[21] = 1'b1;
    5'h16 : reg_fwd_sel1[22] = 1'b1;
    5'h17 : reg_fwd_sel1[23] = 1'b1;
    5'h18 : reg_fwd_sel1[24] = 1'b1;
    5'h19 : reg_fwd_sel1[25] = 1'b1;
    5'h1a : reg_fwd_sel1[26] = 1'b1;
    5'h1b : reg_fwd_sel1[27] = 1'b1;
    5'h1c : reg_fwd_sel1[28] = 1'b1;
    5'h1d : reg_fwd_sel1[29] = 1'b1;
    5'h1e : reg_fwd_sel1[30] = 1'b1;
    5'h1f : reg_fwd_sel1[31] = 1'b1;
  endcase
// &CombEnd; @574
end
assign reg_fwd_en1[31:0] = reg_fwd_sel1[31:0] & {32{lsu_idu_ex2_fwd_vld & ~lsu_idu_ex2_fwd_preg[5]}};
assign reg_fwd_en1[32] = reg_write_en_hint1[0];
assign reg_fwd_en1[33] = reg_write_en_hint1[1];

assign fwd_index2_sel[4:0] = ctrl_gpr_ex1_dst_preg[4:0] & {5{rtu_yy_xx_expt_int & ctrl_gpr_ex1_int_spec}};
// &CombBeg; @580
always @( fwd_index2_sel[4:0])
begin
  reg_fwd_sel2[31:0] = {32{1'b0}};
  case(fwd_index2_sel[4:0])
    5'h00 : reg_fwd_sel2[0]  = 1'b1;
    5'h01 : reg_fwd_sel2[1]  = 1'b1;
    5'h02 : reg_fwd_sel2[2]  = 1'b1;
    5'h03 : reg_fwd_sel2[3]  = 1'b1;
    5'h04 : reg_fwd_sel2[4]  = 1'b1;
    5'h05 : reg_fwd_sel2[5]  = 1'b1;
    5'h06 : reg_fwd_sel2[6]  = 1'b1;
    5'h07 : reg_fwd_sel2[7]  = 1'b1;
    5'h08 : reg_fwd_sel2[8]  = 1'b1;
    5'h09 : reg_fwd_sel2[9]  = 1'b1;
    5'h0a : reg_fwd_sel2[10] = 1'b1;
    5'h0b : reg_fwd_sel2[11] = 1'b1;
    5'h0c : reg_fwd_sel2[12] = 1'b1;
    5'h0d : reg_fwd_sel2[13] = 1'b1;
    5'h0e : reg_fwd_sel2[14] = 1'b1;
    5'h0f : reg_fwd_sel2[15] = 1'b1;
    5'h10 : reg_fwd_sel2[16] = 1'b1;
    5'h11 : reg_fwd_sel2[17] = 1'b1;
    5'h12 : reg_fwd_sel2[18] = 1'b1;
    5'h13 : reg_fwd_sel2[19] = 1'b1;
    5'h14 : reg_fwd_sel2[20] = 1'b1;
    5'h15 : reg_fwd_sel2[21] = 1'b1;
    5'h16 : reg_fwd_sel2[22] = 1'b1;
    5'h17 : reg_fwd_sel2[23] = 1'b1;
    5'h18 : reg_fwd_sel2[24] = 1'b1;
    5'h19 : reg_fwd_sel2[25] = 1'b1;
    5'h1a : reg_fwd_sel2[26] = 1'b1;
    5'h1b : reg_fwd_sel2[27] = 1'b1;
    5'h1c : reg_fwd_sel2[28] = 1'b1;
    5'h1d : reg_fwd_sel2[29] = 1'b1;
    5'h1e : reg_fwd_sel2[30] = 1'b1;
    5'h1f : reg_fwd_sel2[31] = 1'b1;
  endcase
// &CombEnd; @616
end
assign reg_fwd_en2[31:0] = reg_fwd_sel2[31:0];
assign reg_fwd_en2[32] = 1'b0;
assign reg_fwd_en2[33] = 1'b0;

//-----------------------------------------------
// 3. Three read ports
//-----------------------------------------------
// Read Port 1 for rs1
// &CombBeg; @625
always @( reg_dout_4[31:0]
       or reg_dout_7[31:0]
       or reg_dout_3[31:0]
       or reg_dout_30[31:0]
       or reg_dout_5[31:0]
       or reg_dout_20[31:0]
       or reg_dout_22[31:0]
       or reg_dout_8[31:0]
       or reg_dout_28[31:0]
       or reg_dout_27[31:0]
       or reg_dout_12[31:0]
       or reg_dout_23[31:0]
       or reg_dout_19[31:0]
       or reg_dout_15[31:0]
       or reg_dout_2[31:0]
       or reg_dout_6[31:0]
       or reg_dout_1[31:0]
       or reg_dout_10[31:0]
       or reg_dout_26[31:0]
       or reg_dout_11[31:0]
       or reg_dout_18[31:0]
       or reg_dout_17[31:0]
       or reg_dout_25[31:0]
       or reg_dout_24[31:0]
       or decd_gpr_rs1[4:0]
       or reg_dout_31[31:0]
       or reg_dout_21[31:0]
       or reg_dout_16[31:0]
       or reg_dout_14[31:0]
       or reg_dout_29[31:0]
       or reg_dout_9[31:0]
       or reg_dout_13[31:0])
begin
  case(decd_gpr_rs1[4:0])
    5'h00   : gpr_read_data1[31:0] = {32{1'b0}};
    5'h01   : gpr_read_data1[31:0] = reg_dout_1[31:0];
    5'h02   : gpr_read_data1[31:0] = reg_dout_2[31:0];
    5'h03   : gpr_read_data1[31:0] = reg_dout_3[31:0];
    5'h04   : gpr_read_data1[31:0] = reg_dout_4[31:0];
    5'h05   : gpr_read_data1[31:0] = reg_dout_5[31:0];
    5'h06   : gpr_read_data1[31:0] = reg_dout_6[31:0];
    5'h07   : gpr_read_data1[31:0] = reg_dout_7[31:0];
    5'h08   : gpr_read_data1[31:0] = reg_dout_8[31:0];
    5'h09   : gpr_read_data1[31:0] = reg_dout_9[31:0];
    5'h0a   : gpr_read_data1[31:0] = reg_dout_10[31:0];
    5'h0b   : gpr_read_data1[31:0] = reg_dout_11[31:0];
    5'h0c   : gpr_read_data1[31:0] = reg_dout_12[31:0];
    5'h0d   : gpr_read_data1[31:0] = reg_dout_13[31:0];
    5'h0e   : gpr_read_data1[31:0] = reg_dout_14[31:0];
    5'h0f   : gpr_read_data1[31:0] = reg_dout_15[31:0];
    5'h10   : gpr_read_data1[31:0] = reg_dout_16[31:0];
    5'h11   : gpr_read_data1[31:0] = reg_dout_17[31:0];
    5'h12   : gpr_read_data1[31:0] = reg_dout_18[31:0];
    5'h13   : gpr_read_data1[31:0] = reg_dout_19[31:0];
    5'h14   : gpr_read_data1[31:0] = reg_dout_20[31:0];
    5'h15   : gpr_read_data1[31:0] = reg_dout_21[31:0];
    5'h16   : gpr_read_data1[31:0] = reg_dout_22[31:0];
    5'h17   : gpr_read_data1[31:0] = reg_dout_23[31:0];
    5'h18   : gpr_read_data1[31:0] = reg_dout_24[31:0];
    5'h19   : gpr_read_data1[31:0] = reg_dout_25[31:0];
    5'h1a   : gpr_read_data1[31:0] = reg_dout_26[31:0];
    5'h1b   : gpr_read_data1[31:0] = reg_dout_27[31:0];
    5'h1c   : gpr_read_data1[31:0] = reg_dout_28[31:0];
    5'h1d   : gpr_read_data1[31:0] = reg_dout_29[31:0];
    5'h1e   : gpr_read_data1[31:0] = reg_dout_30[31:0];
    5'h1f   : gpr_read_data1[31:0] = reg_dout_31[31:0];
    default : gpr_read_data1[31:0] = {32{1'bx}};
  endcase
// &CombEnd; @661
end

assign hint_read_data1[31:0] = decd_gpr_rs1[0] ? reg_dout_33[31:0] : reg_dout_32[31:0];

assign gpr_read_data1_after_hint[31:0] = decd_gpr_rs1[5] ? hint_read_data1[31:0] : gpr_read_data1[31:0];

// Read Port 2 for rs2
// &CombBeg; @668
always @( reg_dout_4[31:0]
       or reg_dout_7[31:0]
       or reg_dout_3[31:0]
       or reg_dout_30[31:0]
       or reg_dout_5[31:0]
       or decd_gpr_rs2[4:0]
       or reg_dout_20[31:0]
       or reg_dout_22[31:0]
       or reg_dout_8[31:0]
       or reg_dout_28[31:0]
       or reg_dout_27[31:0]
       or reg_dout_12[31:0]
       or reg_dout_23[31:0]
       or reg_dout_19[31:0]
       or reg_dout_15[31:0]
       or reg_dout_2[31:0]
       or reg_dout_6[31:0]
       or reg_dout_1[31:0]
       or reg_dout_10[31:0]
       or reg_dout_26[31:0]
       or reg_dout_11[31:0]
       or reg_dout_18[31:0]
       or reg_dout_17[31:0]
       or reg_dout_25[31:0]
       or reg_dout_24[31:0]
       or reg_dout_31[31:0]
       or reg_dout_16[31:0]
       or reg_dout_21[31:0]
       or reg_dout_14[31:0]
       or reg_dout_29[31:0]
       or reg_dout_9[31:0]
       or reg_dout_13[31:0])
begin
  case(decd_gpr_rs2[4:0])
    5'h00   : gpr_read_data2[31:0] = {32{1'b0}};
    5'h01   : gpr_read_data2[31:0] = reg_dout_1[31:0];
    5'h02   : gpr_read_data2[31:0] = reg_dout_2[31:0];
    5'h03   : gpr_read_data2[31:0] = reg_dout_3[31:0];
    5'h04   : gpr_read_data2[31:0] = reg_dout_4[31:0];
    5'h05   : gpr_read_data2[31:0] = reg_dout_5[31:0];
    5'h06   : gpr_read_data2[31:0] = reg_dout_6[31:0];
    5'h07   : gpr_read_data2[31:0] = reg_dout_7[31:0];
    5'h08   : gpr_read_data2[31:0] = reg_dout_8[31:0];
    5'h09   : gpr_read_data2[31:0] = reg_dout_9[31:0];
    5'h0a   : gpr_read_data2[31:0] = reg_dout_10[31:0];
    5'h0b   : gpr_read_data2[31:0] = reg_dout_11[31:0];
    5'h0c   : gpr_read_data2[31:0] = reg_dout_12[31:0];
    5'h0d   : gpr_read_data2[31:0] = reg_dout_13[31:0];
    5'h0e   : gpr_read_data2[31:0] = reg_dout_14[31:0];
    5'h0f   : gpr_read_data2[31:0] = reg_dout_15[31:0];
    5'h10   : gpr_read_data2[31:0] = reg_dout_16[31:0];
    5'h11   : gpr_read_data2[31:0] = reg_dout_17[31:0];
    5'h12   : gpr_read_data2[31:0] = reg_dout_18[31:0];
    5'h13   : gpr_read_data2[31:0] = reg_dout_19[31:0];
    5'h14   : gpr_read_data2[31:0] = reg_dout_20[31:0];
    5'h15   : gpr_read_data2[31:0] = reg_dout_21[31:0];
    5'h16   : gpr_read_data2[31:0] = reg_dout_22[31:0];
    5'h17   : gpr_read_data2[31:0] = reg_dout_23[31:0];
    5'h18   : gpr_read_data2[31:0] = reg_dout_24[31:0];
    5'h19   : gpr_read_data2[31:0] = reg_dout_25[31:0];
    5'h1a   : gpr_read_data2[31:0] = reg_dout_26[31:0];
    5'h1b   : gpr_read_data2[31:0] = reg_dout_27[31:0];
    5'h1c   : gpr_read_data2[31:0] = reg_dout_28[31:0];
    5'h1d   : gpr_read_data2[31:0] = reg_dout_29[31:0];
    5'h1e   : gpr_read_data2[31:0] = reg_dout_30[31:0];
    5'h1f   : gpr_read_data2[31:0] = reg_dout_31[31:0];
    default : gpr_read_data2[31:0] = {32{1'bx}};
  endcase
// &CombEnd; @704
end

assign hint_read_data2[31:0] = decd_gpr_rs2[0] ? reg_dout_33[31:0] : reg_dout_32[31:0];

assign gpr_read_data2_after_hint[31:0] = decd_gpr_rs2[5] ? hint_read_data2[31:0] : gpr_read_data2[31:0];

// Read Port 3 for rs3
// &CombBeg; @711
always @( reg_dout_4[31:0]
       or reg_dout_7[31:0]
       or reg_dout_3[31:0]
       or reg_dout_30[31:0]
       or reg_dout_5[31:0]
       or reg_dout_20[31:0]
       or reg_dout_22[31:0]
       or reg_dout_8[31:0]
       or reg_dout_28[31:0]
       or reg_dout_27[31:0]
       or reg_dout_12[31:0]
       or reg_dout_23[31:0]
       or reg_dout_19[31:0]
       or reg_dout_15[31:0]
       or reg_dout_2[31:0]
       or reg_dout_6[31:0]
       or reg_dout_1[31:0]
       or reg_dout_10[31:0]
       or reg_dout_26[31:0]
       or decd_gpr_rs3[4:0]
       or reg_dout_11[31:0]
       or reg_dout_18[31:0]
       or reg_dout_17[31:0]
       or reg_dout_25[31:0]
       or reg_dout_24[31:0]
       or reg_dout_31[31:0]
       or reg_dout_16[31:0]
       or reg_dout_21[31:0]
       or reg_dout_14[31:0]
       or reg_dout_29[31:0]
       or reg_dout_9[31:0]
       or reg_dout_13[31:0])
begin
  case(decd_gpr_rs3[4:0])
    5'h00   : gpr_read_data3[31:0] = {32{1'b0}};
    5'h01   : gpr_read_data3[31:0] = reg_dout_1[31:0];
    5'h02   : gpr_read_data3[31:0] = reg_dout_2[31:0];
    5'h03   : gpr_read_data3[31:0] = reg_dout_3[31:0];
    5'h04   : gpr_read_data3[31:0] = reg_dout_4[31:0];
    5'h05   : gpr_read_data3[31:0] = reg_dout_5[31:0];
    5'h06   : gpr_read_data3[31:0] = reg_dout_6[31:0];
    5'h07   : gpr_read_data3[31:0] = reg_dout_7[31:0];
    5'h08   : gpr_read_data3[31:0] = reg_dout_8[31:0];
    5'h09   : gpr_read_data3[31:0] = reg_dout_9[31:0];
    5'h0a   : gpr_read_data3[31:0] = reg_dout_10[31:0];
    5'h0b   : gpr_read_data3[31:0] = reg_dout_11[31:0];
    5'h0c   : gpr_read_data3[31:0] = reg_dout_12[31:0];
    5'h0d   : gpr_read_data3[31:0] = reg_dout_13[31:0];
    5'h0e   : gpr_read_data3[31:0] = reg_dout_14[31:0];
    5'h0f   : gpr_read_data3[31:0] = reg_dout_15[31:0];
    5'h10   : gpr_read_data3[31:0] = reg_dout_16[31:0];
    5'h11   : gpr_read_data3[31:0] = reg_dout_17[31:0];
    5'h12   : gpr_read_data3[31:0] = reg_dout_18[31:0];
    5'h13   : gpr_read_data3[31:0] = reg_dout_19[31:0];
    5'h14   : gpr_read_data3[31:0] = reg_dout_20[31:0];
    5'h15   : gpr_read_data3[31:0] = reg_dout_21[31:0];
    5'h16   : gpr_read_data3[31:0] = reg_dout_22[31:0];
    5'h17   : gpr_read_data3[31:0] = reg_dout_23[31:0];
    5'h18   : gpr_read_data3[31:0] = reg_dout_24[31:0];
    5'h19   : gpr_read_data3[31:0] = reg_dout_25[31:0];
    5'h1a   : gpr_read_data3[31:0] = reg_dout_26[31:0];
    5'h1b   : gpr_read_data3[31:0] = reg_dout_27[31:0];
    5'h1c   : gpr_read_data3[31:0] = reg_dout_28[31:0];
    5'h1d   : gpr_read_data3[31:0] = reg_dout_29[31:0];
    5'h1e   : gpr_read_data3[31:0] = reg_dout_30[31:0];
    5'h1f   : gpr_read_data3[31:0] = reg_dout_31[31:0];
    default : gpr_read_data3[31:0] = {32{1'bx}};
  endcase
// &CombEnd; @747
end

// Read Port 4 for rs4
// &CombBeg; @750
always @( reg_dout_4[31:0]
       or reg_dout_7[31:0]
       or reg_dout_3[31:0]
       or reg_dout_30[31:0]
       or reg_dout_5[31:0]
       or reg_dout_20[31:0]
       or reg_dout_22[31:0]
       or reg_dout_8[31:0]
       or reg_dout_28[31:0]
       or reg_dout_27[31:0]
       or reg_dout_12[31:0]
       or reg_dout_23[31:0]
       or reg_dout_19[31:0]
       or reg_dout_15[31:0]
       or decd_gpr_rs4[4:0]
       or reg_dout_2[31:0]
       or reg_dout_6[31:0]
       or reg_dout_1[31:0]
       or reg_dout_10[31:0]
       or reg_dout_26[31:0]
       or reg_dout_11[31:0]
       or reg_dout_18[31:0]
       or reg_dout_17[31:0]
       or reg_dout_25[31:0]
       or reg_dout_24[31:0]
       or reg_dout_31[31:0]
       or reg_dout_16[31:0]
       or reg_dout_21[31:0]
       or reg_dout_14[31:0]
       or reg_dout_29[31:0]
       or reg_dout_9[31:0]
       or reg_dout_13[31:0])
begin
  case(decd_gpr_rs4[4:0])
    5'h00   : gpr_read_data4[31:0] = {32{1'b0}};
    5'h01   : gpr_read_data4[31:0] = reg_dout_1[31:0];
    5'h02   : gpr_read_data4[31:0] = reg_dout_2[31:0];
    5'h03   : gpr_read_data4[31:0] = reg_dout_3[31:0];
    5'h04   : gpr_read_data4[31:0] = reg_dout_4[31:0];
    5'h05   : gpr_read_data4[31:0] = reg_dout_5[31:0];
    5'h06   : gpr_read_data4[31:0] = reg_dout_6[31:0];
    5'h07   : gpr_read_data4[31:0] = reg_dout_7[31:0];
    5'h08   : gpr_read_data4[31:0] = reg_dout_8[31:0];
    5'h09   : gpr_read_data4[31:0] = reg_dout_9[31:0];
    5'h0a   : gpr_read_data4[31:0] = reg_dout_10[31:0];
    5'h0b   : gpr_read_data4[31:0] = reg_dout_11[31:0];
    5'h0c   : gpr_read_data4[31:0] = reg_dout_12[31:0];
    5'h0d   : gpr_read_data4[31:0] = reg_dout_13[31:0];
    5'h0e   : gpr_read_data4[31:0] = reg_dout_14[31:0];
    5'h0f   : gpr_read_data4[31:0] = reg_dout_15[31:0];
    5'h10   : gpr_read_data4[31:0] = reg_dout_16[31:0];
    5'h11   : gpr_read_data4[31:0] = reg_dout_17[31:0];
    5'h12   : gpr_read_data4[31:0] = reg_dout_18[31:0];
    5'h13   : gpr_read_data4[31:0] = reg_dout_19[31:0];
    5'h14   : gpr_read_data4[31:0] = reg_dout_20[31:0];
    5'h15   : gpr_read_data4[31:0] = reg_dout_21[31:0];
    5'h16   : gpr_read_data4[31:0] = reg_dout_22[31:0];
    5'h17   : gpr_read_data4[31:0] = reg_dout_23[31:0];
    5'h18   : gpr_read_data4[31:0] = reg_dout_24[31:0];
    5'h19   : gpr_read_data4[31:0] = reg_dout_25[31:0];
    5'h1a   : gpr_read_data4[31:0] = reg_dout_26[31:0];
    5'h1b   : gpr_read_data4[31:0] = reg_dout_27[31:0];
    5'h1c   : gpr_read_data4[31:0] = reg_dout_28[31:0];
    5'h1d   : gpr_read_data4[31:0] = reg_dout_29[31:0];
    5'h1e   : gpr_read_data4[31:0] = reg_dout_30[31:0];
    5'h1f   : gpr_read_data4[31:0] = reg_dout_31[31:0];
    default : gpr_read_data4[31:0] = {32{1'bx}};
  endcase
// &CombEnd; @786
end

//assign gpr_rs1_dep_wb_lsu = decd_gpr_rs1[5:0] == write_index1[5:0]
//                     & decd_gpr_rs1[5:0] != 6'b0
//                     & rtu_idu_wb1_vld;
//assign gpr_rs2_dep_wb_lsu = decd_gpr_rs2[5:0] == write_index1[5:0]
//                     & decd_gpr_rs2[5:0] != 6'b0
//                     & rtu_idu_wb1_vld;
//assign gpr_rs3_dep_wb_lsu = decd_gpr_rs3[5:0] == write_index1[5:0]
//                     & decd_gpr_rs3[5:0] != 6'b0
//                     & rtu_idu_wb1_vld;
//assign gpr_rs4_dep_wb_lsu = decd_gpr_rs4[5:0] == write_index1[5:0]
//                     & decd_gpr_rs4[5:0] != 6'b0
//                     & rtu_idu_wb1_vld;
//
//assign gpr_rs1_dep_wb_rbus = decd_gpr_rs1[5:0] == rtu_idu_wb0_preg[5:0]
//                          & decd_gpr_rs1[5:0] != 6'b0
//                          & rtu_idu_wb0_vld;
//assign gpr_rs2_dep_wb_rbus = decd_gpr_rs2[5:0] == rtu_idu_wb0_preg[5:0]
//                          & decd_gpr_rs2[5:0] != 6'b0
//                          & rtu_idu_wb0_vld;
//assign gpr_rs3_dep_wb_rbus = decd_gpr_rs3[5:0] == rtu_idu_wb0_preg[5:0]
//                          & decd_gpr_rs3[5:0] != 6'b0
//                          & rtu_idu_wb0_vld;
//assign gpr_rs4_dep_wb_rbus = decd_gpr_rs4[5:0] == rtu_idu_wb0_preg[5:0]
//                          & decd_gpr_rs4[5:0] != 6'b0
//                          & rtu_idu_wb0_vld;
//
//assign gpr_rs1_dep_wb = gpr_rs1_dep_wb_lsu | gpr_rs1_dep_wb_rbus;
//assign gpr_rs2_dep_wb = gpr_rs2_dep_wb_lsu | gpr_rs2_dep_wb_rbus;
//assign gpr_rs3_dep_wb = gpr_rs3_dep_wb_lsu | gpr_rs3_dep_wb_rbus;
//assign gpr_rs4_dep_wb = gpr_rs3_dep_wb_lsu | gpr_rs4_dep_wb_rbus;


//-----------------------------------------------
// 4. Reg Busy Judge
//-----------------------------------------------
parameter IDLE      = 3'b000;
parameter BUSY1     = 3'b001;
parameter BUSY_LSU1 = 3'b010;
parameter BUSY_DIV1 = 3'b011;
parameter BUSY2     = 3'b100;
parameter BUSY_LSU2 = 3'b110;
parameter BUSY_DIV2 = 3'b111;

// &CombBeg; @831
always @( reg_busy_st_19[2:0]
       or reg_busy_st_31[2:0]
       or reg_busy_st_9[2:0]
       or decd_gpr_dep_rs1[5:0]
       or reg_busy_st_21[2:0]
       or reg_busy_st_16[2:0]
       or reg_busy_st_14[2:0]
       or reg_busy_st_33[2:0]
       or reg_busy_st_25[2:0]
       or reg_busy_st_15[2:0]
       or reg_busy_st_26[2:0]
       or reg_busy_st_20[2:0]
       or reg_busy_st_17[2:0]
       or reg_busy_st_1[2:0]
       or reg_busy_st_32[2:0]
       or reg_busy_st_18[2:0]
       or reg_busy_st_5[2:0]
       or reg_busy_st_22[2:0]
       or reg_busy_st_27[2:0]
       or reg_busy_st_29[2:0]
       or reg_busy_st_13[2:0]
       or reg_busy_st_24[2:0]
       or reg_busy_st_23[2:0]
       or reg_busy_st_2[2:0]
       or reg_busy_st_30[2:0]
       or reg_busy_st_7[2:0]
       or reg_busy_st_6[2:0]
       or reg_busy_st_28[2:0]
       or reg_busy_st_10[2:0]
       or reg_busy_st_11[2:0]
       or reg_busy_st_8[2:0]
       or reg_busy_st_3[2:0]
       or reg_busy_st_4[2:0]
       or reg_busy_st_12[2:0])
begin
case(decd_gpr_dep_rs1[5:0])
    6'h00   : gpr_rs1_busy_st[2:0] = {3{1'b0}};
    6'h01   : gpr_rs1_busy_st[2:0] = reg_busy_st_1[2:0];
    6'h02   : gpr_rs1_busy_st[2:0] = reg_busy_st_2[2:0];
    6'h03   : gpr_rs1_busy_st[2:0] = reg_busy_st_3[2:0];
    6'h04   : gpr_rs1_busy_st[2:0] = reg_busy_st_4[2:0];
    6'h05   : gpr_rs1_busy_st[2:0] = reg_busy_st_5[2:0];
    6'h06   : gpr_rs1_busy_st[2:0] = reg_busy_st_6[2:0];
    6'h07   : gpr_rs1_busy_st[2:0] = reg_busy_st_7[2:0];
    6'h08   : gpr_rs1_busy_st[2:0] = reg_busy_st_8[2:0];
    6'h09   : gpr_rs1_busy_st[2:0] = reg_busy_st_9[2:0];
    6'h0a   : gpr_rs1_busy_st[2:0] = reg_busy_st_10[2:0];
    6'h0b   : gpr_rs1_busy_st[2:0] = reg_busy_st_11[2:0];
    6'h0c   : gpr_rs1_busy_st[2:0] = reg_busy_st_12[2:0];
    6'h0d   : gpr_rs1_busy_st[2:0] = reg_busy_st_13[2:0];
    6'h0e   : gpr_rs1_busy_st[2:0] = reg_busy_st_14[2:0];
    6'h0f   : gpr_rs1_busy_st[2:0] = reg_busy_st_15[2:0];
    6'h10   : gpr_rs1_busy_st[2:0] = reg_busy_st_16[2:0];
    6'h11   : gpr_rs1_busy_st[2:0] = reg_busy_st_17[2:0];
    6'h12   : gpr_rs1_busy_st[2:0] = reg_busy_st_18[2:0];
    6'h13   : gpr_rs1_busy_st[2:0] = reg_busy_st_19[2:0];
    6'h14   : gpr_rs1_busy_st[2:0] = reg_busy_st_20[2:0];
    6'h15   : gpr_rs1_busy_st[2:0] = reg_busy_st_21[2:0];
    6'h16   : gpr_rs1_busy_st[2:0] = reg_busy_st_22[2:0];
    6'h17   : gpr_rs1_busy_st[2:0] = reg_busy_st_23[2:0];
    6'h18   : gpr_rs1_busy_st[2:0] = reg_busy_st_24[2:0];
    6'h19   : gpr_rs1_busy_st[2:0] = reg_busy_st_25[2:0];
    6'h1a   : gpr_rs1_busy_st[2:0] = reg_busy_st_26[2:0];
    6'h1b   : gpr_rs1_busy_st[2:0] = reg_busy_st_27[2:0];
    6'h1c   : gpr_rs1_busy_st[2:0] = reg_busy_st_28[2:0];
    6'h1d   : gpr_rs1_busy_st[2:0] = reg_busy_st_29[2:0];
    6'h1e   : gpr_rs1_busy_st[2:0] = reg_busy_st_30[2:0];
    6'h1f   : gpr_rs1_busy_st[2:0] = reg_busy_st_31[2:0];
    6'h20   : gpr_rs1_busy_st[2:0] = reg_busy_st_32[2:0];
    6'h21   : gpr_rs1_busy_st[2:0] = reg_busy_st_33[2:0];
    default : gpr_rs1_busy_st[2:0] = {3{1'bx}};
endcase
// &CombEnd; @869
end

// &CombBeg; @871
always @( reg_busy_st_19[2:0]
       or reg_busy_st_31[2:0]
       or reg_busy_st_9[2:0]
       or reg_busy_st_21[2:0]
       or decd_gpr_dep_rs2[5:0]
       or reg_busy_st_16[2:0]
       or reg_busy_st_14[2:0]
       or reg_busy_st_33[2:0]
       or reg_busy_st_25[2:0]
       or reg_busy_st_15[2:0]
       or reg_busy_st_26[2:0]
       or reg_busy_st_20[2:0]
       or reg_busy_st_17[2:0]
       or reg_busy_st_1[2:0]
       or reg_busy_st_32[2:0]
       or reg_busy_st_18[2:0]
       or reg_busy_st_5[2:0]
       or reg_busy_st_22[2:0]
       or reg_busy_st_27[2:0]
       or reg_busy_st_29[2:0]
       or reg_busy_st_13[2:0]
       or reg_busy_st_24[2:0]
       or reg_busy_st_23[2:0]
       or reg_busy_st_2[2:0]
       or reg_busy_st_30[2:0]
       or reg_busy_st_7[2:0]
       or reg_busy_st_6[2:0]
       or reg_busy_st_28[2:0]
       or reg_busy_st_10[2:0]
       or reg_busy_st_11[2:0]
       or reg_busy_st_8[2:0]
       or reg_busy_st_3[2:0]
       or reg_busy_st_4[2:0]
       or reg_busy_st_12[2:0])
begin
case(decd_gpr_dep_rs2[5:0])
    6'h00   : gpr_rs2_busy_st[2:0] = {3{1'b0}};
    6'h01   : gpr_rs2_busy_st[2:0] = reg_busy_st_1[2:0];
    6'h02   : gpr_rs2_busy_st[2:0] = reg_busy_st_2[2:0];
    6'h03   : gpr_rs2_busy_st[2:0] = reg_busy_st_3[2:0];
    6'h04   : gpr_rs2_busy_st[2:0] = reg_busy_st_4[2:0];
    6'h05   : gpr_rs2_busy_st[2:0] = reg_busy_st_5[2:0];
    6'h06   : gpr_rs2_busy_st[2:0] = reg_busy_st_6[2:0];
    6'h07   : gpr_rs2_busy_st[2:0] = reg_busy_st_7[2:0];
    6'h08   : gpr_rs2_busy_st[2:0] = reg_busy_st_8[2:0];
    6'h09   : gpr_rs2_busy_st[2:0] = reg_busy_st_9[2:0];
    6'h0a   : gpr_rs2_busy_st[2:0] = reg_busy_st_10[2:0];
    6'h0b   : gpr_rs2_busy_st[2:0] = reg_busy_st_11[2:0];
    6'h0c   : gpr_rs2_busy_st[2:0] = reg_busy_st_12[2:0];
    6'h0d   : gpr_rs2_busy_st[2:0] = reg_busy_st_13[2:0];
    6'h0e   : gpr_rs2_busy_st[2:0] = reg_busy_st_14[2:0];
    6'h0f   : gpr_rs2_busy_st[2:0] = reg_busy_st_15[2:0];
    6'h10   : gpr_rs2_busy_st[2:0] = reg_busy_st_16[2:0];
    6'h11   : gpr_rs2_busy_st[2:0] = reg_busy_st_17[2:0];
    6'h12   : gpr_rs2_busy_st[2:0] = reg_busy_st_18[2:0];
    6'h13   : gpr_rs2_busy_st[2:0] = reg_busy_st_19[2:0];
    6'h14   : gpr_rs2_busy_st[2:0] = reg_busy_st_20[2:0];
    6'h15   : gpr_rs2_busy_st[2:0] = reg_busy_st_21[2:0];
    6'h16   : gpr_rs2_busy_st[2:0] = reg_busy_st_22[2:0];
    6'h17   : gpr_rs2_busy_st[2:0] = reg_busy_st_23[2:0];
    6'h18   : gpr_rs2_busy_st[2:0] = reg_busy_st_24[2:0];
    6'h19   : gpr_rs2_busy_st[2:0] = reg_busy_st_25[2:0];
    6'h1a   : gpr_rs2_busy_st[2:0] = reg_busy_st_26[2:0];
    6'h1b   : gpr_rs2_busy_st[2:0] = reg_busy_st_27[2:0];
    6'h1c   : gpr_rs2_busy_st[2:0] = reg_busy_st_28[2:0];
    6'h1d   : gpr_rs2_busy_st[2:0] = reg_busy_st_29[2:0];
    6'h1e   : gpr_rs2_busy_st[2:0] = reg_busy_st_30[2:0];
    6'h1f   : gpr_rs2_busy_st[2:0] = reg_busy_st_31[2:0];
    6'h20   : gpr_rs2_busy_st[2:0] = reg_busy_st_32[2:0];
    6'h21   : gpr_rs2_busy_st[2:0] = reg_busy_st_33[2:0];
    default : gpr_rs2_busy_st[2:0] = {3{1'bx}};
endcase
// &CombEnd; @909
end

// &CombBeg; @911
always @( reg_busy_st_19[2:0]
       or reg_busy_st_31[2:0]
       or reg_busy_st_9[2:0]
       or reg_busy_st_21[2:0]
       or decd_gpr_rs3[5:0]
       or reg_busy_st_16[2:0]
       or reg_busy_st_14[2:0]
       or reg_busy_st_33[2:0]
       or reg_busy_st_25[2:0]
       or reg_busy_st_15[2:0]
       or reg_busy_st_26[2:0]
       or reg_busy_st_20[2:0]
       or reg_busy_st_17[2:0]
       or reg_busy_st_1[2:0]
       or reg_busy_st_32[2:0]
       or reg_busy_st_18[2:0]
       or reg_busy_st_5[2:0]
       or reg_busy_st_22[2:0]
       or reg_busy_st_27[2:0]
       or reg_busy_st_29[2:0]
       or reg_busy_st_13[2:0]
       or reg_busy_st_24[2:0]
       or reg_busy_st_23[2:0]
       or reg_busy_st_2[2:0]
       or reg_busy_st_30[2:0]
       or reg_busy_st_7[2:0]
       or reg_busy_st_6[2:0]
       or reg_busy_st_28[2:0]
       or reg_busy_st_10[2:0]
       or reg_busy_st_11[2:0]
       or reg_busy_st_8[2:0]
       or reg_busy_st_3[2:0]
       or reg_busy_st_4[2:0]
       or reg_busy_st_12[2:0])
begin
case(decd_gpr_rs3[5:0])
    6'h00   : gpr_rs3_busy_st[2:0] = {3{1'b0}};
    6'h01   : gpr_rs3_busy_st[2:0] = reg_busy_st_1[2:0];
    6'h02   : gpr_rs3_busy_st[2:0] = reg_busy_st_2[2:0];
    6'h03   : gpr_rs3_busy_st[2:0] = reg_busy_st_3[2:0];
    6'h04   : gpr_rs3_busy_st[2:0] = reg_busy_st_4[2:0];
    6'h05   : gpr_rs3_busy_st[2:0] = reg_busy_st_5[2:0];
    6'h06   : gpr_rs3_busy_st[2:0] = reg_busy_st_6[2:0];
    6'h07   : gpr_rs3_busy_st[2:0] = reg_busy_st_7[2:0];
    6'h08   : gpr_rs3_busy_st[2:0] = reg_busy_st_8[2:0];
    6'h09   : gpr_rs3_busy_st[2:0] = reg_busy_st_9[2:0];
    6'h0a   : gpr_rs3_busy_st[2:0] = reg_busy_st_10[2:0];
    6'h0b   : gpr_rs3_busy_st[2:0] = reg_busy_st_11[2:0];
    6'h0c   : gpr_rs3_busy_st[2:0] = reg_busy_st_12[2:0];
    6'h0d   : gpr_rs3_busy_st[2:0] = reg_busy_st_13[2:0];
    6'h0e   : gpr_rs3_busy_st[2:0] = reg_busy_st_14[2:0];
    6'h0f   : gpr_rs3_busy_st[2:0] = reg_busy_st_15[2:0];
    6'h10   : gpr_rs3_busy_st[2:0] = reg_busy_st_16[2:0];
    6'h11   : gpr_rs3_busy_st[2:0] = reg_busy_st_17[2:0];
    6'h12   : gpr_rs3_busy_st[2:0] = reg_busy_st_18[2:0];
    6'h13   : gpr_rs3_busy_st[2:0] = reg_busy_st_19[2:0];
    6'h14   : gpr_rs3_busy_st[2:0] = reg_busy_st_20[2:0];
    6'h15   : gpr_rs3_busy_st[2:0] = reg_busy_st_21[2:0];
    6'h16   : gpr_rs3_busy_st[2:0] = reg_busy_st_22[2:0];
    6'h17   : gpr_rs3_busy_st[2:0] = reg_busy_st_23[2:0];
    6'h18   : gpr_rs3_busy_st[2:0] = reg_busy_st_24[2:0];
    6'h19   : gpr_rs3_busy_st[2:0] = reg_busy_st_25[2:0];
    6'h1a   : gpr_rs3_busy_st[2:0] = reg_busy_st_26[2:0];
    6'h1b   : gpr_rs3_busy_st[2:0] = reg_busy_st_27[2:0];
    6'h1c   : gpr_rs3_busy_st[2:0] = reg_busy_st_28[2:0];
    6'h1d   : gpr_rs3_busy_st[2:0] = reg_busy_st_29[2:0];
    6'h1e   : gpr_rs3_busy_st[2:0] = reg_busy_st_30[2:0];
    6'h1f   : gpr_rs3_busy_st[2:0] = reg_busy_st_31[2:0];
    6'h20   : gpr_rs3_busy_st[2:0] = reg_busy_st_32[2:0];
    6'h21   : gpr_rs3_busy_st[2:0] = reg_busy_st_33[2:0];
    default : gpr_rs3_busy_st[2:0] = {3{1'bx}};
endcase
// &CombEnd; @949
end

// &CombBeg; @951
always @( reg_busy_st_19[2:0]
       or reg_busy_st_31[2:0]
       or reg_busy_st_9[2:0]
       or reg_busy_st_21[2:0]
       or reg_busy_st_16[2:0]
       or reg_busy_st_14[2:0]
       or reg_busy_st_33[2:0]
       or reg_busy_st_25[2:0]
       or reg_busy_st_15[2:0]
       or reg_busy_st_26[2:0]
       or reg_busy_st_20[2:0]
       or reg_busy_st_17[2:0]
       or reg_busy_st_1[2:0]
       or reg_busy_st_32[2:0]
       or reg_busy_st_18[2:0]
       or reg_busy_st_5[2:0]
       or reg_busy_st_22[2:0]
       or reg_busy_st_27[2:0]
       or reg_busy_st_29[2:0]
       or reg_busy_st_13[2:0]
       or reg_busy_st_24[2:0]
       or reg_busy_st_23[2:0]
       or reg_busy_st_2[2:0]
       or reg_busy_st_30[2:0]
       or reg_busy_st_7[2:0]
       or decd_gpr_rs4[5:0]
       or reg_busy_st_6[2:0]
       or reg_busy_st_28[2:0]
       or reg_busy_st_10[2:0]
       or reg_busy_st_11[2:0]
       or reg_busy_st_8[2:0]
       or reg_busy_st_3[2:0]
       or reg_busy_st_4[2:0]
       or reg_busy_st_12[2:0])
begin
case(decd_gpr_rs4[5:0])
    6'h00   : gpr_rs4_busy_st[2:0] = {3{1'b0}};
    6'h01   : gpr_rs4_busy_st[2:0] = reg_busy_st_1[2:0];
    6'h02   : gpr_rs4_busy_st[2:0] = reg_busy_st_2[2:0];
    6'h03   : gpr_rs4_busy_st[2:0] = reg_busy_st_3[2:0];
    6'h04   : gpr_rs4_busy_st[2:0] = reg_busy_st_4[2:0];
    6'h05   : gpr_rs4_busy_st[2:0] = reg_busy_st_5[2:0];
    6'h06   : gpr_rs4_busy_st[2:0] = reg_busy_st_6[2:0];
    6'h07   : gpr_rs4_busy_st[2:0] = reg_busy_st_7[2:0];
    6'h08   : gpr_rs4_busy_st[2:0] = reg_busy_st_8[2:0];
    6'h09   : gpr_rs4_busy_st[2:0] = reg_busy_st_9[2:0];
    6'h0a   : gpr_rs4_busy_st[2:0] = reg_busy_st_10[2:0];
    6'h0b   : gpr_rs4_busy_st[2:0] = reg_busy_st_11[2:0];
    6'h0c   : gpr_rs4_busy_st[2:0] = reg_busy_st_12[2:0];
    6'h0d   : gpr_rs4_busy_st[2:0] = reg_busy_st_13[2:0];
    6'h0e   : gpr_rs4_busy_st[2:0] = reg_busy_st_14[2:0];
    6'h0f   : gpr_rs4_busy_st[2:0] = reg_busy_st_15[2:0];
    6'h10   : gpr_rs4_busy_st[2:0] = reg_busy_st_16[2:0];
    6'h11   : gpr_rs4_busy_st[2:0] = reg_busy_st_17[2:0];
    6'h12   : gpr_rs4_busy_st[2:0] = reg_busy_st_18[2:0];
    6'h13   : gpr_rs4_busy_st[2:0] = reg_busy_st_19[2:0];
    6'h14   : gpr_rs4_busy_st[2:0] = reg_busy_st_20[2:0];
    6'h15   : gpr_rs4_busy_st[2:0] = reg_busy_st_21[2:0];
    6'h16   : gpr_rs4_busy_st[2:0] = reg_busy_st_22[2:0];
    6'h17   : gpr_rs4_busy_st[2:0] = reg_busy_st_23[2:0];
    6'h18   : gpr_rs4_busy_st[2:0] = reg_busy_st_24[2:0];
    6'h19   : gpr_rs4_busy_st[2:0] = reg_busy_st_25[2:0];
    6'h1a   : gpr_rs4_busy_st[2:0] = reg_busy_st_26[2:0];
    6'h1b   : gpr_rs4_busy_st[2:0] = reg_busy_st_27[2:0];
    6'h1c   : gpr_rs4_busy_st[2:0] = reg_busy_st_28[2:0];
    6'h1d   : gpr_rs4_busy_st[2:0] = reg_busy_st_29[2:0];
    6'h1e   : gpr_rs4_busy_st[2:0] = reg_busy_st_30[2:0];
    6'h1f   : gpr_rs4_busy_st[2:0] = reg_busy_st_31[2:0];
    6'h20   : gpr_rs4_busy_st[2:0] = reg_busy_st_32[2:0];
    6'h21   : gpr_rs4_busy_st[2:0] = reg_busy_st_33[2:0];
    default : gpr_rs4_busy_st[2:0] = {3{1'bx}};
endcase
// &CombEnd; @989
end

// &CombBeg; @991
always @( reg_busy_st_19[2:0]
       or reg_busy_st_31[2:0]
       or reg_busy_st_9[2:0]
       or reg_busy_st_21[2:0]
       or reg_busy_st_16[2:0]
       or reg_busy_st_14[2:0]
       or reg_busy_st_33[2:0]
       or reg_busy_st_25[2:0]
       or reg_busy_st_15[2:0]
       or reg_busy_st_26[2:0]
       or reg_busy_st_20[2:0]
       or reg_busy_st_17[2:0]
       or reg_busy_st_1[2:0]
       or reg_busy_st_32[2:0]
       or reg_busy_st_18[2:0]
       or reg_busy_st_5[2:0]
       or reg_busy_st_22[2:0]
       or reg_busy_st_27[2:0]
       or reg_busy_st_29[2:0]
       or reg_busy_st_13[2:0]
       or reg_busy_st_24[2:0]
       or reg_busy_st_23[2:0]
       or reg_busy_st_2[2:0]
       or reg_busy_st_30[2:0]
       or reg_busy_st_7[2:0]
       or reg_busy_st_6[2:0]
       or reg_busy_st_28[2:0]
       or ctrl_gpr_id_wr_idx1[5:0]
       or reg_busy_st_10[2:0]
       or reg_busy_st_11[2:0]
       or reg_busy_st_8[2:0]
       or reg_busy_st_3[2:0]
       or reg_busy_st_4[2:0]
       or reg_busy_st_12[2:0])
begin
case(ctrl_gpr_id_wr_idx1[5:0])
    6'h00   : gpr_rd1_busy_st[2:0] = {3{1'b0}};
    6'h01   : gpr_rd1_busy_st[2:0] = reg_busy_st_1[2:0];
    6'h02   : gpr_rd1_busy_st[2:0] = reg_busy_st_2[2:0];
    6'h03   : gpr_rd1_busy_st[2:0] = reg_busy_st_3[2:0];
    6'h04   : gpr_rd1_busy_st[2:0] = reg_busy_st_4[2:0];
    6'h05   : gpr_rd1_busy_st[2:0] = reg_busy_st_5[2:0];
    6'h06   : gpr_rd1_busy_st[2:0] = reg_busy_st_6[2:0];
    6'h07   : gpr_rd1_busy_st[2:0] = reg_busy_st_7[2:0];
    6'h08   : gpr_rd1_busy_st[2:0] = reg_busy_st_8[2:0];
    6'h09   : gpr_rd1_busy_st[2:0] = reg_busy_st_9[2:0];
    6'h0a   : gpr_rd1_busy_st[2:0] = reg_busy_st_10[2:0];
    6'h0b   : gpr_rd1_busy_st[2:0] = reg_busy_st_11[2:0];
    6'h0c   : gpr_rd1_busy_st[2:0] = reg_busy_st_12[2:0];
    6'h0d   : gpr_rd1_busy_st[2:0] = reg_busy_st_13[2:0];
    6'h0e   : gpr_rd1_busy_st[2:0] = reg_busy_st_14[2:0];
    6'h0f   : gpr_rd1_busy_st[2:0] = reg_busy_st_15[2:0];
    6'h10   : gpr_rd1_busy_st[2:0] = reg_busy_st_16[2:0];
    6'h11   : gpr_rd1_busy_st[2:0] = reg_busy_st_17[2:0];
    6'h12   : gpr_rd1_busy_st[2:0] = reg_busy_st_18[2:0];
    6'h13   : gpr_rd1_busy_st[2:0] = reg_busy_st_19[2:0];
    6'h14   : gpr_rd1_busy_st[2:0] = reg_busy_st_20[2:0];
    6'h15   : gpr_rd1_busy_st[2:0] = reg_busy_st_21[2:0];
    6'h16   : gpr_rd1_busy_st[2:0] = reg_busy_st_22[2:0];
    6'h17   : gpr_rd1_busy_st[2:0] = reg_busy_st_23[2:0];
    6'h18   : gpr_rd1_busy_st[2:0] = reg_busy_st_24[2:0];
    6'h19   : gpr_rd1_busy_st[2:0] = reg_busy_st_25[2:0];
    6'h1a   : gpr_rd1_busy_st[2:0] = reg_busy_st_26[2:0];
    6'h1b   : gpr_rd1_busy_st[2:0] = reg_busy_st_27[2:0];
    6'h1c   : gpr_rd1_busy_st[2:0] = reg_busy_st_28[2:0];
    6'h1d   : gpr_rd1_busy_st[2:0] = reg_busy_st_29[2:0];
    6'h1e   : gpr_rd1_busy_st[2:0] = reg_busy_st_30[2:0];
    6'h1f   : gpr_rd1_busy_st[2:0] = reg_busy_st_31[2:0];
    6'h20   : gpr_rd1_busy_st[2:0] = reg_busy_st_32[2:0];
    6'h21   : gpr_rd1_busy_st[2:0] = reg_busy_st_33[2:0];
    default : gpr_rd1_busy_st[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1029
end

// &CombBeg; @1031
always @( reg_busy_st_19[2:0]
       or reg_busy_st_31[2:0]
       or reg_busy_st_9[2:0]
       or reg_busy_st_21[2:0]
       or reg_busy_st_16[2:0]
       or reg_busy_st_14[2:0]
       or reg_busy_st_33[2:0]
       or reg_busy_st_25[2:0]
       or reg_busy_st_15[2:0]
       or reg_busy_st_26[2:0]
       or reg_busy_st_20[2:0]
       or reg_busy_st_17[2:0]
       or reg_busy_st_1[2:0]
       or reg_busy_st_32[2:0]
       or reg_busy_st_18[2:0]
       or reg_busy_st_5[2:0]
       or reg_busy_st_22[2:0]
       or reg_busy_st_27[2:0]
       or reg_busy_st_29[2:0]
       or reg_busy_st_13[2:0]
       or ctrl_gpr_id_wr_idx2[5:0]
       or reg_busy_st_24[2:0]
       or reg_busy_st_23[2:0]
       or reg_busy_st_2[2:0]
       or reg_busy_st_30[2:0]
       or reg_busy_st_7[2:0]
       or reg_busy_st_6[2:0]
       or reg_busy_st_28[2:0]
       or reg_busy_st_10[2:0]
       or reg_busy_st_11[2:0]
       or reg_busy_st_8[2:0]
       or reg_busy_st_3[2:0]
       or reg_busy_st_4[2:0]
       or reg_busy_st_12[2:0])
begin
case(ctrl_gpr_id_wr_idx2[5:0])
    6'h00   : gpr_rd2_busy_st[2:0] = {3{1'b0}};
    6'h01   : gpr_rd2_busy_st[2:0] = reg_busy_st_1[2:0];
    6'h02   : gpr_rd2_busy_st[2:0] = reg_busy_st_2[2:0];
    6'h03   : gpr_rd2_busy_st[2:0] = reg_busy_st_3[2:0];
    6'h04   : gpr_rd2_busy_st[2:0] = reg_busy_st_4[2:0];
    6'h05   : gpr_rd2_busy_st[2:0] = reg_busy_st_5[2:0];
    6'h06   : gpr_rd2_busy_st[2:0] = reg_busy_st_6[2:0];
    6'h07   : gpr_rd2_busy_st[2:0] = reg_busy_st_7[2:0];
    6'h08   : gpr_rd2_busy_st[2:0] = reg_busy_st_8[2:0];
    6'h09   : gpr_rd2_busy_st[2:0] = reg_busy_st_9[2:0];
    6'h0a   : gpr_rd2_busy_st[2:0] = reg_busy_st_10[2:0];
    6'h0b   : gpr_rd2_busy_st[2:0] = reg_busy_st_11[2:0];
    6'h0c   : gpr_rd2_busy_st[2:0] = reg_busy_st_12[2:0];
    6'h0d   : gpr_rd2_busy_st[2:0] = reg_busy_st_13[2:0];
    6'h0e   : gpr_rd2_busy_st[2:0] = reg_busy_st_14[2:0];
    6'h0f   : gpr_rd2_busy_st[2:0] = reg_busy_st_15[2:0];
    6'h10   : gpr_rd2_busy_st[2:0] = reg_busy_st_16[2:0];
    6'h11   : gpr_rd2_busy_st[2:0] = reg_busy_st_17[2:0];
    6'h12   : gpr_rd2_busy_st[2:0] = reg_busy_st_18[2:0];
    6'h13   : gpr_rd2_busy_st[2:0] = reg_busy_st_19[2:0];
    6'h14   : gpr_rd2_busy_st[2:0] = reg_busy_st_20[2:0];
    6'h15   : gpr_rd2_busy_st[2:0] = reg_busy_st_21[2:0];
    6'h16   : gpr_rd2_busy_st[2:0] = reg_busy_st_22[2:0];
    6'h17   : gpr_rd2_busy_st[2:0] = reg_busy_st_23[2:0];
    6'h18   : gpr_rd2_busy_st[2:0] = reg_busy_st_24[2:0];
    6'h19   : gpr_rd2_busy_st[2:0] = reg_busy_st_25[2:0];
    6'h1a   : gpr_rd2_busy_st[2:0] = reg_busy_st_26[2:0];
    6'h1b   : gpr_rd2_busy_st[2:0] = reg_busy_st_27[2:0];
    6'h1c   : gpr_rd2_busy_st[2:0] = reg_busy_st_28[2:0];
    6'h1d   : gpr_rd2_busy_st[2:0] = reg_busy_st_29[2:0];
    6'h1e   : gpr_rd2_busy_st[2:0] = reg_busy_st_30[2:0];
    6'h1f   : gpr_rd2_busy_st[2:0] = reg_busy_st_31[2:0];
    6'h20   : gpr_rd2_busy_st[2:0] = reg_busy_st_32[2:0];
    6'h21   : gpr_rd2_busy_st[2:0] = reg_busy_st_33[2:0];
    default : gpr_rd2_busy_st[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1069
end

assign gpr_rd1_fwd_lsu = ctrl_gpr_id_wr_idx1[5:0] == lsu_idu_ex2_fwd_preg[5:0]
                       & ctrl_gpr_id_wr_idx1[5:0] != 6'b0
                       & lsu_idu_ex2_fwd_vld;
assign gpr_rd2_fwd_lsu = ctrl_gpr_id_wr_idx2[5:0] == lsu_idu_ex2_fwd_preg[5:0]
                       & ctrl_gpr_id_wr_idx2[5:0] != 6'b0
                       & lsu_idu_ex2_fwd_vld;
//assign gpr_rd1_fwd_rbus = ctrl_gpr_id_wr_idx1[5:0] == iu_idu_ex2_fwd_preg0[5:0]
//                       & ctrl_gpr_id_wr_idx1[5:0] != 6'b0
//                       & iu_idu_ex2_fwd_vld0;
//assign gpr_rd2_fwd_rbus = ctrl_gpr_id_wr_idx2[5:0] == iu_idu_ex2_fwd_preg0[5:0]
//                       & ctrl_gpr_id_wr_idx2[5:0] != 6'b0
//                       & iu_idu_ex2_fwd_vld0;
//assign gpr_rd1_hit_wb_lsu = ctrl_gpr_id_wr_idx1[5:0] == write_index1[5:0]
//                       & ctrl_gpr_id_wr_idx1[5:0] != 6'b0
//                       & rtu_idu_wb1_vld;
//assign gpr_rd1_hit_wb_rbus = ctrl_gpr_id_wr_idx1[5:0] == write_index0[5:0]
//                       & ctrl_gpr_id_wr_idx1[5:0] != 6'b0
//                       & rtu_idu_wb0_vld;
//assign gpr_rd2_hit_wb_lsu = ctrl_gpr_id_wr_idx2[5:0] == write_index1[5:0]
//                       & ctrl_gpr_id_wr_idx2[5:0] != 6'b0
//                       & rtu_idu_wb1_vld;
//assign gpr_rd2_hit_wb_rbus = ctrl_gpr_id_wr_idx2[5:0] == write_index0[5:0]
//                       & ctrl_gpr_id_wr_idx2[5:0] != 6'b0
//                       & rtu_idu_wb0_vld;

//assign gpr_rs1_busy = gpr_rs1_busy_st[2:0] == BUSY1 & ~gpr_rs1_dep_wb & ~dp_gpr_rs1_fwd
//                   | gpr_rs1_busy_st[2:0] == BUSY2 & ~gpr_rs1_dep_wb & ~dp_gpr_rs1_fwd;
//assign gpr_rs2_busy = gpr_rs2_busy_st[2:0] == BUSY1 & ~gpr_rs2_dep_wb & ~dp_gpr_rs2_fwd
//                   | gpr_rs2_busy_st[2:0] == BUSY2 & ~gpr_rs2_dep_wb & ~dp_gpr_rs2_fwd;
//assign gpr_rs3_busy = gpr_rs3_busy_st[2:0] == BUSY1 & ~gpr_rs3_dep_wb & ~dp_gpr_rs3_fwd
//                   | gpr_rs3_busy_st[2:0] == BUSY2 & ~gpr_rs3_dep_wb & ~dp_gpr_rs3_fwd;
//assign gpr_rs4_busy = gpr_rs4_busy_st[2:0] == BUSY1 & ~gpr_rs4_dep_wb & ~dp_gpr_rs4_fwd
//                   | gpr_rs4_busy_st[2:0] == BUSY2 & ~gpr_rs4_dep_wb & ~dp_gpr_rs4_fwd;
//assign gpr_rd1_busy  = gpr_rd1_busy_st[2:0] == BUSY2 & ~gpr_rd1_fwd_rbus;
//assign gpr_rd2_busy  = gpr_rd2_busy_st[2:0] == BUSY2 & ~gpr_rd2_fwd_rbus;

assign gpr_rs1_busy_lsu = gpr_rs1_busy_st[2:0] == BUSY_LSU1 & ~dp_gpr_rs1_fwd_lsu
                        | gpr_rs1_busy_st[2:0] == BUSY_LSU2;
assign gpr_rs2_busy_lsu = gpr_rs2_busy_st[2:0] == BUSY_LSU1 & ~dp_gpr_rs2_fwd_lsu
                        | gpr_rs2_busy_st[2:0] == BUSY_LSU2;
assign gpr_rs3_busy_lsu = gpr_rs3_busy_st[2:0] == BUSY_LSU1 & ~dp_gpr_rs3_fwd_lsu
                        | gpr_rs3_busy_st[2:0] == BUSY_LSU2;
assign gpr_rs4_busy_lsu = gpr_rs4_busy_st[2:0] == BUSY_LSU1 & ~dp_gpr_rs4_fwd_lsu
                        | gpr_rs4_busy_st[2:0] == BUSY_LSU2;
assign gpr_rd1_busy_lsu  = gpr_rd1_busy_st[2:0] == BUSY_LSU1 & ~ctrl_gpr_ld_inst & ~gpr_rd1_fwd_lsu
                       | gpr_rd1_busy_st[2:0] == BUSY_LSU2 & ~(ctrl_gpr_ld_inst & gpr_rd1_fwd_lsu);
assign gpr_rd2_busy_lsu  = gpr_rd2_busy_st[2:0] == BUSY_LSU1 & ~ctrl_gpr_ld_inst & ~gpr_rd2_fwd_lsu
                       | gpr_rd2_busy_st[2:0] == BUSY_LSU2 & ~(ctrl_gpr_ld_inst & gpr_rd2_fwd_lsu);

assign gpr_rs1_fwd_div[31:0] = reg_fwd_en0[31:0] >> decd_gpr_rs1[4:0];
assign gpr_rs2_fwd_div[31:0] = reg_fwd_en0[31:0] >> decd_gpr_rs2[4:0];
assign gpr_rs3_fwd_div[31:0] = reg_fwd_en0[31:0] >> decd_gpr_rs3[4:0];
assign gpr_rs4_fwd_div[31:0] = reg_fwd_en0[31:0] >> decd_gpr_rs4[4:0];
assign gpr_rd1_fwd_div[31:0] = reg_fwd_en0[31:0] >> ctrl_gpr_id_wr_idx1[4:0];
assign gpr_rd2_fwd_div[31:0] = reg_fwd_en0[31:0] >> ctrl_gpr_id_wr_idx2[4:0];

assign gpr_rs1_busy_div = gpr_rs1_busy_st[2:0] == BUSY_DIV1 & ~dp_gpr_rs1_fwd_div & ~gpr_rs1_fwd_div[0]
                       | gpr_rs1_busy_st[2:0] == BUSY_DIV2;
assign gpr_rs2_busy_div = gpr_rs2_busy_st[2:0] == BUSY_DIV1 & ~dp_gpr_rs2_fwd_div & ~gpr_rs2_fwd_div[0]
                       | gpr_rs2_busy_st[2:0] == BUSY_DIV2;
assign gpr_rs3_busy_div = gpr_rs3_busy_st[2:0] == BUSY_DIV1 & ~dp_gpr_rs3_fwd_div & ~gpr_rs3_fwd_div[0]
                       | gpr_rs3_busy_st[2:0] == BUSY_DIV2;
assign gpr_rs4_busy_div = gpr_rs4_busy_st[2:0] == BUSY_DIV1 & ~dp_gpr_rs4_fwd_div & ~gpr_rs4_fwd_div[0]
                       | gpr_rs4_busy_st[2:0] == BUSY_DIV2;
assign gpr_rd1_busy_div  = gpr_rd1_busy_st[2:0] == BUSY_DIV1 & ~gpr_rd1_fwd_div[0]
                       | gpr_rd1_busy_st[2:0] == BUSY_DIV2;
assign gpr_rd2_busy_div  = gpr_rd2_busy_st[2:0] == BUSY_DIV1 & ~gpr_rd2_fwd_div[0]
                       | gpr_rd2_busy_st[2:0] == BUSY_DIV2;

//==========================================================
//     Rename output information
//==========================================================
assign gpr_dp_rs1[31:0] = gpr_read_data1_after_hint[31:0];
assign gpr_dp_rs2[31:0] = gpr_read_data2_after_hint[31:0];
assign gpr_dp_rs3[31:0] = gpr_read_data3[31:0];
assign gpr_dp_rs4[31:0] = gpr_read_data4[31:0];
assign gpr_dp_id_x2_wr  = reg_write_is_gate0[2]
                        | ctrl_gpr_id_rd2_vld & ctrl_gpr_id_wr_idx2[5:0] == 6'h2;

//assign gpr_ctrl_rs1_busy     = gpr_rs1_busy & decd_gpr_rs1_vld;
//assign gpr_ctrl_rs2_busy     = gpr_rs2_busy & decd_gpr_rs2_vld;
//assign gpr_ctrl_rs3_busy     = gpr_rs3_busy & decd_gpr_rs3_vld;
//assign gpr_ctrl_rs4_busy     = gpr_rs4_busy & decd_gpr_rs4_vld;
//assign gpr_ctrl_rd1_busy     = gpr_rd1_busy & decd_gpr_rd1_vld;
//assign gpr_ctrl_rd2_busy     = gpr_rd2_busy & decd_gpr_rd2_vld;
assign gpr_ctrl_rs1_busy_lsu = gpr_rs1_busy_lsu & decd_gpr_rs1_vld;
assign gpr_ctrl_rs2_busy_lsu = gpr_rs2_busy_lsu & decd_gpr_rs2_vld;
assign gpr_ctrl_rs3_busy_lsu = gpr_rs3_busy_lsu & decd_gpr_rs3_vld;
assign gpr_ctrl_rs4_busy_lsu = gpr_rs4_busy_lsu & decd_gpr_rs4_vld;
assign gpr_ctrl_rd1_busy_lsu = gpr_rd1_busy_lsu & decd_gpr_rd1_vld;
assign gpr_ctrl_rd2_busy_lsu = gpr_rd2_busy_lsu & decd_gpr_rd2_vld;
assign gpr_ctrl_rs1_busy_div = gpr_rs1_busy_div & decd_gpr_rs1_vld;
assign gpr_ctrl_rs2_busy_div = gpr_rs2_busy_div & decd_gpr_rs2_vld;
assign gpr_ctrl_rs3_busy_div = gpr_rs3_busy_div & decd_gpr_rs3_vld;
assign gpr_ctrl_rs4_busy_div = gpr_rs4_busy_div & decd_gpr_rs4_vld;
assign gpr_ctrl_rd1_busy_div = gpr_rd1_busy_div & decd_gpr_rd1_vld;
assign gpr_ctrl_rd2_busy_div = gpr_rd2_busy_div & decd_gpr_rd2_vld;
assign gpr_ctrl_rs1_busy_lsu2 = gpr_rs1_busy_st[2:0] == BUSY_LSU2;
assign gpr_ctrl_rs2_busy_lsu2 = gpr_rs2_busy_st[2:0] == BUSY_LSU2;
assign gpr_ctrl_rs3_busy_lsu2 = gpr_rs3_busy_st[2:0] == BUSY_LSU2;

assign gpr_hs_sp_wb          = gpr_wb_sp;
assign gpr_hs_sp_busy        = reg_busy_st_2[2:0] == BUSY_LSU1 & ~reg_fwd_en2[2]
                             | reg_busy_st_2[2:0] == BUSY_DIV1 & ~reg_fwd_en2[2] & ~fpu_fwd_sel0[2]
                             | reg_busy_st_2[2:0] == BUSY_LSU2
                             | reg_busy_st_2[2:0] == BUSY_DIV2 & ~(reg_fwd_en2[2] & fpu_fwd_sel0[2])
                             | dp_gpr_x2_busy;
assign gpr_hs_sp_busy2       = reg_busy_st_2[2:0] == BUSY_LSU1 & ~reg_fwd_en2[2] & dp_gpr_x2_busy
                             | reg_busy_st_2[2:0] == BUSY_LSU2 & ~reg_fwd_en2[2]
                             | dp_gpr_x2_busy2;

assign idu_ifu_x1[31:0]      = reg_dout_1[31:0];

assign idu_cp0_sp_reg[31:0]  = gpr_wb_sp ? reg_write_en1[2] ? rtu_idu_wb1_data[31:0] : rtu_idu_wb0_data[31:0]
                             : reg_dout_2[31:0];

assign idu_cp0_mepc_wen        = reg_write_en_hint1[0] & hs_gpr_wb_mask;
assign idu_cp0_mcause_wen      = reg_write_en_hint1[1] & hs_gpr_wb_mask;
assign idu_cp0_ipop_data[31:0] = rtu_idu_wb1_data[31:0];

// &ModuleEnd; @1191
endmodule


