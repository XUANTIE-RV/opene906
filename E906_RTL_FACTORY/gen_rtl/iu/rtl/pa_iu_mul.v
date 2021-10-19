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
module pa_iu_mul(
  cp0_iu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_xx_ex1_stall,
  dp_xx_ex2_stall,
  forever_cpuclk,
  idu_iu_ex1_func,
  idu_iu_ex1_gateclk_vld,
  idu_iu_ex1_inst_vld,
  idu_iu_ex1_mul_cmplt_dp_sel,
  idu_iu_ex1_mul_gateclk_sel,
  idu_iu_ex1_mul_high_sel,
  idu_iu_ex1_mul_sel,
  idu_iu_ex1_src0,
  idu_iu_ex1_src1,
  idu_iu_ex1_src2,
  ifu_iu_warm_up,
  mul_dp_ex1_cmplt,
  mul_dp_ex1_cmplt_dp,
  mul_dp_ex2_inst_vld,
  mul_dp_ex2_rslt0,
  mul_dp_ex2_rslt0_vld,
  pad_yy_icg_scan_en
);

// &Ports; @24
input           cp0_iu_icg_en;              
input           cp0_yy_clk_en;              
input           cpurst_b;                   
input           dp_xx_ex1_stall;            
input           dp_xx_ex2_stall;            
input           forever_cpuclk;             
input   [19:0]  idu_iu_ex1_func;            
input           idu_iu_ex1_gateclk_vld;     
input           idu_iu_ex1_inst_vld;        
input           idu_iu_ex1_mul_cmplt_dp_sel; 
input           idu_iu_ex1_mul_gateclk_sel; 
input           idu_iu_ex1_mul_high_sel;    
input           idu_iu_ex1_mul_sel;         
input   [31:0]  idu_iu_ex1_src0;            
input   [31:0]  idu_iu_ex1_src1;            
input   [31:0]  idu_iu_ex1_src2;            
input           ifu_iu_warm_up;             
input           pad_yy_icg_scan_en;         
output          mul_dp_ex1_cmplt;           
output          mul_dp_ex1_cmplt_dp;        
output          mul_dp_ex2_inst_vld;        
output  [31:0]  mul_dp_ex2_rslt0;           
output          mul_dp_ex2_rslt0_vld;       

// &Regs; @25
reg             mul_ex2_inst_vld;           
reg             mul_ex2_result_low;         
reg     [67:0]  mul_ex2_wb_res_0;           
reg     [67:0]  mul_ex2_wb_res_1;           

// &Wires; @26
wire            cp0_iu_icg_en;              
wire            cp0_yy_clk_en;              
wire            cpurst_b;                   
wire            dp_xx_ex1_stall;            
wire            dp_xx_ex2_stall;            
wire            forever_cpuclk;             
wire    [19:0]  idu_iu_ex1_func;            
wire            idu_iu_ex1_gateclk_vld;     
wire            idu_iu_ex1_inst_vld;        
wire            idu_iu_ex1_mul_cmplt_dp_sel; 
wire            idu_iu_ex1_mul_gateclk_sel; 
wire            idu_iu_ex1_mul_sel;         
wire    [31:0]  idu_iu_ex1_src0;            
wire    [31:0]  idu_iu_ex1_src1;            
wire            ifu_iu_warm_up;             
wire            mul_clk;                    
wire            mul_clk_en;                 
wire            mul_dp_ex1_cmplt;           
wire            mul_dp_ex1_cmplt_dp;        
wire            mul_dp_ex2_inst_vld;        
wire    [31:0]  mul_dp_ex2_rslt0;           
wire            mul_dp_ex2_rslt0_vld;       
wire            mul_ex1_ctrl_clk;           
wire            mul_ex1_ctrl_clk_en;        
wire            mul_ex1_gateclk_inst_vld;   
wire            mul_ex1_inst_vld;           
wire            mul_ex1_wb_pipe_down;       
wire            mul_gateclk_sel;            
wire            mul_high_clk;               
wire            mul_high_clk_en;            
wire            mul_inst_mul;               
wire    [31:0]  mul_res;                    
wire    [67:0]  mul_res_raw;                
wire    [32:0]  mul_rs1;                    
wire    [16:0]  mul_rs1_high;               
wire    [15:0]  mul_rs1_low;                
wire            mul_rs1_signed;             
wire    [32:0]  mul_rs1_tmp0;               
wire    [32:0]  mul_rs2;                    
wire    [16:0]  mul_rs2_high;               
wire    [15:0]  mul_rs2_low;                
wire            mul_rs2_signed;             
wire            mul_sel;                    
wire    [31:0]  mult_round;                 
wire            mult_sub;                   
wire    [32:0]  multiplicand;               
wire    [32:0]  multiplier;                 
wire            pad_yy_icg_scan_en;         
wire    [68:0]  result_0;                   
wire    [68:0]  result_1;                   


