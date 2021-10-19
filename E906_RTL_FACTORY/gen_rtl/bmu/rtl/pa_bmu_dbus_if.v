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
module pa_bmu_dbus_if(
  bmu_clk,
  bmu_dahbl_dbus_acc_deny,
  bmu_dahbl_dbus_addr,
  bmu_dahbl_dbus_burst,
  bmu_dahbl_dbus_lock,
  bmu_dahbl_dbus_lrsc,
  bmu_dahbl_dbus_prot,
  bmu_dahbl_dbus_req,
  bmu_dahbl_dbus_req_dp,
  bmu_dahbl_dbus_seq,
  bmu_dahbl_dbus_size,
  bmu_dahbl_dbus_wdata,
  bmu_dahbl_dbus_write,
  bmu_iahbl_dbus_acc_deny,
  bmu_iahbl_dbus_addr,
  bmu_iahbl_dbus_burst,
  bmu_iahbl_dbus_lock,
  bmu_iahbl_dbus_lrsc,
  bmu_iahbl_dbus_prot,
  bmu_iahbl_dbus_req,
  bmu_iahbl_dbus_req_dp,
  bmu_iahbl_dbus_seq,
  bmu_iahbl_dbus_size,
  bmu_iahbl_dbus_wdata,
  bmu_iahbl_dbus_write,
  bmu_lsu_acc_err,
  bmu_lsu_clk_en,
  bmu_lsu_grant,
  bmu_lsu_rdata,
  bmu_lsu_trans_cmplt,
  bmu_sahbl_dbus_acc_deny,
  bmu_sahbl_dbus_addr,
  bmu_sahbl_dbus_burst,
  bmu_sahbl_dbus_lock,
  bmu_sahbl_dbus_lrsc,
  bmu_sahbl_dbus_prot,
  bmu_sahbl_dbus_req,
  bmu_sahbl_dbus_req_dp,
  bmu_sahbl_dbus_seq,
  bmu_sahbl_dbus_size,
  bmu_sahbl_dbus_wdata,
  bmu_sahbl_dbus_write,
  bmu_tcipif_dbus_acc_deny,
  bmu_tcipif_dbus_addr,
  bmu_tcipif_dbus_req,
  bmu_tcipif_dbus_req_dp,
  bmu_tcipif_dbus_size,
  bmu_tcipif_dbus_supv_mode,
  bmu_tcipif_dbus_wdata,
  bmu_tcipif_dbus_write,
  cpurst_b,
  dahbl_bmu_dbus_acc_err,
  dahbl_bmu_dbus_data,
  dahbl_bmu_dbus_grnt,
  dahbl_bmu_dbus_trans_cmplt,
  dbus_dbginfo,
  iahbl_bmu_dbus_acc_err,
  iahbl_bmu_dbus_data,
  iahbl_bmu_dbus_grnt,
  iahbl_bmu_dbus_trans_cmplt,
  lsu_bmu_acc_deny,
  lsu_bmu_addr,
  lsu_bmu_burst,
  lsu_bmu_lock,
  lsu_bmu_lrsc,
  lsu_bmu_prot,
  lsu_bmu_req,
  lsu_bmu_req_dp,
  lsu_bmu_seq,
  lsu_bmu_size,
  lsu_bmu_wdata,
  lsu_bmu_write,
  pad_bmu_dahbl_base,
  pad_bmu_dahbl_mask,
  pad_bmu_iahbl_base,
  pad_bmu_iahbl_mask,
  pad_cpu_tcip_base,
  rtu_yy_xx_async_flush,
  sahbl_bmu_dbus_acc_err,
  sahbl_bmu_dbus_data,
  sahbl_bmu_dbus_grnt,
  sahbl_bmu_dbus_trans_cmplt,
  tcipif_bmu_dbus_acc_err,
  tcipif_bmu_dbus_data,
  tcipif_bmu_dbus_grnt,
  tcipif_bmu_dbus_trans_cmplt
);

