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
module pa_cp0_iui(
  cp0_dtu_addr,
  cp0_dtu_rreg,
  cp0_dtu_wdata,
  cp0_dtu_wreg,
  cp0_idu_ex1_stall,
  cp0_iu_adder_borrow_in,
  cp0_iu_adder_borrow_vld,
  cp0_rtu_ex1_chgflw_pc,
  cp0_rtu_ex1_chgflw_vld,
  cp0_rtu_ex1_cmplt,
  cp0_rtu_ex1_cmplt_dp,
  cp0_rtu_ex1_dret,
  cp0_rtu_ex1_ebreak,
  cp0_rtu_ex1_expt_inst,
  cp0_rtu_ex1_expt_tval,
  cp0_rtu_ex1_expt_vec,
  cp0_rtu_ex1_flush,
  cp0_rtu_ex1_halt_info,
  cp0_rtu_ex1_inst_len,
  cp0_rtu_ex1_inst_vld,
  cp0_rtu_ex1_ipush_spec_fail,
  cp0_rtu_ex1_mret,
  cp0_rtu_ex1_split_inst,
  cp0_rtu_ex1_tail_fail,
  cp0_rtu_wb_data,
  cp0_rtu_wb_preg,
  cp0_rtu_wb_vld,
  cpurst_b,
  ext_iui_cache_stall,
  ext_iui_expt_vld,
  idu_cp0_ex1_cmplt_dp_sel,
  idu_cp0_ex1_dst_idx,
  idu_cp0_ex1_dst_vld,
  idu_cp0_ex1_expt_high,
  idu_cp0_ex1_expt_type,
  idu_cp0_ex1_expt_vld,
  idu_cp0_ex1_func,
  idu_cp0_ex1_gateclk_sel,
  idu_cp0_ex1_halt_info,
  idu_cp0_ex1_inst_len,
  idu_cp0_ex1_ipush_spec_fail,
  idu_cp0_ex1_opcode,
  idu_cp0_ex1_rs1,
  idu_cp0_ex1_rs2,
  idu_cp0_ex1_sel,
  idu_cp0_ex1_split_inst,
  idu_cp0_ex1_tail_fail,
  ifu_cp0_warm_up,
  iu_cp0_ex1_borrow_expt_pc,
  iui_csr_wen_f,
  iui_ext_inst_cache,
  iui_ext_inst_imm,
  iui_ext_inst_rs1,
  iui_regs_csr_mnxti_vld,
  iui_regs_csr_wen,
  iui_regs_imm,
  iui_regs_inst_csr,
  iui_regs_inst_mret,
  iui_regs_wdata,
  iui_regs_wdata_mie,
  iui_regs_wdata_rs1,
  iui_regs_wdata_srst,
  iui_special_ecall,
  iui_special_fence,
  iui_special_fencei,
  iui_special_int_vld,
  iui_special_sync,
  iui_special_synci,
  iui_special_wfi,
  regs_clk,
  regs_iui_expt_vld,
  regs_iui_mepc,
  regs_iui_mie,
  regs_iui_mnxti_sel,
  regs_iui_mstatus,
  regs_iui_pm,
  regs_iui_rdata,
  rtu_cp0_wk_int,
  rtu_yy_xx_dbgon,
  special_iui_expt_vld,
  special_iui_stall,
  srst_iui_stall
);

