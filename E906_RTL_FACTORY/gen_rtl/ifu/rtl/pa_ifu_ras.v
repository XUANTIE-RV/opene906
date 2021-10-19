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
module pa_ifu_ras(
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  id_pred_ras_link_pc,
  id_pred_ras_link_vld,
  id_pred_ras_ret_vld,
  iu_ifu_bht_mispred,
  iu_ifu_bht_mispred_gate,
  iu_ifu_link_vld,
  iu_ifu_link_vld_gate,
  iu_ifu_pc_mispred,
  iu_ifu_pc_mispred_gate,
  iu_ifu_ret_vld,
  iu_ifu_ret_vld_gate,
  iu_yy_xx_cancel,
  pad_yy_icg_scan_en,
  ras_cur_ret,
  ras_id_pred_tar_pc,
  rtu_ifu_flush_fe
);

// &Ports; @24
input           cp0_ifu_icg_en;         
input           cp0_yy_clk_en;          
input           cpurst_b;               
input           forever_cpuclk;         
input   [23:0]  id_pred_ras_link_pc;    
input           id_pred_ras_link_vld;   
input           id_pred_ras_ret_vld;    
input           iu_ifu_bht_mispred;     
input           iu_ifu_bht_mispred_gate; 
input           iu_ifu_link_vld;        
input           iu_ifu_link_vld_gate;   
input           iu_ifu_pc_mispred;      
input           iu_ifu_pc_mispred_gate; 
input           iu_ifu_ret_vld;         
input           iu_ifu_ret_vld_gate;    
input           iu_yy_xx_cancel;        
input           pad_yy_icg_scan_en;     
input           ras_cur_ret;            
input           rtu_ifu_flush_fe;       
output  [23:0]  ras_id_pred_tar_pc;     

// &Regs; @25
reg     [3 :0]  ras_bju;                
reg     [3 :0]  ras_pop;                
reg     [23:0]  ras_tar_pc;             

// &Wires; @26
wire            cp0_ifu_icg_en;         
wire            cp0_yy_clk_en;          
wire            cpurst_b;               
wire    [23:0]  entry0_pc;              
wire            entry0_upd;             
wire    [23:0]  entry1_pc;              
wire            entry1_upd;             
wire    [23:0]  entry2_pc;              
wire            entry2_upd;             
wire    [23:0]  entry3_pc;              
wire            entry3_upd;             
wire            forever_cpuclk;         
wire    [23:0]  id_pred_ras_link_pc;    
wire            id_pred_ras_link_vld;   
wire            id_pred_ras_ret_vld;    
wire            iu_ifu_bht_mispred;     
wire            iu_ifu_bht_mispred_gate; 
wire            iu_ifu_link_vld;        
wire            iu_ifu_link_vld_gate;   
wire            iu_ifu_pc_mispred;      
wire            iu_ifu_pc_mispred_gate; 
wire            iu_ifu_ret_vld;         
wire            iu_ifu_ret_vld_gate;    
wire            iu_yy_xx_cancel;        
wire            pad_yy_icg_scan_en;     
wire            ras_cpuclk;             
wire            ras_cur_ret;            
wire            ras_icg_en;             
wire    [23:0]  ras_id_pred_tar_pc;     
wire    [23:0]  ras_upd_pc;             
wire            rtu_ifu_flush_fe;       


//==========================================================
// Return Address Stack Module
// 1. Instance ICG Cell
// 2. Instance RAS Entries
// 3. RAS Read Port
// 4. RAS Write Port
// 5. Generate Change Flow
//==========================================================

//------------------------------------------------
// 1. Instance ICG Cell
//------------------------------------------------
assign ras_icg_en = id_pred_ras_ret_vld 
                  | id_pred_ras_link_vld
                  | rtu_ifu_flush_fe | iu_ifu_bht_mispred_gate | iu_ifu_pc_mispred_gate 
                  | iu_ifu_link_vld_gate | iu_ifu_ret_vld_gate | iu_yy_xx_cancel;
// &Instance("gated_clk_cell", "x_pa_ifu_ras_icg_cell"); @44
gated_clk_cell  x_pa_ifu_ras_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ras_cpuclk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ras_icg_en        ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @45
//          .external_en (1'b0), @46
//          .global_en   (cp0_yy_clk_en), @47
//          .module_en   (cp0_ifu_icg_en), @48
//          .local_en    (ras_icg_en), @49
//          .clk_out     (ras_cpuclk) @50
//         ); @51

//------------------------------------------------
// 2. Instance RAS Entries
//------------------------------------------------
parameter ENTRY_NUM = 4;

