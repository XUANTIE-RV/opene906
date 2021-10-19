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

// &Depend("pa_idu_cfig.h"); @26
// &ModuleBeg; @27
module pa_idu_decd_rv32c(
  decd_inst,
  decd_inst_32bit,
  decd_rv32c_func,
  decd_rv32c_ill_expt,
  decd_rv32c_imm1,
  decd_rv32c_imm1_vld,
  decd_rv32c_imm2,
  decd_rv32c_imm2_vld,
  decd_rv32c_op_vld,
  decd_rv32c_rd,
  decd_rv32c_rd_vld,
  decd_rv32c_rs1,
  decd_rv32c_rs1_vld,
  decd_rv32c_rs2,
  decd_rv32c_rs2_vld,
  decd_rv32c_sel
);

// &Ports; @28
input   [31:0]  decd_inst;          
input           decd_inst_32bit;    
output  [19:0]  decd_rv32c_func;    
output          decd_rv32c_ill_expt; 
output  [31:0]  decd_rv32c_imm1;    
output          decd_rv32c_imm1_vld; 
output  [31:0]  decd_rv32c_imm2;    
output          decd_rv32c_imm2_vld; 
output          decd_rv32c_op_vld;  
output  [4 :0]  decd_rv32c_rd;      
output          decd_rv32c_rd_vld;  
output  [4 :0]  decd_rv32c_rs1;     
output          decd_rv32c_rs1_vld; 
output  [4 :0]  decd_rv32c_rs2;     
output          decd_rv32c_rs2_vld; 
output  [5 :0]  decd_rv32c_sel;     

// &Regs; @29
reg     [19:0]  decd_func;          
reg             decd_ill_expt;      
reg     [4 :0]  decd_rd;            
reg             decd_rd_vld;        
reg     [4 :0]  decd_rs1;           
reg             decd_rs1_vld;       
reg     [4 :0]  decd_rs2;           
reg             decd_rs2_vld;       
reg     [5 :0]  decd_sel;           

// &Wires; @30
wire    [31:0]  cbtype_imm;         
wire            cbtype_imm_vld;     
wire    [31:0]  ciatype_imm;        
wire            ciatype_imm_vld;    
wire    [31:0]  ciltype_imm;        
wire            ciltype_imm_vld;    
wire    [31:0]  cistype_imm;        
wire            cistype_imm_vld;    
wire    [31:0]  citype_imm;         
wire            citype_imm_vld;     
wire    [31:0]  ciwtype_imm;        
wire            ciwtype_imm_vld;    
wire    [31:0]  cjtype_imm;         
wire            cjtype_imm_vld;     
wire    [31:0]  cltype_imm;         
wire            cltype_imm_vld;     
wire    [31:0]  csstype_imm;        
wire            csstype_imm_vld;    
wire    [31:0]  decd_imm1;          
wire            decd_imm1_vld;      
wire    [31:0]  decd_imm2;          
wire            decd_imm2_vld;      
wire    [31:0]  decd_inst;          
wire            decd_inst_32bit;    
wire    [19:0]  decd_rv32c_func;    
wire            decd_rv32c_ill_expt; 
wire    [31:0]  decd_rv32c_imm1;    
wire            decd_rv32c_imm1_vld; 
wire    [31:0]  decd_rv32c_imm2;    
wire            decd_rv32c_imm2_vld; 
wire            decd_rv32c_op_vld;  
wire    [4 :0]  decd_rv32c_rd;      
wire            decd_rv32c_rd_vld;  
wire    [4 :0]  decd_rv32c_rs1;     
wire            decd_rv32c_rs1_vld; 
wire    [4 :0]  decd_rv32c_rs2;     
wire            decd_rv32c_rs2_vld; 
wire    [5 :0]  decd_rv32c_sel;     


// &Force("bus", "decd_inst", 31, 0); @32
//==========================================================
//           Decoder for RV32C Instructions
//==========================================================
// Reliazed Packages: RV32C -- Version 2.1
//---------------------------------------------------
// RV32C: 
//--------------------------
//   ALU  20 Instructions 
//  ADDER  SHIFT  LOGIC 
//    8      6      6   
//--------------------------

