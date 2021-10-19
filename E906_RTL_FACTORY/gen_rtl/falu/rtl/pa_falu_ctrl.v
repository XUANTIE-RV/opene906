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
module pa_falu_ctrl(
  cp0_fpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_falu_ex1_sel,
  ctrl_falu_ex1_sel_dp,
  ctrl_falu_ex1_sel_gate,
  ctrl_xx_ex1_cmplt_dp,
  ctrl_xx_ex1_inst_vld,
  ctrl_xx_ex1_stall,
  ctrl_xx_ex1_warm_up,
  ctrl_xx_ex2_cancel,
  ctrl_xx_ex2_stall,
  ctrl_xx_ex2_warm_up,
  ctrl_xx_ex3_stall,
  fadd_ex1_dp_fflags,
  fadd_ex1_dp_special_result,
  fadd_ex1_dp_special_sel,
  fadd_ex1_dp_special_sign,
  fadd_ex1_dp_wb_vld,
  fadd_ex1_pipe_clk,
  fadd_ex1_pipedown,
  fadd_ex1_sel,
  fadd_ex1_sel_dp,
  fadd_ex2_dp_fflags,
  fadd_ex2_dp_rst,
  fadd_ex2_dp_wb_vld,
  fadd_ex2_nocmp,
  fadd_ex2_nocmp_pipe_clk,
  fadd_ex2_nocmp_pipedown,
  fadd_ex2_pipe_clk,
  fadd_ex2_pipedown,
  fadd_ex2_sel,
  fadd_ex3_dp_fflags,
  fadd_ex3_dp_rst,
  fadd_ex3_dp_wb_vld,
  fadd_ex3_rtu_fflags,
  fadd_ex3_rtu_rst,
  fadd_ex3_rtu_wb_vld,
  fadd_ex3_sel,
  falu_ctrl_xx_ex1_vld,
  falu_ctrl_xx_ex2_vld,
  falu_ctrl_xx_ex3_vld,
  falu_fpu_ex1_cmplt,
  falu_fpu_ex1_cmplt_dp,
  falu_fpu_ex1_fflags,
  falu_fpu_ex1_result,
  falu_fpu_ex1_special_sel,
  falu_fpu_ex1_special_sign,
  falu_fpu_ex1_wb_gpr,
  falu_fpu_ex2_fflags,
  falu_fpu_ex2_result,
  falu_fpu_ex2_result_vld,
  falu_fpu_ex3_fflags,
  falu_fpu_ex3_result,
  falu_fpu_ex3_result_vld,
  falu_fpu_ex3_stall,
  falu_fpu_ex3_wb_gpr,
  fcnvt_ex1_dp_fflags,
  fcnvt_ex1_dp_special_result,
  fcnvt_ex1_dp_special_sel,
  fcnvt_ex1_dp_special_sign,
  fcnvt_ex1_dp_wb_vld,
  fcnvt_ex1_pipe_clk,
  fcnvt_ex1_pipedown,
  fcnvt_ex1_sel,
  fcnvt_ex1_sel_dp,
  fcnvt_ex2_pipe_clk,
  fcnvt_ex2_pipedown,
  fcnvt_ex3_dp_fflags,
  fcnvt_ex3_dp_rst,
  fcnvt_ex3_dp_wb_vld,
  fcnvt_ex3_fspu_vld,
  fcnvt_ex3_rtu_fflags,
  fcnvt_ex3_rtu_rst,
  fcnvt_ex3_rtu_wb_vld,
  fcnvt_ex3_sel,
  forever_cpuclk,
  fpu_rtu_ex3_wb_data,
  fpu_rtu_ex3_wb_fflags,
  fpu_rtu_ex3_wb_fflags_vld,
  fpu_rtu_ex3_wb_preg,
  fpu_rtu_ex3_wb_vld,
  fspu_ex1_dp_fflags,
  fspu_ex1_dp_special_result,
  fspu_ex1_dp_special_sel,
  fspu_ex1_dp_special_sign,
  fspu_ex1_dp_wb_vld,
  fspu_ex1_rtu_wb_vld,
  fspu_ex1_rtu_wb_vld_gate,
  fspu_sel,
  fspu_sel_dp,
  fspu_sel_gate,
  idu_fpu_ex1_dst_preg,
  idu_fpu_ex1_eu_sel,
  idu_fpu_ex1_func,
  pad_yy_icg_scan_en,
  rtu_fpu_ex3_wb_grant,
  rtu_xx_ex1_cancel
);

