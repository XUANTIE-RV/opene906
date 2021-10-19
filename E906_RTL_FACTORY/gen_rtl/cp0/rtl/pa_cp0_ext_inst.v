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
module pa_cp0_ext_inst(
  ext_inst_ifu_icc_addr,
  ext_inst_ifu_icc_req,
  ext_inst_ifu_icc_type,
  ext_inst_ifu_inv_done,
  ext_inst_lsu_icc_addr,
  ext_inst_lsu_icc_done,
  ext_inst_lsu_icc_op,
  ext_inst_lsu_icc_req,
  ext_inst_lsu_icc_type,
  ext_iui_cache_stall,
  ext_iui_expt_vld,
  iui_ext_inst_cache,
  iui_ext_inst_imm,
  iui_ext_inst_rs1
);

// &Ports; @24
input           ext_inst_ifu_inv_done; 
input           ext_inst_lsu_icc_done; 
input           iui_ext_inst_cache;   
input   [11:0]  iui_ext_inst_imm;     
input   [31:0]  iui_ext_inst_rs1;     
output  [31:0]  ext_inst_ifu_icc_addr; 
output          ext_inst_ifu_icc_req; 
output          ext_inst_ifu_icc_type; 
output  [31:0]  ext_inst_lsu_icc_addr; 
output  [1 :0]  ext_inst_lsu_icc_op;  
output          ext_inst_lsu_icc_req; 
output  [1 :0]  ext_inst_lsu_icc_type; 
output          ext_iui_cache_stall;  
output          ext_iui_expt_vld;     

// &Regs; @25
reg     [1 :0]  inst_dst;             
reg     [1 :0]  inst_type;            

// &Wires; @26
wire            cache_inst_illegal;   
wire    [1 :0]  cache_inst_op;        
wire            cache_inst_rs1;       
wire    [2 :0]  cache_inst_type;      
wire    [31:0]  ext_inst_ifu_icc_addr; 
wire            ext_inst_ifu_icc_req; 
wire            ext_inst_ifu_icc_type; 
wire            ext_inst_ifu_inv_done; 
wire    [31:0]  ext_inst_lsu_icc_addr; 
wire            ext_inst_lsu_icc_done; 
wire    [1 :0]  ext_inst_lsu_icc_op;  
wire            ext_inst_lsu_icc_req; 
wire    [1 :0]  ext_inst_lsu_icc_type; 
wire            ext_iui_cache_stall;  
wire            ext_iui_expt_vld;     
wire            iui_ext_inst_cache;   
wire    [11:0]  iui_ext_inst_imm;     
wire    [31:0]  iui_ext_inst_rs1;     


parameter CPU_MODE_U = 2'b00;

parameter NOP    = 2'b00,
          DCHE   = 2'b01,
          ICHE   = 2'b10;

parameter CACHE_ALL    = 2'b0,
          CACHE_SETWAY = 2'b01,
          CACHE_PA     = 2'b10;

//==========================================================
//                   Cache Inst Decode
//==========================================================
assign cache_inst_op[1:0]   = iui_ext_inst_imm[1:0];
assign cache_inst_type[2:0] = iui_ext_inst_imm[4:2];
assign cache_inst_rs1       = iui_ext_inst_imm[5];
// &Force("bus", "iui_ext_inst_imm", 11, 0); @44

// &CombBeg; @46
always @( cache_inst_rs1
       or cache_inst_type[2:0])
begin
  case({cache_inst_rs1, cache_inst_type[2:0]})
    4'b0_000: begin
      inst_dst[1:0]  = DCHE;
      inst_type[1:0] = CACHE_ALL;
    end
    4'b1_000: begin
      inst_dst[1:0]  = DCHE;
      inst_type[1:0] = CACHE_SETWAY;
    end
    4'b1_001: begin
      inst_dst[1:0]  = NOP;
      inst_type[1:0] = CACHE_ALL;
    end
    4'b1_010: begin
      inst_dst[1:0]  = DCHE;
      inst_type[1:0] = CACHE_PA;
    end
    4'b0_100: begin
      inst_dst[1:0]  = ICHE;
      inst_type[1:0] = CACHE_ALL;
    end
    4'b1_110: begin
      inst_dst[1:0]  = ICHE;
      inst_type[1:0] = CACHE_PA;
    end
    4'b1_100: begin
      inst_dst[1:0]  = NOP;
      inst_type[1:0] = CACHE_ALL;
    end
    4'b0_101: begin
      inst_dst[1:0]  = NOP;
      inst_type[1:0] = CACHE_ALL;
    end
    default: begin
      inst_dst[1:0]  = NOP;
      inst_type[1:0] = CACHE_ALL;
    end
  endcase
// &CombEnd; @85
end

// assign cache_inst_illegal     = cp0_yy_priv_mode[1:0] == CPU_MODE_U;
assign cache_inst_illegal     = 1'b0; // Now illegal judge is in ID.

assign ext_iui_expt_vld       = cache_inst_illegal;
assign ext_iui_cache_stall    = inst_dst[1] && !ext_inst_ifu_inv_done
                             || inst_dst[0] && !ext_inst_lsu_icc_done;

//==========================================================
//                  Dcache inst
//==========================================================
assign ext_inst_lsu_icc_req        = iui_ext_inst_cache && inst_dst[0] && !cache_inst_illegal;
assign ext_inst_lsu_icc_type[1:0]  = inst_type[1:0];
assign ext_inst_lsu_icc_op[1:0]    = {cache_inst_op[0], cache_inst_op[1]};
assign ext_inst_lsu_icc_addr[31:0] = iui_ext_inst_rs1[31:0];

//==========================================================
//                  Icache inst
//==========================================================
assign ext_inst_ifu_icc_req        = iui_ext_inst_cache && inst_dst[1] && !cache_inst_illegal;
assign ext_inst_ifu_icc_type       = inst_type[1];
assign ext_inst_ifu_icc_addr[31:0] = iui_ext_inst_rs1[31:0];

// &ModuleEnd; @111
endmodule


