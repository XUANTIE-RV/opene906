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
module pa_idu_reg32_high(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_gpr_div_inst,
  ctrl_gpr_ld_inst,
  forever_cpuclk,
  ifu_idu_warm_up,
  pad_yy_icg_scan_en,
  reg_busy_st_y,
  reg_dout_y,
  reg_fwd_en0_x,
  reg_fwd_en1_x,
  reg_fwd_en2_x,
  reg_high_cpuclk,
  reg_write_en0_x,
  reg_write_en1_x,
  reg_write_en2_x,
  reg_write_is0_x,
  rtu_idu_ex1_int_dis_stall_req,
  rtu_idu_flush_fe,
  write_data0,
  write_data1,
  write_data2
);

// &Ports; @24
input           cp0_idu_icg_en;               
input           cp0_yy_clk_en;                
input           cpurst_b;                     
input           ctrl_gpr_div_inst;            
input           ctrl_gpr_ld_inst;             
input           forever_cpuclk;               
input           ifu_idu_warm_up;              
input           pad_yy_icg_scan_en;           
input           reg_fwd_en0_x;                
input           reg_fwd_en1_x;                
input           reg_fwd_en2_x;                
input           reg_high_cpuclk;              
input           reg_write_en0_x;              
input           reg_write_en1_x;              
input           reg_write_en2_x;              
input           reg_write_is0_x;              
input           rtu_idu_ex1_int_dis_stall_req; 
input           rtu_idu_flush_fe;             
input   [31:0]  write_data0;                  
input   [31:0]  write_data1;                  
input   [31:0]  write_data2;                  
output  [2 :0]  reg_busy_st_y;                
output  [31:0]  reg_dout_y;                   

// &Regs; @25
reg     [2 :0]  reg_cur_st;                   
reg     [31:0]  reg_dout;                     
reg     [2 :0]  reg_nxt_st;                   

// &Wires; @26
wire            cp0_idu_icg_en;               
wire            cp0_yy_clk_en;                
wire            cpurst_b;                     
wire            ctrl_gpr_div_inst;            
wire            ctrl_gpr_ld_inst;             
wire            forever_cpuclk;               
wire            ifu_idu_warm_up;              
wire            pad_yy_icg_scan_en;           
wire    [2 :0]  reg_busy_st_y;                
wire            reg_clk_en;                   
wire            reg_cpuclk;                   
wire    [31:0]  reg_dout_y;                   
wire            reg_fwd_en0_x;                
wire            reg_fwd_en1_x;                
wire            reg_fwd_en2_x;                
wire            reg_high_cpuclk;              
wire            reg_write_en0_x;              
wire            reg_write_en1_x;              
wire            reg_write_en2_x;              
wire            reg_write_is0_x;              
wire            rtu_idu_ex1_int_dis_stall_req; 
wire            rtu_idu_flush_fe;             
wire    [31:0]  write_data0;                  
wire    [31:0]  write_data1;                  
wire    [31:0]  write_data2;                  
wire    [31:0]  write_in_data;                
wire            write_in_en;                  
wire            write_is_div_en;              
wire            write_is_en;                  
wire            write_is_ld_en;               