assign mul_sel           = idu_iu_ex1_mul_sel;
assign mul_gateclk_sel   = idu_iu_ex1_mul_gateclk_sel;
// &Force("bus", "idu_iu_ex1_func", 19, 0); @30
// &Force("bus", "idu_iu_ex1_src0", 31, 0); @31
// &Force("bus", "idu_iu_ex1_src1", 31, 0); @32
assign mul_inst_mul     = idu_iu_ex1_func[2];

assign mul_rs1_signed = idu_iu_ex1_func[0];
assign mul_rs2_signed = idu_iu_ex1_func[1];

// &Force("input", "idu_iu_ex1_mul_high_sel"); @54
// &Force("input", "idu_iu_ex1_src2"); &Force("bus", "idu_iu_ex1_src2", 31, 0); @55
assign mul_rs1_high[16:0] = {(mul_rs1_signed && idu_iu_ex1_src0[31]), idu_iu_ex1_src0[31:16]} & {17{mul_gateclk_sel}};
assign mul_rs2_high[16:0] = {(mul_rs2_signed && idu_iu_ex1_src1[31]), idu_iu_ex1_src1[31:16]} & {17{mul_gateclk_sel}};
assign mul_rs1_low[15:0]  = idu_iu_ex1_src0[15:0] & {16{mul_gateclk_sel}};
assign mul_rs2_low[15:0]  = idu_iu_ex1_src1[15:0] & {16{mul_gateclk_sel}};



assign mul_rs1_tmp0[32:0] = {mul_rs1_high[16:0], mul_rs1_low[15:0]};
assign mul_rs2[32:0]      = {mul_rs2_high[16:0], mul_rs2_low[15:0]};

assign mul_rs1[32:0] = mul_rs1_tmp0[32:0];

assign multiplicand[32:0] = mul_rs1[32:0];
assign multiplier[32:0]   = mul_rs2[32:0];

//==========================================================
//                   32x32 Multiplication
//==========================================================
//----------------------------------------------------------
//                        1st Cycle
//----------------------------------------------------------
// 1st cycle use DW partical multiplication to get two result.

// &Force("nonport", "multiplicand"); @88
// &Force("nonport", "multiplier"); @89
// &Force("nonport", "result_0"); @90
// &Force("nonport", "result_1"); @91
// &Instance("multiplier_33x33_partial"); @93
multiplier_33x33_partial  x_multiplier_33x33_partial (
  .mult_round   (mult_round  ),
  .mult_sub     (mult_sub    ),
  .multiplicand (multiplicand),
  .multiplier   (multiplier  ),
  .result_0     (result_0    ),
  .result_1     (result_1    )
);

assign mult_round[31:0] = 32'd0;
assign mult_sub         = 1'b0;
// &Force("bus", "result_0", 68, 0); @96
// &Force("bus", "result_1", 68, 0); @97


//----------------------------------------------------------
//                        2nd Cycle
//----------------------------------------------------------
assign mul_ex1_gateclk_inst_vld = (idu_iu_ex1_mul_gateclk_sel & idu_iu_ex1_gateclk_vld); 
assign mul_ex1_inst_vld         = (idu_iu_ex1_mul_sel & idu_iu_ex1_inst_vld); 
assign mul_ex1_ctrl_clk_en      =  mul_ex1_gateclk_inst_vld | mul_ex2_inst_vld;

