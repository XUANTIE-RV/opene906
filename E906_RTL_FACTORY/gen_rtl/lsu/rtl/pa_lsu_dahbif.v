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

// &Depend("cpu_cfig.h"); @18

// &ModuleBeg; @20
module pa_lsu_dahbif(
  bmu_lsu_acc_err,
  bmu_lsu_grant,
  bmu_lsu_rdata,
  bmu_lsu_trans_cmplt,
  cp0_lsu_icg_en,
  cpurst_b,
  dahbif_dbginfo,
  dahbif_lfb_acc_err,
  dahbif_lfb_cmplt,
  dahbif_lfb_data,
  dahbif_lfb_grant,
  dahbif_ncb_acc_err,
  dahbif_ncb_cmplt,
  dahbif_ncb_data,
  dahbif_ncb_grant,
  dahbif_ncb_grant_2,
  dahbif_stb_acc_ecc,
  dahbif_stb_cmplt,
  dahbif_stb_grant,
  dahbif_stb_grant_2,
  dahbif_vb_acc_ecc,
  dahbif_vb_cmplt,
  dahbif_vb_grant,
  forever_cpuclk,
  lfb_dahbif_addr,
  lfb_dahbif_burst,
  lfb_dahbif_lock,
  lfb_dahbif_lr_inst,
  lfb_dahbif_prot,
  lfb_dahbif_req,
  lfb_dahbif_size,
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
  ncb_dahbif_acc_deny,
  ncb_dahbif_lock,
  ncb_dahbif_lrsc,
  ncb_dahbif_ncb_wb_addr,
  ncb_dahbif_ncb_wb_sel,
  ncb_dahbif_prot,
  ncb_dahbif_req,
  ncb_dahbif_req_dp,
  ncb_dahbif_size,
  ncb_dahbif_uc_ld_addr,
  ncb_dahbif_wdata,
  ncb_dahbif_write,
  pad_yy_icg_scan_en,
  rtu_yy_xx_async_flush,
  stb_dahbif_addr,
  stb_dahbif_data,
  stb_dahbif_lock,
  stb_dahbif_prot,
  stb_dahbif_req,
  stb_dahbif_sc_inst,
  stb_dahbif_size,
  vb_dahbif_addr,
  vb_dahbif_data,
  vb_dahbif_prot,
  vb_dahbif_req
);

