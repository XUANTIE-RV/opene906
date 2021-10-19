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
module pa_ifu_ifetch(
  bmu_ifu_acc_err,
  bmu_ifu_grant,
  bmu_ifu_rdata,
  bmu_ifu_trans_cmplt,
  cp0_ifu_icache_en,
  cp0_ifu_icache_inv_addr,
  cp0_ifu_icache_inv_req,
  cp0_ifu_icache_inv_type,
  cp0_ifu_icg_en,
  cp0_ifu_lpmd_req,
  cp0_ifu_srst_req,
  cp0_yy_clk_en,
  cp0_yy_mach_mode,
  cpurst_b,
  ctrl_ifetch_req_abort,
  ctrl_ifetch_req_vld,
  forever_cpuclk,
  icache_top_abort,
  icache_top_rd_vld,
  icache_top_ref_st,
  icache_top_uc_st,
  ifetch_ctrl_inst_vld,
  ifetch_ibuf_idle,
  ifetch_ipack_acc_err,
  ifetch_ipack_inst,
  ifetch_ipack_inst_vld,
  ifetch_ipack_inst_vld_gate,
  ifetch_ipack_unalign,
  ifetch_pcgen_addr,
  ifetch_pcgen_data,
  ifetch_pcgen_grant,
  ifetch_pcgen_grant_dp,
  ifetch_top_abt_st,
  ifetch_top_cur_st,
  ifetch_vec_acc_err,
  ifetch_vec_cmplt,
  ifetch_vec_grant,
  ifetch_vec_idle,
  ifetch_xx_not_busy,
  ifu_bmu_acc_deny,
  ifu_bmu_addr,
  ifu_bmu_burst,
  ifu_bmu_data_req,
  ifu_bmu_prot,
  ifu_bmu_req,
  ifu_bmu_seq,
  ifu_bmu_size,
  ifu_cp0_icache_inv_done,
  ifu_cp0_lpmd_ack,
  ifu_cp0_srst_ack,
  ifu_hpcp_icache_access,
  ifu_hpcp_icache_miss,
  ifu_pmp_addr,
  ifu_pmp_machine_mode,
  ifu_rtu_lockup_ack,
  ifu_sysmap_pa,
  pad_yy_icg_scan_en,
  pcgen_ifetch_addr,
  pcgen_ifetch_chgflw_vld,
  pcgen_ifetch_ifpc,
  pcgen_ifetch_seq_addr,
  pmp_ifu_acc_deny,
  rtu_ifu_lockup_mask,
  rtu_ifu_lockup_req,
  rtu_yy_xx_dbgon,
  sysmap_ifu_flg,
  vec_ifetch_data_fetch
);

