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
module pa_cp0_special(
  cp0_ifu_in_lpmd,
  cp0_ifu_lpmd_req,
  cp0_lsu_fence_req,
  cp0_lsu_sync_req,
  cp0_sysio_ipend_b,
  cp0_sysio_lpmd_b,
  cp0_yy_clk_en,
  cpurst_b,
  dtu_cp0_wake_up,
  fence_top_cur_state,
  forever_cpuclk,
  ifu_cp0_lpmd_ack,
  inv_sm_clk,
  iui_special_ecall,
  iui_special_fence,
  iui_special_fencei,
  iui_special_int_vld,
  iui_special_sync,
  iui_special_synci,
  iui_special_wfi,
  lpmd_top_cur_state,
  lsu_cp0_fence_ack,
  lsu_cp0_icc_done,
  lsu_cp0_sync_ack,
  pad_yy_icg_scan_en,
  regs_special_lpmd,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_flush,
  special_dcache_clean,
  special_icache_inv,
  special_icache_inv_done,
  special_iui_expt_vld,
  special_iui_stall,
  special_regs_clk_en,
  special_regs_inv_sm_clk_en,
  srst_in_wait_state,
  srst_sm_clk,
  srst_special_srst_sm_clk_en
);

// &Ports; @24
input          cpurst_b;                   
input          dtu_cp0_wake_up;            
input          forever_cpuclk;             
input          ifu_cp0_lpmd_ack;           
input          inv_sm_clk;                 
input          iui_special_ecall;          
input          iui_special_fence;          
input          iui_special_fencei;         
input          iui_special_int_vld;        
input          iui_special_sync;           
input          iui_special_synci;          
input          iui_special_wfi;            
input          lsu_cp0_fence_ack;          
input          lsu_cp0_icc_done;           
input          lsu_cp0_sync_ack;           
input          pad_yy_icg_scan_en;         
input   [1:0]  regs_special_lpmd;          
input          rtu_yy_xx_dbgon;            
input          rtu_yy_xx_flush;            
input          special_icache_inv_done;    
input          srst_in_wait_state;         
input          srst_special_srst_sm_clk_en; 
output         cp0_ifu_in_lpmd;            
output         cp0_ifu_lpmd_req;           
output         cp0_lsu_fence_req;          
output         cp0_lsu_sync_req;           
output         cp0_sysio_ipend_b;          
output  [1:0]  cp0_sysio_lpmd_b;           
output         cp0_yy_clk_en;              
output  [2:0]  fence_top_cur_state;        
output  [1:0]  lpmd_top_cur_state;         
output         special_dcache_clean;       
output         special_icache_inv;         
output         special_iui_expt_vld;       
output         special_iui_stall;          
output         special_regs_clk_en;        
output         special_regs_inv_sm_clk_en; 
output         srst_sm_clk;                

// &Regs; @25
reg     [1:0]  cur_state;                  
reg     [1:0]  lpmd_b;                     
reg     [1:0]  next_state;                 
reg     [2:0]  spec_cur_state;             
reg     [2:0]  spec_nxt_state;             

