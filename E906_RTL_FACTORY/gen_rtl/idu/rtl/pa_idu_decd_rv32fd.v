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
module pa_idu_decd_rv32fd(
  decd_inst,
  decd_op,
  decd_rv32fd_func,
  decd_rv32fd_op_vld,
  decd_rv32fd_sel
);

// &Ports; @28
input   [31:0]  decd_inst;         
input   [6 :0]  decd_op;           
output  [19:0]  decd_rv32fd_func;  
output          decd_rv32fd_op_vld; 
output  [5 :0]  decd_rv32fd_sel;   

// &Regs; @29
reg     [19:0]  decd_func;         
reg     [5 :0]  decd_sel;          

// &Wires; @30
wire    [31:0]  decd_inst;         
wire    [6 :0]  decd_op;           
wire    [19:0]  decd_rv32fd_func;  
wire            decd_rv32fd_op_vld; 
wire    [5 :0]  decd_rv32fd_sel;   


// &Force("bus", "decd_inst", 31, 0); @32
//==========================================================
//                Define the operation type and funtion
//==========================================================
//==========================================================
//              Decoder for FPU Instructions
//==========================================================
// main decoder produces operation information, operand 
// information and oper prepare information,
// all values are defined by parameter.
// Reliazed Packages: RV32F/D--2.1 
// Decoder is divided into three parts:
// 1. FLSU Insts
// 2. FPU Normal Insts
// 3. FPU MADD/MSUB Insts
//==========================================================
// &CombBeg; @48
always @( decd_op[6:0]
       or decd_inst[15:12])
begin
  decd_sel[`SEL_WIDTH-1:0]   = {`SEL_WIDTH{1'b0}};
  decd_func[`FUNC_WIDTH-1:0] = {`FUNC_WIDTH{1'b0}};
  //decd_rs1_vld              = 1'b1;
  //decd_rs1[4:0]             = 1'b1;
  //decd_frs2_vld             = 1'b0;
  //decd_imm2_vld             = 1'b1;
  //decd_dst_vld              = 1'b0;
  casez({decd_inst[15:12], decd_op[6:0]})
    //======================================================
    //               FP LSU Inst Decoder
    //======================================================
    //11'b011??????00: // C.FLW 
    //begin  
    //  decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
    //  decd_func[`FUNC_WIDTH-1:0] = `FUNC_LW;
    //end
    //11'b111??????00: // C.FSW 
    //begin  
    //  decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
    //  decd_func[`FUNC_WIDTH-1:0] = `FUNC_SW;
    //end
    //11'b011??????10: // C.FLWSP 
    //begin  
    //  decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
    //  decd_func[`FUNC_WIDTH-1:0] = `FUNC_LW;
    //end
    //11'b111??????10: // C.FSWSP 
    //begin  
    //  decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
    //  decd_func[`FUNC_WIDTH-1:0] = `FUNC_SW;
    //end

    11'b?0100000111: // FLW 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_LW;
    end
    11'b?0100100111: // FSW 
    begin  
      decd_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_func[`FUNC_WIDTH-1:0] = `FUNC_SW;
    end
    default:
    begin
      decd_sel[`SEL_WIDTH-1:0]   = {`SEL_WIDTH{1'b0}};
      decd_func[`FUNC_WIDTH-1:0] = {`FUNC_WIDTH{1'bx}};
    end
  endcase
// &CombEnd; @129
end

//==========================================================
// Operand Index Decode
//==========================================================

//==========================================================
// Immediate Generation
//==========================================================

//==========================================================
//               ILLEGAL INST
//==========================================================

//==========================================================
//     Rename output decoded information for IDU modules
//==========================================================
assign decd_rv32fd_op_vld                = decd_op[6:0] == 7'b0000111
                                         | decd_op[6:0] == 7'b0100111;
assign decd_rv32fd_sel[`SEL_WIDTH-1:0]   = decd_sel[`SEL_WIDTH-1:0];
assign decd_rv32fd_func[`FUNC_WIDTH-1:0] = decd_func[`FUNC_WIDTH-1:0];

// &ModuleEnd; @151
endmodule


