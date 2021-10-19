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
module pa_bmu_bus_if(
  bmu_clk,
  bmu_dahbl_xx_acc_deny,
  bmu_dahbl_xx_addr,
  bmu_dahbl_xx_burst,
  bmu_dahbl_xx_prot,
  bmu_dahbl_xx_req,
  bmu_dahbl_xx_req_dp,
  bmu_dahbl_xx_seq,
  bmu_dahbl_xx_size,
  bmu_dahbl_xx_wdata,
  bmu_dahbl_xx_write,
  bmu_iahbl_xx_acc_deny,
  bmu_iahbl_xx_addr,
  bmu_iahbl_xx_burst,
  bmu_iahbl_xx_prot,
  bmu_iahbl_xx_req,
  bmu_iahbl_xx_req_dp,
  bmu_iahbl_xx_seq,
  bmu_iahbl_xx_size,
  bmu_iahbl_xx_wdata,
  bmu_iahbl_xx_write,
  bmu_sahbl_xx_acc_deny,
  bmu_sahbl_xx_addr,
  bmu_sahbl_xx_burst,
  bmu_sahbl_xx_prot,
  bmu_sahbl_xx_req,
  bmu_sahbl_xx_req_dp,
  bmu_sahbl_xx_seq,
  bmu_sahbl_xx_size,
  bmu_sahbl_xx_wdata,
  bmu_sahbl_xx_write,
  bmu_tcipif_xx_acc_deny,
  bmu_tcipif_xx_addr,
  bmu_tcipif_xx_req,
  bmu_tcipif_xx_req_dp,
  bmu_tcipif_xx_size,
  bmu_tcipif_xx_supv_mode,
  bmu_tcipif_xx_wdata,
  bmu_tcipif_xx_write,
  bmu_tt_acc_err,
  bmu_tt_clk_en,
  bmu_tt_grant,
  bmu_tt_rdata,
  bmu_tt_trans_cmplt,
  cpurst_b,
  dahbl_bmu_xx_acc_err,
  dahbl_bmu_xx_data,
  dahbl_bmu_xx_grnt,
  dahbl_bmu_xx_trans_cmplt,
  iahbl_bmu_xx_acc_err,
  iahbl_bmu_xx_data,
  iahbl_bmu_xx_grnt,
  iahbl_bmu_xx_trans_cmplt,
  pad_bmu_dahbl_base,
  pad_bmu_dahbl_mask,
  pad_bmu_iahbl_base,
  pad_bmu_iahbl_mask,
  pad_cpu_tcip_base,
  sahbl_bmu_xx_acc_err,
  sahbl_bmu_xx_data,
  sahbl_bmu_xx_grnt,
  sahbl_bmu_xx_trans_cmplt,
  tcipif_bmu_xx_acc_err,
  tcipif_bmu_xx_data,
  tcipif_bmu_xx_grnt,
  tcipif_bmu_xx_trans_cmplt,
  tt_bmu_acc_deny,
  tt_bmu_addr,
  tt_bmu_burst,
  tt_bmu_data_req,
  tt_bmu_prot,
  tt_bmu_req,
  tt_bmu_seq,
  tt_bmu_size,
  tt_bmu_wdata,
  tt_bmu_write,
  xx_dbginfo
);