// &Wires; @26
wire           cp0_ifu_in_lpmd;            
wire           cp0_ifu_lpmd_req;           
wire           cp0_lsu_fence_req;          
wire           cp0_lsu_sync_req;           
wire           cp0_sysio_ipend_b;          
wire    [1:0]  cp0_sysio_lpmd_b;           
wire           cp0_yy_clk_en;              
wire           cpu_in_lpmd;                
wire           cpu_in_lpmd_core_view;      
wire           cpurst_b;                   
wire           dtu_cp0_wake_up;            
wire           fence_lsu_cmplt;            
wire    [2:0]  fence_top_cur_state;        
wire           forever_cpuclk;             
wire           ifu_cp0_lpmd_ack;           
wire           inv_sm_clk;                 
wire           iui_special_ecall;          
wire           iui_special_fence;          
wire           iui_special_fencei;         
wire           iui_special_int_vld;        
wire           iui_special_sync;           
wire           iui_special_synci;          
wire           iui_special_wfi;            
wire           lpmd_ack;                   
wire           lpmd_clk;                   
wire           lpmd_clk_en;                
wire           lpmd_in_wait_state;         
wire           lpmd_sm_clk;                
wire           lpmd_sm_icg_en;             
wire           lpmd_stall;                 
wire           lpmd_start;                 
wire    [1:0]  lpmd_top_cur_state;         
wire           lsu_cp0_fence_ack;          
wire           lsu_cp0_icc_done;           
wire           lsu_cp0_sync_ack;           
wire           pad_yy_icg_scan_en;         
wire    [1:0]  regs_special_lpmd;          
wire           rtu_yy_xx_dbgon;            
wire           rtu_yy_xx_flush;            
wire           spcial_fence_sync;          
wire           spec_inst_vld;              
wire           special_dcache_clean;       
wire           special_fence_req;          
wire           special_icache_inv;         
wire           special_icache_inv_done;    
wire           special_iui_expt_vld;       
wire           special_iui_stall;          
wire           special_regs_clk_en;        
wire           special_regs_inv_sm_clk_en; 
wire           special_sm_stall;           
wire           srst_in_wait_state;         
wire           srst_sm_clk;                
wire           srst_special_srst_sm_clk_en; 
wire           sync_lsu_cmplt;             




//==========================================================
// Special Inst Module
// 1. Instance ICG cell
// 2. Low Power Mode Maintainment
// 3. Other Special Inst Execution
//==========================================================

parameter IDLE   = 2'b00;
parameter WFACK  = 2'b01;
parameter WFCPLT = 2'b11;
parameter CPLT   = 2'b10;
//------------------------------------------------
// 1. Instance ICG cell
//------------------------------------------------
assign lpmd_sm_icg_en = iui_special_wfi || (cur_state[1:0] != IDLE)
                     || srst_special_srst_sm_clk_en;
