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
module pa_fpu_top(
  cp0_fpu_icg_en,
  cp0_fpu_xx_dqnan,
  cp0_fpu_xx_rm,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  fpu_cp0_wb_fflags,
  fpu_cp0_wb_fflags_updt,
  fpu_dtu_debug_info,
  fpu_idu_ex1_stall,
  fpu_idu_fwd_data,
  fpu_idu_fwd_freg,
  fpu_idu_fwd_vld,
  fpu_iu_ex1_cmplt,
  fpu_iu_ex1_cmplt_dp,
  fpu_rtu_fgpr_wb_data,
  fpu_rtu_fgpr_wb_reg,
  fpu_rtu_fgpr_wb_vld,
  fpu_rtu_wb_data,
  fpu_rtu_wb_preg,
  fpu_rtu_wb_vld,
  fpu_wb_float_fflags_updt,
  fpu_xx_no_op,
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
  idu_fpu_ex1_srci,
  ifu_fpu_warm_up,
  pad_yy_icg_scan_en,
  rtu_fpu_fgpr_wb_grant,
  rtu_fpu_wb_grant,
  rtu_yy_xx_async_flush,
  rtu_yy_xx_flush
);

// &Ports; @24
input           cp0_fpu_icg_en;             
input           cp0_fpu_xx_dqnan;           
input   [2 :0]  cp0_fpu_xx_rm;              
input           cp0_yy_clk_en;              
input           cpurst_b;                   
input           forever_cpuclk;             
input           idu_fpu_ex1_cmplt_dp_sel;   
input   [4 :0]  idu_fpu_ex1_dst_freg;       
input           idu_fpu_ex1_dst_freg_vld;   
input   [4 :0]  idu_fpu_ex1_dst_preg;       
input   [2 :0]  idu_fpu_ex1_eu_sel;         
input   [9 :0]  idu_fpu_ex1_func;           
input           idu_fpu_ex1_gateclk_vld;    
input           idu_fpu_ex1_inst_vld;       
input   [2 :0]  idu_fpu_ex1_rm;             
input   [31:0]  idu_fpu_ex1_srcf0;          
input   [31:0]  idu_fpu_ex1_srcf1;          
input   [31:0]  idu_fpu_ex1_srcf2;          
input   [31:0]  idu_fpu_ex1_srci;           
input           ifu_fpu_warm_up;            
input           pad_yy_icg_scan_en;         
input           rtu_fpu_fgpr_wb_grant;      
input           rtu_fpu_wb_grant;           
input           rtu_yy_xx_async_flush;      
input           rtu_yy_xx_flush;            
output  [4 :0]  fpu_cp0_wb_fflags;          
output          fpu_cp0_wb_fflags_updt;     
output  [7 :0]  fpu_dtu_debug_info;         
output          fpu_idu_ex1_stall;          
output  [31:0]  fpu_idu_fwd_data;           
output  [4 :0]  fpu_idu_fwd_freg;           
output          fpu_idu_fwd_vld;            
output          fpu_iu_ex1_cmplt;           
output          fpu_iu_ex1_cmplt_dp;        
output  [31:0]  fpu_rtu_fgpr_wb_data;       
output  [4 :0]  fpu_rtu_fgpr_wb_reg;        
output          fpu_rtu_fgpr_wb_vld;        
output  [31:0]  fpu_rtu_wb_data;            
output  [5 :0]  fpu_rtu_wb_preg;            
output          fpu_rtu_wb_vld;             
output          fpu_wb_float_fflags_updt;   
output          fpu_xx_no_op;               

// &Regs; @25

