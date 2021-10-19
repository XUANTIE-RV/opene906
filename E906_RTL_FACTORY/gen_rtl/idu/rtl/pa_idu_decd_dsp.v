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
module pa_idu_decd_dsp(
  cp0_yy_cskyisaee,
  cp0_yy_mach_mode,
  decd_ctrl_bju_use_pc,
  decd_ctrl_id_func,
  decd_ctrl_ill_expt,
  decd_ctrl_inst_32bit,
  decd_ctrl_rd1,
  decd_ctrl_rd1_vld,
  decd_ctrl_rd2,
  decd_ctrl_rd2_vld,
  decd_ctrl_sti_vld,
  decd_ctrl_str_vld,
  decd_ctrl_unit_sel,
  decd_dp_ag_imm,
  decd_dp_ag_imm_vld,
  decd_dp_csri_rs1,
  decd_dp_csri_vld,
  decd_dp_ex_st_rs2_vld,
  decd_dp_func,
  decd_dp_imm,
  decd_dp_imm_vld,
  decd_dp_lsr_vld,
  decd_dp_lsu_sel,
  decd_dp_mul_high_sel,
  decd_dp_rd2_vld,
  decd_dp_rs1_idx,
  decd_dp_rs1_vld,
  decd_dp_rs2_idx,
  decd_dp_rs2_vld,
  decd_dp_rs3_idx,
  decd_dp_rs3_vld,
  decd_dp_rs4_idx,
  decd_dp_rs4_vld,
  decd_dp_smal_vld,
  decd_dp_split,
  decd_gpr_dep_rs1,
  decd_gpr_dep_rs2,
  decd_gpr_rd1_vld,
  decd_gpr_rd2_vld,
  decd_gpr_rs1,
  decd_gpr_rs1_vld,
  decd_gpr_rs2,
  decd_gpr_rs2_vld,
  decd_gpr_rs3,
  decd_gpr_rs3_vld,
  decd_gpr_rs4,
  decd_gpr_rs4_vld,
  decd_hs_ipop_vld,
  decd_hs_ipush_vld,
  decd_split_dst_idx,
  decd_split_opcode,
  decd_split_req,
  decd_split_rs1_idx,
  decd_split_rs2_idx,
  decd_split_rs2_vld,
  dp_decd_rs2_aft_fwd,
  fdecd_decd_fp_inst_vld,
  fdecd_decd_ill_expt,
  fdecd_decd_imm,
  fdecd_decd_imm_vld,
  fdecd_decd_rd_int_vld,
  fdecd_decd_rs1_int_vld,
  hs_decd_dp_vld,
  hs_decd_dst_vld,
  hs_decd_func,
  hs_decd_imm,
  hs_decd_imm_vld,
  hs_decd_rd,
  hs_decd_rs1,
  hs_decd_rs1_vld,
  hs_decd_rs2,
  hs_decd_rs2_imm_vld,
  hs_decd_rs2_vld,
  hs_decd_sel,
  hs_decd_split,
  ifu_idu_id_expt_vld,
  ifu_idu_id_inst,
  rtu_yy_xx_dbgon,
  split_decd_ag_imm,
  split_decd_ag_imm_vld,
  split_decd_dp_sel,
  split_decd_dst_idx,
  split_decd_dst_vld,
  split_decd_func,
  split_decd_rs1_idx,
  split_decd_rs1_vld,
  split_decd_rs2_idx,
  split_decd_rs2_imm,
  split_decd_rs2_imm_vld,
  split_decd_rs2_vld,
  split_decd_sel,
  split_decd_split
);

