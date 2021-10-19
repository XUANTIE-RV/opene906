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

// &ModuleBeg; @26
module pa_idu_decd_fp(
  cp0_idu_fs,
  cp0_idu_rm,
  decd_fp_fpr_rd,
  decd_fp_fpr_rd_vld,
  decd_fp_fpr_rs1,
  decd_fp_fpr_rs1_vld,
  decd_fp_fpr_rs2,
  decd_fp_fpr_rs2_vld,
  decd_fp_fpr_rs3,
  decd_fp_fpr_rs3_vld,
  decd_fp_id_dp_func,
  decd_fp_id_fp_dst_idx,
  decd_fp_id_fp_dst_vld,
  decd_fp_id_fp_inst_vld,
  decd_fp_id_fp_lsu_sel,
  decd_fp_id_fp_rs1_idx,
  decd_fp_id_fp_rs1_vld,
  decd_fp_id_fp_rs2_idx,
  decd_fp_id_fp_rs2_vld,
  decd_fp_id_fp_rs3_idx,
  decd_fp_id_fp_rs3_vld,
  decd_fp_id_fp_unit_sel,
  decd_fp_id_rm,
  fdecd_ctrl_dst_idx,
  fdecd_ctrl_dst_vld,
  fdecd_ctrl_fls,
  fdecd_ctrl_fp_inst_vld,
  fdecd_ctrl_int_dst_vld,
  fdecd_decd_fp_inst_vld,
  fdecd_decd_ill_expt,
  fdecd_decd_imm,
  fdecd_decd_imm_vld,
  fdecd_decd_rd_int_vld,
  fdecd_decd_rs1_int_vld,
  fdecd_dp_rs1_int_vld,
  fdecd_dp_rs2_idx,
  fdecd_dp_rs2_vld,
  hs_fdecd_dp_vld,
  ifu_idu_id_inst,
  ifu_idu_id_inst_vld
);

// &Ports; @27
input   [1 :0]  cp0_idu_fs;                 
input   [2 :0]  cp0_idu_rm;                 
input           hs_fdecd_dp_vld;            
input   [31:0]  ifu_idu_id_inst;            
input           ifu_idu_id_inst_vld;        
output  [4 :0]  decd_fp_fpr_rd;             
output          decd_fp_fpr_rd_vld;         
output  [4 :0]  decd_fp_fpr_rs1;            
output          decd_fp_fpr_rs1_vld;        
output  [4 :0]  decd_fp_fpr_rs2;            
output          decd_fp_fpr_rs2_vld;        
output  [4 :0]  decd_fp_fpr_rs3;            
output          decd_fp_fpr_rs3_vld;        
output  [9 :0]  decd_fp_id_dp_func;         
output  [4 :0]  decd_fp_id_fp_dst_idx;      
output          decd_fp_id_fp_dst_vld;      
output          decd_fp_id_fp_inst_vld;     
output          decd_fp_id_fp_lsu_sel;      
output  [4 :0]  decd_fp_id_fp_rs1_idx;      
output          decd_fp_id_fp_rs1_vld;      
output  [4 :0]  decd_fp_id_fp_rs2_idx;      
output          decd_fp_id_fp_rs2_vld;      
output  [4 :0]  decd_fp_id_fp_rs3_idx;      
output          decd_fp_id_fp_rs3_vld;      
output  [2 :0]  decd_fp_id_fp_unit_sel;     
output  [2 :0]  decd_fp_id_rm;              
output  [5 :0]  fdecd_ctrl_dst_idx;         
output          fdecd_ctrl_dst_vld;         
output          fdecd_ctrl_fls;             
output          fdecd_ctrl_fp_inst_vld;     
output          fdecd_ctrl_int_dst_vld;     
output          fdecd_decd_fp_inst_vld;     
output          fdecd_decd_ill_expt;        
output  [31:0]  fdecd_decd_imm;             
output          fdecd_decd_imm_vld;         
output          fdecd_decd_rd_int_vld;      
output          fdecd_decd_rs1_int_vld;     
output          fdecd_dp_rs1_int_vld;       
output  [5 :0]  fdecd_dp_rs2_idx;           
output          fdecd_dp_rs2_vld;           