// &Wires; @26
wire            cp0_fpu_icg_en;             
wire            cp0_fpu_xx_dqnan;           
wire    [2 :0]  cp0_fpu_xx_rm;              
wire            cp0_yy_clk_en;              
wire            cpurst_b;                   
wire            ctrl_falu_ex1_sel;          
wire            ctrl_falu_ex1_sel_dp;       
wire            ctrl_falu_ex1_sel_gate;     
wire            ctrl_fdsu_ex1_sel;          
wire            ctrl_fmau_ex1_sel;          
wire            ctrl_fmau_ex1_sel_gate;     
wire            ctrl_frbus_ex2_wb_req;      
wire            ctrl_frbus_ex3_wb_req;      
wire            ctrl_frbus_ex4_wb_req;      
wire            ctrl_xx_ex1_cmplt_dp;       
wire            ctrl_xx_ex1_inst_vld;       
wire            ctrl_xx_ex1_stall;          
wire            ctrl_xx_ex1_warm_up;        
wire            ctrl_xx_ex2_cancel;         
wire            ctrl_xx_ex2_inst_vld;       
wire            ctrl_xx_ex2_stall;          
wire            ctrl_xx_ex2_warm_up;        
wire            ctrl_xx_ex3_inst_vld;       
wire            ctrl_xx_ex3_stall;          
wire            ctrl_xx_ex3_warm_up;        
wire            ctrl_xx_ex4_stall;          
wire    [31:0]  dp_frbus_ex2_data;          
wire    [4 :0]  dp_frbus_ex2_fflags;        
wire    [4 :0]  dp_frbus_ex2_freg;          
wire    [31:0]  dp_frbus_ex3_data;          
wire    [4 :0]  dp_frbus_ex3_fflags;        
wire    [4 :0]  dp_frbus_ex3_freg;          
wire    [31:0]  dp_frbus_ex4_data;          
wire    [4 :0]  dp_frbus_ex4_fflags;        
wire    [4 :0]  dp_frbus_ex4_freg;          
wire    [2 :0]  dp_xx_ex1_cnan;             
wire    [2 :0]  dp_xx_ex1_id;               
wire    [2 :0]  dp_xx_ex1_inf;              
wire    [2 :0]  dp_xx_ex1_norm;             
wire    [2 :0]  dp_xx_ex1_qnan;             
wire    [2 :0]  dp_xx_ex1_rm;               
wire    [2 :0]  dp_xx_ex1_snan;             
wire    [31:0]  dp_xx_ex1_srcf2;            
wire    [2 :0]  dp_xx_ex1_zero;             
wire    [2 :0]  dp_xx_ex2_rm;               
wire    [31:0]  dp_xx_ex2_srcf2;            
wire    [2 :0]  dp_xx_ex3_rm;               
wire    [2 :0]  dp_xx_ex4_rm;               
wire            ex2_inst_wb;                
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
wire    [4 :0]  fdsu_fpu_debug_info;        
wire            fdsu_fpu_ex1_cmplt;         
wire            fdsu_fpu_ex1_cmplt_dp;      
wire    [4 :0]  fdsu_fpu_ex1_fflags;        
wire    [7 :0]  fdsu_fpu_ex1_special_sel;   
wire    [3 :0]  fdsu_fpu_ex1_special_sign;  
wire            fdsu_fpu_ex1_stall;         
wire            fdsu_fpu_no_op;             
wire    [31:0]  fdsu_frbus_data;            
wire    [4 :0]  fdsu_frbus_fflags;          
wire    [4 :0]  fdsu_frbus_freg;            
wire            fdsu_frbus_wb_vld;          
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
wire    [4 :0]  fpu_cp0_wb_fflags;          
wire            fpu_cp0_wb_fflags_updt;     
wire    [7 :0]  fpu_dtu_debug_info;         
wire            fpu_had_ex2_inst_vld;       
wire            fpu_had_ex3_inst_vld;       
wire            fpu_had_ex4_inst_vld;       
wire            fpu_idu_ex1_stall;          
wire    [31:0]  fpu_idu_fwd_data;           
wire    [4 :0]  fpu_idu_fwd_freg;           
wire            fpu_idu_fwd_vld;            
wire            fpu_iu_ex1_cmplt;           
wire            fpu_iu_ex1_cmplt_dp;        
wire            fpu_rtu_ex1_inst_cmplt;     
wire            fpu_rtu_ex1_inst_cmplt_dp;  
wire    [31:0]  fpu_rtu_ex3_wb_data;        
wire    [4 :0]  fpu_rtu_ex3_wb_fflags;      
wire            fpu_rtu_ex3_wb_fflags_vld;  
wire    [4 :0]  fpu_rtu_ex3_wb_preg;        
wire            fpu_rtu_ex3_wb_vld;         
wire    [31:0]  fpu_rtu_fgpr_wb_data;       
wire    [4 :0]  fpu_rtu_fgpr_wb_reg;        
wire            fpu_rtu_fgpr_wb_vld;        
wire    [31:0]  fpu_rtu_wb_data;            
wire    [5 :0]  fpu_rtu_wb_preg;            
wire            fpu_rtu_wb_vld;             
wire            fpu_wb_float_fflags_updt;   
wire            fpu_xx_no_op;               
wire            frbus_ctrl_ex2_wb_grant;    
wire            frbus_ctrl_ex3_wb_grant;    
wire            frbus_ctrl_ex4_wb_grant;    
wire            frbus_fdsu_wb_grant;        
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
wire    [31:0]  idu_fpu_ex1_srci;           
wire            ifu_fpu_warm_up;            
wire            pad_yy_icg_scan_en;         
wire            rtu_fpu_ex2_stall;          
wire            rtu_fpu_ex3_wb_grant;       
wire            rtu_fpu_fgpr_wb_grant;      
wire            rtu_fpu_wb_grant;           
wire            rtu_xx_ex1_cancel;          
wire            rtu_xx_ex2_cancel;          
wire            rtu_yy_xx_async_flush;      
wire            rtu_yy_xx_flush;            


// &Depend("cpu_cfig.h"); @28

