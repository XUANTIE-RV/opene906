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

// &Depend("cpu_cfig.h"); @18

// &ModuleBeg; @20
module pa_lsu_lm(
  cp0_lsu_icg_en,
  cpurst_b,
  forever_cpuclk,
  ifu_lsu_warm_up,
  lm_clr,
  lm_lr_bus,
  lm_pass,
  lm_sc_bus,
  lm_set,
  lm_set_gate,
  pad_yy_icg_scan_en,
  rtu_lsu_expt_ack,
  rtu_lsu_expt_exit
);

// &Ports; @21
input           cp0_lsu_icg_en;    
input           cpurst_b;          
input           forever_cpuclk;    
input           ifu_lsu_warm_up;   
input           lm_clr;            
input   [33:0]  lm_lr_bus;         
input   [33:0]  lm_sc_bus;         
input           lm_set;            
input           lm_set_gate;       
input           pad_yy_icg_scan_en; 
input           rtu_lsu_expt_ack;  
input           rtu_lsu_expt_exit; 
output          lm_pass;           

// &Regs; @22
reg     [33:0]  lm_bus_f;          
reg             lm_cur_state;      
reg             lm_next_state;     

// &Wires; @23
wire            cp0_lsu_icg_en;    
wire            cpurst_b;          
wire            forever_cpuclk;    
wire            ifu_lsu_warm_up;   
wire            lm_clk;            
wire            lm_clk_en;         
wire            lm_clr;            
wire    [33:0]  lm_lr_bus;         
wire            lm_pass;           
wire    [33:0]  lm_sc_bus;         
wire            lm_set;            
wire            lm_set_gate;       
wire            pad_yy_icg_scan_en; 
wire            rtu_lsu_expt_ack;  
wire            rtu_lsu_expt_exit; 


parameter LM_OPEN = 1'b0;
parameter LM_EXCL = 1'b1;

always@(posedge lm_clk or negedge cpurst_b)
begin
  if (!cpurst_b) 
    lm_cur_state <= LM_OPEN;
  else
    lm_cur_state <= lm_next_state;
end
      
// &CombBeg; @36
always @( rtu_lsu_expt_ack
       or lm_clr
       or lm_cur_state
       or lm_set
       or rtu_lsu_expt_exit)
begin
  case (lm_cur_state)
    LM_OPEN:begin
      if (lm_set & !rtu_lsu_expt_ack & !rtu_lsu_expt_exit)
        lm_next_state = LM_EXCL;
      else
        lm_next_state = LM_OPEN;
    end
    LM_EXCL:begin
      if (rtu_lsu_expt_ack | rtu_lsu_expt_exit | lm_clr)
        lm_next_state = LM_OPEN;
      else
        lm_next_state = LM_EXCL;
    end
    default: lm_next_state = LM_OPEN;
  endcase
// &CombEnd; @52
end
   
always@(posedge lm_clk)
begin
  if (ifu_lsu_warm_up)
    lm_bus_f[33:0] <= 34'b0;
  else if (lm_set)
    lm_bus_f[33:0] <= lm_lr_bus[33:0];
end

assign lm_pass = lm_cur_state & (lm_bus_f[33:0] == lm_sc_bus[33:0]);

assign lm_clk_en = lm_set_gate | (lm_cur_state == LM_EXCL) | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_lm_gated_clk"); @77
gated_clk_cell  x_pa_lsu_lm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lm_clk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (lm_clk_en         ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @78
//          .external_en (1'b0), @79
//          .global_en   (1'b1), @80
//          .module_en     (cp0_lsu_icg_en     ), @81
//          .local_en    (lm_clk_en), @82
//          .clk_out     (lm_clk)); @83

// &ModuleEnd; @85
endmodule