// &Regs; @28
reg             fdecd_fpu_vld;              
reg     [7 :0]  fdecd_func;                 
reg             fdecd_int_dst_vld;          
reg             fdecd_rs1_int;              
reg             fdecd_rs1_vld;              
reg             fdecd_rs2_vld;              
reg     [2 :0]  fdecd_sel;                  

// &Wires; @29
wire    [1 :0]  cp0_idu_fs;                 
wire    [2 :0]  cp0_idu_rm;                 
wire    [4 :0]  decd_fp_fpr_rd;             
wire            decd_fp_fpr_rd_vld;         
wire    [4 :0]  decd_fp_fpr_rs1;            
wire            decd_fp_fpr_rs1_vld;        
wire    [4 :0]  decd_fp_fpr_rs2;            
wire            decd_fp_fpr_rs2_vld;        
wire    [4 :0]  decd_fp_fpr_rs3;            
wire            decd_fp_fpr_rs3_vld;        
wire    [9 :0]  decd_fp_id_dp_func;         
wire    [4 :0]  decd_fp_id_fp_dst_idx;      
wire            decd_fp_id_fp_dst_vld;      
wire            decd_fp_id_fp_inst_vld;     
wire            decd_fp_id_fp_lsu_sel;      
wire    [4 :0]  decd_fp_id_fp_rs1_idx;      
wire            decd_fp_id_fp_rs1_vld;      
wire    [4 :0]  decd_fp_id_fp_rs2_idx;      
wire            decd_fp_id_fp_rs2_vld;      
wire    [4 :0]  decd_fp_id_fp_rs3_idx;      
wire            decd_fp_id_fp_rs3_vld;      
wire    [2 :0]  decd_fp_id_fp_unit_sel;     
wire    [2 :0]  decd_fp_id_rm;              
wire            fdecd_cfld_vld;             
wire    [31:0]  fdecd_cfldsp_imm;           
wire            fdecd_cfldsp_vld;           
wire    [31:0]  fdecd_cfls_imm;             
wire    [31:0]  fdecd_cflsd_imm;            
wire            fdecd_cflw_vld;             
wire    [31:0]  fdecd_cflwsp_imm;           
wire            fdecd_cflwsp_vld;           
wire            fdecd_cfsd_vld;             
wire    [31:0]  fdecd_cfsdsp_imm;           
wire            fdecd_cfsdsp_vld;           
wire            fdecd_cfst_vld;             
wire            fdecd_cfsw_vld;             
wire    [31:0]  fdecd_cfswsp_imm;           
wire            fdecd_cfswsp_vld;           
wire    [5 :0]  fdecd_ctrl_dst_idx;         
wire            fdecd_ctrl_dst_vld;         
wire            fdecd_ctrl_fls;             
wire            fdecd_ctrl_fp_inst_vld;     
wire            fdecd_ctrl_int_dst_vld;     
wire            fdecd_decd_fp_inst_vld;     
wire            fdecd_decd_ill_expt;        
wire    [31:0]  fdecd_decd_imm;             
wire            fdecd_decd_imm_vld;         
wire            fdecd_decd_rd_int_vld;      
wire            fdecd_decd_rs1_int_vld;     
wire            fdecd_dp_rs1_int_vld;       
wire    [5 :0]  fdecd_dp_rs2_idx;           
wire            fdecd_dp_rs2_vld;           
wire            fdecd_dst_vld;              
wire    [31:0]  fdecd_fl_imm;               
wire            fdecd_fld_vld;              
wire    [31:0]  fdecd_fls_imm;              
wire    [4 :0]  fdecd_fls_rs2;              
wire            fdecd_fls_vld;              
wire            fdecd_flw_vld;              
wire    [1 :0]  fdecd_fmt;                  
wire    [1 :0]  fdecd_fmt_fin;              
wire            fdecd_fmt_swap;             
wire            fdecd_fpu_dp_vld;           
wire    [31:0]  fdecd_fs_imm;               
wire            fdecd_fsd_vld;              
wire            fdecd_fsw_vld;              
wire    [4 :0]  fdecd_func5;                
wire            fdecd_ill_expt;             
wire    [31:0]  fdecd_inst;                 
wire            fdecd_ld_vld;               
wire    [6 :0]  fdecd_op;                   
wire    [4 :0]  fdecd_rd;                   
wire    [4 :0]  fdecd_rd_fin;               
wire            fdecd_rd_reuse;             
wire    [2 :0]  fdecd_rm;                   
wire    [4 :0]  fdecd_rs1;                  
wire    [4 :0]  fdecd_rs1_fin;              
wire    [4 :0]  fdecd_rs2;                  
wire    [4 :0]  fdecd_rs2_fin;              
wire    [4 :0]  fdecd_rs3;                  
wire            fdecd_rs3_vld;              
wire            fdecd_rs_vld;               
wire            fdecd_st_vld;               
wire            fp_dynamic_rounding_illegal; 
wire            fp_fs_illegal;              
wire            fp_rm_illegal;              
wire            fp_static_rounding_illegal; 
wire            hs_fdecd_dp_vld;            
wire    [31:0]  ifu_idu_id_inst;            
wire            ifu_idu_id_inst_vld;        