// &Ports; @25
input           bmu_clk;                  
input           cpurst_b;                 
input           dahbl_bmu_xx_acc_err;     
input   [31:0]  dahbl_bmu_xx_data;        
input           dahbl_bmu_xx_grnt;        
input           dahbl_bmu_xx_trans_cmplt; 
input           iahbl_bmu_xx_acc_err;     
input   [31:0]  iahbl_bmu_xx_data;        
input           iahbl_bmu_xx_grnt;        
input           iahbl_bmu_xx_trans_cmplt; 
input   [11:0]  pad_bmu_dahbl_base;       
input   [11:0]  pad_bmu_dahbl_mask;       
input   [11:0]  pad_bmu_iahbl_base;       
input   [11:0]  pad_bmu_iahbl_mask;       
input   [31:0]  pad_cpu_tcip_base;        
input           sahbl_bmu_xx_acc_err;     
input   [31:0]  sahbl_bmu_xx_data;        
input           sahbl_bmu_xx_grnt;        
input           sahbl_bmu_xx_trans_cmplt; 
input           tcipif_bmu_xx_acc_err;    
input   [31:0]  tcipif_bmu_xx_data;       
input           tcipif_bmu_xx_grnt;       
input           tcipif_bmu_xx_trans_cmplt; 
input           tt_bmu_acc_deny;          
input   [31:0]  tt_bmu_addr;              
input   [2 :0]  tt_bmu_burst;             
input           tt_bmu_data_req;          
input   [3 :0]  tt_bmu_prot;              
input           tt_bmu_req;               
input           tt_bmu_seq;               
input   [1 :0]  tt_bmu_size;              
input   [31:0]  tt_bmu_wdata;             
input           tt_bmu_write;             
output          bmu_dahbl_xx_acc_deny;    
output  [31:0]  bmu_dahbl_xx_addr;        
output  [2 :0]  bmu_dahbl_xx_burst;       
output  [3 :0]  bmu_dahbl_xx_prot;        
output          bmu_dahbl_xx_req;         
output          bmu_dahbl_xx_req_dp;      
output          bmu_dahbl_xx_seq;         
output  [1 :0]  bmu_dahbl_xx_size;        
output  [31:0]  bmu_dahbl_xx_wdata;       
output          bmu_dahbl_xx_write;       
output          bmu_iahbl_xx_acc_deny;    
output  [31:0]  bmu_iahbl_xx_addr;        
output  [2 :0]  bmu_iahbl_xx_burst;       
output  [3 :0]  bmu_iahbl_xx_prot;        
output          bmu_iahbl_xx_req;         
output          bmu_iahbl_xx_req_dp;      
output          bmu_iahbl_xx_seq;         
output  [1 :0]  bmu_iahbl_xx_size;        
output  [31:0]  bmu_iahbl_xx_wdata;       
output          bmu_iahbl_xx_write;       
output          bmu_sahbl_xx_acc_deny;    
output  [31:0]  bmu_sahbl_xx_addr;        
output  [2 :0]  bmu_sahbl_xx_burst;       
output  [3 :0]  bmu_sahbl_xx_prot;        
output          bmu_sahbl_xx_req;         
output          bmu_sahbl_xx_req_dp;      
output          bmu_sahbl_xx_seq;         
output  [1 :0]  bmu_sahbl_xx_size;        
output  [31:0]  bmu_sahbl_xx_wdata;       
output          bmu_sahbl_xx_write;       
output          bmu_tcipif_xx_acc_deny;   
output  [31:0]  bmu_tcipif_xx_addr;       
output          bmu_tcipif_xx_req;        
output          bmu_tcipif_xx_req_dp;     
output  [1 :0]  bmu_tcipif_xx_size;       
output          bmu_tcipif_xx_supv_mode;  
output  [31:0]  bmu_tcipif_xx_wdata;      
output          bmu_tcipif_xx_write;      
output          bmu_tt_acc_err;           
output          bmu_tt_clk_en;            
output          bmu_tt_grant;             
output  [31:0]  bmu_tt_rdata;             
output          bmu_tt_trans_cmplt;       
output  [1 :0]  xx_dbginfo;               

// &Regs; @26
reg     [1 :0]  bmu_cur_state;            
reg     [1 :0]  bmu_next_state;           
reg     [3 :0]  bus_sel_f;                