//==========================================================
//              Integated Clock Gating Cell
//==========================================================
assign reg_clk_en = reg_write_en0_x | reg_write_en1_x | reg_write_en2_x | ifu_idu_warm_up;
// &Instance("gated_clk_cell", "x_reg_gated_clk"); @32
gated_clk_cell  x_reg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (reg_cpuclk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (reg_clk_en        ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @33
//          .external_en (1'b0), @34
//          .global_en   (cp0_yy_clk_en), @35
//          .module_en ( cp0_idu_icg_en ) , @36
//          .local_en    (reg_clk_en), @37
//          .clk_out     (reg_cpuclk)); @38

//assign reg_sm_clk_en = reg_write_is_gate0_x | reg_write_is_gate1_x
//                    | write_in_en | rtu_idu_flush_fe;
//&Instance("gated_clk_cell", "x_reg_sm_gated_clk");
// //&Connect(.clk_in      (forever_cpuclk), @43
// //         .external_en (1'b0), @44
// //         .global_en   (cp0_yy_clk_en), @45
// //         .module_en ( cp0_idu_icg_en ) , @46
// //         .local_en    (reg_sm_clk_en), @47
// //         .clk_out     (reg_sm_cpuclk)); @48

//==========================================================
//                    Write Port
//==========================================================
assign write_in_en = reg_fwd_en0_x | reg_fwd_en1_x | reg_fwd_en2_x | ifu_idu_warm_up;
assign write_is_en = reg_write_is0_x; // | reg_write_is1_x;
assign write_in_data[31:0] = reg_write_en1_x ? write_data1[31:0]
                           : reg_write_en2_x ? write_data2[31:0]
                           : reg_write_en0_x | ifu_idu_warm_up ? write_data0[31:0]
                           : reg_dout[31:0];

assign write_is_ld_en  = write_is_en & ctrl_gpr_ld_inst & ~rtu_idu_ex1_int_dis_stall_req;
assign write_is_div_en = write_is_en & ctrl_gpr_div_inst & ~rtu_idu_ex1_int_dis_stall_req;

always @(posedge reg_cpuclk)
begin
  reg_dout[31:0] <= write_in_data[31:0];
end

parameter IDLE      = 3'b000;
parameter BUSY1     = 3'b001;
parameter BUSY_LSU1 = 3'b010;
parameter BUSY_DIV1 = 3'b011;
parameter BUSY2     = 3'b100;
parameter BUSY_LSU2 = 3'b110;
parameter BUSY_DIV2 = 3'b111;

always @(posedge reg_high_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    reg_cur_st[2:0] <= IDLE;
  else if(rtu_idu_flush_fe)
    reg_cur_st[2:0] <= IDLE;
  else
    reg_cur_st[2:0] <= reg_nxt_st[2:0];
end

// &CombBeg; @96
always @( reg_cur_st[2:0]
       or reg_fwd_en2_x
       or write_is_en
       or write_is_div_en
       or write_in_en
       or reg_fwd_en1_x
       or reg_fwd_en0_x
       or write_is_ld_en)
begin
case(reg_cur_st[2:0])
  IDLE:
  begin
    if(write_is_en)
      if(write_is_ld_en)
        reg_nxt_st[2:0] = BUSY_LSU1;
      else if(write_is_div_en)
        reg_nxt_st[2:0] = BUSY_DIV1;
      else
        reg_nxt_st[2:0] = IDLE;
    else
      reg_nxt_st[2:0] = IDLE;
  end
  BUSY1:
  begin
    if(write_in_en)
      if(write_is_en)
        if(write_is_ld_en)
          reg_nxt_st[2:0] = BUSY_LSU1;
        else if(write_is_div_en)
          reg_nxt_st[2:0] = BUSY_DIV1;
        else
          reg_nxt_st[2:0] = BUSY1;
      else
        reg_nxt_st[2:0] = IDLE;
    else if(write_is_en)
      if(write_is_ld_en)
        reg_nxt_st[2:0] = BUSY_LSU2;
      else if(write_is_div_en)
        reg_nxt_st[2:0] = BUSY_DIV2;
      else
        reg_nxt_st[2:0] = BUSY2;
    else
      reg_nxt_st[2:0] = BUSY1;
  end
  BUSY_LSU1:
  begin
    if(reg_fwd_en1_x | reg_fwd_en2_x)
      if(write_is_en)
        if(write_is_ld_en)
          reg_nxt_st[2:0] = BUSY_LSU1;
        else if(write_is_div_en)
          reg_nxt_st[2:0] = BUSY_DIV1;
        else
          reg_nxt_st[2:0] = IDLE;
      else
        reg_nxt_st[2:0] = IDLE;
    else if(write_is_ld_en)
      reg_nxt_st[2:0] = BUSY_LSU2;
    else
      reg_nxt_st[2:0] = BUSY_LSU1;
  end
  BUSY_DIV1:
  begin
    if(reg_fwd_en0_x | reg_fwd_en2_x)
      if(write_is_en)
        if(write_is_ld_en)
          reg_nxt_st[2:0] = BUSY_LSU1;
        else if(write_is_div_en)
          reg_nxt_st[2:0] = BUSY_DIV1;
        else
          reg_nxt_st[2:0] = IDLE;
      else
        reg_nxt_st[2:0] = IDLE;
    else
      reg_nxt_st[2:0] = BUSY_DIV1;
  end
  BUSY2:
  begin
    if(write_in_en)
      if(write_is_en)
        if(write_is_ld_en)
          reg_nxt_st[2:0] = BUSY_LSU2;
        else if(write_is_div_en)
          reg_nxt_st[2:0] = BUSY_DIV2;
        else
          reg_nxt_st[2:0] = BUSY2;
      else
        reg_nxt_st[2:0] = BUSY1;
    else
      reg_nxt_st[2:0] = BUSY2;
  end
  BUSY_DIV2:
  begin
    if(reg_fwd_en0_x)
      if(write_is_div_en)
        reg_nxt_st[2:0] = BUSY_DIV2;
      else
        reg_nxt_st[2:0] = BUSY_DIV1;
    else
      reg_nxt_st[2:0] = BUSY_DIV2;
  end
  BUSY_LSU2:
  begin
    if(reg_fwd_en1_x)
      if(write_is_ld_en)
        reg_nxt_st[2:0] = BUSY_LSU2;
      else if(reg_fwd_en2_x)
        reg_nxt_st[2:0] = IDLE;
      else
        reg_nxt_st[2:0] = BUSY_LSU1;
    else if(reg_fwd_en2_x)
      reg_nxt_st[2:0] = BUSY_LSU1;
    else
      reg_nxt_st[2:0] = BUSY_LSU2;
  end
  default:
  begin
    reg_nxt_st[2:0] = IDLE;
  end
endcase
// &CombEnd; @208
end

assign reg_busy_st_y[2:0] = reg_cur_st[2:0];
assign reg_dout_y[31:0]   = write_in_data[31:0];

// &ModuleEnd; @213
endmodule