// &Ports; @24
input           cpurst_b;                   
input           ext_iui_cache_stall;        
input           ext_iui_expt_vld;           
input           idu_cp0_ex1_cmplt_dp_sel;   
input   [5 :0]  idu_cp0_ex1_dst_idx;        
input           idu_cp0_ex1_dst_vld;        
input           idu_cp0_ex1_expt_high;      
input           idu_cp0_ex1_expt_type;      
input           idu_cp0_ex1_expt_vld;       
input   [19:0]  idu_cp0_ex1_func;           
input           idu_cp0_ex1_gateclk_sel;    
input   [14:0]  idu_cp0_ex1_halt_info;      
input           idu_cp0_ex1_inst_len;       
input           idu_cp0_ex1_ipush_spec_fail; 
input   [31:0]  idu_cp0_ex1_opcode;         
input   [31:0]  idu_cp0_ex1_rs1;            
input   [11:0]  idu_cp0_ex1_rs2;            
input           idu_cp0_ex1_sel;            
input           idu_cp0_ex1_split_inst;     
input           idu_cp0_ex1_tail_fail;      
input           ifu_cp0_warm_up;            
input   [31:0]  iu_cp0_ex1_borrow_expt_pc;  
input           regs_clk;                   
input           regs_iui_expt_vld;          
input   [31:0]  regs_iui_mepc;              
input           regs_iui_mie;               
input           regs_iui_mnxti_sel;         
input   [31:0]  regs_iui_mstatus;           
input   [1 :0]  regs_iui_pm;                
input   [31:0]  regs_iui_rdata;             
input           rtu_cp0_wk_int;             
input           rtu_yy_xx_dbgon;            
input           special_iui_expt_vld;       
input           special_iui_stall;          
input           srst_iui_stall;             
output  [11:0]  cp0_dtu_addr;               
output          cp0_dtu_rreg;               
output  [31:0]  cp0_dtu_wdata;              
output          cp0_dtu_wreg;               
output          cp0_idu_ex1_stall;          
output          cp0_iu_adder_borrow_in;     
output          cp0_iu_adder_borrow_vld;    
output  [30:0]  cp0_rtu_ex1_chgflw_pc;      
output          cp0_rtu_ex1_chgflw_vld;     
output          cp0_rtu_ex1_cmplt;          
output          cp0_rtu_ex1_cmplt_dp;       
output          cp0_rtu_ex1_dret;           
output          cp0_rtu_ex1_ebreak;         
output          cp0_rtu_ex1_expt_inst;      
output  [31:0]  cp0_rtu_ex1_expt_tval;      
output  [3 :0]  cp0_rtu_ex1_expt_vec;       
output          cp0_rtu_ex1_flush;          
output  [14:0]  cp0_rtu_ex1_halt_info;      
output          cp0_rtu_ex1_inst_len;       
output          cp0_rtu_ex1_inst_vld;       
output          cp0_rtu_ex1_ipush_spec_fail; 
output          cp0_rtu_ex1_mret;           
output          cp0_rtu_ex1_split_inst;     
output          cp0_rtu_ex1_tail_fail;      
output  [31:0]  cp0_rtu_wb_data;            
output  [5 :0]  cp0_rtu_wb_preg;            
output          cp0_rtu_wb_vld;             
output          iui_csr_wen_f;              
output          iui_ext_inst_cache;         
output  [11:0]  iui_ext_inst_imm;           
output  [31:0]  iui_ext_inst_rs1;           
output          iui_regs_csr_mnxti_vld;     
output          iui_regs_csr_wen;           
output  [11:0]  iui_regs_imm;               
output          iui_regs_inst_csr;          
output          iui_regs_inst_mret;         
output  [31:0]  iui_regs_wdata;             
output          iui_regs_wdata_mie;         
output  [31:0]  iui_regs_wdata_rs1;         
output  [1 :0]  iui_regs_wdata_srst;        
output          iui_special_ecall;          
output          iui_special_fence;          
output          iui_special_fencei;         
output          iui_special_int_vld;        
output          iui_special_sync;           
output          iui_special_synci;          
output          iui_special_wfi;            

// &Regs; @25
reg             iui_csr_wen_f;              
reg     [31:0]  iui_expt_tval;              
reg     [3 :0]  iui_expt_vec;               

