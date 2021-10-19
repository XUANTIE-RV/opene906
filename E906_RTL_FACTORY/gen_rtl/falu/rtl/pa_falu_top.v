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
module pa_falu_top(
  cp0_fpu_icg_en,
  cp0_fpu_xx_dqnan,
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
  dp_xx_ex1_cnan,
  dp_xx_ex1_id,
  dp_xx_ex1_inf,
  dp_xx_ex1_norm,
  dp_xx_ex1_qnan,
  dp_xx_ex1_rm,
  dp_xx_ex1_snan,
  dp_xx_ex1_zero,
  dp_xx_ex2_rm,
  dp_xx_ex2_srcf2,
  dp_xx_ex3_rm,
  falu_fpu_ex1_cmplt,
  falu_fpu_ex1_cmplt_dp,
  falu_fpu_ex1_fflags,
  falu_fpu_ex1_result,
  falu_fpu_ex1_special_sel,
  falu_fpu_ex1_special_sign,
  falu_fpu_ex1_src_reuse,
  falu_fpu_ex1_src_reuse_data,
  falu_fpu_ex1_wb_gpr,
  falu_fpu_ex2_fflags,
  falu_fpu_ex2_result,
  falu_fpu_ex2_result_vld,
  falu_fpu_ex3_fflags,
  falu_fpu_ex3_result,
  falu_fpu_ex3_result_vld,
  falu_fpu_ex3_stall,
  falu_fpu_ex3_wb_gpr,
  forever_cpuclk,
  fpu_rtu_ex3_wb_data,
  fpu_rtu_ex3_wb_fflags,
  fpu_rtu_ex3_wb_fflags_vld,
  fpu_rtu_ex3_wb_preg,
  fpu_rtu_ex3_wb_vld,
  idu_fpu_ex1_dst_preg,
  idu_fpu_ex1_eu_sel,
  idu_fpu_ex1_func,
  idu_fpu_ex1_srcf0,
  idu_fpu_ex1_srcf1,
  idu_fpu_ex1_srci,
  pad_yy_icg_scan_en,
  rtu_fpu_ex3_wb_grant,
  rtu_xx_ex1_cancel
);

// &Ports; @24
input           cp0_fpu_icg_en;             
input           cp0_fpu_xx_dqnan;           
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
input   [2 :0]  dp_xx_ex1_cnan;             
input   [2 :0]  dp_xx_ex1_id;               
input   [2 :0]  dp_xx_ex1_inf;              
input   [2 :0]  dp_xx_ex1_norm;             
input   [2 :0]  dp_xx_ex1_qnan;             
input   [2 :0]  dp_xx_ex1_rm;               
input   [2 :0]  dp_xx_ex1_snan;             
input   [2 :0]  dp_xx_ex1_zero;             
input   [2 :0]  dp_xx_ex2_rm;               
input   [31:0]  dp_xx_ex2_srcf2;            
input   [2 :0]  dp_xx_ex3_rm;               
input           forever_cpuclk;             
input   [4 :0]  idu_fpu_ex1_dst_preg;       
input   [2 :0]  idu_fpu_ex1_eu_sel;         
input   [9 :0]  idu_fpu_ex1_func;           
input   [31:0]  idu_fpu_ex1_srcf0;          
input   [31:0]  idu_fpu_ex1_srcf1;          
input   [31:0]  idu_fpu_ex1_srci;           
input           pad_yy_icg_scan_en;         
input           rtu_fpu_ex3_wb_grant;       
input           rtu_xx_ex1_cancel;          
output          falu_fpu_ex1_cmplt;         
output          falu_fpu_ex1_cmplt_dp;      
output  [4 :0]  falu_fpu_ex1_fflags;        
output  [31:0]  falu_fpu_ex1_result;        
output  [8 :0]  falu_fpu_ex1_special_sel;   
output  [3 :0]  falu_fpu_ex1_special_sign;  
output          falu_fpu_ex1_src_reuse;     
output  [31:0]  falu_fpu_ex1_src_reuse_data; 
output          falu_fpu_ex1_wb_gpr;        
output  [4 :0]  falu_fpu_ex2_fflags;        
output  [31:0]  falu_fpu_ex2_result;        
output          falu_fpu_ex2_result_vld;    
output  [4 :0]  falu_fpu_ex3_fflags;        
output  [31:0]  falu_fpu_ex3_result;        
output          falu_fpu_ex3_result_vld;    
output          falu_fpu_ex3_stall;         
output          falu_fpu_ex3_wb_gpr;        
output  [31:0]  fpu_rtu_ex3_wb_data;        
output  [4 :0]  fpu_rtu_ex3_wb_fflags;      
output          fpu_rtu_ex3_wb_fflags_vld;  
output  [4 :0]  fpu_rtu_ex3_wb_preg;        
output          fpu_rtu_ex3_wb_vld;         

