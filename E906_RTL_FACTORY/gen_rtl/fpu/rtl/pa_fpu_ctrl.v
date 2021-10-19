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
module pa_fpu_ctrl(
  cp0_fpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_falu_ex1_sel,
  ctrl_falu_ex1_sel_dp,
  ctrl_falu_ex1_sel_gate,
  ctrl_fdsu_ex1_sel,
  ctrl_fmau_ex1_sel,
  ctrl_fmau_ex1_sel_gate,
  ctrl_frbus_ex2_wb_req,
  ctrl_frbus_ex3_wb_req,
  ctrl_frbus_ex4_wb_req,
  ctrl_xx_ex1_cmplt_dp,
  ctrl_xx_ex1_inst_vld,
  ctrl_xx_ex1_stall,
  ctrl_xx_ex1_warm_up,
  ctrl_xx_ex2_cancel,
  ctrl_xx_ex2_inst_vld,
  ctrl_xx_ex2_stall,
  ctrl_xx_ex2_warm_up,
  ctrl_xx_ex3_inst_vld,
  ctrl_xx_ex3_stall,
  ctrl_xx_ex3_warm_up,
  ctrl_xx_ex4_stall,
  ex2_inst_wb,
  falu_fpu_ex1_cmplt,
  falu_fpu_ex1_cmplt_dp,
  falu_fpu_ex1_wb_gpr,
  falu_fpu_ex3_result_vld,
  falu_fpu_ex3_stall,
  falu_fpu_ex3_wb_gpr,
  fdsu_fpu_ex1_cmplt,
  fdsu_fpu_ex1_cmplt_dp,
  fdsu_fpu_ex1_special_sel,
  fdsu_fpu_ex1_stall,
  fdsu_fpu_no_op,
  fmau_fpu_ex1_cmplt,
  fmau_fpu_ex1_cmplt_dp,
  fmau_fpu_ex1_denorm_stall,
  fmau_fpu_ex3_result_vld,
  fmau_fpu_id_reg_set,
  forever_cpuclk,
  fpu_had_ex2_inst_vld,
  fpu_had_ex3_inst_vld,
  fpu_had_ex4_inst_vld,
  fpu_idu_ex1_stall,
  fpu_rtu_ex1_inst_cmplt,
  fpu_rtu_ex1_inst_cmplt_dp,
  fpu_xx_no_op,
  frbus_ctrl_ex2_wb_grant,
  frbus_ctrl_ex3_wb_grant,
  frbus_ctrl_ex4_wb_grant,
  idu_fpu_ex1_cmplt_dp_sel,
  idu_fpu_ex1_eu_sel,
  idu_fpu_ex1_gateclk_vld,
  idu_fpu_ex1_inst_vld,
  ifu_fpu_warm_up,
  pad_yy_icg_scan_en,
  rtu_fpu_ex2_stall,
  rtu_xx_ex1_cancel,
  rtu_xx_ex2_cancel,
  rtu_yy_xx_flush
);

// &Ports; @25
input          cp0_fpu_icg_en;           
input          cp0_yy_clk_en;            
input          cpurst_b;                 
input          ex2_inst_wb;              
input          falu_fpu_ex1_cmplt;       
input          falu_fpu_ex1_cmplt_dp;    
input          falu_fpu_ex1_wb_gpr;      
input          falu_fpu_ex3_result_vld;  
input          falu_fpu_ex3_stall;       
input          falu_fpu_ex3_wb_gpr;      
input          fdsu_fpu_ex1_cmplt;       
input          fdsu_fpu_ex1_cmplt_dp;    
input   [7:0]  fdsu_fpu_ex1_special_sel; 
input          fdsu_fpu_ex1_stall;       
input          fdsu_fpu_no_op;           
input          fmau_fpu_ex1_cmplt;       
input          fmau_fpu_ex1_cmplt_dp;    
input          fmau_fpu_ex1_denorm_stall; 
input          fmau_fpu_ex3_result_vld;  
input          fmau_fpu_id_reg_set;      
input          forever_cpuclk;           
input          frbus_ctrl_ex2_wb_grant;  
input          frbus_ctrl_ex3_wb_grant;  
input          frbus_ctrl_ex4_wb_grant;  
input          idu_fpu_ex1_cmplt_dp_sel; 
input   [2:0]  idu_fpu_ex1_eu_sel;       
input          idu_fpu_ex1_gateclk_vld;  
input          idu_fpu_ex1_inst_vld;     
input          ifu_fpu_warm_up;          
input          pad_yy_icg_scan_en;       
input          rtu_fpu_ex2_stall;        
input          rtu_xx_ex1_cancel;        
input          rtu_xx_ex2_cancel;        
input          rtu_yy_xx_flush;          
output         ctrl_falu_ex1_sel;        
output         ctrl_falu_ex1_sel_dp;     
output         ctrl_falu_ex1_sel_gate;   
output         ctrl_fdsu_ex1_sel;        
output         ctrl_fmau_ex1_sel;        
output         ctrl_fmau_ex1_sel_gate;   
output         ctrl_frbus_ex2_wb_req;    
output         ctrl_frbus_ex3_wb_req;    
output         ctrl_frbus_ex4_wb_req;    
output         ctrl_xx_ex1_cmplt_dp;     
output         ctrl_xx_ex1_inst_vld;     
output         ctrl_xx_ex1_stall;        
output         ctrl_xx_ex1_warm_up;      
output         ctrl_xx_ex2_cancel;       
output         ctrl_xx_ex2_inst_vld;     
output         ctrl_xx_ex2_stall;        
output         ctrl_xx_ex2_warm_up;      
output         ctrl_xx_ex3_inst_vld;     
output         ctrl_xx_ex3_stall;        
output         ctrl_xx_ex3_warm_up;      
output         ctrl_xx_ex4_stall;        
output         fpu_had_ex2_inst_vld;     
output         fpu_had_ex3_inst_vld;     
output         fpu_had_ex4_inst_vld;     
output         fpu_idu_ex1_stall;        
output         fpu_rtu_ex1_inst_cmplt;   
output         fpu_rtu_ex1_inst_cmplt_dp; 
output         fpu_xx_no_op;             