// &Wires; @26
wire    [11:0]  cp0_dtu_addr;               
wire            cp0_dtu_rreg;               
wire    [31:0]  cp0_dtu_wdata;              
wire            cp0_dtu_wreg;               
wire            cp0_idu_ex1_stall;          
wire            cp0_iu_adder_borrow_in;     
wire            cp0_iu_adder_borrow_vld;    
wire    [30:0]  cp0_rtu_ex1_chgflw_pc;      
wire            cp0_rtu_ex1_chgflw_vld;     
wire            cp0_rtu_ex1_cmplt;          
wire            cp0_rtu_ex1_cmplt_dp;       
wire            cp0_rtu_ex1_dret;           
wire            cp0_rtu_ex1_ebreak;         
wire            cp0_rtu_ex1_expt_inst;      
wire    [31:0]  cp0_rtu_ex1_expt_tval;      
wire    [3 :0]  cp0_rtu_ex1_expt_vec;       
wire            cp0_rtu_ex1_flush;          
wire    [14:0]  cp0_rtu_ex1_halt_info;      
wire            cp0_rtu_ex1_inst_len;       
wire            cp0_rtu_ex1_inst_vld;       
wire            cp0_rtu_ex1_ipush_spec_fail; 
wire            cp0_rtu_ex1_mret;           
wire            cp0_rtu_ex1_split_inst;     
wire            cp0_rtu_ex1_tail_fail;      
wire    [31:0]  cp0_rtu_wb_data;            
wire    [5 :0]  cp0_rtu_wb_preg;            
wire            cp0_rtu_wb_vld;             
wire            cpurst_b;                   
wire            ext_iui_cache_stall;        
wire            ext_iui_expt_vld;           
wire            idu_cp0_ex1_cmplt_dp_sel;   
wire    [5 :0]  idu_cp0_ex1_dst_idx;        
wire            idu_cp0_ex1_dst_vld;        
wire            idu_cp0_ex1_expt_high;      
wire            idu_cp0_ex1_expt_type;      
wire            idu_cp0_ex1_expt_vld;       
wire    [19:0]  idu_cp0_ex1_func;           
wire            idu_cp0_ex1_gateclk_sel;    
wire    [14:0]  idu_cp0_ex1_halt_info;      
wire            idu_cp0_ex1_inst_len;       
wire            idu_cp0_ex1_ipush_spec_fail; 
wire    [31:0]  idu_cp0_ex1_opcode;         
wire    [31:0]  idu_cp0_ex1_rs1;            
wire    [11:0]  idu_cp0_ex1_rs2;            
wire            idu_cp0_ex1_sel;            
wire            idu_cp0_ex1_split_inst;     
wire            idu_cp0_ex1_tail_fail;      
wire    [31:0]  iu_cp0_ex1_borrow_expt_pc;  
wire            iui_accflt_expt_vld;        
wire            iui_cancel;                 
wire    [31:0]  iui_chgflw_pc;              
wire            iui_chgflw_vld;             
wire            iui_csr_expt_vld;           
wire    [31:0]  iui_csr_mstatus;            
wire    [31:0]  iui_csr_rdata;              
wire            iui_csr_umode_inv;          
wire    [31:0]  iui_csr_wdata;              
wire    [31:0]  iui_csr_wdata_mstatus;      
wire            iui_csr_wen;                
wire            iui_csr_wen_vld;            
wire            iui_csr_write_inv;          
wire    [31:0]  iui_csrrc_rs1;              
wire    [31:0]  iui_csrrc_rs1_mstatus;      
wire    [31:0]  iui_csrrs_rs1;              
wire    [31:0]  iui_csrrs_rs1_mstatus;      
wire    [31:0]  iui_csrrw_rs1;              
wire            iui_ebreak_expt_vld;        
wire            iui_expt_vld;               
wire            iui_ext_inst_cache;         
wire    [11:0]  iui_ext_inst_imm;           
wire    [31:0]  iui_ext_inst_rs1;           
wire            iui_illegal_expt_vld;       
wire            iui_inst_cache;             
wire            iui_inst_cmplt;             
wire            iui_inst_csr;               
wire    [2 :0]  iui_inst_csr_func;          
wire            iui_inst_dret;              
wire    [5 :0]  iui_inst_dst_idx;           
wire            iui_inst_dst_vld;           
wire            iui_inst_ebrek;             
wire            iui_inst_ecall;             
wire            iui_inst_fence;             
wire            iui_inst_fenci;             
wire            iui_inst_flush;             
wire    [5 :0]  iui_inst_func;              
wire    [14:0]  iui_inst_halt_info;         
wire    [11:0]  iui_inst_imm;               
wire            iui_inst_ipush_spec_fail;   
wire            iui_inst_mret;              
wire            iui_inst_mret_vld;          
wire    [31:0]  iui_inst_opcode;            
wire    [31:0]  iui_inst_rs1;               
wire            iui_inst_split_inst;        
wire            iui_inst_stall;             
wire    [4 :0]  iui_inst_sub_func;          
wire            iui_inst_sync;              
wire            iui_inst_synci;             
wire            iui_inst_tail_fail;         
wire            iui_inst_vld;               
wire            iui_inst_wfi;               
wire            iui_mecall_expt_vld;        
wire            iui_mret_umode_inv;         
wire            iui_regs_csr_mnxti_vld;     
wire            iui_regs_csr_wen;           
wire    [11:0]  iui_regs_imm;               
wire            iui_regs_inst_csr;          
wire            iui_regs_inst_mret;         
wire    [31:0]  iui_regs_wdata;             
wire            iui_regs_wdata_mie;         
wire    [31:0]  iui_regs_wdata_rs1;         
wire    [1 :0]  iui_regs_wdata_srst;        
wire            iui_special_ebrek;          
wire            iui_special_ecall;          
wire            iui_special_fence;          
wire            iui_special_fencei;         
wire            iui_special_int_vld;        
wire            iui_special_sync;           
wire            iui_special_synci;          
wire            iui_special_wfi;            
wire            iui_uecall_expt_vld;        
wire            iui_wfi_umode_inv;          
wire            regs_clk;                   
wire            regs_iui_expt_vld;          
wire    [31:0]  regs_iui_mepc;              
wire            regs_iui_mie;               
wire            regs_iui_mnxti_sel;         
wire    [31:0]  regs_iui_mstatus;           
wire    [1 :0]  regs_iui_pm;                
wire    [31:0]  regs_iui_rdata;             
wire            rtu_cp0_wk_int;             
wire            rtu_yy_xx_dbgon;            
wire            special_iui_expt_vld;       
wire            special_iui_stall;          
wire            srst_iui_stall;             


