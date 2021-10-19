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
module pa_fmau_dp(
  cp0_fpu_icg_en,
  cp0_fpu_xx_dqnan,
  cp0_yy_clk_en,
  ctrl_dp_ex1_inst_pipe_down,
  ctrl_dp_ex1_inst_vld,
  ctrl_dp_ex2_inst_pipe_down,
  ctrl_dp_ex2_inst_vld,
  ctrl_dp_ex3_inst_pipe_down,
  ctrl_dp_ex3_inst_vld,
  ctrl_xx_ex1_warm_up,
  ctrl_xx_ex2_warm_up,
  ctrl_xx_ex3_warm_up,
  dp_ctrl_ex3_mac,
  dp_xx_ex1_cnan,
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
  ex1_id_reg,
  ex2_special_cmplt,
  fmau_fpu_ex1_fflags,
  fmau_fpu_ex1_special_sel,
  fmau_fpu_ex1_special_sign,
  fmau_fpu_ex3_fflags,
  fmau_fpu_ex3_result,
  fmau_fpu_ex4_fflags,
  fmau_fpu_ex4_result,
  forever_cpuclk,
  idu_fpu_ex1_eu_sel,
  idu_fpu_ex1_func,
  idu_fpu_ex1_srcf0,
  idu_fpu_ex1_srcf1,
  pad_yy_icg_scan_en
);

// &Ports; @25
input           cp0_fpu_icg_en;            
input           cp0_fpu_xx_dqnan;          
input           cp0_yy_clk_en;             
input           ctrl_dp_ex1_inst_pipe_down; 
input           ctrl_dp_ex1_inst_vld;      
input           ctrl_dp_ex2_inst_pipe_down; 
input           ctrl_dp_ex2_inst_vld;      
input           ctrl_dp_ex3_inst_pipe_down; 
input           ctrl_dp_ex3_inst_vld;      
input           ctrl_xx_ex1_warm_up;       
input           ctrl_xx_ex2_warm_up;       
input           ctrl_xx_ex3_warm_up;       
input   [2 :0]  dp_xx_ex1_cnan;            
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
input   [1 :0]  ex1_id_reg;                
input           forever_cpuclk;            
input   [2 :0]  idu_fpu_ex1_eu_sel;        
input   [9 :0]  idu_fpu_ex1_func;          
input   [31:0]  idu_fpu_ex1_srcf0;         
input   [31:0]  idu_fpu_ex1_srcf1;         
input           pad_yy_icg_scan_en;        
output          dp_ctrl_ex3_mac;           
output          ex2_special_cmplt;         
output  [4 :0]  fmau_fpu_ex1_fflags;       
output  [7 :0]  fmau_fpu_ex1_special_sel;  
output  [3 :0]  fmau_fpu_ex1_special_sign; 
output  [4 :0]  fmau_fpu_ex3_fflags;       
output  [31:0]  fmau_fpu_ex3_result;       
output  [4 :0]  fmau_fpu_ex4_fflags;       
output  [31:0]  fmau_fpu_ex4_result;       

// &Regs; @26
reg     [9 :0]  ex2_expnt_2;               
reg             ex2_mac;                   
reg     [9 :0]  ex2_mult_expnt;            
reg             ex2_mult_sign;             
reg             ex2_special_cmplt;         
reg             ex2_src2_expnt_not_zero;   
reg             ex2_src2_sign;             
reg             ex3_mac;                   
reg     [9 :0]  ex3_mac_expnt;             
reg     [9 :0]  ex3_mult_expnt;            
reg             ex3_mult_sign;             
reg             ex3_sub_vld;               