// &Ports; @23
input           cp0_fpu_icg_en;                 
input           cp0_yy_clk_en;                  
input           cpurst_b;                       
input           ctrl_falu_ex1_sel;              
input           ctrl_falu_ex1_sel_dp;           
input           ctrl_falu_ex1_sel_gate;         
input           ctrl_xx_ex1_cmplt_dp;           
input           ctrl_xx_ex1_inst_vld;           
input           ctrl_xx_ex1_stall;              
input           ctrl_xx_ex1_warm_up;            
input           ctrl_xx_ex2_cancel;             
input           ctrl_xx_ex2_stall;              
input           ctrl_xx_ex2_warm_up;            
input           ctrl_xx_ex3_stall;              
input   [4 :0]  fadd_ex1_dp_fflags;             
input   [31:0]  fadd_ex1_dp_special_result;     
input   [7 :0]  fadd_ex1_dp_special_sel;        
input   [2 :0]  fadd_ex1_dp_special_sign;       
input           fadd_ex1_dp_wb_vld;             
input   [4 :0]  fadd_ex2_dp_fflags;             
input   [31:0]  fadd_ex2_dp_rst;                
input           fadd_ex2_dp_wb_vld;             
input           fadd_ex2_nocmp;                 
input   [4 :0]  fadd_ex3_dp_fflags;             
input   [31:0]  fadd_ex3_dp_rst;                
input           fadd_ex3_dp_wb_vld;             
input   [4 :0]  fadd_ex3_rtu_fflags;            
input   [31:0]  fadd_ex3_rtu_rst;               
input           fadd_ex3_rtu_wb_vld;            
input   [4 :0]  fcnvt_ex1_dp_fflags;            
input   [31:0]  fcnvt_ex1_dp_special_result;    
input   [7 :0]  fcnvt_ex1_dp_special_sel;       
input   [2 :0]  fcnvt_ex1_dp_special_sign;      
input           fcnvt_ex1_dp_wb_vld;            
input   [4 :0]  fcnvt_ex3_dp_fflags;            
input   [31:0]  fcnvt_ex3_dp_rst;               
input           fcnvt_ex3_dp_wb_vld;            
input           fcnvt_ex3_fspu_vld;             
input   [4 :0]  fcnvt_ex3_rtu_fflags;           
input   [31:0]  fcnvt_ex3_rtu_rst;              
input           fcnvt_ex3_rtu_wb_vld;           
input           forever_cpuclk;                 
input   [4 :0]  fspu_ex1_dp_fflags;             
input   [31:0]  fspu_ex1_dp_special_result;     
input   [7 :0]  fspu_ex1_dp_special_sel;        
input   [2 :0]  fspu_ex1_dp_special_sign;       
input           fspu_ex1_dp_wb_vld;             
input           fspu_ex1_rtu_wb_vld;            
input           fspu_ex1_rtu_wb_vld_gate;       
input   [4 :0]  idu_fpu_ex1_dst_preg;           
input   [2 :0]  idu_fpu_ex1_eu_sel;             
input   [9 :0]  idu_fpu_ex1_func;               
input           pad_yy_icg_scan_en;             
input           rtu_fpu_ex3_wb_grant;           
input           rtu_xx_ex1_cancel;              
output          fadd_ex1_pipe_clk;              
output          fadd_ex1_pipedown;              
output          fadd_ex1_sel;                   
output          fadd_ex1_sel_dp;                
output          fadd_ex2_nocmp_pipe_clk;        
output          fadd_ex2_nocmp_pipedown;        
output          fadd_ex2_pipe_clk;              
output          fadd_ex2_pipedown;              
output          fadd_ex2_sel;                   
output          fadd_ex3_sel;                   
output          falu_ctrl_xx_ex1_vld;           
output          falu_ctrl_xx_ex2_vld;           
output          falu_ctrl_xx_ex3_vld;           
output          falu_fpu_ex1_cmplt;             
output          falu_fpu_ex1_cmplt_dp;          
output  [4 :0]  falu_fpu_ex1_fflags;            
output  [31:0]  falu_fpu_ex1_result;            
output  [8 :0]  falu_fpu_ex1_special_sel;       
output  [3 :0]  falu_fpu_ex1_special_sign;      
output          falu_fpu_ex1_wb_gpr;            
output  [4 :0]  falu_fpu_ex2_fflags;            
output  [31:0]  falu_fpu_ex2_result;            
output          falu_fpu_ex2_result_vld;        
output  [4 :0]  falu_fpu_ex3_fflags;            
output  [31:0]  falu_fpu_ex3_result;            
output          falu_fpu_ex3_result_vld;        
output          falu_fpu_ex3_stall;             
output          falu_fpu_ex3_wb_gpr;            
output          fcnvt_ex1_pipe_clk;             
output          fcnvt_ex1_pipedown;             
output          fcnvt_ex1_sel;                  
output          fcnvt_ex1_sel_dp;               
output          fcnvt_ex2_pipe_clk;             
output          fcnvt_ex2_pipedown;             
output          fcnvt_ex3_sel;                  
output  [31:0]  fpu_rtu_ex3_wb_data;            
output  [4 :0]  fpu_rtu_ex3_wb_fflags;          
output          fpu_rtu_ex3_wb_fflags_vld;      
output  [4 :0]  fpu_rtu_ex3_wb_preg;            
output          fpu_rtu_ex3_wb_vld;             
output          fspu_sel;                       
output          fspu_sel_dp;                    
output          fspu_sel_gate;                  

