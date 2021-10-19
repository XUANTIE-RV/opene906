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
module pa_rtu_rbus(
  cp0_rtu_icg_en,
  cp0_rtu_wb_data,
  cp0_rtu_wb_preg,
  cp0_rtu_wb_vld,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  fpu_rtu_fgpr_wb_data,
  fpu_rtu_fgpr_wb_reg,
  fpu_rtu_fgpr_wb_vld,
  fpu_rtu_wb_data,
  fpu_rtu_wb_preg,
  fpu_rtu_wb_vld,
  ifu_rtu_warm_up,
  iu_rtu_wb0_data,
  iu_rtu_wb0_preg,
  iu_rtu_wb0_vld,
  lsu_rtu_fgpr_wb_data,
  lsu_rtu_fgpr_wb_reg,
  lsu_rtu_fgpr_wb_vld,
  lsu_rtu_wb_data,
  lsu_rtu_wb_preg,
  lsu_rtu_wb_vld,
  pad_yy_icg_scan_en,
  rbus_top_fpu_wb_stall,
  rbus_top_iu_wb_stall,
  rtu_cp0_fp_dirty_vld,
  rtu_fpu_fgpr_wb_grant,
  rtu_fpu_wb_grant,
  rtu_idu_fgpr_wb_data,
  rtu_idu_fgpr_wb_flsu_vld,
  rtu_idu_fgpr_wb_reg,
  rtu_idu_fgpr_wb_vld,
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
  rtu_lsu_fgpr_wb_data,
  rtu_lsu_fgpr_wb_reg,
  rtu_lsu_fgpr_wb_vld,
  rtu_lsu_wb1_data,
  rtu_lsu_wb1_lsu_vld,
  rtu_lsu_wb1_preg,
  rtu_pad_wb0_data,
  rtu_pad_wb0_preg,
  rtu_pad_wb0_vld,
  rtu_pad_wb1_data,
  rtu_pad_wb1_preg,
  rtu_pad_wb1_vld,
  rtu_pad_wb2_data,
  rtu_pad_wb2_preg,
  rtu_pad_wb2_vld,
  rtu_pad_wb_freg,
  rtu_pad_wb_freg_data,
  rtu_pad_wb_freg_vld
);

// &Ports; @24
input           cp0_rtu_icg_en;              
input   [31:0]  cp0_rtu_wb_data;             
input   [5 :0]  cp0_rtu_wb_preg;             
input           cp0_rtu_wb_vld;              
input           cp0_yy_clk_en;               
input           cpurst_b;                    
input           forever_cpuclk;              
input   [31:0]  fpu_rtu_fgpr_wb_data;        
input   [4 :0]  fpu_rtu_fgpr_wb_reg;         
input           fpu_rtu_fgpr_wb_vld;         
input   [31:0]  fpu_rtu_wb_data;             
input   [5 :0]  fpu_rtu_wb_preg;             
input           fpu_rtu_wb_vld;              
input           ifu_rtu_warm_up;             
input   [31:0]  iu_rtu_wb0_data;             
input   [5 :0]  iu_rtu_wb0_preg;             
input           iu_rtu_wb0_vld;              
input   [31:0]  lsu_rtu_fgpr_wb_data;        
input   [4 :0]  lsu_rtu_fgpr_wb_reg;         
input           lsu_rtu_fgpr_wb_vld;         
input   [31:0]  lsu_rtu_wb_data;             
input   [5 :0]  lsu_rtu_wb_preg;             
input           lsu_rtu_wb_vld;              
input           pad_yy_icg_scan_en;          
output          rbus_top_fpu_wb_stall;       
output          rbus_top_iu_wb_stall;        
output          rtu_cp0_fp_dirty_vld;        
output          rtu_fpu_fgpr_wb_grant;       
output          rtu_fpu_wb_grant;            
output  [31:0]  rtu_idu_fgpr_wb_data;        
output          rtu_idu_fgpr_wb_flsu_vld;    
output  [4 :0]  rtu_idu_fgpr_wb_reg;         
output          rtu_idu_fgpr_wb_vld;         
output  [31:0]  rtu_idu_wb0_data;            
output          rtu_idu_wb0_fpu_vld;         
output  [5 :0]  rtu_idu_wb0_preg;            
output          rtu_idu_wb0_vld;             
output  [31:0]  rtu_idu_wb1_data;            
output          rtu_idu_wb1_lsu_vld;         
output  [5 :0]  rtu_idu_wb1_preg;            
output          rtu_idu_wb1_vld;             
output  [31:0]  rtu_idu_wb2_data;            
output  [5 :0]  rtu_idu_wb2_preg;            
output          rtu_idu_wb2_vld;             
output  [31:0]  rtu_lsu_fgpr_wb_data;        
output  [4 :0]  rtu_lsu_fgpr_wb_reg;         
output          rtu_lsu_fgpr_wb_vld;         
output  [31:0]  rtu_lsu_wb1_data;            
output          rtu_lsu_wb1_lsu_vld;         
output  [5 :0]  rtu_lsu_wb1_preg;            
output  [31:0]  rtu_pad_wb0_data;            
output  [5 :0]  rtu_pad_wb0_preg;            
output          rtu_pad_wb0_vld;             
output  [31:0]  rtu_pad_wb1_data;            
output  [5 :0]  rtu_pad_wb1_preg;            
output          rtu_pad_wb1_vld;             
output  [31:0]  rtu_pad_wb2_data;            
output  [5 :0]  rtu_pad_wb2_preg;            
output          rtu_pad_wb2_vld;             
output  [4 :0]  rtu_pad_wb_freg;             
output  [31:0]  rtu_pad_wb_freg_data;        
output          rtu_pad_wb_freg_vld;         

