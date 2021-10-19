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
module pa_ifu_ctrl(
  cp0_ifu_in_lpmd,
  cp0_ifu_lpmd_req,
  cp0_ifu_srst_mask,
  cp0_ifu_srst_req,
  ctrl_btb_inst_fetch,
  ctrl_ibuf_pop_en,
  ctrl_ifetch_req_abort,
  ctrl_ifetch_req_vld,
  ctrl_pcgen_inst_vld,
  ctrl_pcgen_pipedown,
  ibuf_ctrl_inst_fetch,
  id_pred_ctrl_stall,
  idu_ifu_id_stall,
  idu_ifu_tail_vld,
  ifetch_ctrl_inst_vld,
  pcgen_ctrl_chgflw_vld,
  rtu_ifu_dbg_mask,
  rtu_ifu_flush_fe,
  rtu_ifu_lockup_mask,
  rtu_ifu_lockup_req,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_tail_int_vld,
  sysio_xx_halt_req,
  vec_ctrl_reset_mask,
  vec_ctrl_seq_mask
);

// &Ports; @24
input        cp0_ifu_in_lpmd;       
input        cp0_ifu_lpmd_req;      
input        cp0_ifu_srst_mask;     
input        cp0_ifu_srst_req;      
input        ibuf_ctrl_inst_fetch;  
input        id_pred_ctrl_stall;    
input        idu_ifu_id_stall;      
input        idu_ifu_tail_vld;      
input        ifetch_ctrl_inst_vld;  
input        pcgen_ctrl_chgflw_vld; 
input        rtu_ifu_dbg_mask;      
input        rtu_ifu_flush_fe;      
input        rtu_ifu_lockup_mask;   
input        rtu_ifu_lockup_req;    
input        rtu_yy_xx_dbgon;       
input        rtu_yy_xx_tail_int_vld; 
input        sysio_xx_halt_req;     
input        vec_ctrl_reset_mask;   
input        vec_ctrl_seq_mask;     
output       ctrl_btb_inst_fetch;   
output       ctrl_ibuf_pop_en;      
output       ctrl_ifetch_req_abort; 
output       ctrl_ifetch_req_vld;   
output       ctrl_pcgen_inst_vld;   
output       ctrl_pcgen_pipedown;   

// &Regs; @25

// &Wires; @26
wire         cp0_ifu_in_lpmd;       
wire         cp0_ifu_lpmd_req;      
wire         cp0_ifu_srst_mask;     
wire         cp0_ifu_srst_req;      
wire         ctrl_btb_inst_fetch;   
wire         ctrl_ibuf_pop_en;      
wire         ctrl_if_abort;         
wire         ctrl_if_pipedown;      
wire         ctrl_ifetch_req_abort; 
wire         ctrl_ifetch_req_vld;   
wire         ctrl_inst_fetch;       
wire         ctrl_pcgen_inst_vld;   
wire         ctrl_pcgen_pipedown;   
wire         ibuf_ctrl_inst_fetch;  
wire         id_pred_ctrl_stall;    
wire         idu_ifu_id_stall;      
wire         idu_ifu_tail_vld;      
wire         ifetch_ctrl_inst_vld;  
wire         pcgen_ctrl_chgflw_vld; 
wire         rtu_ifu_dbg_mask;      
wire         rtu_ifu_flush_fe;      
wire         rtu_ifu_lockup_mask;   
wire         rtu_ifu_lockup_req;    
wire         rtu_yy_xx_dbgon;       
wire         rtu_yy_xx_tail_int_vld; 
wire         sysio_xx_halt_req;     
wire         vec_ctrl_reset_mask;   
wire         vec_ctrl_seq_mask;     


//==========================================================
// IFU Control Module
// 1. Inst Fetch Requet Valid Signal
// 2. Inst Fetch Stage Pipe Signal
// 3. Flush Signal for IFU modules
//==========================================================

//------------------------------------------------
// 1. Inst Fetch Requet Valid Signal
// a. Fetch inst when chgflw or I-buf fetch  
// b. Not fetch when lpmd or debug on
//------------------------------------------------
assign ctrl_inst_fetch = ibuf_ctrl_inst_fetch 
                      & ~(cp0_ifu_in_lpmd | cp0_ifu_lpmd_req)
                      & ~rtu_yy_xx_dbgon
                      & ~vec_ctrl_reset_mask
                      & ~cp0_ifu_srst_req
                      & ~cp0_ifu_srst_mask
                      & ~rtu_ifu_lockup_req
                      & ~rtu_ifu_lockup_mask
                      & ~rtu_ifu_dbg_mask
                      & ~sysio_xx_halt_req
                      & ~vec_ctrl_seq_mask;

//------------------------------------------------
// 2. Inst Fetch Stage Pipedown Signal
//------------------------------------------------
assign ctrl_if_pipedown = ifetch_ctrl_inst_vld & ~id_pred_ctrl_stall;

//------------------------------------------------
// 3. Flush Signal for IFU modules
//------------------------------------------------
assign ctrl_if_abort = rtu_ifu_flush_fe | pcgen_ctrl_chgflw_vld | idu_ifu_tail_vld | rtu_yy_xx_tail_int_vld;

//==========================================================
// Rename for Output
//==========================================================

// Output to I-Buf
assign ctrl_ibuf_pop_en       = ~idu_ifu_id_stall;

assign ctrl_ifetch_req_vld    = ctrl_inst_fetch;
assign ctrl_ifetch_req_abort  = ctrl_if_abort;

assign ctrl_pcgen_pipedown    = ctrl_if_pipedown;
assign ctrl_pcgen_inst_vld    = ifetch_ctrl_inst_vld;

assign ctrl_btb_inst_fetch    = ctrl_inst_fetch;

// &ModuleEnd; @79
endmodule


