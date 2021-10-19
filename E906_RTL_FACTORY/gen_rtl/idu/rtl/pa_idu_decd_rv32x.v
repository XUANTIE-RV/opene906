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
module pa_idu_decd_rv32x(
  cp0_yy_cskyisaee,
  cp0_yy_mach_mode,
  decd_func3,
  decd_func7,
  decd_inst,
  decd_op,
  decd_rv32x_func,
  decd_rv32x_ill_expt,
  decd_rv32x_imm1,
  decd_rv32x_imm1_vld,
  decd_rv32x_imm2,
  decd_rv32x_imm2_vld,
  decd_rv32x_op_vld,
  decd_rv32x_rd1_vld,
  decd_rv32x_rd2,
  decd_rv32x_rd2_vld,
  decd_rv32x_rs1,
  decd_rv32x_rs2,
  decd_rv32x_rs2_vld,
  decd_rv32x_rs3_vld,
  decd_rv32x_sel,
  dp_decd_rs2_aft_fwd,
  rtu_yy_xx_dbgon
);

// &Ports; @28
input           cp0_yy_cskyisaee;    
input           cp0_yy_mach_mode;    
input   [2 :0]  decd_func3;          
input   [6 :0]  decd_func7;          
input   [31:0]  decd_inst;           
input   [6 :0]  decd_op;             
input   [31:0]  dp_decd_rs2_aft_fwd; 
input           rtu_yy_xx_dbgon;     
output  [19:0]  decd_rv32x_func;     
output          decd_rv32x_ill_expt; 
output  [31:0]  decd_rv32x_imm1;     
output          decd_rv32x_imm1_vld; 
output  [31:0]  decd_rv32x_imm2;     
output          decd_rv32x_imm2_vld; 
output          decd_rv32x_op_vld;   
output          decd_rv32x_rd1_vld;  
output  [4 :0]  decd_rv32x_rd2;      
output          decd_rv32x_rd2_vld;  
output  [4 :0]  decd_rv32x_rs1;      
output  [4 :0]  decd_rv32x_rs2;      
output          decd_rv32x_rs2_vld;  
output          decd_rv32x_rs3_vld;  
output  [5 :0]  decd_rv32x_sel;      

// &Regs; @29
reg     [19:0]  decd_cache_func;     
reg             decd_cache_illegal;  
reg             decd_cache_imm1_vld; 
reg     [5 :0]  decd_cache_sel;      
reg             decd_dst1_vld;       
reg     [19:0]  decd_func;           
reg             decd_ill_expt;       
reg             decd_imm1_vld;       
reg             decd_rs3_vld;        
reg     [5 :0]  decd_sel;            
reg     [19:0]  decd_sync_func;      
reg             decd_sync_imm1_vld;  
reg     [5 :0]  decd_sync_sel;       

// &Wires; @30
wire            addsl_imm_vld;       
wire            cp0_yy_cskyisaee;    
wire            cp0_yy_mach_mode;    
wire            decd_dst2_vld;       
wire    [2 :0]  decd_func3;          
wire    [6 :0]  decd_func7;          
wire    [31:0]  decd_imm1;           
wire    [31:0]  decd_imm2;           
wire            decd_imm2_vld;       
wire    [31:0]  decd_inst;           
wire    [6 :0]  decd_op;             
wire    [6 :0]  decd_op_ext;         
wire    [4 :0]  decd_rd2;            
wire            decd_rs2_vld;        
wire            decd_rs2_vld_enc_ext; 
wire            decd_rs2_vld_mcu_ext; 
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
wire    [31:0]  dp_decd_rs2_aft_fwd; 
wire    [31:0]  eitype_imm;          
wire            eitype_imm_vld;      
wire    [31:0]  ext_imm;             
wire            ext_imm_vld;         
wire    [31:0]  lsi_imm;             
wire            lsi_imm_vld;         
wire    [31:0]  lsr_imm;             
wire            lsr_imm_vld;         
wire            rtu_yy_xx_dbgon;     


// &Force("bus", "decd_inst", 31, 0); @32
//==========================================================
//           Decoder for T-Head Ext Instructions
//==========================================================
// main decoder produces operation information, operand 
// information and oper prepare information,
// all values are defined by parameter.
// Reliazed Packages: MCU-Ext, Encryption-Ext, Cache-ops-Ext
assign decd_op_ext[6:0] = 7'b0001011;

