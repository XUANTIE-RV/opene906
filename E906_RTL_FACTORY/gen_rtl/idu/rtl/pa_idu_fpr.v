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
module pa_idu_fpr(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_fpr_ex1_int_spec,
  decd_fp_fpr_rd,
  decd_fp_fpr_rd_vld,
  decd_fp_fpr_rs1,
  decd_fp_fpr_rs1_vld,
  decd_fp_fpr_rs2,
  decd_fp_fpr_rs2_vld,
  decd_fp_fpr_rs3,
  decd_fp_fpr_rs3_vld,
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
  fpr_top_reg_busy,
  fpr_top_reg_busy_div,
  fpr_top_reg_busy_lsu,
  id_fp_fpr_dst_freg,
  id_fp_fpr_id_dst_vld,
  id_fp_fpr_ld_inst,
  id_fp_fpr_wr_issue,
  ifu_idu_warm_up,
  pad_yy_icg_scan_en,
  rtu_idu_ex1_int_dis_stall_req,
  rtu_idu_fgpr_wb_data,
  rtu_idu_fgpr_wb_flsu_vld,
  rtu_idu_fgpr_wb_reg,
  rtu_idu_fgpr_wb_vld,
  rtu_idu_flush_fe,
  rtu_yy_xx_expt_int
);

// &Ports; @24
input           cp0_idu_icg_en;               
input           cp0_yy_clk_en;                
input           cpurst_b;                     
input           ctrl_fpr_ex1_int_spec;        
input   [4 :0]  decd_fp_fpr_rd;               
input           decd_fp_fpr_rd_vld;           
input   [4 :0]  decd_fp_fpr_rs1;              
input           decd_fp_fpr_rs1_vld;          
input   [4 :0]  decd_fp_fpr_rs2;              
input           decd_fp_fpr_rs2_vld;          
input   [4 :0]  decd_fp_fpr_rs3;              
input           decd_fp_fpr_rs3_vld;          
input           forever_cpuclk;               
input   [4 :0]  id_fp_fpr_dst_freg;           
input           id_fp_fpr_id_dst_vld;         
input           id_fp_fpr_ld_inst;            
input           id_fp_fpr_wr_issue;           
input           ifu_idu_warm_up;              
input           pad_yy_icg_scan_en;           
input           rtu_idu_ex1_int_dis_stall_req; 
input   [31:0]  rtu_idu_fgpr_wb_data;         
input           rtu_idu_fgpr_wb_flsu_vld;     
input   [4 :0]  rtu_idu_fgpr_wb_reg;          
input           rtu_idu_fgpr_wb_vld;          
input           rtu_idu_flush_fe;             
input           rtu_yy_xx_expt_int;           
output          fpr_id_fp_rd_busy;            
output          fpr_id_fp_rd_busy_lsu;        
output  [31:0]  fpr_id_fp_rs1;                
output          fpr_id_fp_rs1_busy;           
output          fpr_id_fp_rs1_busy_lsu;       
output  [31:0]  fpr_id_fp_rs2;                
output          fpr_id_fp_rs2_busy;           
output          fpr_id_fp_rs2_busy_lsu;       
output  [31:0]  fpr_id_fp_rs3;                
output          fpr_id_fp_rs3_busy;           
output          fpr_id_fp_rs3_busy_lsu;       
output  [31:0]  fpr_top_reg_busy;             
output  [31:0]  fpr_top_reg_busy_div;         
output  [31:0]  fpr_top_reg_busy_lsu;         

// &Regs; @25
reg     [31:0]  fpr_read_data1;               
reg     [31:0]  fpr_read_data2;               
reg     [31:0]  fpr_read_data3;               
reg     [31:0]  int_clr_sel;                  
reg     [31:0]  reg_issue;                    
reg     [31:0]  reg_sel;                      

// &Wires; @26
wire            cp0_idu_icg_en;               
wire            cp0_yy_clk_en;                
wire            cpurst_b;                     
wire            ctrl_fpr_ex1_int_spec;        
wire            ctrl_gpr_ld_inst;             
wire    [4 :0]  decd_fp_fpr_rd;               
wire            decd_fp_fpr_rd_vld;           
wire    [4 :0]  decd_fp_fpr_rs1;              
wire            decd_fp_fpr_rs1_vld;          
wire    [4 :0]  decd_fp_fpr_rs2;              
wire            decd_fp_fpr_rs2_vld;          
wire    [4 :0]  decd_fp_fpr_rs3;              
wire            decd_fp_fpr_rs3_vld;          
wire            forever_cpuclk;               
wire    [31:0]  fpr_busy_div1;                
wire    [31:0]  fpr_busy_div2;                
wire    [31:0]  fpr_busy_div3;                
wire    [31:0]  fpr_busy_divd;                
wire    [31:0]  fpr_busy_lsu1;                
wire    [31:0]  fpr_busy_lsu2;                
wire    [31:0]  fpr_busy_lsu3;                
wire    [31:0]  fpr_busy_lsud;                
wire    [31:0]  fpr_busy_rslt1;               
wire    [31:0]  fpr_busy_rslt2;               
wire    [31:0]  fpr_busy_rslt3;               
wire    [31:0]  fpr_busy_rsltd;               
wire            fpr_clk_en;                   
wire    [31:0]  fpr_fin_data1;                
wire    [31:0]  fpr_fin_data2;                
wire    [31:0]  fpr_fin_data3;                
wire            fpr_id_fp_rd_busy;            
wire            fpr_id_fp_rd_busy_div;        
wire            fpr_id_fp_rd_busy_lsu;        
wire    [31:0]  fpr_id_fp_rs1;                
wire            fpr_id_fp_rs1_busy;           
wire            fpr_id_fp_rs1_busy_div;       
wire            fpr_id_fp_rs1_busy_lsu;       
wire    [31:0]  fpr_id_fp_rs2;                
wire            fpr_id_fp_rs2_busy;           
wire            fpr_id_fp_rs2_busy_div;       
wire            fpr_id_fp_rs2_busy_lsu;       
wire    [31:0]  fpr_id_fp_rs3;                
wire            fpr_id_fp_rs3_busy;           
wire            fpr_id_fp_rs3_busy_div;       
wire            fpr_id_fp_rs3_busy_lsu;       
wire            fpr_rs1_dep_wb;               
wire            fpr_rs2_dep_wb;               
wire            fpr_rs3_dep_wb;               
wire            fpr_sync_rst_b;               
wire    [31:0]  fpr_top_reg_busy;             
wire    [31:0]  fpr_top_reg_busy_div;         
wire    [31:0]  fpr_top_reg_busy_lsu;         
wire    [4 :0]  id_fp_fpr_dst_freg;           
wire            id_fp_fpr_id_dst_vld;         
wire            id_fp_fpr_ld_inst;            
wire            id_fp_fpr_wr_issue;           
wire            ifu_idu_warm_up;              
wire    [33:0]  int_clr_en;                   
wire    [4 :0]  int_clr_idx;                  
wire            pad_yy_icg_scan_en;           
wire    [31:0]  reg_0_dout;                   
wire    [31:0]  reg_10_dout;                  
wire    [31:0]  reg_11_dout;                  
wire    [31:0]  reg_12_dout;                  
wire    [31:0]  reg_13_dout;                  
wire    [31:0]  reg_14_dout;                  
wire    [31:0]  reg_15_dout;                  
wire    [31:0]  reg_16_dout;                  
wire    [31:0]  reg_17_dout;                  
wire    [31:0]  reg_18_dout;                  
wire    [31:0]  reg_19_dout;                  
wire    [31:0]  reg_1_dout;                   
wire    [31:0]  reg_20_dout;                  
wire    [31:0]  reg_21_dout;                  
wire    [31:0]  reg_22_dout;                  
wire    [31:0]  reg_23_dout;                  
wire    [31:0]  reg_24_dout;                  
wire    [31:0]  reg_25_dout;                  
wire    [31:0]  reg_26_dout;                  
wire    [31:0]  reg_27_dout;                  
wire    [31:0]  reg_28_dout;                  
wire    [31:0]  reg_29_dout;                  
wire    [31:0]  reg_2_dout;                   
wire    [31:0]  reg_30_dout;                  
wire    [31:0]  reg_31_dout;                  
wire    [31:0]  reg_3_dout;                   
wire    [31:0]  reg_4_dout;                   
wire    [31:0]  reg_5_dout;                   
wire    [31:0]  reg_6_dout;                   
wire    [31:0]  reg_7_dout;                   
wire    [31:0]  reg_8_dout;                   
wire    [31:0]  reg_9_dout;                   
wire    [31:0]  reg_busy;                     
wire    [31:0]  reg_busy_div;                 
wire    [31:0]  reg_busy_lsu;                 
wire            reg_in_cpuclk;                
wire            reg_sm_clk_en;                
wire            reg_sm_cpuclk;                
wire    [31:0]  reg_write_en;                 
wire    [31:0]  reg_write_is;                 
wire            reg_write_is_gate;            
wire            rtu_idu_ex1_int_dis_stall_req; 
wire    [31:0]  rtu_idu_fgpr_wb_data;         
wire            rtu_idu_fgpr_wb_flsu_vld;     
wire    [4 :0]  rtu_idu_fgpr_wb_reg;          
wire            rtu_idu_fgpr_wb_vld;          
wire            rtu_idu_flush_fe;             
wire            rtu_yy_xx_expt_int;           
wire    [31:0]  write_data;                   
wire    [4 :0]  write_index;                  


