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
module pa_dtu_dbginfo(
  bmu_dtu_debug_info,
  cp0_dtu_addr,
  cp0_dtu_debug_info,
  cp0_dtu_icg_en,
  cp0_dtu_rreg,
  cp0_yy_clk_en,
  cpurst_b,
  dahbl_dtu_debug_info,
  dbgfifo_regs_data,
  dtu_rtu_async_halt_req,
  forever_cpuclk,
  fpu_dtu_debug_info,
  iahbl_dtu_debug_info,
  idu_dtu_debug_info,
  idu_dtu_fpr_info,
  ifu_dtu_debug_info,
  iu_dtu_debug_info,
  lsu_dtu_debug_info,
  pad_yy_icg_scan_en,
  rtu_dtu_debug_info,
  sahbl_dtu_debug_info
);

// &Ports; @24
input   [3  :0]  bmu_dtu_debug_info;     
input   [11 :0]  cp0_dtu_addr;           
input   [5  :0]  cp0_dtu_debug_info;     
input            cp0_dtu_icg_en;         
input            cp0_dtu_rreg;           
input            cp0_yy_clk_en;          
input            cpurst_b;               
input   [10 :0]  dahbl_dtu_debug_info;   
input            dtu_rtu_async_halt_req; 
input            forever_cpuclk;         
input   [7  :0]  fpu_dtu_debug_info;     
input   [10 :0]  iahbl_dtu_debug_info;   
input   [21 :0]  idu_dtu_debug_info;     
input   [95 :0]  idu_dtu_fpr_info;       
input   [26 :0]  ifu_dtu_debug_info;     
input   [8  :0]  iu_dtu_debug_info;      
input   [78 :0]  lsu_dtu_debug_info;     
input            pad_yy_icg_scan_en;     
input   [13 :0]  rtu_dtu_debug_info;     
input   [10 :0]  sahbl_dtu_debug_info;   
output  [31 :0]  dbgfifo_regs_data;      

// &Regs; @25
reg     [3  :0]  dbg_rptr;               
reg     [297:0]  xx_dbg_info_reg;        

// &Wires; @26
wire    [3  :0]  bmu_dtu_debug_info;     
wire    [11 :0]  cp0_dtu_addr;           
wire    [5  :0]  cp0_dtu_debug_info;     
wire             cp0_dtu_icg_en;         
wire             cp0_dtu_rreg;           
wire             cp0_read_dbginfo;       
wire             cp0_yy_clk_en;          
wire             cpurst_b;               
wire    [10 :0]  dahbl_dtu_debug_info;   
wire             dbg_info_record;        
wire    [31 :0]  dbgfifo_regs_data;      
wire             dbginfo_clk;            
wire             dbginfo_clk_en;         
wire    [31 :0]  dbginfo_out;            
wire             dtu_rtu_async_halt_req; 
wire             forever_cpuclk;         
wire    [7  :0]  fpu_dtu_debug_info;     
wire    [10 :0]  iahbl_dtu_debug_info;   
wire    [21 :0]  idu_dtu_debug_info;     
wire    [95 :0]  idu_dtu_fpr_info;       
wire    [26 :0]  ifu_dtu_debug_info;     
wire    [8  :0]  iu_dtu_debug_info;      
wire    [78 :0]  lsu_dtu_debug_info;     
wire             pad_yy_icg_scan_en;     
wire    [13 :0]  rtu_dtu_debug_info;     
wire    [10 :0]  sahbl_dtu_debug_info;   
wire    [297:0]  xx_dbg_info;            
wire    [307:0]  xx_dbg_info_reg_padding; 


