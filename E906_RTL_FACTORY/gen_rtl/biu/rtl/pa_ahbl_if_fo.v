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
module pa_ahbl_if_fo(
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
  clk_en,
  cpurst_b,
  lsu_biu_amo_pmp_deny,
  lsu_biu_async_expt_ack,
  lsu_xx_flush,
  lsu_xx_warm_up,
  pad_ahbl_hrdata,
  pad_ahbl_hready,
  pad_ahbl_hresp,
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
input           clk_en;                   
input           cpurst_b;                 
input           lsu_biu_amo_pmp_deny;     
input           lsu_biu_async_expt_ack;   
input           lsu_xx_flush;             
input           lsu_xx_warm_up;           
input   [31:0]  pad_ahbl_hrdata;          
input           pad_ahbl_hready;          
input           pad_ahbl_hresp;           
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
reg     [1 :0]  lock_cur_state;           
reg     [1 :0]  lock_next_state;          
reg     [31:0]  req_buf_addr;             
reg             req_buf_lock;             
reg             req_buf_pmp_deny;         
reg     [3 :0]  req_buf_prot;             
reg     [1 :0]  req_buf_size;             
reg             req_buf_vld;              
reg     [31:0]  req_buf_wdata;            
reg             req_buf_write;            
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
wire            bmu_ahbl_dbus_acc_deny;   
wire    [31:0]  bmu_ahbl_dbus_addr;       
wire            bmu_ahbl_dbus_lock;       
wire            bmu_ahbl_dbus_lrsc;       
wire    [3 :0]  bmu_ahbl_dbus_prot;       
wire            bmu_ahbl_dbus_req;        
wire            bmu_ahbl_dbus_req_dp;     
wire    [1 :0]  bmu_ahbl_dbus_size;       
wire    [31:0]  bmu_ahbl_dbus_wdata;      
wire            bmu_ahbl_dbus_write;      
wire            bmu_ahbl_ibus_acc_deny;   
wire    [31:0]  bmu_ahbl_ibus_addr;       
wire    [3 :0]  bmu_ahbl_ibus_prot;       
wire            bmu_ahbl_ibus_req;        
wire            bmu_ahbl_ibus_req_dp;     
wire    [1 :0]  bmu_ahbl_ibus_size;       
wire    [31:0]  bus_rdata;                
wire            bus_ready;                
wire            bus_resp;                 
wire            clk_en;                   
wire            cpu_acc_deny;             
wire    [31:0]  cpu_addr;                 
wire            cpu_grant;                
wire            cpu_lock;                 
wire    [3 :0]  cpu_prot;                 
wire            cpu_req;                  
wire            cpu_req_gate;             
wire    [1 :0]  cpu_size;                 
wire    [31:0]  cpu_wdata;                
wire            cpu_write;                
wire            cpurst_b;                 
wire            dbus_req;                 
wire            dbus_sel;                 
wire            ibus_req;                 
wire            ibus_sel;                 
wire            lock_clr;                 
wire            lock_cur_idle;            
wire            lock_req_vld;             
wire            lsu_biu_async_expt_ack;   
wire            lsu_xx_flush;             
wire            lsu_xx_warm_up;           
wire    [31:0]  pad_ahbl_hrdata;          
wire            pad_ahbl_hready;          
wire            pad_ahbl_hresp;           
wire            req_buf_create_en;        
wire            req_buf_lock_clr;         
wire            req_buf_pop_en;           
wire            req_buf_wdata_create_en;  
wire            req_data_ready;           
wire    [1 :0]  req_valid;                
wire            req_vld;                  
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
  else if (clk_en)
    ahblif_cur_state[2:0] <= ahblif_nxt_state[2:0];
end 

// &CombBeg; @64
always @( req_buf_pmp_deny
       or bus_ready
       or req_buf_vld
       or bus_resp
       or ahblif_cur_state[2:0])
begin
case(ahblif_cur_state[2:0])
  IDLE: begin
    if (req_buf_vld)
      ahblif_nxt_state[2:0] = (bus_ready | req_buf_pmp_deny) ? WFD : WFG;
    else
      ahblif_nxt_state[2:0] = IDLE;
  end
  WFG: begin
    if (bus_ready)
      ahblif_nxt_state[2:0] = WFD;
    else 
      ahblif_nxt_state[2:0] = WFG;
  end
  WFD: begin
    if (bus_resp)
      ahblif_nxt_state[2:0] = ERROR1;
    else if (!bus_ready & !req_buf_pmp_deny)
      ahblif_nxt_state[2:0] = WFD;
    else 
      ahblif_nxt_state[2:0] = IDLE;
  end
  ERROR1: begin
    if (bus_ready | !bus_resp)
      ahblif_nxt_state[2:0] = ERROR2;
    else 
      ahblif_nxt_state[2:0] = ERROR1; 
  end
  ERROR2: 
    ahblif_nxt_state[2:0] = IDLE;
  default: ahblif_nxt_state[2:0] = IDLE;
endcase
// &CombEnd; @96
end

assign ahblif_req_idle = (ahblif_cur_state[2:0] == IDLE) |
                         (ahblif_cur_state[2:0] == WFD) & bus_ready;

assign req_data_ready  = (ahblif_cur_state[2:0] == WFD) & bus_ready;

//===========================================================
//       BUS LOCK
//===========================================================
// &Force("input","lsu_biu_amo_pmp_deny"); @106
parameter LOCK_IDLE = 2'b00;
parameter LOCK_WFS  = 2'b01;
parameter LOCK_WFC  = 2'b10;

always@(posedge ahbl_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lock_cur_state[1:0] <= LOCK_IDLE;
  else if (req_buf_vld & req_buf_pmp_deny)
    lock_cur_state[1:0] <= LOCK_IDLE;
  else if (clk_en)
    lock_cur_state[1:0] <= lock_next_state[1:0];
end

assign lock_req_vld = cpu_req & cpu_lock & !cpu_write & 
                      cpu_grant;

// &CombBeg; @124
always @( acc_err
       or cpu_grant
       or cpu_req
       or lsu_biu_async_expt_ack
       or lock_req_vld
       or lock_cur_state[1:0])
begin
  case(lock_cur_state[1:0])
  LOCK_IDLE: begin
    if (lock_req_vld)
      lock_next_state[1:0] = LOCK_WFC;
    else 
      lock_next_state[1:0] = LOCK_IDLE;
  end
//  LOCK_WFS: begin
//    if (acc_err)
//      lock_next_state[1:0] = LOCK_IDLE;
//    else if (trans_cmplt)
//      lock_next_state[1:0] = LOCK_WFC;
//    else
//      lock_next_state[1:0] = LOCK_WFS;
//  end
  LOCK_WFC: begin
    if (acc_err | cpu_req & cpu_grant | lsu_biu_async_expt_ack)
      lock_next_state[1:0] = LOCK_IDLE;
    else 
      lock_next_state[1:0] = LOCK_WFC;
  end
  default: lock_next_state[1:0] = LOCK_IDLE;
  endcase
// &CombEnd; @148
end

assign lock_cur_idle =  lock_cur_state[1:0] == LOCK_IDLE;
assign lock_clr  = (lock_cur_state[1:0] == LOCK_WFC) & (cpu_grant & cpu_req | acc_err | lsu_biu_async_expt_ack) | 
                   !lock_cur_idle & lsu_xx_flush |
                    req_buf_vld & req_buf_pmp_deny;

always@(posedge ahbl_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    req_mask[1:0] <= 2'b0;
  else if (lock_req_vld & lock_cur_idle)
    req_mask[1:0] <= ~req_valid[1:0];
  else if (lock_clr)
    req_mask[1:0] <= 2'b0;
end

//===========================================================
//     FSM output signal 
//===========================================================
// &Force("input", "bmu_ahbl_dbus_burst"); &Force("bus", "bmu_ahbl_dbus_burst",2,0); @168
// &Force("input", "bmu_ahbl_ibus_burst"); &Force("bus", "bmu_ahbl_ibus_burst",2,0); @169
// &Force("input", "bmu_ahbl_dbus_seq"); @170
// &Force("input", "bmu_ahbl_ibus_seq"); @171

assign dbus_req = bmu_ahbl_dbus_req & !req_mask[0];
assign ibus_req = bmu_ahbl_ibus_req & !req_mask[1] & !dbus_sel;

assign cpu_req = ibus_req | dbus_req;

assign dbus_sel = bmu_ahbl_dbus_req_dp & !req_mask[0];
assign ibus_sel = bmu_ahbl_ibus_req_dp & !req_mask[1] & !dbus_sel;

assign req_valid[1:0] = {ibus_req, dbus_req};

assign cpu_acc_deny     = dbus_sel       & bmu_ahbl_dbus_acc_deny 
                        | ibus_sel       & bmu_ahbl_ibus_acc_deny;

assign cpu_addr[31:0]   = {32{dbus_sel}} & bmu_ahbl_dbus_addr[31:0]
                        | {32{ibus_sel}} & bmu_ahbl_ibus_addr[31:0];

assign cpu_prot[3:0]    = {4{dbus_sel}}  & bmu_ahbl_dbus_prot[3:0]
                        | {4{ibus_sel}}  & bmu_ahbl_ibus_prot[3:0];

assign cpu_size[1:0]    = {2{dbus_sel}}  & bmu_ahbl_dbus_size[1:0]
                        | {2{ibus_sel}}  & bmu_ahbl_ibus_size[1:0];

assign cpu_write        = dbus_sel       & bmu_ahbl_dbus_write;

assign cpu_wdata[DATA_WIDTH-1:0] = bmu_ahbl_dbus_wdata[DATA_WIDTH-1:0];

assign cpu_lock         = dbus_sel & bmu_ahbl_dbus_lock & !bmu_ahbl_dbus_lrsc;
//assign cpu_amo          = cpu_lock & !bmu_ahbl_dbus_lrsc;

assign req_buf_create_en = cpu_req & cpu_grant;
//assign req_buf_pop_en    = req_buf_vld & ahblif_req_idle & clk_en; 
assign req_buf_pop_en    = clk_en & (req_buf_vld & req_data_ready | (ahblif_cur_state[2:0] == ERROR2));

always@(posedge ahbl_gated_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    req_buf_vld <= 1'b0;
  else if (req_buf_create_en)
    req_buf_vld <= 1'b1;
  else if (req_buf_pop_en)
    req_buf_vld <= 1'b0;
end

always@(posedge ahbl_gated_clk)
begin
  if (lsu_xx_warm_up)begin
    req_sel[1:0]       <= 2'b0; 
    req_buf_pmp_deny   <= 1'b0;
    req_buf_addr[31:0] <= 32'b0;
    req_buf_prot[3:0]  <= 4'b0;
    req_buf_size[1:0]  <= 2'b0;
    req_buf_write      <= 1'b0;
  end
  else if (req_buf_create_en) begin
    req_sel[1:0]       <= req_valid[1:0];
    req_buf_pmp_deny   <= cpu_acc_deny;
    req_buf_addr[31:0] <= cpu_addr[31:0];
    req_buf_prot[3:0]  <= cpu_prot[3:0];
    req_buf_size[1:0]  <= cpu_size[1:0];
    req_buf_write      <= cpu_write;
  end
end

//assign req_buf_lock_clr = req_buf_pop_en & (bus_ready | req_buf_pmp_deny) | 
//                          ahblif_req_idle[2:0]==WFG & bus_ready & clk_en;

assign req_buf_lock_clr = req_buf_pop_en & (bus_ready | req_buf_pmp_deny); 
                      

always@(posedge ahbl_gated_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    req_buf_lock       <= 1'b0;
  else if (req_buf_create_en) 
    req_buf_lock       <= cpu_lock;
  else if (req_buf_lock_clr & lock_cur_idle)
    req_buf_lock       <= 1'b0;
end

assign req_buf_wdata_create_en = req_buf_vld & bus_ready & clk_en;

always@(posedge ahbl_gated_clk)
begin
  if (lsu_xx_warm_up)
    req_buf_wdata[DATA_WIDTH-1:0]<= {DATA_WIDTH{1'b0}};
  else if (req_buf_wdata_create_en)
    req_buf_wdata[DATA_WIDTH-1:0]<= cpu_wdata[DATA_WIDTH-1:0];
end

assign req_vld = req_buf_vld & !req_buf_pmp_deny;

//==========================================================
//     interface to AHBL
//==========================================================

assign ahbl_pad_htrans[1] = req_vld & (ahblif_cur_state[2:0]==IDLE) |
                            (ahblif_cur_state[2:0]==WFG);

assign ahbl_pad_htrans[0] = 1'b0;

assign ahbl_pad_haddr[31:0] = req_buf_addr[31:0];
assign ahbl_pad_hwrite      = req_buf_write;
assign ahbl_pad_hsize[2:0]  = {1'b0, req_buf_size[1:0]};
assign ahbl_pad_hprot[3:0]  = req_buf_prot[3:0];
assign ahbl_pad_hburst[2:0] = 3'b000;
assign ahbl_pad_hlock       = req_buf_lock;
assign ahbl_pad_hwdata[DATA_WIDTH-1:0] = req_buf_wdata[DATA_WIDTH-1:0];
//input
assign bus_ready        = pad_ahbl_hready;
assign bus_resp         = pad_ahbl_hresp;
assign bus_rdata[DATA_WIDTH-1:0] = pad_ahbl_hrdata[DATA_WIDTH-1:0];

//==============================================================================
//                            interface with CPU
//==============================================================================
assign cpu_grant  = !req_buf_vld & ahblif_req_idle & clk_en & !sysio_xx_halt_req;
                     
// trans complete singal
assign trans_cmplt  = clk_en &
                           ((ahblif_cur_state[2:0]==WFD) & (bus_ready & !bus_resp | req_buf_vld & req_buf_pmp_deny)
                        | (ahblif_cur_state[2:0]==ERROR2)); //error vld
                   
// access error valid singal
assign acc_err = (ahblif_cur_state[2:0]==ERROR2) & clk_en;

//==========================================================
//           to BMU
//==========================================================
assign ahbl_bmu_ibus_grnt        = ibus_sel   & cpu_grant;
assign ahbl_bmu_ibus_trans_cmplt = req_sel[1] & trans_cmplt;
assign ahbl_bmu_ibus_acc_err     = req_sel[1] & acc_err;
assign ahbl_bmu_ibus_data[DATA_WIDTH-1:0] = bus_rdata[DATA_WIDTH-1:0];

assign ahbl_bmu_dbus_grnt        = dbus_sel   & cpu_grant;
assign ahbl_bmu_dbus_trans_cmplt = req_sel[0] & trans_cmplt;
assign ahbl_bmu_dbus_acc_err     = req_sel[0] & acc_err;
assign ahbl_bmu_dbus_data[DATA_WIDTH-1:0] = bus_rdata[DATA_WIDTH-1:0];

//==========================================================
//     BIU CLK EN
//==========================================================
assign cpu_req_gate    = bmu_ahbl_dbus_req_dp | 
                         bmu_ahbl_ibus_req_dp;
assign ahbl_clk_en     = !(ahblif_cur_state[2:0]==IDLE) | cpu_req_gate | req_buf_vld | !lock_cur_idle | lsu_xx_warm_up;
assign ahbl_sysio_idle = (ahblif_cur_state[2:0]==IDLE) & !req_buf_vld | lsu_xx_warm_up;

assign ahbl_dbginfo[10:0] = {4'b0,req_mask[1:0],lock_cur_state[1:0],ahblif_cur_state[2:0]};

//     &Force("nonport",   "req_grnt_reg"); @376
//     &Force("output",    "ahbl_bmu_ibus_grnt"); @377
//     &Force("output",    "ahbl_bmu_dbus_grnt"); @378
// //    &Force("nonport",   "dbus_ibus_hold"); @379
//     &Force("nonport",   "ibus_req_reg"); @380


// &ModuleEnd; @384
endmodule


