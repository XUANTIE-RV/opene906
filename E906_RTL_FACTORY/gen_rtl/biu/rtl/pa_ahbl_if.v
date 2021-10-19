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
module pa_ahbl_if(
  ahbl_bmu_dbus_acc_err,
  ahbl_bmu_dbus_data,
  ahbl_bmu_dbus_grnt,
  ahbl_bmu_dbus_trans_cmplt,
  ahbl_bmu_ibus_acc_err,
  ahbl_bmu_ibus_data,
  ahbl_bmu_ibus_grnt,
  ahbl_bmu_ibus_trans_cmplt,
  ahbl_clk_en,
  ahbl_dbginfo,
  ahbl_gated_clk,
  ahbl_pad_haddr,
  ahbl_pad_hburst,
  ahbl_pad_hlock,
  ahbl_pad_hprot,
  ahbl_pad_hsize,
  ahbl_pad_htrans,
  ahbl_pad_hwdata,
  ahbl_pad_hwrite,
  ahbl_sysio_idle,
  bmu_ahbl_dbus_acc_deny,
  bmu_ahbl_dbus_addr,
  bmu_ahbl_dbus_burst,
  bmu_ahbl_dbus_lock,
  bmu_ahbl_dbus_lrsc,
  bmu_ahbl_dbus_prot,
  bmu_ahbl_dbus_req,
  bmu_ahbl_dbus_req_dp,
  bmu_ahbl_dbus_seq,
  bmu_ahbl_dbus_size,
  bmu_ahbl_dbus_wdata,
  bmu_ahbl_dbus_write,
  bmu_ahbl_ibus_acc_deny,
  bmu_ahbl_ibus_addr,
  bmu_ahbl_ibus_burst,
  bmu_ahbl_ibus_prot,
  bmu_ahbl_ibus_req,
  bmu_ahbl_ibus_req_dp,
  bmu_ahbl_ibus_seq,
  bmu_ahbl_ibus_size,
  cpurst_b,
  lsu_biu_amo_pmp_deny,
  lsu_biu_async_expt_ack,
  lsu_xx_flush,
  pad_ahbl_hrdata,
  pad_ahbl_hready,
  pad_ahbl_hresp,
  rtu_yy_xx_async_flush,
  sysio_xx_halt_req
);

// &Ports; @24
input           ahbl_gated_clk;           
input           bmu_ahbl_dbus_acc_deny;   
input   [31:0]  bmu_ahbl_dbus_addr;       
input   [2 :0]  bmu_ahbl_dbus_burst;      
input           bmu_ahbl_dbus_lock;       
input           bmu_ahbl_dbus_lrsc;       
input   [3 :0]  bmu_ahbl_dbus_prot;       
input           bmu_ahbl_dbus_req;        
input           bmu_ahbl_dbus_req_dp;     
input           bmu_ahbl_dbus_seq;        
input   [1 :0]  bmu_ahbl_dbus_size;       
input   [31:0]  bmu_ahbl_dbus_wdata;      
input           bmu_ahbl_dbus_write;      
input           bmu_ahbl_ibus_acc_deny;   
input   [31:0]  bmu_ahbl_ibus_addr;       
input   [2 :0]  bmu_ahbl_ibus_burst;      
input   [3 :0]  bmu_ahbl_ibus_prot;       
input           bmu_ahbl_ibus_req;        
input           bmu_ahbl_ibus_req_dp;     
input           bmu_ahbl_ibus_seq;        
input   [1 :0]  bmu_ahbl_ibus_size;       
input           cpurst_b;                 
input           lsu_biu_amo_pmp_deny;     
input           lsu_biu_async_expt_ack;   
input           lsu_xx_flush;             
input   [31:0]  pad_ahbl_hrdata;          
input           pad_ahbl_hready;          
input           pad_ahbl_hresp;           
input           rtu_yy_xx_async_flush;    
input           sysio_xx_halt_req;        
output          ahbl_bmu_dbus_acc_err;    
output  [31:0]  ahbl_bmu_dbus_data;       
output          ahbl_bmu_dbus_grnt;       
output          ahbl_bmu_dbus_trans_cmplt; 
output          ahbl_bmu_ibus_acc_err;    
output  [31:0]  ahbl_bmu_ibus_data;       
output          ahbl_bmu_ibus_grnt;       
output          ahbl_bmu_ibus_trans_cmplt; 
output          ahbl_clk_en;              
output  [10:0]  ahbl_dbginfo;             
output  [31:0]  ahbl_pad_haddr;           
output  [2 :0]  ahbl_pad_hburst;          
output          ahbl_pad_hlock;           
output  [3 :0]  ahbl_pad_hprot;           
output  [2 :0]  ahbl_pad_hsize;           
output  [1 :0]  ahbl_pad_htrans;          
output  [31:0]  ahbl_pad_hwdata;          
output          ahbl_pad_hwrite;          
output          ahbl_sysio_idle;          

