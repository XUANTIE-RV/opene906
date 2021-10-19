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
module pa_fmau_ctrl(
  cp0_fpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_dp_ex1_inst_pipe_down,
  ctrl_dp_ex1_inst_vld,
  ctrl_dp_ex2_inst_pipe_down,
  ctrl_dp_ex2_inst_vld,
  ctrl_dp_ex3_inst_pipe_down,
  ctrl_dp_ex3_inst_vld,
  ctrl_fmau_ex1_sel,
  ctrl_fmau_ex1_sel_gate,
  ctrl_xx_ex1_cmplt_dp,
  ctrl_xx_ex1_stall,
  ctrl_xx_ex2_cancel,
  ctrl_xx_ex2_stall,
  ctrl_xx_ex3_stall,
  ctrl_xx_ex4_stall,
  dp_ctrl_ex3_mac,
  dp_xx_ex1_id,
  ex1_id_reg,
  ex2_special_cmplt,
  fmau_fpu_ex1_cmplt,
  fmau_fpu_ex1_cmplt_dp,
  fmau_fpu_ex1_denorm_stall,
  fmau_fpu_ex3_result_vld,
  fmau_fpu_id_reg_set,
  forever_cpuclk,
  idu_fpu_ex1_eu_sel,
  pad_yy_icg_scan_en,
  rtu_xx_ex1_cancel
);

// &Ports; @25
input          cp0_fpu_icg_en;            
input          cp0_yy_clk_en;             
input          cpurst_b;                  
input          ctrl_fmau_ex1_sel;         
input          ctrl_fmau_ex1_sel_gate;    
input          ctrl_xx_ex1_cmplt_dp;      
input          ctrl_xx_ex1_stall;         
input          ctrl_xx_ex2_cancel;        
input          ctrl_xx_ex2_stall;         
input          ctrl_xx_ex3_stall;         
input          ctrl_xx_ex4_stall;         
input          dp_ctrl_ex3_mac;           
input   [2:0]  dp_xx_ex1_id;              
input          ex2_special_cmplt;         
input          forever_cpuclk;            
input   [2:0]  idu_fpu_ex1_eu_sel;        
input          pad_yy_icg_scan_en;        
input          rtu_xx_ex1_cancel;         
output         ctrl_dp_ex1_inst_pipe_down; 
output         ctrl_dp_ex1_inst_vld;      
output         ctrl_dp_ex2_inst_pipe_down; 
output         ctrl_dp_ex2_inst_vld;      
output         ctrl_dp_ex3_inst_pipe_down; 
output         ctrl_dp_ex3_inst_vld;      
output  [1:0]  ex1_id_reg;                
output         fmau_fpu_ex1_cmplt;        
output         fmau_fpu_ex1_cmplt_dp;     
output         fmau_fpu_ex1_denorm_stall; 
output         fmau_fpu_ex3_result_vld;   
output         fmau_fpu_id_reg_set;       

// &Regs; @26
reg     [1:0]  ex1_id_reg;                
reg            ex2_inst_vld;              
reg            ex3_inst_vld;              
reg            ex4_inst_vld;              