// &Regs; @26
reg            ex2_inst_vld;             
reg            ex2_retire_with_wb;       
reg            ex3_inst_vld;             
reg            ex4_inst_vld;             

// &Wires; @27
wire           cp0_fpu_icg_en;           
wire           cp0_yy_clk_en;            
wire           cpurst_b;                 
wire           ctrl_falu_ex1_sel;        
wire           ctrl_falu_ex1_sel_dp;     
wire           ctrl_falu_ex1_sel_gate;   
wire           ctrl_fdsu_ex1_sel;        
wire           ctrl_fmau_ex1_sel;        
wire           ctrl_fmau_ex1_sel_gate;   
wire           ctrl_frbus_ex2_wb_req;    
wire           ctrl_frbus_ex3_wb_req;    
wire           ctrl_frbus_ex4_wb_req;    
wire           ctrl_xx_ex1_cmplt_dp;     
wire           ctrl_xx_ex1_inst_vld;     
wire           ctrl_xx_ex1_stall;        
wire           ctrl_xx_ex1_warm_up;      
wire           ctrl_xx_ex2_cancel;       
wire           ctrl_xx_ex2_inst_vld;     
wire           ctrl_xx_ex2_stall;        
wire           ctrl_xx_ex2_warm_up;      
wire           ctrl_xx_ex3_inst_vld;     
wire           ctrl_xx_ex3_stall;        
wire           ctrl_xx_ex3_warm_up;      
wire           ctrl_xx_ex4_stall;        
wire           ex1_fdsu_inst;            
wire           ex1_inst_vld;             
wire           ex1_stall;                
wire           ex1_warm_up;              
wire           ex2_cancel;               
wire           ex2_ctrl_clk;             
wire           ex2_ctrl_clk_en;          
wire           ex2_inst_wb;              
wire           ex2_stall;                
wire           ex2_warm_up;              
wire           ex3_ctrl_clk;             
wire           ex3_ctrl_clk_en;          
wire           ex3_inst_wb;              
wire           ex3_stall;                
wire           ex3_warm_up;              
wire           ex4_ctrl_clk;             
wire           ex4_ctrl_clk_en;          
wire           ex4_stall;                
wire           falu_fpu_ex1_cmplt;       
wire           falu_fpu_ex1_cmplt_dp;    
wire           falu_fpu_ex1_wb_gpr;      
wire           falu_fpu_ex3_result_vld;  
wire           falu_fpu_ex3_stall;       
wire           falu_fpu_ex3_wb_gpr;      
wire           fdsu_fpu_ex1_cmplt;       
wire           fdsu_fpu_ex1_cmplt_dp;    
wire    [7:0]  fdsu_fpu_ex1_special_sel; 
wire           fdsu_fpu_ex1_stall;       
wire           fdsu_fpu_no_op;           
wire           fmau_fpu_ex1_cmplt;       
wire           fmau_fpu_ex1_cmplt_dp;    
wire           fmau_fpu_ex1_denorm_stall; 
wire           fmau_fpu_ex3_result_vld;  
wire           fmau_fpu_id_reg_set;      
wire           forever_cpuclk;           
wire           fpu_had_ex2_inst_vld;     
wire           fpu_had_ex3_inst_vld;     
wire           fpu_had_ex4_inst_vld;     
wire           fpu_idu_ex1_stall;        
wire           fpu_rtu_ex1_inst_cmplt;   
wire           fpu_rtu_ex1_inst_cmplt_dp; 
wire           fpu_xx_no_op;             
wire           frbus_ctrl_ex2_wb_grant;  
wire           frbus_ctrl_ex3_wb_grant;  
wire           frbus_ctrl_ex4_wb_grant;  
wire           idu_fpu_ex1_cmplt_dp_sel; 
wire    [2:0]  idu_fpu_ex1_eu_sel;       
wire           idu_fpu_ex1_gateclk_vld;  
wire           idu_fpu_ex1_inst_vld;     
wire           ifu_fpu_warm_up;          
wire           pad_yy_icg_scan_en;       
wire           rtu_fpu_ex2_stall;        
wire           rtu_xx_ex1_cancel;        
wire           rtu_xx_ex2_cancel;        
wire           rtu_yy_xx_flush;          