// &Regs; @25
reg     [2 :0]  ahblif_cur_state;         
reg     [2 :0]  ahblif_nxt_state;         
reg     [2 :0]  burst_cnt;                
reg             ibus_not_grant;           
reg     [1 :0]  lock_cur_state;           
reg     [1 :0]  lock_next_state;          
reg     [1 :0]  req_mask;                 
reg     [1 :0]  req_sel;                  

// &Wires; @26
wire            acc_err;                  
wire            ahbl_bmu_dbus_acc_err;    
wire    [31:0]  ahbl_bmu_dbus_data;       
wire            ahbl_bmu_dbus_grnt;       
wire            ahbl_bmu_dbus_trans_cmplt; 
wire            ahbl_bmu_ibus_acc_err;    
wire    [31:0]  ahbl_bmu_ibus_data;       
wire            ahbl_bmu_ibus_grnt;       
wire            ahbl_bmu_ibus_trans_cmplt; 
wire            ahbl_clk_en;              
wire    [10:0]  ahbl_dbginfo;             
wire            ahbl_gated_clk;           
wire    [31:0]  ahbl_pad_haddr;           
wire    [2 :0]  ahbl_pad_hburst;          
wire            ahbl_pad_hlock;           
wire    [3 :0]  ahbl_pad_hprot;           
wire    [2 :0]  ahbl_pad_hsize;           
wire    [1 :0]  ahbl_pad_htrans;          
wire    [31:0]  ahbl_pad_hwdata;          
wire            ahbl_pad_hwrite;          
wire            ahbl_sysio_idle;          
wire            ahblif_req_idle;          
wire            ahblif_req_idle_dp;       
wire    [31:0]  bmu_ahbl_dbus_addr;       
wire    [2 :0]  bmu_ahbl_dbus_burst;      
wire            bmu_ahbl_dbus_lock;       
wire            bmu_ahbl_dbus_lrsc;       
wire    [3 :0]  bmu_ahbl_dbus_prot;       
wire            bmu_ahbl_dbus_req;        
wire            bmu_ahbl_dbus_req_dp;     
wire            bmu_ahbl_dbus_seq;        
wire    [1 :0]  bmu_ahbl_dbus_size;       
wire    [31:0]  bmu_ahbl_dbus_wdata;      
wire            bmu_ahbl_dbus_write;      
wire    [31:0]  bmu_ahbl_ibus_addr;       
wire    [2 :0]  bmu_ahbl_ibus_burst;      
wire    [3 :0]  bmu_ahbl_ibus_prot;       
wire            bmu_ahbl_ibus_req;        
wire            bmu_ahbl_ibus_req_dp;     
wire            bmu_ahbl_ibus_seq;        
wire    [1 :0]  bmu_ahbl_ibus_size;       
wire            burst_clr;                
wire            burst_req;                
wire    [31:0]  bus_rdata;                
wire            bus_ready;                
wire            bus_resp;                 
wire    [31:0]  cpu_addr;                 
wire    [2 :0]  cpu_burst;                
wire            cpu_burst_vld;            
wire            cpu_lock;                 
wire    [3 :0]  cpu_prot;                 
wire            cpu_req;                  
wire            cpu_req_gate;             
wire            cpu_seq;                  
wire    [1 :0]  cpu_size;                 
wire    [31:0]  cpu_wdata;                
wire            cpu_write;                
wire            cpurst_b;                 
wire            dbus_req;                 
wire            dbus_sel;                 
wire            dbus_sel_raw;             
wire            ibus_req;                 
wire            ibus_sel;                 
wire            ibus_sel_raw;             
wire            inc2;                     
wire    [2 :0]  init_cnt_inc;             
wire            lock_clr;                 
wire            lock_cur_idle;            
wire            lock_req_vld;             
wire            lsu_biu_amo_pmp_deny;     
wire            lsu_biu_async_expt_ack;   
wire            lsu_xx_flush;             
wire    [31:0]  pad_ahbl_hrdata;          
wire            pad_ahbl_hready;          
wire            pad_ahbl_hresp;           
wire            req_grnt;                 
wire            req_last;                 
wire    [1 :0]  req_mask_raw;             
wire            req_mask_vld;             
wire    [1 :0]  req_sel_dp;               
wire    [1 :0]  req_valid;                
wire    [1 :0]  req_valid_dp;             
wire            rtu_yy_xx_async_flush;    
wire            sysio_xx_halt_req;        
wire            trans_cmplt;              