// &Wires; @27
wire           cp0_fpu_icg_en;            
wire           cp0_yy_clk_en;             
wire           cpurst_b;                  
wire           ctrl_dp_ex1_inst_pipe_down; 
wire           ctrl_dp_ex1_inst_vld;      
wire           ctrl_dp_ex2_inst_pipe_down; 
wire           ctrl_dp_ex2_inst_vld;      
wire           ctrl_dp_ex3_inst_pipe_down; 
wire           ctrl_dp_ex3_inst_vld;      
wire           ctrl_fmau_ex1_sel;         
wire           ctrl_fmau_ex1_sel_gate;    
wire           ctrl_xx_ex1_cmplt_dp;      
wire           ctrl_xx_ex1_stall;         
wire           ctrl_xx_ex2_cancel;        
wire           ctrl_xx_ex2_stall;         
wire           ctrl_xx_ex3_stall;         
wire           ctrl_xx_ex4_stall;         
wire           dp_ctrl_ex3_mac;           
wire    [2:0]  dp_xx_ex1_id;              
wire           ex1_denormal_clk;          
wire           ex1_denormal_clk_en;       
wire           ex1_denormal_stall;        
wire           ex1_inst_vld;              
wire           ex2_ctrl_clk;              
wire           ex2_ctrl_clk_en;           
wire           ex2_special_cmplt;         
wire           ex3_ctrl_clk;              
wire           ex3_ctrl_clk_en;           
wire           ex4_ctrl_clk;              
wire           ex4_ctrl_clk_en;           
wire           fmau_fpu_ex1_cmplt;        
wire           fmau_fpu_ex1_cmplt_dp;     
wire           fmau_fpu_ex1_denorm_stall; 
wire           fmau_fpu_ex3_result_vld;   
wire           fmau_fpu_id_reg_set;       
wire           forever_cpuclk;            
wire    [2:0]  idu_fpu_ex1_eu_sel;        
wire           pad_yy_icg_scan_en;        
wire           rtu_xx_ex1_cancel;         


// &Depend("cpu_cfig.h"); @29

parameter DOUBLE_WIDTH = 64;
parameter DOUBLE_FRAC  = 52;
parameter DOUBLE_EXPN  = 11;

parameter SINGLE_WIDTH = 32;
parameter SINGLE_FRAC  = 23;
parameter SINGLE_EXPN  =  8;

parameter FUNC_WIDTH   = 10;

//==========================================================
//                     EX1 Interface
//==========================================================
assign ex1_inst_vld = ctrl_fmau_ex1_sel;

//==========================================================
//                     EX1 denormal judge
//==========================================================
// &Force("bus","dp_xx_ex1_id",2,0); @49

assign ex1_denormal_clk_en = ctrl_fmau_ex1_sel_gate && |dp_xx_ex1_id[1:0]
                          || |ex1_id_reg[1:0];