// &Ports; @21
input           bmu_lsu_acc_err;       
input           bmu_lsu_grant;         
input   [31:0]  bmu_lsu_rdata;         
input           bmu_lsu_trans_cmplt;   
input           cp0_lsu_icg_en;        
input           cpurst_b;              
input           forever_cpuclk;        
input   [31:0]  lfb_dahbif_addr;       
input   [2 :0]  lfb_dahbif_burst;      
input           lfb_dahbif_lock;       
input           lfb_dahbif_lr_inst;    
input   [3 :0]  lfb_dahbif_prot;       
input           lfb_dahbif_req;        
input   [1 :0]  lfb_dahbif_size;       
input           ncb_dahbif_acc_deny;   
input           ncb_dahbif_lock;       
input           ncb_dahbif_lrsc;       
input   [31:0]  ncb_dahbif_ncb_wb_addr; 
input           ncb_dahbif_ncb_wb_sel; 
input   [3 :0]  ncb_dahbif_prot;       
input           ncb_dahbif_req;        
input           ncb_dahbif_req_dp;     
input   [1 :0]  ncb_dahbif_size;       
input   [31:0]  ncb_dahbif_uc_ld_addr; 
input   [31:0]  ncb_dahbif_wdata;      
input           ncb_dahbif_write;      
input           pad_yy_icg_scan_en;    
input           rtu_yy_xx_async_flush; 
input   [31:0]  stb_dahbif_addr;       
input   [31:0]  stb_dahbif_data;       
input           stb_dahbif_lock;       
input   [3 :0]  stb_dahbif_prot;       
input           stb_dahbif_req;        
input           stb_dahbif_sc_inst;    
input   [1 :0]  stb_dahbif_size;       
input   [31:0]  vb_dahbif_addr;        
input   [31:0]  vb_dahbif_data;        
input   [3 :0]  vb_dahbif_prot;        
input           vb_dahbif_req;         
output  [4 :0]  dahbif_dbginfo;        
output          dahbif_lfb_acc_err;    
output          dahbif_lfb_cmplt;      
output  [31:0]  dahbif_lfb_data;       
output          dahbif_lfb_grant;      
output          dahbif_ncb_acc_err;    
output          dahbif_ncb_cmplt;      
output  [31:0]  dahbif_ncb_data;       
output          dahbif_ncb_grant;      
output          dahbif_ncb_grant_2;    
output          dahbif_stb_acc_ecc;    
output          dahbif_stb_cmplt;      
output          dahbif_stb_grant;      
output          dahbif_stb_grant_2;    
output          dahbif_vb_acc_ecc;     
output          dahbif_vb_cmplt;       
output          dahbif_vb_grant;       
output          lsu_bmu_acc_deny;      
output  [31:0]  lsu_bmu_addr;          
output  [2 :0]  lsu_bmu_burst;         
output          lsu_bmu_lock;          
output          lsu_bmu_lrsc;          
output  [3 :0]  lsu_bmu_prot;          
output          lsu_bmu_req;           
output          lsu_bmu_req_dp;        
output          lsu_bmu_seq;           
output  [1 :0]  lsu_bmu_size;          
output  [31:0]  lsu_bmu_wdata;         
output          lsu_bmu_write;         

// &Regs; @22
reg     [1 :0]  dahbif_cur_state;      
reg     [1 :0]  dahbif_next_state;     
reg     [2 :0]  data_cnt;              
reg     [31:0]  req_addr;              
reg     [2 :0]  req_burst;             
reg     [2 :0]  req_burst_ff;          
reg     [2 :0]  req_cnt;               
reg             req_lock;              
reg             req_lrsc;              
reg     [2 :0]  req_offset_ff;         
reg     [3 :0]  req_prot;              
reg     [3 :0]  req_sel;               
reg     [1 :0]  req_size;              
reg             req_write;             