// &Wires; @27
wire            bmu_clk;                  
wire            bmu_dahbl_xx_acc_deny;    
wire    [31:0]  bmu_dahbl_xx_addr;        
wire    [2 :0]  bmu_dahbl_xx_burst;       
wire    [3 :0]  bmu_dahbl_xx_prot;        
wire            bmu_dahbl_xx_req;         
wire            bmu_dahbl_xx_req_dp;      
wire            bmu_dahbl_xx_seq;         
wire    [1 :0]  bmu_dahbl_xx_size;        
wire    [31:0]  bmu_dahbl_xx_wdata;       
wire            bmu_dahbl_xx_write;       
wire            bmu_iahbl_xx_acc_deny;    
wire    [31:0]  bmu_iahbl_xx_addr;        
wire    [2 :0]  bmu_iahbl_xx_burst;       
wire    [3 :0]  bmu_iahbl_xx_prot;        
wire            bmu_iahbl_xx_req;         
wire            bmu_iahbl_xx_req_dp;      
wire            bmu_iahbl_xx_seq;         
wire    [1 :0]  bmu_iahbl_xx_size;        
wire    [31:0]  bmu_iahbl_xx_wdata;       
wire            bmu_iahbl_xx_write;       
wire            bmu_sahbl_xx_acc_deny;    
wire    [31:0]  bmu_sahbl_xx_addr;        
wire    [2 :0]  bmu_sahbl_xx_burst;       
wire    [3 :0]  bmu_sahbl_xx_prot;        
wire            bmu_sahbl_xx_req;         
wire            bmu_sahbl_xx_req_dp;      
wire            bmu_sahbl_xx_seq;         
wire    [1 :0]  bmu_sahbl_xx_size;        
wire    [31:0]  bmu_sahbl_xx_wdata;       
wire            bmu_sahbl_xx_write;       
wire            bmu_tcipif_xx_acc_deny;   
wire    [31:0]  bmu_tcipif_xx_addr;       
wire            bmu_tcipif_xx_req;        
wire            bmu_tcipif_xx_req_dp;     
wire    [1 :0]  bmu_tcipif_xx_size;       
wire            bmu_tcipif_xx_supv_mode;  
wire    [31:0]  bmu_tcipif_xx_wdata;      
wire            bmu_tcipif_xx_write;      
wire            bmu_tt_acc_err;           
wire            bmu_tt_clk_en;            
wire            bmu_tt_grant;             
wire    [31:0]  bmu_tt_rdata;             
wire            bmu_tt_trans_cmplt;       
wire            bus_acc_err;              
wire            bus_cmplt;                
wire            bus_grant;                
wire    [3 :0]  bus_sel;                  
wire            bus_sel_same;             
wire            cpurst_b;                 
wire            dahbl_bmu_xx_acc_err;     
wire    [31:0]  dahbl_bmu_xx_data;        
wire            dahbl_bmu_xx_grnt;        
wire            dahbl_bmu_xx_trans_cmplt; 
wire            dahbl_hit;                
wire            dahbl_sel_pred;           
wire            iahbl_bmu_xx_acc_err;     
wire    [31:0]  iahbl_bmu_xx_data;        
wire            iahbl_bmu_xx_grnt;        
wire            iahbl_bmu_xx_trans_cmplt; 
wire            iahbl_hit;                
wire            iahbl_sel_pred;           
wire            new_req_en;               
wire    [11:0]  pad_bmu_dahbl_base;       
wire    [11:0]  pad_bmu_dahbl_mask;       
wire    [11:0]  pad_bmu_iahbl_base;       
wire    [11:0]  pad_bmu_iahbl_mask;       
wire    [31:0]  pad_cpu_tcip_base;        
wire            req_en;                   
wire            sahbl_bmu_xx_acc_err;     
wire    [31:0]  sahbl_bmu_xx_data;        
wire            sahbl_bmu_xx_grnt;        
wire            sahbl_bmu_xx_trans_cmplt; 
wire            sahbl_hit;                
wire            sahbl_sel_pred;           
wire            tcip_sel_pred;            
wire    [15:0]  tcipif_addr_low;          
wire            tcipif_bmu_xx_acc_err;    
wire    [31:0]  tcipif_bmu_xx_data;       
wire            tcipif_bmu_xx_grnt;       
wire            tcipif_bmu_xx_trans_cmplt; 
wire            tcipif_hit;               
wire            tt_bmu_acc_deny;          
wire    [31:0]  tt_bmu_addr;              
wire    [2 :0]  tt_bmu_burst;             
wire            tt_bmu_data_req;          
wire    [3 :0]  tt_bmu_prot;              
wire            tt_bmu_req;               
wire            tt_bmu_seq;               
wire    [1 :0]  tt_bmu_size;              
wire    [31:0]  tt_bmu_wdata;             
wire            tt_bmu_write;             
wire    [1 :0]  xx_dbginfo;               


//==========================================================
//      compare base address with ahbl base addr
//==========================================================
assign iahbl_hit = ((tt_bmu_addr[31:20] & pad_bmu_iahbl_mask[11:0]) == pad_bmu_iahbl_base[11:0])
                 & ~tcipif_hit & ~dahbl_hit;