// &Regs; @25

// &Wires; @26
wire            cp0_fpu_icg_en;             
wire            cp0_fpu_xx_dqnan;           
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
wire    [2 :0]  dp_xx_ex1_cnan;             
wire    [2 :0]  dp_xx_ex1_id;               
wire    [2 :0]  dp_xx_ex1_inf;              
wire    [2 :0]  dp_xx_ex1_norm;             
wire    [2 :0]  dp_xx_ex1_qnan;             
wire    [2 :0]  dp_xx_ex1_rm;               
wire    [2 :0]  dp_xx_ex1_snan;             
wire    [2 :0]  dp_xx_ex1_zero;             
wire    [2 :0]  dp_xx_ex2_rm;               
wire    [31:0]  dp_xx_ex2_srcf2;            
wire    [2 :0]  dp_xx_ex3_rm;               
wire    [4 :0]  fadd_ex1_dp_fflags;         
wire    [31:0]  fadd_ex1_dp_special_result; 
wire    [7 :0]  fadd_ex1_dp_special_sel;    
wire    [2 :0]  fadd_ex1_dp_special_sign;   
wire            fadd_ex1_dp_wb_vld;         
wire            fadd_ex1_pipe_clk;          
wire            fadd_ex1_pipedown;          
wire            fadd_ex1_sel;               
wire            fadd_ex1_sel_dp;            
wire    [4 :0]  fadd_ex2_dp_fflags;         
wire    [31:0]  fadd_ex2_dp_rst;            
wire            fadd_ex2_dp_wb_vld;         
wire            fadd_ex2_nocmp;             
wire            fadd_ex2_nocmp_pipe_clk;    
wire            fadd_ex2_nocmp_pipedown;    
wire            fadd_ex2_pipe_clk;          
wire            fadd_ex2_pipedown;          
wire            fadd_ex2_sel;               
wire    [4 :0]  fadd_ex3_dp_fflags;         
wire    [31:0]  fadd_ex3_dp_rst;            
wire            fadd_ex3_dp_wb_vld;         
wire    [4 :0]  fadd_ex3_rtu_fflags;        
wire    [31:0]  fadd_ex3_rtu_rst;           
wire            fadd_ex3_rtu_wb_vld;        
wire            fadd_ex3_sel;               
wire            falu_ctrl_xx_ex1_vld;       
wire            falu_ctrl_xx_ex2_vld;       
wire            falu_ctrl_xx_ex3_vld;       
wire            falu_fpu_ex1_cmplt;         
wire            falu_fpu_ex1_cmplt_dp;      
wire    [4 :0]  falu_fpu_ex1_fflags;        
wire    [31:0]  falu_fpu_ex1_result;        
wire    [8 :0]  falu_fpu_ex1_special_sel;   
wire    [3 :0]  falu_fpu_ex1_special_sign;  
wire            falu_fpu_ex1_src_reuse;     
wire    [31:0]  falu_fpu_ex1_src_reuse_data; 
wire            falu_fpu_ex1_wb_gpr;        
wire    [4 :0]  falu_fpu_ex2_fflags;        
wire    [31:0]  falu_fpu_ex2_result;        
wire            falu_fpu_ex2_result_vld;    
wire    [4 :0]  falu_fpu_ex3_fflags;        
wire    [31:0]  falu_fpu_ex3_result;        
wire            falu_fpu_ex3_result_vld;    
wire            falu_fpu_ex3_stall;         
wire            falu_fpu_ex3_wb_gpr;        
wire    [4 :0]  fcnvt_ex1_dp_fflags;        
wire    [31:0]  fcnvt_ex1_dp_special_result; 
wire    [7 :0]  fcnvt_ex1_dp_special_sel;   
wire    [2 :0]  fcnvt_ex1_dp_special_sign;  
wire            fcnvt_ex1_dp_wb_vld;        
wire            fcnvt_ex1_pipe_clk;         
wire            fcnvt_ex1_pipedown;         
wire            fcnvt_ex1_sel;              
wire            fcnvt_ex1_sel_dp;           
wire            fcnvt_ex2_pipe_clk;         
wire            fcnvt_ex2_pipedown;         
wire    [4 :0]  fcnvt_ex3_dp_fflags;        
wire    [31:0]  fcnvt_ex3_dp_rst;           
wire            fcnvt_ex3_dp_wb_vld;        
wire            fcnvt_ex3_fspu_vld;         
wire    [4 :0]  fcnvt_ex3_rtu_fflags;       
wire    [31:0]  fcnvt_ex3_rtu_rst;          
wire            fcnvt_ex3_rtu_wb_vld;       
wire            fcnvt_ex3_sel;              
wire            forever_cpuclk;             
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
wire    [31:0]  fspu_ex1_rtu_rst;           
wire            fspu_ex1_rtu_wb_vld;        
wire            fspu_ex1_rtu_wb_vld_gate;   
wire            fspu_sel;                   
wire            fspu_sel_dp;                
wire            fspu_sel_gate;              
wire    [4 :0]  idu_fpu_ex1_dst_preg;       
wire    [2 :0]  idu_fpu_ex1_eu_sel;         
wire    [9 :0]  idu_fpu_ex1_func;           
wire    [31:0]  idu_fpu_ex1_srcf0;          
wire    [31:0]  idu_fpu_ex1_srcf1;          
wire    [31:0]  idu_fpu_ex1_srci;           
wire            pad_yy_icg_scan_en;         
wire            rtu_fpu_ex3_wb_grant;       
wire            rtu_xx_ex1_cancel;          