// &Ports; @22
input           bmu_clk;                    
input           cpurst_b;                   
input           dahbl_bmu_dbus_acc_err;     
input   [31:0]  dahbl_bmu_dbus_data;        
input           dahbl_bmu_dbus_grnt;        
input           dahbl_bmu_dbus_trans_cmplt; 
input           iahbl_bmu_dbus_acc_err;     
input   [31:0]  iahbl_bmu_dbus_data;        
input           iahbl_bmu_dbus_grnt;        
input           iahbl_bmu_dbus_trans_cmplt; 
input           lsu_bmu_acc_deny;           
input   [31:0]  lsu_bmu_addr;               
input   [2 :0]  lsu_bmu_burst;              
input           lsu_bmu_lock;               
input           lsu_bmu_lrsc;               
input   [3 :0]  lsu_bmu_prot;               
input           lsu_bmu_req;                
input           lsu_bmu_req_dp;             
input           lsu_bmu_seq;                
input   [1 :0]  lsu_bmu_size;               
input   [31:0]  lsu_bmu_wdata;              
input           lsu_bmu_write;              
input   [11:0]  pad_bmu_dahbl_base;         
input   [11:0]  pad_bmu_dahbl_mask;         
input   [11:0]  pad_bmu_iahbl_base;         
input   [11:0]  pad_bmu_iahbl_mask;         
input   [31:0]  pad_cpu_tcip_base;          
input           rtu_yy_xx_async_flush;      
input           sahbl_bmu_dbus_acc_err;     
input   [31:0]  sahbl_bmu_dbus_data;        
input           sahbl_bmu_dbus_grnt;        
input           sahbl_bmu_dbus_trans_cmplt; 
input           tcipif_bmu_dbus_acc_err;    
input   [31:0]  tcipif_bmu_dbus_data;       
input           tcipif_bmu_dbus_grnt;       
input           tcipif_bmu_dbus_trans_cmplt; 
output          bmu_dahbl_dbus_acc_deny;    
output  [31:0]  bmu_dahbl_dbus_addr;        
output  [2 :0]  bmu_dahbl_dbus_burst;       
output          bmu_dahbl_dbus_lock;        
output          bmu_dahbl_dbus_lrsc;        
output  [3 :0]  bmu_dahbl_dbus_prot;        
output          bmu_dahbl_dbus_req;         
output          bmu_dahbl_dbus_req_dp;      
output          bmu_dahbl_dbus_seq;         
output  [1 :0]  bmu_dahbl_dbus_size;        
output  [31:0]  bmu_dahbl_dbus_wdata;       
output          bmu_dahbl_dbus_write;       
output          bmu_iahbl_dbus_acc_deny;    
output  [31:0]  bmu_iahbl_dbus_addr;        
output  [2 :0]  bmu_iahbl_dbus_burst;       
output          bmu_iahbl_dbus_lock;        
output          bmu_iahbl_dbus_lrsc;        
output  [3 :0]  bmu_iahbl_dbus_prot;        
output          bmu_iahbl_dbus_req;         
output          bmu_iahbl_dbus_req_dp;      
output          bmu_iahbl_dbus_seq;         
output  [1 :0]  bmu_iahbl_dbus_size;        
output  [31:0]  bmu_iahbl_dbus_wdata;       
output          bmu_iahbl_dbus_write;       
output          bmu_lsu_acc_err;            
output          bmu_lsu_clk_en;             
output          bmu_lsu_grant;              
output  [31:0]  bmu_lsu_rdata;              
output          bmu_lsu_trans_cmplt;        
output          bmu_sahbl_dbus_acc_deny;    
output  [31:0]  bmu_sahbl_dbus_addr;        
output  [2 :0]  bmu_sahbl_dbus_burst;       
output          bmu_sahbl_dbus_lock;        
output          bmu_sahbl_dbus_lrsc;        
output  [3 :0]  bmu_sahbl_dbus_prot;        
output          bmu_sahbl_dbus_req;         
output          bmu_sahbl_dbus_req_dp;      
output          bmu_sahbl_dbus_seq;         
output  [1 :0]  bmu_sahbl_dbus_size;        
output  [31:0]  bmu_sahbl_dbus_wdata;       
output          bmu_sahbl_dbus_write;       
output          bmu_tcipif_dbus_acc_deny;   
output  [31:0]  bmu_tcipif_dbus_addr;       
output          bmu_tcipif_dbus_req;        
output          bmu_tcipif_dbus_req_dp;     
output  [1 :0]  bmu_tcipif_dbus_size;       
output          bmu_tcipif_dbus_supv_mode;  
output  [31:0]  bmu_tcipif_dbus_wdata;      
output          bmu_tcipif_dbus_write;      
output  [1 :0]  dbus_dbginfo;               