assign dahbl_hit = ((tt_bmu_addr[31:20] & pad_bmu_dahbl_mask[11:0]) == pad_bmu_dahbl_base[11:0])
                 & ~tcipif_hit;

// &Force("input", "pad_cpu_tcip_base"); @47
// &Force("bus","pad_cpu_tcip_base",31,0); @48
// &Force("bus","tt_bmu_addr",31,0); @49
assign tcipif_hit = (tt_bmu_addr[31:28] == pad_cpu_tcip_base[31:28]);

assign sahbl_hit = ~dahbl_hit & ~iahbl_hit & ~tcipif_hit;

assign bus_sel[3:0] = {sahbl_hit,tcipif_hit,iahbl_hit,dahbl_hit};

//==========================================================
//      FSM
//==========================================================
parameter REQ = 2'b00;
parameter WFG = 2'b01;
parameter WFD = 2'b10;

always @(posedge bmu_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bmu_cur_state[1:0] <= REQ;
  else
    bmu_cur_state[1:0] <= bmu_next_state[1:0];
end
// &CombBeg; @73
always @( bus_grant
       or bus_cmplt
       or bus_acc_err
       or bmu_cur_state[1:0]
       or bus_sel_same
       or tt_bmu_req)
begin
  case(bmu_cur_state[1:0])
    REQ: begin
      if (tt_bmu_req)
        bmu_next_state[1:0] = bus_grant ? WFD : WFG;
      else
        bmu_next_state[1:0] = REQ;
    end
    WFG:begin
      if (bus_grant)
        bmu_next_state[1:0] = WFD;
      else
        bmu_next_state[1:0] = WFG;
    end
    WFD: begin
      if (bus_cmplt)begin
        if (tt_bmu_req & bus_sel_same & !bus_acc_err)
          bmu_next_state[1:0] = bus_grant ? WFD : WFG;
        else
          bmu_next_state[1:0] = REQ;
      end
      else
        bmu_next_state[1:0] = WFD;
    end
    default: bmu_next_state[1:0] = REQ;
  endcase
// &CombEnd; @99
end

assign req_en = (bmu_cur_state[1:0] == REQ) |
                (bmu_cur_state[1:0] == WFG) |
                (bmu_cur_state[1:0] == WFD) & bus_sel_same;

assign new_req_en = (bmu_cur_state[1:0] == REQ);

always @(posedge bmu_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bus_sel_f[3:0] <= 4'b0;
  else if (tt_bmu_req & new_req_en)
    bus_sel_f[3:0] <= bus_sel[3:0];
end
assign bus_sel_same = (bus_sel_f[3:0] == bus_sel[3:0]);

assign sahbl_sel_pred = bus_sel_f[3];
assign dahbl_sel_pred = bus_sel_f[0];
assign iahbl_sel_pred = bus_sel_f[1];
assign tcip_sel_pred  = bus_sel_f[2];
//==========================================================
//                interface
//==========================================================
//input
assign bus_grant   = iahbl_hit & iahbl_bmu_xx_grnt  |
                     dahbl_hit & dahbl_bmu_xx_grnt  |
                     tcipif_hit & tcipif_bmu_xx_grnt |
                     sahbl_hit & sahbl_bmu_xx_grnt;
assign bus_cmplt   = iahbl_bmu_xx_trans_cmplt  |
                     dahbl_bmu_xx_trans_cmplt  |
                     tcipif_bmu_xx_trans_cmplt |
                     sahbl_bmu_xx_trans_cmplt;
assign bus_acc_err = iahbl_bmu_xx_acc_err |
                     dahbl_bmu_xx_acc_err |
                     tcipif_bmu_xx_acc_err|
                     sahbl_bmu_xx_acc_err;

assign bmu_tt_grant       = bus_grant & req_en;
assign bmu_tt_trans_cmplt = bus_cmplt;
assign bmu_tt_acc_err     = bus_acc_err;
assign bmu_tt_rdata[31:0] = ({32{bus_sel_f[0]}} & dahbl_bmu_xx_data[31:0])  |
                            ({32{bus_sel_f[1]}} & iahbl_bmu_xx_data[31:0])  |
                            ({32{bus_sel_f[2]}} & tcipif_bmu_xx_data[31:0]) |
                            ({32{bus_sel_f[3]}} & sahbl_bmu_xx_data[31:0]);

//--------------------------------------
//output
//--------------------------------------
//interface to ILITE
assign bmu_iahbl_xx_req         = tt_bmu_req & iahbl_hit & req_en & iahbl_sel_pred;
assign bmu_iahbl_xx_req_dp      = tt_bmu_data_req & iahbl_sel_pred;
assign bmu_iahbl_xx_acc_deny    = tt_bmu_acc_deny;
assign bmu_iahbl_xx_size[1:0]   = tt_bmu_size[1:0];
assign bmu_iahbl_xx_addr[31:0]  = tt_bmu_addr[31:0];
assign bmu_iahbl_xx_prot[3:0]   = tt_bmu_prot[3:0]; 
assign bmu_iahbl_xx_write       = tt_bmu_write;
assign bmu_iahbl_xx_wdata[31:0] = tt_bmu_wdata[31:0];
assign bmu_iahbl_xx_seq         = tt_bmu_seq;
assign bmu_iahbl_xx_burst[2:0]  = tt_bmu_burst[2:0];

//interface to DL
assign bmu_dahbl_xx_req         = tt_bmu_req & dahbl_hit & req_en & dahbl_sel_pred;
assign bmu_dahbl_xx_req_dp      = tt_bmu_data_req & dahbl_sel_pred;
assign bmu_dahbl_xx_acc_deny    = tt_bmu_acc_deny;
assign bmu_dahbl_xx_size[1:0]   = tt_bmu_size[1:0];
assign bmu_dahbl_xx_addr[31:0]  = tt_bmu_addr[31:0];
assign bmu_dahbl_xx_prot[3:0]   = tt_bmu_prot[3:0]; 
assign bmu_dahbl_xx_write       = tt_bmu_write;
assign bmu_dahbl_xx_wdata[31:0] = tt_bmu_wdata[31:0];
assign bmu_dahbl_xx_seq         = tt_bmu_seq;
assign bmu_dahbl_xx_burst[2:0]  = tt_bmu_burst[2:0];

//tcipif
assign bmu_tcipif_xx_req         = tt_bmu_req & req_en & tcipif_hit & tcip_sel_pred;
assign bmu_tcipif_xx_req_dp      = tt_bmu_data_req & tcip_sel_pred;
assign bmu_tcipif_xx_acc_deny    = tt_bmu_acc_deny;
assign bmu_tcipif_xx_write       = tt_bmu_write;
assign bmu_tcipif_xx_size[1:0]   = tt_bmu_size[1:0];
assign bmu_tcipif_xx_supv_mode   = tt_bmu_prot[1];
assign bmu_tcipif_xx_wdata[31:0] = tt_bmu_wdata[31:0];
assign bmu_tcipif_xx_addr[31:0]  = {tt_bmu_addr[31:16], tcipif_addr_low[15:0]};
assign tcipif_addr_low[15:0]       = {16{tcipif_hit}} & tt_bmu_addr[15:0];

//sahbl
assign bmu_sahbl_xx_req         = tt_bmu_req & sahbl_hit & req_en & sahbl_sel_pred;
assign bmu_sahbl_xx_req_dp      = tt_bmu_data_req & sahbl_sel_pred;
assign bmu_sahbl_xx_acc_deny    = tt_bmu_acc_deny;
assign bmu_sahbl_xx_size[1:0]   = tt_bmu_size[1:0];
assign bmu_sahbl_xx_addr[31:0]  = tt_bmu_addr[31:0];
assign bmu_sahbl_xx_prot[3:0]   = tt_bmu_prot[3:0]; 
assign bmu_sahbl_xx_write       = tt_bmu_write;
assign bmu_sahbl_xx_wdata[31:0] = tt_bmu_wdata[31:0];
assign bmu_sahbl_xx_seq         = tt_bmu_seq;
assign bmu_sahbl_xx_burst[2:0]  = tt_bmu_burst[2:0];

assign bmu_tt_clk_en = tt_bmu_data_req | ~(bmu_cur_state[1:0] == REQ);

assign xx_dbginfo[1:0] = bmu_cur_state[1:0];

// &ModuleEnd; @227
endmodule