// &Instance("pa_fcnvt_double"); @30
// &Instance("pa_fadd_double"); @31
// &Instance("pa_fspu_double"); @32
// &Instance("pa_fcnvt_single"); @34
pa_fcnvt_single  x_pa_fcnvt_single (
  .ctrl_xx_ex1_warm_up         (ctrl_xx_ex1_warm_up        ),
  .dp_xx_ex1_cnan              (dp_xx_ex1_cnan             ),
  .dp_xx_ex1_inf               (dp_xx_ex1_inf              ),
  .dp_xx_ex1_qnan              (dp_xx_ex1_qnan             ),
  .dp_xx_ex1_snan              (dp_xx_ex1_snan             ),
  .dp_xx_ex1_zero              (dp_xx_ex1_zero             ),
  .dp_xx_ex2_rm                (dp_xx_ex2_rm               ),
  .falu_ctrl_xx_ex1_vld        (falu_ctrl_xx_ex1_vld       ),
  .falu_ctrl_xx_ex3_vld        (falu_ctrl_xx_ex3_vld       ),
  .fcnvt_ex1_dp_fflags         (fcnvt_ex1_dp_fflags        ),
  .fcnvt_ex1_dp_special_result (fcnvt_ex1_dp_special_result),
  .fcnvt_ex1_dp_special_sel    (fcnvt_ex1_dp_special_sel   ),
  .fcnvt_ex1_dp_special_sign   (fcnvt_ex1_dp_special_sign  ),
  .fcnvt_ex1_dp_wb_vld         (fcnvt_ex1_dp_wb_vld        ),
  .fcnvt_ex1_pipe_clk          (fcnvt_ex1_pipe_clk         ),
  .fcnvt_ex1_pipedown          (fcnvt_ex1_pipedown         ),
  .fcnvt_ex1_sel               (fcnvt_ex1_sel              ),
  .fcnvt_ex1_sel_dp            (fcnvt_ex1_sel_dp           ),
  .fcnvt_ex2_pipe_clk          (fcnvt_ex2_pipe_clk         ),
  .fcnvt_ex2_pipedown          (fcnvt_ex2_pipedown         ),
  .fcnvt_ex3_dp_fflags         (fcnvt_ex3_dp_fflags        ),
  .fcnvt_ex3_dp_rst            (fcnvt_ex3_dp_rst           ),
  .fcnvt_ex3_dp_wb_vld         (fcnvt_ex3_dp_wb_vld        ),
  .fcnvt_ex3_fspu_vld          (fcnvt_ex3_fspu_vld         ),
  .fcnvt_ex3_rtu_fflags        (fcnvt_ex3_rtu_fflags       ),
  .fcnvt_ex3_rtu_rst           (fcnvt_ex3_rtu_rst          ),
  .fcnvt_ex3_rtu_wb_vld        (fcnvt_ex3_rtu_wb_vld       ),
  .fcnvt_ex3_sel               (fcnvt_ex3_sel              ),
  .fspu_ex1_rtu_rst            (fspu_ex1_rtu_rst           ),
  .fspu_ex1_rtu_wb_vld         (fspu_ex1_rtu_wb_vld        ),
  .idu_fpu_ex1_func            (idu_fpu_ex1_func           ),
  .idu_fpu_ex1_srcf0           (idu_fpu_ex1_srcf0          ),
  .idu_fpu_ex1_srci            (idu_fpu_ex1_srci           )
);