// &Ports; @27
input           cp0_yy_cskyisaee;      
input           cp0_yy_mach_mode;      
input   [31:0]  dp_decd_rs2_aft_fwd;   
input           fdecd_decd_fp_inst_vld; 
input           fdecd_decd_ill_expt;   
input   [31:0]  fdecd_decd_imm;        
input           fdecd_decd_imm_vld;    
input           fdecd_decd_rd_int_vld; 
input           fdecd_decd_rs1_int_vld; 
input           hs_decd_dp_vld;        
input           hs_decd_dst_vld;       
input   [19:0]  hs_decd_func;          
input   [31:0]  hs_decd_imm;           
input           hs_decd_imm_vld;       
input   [5 :0]  hs_decd_rd;            
input   [5 :0]  hs_decd_rs1;           
input           hs_decd_rs1_vld;       
input   [5 :0]  hs_decd_rs2;           
input           hs_decd_rs2_imm_vld;   
input           hs_decd_rs2_vld;       
input   [5 :0]  hs_decd_sel;           
input           hs_decd_split;         
input           ifu_idu_id_expt_vld;   
input   [31:0]  ifu_idu_id_inst;       
input           rtu_yy_xx_dbgon;       
input   [31:0]  split_decd_ag_imm;     
input           split_decd_ag_imm_vld; 
input           split_decd_dp_sel;     
input   [5 :0]  split_decd_dst_idx;    
input           split_decd_dst_vld;    
input   [19:0]  split_decd_func;       
input   [5 :0]  split_decd_rs1_idx;    
input           split_decd_rs1_vld;    
input   [5 :0]  split_decd_rs2_idx;    
input   [31:0]  split_decd_rs2_imm;    
input           split_decd_rs2_imm_vld; 
input           split_decd_rs2_vld;    
input   [5 :0]  split_decd_sel;        
input           split_decd_split;      
output          decd_ctrl_bju_use_pc;  
output  [4 :0]  decd_ctrl_id_func;     
output          decd_ctrl_ill_expt;    
output          decd_ctrl_inst_32bit;  
output  [5 :0]  decd_ctrl_rd1;         
output          decd_ctrl_rd1_vld;     
output  [5 :0]  decd_ctrl_rd2;         
output          decd_ctrl_rd2_vld;     
output          decd_ctrl_sti_vld;     
output          decd_ctrl_str_vld;     
output  [5 :0]  decd_ctrl_unit_sel;    
output  [31:0]  decd_dp_ag_imm;        
output          decd_dp_ag_imm_vld;    
output  [4 :0]  decd_dp_csri_rs1;      
output          decd_dp_csri_vld;      
output          decd_dp_ex_st_rs2_vld; 
output  [19:0]  decd_dp_func;          
output  [31:0]  decd_dp_imm;           
output          decd_dp_imm_vld;       
output          decd_dp_lsr_vld;       
output          decd_dp_lsu_sel;       
output          decd_dp_mul_high_sel;  
output          decd_dp_rd2_vld;       
output  [5 :0]  decd_dp_rs1_idx;       
output          decd_dp_rs1_vld;       
output  [5 :0]  decd_dp_rs2_idx;       
output          decd_dp_rs2_vld;       
output  [5 :0]  decd_dp_rs3_idx;       
output          decd_dp_rs3_vld;       
output  [5 :0]  decd_dp_rs4_idx;       
output          decd_dp_rs4_vld;       
output          decd_dp_smal_vld;      
output          decd_dp_split;         
output  [5 :0]  decd_gpr_dep_rs1;      
output  [5 :0]  decd_gpr_dep_rs2;      
output          decd_gpr_rd1_vld;      
output          decd_gpr_rd2_vld;      
output  [5 :0]  decd_gpr_rs1;          
output          decd_gpr_rs1_vld;      
output  [5 :0]  decd_gpr_rs2;          
output          decd_gpr_rs2_vld;      
output  [5 :0]  decd_gpr_rs3;          
output          decd_gpr_rs3_vld;      
output  [5 :0]  decd_gpr_rs4;          
output          decd_gpr_rs4_vld;      
output          decd_hs_ipop_vld;      
output          decd_hs_ipush_vld;     
output  [4 :0]  decd_split_dst_idx;    
output  [6 :0]  decd_split_opcode;     
output          decd_split_req;        
output  [4 :0]  decd_split_rs1_idx;    
output  [4 :0]  decd_split_rs2_idx;    
output          decd_split_rs2_vld;    

// &Regs; @28
reg     [19:0]  decd_func;             
reg             decd_ill_expt32;       
reg     [31:0]  decd_imm1;             
reg             decd_imm1_vld;         
reg     [31:0]  decd_imm2;             
reg             decd_imm2_vld;         
reg             decd_inv_inst;         
reg     [4 :0]  decd_rd1;              
reg             decd_rd1_vld;          
reg     [4 :0]  decd_rd2;              
reg             decd_rd2_vld;          
reg     [4 :0]  decd_rs1;              
reg             decd_rs1_vld;          
reg     [4 :0]  decd_rs2;              
reg             decd_rs2_vld;          
reg     [4 :0]  decd_rs3;              
reg             decd_rs3_vld;          
reg     [4 :0]  decd_rs4;              
reg             decd_rs4_vld;          
reg     [5 :0]  decd_sel;              