// &Ports; @24
input           bmu_ifu_acc_err;             
input           bmu_ifu_grant;               
input   [31:0]  bmu_ifu_rdata;               
input           bmu_ifu_trans_cmplt;         
input           cp0_ifu_icache_en;           
input   [31:0]  cp0_ifu_icache_inv_addr;     
input           cp0_ifu_icache_inv_req;      
input           cp0_ifu_icache_inv_type;     
input           cp0_ifu_icg_en;              
input           cp0_ifu_lpmd_req;            
input           cp0_ifu_srst_req;            
input           cp0_yy_clk_en;               
input           cp0_yy_mach_mode;            
input           cpurst_b;                    
input           ctrl_ifetch_req_abort;       
input           ctrl_ifetch_req_vld;         
input           forever_cpuclk;              
input           pad_yy_icg_scan_en;          
input   [31:0]  pcgen_ifetch_addr;           
input           pcgen_ifetch_chgflw_vld;     
input   [31:0]  pcgen_ifetch_ifpc;           
input   [31:0]  pcgen_ifetch_seq_addr;       
input           pmp_ifu_acc_deny;            
input           rtu_ifu_lockup_mask;         
input           rtu_ifu_lockup_req;          
input           rtu_yy_xx_dbgon;             
input   [4 :0]  sysmap_ifu_flg;              
input           vec_ifetch_data_fetch;       
output          icache_top_abort;            
output          icache_top_rd_vld;           
output  [1 :0]  icache_top_ref_st;           
output          icache_top_uc_st;            
output          ifetch_ctrl_inst_vld;        
output          ifetch_ibuf_idle;            
output          ifetch_ipack_acc_err;        
output  [31:0]  ifetch_ipack_inst;           
output          ifetch_ipack_inst_vld;       
output          ifetch_ipack_inst_vld_gate;  
output          ifetch_ipack_unalign;        
output  [31:0]  ifetch_pcgen_addr;           
output  [31:0]  ifetch_pcgen_data;           
output          ifetch_pcgen_grant;          
output          ifetch_pcgen_grant_dp;       
output  [1 :0]  ifetch_top_abt_st;           
output  [2 :0]  ifetch_top_cur_st;           
output          ifetch_vec_acc_err;          
output          ifetch_vec_cmplt;            
output          ifetch_vec_grant;            
output          ifetch_vec_idle;             
output          ifetch_xx_not_busy;          
output          ifu_bmu_acc_deny;            
output  [31:0]  ifu_bmu_addr;                
output  [2 :0]  ifu_bmu_burst;               
output          ifu_bmu_data_req;            
output  [3 :0]  ifu_bmu_prot;                
output          ifu_bmu_req;                 
output          ifu_bmu_seq;                 
output  [1 :0]  ifu_bmu_size;                
output          ifu_cp0_icache_inv_done;     
output          ifu_cp0_lpmd_ack;            
output          ifu_cp0_srst_ack;            
output          ifu_hpcp_icache_access;      
output          ifu_hpcp_icache_miss;        
output  [31:0]  ifu_pmp_addr;                
output          ifu_pmp_machine_mode;        
output          ifu_rtu_lockup_ack;          
output  [31:0]  ifu_sysmap_pa;               

// &Regs; @25
reg     [1 :0]  abort_cur_st;                
reg     [1 :0]  abort_nxt_st;                
reg     [2 :0]  cur_st;                      
reg             ibus_deny_reg;               
reg             ibus_unalign_reg;            
reg     [2 :0]  nxt_st;                      