// &Wires; @27
wire            cp0_fpu_icg_en;            
wire            cp0_fpu_xx_dqnan;          
wire            cp0_yy_clk_en;             
wire            ctrl_dp_ex1_inst_pipe_down; 
wire            ctrl_dp_ex1_inst_vld;      
wire            ctrl_dp_ex2_inst_pipe_down; 
wire            ctrl_dp_ex2_inst_vld;      
wire            ctrl_dp_ex3_inst_pipe_down; 
wire            ctrl_dp_ex3_inst_vld;      
wire            ctrl_xx_ex1_warm_up;       
wire            ctrl_xx_ex2_warm_up;       
wire            ctrl_xx_ex3_warm_up;       
wire            dp_ctrl_ex3_mac;           
wire    [2 :0]  dp_xx_ex1_cnan;            
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
wire    [2 :0]  ex1_eu_sel;                
wire    [9 :0]  ex1_expnt_0;               
wire    [9 :0]  ex1_expnt_1;               
wire    [9 :0]  ex1_expnt_2;               
wire    [9 :0]  ex1_expnt_bias;            
wire            ex1_expnt_near_of;         
wire            ex1_expnt_near_uf;         
wire    [23:0]  ex1_frac_0;                
wire    [23:0]  ex1_frac_1;                
wire    [9 :0]  ex1_func;                  
wire    [1 :0]  ex1_id_reg;                
wire    [2 :0]  ex1_inst_rm;               
wire            ex1_mac;                   
wire            ex1_mac_update;            
wire    [9 :0]  ex1_mult_expnt;            
wire            ex1_mult_sign;             
wire            ex1_neg;                   
wire            ex1_special_cmplt;         
wire            ex1_src2_expnt_not_zero;   
wire            ex1_src2_sign;             
wire    [31:0]  ex1_srcf0;                 
wire    [31:0]  ex1_srcf1;                 
wire    [31:0]  ex1_srcf2;                 
wire            ex1_sub;                   
wire            ex1_sub_vld;               
wire            ex2_adder_0_sel_h;         
wire    [23:0]  ex2_frac_2;                
wire    [9 :0]  ex2_mac_expnt;             
wire    [47:0]  ex2_mult_data;             
wire    [52:0]  ex2_shift_data;            
wire    [31:0]  ex2_srcf2;                 
wire            ex2_sub_vld;               
wire    [2 :0]  ex3_inst_rm;               
wire    [2 :0]  ex4_inst_rm;               
wire            fmau_ex2_data_clk;         
wire            fmau_ex2_data_clk_en;      
wire            fmau_ex3_data_clk;         
wire            fmau_ex3_data_clk_en;      
wire            fmau_ex4_data_clk;         
wire            fmau_ex4_data_clk_en;      
wire    [4 :0]  fmau_fpu_ex1_fflags;       
wire    [7 :0]  fmau_fpu_ex1_special_sel;  
wire    [3 :0]  fmau_fpu_ex1_special_sign; 
wire    [4 :0]  fmau_fpu_ex3_fflags;       
wire    [31:0]  fmau_fpu_ex3_result;       
wire    [4 :0]  fmau_fpu_ex4_fflags;       
wire    [31:0]  fmau_fpu_ex4_result;       
wire            forever_cpuclk;            
wire    [2 :0]  idu_fpu_ex1_eu_sel;        
wire    [9 :0]  idu_fpu_ex1_func;          
wire    [31:0]  idu_fpu_ex1_srcf0;         
wire    [31:0]  idu_fpu_ex1_srcf1;         
wire            pad_yy_icg_scan_en;        


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
assign ex1_func[FUNC_WIDTH-1:0] = idu_fpu_ex1_func[FUNC_WIDTH-1:0];

assign ex1_inst_rm[2:0]         = dp_xx_ex1_rm[2:0]; 
//assign ex2_inst_rm[2:0]         = dp_xx_ex2_rm[2:0]; 
assign ex3_inst_rm[2:0]         = dp_xx_ex3_rm[2:0]; 
assign ex4_inst_rm[2:0]         = dp_xx_ex4_rm[2:0]; 

assign ex1_srcf0[SINGLE_WIDTH-1:0] = idu_fpu_ex1_srcf0[SINGLE_WIDTH-1:0];
assign ex1_srcf1[SINGLE_WIDTH-1:0] = idu_fpu_ex1_srcf1[SINGLE_WIDTH-1:0];
assign ex1_srcf2[SINGLE_WIDTH-1:0] =   dp_xx_ex1_srcf2[SINGLE_WIDTH-1:0];
assign ex2_srcf2[SINGLE_WIDTH-1:0] =   dp_xx_ex2_srcf2[SINGLE_WIDTH-1:0];
assign ex1_mac    = ex1_func[0];
assign ex1_sub    = ex1_func[1];
assign ex1_neg    = ex1_func[2];

