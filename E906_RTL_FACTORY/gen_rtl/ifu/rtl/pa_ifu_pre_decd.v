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
module pa_ifu_pre_decd(
  id_pred_br_vld0,
  id_pred_br_vld1,
  id_pred_br_vld1_raw,
  id_pred_imm0,
  id_pred_imm1,
  id_pred_ind_link_vld0,
  id_pred_ind_link_vld1,
  id_pred_inst0_32,
  id_pred_jmp_vld0,
  id_pred_jmp_vld1,
  id_pred_link_vld0,
  id_pred_link_vld1,
  id_pred_ret_vld0,
  id_pred_ret_vld1,
  ipack_id_pred_inst0,
  ipack_id_pred_inst0_vld,
  ipack_id_pred_inst1,
  ipack_id_pred_inst1_vld
);

// &Ports; @24
input   [31:0]  ipack_id_pred_inst0;    
input           ipack_id_pred_inst0_vld; 
input   [15:0]  ipack_id_pred_inst1;    
input           ipack_id_pred_inst1_vld; 
output          id_pred_br_vld0;        
output          id_pred_br_vld1;        
output          id_pred_br_vld1_raw;    
output  [31:0]  id_pred_imm0;           
output  [31:0]  id_pred_imm1;           
output          id_pred_ind_link_vld0;  
output          id_pred_ind_link_vld1;  
output          id_pred_inst0_32;       
output          id_pred_jmp_vld0;       
output          id_pred_jmp_vld1;       
output          id_pred_link_vld0;      
output          id_pred_link_vld1;      
output          id_pred_ret_vld0;       
output          id_pred_ret_vld1;       

// &Regs; @25

// &Wires; @26
wire    [31:0]  btype_imm;              
wire            btype_vld;              
wire            btype_vld1;             
wire    [31:0]  cbtype_imm0;            
wire    [31:0]  cbtype_imm1;            
wire            cbtype_vld0;            
wire            cbtype_vld1;            
wire            cjlrtype_vld0;          
wire            cjlrtype_vld1;          
wire            cjltype_vld0;           
wire            cjltype_vld1;           
wire            cjrtype_vld0;           
wire            cjrtype_vld1;           
wire    [31:0]  cjtype_imm0;            
wire    [31:0]  cjtype_imm1;            
wire            cjtype_vld0;            
wire            cjtype_vld1;            
wire            id_pred_br_vld0;        
wire            id_pred_br_vld1;        
wire            id_pred_br_vld1_raw;    
wire    [31:0]  id_pred_imm0;           
wire    [31:0]  id_pred_imm1;           
wire            id_pred_ind_link_vld0;  
wire            id_pred_ind_link_vld1;  
wire            id_pred_inst0_32;       
wire            id_pred_jmp_vld0;       
wire            id_pred_jmp_vld1;       
wire            id_pred_link_vld0;      
wire            id_pred_link_vld1;      
wire            id_pred_ret_vld0;       
wire            id_pred_ret_vld1;       
wire    [31:0]  inst0;                  
wire    [31:0]  inst0_imm;              
wire    [15:0]  inst1;                  
wire    [31:0]  inst1_imm;              
wire    [31:0]  ipack_id_pred_inst0;    
wire            ipack_id_pred_inst0_vld; 
wire    [15:0]  ipack_id_pred_inst1;    
wire            ipack_id_pred_inst1_vld; 
wire            jlrtype_vld;            
wire            jltype_vld;             
wire            jrtype_vld;             
wire    [31:0]  jtype_imm;              
wire            jtype_vld;              


//==========================================================
// Pre-Decode Module
// 1. First Inst Decode
// 2. Second Inst Decode
//==========================================================

//------------------------------------------------
// 1. First Inst Decode
// a. 32-bit Decode, Branch, Jal and Jalr X1
// b. 16-bit Decode, Branch, Jal and Jalr X1
//------------------------------------------------

assign inst0[31:0] = ipack_id_pred_inst0[31:0];
assign inst1[15:0] = ipack_id_pred_inst1[15:0];

// a. 32-bit Decode, Jal, Branch and Jalr X1