//==========================================================
//              Integated Clock Gating Cell
//==========================================================
assign fpr_clk_en = rtu_idu_fgpr_wb_vld | ifu_idu_warm_up;
// &Instance("gated_clk_cell", "x_fpr_gated_clk"); @32
gated_clk_cell  x_fpr_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (reg_in_cpuclk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (fpr_clk_en        ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @33
//          .external_en (1'b0), @34
//          .global_en   (cp0_yy_clk_en), @35
//          .module_en ( cp0_idu_icg_en ) , @36
//          .local_en    (fpr_clk_en), @37
//          .clk_out     (reg_in_cpuclk)); @38

assign reg_sm_clk_en = reg_write_is_gate | rtu_idu_fgpr_wb_vld | rtu_idu_flush_fe | rtu_yy_xx_expt_int & ctrl_fpr_ex1_int_spec;
// &Instance("gated_clk_cell", "x_reg_sm_gated_clk"); @41
gated_clk_cell  x_reg_sm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (reg_sm_cpuclk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (reg_sm_clk_en     ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @42
//          .external_en (1'b0), @43
//          .global_en   (cp0_yy_clk_en), @44
//          .module_en ( cp0_idu_icg_en ) , @45
//          .local_en    (reg_sm_clk_en), @46
//          .clk_out     (reg_sm_cpuclk)); @47

parameter REG_WIDTH =`FLEN;
//=========================================================
// GRP Module
// 1. Instance all FPR modules
// 2. One write port
// 3. Three read ports
//=========================================================

//-----------------------------------------------
// 1. Instance all FPR modules
//-----------------------------------------------
// &ConnRule(s/_x$/[0]/); @60
// &Instance("pa_idu_reg", "x_pa_idu_freg_0"); @61
pa_idu_reg  x_pa_idu_freg_0 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[0]                ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[0]              ),
  .reg_busy_lsu_x                (reg_busy_lsu[0]              ),
  .reg_busy_x                    (reg_busy[0]                  ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[0]              ),
  .reg_write_is_x                (reg_write_is[0]              ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_0_dout                   )
);

// &Connect(.x_reg_dout (reg_0_dout)); @62

// &ConnRule(s/_x$/[1]/); @64
// &Instance("pa_idu_reg", "x_pa_idu_freg_1"); @65
pa_idu_reg  x_pa_idu_freg_1 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[1]                ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[1]              ),
  .reg_busy_lsu_x                (reg_busy_lsu[1]              ),
  .reg_busy_x                    (reg_busy[1]                  ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[1]              ),
  .reg_write_is_x                (reg_write_is[1]              ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_1_dout                   )
);

// &Connect(.x_reg_dout (reg_1_dout)); @66

// &ConnRule(s/_x$/[2]/); @68
// &Instance("pa_idu_reg", "x_pa_idu_freg_2"); @69
pa_idu_reg  x_pa_idu_freg_2 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[2]                ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[2]              ),
  .reg_busy_lsu_x                (reg_busy_lsu[2]              ),
  .reg_busy_x                    (reg_busy[2]                  ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[2]              ),
  .reg_write_is_x                (reg_write_is[2]              ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_2_dout                   )
);

// &Connect(.x_reg_dout (reg_2_dout)); @70

// &ConnRule(s/_x$/[3]/); @72
// &Instance("pa_idu_reg", "x_pa_idu_freg_3"); @73
pa_idu_reg  x_pa_idu_freg_3 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[3]                ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[3]              ),
  .reg_busy_lsu_x                (reg_busy_lsu[3]              ),
  .reg_busy_x                    (reg_busy[3]                  ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[3]              ),
  .reg_write_is_x                (reg_write_is[3]              ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_3_dout                   )
);

// &Connect(.x_reg_dout (reg_3_dout)); @74

// &ConnRule(s/_x$/[4]/); @76
// &Instance("pa_idu_reg", "x_pa_idu_freg_4"); @77
pa_idu_reg  x_pa_idu_freg_4 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[4]                ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[4]              ),
  .reg_busy_lsu_x                (reg_busy_lsu[4]              ),
  .reg_busy_x                    (reg_busy[4]                  ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[4]              ),
  .reg_write_is_x                (reg_write_is[4]              ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_4_dout                   )
);

// &Connect(.x_reg_dout (reg_4_dout)); @78

// &ConnRule(s/_x$/[5]/); @80
// &Instance("pa_idu_reg", "x_pa_idu_freg_5"); @81
pa_idu_reg  x_pa_idu_freg_5 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[5]                ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[5]              ),
  .reg_busy_lsu_x                (reg_busy_lsu[5]              ),
  .reg_busy_x                    (reg_busy[5]                  ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[5]              ),
  .reg_write_is_x                (reg_write_is[5]              ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_5_dout                   )
);

// &Connect(.x_reg_dout (reg_5_dout)); @82

// &ConnRule(s/_x$/[6]/); @84
// &Instance("pa_idu_reg", "x_pa_idu_freg_6"); @85
pa_idu_reg  x_pa_idu_freg_6 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[6]                ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[6]              ),
  .reg_busy_lsu_x                (reg_busy_lsu[6]              ),
  .reg_busy_x                    (reg_busy[6]                  ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[6]              ),
  .reg_write_is_x                (reg_write_is[6]              ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_6_dout                   )
);

// &Connect(.x_reg_dout (reg_6_dout)); @86

// &ConnRule(s/_x$/[7]/); @88
// &Instance("pa_idu_reg", "x_pa_idu_freg_7"); @89
pa_idu_reg  x_pa_idu_freg_7 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[7]                ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[7]              ),
  .reg_busy_lsu_x                (reg_busy_lsu[7]              ),
  .reg_busy_x                    (reg_busy[7]                  ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[7]              ),
  .reg_write_is_x                (reg_write_is[7]              ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_7_dout                   )
);

// &Connect(.x_reg_dout (reg_7_dout)); @90

// &ConnRule(s/_x$/[8]/); @92
// &Instance("pa_idu_reg", "x_pa_idu_freg_8"); @93
pa_idu_reg  x_pa_idu_freg_8 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[8]                ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[8]              ),
  .reg_busy_lsu_x                (reg_busy_lsu[8]              ),
  .reg_busy_x                    (reg_busy[8]                  ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[8]              ),
  .reg_write_is_x                (reg_write_is[8]              ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_8_dout                   )
);

// &Connect(.x_reg_dout (reg_8_dout)); @94

// &ConnRule(s/_x$/[9]/); @96
// &Instance("pa_idu_reg", "x_pa_idu_freg_9"); @97
pa_idu_reg  x_pa_idu_freg_9 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[9]                ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[9]              ),
  .reg_busy_lsu_x                (reg_busy_lsu[9]              ),
  .reg_busy_x                    (reg_busy[9]                  ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[9]              ),
  .reg_write_is_x                (reg_write_is[9]              ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_9_dout                   )
);

// &Connect(.x_reg_dout (reg_9_dout)); @98

// &ConnRule(s/_x$/[10]/); @100
// &Instance("pa_idu_reg", "x_pa_idu_freg_10"); @101
pa_idu_reg  x_pa_idu_freg_10 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[10]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[10]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[10]             ),
  .reg_busy_x                    (reg_busy[10]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[10]             ),
  .reg_write_is_x                (reg_write_is[10]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_10_dout                  )
);

// &Connect(.x_reg_dout (reg_10_dout)); @102

// &ConnRule(s/_x$/[11]/); @104
// &Instance("pa_idu_reg", "x_pa_idu_freg_11"); @105
pa_idu_reg  x_pa_idu_freg_11 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[11]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[11]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[11]             ),
  .reg_busy_x                    (reg_busy[11]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[11]             ),
  .reg_write_is_x                (reg_write_is[11]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_11_dout                  )
);

// &Connect(.x_reg_dout (reg_11_dout)); @106

// &ConnRule(s/_x$/[12]/); @108
// &Instance("pa_idu_reg", "x_pa_idu_freg_12"); @109
pa_idu_reg  x_pa_idu_freg_12 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[12]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[12]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[12]             ),
  .reg_busy_x                    (reg_busy[12]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[12]             ),
  .reg_write_is_x                (reg_write_is[12]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_12_dout                  )
);

// &Connect(.x_reg_dout (reg_12_dout)); @110

// &ConnRule(s/_x$/[13]/); @112
// &Instance("pa_idu_reg", "x_pa_idu_freg_13"); @113
pa_idu_reg  x_pa_idu_freg_13 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[13]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[13]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[13]             ),
  .reg_busy_x                    (reg_busy[13]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[13]             ),
  .reg_write_is_x                (reg_write_is[13]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_13_dout                  )
);

// &Connect(.x_reg_dout (reg_13_dout)); @114

// &ConnRule(s/_x$/[14]/); @116
// &Instance("pa_idu_reg", "x_pa_idu_freg_14"); @117
pa_idu_reg  x_pa_idu_freg_14 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[14]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[14]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[14]             ),
  .reg_busy_x                    (reg_busy[14]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[14]             ),
  .reg_write_is_x                (reg_write_is[14]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_14_dout                  )
);

// &Connect(.x_reg_dout (reg_14_dout)); @118

// &ConnRule(s/_x$/[15]/); @120
// &Instance("pa_idu_reg", "x_pa_idu_freg_15"); @121
pa_idu_reg  x_pa_idu_freg_15 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[15]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[15]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[15]             ),
  .reg_busy_x                    (reg_busy[15]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[15]             ),
  .reg_write_is_x                (reg_write_is[15]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_15_dout                  )
);

// &Connect(.x_reg_dout (reg_15_dout)); @122

// &ConnRule(s/_x$/[16]/); @124
// &Instance("pa_idu_reg", "x_pa_idu_freg_16"); @125
pa_idu_reg  x_pa_idu_freg_16 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[16]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[16]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[16]             ),
  .reg_busy_x                    (reg_busy[16]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[16]             ),
  .reg_write_is_x                (reg_write_is[16]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_16_dout                  )
);

// &Connect(.x_reg_dout (reg_16_dout)); @126

// &ConnRule(s/_x$/[17]/); @128
// &Instance("pa_idu_reg", "x_pa_idu_freg_17"); @129
pa_idu_reg  x_pa_idu_freg_17 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[17]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[17]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[17]             ),
  .reg_busy_x                    (reg_busy[17]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[17]             ),
  .reg_write_is_x                (reg_write_is[17]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_17_dout                  )
);

// &Connect(.x_reg_dout (reg_17_dout)); @130

// &ConnRule(s/_x$/[18]/); @132
// &Instance("pa_idu_reg", "x_pa_idu_freg_18"); @133
pa_idu_reg  x_pa_idu_freg_18 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[18]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[18]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[18]             ),
  .reg_busy_x                    (reg_busy[18]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[18]             ),
  .reg_write_is_x                (reg_write_is[18]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_18_dout                  )
);

// &Connect(.x_reg_dout (reg_18_dout)); @134

// &ConnRule(s/_x$/[19]/); @136
// &Instance("pa_idu_reg", "x_pa_idu_freg_19"); @137
pa_idu_reg  x_pa_idu_freg_19 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[19]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[19]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[19]             ),
  .reg_busy_x                    (reg_busy[19]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[19]             ),
  .reg_write_is_x                (reg_write_is[19]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_19_dout                  )
);

// &Connect(.x_reg_dout (reg_19_dout)); @138

// &ConnRule(s/_x$/[20]/); @140
// &Instance("pa_idu_reg", "x_pa_idu_freg_20"); @141
pa_idu_reg  x_pa_idu_freg_20 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[20]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[20]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[20]             ),
  .reg_busy_x                    (reg_busy[20]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[20]             ),
  .reg_write_is_x                (reg_write_is[20]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_20_dout                  )
);

// &Connect(.x_reg_dout (reg_20_dout)); @142

// &ConnRule(s/_x$/[21]/); @144
// &Instance("pa_idu_reg", "x_pa_idu_freg_21"); @145
pa_idu_reg  x_pa_idu_freg_21 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[21]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[21]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[21]             ),
  .reg_busy_x                    (reg_busy[21]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[21]             ),
  .reg_write_is_x                (reg_write_is[21]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_21_dout                  )
);

// &Connect(.x_reg_dout (reg_21_dout)); @146

// &ConnRule(s/_x$/[22]/); @148
// &Instance("pa_idu_reg", "x_pa_idu_freg_22"); @149
pa_idu_reg  x_pa_idu_freg_22 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[22]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[22]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[22]             ),
  .reg_busy_x                    (reg_busy[22]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[22]             ),
  .reg_write_is_x                (reg_write_is[22]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_22_dout                  )
);

// &Connect(.x_reg_dout (reg_22_dout)); @150

// &ConnRule(s/_x$/[23]/); @152
// &Instance("pa_idu_reg", "x_pa_idu_freg_23"); @153
pa_idu_reg  x_pa_idu_freg_23 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[23]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[23]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[23]             ),
  .reg_busy_x                    (reg_busy[23]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[23]             ),
  .reg_write_is_x                (reg_write_is[23]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_23_dout                  )
);

// &Connect(.x_reg_dout (reg_23_dout)); @154

// &ConnRule(s/_x$/[24]/); @156
// &Instance("pa_idu_reg", "x_pa_idu_freg_24"); @157
pa_idu_reg  x_pa_idu_freg_24 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[24]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[24]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[24]             ),
  .reg_busy_x                    (reg_busy[24]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[24]             ),
  .reg_write_is_x                (reg_write_is[24]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_24_dout                  )
);

// &Connect(.x_reg_dout (reg_24_dout)); @158

// &ConnRule(s/_x$/[25]/); @160
// &Instance("pa_idu_reg", "x_pa_idu_freg_25"); @161
pa_idu_reg  x_pa_idu_freg_25 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[25]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[25]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[25]             ),
  .reg_busy_x                    (reg_busy[25]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[25]             ),
  .reg_write_is_x                (reg_write_is[25]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_25_dout                  )
);

// &Connect(.x_reg_dout (reg_25_dout)); @162

// &ConnRule(s/_x$/[26]/); @164
// &Instance("pa_idu_reg", "x_pa_idu_freg_26"); @165
pa_idu_reg  x_pa_idu_freg_26 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[26]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[26]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[26]             ),
  .reg_busy_x                    (reg_busy[26]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[26]             ),
  .reg_write_is_x                (reg_write_is[26]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_26_dout                  )
);

// &Connect(.x_reg_dout (reg_26_dout)); @166

// &ConnRule(s/_x$/[27]/); @168
// &Instance("pa_idu_reg", "x_pa_idu_freg_27"); @169
pa_idu_reg  x_pa_idu_freg_27 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[27]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[27]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[27]             ),
  .reg_busy_x                    (reg_busy[27]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[27]             ),
  .reg_write_is_x                (reg_write_is[27]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_27_dout                  )
);

// &Connect(.x_reg_dout (reg_27_dout)); @170

// &ConnRule(s/_x$/[28]/); @172
// &Instance("pa_idu_reg", "x_pa_idu_freg_28"); @173
pa_idu_reg  x_pa_idu_freg_28 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[28]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[28]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[28]             ),
  .reg_busy_x                    (reg_busy[28]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[28]             ),
  .reg_write_is_x                (reg_write_is[28]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_28_dout                  )
);

// &Connect(.x_reg_dout (reg_28_dout)); @174

// &ConnRule(s/_x$/[29]/); @176
// &Instance("pa_idu_reg", "x_pa_idu_freg_29"); @177
pa_idu_reg  x_pa_idu_freg_29 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[29]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[29]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[29]             ),
  .reg_busy_x                    (reg_busy[29]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[29]             ),
  .reg_write_is_x                (reg_write_is[29]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_29_dout                  )
);

// &Connect(.x_reg_dout (reg_29_dout)); @178

// &ConnRule(s/_x$/[30]/); @180
// &Instance("pa_idu_reg", "x_pa_idu_freg_30"); @181
pa_idu_reg  x_pa_idu_freg_30 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[30]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[30]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[30]             ),
  .reg_busy_x                    (reg_busy[30]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[30]             ),
  .reg_write_is_x                (reg_write_is[30]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_30_dout                  )
);

// &Connect(.x_reg_dout (reg_30_dout)); @182

// &ConnRule(s/_x$/[31]/); @184
// &Instance("pa_idu_reg", "x_pa_idu_freg_31"); @185
pa_idu_reg  x_pa_idu_freg_31 (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_gpr_ld_inst              (ctrl_gpr_ld_inst             ),
  .ifu_idu_warm_up               (ifu_idu_warm_up              ),
  .int_clr_en_x                  (int_clr_en[31]               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .reg_busy_div_x                (reg_busy_div[31]             ),
  .reg_busy_lsu_x                (reg_busy_lsu[31]             ),
  .reg_busy_x                    (reg_busy[31]                 ),
  .reg_in_cpuclk                 (reg_in_cpuclk                ),
  .reg_sm_cpuclk                 (reg_sm_cpuclk                ),
  .reg_write_en_x                (reg_write_en[31]             ),
  .reg_write_is_x                (reg_write_is[31]             ),
  .rtu_idu_ex1_int_dis_stall_req (rtu_idu_ex1_int_dis_stall_req),
  .rtu_idu_fgpr_wb_flsu_vld      (rtu_idu_fgpr_wb_flsu_vld     ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .write_data                    (write_data                   ),
  .x_reg_dout                    (reg_31_dout                  )
);

// &Connect(.x_reg_dout (reg_31_dout)); @186

//-----------------------------------------------
// 2. One write port
//-----------------------------------------------
assign fpr_sync_rst_b = 1'b1;
assign write_index[4:0] = rtu_idu_fgpr_wb_reg[4:0];
assign write_data[REG_WIDTH-1:0] = {REG_WIDTH{fpr_sync_rst_b}} & rtu_idu_fgpr_wb_data[REG_WIDTH-1:0];

// write index decoder
// &CombBeg; @196
always @( write_index[4:0])
begin
  reg_sel[REG_WIDTH-1:0] = {REG_WIDTH{1'b0}};
  case(write_index[4:0])
    5'h00 : reg_sel[0]  = 1'b1;
    5'h01 : reg_sel[1]  = 1'b1;
    5'h02 : reg_sel[2]  = 1'b1;
    5'h03 : reg_sel[3]  = 1'b1;
    5'h04 : reg_sel[4]  = 1'b1;
    5'h05 : reg_sel[5]  = 1'b1;
    5'h06 : reg_sel[6]  = 1'b1;
    5'h07 : reg_sel[7]  = 1'b1;
    5'h08 : reg_sel[8]  = 1'b1;
    5'h09 : reg_sel[9]  = 1'b1;
    5'h0a : reg_sel[10] = 1'b1;
    5'h0b : reg_sel[11] = 1'b1;
    5'h0c : reg_sel[12] = 1'b1;
    5'h0d : reg_sel[13] = 1'b1;
    5'h0e : reg_sel[14] = 1'b1;
    5'h0f : reg_sel[15] = 1'b1;
    5'h10 : reg_sel[16] = 1'b1;
    5'h11 : reg_sel[17] = 1'b1;
    5'h12 : reg_sel[18] = 1'b1;
    5'h13 : reg_sel[19] = 1'b1;
    5'h14 : reg_sel[20] = 1'b1;
    5'h15 : reg_sel[21] = 1'b1;
    5'h16 : reg_sel[22] = 1'b1;
    5'h17 : reg_sel[23] = 1'b1;
    5'h18 : reg_sel[24] = 1'b1;
    5'h19 : reg_sel[25] = 1'b1;
    5'h1a : reg_sel[26] = 1'b1;
    5'h1b : reg_sel[27] = 1'b1;
    5'h1c : reg_sel[28] = 1'b1;
    5'h1d : reg_sel[29] = 1'b1;
    5'h1e : reg_sel[30] = 1'b1;
    5'h1f : reg_sel[31] = 1'b1;
  endcase
// &CombEnd; @232
end

assign reg_write_en[REG_WIDTH-1:0] = reg_sel[REG_WIDTH-1:0] & {REG_WIDTH{rtu_idu_fgpr_wb_vld}}
                                   & {REG_WIDTH{fpr_sync_rst_b}};

// Write Reg Issue
// write issue index decoder
// &CombBeg; @239
always @( decd_fp_fpr_rd[4:0])
begin
  reg_issue[REG_WIDTH-1:0] = {REG_WIDTH{1'b0}};
  case(decd_fp_fpr_rd[4:0])
    5'h00 : reg_issue[0]  = 1'b1;
    5'h01 : reg_issue[1]  = 1'b1;
    5'h02 : reg_issue[2]  = 1'b1;
    5'h03 : reg_issue[3]  = 1'b1;
    5'h04 : reg_issue[4]  = 1'b1;
    5'h05 : reg_issue[5]  = 1'b1;
    5'h06 : reg_issue[6]  = 1'b1;
    5'h07 : reg_issue[7]  = 1'b1;
    5'h08 : reg_issue[8]  = 1'b1;
    5'h09 : reg_issue[9]  = 1'b1;
    5'h0a : reg_issue[10] = 1'b1;
    5'h0b : reg_issue[11] = 1'b1;
    5'h0c : reg_issue[12] = 1'b1;
    5'h0d : reg_issue[13] = 1'b1;
    5'h0e : reg_issue[14] = 1'b1;
    5'h0f : reg_issue[15] = 1'b1;
    5'h10 : reg_issue[16] = 1'b1;
    5'h11 : reg_issue[17] = 1'b1;
    5'h12 : reg_issue[18] = 1'b1;
    5'h13 : reg_issue[19] = 1'b1;
    5'h14 : reg_issue[20] = 1'b1;
    5'h15 : reg_issue[21] = 1'b1;
    5'h16 : reg_issue[22] = 1'b1;
    5'h17 : reg_issue[23] = 1'b1;
    5'h18 : reg_issue[24] = 1'b1;
    5'h19 : reg_issue[25] = 1'b1;
    5'h1a : reg_issue[26] = 1'b1;
    5'h1b : reg_issue[27] = 1'b1;
    5'h1c : reg_issue[28] = 1'b1;
    5'h1d : reg_issue[29] = 1'b1;
    5'h1e : reg_issue[30] = 1'b1;
    5'h1f : reg_issue[31] = 1'b1;
  endcase
// &CombEnd; @275
end

assign reg_write_is[REG_WIDTH-1:0]      = {REG_WIDTH{id_fp_fpr_wr_issue}} & reg_issue[REG_WIDTH-1:0];
assign reg_write_is_gate                = id_fp_fpr_id_dst_vld;
assign ctrl_gpr_ld_inst = id_fp_fpr_ld_inst;

assign int_clr_idx[4:0] = id_fp_fpr_dst_freg[4:0] & {5{rtu_yy_xx_expt_int & ctrl_fpr_ex1_int_spec}};
// &CombBeg; @282
always @( int_clr_idx[4:0])
begin
  int_clr_sel[31:0] = {32{1'b0}};
  case(int_clr_idx[4:0])
    5'h00 : int_clr_sel[0]  = 1'b1;
    5'h01 : int_clr_sel[1]  = 1'b1;
    5'h02 : int_clr_sel[2]  = 1'b1;
    5'h03 : int_clr_sel[3]  = 1'b1;
    5'h04 : int_clr_sel[4]  = 1'b1;
    5'h05 : int_clr_sel[5]  = 1'b1;
    5'h06 : int_clr_sel[6]  = 1'b1;
    5'h07 : int_clr_sel[7]  = 1'b1;
    5'h08 : int_clr_sel[8]  = 1'b1;
    5'h09 : int_clr_sel[9]  = 1'b1;
    5'h0a : int_clr_sel[10] = 1'b1;
    5'h0b : int_clr_sel[11] = 1'b1;
    5'h0c : int_clr_sel[12] = 1'b1;
    5'h0d : int_clr_sel[13] = 1'b1;
    5'h0e : int_clr_sel[14] = 1'b1;
    5'h0f : int_clr_sel[15] = 1'b1;
    5'h10 : int_clr_sel[16] = 1'b1;
    5'h11 : int_clr_sel[17] = 1'b1;
    5'h12 : int_clr_sel[18] = 1'b1;
    5'h13 : int_clr_sel[19] = 1'b1;
    5'h14 : int_clr_sel[20] = 1'b1;
    5'h15 : int_clr_sel[21] = 1'b1;
    5'h16 : int_clr_sel[22] = 1'b1;
    5'h17 : int_clr_sel[23] = 1'b1;
    5'h18 : int_clr_sel[24] = 1'b1;
    5'h19 : int_clr_sel[25] = 1'b1;
    5'h1a : int_clr_sel[26] = 1'b1;
    5'h1b : int_clr_sel[27] = 1'b1;
    5'h1c : int_clr_sel[28] = 1'b1;
    5'h1d : int_clr_sel[29] = 1'b1;
    5'h1e : int_clr_sel[30] = 1'b1;
    5'h1f : int_clr_sel[31] = 1'b1;
  endcase
// &CombEnd; @318
end
assign int_clr_en[31:0] = {32{rtu_yy_xx_expt_int & ctrl_fpr_ex1_int_spec}} & int_clr_sel[31:0];
assign int_clr_en[32] = 1'b0;
assign int_clr_en[33] = 1'b0;


//-----------------------------------------------
// 3. Two read ports
//-----------------------------------------------
// Read Port 1 for rs1
// &CombBeg; @328
always @( reg_28_dout[31:0]
       or reg_31_dout[31:0]
       or reg_18_dout[31:0]
       or reg_20_dout[31:0]
       or reg_7_dout[31:0]
       or reg_17_dout[31:0]
       or reg_21_dout[31:0]
       or reg_15_dout[31:0]
       or reg_22_dout[31:0]
       or reg_12_dout[31:0]
       or reg_24_dout[31:0]
       or reg_19_dout[31:0]
       or reg_27_dout[31:0]
       or reg_3_dout[31:0]
       or reg_30_dout[31:0]
       or reg_4_dout[31:0]
       or reg_23_dout[31:0]
       or decd_fp_fpr_rs1[4:0]
       or reg_8_dout[31:0]
       or reg_9_dout[31:0]
       or reg_29_dout[31:0]
       or reg_1_dout[31:0]
       or reg_25_dout[31:0]
       or reg_26_dout[31:0]
       or reg_10_dout[31:0]
       or reg_6_dout[31:0]
       or reg_5_dout[31:0]
       or reg_13_dout[31:0]
       or reg_14_dout[31:0]
       or reg_16_dout[31:0]
       or reg_2_dout[31:0]
       or reg_0_dout[31:0]
       or reg_11_dout[31:0])
begin
  case(decd_fp_fpr_rs1[4:0])
    5'h00   : fpr_read_data1[REG_WIDTH-1:0] = reg_0_dout[REG_WIDTH-1:0];
    5'h01   : fpr_read_data1[REG_WIDTH-1:0] = reg_1_dout[REG_WIDTH-1:0];
    5'h02   : fpr_read_data1[REG_WIDTH-1:0] = reg_2_dout[REG_WIDTH-1:0];
    5'h03   : fpr_read_data1[REG_WIDTH-1:0] = reg_3_dout[REG_WIDTH-1:0];
    5'h04   : fpr_read_data1[REG_WIDTH-1:0] = reg_4_dout[REG_WIDTH-1:0];
    5'h05   : fpr_read_data1[REG_WIDTH-1:0] = reg_5_dout[REG_WIDTH-1:0];
    5'h06   : fpr_read_data1[REG_WIDTH-1:0] = reg_6_dout[REG_WIDTH-1:0];
    5'h07   : fpr_read_data1[REG_WIDTH-1:0] = reg_7_dout[REG_WIDTH-1:0];
    5'h08   : fpr_read_data1[REG_WIDTH-1:0] = reg_8_dout[REG_WIDTH-1:0];
    5'h09   : fpr_read_data1[REG_WIDTH-1:0] = reg_9_dout[REG_WIDTH-1:0];
    5'h0a   : fpr_read_data1[REG_WIDTH-1:0] = reg_10_dout[REG_WIDTH-1:0];
    5'h0b   : fpr_read_data1[REG_WIDTH-1:0] = reg_11_dout[REG_WIDTH-1:0];
    5'h0c   : fpr_read_data1[REG_WIDTH-1:0] = reg_12_dout[REG_WIDTH-1:0];
    5'h0d   : fpr_read_data1[REG_WIDTH-1:0] = reg_13_dout[REG_WIDTH-1:0];
    5'h0e   : fpr_read_data1[REG_WIDTH-1:0] = reg_14_dout[REG_WIDTH-1:0];
    5'h0f   : fpr_read_data1[REG_WIDTH-1:0] = reg_15_dout[REG_WIDTH-1:0];
    5'h10   : fpr_read_data1[REG_WIDTH-1:0] = reg_16_dout[REG_WIDTH-1:0];
    5'h11   : fpr_read_data1[REG_WIDTH-1:0] = reg_17_dout[REG_WIDTH-1:0];
    5'h12   : fpr_read_data1[REG_WIDTH-1:0] = reg_18_dout[REG_WIDTH-1:0];
    5'h13   : fpr_read_data1[REG_WIDTH-1:0] = reg_19_dout[REG_WIDTH-1:0];
    5'h14   : fpr_read_data1[REG_WIDTH-1:0] = reg_20_dout[REG_WIDTH-1:0];
    5'h15   : fpr_read_data1[REG_WIDTH-1:0] = reg_21_dout[REG_WIDTH-1:0];
    5'h16   : fpr_read_data1[REG_WIDTH-1:0] = reg_22_dout[REG_WIDTH-1:0];
    5'h17   : fpr_read_data1[REG_WIDTH-1:0] = reg_23_dout[REG_WIDTH-1:0];
    5'h18   : fpr_read_data1[REG_WIDTH-1:0] = reg_24_dout[REG_WIDTH-1:0];
    5'h19   : fpr_read_data1[REG_WIDTH-1:0] = reg_25_dout[REG_WIDTH-1:0];
    5'h1a   : fpr_read_data1[REG_WIDTH-1:0] = reg_26_dout[REG_WIDTH-1:0];
    5'h1b   : fpr_read_data1[REG_WIDTH-1:0] = reg_27_dout[REG_WIDTH-1:0];
    5'h1c   : fpr_read_data1[REG_WIDTH-1:0] = reg_28_dout[REG_WIDTH-1:0];
    5'h1d   : fpr_read_data1[REG_WIDTH-1:0] = reg_29_dout[REG_WIDTH-1:0];
    5'h1e   : fpr_read_data1[REG_WIDTH-1:0] = reg_30_dout[REG_WIDTH-1:0];
    5'h1f   : fpr_read_data1[REG_WIDTH-1:0] = reg_31_dout[REG_WIDTH-1:0];
    default : fpr_read_data1[REG_WIDTH-1:0] = {REG_WIDTH{1'bx}};
  endcase
// &CombEnd; @364
end

// Read Port 2 for rs2
// &CombBeg; @367
always @( reg_28_dout[31:0]
       or reg_31_dout[31:0]
       or reg_18_dout[31:0]
       or reg_20_dout[31:0]
       or reg_7_dout[31:0]
       or decd_fp_fpr_rs2[4:0]
       or reg_17_dout[31:0]
       or reg_21_dout[31:0]
       or reg_15_dout[31:0]
       or reg_22_dout[31:0]
       or reg_12_dout[31:0]
       or reg_24_dout[31:0]
       or reg_19_dout[31:0]
       or reg_27_dout[31:0]
       or reg_3_dout[31:0]
       or reg_30_dout[31:0]
       or reg_4_dout[31:0]
       or reg_23_dout[31:0]
       or reg_8_dout[31:0]
       or reg_9_dout[31:0]
       or reg_29_dout[31:0]
       or reg_1_dout[31:0]
       or reg_25_dout[31:0]
       or reg_10_dout[31:0]
       or reg_26_dout[31:0]
       or reg_6_dout[31:0]
       or reg_14_dout[31:0]
       or reg_13_dout[31:0]
       or reg_5_dout[31:0]
       or reg_16_dout[31:0]
       or reg_2_dout[31:0]
       or reg_0_dout[31:0]
       or reg_11_dout[31:0])
begin
  case(decd_fp_fpr_rs2[4:0])
    5'h00   : fpr_read_data2[REG_WIDTH-1:0] = reg_0_dout[REG_WIDTH-1:0];
    5'h01   : fpr_read_data2[REG_WIDTH-1:0] = reg_1_dout[REG_WIDTH-1:0];
    5'h02   : fpr_read_data2[REG_WIDTH-1:0] = reg_2_dout[REG_WIDTH-1:0];
    5'h03   : fpr_read_data2[REG_WIDTH-1:0] = reg_3_dout[REG_WIDTH-1:0];
    5'h04   : fpr_read_data2[REG_WIDTH-1:0] = reg_4_dout[REG_WIDTH-1:0];
    5'h05   : fpr_read_data2[REG_WIDTH-1:0] = reg_5_dout[REG_WIDTH-1:0];
    5'h06   : fpr_read_data2[REG_WIDTH-1:0] = reg_6_dout[REG_WIDTH-1:0];
    5'h07   : fpr_read_data2[REG_WIDTH-1:0] = reg_7_dout[REG_WIDTH-1:0];
    5'h08   : fpr_read_data2[REG_WIDTH-1:0] = reg_8_dout[REG_WIDTH-1:0];
    5'h09   : fpr_read_data2[REG_WIDTH-1:0] = reg_9_dout[REG_WIDTH-1:0];
    5'h0a   : fpr_read_data2[REG_WIDTH-1:0] = reg_10_dout[REG_WIDTH-1:0];
    5'h0b   : fpr_read_data2[REG_WIDTH-1:0] = reg_11_dout[REG_WIDTH-1:0];
    5'h0c   : fpr_read_data2[REG_WIDTH-1:0] = reg_12_dout[REG_WIDTH-1:0];
    5'h0d   : fpr_read_data2[REG_WIDTH-1:0] = reg_13_dout[REG_WIDTH-1:0];
    5'h0e   : fpr_read_data2[REG_WIDTH-1:0] = reg_14_dout[REG_WIDTH-1:0];
    5'h0f   : fpr_read_data2[REG_WIDTH-1:0] = reg_15_dout[REG_WIDTH-1:0];
    5'h10   : fpr_read_data2[REG_WIDTH-1:0] = reg_16_dout[REG_WIDTH-1:0];
    5'h11   : fpr_read_data2[REG_WIDTH-1:0] = reg_17_dout[REG_WIDTH-1:0];
    5'h12   : fpr_read_data2[REG_WIDTH-1:0] = reg_18_dout[REG_WIDTH-1:0];
    5'h13   : fpr_read_data2[REG_WIDTH-1:0] = reg_19_dout[REG_WIDTH-1:0];
    5'h14   : fpr_read_data2[REG_WIDTH-1:0] = reg_20_dout[REG_WIDTH-1:0];
    5'h15   : fpr_read_data2[REG_WIDTH-1:0] = reg_21_dout[REG_WIDTH-1:0];
    5'h16   : fpr_read_data2[REG_WIDTH-1:0] = reg_22_dout[REG_WIDTH-1:0];
    5'h17   : fpr_read_data2[REG_WIDTH-1:0] = reg_23_dout[REG_WIDTH-1:0];
    5'h18   : fpr_read_data2[REG_WIDTH-1:0] = reg_24_dout[REG_WIDTH-1:0];
    5'h19   : fpr_read_data2[REG_WIDTH-1:0] = reg_25_dout[REG_WIDTH-1:0];
    5'h1a   : fpr_read_data2[REG_WIDTH-1:0] = reg_26_dout[REG_WIDTH-1:0];
    5'h1b   : fpr_read_data2[REG_WIDTH-1:0] = reg_27_dout[REG_WIDTH-1:0];
    5'h1c   : fpr_read_data2[REG_WIDTH-1:0] = reg_28_dout[REG_WIDTH-1:0];
    5'h1d   : fpr_read_data2[REG_WIDTH-1:0] = reg_29_dout[REG_WIDTH-1:0];
    5'h1e   : fpr_read_data2[REG_WIDTH-1:0] = reg_30_dout[REG_WIDTH-1:0];
    5'h1f   : fpr_read_data2[REG_WIDTH-1:0] = reg_31_dout[REG_WIDTH-1:0];
    default : fpr_read_data2[REG_WIDTH-1:0] = {REG_WIDTH{1'bx}};
  endcase
// &CombEnd; @403
end

// Read Port 3 for rs3
// &CombBeg; @406
always @( reg_28_dout[31:0]
       or reg_31_dout[31:0]
       or reg_18_dout[31:0]
       or reg_20_dout[31:0]
       or reg_7_dout[31:0]
       or reg_17_dout[31:0]
       or reg_21_dout[31:0]
       or reg_15_dout[31:0]
       or reg_22_dout[31:0]
       or reg_12_dout[31:0]
       or reg_24_dout[31:0]
       or reg_19_dout[31:0]
       or reg_27_dout[31:0]
       or reg_3_dout[31:0]
       or reg_30_dout[31:0]
       or reg_4_dout[31:0]
       or reg_23_dout[31:0]
       or reg_8_dout[31:0]
       or reg_9_dout[31:0]
       or reg_29_dout[31:0]
       or reg_1_dout[31:0]
       or reg_25_dout[31:0]
       or reg_10_dout[31:0]
       or reg_26_dout[31:0]
       or decd_fp_fpr_rs3[4:0]
       or reg_6_dout[31:0]
       or reg_14_dout[31:0]
       or reg_13_dout[31:0]
       or reg_5_dout[31:0]
       or reg_16_dout[31:0]
       or reg_2_dout[31:0]
       or reg_0_dout[31:0]
       or reg_11_dout[31:0])
begin
  case(decd_fp_fpr_rs3[4:0])
    5'h00   : fpr_read_data3[REG_WIDTH-1:0] = reg_0_dout[REG_WIDTH-1:0];
    5'h01   : fpr_read_data3[REG_WIDTH-1:0] = reg_1_dout[REG_WIDTH-1:0];
    5'h02   : fpr_read_data3[REG_WIDTH-1:0] = reg_2_dout[REG_WIDTH-1:0];
    5'h03   : fpr_read_data3[REG_WIDTH-1:0] = reg_3_dout[REG_WIDTH-1:0];
    5'h04   : fpr_read_data3[REG_WIDTH-1:0] = reg_4_dout[REG_WIDTH-1:0];
    5'h05   : fpr_read_data3[REG_WIDTH-1:0] = reg_5_dout[REG_WIDTH-1:0];
    5'h06   : fpr_read_data3[REG_WIDTH-1:0] = reg_6_dout[REG_WIDTH-1:0];
    5'h07   : fpr_read_data3[REG_WIDTH-1:0] = reg_7_dout[REG_WIDTH-1:0];
    5'h08   : fpr_read_data3[REG_WIDTH-1:0] = reg_8_dout[REG_WIDTH-1:0];
    5'h09   : fpr_read_data3[REG_WIDTH-1:0] = reg_9_dout[REG_WIDTH-1:0];
    5'h0a   : fpr_read_data3[REG_WIDTH-1:0] = reg_10_dout[REG_WIDTH-1:0];
    5'h0b   : fpr_read_data3[REG_WIDTH-1:0] = reg_11_dout[REG_WIDTH-1:0];
    5'h0c   : fpr_read_data3[REG_WIDTH-1:0] = reg_12_dout[REG_WIDTH-1:0];
    5'h0d   : fpr_read_data3[REG_WIDTH-1:0] = reg_13_dout[REG_WIDTH-1:0];
    5'h0e   : fpr_read_data3[REG_WIDTH-1:0] = reg_14_dout[REG_WIDTH-1:0];
    5'h0f   : fpr_read_data3[REG_WIDTH-1:0] = reg_15_dout[REG_WIDTH-1:0];
    5'h10   : fpr_read_data3[REG_WIDTH-1:0] = reg_16_dout[REG_WIDTH-1:0];
    5'h11   : fpr_read_data3[REG_WIDTH-1:0] = reg_17_dout[REG_WIDTH-1:0];
    5'h12   : fpr_read_data3[REG_WIDTH-1:0] = reg_18_dout[REG_WIDTH-1:0];
    5'h13   : fpr_read_data3[REG_WIDTH-1:0] = reg_19_dout[REG_WIDTH-1:0];
    5'h14   : fpr_read_data3[REG_WIDTH-1:0] = reg_20_dout[REG_WIDTH-1:0];
    5'h15   : fpr_read_data3[REG_WIDTH-1:0] = reg_21_dout[REG_WIDTH-1:0];
    5'h16   : fpr_read_data3[REG_WIDTH-1:0] = reg_22_dout[REG_WIDTH-1:0];
    5'h17   : fpr_read_data3[REG_WIDTH-1:0] = reg_23_dout[REG_WIDTH-1:0];
    5'h18   : fpr_read_data3[REG_WIDTH-1:0] = reg_24_dout[REG_WIDTH-1:0];
    5'h19   : fpr_read_data3[REG_WIDTH-1:0] = reg_25_dout[REG_WIDTH-1:0];
    5'h1a   : fpr_read_data3[REG_WIDTH-1:0] = reg_26_dout[REG_WIDTH-1:0];
    5'h1b   : fpr_read_data3[REG_WIDTH-1:0] = reg_27_dout[REG_WIDTH-1:0];
    5'h1c   : fpr_read_data3[REG_WIDTH-1:0] = reg_28_dout[REG_WIDTH-1:0];
    5'h1d   : fpr_read_data3[REG_WIDTH-1:0] = reg_29_dout[REG_WIDTH-1:0];
    5'h1e   : fpr_read_data3[REG_WIDTH-1:0] = reg_30_dout[REG_WIDTH-1:0];
    5'h1f   : fpr_read_data3[REG_WIDTH-1:0] = reg_31_dout[REG_WIDTH-1:0];
    default : fpr_read_data3[REG_WIDTH-1:0] = {REG_WIDTH{1'bx}};
  endcase
// &CombEnd; @442
end

assign fpr_rs1_dep_wb = decd_fp_fpr_rs1[4:0] == write_index[4:0]
                     & rtu_idu_fgpr_wb_vld;
assign fpr_rs2_dep_wb = decd_fp_fpr_rs2[4:0] == write_index[4:0]
                     & rtu_idu_fgpr_wb_vld;
assign fpr_rs3_dep_wb = decd_fp_fpr_rs3[4:0] == write_index[4:0]
                     & rtu_idu_fgpr_wb_vld;

assign fpr_fin_data1[REG_WIDTH-1:0] = fpr_rs1_dep_wb ? rtu_idu_fgpr_wb_data[REG_WIDTH-1:0]
                                                     : fpr_read_data1[REG_WIDTH-1:0];
assign fpr_fin_data2[REG_WIDTH-1:0] = fpr_rs2_dep_wb ? rtu_idu_fgpr_wb_data[REG_WIDTH-1:0]
                                                     : fpr_read_data2[REG_WIDTH-1:0];
assign fpr_fin_data3[REG_WIDTH-1:0] = fpr_rs3_dep_wb ? rtu_idu_fgpr_wb_data[REG_WIDTH-1:0]
                                                     : fpr_read_data3[REG_WIDTH-1:0];

//-----------------------------------------------
// 4. Reg Busy Judge
//-----------------------------------------------
assign fpr_busy_rslt1[31:0] = reg_busy[31:0] >> decd_fp_fpr_rs1[4:0];
assign fpr_busy_rslt2[31:0] = reg_busy[31:0] >> decd_fp_fpr_rs2[4:0];
assign fpr_busy_rslt3[31:0] = reg_busy[31:0] >> decd_fp_fpr_rs3[4:0];
assign fpr_busy_rsltd[31:0] = reg_busy[31:0] >> decd_fp_fpr_rd[4:0];
assign fpr_busy_lsu1[31:0]  = reg_busy_lsu[31:0] >> decd_fp_fpr_rs1[4:0];
assign fpr_busy_lsu2[31:0]  = reg_busy_lsu[31:0] >> decd_fp_fpr_rs2[4:0];
assign fpr_busy_lsu3[31:0]  = reg_busy_lsu[31:0] >> decd_fp_fpr_rs3[4:0];
assign fpr_busy_lsud[31:0]  = reg_busy_lsu[31:0] >> decd_fp_fpr_rd[4:0];
assign fpr_busy_div1[31:0]  = reg_busy_div[31:0] >> decd_fp_fpr_rs1[4:0];
assign fpr_busy_div2[31:0]  = reg_busy_div[31:0] >> decd_fp_fpr_rs2[4:0];
assign fpr_busy_div3[31:0]  = reg_busy_div[31:0] >> decd_fp_fpr_rs3[4:0];
assign fpr_busy_divd[31:0]  = reg_busy_div[31:0] >> decd_fp_fpr_rd[4:0];

//==========================================================
//     Rename output information
//==========================================================
assign fpr_id_fp_rs1[REG_WIDTH-1:0] = fpr_fin_data1[REG_WIDTH-1:0];
assign fpr_id_fp_rs2[REG_WIDTH-1:0] = fpr_fin_data2[REG_WIDTH-1:0];
assign fpr_id_fp_rs3[REG_WIDTH-1:0] = fpr_fin_data3[REG_WIDTH-1:0];

assign fpr_id_fp_rs1_busy     = fpr_busy_rslt1[0] & decd_fp_fpr_rs1_vld;
assign fpr_id_fp_rs2_busy     = fpr_busy_rslt2[0] & decd_fp_fpr_rs2_vld;
assign fpr_id_fp_rs3_busy     = fpr_busy_rslt3[0] & decd_fp_fpr_rs3_vld;
assign fpr_id_fp_rd_busy      = fpr_busy_rsltd[0] & decd_fp_fpr_rd_vld;
assign fpr_id_fp_rs1_busy_lsu = fpr_busy_lsu1[0]  & decd_fp_fpr_rs1_vld;
assign fpr_id_fp_rs2_busy_lsu = fpr_busy_lsu2[0]  & decd_fp_fpr_rs2_vld;
assign fpr_id_fp_rs3_busy_lsu = fpr_busy_lsu3[0]  & decd_fp_fpr_rs3_vld;
assign fpr_id_fp_rd_busy_lsu  = fpr_busy_lsud[0]  & decd_fp_fpr_rd_vld;

// &Force("nonport", "fpr_id_fp_rs1_busy_div"); @490
// &Force("nonport", "fpr_id_fp_rs2_busy_div"); @491
// &Force("nonport", "fpr_id_fp_rs3_busy_div"); @492
// &Force("nonport", "fpr_id_fp_rd_busy_div"); @493
assign fpr_id_fp_rs1_busy_div = fpr_busy_div1[0]  & decd_fp_fpr_rs1_vld;
assign fpr_id_fp_rs2_busy_div = fpr_busy_div2[0]  & decd_fp_fpr_rs2_vld;
assign fpr_id_fp_rs3_busy_div = fpr_busy_div3[0]  & decd_fp_fpr_rs3_vld;
assign fpr_id_fp_rd_busy_div  = fpr_busy_divd[0]  & decd_fp_fpr_rd_vld;

assign fpr_top_reg_busy[31:0]     = reg_busy[31:0];
assign fpr_top_reg_busy_lsu[31:0] = reg_busy_lsu[31:0];
assign fpr_top_reg_busy_div[31:0] = reg_busy_div[31:0];

// &ModuleEnd; @503
endmodule