// &Wires; @29
wire            atm_aqrl;              
wire            cp0_yy_cskyisaee;      
wire            cp0_yy_mach_mode;      
wire    [31:0]  decd_ag_imm;           
wire            decd_ag_imm_vld;       
wire    [4 :0]  decd_csri_rs1;         
wire            decd_csri_vld;         
wire            decd_ctrl_bju_use_pc;  
wire    [4 :0]  decd_ctrl_id_func;     
wire            decd_ctrl_ill_expt;    
wire            decd_ctrl_inst_32bit;  
wire    [5 :0]  decd_ctrl_rd1;         
wire            decd_ctrl_rd1_vld;     
wire    [5 :0]  decd_ctrl_rd2;         
wire            decd_ctrl_rd2_vld;     
wire            decd_ctrl_sti_vld;     
wire            decd_ctrl_str_vld;     
wire    [5 :0]  decd_ctrl_unit_sel;    
wire    [31:0]  decd_dp_ag_imm;        
wire            decd_dp_ag_imm_vld;    
wire    [4 :0]  decd_dp_csri_rs1;      
wire            decd_dp_csri_vld;      
wire            decd_dp_ex_st_rs2_vld; 
wire    [19:0]  decd_dp_func;          
wire    [31:0]  decd_dp_imm;           
wire            decd_dp_imm_vld;       
wire            decd_dp_lsr_vld;       
wire            decd_dp_lsu_sel;       
wire            decd_dp_mul_high_sel;  
wire            decd_dp_rd2_vld;       
wire    [5 :0]  decd_dp_rs1_idx;       
wire            decd_dp_rs1_vld;       
wire    [5 :0]  decd_dp_rs2_idx;       
wire            decd_dp_rs2_vld;       
wire    [5 :0]  decd_dp_rs3_idx;       
wire            decd_dp_rs3_vld;       
wire    [5 :0]  decd_dp_rs4_idx;       
wire            decd_dp_rs4_vld;       
wire            decd_dp_smal_vld;      
wire            decd_dp_split;         
wire    [2 :0]  decd_func3;            
wire    [6 :0]  decd_func7;            
wire    [5 :0]  decd_gpr_dep_rs1;      
wire    [5 :0]  decd_gpr_dep_rs2;      
wire            decd_gpr_rd1_vld;      
wire            decd_gpr_rd2_vld;      
wire    [5 :0]  decd_gpr_rs1;          
wire            decd_gpr_rs1_vld;      
wire    [5 :0]  decd_gpr_rs2;          
wire            decd_gpr_rs2_vld;      
wire    [5 :0]  decd_gpr_rs3;          
wire            decd_gpr_rs3_vld;      
wire    [5 :0]  decd_gpr_rs4;          
wire            decd_gpr_rs4_vld;      
wire            decd_hs_ipop_vld;      
wire            decd_hs_ipush_vld;     
wire            decd_ill_expt;         
wire    [31:0]  decd_inst;             
wire            decd_inst_32bit;       
wire    [31:0]  decd_inst_code;        
wire    [4 :0]  decd_isa_sel;          
wire            decd_mul_high_sel;     
wire    [6 :0]  decd_op;               
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
wire    [19:0]  decd_rv32fd_func;      
wire            decd_rv32fd_op_vld;    
wire    [5 :0]  decd_rv32fd_sel;       
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
wire            decd_rv32p_op_vld;     
wire    [19:0]  decd_rv32x_func;       
wire            decd_rv32x_ill_expt;   
wire    [31:0]  decd_rv32x_imm1;       
wire            decd_rv32x_imm1_vld;   
wire    [31:0]  decd_rv32x_imm2;       
wire            decd_rv32x_imm2_vld;   
wire            decd_rv32x_op_vld;     
wire            decd_rv32x_rd1_vld;    
wire    [4 :0]  decd_rv32x_rd2;        
wire            decd_rv32x_rd2_vld;    
wire    [4 :0]  decd_rv32x_rs1;        
wire    [4 :0]  decd_rv32x_rs2;        
wire            decd_rv32x_rs2_vld;    
wire            decd_rv32x_rs3_vld;    
wire    [5 :0]  decd_rv32x_sel;        
wire            decd_smal_vld;         
wire    [4 :0]  decd_split_dst_idx;    
wire    [6 :0]  decd_split_opcode;     
wire            decd_split_req;        
wire    [4 :0]  decd_split_rs1_idx;    
wire    [4 :0]  decd_split_rs2_idx;    
wire            decd_split_rs2_vld;    
wire            decd_sti_vld;          
wire            decd_str_vld;          
wire    [31:0]  dp_decd_rs2_aft_fwd;   
wire            fdecd_decd_fp_inst_vld; 
wire            fdecd_decd_ill_expt;   
wire    [31:0]  fdecd_decd_imm;        
wire            fdecd_decd_imm_vld;    
wire            fdecd_decd_rd_int_vld; 
wire            fdecd_decd_rs1_int_vld; 
wire            hs_decd_dp_vld;        
wire            hs_decd_dst_vld;       
wire    [19:0]  hs_decd_func;          
wire    [31:0]  hs_decd_imm;           
wire            hs_decd_imm_vld;       
wire    [5 :0]  hs_decd_rd;            
wire    [5 :0]  hs_decd_rs1;           
wire            hs_decd_rs1_vld;       
wire    [5 :0]  hs_decd_rs2;           
wire            hs_decd_rs2_imm_vld;   
wire            hs_decd_rs2_vld;       
wire    [5 :0]  hs_decd_sel;           
wire            hs_decd_split;         
wire            hs_sel;                
wire            ifu_idu_id_expt_vld;   
wire    [31:0]  ifu_idu_id_inst;       
wire            lsr_imm_vld;           
wire            rtu_yy_xx_dbgon;       
wire    [31:0]  split_decd_ag_imm;     
wire            split_decd_ag_imm_vld; 
wire            split_decd_dp_sel;     
wire    [5 :0]  split_decd_dst_idx;    
wire            split_decd_dst_vld;    
wire    [19:0]  split_decd_func;       
wire    [5 :0]  split_decd_rs1_idx;    
wire            split_decd_rs1_vld;    
wire    [5 :0]  split_decd_rs2_idx;    
wire    [31:0]  split_decd_rs2_imm;    
wire            split_decd_rs2_imm_vld; 
wire            split_decd_rs2_vld;    
wire    [5 :0]  split_decd_sel;        
wire            split_decd_split;      
wire            split_req;             
wire            split_sel;             
wire            split_sel_dp;          
wire            split_sel_pre;         


//==========================================================
//                Define the operation type and funtion
//==========================================================
//--------------------parameter width define----------------
// following defines data width of decoded information
parameter SEL_WIDTH  = 6;
parameter FUNC_WIDTH = 20;

//--------------------ISA Sel define----------------
parameter RV32IM = 5'b00001;
parameter RV32C  = 5'b00010;
parameter RV32X  = 5'b00100;
parameter RV32P  = 5'b01000;
parameter RV32FD = 5'b10000;

//--------------------Inst Unit define--------------
parameter ALU = 6'b000001;
parameter MUL = 6'b000010;
parameter DIV = 6'b000100;
parameter BJU = 6'b001000;
parameter LSU = 6'b010000;
parameter CP0 = 6'b100000;

//==========================================================
//                      Decoder Input
//==========================================================
// Note: for power consideration, the inst is divided into
// 32/16-bit insts first; if timing is critical, the opcode
// can be release for 1-2 gate timing
// rename for inner use
assign decd_inst[31:0]  = ifu_idu_id_inst[31:0];

// inst length judgement
assign decd_inst_32bit  = decd_inst[1] & decd_inst[0];

// decd structure for 32-bit width instruction
assign decd_op[6:0]     = decd_inst[6:0];
assign decd_func3[2:0]  = decd_inst[14:12];
assign decd_func7[6:0]  = decd_inst[31:25];

//==========================================================
//           Instance Decoders
//==========================================================
// DECODE ISA SEL
assign decd_isa_sel[0] = ~decd_rv32c_op_vld
                       & ~decd_rv32x_op_vld
                       & ~decd_rv32p_op_vld
                       & ~decd_rv32fd_op_vld
                       & ~fdecd_decd_fp_inst_vld;