//==========================================================
// CP0 IUI Module
// 1. Prepare CSR and Special Inst Information
// 2. Generate Retire and Exception Signals
//==========================================================

//------------------------------------------------
// 1. Prepare CSR and Special Inst Information
// a. Get the instruction functions
// b. Generate CSR Inst Information
// c. Generate Special Inst Information
//------------------------------------------------
// &Force("bus","idu_cp0_ex1_func",19,0); @40
// a. Get the instruction functions
assign iui_inst_vld           = idu_cp0_ex1_gateclk_sel && !idu_cp0_ex1_expt_vld && !iui_cancel;
assign iui_inst_func[5:0]     = idu_cp0_ex1_func[10:5];
assign iui_inst_sub_func[4:0] = idu_cp0_ex1_func[4:0];
assign iui_inst_dst_vld       = idu_cp0_ex1_gateclk_sel && idu_cp0_ex1_dst_vld;
assign iui_inst_dst_idx[5:0]  = idu_cp0_ex1_dst_idx[5:0];
// &Force("bus", "idu_cp0_ex1_dst_idx", 5, 0); @47
assign iui_inst_rs1[31:0]     = idu_cp0_ex1_rs1[31:0];
assign iui_inst_imm[11:0]     = {12{idu_cp0_ex1_gateclk_sel}} & idu_cp0_ex1_rs2[11:0];
assign iui_inst_opcode[31:0] = {32{idu_cp0_ex1_gateclk_sel}} & idu_cp0_ex1_opcode[31:0];
assign iui_inst_halt_info[`TDT_HINFO_WIDTH-1:0] = 
  {`TDT_HINFO_WIDTH{idu_cp0_ex1_gateclk_sel}} & idu_cp0_ex1_halt_info[`TDT_HINFO_WIDTH-1:0];
assign iui_inst_ipush_spec_fail  = idu_cp0_ex1_ipush_spec_fail;
assign iui_inst_tail_fail        = idu_cp0_ex1_tail_fail;
assign iui_inst_split_inst       = idu_cp0_ex1_split_inst;
// b. Generate CSR Inst Information
// CSR Write Enable
assign iui_inst_csr = iui_inst_vld && iui_inst_func[0];
assign iui_csr_wen  = iui_inst_vld && iui_inst_func[0]
                   && !iui_inst_sub_func[3];
// &Force("input","ifu_cp0_warm_up"); @61
always @ (posedge regs_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    iui_csr_wen_f <= 1'b0;
  else if (iui_regs_csr_wen && iui_inst_stall)
    iui_csr_wen_f <= 1'b1;
  else
    iui_csr_wen_f <= 1'b0;
end

assign iui_csr_wen_vld = iui_regs_csr_wen && !iui_csr_wen_f
                                     && !iui_csr_expt_vld;
// &Force("output","iui_csr_wen_f"); @75
// &Force("input","regs_clk"); @78
// CSR Func 0:CSRRW, 1: CSRRS, 2: CSRRC
assign iui_inst_csr_func[2:0] = {3{idu_cp0_ex1_func[5]}}
                              & idu_cp0_ex1_func[2:0];

// CSR write data prepare
assign iui_csr_rdata[31:0] = regs_iui_rdata[31:0];
assign iui_csrrw_rs1[31:0] = iui_inst_rs1[31:0];
assign iui_csrrs_rs1[31:0] = iui_csr_rdata[31:0] |   iui_inst_rs1[31:0];
assign iui_csrrc_rs1[31:0] = iui_csr_rdata[31:0] & (~iui_inst_rs1[31:0]);

assign iui_csr_wdata[31:0] = {32{iui_inst_csr_func[0]}} & iui_csrrw_rs1[31:0]
                           | {32{iui_inst_csr_func[1]}} & iui_csrrs_rs1[31:0]
                           | {32{iui_inst_csr_func[2]}} & iui_csrrc_rs1[31:0];
assign iui_regs_csr_mnxti_vld = !(iui_inst_rs1[31:0] == 32'b0 && (iui_inst_csr_func[1]
                                                         || iui_inst_csr_func[2]));

assign iui_csr_mstatus[31:0] = regs_iui_mstatus[31:0];
assign iui_csrrs_rs1_mstatus[31:0] = iui_csr_mstatus[31:0] |   iui_inst_rs1[31:0];
assign iui_csrrc_rs1_mstatus[31:0] = iui_csr_mstatus[31:0] & (~iui_inst_rs1[31:0]);

assign iui_csr_wdata_mstatus[31:0] = {32{iui_inst_csr_func[0]}} & iui_csrrw_rs1[31:0]
                           | {32{iui_inst_csr_func[1]}} & iui_csrrs_rs1_mstatus[31:0]
                           | {32{iui_inst_csr_func[2]}} & iui_csrrc_rs1_mstatus[31:0];

assign iui_regs_wdata_srst[1:0] = {2{|iui_inst_csr_func[1:0]}} & iui_inst_rs1[1:0]; // srst[1:0] is always 2'b0.
assign iui_regs_wdata_mie  = iui_inst_csr_func[0] && iui_inst_rs1[3]
                          || iui_inst_csr_func[1] && (regs_iui_mie ||  iui_inst_rs1[3])
                          || iui_inst_csr_func[2] && (regs_iui_mie && !iui_inst_rs1[3]);
// mie is mstatus[3].

// c. Generate Special Inst Information
assign iui_inst_fence = iui_inst_vld && iui_inst_func[1]
                     && iui_inst_sub_func[0];
assign iui_inst_fenci = iui_inst_vld && iui_inst_func[1]
                     && iui_inst_sub_func[1];
assign iui_inst_sync  = iui_inst_vld && iui_inst_func[1]
                     && iui_inst_sub_func[2];
assign iui_inst_synci = iui_inst_vld && iui_inst_func[1]
                      && iui_inst_sub_func[3];
assign iui_inst_ecall = iui_inst_vld && iui_inst_func[2]
                     && iui_inst_sub_func[0] && !rtu_yy_xx_dbgon;
assign iui_inst_ebrek = iui_inst_vld && iui_inst_func[2]
                     && iui_inst_sub_func[1];
assign iui_inst_mret  = iui_inst_vld && iui_inst_func[2]
                     && iui_inst_sub_func[2]&&  !rtu_yy_xx_dbgon;
assign iui_inst_wfi   = iui_inst_vld && iui_inst_func[2]
                     && iui_inst_sub_func[3] && !rtu_yy_xx_dbgon;
assign iui_inst_cache = iui_inst_vld && iui_inst_func[2]
                     && iui_inst_sub_func[4];
                     
assign iui_inst_dret   = iui_inst_vld && iui_inst_sub_func[1]
                      && iui_inst_func[4] && rtu_yy_xx_dbgon;
//------------------------------------------------
// 2. Generate Retire and Exception Signals
// a. Inst Complete
// b. Inst Exception
// c. Change Flow
//------------------------------------------------

// a. Inst Complete
// Inst Complete except for WFI stall
// assign iui_inst_cmplt = idu_cp0_ex1_sel && (!special_iui_stall
//                                           || iui_inst_cache && ext_iui_cache_stall);
assign iui_inst_cmplt = idu_cp0_ex1_sel && !iui_inst_stall;
assign iui_inst_stall = iui_inst_cache && ext_iui_cache_stall
                     || srst_iui_stall
                     || special_iui_stall;

assign iui_inst_flush = iui_inst_cmplt && !(iui_inst_func[0] && iui_inst_sub_func[3]
                                         || iui_inst_fence || iui_inst_sync)
                        && !idu_cp0_ex1_expt_vld
                        && !iui_cancel;


// b. Inst Exception
// Invalid operation when write read-only regs
assign iui_csr_write_inv = iui_csr_wen && iui_inst_imm[11:10] == 2'b11;
assign iui_csr_umode_inv = regs_iui_pm[1:0] == 2'b00 && !rtu_yy_xx_dbgon
                         && iui_inst_csr && iui_inst_imm[9:8] != 2'b00;
assign iui_mret_umode_inv = regs_iui_pm[1:0] == 2'b00 && iui_inst_mret && !rtu_yy_xx_dbgon;
assign iui_wfi_umode_inv  = regs_iui_pm[1:0] == 2'b00 && iui_inst_wfi && !rtu_yy_xx_dbgon;
assign iui_csr_expt_vld  = iui_csr_write_inv || iui_csr_umode_inv
                        || iui_inst_csr && regs_iui_expt_vld
                        || iui_inst_cache && ext_iui_expt_vld;
assign iui_expt_vld      = (idu_cp0_ex1_expt_vld
                          || iui_csr_expt_vld
                          || iui_mret_umode_inv
                          || iui_wfi_umode_inv
                          || special_iui_expt_vld)
                          && idu_cp0_ex1_gateclk_sel;
assign iui_cancel   = iui_inst_halt_info[`TDT_HINFO_CANCEL]
                      && idu_cp0_ex1_gateclk_sel;