parameter DATA_WIDTH = 32;

//==============================================================================
//
//                 AHB LITE master interface FSM
//
//==============================================================================
//1. control one transfer: SINGLE
//2. generate control signals for AHB LITE control signals: HTRANS, HCTRL

//===================================================================
//     parameter description
//IDLE  : wait for the cpu request; when cpu has request and hready, 
//        control information is put on the AHB LITE in this state.
//WFD   : wait for the data from the AHB LITE; if back-to-back 
//        transfer occur, the fsm will stay in the state.
//ERROR : wait for the second phase of the two signal error response.
//ERROR1: generate the error vld signal to cpu.
//===================================================================
parameter IDLE   = 3'b000,
          WFG    = 3'b010,
          WFD    = 3'b001,
          ERROR1 = 3'b110,
          ERROR2 = 3'b111;

//==========================================================
//     FSM main body
//==========================================================
always@(posedge ahbl_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ahblif_cur_state[2:0] <= IDLE;
  else
    ahblif_cur_state[2:0] <= ahblif_nxt_state[2:0];
end 

// &CombBeg; @64
always @( bus_ready
       or cpu_req
       or sysio_xx_halt_req
       or bus_resp
       or ahblif_cur_state[2:0]
       or cpu_lock)
begin
case(ahblif_cur_state[2:0])
  IDLE: 
  begin
    if(cpu_req & !sysio_xx_halt_req) begin
      if(bus_ready)
        ahblif_nxt_state[2:0] = WFD;
      else //no ready
        ahblif_nxt_state[2:0] = WFG;
    end
    else //no request
      ahblif_nxt_state[2:0] = IDLE;
  end
  WFG: 
  begin
    if(bus_ready)
      ahblif_nxt_state[2:0] = WFD;
    else //no ready
      ahblif_nxt_state[2:0] = WFG;
  end
  WFD:   // in this state[2:0] AHBL wait for the data.
  begin
    if(bus_resp) //resp is ERROR
      ahblif_nxt_state[2:0] = ERROR1;
    else if(!bus_ready) //resp == OK, hready == 0
      ahblif_nxt_state[2:0] = WFD;
    else //resp == OK, hready == 1
    begin
      if(cpu_req & !cpu_lock)
        ahblif_nxt_state[2:0] = WFD;
      else
        ahblif_nxt_state[2:0] = IDLE;
    end
  end
  ERROR1: // error occurs
  begin
    if(bus_resp)               // resp is ERROR
    begin
      if(!bus_ready)           // ready == 0
        ahblif_nxt_state[2:0] = ERROR1;
      else
        ahblif_nxt_state[2:0] = ERROR2; // bus resp is ERROR, hready == 1
    end
    else
      ahblif_nxt_state[2:0] = ERROR2; // bus resp is ERROR, hready == 1
  end
  ERROR2: // error occurs
    ahblif_nxt_state[2:0] = IDLE; 
  default:
    ahblif_nxt_state[2:0] = IDLE;
endcase
// &CombEnd; @115
end

assign ahblif_req_idle_dp = (ahblif_cur_state[2:0] == IDLE) |
                            (ahblif_cur_state[2:0] == WFD);

assign ahblif_req_idle = (ahblif_cur_state[2:0] == IDLE) & !sysio_xx_halt_req |
                         (ahblif_cur_state[2:0] == WFD) & bus_ready;

//===========================================================
//       BUS LOCK
//===========================================================
parameter LOCK_IDLE = 2'b00;
parameter LOCK_WFS  = 2'b01;
parameter LOCK_WFC  = 2'b10;

always@(posedge ahbl_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lock_cur_state[1:0] <= LOCK_IDLE;
  else if (lsu_biu_amo_pmp_deny)
    lock_cur_state[1:0] <= LOCK_IDLE;
  else
    lock_cur_state[1:0] <= lock_next_state[1:0];
end

assign lock_req_vld = cpu_req & cpu_lock & ahblif_req_idle & !cpu_write & !lsu_biu_amo_pmp_deny & !sysio_xx_halt_req;

// &CombBeg; @142
always @( req_grnt
       or req_last
       or cpu_req
       or lsu_biu_async_expt_ack
       or lock_req_vld
       or cpu_burst_vld
       or acc_err
       or lsu_xx_flush
       or lock_cur_state[1:0]
       or rtu_yy_xx_async_flush)
begin
  case(lock_cur_state[1:0])
  LOCK_IDLE: begin
    if (lock_req_vld)
      lock_next_state[1:0] = (req_grnt & !cpu_burst_vld) ? LOCK_WFC : LOCK_WFS;
    else 
      lock_next_state[1:0] = LOCK_IDLE;
  end
  LOCK_WFS: begin
    if (acc_err)
      lock_next_state[1:0] = LOCK_IDLE;
    else if (req_grnt & req_last)
      lock_next_state[1:0] = LOCK_WFC;
    else
      lock_next_state[1:0] = LOCK_WFS;
  end
  LOCK_WFC: begin
    if (cpu_req & req_grnt | lsu_xx_flush | acc_err | rtu_yy_xx_async_flush | lsu_biu_async_expt_ack)
      lock_next_state[1:0] = LOCK_IDLE;
    else 
      lock_next_state[1:0] = LOCK_WFC;
  end
  default: lock_next_state[1:0] = LOCK_IDLE;
  endcase
// &CombEnd; @166
end

assign lock_cur_idle =  lock_cur_state[1:0] == LOCK_IDLE;
assign lock_clr  = (lock_cur_state[1:0] == LOCK_WFC) & (cpu_req & req_grnt | acc_err | lsu_biu_async_expt_ack) |
                   (lock_cur_state[1:0] == LOCK_WFS) & acc_err |
                   !lock_cur_idle & (lsu_xx_flush |
                                 lsu_biu_amo_pmp_deny);

assign cpu_burst_vld = cpu_burst[2:0] != 3'b000;
assign burst_req     = cpu_req & cpu_burst_vld & ahblif_req_idle;
assign burst_clr     = burst_req & cpu_seq & req_last | acc_err | rtu_yy_xx_async_flush & (req_mask[1:0] == 2'b10);

assign req_mask_raw[1:0] = rtu_yy_xx_async_flush & (req_valid[1:0] == 2'b01)
                         ? 2'b0
                         : ~req_valid[1:0];

always@(posedge ahbl_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    req_mask[1:0] <= 2'b0;
  else if (lock_clr & !burst_req | burst_clr)
    req_mask[1:0] <= 2'b0;
  else if (lock_req_vld & lock_cur_idle | burst_req)
    req_mask[1:0] <= req_mask_raw[1:0];
end

assign req_mask_vld = req_mask[1:0] != 2'b00;

always@(posedge ahbl_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    burst_cnt[2:0] <= 3'b0;
  else if (burst_req & !cpu_seq)
    burst_cnt[2:0] <= init_cnt_inc[2:0];
  else if (burst_req & burst_cnt[2:0] != 3'b0)
    burst_cnt[2:0] <= burst_cnt[2:0] - 3'b001;
end

assign inc2 = cpu_burst[2:0] == 3'b001;
assign init_cnt_inc[2:0] = inc2 ? 3'b000 : 3'b110;
//assign init_cnt[2:0]     = inc2 ? 3'b001 : 3'b111;
assign req_last = req_mask_vld & burst_cnt[2:0] == 3'b000;

//===========================================================
//     FSM output signal 
//===========================================================
// &Force("input","bmu_ahbl_dbus_acc_deny"); @212
// &Force("input","bmu_ahbl_ibus_acc_deny"); @213
always@(posedge ahbl_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ibus_not_grant <= 1'b0;
  else if (ibus_req & !req_grnt)
    ibus_not_grant <= 1'b1;
  else if (req_grnt)
    ibus_not_grant <= 1'b0;
end

assign dbus_req = bmu_ahbl_dbus_req & !req_mask[0] & !ibus_not_grant;
assign ibus_req = bmu_ahbl_ibus_req & !req_mask[1] & !dbus_sel_raw;
assign cpu_req = ibus_req | dbus_req;

assign req_valid[1:0] = {ibus_req,dbus_req};

assign dbus_sel_raw = bmu_ahbl_dbus_req_dp & !req_mask[0] & !ibus_not_grant;
assign ibus_sel_raw = bmu_ahbl_ibus_req_dp & !req_mask[1] & !dbus_sel_raw;

assign req_valid_dp[1:0] = {ibus_sel_raw, dbus_sel_raw};

always@(posedge ahbl_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    req_sel[1:0] <= 2'b0;
  else if (ahblif_req_idle & cpu_req)
    req_sel[1:0] <= req_valid[1:0];
end

assign req_sel_dp[1:0] = ahblif_req_idle_dp ? req_valid_dp[1:0] : req_sel[1:0];

assign dbus_sel = req_sel_dp[0];
assign ibus_sel = req_sel_dp[1];

//assign cpu_acc_deny     = dbus_sel       & bmu_ahbl_dbus_acc_deny 
//                        | ibus_sel       & bmu_ahbl_ibus_acc_deny

assign cpu_addr[31:0]   = {32{dbus_sel}} & bmu_ahbl_dbus_addr[31:0]
                        | {32{ibus_sel}} & bmu_ahbl_ibus_addr[31:0];

assign cpu_prot[3:0]    = {4{dbus_sel}}  & bmu_ahbl_dbus_prot[3:0]
                        | {4{ibus_sel}}  & bmu_ahbl_ibus_prot[3:0];

assign cpu_size[1:0]    = {2{dbus_sel}}  & bmu_ahbl_dbus_size[1:0]
                        | {2{ibus_sel}}  & bmu_ahbl_ibus_size[1:0];

assign cpu_seq          = dbus_sel       & bmu_ahbl_dbus_seq 
                        | ibus_sel       & bmu_ahbl_ibus_seq;

assign cpu_burst[2:0]   = {3{dbus_sel}}  & bmu_ahbl_dbus_burst[2:0]
                        | {3{ibus_sel}}  & bmu_ahbl_ibus_burst[2:0];

assign cpu_write        = dbus_sel       & bmu_ahbl_dbus_write;

assign cpu_wdata[DATA_WIDTH-1:0]  = bmu_ahbl_dbus_wdata[DATA_WIDTH-1:0];

assign cpu_lock         = dbus_sel & bmu_ahbl_dbus_lock & !bmu_ahbl_dbus_lrsc;
//assign cpu_lrsc         = dbus_sel & bmu_ahbl_dbus_lrsc;

//assign cpu_amo          = cpu_lock & !cpu_lrsc;

//==========================================================
//     interface to AHBL
//==========================================================
//output
// &Force("output","ahbl_pad_htrans"); @279
assign ahbl_pad_htrans[1] = cpu_req & ((ahblif_cur_state[2:0]==IDLE) & !sysio_xx_halt_req | 
                                       (ahblif_cur_state[2:0]==WFD) & !cpu_lock) | 
                                       (ahblif_cur_state[2:0]==WFG);

assign ahbl_pad_htrans[0] = req_mask_vld & cpu_burst_vld & (ahblif_cur_state[2:0]==WFD);

assign ahbl_pad_haddr[31:0] = cpu_addr[31:0];
assign ahbl_pad_hwrite      = cpu_write;
assign ahbl_pad_hsize[2:0]  = {1'b0, cpu_size[1:0]};
assign ahbl_pad_hprot[3:0]  = cpu_prot[3:0];
assign ahbl_pad_hburst[2:0] = cpu_burst[2:0];
assign ahbl_pad_hlock       = ahbl_pad_htrans[1] & cpu_lock | !lock_cur_idle;
assign ahbl_pad_hwdata[DATA_WIDTH-1:0] = cpu_wdata[DATA_WIDTH-1:0];
//input
assign bus_ready        = pad_ahbl_hready;
assign bus_resp         = pad_ahbl_hresp;
assign bus_rdata[DATA_WIDTH-1:0] = pad_ahbl_hrdata[DATA_WIDTH-1:0];

//==============================================================================
//                            interface with CPU
//==============================================================================
// cpu grant singal
assign req_grnt = ((ahblif_cur_state[2:0]==IDLE && !sysio_xx_halt_req)
                 || ahblif_cur_state[2:0]==WFG
                 || (ahblif_cur_state[2:0]==WFD) && !cpu_lock)
                 && bus_ready && !bus_resp;

// trans complete singal
assign trans_cmplt  = (ahblif_cur_state[2:0]==WFD) &&  bus_ready && !bus_resp
                   || (ahblif_cur_state[2:0]==ERROR2); //error vld
                    
// access error valid singal
assign acc_err = (ahblif_cur_state[2:0]==ERROR2);

//==========================================================
//           to BMU
//==========================================================
assign ahbl_bmu_ibus_grnt        = req_sel_dp[1] & req_grnt;
assign ahbl_bmu_ibus_trans_cmplt = req_sel[1] & trans_cmplt;
assign ahbl_bmu_ibus_acc_err     = req_sel[1] & acc_err;
assign ahbl_bmu_ibus_data[DATA_WIDTH-1:0] = bus_rdata[DATA_WIDTH-1:0];

assign ahbl_bmu_dbus_grnt        = req_sel_dp[0] & req_grnt;
assign ahbl_bmu_dbus_trans_cmplt = req_sel[0] & trans_cmplt;
assign ahbl_bmu_dbus_acc_err     = req_sel[0] & acc_err;
assign ahbl_bmu_dbus_data[DATA_WIDTH-1:0] = bus_rdata[DATA_WIDTH-1:0];

//==========================================================
//     BIU CLK EN
//==========================================================

assign cpu_req_gate    = bmu_ahbl_dbus_req_dp | 
                         bmu_ahbl_ibus_req_dp;

assign ahbl_clk_en     = !(ahblif_cur_state[2:0]==IDLE) | cpu_req_gate |
                         !(lock_cur_state[1:0]==LOCK_IDLE) | 
                         rtu_yy_xx_async_flush;
assign ahbl_sysio_idle = (ahblif_cur_state[2:0]==IDLE);

assign ahbl_dbginfo[10:0] = {burst_cnt[2:0],1'b0,req_mask[1:0],lock_cur_state[1:0],ahblif_cur_state[2:0]};

//     &Force("nonport",   "dbus_ibus_cmpt"); @386
//     &Force("nonport",   "ibus_req_reg"); @387

// &ModuleEnd; @390
endmodule