// &Regs; @25
reg     [31:0]  rbus_wb_fgpr_flop_data;      
reg     [4 :0]  rbus_wb_fgpr_flop_reg;       
reg             rbus_wb_fgpr_flop_vld;       
reg     [31:0]  rbus_wb_wb0_data;            
reg             rbus_wb_wb0_fpu_vld;         
reg     [5 :0]  rbus_wb_wb0_preg;            
reg             rbus_wb_wb0_vld;             

// &Wires; @26
wire            cp0_rtu_icg_en;              
wire    [31:0]  cp0_rtu_wb_data;             
wire    [5 :0]  cp0_rtu_wb_preg;             
wire            cp0_rtu_wb_vld;              
wire            cp0_yy_clk_en;               
wire            cpurst_b;                    
wire            fgpr_wb_clk;                 
wire            fgpr_wb_clk_en;              
wire            forever_cpuclk;              
wire    [31:0]  fpu_rtu_fgpr_wb_data;        
wire    [4 :0]  fpu_rtu_fgpr_wb_reg;         
wire            fpu_rtu_fgpr_wb_vld;         
wire    [31:0]  fpu_rtu_wb_data;             
wire    [5 :0]  fpu_rtu_wb_preg;             
wire            fpu_rtu_wb_vld;              
wire            ifu_rtu_warm_up;             
wire    [31:0]  iu_rtu_wb0_data;             
wire    [5 :0]  iu_rtu_wb0_preg;             
wire            iu_rtu_wb0_vld;              
wire    [31:0]  lsu_rtu_fgpr_wb_data;        
wire    [4 :0]  lsu_rtu_fgpr_wb_reg;         
wire            lsu_rtu_fgpr_wb_vld;         
wire    [31:0]  lsu_rtu_wb_data;             
wire    [5 :0]  lsu_rtu_wb_preg;             
wire            lsu_rtu_wb_vld;              
wire            pad_yy_icg_scan_en;          
wire            rbus_cp0_wb_vld;             
wire    [31:0]  rbus_fgpr_wb_data;           
wire    [4 :0]  rbus_fgpr_wb_reg;            
wire            rbus_fgpr_wb_vld;            
wire            rbus_fpu_wb_grant;           
wire            rbus_fpu_wb_vld;             
wire            rbus_iu_wb0_vld;             
wire            rbus_lsu_wb_vld;             
wire            rbus_top_fpu_wb_stall;       
wire            rbus_top_iu_wb_stall;        
wire    [31:0]  rbus_wb0_data;               
wire    [5 :0]  rbus_wb0_preg;               
wire            rbus_wb0_vld;                
wire    [31:0]  rbus_wb_fgpr_wb_data;        
wire    [4 :0]  rbus_wb_fgpr_wb_reg;         
wire            rbus_wb_fgpr_wb_stall;       
wire            rbus_wb_fgpr_wb_vld;         
wire    [31:0]  rbus_wb_wb0_with_fpu_data;   
wire            rbus_wb_wb0_with_fpu_fpu_vld; 
wire    [5 :0]  rbus_wb_wb0_with_fpu_preg;   
wire            rbus_wb_wb0_with_fpu_vld;    
wire    [31:0]  rbus_wb_wb1_data;            
wire    [5 :0]  rbus_wb_wb1_preg;            
wire            rbus_wb_wb1_vld;             
wire            rtu_cp0_fp_dirty_vld;        
wire            rtu_fpu_fgpr_wb_grant;       
wire            rtu_fpu_wb_grant;            
wire    [31:0]  rtu_idu_fgpr_wb_data;        
wire            rtu_idu_fgpr_wb_flsu_vld;    
wire    [4 :0]  rtu_idu_fgpr_wb_reg;         
wire            rtu_idu_fgpr_wb_vld;         
wire    [31:0]  rtu_idu_wb0_data;            
wire            rtu_idu_wb0_fpu_vld;         
wire    [5 :0]  rtu_idu_wb0_preg;            
wire            rtu_idu_wb0_vld;             
wire    [31:0]  rtu_idu_wb1_data;            
wire            rtu_idu_wb1_lsu_vld;         
wire    [5 :0]  rtu_idu_wb1_preg;            
wire            rtu_idu_wb1_vld;             
wire    [31:0]  rtu_idu_wb2_data;            
wire    [5 :0]  rtu_idu_wb2_preg;            
wire            rtu_idu_wb2_vld;             
wire    [31:0]  rtu_lsu_fgpr_wb_data;        
wire    [4 :0]  rtu_lsu_fgpr_wb_reg;         
wire            rtu_lsu_fgpr_wb_vld;         
wire    [31:0]  rtu_lsu_wb1_data;            
wire            rtu_lsu_wb1_lsu_vld;         
wire    [5 :0]  rtu_lsu_wb1_preg;            
wire    [31:0]  rtu_pad_wb0_data;            
wire    [5 :0]  rtu_pad_wb0_preg;            
wire            rtu_pad_wb0_vld;             
wire    [31:0]  rtu_pad_wb1_data;            
wire    [5 :0]  rtu_pad_wb1_preg;            
wire            rtu_pad_wb1_vld;             
wire    [31:0]  rtu_pad_wb2_data;            
wire    [5 :0]  rtu_pad_wb2_preg;            
wire            rtu_pad_wb2_vld;             
wire    [4 :0]  rtu_pad_wb_freg;             
wire    [31:0]  rtu_pad_wb_freg_data;        
wire            rtu_pad_wb_freg_vld;         
wire            wb0_clk;                     
wire            wb0_clk_en;                  