// &Instance("pa_fmau_ex1_special_judge","x_pa_fmau_ex1_special_judge"); @70
pa_fmau_ex1_special_judge  x_pa_fmau_ex1_special_judge (
  .cp0_fpu_xx_dqnan          (cp0_fpu_xx_dqnan         ),
  .dp_xx_ex1_cnan            (dp_xx_ex1_cnan           ),
  .dp_xx_ex1_inf             (dp_xx_ex1_inf            ),
  .dp_xx_ex1_norm            (dp_xx_ex1_norm           ),
  .dp_xx_ex1_qnan            (dp_xx_ex1_qnan           ),
  .dp_xx_ex1_snan            (dp_xx_ex1_snan           ),
  .dp_xx_ex1_zero            (dp_xx_ex1_zero           ),
  .ex1_inst_rm               (ex1_inst_rm              ),
  .ex1_mac                   (ex1_mac                  ),
  .ex1_mult_expnt            (ex1_mult_expnt           ),
  .ex1_mult_sign             (ex1_mult_sign            ),
  .ex1_special_cmplt         (ex1_special_cmplt        ),
  .ex1_src2_sign             (ex1_src2_sign            ),
  .ex1_sub_vld               (ex1_sub_vld              ),
  .fmau_fpu_ex1_fflags       (fmau_fpu_ex1_fflags      ),
  .fmau_fpu_ex1_special_sel  (fmau_fpu_ex1_special_sel ),
  .fmau_fpu_ex1_special_sign (fmau_fpu_ex1_special_sign)
);

//==========================================================
//                     EX1 Fraction data path
//==========================================================
assign ex1_mac_update = ex1_mac || |ex1_id_reg[1:0] || ex1_expnt_near_uf || ex1_expnt_near_of;

assign ex1_eu_sel[2:0]           = idu_fpu_ex1_eu_sel[2:0];
assign ex1_frac_0[SINGLE_FRAC:0] = {!ex1_id_reg[0],ex1_srcf0[SINGLE_FRAC-1:0]} & {(SINGLE_FRAC+1){ex1_eu_sel[1]}};
assign ex1_frac_1[SINGLE_FRAC:0] = {!ex1_id_reg[1],ex1_srcf1[SINGLE_FRAC-1:0]} & {(SINGLE_FRAC+1){ex1_eu_sel[1]}};

// &Instance("pa_fmau_frac_mult","x_pa_fmau_frac_mult"); @88
pa_fmau_frac_mult  x_pa_fmau_frac_mult (
  .ctrl_dp_ex1_inst_pipe_down (ctrl_dp_ex1_inst_pipe_down),
  .ctrl_xx_ex1_warm_up        (ctrl_xx_ex1_warm_up       ),
  .ex1_frac_0                 (ex1_frac_0                ),
  .ex1_frac_1                 (ex1_frac_1                ),
  .ex2_mult_data              (ex2_mult_data             ),
  .fmau_ex2_data_clk          (fmau_ex2_data_clk         )
);

//==========================================================
//                     EX1 Exponent data path
//==========================================================
assign ex1_expnt_0[SINGLE_EXPN+1:0] = {2'b00,ex1_srcf0[SINGLE_FRAC+SINGLE_EXPN-1:SINGLE_FRAC]};
assign ex1_expnt_1[SINGLE_EXPN+1:0] = {2'b00,ex1_srcf1[SINGLE_FRAC+SINGLE_EXPN-1:SINGLE_FRAC]};
assign ex1_expnt_2[SINGLE_EXPN+1:0] = ex1_src2_expnt_not_zero ? {2'b00,ex1_srcf2[SINGLE_FRAC+SINGLE_EXPN-1:SINGLE_FRAC]}:10'b00_0000_0001;

assign ex1_src2_expnt_not_zero = |ex1_srcf2[SINGLE_FRAC+SINGLE_EXPN-1:SINGLE_FRAC];

assign ex1_expnt_bias[SINGLE_EXPN+1:0] = 10'b11_1000_0001; //single= -127

assign ex1_mult_expnt[SINGLE_EXPN+1:0] = {ex1_expnt_0[SINGLE_EXPN+1:0]} + 
                                         {ex1_expnt_1[SINGLE_EXPN+1:0]} +
                                         {1'b0,{SINGLE_EXPN{1'b0}},ex1_id_reg[0]} +
                                         {1'b0,{SINGLE_EXPN{1'b0}},ex1_id_reg[1]} +
                                         ex1_expnt_bias[SINGLE_EXPN+1:0];