// &Wires; @23
wire            bmu_lsu_acc_err;       
wire            bmu_lsu_grant;         
wire    [31:0]  bmu_lsu_rdata;         
wire            bmu_lsu_trans_cmplt;   
wire            ca_req_vld;            
wire            cp0_lsu_icg_en;        
wire            cpurst_b;              
wire            dahbif_clk_en;         
wire            dahbif_cur_busy;       
wire    [4 :0]  dahbif_dbginfo;        
wire            dahbif_fsm_clk;        
wire            dahbif_lfb_acc_err;    
wire            dahbif_lfb_cmplt;      
wire    [31:0]  dahbif_lfb_data;       
wire            dahbif_lfb_grant;      
wire            dahbif_ncb_acc_err;    
wire            dahbif_ncb_cmplt;      
wire    [31:0]  dahbif_ncb_data;       
wire            dahbif_ncb_grant;      
wire            dahbif_ncb_grant_2;    
wire            dahbif_stb_acc_ecc;    
wire            dahbif_stb_cmplt;      
wire            dahbif_stb_grant;      
wire            dahbif_stb_grant_2;    
wire            dahbif_vb_acc_ecc;     
wire            dahbif_vb_cmplt;       
wire            dahbif_vb_grant;       
wire    [2 :0]  data_cnt_inc;          
wire            data_cnt_inc_en;       
wire            data_cnt_start;        
wire            data_last;             
wire            forever_cpuclk;        
wire    [31:0]  lfb_dahbif_addr;       
wire    [2 :0]  lfb_dahbif_burst;      
wire            lfb_dahbif_lock;       
wire            lfb_dahbif_lr_inst;    
wire    [3 :0]  lfb_dahbif_prot;       
wire            lfb_dahbif_req;        
wire    [1 :0]  lfb_dahbif_size;       
wire            lfb_req;               
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
wire            ncb_dahbif_acc_deny;   
wire            ncb_dahbif_lock;       
wire            ncb_dahbif_lrsc;       
wire    [31:0]  ncb_dahbif_ncb_wb_addr; 
wire            ncb_dahbif_ncb_wb_sel; 
wire    [3 :0]  ncb_dahbif_prot;       
wire            ncb_dahbif_req;        
wire            ncb_dahbif_req_dp;     
wire    [1 :0]  ncb_dahbif_size;       
wire    [31:0]  ncb_dahbif_uc_ld_addr; 
wire    [31:0]  ncb_dahbif_wdata;      
wire            ncb_dahbif_write;      
wire            ncb_req;               
wire            pad_yy_icg_scan_en;    
wire            req_acc_deny;          
wire    [31:0]  req_addr_post;         
wire            req_burst_vld;         
wire            req_burst_vld_ff;      
wire            req_cnt_init;          
wire            req_create_en;         
wire            req_done;              
wire            req_first;             
wire            req_idle;              
wire            req_idle_dp;           
wire            req_inc2_ff;           
wire    [2 :0]  req_offset;            
wire    [3 :0]  req_sel_final;         
wire            req_seq;               
wire    [3 :0]  req_valid;             
wire    [3 :0]  req_valid_dp;          
wire            req_vld;               
wire            req_vld_dp;            
wire    [31:0]  req_wdata;             
wire            rtu_yy_xx_async_flush; 
wire    [31:0]  stb_dahbif_addr;       
wire    [31:0]  stb_dahbif_data;       
wire            stb_dahbif_lock;       
wire    [3 :0]  stb_dahbif_prot;       
wire            stb_dahbif_req;        
wire            stb_dahbif_sc_inst;    
wire    [1 :0]  stb_dahbif_size;       
wire            stb_req;               
wire    [31:0]  vb_dahbif_addr;        
wire    [31:0]  vb_dahbif_data;        
wire    [3 :0]  vb_dahbif_prot;        
wire            vb_dahbif_req;         
wire            vb_req;                


parameter REQ = 2'b00;
parameter WFG = 2'b01;
parameter WFC = 2'b10;