// &Regs; @24
reg             ctrl_xx_ex2_vld;                
reg             ctrl_xx_ex3_vld;                
reg             fadd_ex2_sel;                   
reg             fadd_ex3_sel;                   
reg     [4 :0]  falu_preg_ex2;                  
reg     [4 :0]  falu_preg_ex3;                  
reg             fcnvt_ex2_sel;                  
reg             fcnvt_ex3_sel;                  

// &Wires; @25
wire            cp0_fpu_icg_en;                 
wire            cp0_yy_clk_en;                  
wire            cpurst_b;                       
wire            ctrl_falu_ex1_sel;              
wire            ctrl_falu_ex1_sel_dp;           
wire            ctrl_falu_ex1_sel_gate;         
wire            ctrl_xx_ex1_cmplt_dp;           
wire            ctrl_xx_ex1_inst_vld;           
wire            ctrl_xx_ex1_stall;              
wire            ctrl_xx_ex1_warm_up;            
wire            ctrl_xx_ex2_cancel;             
wire            ctrl_xx_ex2_stall;              
wire            ctrl_xx_ex2_warm_up;            
wire            ctrl_xx_ex3_stall;              
wire    [4 :0]  fadd_ex1_dp_fflags;             
wire    [31:0]  fadd_ex1_dp_special_result;     
wire    [7 :0]  fadd_ex1_dp_special_sel;        
wire    [2 :0]  fadd_ex1_dp_special_sign;       
wire            fadd_ex1_dp_wb_vld;             
wire            fadd_ex1_pipe_clk;              
wire            fadd_ex1_pipedown;              
wire            fadd_ex1_pipedown_gate;         
wire            fadd_ex1_sel;                   
wire            fadd_ex1_sel_dp;                
wire            fadd_ex1_sel_gate;              
wire    [4 :0]  fadd_ex2_dp_fflags;             
wire    [31:0]  fadd_ex2_dp_rst;                
wire            fadd_ex2_dp_wb_vld;             
wire            fadd_ex2_nocmp;                 
wire            fadd_ex2_nocmp_pipe_clk;        
wire            fadd_ex2_nocmp_pipedown;        
wire            fadd_ex2_pipe_clk;              
wire            fadd_ex2_pipedown;              
wire    [4 :0]  fadd_ex3_dp_fflags;             
wire    [31:0]  fadd_ex3_dp_rst;                
wire            fadd_ex3_dp_wb_vld;             
wire    [4 :0]  fadd_ex3_rtu_fflags;            
wire    [31:0]  fadd_ex3_rtu_rst;               
wire            fadd_ex3_rtu_wb_vld;            
wire            falu_ctrl_ex1_pipe_clk;         
wire            falu_ctrl_ex1_pipedown_clk_en;  
wire            falu_ctrl_ex2_pipe_clk;         
wire            falu_ctrl_ex2_pipedown_clk_en;  
wire            falu_ctrl_xx_ex1_vld;           
wire            falu_ctrl_xx_ex2_vld;           
wire            falu_ctrl_xx_ex3_vld;           
wire            falu_ex1_wb_vld;                
wire    [4 :0]  falu_ex2_preg_dest;             
wire            falu_ex2_wb_vld;                
wire    [4 :0]  falu_ex3_preg_dest;             
wire            falu_fpu_ex1_cmplt;             
wire            falu_fpu_ex1_cmplt_dp;          
wire    [4 :0]  falu_fpu_ex1_fflags;            
wire    [31:0]  falu_fpu_ex1_result;            
wire    [8 :0]  falu_fpu_ex1_special_sel;       
wire    [7 :0]  falu_fpu_ex1_special_sel_t;     
wire    [3 :0]  falu_fpu_ex1_special_sign;      
wire    [2 :0]  falu_fpu_ex1_special_sign_t;    
wire            falu_fpu_ex1_wb_gpr;            
wire    [4 :0]  falu_fpu_ex2_fflags;            
wire    [31:0]  falu_fpu_ex2_result;            
wire            falu_fpu_ex2_result_vld;        
wire    [4 :0]  falu_fpu_ex3_fflags;            
wire    [31:0]  falu_fpu_ex3_result;            
wire            falu_fpu_ex3_result_vld;        
wire            falu_fpu_ex3_stall;             
wire            falu_fpu_ex3_wb_gpr;            
wire            falu_inst_ex1_raw;              
wire            falu_inst_ex2_raw;              
wire            falu_inst_vld_ex1_pipedown;     
wire            falu_inst_vld_ex1_pipedown_gate; 
wire            falu_inst_vld_ex2_pipedown;     
wire            falu_preg_ex1_pipedown;         
wire            falu_preg_ex2_pipedown;         
wire            falu_sel;                       
wire    [4 :0]  fcnvt_ex1_dp_fflags;            
wire    [31:0]  fcnvt_ex1_dp_special_result;    
wire    [7 :0]  fcnvt_ex1_dp_special_sel;       
wire    [2 :0]  fcnvt_ex1_dp_special_sign;      
wire            fcnvt_ex1_dp_wb_vld;            
wire            fcnvt_ex1_pipe_clk;             
wire            fcnvt_ex1_pipedown;             
wire            fcnvt_ex1_pipedown_gate;        
wire            fcnvt_ex1_sel;                  
wire            fcnvt_ex1_sel_dp;               
wire            fcnvt_ex1_sel_gate;             
wire            fcnvt_ex2_pipe_clk;             
wire            fcnvt_ex2_pipedown;             
wire    [4 :0]  fcnvt_ex3_dp_fflags;            
wire    [31:0]  fcnvt_ex3_dp_rst;               
wire            fcnvt_ex3_dp_wb_vld;            
wire            fcnvt_ex3_fspu_vld;             
wire    [4 :0]  fcnvt_ex3_rtu_fflags;           
wire    [31:0]  fcnvt_ex3_rtu_rst;              
wire            fcnvt_ex3_rtu_wb_vld;           
wire            forever_cpuclk;                 
wire            fpu_rtu_ex1_wb_vld;             
wire    [31:0]  fpu_rtu_ex3_wb_data;            
wire    [4 :0]  fpu_rtu_ex3_wb_fflags;          
wire            fpu_rtu_ex3_wb_fflags_vld;      
wire    [4 :0]  fpu_rtu_ex3_wb_preg;            
wire            fpu_rtu_ex3_wb_vld;             
wire    [4 :0]  fspu_ex1_dp_fflags;             
wire    [31:0]  fspu_ex1_dp_special_result;     
wire    [7 :0]  fspu_ex1_dp_special_sel;        
wire    [2 :0]  fspu_ex1_dp_special_sign;       
wire            fspu_ex1_dp_wb_vld;             
wire            fspu_ex1_rtu_wb_vld;            
wire            fspu_ex1_rtu_wb_vld_gate;       
wire            fspu_sel;                       
wire            fspu_sel_dp;                    
wire            fspu_sel_gate;                  
wire    [4 :0]  idu_fpu_ex1_dst_preg;           
wire    [2 :0]  idu_fpu_ex1_eu_sel;             
wire    [9 :0]  idu_fpu_ex1_func;               
wire            pad_yy_icg_scan_en;             
wire            rtu_fpu_ex3_wb_grant;           
wire            rtu_xx_ex1_cancel;              
wire            sel_ex1_pipedown;               
wire            sel_ex2_pipedown;               