// &CombBeg; @42
always @( decd_sync_func[19:0]
       or decd_cache_sel[5:0]
       or decd_sync_imm1_vld
       or decd_sync_sel[5:0]
       or decd_func3[2:0]
       or decd_func7[6:0]
       or decd_cache_imm1_vld
       or decd_cache_func[19:0]
       or decd_op_ext[6:0])
begin
  decd_sel[`SEL_WIDTH-1:0]   = {`SEL_WIDTH{1'b0}};
  decd_func[`FUNC_WIDTH-1:0] = {`FUNC_WIDTH{1'b0}};
  decd_imm1_vld              = 1'b0;
  decd_rs3_vld               = 1'b0;
  decd_dst1_vld              = 1'b0;
  casez({decd_func7[6:0], decd_func3[2:0], decd_op_ext[6:0]})
    //==========================================================
    //                Extension Inst Decoder
    //==========================================================
    17'b??????10000001011: // LSU Cache OPs
    begin
      decd_sel[`SEL_WIDTH-1:0]   = decd_cache_sel[`SEL_WIDTH-1:0];
      decd_func[`FUNC_WIDTH-1:0] = decd_cache_func[`FUNC_WIDTH-1:0];
      decd_imm1_vld              = decd_cache_imm1_vld;
    end
    17'b??????00000001011: // CP0 Cache OPs
    begin
      decd_sel[`SEL_WIDTH-1:0]   = decd_sync_sel[`SEL_WIDTH-1:0];
      decd_func[`FUNC_WIDTH-1:0] = decd_sync_func[`FUNC_WIDTH-1:0];
      decd_imm1_vld              = decd_sync_imm1_vld;
    end
    default:
    begin
      decd_sel[`SEL_WIDTH-1:0]   = {`SEL_WIDTH{1'b0}};
      decd_func[`FUNC_WIDTH-1:0] = {`FUNC_WIDTH{1'bx}};
      decd_imm1_vld              = 1'b0;
      decd_rs3_vld               = 1'b0;
      decd_dst1_vld              = 1'b0;
    end
  endcase
// &CombEnd; @378
end

// &CombBeg; @380
always @( decd_inst[24:20])
begin
  case(decd_inst[24:20])
    5'b01010: // DCACHE.IPA
    begin
      decd_cache_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_cache_func[`FUNC_WIDTH-1:0] = `FUNC_DIPA;
      decd_cache_imm1_vld              = 1'b1;
    end
    5'b01001: // DCACHE.CPA
    begin
      decd_cache_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_cache_func[`FUNC_WIDTH-1:0] = `FUNC_DCPA;
      decd_cache_imm1_vld              = 1'b1;
    end
    5'b01011: // DCACHE.CIPA
    begin
      decd_cache_sel[`SEL_WIDTH-1:0]   = `SEL_LSU;
      decd_cache_func[`FUNC_WIDTH-1:0] = `FUNC_DCIPA;
      decd_cache_imm1_vld              = 1'b1;
    end
    default: // Cache Ops
    begin
      decd_cache_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_cache_func[`FUNC_WIDTH-1:0] = `FUNC_CAOPS;
      decd_cache_imm1_vld              = 1'b1;
    end
  endcase
// &CombEnd; @407
end

// &CombBeg; @409
always @( decd_inst[24:21])
begin
  case(decd_inst[24:21])
    4'b0010: // IPUSH IPOP
    begin
      decd_sync_sel[`SEL_WIDTH-1:0]   = `SEL_ALU;
      decd_sync_func[`FUNC_WIDTH-1:0] = `FUNC_ADD;
      decd_sync_imm1_vld              = 1'b1;
    end
    4'b1100: // SYNC SYNC.S
    begin
      decd_sync_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_sync_func[`FUNC_WIDTH-1:0] = `FUNC_SYNC;
      decd_sync_imm1_vld              = 1'b1;
    end
    4'b1101: // SYNC.I SYNC.IS
    begin
      decd_sync_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_sync_func[`FUNC_WIDTH-1:0] = `FUNC_SYNCI;
      decd_sync_imm1_vld              = 1'b1;
    end
    default: // Cache Ops
    begin
      decd_sync_sel[`SEL_WIDTH-1:0]   = `SEL_CP0;
      decd_sync_func[`FUNC_WIDTH-1:0] = `FUNC_CAOPS;
      decd_sync_imm1_vld              = 1'b1;
    end
  endcase
// &CombEnd; @436
end

//==========================================================
// Operand Index Decode
//==========================================================
assign decd_rs2_vld_enc_ext = 1'b0;

assign decd_rs2_vld_mcu_ext = 1'b0;

assign decd_rs2_vld  = decd_rs2_vld_enc_ext | decd_rs2_vld_mcu_ext;
assign decd_dst2_vld = decd_op[6:0] == 7'b0001011 & decd_func3[2:1] == 2'b10 & decd_func7[2]; // LDI STI
assign decd_rd2[4:0] = decd_inst[19:15];

//==========================================================
// Immediate Generation
//==========================================================
// EI-Type: Extension Imm Insts
assign eitype_imm_vld   = decd_inst[6:0] == 7'b0001011 & decd_func3[2:1] != 2'b01 & decd_func3[2:1] != 2'b10 
                        & ~(decd_func3[2:1] == 2'b00 & decd_func7[6:4] == 3'b001)
                        & ~addsl_imm_vld;
assign eitype_imm[31:0] = {20'b0, decd_inst[31:20]};

// EXT imm1:imm2:
assign ext_imm_vld   = decd_op[6:0] == 7'b0001011 & decd_func3[2:1] == 2'b01;
assign ext_imm[31:0] = {22'b0, decd_inst[30:26], decd_inst[24:20]};


// LSI sign(imm5 << imm2):
assign lsi_imm_vld     = decd_op[6:0] == 7'b0001011 & decd_func3[2:1] == 2'b10 & decd_func7[2]; // lsi
assign lsi_imm[31:0]   = {32{decd_inst[26:25] == 2'b00}} & {{27{decd_inst[24]}}, decd_inst[24:20]}
                       | {32{decd_inst[26:25] == 2'b01}} & {{26{decd_inst[24]}}, decd_inst[24:20], 1'b0}
                       | {32{decd_inst[26:25] == 2'b10}} & {{25{decd_inst[24]}}, decd_inst[24:20], 2'b0}
                       | {32{decd_inst[26:25] == 2'b11}} & {{24{decd_inst[24]}}, decd_inst[24:20], 3'b0};

// ADDSL imm2: same with LRI
assign addsl_imm_vld = decd_op[6:0] == 7'b0001011 & decd_func3[2:0] == 3'b001
                     & decd_func7[6:2] == 5'b0;
// LRI sign(rs2 << imm2):
assign lsr_imm_vld     = decd_op[6:0] == 7'b0001011 & decd_func3[2:1] == 2'b10 & ~decd_func7[2]; // lsr
assign lsr_imm[31:0]   = {32{decd_inst[26:25] == 2'b00}} & {dp_decd_rs2_aft_fwd[31:0]}
                       | {32{decd_inst[26:25] == 2'b01}} & {dp_decd_rs2_aft_fwd[30:0], 1'b0}
                       | {32{decd_inst[26:25] == 2'b10}} & {dp_decd_rs2_aft_fwd[29:0], 2'b0}
                       | {32{decd_inst[26:25] == 2'b11}} & {dp_decd_rs2_aft_fwd[28:0], 3'b0};

assign decd_imm1[31:0] = {32{eitype_imm_vld}} & eitype_imm[31:0]
                       | {32{ext_imm_vld}}    & ext_imm[31:0]
                       | {32{addsl_imm_vld}}  & lsr_imm[31:0];

assign decd_imm2_vld = lsi_imm_vld | lsr_imm_vld;
assign decd_imm2[31:0] = {32{lsi_imm_vld}}    & lsi_imm[31:0]
                       | {32{lsr_imm_vld}}    & lsr_imm[31:0];

//==========================================================
//               ILLEGAL INST
//==========================================================
// &CombBeg; @506
always @( decd_inst[31:25]
       or cp0_yy_cskyisaee
       or decd_inst[14:2]
       or decd_cache_illegal)
begin
  casez({decd_inst[31:25], decd_inst[14:12], decd_inst[6:2]})
    15'b000000?00000010:  // Cache Ops
    begin
      decd_ill_expt = decd_cache_illegal
                    | decd_inst[11:7] != {5{1'b0}}
                    | ~cp0_yy_cskyisaee; // initial invalid instruction exception
    end
    default:
    begin
      decd_ill_expt = 1'b1; // all other insts are illegal
    end
  endcase
// &CombEnd; @548
end

// Cache OP illegal
// &CombBeg; @551
always @( rtu_yy_xx_dbgon
       or decd_inst[25:15]
       or cp0_yy_mach_mode)
begin
  decd_cache_illegal = 1'b0;
  casez({decd_inst[25],decd_inst[24:20],decd_inst[19:15]})
    11'b0_00010_00000, //dcache.iall
    11'b0_00001_00000, //dcache.call
    11'b0_00011_00000, //dcache.ciall
    11'b1_00010_?????, //dcache.isw
    11'b1_00001_?????, //dcache.csw
    11'b1_00011_?????, //dcache.cisw
    11'b1_01010_?????, //dcache.ipa
    11'b1_01001_?????, //dcache.cpa
    11'b1_01011_?????, //dcache.cipa
    11'b0_10000_00000, //icache.iall
    11'b0_10001_00000, //icache.ialls  
    11'b1_11000_?????: //icache.ipa
    begin
      decd_cache_illegal = ~cp0_yy_mach_mode & ~rtu_yy_xx_dbgon; // Only sync inst can execution in U-mode.
    end
    11'b1_00110_?????, //dcache.iva    // not implemented
    11'b1_00101_?????, //dcache.cva    // not implemented
    11'b1_00100_?????, //dcache.cval1  // not implemented
    11'b1_00111_?????, //dcache.civa   // not implemented
    11'b1_01000_?????, //dcache.cpal1  // not implemented

    11'b1_10000_?????, //icache.iva    // not implemented

    11'b0_10110_00000, //l2cache.iall  // not implemented
    11'b0_10101_00000, //l2cache.call  // not implemented
    11'b0_10111_00000, //l2cache.ciall // not implemented

    11'b0_11001_00000, //sync.s        
    11'b0_11011_00000, //sync.is       
    11'b0_11000_00000, //sync
    11'b0_11010_00000: //sync.i
    begin
      decd_cache_illegal = 1'b0;  //invalid instruction exception
    end
    11'b0_00100_00000, //ipush
    11'b0_00101_00000: //ipop
    begin
      decd_cache_illegal = ~cp0_yy_mach_mode & ~rtu_yy_xx_dbgon; // Only sync inst can execution in U-mode.
    end
    default: 
    begin                
      decd_cache_illegal = 1'b1;  //invalid instruction exception
    end
  endcase
// &CombEnd; @600
end

//==========================================================
//     Rename output decoded information for merge
//==========================================================
assign decd_rv32x_op_vld                = decd_op[6:0] == 7'b0001011;
assign decd_rv32x_sel[`SEL_WIDTH-1:0]   = decd_sel[`SEL_WIDTH-1:0];
assign decd_rv32x_func[`FUNC_WIDTH-1:0] = decd_func[`FUNC_WIDTH-1:0];

assign decd_rv32x_rs1[4:0]              = decd_inst[19:15];
assign decd_rv32x_rs2[4:0]              = decd_inst[24:20];
      
assign decd_rv32x_rs2_vld               = decd_rs2_vld;
assign decd_rv32x_rs3_vld               = decd_rs3_vld;
assign decd_rv32x_rd1_vld               = decd_dst1_vld;
assign decd_rv32x_rd2_vld               = decd_dst2_vld;
assign decd_rv32x_rd2[4:0]              = decd_rd2[4:0];

assign decd_rv32x_imm1_vld              = decd_imm1_vld;
assign decd_rv32x_imm1[31:0]            = decd_imm1[31:0];
assign decd_rv32x_imm2_vld              = decd_imm2_vld;
assign decd_rv32x_imm2[31:0]            = decd_imm2[31:0];

assign decd_rv32x_ill_expt              = decd_ill_expt;

// &ModuleEnd; @625
endmodule


