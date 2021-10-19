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
module pa_fmau_top(
  cp0_fpu_icg_en,
  cp0_fpu_xx_dqnan,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_fmau_ex1_sel,
  ctrl_fmau_ex1_sel_gate,
  ctrl_xx_ex1_cmplt_dp,
  ctrl_xx_ex1_stall,
  ctrl_xx_ex1_warm_up,
  ctrl_xx_ex2_cancel,
  ctrl_xx_ex2_stall,
  ctrl_xx_ex2_warm_up,
  ctrl_xx_ex3_stall,
  ctrl_xx_ex3_warm_up,
  ctrl_xx_ex4_stall,
  dp_xx_ex1_cnan,
  dp_xx_ex1_id,
  dp_xx_ex1_inf,
  dp_xx_ex1_norm,
  dp_xx_ex1_qnan,
  dp_xx_ex1_rm,
  dp_xx_ex1_snan,
  dp_xx_ex1_srcf2,
  dp_xx_ex1_zero,
  dp_xx_ex2_srcf2,
  dp_xx_ex3_rm,
  dp_xx_ex4_rm,
  fmau_fpu_ex1_cmplt,
  fmau_fpu_ex1_cmplt_dp,
  fmau_fpu_ex1_denorm_stall,
  fmau_fpu_ex1_fflags,
  fmau_fpu_ex1_special_sel,
  fmau_fpu_ex1_special_sign,
  fmau_fpu_ex3_fflags,
  fmau_fpu_ex3_result,
  fmau_fpu_ex3_result_vld,
  fmau_fpu_ex4_fflags,
  fmau_fpu_ex4_result,
  fmau_fpu_id_reg_set,
  forever_cpuclk,
  idu_fpu_ex1_eu_sel,
  idu_fpu_ex1_func,
  idu_fpu_ex1_srcf0,
  idu_fpu_ex1_srcf1,
  pad_yy_icg_scan_en,
  rtu_xx_ex1_cancel
);

// &Ports; @24
input           cp0_fpu_icg_en;            
input           cp0_fpu_xx_dqnan;          
input           cp0_yy_clk_en;             
input           cpurst_b;                  
input           ctrl_fmau_ex1_sel;         
input           ctrl_fmau_ex1_sel_gate;    
input           ctrl_xx_ex1_cmplt_dp;      
input           ctrl_xx_ex1_stall;         
input           ctrl_xx_ex1_warm_up;       
input           ctrl_xx_ex2_cancel;        
input           ctrl_xx_ex2_stall;         
input           ctrl_xx_ex2_warm_up;       
input           ctrl_xx_ex3_stall;         
input           ctrl_xx_ex3_warm_up;       
input           ctrl_xx_ex4_stall;         
input   [2 :0]  dp_xx_ex1_cnan;            
input   [2 :0]  dp_xx_ex1_id;              
input   [2 :0]  dp_xx_ex1_inf;             
input   [2 :0]  dp_xx_ex1_norm;            
input   [2 :0]  dp_xx_ex1_qnan;            
input   [2 :0]  dp_xx_ex1_rm;              
input   [2 :0]  dp_xx_ex1_snan;            
input   [31:0]  dp_xx_ex1_srcf2;           
input   [2 :0]  dp_xx_ex1_zero;            
input   [31:0]  dp_xx_ex2_srcf2;           
input   [2 :0]  dp_xx_ex3_rm;              
input   [2 :0]  dp_xx_ex4_rm;              
input           forever_cpuclk;            
input   [2 :0]  idu_fpu_ex1_eu_sel;        
input   [9 :0]  idu_fpu_ex1_func;          
input   [31:0]  idu_fpu_ex1_srcf0;         
input   [31:0]  idu_fpu_ex1_srcf1;         
input           pad_yy_icg_scan_en;        
input           rtu_xx_ex1_cancel;         
output          fmau_fpu_ex1_cmplt;        
output          fmau_fpu_ex1_cmplt_dp;     
output          fmau_fpu_ex1_denorm_stall; 
output  [4 :0]  fmau_fpu_ex1_fflags;       
output  [7 :0]  fmau_fpu_ex1_special_sel;  
output  [3 :0]  fmau_fpu_ex1_special_sign; 
output  [4 :0]  fmau_fpu_ex3_fflags;       
output  [31:0]  fmau_fpu_ex3_result;       
output          fmau_fpu_ex3_result_vld;   
output  [4 :0]  fmau_fpu_ex4_fflags;       
output  [31:0]  fmau_fpu_ex4_result;       
output          fmau_fpu_id_reg_set;       

// &Regs; @25