// &Depend("cpu_cfig.h"); @29

parameter DOUBLE_WIDTH = 64;
parameter SINGLE_WIDTH = 32;
parameter SINGLE_FRAC  = 23;
parameter DOUBLE_FRAC  = 52;
parameter SINGLE_EXPN  =  8;
parameter DOUBLE_EXPN  = 11;
parameter FUNC_WIDTH   = 10;

//==========================================================
//                     EX1 Interface
//==========================================================
assign ex1_inst_vld = idu_fpu_ex1_inst_vld;

assign ctrl_falu_ex1_sel = idu_fpu_ex1_inst_vld && idu_fpu_ex1_eu_sel[0];
assign ctrl_fmau_ex1_sel = idu_fpu_ex1_inst_vld && idu_fpu_ex1_eu_sel[1];
assign ctrl_fdsu_ex1_sel = idu_fpu_ex1_inst_vld && idu_fpu_ex1_eu_sel[2];

assign ctrl_falu_ex1_sel_dp = idu_fpu_ex1_eu_sel[0];

assign ctrl_falu_ex1_sel_gate = idu_fpu_ex1_gateclk_vld && idu_fpu_ex1_eu_sel[0];
assign ctrl_fmau_ex1_sel_gate = idu_fpu_ex1_gateclk_vld && idu_fpu_ex1_eu_sel[1];
assign fpu_rtu_ex1_inst_cmplt = (falu_fpu_ex1_cmplt || fmau_fpu_ex1_cmplt || fdsu_fpu_ex1_cmplt) && !ex1_stall;
assign fpu_rtu_ex1_inst_cmplt_dp = falu_fpu_ex1_cmplt_dp || fmau_fpu_ex1_cmplt_dp || fdsu_fpu_ex1_cmplt_dp;

assign ex1_stall = idu_fpu_ex1_gateclk_vld && (ex2_stall && !falu_fpu_ex1_wb_gpr 
                || fmau_fpu_ex1_denorm_stall || fdsu_fpu_ex1_stall || rtu_fpu_ex2_stall);

assign fpu_idu_ex1_stall  = ex1_stall;

assign ex1_fdsu_inst = idu_fpu_ex1_eu_sel[2] && !(|fdsu_fpu_ex1_special_sel[7:0]);
//==========================================================
//                     EX2 inst vld ctrl
//==========================================================
assign ex2_ctrl_clk_en = idu_fpu_ex1_gateclk_vld || ex2_inst_vld;

// &Instance("gated_clk_cell", "x_fpu_ctrl_ex2_gated_clk"); @66
gated_clk_cell  x_fpu_ctrl_ex2_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_ctrl_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_ctrl_clk_en   ),
  .module_en          (cp0_fpu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk      ), @67
//          .external_en (1'b0                ), @68
//          .global_en   (cp0_yy_clk_en       ), @69
//          .module_en   (cp0_fpu_icg_en      ), @70
//          .local_en    (ex2_ctrl_clk_en     ), @71
//          .clk_out     (ex2_ctrl_clk        )); @72

