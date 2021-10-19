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
module pa_idu_reg(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_gpr_ld_inst,
  ifu_idu_warm_up,
  int_clr_en_x,
  pad_yy_icg_scan_en,
  reg_busy_div_x,
  reg_busy_lsu_x,
  reg_busy_x,
  reg_in_cpuclk,
  reg_sm_cpuclk,
  reg_write_en_x,
  reg_write_is_x,
  rtu_idu_ex1_int_dis_stall_req,
  rtu_idu_fgpr_wb_flsu_vld,
  rtu_idu_flush_fe,
  write_data,
  x_reg_dout
);

// &Ports; @24
input           cp0_idu_icg_en;               
input           cp0_yy_clk_en;                
input           cpurst_b;                     
input           ctrl_gpr_ld_inst;             
input           ifu_idu_warm_up;              
input           int_clr_en_x;                 
input           pad_yy_icg_scan_en;           
input           reg_in_cpuclk;                
input           reg_sm_cpuclk;                
input           reg_write_en_x;               
input           reg_write_is_x;               
input           rtu_idu_ex1_int_dis_stall_req; 
input           rtu_idu_fgpr_wb_flsu_vld;     
input           rtu_idu_flush_fe;             
input   [31:0]  write_data;                   
output          reg_busy_div_x;               
output          reg_busy_lsu_x;               
output          reg_busy_x;                   
output  [31:0]  x_reg_dout;                   

// &Regs; @25
reg     [2 :0]  reg_cur_st;                   
reg     [2 :0]  reg_nxt_st;                   
reg     [31:0]  x_reg_dout;                   

// &Wires; @26
wire            cp0_idu_icg_en;               
wire            cp0_yy_clk_en;                
wire            cpurst_b;                     
wire            ctrl_gpr_ld_inst;             
wire            ifu_idu_warm_up;              
wire            int_clr_en_x;                 
wire            pad_yy_icg_scan_en;           
wire            reg_busy_div_x;               
wire            reg_busy_lsu_x;               
wire            reg_busy_x;                   
wire            reg_clk_en;                   
wire            reg_cpuclk;                   
wire            reg_in_cpuclk;                
wire            reg_sm_cpuclk;                
wire            reg_write_en_x;               
wire            reg_write_is_x;               
wire            rtu_idu_ex1_int_dis_stall_req; 
wire            rtu_idu_fgpr_wb_flsu_vld;     
wire            rtu_idu_flush_fe;             
wire    [31:0]  write_data;                   
wire    [31:0]  write_in_data;                
wire            write_in_en;                  
wire            write_is_en;                  
wire            write_is_ld_en;               