//==========================================================
//                    Write Back Source
//==========================================================
//----------------------------------------------------------
//                      Priority
//----------------------------------------------------------
//Write Port Priority:
//IU > FPU
//FPU share rbus WB stage wb0
assign rbus_fpu_wb_grant     = !rbus_wb_wb0_vld;

assign rtu_fpu_wb_grant      = rbus_fpu_wb_grant;

assign rbus_top_iu_wb_stall  = 1'b0;
assign rbus_top_fpu_wb_stall = !rbus_fpu_wb_grant;

//----------------------------------------------------------
//                   wb control signals
//----------------------------------------------------------
assign rbus_iu_wb0_vld = iu_rtu_wb0_vld;
assign rbus_lsu_wb_vld = lsu_rtu_wb_vld;
assign rbus_fpu_wb_vld = fpu_rtu_wb_vld && rbus_fpu_wb_grant;
assign rbus_cp0_wb_vld = cp0_rtu_wb_vld;

//==========================================================
//                  Integer Write Back 0
//==========================================================

//----------------------------------------------------------
//                      Result MUX
//----------------------------------------------------------
assign rbus_wb0_vld =
          rbus_iu_wb0_vld
       || rbus_cp0_wb_vld;

assign rbus_wb0_preg[5:0]  = 
    {6{rbus_iu_wb0_vld}} & iu_rtu_wb0_preg[5:0]
  | {6{rbus_cp0_wb_vld}} & cp0_rtu_wb_preg[5:0];