// &Wires; @26
wire            cp0_fpu_icg_en;            
wire            cp0_fpu_xx_dqnan;          
wire            cp0_yy_clk_en;             
wire            cpurst_b;                  
wire            ctrl_dp_ex1_inst_pipe_down; 
wire            ctrl_dp_ex1_inst_vld;      
wire            ctrl_dp_ex2_inst_pipe_down; 
wire            ctrl_dp_ex2_inst_vld;      
wire            ctrl_dp_ex3_inst_pipe_down; 
wire            ctrl_dp_ex3_inst_vld;      
wire            ctrl_fmau_ex1_sel;         
wire            ctrl_fmau_ex1_sel_gate;    
wire            ctrl_xx_ex1_cmplt_dp;      
wire            ctrl_xx_ex1_stall;         
wire            ctrl_xx_ex1_warm_up;       
wire            ctrl_xx_ex2_cancel;        
wire            ctrl_xx_ex2_stall;         
wire            ctrl_xx_ex2_warm_up;       
wire            ctrl_xx_ex3_stall;         
wire            ctrl_xx_ex3_warm_up;       
wire            ctrl_xx_ex4_stall;         
wire            dp_ctrl_ex3_mac;           
wire    [2 :0]  dp_xx_ex1_cnan;            
wire    [2 :0]  dp_xx_ex1_id;              
wire    [2 :0]  dp_xx_ex1_inf;             
wire    [2 :0]  dp_xx_ex1_norm;            
wire    [2 :0]  dp_xx_ex1_qnan;            
wire    [2 :0]  dp_xx_ex1_rm;              
wire    [2 :0]  dp_xx_ex1_snan;            
wire    [31:0]  dp_xx_ex1_srcf2;           
wire    [2 :0]  dp_xx_ex1_zero;            
wire    [31:0]  dp_xx_ex2_srcf2;           
wire    [2 :0]  dp_xx_ex3_rm;              
wire    [2 :0]  dp_xx_ex4_rm;              
wire    [1 :0]  ex1_id_reg;                
wire            ex2_special_cmplt;         
wire            fmau_fpu_ex1_cmplt;        
wire            fmau_fpu_ex1_cmplt_dp;     
wire            fmau_fpu_ex1_denorm_stall; 
wire    [4 :0]  fmau_fpu_ex1_fflags;       
wire    [7 :0]  fmau_fpu_ex1_special_sel;  
wire    [3 :0]  fmau_fpu_ex1_special_sign; 
wire    [4 :0]  fmau_fpu_ex3_fflags;       
wire    [31:0]  fmau_fpu_ex3_result;       
wire            fmau_fpu_ex3_result_vld;   
wire    [4 :0]  fmau_fpu_ex4_fflags;       
wire    [31:0]  fmau_fpu_ex4_result;       
wire            fmau_fpu_id_reg_set;       
wire            forever_cpuclk;            
wire    [2 :0]  idu_fpu_ex1_eu_sel;        
wire    [9 :0]  idu_fpu_ex1_func;          
wire    [31:0]  idu_fpu_ex1_srcf0;         
wire    [31:0]  idu_fpu_ex1_srcf1;         
wire            pad_yy_icg_scan_en;        
wire            rtu_xx_ex1_cancel;         


// &Depend("cpu_cfig.h"); @28