//// Generate iui int vector
//assign iui_int_vld = |regs_iui_int_sel[2:0];
//&CombBeg;
//casez(regs_iui_int_sel[2:0])
//  3'b1??  : iui_int_vec[3:0] = 4'd11;
//  3'b01?  : iui_int_vec[3:0] = 4'd7;
//  3'b001  : iui_int_vec[3:0] = 4'd3;
//  default : iui_int_vec[3:0] = 3'bx;
//endcase
//&CombEnd;

// Generate iui expt vector
assign iui_accflt_expt_vld  = idu_cp0_ex1_expt_vld && idu_cp0_ex1_expt_type;
assign iui_illegal_expt_vld = idu_cp0_ex1_expt_vld && !idu_cp0_ex1_expt_type
                           || iui_csr_expt_vld
                           || iui_mret_umode_inv
                           || iui_wfi_umode_inv;
assign iui_mecall_expt_vld  = iui_inst_ecall && regs_iui_pm[1:0] == 2'b11;
assign iui_uecall_expt_vld  = iui_inst_ecall && regs_iui_pm[1:0] == 2'b00;
assign iui_ebreak_expt_vld  = iui_inst_ebrek;

// &CombBeg; @193
always @( iui_illegal_expt_vld
       or iui_uecall_expt_vld
       or iui_mecall_expt_vld
       or iui_ebreak_expt_vld
       or iui_accflt_expt_vld)