parameter DBG_INFO_WIDTH = `TDT_DBGINFO_WIDTH;
parameter DBG_WIDTH  = `TDT_DM_CORE_MAX_XLEN;
parameter DBGINFO_RPTR_WIDTH = 4;
parameter DBGINFO_READ_WIDTH = 28;
parameter DBGINFO_DEPTH = `TDT_DBGINFO_DEPTH;

//==========================================================
//                    DBGINFO FIFO Read
//==========================================================
//csky vperl_off
wire  [DBGINFO_READ_WIDTH -1:0] dbginfo_reg[DBGINFO_DEPTH-1:0];

genvar i;

generate
  for (i = 0; i < DBGINFO_DEPTH; i = i+1)
  begin: DBG_FIFO
    assign dbginfo_reg[i][DBGINFO_READ_WIDTH -1:0] = xx_dbg_info_reg_padding[DBGINFO_READ_WIDTH *i+DBGINFO_READ_WIDTH-1:DBGINFO_READ_WIDTH *i];
  end
endgenerate
//vperl_on

assign dbginfo_out[DBG_WIDTH-1:0] = {dbginfo_reg[dbg_rptr[DBGINFO_RPTR_WIDTH-1:0]][DBGINFO_READ_WIDTH-1:0],dbg_rptr[DBGINFO_RPTR_WIDTH-1:0]};

//csky vperl_on
// &Force("nonport","dbginfo_out"); @53
assign dbgfifo_regs_data[DBG_WIDTH -1:0] = dbginfo_out[DBG_WIDTH-1:0];

assign cp0_read_dbginfo = cp0_dtu_rreg && cp0_dtu_addr[11:0] == 12'hfe1;
//==========================================================
//                    DBGINFO FIFO Write
//==========================================================
assign dbg_info_record = dtu_rtu_async_halt_req;


assign xx_dbg_info[DBG_INFO_WIDTH-1:0] = {
         idu_dtu_fpr_info[95:0],
         fpu_dtu_debug_info[7:0],
         cp0_dtu_debug_info[5:0],
         rtu_dtu_debug_info[13:0],
         iu_dtu_debug_info[8:0],
         sahbl_dtu_debug_info[10:0],
         dahbl_dtu_debug_info[10:0],
         iahbl_dtu_debug_info[10:0],
         bmu_dtu_debug_info[3:0],
         lsu_dtu_debug_info[78:0],
         idu_dtu_debug_info[21:0],
         ifu_dtu_debug_info[26:0]
};


always @ (posedge dbginfo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    xx_dbg_info_reg[DBG_INFO_WIDTH-1:0] <= {DBG_INFO_WIDTH{1'b0}};
  else if (dbg_info_record)
    xx_dbg_info_reg[DBG_INFO_WIDTH-1:0] <= xx_dbg_info[DBG_INFO_WIDTH-1:0];
end

assign xx_dbg_info_reg_padding[DBGINFO_READ_WIDTH *DBGINFO_DEPTH-1:0] = {
           {(DBGINFO_READ_WIDTH *DBGINFO_DEPTH-DBG_INFO_WIDTH){1'b0}},
           xx_dbg_info_reg[DBG_INFO_WIDTH-1:0]
           };
// &Force("nonport", "xx_dbg_info_reg"); @111
// &Force("nonport", "xx_dbg_info_reg_padding"); @112

//==========================================================
//                DBGINFO FIFO Read Pointer
//==========================================================
always @ (posedge dbginfo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dbg_rptr[DBGINFO_RPTR_WIDTH-1:0] <= {DBGINFO_RPTR_WIDTH{1'b0}};
  else if (cp0_read_dbginfo && dbg_rptr[DBGINFO_RPTR_WIDTH-1:0] == 4'd10) 
    dbg_rptr[DBGINFO_RPTR_WIDTH-1:0] <= {DBGINFO_RPTR_WIDTH{1'b0}};
  else if (cp0_read_dbginfo)
    dbg_rptr[DBGINFO_RPTR_WIDTH-1:0] <= dbg_rptr[DBGINFO_RPTR_WIDTH-1:0] + 1'b1;
end

//==========================================================
//                     gate clk
//==========================================================
assign dbginfo_clk_en = dtu_rtu_async_halt_req ||
                        cp0_read_dbginfo;
// &Force("nonport","dbginfo_clk_en"); @136

// &Instance("gated_clk_cell", "x_reg_gated_clk"); @138
gated_clk_cell  x_reg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dbginfo_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (dbginfo_clk_en    ),
  .module_en          (cp0_dtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @139
//          .external_en (1'b0), @140
//          .global_en   (cp0_yy_clk_en), @141
//          .module_en   (cp0_dtu_icg_en), @142
//          .local_en    (dbginfo_clk_en), @143
//          //.local_en    (1'b1), @144
//          .clk_out     (dbginfo_clk)); @145

// &ModuleEnd; @147
endmodule