// &Wires; @26
wire            bmu_ifu_acc_err;             
wire            bmu_ifu_grant;               
wire    [31:0]  bmu_ifu_rdata;               
wire            bmu_ifu_trans_cmplt;         
wire            cp0_ifu_icache_en;           
wire    [31:0]  cp0_ifu_icache_inv_addr;     
wire            cp0_ifu_icache_inv_req;      
wire            cp0_ifu_icache_inv_type;     
wire            cp0_ifu_icg_en;              
wire            cp0_ifu_lpmd_req;            
wire            cp0_ifu_srst_req;            
wire            cp0_yy_clk_en;               
wire            cp0_yy_mach_mode;            
wire            cpurst_b;                    
wire            ctrl_ifetch_req_abort;       
wire            ctrl_ifetch_req_vld;         
wire            flop_out_bus;                
wire            forever_cpuclk;              
wire            ibus_abort_trig;             
wire    [31:0]  ibus_data;                   
wire            ibus_data_req_vld;           
wire            ibus_icache_cmplt;           
wire    [31:0]  ibus_icache_data;            
wire            ibus_icache_error;           
wire            ibus_icache_grant;           
wire            ibus_icache_not_busy;        
wire            ibus_icache_uc_cmplt;        
wire            ibus_icache_unalign;         
wire            ibus_inst_data_req;          
wire            ibus_inst_req;               
wire            ibus_req;                    
wire    [31:0]  ibus_req_addr;               
wire    [2 :0]  ibus_req_burst;              
wire            ibus_req_cmplt;              
wire            ibus_req_deny;               
wire            ibus_req_err;                
wire    [3 :0]  ibus_req_prot;               
wire            ibus_req_seq;                
wire    [1 :0]  ibus_req_size;               
wire            ibus_req_vld;                
wire            ibus_trans_abort;            
wire            ibusif_idle_st;              
wire            icache_ibus_acc_deny;        
wire    [31:0]  icache_ibus_addr;            
wire    [2 :0]  icache_ibus_burst;           
wire            icache_ibus_data_req;        
wire    [3 :0]  icache_ibus_prot;            
wire            icache_ibus_req;             
wire            icache_ibus_seq;             
wire    [31:0]  icache_ifetch_addr;          
wire            icache_ifetch_error;         
wire            icache_ifetch_grant;         
wire            icache_ifetch_idle;          
wire    [31:0]  icache_ifetch_inst;          
wire            icache_ifetch_inst_vld;      
wire            icache_ifetch_inst_vld_gate; 
wire            icache_ifetch_mach_mode;     
wire            icache_ifetch_not_busy;      
wire    [31:0]  icache_ifetch_rd_addr;       
wire            icache_ifetch_uc_sel;        
wire            icache_ifetch_unalign;       
wire            icache_ifetch_vec_data_cmplt; 
wire            icache_top_abort;            
wire            icache_top_rd_vld;           
wire    [1 :0]  icache_top_ref_st;           
wire            icache_top_uc_st;            
wire            ifetch_cpuclk;               
wire            ifetch_ctrl_inst_vld;        
wire            ifetch_ibuf_idle;            
wire            ifetch_icg_en;               
wire            ifetch_inst_vld;             
wire            ifetch_ipack_acc_err;        
wire    [31:0]  ifetch_ipack_inst;           
wire            ifetch_ipack_inst_vld;       
wire            ifetch_ipack_inst_vld_gate;  
wire            ifetch_ipack_unalign;        
wire            ifetch_outstanding;          
wire    [31:0]  ifetch_pcgen_addr;           
wire    [31:0]  ifetch_pcgen_data;           
wire            ifetch_pcgen_grant;          
wire            ifetch_pcgen_grant_dp;       
wire    [31:0]  ifetch_req_addr;             
wire            ifetch_req_buf;              
wire            ifetch_req_ca;               
wire    [4 :0]  ifetch_req_flg;              
wire    [3 :0]  ifetch_req_prot;             
wire    [1 :0]  ifetch_top_abt_st;           
wire    [2 :0]  ifetch_top_cur_st;           
wire            ifetch_vec_acc_err;          
wire            ifetch_vec_cmplt;            
wire            ifetch_vec_grant;            
wire            ifetch_vec_idle;             
wire            ifetch_xx_not_busy;          
wire            ifu_bmu_acc_deny;            
wire    [31:0]  ifu_bmu_addr;                
wire    [2 :0]  ifu_bmu_burst;               
wire            ifu_bmu_data_req;            
wire    [3 :0]  ifu_bmu_prot;                
wire            ifu_bmu_req;                 
wire            ifu_bmu_seq;                 
wire    [1 :0]  ifu_bmu_size;                
wire            ifu_cp0_icache_inv_done;     
wire            ifu_cp0_lpmd_ack;            
wire            ifu_cp0_srst_ack;            
wire            ifu_hpcp_icache_access;      
wire            ifu_hpcp_icache_miss;        
wire    [31:0]  ifu_pmp_addr;                
wire            ifu_pmp_machine_mode;        
wire            ifu_rtu_lockup_ack;          
wire    [31:0]  ifu_sysmap_pa;               
wire            pad_yy_icg_scan_en;          
wire    [31:0]  pcgen_ifetch_addr;           
wire            pcgen_ifetch_chgflw_vld;     
wire    [31:0]  pcgen_ifetch_seq_addr;       
wire            pmp_ifu_acc_deny;            
wire            rtu_ifu_lockup_mask;         
wire            rtu_ifu_lockup_req;          
wire            rtu_yy_xx_dbgon;             
wire    [4 :0]  sysmap_ifu_flg;              
wire            trans_abort;                 
wire            vec_ifetch_data_fetch;       


//==========================================================
// Instruction Fetch Module
// 1. Instance ICG cell
// 2. I-Fetch Common Signals
// 3. Instance I-Cache
// 4. I-Bus Access Interface
//==========================================================

//------------------------------------------------
// 1. Instance ICG cell
//------------------------------------------------
assign ifetch_icg_en =  ibus_req_vld
                    | ~ibusif_idle_st;