//==========================================================
//                Define the operation type and funtion
//==========================================================
//--------------------parameter width define---------------
// following defines data width of decoded information
parameter SEL_WIDTH  = 3;
parameter FUNC_WIDTH = 8;

//--------------------Inst Unit define--------------
parameter FALU = 3'b001;
parameter FMAU = 3'b010;
parameter FDSU = 3'b100;

//--------------------Inst Precision define---------
parameter FP = 2'b01;
parameter DP = 2'b10;

//--------------------FALU FUNC define---------------
// value definition of decd_func in FALU
// FADD
parameter FADD = 8'b1001_0001;
parameter FSUB = 8'b1000_1001;
parameter FMAX = 8'b0011_0001;
parameter FMIN = 8'b0010_1001;
parameter FLT  = 8'b0100_1001;
parameter FLE  = 8'b0101_0001;
parameter FEQ  = 8'b0100_0001;
// FCNVT
parameter FCVT_F_F  = 8'b1000_0010;
parameter FCVT_W_F  = 8'b0100_0010;
parameter FCVT_WU_F = 8'b0010_0010;
parameter FCVT_F_W  = 8'b0001_0010;
parameter FCVT_F_WU = 8'b0000_1010;
//FSPU
parameter FMV_X_W  = 8'b0010_1100;
parameter FMV_X_HW = 8'b1001_0100;
parameter FMV_W_X  = 8'b1000_1100;
parameter FMV_HW_X = 8'b1000_0100;
parameter FSGNJ    = 8'b0100_1100;
parameter FSGNJN   = 8'b0100_0100;
parameter FSGNJX   = 8'b0101_0100;
parameter FCLASS   = 8'b0011_0100;

//--------------------FMAU FUNC define---------------
// value definition of decd_func in FMAU
parameter FMUL   = 8'b0000_0000;
parameter FMADD  = 8'b0000_0001;
parameter FMSUB  = 8'b0000_0011;
parameter FNMSUB = 8'b0000_0111;
parameter FNMADD = 8'b0000_0101;

//--------------------FDSU FUNC define---------------
// value definition of decd_func in FDSU
parameter FSQRT  = 8'b0000_0001;
parameter FDIV   = 8'b0000_0010;

//==========================================================
//                      Decoder Input
//==========================================================
// Note: for power consideration, the inst is divided into
// 32/16-bit insts first; if timing is critical, the opcode
// can be release for 1-2 gate timing

// Opcode, Rounding-mode, Format and Func5
assign fdecd_inst[31:0] = ifu_idu_id_inst[31:0];
assign fdecd_op[6:0]    = fdecd_inst[6:0];
assign fdecd_rm[2:0]    = fdecd_inst[14:12];
assign fdecd_fmt[1:0]   = {fdecd_inst[26:25] == 2'b0, fdecd_inst[26:25] == 2'b1};
assign fdecd_func5[4:0] = fdecd_inst[31:27];

assign fdecd_rd[4:0]    = fdecd_inst[11:7];
assign fdecd_rs1[4:0]   = fdecd_inst[19:15];
assign fdecd_rs2[4:0]   = fdecd_inst[24:20];
assign fdecd_rs3[4:0]   = fdecd_inst[31:27];