// &ConnRule(s/ras_entry/entry0/); @58
// &Instance("pa_ifu_ras_entry","x_pa_ifu_ras_entry0"); @59
pa_ifu_ras_entry  x_pa_ifu_ras_entry0 (
  .cp0_ifu_icg_en     (cp0_ifu_icg_en    ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .ras_entry_pc       (entry0_pc         ),
  .ras_entry_upd      (entry0_upd        ),
  .ras_upd_pc         (ras_upd_pc        )
);


// &ConnRule(s/ras_entry/entry1/); @61
// &Instance("pa_ifu_ras_entry","x_pa_ifu_ras_entry1"); @62
pa_ifu_ras_entry  x_pa_ifu_ras_entry1 (
  .cp0_ifu_icg_en     (cp0_ifu_icg_en    ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .ras_entry_pc       (entry1_pc         ),
  .ras_entry_upd      (entry1_upd        ),
  .ras_upd_pc         (ras_upd_pc        )
);


// &ConnRule(s/ras_entry/entry2/); @64
// &Instance("pa_ifu_ras_entry","x_pa_ifu_ras_entry2"); @65
pa_ifu_ras_entry  x_pa_ifu_ras_entry2 (
  .cp0_ifu_icg_en     (cp0_ifu_icg_en    ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .ras_entry_pc       (entry2_pc         ),
  .ras_entry_upd      (entry2_upd        ),
  .ras_upd_pc         (ras_upd_pc        )
);


// &ConnRule(s/ras_entry/entry3/); @67
// &Instance("pa_ifu_ras_entry","x_pa_ifu_ras_entry3"); @68
pa_ifu_ras_entry  x_pa_ifu_ras_entry3 (
  .cp0_ifu_icg_en     (cp0_ifu_icg_en    ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .ras_entry_pc       (entry3_pc         ),
  .ras_entry_upd      (entry3_upd        ),
  .ras_upd_pc         (ras_upd_pc        )
);


// &ConnRule(s/ras_entry/entry4/); @71
// &Instance("pa_ifu_ras_entry","x_pa_ifu_ras_entry4"); @72
// &ConnRule(s/ras_entry/entry5/); @74
// &Instance("pa_ifu_ras_entry","x_pa_ifu_ras_entry5"); @75

//------------------------------------------------
// 3. RAS Read Port
//------------------------------------------------
always@(posedge ras_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ras_pop[ENTRY_NUM-1:0] <= {{ENTRY_NUM-1{1'b0}}, 1'b1};
  else if(rtu_ifu_flush_fe | iu_ifu_bht_mispred | iu_ifu_pc_mispred & !iu_ifu_link_vld | iu_yy_xx_cancel & iu_ifu_ret_vld)
    ras_pop[ENTRY_NUM-1:0] <= ras_bju[ENTRY_NUM-1:0];
  else if(id_pred_ras_link_vld)
    ras_pop[ENTRY_NUM-1:0] <= {ras_pop[0], ras_pop[ENTRY_NUM-1:1]};
  else if(id_pred_ras_ret_vld & ~ras_cur_ret)
    ras_pop[ENTRY_NUM-1:0] <= {ras_pop[ENTRY_NUM-2:0], ras_pop[ENTRY_NUM-1]};
  else
    ras_pop[ENTRY_NUM-1:0] <= ras_pop[ENTRY_NUM-1:0];
end

always@(posedge ras_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ras_bju[ENTRY_NUM-1:0] <= {{ENTRY_NUM-1{1'b0}}, 1'b1};
  else if(iu_ifu_link_vld & ~rtu_ifu_flush_fe)
    ras_bju[ENTRY_NUM-1:0] <= {ras_bju[0], ras_bju[ENTRY_NUM-1:1]};
  else if(iu_ifu_ret_vld & ~rtu_ifu_flush_fe)
    ras_bju[ENTRY_NUM-1:0] <= {ras_bju[ENTRY_NUM-2:0], ras_bju[ENTRY_NUM-1]};
  else
    ras_bju[ENTRY_NUM-1:0] <= ras_bju[ENTRY_NUM-1:0];
end

// &CombBeg; @108
// &CombEnd; @118
// &CombBeg; @120
always @( entry0_pc[23:0]
       or ras_pop[3:0]
       or entry3_pc[23:0]
       or entry2_pc[23:0]
       or entry1_pc[23:0])
begin
case(ras_pop[3:0])
  4'b0001: ras_tar_pc[23:0] = entry0_pc[23:0];
  4'b0010: ras_tar_pc[23:0] = entry1_pc[23:0];
  4'b0100: ras_tar_pc[23:0] = entry2_pc[23:0];
  4'b1000: ras_tar_pc[23:0] = entry3_pc[23:0];
  default: ras_tar_pc[23:0] = {24{1'bx}};
endcase
// &CombEnd; @128
end

//------------------------------------------------
// 4. RAS Write Port
//------------------------------------------------
assign entry3_upd = id_pred_ras_link_vld & ras_pop[0];
assign entry2_upd = id_pred_ras_link_vld & ras_pop[3];
assign entry1_upd = id_pred_ras_link_vld & ras_pop[2];
assign entry0_upd = id_pred_ras_link_vld & ras_pop[1];
assign ras_upd_pc[23:0] = id_pred_ras_link_pc[23:0];

//==========================================================
// Rename for Output
//==========================================================

// Output to id prediction
assign ras_id_pred_tar_pc[23:0] = ras_tar_pc[23:0];

// &ModuleEnd; @153
endmodule


