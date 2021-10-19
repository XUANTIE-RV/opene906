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
module pa_rtu_lockup(
  cp0_rtu_in_expt,
  cp0_rtu_in_nmi,
  cpurst_b,
  ifu_rtu_lockup_ack,
  int_lockup_nmi_req,
  lockup_clk,
  lockup_clk_en,
  lockup_retire_dbg_vld,
  lockup_retire_nmi_vld,
  lockup_top_cur_st,
  retire_lockup_dbg_req,
  retire_lockup_dbgon,
  retire_lockup_expt_vld,
  retire_lockup_nmi_exit,
  retire_lockup_retire_pc,
  retire_lockup_retire_vld,
  rtu_cp0_lockup_clr,
  rtu_cp0_lockup_vld,
  rtu_ifu_lockup_expt_vld,
  rtu_ifu_lockup_mask,
  rtu_ifu_lockup_req,
  rtu_sysio_lockup_on
);

// &Ports; @24
input           cp0_rtu_in_expt;         
input           cp0_rtu_in_nmi;          
input           cpurst_b;                
input           ifu_rtu_lockup_ack;      
input           int_lockup_nmi_req;      
input           lockup_clk;              
input           retire_lockup_dbg_req;   
input           retire_lockup_dbgon;     
input           retire_lockup_expt_vld;  
input           retire_lockup_nmi_exit;  
input   [31:0]  retire_lockup_retire_pc; 
input           retire_lockup_retire_vld; 
output          lockup_clk_en;           
output          lockup_retire_dbg_vld;   
output          lockup_retire_nmi_vld;   
output  [2 :0]  lockup_top_cur_st;       
output          rtu_cp0_lockup_clr;      
output          rtu_cp0_lockup_vld;      
output          rtu_ifu_lockup_expt_vld; 
output          rtu_ifu_lockup_mask;     
output          rtu_ifu_lockup_req;      
output          rtu_sysio_lockup_on;     

// &Regs; @25
reg     [2 :0]  lockup_cur_st;           
reg     [2 :0]  lockup_nxt_st;           

// &Wires; @26
wire            cp0_rtu_in_expt;         
wire            cp0_rtu_in_nmi;          
wire            cpurst_b;                
wire            ifu_rtu_lockup_ack;      
wire            int_lockup_nmi_req;      
wire            lock_up_ack;             
wire            lock_up_en;              
wire            lock_up_vld;             
wire            lockup_clk;              
wire            lockup_clk_en;           
wire            lockup_on;               
wire            lockup_retire_dbg_vld;   
wire            lockup_retire_nmi_vld;   
wire    [2 :0]  lockup_top_cur_st;       
wire            retire_lockup_dbg_req;   
wire            retire_lockup_dbgon;     
wire            retire_lockup_expt_vld;  
wire            retire_lockup_nmi_exit;  
wire    [31:0]  retire_lockup_retire_pc; 
wire            retire_lockup_retire_vld; 
wire            rtu_cp0_lockup_clr;      
wire            rtu_cp0_lockup_vld;      
wire            rtu_ifu_lockup_expt_vld; 
wire            rtu_ifu_lockup_mask;     
wire            rtu_ifu_lockup_req;      
wire            rtu_sysio_lockup_on;     


// lock up module
// 1. Lock up valid when expt vld in a expt handler, ecall and ebreak excluded
// 2. Lock up will wait IFU empty and mask IFU fetch
// 3. Lock up can react debug and nmi

assign lock_up_en = 1'b1;

assign lock_up_vld = (cp0_rtu_in_expt || cp0_rtu_in_nmi)
                  && retire_lockup_expt_vld
                  && lock_up_en
                  && !lockup_on;

// Lock up state machine
parameter IDLE   = 3'b000;
parameter WFLU   = 3'b001;
parameter LKUP   = 3'b010;
parameter LKNMI  = 3'b100;
parameter LKDBG  = 3'b101;

always @ (posedge lockup_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lockup_cur_st[2:0] <= IDLE;
  else
    lockup_cur_st[2:0] <= lockup_nxt_st[2:0];
end

// &CombBeg; @55
always @( cp0_rtu_in_nmi
       or retire_lockup_nmi_exit
       or lock_up_vld
       or lock_up_ack
       or retire_lockup_retire_pc[31:0]
       or retire_lockup_retire_vld
       or int_lockup_nmi_req
       or retire_lockup_dbgon
       or lockup_cur_st[2:0])
begin
case(lockup_cur_st[2:0])
  IDLE:
  begin
    if(lock_up_vld)
      lockup_nxt_st[2:0] = WFLU;
    else
      lockup_nxt_st[2:0] = IDLE;
  end
  WFLU:
  begin
    if(lock_up_ack)
      lockup_nxt_st[2:0] = LKUP;
    else
      lockup_nxt_st[2:0] = WFLU;
  end
  LKUP:
  begin
    if(retire_lockup_dbgon)
      lockup_nxt_st[2:0] = LKDBG;
    else if(int_lockup_nmi_req && !cp0_rtu_in_nmi)
      lockup_nxt_st[2:0] = LKNMI;
    else
      lockup_nxt_st[2:0] = LKUP;
  end
  LKNMI:
  begin
    if(retire_lockup_nmi_exit || lock_up_vld)
      lockup_nxt_st[2:0] = WFLU;
    else
      lockup_nxt_st[2:0] = LKNMI;
  end
  LKDBG:
  begin
    if(retire_lockup_retire_vld && !retire_lockup_dbgon)
      if (retire_lockup_retire_pc[31:0] == 32'hEFFF_FFFC)
        lockup_nxt_st[2:0] = WFLU;
      else
        lockup_nxt_st[2:0] = IDLE;
    else
      lockup_nxt_st[2:0] = LKDBG;
  end
  default:
  begin
    lockup_nxt_st[2:0] = IDLE;
  end
endcase
// &CombEnd; @102
end

assign lock_up_ack         = ifu_rtu_lockup_ack;

assign lockup_on           = lockup_cur_st[2:0] == LKUP;

assign rtu_ifu_lockup_req   = lockup_cur_st[2:0] == WFLU;

assign lockup_top_cur_st[2:0] = lockup_cur_st[2:0];

assign rtu_ifu_lockup_expt_vld = lock_up_vld;
assign lockup_retire_nmi_vld = lockup_on && int_lockup_nmi_req && !cp0_rtu_in_nmi;
assign lockup_retire_dbg_vld = lockup_on && retire_lockup_dbg_req;

assign rtu_cp0_lockup_vld     = lockup_cur_st[2:0] == WFLU && lock_up_ack;
assign rtu_cp0_lockup_clr     = retire_lockup_retire_vld && !retire_lockup_dbgon
                             && retire_lockup_retire_pc[31:0] != 32'hEFFF_FFFC
                             && lockup_cur_st[2:0] == LKDBG;

assign rtu_ifu_lockup_mask   = lockup_cur_st[2:0] == WFLU || lockup_on;
assign rtu_sysio_lockup_on   = lockup_on;

assign lockup_clk_en = lockup_cur_st[2:0] != IDLE
                    || lock_up_vld;


// &ModuleEnd; @137
endmodule