begin
  if(iui_accflt_expt_vld)
    iui_expt_vec[3:0] = 4'd1;
  else if(iui_illegal_expt_vld)
    iui_expt_vec[3:0] = 4'd2;
  else if(iui_mecall_expt_vld)
    iui_expt_vec[3:0] = 4'd11;
  else if(iui_uecall_expt_vld)
    iui_expt_vec[3:0] = 4'd8;
  else if(iui_ebreak_expt_vld)
    iui_expt_vec[3:0] = 4'd3;
  else
    iui_expt_vec[3:0] = 4'd0;
// &CombEnd; @206
end

//assign iui_ex1_pc[31:0] = {`PA_WIDTH{idu_cp0_ex1_gateclk_sel}} & iu_cp0_ex1_cur_pc[31:0];
//assign iui_ex1_expt_pc[31:0] = iui_ex1_pc[31:0]
//                                      + {{(`PA_WIDTH-2){1'b0}}, idu_cp0_ex1_expt_high, 1'b0};
assign cp0_iu_adder_borrow_vld   = idu_cp0_ex1_gateclk_sel & (iui_accflt_expt_vld | iui_cancel);
assign cp0_iu_adder_borrow_in    = idu_cp0_ex1_expt_high;
// &CombBeg; @213
always @( iui_cancel
       or iui_inst_opcode[31:0]
       or iu_cp0_ex1_borrow_expt_pc[31:0]
       or iui_accflt_expt_vld)