//==========================================================
//                      Main  Decoder
//==========================================================
// main decoder produces operation information, operand
// information and oper prepare information,
// all values are defined by parameter.
// details defintions of operands plz refer to parameter define

// &CombBeg; @114
always @( fdecd_op[6:0]
       or fdecd_inst[26:20]
       or fdecd_func5[4:0]
       or fdecd_inst[14:12])
begin
  casez({fdecd_func5[4:0], fdecd_op[6:0]})
    //===================================================
    // FALU Decoder
    //---------------------------------------------------
    // FADDER: 7 RV32F insts, 7 RV32D insts
    12'b00000_1010011: // FADD/DADD
    begin
      fdecd_sel[SEL_WIDTH-1:0]   = FALU;
      fdecd_func[FUNC_WIDTH-1:0] = FADD;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b1;
      fdecd_int_dst_vld          = 1'b0;
    end
    12'b00001_1010011: //FSUBS/FSUBD
    begin
      fdecd_sel[SEL_WIDTH-1:0]   = FALU;
      fdecd_func[FUNC_WIDTH-1:0] = FSUB;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b1;
      fdecd_int_dst_vld          = 1'b0;
    end
    12'b00101_1010011: //FMAXS/FMAXD/FMINS/FMIND
    begin
      fdecd_sel[SEL_WIDTH-1:0]   = FALU;
      fdecd_func[FUNC_WIDTH-1:0] = fdecd_inst[14:12] == 3'b001 ? FMAX : FMIN;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0 & fdecd_inst[14:13] == 2'b0;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b1;
      fdecd_int_dst_vld          = 1'b0;
    end
    12'b10100_1010011: //FEQS/FEQD/FLTS/FLTD/FLES/FLED
    begin
      fdecd_sel[SEL_WIDTH-1:0]   = FALU;
      fdecd_func[FUNC_WIDTH-1:0] = fdecd_inst[14:12] == 3'b010 ? FEQ :
                                   fdecd_inst[14:12] == 3'b001 ? FLT : FLE;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0 & ~fdecd_inst[14] & fdecd_inst[13:12] != 2'b11;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b1;
      fdecd_int_dst_vld          = 1'b1;
    end
    //---------------------------------------------------
    // FCNVT: 5 RV32F insts, 5 RV32D insts
    12'b11000_1010011: //FCVT_W_S/FCVT_W_D/FCVT_WU_S/FCVT_WU_D
    begin
      fdecd_sel[SEL_WIDTH-1:0]   = FALU;
      fdecd_func[FUNC_WIDTH-1:0] = fdecd_inst[24:20] == 5'b0 ? FCVT_W_F : FCVT_WU_F;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0 & fdecd_inst[24:21] == 4'b0;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b0;
      fdecd_int_dst_vld          = 1'b1;
    end
    12'b11010_1010011: //FCVT_S_W/FCVT_D_W/FCVT_S_WU/FCVT_D_WU
    begin
      fdecd_sel[SEL_WIDTH-1:0]   = FALU;
      fdecd_func[FUNC_WIDTH-1:0] = fdecd_inst[24:20] == 5'b0 ? FCVT_F_W : FCVT_F_WU;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0 & fdecd_inst[24:21] == 4'b0;
      fdecd_rs1_vld              = 1'b0;
      fdecd_rs1_int              = 1'b1;
      fdecd_rs2_vld              = 1'b0;
      fdecd_int_dst_vld          = 1'b0;
    end
    //---------------------------------------------------
    // FSPU: 8 RV32F insts, 4 RV32D insts
    12'b11100_1010011: //FMV_X_W/FCLASSS/FCLASSD
    begin
      fdecd_sel[SEL_WIDTH-1:0]   = FALU;
      fdecd_func[FUNC_WIDTH-1:0] = fdecd_inst[14:12] == 3'b000 ? FMV_X_W : FCLASS;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0 & fdecd_inst[24:20] == 5'b0 & fdecd_inst[14:13] == 2'b0;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b0;
      fdecd_int_dst_vld          = 1'b1;
    end
    12'b11110_1010011: //FMV_W_X
    begin
      fdecd_sel[SEL_WIDTH-1:0]   = FALU;
      fdecd_func[FUNC_WIDTH-1:0] = FMV_W_X;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0 & fdecd_inst[24:20] == 5'b0 & fdecd_inst[14:12] == 3'b0;
      fdecd_rs1_vld              = 1'b0;
      fdecd_rs1_int              = 1'b1;
      fdecd_rs2_vld              = 1'b0;
      fdecd_int_dst_vld          = 1'b0;
    end
    12'b00100_1010011: //FSGNJS/FSGNJD/FSGNJNS/FSGNJND/FSGNJXS/FSGNJXD
    begin
      fdecd_sel[SEL_WIDTH-1:0]   = FALU;
      fdecd_func[FUNC_WIDTH-1:0] = fdecd_inst[14:12] == 3'b000 ? FSGNJ :
                                   fdecd_inst[14:12] == 3'b001 ? FSGNJN : FSGNJX;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0 & ~fdecd_inst[14] & fdecd_inst[13:12] != 2'b11;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b1;
      fdecd_int_dst_vld          = 1'b0;
    end
    //===================================================
    // FMAU Decoder
    //---------------------------------------------------
    // FMAU: 5 RV32F insts, 5 RV32D insts
    12'b00010_1010011: //FMULS/FMULD
    begin  
      fdecd_sel[SEL_WIDTH-1:0]   = FMAU;
      fdecd_func[FUNC_WIDTH-1:0] = FMUL;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b1;
      fdecd_int_dst_vld          = 1'b0;
    end
    12'b?????_1000011: //FMADDS/FMADDD
    begin  
      fdecd_sel[SEL_WIDTH-1:0]   = FMAU;
      fdecd_func[FUNC_WIDTH-1:0] = FMADD;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b1;
      fdecd_int_dst_vld          = 1'b0;
    end
    12'b?????_1000111: //FMSUBS/FMSUBD
    begin  
      fdecd_sel[SEL_WIDTH-1:0]   = FMAU;
      fdecd_func[FUNC_WIDTH-1:0] = FMSUB;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b1;
      fdecd_int_dst_vld          = 1'b0;
    end
    12'b?????_1001011: //FNMSUBS/FNMSUBD
    begin  
      fdecd_sel[SEL_WIDTH-1:0]   = FMAU;
      fdecd_func[FUNC_WIDTH-1:0] = FNMSUB;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b1;
      fdecd_int_dst_vld          = 1'b0;
    end
    12'b?????_1001111: //FNMADDS/FNMADDD
    begin  
      fdecd_sel[SEL_WIDTH-1:0]   = FMAU;
      fdecd_func[FUNC_WIDTH-1:0] = FNMADD;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b1;
      fdecd_int_dst_vld          = 1'b0;
    end
    //===================================================
    // FDSU Decoder
    //---------------------------------------------------
    // FDSU: 2 RV32F insts, 2 RV32D insts
    12'b00011_1010011: //FDIVS/FDIVD
    begin
      fdecd_sel[SEL_WIDTH-1:0]   = FDSU;
      fdecd_func[FUNC_WIDTH-1:0] = FDIV;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b1;
      fdecd_int_dst_vld          = 1'b0;
    end
    12'b01011_1010011: //FSQRTS/FSQRTD
    begin
      fdecd_sel[SEL_WIDTH-1:0]   = FDSU;
      fdecd_func[FUNC_WIDTH-1:0] = FSQRT;
      fdecd_fpu_vld              = fdecd_inst[26:25] == 2'b0 & fdecd_inst[24:20] == 5'b0;
      fdecd_rs1_vld              = 1'b1;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b1;
      fdecd_int_dst_vld          = 1'b0;
    end
    //===================================================
    default:
    begin
      fdecd_sel[SEL_WIDTH-1:0]   = {SEL_WIDTH{1'b0}};
      fdecd_func[FUNC_WIDTH-1:0] = {FUNC_WIDTH{1'bx}};
      fdecd_fpu_vld              = 1'b0;
      fdecd_rs1_vld              = 1'b0;
      fdecd_rs1_int              = 1'b0;
      fdecd_rs2_vld              = 1'b0;
      fdecd_int_dst_vld          = 1'b0;
    end
  endcase
// &CombEnd; @402
end

// decode for FLSU
assign fdecd_flw_vld    = fdecd_inst[6:0] == 7'b0000111 & fdecd_inst[14:12] == 3'b010;
assign fdecd_fsw_vld    = fdecd_inst[6:0] == 7'b0100111 & fdecd_inst[14:12] == 3'b010;
assign fdecd_cflw_vld   = fdecd_inst[1:0] == 2'b00      & fdecd_inst[15:13] == 3'b011;
assign fdecd_cfsw_vld   = fdecd_inst[1:0] == 2'b00      & fdecd_inst[15:13] == 3'b111;
assign fdecd_cflwsp_vld = fdecd_inst[1:0] == 2'b10      & fdecd_inst[15:13] == 3'b011;
assign fdecd_cfswsp_vld = fdecd_inst[1:0] == 2'b10      & fdecd_inst[15:13] == 3'b111;

assign fdecd_fld_vld    = 1'b0;
assign fdecd_fsd_vld    = 1'b0;
assign fdecd_cfld_vld   = 1'b0;
assign fdecd_cfsd_vld   = 1'b0;
assign fdecd_cfldsp_vld = 1'b0;
assign fdecd_cfsdsp_vld = 1'b0;

assign fdecd_ld_vld  = fdecd_flw_vld | fdecd_cflw_vld | fdecd_cflwsp_vld
                    | fdecd_fld_vld | fdecd_cfld_vld | fdecd_cfldsp_vld;
assign fdecd_st_vld  = fdecd_fsw_vld | fdecd_cfsw_vld | fdecd_cfswsp_vld
                    | fdecd_fsd_vld | fdecd_cfsd_vld | fdecd_cfsdsp_vld;

assign fdecd_fls_vld = fdecd_ld_vld | fdecd_st_vld;

// fls operand prepare
// int rs1: inserted into int decd
// int imm:
assign fdecd_fl_imm[31:0]     = {{21{fdecd_inst[31]}}, fdecd_inst[30:20]};
assign fdecd_fs_imm[31:0]     = {{21{fdecd_inst[31]}}, fdecd_inst[30:25], fdecd_inst[11:7]};
assign fdecd_cfls_imm[31:0]   = {25'b0, fdecd_inst[5], fdecd_inst[12:10], fdecd_inst[6], 2'b0};
assign fdecd_cflsd_imm[31:0]  = {24'b0, fdecd_inst[6:5], fdecd_inst[12:10], 3'b0};
assign fdecd_cflwsp_imm[31:0] = {24'b0, fdecd_inst[3:2], fdecd_inst[12], fdecd_inst[6:4], 2'b0};
assign fdecd_cfswsp_imm[31:0] = {24'b0, fdecd_inst[8:7], fdecd_inst[12:9], 2'b0};
assign fdecd_cfldsp_imm[31:0] = {23'b0, fdecd_inst[4:2], fdecd_inst[12], fdecd_inst[6:5], 3'b0};
assign fdecd_cfsdsp_imm[31:0] = {23'b0, fdecd_inst[9:7], fdecd_inst[12:10], 3'b0};

assign fdecd_fls_imm[31:0] = {32{fdecd_flw_vld}}    & fdecd_fl_imm[31:0]
                           | {32{fdecd_fld_vld}}    & fdecd_fl_imm[31:0]
                           | {32{fdecd_fsw_vld}}    & fdecd_fs_imm[31:0]
                           | {32{fdecd_fsd_vld}}    & fdecd_fs_imm[31:0]
                           | {32{fdecd_cflw_vld}}   & fdecd_cfls_imm[31:0]
                           | {32{fdecd_cfsw_vld}}   & fdecd_cfls_imm[31:0]
                           | {32{fdecd_cfld_vld}}   & fdecd_cflsd_imm[31:0]
                           | {32{fdecd_cfsd_vld}}   & fdecd_cflsd_imm[31:0]
                           | {32{fdecd_cflwsp_vld}} & fdecd_cflwsp_imm[31:0]
                           | {32{fdecd_cfswsp_vld}} & fdecd_cfswsp_imm[31:0]
                           | {32{fdecd_cfldsp_vld}} & fdecd_cfldsp_imm[31:0]
                           | {32{fdecd_cfsdsp_vld}} & fdecd_cfsdsp_imm[31:0];
// float rs2:
assign fdecd_fls_rs2[4:0] = (fdecd_cfsw_vld | fdecd_cfsd_vld) ? {2'b01, fdecd_inst[4:2]}
                                                               : fdecd_inst[6:2];
assign fdecd_cfst_vld     = fdecd_cfsw_vld | fdecd_cfswsp_vld
                         | fdecd_cfsd_vld | fdecd_cfsdsp_vld;
assign fdecd_rs2_fin[4:0] = fdecd_cfst_vld ? fdecd_fls_rs2[4:0] : fdecd_rs2[4:0];

// float rd:
assign fdecd_rd_fin[4:0] = (fdecd_cflw_vld | fdecd_cfld_vld) ? {2'b01, fdecd_inst[4:2]}
                                                              : fdecd_rd[4:0];

// Float RS3 Valid
assign fdecd_rs3_vld = fdecd_sel[SEL_WIDTH-1:0] == FMAU 
                    & fdecd_func[FUNC_WIDTH-1:0] != FMUL;
// Float Dst Valid
assign fdecd_dst_vld = (fdecd_fpu_vld & ~fdecd_int_dst_vld | fdecd_ld_vld)
                     & ~fdecd_ill_expt;

// decoder for FLSU
assign fdecd_rd_reuse = fdecd_sel[SEL_WIDTH-1:0] == FALU
                    & fdecd_func[FUNC_WIDTH-1:0] == FMV_HW_X;
assign fdecd_rs1_fin[4:0] = fdecd_rd_reuse ? fdecd_rd[4:0] : fdecd_rs1[4:0];

// float rs vld
assign fdecd_fpu_dp_vld = fdecd_op[6:0] == 7'b0000111 | fdecd_op[6:0] == 7'b0100111
                       | fdecd_op[6:0] == 7'b1000011 | fdecd_op[6:0] == 7'b1000111
                       | fdecd_op[6:0] == 7'b1001011 | fdecd_op[6:0] == 7'b1001111
                       | fdecd_op[6:0] == 7'b1010011;

assign fdecd_rs_vld = fdecd_fpu_dp_vld | fdecd_fls_vld;

// format swap
assign fdecd_fmt_swap = fdecd_sel[SEL_WIDTH-1:0] == FALU
                     & fdecd_func[FUNC_WIDTH-1:0] == FCVT_F_F;
assign fdecd_fmt_fin[1:0] = fdecd_fmt_swap ? {fdecd_fmt[0], fdecd_fmt[1]}
                                           : fdecd_fmt[1:0];

//FP extension illegal
//1. rounding mode == 3'b101 or rounding mode = 3'b110
//2. rounding mode == 3'b111 and fcsr[7:5] == 3'b101~3'b111
//3. FS==0,execute RV64F/D inst or read/write fcsr/fflags/frm/fxcr
//   read/write fcsr/... will decode in CP0
assign fp_static_rounding_illegal  = (fdecd_inst[14:12] == 3'b101)
                                  | (fdecd_inst[14:12] == 3'b110);
assign fp_dynamic_rounding_illegal = (fdecd_inst[14:12] == 3'b111)
                                  & ((cp0_idu_rm[2:0] == 3'b101)
                                      |(cp0_idu_rm[2:0] == 3'b110)
                                      |(cp0_idu_rm[2:0] == 3'b111));
assign fp_fs_illegal = (cp0_idu_fs[1:0] == 2'b00); //off
assign fp_rm_illegal = fp_static_rounding_illegal | fp_dynamic_rounding_illegal;

assign fdecd_ill_expt = (fdecd_fpu_vld | fdecd_fls_vld) & fp_fs_illegal
                      | fdecd_fpu_vld & fp_rm_illegal;

//==========================================================
//     Rename output decoded information for IDU modules
//==========================================================
// fpr Todo
assign decd_fp_fpr_rs1_vld  = fdecd_rs1_vld;
assign decd_fp_fpr_rs1[4:0] = {5{fdecd_rs_vld}} & fdecd_rs1_fin[4:0];
assign decd_fp_fpr_rs2_vld  = fdecd_rs2_vld | fdecd_st_vld;
assign decd_fp_fpr_rs2[4:0] = {5{fdecd_rs_vld}} & fdecd_rs2_fin[4:0];
assign decd_fp_fpr_rs3_vld  = fdecd_rs3_vld;
assign decd_fp_fpr_rs3[4:0] = {5{fdecd_rs_vld}} & fdecd_rs3[4:0];
assign decd_fp_fpr_rd_vld   = fdecd_dst_vld;
assign decd_fp_fpr_rd[4:0]  = {5{fdecd_dst_vld}} & fdecd_rd_fin[4:0];

// id fp Todo
assign decd_fp_id_fp_inst_vld     = (fdecd_fpu_vld | fdecd_fls_vld) & ~hs_fdecd_dp_vld;
assign decd_fp_id_dp_func[FUNC_WIDTH+1:0] = {fdecd_fmt_fin[1:0], fdecd_func[FUNC_WIDTH-1:0]};
assign decd_fp_id_fp_dst_idx[4:0] = fdecd_rd_fin[4:0];
assign decd_fp_id_fp_dst_vld      = fdecd_dst_vld;
assign decd_fp_id_fp_rs1_idx[4:0] = fdecd_rs1_fin[4:0];
assign decd_fp_id_fp_rs1_vld      = fdecd_rs1_vld;
assign decd_fp_id_fp_rs2_idx[4:0] = fdecd_rs2_fin[4:0];    
assign decd_fp_id_fp_rs2_vld      = fdecd_rs2_vld | fdecd_st_vld;
assign decd_fp_id_fp_rs3_idx[4:0] = fdecd_rs3[4:0];     
assign decd_fp_id_fp_rs3_vld      = fdecd_rs3_vld;
assign decd_fp_id_fp_unit_sel[2:0] = fdecd_sel[SEL_WIDTH-1:0];
assign decd_fp_id_fp_lsu_sel      = fdecd_fls_vld;
assign decd_fp_id_rm[2:0]         = fdecd_rm[2:0];

assign fdecd_ctrl_fp_inst_vld     = fdecd_fpu_vld & ~fdecd_ill_expt & ifu_idu_id_inst_vld & ~hs_fdecd_dp_vld;
assign fdecd_ctrl_fls             = fdecd_fls_vld & ifu_idu_id_inst_vld & ~hs_fdecd_dp_vld;
assign fdecd_ctrl_dst_vld         = fdecd_dst_vld & ifu_idu_id_inst_vld & ~hs_fdecd_dp_vld;
assign fdecd_ctrl_dst_idx[5:0]    = {1'b0, fdecd_rd_fin[4:0]};
assign fdecd_ctrl_int_dst_vld     = fdecd_int_dst_vld & ifu_idu_id_inst_vld & ~hs_fdecd_dp_vld;

assign fdecd_decd_fp_inst_vld     = fdecd_fpu_vld | fdecd_fls_vld;
assign fdecd_decd_rs1_int_vld     = fdecd_rs1_int | fdecd_fls_vld;
assign fdecd_decd_rd_int_vld      = fdecd_int_dst_vld;
assign fdecd_decd_imm_vld         = fdecd_fls_vld;
assign fdecd_decd_imm[31:0]       = fdecd_fls_imm[31:0];
assign fdecd_decd_ill_expt        = fdecd_ill_expt;

assign fdecd_dp_rs1_int_vld       = (fdecd_rs1_int | fdecd_fls_vld) & ~hs_fdecd_dp_vld;
assign fdecd_dp_rs2_vld           = fdecd_st_vld & ~hs_fdecd_dp_vld;
assign fdecd_dp_rs2_idx[5:0]      = {1'b0, fdecd_rs2_fin[4:0]};    
//assign fdecd_dp_fst_vld           = fdecd_st_vld;

// &ModuleEnd; @567
endmodule