assign ex1_expnt_near_uf = ex1_mult_expnt[SINGLE_EXPN+1] ||  //<-127
                        !(|ex1_mult_expnt[SINGLE_EXPN+1:0]); //=-127

assign ex1_expnt_near_of =(ex1_mult_expnt[SINGLE_EXPN+1:0]==10'b00_1111_1110); //127

assign ex1_mult_sign = (ex1_srcf0[SINGLE_WIDTH-1]^ex1_srcf1[SINGLE_WIDTH-1]^ex1_neg);

assign ex1_src2_sign = (ex1_srcf2[SINGLE_WIDTH-1]^ex1_neg^ex1_sub);

assign ex1_sub_vld = (ex1_mult_sign ^ ex1_src2_sign) && ex1_mac;

// &Instance("pa_fmau_frac_shift","x_pa_fmau_frac_shift"); @156
pa_fmau_frac_shift  x_pa_fmau_frac_shift (
  .ctrl_dp_ex1_inst_pipe_down (ctrl_dp_ex1_inst_pipe_down),
  .ctrl_xx_ex1_warm_up        (ctrl_xx_ex1_warm_up       ),
  .ex1_expnt_2                (ex1_expnt_2               ),
  .ex1_mult_expnt             (ex1_mult_expnt            ),
  .ex2_adder_0_sel_h          (ex2_adder_0_sel_h         ),
  .ex2_expnt_2                (ex2_expnt_2               ),
  .ex2_frac_2                 (ex2_frac_2                ),
  .ex2_mac                    (ex2_mac                   ),
  .ex2_mac_expnt              (ex2_mac_expnt             ),
  .ex2_mult_expnt             (ex2_mult_expnt            ),
  .ex2_shift_data             (ex2_shift_data            ),
  .fmau_ex2_data_clk          (fmau_ex2_data_clk         )
);


// &Instance("pa_fmau_frac_add","x_pa_fmau_frac_add"); @158
pa_fmau_frac_add  x_pa_fmau_frac_add (
  .ctrl_dp_ex2_inst_pipe_down (ctrl_dp_ex2_inst_pipe_down),
  .ctrl_dp_ex3_inst_pipe_down (ctrl_dp_ex3_inst_pipe_down),
  .ctrl_xx_ex2_warm_up        (ctrl_xx_ex2_warm_up       ),
  .ctrl_xx_ex3_warm_up        (ctrl_xx_ex3_warm_up       ),
  .ex2_adder_0_sel_h          (ex2_adder_0_sel_h         ),
  .ex2_mac                    (ex2_mac                   ),
  .ex2_mac_expnt              (ex2_mac_expnt             ),
  .ex2_mult_data              (ex2_mult_data             ),
  .ex2_shift_data             (ex2_shift_data            ),
  .ex2_sub_vld                (ex2_sub_vld               ),
  .ex3_inst_rm                (ex3_inst_rm               ),
  .ex3_mac_expnt              (ex3_mac_expnt             ),
  .ex3_mult_expnt             (ex3_mult_expnt            ),
  .ex3_mult_sign              (ex3_mult_sign             ),
  .ex3_sub_vld                (ex3_sub_vld               ),
  .ex4_inst_rm                (ex4_inst_rm               ),
  .fmau_ex3_data_clk          (fmau_ex3_data_clk         ),
  .fmau_ex4_data_clk          (fmau_ex4_data_clk         ),
  .fmau_fpu_ex3_fflags        (fmau_fpu_ex3_fflags       ),
  .fmau_fpu_ex3_result        (fmau_fpu_ex3_result       ),
  .fmau_fpu_ex4_fflags        (fmau_fpu_ex4_fflags       ),
  .fmau_fpu_ex4_result        (fmau_fpu_ex4_result       )
);

//==========================================================
//                    EX2 Stage
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign fmau_ex2_data_clk_en = ctrl_dp_ex1_inst_vld || ctrl_xx_ex1_warm_up;

//  &Instance("gated_clk_cell", "x_fmau_ex2_data_gated_clk"); @167
gated_clk_cell  x_fmau_ex2_data_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (fmau_ex2_data_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (fmau_ex2_data_clk_en),
  .module_en            (cp0_fpu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

//  &Connect(.clk_in      (forever_cpuclk      ), @168
//           .external_en (1'b0                ), @169
//           .global_en   (cp0_yy_clk_en       ), @170
//           .module_en   (cp0_fpu_icg_en      ), @171
//           .local_en    (fmau_ex2_data_clk_en), @172
//           .clk_out     (fmau_ex2_data_clk   )); @173

always @(posedge fmau_ex2_data_clk)
begin
 if(ctrl_dp_ex1_inst_pipe_down || ctrl_xx_ex1_warm_up) 
 begin
    ex2_special_cmplt       <= ex1_special_cmplt;
    ex2_mac                 <= ex1_mac_update;
    ex2_mult_sign           <= ex1_mult_sign;
    ex2_src2_sign           <= ex1_src2_sign;
    ex2_src2_expnt_not_zero <= ex1_src2_expnt_not_zero;
  end
end

always @(posedge fmau_ex2_data_clk)
begin
 if(ctrl_dp_ex1_inst_pipe_down || ctrl_xx_ex1_warm_up) 
 begin
    ex2_mult_expnt[SINGLE_EXPN+1:0]   <= ex1_mult_expnt[SINGLE_EXPN+1:0];
    ex2_expnt_2[SINGLE_EXPN+1:0]      <= ex1_expnt_2[SINGLE_EXPN+1:0];
  end
end

assign ex2_sub_vld = (ex2_mult_sign ^ ex2_src2_sign) && ex2_mac;

// &CombBeg; @274
// &CombEnd; @280

assign ex2_frac_2[SINGLE_FRAC:0] = {ex2_src2_expnt_not_zero,ex2_srcf2[SINGLE_FRAC-1:0]};

//==========================================================
//                    EX3  Stage
//==========================================================
assign fmau_ex3_data_clk_en = ctrl_dp_ex2_inst_vld || ctrl_xx_ex2_warm_up;

// &Instance("gated_clk_cell", "x_fmau_ex3_data_gated_clk"); @291
gated_clk_cell  x_fmau_ex3_data_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (fmau_ex3_data_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (fmau_ex3_data_clk_en),
  .module_en            (cp0_fpu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in      (forever_cpuclk      ), @292
//          .external_en (1'b0                ), @293
//          .global_en   (cp0_yy_clk_en       ), @294
//          .module_en   (cp0_fpu_icg_en      ), @295
//          .local_en    (fmau_ex3_data_clk_en), @296
//          .clk_out     (fmau_ex3_data_clk   )); @297

always @(posedge fmau_ex3_data_clk)
begin
 if(ctrl_dp_ex2_inst_pipe_down || ctrl_xx_ex2_warm_up) 
 begin
    ex3_sub_vld        <= ex2_sub_vld;
    ex3_mac            <= ex2_mac;
    ex3_mult_sign      <= ex2_mult_sign;
  end
end

assign dp_ctrl_ex3_mac = ex3_mac;

always @(posedge fmau_ex3_data_clk)
begin
 if(ctrl_dp_ex2_inst_pipe_down || ctrl_xx_ex2_warm_up) 
 begin
    ex3_mult_expnt[SINGLE_EXPN+1:0]  <= ex2_mult_expnt[SINGLE_EXPN+1:0];
    ex3_mac_expnt[SINGLE_EXPN+1:0]   <= ex2_mac_expnt[SINGLE_EXPN+1:0];
  end
end
//==========================================================
//                    EX4  Stage
//==========================================================
assign fmau_ex4_data_clk_en = ctrl_dp_ex3_inst_vld || ctrl_xx_ex3_warm_up;

//  &Instance("gated_clk_cell", "x_fmau_ex4_data_gated_clk"); @397
gated_clk_cell  x_fmau_ex4_data_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (fmau_ex4_data_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (fmau_ex4_data_clk_en),
  .module_en            (cp0_fpu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

//  &Connect(.clk_in      (forever_cpuclk      ), @398
//           .external_en (1'b0                ), @399
//           .global_en   (cp0_yy_clk_en       ), @400
//           .module_en   (cp0_fpu_icg_en      ), @401
//           .local_en    (fmau_ex4_data_clk_en), @402
//           .clk_out     (fmau_ex4_data_clk   )); @403

// &ModuleEnd; @432
endmodule