begin
  if (iui_accflt_expt_vld || iui_cancel)
    iui_expt_tval[31:0] = iu_cp0_ex1_borrow_expt_pc[31:0];
  else
    iui_expt_tval[31:0] = {iui_inst_opcode[31:0]};
// &CombEnd; @218
end


// c. Change Flow
assign iui_inst_mret_vld   = iui_inst_mret && !iui_mret_umode_inv;
assign iui_chgflw_vld      = iui_inst_mret_vld  && !iui_cancel;
assign iui_chgflw_pc[31:0] = regs_iui_mepc[31:0];

//==========================================================
// Rename for Output
//==========================================================

// Output to Regs
assign iui_regs_imm[11:0]       = iui_inst_imm[11:0];
// &Force("output","iui_regs_csr_wen"); @232
assign iui_regs_csr_wen         = iui_csr_wen && !iui_csr_expt_vld;
assign iui_regs_wdata[31:0]     = regs_iui_mnxti_sel ? iui_csr_wdata_mstatus[31:0]
                                                     : iui_csr_wdata[31:0];
assign iui_regs_wdata_rs1[31:0] = iui_csrrw_rs1[31:0];
assign iui_regs_inst_csr        = iui_inst_csr && !iui_csr_expt_vld;
assign iui_regs_inst_mret       = iui_inst_mret_vld;
// &Force("output","iui_regs_inst_csr"); @241
// Output to Regs
assign iui_special_fence   = iui_inst_fence;
assign iui_special_fencei  = iui_inst_fenci;
assign iui_special_sync    = iui_inst_sync;
assign iui_special_synci   = iui_inst_synci;
assign iui_special_ecall   = iui_inst_ecall;
assign iui_special_ebrek   = iui_inst_ebrek;
assign iui_special_wfi     = iui_inst_wfi  && !iui_wfi_umode_inv;
assign iui_special_int_vld = rtu_cp0_wk_int;
// Output to ext
assign iui_ext_inst_imm[11:0] = iui_inst_imm[11:0];
assign iui_ext_inst_cache     = iui_inst_cache;
assign iui_ext_inst_rs1[31:0] = iui_inst_rs1[31:0];