// &Instance("pa_fadd_single"); @35
pa_fadd_single  x_pa_fadd_single (
  .cp0_fpu_xx_dqnan            (cp0_fpu_xx_dqnan           ),
  .ctrl_xx_ex1_warm_up         (ctrl_xx_ex1_warm_up        ),
  .ctrl_xx_ex2_warm_up         (ctrl_xx_ex2_warm_up        ),
  .dp_xx_ex1_id                (dp_xx_ex1_id               ),
  .dp_xx_ex1_inf               (dp_xx_ex1_inf              ),
  .dp_xx_ex1_norm              (dp_xx_ex1_norm             ),
  .dp_xx_ex1_qnan              (dp_xx_ex1_qnan             ),
  .dp_xx_ex1_rm                (dp_xx_ex1_rm               ),
  .dp_xx_ex1_snan              (dp_xx_ex1_snan             ),
  .dp_xx_ex1_zero              (dp_xx_ex1_zero             ),
  .dp_xx_ex2_srcf2             (dp_xx_ex2_srcf2            ),
  .dp_xx_ex3_rm                (dp_xx_ex3_rm               ),
  .fadd_ex1_dp_fflags          (fadd_ex1_dp_fflags         ),
  .fadd_ex1_dp_special_result  (fadd_ex1_dp_special_result ),
  .fadd_ex1_dp_special_sel     (fadd_ex1_dp_special_sel    ),
  .fadd_ex1_dp_special_sign    (fadd_ex1_dp_special_sign   ),
  .fadd_ex1_dp_wb_vld          (fadd_ex1_dp_wb_vld         ),
  .fadd_ex1_pipe_clk           (fadd_ex1_pipe_clk          ),
  .fadd_ex1_pipedown           (fadd_ex1_pipedown          ),
  .fadd_ex1_sel                (fadd_ex1_sel               ),
  .fadd_ex1_sel_dp             (fadd_ex1_sel_dp            ),
  .fadd_ex2_dp_fflags          (fadd_ex2_dp_fflags         ),
  .fadd_ex2_dp_rst             (fadd_ex2_dp_rst            ),
  .fadd_ex2_dp_wb_vld          (fadd_ex2_dp_wb_vld         ),
  .fadd_ex2_nocmp              (fadd_ex2_nocmp             ),
  .fadd_ex2_nocmp_pipe_clk     (fadd_ex2_nocmp_pipe_clk    ),
  .fadd_ex2_nocmp_pipedown     (fadd_ex2_nocmp_pipedown    ),
  .fadd_ex2_pipe_clk           (fadd_ex2_pipe_clk          ),
  .fadd_ex2_pipedown           (fadd_ex2_pipedown          ),
  .fadd_ex2_sel                (fadd_ex2_sel               ),
  .fadd_ex3_dp_fflags          (fadd_ex3_dp_fflags         ),
  .fadd_ex3_dp_rst             (fadd_ex3_dp_rst            ),
  .fadd_ex3_dp_wb_vld          (fadd_ex3_dp_wb_vld         ),
  .fadd_ex3_rtu_fflags         (fadd_ex3_rtu_fflags        ),
  .fadd_ex3_rtu_rst            (fadd_ex3_rtu_rst           ),
  .fadd_ex3_rtu_wb_vld         (fadd_ex3_rtu_wb_vld        ),
  .fadd_ex3_sel                (fadd_ex3_sel               ),
  .falu_ctrl_xx_ex1_vld        (falu_ctrl_xx_ex1_vld       ),
  .falu_ctrl_xx_ex2_vld        (falu_ctrl_xx_ex2_vld       ),
  .falu_ctrl_xx_ex3_vld        (falu_ctrl_xx_ex3_vld       ),
  .falu_fpu_ex1_src_reuse      (falu_fpu_ex1_src_reuse     ),
  .falu_fpu_ex1_src_reuse_data (falu_fpu_ex1_src_reuse_data),
  .idu_fpu_ex1_func            (idu_fpu_ex1_func           ),
  .idu_fpu_ex1_srcf0           (idu_fpu_ex1_srcf0          ),
  .idu_fpu_ex1_srcf1           (idu_fpu_ex1_srcf1          )
);

