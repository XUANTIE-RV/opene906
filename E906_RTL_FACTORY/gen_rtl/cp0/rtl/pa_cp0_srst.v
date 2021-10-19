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
module pa_cp0_srst(
  cp0_ifu_srst_mask,
  cp0_ifu_srst_req,
  cp0_sysio_srst,
  cpurst_b,
  ifu_cp0_srst_ack,
  lsu_cp0_sync_ack,
  regs_srst_srst_vld,
  regs_srst_srstmd,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_flush,
  srst_in_wait_state,
  srst_iui_stall,
  srst_sm_clk,
  srst_special_srst_sm_clk_en,
  sysio_cp0_clk_en
);

// &Ports; @24
input          cpurst_b;                   
input          ifu_cp0_srst_ack;           
input          lsu_cp0_sync_ack;           
input          regs_srst_srst_vld;         
input   [1:0]  regs_srst_srstmd;           
input          rtu_yy_xx_dbgon;            
input          rtu_yy_xx_flush;            
input          srst_sm_clk;                
input          sysio_cp0_clk_en;           
output         cp0_ifu_srst_mask;          
output         cp0_ifu_srst_req;           
output  [1:0]  cp0_sysio_srst;             
output         srst_in_wait_state;         
output         srst_iui_stall;             
output         srst_special_srst_sm_clk_en; 

// &Regs; @25
reg     [1:0]  cur_state;                  
reg     [1:0]  next_state;                 

// &Wires; @26
wire           cp0_ifu_srst_mask;          
wire           cp0_ifu_srst_req;           
wire    [1:0]  cp0_sysio_srst;             
wire           cpurst_b;                   
wire           ifu_cp0_srst_ack;           
wire           lsu_cp0_sync_ack;           
wire           regs_srst_srst_vld;         
wire    [1:0]  regs_srst_srstmd;           
wire           rtu_yy_xx_dbgon;            
wire           rtu_yy_xx_flush;            
wire           srst_ack;                   
wire           srst_cmplt;                 
wire           srst_in_wait_state;         
wire           srst_iui_stall;             
wire           srst_sm_clk;                
wire           srst_sm_clk_en;             
wire           srst_special_srst_sm_clk_en; 
wire           sysio_cp0_clk_en;           


parameter IDLE   = 2'b00;
parameter WFACK  = 2'b01;
parameter WFCPLT = 2'b10;
parameter WFRST  = 2'b11;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign srst_sm_clk_en = regs_srst_srst_vld || (cur_state[1:0] != IDLE); 

//-----------------------------------------------------
// Request the BIU to enter low power mode and do
// not accept any more transaction from IFU or LSU
//-----------------------------------------------------

//-------------------FSM of srst req logic-----------------
// State Description:
// IDLE     : no srst instruction (wait,stop,doze)
// WFACK    : request sysio and wait for sysio ack
//           the srst request        
//-----------------------------------------------------

always @(posedge srst_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cur_state[1:0] <= IDLE;
  else if(rtu_yy_xx_flush)
    cur_state[1:0] <= IDLE;
  else
    cur_state[1:0] <= next_state[1:0];
end

// &CombBeg; @60
always @( cur_state[1:0]
       or regs_srst_srst_vld
       or sysio_cp0_clk_en
       or srst_ack)
begin
    case(cur_state[1:0])
  IDLE   : if(regs_srst_srst_vld)
             next_state[1:0] = WFACK;
           else
             next_state[1:0] = IDLE;
  WFACK  : if(srst_ack)
             next_state[1:0] = WFCPLT;
           else
             next_state[1:0] = WFACK;
  WFCPLT : if(sysio_cp0_clk_en)
             next_state[1:0] = WFRST;
           else
             next_state[1:0] = WFCPLT;
  WFRST  :   next_state[1:0] = WFRST;
  default:   next_state[1:0] = IDLE;
  endcase
// &CombEnd; @77
end

assign srst_in_wait_state = (cur_state[1:0] == WFACK);
assign srst_cmplt         = (cur_state[1:0] == WFCPLT);


//-------------------control signal by srst FSM-------------
assign srst_iui_stall = (cur_state[1:0] == IDLE) && regs_srst_srst_vld
                     || (cur_state[1:0] != IDLE);

assign cp0_ifu_srst_req = srst_in_wait_state;
// assign cp0_cache_srst_req = srst_in_wait_state;
// &Force("output","srst_in_wait_state"); @94
//-----------------------------------------------------
//               srst request ack 
//-----------------------------------------------------
assign srst_ack = (ifu_cp0_srst_ack && lsu_cp0_sync_ack)
               || rtu_yy_xx_dbgon;
assign cp0_sysio_srst[1:0] = {2{srst_cmplt && sysio_cp0_clk_en}} & regs_srst_srstmd[1:0];

assign cp0_ifu_srst_mask = (cur_state[1:0] == WFCPLT) || (cur_state[1:0] == WFRST);

assign srst_special_srst_sm_clk_en = srst_sm_clk_en;

// &ModuleEnd; @106
endmodule