// &Instance("gated_clk_cell", "x_mul_ex1_ctrl_gated_clk"); @116
gated_clk_cell  x_mul_ex1_ctrl_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (mul_ex1_ctrl_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (mul_ex1_ctrl_clk_en),
  .module_en           (cp0_iu_icg_en      ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @117
//          .external_en (1'b0), @118
//          .global_en   (cp0_yy_clk_en), @119
//          .module_en   (cp0_iu_icg_en), @120
//          .local_en    (mul_ex1_ctrl_clk_en), @121
//          .clk_out     (mul_ex1_ctrl_clk)); @122

always@(posedge mul_ex1_ctrl_clk or negedge cpurst_b)
begin
    if(~cpurst_b) 
    begin
        mul_ex2_inst_vld <= 1'b0;
    end
    else if(mul_ex1_inst_vld)
    begin
        mul_ex2_inst_vld <= 1'b1;
    end
    else
    begin
        mul_ex2_inst_vld <= 1'b0;
    end
end
// 2nd cycle add two result generated in 1st cycle, and get final result.
assign mul_ex1_wb_pipe_down = !dp_xx_ex2_stall;

always @ (posedge mul_clk)
begin
  if (mul_gateclk_sel && mul_ex1_wb_pipe_down || ifu_iu_warm_up) begin
    //mul_ex2_wb_preg_4_0[4:0] <= idu_iu_ex1_dst_preg[4:0];
    mul_ex2_wb_res_0[31:0]   <= result_0[31:0];
    mul_ex2_wb_res_1[31:0]   <= result_1[31:0];
    mul_ex2_result_low       <= mul_inst_mul;
  end
end
// &Force("bus", "idu_iu_ex1_dst_preg", 5, 0); @177

// if result is low 32-bits, high 32-bits will not changed.
always @ (posedge mul_high_clk)
begin
  if (mul_gateclk_sel && mul_ex1_wb_pipe_down && !mul_inst_mul || ifu_iu_warm_up) begin
    mul_ex2_wb_res_0[67:32]   <= result_0[67:32];
    mul_ex2_wb_res_1[67:32]   <= result_1[67:32];
  end
end

assign mul_res_raw[67:0] = mul_ex2_wb_res_0[67:0] + mul_ex2_wb_res_1[67:0];

//---------- Select High / Low -----------
assign mul_res[31:0] = {32{ mul_ex2_result_low}} & mul_res_raw[31:0]
                     | {32{!mul_ex2_result_low}} & mul_res_raw[63:32];

//==========================================================
//                      Gate Clk Cell
//==========================================================
assign mul_clk_en = mul_gateclk_sel
                 || ifu_iu_warm_up;
// &Instance("gated_clk_cell", "x_mul_clk"); @217
gated_clk_cell  x_mul_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (mul_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (mul_clk_en        ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @218
//          .external_en (1'b0), @219
//          .global_en   (cp0_yy_clk_en), @220
//          .module_en   (cp0_iu_icg_en), @221
//          .local_en    (mul_clk_en), @222
//          .clk_out     (mul_clk)); @223

assign mul_high_clk_en = mul_gateclk_sel && !mul_inst_mul
                      || ifu_iu_warm_up;
// &Instance("gated_clk_cell", "x_mul_high_clk"); @227
gated_clk_cell  x_mul_high_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (mul_high_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (mul_high_clk_en   ),
  .module_en          (cp0_iu_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @228
//          .external_en (1'b0), @229
//          .global_en   (cp0_yy_clk_en), @230
//          .module_en   (cp0_iu_icg_en), @231
//          .local_en    (mul_high_clk_en), @232
//          .clk_out     (mul_high_clk)); @233

//==========================================================
//                   Output for IU ctrl
//==========================================================
assign mul_dp_ex1_cmplt         = idu_iu_ex1_inst_vld && mul_sel && (~dp_xx_ex1_stall);
assign mul_dp_ex1_cmplt_dp      = idu_iu_ex1_mul_cmplt_dp_sel;
assign mul_dp_ex2_rslt0[31:0]   = mul_res[31:0];
assign mul_dp_ex2_rslt0_vld     = mul_ex2_inst_vld;
assign mul_dp_ex2_inst_vld      = mul_ex2_inst_vld;
// &ModuleEnd; @243
endmodule