assign decd_isa_sel[1] = decd_rv32c_op_vld;
assign decd_isa_sel[2] = decd_rv32x_op_vld;
assign decd_isa_sel[3] = decd_rv32p_op_vld;
assign decd_isa_sel[4] = decd_rv32fd_op_vld;

// RV32IM--2.1 Integer Pack, Mult & Div Pack
// &Instance("pa_idu_decd_rv32im"); @86
pa_idu_decd_rv32im  x_pa_idu_decd_rv32im (
  .decd_func3           (decd_func3          ),
  .decd_func7           (decd_func7          ),
  .decd_inst            (decd_inst           ),
  .decd_op              (decd_op             ),
  .decd_rv32im_func     (decd_rv32im_func    ),
  .decd_rv32im_imm1     (decd_rv32im_imm1    ),
  .decd_rv32im_imm1_vld (decd_rv32im_imm1_vld),
  .decd_rv32im_imm2     (decd_rv32im_imm2    ),
  .decd_rv32im_imm2_vld (decd_rv32im_imm2_vld),
  .decd_rv32im_rd_vld   (decd_rv32im_rd_vld  ),
  .decd_rv32im_rs1      (decd_rv32im_rs1     ),
  .decd_rv32im_rs1_vld  (decd_rv32im_rs1_vld ),
  .decd_rv32im_rs2_vld  (decd_rv32im_rs2_vld ),
  .decd_rv32im_sel      (decd_rv32im_sel     )
);


// RV32A--2.1 AMO Pack (Merged in IM)
//&Instance("pa_idu_decd_rv32a");

// RV32C--2.1 Compressed Pack
// &Instance("pa_idu_decd_rv32c"); @92
pa_idu_decd_rv32c  x_pa_idu_decd_rv32c (
  .decd_inst           (decd_inst          ),
  .decd_inst_32bit     (decd_inst_32bit    ),
  .decd_rv32c_func     (decd_rv32c_func    ),
  .decd_rv32c_ill_expt (decd_rv32c_ill_expt),
  .decd_rv32c_imm1     (decd_rv32c_imm1    ),
  .decd_rv32c_imm1_vld (decd_rv32c_imm1_vld),
  .decd_rv32c_imm2     (decd_rv32c_imm2    ),
  .decd_rv32c_imm2_vld (decd_rv32c_imm2_vld),
  .decd_rv32c_op_vld   (decd_rv32c_op_vld  ),
  .decd_rv32c_rd       (decd_rv32c_rd      ),
  .decd_rv32c_rd_vld   (decd_rv32c_rd_vld  ),
  .decd_rv32c_rs1      (decd_rv32c_rs1     ),
  .decd_rv32c_rs1_vld  (decd_rv32c_rs1_vld ),
  .decd_rv32c_rs2      (decd_rv32c_rs2     ),
  .decd_rv32c_rs2_vld  (decd_rv32c_rs2_vld ),
  .decd_rv32c_sel      (decd_rv32c_sel     )
);


// RV32X Extension Pack
// &Instance("pa_idu_decd_rv32x"); @95
pa_idu_decd_rv32x  x_pa_idu_decd_rv32x (
  .cp0_yy_cskyisaee    (cp0_yy_cskyisaee   ),
  .cp0_yy_mach_mode    (cp0_yy_mach_mode   ),
  .decd_func3          (decd_func3         ),
  .decd_func7          (decd_func7         ),
  .decd_inst           (decd_inst          ),
  .decd_op             (decd_op            ),
  .decd_rv32x_func     (decd_rv32x_func    ),
  .decd_rv32x_ill_expt (decd_rv32x_ill_expt),
  .decd_rv32x_imm1     (decd_rv32x_imm1    ),
  .decd_rv32x_imm1_vld (decd_rv32x_imm1_vld),
  .decd_rv32x_imm2     (decd_rv32x_imm2    ),
  .decd_rv32x_imm2_vld (decd_rv32x_imm2_vld),
  .decd_rv32x_op_vld   (decd_rv32x_op_vld  ),
  .decd_rv32x_rd1_vld  (decd_rv32x_rd1_vld ),
  .decd_rv32x_rd2      (decd_rv32x_rd2     ),
  .decd_rv32x_rd2_vld  (decd_rv32x_rd2_vld ),
  .decd_rv32x_rs1      (decd_rv32x_rs1     ),
  .decd_rv32x_rs2      (decd_rv32x_rs2     ),
  .decd_rv32x_rs2_vld  (decd_rv32x_rs2_vld ),
  .decd_rv32x_rs3_vld  (decd_rv32x_rs3_vld ),
  .decd_rv32x_sel      (decd_rv32x_sel     ),
  .dp_decd_rs2_aft_fwd (dp_decd_rs2_aft_fwd),
  .rtu_yy_xx_dbgon     (rtu_yy_xx_dbgon    )
);


// &Instance("pa_idu_decd_rv32p"); @99
assign decd_rv32p_op_vld   = 1'b0;
// RV32FD--2.1 FPU Pack
// &Instance("pa_idu_decd_rv32fd"); @106
pa_idu_decd_rv32fd  x_pa_idu_decd_rv32fd (
  .decd_inst          (decd_inst         ),
  .decd_op            (decd_op           ),
  .decd_rv32fd_func   (decd_rv32fd_func  ),
  .decd_rv32fd_op_vld (decd_rv32fd_op_vld),
  .decd_rv32fd_sel    (decd_rv32fd_sel   )
);


