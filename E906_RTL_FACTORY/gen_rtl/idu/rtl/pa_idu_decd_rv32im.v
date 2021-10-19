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
module pa_idu_decd_rv32im(
  decd_func3,
  decd_func7,
  decd_inst,
  decd_op,
  decd_rv32im_func,
  decd_rv32im_imm1,
  decd_rv32im_imm1_vld,
  decd_rv32im_imm2,
  decd_rv32im_imm2_vld,
  decd_rv32im_rd_vld,
  decd_rv32im_rs1,
  decd_rv32im_rs1_vld,
  decd_rv32im_rs2_vld,
  decd_rv32im_sel
);

// &Ports; @28
input   [2 :0]  decd_func3;          
input   [6 :0]  decd_func7;          
input   [31:0]  decd_inst;           
input   [6 :0]  decd_op;             
output  [19:0]  decd_rv32im_func;    
output  [31:0]  decd_rv32im_imm1;    
output          decd_rv32im_imm1_vld; 
output  [31:0]  decd_rv32im_imm2;    
output          decd_rv32im_imm2_vld; 
output          decd_rv32im_rd_vld;  
output  [4 :0]  decd_rv32im_rs1;     
output          decd_rv32im_rs1_vld; 
output          decd_rv32im_rs2_vld; 
output  [5 :0]  decd_rv32im_sel;     

// &Regs; @29
reg     [19:0]  decd_atm_func;       
reg     [19:0]  decd_func;           
reg             decd_rd_vld;         
reg     [5 :0]  decd_sel;            

// &Wires; @30
wire            auipc_imm_vld;       
wire    [31:0]  btype_imm;           
wire            btype_imm_vld;       
wire    [2 :0]  decd_func3;          
wire    [6 :0]  decd_func7;          
wire    [31:0]  decd_imm1;           
wire            decd_imm1_vld;       
wire    [31:0]  decd_imm2;           
wire            decd_imm2_vld;       
wire    [31:0]  decd_inst;           
wire    [6 :0]  decd_op;             
wire    [4 :0]  decd_rs1;            
wire            decd_rs1_vld;        
wire            decd_rs2_vld;        
wire    [19:0]  decd_rv32im_func;    
wire    [31:0]  decd_rv32im_imm1;    
wire            decd_rv32im_imm1_vld; 
wire    [31:0]  decd_rv32im_imm2;    
wire            decd_rv32im_imm2_vld; 
wire            decd_rv32im_rd_vld;  
wire    [4 :0]  decd_rv32im_rs1;     
wire            decd_rv32im_rs1_vld; 
wire            decd_rv32im_rs2_vld; 
wire    [5 :0]  decd_rv32im_sel;     
wire    [31:0]  itype_imm;           
wire            itype_imm_vld;       
wire            jalr_imm_vld;        
wire    [31:0]  jtype_imm;           
wire            jtype_imm_vld;       
wire            load_imm_vld;        
wire    [31:0]  stype_imm;           
wire            stype_imm_vld;       
wire    [31:0]  utype_imm;           
wire            utype_imm_vld;       


// &Force("bus", "decd_inst", 31, 0); @32
//==========================================================
//           Decoder for RV32IM Instructions
//==========================================================
// Reliazed Packages: RV32I/M/Zicsr -- Version 2.1
//---------------------------------------------------
// RV32I: 
//--------------------------
// |  ALU  20 Instructions |
// | ADDER | SHIFT | LOGIC |
// |   8   |   6   |   6   |
//--------------------------
//---------------------------------------------------
// RV32M
// | 8 Instructions|
// |  MUL  |  DIV  |
// |   4   |   4   |
//---------------------------------------------------
// RV32A
// | 9 Instructions|
// |  AMO  | LR/SC |
// |   7   |   2   |
//---------------------------------------------------
// &CombBeg; @55
always @( decd_func3[2:0]
       or decd_inst[20:15]
       or decd_op[6:0]
       or decd_func7[6:0]
       or decd_atm_func[19:0])