always@(posedge dahbif_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dahbif_cur_state[1:0] <= REQ;
  else if (rtu_yy_xx_async_flush)
    dahbif_cur_state[1:0] <= REQ;
  else
    dahbif_cur_state[1:0] <= dahbif_next_state[1:0];
end

// &CombBeg; @39
always @( req_vld
       or dahbif_cur_state[1:0]
       or bmu_lsu_grant
       or bmu_lsu_acc_err
       or bmu_lsu_trans_cmplt
       or data_last)
begin
  case(dahbif_cur_state[1:0])
    REQ: begin
      if (req_vld)
        dahbif_next_state[1:0] = bmu_lsu_grant ? WFC : WFG;
      else
        dahbif_next_state[1:0] = REQ;
    end
    WFG: begin
      if (bmu_lsu_grant) 
        dahbif_next_state[1:0] = WFC;
      else
        dahbif_next_state[1:0] = WFG;
    end
    WFC: begin
      if (bmu_lsu_trans_cmplt & data_last & !bmu_lsu_acc_err)
        dahbif_next_state[1:0] = req_vld ? (bmu_lsu_grant ? WFC : WFG)
                                    : REQ;
      else if (bmu_lsu_trans_cmplt & bmu_lsu_acc_err)
        dahbif_next_state[1:0] = REQ;
      else
        dahbif_next_state[1:0] = WFC;
    end
    default: dahbif_next_state[1:0] = REQ;
  endcase
// &CombEnd; @64
end

assign dahbif_cur_busy = dahbif_cur_state[1:0] != REQ;

assign req_vld    = vb_dahbif_req | lfb_dahbif_req | stb_dahbif_req | ncb_dahbif_req;
assign req_vld_dp = vb_dahbif_req | lfb_dahbif_req | stb_dahbif_req | ncb_dahbif_req_dp;

//burst request:
//for condition1:cmplt but no next request grant, data_last is valid but req_done not valid
//for condition2:grant two requests but no cmplt, req_done is valid but data_last not valid.
//               fsm should wait last data cmplt can recevie new request.
assign req_idle_dp = (dahbif_cur_state[1:0] == REQ) |
                     (dahbif_cur_state[1:0] == WFC) & req_done & data_last;

assign req_idle = (dahbif_cur_state[1:0] == REQ) |
                  (dahbif_cur_state[1:0] == WFC) & bmu_lsu_trans_cmplt & req_done & data_last;

assign req_create_en = req_vld & req_idle;

assign req_first = req_idle | (dahbif_cur_state[1:0] == WFG);

//------------------------------------------------
// req_sel
//------------------------------------------------
assign lfb_req =  lfb_dahbif_req;
assign vb_req  = !lfb_dahbif_req &  vb_dahbif_req;
assign stb_req = !lfb_dahbif_req & !vb_dahbif_req & stb_dahbif_req;
assign ncb_req = ncb_dahbif_req;

assign req_valid[3:0] = {ncb_req,stb_req,lfb_req,vb_req};

always@(posedge dahbif_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    req_sel[3:0] <= 4'b0;
  else if (req_create_en)
    req_sel[3:0] <= req_valid[3:0];
end

//------------------------------------------------
// req_burst_ff
//------------------------------------------------
always@(posedge dahbif_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    req_burst_ff[2:0] <= 3'b000;
  else if (req_create_en)
    req_burst_ff[2:0] <= req_burst[2:0];
end

assign req_burst_vld_ff = req_burst_ff[2:0] != 3'b000;
assign req_inc2_ff = req_burst_ff[2:0] == 3'b001;

//------------------------------------------------
//req_cnt and req_done
//------------------------------------------------
assign req_cnt_init = req_create_en & req_burst_vld;

always@(posedge dahbif_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    req_cnt[2:0] <= 3'b000;
  else if (req_cnt_init)
    req_cnt[2:0] <= bmu_lsu_grant ? 3'b001 : 3'b000;
  else if (dahbif_cur_busy & bmu_lsu_grant & req_burst_vld_ff)
    req_cnt[2:0] <= req_cnt[2:0] + 3'b001;
  else if (bmu_lsu_acc_err)
    req_cnt[2:0] <= 3'b000;
end

assign req_done = !req_burst_vld_ff | (req_cnt[2:0] == 3'b000) | req_inc2_ff & (req_cnt[2:0] == 3'b010);
assign req_seq  = req_burst_vld_ff & (req_cnt[2:0] != 3'b000);

//------------------------------------------------
// data_cnt and data_last
//------------------------------------------------
assign data_cnt_start  = req_create_en;
assign data_cnt_inc_en = (dahbif_cur_state[1:0] == WFC) & bmu_lsu_trans_cmplt;

always@(posedge dahbif_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    data_cnt[2:0] <= 3'b000;
  else if (data_cnt_start)
    data_cnt[2:0] <= req_burst_vld ? 3'b000 : 3'b111;
  else if (data_cnt_inc_en)
    data_cnt[2:0] <= data_cnt_inc[2:0];
end

assign data_cnt_inc[2:0] = data_cnt[2:0] + 3'b001;
assign data_last = req_inc2_ff ? (data_cnt[2:0] == 3'b001) : (data_cnt[2:0] == 3'b111);

//------------------------------------------------
//req_offset
//------------------------------------------------
always@(posedge dahbif_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    req_offset_ff[2:0] <= 3'b000;
  else if (req_create_en)
    req_offset_ff[2:0] <= bmu_lsu_grant ? (req_addr_post[4:2] + 3'b001) : req_addr_post[4:2];
  else if (dahbif_cur_busy & bmu_lsu_grant & req_burst_vld_ff)
    req_offset_ff[2:0] <= req_offset_ff[2:0] + 3'b001;
end

assign req_offset[2:0] = req_idle_dp
                       ? req_addr_post[4:2] 
                       : req_offset_ff[2:0];

//------------------------------------------------
// requset select
//------------------------------------------------
assign req_valid_dp[3:0] = {ncb_dahbif_req_dp,stb_req,lfb_req,vb_req};
assign req_sel_final[3:0] = req_idle_dp ? req_valid_dp[3:0] : req_sel[3:0];

// &CombBeg; @179
always @( lfb_dahbif_addr[31:0]
       or stb_dahbif_prot[3:0]
       or stb_dahbif_addr[31:0]
       or lfb_dahbif_lock
       or ncb_dahbif_lock
       or req_sel_final[2:0]
       or ncb_dahbif_lrsc
       or stb_dahbif_lock
       or ncb_dahbif_size[1:0]
       or lfb_dahbif_burst[2:0]
       or ncb_dahbif_prot[3:0]
       or stb_dahbif_sc_inst
       or ncb_dahbif_ncb_wb_addr[31:0]
       or lfb_dahbif_prot[3:0]
       or lfb_dahbif_lr_inst
       or ncb_dahbif_write
       or stb_dahbif_size[1:0]
       or lfb_dahbif_size[1:0]
       or vb_dahbif_addr[31:0]
       or vb_dahbif_prot[3:0])
begin
  case(req_sel_final[2:0])
    3'b001: begin
            req_addr[31:0] = vb_dahbif_addr[31:0];
            req_prot[3:0]  = vb_dahbif_prot[3:0];
            req_size[1:0]  = 2'b10;
            req_write      = 1'b1;
            req_burst[2:0] = 3'b101; //INCR8
            req_lock       = 1'b0;
            req_lrsc       = 1'b0;
            end
    3'b010: begin
            req_addr[31:0] = lfb_dahbif_addr[31:0];
            req_prot[3:0]  = lfb_dahbif_prot[3:0];
            req_size[1:0]  = lfb_dahbif_size[1:0];
            req_write      = 1'b0;
            req_burst[2:0] = lfb_dahbif_burst[2:0];
            req_lock       = lfb_dahbif_lock;
            req_lrsc       = lfb_dahbif_lr_inst;
            end
    3'b100: begin
            req_addr[31:0] = stb_dahbif_addr[31:0];
            req_prot[3:0]  = stb_dahbif_prot[3:0];
            req_size[1:0]  = stb_dahbif_size[1:0];
            req_write      = 1'b1;
            req_burst[2:0] = (stb_dahbif_size[1:0] == 2'b11) ? 3'b001 : 3'b000;
            req_lock       = stb_dahbif_lock;
            req_lrsc       = stb_dahbif_sc_inst;
            end
    default:begin
            req_addr[31:0] = ncb_dahbif_ncb_wb_addr[31:0];
            req_prot[3:0]  = ncb_dahbif_prot[3:0];
            req_size[1:0]  = ncb_dahbif_size[1:0];
            req_write      = ncb_dahbif_write;
            req_burst[2:0] = (ncb_dahbif_size[1:0] == 2'b11) ? 3'b001 : 3'b000;
            req_lock       = ncb_dahbif_lock;
            req_lrsc       = ncb_dahbif_lrsc;
            end
  endcase
// &CombEnd; @218
end

assign req_burst_vld = req_burst[2:0] != 3'b000;

assign ca_req_vld          = |req_sel_final[2:0];
assign req_addr_post[31:0] = ca_req_vld | ncb_dahbif_ncb_wb_sel
                           ? req_addr[31:0]
                           : ncb_dahbif_uc_ld_addr[31:0];
assign req_acc_deny        = !ca_req_vld & ncb_dahbif_acc_deny;

assign req_wdata[31:0]     = {32{req_sel[0]}} & vb_dahbif_data[31:0] |
                             {32{req_sel[2]}} & stb_dahbif_data[31:0] |
                             {32{req_sel[3]}} & ncb_dahbif_wdata[31:0];

assign lsu_bmu_req        = req_idle_dp & req_vld | 
                           (dahbif_cur_state[1:0] == WFG) |
                           (dahbif_cur_state[1:0] ==WFC) & !req_done;
assign lsu_bmu_req_dp     = req_idle_dp & req_vld_dp | 
                           (dahbif_cur_state[1:0] == WFG) |
                           (dahbif_cur_state[1:0] ==WFC) & !req_done;
assign lsu_bmu_write      = req_write;
assign lsu_bmu_addr[31:0] = {req_addr_post[31:5], req_offset[2:0], req_addr_post[1:0]} ;
assign lsu_bmu_prot[3:0]  = req_prot[3:0];
assign lsu_bmu_size[1:0]  = (req_size[1:0] == 2'b11) ? 2'b10 : req_size[1:0];
assign lsu_bmu_wdata[31:0]= req_wdata[31:0];
assign lsu_bmu_acc_deny   = req_acc_deny;
assign lsu_bmu_lock       = req_lock;
assign lsu_bmu_lrsc       = req_lrsc;
assign lsu_bmu_seq        = (dahbif_cur_state[1:0] ==WFC) & req_seq;
assign lsu_bmu_burst[2:0] = req_burst[2] ? req_burst[2:0] : 3'b000;

assign dahbif_ncb_grant   = req_sel_final[3] & req_first & bmu_lsu_grant;
assign dahbif_ncb_grant_2 = req_sel_final[3] & !req_first & bmu_lsu_grant;
assign dahbif_ncb_cmplt   = req_sel[3] & bmu_lsu_trans_cmplt;
assign dahbif_ncb_acc_err = req_sel[3] & bmu_lsu_acc_err;
assign dahbif_ncb_data[31:0] = bmu_lsu_rdata[31:0];

assign dahbif_stb_grant   = req_sel_final[2] & req_first & bmu_lsu_grant;
assign dahbif_stb_grant_2 = req_sel_final[2] & !req_first & bmu_lsu_grant;
assign dahbif_stb_cmplt   = req_sel[2] & bmu_lsu_trans_cmplt;
assign dahbif_stb_acc_ecc = req_sel[2] & bmu_lsu_acc_err;

assign dahbif_lfb_grant   = req_sel_final[1] & req_first & bmu_lsu_grant;
assign dahbif_lfb_cmplt   = req_sel[1] & bmu_lsu_trans_cmplt;
assign dahbif_lfb_acc_err = req_sel[1] & bmu_lsu_acc_err;
assign dahbif_lfb_data[31:0] = bmu_lsu_rdata[31:0];

assign dahbif_vb_grant    = req_sel_final[0] & req_first & bmu_lsu_grant;
assign dahbif_vb_cmplt    = req_sel[0] & bmu_lsu_trans_cmplt;
assign dahbif_vb_acc_ecc  = req_sel[0] & bmu_lsu_acc_err;

assign dahbif_clk_en = req_vld_dp | ~(dahbif_cur_state[1:0] == REQ);
// &Instance("gated_clk_cell", "x_pa_lsu_dahbif_gated_clk"); @270
gated_clk_cell  x_pa_lsu_dahbif_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dahbif_fsm_clk    ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dahbif_clk_en     ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @271
//          .external_en (1'b0), @272
//          .global_en   (1'b1), @273
//          .module_en     (cp0_lsu_icg_en     ), @274
//          .local_en    (dahbif_clk_en), @275
//          .clk_out     (dahbif_fsm_clk)); @276

assign dahbif_dbginfo[4:0] = {req_cnt[2:0],dahbif_cur_state[1:0]};

// &ModuleEnd; @280
endmodule


