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
module pa_cp0_float_csr(
  cp0_fpu_xx_dqnan,
  cp0_fpu_xx_rm,
  cp0_idu_rm,
  cpurst_b,
  fcsr_local_en,
  fcsr_value,
  fflags_clk,
  fflags_local_en,
  fflags_value,
  fpu_cp0_fflags_updt,
  fpu_cp0_wb_fflags,
  fpu_cp0_wb_fflags_updt,
  frm_local_en,
  frm_value,
  fxcr_local_en,
  fxcr_value,
  iui_regs_wdata,
  regs_clk
);

// &Ports; @24
input           cpurst_b;              
input           fcsr_local_en;         
input           fflags_clk;            
input           fflags_local_en;       
input   [4 :0]  fpu_cp0_wb_fflags;     
input           fpu_cp0_wb_fflags_updt; 
input           frm_local_en;          
input           fxcr_local_en;         
input   [31:0]  iui_regs_wdata;        
input           regs_clk;              
output          cp0_fpu_xx_dqnan;      
output  [2 :0]  cp0_fpu_xx_rm;         
output  [2 :0]  cp0_idu_rm;            
output  [31:0]  fcsr_value;            
output  [31:0]  fflags_value;          
output          fpu_cp0_fflags_updt;   
output  [31:0]  frm_value;             
output  [31:0]  fxcr_value;            

// &Regs; @25
reg     [4 :0]  fcsr_fflags;           
reg     [2 :0]  fcsr_frm;              
reg             fxcr_dqnan;            
reg             fxcr_fe;               

// &Wires; @26
wire            cp0_fpu_xx_dqnan;      
wire    [2 :0]  cp0_fpu_xx_rm;         
wire    [2 :0]  cp0_idu_rm;            
wire            cpurst_b;              
wire            fcsr_local_en;         
wire    [31:0]  fcsr_value;            
wire            fflags_clk;            
wire            fflags_local_en;       
wire    [31:0]  fflags_value;          
wire    [4 :0]  fpu_cp0_fflags;        
wire            fpu_cp0_fflags_updt;   
wire    [4 :0]  fpu_cp0_wb_fflags;     
wire            fpu_cp0_wb_fflags_updt; 
wire            frm_local_en;          
wire    [31:0]  frm_value;             
wire            fxcr_local_en;         
wire    [31:0]  fxcr_value;            
wire    [31:0]  iui_regs_wdata;        
wire            regs_clk;              


// &Force("bus", "iui_regs_wdata", 31, 0); @28

always @ (posedge regs_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    fcsr_frm[2:0] <= 3'b0;
  end
  else if (fcsr_local_en) begin
    fcsr_frm[2:0] <= iui_regs_wdata[7:5];
  end
  else if (frm_local_en) begin
    fcsr_frm[2:0] <= iui_regs_wdata[2:0];
  end
  else if (fxcr_local_en) begin
    fcsr_frm[2:0] <= iui_regs_wdata[26:24];
  end
  else begin
    fcsr_frm[2:0] <= fcsr_frm[2:0];
  end
end

assign frm_value[31:0] = {29'b0, fcsr_frm[2:0]};

always @ (posedge fflags_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    fcsr_fflags[4:0] <= 5'b0;
  end
  else if (fcsr_local_en) begin
    fcsr_fflags[4:0] <= iui_regs_wdata[4:0];
  end
  else if (fflags_local_en) begin
    fcsr_fflags[4:0] <= iui_regs_wdata[4:0];
  end
  else if (fxcr_local_en) begin
    fcsr_fflags[4:0] <= iui_regs_wdata[4:0];
  end
  else if (fpu_cp0_fflags_updt) begin
    fcsr_fflags[4:0] <= fcsr_fflags[4:0] | fpu_cp0_fflags[4:0];
  end
  else begin
    fcsr_fflags[4:0] <= fcsr_fflags[4:0];
  end
end

assign fpu_cp0_fflags_updt = fpu_cp0_wb_fflags_updt;
// &Force("output","fpu_cp0_fflags_updt"); @74
assign fpu_cp0_fflags[4:0] = fpu_cp0_wb_fflags[4:0];
assign fflags_value[31:0] = {27'b0, fcsr_fflags[4:0]};
assign fcsr_value[31:0]   = {24'b0, fcsr_frm[2:0], fcsr_fflags[4:0]};

always @ (posedge fflags_clk or negedge cpurst_b)
begin 
  if (!cpurst_b)
    fxcr_fe <= 1'b0;
  else if (fxcr_local_en)
    fxcr_fe <= iui_regs_wdata[5];
  else if (fpu_cp0_fflags_updt)
    fxcr_fe <= fxcr_fe || (|fpu_cp0_fflags[4:0]);
  else
    fxcr_fe <= fxcr_fe;
end

always @ (posedge regs_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    fxcr_dqnan <= 1'b0;
  else if (fxcr_local_en)
    fxcr_dqnan <= iui_regs_wdata[23];
  else
    fxcr_dqnan <= fxcr_dqnan;
end

assign fxcr_value[31:0]   = {5'b0, fcsr_frm[2:0], fxcr_dqnan, 17'b0, fxcr_fe, fcsr_fflags[4:0]};



//==========================================================
//                      Output Signal
//==========================================================
assign cp0_fpu_xx_rm[2:0] = fcsr_frm[2:0];
assign cp0_fpu_xx_dqnan   = fxcr_dqnan;

assign cp0_idu_rm[2:0]    = fcsr_frm[2:0];

// &ModuleEnd; @113
endmodule


