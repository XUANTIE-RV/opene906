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
module pa_clic_cpuif_2cycle(
  clic_clk_en,
  clic_cpu_int_hv,
  clic_cpu_int_id,
  clic_cpu_int_il,
  clic_cpu_int_priv,
  clic_int_hv,
  clic_int_id,
  clic_int_il_raw,
  clic_int_priv,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpu_int_exit,
  cpurst_b,
  ctrl_kid_ack_int,
  forever_cpuclk,
  pad_yy_icg_scan_en
);


// &Ports; @25
input            clic_clk_en;       
input            clic_int_hv;       
input   [11 :0]  clic_int_id;       
input   [7  :0]  clic_int_il_raw;   
input   [1  :0]  clic_int_priv;     
input   [11 :0]  cpu_clic_curid;    
input            cpu_clic_int_exit; 
input            cpurst_b;          
input            forever_cpuclk;    
input            pad_yy_icg_scan_en; 
output           clic_cpu_int_hv;   
output  [11 :0]  clic_cpu_int_id;   
output  [7  :0]  clic_cpu_int_il;   
output  [1  :0]  clic_cpu_int_priv; 
output           cpu_int_exit;      
output  [143:0]  ctrl_kid_ack_int;  

// &Regs; @26
reg              clic_int_en;       
reg     [11 :0]  cpuif_curid;       
reg              cpuif_exit;        

// &Wires; @27
wire             clic_clk_en;       
wire             clic_clk_en_f;     
wire             clic_cpu_int_hv;   
wire    [11 :0]  clic_cpu_int_id;   
wire    [7  :0]  clic_cpu_int_il;   
wire    [1  :0]  clic_cpu_int_priv; 
wire             clic_int_hv;       
wire    [11 :0]  clic_int_id;       
wire    [7  :0]  clic_int_il;       
wire    [7  :0]  clic_int_il_raw;   
wire    [1  :0]  clic_int_priv;     
wire    [11 :0]  cpu_clic_curid;    
wire             cpu_clic_int_exit; 
wire    [11 :0]  cpu_curid;         
wire             cpu_int_exit;      
wire             cpuif_clk;         
wire             cpuif_clk_en;      
wire             cpurst_b;          
wire             forever_cpuclk;    
wire             if_clic_en;        
wire             pad_yy_icg_scan_en; 


parameter CLICINTNUM = `CLIC_INTNUM;
parameter CLICINTCTLBITS = `CLIC_INTCTLBITS;
parameter ID_WIDTH = 12;

//==========================================================
//                         Int Exit
//==========================================================
assign cpu_int_exit = cpuif_exit || cpu_clic_int_exit;
// &Force("output", "cpu_int_exit"); @37
always @ (posedge cpuif_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cpuif_exit <= 1'b0;
  else
    cpuif_exit <= cpu_clic_int_exit;
end

always @ (posedge cpuif_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cpuif_curid[ID_WIDTH-1:0] <= {ID_WIDTH{1'b0}};
  else if (cpu_clic_int_exit)
    cpuif_curid[ID_WIDTH-1:0] <= cpu_clic_curid[ID_WIDTH-1:0];
end

assign cpu_curid[ID_WIDTH-1:0] = cpuif_exit ? cpuif_curid[ID_WIDTH-1:0]
                                            : cpu_clic_curid[ID_WIDTH-1:0];

// &Force("output", "ctrl_kid_ack_int"); &Force("bus", "ctrl_kid_ack_int", CLICINTNUM-1, 0); @57
// &Force("nonport", "cpu_curid"); @58

//csky vperl_off
wire [CLICINTNUM-1:0]   ctrl_kid_ack_sel;
wire [CLICINTNUM-1:0]   ctrl_kid_ack_int;

genvar i;
generate
for (i = 0; i < CLICINTNUM; i = i+1)
begin: KID_ACK
  assign ctrl_kid_ack_sel[i] = cpu_curid[ID_WIDTH-1:0] == ($unsigned(i) & {ID_WIDTH{1'b1}});
  assign ctrl_kid_ack_int[i] = ctrl_kid_ack_sel[i] && cpu_int_exit;
end
endgenerate
//csky vperl_on

//==========================================================
//                     Output Interface
//==========================================================
assign clic_int_il[7:0] = {8{if_clic_en}} & clic_int_il_raw[7:0];
// ATTENTION: Only in 2 cycle, clic_clk_en_f = !clic_clk_en.
assign clic_clk_en_f = !clic_clk_en;
assign if_clic_en = clic_clk_en_f || clic_int_en;

always @ (posedge cpuif_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    clic_int_en <= 1'b0;
  else if (cpu_clic_int_exit)
    clic_int_en <= 1'b0;
  else
    clic_int_en <= |clic_int_il[7:0];
end

assign clic_cpu_int_hv               = clic_int_hv;
assign clic_cpu_int_id[ID_WIDTH-1:0] = clic_int_id[ID_WIDTH-1:0];
assign clic_cpu_int_priv[1:0]        = clic_int_priv[1:0];
assign clic_cpu_int_il[7:0]          = clic_int_il[7:0];

//==========================================================
//                           ICG
//==========================================================
assign cpuif_clk_en = |clic_int_il_raw[7:0]
                   || cpuif_exit
                   || clic_int_en;
// &Instance("gated_clk_cell", "x_cpuif_clk"); @103
gated_clk_cell  x_cpuif_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cpuif_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (cpuif_clk_en      ),
  .module_en          (1'b0              ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @104
//          .external_en (1'b0), @105
//          .global_en   (1'b1), @106
//          .module_en   (1'b0), @107
//          .local_en    (cpuif_clk_en), @108
//          .clk_out     (cpuif_clk)); @109

// &ModuleEnd; @111
endmodule