// &Instance("gated_clk_cell", "x_ifu_ifetch_icg_cell"); @41
gated_clk_cell  x_ifu_ifetch_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ifetch_cpuclk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ifetch_icg_en     ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @42
//          .external_en (1'b0), @43
//          .global_en   (cp0_yy_clk_en), @44
//          .module_en   (cp0_ifu_icg_en), @45
//          .local_en    (ifetch_icg_en), @46
//          .clk_out     (ifetch_cpuclk) @47
//        ); @48

//------------------------------------------------
// 2. I-Fetch Common Signals
//------------------------------------------------
assign ifetch_req_addr[31:0] = pcgen_ifetch_addr[31:0];
assign ifetch_req_flg[4:0]   = sysmap_ifu_flg[4:0]; 

assign ifetch_req_ca         = ifetch_req_flg[3];
assign ifetch_req_buf        = ifetch_req_flg[2];
assign ifetch_req_prot[3:0]  = {ifetch_req_ca, ifetch_req_buf,
                              cp0_yy_mach_mode, 1'b0};
//------------------------------------------------
// 3. Instance I-Cache
//------------------------------------------------
// &Instance("pa_ifu_icache", "x_pa_ifu_icache"); @64
pa_ifu_icache  x_pa_ifu_icache (
  .bmu_ifu_acc_err              (bmu_ifu_acc_err             ),
  .cp0_ifu_icache_en            (cp0_ifu_icache_en           ),
  .cp0_ifu_icache_inv_addr      (cp0_ifu_icache_inv_addr     ),
  .cp0_ifu_icache_inv_req       (cp0_ifu_icache_inv_req      ),
  .cp0_ifu_icache_inv_type      (cp0_ifu_icache_inv_type     ),
  .cp0_ifu_icg_en               (cp0_ifu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .ctrl_ifetch_req_abort        (ctrl_ifetch_req_abort       ),
  .ctrl_ifetch_req_vld          (ctrl_ifetch_req_vld         ),
  .forever_cpuclk               (forever_cpuclk              ),
  .ibus_icache_cmplt            (ibus_icache_cmplt           ),
  .ibus_icache_data             (ibus_icache_data            ),
  .ibus_icache_error            (ibus_icache_error           ),
  .ibus_icache_grant            (ibus_icache_grant           ),
  .ibus_icache_not_busy         (ibus_icache_not_busy        ),
  .ibus_icache_uc_cmplt         (ibus_icache_uc_cmplt        ),
  .ibus_icache_unalign          (ibus_icache_unalign         ),
  .ibus_trans_abort             (ibus_trans_abort            ),
  .icache_ibus_acc_deny         (icache_ibus_acc_deny        ),
  .icache_ibus_addr             (icache_ibus_addr            ),
  .icache_ibus_burst            (icache_ibus_burst           ),
  .icache_ibus_data_req         (icache_ibus_data_req        ),
  .icache_ibus_prot             (icache_ibus_prot            ),
  .icache_ibus_req              (icache_ibus_req             ),
  .icache_ibus_seq              (icache_ibus_seq             ),
  .icache_ifetch_addr           (icache_ifetch_addr          ),
  .icache_ifetch_error          (icache_ifetch_error         ),
  .icache_ifetch_grant          (icache_ifetch_grant         ),
  .icache_ifetch_idle           (icache_ifetch_idle          ),
  .icache_ifetch_inst           (icache_ifetch_inst          ),
  .icache_ifetch_inst_vld       (icache_ifetch_inst_vld      ),
  .icache_ifetch_inst_vld_gate  (icache_ifetch_inst_vld_gate ),
  .icache_ifetch_mach_mode      (icache_ifetch_mach_mode     ),
  .icache_ifetch_not_busy       (icache_ifetch_not_busy      ),
  .icache_ifetch_rd_addr        (icache_ifetch_rd_addr       ),
  .icache_ifetch_uc_sel         (icache_ifetch_uc_sel        ),
  .icache_ifetch_unalign        (icache_ifetch_unalign       ),
  .icache_ifetch_vec_data_cmplt (icache_ifetch_vec_data_cmplt),
  .icache_top_abort             (icache_top_abort            ),
  .icache_top_rd_vld            (icache_top_rd_vld           ),
  .icache_top_ref_st            (icache_top_ref_st           ),
  .icache_top_uc_st             (icache_top_uc_st            ),
  .ifetch_outstanding           (ifetch_outstanding          ),
  .ifetch_req_addr              (ifetch_req_addr             ),
  .ifetch_req_ca                (ifetch_req_ca               ),
  .ifetch_req_prot              (ifetch_req_prot             ),
  .ifu_cp0_icache_inv_done      (ifu_cp0_icache_inv_done     ),
  .ifu_hpcp_icache_access       (ifu_hpcp_icache_access      ),
  .ifu_hpcp_icache_miss         (ifu_hpcp_icache_miss        ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .pcgen_ifetch_chgflw_vld      (pcgen_ifetch_chgflw_vld     ),
  .pcgen_ifetch_seq_addr        (pcgen_ifetch_seq_addr       ),
  .pmp_ifu_acc_deny             (pmp_ifu_acc_deny            ),
  .vec_ifetch_data_fetch        (vec_ifetch_data_fetch       )
);

assign ibus_req_vld        = icache_ibus_req;
assign ibus_data_req_vld   = icache_ibus_data_req;
assign ibus_req_addr[31:0] = icache_ibus_addr[31:0];
assign ibus_req_prot[3:0]  = icache_ibus_prot[3:0];
assign ibus_req_size[1:0]  = 2'b10;
assign ibus_req_seq        = icache_ibus_seq;
assign ibus_req_burst[2:0] = icache_ibus_burst[2:0];
assign ibus_req_deny       = icache_ibus_acc_deny;

//assign ibus_req_vld        = cp0_ifu_icache_en ? icache_ibus_req
//                                               : ctrl_ifetch_req_vld;
//assign ibus_req_addr[31:0] = cp0_ifu_icache_en ? icache_ibus_addr[31:0]
//                                               : ifetch_req_addr[31:0];
//assign ibus_req_size[1:0]  = 2'b10;
//assign ibus_req_prot[3:0]  = cp0_ifu_icache_en ? icache_ibus_prot[3:0]
//                                               : ifetch_req_prot[3:0];

assign ibus_icache_grant      = bmu_ifu_grant;
assign ibus_icache_cmplt      = ibus_req_cmplt;// & ~rtu_yy_xx_dbgon;
assign ibus_icache_error      = ibus_req_err | ibus_req_cmplt & ibus_deny_reg;
assign ibus_icache_data[31:0] = ibus_data[31:0];
assign ibus_icache_unalign    = ibus_unalign_reg;
assign ibus_icache_not_busy   = cur_st[0];
//------------------------------------------------
// 4. I-Bus Access Interface
// a. I-Bus Interface FSM
// b. I-Bus Request Handshake
//------------------------------------------------

// a. I-Bus Interface FSM
// State Statement:
// IDLE: Default State, wait for ibus req
// WFG: Grant State, wait for i-bus grant
// WFC: Complete State, wait for i-bus cmplt
// ABT: Abort State, wait for useless i-bus cmplt
parameter IDLE     = 3'b001,
          WFG1     = 3'b010,
          WFD1     = 3'b011,
          WFD1WFG2 = 3'b000,
          WFD1WFD2 = 3'b110;

parameter ABORT_IDLE = 2'b00,
          ABORT_VLD1 = 2'b10,
          ABORT_VLD2 = 2'b11;

assign flop_out_bus = 1'b1;

assign ibus_data[31:0] = bmu_ifu_rdata[31:0];
//{bmu_ifu_rdata[31:16], ibus_unalign_reg
//                        ? bmu_ifu_rdata[31:16] : bmu_ifu_rdata[15:0]};

// FSM Sequential Logic
always @(posedge ifetch_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_st[2:0] <= IDLE;
  else
    cur_st[2:0] <= nxt_st[2:0];
end

// FSM Output Logic
// &CombBeg; @136
always @( bmu_ifu_trans_cmplt
       or bmu_ifu_acc_err
       or ibus_req_vld
       or flop_out_bus
       or cur_st
       or bmu_ifu_grant)
begin
case(cur_st)
IDLE:
begin
  if(ibus_req_vld)
    begin
      if(bmu_ifu_grant)
        nxt_st[2:0] = WFD1;
      else
        nxt_st[2:0] = WFG1;
    end
  else
    nxt_st[2:0] = IDLE;
end
WFG1:
begin
  if(bmu_ifu_grant)
    nxt_st[2:0] = WFD1;
  else
    nxt_st[2:0] = WFG1;
end
WFD1:
begin
  if(bmu_ifu_trans_cmplt)
    begin
      if(ibus_req_vld)
        begin
          if(bmu_ifu_grant)
            nxt_st[2:0] = WFD1;
          else
            nxt_st[2:0] = WFG1;
        end
      else
        nxt_st[2:0] = IDLE;
    end
  else if(ibus_req_vld & flop_out_bus)
    begin //flop out bus can grant 2 outstanding inst fetch
      if(bmu_ifu_grant)
        nxt_st[2:0] = WFD1WFD2;
      else
        nxt_st[2:0] = WFD1WFG2;
    end
  else if(ibus_req_vld)
    nxt_st[2:0] = WFD1WFG2;
  else
    nxt_st[2:0] = WFD1;
end
WFD1WFG2:
begin
  if(bmu_ifu_trans_cmplt)
    begin
      if(bmu_ifu_grant)
        nxt_st[2:0] = WFD1;
      else if(bmu_ifu_acc_err)
        nxt_st[2:0] = IDLE;
      else
        nxt_st[2:0] = WFG1;
    end
  else
    begin
      if(bmu_ifu_grant & flop_out_bus)
        nxt_st[2:0] = WFD1WFD2;
      else
        nxt_st[2:0] = WFD1WFG2;
    end
end
WFD1WFD2:
begin
  if(bmu_ifu_trans_cmplt)
    nxt_st[2:0] = WFD1;
  else
    nxt_st[2:0] = WFD1WFD2;
end
default:
begin
  nxt_st[2:0] = IDLE;
end
endcase
// &CombEnd; @214
end

assign ibusif_idle_st = (cur_st[2:0] == IDLE);

assign ibus_req_cmplt = ((cur_st[2:0] == WFD1) 
                      | (cur_st[2:0] == WFD1WFG2)
                      | (cur_st[2:0] == WFD1WFD2)
                        )  & bmu_ifu_trans_cmplt
                           & ~ibus_trans_abort;
assign ibus_req_err = ((cur_st[2:0] == WFD1)
                    | (cur_st[2:0] == WFD1WFG2)
                    | (cur_st[2:0] == WFD1WFD2)
                      )  &  bmu_ifu_acc_err;
assign ibus_inst_req = (cur_st[2:0] == IDLE)
                         & ibus_req_vld
                    | (cur_st[2:0] == WFG1)
                    | (cur_st[2:0] == WFD1)
                         & ibus_req_vld
                    | (cur_st[2:0] == WFD1WFG2);
assign ibus_inst_data_req = (cur_st[2:0] == IDLE)
                         & ibus_data_req_vld
                    | (cur_st[2:0] == WFG1)
                    | (cur_st[2:0] == WFD1)
                         & ibus_data_req_vld
                    | (cur_st[2:0] == WFD1WFG2);

assign ifetch_outstanding = cur_st[2:0] == WFG1 | cur_st[2:0] == WFD1WFG2 | cur_st[2:0] == WFD1WFD2;

assign trans_abort = icache_ifetch_uc_sel & ctrl_ifetch_req_abort;
assign ibus_icache_uc_cmplt = ((cur_st[2:0] == WFD1) 
                            | (cur_st[2:0] == WFD1WFG2)
                            | (cur_st[2:0] == WFD1WFD2)
                              )  & bmu_ifu_trans_cmplt;

always @(posedge ifetch_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ibus_deny_reg <= 1'b0;
  else if(bmu_ifu_grant)
    ibus_deny_reg <= ibus_req_deny;
  else if(ibus_req_cmplt)
    ibus_deny_reg <= 1'b0;
end 
assign ibus_abort_trig = ((cur_st[2:0] == WFD1)
                           & ~bmu_ifu_trans_cmplt
                      | (cur_st[2:0] == WFG1)
                      | (cur_st[2:0] == WFD1WFG2)
                           & ~bmu_ifu_acc_err)
                           & trans_abort; 

//assign ibus_no_outstanding = (cur_st[2:0] == IDLE)
//                          | (cur_st[2:0] == WFG1)
//                          | (cur_st[2:0] == WFD1)
//                               & bmu_ifu_trans_cmplt
//                          | (cur_st[2:0] == WFD1WFG2)
//                               & bmu_ifu_trans_cmplt;
//
//assign ibus_prot_buf = ((cur_st[2:0] == IDLE) | (cur_st[2:0] == WFD1))
//                    & ((nxt_st == WFG1) | (nxt_st == WFD1WFG2));
//
//assign ibus_prot_buf_sel = (cur_st[2:0] == WFG1) | (cur_st[2:0] == WFD1WFG2);


//the abort SM
always @(posedge ifetch_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    abort_cur_st[1:0] <= ABORT_IDLE;
  else
    abort_cur_st[1:0] <= abort_nxt_st[1:0];
end

// &CombBeg; @290
always @( cur_st[2:0]
       or bmu_ifu_trans_cmplt
       or bmu_ifu_acc_err
       or abort_cur_st[1:0]
       or ibus_abort_trig)
begin
case(abort_cur_st[1:0])
ABORT_IDLE:
begin
  if(ibus_abort_trig)
    if(cur_st[2:0] == WFD1WFG2 & ~bmu_ifu_trans_cmplt)
      abort_nxt_st[1:0] = ABORT_VLD2;
    else
      abort_nxt_st[1:0] = ABORT_VLD1;
  else
    abort_nxt_st[1:0] = ABORT_IDLE;
end
ABORT_VLD1:
begin
  if(ibus_abort_trig) begin
    if(cur_st[2:0] == WFD1WFG2 & ~bmu_ifu_trans_cmplt)
      abort_nxt_st[1:0] = ABORT_VLD2;
    else 
      abort_nxt_st[1:0] = ABORT_VLD1;
  end
  else if(bmu_ifu_trans_cmplt)
    abort_nxt_st[1:0] = ABORT_IDLE;
  else
    abort_nxt_st[1:0] = ABORT_VLD1;
end
ABORT_VLD2:
begin
  if(bmu_ifu_trans_cmplt)
    if(bmu_ifu_acc_err)
      abort_nxt_st[1:0] = ABORT_IDLE;
    else
      abort_nxt_st[1:0] = ABORT_VLD1;
  else
    abort_nxt_st[1:0] = ABORT_VLD2;
end
default:
begin
  abort_nxt_st[1:0] = ABORT_IDLE;
end
endcase
// &CombEnd; @330
end

assign ibus_trans_abort = (abort_cur_st[1:0] != ABORT_IDLE);

// b. I-Bus Request Handshake
assign ibus_req = ibus_inst_req;

// 3. I-Bus Fetch Unalign
//When the requset address is not word aligned, only half of
//the word fed back will be creat into instruction buffer.
always @(posedge ifetch_cpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ibus_unalign_reg <= 1'b0;
  else if(bmu_ifu_grant)
    ibus_unalign_reg <= ibus_req_addr[1];
  else if(ibus_req_cmplt)
    ibus_unalign_reg <= 1'b0;
end 

//==========================================================
// Rename for Output
//==========================================================

// Output to I-Bus
assign ifu_bmu_req        = ibus_req;
assign ifu_bmu_data_req   = ibus_inst_data_req;
// Todo
assign ifu_bmu_seq        = ibus_req_seq;
assign ifu_bmu_burst[2:0] = ibus_req_burst[2:0];
assign ifu_bmu_acc_deny   = ibus_req_deny;
assign ifu_bmu_addr[31:0] = {ibus_req_addr[31:2], 2'b0};
assign ifu_bmu_size[1:0]  = ibus_req_size[1:0];
assign ifu_bmu_prot[3:0]  = ibus_req_prot[3:0];

// Output to I-Buffer
// TODO: uncacheable
assign ifetch_inst_vld         = icache_ifetch_inst_vld & ~rtu_yy_xx_dbgon
                              & ~rtu_ifu_lockup_mask;
assign ifetch_ipack_inst_vld   = ifetch_inst_vld;
assign ifetch_ipack_inst_vld_gate = icache_ifetch_inst_vld_gate;
assign ifetch_ipack_acc_err    = icache_ifetch_error;
assign ifetch_ipack_inst[31:0] = icache_ifetch_inst[31:0];
assign ifetch_ipack_unalign    = icache_ifetch_unalign;
assign ifetch_ctrl_inst_vld    = ifetch_inst_vld;
assign ifetch_ibuf_idle        = icache_ifetch_idle;
assign ifetch_vec_idle         = icache_ifetch_idle & ibusif_idle_st;
assign ifetch_xx_not_busy      = icache_ifetch_not_busy;
assign ifetch_pcgen_grant      = icache_ifetch_grant;
assign ifetch_pcgen_data[31:0] = icache_ifetch_inst[31:0];
assign ifetch_pcgen_addr[31:0] = icache_ifetch_addr[31:0];
assign ifetch_vec_grant        = icache_ifetch_grant;
assign ifetch_vec_cmplt        = icache_ifetch_vec_data_cmplt;
assign ifetch_vec_acc_err      = icache_ifetch_error;

// Output to CP0
assign ifu_cp0_lpmd_ack        = cp0_ifu_lpmd_req & ibusif_idle_st & icache_ifetch_idle;
assign ifu_cp0_srst_ack        = cp0_ifu_srst_req & ibusif_idle_st & icache_ifetch_idle;
assign ifu_rtu_lockup_ack      = rtu_ifu_lockup_req & ibusif_idle_st & icache_ifetch_idle;

//assign ifetch_inst_vld         = (cp0_ifu_icache_en ? icache_ifetch_inst_vld 
//                                                    : ibus_req_cmplt)
//                              & ~rtu_yy_xx_dbgon;
//assign ifetch_ipack_inst_vld   = ifetch_inst_vld;
//assign ifetch_ipack_acc_err    = cp0_ifu_icache_en ? icache_ifetch_error
//                                                   : ibus_req_err;
//assign ifetch_ipack_inst[31:0] = cp0_ifu_icache_en ? icache_ifetch_inst[31:0]
//                                                   : ibus_data[31:0];
//assign ifetch_ipack_unalign    = cp0_ifu_icache_en ? icache_ifetch_unalign
//                                                   : ibus_unalign_reg;
//assign ifetch_ctrl_inst_vld    = ifetch_inst_vld;
//
//assign ifetch_pcgen_grant      = cp0_ifu_icache_en ? icache_ifetch_grant
//                                                   : bmu_ifu_grant;
//assign ifetch_ibuf_idle        = cp0_ifu_icache_en ? icache_ifetch_idle
//                                                   : ibusif_idle_st;
//assign ifetch_xx_not_busy      = cp0_ifu_icache_en ? 1'b1
//                                                   : ~ibus_busy;

// Output to top
assign ifetch_top_cur_st[2:0]  = cur_st[2:0];
assign ifetch_top_abt_st[1:0]  = abort_cur_st[1:0];

assign ifetch_pcgen_grant_dp   = ctrl_ifetch_req_vld
                              | vec_ifetch_data_fetch
                              | ifetch_outstanding;

// Output to PMP
assign ifu_pmp_addr[31:0]   = icache_ifetch_rd_addr[31:0];
assign ifu_pmp_machine_mode = icache_ifetch_mach_mode;
// &Force("input","pcgen_ifetch_ifpc"); @471
// &Force("bus","pcgen_ifetch_ifpc",31,0); @472

// Output to Sysmap
assign ifu_sysmap_pa[31:0]  = ifetch_req_addr[31:0];

// &ModuleEnd; @481
endmodule