assign rbus_wb0_data[31:0]  = 
    {32{rbus_iu_wb0_vld}} & iu_rtu_wb0_data[31:0]
  | {32{rbus_cp0_wb_vld}} & cp0_rtu_wb_data[31:0];


//----------------------------------------------------------
//                  Write Back Register
//----------------------------------------------------------
assign wb0_clk_en = ifu_rtu_warm_up
                    || rbus_wb0_vld
                    || rbus_wb_wb0_vld;
// &Instance("gated_clk_cell", "x_wb0_clk"); @120
gated_clk_cell  x_wb0_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wb0_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (wb0_clk_en        ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @121
//          .external_en (1'b0), @122
//          .global_en   (cp0_yy_clk_en), @123
//          .module_en   (cp0_rtu_icg_en), @124
//          .local_en    (wb0_clk_en), @125
//          .clk_out     (wb0_clk)); @126

always @ (posedge wb0_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    rbus_wb_wb0_vld        <= 1'b0;
  else if(rbus_wb0_vld)
    rbus_wb_wb0_vld        <= 1'b1;
  else
    rbus_wb_wb0_vld        <= 1'b0;
end

always @ (posedge wb0_clk)
begin
  if(ifu_rtu_warm_up || rbus_wb0_vld) begin
    rbus_wb_wb0_preg[5:0]  <= rbus_wb0_preg[5:0];
    rbus_wb_wb0_data[31:0] <= rbus_wb0_data[31:0];
    rbus_wb_wb0_fpu_vld    <= rbus_fpu_wb_vld;
  end
  else begin
    rbus_wb_wb0_preg[5:0]  <= rbus_wb_wb0_preg[5:0];
    rbus_wb_wb0_data[31:0] <= rbus_wb_wb0_data[31:0];
    rbus_wb_wb0_fpu_vld    <= rbus_wb_wb0_fpu_vld;
  end
end

//----------------------------------------------------------
//                     Write Back MUX
//----------------------------------------------------------
assign rbus_wb_wb0_with_fpu_vld =
       rbus_wb_wb0_vld || rbus_fpu_wb_vld;

assign rbus_wb_wb0_with_fpu_preg[5:0]  = 
    {6{rbus_wb_wb0_vld}} & rbus_wb_wb0_preg[5:0]
  | {6{rbus_fpu_wb_vld}} & fpu_rtu_wb_preg[5:0];

assign rbus_wb_wb0_with_fpu_data[31:0]  = 
    {32{rbus_wb_wb0_vld}} & rbus_wb_wb0_data[31:0]
  | {32{rbus_fpu_wb_vld}} & fpu_rtu_wb_data[31:0];

assign rbus_wb_wb0_with_fpu_fpu_vld =
       rbus_fpu_wb_vld;

//for idu
assign rtu_idu_wb0_vld        = rbus_wb_wb0_with_fpu_vld;
assign rtu_idu_wb0_preg[5:0]  = rbus_wb_wb0_with_fpu_preg[5:0];
assign rtu_idu_wb0_data[31:0] = rbus_wb_wb0_with_fpu_data[31:0];
assign rtu_idu_wb0_fpu_vld    = rbus_wb_wb0_with_fpu_fpu_vld;

//for pad
assign rtu_pad_wb0_vld        = rbus_wb_wb0_with_fpu_vld;
assign rtu_pad_wb0_preg[5:0]  = rbus_wb_wb0_with_fpu_preg[5:0];
assign rtu_pad_wb0_data[31:0] = rbus_wb_wb0_with_fpu_data[31:0];

//==========================================================
//                  Integer Write Back 1
//==========================================================
// &Instance("gated_clk_cell", "x_wb1_clk"); @225
// &Connect(.clk_in      (forever_cpuclk), @226
//          .external_en (1'b0), @227
//          .global_en   (cp0_yy_clk_en), @228
//          .module_en   (cp0_rtu_icg_en), @229
//          .local_en    (wb1_clk_en), @230
//          .clk_out     (wb1_clk)); @231
//----------------------------------------------------------
//                      Result MUX
//----------------------------------------------------------
assign rbus_wb_wb1_vld        = rbus_lsu_wb_vld;
assign rbus_wb_wb1_preg[5:0]  = lsu_rtu_wb_preg[5:0];
assign rbus_wb_wb1_data[31:0] = lsu_rtu_wb_data[31:0];

//----------------------------------------------------------
//                     Write Back MUX
//----------------------------------------------------------
//for idu
assign rtu_idu_wb1_vld        = rbus_wb_wb1_vld;
assign rtu_idu_wb1_preg[5:0]  = rbus_wb_wb1_preg[5:0];
assign rtu_idu_wb1_data[31:0] = rbus_wb_wb1_data[31:0];
assign rtu_idu_wb1_lsu_vld    = 1'b1;

//for lsu
assign rtu_lsu_wb1_lsu_vld    = rbus_wb_wb1_vld;
assign rtu_lsu_wb1_preg[5:0]  = rbus_wb_wb1_preg[5:0];
assign rtu_lsu_wb1_data[31:0] = rbus_wb_wb1_data[31:0];

//for pad
assign rtu_pad_wb1_vld        = rbus_wb_wb1_vld;
assign rtu_pad_wb1_preg[5:0]  = rbus_wb_wb1_preg[5:0];
assign rtu_pad_wb1_data[31:0] = rbus_wb_wb1_data[31:0];

// &Instance("gated_clk_cell", "x_wb2_clk"); @327
// &Connect(.clk_in      (forever_cpuclk), @328
//          .external_en (1'b0), @329
//          .global_en   (cp0_yy_clk_en), @330
//          .module_en   (cp0_rtu_icg_en), @331
//          .local_en    (wb2_clk_en), @332
//          .clk_out     (wb2_clk)); @333
//for idu
assign rtu_idu_wb2_vld        = 1'b0;
assign rtu_idu_wb2_preg[5:0]  = 6'b0;
assign rtu_idu_wb2_data[31:0] = 32'b0;

//for pad
assign rtu_pad_wb2_vld        = 1'b0;
assign rtu_pad_wb2_preg[5:0]  = 6'b0;
assign rtu_pad_wb2_data[31:0] = 32'b0;

//==========================================================
//                     FP Write Back
//==========================================================
//----------------------------------------------------------
//                       Priority
//----------------------------------------------------------
//fgpr wb priority: lsu > fpu
assign rtu_fpu_fgpr_wb_grant = !rbus_wb_fgpr_wb_stall;

//----------------------------------------------------------
//                      Result MUX
//----------------------------------------------------------
assign rbus_fgpr_wb_vld             = fpu_rtu_fgpr_wb_vld;
assign rbus_fgpr_wb_reg[4:0]        = fpu_rtu_fgpr_wb_reg[4:0];
assign rbus_fgpr_wb_data[`FLEN-1:0] = fpu_rtu_fgpr_wb_data[`FLEN-1:0];

//----------------------------------------------------------
//                  Write Back Register
//----------------------------------------------------------
assign fgpr_wb_clk_en = ifu_rtu_warm_up
                        || rbus_fgpr_wb_vld
                        || rbus_wb_fgpr_flop_vld;
// &Instance("gated_clk_cell", "x_fgpr_wb_clk"); @423
gated_clk_cell  x_fgpr_wb_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (fgpr_wb_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (fgpr_wb_clk_en    ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @424
//          .external_en (1'b0), @425
//          .global_en   (cp0_yy_clk_en), @426
//          .module_en   (cp0_rtu_icg_en), @427
//          .local_en    (fgpr_wb_clk_en), @428
//          .clk_out     (fgpr_wb_clk)); @429

always @ (posedge fgpr_wb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    rbus_wb_fgpr_flop_vld             <= 1'b0;
  else if(!rbus_wb_fgpr_wb_stall)
    rbus_wb_fgpr_flop_vld             <= rbus_fgpr_wb_vld;
  else
    rbus_wb_fgpr_flop_vld             <= rbus_wb_fgpr_flop_vld;
end

always @ (posedge fgpr_wb_clk)
begin
  if(ifu_rtu_warm_up || rbus_fgpr_wb_vld && !rbus_wb_fgpr_wb_stall) begin
    rbus_wb_fgpr_flop_reg[4:0]        <= rbus_fgpr_wb_reg[4:0];
    rbus_wb_fgpr_flop_data[`FLEN-1:0] <= rbus_fgpr_wb_data[`FLEN-1:0];
  end
  else begin
    rbus_wb_fgpr_flop_reg[4:0]        <= rbus_wb_fgpr_flop_reg[4:0];
    rbus_wb_fgpr_flop_data[`FLEN-1:0] <= rbus_wb_fgpr_flop_data[`FLEN-1:0];
  end
end

//----------------------------------------------------------
//                      Result MUX
//----------------------------------------------------------
assign rbus_wb_fgpr_wb_vld             = rbus_wb_fgpr_flop_vld
                                      || lsu_rtu_fgpr_wb_vld;

assign rbus_wb_fgpr_wb_reg[4:0]        = lsu_rtu_fgpr_wb_vld
                                         ? lsu_rtu_fgpr_wb_reg[4:0]
                                         : rbus_wb_fgpr_flop_reg[4:0];

assign rbus_wb_fgpr_wb_data[`FLEN-1:0] = lsu_rtu_fgpr_wb_vld
                                         ? lsu_rtu_fgpr_wb_data[`FLEN-1:0]
                                         : rbus_wb_fgpr_flop_data[`FLEN-1:0];

assign rbus_wb_fgpr_wb_stall           = rbus_wb_fgpr_flop_vld
                                         && lsu_rtu_fgpr_wb_vld;

//----------------------------------------------------------
//                         Output
//----------------------------------------------------------
//for idu
assign rtu_idu_fgpr_wb_vld             = rbus_wb_fgpr_wb_vld;
assign rtu_idu_fgpr_wb_reg[4:0]        = rbus_wb_fgpr_wb_reg[4:0];
assign rtu_idu_fgpr_wb_data[`FLEN-1:0] = rbus_wb_fgpr_wb_data[`FLEN-1:0];
assign rtu_idu_fgpr_wb_flsu_vld        = lsu_rtu_fgpr_wb_vld;
//for lsu
assign rtu_lsu_fgpr_wb_vld             = rbus_wb_fgpr_wb_vld;
assign rtu_lsu_fgpr_wb_reg[4:0]        = rbus_wb_fgpr_wb_reg[4:0];
assign rtu_lsu_fgpr_wb_data[`FLEN-1:0] = rbus_wb_fgpr_wb_data[`FLEN-1:0];
//for pad
assign rtu_pad_wb_freg_vld             = rbus_wb_fgpr_wb_vld;
assign rtu_pad_wb_freg[4:0]            = rbus_wb_fgpr_wb_reg[4:0];
assign rtu_pad_wb_freg_data[`FLEN-1:0] = rbus_wb_fgpr_wb_data[`FLEN-1:0];
//for cp0
assign rtu_cp0_fp_dirty_vld            = rbus_wb_fgpr_wb_vld;
// &Force("nonport","rtu_fpu_wb_grant") @510
// &Force("nonport","rtu_idu_wb0_fpu_vld") @511

// &ModuleEnd; @514
endmodule


