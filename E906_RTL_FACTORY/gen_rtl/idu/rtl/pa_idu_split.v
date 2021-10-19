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

// &Depend("pa_idu_cfig.h"); @23
// &ModuleBeg; @24
module pa_idu_split(
  cpurst_b,
  ctrl_split_bkpt_vld,
  ctrl_split_stall,
  decd_split_dst_idx,
  decd_split_opcode,
  decd_split_req,
  decd_split_rs1_idx,
  decd_split_rs2_idx,
  decd_split_rs2_vld,
  idu_misc_cpuclk,
  ifu_idu_chgflw_flush,
  ifu_idu_id_inst_vld,
  rtu_idu_ex1_int_dis_stall_req,
  rtu_idu_flush_fe,
  split_ctrl_cancel,
  split_ctrl_icg_en,
  split_ctrl_stall,
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
  split_decd_split,
  split_top_cur_st
);

// &Ports; @25
input           cpurst_b;                     
input           ctrl_split_bkpt_vld;          
input           ctrl_split_stall;             
input   [4 :0]  decd_split_dst_idx;           
input   [6 :0]  decd_split_opcode;            
input           decd_split_req;               
input   [4 :0]  decd_split_rs1_idx;           
input   [4 :0]  decd_split_rs2_idx;           
input           decd_split_rs2_vld;           
input           idu_misc_cpuclk;              
input           ifu_idu_chgflw_flush;         
input           ifu_idu_id_inst_vld;          
input           rtu_idu_ex1_int_dis_stall_req; 
input           rtu_idu_flush_fe;             
output          split_ctrl_cancel;            
output          split_ctrl_icg_en;            
output          split_ctrl_stall;             
output  [31:0]  split_decd_ag_imm;            
output          split_decd_ag_imm_vld;        
output          split_decd_dp_sel;            
output  [5 :0]  split_decd_dst_idx;           
output          split_decd_dst_vld;           
output  [19:0]  split_decd_func;              
output  [5 :0]  split_decd_rs1_idx;           
output          split_decd_rs1_vld;           
output  [5 :0]  split_decd_rs2_idx;           
output  [31:0]  split_decd_rs2_imm;           
output          split_decd_rs2_imm_vld;       
output          split_decd_rs2_vld;           
output  [5 :0]  split_decd_sel;               
output          split_decd_split;             
output  [2 :0]  split_top_cur_st;             

// &Regs; @26
reg     [19:0]  amo_alu_func;                 
reg     [2 :0]  split_cur_state;              
reg     [5 :0]  split_decd_dst_idx;           
reg             split_decd_dst_vld;           
reg     [19:0]  split_decd_func;              
reg             split_decd_rs2_imm_vld;       
reg             split_decd_rs2_vld;           
reg     [5 :0]  split_decd_sel;               
reg     [2 :0]  split_next_state;             

// &Wires; @27
wire            amo_inst;                     
wire            amoswap;                      
wire            atm_aq;                       
wire            atm_rl;                       
wire            cpurst_b;                     
wire            ctrl_split_bkpt_vld;          
wire            ctrl_split_stall;             
wire    [4 :0]  decd_split_dst_idx;           
wire    [6 :0]  decd_split_opcode;            
wire            decd_split_req;               
wire    [4 :0]  decd_split_rs1_idx;           
wire    [4 :0]  decd_split_rs2_idx;           
wire            decd_split_rs2_vld;           
wire            idu_misc_cpuclk;              
wire            ifu_idu_chgflw_flush;         
wire            ifu_idu_id_inst_vld;          
wire            lr_inst;                      
wire            rtu_idu_ex1_int_dis_stall_req; 
wire            rtu_idu_flush_fe;             
wire            sc_inst;                      
wire            split_ctrl_cancel;            
wire            split_ctrl_icg_en;            
wire            split_ctrl_stall;             
wire    [31:0]  split_decd_ag_imm;            
wire            split_decd_ag_imm_vld;        
wire            split_decd_dp_sel;            
wire    [5 :0]  split_decd_rs1_idx;           
wire            split_decd_rs1_vld;           
wire    [5 :0]  split_decd_rs2_idx;           
wire    [31:0]  split_decd_rs2_imm;           
wire            split_decd_split;             
wire            split_req_vld;                
wire    [2 :0]  split_top_cur_st;             


//==========================================================
// Split Module
// 1. ICG instance
// 2. Split function decode
// 3. Split FSM
// 4. Split instruction information
// 5. Output
//==========================================================
parameter IDLE    = 3'b111;
parameter FENCE_1 = 3'b000;
parameter LLSC    = 3'b001;
parameter AMO_LD  = 3'b010;
parameter AMO_ALU = 3'b011;
parameter AMO_ST  = 3'b100;
parameter AMO_MOV = 3'b101;
parameter FENCE_2 = 3'b110;