begin
  decd_sel[`SEL_WIDTH-1:0]   = {`SEL_WIDTH{1'b0}};
  decd_func[`FUNC_WIDTH-1:0] = {`FUNC_WIDTH{1'b0}};
  decd_rd_vld                = 1'b0;
  casez({decd_func7[6:0], decd_func3[2:0], decd_op[6:0]})
    //===================================================
    // ALU Decoder
    //---------------------------------------------------
    // ADDER: 8 RV32I insts
    17'b?0????00000110011: // ADD
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_ADD;
      decd_rd_vld                = 1'b1;
    end
    17'b???????0000010011: // ADDI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_ADD;
      decd_rd_vld                = 1'b1;
    end
    17'b??????????0110111: // LUI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_ADD;
      decd_rd_vld                = 1'b1;
    end
    17'b?1?????0000110011: // SUB
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SUB;
      decd_rd_vld                = 1'b1;
    end
    17'b???????0100010011: // SLTI 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SLT;
      decd_rd_vld                = 1'b1;
    end
    17'b??????00100110011: // SLT
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SLT;
      decd_rd_vld                = 1'b1;
    end
    17'b??????00110110011: // SLTU
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_LTU;
      decd_rd_vld                = 1'b1;
    end
    17'b???????0110010011: // SLTIU 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_LTU;
      decd_rd_vld                = 1'b1;
    end
    //---------------------------------------------------
    // SHIFT: 6 RV32I insts
    17'b??????00010110011: // SLL
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SLL;
      decd_rd_vld                = 1'b1;
    end
    17'b???????0010010011: // SLLI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SLL;
      decd_rd_vld                = 1'b1;
    end
    17'b?0????01010110011: // SRL
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SRL;
      decd_rd_vld                = 1'b1;
    end
    17'b?0?????1010010011: // SRLI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SRL;
      decd_rd_vld                = 1'b1;
    end
    17'b?1?????1010110011: // SRA
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SRA;
      decd_rd_vld                = 1'b1;
    end
    17'b?1?????1010010011: // SRAI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SRA;
      decd_rd_vld                = 1'b1;
    end
    //---------------------------------------------------
    // LOGIC: 6 RV32I insts
    17'b??????01110110011: // AND 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_AND;
      decd_rd_vld                = 1'b1;
    end
    17'b??????01100110011: // OR
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_OR;
      decd_rd_vld                = 1'b1;
    end
    17'b??????01000110011: // XOR
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_XOR;
      decd_rd_vld                = 1'b1;
    end
    17'b???????1110010011: // ANDI 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_AND;
      decd_rd_vld                = 1'b1;
    end
    17'b???????1100010011: // ORI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_OR;
      decd_rd_vld                = 1'b1;
    end
    17'b???????1000010011: // XORI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_XOR;
      decd_rd_vld                = 1'b1;
    end
    //===================================================
    // BJU Decoder
    //---------------------------------------------------
    // BJU: 9 RV32I insts
    17'b??????????0010111: // AUIPC
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_AUIPC;
      decd_rd_vld                = 1'b1;
    end
    17'b??????????1101111: // JAL 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_JAL;
      decd_rd_vld                = 1'b1;
    end
    17'b??????????1100111: // JALR
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_JALR;
      decd_rd_vld                = 1'b1;
    end
    17'b???????0001100011: // BEQ
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_BEQ;
    end
    17'b???????0011100011: // BNE
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_BNE;
    end
    17'b???????1001100011: // BLT
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_BLT;
    end
    17'b???????1011100011: // BGE
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_BGE;
    end
    17'b???????1101100011: // BLTU
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_BLTU;
    end
    17'b???????1111100011: // BGEU
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_BJU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_BGEU;
    end
    //===================================================
    // LSU Decoder
    //---------------------------------------------------
    // LSU: 8 RV32I insts
    17'b???????0000000011: // LB 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_LB;
      decd_rd_vld                = 1'b1;
    end
    17'b???????0010000011: // LH 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_LH;
      decd_rd_vld                = 1'b1;
    end
    17'b???????0100000011: // LW 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_LW;
      decd_rd_vld                = 1'b1;
    end
    17'b???????1000000011: // LBU 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_LBU;
      decd_rd_vld                = 1'b1;
    end
    17'b???????1010000011: // LHU 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_LHU;
      decd_rd_vld                = 1'b1;
    end
    17'b???????0000100011: // SB 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SB;
    end
    17'b???????0010100011: // SH 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SH;
    end
    17'b???????0100100011: // SW 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SW;
    end
    17'b???????0100101111: // LR.W/SC.W/AMO
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = decd_atm_func[`FUNC_WIDTH-1:0];
      decd_rd_vld                = 1'b1;
    end

    //===================================================
    // CP0 Decoder
    //---------------------------------------------------
    // CP0 6 CSR insts, 2 Fence insts, 5 Special insts
    17'b???????0011110011: // CSRRW
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_CSRRW;
      decd_rd_vld                = 1'b1;
    end
    17'b???????0101110011: // CSRRS
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_func[`FUNC_WIDTH-1:0] = decd_inst[19:15] == 5'b0 ? `FUNC_CSRR : `FUNC_CSRRS;
      decd_rd_vld                = 1'b1;
    end
    17'b???????0111110011: // CSRRC
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_func[`FUNC_WIDTH-1:0] = decd_inst[19:15] == 5'b0 ? `FUNC_CSRR : `FUNC_CSRRC;
      decd_rd_vld                = 1'b1;
    end
    17'b???????1011110011: // CSRRWI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_CSRRW;
      decd_rd_vld                = 1'b1;
    end
    17'b???????1101110011: // CSRRSI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_func[`FUNC_WIDTH-1:0] = decd_inst[19:15] == 5'b0 ? `FUNC_CSRR : `FUNC_CSRRS;
      decd_rd_vld                = 1'b1;
    end
    17'b???????1111110011: // CSRRCI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_func[`FUNC_WIDTH-1:0] = decd_inst[19:15] == 5'b0 ? `FUNC_CSRR : `FUNC_CSRRC;
      decd_rd_vld                = 1'b1;
    end
    17'b???????0000001111: // FENCE
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_FENCE;
    end
    17'b???????0010001111: // FENCE.I
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_FENCI;
    end
    17'b??00???0001110011: // ECALL EBREAK
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_func[`FUNC_WIDTH-1:0] = decd_inst[20] ? `FUNC_EBREAK: `FUNC_ECALL;
    end
    17'b??01???0001110011: // WFI
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_WFI;
    end
    17'b00110000001110011: // MRET
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_MRET;
    end
    17'b01111010001110011: // DRET
    begin
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_DRET;
    end
    //===================================================
    // MUL Decoder
    //---------------------------------------------------
    // MUL: 4 RV32M insts
    17'b?0????10000110011: // MULT
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_MUL;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_MULT;
      decd_rd_vld                = 1'b1;
    end
    17'b?0????10010110011: // MULH
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_MUL;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_MULH;
      decd_rd_vld                = 1'b1;
    end
    17'b?0????10100110011: // MULHSU
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_MUL;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_MULHSU;
      decd_rd_vld                = 1'b1;
    end
    17'b?0????10110110011: // MULHU
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_MUL;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_MULHU;
      decd_rd_vld                = 1'b1;
    end
    //===================================================
    // DIV Decoder
    //---------------------------------------------------
    // DIV: 4 RV32M insts
    17'b?0????11000110011: // DIVS
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_DIV;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_DIVS;
      decd_rd_vld                = 1'b1;
    end
    17'b?0????11010110011: // DIVU
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_DIV;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_DIVU;
      decd_rd_vld                = 1'b1;
    end
    17'b?0????11100110011: // REMS
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_DIV;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_REMS;
      decd_rd_vld                = 1'b1;
    end
    17'b?0????11110110011: // REMU
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_DIV;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_REMU;
      decd_rd_vld                = 1'b1;
    end
    //===================================================
    default:
    begin
      decd_sel[`SEL_WIDTH-1:0]   = {`SEL_WIDTH{1'b0}};
      decd_func[`FUNC_WIDTH-1:0] = {`FUNC_WIDTH{1'bx}};
      decd_rd_vld                = 1'b0;
    end
  endcase
// &CombEnd; @432
end

// &CombBeg; @434
always @( decd_inst[31:27])
begin
case(decd_inst[31:27])
  5'b00010: decd_atm_func[`FUNC_WIDTH-1:0] = `FUNC_LR;
  5'b00011: decd_atm_func[`FUNC_WIDTH-1:0] = `FUNC_SC;
  default:  decd_atm_func[`FUNC_WIDTH-1:0] = `FUNC_AMO;
endcase
// &CombEnd; @440
end

//assign decd_op_vld = decd_op[6:0] == 7'b01101_11  // LUI
//                   | decd_op[6:0] == 7'b00101_11  // AUIPC
//                   | decd_op[6:0] == 7'b11011_11  // JAL
//                   | decd_op[6:0] == 7'b11001_11  // JALR
//                   | decd_op[6:0] == 7'b11000_11  // B-Type
//                   | decd_op[6:0] == 7'b00000_11  // I-Type
//                   | decd_op[6:0] == 7'b01000_11  // S-Type
//                   | decd_op[6:0] == 7'b01100_11; // R-Type

//==========================================================
// Operand Index Decode
//==========================================================
assign decd_rs1_vld  = decd_op[6:2] != 5'b00101  // AUIPC
                     & decd_op[6:2] != 5'b11011; // JAL
assign decd_rs1[4:0] = {5{~utype_imm_vld}} & decd_inst[19:15];

assign decd_rs2_vld  = decd_op[6:2] == 5'b01100  // R-Type
                     | decd_op[6:2] == 5'b01000  // S-Type
                     | decd_op[6:2] == 5'b11000  // B-Type
                     | decd_op[6:2] == 5'b01011; // AMO-Type

//==========================================================
// Immediate Generation
//==========================================================
// I-Type: Load Arth-Imm CSR JALR
assign load_imm_vld    = decd_inst[6:2] == 5'b00000;
assign itype_imm_vld   = decd_inst[6:2] == 5'b00100
                       | decd_inst[6:2] == 5'b11100;
assign jalr_imm_vld    = decd_inst[6:2] == 5'b11001;
assign itype_imm[31:0] = {{21{decd_inst[31]}}, decd_inst[30:20]};

// S-Type: Store
assign stype_imm_vld   = decd_inst[6:2] == 5'b01000; 
assign stype_imm[31:0] = {{21{decd_inst[31]}}, decd_inst[30:25], decd_inst[11:7]}; 

// B-Type: BEQ BNE BLT BGE BLTU BGEU
assign btype_imm_vld   = decd_inst[6:2] == 5'b11000;
assign btype_imm[31:0] = {{20{decd_inst[31]}}, decd_inst[7], decd_inst[30:25], 
                         decd_inst[11:8], 1'b0};

// U-Type: LUI AUIPC
assign utype_imm_vld   = decd_inst[6:2] == 5'b01101;
assign auipc_imm_vld   = decd_inst[6:2] == 5'b00101;
assign utype_imm[31:0] = {decd_inst[31:12], 12'b0};

// J-Type: JAL
assign jtype_imm_vld   = decd_inst[6:2] == 5'b11011;
assign jtype_imm[31:0] = {{12{decd_inst[31]}}, decd_inst[19:12], decd_inst[20], 
                         decd_inst[30:21], 1'b0};
// Common IMM1
assign decd_imm1_vld   = itype_imm_vld | utype_imm_vld;
assign decd_imm1[31:0] = {32{itype_imm_vld}} & itype_imm[31:0]
                       | {32{utype_imm_vld}} & utype_imm[31:0];

// BJU and LSU IMM2
assign decd_imm2_vld   = load_imm_vld | stype_imm_vld
                       | jalr_imm_vld  | btype_imm_vld 
                       | auipc_imm_vld | jtype_imm_vld;
assign decd_imm2[31:0] = {32{load_imm_vld}}  & itype_imm[31:0]
                       | {32{stype_imm_vld}} & stype_imm[31:0]
                       | {32{jalr_imm_vld}}  & itype_imm[31:0]
                       | {32{btype_imm_vld}} & btype_imm[31:0]
                       | {32{auipc_imm_vld}} & utype_imm[31:0]
                       | {32{jtype_imm_vld}} & jtype_imm[31:0];

//==========================================================
//     Rename output decoded information for merge
//==========================================================
//assign decd_rv32im_op_vld               = decd_op_vld;
assign decd_rv32im_sel[`SEL_WIDTH-1:0]   = decd_sel[`SEL_WIDTH-1:0];
assign decd_rv32im_func[`FUNC_WIDTH-1:0] = decd_func[`FUNC_WIDTH-1:0];

assign decd_rv32im_rs1_vld               = decd_rs1_vld;
assign decd_rv32im_rs1[4:0]              = decd_rs1[4:0];
assign decd_rv32im_rs2_vld               = decd_rs2_vld;
assign decd_rv32im_rd_vld                = decd_rd_vld;

assign decd_rv32im_imm1_vld              = decd_imm1_vld;
assign decd_rv32im_imm1[31:0]            = decd_imm1[31:0];
assign decd_rv32im_imm2_vld              = decd_imm2_vld;
assign decd_rv32im_imm2[31:0]            = decd_imm2[31:0];

// &ModuleEnd; @524
endmodule