// &Instance("pa_fmau_dp","x_pa_fmau_dp"); @30
pa_fmau_dp  x_pa_fmau_dp (
  .cp0_fpu_icg_en             (cp0_fpu_icg_en            ),
  .cp0_fpu_xx_dqnan           (cp0_fpu_xx_dqnan          ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .ctrl_dp_ex1_inst_pipe_down (ctrl_dp_ex1_inst_pipe_down),
  .ctrl_dp_ex1_inst_vld       (ctrl_dp_ex1_inst_vld      ),
  .ctrl_dp_ex2_inst_pipe_down (ctrl_dp_ex2_inst_pipe_down),
  .ctrl_dp_ex2_inst_vld       (ctrl_dp_ex2_inst_vld      ),
  .ctrl_dp_ex3_inst_pipe_down (ctrl_dp_ex3_inst_pipe_down),
  .ctrl_dp_ex3_inst_vld       (ctrl_dp_ex3_inst_vld      ),
  .ctrl_xx_ex1_warm_up        (ctrl_xx_ex1_warm_up       ),
  .ctrl_xx_ex2_warm_up        (ctrl_xx_ex2_warm_up       ),
  .ctrl_xx_ex3_warm_up        (ctrl_xx_ex3_warm_up       ),
  .dp_ctrl_ex3_mac            (dp_ctrl_ex3_mac           ),
  .dp_xx_ex1_cnan             (dp_xx_ex1_cnan            ),
  .dp_xx_ex1_inf              (dp_xx_ex1_inf             ),
  .dp_xx_ex1_norm             (dp_xx_ex1_norm            ),
  .dp_xx_ex1_qnan             (dp_xx_ex1_qnan            ),
  .dp_xx_ex1_rm               (dp_xx_ex1_rm              ),
  .dp_xx_ex1_snan             (dp_xx_ex1_snan            ),
  .dp_xx_ex1_srcf2            (dp_xx_ex1_srcf2           ),
  .dp_xx_ex1_zero             (dp_xx_ex1_zero            ),
  .dp_xx_ex2_srcf2            (dp_xx_ex2_srcf2           ),
  .dp_xx_ex3_rm               (dp_xx_ex3_rm              ),
  .dp_xx_ex4_rm               (dp_xx_ex4_rm              ),
  .ex1_id_reg                 (ex1_id_reg                ),
  .ex2_special_cmplt          (ex2_special_cmplt         ),
  .fmau_fpu_ex1_fflags        (fmau_fpu_ex1_fflags       ),
  .fmau_fpu_ex1_special_sel   (fmau_fpu_ex1_special_sel  ),
  .fmau_fpu_ex1_special_sign  (fmau_fpu_ex1_special_sign ),
  .fmau_fpu_ex3_fflags        (fmau_fpu_ex3_fflags       ),
  .fmau_fpu_ex3_result        (fmau_fpu_ex3_result       ),
  .fmau_fpu_ex4_fflags        (fmau_fpu_ex4_fflags       ),
  .fmau_fpu_ex4_result        (fmau_fpu_ex4_result       ),
  .forever_cpuclk             (forever_cpuclk            ),
  .idu_fpu_ex1_eu_sel         (idu_fpu_ex1_eu_sel        ),
  .idu_fpu_ex1_func           (idu_fpu_ex1_func          ),
  .idu_fpu_ex1_srcf0          (idu_fpu_ex1_srcf0         ),
  .idu_fpu_ex1_srcf1          (idu_fpu_ex1_srcf1         ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);

// &Instance("pa_fmau_ctrl","x_pa_fmau_ctrl"); @31
pa_fmau_ctrl  x_pa_fmau_ctrl (
  .cp0_fpu_icg_en             (cp0_fpu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .ctrl_dp_ex1_inst_pipe_down (ctrl_dp_ex1_inst_pipe_down),
  .ctrl_dp_ex1_inst_vld       (ctrl_dp_ex1_inst_vld      ),
  .ctrl_dp_ex2_inst_pipe_down (ctrl_dp_ex2_inst_pipe_down),
  .ctrl_dp_ex2_inst_vld       (ctrl_dp_ex2_inst_vld      ),
  .ctrl_dp_ex3_inst_pipe_down (ctrl_dp_ex3_inst_pipe_down),
  .ctrl_dp_ex3_inst_vld       (ctrl_dp_ex3_inst_vld      ),
  .ctrl_fmau_ex1_sel          (ctrl_fmau_ex1_sel         ),
  .ctrl_fmau_ex1_sel_gate     (ctrl_fmau_ex1_sel_gate    ),
  .ctrl_xx_ex1_cmplt_dp       (ctrl_xx_ex1_cmplt_dp      ),
  .ctrl_xx_ex1_stall          (ctrl_xx_ex1_stall         ),
  .ctrl_xx_ex2_cancel         (ctrl_xx_ex2_cancel        ),
  .ctrl_xx_ex2_stall          (ctrl_xx_ex2_stall         ),
  .ctrl_xx_ex3_stall          (ctrl_xx_ex3_stall         ),
  .ctrl_xx_ex4_stall          (ctrl_xx_ex4_stall         ),
  .dp_ctrl_ex3_mac            (dp_ctrl_ex3_mac           ),
  .dp_xx_ex1_id               (dp_xx_ex1_id              ),
  .ex1_id_reg                 (ex1_id_reg                ),
  .ex2_special_cmplt          (ex2_special_cmplt         ),
  .fmau_fpu_ex1_cmplt         (fmau_fpu_ex1_cmplt        ),
  .fmau_fpu_ex1_cmplt_dp      (fmau_fpu_ex1_cmplt_dp     ),
  .fmau_fpu_ex1_denorm_stall  (fmau_fpu_ex1_denorm_stall ),
  .fmau_fpu_ex3_result_vld    (fmau_fpu_ex3_result_vld   ),
  .fmau_fpu_id_reg_set        (fmau_fpu_id_reg_set       ),
  .forever_cpuclk             (forever_cpuclk            ),
  .idu_fpu_ex1_eu_sel         (idu_fpu_ex1_eu_sel        ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .rtu_xx_ex1_cancel          (rtu_xx_ex1_cancel         )
);



// &ModuleEnd; @196
endmodule