assign ex1_denormal_stall = ex1_inst_vld && (ex1_id_reg[1:0]==2'b00) && |dp_xx_ex1_id[1:0]; 

assign fmau_fpu_ex1_denorm_stall = ex1_denormal_stall;

assign fmau_fpu_ex1_cmplt = ex1_inst_vld && ((dp_xx_ex1_id[1:0]==2'b00) || |ex1_id_reg[1:0]);
assign fmau_fpu_ex1_cmplt_dp = ctrl_xx_ex1_cmplt_dp && idu_fpu_ex1_eu_sel[1] && ((dp_xx_ex1_id[1:0]==2'b00) || |ex1_id_reg[1:0]);
// &Force("bus","idu_fpu_ex1_eu_sel",2,0); @60
// &Instance("gated_clk_cell", "x_ctrl_ex1_denormal_gated_clk"); @61
gated_clk_cell  x_ctrl_ex1_denormal_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (ex1_denormal_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (ex1_denormal_clk_en),
  .module_en           (cp0_fpu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk      ), @62
//          .external_en (1'b0                ), @63
//          .global_en   (cp0_yy_clk_en       ), @64
//          .module_en   (cp0_fpu_icg_en      ), @65
//          .local_en    (ex1_denormal_clk_en ), @66
//          .clk_out     (ex1_denormal_clk    )); @67

always@(posedge ex1_denormal_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ex1_id_reg[1:0] <= {2{1'b0}};
  else if(ex1_denormal_stall)
    ex1_id_reg[1:0] <= dp_xx_ex1_id[1:0];
  else
    ex1_id_reg[1:0] <= {2{1'b0}};
end

assign fmau_fpu_id_reg_set = | ex1_id_reg[1:0];

// &Force("output","ex1_id_reg"); @81
//==========================================================
//                     EX2 inst vld ctrl
//==========================================================
assign ctrl_dp_ex1_inst_vld = ex1_inst_vld;
assign ctrl_dp_ex1_inst_pipe_down = ex1_inst_vld && !ctrl_xx_ex2_stall;

assign ex2_ctrl_clk_en = ctrl_fmau_ex1_sel_gate || ex2_inst_vld;

// &Instance("gated_clk_cell", "x_ctrl_ex2_gated_clk"); @90
gated_clk_cell  x_ctrl_ex2_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_ctrl_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_ctrl_clk_en   ),
  .module_en          (cp0_fpu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk      ), @91
//          .external_en (1'b0                ), @92
//          .global_en   (cp0_yy_clk_en       ), @93
//          .module_en   (cp0_fpu_icg_en      ), @94
//          .local_en    (ex2_ctrl_clk_en     ), @95
//          .clk_out     (ex2_ctrl_clk        )); @96

always@(posedge ex2_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ex2_inst_vld <= 1'b0;
  else if(ctrl_xx_ex2_cancel)
    ex2_inst_vld <= 1'b0;
  else if(!ctrl_xx_ex2_stall)
    ex2_inst_vld <= ex1_inst_vld && !rtu_xx_ex1_cancel && !ctrl_xx_ex1_stall;
  else
    ex2_inst_vld <= ex2_inst_vld;
end

//==========================================================
//                     EX3 inst vld ctrl
//==========================================================

assign ctrl_dp_ex2_inst_vld = ex2_inst_vld;
assign ctrl_dp_ex2_inst_pipe_down = ex2_inst_vld && !ctrl_xx_ex3_stall && !ex2_special_cmplt;

assign ex3_ctrl_clk_en = ex2_inst_vld || ex3_inst_vld;

// &Instance("gated_clk_cell", "x_ctrl_ex3_gated_clk"); @119
gated_clk_cell  x_ctrl_ex3_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex3_ctrl_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex3_ctrl_clk_en   ),
  .module_en          (cp0_fpu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk      ), @120
//          .external_en (1'b0                ), @121
//          .global_en   (cp0_yy_clk_en       ), @122
//          .module_en   (cp0_fpu_icg_en      ), @123
//          .local_en    (ex3_ctrl_clk_en     ), @124
//          .clk_out     (ex3_ctrl_clk        )); @125

always@(posedge ex3_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ex3_inst_vld <= 1'b0;
  else if(!ctrl_xx_ex3_stall)
    ex3_inst_vld <= ex2_inst_vld &&!ctrl_xx_ex2_cancel && !ex2_special_cmplt && !ctrl_xx_ex2_stall;
  else
    ex3_inst_vld <= ex3_inst_vld;
end

assign fmau_fpu_ex3_result_vld = ex3_inst_vld && !dp_ctrl_ex3_mac;
//==========================================================
//                     EX4 inst vld ctrl
//==========================================================

assign ctrl_dp_ex3_inst_vld = ex3_inst_vld && dp_ctrl_ex3_mac;
assign ctrl_dp_ex3_inst_pipe_down = ex3_inst_vld && dp_ctrl_ex3_mac && !ctrl_xx_ex4_stall;

assign ex4_ctrl_clk_en = ex3_inst_vld || ex4_inst_vld;

// &Instance("gated_clk_cell", "x_ctrl_ex4_gated_clk"); @147
gated_clk_cell  x_ctrl_ex4_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex4_ctrl_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex4_ctrl_clk_en   ),
  .module_en          (cp0_fpu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk      ), @148
//          .external_en (1'b0                ), @149
//          .global_en   (cp0_yy_clk_en       ), @150
//          .module_en   (cp0_fpu_icg_en      ), @151
//          .local_en    (ex4_ctrl_clk_en     ), @152
//          .clk_out     (ex4_ctrl_clk        )); @153

always@(posedge ex4_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ex4_inst_vld <= 1'b0;
  else if(!ctrl_xx_ex4_stall)
    ex4_inst_vld <= ex3_inst_vld && dp_ctrl_ex3_mac && !ctrl_xx_ex3_stall; 
  else
    ex4_inst_vld <= ex4_inst_vld;
end

//assign fmau_fpu_ex4_result_vld = ex4_inst_vld;

// &ModuleEnd; @167
endmodule