always@(posedge ex2_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ex2_inst_vld <= 1'b0;
  else if(ex2_cancel)
    ex2_inst_vld <= 1'b0;
  else if(!ex2_stall)
    ex2_inst_vld <= ex1_inst_vld && !rtu_xx_ex1_cancel && !ex1_stall && !falu_fpu_ex1_wb_gpr && !ex1_fdsu_inst;
  else
    ex2_inst_vld <= ex2_inst_vld;
end

always @ (posedge ex2_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ex2_retire_with_wb <= 1'b0;
  else if (rtu_yy_xx_flush)
    ex2_retire_with_wb <= 1'b0;
  else if (!rtu_fpu_ex2_stall)
    ex2_retire_with_wb <= ex1_inst_vld && !ex2_stall;
end

assign ex2_cancel = ex2_inst_vld && rtu_xx_ex2_cancel && ex2_retire_with_wb;

assign ex2_stall = ex2_inst_vld
               && (ex2_inst_wb && !frbus_ctrl_ex2_wb_grant
               || !ex2_inst_wb && ex3_stall);

assign ctrl_frbus_ex2_wb_req = ex2_inst_vld && !ex2_cancel && ex2_inst_wb;
//==========================================================
//                     EX3 inst vld ctrl
//==========================================================

assign ex3_ctrl_clk_en = ex2_inst_vld || ex3_inst_vld;
// &Instance("gated_clk_cell", "x_fpu_ctrl_ex3_gated_clk"); @108
gated_clk_cell  x_fpu_ctrl_ex3_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex3_ctrl_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex3_ctrl_clk_en   ),
  .module_en          (cp0_fpu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk      ), @109
//          .external_en (1'b0                ), @110
//          .global_en   (cp0_yy_clk_en       ), @111
//          .module_en   (cp0_fpu_icg_en      ), @112
//          .local_en    (ex3_ctrl_clk_en     ), @113
//          .clk_out     (ex3_ctrl_clk        )); @114

always@(posedge ex3_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ex3_inst_vld <= 1'b0;
  else if(!ex3_stall)
    ex3_inst_vld <= ex2_inst_vld && !ex2_cancel && !ex2_inst_wb && !ex2_stall; 
  else
    ex3_inst_vld <= ex3_inst_vld;
end

assign ex3_inst_wb = falu_fpu_ex3_result_vld || fmau_fpu_ex3_result_vld;

assign ex3_stall = ex3_inst_vld 
               && (ex3_inst_wb && !frbus_ctrl_ex3_wb_grant  
               || !ex3_inst_wb && !falu_fpu_ex3_wb_gpr && ex4_stall) 
               ||  falu_fpu_ex3_stall;

assign ctrl_frbus_ex3_wb_req = ex3_inst_vld && ex3_inst_wb;
//==========================================================
//                     EX4 inst vld ctrl
//==========================================================
assign ex4_ctrl_clk_en = ex3_inst_vld || ex4_inst_vld;

// &Instance("gated_clk_cell", "x_fpu_ctrl_ex4_gated_clk"); @139
gated_clk_cell  x_fpu_ctrl_ex4_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex4_ctrl_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex4_ctrl_clk_en   ),
  .module_en          (cp0_fpu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk      ), @140
//          .external_en (1'b0                ), @141
//          .global_en   (cp0_yy_clk_en       ), @142
//          .module_en   (cp0_fpu_icg_en      ), @143
//          .local_en    (ex4_ctrl_clk_en     ), @144
//          .clk_out     (ex4_ctrl_clk        )); @145

always@(posedge ex4_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ex4_inst_vld <= 1'b0;
  else if(!ex4_stall)
    ex4_inst_vld <= ex3_inst_vld && !ex3_inst_wb && !ex3_stall && !falu_fpu_ex3_wb_gpr; 
  else
    ex4_inst_vld <= ex4_inst_vld;
end

assign ex4_stall = ex4_inst_vld && !frbus_ctrl_ex4_wb_grant;

assign ctrl_frbus_ex4_wb_req = ex4_inst_vld;

assign fpu_xx_no_op = !ex1_inst_vld && !ex2_inst_vld && !ex3_inst_vld && !ex4_inst_vld && !fmau_fpu_id_reg_set && fdsu_fpu_no_op;

//===============================================================
//       ctrl signal interface with other sub modules
//===============================================================
assign ctrl_xx_ex1_inst_vld = ex1_inst_vld;
assign ctrl_xx_ex2_inst_vld = ex2_inst_vld;
assign ctrl_xx_ex3_inst_vld = ex3_inst_vld;
assign ctrl_xx_ex1_cmplt_dp = idu_fpu_ex1_cmplt_dp_sel;
assign ctrl_xx_ex1_stall = ex1_stall;
assign ctrl_xx_ex2_stall = ex2_stall;
assign ctrl_xx_ex3_stall = ex3_stall;
assign ctrl_xx_ex4_stall = ex4_stall;

assign ctrl_xx_ex2_cancel = ex2_cancel;

assign ex1_warm_up = ifu_fpu_warm_up;
assign ex2_warm_up = ifu_fpu_warm_up;
assign ex3_warm_up = ifu_fpu_warm_up;

assign ctrl_xx_ex1_warm_up = ex1_warm_up;
assign ctrl_xx_ex2_warm_up = ex2_warm_up;
assign ctrl_xx_ex3_warm_up = ex3_warm_up;

assign fpu_had_ex4_inst_vld = ex4_inst_vld;
assign fpu_had_ex3_inst_vld = ex3_inst_vld;
assign fpu_had_ex2_inst_vld = ex2_inst_vld;


// &ModuleEnd; @190
endmodule