// &Instance("pa_fspu_single"); @36
pa_fspu_single  x_pa_fspu_single (
  .dp_xx_ex1_id               (dp_xx_ex1_id              ),
  .dp_xx_ex1_inf              (dp_xx_ex1_inf             ),
  .dp_xx_ex1_norm             (dp_xx_ex1_norm            ),
  .dp_xx_ex1_qnan             (dp_xx_ex1_qnan            ),
  .dp_xx_ex1_snan             (dp_xx_ex1_snan            ),
  .dp_xx_ex1_zero             (dp_xx_ex1_zero            ),
  .falu_ctrl_xx_ex1_vld       (falu_ctrl_xx_ex1_vld      ),
  .fspu_ex1_dp_fflags         (fspu_ex1_dp_fflags        ),
  .fspu_ex1_dp_special_result (fspu_ex1_dp_special_result),
  .fspu_ex1_dp_special_sel    (fspu_ex1_dp_special_sel   ),
  .fspu_ex1_dp_special_sign   (fspu_ex1_dp_special_sign  ),
  .fspu_ex1_dp_wb_vld         (fspu_ex1_dp_wb_vld        ),
  .fspu_ex1_rtu_rst           (fspu_ex1_rtu_rst          ),
  .fspu_ex1_rtu_wb_vld        (fspu_ex1_rtu_wb_vld       ),
  .fspu_ex1_rtu_wb_vld_gate   (fspu_ex1_rtu_wb_vld_gate  ),
  .fspu_sel                   (fspu_sel                  ),
  .fspu_sel_dp                (fspu_sel_dp               ),
  .fspu_sel_gate              (fspu_sel_gate             ),
  .idu_fpu_ex1_func           (idu_fpu_ex1_func          ),
  .idu_fpu_ex1_srcf0          (idu_fpu_ex1_srcf0         ),
  .idu_fpu_ex1_srcf1          (idu_fpu_ex1_srcf1         ),
  .idu_fpu_ex1_srci           (idu_fpu_ex1_srci          )
);