// &CombBeg; @45
always @( decd_inst[15:0])
begin
  decd_sel[`SEL_WIDTH-1:0]   = {`SEL_WIDTH{1'b0}};
  decd_func[`FUNC_WIDTH-1:0] = {`FUNC_WIDTH{1'b0}};
  decd_rd_vld                = 1'b0;
  casez(decd_inst[15:0])
    //===================================================
    // ALU Decoder
    //---------------------------------------------------
    // ADDER 9 RV32C insts, plus C.JR/C.JALR/C.EBREAK
    16'b000_??????_?????_00: // C.ADDI4SPN; 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_ADD;
      decd_rd_vld                = 1'b1;
    end
    16'b000_??????_?????_01: // C.ADDI C.NOP
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_ADD;
      decd_rd_vld                = 1'b1;
    end
    16'b010_??????_?????_01: // C.LI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_ADD;
      decd_rd_vld                = 1'b1;
    end
    16'b011_??????_?????_01: // C.ADDI16SP C.LUI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_ADD;
      decd_rd_vld                = 1'b1;
    end
    16'b100_011???_00???_01: // C.SUB
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SUB;
      decd_rd_vld                = 1'b1;
    end
    16'b100_0?????_?????_10: // C.MV; C.JR ALU Unit selected only rs2 != x0
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = decd_inst[6:2] == 5'b0 ? `SEL_BJU : `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = decd_inst[6:2] == 5'b0 ? `FUNC_JALR : `FUNC_ADD;
      decd_rd_vld                = decd_inst[6:2] != 5'b0;
    end
    16'b100_1?????_?????_10: // C.ADD; C.JALR; C.EBREAK; ALU Unit selected only rs2 != x0
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = decd_inst[6:2] == 5'b0
                                ? decd_inst[11:7] == 5'b0 ? `SEL_CP0 : `SEL_BJU : `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = decd_inst[6:2] == 5'b0  
                                ? decd_inst[11:7] == 5'b0 ? `FUNC_EBREAK : `FUNC_JALR : `FUNC_ADD;
      decd_rd_vld                = decd_inst[11:2] != 10'b0;
    end
    //---------------------------------------------------
    // SHIFT 3 RV32C insts
    16'b100_?00???_?????_01: // C.SRLI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SRL;
      decd_rd_vld                = 1'b1;
    end
    16'b100_?01???_?????_01: // C.SRAI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SRA;
      decd_rd_vld                = 1'b1;
    end
    16'b000_??????_?????_10: // C.SLLI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SLL;
      decd_rd_vld                = 1'b1;
    end
    //---------------------------------------------------
    // LOGIC 4 RV32C insts
    16'b100_?10???_?????_01: // C.ANDI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_AND;
      decd_rd_vld                = 1'b1;
    end
    16'b100_011???_01???_01: // C.XOR
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_XOR;
      decd_rd_vld                = 1'b1;
    end
    16'b100_011???_10???_01: // C.OR 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_OR;
      decd_rd_vld                = 1'b1;
    end
    16'b100_011???_11???_01: // C.AND 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_AND;
      decd_rd_vld                = 1'b1;
    end
    //===================================================
    // BJU Decoder
    //---------------------------------------------------
    // BJU 4 RV32C insts
    16'b001_?????_??????_01: // C.JAL
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_JAL;
      decd_rd_vld                = 1'b1;
    end
    16'b101_?????_??????_01: // C.J
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_JAL;
      decd_rd_vld                = 1'b0;
    end
    16'b110_?????_??????_01: // C.BEQZ
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_BEQ;
      decd_rd_vld                = 1'b0;
    end
    16'b111_?????_??????_01: // C.BNEQ
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_BNE;
      decd_rd_vld                = 1'b0;
    end
    //===================================================
    // LSU Decoder
    //---------------------------------------------------
    // LSU 4 RV32C insts
    16'b010_??????_?????_00: // C.LW 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_LW;
      decd_rd_vld                = 1'b1;
    end
    16'b110_??????_?????_00: // C.SW 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SW;
    end
    16'b010_??????_?????_10: // C.LWSP 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_LW;
      decd_rd_vld                = 1'b1;
    end
    16'b110_??????_?????_10: // C.SWSP
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SW;
    end
    16'b011_??????_?????_00: // C.FLW 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_LW;
    end
    16'b111_??????_?????_00: // C.FSW 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SW;
    end
    16'b011_??????_?????_10: // C.FLWSP 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_LW;
    end
    16'b111_??????_?????_10: // C.FSWSP 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SW;
    end
    16'b001_??????_?????_00: // C.FLD 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_FLD;
    end
    16'b101_??????_?????_00: // C.FSD 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_FSD;
    end
    16'b001_??????_?????_10: // C.FLDSP 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_FLD;
    end
    16'b101_??????_?????_10: // C.FSDSP 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_FSD;
    end
    //===================================================
    default:
    begin
      decd_sel[`SEL_WIDTH-1:0]   = {`SEL_WIDTH{1'b0}};
      decd_func[`FUNC_WIDTH-1:0] = {`FUNC_WIDTH{1'bx}};
      decd_rd_vld                = 1'b0;
    end
  endcase
// &CombEnd; @248
end

//==========================================================
// Operand Index Decode
//==========================================================
// &CombBeg; @253
always @( decd_inst[15:7]
       or decd_inst[9:0])
begin
  decd_rs1_vld  = 1'b0;
  decd_rs1[4:0] = 5'h0;
  casez({decd_inst[15:13], decd_inst[1:0]})
    5'b01001: // C.LI
    begin
      decd_rs1_vld  = 1'b1;
    end
    5'b01101: // C.ADDI16SP; note: C.LUI included
    begin
      decd_rs1_vld  = 1'b1;
      decd_rs1[4:0] = decd_inst[11:7] == 5'h2 ? 5'h2 : 5'h0;
    end
    5'b00000, // C.ADDI4SPN
    5'b?1110, // C.FLWSP C.FSWSP
    5'b?1010: // C.LWSP C.SWSP
    begin
      decd_rs1_vld  = 1'b1;
      decd_rs1[4:0] = 5'h2;
    end
    5'b?1100, // C.FLW C.FSW
    5'b?1000, // C.LW C.SW
    5'b11?01, // C.BEQZ C.BNEZ
    5'b10001: // C.SRLI C.SRAI C.ANDI C.AND C.OR C.XOR C.SUB
    begin
      decd_rs1_vld  = 1'b1;
      decd_rs1[4:0] = {2'b01, decd_inst[9:7]};
    end
    5'b00001, // C.ADDI 
    5'b00010: // C.SLLI
    begin
      decd_rs1_vld  = 1'b1;
      decd_rs1[4:0] = decd_inst[11:7];
    end
    5'b10010: // C.JR C.JALR C.ADD; C.MOV included
    begin
      decd_rs1_vld  = 1'b1;
      decd_rs1[4:0] = (decd_inst[6:2] != 5'b0 & ~decd_inst[12]) ? 5'b0 : decd_inst[11:7];
    end
    default: 
    begin
      decd_rs1_vld  = 1'b0;
      decd_rs1[4:0] = 5'b0;
    end
  endcase
// &CombEnd; @308
end

// &CombBeg; @310
always @( decd_inst[15:13]
       or decd_inst[11:10]
       or decd_inst[6:0])
begin
  casez({decd_inst[15:13], decd_inst[1:0]})
    5'b11010, // C.SWSP
    5'b10010: // C.MV C.ADD; note: C.JR and C.JALR included 
    begin
      decd_rs2_vld  = 1'b1;
      decd_rs2[4:0] = decd_inst[6:2];
    end
    5'b11000: // C.SW
    begin
      decd_rs2_vld  = 1'b1;
      decd_rs2[4:0] = {2'b01, decd_inst[4:2]};
    end
    5'b10001: // C.AND C.OR C.XOR C.SUB 
    begin
      decd_rs2_vld  = decd_inst[11:10] == 2'b11;
      decd_rs2[4:0] = {2'b01, decd_inst[4:2]};
    end
    5'b11?01: // C.BEQZ C.BNEZ
    begin
      decd_rs2_vld  = 1'b1;
      decd_rs2[4:0] = 5'b0;
    end
    default: 
    begin
      decd_rs2_vld  = 1'b0;
//      decd_rs2[4:0] = {2'b01, decd_inst[4:2]};
      decd_rs2[4:0] = 5'b0;
    end
  endcase
// &CombEnd; @340
end

// &CombBeg; @342
always @( decd_inst[15:13]
       or decd_inst[11:0])
begin
  case({decd_inst[15:13], decd_inst[1:0]})
    5'b01010, // C.LWSP
    5'b01001, // C.LI
    5'b01101, // C.LUI C.ADDI16SP
    5'b00001, // C.ADDI
    5'b00010: // C.SLLI
      decd_rd[4:0] = decd_inst[11:7];
    5'b10010: // C.MV C.ADD; C.JALR; note: C.JR included 
      decd_rd[4:0] = decd_inst[6:2] == 5'b0 ? 5'b1 : decd_inst[11:7];
    5'b00101: // C.JAL
      decd_rd[4:0] = 5'b1;
    5'b10001: // C.AND C.OR C.XOR C.SUB C.SRLI C.SRAI C.ANDI
      decd_rd[4:0] = {2'b01, decd_inst[9:7]};
    5'b01000, // C.LW
    5'b00000: // C.ADDI4SPN
      decd_rd[4:0] = {2'b01, decd_inst[4:2]};
    default : 
      decd_rd[4:0] = decd_inst[11:7];
  endcase
// &CombEnd; @362
end

//==========================================================
// Immediate Generation
//==========================================================
// CI-Type: C.LI C.ADDI C.SLLI C.SRAI C.SRLI C.ANDI
assign citype_imm_vld    = {decd_inst[15:13], decd_inst[1:0]} == 5'b01001
                         | {decd_inst[15:13], decd_inst[1:0]} == 5'b00001
                         | {decd_inst[15:13], decd_inst[1:0]} == 5'b00010
                         | {decd_inst[15:13], decd_inst[1:0]} == 5'b10001
                          & decd_inst[11:10] != 2'b11;
assign citype_imm[31:0]  = {{27{decd_inst[12]}}, decd_inst[6:2]};
// CIS-Type: C.LWSP
assign cistype_imm_vld   = {decd_inst[15:13], decd_inst[1:0]} == 5'b01010;
assign cistype_imm[31:0] = {24'b0, decd_inst[3:2], decd_inst[12], decd_inst[6:4], 2'b0};
// CIL-Type: C.LUI
assign ciltype_imm_vld   = {decd_inst[15:13], decd_inst[1:0]} == 5'b01101
                         &  decd_inst[11:7] != 5'b10;
assign ciltype_imm[31:0] = {{15{decd_inst[12]}}, decd_inst[6:2], 12'b0};
// CIA-Type: C.ADDI16SP
assign ciatype_imm_vld   = {decd_inst[15:13], decd_inst[1:0]} == 5'b01101
                         &  decd_inst[11:7] == 5'b10;
assign ciatype_imm[31:0] = {{23{decd_inst[12]}}, decd_inst[4:3], decd_inst[5], 
                            decd_inst[2], decd_inst[6], 4'b0};
// CIW-Type: C.ADDI4SPN
assign ciwtype_imm_vld   = ~decd_inst_32bit & {decd_inst[15:13], decd_inst[1:0]}
                           == 5'b00000;
assign ciwtype_imm[31:0] = {22'b0, decd_inst[10:7], decd_inst[12:11], decd_inst[5],
                            decd_inst[6], 2'b0};
// CL-Type: C.LW C.SW
assign cltype_imm_vld    = {decd_inst[15:13], decd_inst[1:0]} == 5'b01000 
                         | {decd_inst[15:13], decd_inst[1:0]} == 5'b11000;
assign cltype_imm[31:0]  = {25'b0, decd_inst[5], decd_inst[12:10], decd_inst[6], 2'b0};
// CSS-Type: C.SWSP
assign csstype_imm_vld   = {decd_inst[15:13], decd_inst[1:0]} == 5'b11010;
assign csstype_imm[31:0] = {24'b0, decd_inst[8:7], decd_inst[12:9], 2'b0};
// CB-Type: C.BEQZ C.BNEZ
assign cbtype_imm_vld    = {decd_inst[15:13], decd_inst[1:0]} == 5'b11001 
                         | {decd_inst[15:13], decd_inst[1:0]} == 5'b11101;
assign cbtype_imm[31:0]  = {{24{decd_inst[12]}}, decd_inst[6:5], decd_inst[2],
                               decd_inst[11:10], decd_inst[4:3], 1'b0}; 
// CJ-Type: C.J C.JAL
assign cjtype_imm_vld    = {decd_inst[14:13], decd_inst[1:0]} == 4'b0101;
assign cjtype_imm[31:0]  = {{21{decd_inst[12]}}, decd_inst[8], decd_inst[10:9], 
                           decd_inst[6], decd_inst[7], decd_inst[2], decd_inst[11],
                           decd_inst[5:3], 1'b0};

// Common IMM1
assign decd_imm1_vld   = citype_imm_vld | ciltype_imm_vld | ciatype_imm_vld | ciwtype_imm_vld;
assign decd_imm1[31:0] = {32{citype_imm_vld}}  & citype_imm[31:0]
                       | {32{ciltype_imm_vld}} & ciltype_imm[31:0]
                       | {32{ciatype_imm_vld}} & ciatype_imm[31:0]
                       | {32{ciwtype_imm_vld}} & ciwtype_imm[31:0];

// Branch IMM2
assign decd_imm2_vld   = cistype_imm_vld | cltype_imm_vld | csstype_imm_vld
                       | cbtype_imm_vld | cjtype_imm_vld;
assign decd_imm2[31:0] = {32{cistype_imm_vld}} & cistype_imm[31:0]
                       | {32{cltype_imm_vld}}  & cltype_imm[31:0]
                       | {32{csstype_imm_vld}} & csstype_imm[31:0]
                       | {32{cbtype_imm_vld}}  & cbtype_imm[31:0]
                       | {32{cjtype_imm_vld}}  & cjtype_imm[31:0];

//==========================================================
//               ILLEGAL INST
//==========================================================
// the illegal inst
// RV32C Insts
// &CombBeg; @430
always @( decd_inst[15:0]
       or decd_rd[4:0])
begin
  casez({decd_inst[12:10], decd_inst[15:13], decd_inst[1:0]})
    8'b???00000:  // C.ADDI4SPN
    begin
      decd_ill_expt = decd_inst[12:5] == 8'b0;
    end
    8'b???01101:  // C.LUI C.ADDI16SP
    begin
      decd_ill_expt = {decd_inst[12], decd_inst[6:2]} == 6'b0;
    end
    8'b?0?10001,  // C.SRLI C.SRAI
    8'b???00010:  // C.SLLI
    begin
      decd_ill_expt = decd_inst[12];
    end
    8'b???01010:  // C.LWSP
    begin
      decd_ill_expt = decd_rd[4:0] == 5'b0;
    end
    8'b0??10010:  // C.JR
    begin
      decd_ill_expt = decd_inst[11:2] == 10'b0;
    end
    8'b???01000,  // C.LW
    8'b???11000,  // C.SW
    8'b???00001,  // C.ADDI C.NOP
    8'b???00101,  // C.JAL
    8'b???01001,  // C.LI
    8'b?1010001,  // C.ANDI
    8'b?1110001,  // C.AND C.OR C.XOR C.SUB
    8'b???10101,  // C.J
    8'b???11001,  // C.BEQZ
    8'b???11101,  // C.BNEZ
    8'b1??10010,  // C.JALR C.MV C.ADD C.EBREAK
    8'b???11010:  // C.SWSP
    begin
      decd_ill_expt = 1'b0; 
    end
    default:
    begin          
      decd_ill_expt = 1'b1;
    end
  endcase
// &CombEnd; @473
end

//==========================================================
//     Rename output decoded information for merge
//==========================================================
assign decd_rv32c_op_vld                = ~decd_inst_32bit;
assign decd_rv32c_sel[`SEL_WIDTH-1:0]   = decd_sel[`SEL_WIDTH-1:0];
assign decd_rv32c_func[`FUNC_WIDTH-1:0] = decd_func[`FUNC_WIDTH-1:0];

assign decd_rv32c_rs1_vld               = decd_rs1_vld;
assign decd_rv32c_rs1[4:0]              = decd_rs1[4:0];
assign decd_rv32c_rs2_vld               = decd_rs2_vld;
assign decd_rv32c_rs2[4:0]              = decd_rs2[4:0];
assign decd_rv32c_rd_vld                = decd_rd_vld;
assign decd_rv32c_rd[4:0]               = decd_rd[4:0];

assign decd_rv32c_imm1_vld              = decd_imm1_vld;
assign decd_rv32c_imm1[31:0]            = decd_imm1[31:0];
assign decd_rv32c_imm2_vld              = decd_imm2_vld;
assign decd_rv32c_imm2[31:0]            = decd_imm2[31:0];

assign decd_rv32c_ill_expt              = decd_ill_expt;

// &ModuleEnd; @496
endmodule