// &Force("bus", "idu_fpu_ex1_func", 9, 0); @27
// &Force("output", "fadd_ex1_pipedown"); @28
// &Force("output", "fadd_ex2_pipedown"); @29
// &Force("output", "fcnvt_ex1_pipedown"); @30
// &Force("output", "fcnvt_ex2_pipedown"); @31
// &Force("output", "fadd_ex2_nocmp_pipedown"); @32
// &Force("output", "fpu_rtu_ex3_wb_vld"); @33
// &Force("output", "fadd_ex2_sel"); @34
// &Force("output", "fcnvt_ex3_sel"); @35
// &Force("output", "fadd_ex3_sel"); @36
// &Force("output", "fcnvt_ex1_sel"); @37
// &Force("output", "fadd_ex1_sel"); @38
// &Force("output", "falu_ctrl_xx_ex1_vld"); @39
// &Force("output", "falu_ctrl_xx_ex2_vld"); @40
// &Force("output", "falu_ctrl_xx_ex3_vld"); @41

//==============================================================================
//                   Ctrl For FALU Pipedown:
//==============================================================================
//------------------------------------------------------------------------------
//                    fadd pipedown ctrl:
//------------------------------------------------------------------------------
assign falu_sel          = ctrl_falu_ex1_sel;
assign fadd_ex1_pipedown      = fadd_ex1_sel && falu_inst_ex1_raw && !ctrl_xx_ex2_stall || ctrl_xx_ex1_warm_up;
assign fadd_ex1_pipedown_gate = fadd_ex1_sel_gate  && !ctrl_xx_ex2_stall || ctrl_xx_ex1_warm_up;
assign fadd_ex2_pipedown = fadd_ex2_sel && falu_inst_ex2_raw && !ctrl_xx_ex3_stall || ctrl_xx_ex2_warm_up;
// &Instance("gated_clk_cell", "x_fadd_ex1_pipe_clk"); @53
gated_clk_cell  x_fadd_ex1_pipe_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (fadd_ex1_pipe_clk     ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (fadd_ex1_pipedown_gate),
  .module_en              (cp0_fpu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in      (forever_cpuclk      ), @54
//          .external_en (1'b0                ), @55
//          .global_en   (cp0_yy_clk_en       ), @56
//          .module_en   (cp0_fpu_icg_en      ), @57
//          .local_en    (fadd_ex1_pipedown_gate   ), @58
//          .clk_out     (fadd_ex1_pipe_clk   )); @59


// &Instance("gated_clk_cell", "x_fadd_ex2_pipe_clk"); @62
gated_clk_cell  x_fadd_ex2_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (fadd_ex2_pipe_clk ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (fadd_ex2_pipedown ),
  .module_en          (cp0_fpu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk      ), @63
//          .external_en (1'b0                ), @64
//          .global_en   (cp0_yy_clk_en       ), @65
//          .module_en   (cp0_fpu_icg_en      ), @66
//          .local_en    (fadd_ex2_pipedown   ), @67
//          .clk_out     (fadd_ex2_pipe_clk   )); @68


// when fadd ex2 is not fle/flt/feq
assign fadd_ex2_nocmp_pipedown = fadd_ex2_sel && falu_inst_ex2_raw && !ctrl_xx_ex3_stall && fadd_ex2_nocmp || ctrl_xx_ex2_warm_up;
// &Instance("gated_clk_cell", "x_fadd_ex1_nocmp_pipe_clk"); @73
gated_clk_cell  x_fadd_ex1_nocmp_pipe_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (fadd_ex2_nocmp_pipe_clk),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (fadd_ex2_nocmp_pipedown),
  .module_en               (cp0_fpu_icg_en         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Connect(.clk_in      (forever_cpuclk           ), @74
//          .external_en (1'b0                     ), @75
//          .global_en   (cp0_yy_clk_en            ), @76
//          .module_en   (cp0_fpu_icg_en           ), @77
//          .local_en    (fadd_ex2_nocmp_pipedown ), @78
//          .clk_out     (fadd_ex2_nocmp_pipe_clk )); @79


//------------------------------------------------------------------------------
//                    fcnvt pipedown ctrl:
//------------------------------------------------------------------------------
assign fcnvt_ex1_pipedown = (fspu_ex1_rtu_wb_vld || fcnvt_ex1_sel && falu_inst_ex1_raw) && !ctrl_xx_ex2_stall || ctrl_xx_ex1_warm_up ;
assign fcnvt_ex1_pipedown_gate = (fspu_ex1_rtu_wb_vld_gate || fcnvt_ex1_sel_gate) && !ctrl_xx_ex2_stall || ctrl_xx_ex1_warm_up ;
assign fcnvt_ex2_pipedown = fcnvt_ex2_sel && falu_inst_ex2_raw && !ctrl_xx_ex3_stall || ctrl_xx_ex2_warm_up;

// &Instance("gated_clk_cell", "x_fcnvt_ex1_pipe_clk"); @89
gated_clk_cell  x_fcnvt_ex1_pipe_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (fcnvt_ex1_pipe_clk     ),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (fcnvt_ex1_pipedown_gate),
  .module_en               (cp0_fpu_icg_en         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Connect(.clk_in      (forever_cpuclk      ), @90
//          .external_en (1'b0                ), @91
//          .global_en   (cp0_yy_clk_en       ), @92
//          .module_en   (cp0_fpu_icg_en      ), @93
//          .local_en    (fcnvt_ex1_pipedown_gate   ), @94
//          .clk_out     (fcnvt_ex1_pipe_clk   )); @95

// &Instance("gated_clk_cell", "x_fcnvt_ex2_pipe_clk"); @97
gated_clk_cell  x_fcnvt_ex2_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (fcnvt_ex2_pipe_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (fcnvt_ex2_pipedown),
  .module_en          (cp0_fpu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk      ), @98
//          .external_en (1'b0                ), @99
//          .global_en   (cp0_yy_clk_en       ), @100
//          .module_en   (cp0_fpu_icg_en      ), @101
//          .local_en    (fcnvt_ex2_pipedown   ), @102
//          .clk_out     (fcnvt_ex2_pipe_clk   )); @103

//assign fspu_ex1_pipedown = fspu_sel && falu_inst_ex1_raw && !ctrl_xx_ex2_stall || ctrl_xx_ex1_warm_up;
//assign fspu_ex2_pipedown = fcnvt_ex2_sel && falu_inst_ex2_raw && !ctrl_xx_ex3_stall || ctrl_xx_ex2_warm_up;


assign falu_preg_ex1_pipedown = fadd_ex1_pipedown || fcnvt_ex1_pipedown;
assign falu_preg_ex2_pipedown = fadd_ex2_pipedown || fcnvt_ex2_pipedown;


//------------------------------------------------------------------------------
//                           FALU EX1 Interface with RTU:
//------------------------------------------------------------------------------
//assign fpu_rtu_ex1_wb_vld         = fadd_ex1_rtu_wb_vld || fcnvt_ex1_rtu_wb_vld || fspu_ex1_rtu_wb_vld;
//assign fpu_rtu_ex1_wb_data[31:0]  = {32{fadd_ex1_rtu_wb_vld}}  & fadd_ex1_rtu_rst[31:0]  |
//                                    {32{fcnvt_ex1_rtu_wb_vld}} & fcnvt_ex1_rtu_rst[31:0] |
//                                    {32{fspu_ex1_rtu_wb_vld}}  & fspu_ex1_rtu_rst[31:0];
// here the spu value will borrow the fcnvt ftoi path

//assign fpu_rtu_ex1_fflags_updt    = fadd_ex1_rtu_wb_vld || fcnvt_ex1_rtu_wb_vld;
//assign fpu_rtu_ex1_wb_fflags[4:0] = {5{fadd_ex1_rtu_wb_vld}}  & fadd_ex1_rtu_fflags[4:0]  |
//                                    {5{fcnvt_ex1_rtu_wb_vld}} & fcnvt_ex1_rtu_fflags[4:0] |
//                                    {5{fspu_ex1_rtu_wb_vld}}  & fspu_ex1_rtu_fflags[4:0];
//assign fpu_rtu_ex1_wb_preg[4:0]   = idu_fpu_ex1_dst_preg[4:0];

assign fpu_rtu_ex1_wb_vld         = 1'b0;


//------------------------------------------------------------------------------
//                           FALU EX3 Interface with RTU:
//------------------------------------------------------------------------------
assign fpu_rtu_ex3_wb_vld         = fadd_ex3_rtu_wb_vld || fcnvt_ex3_rtu_wb_vld;
assign fpu_rtu_ex3_wb_fflags_vld  = fadd_ex3_rtu_wb_vld || (fcnvt_ex3_rtu_wb_vld && ~fcnvt_ex3_fspu_vld);
assign fpu_rtu_ex3_wb_data[31:0]  = {32{fadd_ex3_rtu_wb_vld}}  & fadd_ex3_rtu_rst[31:0] |
                                   {32{fcnvt_ex3_rtu_wb_vld}} & fcnvt_ex3_rtu_rst[31:0];
assign fpu_rtu_ex3_wb_fflags[4:0] = {5{fadd_ex3_rtu_wb_vld}}  & fadd_ex3_rtu_fflags[4:0] |
                                    {5{fcnvt_ex3_rtu_wb_vld}} & fcnvt_ex3_rtu_fflags[4:0];
assign fpu_rtu_ex3_wb_preg[4:0]   = falu_ex3_preg_dest[4:0];


//------------------------------------------------------------------------------
//                           FALU EX1 Interface with FPU:
//------------------------------------------------------------------------------
assign falu_fpu_ex1_special_sel_t[7:0]  = {8{fadd_ex1_dp_wb_vld}}  & fadd_ex1_dp_special_sel[7:0]  |
                                          {8{fcnvt_ex1_dp_wb_vld}} & fcnvt_ex1_dp_special_sel[7:0] |
                                          {8{fspu_ex1_dp_wb_vld}}  & fspu_ex1_dp_special_sel[7:0];
assign falu_fpu_ex1_special_sel[8:0]    = {falu_fpu_ex1_special_sel_t[7:3], 1'b0, falu_fpu_ex1_special_sel_t[2:0]};
assign falu_fpu_ex1_special_sign_t[2:0] = {3{fadd_ex1_dp_wb_vld}}  & fadd_ex1_dp_special_sign[2:0]  |
                                          {3{fcnvt_ex1_dp_wb_vld}} & fcnvt_ex1_dp_special_sign[2:0] |
                                          {3{fspu_ex1_dp_wb_vld}}  & fspu_ex1_dp_special_sign[2:0];
assign falu_fpu_ex1_special_sign[3:0] = {1'b0, falu_fpu_ex1_special_sign_t[2:0]};
assign falu_fpu_ex1_fflags[4:0]       = {5{fadd_ex1_dp_wb_vld}}  & fadd_ex1_dp_fflags[4:0]    |
                                        {5{fcnvt_ex1_dp_wb_vld}} & fcnvt_ex1_dp_fflags[4:0] |
                                        {5{fspu_ex1_dp_wb_vld}}  & fspu_ex1_dp_fflags[4:0];
assign falu_fpu_ex1_wb_gpr            = 1'b0;
assign falu_fpu_ex1_cmplt             = ctrl_xx_ex1_inst_vld && falu_sel;
assign falu_fpu_ex1_cmplt_dp          = ctrl_xx_ex1_cmplt_dp && idu_fpu_ex1_eu_sel[0];
// &Force("bus","idu_fpu_ex1_eu_sel",2,0); @160

//------------------------------------------------------------------------------
//                           FALU EX2 Interface with FPU:
//------------------------------------------------------------------------------
assign falu_fpu_ex2_result_vld   = fadd_ex2_dp_wb_vld;
assign falu_fpu_ex2_fflags[4:0]  = fadd_ex2_dp_fflags[4:0];


//------------------------------------------------------------------------------
//                           FALU EX3 Interface with FPU:
//------------------------------------------------------------------------------
assign falu_fpu_ex3_result_vld   = fadd_ex3_dp_wb_vld  || fcnvt_ex3_dp_wb_vld;
assign falu_fpu_ex3_fflags[4:0]  = fadd_ex3_dp_wb_vld   ? fadd_ex3_dp_fflags[4:0] : fcnvt_ex3_dp_fflags[4:0];
assign falu_fpu_ex3_wb_gpr       = fadd_ex3_rtu_wb_vld || fcnvt_ex3_rtu_wb_vld;
assign falu_fpu_ex3_stall        = fpu_rtu_ex3_wb_vld  && !rtu_fpu_ex3_wb_grant;


//------------------------------------------------------------------------------
//                           FALU Data Path Interface with FPU:
//------------------------------------------------------------------------------
assign falu_fpu_ex1_result[31:0] = {32{fadd_ex1_dp_wb_vld}}  &  fadd_ex1_dp_special_result[31:0]  |
                                   {32{fcnvt_ex1_dp_wb_vld}} &  fcnvt_ex1_dp_special_result[31:0] |
                                   {32{fspu_ex1_dp_wb_vld}}  &  fspu_ex1_dp_special_result[31:0];
assign falu_fpu_ex2_result[31:0] = fadd_ex2_dp_rst[31:0];
assign falu_fpu_ex3_result[31:0] = fadd_ex3_dp_wb_vld ? fadd_ex3_dp_rst[31:0] : fcnvt_ex3_dp_rst[31:0];


//------------------------------------------------------------------------------
//                           ctrl for inst_vld and sel signals:
//------------------------------------------------------------------------------

assign fadd_ex1_sel      = ctrl_falu_ex1_sel && idu_fpu_ex1_func[0];
assign fadd_ex1_sel_gate = ctrl_falu_ex1_sel_gate && idu_fpu_ex1_func[0];
assign fcnvt_ex1_sel     = ctrl_falu_ex1_sel && idu_fpu_ex1_func[1];
assign fcnvt_ex1_sel_gate= ctrl_falu_ex1_sel_gate && idu_fpu_ex1_func[1];
assign fspu_sel          = ctrl_falu_ex1_sel && idu_fpu_ex1_func[2];
assign fspu_sel_gate     = ctrl_falu_ex1_sel_gate && idu_fpu_ex1_func[2];

assign fadd_ex1_sel_dp   = ctrl_falu_ex1_sel_dp && idu_fpu_ex1_func[0];
assign fcnvt_ex1_sel_dp  = ctrl_falu_ex1_sel_dp && idu_fpu_ex1_func[1];
assign fspu_sel_dp       = ctrl_falu_ex1_sel_dp && idu_fpu_ex1_func[2];
// &Force("output","fspu_sel"); @215
assign sel_ex1_pipedown  = ctrl_falu_ex1_sel && !falu_ex1_wb_vld && !ctrl_xx_ex2_stall || ctrl_xx_ex1_warm_up;
assign sel_ex2_pipedown  = fadd_ex2_pipedown || fcnvt_ex2_pipedown;

assign falu_ex1_wb_vld   = fadd_ex1_dp_wb_vld || fpu_rtu_ex1_wb_vld || fcnvt_ex1_dp_wb_vld || fspu_sel & ~fspu_ex1_rtu_wb_vld;
assign falu_ex2_wb_vld   = fadd_ex2_dp_wb_vld;

assign falu_inst_ex1_raw = falu_ctrl_xx_ex1_vld && !falu_ex1_wb_vld;
assign falu_inst_ex2_raw = falu_ctrl_xx_ex2_vld && !falu_ex2_wb_vld;
assign falu_inst_vld_ex1_pipedown = !ctrl_xx_ex2_stall && (falu_inst_ex1_raw || falu_ctrl_xx_ex2_vld || fspu_ex1_rtu_wb_vld);
assign falu_inst_vld_ex1_pipedown_gate = !ctrl_xx_ex2_stall && (ctrl_falu_ex1_sel_gate || falu_ctrl_xx_ex2_vld || fspu_ex1_rtu_wb_vld_gate);
assign falu_inst_vld_ex2_pipedown = !ctrl_xx_ex3_stall && (falu_inst_ex2_raw || falu_ctrl_xx_ex3_vld);

assign falu_ctrl_ex1_pipedown_clk_en = falu_inst_vld_ex1_pipedown_gate || ctrl_xx_ex1_warm_up;
assign falu_ctrl_ex2_pipedown_clk_en = falu_inst_vld_ex2_pipedown || ctrl_xx_ex2_warm_up;

// &Instance("gated_clk_cell", "x_falu_ctrl_ex1_pipe_clk"); @231
gated_clk_cell  x_falu_ctrl_ex1_pipe_clk (
  .clk_in                        (forever_cpuclk               ),
  .clk_out                       (falu_ctrl_ex1_pipe_clk       ),
  .external_en                   (1'b0                         ),
  .global_en                     (cp0_yy_clk_en                ),
  .local_en                      (falu_ctrl_ex1_pipedown_clk_en),
  .module_en                     (cp0_fpu_icg_en               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           )
);

// &Connect(.clk_in      (forever_cpuclk                 ), @232
//          .external_en (1'b0                           ), @233
//          .global_en   (cp0_yy_clk_en                  ), @234
//          .module_en   (cp0_fpu_icg_en                 ), @235
//          .local_en    (falu_ctrl_ex1_pipedown_clk_en  ), @236
//          .clk_out     (falu_ctrl_ex1_pipe_clk         ) @237
//          ); @238

// &Instance("gated_clk_cell", "x_falu_ctrl_ex2_pipe_clk"); @240
gated_clk_cell  x_falu_ctrl_ex2_pipe_clk (
  .clk_in                        (forever_cpuclk               ),
  .clk_out                       (falu_ctrl_ex2_pipe_clk       ),
  .external_en                   (1'b0                         ),
  .global_en                     (cp0_yy_clk_en                ),
  .local_en                      (falu_ctrl_ex2_pipedown_clk_en),
  .module_en                     (cp0_fpu_icg_en               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           )
);

// &Connect(.clk_in      (forever_cpuclk                 ), @241
//          .external_en (1'b0                           ), @242
//          .global_en   (cp0_yy_clk_en                  ), @243
//          .module_en   (cp0_fpu_icg_en                 ), @244
//          .local_en    (falu_ctrl_ex2_pipedown_clk_en  ), @245
//          .clk_out     (falu_ctrl_ex2_pipe_clk         ) @246
//          ); @247


//------------------------------------------------------------------------------
//                           sel signals pipedown:
//------------------------------------------------------------------------------
always @(posedge falu_ctrl_ex1_pipe_clk)
begin
  if(sel_ex1_pipedown) begin
    fcnvt_ex2_sel <= fcnvt_ex1_sel || fspu_ex1_rtu_wb_vld;
    fadd_ex2_sel  <= fadd_ex1_sel;
  end
end

always @(posedge falu_ctrl_ex2_pipe_clk)
begin
  if(sel_ex2_pipedown) begin
    fcnvt_ex3_sel <= fcnvt_ex2_sel;
    fadd_ex3_sel  <= fadd_ex2_sel;
  end
end


//------------------------------------------------------------------------------
//                           inst_vld signals pipedown:
//------------------------------------------------------------------------------
always @(posedge falu_ctrl_ex1_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_xx_ex2_vld <= 1'b0;
  else if(falu_inst_vld_ex1_pipedown)
    ctrl_xx_ex2_vld <= falu_inst_ex1_raw && !ctrl_xx_ex1_stall && !rtu_xx_ex1_cancel;
end

always @(posedge falu_ctrl_ex2_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_xx_ex3_vld <= 1'b0;
  else if(falu_inst_vld_ex2_pipedown)
    ctrl_xx_ex3_vld <= falu_inst_ex2_raw && !ctrl_xx_ex2_cancel;
end


//------------------------------------------------------------------------------
//                           preg  pipedown:
//------------------------------------------------------------------------------
assign falu_ex2_preg_dest[4:0] = falu_preg_ex2[4:0];
assign falu_ex3_preg_dest[4:0] = falu_preg_ex3[4:0];

always @(posedge falu_ctrl_ex1_pipe_clk)
begin
  if(falu_preg_ex1_pipedown) begin
    falu_preg_ex2[4:0] <= idu_fpu_ex1_dst_preg[4:0];
  end
end

always @(posedge falu_ctrl_ex2_pipe_clk)
begin
  if(falu_preg_ex2_pipedown) begin
    falu_preg_ex3[4:0] <= falu_ex2_preg_dest[4:0];
  end
end


//------------------------------------------------------------------------------
//                           Rename for output:
//------------------------------------------------------------------------------
assign falu_ctrl_xx_ex1_vld = ctrl_falu_ex1_sel;
assign falu_ctrl_xx_ex2_vld = ctrl_xx_ex2_vld;
assign falu_ctrl_xx_ex3_vld = ctrl_xx_ex3_vld;



// &ModuleEnd; @370
endmodule