parameter REG_WIDTH = `FLEN;

//==========================================================
//              Integated Clock Gating Cell
//==========================================================
assign reg_clk_en = write_in_en;
// &Instance("gated_clk_cell", "x_reg_gated_clk"); @34
gated_clk_cell  x_reg_gated_clk (
  .clk_in             (reg_in_cpuclk     ),
  .clk_out            (reg_cpuclk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (reg_clk_en        ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (reg_in_cpuclk), @35
//          .external_en (1'b0), @36
//          .global_en   (cp0_yy_clk_en), @37
//          .module_en ( cp0_idu_icg_en ) , @38
//          .local_en    (reg_clk_en), @39
//          .clk_out     (reg_cpuclk)); @40

//assign reg_sm_clk_en = reg_write_is_gate_x | write_in_en | rtu_idu_flush_fe;
//&Instance("gated_clk_cell", "x_reg_sm_gated_clk");
// //&Connect(.clk_in      (reg_in_cpuclk), @44
// //         .external_en (1'b0), @45
// //         .global_en   (cp0_yy_clk_en), @46
// //         .module_en ( cp0_idu_icg_en ) , @47
// //         .local_en    (reg_sm_clk_en), @48
// //         .clk_out     (reg_sm_cpuclk)); @49

//==========================================================
//                    Write Port
//==========================================================
assign write_in_en = reg_write_en_x | ifu_idu_warm_up;
assign write_is_en = reg_write_is_x & ~rtu_idu_ex1_int_dis_stall_req;
assign write_in_data[REG_WIDTH-1:0] = {REG_WIDTH{~ifu_idu_warm_up}} & write_data[REG_WIDTH-1:0];

assign write_is_ld_en  = write_is_en & ctrl_gpr_ld_inst;

// &Force("output", "x_reg_dout"); @60
always @(posedge reg_cpuclk)
begin
  if(write_in_en | ifu_idu_warm_up)
    x_reg_dout[REG_WIDTH-1:0] <= write_in_data[REG_WIDTH-1:0];
  else
    x_reg_dout[REG_WIDTH-1:0] <= x_reg_dout[REG_WIDTH-1:0];
end

parameter IDLE      = 3'b000;
parameter BUSY1     = 3'b001;
parameter BUSY_LSU1 = 3'b010;
parameter BUSY_DIV1 = 3'b110;
parameter BUSY2     = 3'b100;
parameter BUSY_LSU2 = 3'b011;
parameter BUSY_DIV2 = 3'b111;

always @(posedge reg_sm_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    reg_cur_st[2:0] <= IDLE;
  else if(rtu_idu_flush_fe)
    reg_cur_st[2:0] <= IDLE;
  else
    reg_cur_st[2:0] <= reg_nxt_st[2:0];
end

// &CombBeg; @99
always @( reg_cur_st[2:0]
       or rtu_idu_fgpr_wb_flsu_vld
       or ctrl_gpr_ld_inst
       or reg_write_en_x
       or write_is_en
       or write_is_ld_en
       or int_clr_en_x)
begin
case(reg_cur_st[2:0])
  IDLE:
  begin
    if(write_is_en)
      if(ctrl_gpr_ld_inst)
        reg_nxt_st[2:0] = BUSY_LSU1;
      else
        reg_nxt_st[2:0] = BUSY1;
    else
      reg_nxt_st[2:0] = IDLE;
  end
  BUSY1:
  begin
    if(reg_write_en_x | int_clr_en_x)
      if(write_is_en)
        if(ctrl_gpr_ld_inst)
          reg_nxt_st[2:0] = BUSY_LSU1;
        else
          reg_nxt_st[2:0] = BUSY1;
      else
        reg_nxt_st[2:0] = IDLE;
    else
      reg_nxt_st[2:0] = BUSY1;
  end
  BUSY_LSU1:
  begin
    if(reg_write_en_x & rtu_idu_fgpr_wb_flsu_vld | int_clr_en_x)
      if(write_is_en)
        if(ctrl_gpr_ld_inst)
          reg_nxt_st[2:0] = BUSY_LSU1;
        else
          reg_nxt_st[2:0] = BUSY1;
      else
        reg_nxt_st[2:0] = IDLE;
    else if(write_is_ld_en)
      reg_nxt_st[2:0] = BUSY_LSU2;
    else
      reg_nxt_st[2:0] = BUSY_LSU1;
  end
  BUSY_LSU2:
  begin
    if(reg_write_en_x | int_clr_en_x)
      if(write_is_ld_en)
        reg_nxt_st[2:0] = BUSY_LSU2;
      else
        reg_nxt_st[2:0] = BUSY_LSU1;
    else
      reg_nxt_st[2:0] = BUSY_LSU2;
  end
  default:
  begin
    reg_nxt_st[2:0] = IDLE;
  end
endcase
// &CombEnd; @154
end

assign reg_busy_x     = reg_cur_st[2:0] == BUSY1 & ~(reg_write_en_x & ~rtu_idu_fgpr_wb_flsu_vld);
assign reg_busy_lsu_x = reg_cur_st[2:0] == BUSY_LSU1
                      | reg_cur_st[2:0] == BUSY_LSU2 & ~(reg_write_en_x & rtu_idu_fgpr_wb_flsu_vld);
assign reg_busy_div_x = 1'b0;

//assign reg_fwd_en_x   = reg_cur_st[2:0] == IDLE      | reg_cur_st[2:0] == BUSY1
//                     | reg_cur_st[2:0] == BUSY_LSU1 | reg_cur_st[2:0] == BUSY_DIV1
//                     | reg_cur_st[2:0] == BUSY2;

// &ModuleEnd; @165
endmodule