// Output to RTU
assign cp0_rtu_ex1_cmplt    = iui_inst_cmplt;
assign cp0_rtu_ex1_cmplt_dp = idu_cp0_ex1_cmplt_dp_sel;
assign cp0_rtu_ex1_flush    = iui_inst_flush;
assign cp0_idu_ex1_stall    = iui_inst_stall;

assign cp0_rtu_ex1_inst_vld = idu_cp0_ex1_gateclk_sel;
assign cp0_rtu_ex1_expt_inst      = iui_expt_vld;
assign cp0_rtu_ex1_expt_vec[3:0] = iui_expt_vec[3:0];

assign cp0_rtu_ex1_chgflw_vld       = iui_chgflw_vld;
assign cp0_rtu_ex1_chgflw_pc[30:0]  = iui_chgflw_pc[31:1];

assign cp0_rtu_wb_vld          = iui_inst_cmplt && iui_inst_dst_vld && !iui_expt_vld & ~iui_cancel;
assign cp0_rtu_wb_preg[5:0]    = {iui_inst_dst_idx[5:0]};
assign cp0_rtu_wb_data[31:0]   = iui_expt_vld ? idu_cp0_ex1_opcode[31:0]
                                               : regs_iui_rdata[31:0];

//assign cp0_rtu_ex1_inst_bkpt[8:0] = idu_cp0_ex1_inst_bkpt[8:0];

assign cp0_rtu_ex1_mret       = iui_inst_mret_vld;
assign cp0_rtu_ex1_dret       = iui_inst_dret;
assign cp0_rtu_ex1_ebreak     = iui_special_ebrek;
assign cp0_rtu_ex1_ipush_spec_fail = iui_inst_ipush_spec_fail;
assign cp0_rtu_ex1_tail_fail  = iui_inst_tail_fail;
assign cp0_rtu_ex1_split_inst = iui_inst_split_inst;
assign cp0_rtu_ex1_expt_tval[31:0]      = iui_expt_tval[31:0];
assign cp0_rtu_ex1_inst_len             = idu_cp0_ex1_inst_len;
assign cp0_rtu_ex1_halt_info[`TDT_HINFO_WIDTH-1:0] = iui_inst_halt_info[`TDT_HINFO_WIDTH-1:0];
// Output to Sysio
//
//----------------------------------------------------------
//                         For DTU
//----------------------------------------------------------
assign cp0_dtu_wreg        = iui_csr_wen_vld;
assign cp0_dtu_rreg        = iui_regs_inst_csr;
assign cp0_dtu_addr[11:0]  = iui_inst_imm[11:0];
assign cp0_dtu_wdata[31:0] = iui_csr_wdata[31:0];


// &ModuleEnd; @304
endmodule