// B-Type: BEQ BNE BLT BGE BLTU BGEU
assign btype_vld       = inst0[6:0] == 7'b1100011;
assign btype_imm[31:0] = {{20{inst0[31]}}, inst0[7], inst0[30:25], 
                         inst0[11:8], 1'b0};

// J-Type: JAL
assign jtype_vld       = inst0[6:0] == 7'b1101111;
assign jtype_imm[31:0] = {{12{inst0[31]}}, inst0[19:12], inst0[20], 
                         inst0[30:21], 1'b0};

// Jr-Type: JALR X1
assign jrtype_vld      = inst0[6:0] == 7'b1100111 & inst0[19:15] == 5'b1
                       //& inst0[31:20] == 12'b0 & inst0[11:7] != 5'b1;
                       & inst0[11:7] != 5'b1;

// TODO: JALR JL
assign jltype_vld      = jtype_vld & inst0[11:7] == 5'b1;
assign jlrtype_vld     = inst0[6:0] == 7'b1100111 & inst0[11:7] == 5'b1;

// b. 16-bit Decode, Branch, Jal and Jalr X1

// CB-Type: C.BEQZ C.BNEZ
assign cbtype_vld0       = {inst0[15:13], inst0[1:0]} == 5'b11001 |
                           {inst0[15:13], inst0[1:0]} == 5'b11101;
assign cbtype_imm0[31:0] = {{24{inst0[12]}}, inst0[6:5], inst0[2],
                           inst0[11:10], inst0[4:3], 1'b0}; 

// CJ-Type: C.J C.JAL
assign cjtype_vld0       = {inst0[14:13], inst0[1:0]} == 4'b0101;
assign cjtype_imm0[31:0] = {{21{inst0[12]}}, inst0[8], inst0[10:9], 
                           inst0[6], inst0[7], inst0[2], inst0[11],
                           inst0[5:3], 1'b0};

// CJr-Type: C.JR X1
assign cjrtype_vld0      = inst0[6:0] == 7'b10 & inst0[15:12] == 4'b1000
                        & inst0[11:7] == 5'b1;

// Imm for Inst0
assign inst0_imm[31:0] = {32{  btype_vld}} &   btype_imm[31:0] |
                         {32{  jtype_vld}} &   jtype_imm[31:0] |
                         {32{cbtype_vld0}} & cbtype_imm0[31:0] |
                         {32{cjtype_vld0}} & cjtype_imm0[31:0] ;

// TODO
assign cjltype_vld0 = cjtype_vld0 & ~inst0[15];

// CJlr-Type: C.JALR X1
assign cjlrtype_vld0     = inst0[6:0] == 7'b10 & inst0[15:12] == 4'b1001
                         & inst0[11:7] != 5'b0;

//------------------------------------------------
// 2. Second Inst Decode
// 16-bit Decode, Jal, Branch and Jalr X1
//------------------------------------------------

assign btype_vld1        = inst1[6:0] == 7'b1100011;
// 16-bit Decode, Jal, Branch and Jalr X1
// CB-Type: C.BEQZ C.BNEZ
assign cbtype_vld1       = {inst1[15:13], inst1[1:0]} == 5'b11001 |
                           {inst1[15:13], inst1[1:0]} == 5'b11101;
assign cbtype_imm1[31:0] = {{24{inst1[12]}}, inst1[6:5], inst1[2],
                           inst1[11:10], inst1[4:3], 1'b0}; 

// CJ-Type: C.J C.JAL
assign cjtype_vld1       = {inst1[14:13], inst1[1:0]} == 4'b0101;
assign cjtype_imm1[31:0] = {{21{inst1[12]}}, inst1[8], inst1[10:9], 
                           inst1[6], inst1[7], inst1[2], inst1[11],
                           inst1[5:3], 1'b0};

// CJr-Type: C.JR X1
assign cjrtype_vld1      = inst1[6:0] == 7'b10 & inst1[15:12] == 4'b1000
                        & inst1[11:7] == 5'b1;

// TODO
assign cjltype_vld1 = cjtype_vld1 & ~inst1[15];

// CJr-Type: C.JALR X1
assign cjlrtype_vld1     = inst1[6:0] == 7'b10 & inst1[15:12] == 4'b1001
                         & inst1[11:7] != 5'b0;

// Imm for Inst1
assign inst1_imm[31:0] = {32{cbtype_vld1}} & cbtype_imm1[31:0] |
                         {32{cjtype_vld1}} & cjtype_imm1[31:0] ;

//==========================================================
// Rename for Output
//==========================================================

// Output to id prediction
assign id_pred_br_vld0    = ipack_id_pred_inst0_vld & (btype_vld | cbtype_vld0);
assign id_pred_jmp_vld0   = ipack_id_pred_inst0_vld & (jtype_vld | cjtype_vld0);
assign id_pred_link_vld0  = ipack_id_pred_inst0_vld & (jltype_vld | jlrtype_vld | cjltype_vld0 | cjlrtype_vld0);
assign id_pred_ret_vld0   = ipack_id_pred_inst0_vld & (jrtype_vld | cjrtype_vld0);
assign id_pred_imm0[31:0] = inst0_imm[31:0];
assign id_pred_inst0_32   = inst0[1:0] == 2'b11;
assign id_pred_ind_link_vld0 = ipack_id_pred_inst0_vld & (jlrtype_vld | cjlrtype_vld0);

assign id_pred_br_vld1    = ipack_id_pred_inst1_vld & (btype_vld1 | cbtype_vld1);
assign id_pred_br_vld1_raw = btype_vld1 | cbtype_vld1;
assign id_pred_jmp_vld1   = ipack_id_pred_inst1_vld & (cjtype_vld1);
assign id_pred_link_vld1  = ipack_id_pred_inst1_vld & (cjltype_vld1 | cjlrtype_vld1);
assign id_pred_ret_vld1   = ipack_id_pred_inst1_vld & (cjrtype_vld1);
assign id_pred_imm1[31:0] = inst1_imm[31:0];
assign id_pred_ind_link_vld1 = ipack_id_pred_inst1_vld & cjlrtype_vld1;

// &ModuleEnd; @150
endmodule