// &Instance("gated_clk_cell", "x_lpmd_sm_gated_clk"); @46
gated_clk_cell  x_lpmd_sm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lpmd_sm_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (1'b0              ),
  .module_en          (lpmd_sm_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @47
//          .external_en (1'b0), @48
//          .global_en   (1'b1), @49
//          .module_en   (lpmd_sm_icg_en), @50
//          .local_en    (1'b0), @51
//          .clk_out     (lpmd_sm_clk)); @52

assign srst_sm_clk = lpmd_sm_clk;

assign lpmd_clk_en = dtu_cp0_wake_up || iui_special_int_vld
                  || rtu_yy_xx_dbgon || lpmd_start;

// &Instance("gated_clk_cell", "x_lpmd_gated_clk"); @59
gated_clk_cell  x_lpmd_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lpmd_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (1'b0              ),
  .module_en          (lpmd_clk_en       ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @60
//          .external_en (1'b0), @61
//          .global_en   (1'b1), @62
//          .module_en   (lpmd_clk_en), @63
//          .local_en    (1'b0), @64
//          .clk_out     (lpmd_clk)); @65

//------------------------------------------------
// 2. Low Power Mode Maintainment
//------------------------------------------------
//-----------------------------------------------------
// Request the BIU to enter low power mode and do
// not accept any more transaction from IFU or LSU
//-----------------------------------------------------
//-------------------FSM of lpmd req logic-----------------
// State Description:
// IDLE     : no lpmd instruction (wait,stop,doze)
// WFACK    : request sysio and wait for sysio ack
//           the lpmd request
//-----------------------------------------------------

always @(posedge lpmd_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cur_state[1:0] <= IDLE;
  else if(rtu_yy_xx_flush)
    cur_state[1:0] <= IDLE;
  else
    cur_state[1:0] <= next_state[1:0];
end
// &CombBeg; @90
always @( cur_state[1:0]
       or lpmd_start
       or iui_special_wfi
       or cpu_in_lpmd)
begin
  case(cur_state[1:0])
  IDLE       : if(iui_special_wfi)
                next_state[1:0] = WFACK;
              else
                next_state[1:0] = IDLE;
  WFACK      : if(lpmd_start)
                next_state[1:0] = WFCPLT;
              else
                next_state[1:0] = WFACK;
  WFCPLT    : if(!cpu_in_lpmd)
                next_state[1:0] = CPLT;
              else
                next_state[1:0] = WFCPLT;
  CPLT      :   next_state[1:0] = IDLE;
  default   :   next_state[1:0] = IDLE;
  endcase
// &CombEnd; @107
end

assign lpmd_in_wait_state = (cur_state[1:0] == WFACK);

//-------------------control signal by lpmd FSM-------------
assign lpmd_stall = (cur_state[1:0] == IDLE) && iui_special_wfi
                 || (cur_state[1:0] == WFACK)
                 || (cur_state[1:0] == WFCPLT);
//-----------------------------------------------------
//               lpmd request ack
//-----------------------------------------------------
assign lpmd_ack = ifu_cp0_lpmd_ack & lsu_cp0_sync_ack;
assign lpmd_start = lpmd_ack;

//-----------------------------------------------------
// Send lpmd bits to BIU and HAD, when
// cp0 can enter low power mode (get sysio_cp0_no_op)
//-----------------------------------------------------
always @(posedge lpmd_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lpmd_b[1:0] <= 2'b11;
  else if((dtu_cp0_wake_up || iui_special_int_vld)&& cpu_in_lpmd
          || rtu_yy_xx_dbgon)
    lpmd_b[1:0] <= 2'b11;
  else if(lpmd_start && !cpu_in_lpmd)
  begin
    lpmd_b[1:0] <= regs_special_lpmd[1:0];
  end
  else
    lpmd_b[1:0] <= lpmd_b[1:0];
end

//the cpu condsider both pm bit in cp0(cpu view) and sysio(soc view)
//assign sys_lpmd_b[1:0] = sysio_cp0_sys_view_lpmd_b[1:0];
//assign cpu_in_lpmd_sys_view = !(sys_lpmd_b[1] & sys_lpmd_b[0]);
assign cpu_in_lpmd_core_view = !(lpmd_b[1] & lpmd_b[0]);
assign cpu_in_lpmd = cpu_in_lpmd_core_view;

//------------------------------------------------
// 3. Other Special Inst Execution
//------------------------------------------------
// FENCE, FENCE.I, SYNC, SYNC.I state machine.
assign spec_inst_vld = iui_special_fence
                    || iui_special_fencei
                    || iui_special_sync
                    || iui_special_synci;

parameter SPEC_IDLE = 3'b000,
          SPEC_FENC = 3'b001,
          SPEC_CDCA = 3'b010,
          SPEC_IICA = 3'b011,
          SPEC_CMPLT= 3'b100;

always @ (posedge inv_sm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    spec_cur_state[2:0] <= SPEC_IDLE;
  else
    spec_cur_state[2:0] <= spec_nxt_state[2:0];
end

assign fence_lsu_cmplt    = lsu_cp0_fence_ack & iui_special_fence;
assign sync_lsu_cmplt     = lsu_cp0_sync_ack  & (iui_special_sync | iui_special_synci);
assign spcial_fence_sync  = iui_special_fence || iui_special_sync || iui_special_synci;
// &CombBeg; @172
always @( iui_special_fencei
       or sync_lsu_cmplt
       or spec_cur_state
       or spcial_fence_sync
       or fence_lsu_cmplt
       or lsu_cp0_icc_done
       or special_icache_inv_done)
begin
  case(spec_cur_state)
    SPEC_IDLE:
      if (iui_special_fencei)
        spec_nxt_state[2:0] = SPEC_CDCA;
      else if(spcial_fence_sync)
        spec_nxt_state[2:0] = SPEC_FENC;
      else
        spec_nxt_state[2:0] = SPEC_IDLE;
    SPEC_FENC:
      if(spcial_fence_sync)
        if(sync_lsu_cmplt || fence_lsu_cmplt)
          spec_nxt_state[2:0] = SPEC_CMPLT;
        else
          spec_nxt_state[2:0] = SPEC_FENC;
      else
        spec_nxt_state[2:0] = SPEC_CMPLT;
    SPEC_CDCA:
      if (iui_special_fencei)
        if (lsu_cp0_icc_done)
          spec_nxt_state[2:0] = SPEC_IICA;
        else
          spec_nxt_state[2:0] = SPEC_CDCA;
      else
        spec_nxt_state[2:0] = SPEC_CMPLT;
    SPEC_IICA:
      if (iui_special_fencei)
        if (special_icache_inv_done)
          spec_nxt_state[2:0] = SPEC_CMPLT;
        else
          spec_nxt_state[2:0] = SPEC_IICA;
      else
        spec_nxt_state[2:0] = SPEC_CMPLT;
    SPEC_CMPLT:
        spec_nxt_state[2:0] = SPEC_IDLE;
    default:
      spec_nxt_state[2:0] = SPEC_IDLE;
  endcase
// &CombEnd; @210
end

assign special_fence_req    = spec_cur_state[2:0] == SPEC_FENC;
assign special_dcache_clean = spec_cur_state[2:0] == SPEC_CDCA;
assign special_icache_inv   = spec_cur_state[2:0] == SPEC_IICA;

//assign special_fence_done   = spec_cur_state[1:0] == SPEC_FENC && lsu_xx_no_op;
//assign special_fencei_done  = spec_cur_state[1:0] == SPEC_IICA && special_icache_inv_done;
//assign special_sync_done    = spec_cur_state[1:0] == SPEC_FENC && lsu_xx_no_op;
//assign special_synci_done   = spec_cur_state[1:0] == SPEC_FENC && lsu_xx_no_op;
// &Force("output","special_dcache_clean"); @220
// &Force("output","special_icache_inv"); @221
assign special_sm_stall     = spec_cur_state[2:0] == SPEC_IDLE && spec_inst_vld 
                           || special_fence_req 
                           || special_dcache_clean
                           || special_icache_inv;

//==========================================================
// Rename for Output
//==========================================================

// Output to IUI
assign special_iui_expt_vld   = iui_special_ecall;
assign special_iui_stall      = lpmd_stall
                             || special_sm_stall;
assign special_regs_clk_en    = !cpu_in_lpmd;
assign special_regs_inv_sm_clk_en = spec_cur_state[2:0] != SPEC_IDLE
                                 || spec_inst_vld;

// Output to IFU
assign cp0_ifu_lpmd_req = lpmd_in_wait_state;
assign cp0_ifu_in_lpmd  = cpu_in_lpmd;

// Output to LSU
assign cp0_lsu_fence_req = special_fence_req && (iui_special_fence);
assign cp0_lsu_sync_req  = lpmd_in_wait_state || // low power req
                           srst_in_wait_state || // srst req 
                           special_fence_req && (iui_special_sync || iui_special_synci);
                           
// Output to RTU
//assign cp0_rtu_ex1_inst_ebreak = iui_special_ebrek;

// Output to HAD
//assign cp0_had_lpmd_b[1:0] = lpmd_b[1:0];

// Output to SYSIO
assign cp0_sysio_lpmd_b[1:0] = lpmd_b[1:0];
assign cp0_sysio_ipend_b = !iui_special_int_vld;

// Output to Global Clock Enable
assign cp0_yy_clk_en = !cpu_in_lpmd;

//debug infor
assign lpmd_top_cur_state[1:0]  = cur_state[1:0];
assign fence_top_cur_state[2:0] = spec_cur_state[2:0];

// &ModuleEnd; @274
endmodule