// &Instance("pa_fpu_dp","x_pa_fpu_dp"); @30
pa_fpu_dp  x_pa_fpu_dp (
  .cp0_fpu_icg_en              (cp0_fpu_icg_en             ),
  .cp0_fpu_xx_rm               (cp0_fpu_xx_rm              ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .ctrl_xx_ex1_inst_vld        (ctrl_xx_ex1_inst_vld       ),
  .ctrl_xx_ex1_stall           (ctrl_xx_ex1_stall          ),
  .ctrl_xx_ex1_warm_up         (ctrl_xx_ex1_warm_up        ),
  .ctrl_xx_ex2_inst_vld        (ctrl_xx_ex2_inst_vld       ),
  .ctrl_xx_ex2_stall           (ctrl_xx_ex2_stall          ),
  .ctrl_xx_ex2_warm_up         (ctrl_xx_ex2_warm_up        ),
  .ctrl_xx_ex3_inst_vld        (ctrl_xx_ex3_inst_vld       ),
  .ctrl_xx_ex3_stall           (ctrl_xx_ex3_stall          ),
  .ctrl_xx_ex3_warm_up         (ctrl_xx_ex3_warm_up        ),
  .dp_frbus_ex2_data           (dp_frbus_ex2_data          ),
  .dp_frbus_ex2_fflags         (dp_frbus_ex2_fflags        ),
  .dp_frbus_ex2_freg           (dp_frbus_ex2_freg          ),
  .dp_frbus_ex3_data           (dp_frbus_ex3_data          ),
  .dp_frbus_ex3_fflags         (dp_frbus_ex3_fflags        ),
  .dp_frbus_ex3_freg           (dp_frbus_ex3_freg          ),
  .dp_frbus_ex4_data           (dp_frbus_ex4_data          ),
  .dp_frbus_ex4_fflags         (dp_frbus_ex4_fflags        ),
  .dp_frbus_ex4_freg           (dp_frbus_ex4_freg          ),
  .dp_xx_ex1_cnan              (dp_xx_ex1_cnan             ),
  .dp_xx_ex1_id                (dp_xx_ex1_id               ),
  .dp_xx_ex1_inf               (dp_xx_ex1_inf              ),
  .dp_xx_ex1_norm              (dp_xx_ex1_norm             ),
  .dp_xx_ex1_qnan              (dp_xx_ex1_qnan             ),
  .dp_xx_ex1_rm                (dp_xx_ex1_rm               ),
  .dp_xx_ex1_snan              (dp_xx_ex1_snan             ),
  .dp_xx_ex1_srcf2             (dp_xx_ex1_srcf2            ),
  .dp_xx_ex1_zero              (dp_xx_ex1_zero             ),
  .dp_xx_ex2_rm                (dp_xx_ex2_rm               ),
  .dp_xx_ex2_srcf2             (dp_xx_ex2_srcf2            ),
  .dp_xx_ex3_rm                (dp_xx_ex3_rm               ),
  .dp_xx_ex4_rm                (dp_xx_ex4_rm               ),
  .ex2_inst_wb                 (ex2_inst_wb                ),
  .falu_fpu_ex1_fflags         (falu_fpu_ex1_fflags        ),
  .falu_fpu_ex1_result         (falu_fpu_ex1_result        ),
  .falu_fpu_ex1_special_sel    (falu_fpu_ex1_special_sel   ),
  .falu_fpu_ex1_special_sign   (falu_fpu_ex1_special_sign  ),
  .falu_fpu_ex1_src_reuse      (falu_fpu_ex1_src_reuse     ),
  .falu_fpu_ex1_src_reuse_data (falu_fpu_ex1_src_reuse_data),
  .falu_fpu_ex1_wb_gpr         (falu_fpu_ex1_wb_gpr        ),
  .falu_fpu_ex2_fflags         (falu_fpu_ex2_fflags        ),
  .falu_fpu_ex2_result         (falu_fpu_ex2_result        ),
  .falu_fpu_ex2_result_vld     (falu_fpu_ex2_result_vld    ),
  .falu_fpu_ex3_fflags         (falu_fpu_ex3_fflags        ),
  .falu_fpu_ex3_result         (falu_fpu_ex3_result        ),
  .falu_fpu_ex3_result_vld     (falu_fpu_ex3_result_vld    ),
  .falu_fpu_ex3_wb_gpr         (falu_fpu_ex3_wb_gpr        ),
  .fdsu_fpu_ex1_fflags         (fdsu_fpu_ex1_fflags        ),
  .fdsu_fpu_ex1_special_sel    (fdsu_fpu_ex1_special_sel   ),
  .fdsu_fpu_ex1_special_sign   (fdsu_fpu_ex1_special_sign  ),
  .fmau_fpu_ex1_fflags         (fmau_fpu_ex1_fflags        ),
  .fmau_fpu_ex1_special_sel    (fmau_fpu_ex1_special_sel   ),
  .fmau_fpu_ex1_special_sign   (fmau_fpu_ex1_special_sign  ),
  .fmau_fpu_ex3_fflags         (fmau_fpu_ex3_fflags        ),
  .fmau_fpu_ex3_result         (fmau_fpu_ex3_result        ),
  .fmau_fpu_ex3_result_vld     (fmau_fpu_ex3_result_vld    ),
  .fmau_fpu_ex4_fflags         (fmau_fpu_ex4_fflags        ),
  .fmau_fpu_ex4_result         (fmau_fpu_ex4_result        ),
  .forever_cpuclk              (forever_cpuclk             ),
  .idu_fpu_ex1_dst_freg        (idu_fpu_ex1_dst_freg       ),
  .idu_fpu_ex1_dst_freg_vld    (idu_fpu_ex1_dst_freg_vld   ),
  .idu_fpu_ex1_eu_sel          (idu_fpu_ex1_eu_sel         ),
  .idu_fpu_ex1_func            (idu_fpu_ex1_func           ),
  .idu_fpu_ex1_gateclk_vld     (idu_fpu_ex1_gateclk_vld    ),
  .idu_fpu_ex1_rm              (idu_fpu_ex1_rm             ),
  .idu_fpu_ex1_srcf0           (idu_fpu_ex1_srcf0          ),
  .idu_fpu_ex1_srcf1           (idu_fpu_ex1_srcf1          ),
  .idu_fpu_ex1_srcf2           (idu_fpu_ex1_srcf2          ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Instance("pa_fpu_ctrl","x_pa_fpu_ctrl"); @31
pa_fpu_ctrl  x_pa_fpu_ctrl (
  .cp0_fpu_icg_en            (cp0_fpu_icg_en           ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .ctrl_falu_ex1_sel         (ctrl_falu_ex1_sel        ),
  .ctrl_falu_ex1_sel_dp      (ctrl_falu_ex1_sel_dp     ),
  .ctrl_falu_ex1_sel_gate    (ctrl_falu_ex1_sel_gate   ),
  .ctrl_fdsu_ex1_sel         (ctrl_fdsu_ex1_sel        ),
  .ctrl_fmau_ex1_sel         (ctrl_fmau_ex1_sel        ),
  .ctrl_fmau_ex1_sel_gate    (ctrl_fmau_ex1_sel_gate   ),
  .ctrl_frbus_ex2_wb_req     (ctrl_frbus_ex2_wb_req    ),
  .ctrl_frbus_ex3_wb_req     (ctrl_frbus_ex3_wb_req    ),
  .ctrl_frbus_ex4_wb_req     (ctrl_frbus_ex4_wb_req    ),
  .ctrl_xx_ex1_cmplt_dp      (ctrl_xx_ex1_cmplt_dp     ),
  .ctrl_xx_ex1_inst_vld      (ctrl_xx_ex1_inst_vld     ),
  .ctrl_xx_ex1_stall         (ctrl_xx_ex1_stall        ),
  .ctrl_xx_ex1_warm_up       (ctrl_xx_ex1_warm_up      ),
  .ctrl_xx_ex2_cancel        (ctrl_xx_ex2_cancel       ),
  .ctrl_xx_ex2_inst_vld      (ctrl_xx_ex2_inst_vld     ),
  .ctrl_xx_ex2_stall         (ctrl_xx_ex2_stall        ),
  .ctrl_xx_ex2_warm_up       (ctrl_xx_ex2_warm_up      ),
  .ctrl_xx_ex3_inst_vld      (ctrl_xx_ex3_inst_vld     ),
  .ctrl_xx_ex3_stall         (ctrl_xx_ex3_stall        ),
  .ctrl_xx_ex3_warm_up       (ctrl_xx_ex3_warm_up      ),
  .ctrl_xx_ex4_stall         (ctrl_xx_ex4_stall        ),
  .ex2_inst_wb               (ex2_inst_wb              ),
  .falu_fpu_ex1_cmplt        (falu_fpu_ex1_cmplt       ),
  .falu_fpu_ex1_cmplt_dp     (falu_fpu_ex1_cmplt_dp    ),
  .falu_fpu_ex1_wb_gpr       (falu_fpu_ex1_wb_gpr      ),
  .falu_fpu_ex3_result_vld   (falu_fpu_ex3_result_vld  ),
  .falu_fpu_ex3_stall        (falu_fpu_ex3_stall       ),
  .falu_fpu_ex3_wb_gpr       (falu_fpu_ex3_wb_gpr      ),
  .fdsu_fpu_ex1_cmplt        (fdsu_fpu_ex1_cmplt       ),
  .fdsu_fpu_ex1_cmplt_dp     (fdsu_fpu_ex1_cmplt_dp    ),
  .fdsu_fpu_ex1_special_sel  (fdsu_fpu_ex1_special_sel ),
  .fdsu_fpu_ex1_stall        (fdsu_fpu_ex1_stall       ),
  .fdsu_fpu_no_op            (fdsu_fpu_no_op           ),
  .fmau_fpu_ex1_cmplt        (fmau_fpu_ex1_cmplt       ),
  .fmau_fpu_ex1_cmplt_dp     (fmau_fpu_ex1_cmplt_dp    ),
  .fmau_fpu_ex1_denorm_stall (fmau_fpu_ex1_denorm_stall),
  .fmau_fpu_ex3_result_vld   (fmau_fpu_ex3_result_vld  ),
  .fmau_fpu_id_reg_set       (fmau_fpu_id_reg_set      ),
  .forever_cpuclk            (forever_cpuclk           ),
  .fpu_had_ex2_inst_vld      (fpu_had_ex2_inst_vld     ),
  .fpu_had_ex3_inst_vld      (fpu_had_ex3_inst_vld     ),
  .fpu_had_ex4_inst_vld      (fpu_had_ex4_inst_vld     ),
  .fpu_idu_ex1_stall         (fpu_idu_ex1_stall        ),
  .fpu_rtu_ex1_inst_cmplt    (fpu_rtu_ex1_inst_cmplt   ),
  .fpu_rtu_ex1_inst_cmplt_dp (fpu_rtu_ex1_inst_cmplt_dp),
  .fpu_xx_no_op              (fpu_xx_no_op             ),
  .frbus_ctrl_ex2_wb_grant   (frbus_ctrl_ex2_wb_grant  ),
  .frbus_ctrl_ex3_wb_grant   (frbus_ctrl_ex3_wb_grant  ),
  .frbus_ctrl_ex4_wb_grant   (frbus_ctrl_ex4_wb_grant  ),
  .idu_fpu_ex1_cmplt_dp_sel  (idu_fpu_ex1_cmplt_dp_sel ),
  .idu_fpu_ex1_eu_sel        (idu_fpu_ex1_eu_sel       ),
  .idu_fpu_ex1_gateclk_vld   (idu_fpu_ex1_gateclk_vld  ),
  .idu_fpu_ex1_inst_vld      (idu_fpu_ex1_inst_vld     ),
  .ifu_fpu_warm_up           (ifu_fpu_warm_up          ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .rtu_fpu_ex2_stall         (rtu_fpu_ex2_stall        ),
  .rtu_xx_ex1_cancel         (rtu_xx_ex1_cancel        ),
  .rtu_xx_ex2_cancel         (rtu_xx_ex2_cancel        ),
  .rtu_yy_xx_flush           (rtu_yy_xx_flush          )
);

// &Instance("pa_fpu_frbus","x_pa_fpu_frbus"); @32
pa_fpu_frbus  x_pa_fpu_frbus (
  .cp0_fpu_icg_en            (cp0_fpu_icg_en           ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .ctrl_frbus_ex2_wb_req     (ctrl_frbus_ex2_wb_req    ),
  .ctrl_frbus_ex3_wb_req     (ctrl_frbus_ex3_wb_req    ),
  .ctrl_frbus_ex4_wb_req     (ctrl_frbus_ex4_wb_req    ),
  .ctrl_xx_ex2_warm_up       (ctrl_xx_ex2_warm_up      ),
  .dp_frbus_ex2_data         (dp_frbus_ex2_data        ),
  .dp_frbus_ex2_fflags       (dp_frbus_ex2_fflags      ),
  .dp_frbus_ex2_freg         (dp_frbus_ex2_freg        ),
  .dp_frbus_ex3_data         (dp_frbus_ex3_data        ),
  .dp_frbus_ex3_fflags       (dp_frbus_ex3_fflags      ),
  .dp_frbus_ex3_freg         (dp_frbus_ex3_freg        ),
  .dp_frbus_ex4_data         (dp_frbus_ex4_data        ),
  .dp_frbus_ex4_fflags       (dp_frbus_ex4_fflags      ),
  .dp_frbus_ex4_freg         (dp_frbus_ex4_freg        ),
  .fdsu_frbus_data           (fdsu_frbus_data          ),
  .fdsu_frbus_fflags         (fdsu_frbus_fflags        ),
  .fdsu_frbus_freg           (fdsu_frbus_freg          ),
  .fdsu_frbus_wb_vld         (fdsu_frbus_wb_vld        ),
  .forever_cpuclk            (forever_cpuclk           ),
  .fpu_cp0_wb_fflags         (fpu_cp0_wb_fflags        ),
  .fpu_cp0_wb_fflags_updt    (fpu_cp0_wb_fflags_updt   ),
  .fpu_idu_fwd_data          (fpu_idu_fwd_data         ),
  .fpu_idu_fwd_freg          (fpu_idu_fwd_freg         ),
  .fpu_idu_fwd_vld           (fpu_idu_fwd_vld          ),
  .fpu_rtu_ex3_wb_fflags     (fpu_rtu_ex3_wb_fflags    ),
  .fpu_rtu_ex3_wb_fflags_vld (fpu_rtu_ex3_wb_fflags_vld),
  .fpu_rtu_fgpr_wb_data      (fpu_rtu_fgpr_wb_data     ),
  .fpu_rtu_fgpr_wb_reg       (fpu_rtu_fgpr_wb_reg      ),
  .fpu_rtu_fgpr_wb_vld       (fpu_rtu_fgpr_wb_vld      ),
  .fpu_wb_float_fflags_updt  (fpu_wb_float_fflags_updt ),
  .frbus_ctrl_ex2_wb_grant   (frbus_ctrl_ex2_wb_grant  ),
  .frbus_ctrl_ex3_wb_grant   (frbus_ctrl_ex3_wb_grant  ),
  .frbus_ctrl_ex4_wb_grant   (frbus_ctrl_ex4_wb_grant  ),
  .frbus_fdsu_wb_grant       (frbus_fdsu_wb_grant      ),
  .ifu_fpu_warm_up           (ifu_fpu_warm_up          ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .rtu_fpu_ex3_wb_grant      (rtu_fpu_ex3_wb_grant     ),
  .rtu_fpu_fgpr_wb_grant     (rtu_fpu_fgpr_wb_grant    )
);


// &Instance("pa_falu_top","x_pa_falu_top"); @34
pa_falu_top  x_pa_falu_top (
  .cp0_fpu_icg_en              (cp0_fpu_icg_en             ),
  .cp0_fpu_xx_dqnan            (cp0_fpu_xx_dqnan           ),
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
  .dp_xx_ex1_cnan              (dp_xx_ex1_cnan             ),
  .dp_xx_ex1_id                (dp_xx_ex1_id               ),
  .dp_xx_ex1_inf               (dp_xx_ex1_inf              ),
  .dp_xx_ex1_norm              (dp_xx_ex1_norm             ),
  .dp_xx_ex1_qnan              (dp_xx_ex1_qnan             ),
  .dp_xx_ex1_rm                (dp_xx_ex1_rm               ),
  .dp_xx_ex1_snan              (dp_xx_ex1_snan             ),
  .dp_xx_ex1_zero              (dp_xx_ex1_zero             ),
  .dp_xx_ex2_rm                (dp_xx_ex2_rm               ),
  .dp_xx_ex2_srcf2             (dp_xx_ex2_srcf2            ),
  .dp_xx_ex3_rm                (dp_xx_ex3_rm               ),
  .falu_fpu_ex1_cmplt          (falu_fpu_ex1_cmplt         ),
  .falu_fpu_ex1_cmplt_dp       (falu_fpu_ex1_cmplt_dp      ),
  .falu_fpu_ex1_fflags         (falu_fpu_ex1_fflags        ),
  .falu_fpu_ex1_result         (falu_fpu_ex1_result        ),
  .falu_fpu_ex1_special_sel    (falu_fpu_ex1_special_sel   ),
  .falu_fpu_ex1_special_sign   (falu_fpu_ex1_special_sign  ),
  .falu_fpu_ex1_src_reuse      (falu_fpu_ex1_src_reuse     ),
  .falu_fpu_ex1_src_reuse_data (falu_fpu_ex1_src_reuse_data),
  .falu_fpu_ex1_wb_gpr         (falu_fpu_ex1_wb_gpr        ),
  .falu_fpu_ex2_fflags         (falu_fpu_ex2_fflags        ),
  .falu_fpu_ex2_result         (falu_fpu_ex2_result        ),
  .falu_fpu_ex2_result_vld     (falu_fpu_ex2_result_vld    ),
  .falu_fpu_ex3_fflags         (falu_fpu_ex3_fflags        ),
  .falu_fpu_ex3_result         (falu_fpu_ex3_result        ),
  .falu_fpu_ex3_result_vld     (falu_fpu_ex3_result_vld    ),
  .falu_fpu_ex3_stall          (falu_fpu_ex3_stall         ),
  .falu_fpu_ex3_wb_gpr         (falu_fpu_ex3_wb_gpr        ),
  .forever_cpuclk              (forever_cpuclk             ),
  .fpu_rtu_ex3_wb_data         (fpu_rtu_ex3_wb_data        ),
  .fpu_rtu_ex3_wb_fflags       (fpu_rtu_ex3_wb_fflags      ),
  .fpu_rtu_ex3_wb_fflags_vld   (fpu_rtu_ex3_wb_fflags_vld  ),
  .fpu_rtu_ex3_wb_preg         (fpu_rtu_ex3_wb_preg        ),
  .fpu_rtu_ex3_wb_vld          (fpu_rtu_ex3_wb_vld         ),
  .idu_fpu_ex1_dst_preg        (idu_fpu_ex1_dst_preg       ),
  .idu_fpu_ex1_eu_sel          (idu_fpu_ex1_eu_sel         ),
  .idu_fpu_ex1_func            (idu_fpu_ex1_func           ),
  .idu_fpu_ex1_srcf0           (idu_fpu_ex1_srcf0          ),
  .idu_fpu_ex1_srcf1           (idu_fpu_ex1_srcf1          ),
  .idu_fpu_ex1_srci            (idu_fpu_ex1_srci           ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .rtu_fpu_ex3_wb_grant        (rtu_fpu_ex3_wb_grant       ),
  .rtu_xx_ex1_cancel           (rtu_xx_ex1_cancel          )
);

// &Instance("pa_fmau_top","x_pa_fmau_top"); @35
pa_fmau_top  x_pa_fmau_top (
  .cp0_fpu_icg_en            (cp0_fpu_icg_en           ),
  .cp0_fpu_xx_dqnan          (cp0_fpu_xx_dqnan         ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .ctrl_fmau_ex1_sel         (ctrl_fmau_ex1_sel        ),
  .ctrl_fmau_ex1_sel_gate    (ctrl_fmau_ex1_sel_gate   ),
  .ctrl_xx_ex1_cmplt_dp      (ctrl_xx_ex1_cmplt_dp     ),
  .ctrl_xx_ex1_stall         (ctrl_xx_ex1_stall        ),
  .ctrl_xx_ex1_warm_up       (ctrl_xx_ex1_warm_up      ),
  .ctrl_xx_ex2_cancel        (ctrl_xx_ex2_cancel       ),
  .ctrl_xx_ex2_stall         (ctrl_xx_ex2_stall        ),
  .ctrl_xx_ex2_warm_up       (ctrl_xx_ex2_warm_up      ),
  .ctrl_xx_ex3_stall         (ctrl_xx_ex3_stall        ),
  .ctrl_xx_ex3_warm_up       (ctrl_xx_ex3_warm_up      ),
  .ctrl_xx_ex4_stall         (ctrl_xx_ex4_stall        ),
  .dp_xx_ex1_cnan            (dp_xx_ex1_cnan           ),
  .dp_xx_ex1_id              (dp_xx_ex1_id             ),
  .dp_xx_ex1_inf             (dp_xx_ex1_inf            ),
  .dp_xx_ex1_norm            (dp_xx_ex1_norm           ),
  .dp_xx_ex1_qnan            (dp_xx_ex1_qnan           ),
  .dp_xx_ex1_rm              (dp_xx_ex1_rm             ),
  .dp_xx_ex1_snan            (dp_xx_ex1_snan           ),
  .dp_xx_ex1_srcf2           (dp_xx_ex1_srcf2          ),
  .dp_xx_ex1_zero            (dp_xx_ex1_zero           ),
  .dp_xx_ex2_srcf2           (dp_xx_ex2_srcf2          ),
  .dp_xx_ex3_rm              (dp_xx_ex3_rm             ),
  .dp_xx_ex4_rm              (dp_xx_ex4_rm             ),
  .fmau_fpu_ex1_cmplt        (fmau_fpu_ex1_cmplt       ),
  .fmau_fpu_ex1_cmplt_dp     (fmau_fpu_ex1_cmplt_dp    ),
  .fmau_fpu_ex1_denorm_stall (fmau_fpu_ex1_denorm_stall),
  .fmau_fpu_ex1_fflags       (fmau_fpu_ex1_fflags      ),
  .fmau_fpu_ex1_special_sel  (fmau_fpu_ex1_special_sel ),
  .fmau_fpu_ex1_special_sign (fmau_fpu_ex1_special_sign),
  .fmau_fpu_ex3_fflags       (fmau_fpu_ex3_fflags      ),
  .fmau_fpu_ex3_result       (fmau_fpu_ex3_result      ),
  .fmau_fpu_ex3_result_vld   (fmau_fpu_ex3_result_vld  ),
  .fmau_fpu_ex4_fflags       (fmau_fpu_ex4_fflags      ),
  .fmau_fpu_ex4_result       (fmau_fpu_ex4_result      ),
  .fmau_fpu_id_reg_set       (fmau_fpu_id_reg_set      ),
  .forever_cpuclk            (forever_cpuclk           ),
  .idu_fpu_ex1_eu_sel        (idu_fpu_ex1_eu_sel       ),
  .idu_fpu_ex1_func          (idu_fpu_ex1_func         ),
  .idu_fpu_ex1_srcf0         (idu_fpu_ex1_srcf0        ),
  .idu_fpu_ex1_srcf1         (idu_fpu_ex1_srcf1        ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .rtu_xx_ex1_cancel         (rtu_xx_ex1_cancel        )
);

// &Instance("pa_fdsu_top","x_pa_fdsu_top"); @36
pa_fdsu_top  x_pa_fdsu_top (
  .cp0_fpu_icg_en            (cp0_fpu_icg_en           ),
  .cp0_fpu_xx_dqnan          (cp0_fpu_xx_dqnan         ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .ctrl_fdsu_ex1_sel         (ctrl_fdsu_ex1_sel        ),
  .ctrl_xx_ex1_cmplt_dp      (ctrl_xx_ex1_cmplt_dp     ),
  .ctrl_xx_ex1_inst_vld      (ctrl_xx_ex1_inst_vld     ),
  .ctrl_xx_ex1_stall         (ctrl_xx_ex1_stall        ),
  .ctrl_xx_ex1_warm_up       (ctrl_xx_ex1_warm_up      ),
  .ctrl_xx_ex2_warm_up       (ctrl_xx_ex2_warm_up      ),
  .ctrl_xx_ex3_warm_up       (ctrl_xx_ex3_warm_up      ),
  .dp_xx_ex1_cnan            (dp_xx_ex1_cnan           ),
  .dp_xx_ex1_id              (dp_xx_ex1_id             ),
  .dp_xx_ex1_inf             (dp_xx_ex1_inf            ),
  .dp_xx_ex1_qnan            (dp_xx_ex1_qnan           ),
  .dp_xx_ex1_rm              (dp_xx_ex1_rm             ),
  .dp_xx_ex1_snan            (dp_xx_ex1_snan           ),
  .dp_xx_ex1_zero            (dp_xx_ex1_zero           ),
  .fdsu_fpu_debug_info       (fdsu_fpu_debug_info      ),
  .fdsu_fpu_ex1_cmplt        (fdsu_fpu_ex1_cmplt       ),
  .fdsu_fpu_ex1_cmplt_dp     (fdsu_fpu_ex1_cmplt_dp    ),
  .fdsu_fpu_ex1_fflags       (fdsu_fpu_ex1_fflags      ),
  .fdsu_fpu_ex1_special_sel  (fdsu_fpu_ex1_special_sel ),
  .fdsu_fpu_ex1_special_sign (fdsu_fpu_ex1_special_sign),
  .fdsu_fpu_ex1_stall        (fdsu_fpu_ex1_stall       ),
  .fdsu_fpu_no_op            (fdsu_fpu_no_op           ),
  .fdsu_frbus_data           (fdsu_frbus_data          ),
  .fdsu_frbus_fflags         (fdsu_frbus_fflags        ),
  .fdsu_frbus_freg           (fdsu_frbus_freg          ),
  .fdsu_frbus_wb_vld         (fdsu_frbus_wb_vld        ),
  .forever_cpuclk            (forever_cpuclk           ),
  .frbus_fdsu_wb_grant       (frbus_fdsu_wb_grant      ),
  .idu_fpu_ex1_dst_freg      (idu_fpu_ex1_dst_freg     ),
  .idu_fpu_ex1_eu_sel        (idu_fpu_ex1_eu_sel       ),
  .idu_fpu_ex1_func          (idu_fpu_ex1_func         ),
  .idu_fpu_ex1_srcf0         (idu_fpu_ex1_srcf0        ),
  .idu_fpu_ex1_srcf1         (idu_fpu_ex1_srcf1        ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .rtu_xx_ex1_cancel         (rtu_xx_ex1_cancel        ),
  .rtu_xx_ex2_cancel         (rtu_xx_ex2_cancel        ),
  .rtu_yy_xx_async_flush     (rtu_yy_xx_async_flush    ),
  .rtu_yy_xx_flush           (rtu_yy_xx_flush          )
);


assign fpu_dtu_debug_info[7:0] = {
         fpu_had_ex4_inst_vld,
         fpu_had_ex3_inst_vld,
         fpu_had_ex2_inst_vld,
         fdsu_fpu_debug_info[4:0]
       };

assign rtu_xx_ex1_cancel = 1'b0;
assign rtu_xx_ex2_cancel = 1'b0;
assign rtu_fpu_ex2_stall = 1'b0;

assign fpu_iu_ex1_cmplt         = fpu_rtu_ex1_inst_cmplt;
assign fpu_iu_ex1_cmplt_dp      = fpu_rtu_ex1_inst_cmplt_dp;
//assign fpu_iu_ex1_wb_vld        = fpu_rtu_ex1_wb_vld;
//assign fpu_iu_ex1_wb_data[31:0] = fpu_rtu_ex1_wb_data[31:0];
//assign fpu_iu_ex1_wb_preg[5:0]  = {1'b0,fpu_rtu_ex1_wb_preg[4:0]};
//assign fpu_idu_ex3_fwd_vld      = fpu_rtu_ex3_wb_vld;

assign fpu_rtu_wb_vld           = fpu_rtu_ex3_wb_vld;
assign fpu_rtu_wb_data[31:0]    = fpu_rtu_ex3_wb_data[31:0];
assign fpu_rtu_wb_preg[5:0]     = {1'b0,fpu_rtu_ex3_wb_preg[4:0]};
assign rtu_fpu_ex3_wb_grant     = rtu_fpu_wb_grant;

//assign fpu_iu_ex1_fflags_updt = fpu_rtu_ex1_fflags_updt;
//assign fpu_iu_ex1_fflags[4:0] = fpu_rtu_ex1_wb_fflags[4:0];
//assign fpu_iu_ex3_wb_fflags[4:0] = fpu_rtu_ex3_wb_fflags[4:0];

// &ModuleEnd; @65
endmodule