//==========================================================
// Unit Sel, Func and ill expt
//==========================================================
// &CombBeg; @114
always @( decd_rv32x_sel[5:0]
       or decd_rv32c_func[19:0]
       or decd_rv32im_sel[5:0]
       or decd_isa_sel[4:0]
       or decd_ill_expt32
       or decd_rv32x_ill_expt
       or decd_rv32x_func[19:0]
       or decd_rv32c_ill_expt
       or decd_rv32fd_sel[5:0]
       or decd_rv32im_func[19:0]
       or decd_rv32fd_func[19:0]
       or decd_rv32c_sel[5:0])
begin
  case(decd_isa_sel[4:0])
    RV32IM:
    begin
      decd_sel[SEL_WIDTH-1:0]   = decd_rv32im_sel[SEL_WIDTH-1:0];
      decd_func[FUNC_WIDTH-1:0] = decd_rv32im_func[FUNC_WIDTH-1:0];
      decd_inv_inst             = decd_ill_expt32;
    end
    RV32C:
    begin
      decd_sel[SEL_WIDTH-1:0]   = decd_rv32c_sel[SEL_WIDTH-1:0];
      decd_func[FUNC_WIDTH-1:0] = decd_rv32c_func[FUNC_WIDTH-1:0];
      decd_inv_inst             = decd_rv32c_ill_expt;
    end
    RV32X:
    begin
      decd_sel[SEL_WIDTH-1:0]   = decd_rv32x_sel[SEL_WIDTH-1:0];
      decd_func[FUNC_WIDTH-1:0] = decd_rv32x_func[FUNC_WIDTH-1:0];
      decd_inv_inst             = decd_rv32x_ill_expt;
    end
    RV32FD:
    begin
      decd_sel[SEL_WIDTH-1:0]   = decd_rv32fd_sel[SEL_WIDTH-1:0];
      decd_func[FUNC_WIDTH-1:0] = decd_rv32fd_func[FUNC_WIDTH-1:0];
      decd_inv_inst             = decd_rv32fd_sel[SEL_WIDTH-1:0] == {SEL_WIDTH{1'b0}};
    end
    default:
    begin
      decd_sel[SEL_WIDTH-1:0]   = {SEL_WIDTH{1'b0}};
      decd_func[FUNC_WIDTH-1:0] = {FUNC_WIDTH{1'b0}};
      decd_inv_inst             = 1'b1;
    end
  endcase
// &CombEnd; @157
end
assign decd_ill_expt = decd_inv_inst | decd_sel[SEL_WIDTH-1:0] == BJU & rtu_yy_xx_dbgon;

//==========================================================
// Operand Index Decode
//==========================================================
// 4-Source Operand, 2-Dest Operand
// RS1
// &CombBeg; @165
always @( decd_inst[24:15]
       or decd_rv32x_rs1[4:0]
       or decd_rv32im_rs2_vld
       or decd_rv32im_rd_vld
       or decd_rv32x_rs3_vld
       or decd_rv32c_rd[4:0]
       or decd_rv32x_rd2[4:0]
       or decd_rv32x_rd1_vld
       or decd_rv32c_rs2[4:0]
       or decd_rv32c_rs1_vld
       or decd_rv32im_rs1[4:0]
       or decd_isa_sel[4:0]
       or decd_inst[11:7]
       or decd_rv32c_rd_vld
       or decd_rv32x_rs2[4:0]
       or decd_rv32c_rs1[4:0]
       or decd_rv32im_rs1_vld
       or decd_rv32x_rs2_vld
       or decd_rv32c_rs2_vld
       or decd_rv32x_rd2_vld)
begin
  decd_rs1_vld  = 1'b0;
  decd_rs1[4:0] = decd_inst[19:15];
  decd_rs2_vld  = 1'b0;
  decd_rs2[4:0] = decd_inst[24:20];
  decd_rs3_vld  = 1'b0;
  decd_rs3[4:0] = decd_inst[11:7];
  decd_rs4_vld  = 1'b0;
  decd_rs4[4:0] = {decd_inst[24:21], 1'b1};
  decd_rd1_vld  = 1'b0;
  decd_rd1[4:0] = decd_inst[11:7];
  decd_rd2_vld  = 1'b0;
  decd_rd2[4:0] = {decd_inst[11:8], 1'b1};
  case(decd_isa_sel[4:0])
    RV32IM:
    begin
      decd_rs1_vld  = decd_rv32im_rs1_vld;
      decd_rs1[4:0] = decd_rv32im_rs1[4:0];
      decd_rs2_vld  = decd_rv32im_rs2_vld;
      decd_rd1_vld  = decd_rv32im_rd_vld;
    end
    RV32C:
    begin
      decd_rs1_vld  = decd_rv32c_rs1_vld;
      decd_rs1[4:0] = decd_rv32c_rs1[4:0];
      decd_rs2_vld  = decd_rv32c_rs2_vld;
      decd_rs2[4:0] = decd_rv32c_rs2[4:0];
      decd_rd1_vld  = decd_rv32c_rd_vld;
      decd_rd1[4:0] = decd_rv32c_rd[4:0];
    end
    RV32X:
    begin
      decd_rs1_vld  = 1'b1;
      decd_rs1[4:0] = decd_rv32x_rs1[4:0];
      decd_rs2_vld  = decd_rv32x_rs2_vld;
      decd_rs2[4:0] = decd_rv32x_rs2[4:0];
      decd_rs3_vld  = decd_rv32x_rs3_vld;
      decd_rd1_vld  = decd_rv32x_rd1_vld;
      decd_rd2_vld  = decd_rv32x_rd2_vld;
      decd_rd2[4:0] = decd_rv32x_rd2[4:0];
    end
    default:
    begin
      decd_rs1_vld  = 1'b0;
      decd_rs1[4:0] = decd_inst[19:15];
      decd_rs2_vld  = 1'b0;
      decd_rs2[4:0] = decd_inst[24:20];
      decd_rs3_vld  = 1'b0;
      decd_rs3[4:0] = decd_inst[11:7];
      decd_rs4_vld  = 1'b0;
      decd_rs4[4:0] = {decd_inst[24:21], 1'b1};
      decd_rd1_vld  = 1'b0;
      decd_rd1[4:0] = decd_inst[11:7];
      decd_rd2_vld  = 1'b0;
      decd_rd2[4:0] = {decd_inst[11:8], 1'b1};
    end
  endcase
// &CombEnd; @238
end

// CSRI Operand1
assign decd_csri_vld      = decd_sel[5] & decd_func[5] & decd_inst[14];
assign decd_csri_rs1[4:0] = decd_inst[19:15];

//==========================================================
// Immediate Generation
//==========================================================
// &CombBeg; @247
always @( decd_rv32c_imm2_vld
       or decd_rv32c_imm1[31:0]
       or decd_rv32im_imm2[31:0]
       or decd_rv32c_imm1_vld
       or decd_rv32x_imm1_vld
       or decd_rv32x_imm2_vld
       or decd_rv32x_imm1[31:0]
       or decd_rv32c_imm2[31:0]
       or decd_rv32im_imm1[31:0]
       or decd_isa_sel[4:0]
       or decd_rv32x_imm2[31:0]
       or decd_rv32im_imm2_vld
       or decd_rv32im_imm1_vld)
begin
  decd_imm1_vld   = 1'b0;
  decd_imm1[31:0] = 32'b0;
  decd_imm2_vld   = 1'b0;
  decd_imm2[31:0] = 32'b0;
  case(decd_isa_sel[4:0])
    RV32IM:
    begin
      decd_imm1_vld   = decd_rv32im_imm1_vld;
      decd_imm1[31:0] = decd_rv32im_imm1[31:0];
      decd_imm2_vld   = decd_rv32im_imm2_vld;
      decd_imm2[31:0] = decd_rv32im_imm2[31:0];
    end
    RV32C:
    begin
      decd_imm1_vld   = decd_rv32c_imm1_vld;
      decd_imm1[31:0] = decd_rv32c_imm1[31:0];
      decd_imm2_vld   = decd_rv32c_imm2_vld;
      decd_imm2[31:0] = decd_rv32c_imm2[31:0];
    end
    RV32X:
    begin
      decd_imm1_vld   = decd_rv32x_imm1_vld;
      decd_imm1[31:0] = decd_rv32x_imm1[31:0];
      decd_imm2_vld   = decd_rv32x_imm2_vld;
      decd_imm2[31:0] = decd_rv32x_imm2[31:0];
    end
    default:
    begin
      decd_imm1_vld   = 1'b0;
      decd_imm1[31:0] = 32'b0;
      decd_imm2_vld   = 1'b0;
      decd_imm2[31:0] = 32'b0;
    end
  endcase
// &CombEnd; @289
end


// distribute imm, illegal inst code included
assign decd_ag_imm_vld   = decd_sel[3] | decd_sel[4] | decd_sel[5]
                         | (fdecd_decd_fp_inst_vld ? fdecd_decd_ill_expt : decd_ill_expt)
                         | fdecd_decd_imm_vld;
assign decd_ag_imm[31:0] = 
                          {32{fdecd_decd_imm_vld}} & fdecd_decd_imm[31:0] |
                          {32{ decd_imm2_vld}}     &  decd_imm2[31:0];
assign decd_inst_code[31:0] = {{16{decd_inst_32bit}} & decd_inst[31:16], decd_inst[15:0]};

// some special inst information
assign decd_smal_vld = decd_func7[6:0] == 7'b0101111 & decd_func3[2:0] == 3'b001 & decd_rv32p_op_vld;

//==========================================================
//               ILLEGAL INST
//==========================================================
// &CombBeg; @307
always @( rtu_yy_xx_dbgon
       or cp0_yy_mach_mode
       or decd_inst[31:20]
       or cp0_yy_cskyisaee
       or decd_inst[14:2])
begin
  casez({decd_inst[31:25], decd_inst[14:12], decd_inst[6:2]})
    // 15-bits instructions decode logic
    15'b010000000001100,  // SUB 
    15'b010000010101100,  // SRA
    15'b000000????01100,  // R-Type

    15'b????????0?00000,  // 
    15'b???????01000000,  // I-Type Load

    15'b000000000100100,  // SLLI
    15'b0?0000010100100,  // SRLI SRAI
    15'b????????1100100,  // I-Type 
    15'b?????????000100,  // I-Type 

    15'b???????00011001,  // JALR

    15'b?????????111100,  // 
    15'b????????1011100,  // CSR Type

    15'b???????00?01000,  // 
    15'b???????01001000,  // S-Type 

    15'b???????00?11000,  // 
    15'b???????1??11000,  // B-Type 

    15'b??????????01101,  // LUI

    15'b??????????00101,  // AUIPC

    15'b??????????11011,  // J-Type

    15'b???????00?00011:  // FENCE FENCE.I
    begin  
      decd_ill_expt32 = 1'b0; // initial invalid instruction exception
    end
    15'b000000?00000010:  // Cache Ops
    begin
      decd_ill_expt32 = decd_inst[11:7] != 5'b0
                     | decd_inst[24:20] == 5'b0
                     | ~cp0_yy_cskyisaee // initial invalid instruction exception
                     | ~(decd_inst[25] == 1'b0 & decd_inst[24:23] == 2'b11)
                       & ~cp0_yy_mach_mode & ~rtu_yy_xx_dbgon; // Only sync inst can execution in U-mode.
    end
    15'b???????01?01011:  // RV32A
    begin  
      decd_ill_expt32 = ~(decd_inst[31:29] == 3'b0 | decd_inst[28:27] == 2'b0);
    end
    15'b000000000011100:  // ECALL EBREAK
    begin  
      decd_ill_expt32 = decd_inst[24:21] != 4'b0; 
    end
    15'b001100000011100:  // MRET
    begin  
      decd_ill_expt32 = decd_inst[24:20] != 5'b00010;
    end
    15'b011110100011100:  // DRET
    begin  
      decd_ill_expt32 = ~rtu_yy_xx_dbgon;
    end
    15'b000100000011100:  // WFI
    begin  
      decd_ill_expt32 = decd_inst[24:20] != 5'b00101;
    end
    default:
    begin
      decd_ill_expt32 = 1'b1; // all other insts are illegal
    end
  endcase
// &CombEnd; @408
end

assign decd_mul_high_sel  = 1'b0;
assign decd_str_vld       = 1'b0;
//assign decd_ldi_vld       = 1'b0;
assign decd_sti_vld       = 1'b0;
assign lsr_imm_vld        = 1'b0;

//==========================================================
//     Rename output decoded information for IDU modules
//==========================================================
// gpr
assign decd_gpr_rs1[5:0] = hs_sel ? hs_decd_rs1[5:0] 
                         : split_sel ? split_decd_rs1_idx[5:0] 
                         : {1'b0, {5{~fdecd_decd_fp_inst_vld | fdecd_decd_rs1_int_vld}} & decd_rs1[4:0]};
assign decd_gpr_rs2[5:0] = hs_sel ? hs_decd_rs2[5:0] : split_sel ? split_decd_rs2_idx[5:0] : {1'b0, decd_rs2[4:0]};
assign decd_gpr_dep_rs1[5:0] = hs_sel ? hs_decd_rs1[5:0] : split_sel ? split_decd_rs1_idx[5:0] : {1'b0, decd_rs1[4:0]};
assign decd_gpr_dep_rs2[5:0] = hs_sel ? hs_decd_rs2[5:0] : split_sel ? split_decd_rs2_idx[5:0] : {1'b0, decd_rs2[4:0]};
assign decd_gpr_rs2_vld  = hs_sel ? hs_decd_rs2_vld : split_sel ? split_decd_rs2_vld : decd_rs2_vld;
assign decd_gpr_rs1_vld  = hs_sel ? hs_decd_rs1_vld : split_sel ? split_decd_rs1_vld : (decd_rs1_vld | fdecd_decd_rs1_int_vld);
assign decd_gpr_rd1_vld   = hs_sel ? hs_decd_dst_vld : split_sel ? split_decd_dst_vld : (decd_rd1_vld | fdecd_decd_rd_int_vld);
assign decd_gpr_rd2_vld   = decd_rd2_vld;
assign decd_gpr_rs3_vld  = ~hs_sel & decd_rs3_vld;
assign decd_gpr_rs3[5:0] = {1'b0, decd_rs3[4:0]};
assign decd_gpr_rs4_vld  = ~hs_sel & decd_rs4_vld;
assign decd_gpr_rs4[5:0] = {1'b0, decd_rs4[4:0]};
//assign decd_gpr_ldi_vld  = ~hs_sel & decd_ldi_vld;
//assign decd_gpr_sti_vld  = ~hs_sel & decd_sti_vld;

// ctrl
assign decd_ctrl_unit_sel[SEL_WIDTH-1:0] = hs_sel ? hs_decd_sel[SEL_WIDTH-1:0] : split_sel ? split_decd_sel[SEL_WIDTH-1:0] : decd_sel[SEL_WIDTH-1:0];
assign decd_ctrl_rd1_vld                 = hs_sel ? hs_decd_dst_vld : split_sel ? split_decd_dst_vld : (decd_rd1_vld | fdecd_decd_rd_int_vld);
assign decd_ctrl_ill_expt                = hs_sel ? 1'b0 : fdecd_decd_fp_inst_vld ? fdecd_decd_ill_expt : decd_ill_expt;
assign decd_ctrl_rd1[5:0]                = hs_sel ? hs_decd_rd[5:0] : split_sel ? split_decd_dst_idx[5:0] : {1'b0, decd_rd1[4:0]};
assign decd_ctrl_rd2_vld                 = decd_rd2_vld;
assign decd_ctrl_rd2[5:0]                = {1'b0, decd_rd2[4:0]};
assign decd_ctrl_inst_32bit              = hs_sel ? 1'b1 : decd_inst_32bit;
assign decd_ctrl_id_func[4:0]            = hs_sel ? hs_decd_func[4:0] : split_sel ? split_decd_func[9:5] : decd_func[9:5];
//assign decd_ctrl_bju_use_pc              = (decd_func[FUNC_WIDTH-1:0] == COND
//                                         | decd_func[FUNC_WIDTH-1:0] == AUIOP
//                                         | decd_func[FUNC_WIDTH-1:0] == UCOND & decd_sub_func[SUB_FUNC_WIDTH-1:0] == JAL)
//                                         & decd_sel[3] & ~hs_sel;
assign decd_ctrl_bju_use_pc              = decd_sel[SEL_WIDTH-1:0] == BJU & decd_func[FUNC_WIDTH-1:0] != 20'b00001_00100;
assign decd_ctrl_sti_vld                 = decd_sti_vld & ~hs_sel;
assign decd_ctrl_str_vld                 = decd_str_vld & ~hs_sel;

// dp
//assign decd_dp_unit_sel[SEL_WIDTH-1:0]      = hs_sel ? hs_decd_sel[SEL_WIDTH-1:0] : split_sel ? split_decd_sel[SEL_WIDTH-1:0] : decd_sel[SEL_WIDTH-1:0];
assign decd_dp_func[FUNC_WIDTH-1:0]         = hs_sel ? hs_decd_func[FUNC_WIDTH-1:0]
                                         : split_sel ? split_decd_func[FUNC_WIDTH-1:0]
                                         : decd_func[FUNC_WIDTH-1:0];
assign decd_dp_imm_vld                      = hs_sel ? hs_decd_rs2_imm_vld : split_sel ? split_decd_rs2_imm_vld : decd_imm1_vld;
assign decd_dp_imm[31:0]                    = hs_sel ? hs_decd_imm[31:0] : split_sel ? split_decd_rs2_imm[31:0] : decd_imm1[31:0];
assign decd_dp_ag_imm_vld                   = hs_sel ? hs_decd_imm_vld : split_sel ? split_decd_ag_imm_vld : decd_ag_imm_vld;
assign decd_dp_ag_imm[31:0]                 = hs_sel ? hs_decd_imm[31:0] : split_sel
                                            ? split_decd_ag_imm[31:0]
                                            : ((fdecd_decd_fp_inst_vld ? fdecd_decd_ill_expt : decd_ill_expt)
                                           |  decd_sel[5] // CP0
                                                          ? decd_inst_code[31:0]
                                                          : decd_ag_imm[31:0]);
assign decd_dp_rs1_idx[5:0]                 = hs_sel ? hs_decd_rs1[5:0] : split_sel_dp ? split_decd_rs1_idx[5:0] : {1'b0, decd_rs1[4:0]};
assign decd_dp_rs2_idx[5:0]                 = hs_sel ? hs_decd_rs2[5:0] : split_sel_dp ? split_decd_rs2_idx[5:0] : {1'b0, decd_rs2[4:0]};
assign decd_dp_rs1_vld                      = hs_sel ? hs_decd_rs1_vld : split_sel ? split_decd_rs1_vld : (decd_rs1_vld | fdecd_decd_rs1_int_vld);
assign decd_dp_rs2_vld                      = hs_sel ? hs_decd_rs2_vld : split_sel ? split_decd_rs2_vld : decd_rs2_vld;

assign decd_dp_csri_vld                     = decd_csri_vld & ~hs_sel;
assign decd_dp_split                        = hs_sel ? hs_decd_split : split_sel ? split_decd_split : 1'b0;
assign decd_dp_csri_rs1[4:0]                = decd_csri_rs1[4:0];
assign decd_dp_mul_high_sel                 = decd_mul_high_sel & ~hs_sel;
assign decd_dp_smal_vld                     = decd_smal_vld;
assign decd_dp_rd2_vld                      = decd_rd2_vld & decd_rv32p_op_vld;
assign decd_dp_lsu_sel                      = hs_sel ? (hs_decd_sel[SEL_WIDTH-1:0] == LSU) 
                                            : split_sel ? (split_decd_sel[SEL_WIDTH-1:0] == LSU)
                                            : (decd_sel[SEL_WIDTH-1:0] == LSU);
assign decd_dp_rs3_vld                      = decd_rs3_vld & ~hs_sel;
assign decd_dp_rs3_idx[5:0]                 = {1'b0, decd_rs3[4:0]};
assign decd_dp_rs4_vld                      = ~hs_sel & decd_rs4_vld;
assign decd_dp_rs4_idx[5:0]                 = {1'b0, decd_rs4[4:0]};
//assign decd_dp_str_vld                      = decd_str_vld;
assign decd_dp_lsr_vld                      = lsr_imm_vld & ~hs_sel;
assign decd_dp_ex_st_rs2_vld                = (decd_str_vld | decd_sti_vld) & ~hs_sel;

// split
// split inst: all amo, and lr/sc.aq/rl.
assign atm_aqrl = |decd_inst[26:25];

assign split_sel_pre = decd_sel[4] &          //LSU
                      decd_func[4] &     //amo inst
                     (decd_func[2] | decd_func[1] & atm_aqrl);
assign split_req    = split_sel_pre & ~decd_ill_expt;
assign split_sel_dp = split_decd_dp_sel;
assign split_sel     = split_decd_dp_sel;

assign decd_split_req = split_req & ~hs_sel;
assign decd_split_opcode[6:0]  = decd_inst[31:25];
assign decd_split_rs2_vld      = decd_rs2_vld;
assign decd_split_rs2_idx[4:0] = decd_inst[24:20];
assign decd_split_rs1_idx[4:0] = decd_inst[19:15];
assign decd_split_dst_idx[4:0] = decd_inst[11:7];

assign decd_hs_ipush_vld = decd_op[6:0] == 7'b0001011 & decd_func3[2:0] == 3'b0
                        & decd_inst[31:25] == 7'b0 & decd_inst[24:20] == 5'b00100
                        & decd_inst[19:15] == 5'b0 & decd_inst[11:7] == 5'b0
                        & cp0_yy_cskyisaee & (cp0_yy_mach_mode | rtu_yy_xx_dbgon)
                        & ~ifu_idu_id_expt_vld;
assign decd_hs_ipop_vld  = decd_op[6:0] == 7'b0001011 & decd_func3[2:0] == 3'b0
                        & decd_inst[31:25] == 7'b0 & decd_inst[24:20] == 5'b00101
                        & decd_inst[19:15] == 5'b0 & decd_inst[11:7] == 5'b0
                        & cp0_yy_cskyisaee & (cp0_yy_mach_mode | rtu_yy_xx_dbgon)
                        & ~ifu_idu_id_expt_vld;
assign hs_sel = hs_decd_dp_vld;

// &Force("nonport","flag"); @563
// &Force("nonport","clk"); @564
// &Force("nonport","rst"); @565
// &Force("nonport","addsl_inst_vld_local"); @566
// &Force("input","ctrl_id_inst_vld_fin"); @568

// &ModuleEnd; @594
endmodule