// &Instance("pa_falu_ctrl"); @39
pa_falu_ctrl  x_pa_falu_ctrl (
  .cp0_fpu_icg_en              (cp0_fpu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .ctrl_falu_ex1_sel           (ctrl_falu_ex1_sel          ),
  .ctrl_falu_ex1_sel_dp        (ctrl_falu_ex1_sel_dp       ),
  .ctrl_falu_ex1_sel_gate      (ctrl_falu_ex1_sel_gate     ),
  .ctrl_xx_ex1_cmplt_dp        (ctrl_xx_ex1_cmplt_dp       ),
  .ctrl_xx_ex1_inst_vld        (ctrl_xx_ex1_inst_vld       ),
  .ctrl_xx_ex1_stall           (ctrl_xx_ex1_stall          ),
  .ctrl_xx_ex1_warm_up         (ctrl_xx_ex1_warm_up        ),
  .ctrl_xx_ex2_cancel          (ctrl_xx_ex2_cancel         ),
  .ctrl_xx_ex2_stall           (ctrl_xx_ex2_stall          ),
  .ctrl_xx_ex2_warm_up         (ctrl_xx_ex2_warm_up        ),
  .ctrl_xx_ex3_stall           (ctrl_xx_ex3_stall          ),
  .fadd_ex1_dp_fflags          (fadd_ex1_dp_fflags         ),
  .fadd_ex1_dp_special_result  (fadd_ex1_dp_special_result ),
  .fadd_ex1_dp_special_sel     (fadd_ex1_dp_special_sel    ),
  .fadd_ex1_dp_special_sign    (fadd_ex1_dp_special_sign   ),
  .fadd_ex1_dp_wb_vld          (fadd_ex1_dp_wb_vld         ),
  .fadd_ex1_pipe_clk           (fadd_ex1_pipe_clk          ),
  .fadd_ex1_pipedown           (fadd_ex1_pipedown          ),
  .fadd_ex1_sel                (fadd_ex1_sel               ),
  .fadd_ex1_sel_dp             (fadd_ex1_sel_dp            ),
  .fadd_ex2_dp_fflags          (fadd_ex2_dp_fflags         ),
  .fadd_ex2_dp_rst             (fadd_ex2_dp_rst            ),
  .fadd_ex2_dp_wb_vld          (fadd_ex2_dp_wb_vld         ),
  .fadd_ex2_nocmp              (fadd_ex2_nocmp             ),
  .fadd_ex2_nocmp_pipe_clk     (fadd_ex2_nocmp_pipe_clk    ),
  .fadd_ex2_nocmp_pipedown     (fadd_ex2_nocmp_pipedown    ),
  .fadd_ex2_pipe_clk           (fadd_ex2_pipe_clk          ),
  .fadd_ex2_pipedown           (fadd_ex2_pipedown          ),
  .fadd_ex2_sel                (fadd_ex2_sel               ),
  .fadd_ex3_dp_fflags          (fadd_ex3_dp_fflags         ),
  .fadd_ex3_dp_rst             (fadd_ex3_dp_rst            ),
  .fadd_ex3_dp_wb_vld          (fadd_ex3_dp_wb_vld         ),
  .fadd_ex3_rtu_fflags         (fadd_ex3_rtu_fflags        ),
  .fadd_ex3_rtu_rst            (fadd_ex3_rtu_rst           ),
  .fadd_ex3_rtu_wb_vld         (fadd_ex3_rtu_wb_vld        ),
  .fadd_ex3_sel                (fadd_ex3_sel               ),
  .falu_ctrl_xx_ex1_vld        (falu_ctrl_xx_ex1_vld       ),
  .falu_ctrl_xx_ex2_vld        (falu_ctrl_xx_ex2_vld       ),
  .falu_ctrl_xx_ex3_vld        (falu_ctrl_xx_ex3_vld       ),
  .falu_fpu_ex1_cmplt          (falu_fpu_ex1_cmplt         ),
  .falu_fpu_ex1_cmplt_dp       (falu_fpu_ex1_cmplt_dp      ),
  .falu_fpu_ex1_fflags         (falu_fpu_ex1_fflags        ),
  .falu_fpu_ex1_result         (falu_fpu_ex1_result        ),
  .falu_fpu_ex1_special_sel    (falu_fpu_ex1_special_sel   ),
  .falu_fpu_ex1_special_sign   (falu_fpu_ex1_special_sign  ),
  .falu_fpu_ex1_wb_gpr         (falu_fpu_ex1_wb_gpr        ),
  .falu_fpu_ex2_fflags         (falu_fpu_ex2_fflags        ),
  .falu_fpu_ex2_result         (falu_fpu_ex2_result        ),
  .falu_fpu_ex2_result_vld     (falu_fpu_ex2_result_vld    ),
  .falu_fpu_ex3_fflags         (falu_fpu_ex3_fflags        ),
  .falu_fpu_ex3_result         (falu_fpu_ex3_result        ),
  .falu_fpu_ex3_result_vld     (falu_fpu_ex3_result_vld    ),
  .falu_fpu_ex3_stall          (falu_fpu_ex3_stall         ),
  .falu_fpu_ex3_wb_gpr         (falu_fpu_ex3_wb_gpr        ),
  .fcnvt_ex1_dp_fflags         (fcnvt_ex1_dp_fflags        ),
  .fcnvt_ex1_dp_special_result (fcnvt_ex1_dp_special_result),
  .fcnvt_ex1_dp_special_sel    (fcnvt_ex1_dp_special_sel   ),
  .fcnvt_ex1_dp_special_sign   (fcnvt_ex1_dp_special_sign  ),
  .fcnvt_ex1_dp_wb_vld         (fcnvt_ex1_dp_wb_vld        ),
  .fcnvt_ex1_pipe_clk          (fcnvt_ex1_pipe_clk         ),
  .fcnvt_ex1_pipedown          (fcnvt_ex1_pipedown         ),
  .fcnvt_ex1_sel               (fcnvt_ex1_sel              ),
  .fcnvt_ex1_sel_dp            (fcnvt_ex1_sel_dp           ),
  .fcnvt_ex2_pipe_clk          (fcnvt_ex2_pipe_clk         ),
  .fcnvt_ex2_pipedown          (fcnvt_ex2_pipedown         ),
  .fcnvt_ex3_dp_fflags         (fcnvt_ex3_dp_fflags        ),
  .fcnvt_ex3_dp_rst            (fcnvt_ex3_dp_rst           ),
  .fcnvt_ex3_dp_wb_vld         (fcnvt_ex3_dp_wb_vld        ),
  .fcnvt_ex3_fspu_vld          (fcnvt_ex3_fspu_vld         ),
  .fcnvt_ex3_rtu_fflags        (fcnvt_ex3_rtu_fflags       ),
  .fcnvt_ex3_rtu_rst           (fcnvt_ex3_rtu_rst          ),
  .fcnvt_ex3_rtu_wb_vld        (fcnvt_ex3_rtu_wb_vld       ),
  .fcnvt_ex3_sel               (fcnvt_ex3_sel              ),
  .forever_cpuclk              (forever_cpuclk             ),
  .fpu_rtu_ex3_wb_data         (fpu_rtu_ex3_wb_data        ),
  .fpu_rtu_ex3_wb_fflags       (fpu_rtu_ex3_wb_fflags      ),
  .fpu_rtu_ex3_wb_fflags_vld   (fpu_rtu_ex3_wb_fflags_vld  ),
  .fpu_rtu_ex3_wb_preg         (fpu_rtu_ex3_wb_preg        ),
  .fpu_rtu_ex3_wb_vld          (fpu_rtu_ex3_wb_vld         ),
  .fspu_ex1_dp_fflags          (fspu_ex1_dp_fflags         ),
  .fspu_ex1_dp_special_result  (fspu_ex1_dp_special_result ),
  .fspu_ex1_dp_special_sel     (fspu_ex1_dp_special_sel    ),
  .fspu_ex1_dp_special_sign    (fspu_ex1_dp_special_sign   ),
  .fspu_ex1_dp_wb_vld          (fspu_ex1_dp_wb_vld         ),
  .fspu_ex1_rtu_wb_vld         (fspu_ex1_rtu_wb_vld        ),
  .fspu_ex1_rtu_wb_vld_gate    (fspu_ex1_rtu_wb_vld_gate   ),
  .fspu_sel                    (fspu_sel                   ),
  .fspu_sel_dp                 (fspu_sel_dp                ),
  .fspu_sel_gate               (fspu_sel_gate              ),
  .idu_fpu_ex1_dst_preg        (idu_fpu_ex1_dst_preg       ),
  .idu_fpu_ex1_eu_sel          (idu_fpu_ex1_eu_sel         ),
  .idu_fpu_ex1_func            (idu_fpu_ex1_func           ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .rtu_fpu_ex3_wb_grant        (rtu_fpu_ex3_wb_grant       ),
  .rtu_xx_ex1_cancel           (rtu_xx_ex1_cancel          )
);



// &Force("bus", "dp_xx_ex1_cnan", 2, 0); @42
// &Force("bus", "dp_xx_ex1_snan", 2, 0); @43
// &Force("bus", "dp_xx_ex1_qnan", 2, 0); @44
// &Force("bus", "dp_xx_ex1_norm", 2, 0); @45
// &Force("bus", "dp_xx_ex1_zero", 2, 0); @46
// &Force("bus", "dp_xx_ex1_inf", 2, 0); @47
// &Force("bus", "dp_xx_ex1_id", 2, 0); @48
// &Force("bus", "idu_fpu_ex1_func", 9, 0); @49


// &ModuleEnd; @52
endmodule


