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
module pa_iu_addr_gen(
  ag_bju_pc,
  ag_dp_ex1_dst_preg,
  ag_dp_ex1_fwd_data,
  ag_dp_ex1_fwd_vld,
  idu_iu_ex1_ag_imm,
  idu_iu_ex1_bju_sel,
  idu_iu_ex1_bju_use_pc,
  idu_iu_ex1_src0,
  iu_ex1_cur_pc,
  iu_idu_ex1_src1_update_value,
  iu_lsu_ex1_lsi_rst,
  lsu_iu_ex1_base_wb,
  lsu_iu_ex1_src1_sel
);

// &Ports; @24
input   [31:0]  idu_iu_ex1_ag_imm;           
input           idu_iu_ex1_bju_sel;          
input           idu_iu_ex1_bju_use_pc;       
input   [31:0]  idu_iu_ex1_src0;             
input   [31:0]  iu_ex1_cur_pc;               
input           lsu_iu_ex1_base_wb;          
input           lsu_iu_ex1_src1_sel;         
output  [31:0]  ag_bju_pc;                   
output  [5 :0]  ag_dp_ex1_dst_preg;          
output  [31:0]  ag_dp_ex1_fwd_data;          
output          ag_dp_ex1_fwd_vld;           
output  [31:0]  iu_idu_ex1_src1_update_value; 
output  [31:0]  iu_lsu_ex1_lsi_rst;          

// &Regs; @25

// &Wires; @26
wire    [31:0]  ag_adder_res;                
wire    [31:0]  ag_adder_rs1;                
wire    [31:0]  ag_adder_rs1_raw;            
wire    [31:0]  ag_adder_rs2;                
wire    [31:0]  ag_bju_pc;                   
wire    [5 :0]  ag_dp_ex1_dst_preg;          
wire    [31:0]  ag_dp_ex1_fwd_data;          
wire            ag_dp_ex1_fwd_vld;           
wire            ag_rs1_use_pc;               
wire    [31:0]  idu_iu_ex1_ag_imm;           
wire            idu_iu_ex1_bju_sel;          
wire            idu_iu_ex1_bju_use_pc;       
wire    [31:0]  idu_iu_ex1_src0;             
wire    [31:0]  iu_ex1_cur_pc;               
wire    [31:0]  iu_idu_ex1_src1_update_value; 
wire    [31:0]  iu_lsu_ex1_lsi_rst;          
wire            lsu_iu_ex1_base_wb;          


//==========================================================
//                   Address Generator
//==========================================================
// Address Generator generate address for:
//   1. jump, branch inst;
//   2. auipc inst;
//   3. LSU address.

//----------------------------------------------------------
//                  BJU Address Generator
//----------------------------------------------------------
//----------- Oper Prepare -------------
// branch inst, auipc inst use pc as rs1.
assign ag_adder_rs1_raw[31:0]  = {32{idu_iu_ex1_bju_sel || lsu_iu_ex1_base_wb}} & idu_iu_ex1_src0[31:0];
// idu_iu_ex1_bju_use_pc will be set when ex1_bju_sel.
assign ag_rs1_use_pc           = idu_iu_ex1_bju_use_pc;
assign ag_adder_rs1[31:0]      = ag_rs1_use_pc ? {iu_ex1_cur_pc[31:1], 1'b0}
                                               : ag_adder_rs1_raw[31:0];

// &Force("bus", "iu_ex1_cur_pc", 31, 0); @53

// dcache_pa inst's address is in rs1. rs2 should be zero rather than ag_imm,
// which is opcode for illegal inst expt.
assign ag_adder_rs2[31:0]      = {32{idu_iu_ex1_bju_sel || lsu_iu_ex1_base_wb}} & idu_iu_ex1_ag_imm[31:0];

//-------------- Adder -----------------
assign ag_adder_res[31:0] = ag_adder_rs1[31:0] + ag_adder_rs2[31:0];

//---------- Rename for output ---------
assign ag_bju_pc[31:0]       = {ag_adder_res[31:1], 1'b0};

assign iu_idu_ex1_src1_update_value[31:0] = ag_adder_res[31:0];

assign iu_lsu_ex1_lsi_rst[31:0] = ag_dp_ex1_fwd_data[31:0];

// &Force("output", "ag_dp_ex1_fwd_data"); @75
// &Force("bus", "idu_iu_ex1_src0_reg", 5, 0); @84
// &Force("input", "lsu_iu_ex1_lsi_dp"); @90
// &Force("input", "lsu_iu_ex1_lsi_dst_reg"); @91
// &Force("bus", "lsu_iu_ex1_lsi_dst_reg", 5, 0); @92
// &Force("input", "lsu_iu_ex1_src1_sel"); @94
assign ag_dp_ex1_fwd_vld = 1'b0;
assign ag_dp_ex1_dst_preg[5:0] = {6{1'bx}};
assign ag_dp_ex1_fwd_data[31:0] = {32{1'bx}};


// &ModuleEnd; @102
endmodule