// &Regs; @23
reg     [1 :0]  bmu_cur_state;              
reg     [1 :0]  bmu_next_state;             
reg     [3 :0]  bus_sel_f;                  

// &Wires; @24
wire            bmu_clk;                    
wire            bmu_dahbl_dbus_acc_deny;    
wire    [31:0]  bmu_dahbl_dbus_addr;        
wire    [2 :0]  bmu_dahbl_dbus_burst;       
wire            bmu_dahbl_dbus_lock;        
wire            bmu_dahbl_dbus_lrsc;        
wire    [3 :0]  bmu_dahbl_dbus_prot;        
wire            bmu_dahbl_dbus_req;         
wire            bmu_dahbl_dbus_req_dp;      
wire            bmu_dahbl_dbus_seq;         
wire    [1 :0]  bmu_dahbl_dbus_size;        
wire    [31:0]  bmu_dahbl_dbus_wdata;       
wire            bmu_dahbl_dbus_write;       
wire            bmu_iahbl_dbus_acc_deny;    
wire    [31:0]  bmu_iahbl_dbus_addr;        
wire    [2 :0]  bmu_iahbl_dbus_burst;       
wire            bmu_iahbl_dbus_lock;        
wire            bmu_iahbl_dbus_lrsc;        
wire    [3 :0]  bmu_iahbl_dbus_prot;        
wire            bmu_iahbl_dbus_req;         
wire            bmu_iahbl_dbus_req_dp;      
wire            bmu_iahbl_dbus_seq;         
wire    [1 :0]  bmu_iahbl_dbus_size;        
wire    [31:0]  bmu_iahbl_dbus_wdata;       
wire            bmu_iahbl_dbus_write;       
wire            bmu_lsu_acc_err;            
wire            bmu_lsu_clk_en;             
wire            bmu_lsu_grant;              
wire    [31:0]  bmu_lsu_rdata;              
wire            bmu_lsu_trans_cmplt;        
wire            bmu_req_vld;                
wire            bmu_sahbl_dbus_acc_deny;    
wire    [31:0]  bmu_sahbl_dbus_addr;        
wire    [2 :0]  bmu_sahbl_dbus_burst;       
wire            bmu_sahbl_dbus_lock;        
wire            bmu_sahbl_dbus_lrsc;        
wire    [3 :0]  bmu_sahbl_dbus_prot;        
wire            bmu_sahbl_dbus_req;         
wire            bmu_sahbl_dbus_req_dp;      
wire            bmu_sahbl_dbus_seq;         
wire    [1 :0]  bmu_sahbl_dbus_size;        
wire    [31:0]  bmu_sahbl_dbus_wdata;       
wire            bmu_sahbl_dbus_write;       
wire            bmu_tcipif_dbus_acc_deny;   
wire    [31:0]  bmu_tcipif_dbus_addr;       
wire            bmu_tcipif_dbus_req;        
wire            bmu_tcipif_dbus_req_dp;     
wire    [1 :0]  bmu_tcipif_dbus_size;       
wire            bmu_tcipif_dbus_supv_mode;  
wire    [31:0]  bmu_tcipif_dbus_wdata;      
wire            bmu_tcipif_dbus_write;      
wire    [3 :0]  bus_sel;                    
wire            bus_sel_same;               
wire            cpurst_b;                   
wire            dahbl_bmu_dbus_acc_err;     
wire    [31:0]  dahbl_bmu_dbus_data;        
wire            dahbl_bmu_dbus_grnt;        
wire            dahbl_bmu_dbus_trans_cmplt; 
wire            dahbl_hit;                  
wire            dahbl_sel_pred;             
wire            dbus_acc_err;               
wire            dbus_cmplt;                 
wire    [1 :0]  dbus_dbginfo;               
wire            dbus_grant;                 
wire            iahbl_bmu_dbus_acc_err;     
wire    [31:0]  iahbl_bmu_dbus_data;        
wire            iahbl_bmu_dbus_grnt;        
wire            iahbl_bmu_dbus_trans_cmplt; 
wire            iahbl_hit;                  
wire            iahbl_sel_pred;             
wire            lsu_bmu_acc_deny;           
wire    [31:0]  lsu_bmu_addr;               
wire    [2 :0]  lsu_bmu_burst;              
wire            lsu_bmu_lock;               
wire            lsu_bmu_lrsc;               
wire    [3 :0]  lsu_bmu_prot;               
wire            lsu_bmu_req;                
wire            lsu_bmu_req_dp;             
wire            lsu_bmu_seq;                
wire    [1 :0]  lsu_bmu_size;               
wire    [31:0]  lsu_bmu_wdata;              
wire            lsu_bmu_write;              
wire            new_req_en;                 
wire    [11:0]  pad_bmu_dahbl_base;         
wire    [11:0]  pad_bmu_dahbl_mask;         
wire    [11:0]  pad_bmu_iahbl_base;         
wire    [11:0]  pad_bmu_iahbl_mask;         
wire    [31:0]  pad_cpu_tcip_base;          
wire            req_en;                     
wire            rtu_yy_xx_async_flush;      
wire            sahbl_bmu_dbus_acc_err;     
wire    [31:0]  sahbl_bmu_dbus_data;        
wire            sahbl_bmu_dbus_grnt;        
wire            sahbl_bmu_dbus_trans_cmplt; 
wire            sahbl_hit;                  
wire            sahbl_sel_pred;             
wire            tcip_sel_pred;              
wire    [15:0]  tcipif_addr_low;            
wire            tcipif_bmu_dbus_acc_err;    
wire    [31:0]  tcipif_bmu_dbus_data;       
wire            tcipif_bmu_dbus_grnt;       
wire            tcipif_bmu_dbus_trans_cmplt; 
wire            tcipif_hit;                 