always @ (posedge idu_misc_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    split_cur_state[2:0] <= IDLE;
  else if (rtu_idu_flush_fe | ifu_idu_chgflw_flush | rtu_idu_ex1_int_dis_stall_req)
    split_cur_state[2:0] <= IDLE;
  else if (~ctrl_split_stall)
    split_cur_state[2:0] <= split_next_state[2:0];
  else 
    split_cur_state[2:0] <= split_cur_state[2:0];
end

assign split_req_vld = ifu_idu_id_inst_vld & decd_split_req & !ctrl_split_bkpt_vld;

// &CombBeg; @60
always @( split_req_vld
       or split_cur_state[2:0]
       or atm_aq
       or amo_inst)
begin
  case(split_cur_state[2:0])
    IDLE: begin
      if (split_req_vld)
        split_next_state[2:0] = FENCE_1;
      else 
        split_next_state[2:0] = IDLE;
    end
    FENCE_1: begin
      split_next_state[2:0] = amo_inst ? AMO_LD : LLSC;
    end
    LLSC: begin
      if (atm_aq)
        split_next_state[2:0] = FENCE_2;
      else 
        split_next_state[2:0] = IDLE;
    end
    AMO_LD:  split_next_state[2:0] = AMO_ALU;
    AMO_ALU: split_next_state[2:0] = AMO_ST;
    AMO_ST:  split_next_state[2:0] = AMO_MOV;
    AMO_MOV: begin
      if (atm_aq)
        split_next_state[2:0] = FENCE_2;
      else
        split_next_state[2:0] = IDLE;
    end
    FENCE_2: split_next_state[2:0] = IDLE;
    default: split_next_state[2:0] = IDLE;
  endcase
// &CombEnd; @89
end

// &Force("output","split_ctrl_stall"); @91

assign split_ctrl_stall = (split_cur_state[2:0] == IDLE) & split_req_vld |
                          (split_cur_state[2:0] == FENCE_1) |
                          (split_cur_state[2:0] == LLSC) & atm_aq |
                          (split_cur_state[2:0] == AMO_LD) |
                          (split_cur_state[2:0] == AMO_ALU) |
                          (split_cur_state[2:0] == AMO_ST) |
                          (split_cur_state[2:0] == AMO_MOV) & atm_aq;

assign split_decd_split = split_ctrl_stall;
assign split_ctrl_cancel = (split_cur_state[2:0] == IDLE) & split_req_vld;
assign split_decd_dp_sel = ~(split_cur_state[2:0] == IDLE);

// &Force("output", "split_decd_sel"); @105
// &CombBeg; @106
always @( atm_rl
       or amo_alu_func[19:0]
       or split_cur_state[2:0]
       or amoswap
       or decd_split_opcode[4:2]
       or decd_split_dst_idx[4:0]
       or decd_split_rs2_vld)
begin
  case(split_cur_state[2:0])
  FENCE_1: begin
           split_decd_sel[`SEL_WIDTH-1:0]          = atm_rl ? `SEL_CP0 : `SEL_ALU;
           split_decd_func[`FUNC_WIDTH-1:0]        = atm_rl ? `FUNC_FENCE: `FUNC_ADD;
           split_decd_rs2_imm_vld                  = atm_rl ? 1'b0 : 1'b1;
           split_decd_dst_vld                      = atm_rl ? 1'b0 : 1'b1;
           split_decd_dst_idx[5:0]                 = {1'b0,5'b0};
           split_decd_rs2_vld                      = 1'b0;
           end
  LLSC:    begin
           split_decd_sel[`SEL_WIDTH-1:0]          = `SEL_LSU;
           split_decd_func[`FUNC_WIDTH-1:0]        = {10'b0, 5'b00010, 1'b0,1'b0, decd_split_opcode[4:2]};
           split_decd_rs2_imm_vld                  = 1'b0;
           split_decd_dst_vld                      = 1'b1;
           split_decd_dst_idx[5:0]                 = {1'b0,decd_split_dst_idx[4:0]};
           split_decd_rs2_vld                      = decd_split_rs2_vld;
           end
  AMO_LD:  begin
           split_decd_sel[`SEL_WIDTH-1:0]          = `SEL_LSU;
           split_decd_func[`FUNC_WIDTH-1:0]        = {10'b0, 5'b00010, 1'b0,1'b0,3'b100};
           split_decd_rs2_imm_vld                  = 1'b0;
           split_decd_dst_vld                      = 1'b1;
           split_decd_dst_idx[5:0]                 = {1'b1,5'b0};
           split_decd_rs2_vld                      = 1'b0;
           end
  AMO_ALU: begin
           split_decd_sel[`SEL_WIDTH-1:0]          = `SEL_ALU;
           split_decd_func[`FUNC_WIDTH-1:0]        = amo_alu_func[`FUNC_WIDTH-1:0];
           split_decd_rs2_imm_vld                  = amoswap;
           split_decd_dst_vld                      = 1'b1;
           split_decd_dst_idx[5:0]                 = {1'b1,5'b1};
           split_decd_rs2_vld                      = 1'b1;
           end
  AMO_ST:  begin
           split_decd_sel[`SEL_WIDTH-1:0]          = `SEL_LSU;
           split_decd_func[`FUNC_WIDTH-1:0]        = {10'b0, 5'b00010, 1'b0,1'b0,3'b101};
           split_decd_rs2_imm_vld                  = 1'b0;
           split_decd_dst_vld                      = 1'b0;
           split_decd_dst_idx[5:0]                 = {1'b0,decd_split_dst_idx[4:0]};
           split_decd_rs2_vld                      = 1'b1;
           end
  AMO_MOV: begin
           split_decd_sel[`SEL_WIDTH-1:0]          = `SEL_ALU;
           split_decd_func[`FUNC_WIDTH-1:0]        = `FUNC_ADD;
           split_decd_rs2_imm_vld                  = 1'b1;
           split_decd_dst_vld                      = 1'b1;
           split_decd_dst_idx[5:0]                 = {1'b0,decd_split_dst_idx[4:0]};
           split_decd_rs2_vld                      = 1'b0;
           end
  FENCE_2: begin
           split_decd_sel[`SEL_WIDTH-1:0]          = `SEL_CP0;
           split_decd_func[`FUNC_WIDTH-1:0]        = `FUNC_FENCE;
           split_decd_rs2_imm_vld                  = 1'b0;
           split_decd_dst_vld                      = 1'b0;
           split_decd_dst_idx[5:0]                 = {1'b0,decd_split_dst_idx[4:0]};
           split_decd_rs2_vld                      = 1'b0;
           end
  default: begin
           split_decd_sel[`SEL_WIDTH-1:0]          = {`SEL_WIDTH{1'bx}};
           split_decd_func[`FUNC_WIDTH-1:0]        = {`FUNC_WIDTH{1'bx}};
           split_decd_rs2_imm_vld                  = 1'b0;
           split_decd_dst_vld                      = 1'b0;
           split_decd_dst_idx[5:0]                 = {1'b0,decd_split_dst_idx[4:0]};
           split_decd_rs2_vld                      = 1'b0;
           end
  endcase
// &CombEnd; @173
end

assign split_decd_rs2_imm[31:0]= 32'b0;

assign split_decd_rs2_idx[5:0] = (split_cur_state[2:0] == AMO_ST) 
                               ? {1'b1,5'b1} 
                               : ((split_cur_state[2:0] == AMO_ALU) 
                                        ? {1'b1, 5'b0}
                                        : {1'b0, decd_split_rs2_idx[4:0]});

assign split_decd_rs1_vld      = 1'b1;
assign split_decd_rs1_idx[5:0] = (split_cur_state[2:0] == AMO_ALU) 
                               ? {1'b0, decd_split_rs2_idx[4:0]} 
                               : ((split_cur_state[2:0] == AMO_MOV) 
                                       ? {1'b1, 5'b0}
                                       : {1'b0, decd_split_rs1_idx[4:0]});

assign split_decd_ag_imm_vld   = split_decd_sel[4] | 
                                 split_decd_sel[5];
assign split_decd_ag_imm[31:0] = 32'b0;

assign atm_aq  = decd_split_opcode[1];
assign atm_rl  = decd_split_opcode[0];
assign amoswap = decd_split_opcode[6:2] == 5'b00001;
assign lr_inst = decd_split_opcode[6:2] == 5'b00010;
assign sc_inst = decd_split_opcode[6:2] == 5'b00011;
assign amo_inst= ~(lr_inst | sc_inst);

// &CombBeg; @201
always @( decd_split_opcode[6:2])
begin
  case(decd_split_opcode[6:2])
    5'b00001: amo_alu_func[`FUNC_WIDTH-1:0] = `FUNC_ADD; 
    5'b00000: amo_alu_func[`FUNC_WIDTH-1:0] = `FUNC_ADD; 
    5'b00100: amo_alu_func[`FUNC_WIDTH-1:0] = `FUNC_XOR; 
    5'b01100: amo_alu_func[`FUNC_WIDTH-1:0] = `FUNC_AND; 
    5'b01000: amo_alu_func[`FUNC_WIDTH-1:0] = `FUNC_OR;  
    5'b10000: amo_alu_func[`FUNC_WIDTH-1:0] = `FUNC_MIN; 
    5'b10100: amo_alu_func[`FUNC_WIDTH-1:0] = `FUNC_MAX; 
    5'b11000: amo_alu_func[`FUNC_WIDTH-1:0] = `FUNC_MINU;
    5'b11100: amo_alu_func[`FUNC_WIDTH-1:0] = `FUNC_MAXU;
    default : amo_alu_func[`FUNC_WIDTH-1:0] = {`FUNC_WIDTH{1'bx}}; 
  endcase
// &CombEnd; @214
end

assign split_ctrl_icg_en = split_cur_state[2:0] != IDLE | split_req_vld;
assign split_top_cur_st[2:0] = split_cur_state[2:0];

// &ModuleEnd; @219
endmodule