//==========================================================
//     request direction checking
//==========================================================
assign iahbl_hit = ((lsu_bmu_addr[31:20] & pad_bmu_iahbl_mask[11:0]) == pad_bmu_iahbl_base[11:0]) 
                 & ~tcipif_hit & ~dahbl_hit;

assign dahbl_hit = ((lsu_bmu_addr[31:20] & pad_bmu_dahbl_mask[11:0]) == pad_bmu_dahbl_base[11:0])
                 & ~tcipif_hit;

// &Force("input", "pad_cpu_tcip_base"); @44
// &Force("bus","pad_cpu_tcip_base",31,0); @45
assign tcipif_hit = (lsu_bmu_addr[31:28] == pad_cpu_tcip_base[31:28]);

assign sahbl_hit = ~dahbl_hit & ~iahbl_hit & ~tcipif_hit;

assign bus_sel[3:0] = {sahbl_hit,tcipif_hit,iahbl_hit,dahbl_hit};

//==========================================================
//      FSM
//==========================================================
parameter REQ  = 2'b00;
parameter WFG  = 2'b11;
parameter WFD  = 2'b01;

always @(posedge bmu_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bmu_cur_state[1:0] <= REQ;
  else if (rtu_yy_xx_async_flush)
    bmu_cur_state[1:0] <= REQ;
  else
    bmu_cur_state[1:0] <= bmu_next_state[1:0];
end

assign bmu_req_vld = lsu_bmu_req;

// &CombBeg; @74
always @( dbus_grant
       or dbus_cmplt
       or dbus_acc_err
       or bmu_cur_state[1:0]
       or bus_sel_same
       or bmu_req_vld)
begin
  case(bmu_cur_state[1:0])
    REQ: begin
      if (bmu_req_vld)
        bmu_next_state[1:0] = dbus_grant ? WFD : WFG;
      else
        bmu_next_state[1:0] = REQ;
    end
    WFG:begin
      if (dbus_grant)
        bmu_next_state[1:0] = WFD;
      else
        bmu_next_state[1:0] = WFG;
    end
    WFD: begin
      if (dbus_cmplt)begin
        if (bmu_req_vld & bus_sel_same & !dbus_acc_err)
          bmu_next_state[1:0] = dbus_grant ? WFD : WFG;
        else
          bmu_next_state[1:0] = REQ;
      end
      else
        bmu_next_state[1:0] = WFD;
    end
    default: bmu_next_state[1:0] = REQ;
  endcase
// &CombEnd; @100
end

assign req_en = (bmu_cur_state[1:0] == REQ) | 
                (bmu_cur_state[1:0] == WFG) |
                (bmu_cur_state[1:0] == WFD) & bus_sel_same; 

assign new_req_en = (bmu_cur_state[1:0] == REQ);

always @(posedge bmu_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bus_sel_f[3:0] <= 4'b0;
  else if (bmu_req_vld & new_req_en)
    bus_sel_f[3:0] <= bus_sel[3:0];
end

assign bus_sel_same = (bus_sel_f[3:0] == bus_sel[3:0]);

assign sahbl_sel_pred = bus_sel_f[3];
assign dahbl_sel_pred = bus_sel_f[0];
assign iahbl_sel_pred = bus_sel_f[1];
assign tcip_sel_pred  = bus_sel_f[2];

//==========================================================
//   interface
//==========================================================
//input 
assign dbus_grant   = dahbl_hit & dahbl_bmu_dbus_grnt  |
                      iahbl_hit & iahbl_bmu_dbus_grnt  |
                      tcipif_hit & tcipif_bmu_dbus_grnt |
                      sahbl_hit & sahbl_bmu_dbus_grnt;
assign dbus_cmplt   = dahbl_bmu_dbus_trans_cmplt  |
                      iahbl_bmu_dbus_trans_cmplt  |
                      tcipif_bmu_dbus_trans_cmplt |
                      sahbl_bmu_dbus_trans_cmplt;
assign dbus_acc_err = dahbl_bmu_dbus_acc_err  |
                      iahbl_bmu_dbus_acc_err  |
                      tcipif_bmu_dbus_acc_err |
                      sahbl_bmu_dbus_acc_err;

assign bmu_lsu_grant       = dbus_grant & req_en;
assign bmu_lsu_trans_cmplt = dbus_cmplt;
assign bmu_lsu_acc_err     = dbus_acc_err;
assign bmu_lsu_rdata[31:0] = ({32{bus_sel_f[0]}} & dahbl_bmu_dbus_data[31:0])  |
                             ({32{bus_sel_f[1]}} & iahbl_bmu_dbus_data[31:0])  |
                             ({32{bus_sel_f[2]}} & tcipif_bmu_dbus_data[31:0]) |
                             ({32{bus_sel_f[3]}} & sahbl_bmu_dbus_data[31:0]);

//--------------------------------------
//output
//--------------------------------------
//iahbl
assign bmu_iahbl_dbus_req         = lsu_bmu_req & req_en & iahbl_hit & iahbl_sel_pred;
assign bmu_iahbl_dbus_req_dp      = lsu_bmu_req_dp & iahbl_sel_pred;
assign bmu_iahbl_dbus_addr[31:0]  = lsu_bmu_addr[31:0];
assign bmu_iahbl_dbus_acc_deny    = lsu_bmu_acc_deny;
assign bmu_iahbl_dbus_write       = lsu_bmu_write;
assign bmu_iahbl_dbus_size[1:0]   = lsu_bmu_size[1:0];
assign bmu_iahbl_dbus_prot[3:0]   = lsu_bmu_prot[3:0]; 
assign bmu_iahbl_dbus_wdata[31:0] = lsu_bmu_wdata[31:0];
assign bmu_iahbl_dbus_lock        = lsu_bmu_lock;
assign bmu_iahbl_dbus_lrsc        = lsu_bmu_lrsc;
assign bmu_iahbl_dbus_seq         = lsu_bmu_seq;
assign bmu_iahbl_dbus_burst[2:0]  = lsu_bmu_burst[2:0];

//dahbl
assign bmu_dahbl_dbus_req         = lsu_bmu_req & req_en & dahbl_hit & dahbl_sel_pred;
assign bmu_dahbl_dbus_req_dp      = lsu_bmu_req_dp & dahbl_sel_pred;
assign bmu_dahbl_dbus_addr[31:0]  = lsu_bmu_addr[31:0];
assign bmu_dahbl_dbus_acc_deny    = lsu_bmu_acc_deny;
assign bmu_dahbl_dbus_write       = lsu_bmu_write;
assign bmu_dahbl_dbus_size[1:0]   = lsu_bmu_size[1:0];
assign bmu_dahbl_dbus_prot[3:0]   = lsu_bmu_prot[3:0]; 
assign bmu_dahbl_dbus_wdata[31:0] = lsu_bmu_wdata[31:0];
assign bmu_dahbl_dbus_lock        = lsu_bmu_lock;
assign bmu_dahbl_dbus_lrsc        = lsu_bmu_lrsc;
assign bmu_dahbl_dbus_seq         = lsu_bmu_seq;
assign bmu_dahbl_dbus_burst[2:0]  = lsu_bmu_burst[2:0];

//tcipif
assign bmu_tcipif_dbus_req         = lsu_bmu_req & req_en & tcipif_hit & tcip_sel_pred;
assign bmu_tcipif_dbus_req_dp      = lsu_bmu_req_dp & tcip_sel_pred;
assign bmu_tcipif_dbus_acc_deny    = lsu_bmu_acc_deny;
assign bmu_tcipif_dbus_write       = lsu_bmu_write;
assign bmu_tcipif_dbus_size[1:0]   = lsu_bmu_size[1:0];
assign bmu_tcipif_dbus_supv_mode   = lsu_bmu_prot[1];
assign bmu_tcipif_dbus_wdata[31:0] = lsu_bmu_wdata[31:0];
assign bmu_tcipif_dbus_addr[31:0]  = {lsu_bmu_addr[31:16], tcipif_addr_low[15:0]};
assign tcipif_addr_low[15:0]       = {16{tcipif_hit}} & lsu_bmu_addr[15:0];

//sahbl
assign bmu_sahbl_dbus_req         = lsu_bmu_req & req_en & sahbl_hit & sahbl_sel_pred;
assign bmu_sahbl_dbus_req_dp      = lsu_bmu_req_dp & sahbl_sel_pred;
assign bmu_sahbl_dbus_addr[31:0]  = lsu_bmu_addr[31:0];
assign bmu_sahbl_dbus_acc_deny    = lsu_bmu_acc_deny;
assign bmu_sahbl_dbus_write       = lsu_bmu_write;
assign bmu_sahbl_dbus_size[1:0]   = lsu_bmu_size[1:0];
assign bmu_sahbl_dbus_prot[3:0]   = lsu_bmu_prot[3:0]; 
assign bmu_sahbl_dbus_wdata[31:0] = lsu_bmu_wdata[31:0];
assign bmu_sahbl_dbus_lock        = lsu_bmu_lock;
assign bmu_sahbl_dbus_lrsc        = lsu_bmu_lrsc;
assign bmu_sahbl_dbus_seq         = lsu_bmu_seq;
assign bmu_sahbl_dbus_burst[2:0]  = lsu_bmu_burst[2:0];

assign bmu_lsu_clk_en = lsu_bmu_req_dp |
                       ~(bmu_cur_state[1:0] == REQ);

assign dbus_dbginfo[1:0] = bmu_cur_state[1:0];

// &ModuleEnd; @237
endmodule



