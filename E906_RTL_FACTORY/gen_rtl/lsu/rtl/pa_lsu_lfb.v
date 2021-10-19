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
module pa_lsu_lfb(
  cp0_lsu_icg_en,
  cpurst_b,
  dahbif_lfb_acc_err,
  dahbif_lfb_cmplt,
  dahbif_lfb_data,
  dahbif_lfb_grant,
  dc_lfb_addr,
  dc_lfb_buf,
  dc_lfb_ca,
  dc_lfb_ca_raw,
  dc_lfb_create_en,
  dc_lfb_create_en_gate,
  dc_lfb_inst_ld,
  dc_lfb_lock_trans,
  dc_lfb_lr_inst,
  dc_lfb_mach_mode,
  dc_lfb_size,
  dc_xx_addr,
  forever_cpuclk,
  ifu_lsu_warm_up,
  lfb_arb_data_bank,
  lfb_arb_data_din,
  lfb_arb_data_idx,
  lfb_arb_data_req,
  lfb_arb_data_way,
  lfb_arb_data_wen,
  lfb_arb_dcache_sel,
  lfb_arb_dirty_din,
  lfb_arb_dirty_idx,
  lfb_arb_dirty_req,
  lfb_arb_dirty_wen,
  lfb_arb_tag_din,
  lfb_arb_tag_idx,
  lfb_arb_tag_req,
  lfb_arb_tag_wen,
  lfb_dahbif_addr,
  lfb_dahbif_burst,
  lfb_dahbif_lock,
  lfb_dahbif_lr_inst,
  lfb_dahbif_prot,
  lfb_dahbif_req,
  lfb_dahbif_size,
  lfb_dbginfo,
  lfb_dc_async_expt,
  lfb_dc_busy,
  lfb_dc_hit_idx,
  lfb_dc_ld_cmplt,
  lfb_dc_ld_data,
  lfb_dc_ld_data_vld,
  lfb_dc_pop_en,
  lfb_rdl_index,
  lfb_rdl_start,
  lfb_rdl_start_gate,
  lfb_stb_done,
  lfb_stb_err,
  lfb_stb_fifo,
  lfb_stb_fifo_update,
  lfb_xx_idle,
  pad_yy_icg_scan_en,
  rdl_lfb_done,
  rdl_lfb_fifo,
  rdl_lfb_fifo_save,
  rdl_lfb_grant,
  rtu_yy_xx_async_flush
);

// &Ports; @21
input           cp0_lsu_icg_en;       
input           cpurst_b;             
input           dahbif_lfb_acc_err;   
input           dahbif_lfb_cmplt;     
input   [31:0]  dahbif_lfb_data;      
input           dahbif_lfb_grant;     
input   [31:0]  dc_lfb_addr;          
input           dc_lfb_buf;           
input           dc_lfb_ca;            
input           dc_lfb_ca_raw;        
input           dc_lfb_create_en;     
input           dc_lfb_create_en_gate; 
input           dc_lfb_inst_ld;       
input           dc_lfb_lock_trans;    
input           dc_lfb_lr_inst;       
input           dc_lfb_mach_mode;     
input   [1 :0]  dc_lfb_size;          
input   [31:0]  dc_xx_addr;           
input           forever_cpuclk;       
input           ifu_lsu_warm_up;      
input           pad_yy_icg_scan_en;   
input           rdl_lfb_done;         
input           rdl_lfb_fifo;         
input           rdl_lfb_fifo_save;    
input           rdl_lfb_grant;        
input           rtu_yy_xx_async_flush; 
output  [1 :0]  lfb_arb_data_bank;    
output  [63:0]  lfb_arb_data_din;     
output  [11:0]  lfb_arb_data_idx;     
output          lfb_arb_data_req;     
output  [1 :0]  lfb_arb_data_way;     
output  [3 :0]  lfb_arb_data_wen;     
output          lfb_arb_dcache_sel;   
output  [2 :0]  lfb_arb_dirty_din;    
output  [9 :0]  lfb_arb_dirty_idx;    
output          lfb_arb_dirty_req;    
output  [2 :0]  lfb_arb_dirty_wen;    
output  [22:0]  lfb_arb_tag_din;      
output  [9 :0]  lfb_arb_tag_idx;      
output          lfb_arb_tag_req;      
output  [1 :0]  lfb_arb_tag_wen;      
output  [31:0]  lfb_dahbif_addr;      
output  [2 :0]  lfb_dahbif_burst;     
output          lfb_dahbif_lock;      
output          lfb_dahbif_lr_inst;   
output  [3 :0]  lfb_dahbif_prot;      
output          lfb_dahbif_req;       
output  [1 :0]  lfb_dahbif_size;      
output  [3 :0]  lfb_dbginfo;          
output          lfb_dc_async_expt;    
output          lfb_dc_busy;          
output          lfb_dc_hit_idx;       
output          lfb_dc_ld_cmplt;      
output  [31:0]  lfb_dc_ld_data;       
output          lfb_dc_ld_data_vld;   
output          lfb_dc_pop_en;        
output  [9 :0]  lfb_rdl_index;        
output          lfb_rdl_start;        
output          lfb_rdl_start_gate;   
output          lfb_stb_done;         
output          lfb_stb_err;          
output          lfb_stb_fifo;         
output          lfb_stb_fifo_update;  
output          lfb_xx_idle;          

// &Regs; @22
reg     [31:0]  lfb_addr;             
reg             lfb_buf;              
reg             lfb_ca;               
reg             lfb_cmplt;            
reg     [2 :0]  lfb_cur_state;        
reg     [31:0]  lfb_data;             
reg             lfb_fifo;             
reg             lfb_ld;               
reg             lfb_lock;             
reg             lfb_lr;               
reg             lfb_mach_mode;        
reg     [2 :0]  lfb_next_state;       
reg             lfb_prot_ca;          
reg     [1 :0]  lfb_size;             
reg     [3 :0]  ref_cur_state;        
reg     [3 :0]  ref_next_state;       
reg             refill_vld;           

// &Wires; @23
wire            cp0_lsu_icg_en;       
wire            cpurst_b;             
wire            dahbif_lfb_acc_err;   
wire            dahbif_lfb_cmplt;     
wire    [31:0]  dahbif_lfb_data;      
wire            dahbif_lfb_grant;     
wire    [31:0]  dc_lfb_addr;          
wire            dc_lfb_buf;           
wire            dc_lfb_ca;            
wire            dc_lfb_ca_raw;        
wire            dc_lfb_create_en;     
wire            dc_lfb_create_en_gate; 
wire            dc_lfb_inst_ld;       
wire            dc_lfb_lock_trans;    
wire            dc_lfb_lr_inst;       
wire            dc_lfb_mach_mode;     
wire    [1 :0]  dc_lfb_size;          
wire    [31:0]  dc_xx_addr;           
wire            forever_cpuclk;       
wire            ifu_lsu_warm_up;      
wire    [1 :0]  lfb_arb_data_bank;    
wire    [63:0]  lfb_arb_data_din;     
wire    [11:0]  lfb_arb_data_idx;     
wire            lfb_arb_data_req;     
wire    [1 :0]  lfb_arb_data_way;     
wire    [3 :0]  lfb_arb_data_wen;     
wire            lfb_arb_dcache_sel;   
wire    [2 :0]  lfb_arb_dirty_din;    
wire    [9 :0]  lfb_arb_dirty_idx;    
wire            lfb_arb_dirty_req;    
wire    [2 :0]  lfb_arb_dirty_wen;    
wire    [22:0]  lfb_arb_tag_din;      
wire    [9 :0]  lfb_arb_tag_idx;      
wire            lfb_arb_tag_req;      
wire    [1 :0]  lfb_arb_tag_wen;      
wire            lfb_cur_idle;         
wire    [31:0]  lfb_dahbif_addr;      
wire    [2 :0]  lfb_dahbif_burst;     
wire            lfb_dahbif_lock;      
wire            lfb_dahbif_lr_inst;   
wire    [3 :0]  lfb_dahbif_prot;      
wire            lfb_dahbif_req;       
wire    [1 :0]  lfb_dahbif_size;      
wire            lfb_data_clk;         
wire            lfb_data_clk_en;      
wire    [3 :0]  lfb_dbginfo;          
wire            lfb_dc_async_expt;    
wire            lfb_dc_busy;          
wire            lfb_dc_hit_idx;       
wire            lfb_dc_ld_cmplt;      
wire    [31:0]  lfb_dc_ld_data;       
wire            lfb_dc_ld_data_vld;   
wire            lfb_dc_pop_en;        
wire            lfb_dp_clk;           
wire            lfb_dp_clk_en;        
wire            lfb_fld_inst;         
wire            lfb_fsm_clk;          
wire            lfb_fsm_clk_en;       
wire    [2 :0]  lfb_offset;           
wire    [9 :0]  lfb_rdl_index;        
wire            lfb_rdl_start;        
wire            lfb_rdl_start_gate;   
wire            lfb_stb_done;         
wire            lfb_stb_err;          
wire            lfb_stb_fifo;         
wire            lfb_stb_fifo_update;  
wire            lfb_xx_idle;          
wire            pad_yy_icg_scan_en;   
wire            rdl_lfb_done;         
wire            rdl_lfb_fifo;         
wire            rdl_lfb_fifo_save;    
wire            rdl_lfb_grant;        
wire            refill_done;          
wire            refill_err;           
wire            refill_first;         
wire            refill_idle;          
wire            refill_start;         
wire            rtu_yy_xx_async_flush; 
wire            vld_set;              


parameter D_DATA_INDEX_LEN = `D_DATA_INDEX_WIDTH;
parameter D_TAG_TAG_LEN    = `D_TAG_TAG_WIDTH;
parameter D_TAG_INDEX_LEN  = `D_TAG_INDEX_WIDTH;

//================================================
//          LFB FSM
//================================================
parameter LFB_IDLE = 3'b000;
parameter LFB_RDL  = 3'b001;
parameter LFB_REQ  = 3'b010;
parameter LFB_WFC  = 3'b011;
parameter LFB_REF  = 3'b100;
parameter LFB_WRDL = 3'b101;
parameter LFB_WFC2 = 3'b110;

always@(posedge lfb_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_cur_state[2:0] <= LFB_IDLE;
  else if (rtu_yy_xx_async_flush)
    lfb_cur_state[2:0] <= LFB_IDLE;
  else
    lfb_cur_state[2:0] <= lfb_next_state[2:0];
end

// &CombBeg; @50
always @( dc_lfb_ca
       or rdl_lfb_done
       or dahbif_lfb_acc_err
       or lfb_cur_state[2:0]
       or lfb_fld_inst
       or dahbif_lfb_cmplt
       or rdl_lfb_grant
       or refill_done
       or dc_lfb_create_en
       or dahbif_lfb_grant
       or lfb_ca)
begin
  case(lfb_cur_state[2:0])
    LFB_IDLE: begin
      if (dc_lfb_create_en)begin
        if (dc_lfb_ca)
          lfb_next_state[2:0] = rdl_lfb_grant ? LFB_RDL : LFB_WRDL;
        else
          lfb_next_state[2:0] = LFB_REQ;
      end
      else
        lfb_next_state[2:0] = LFB_IDLE;
    end
    LFB_WRDL: begin
      if (rdl_lfb_grant)
        lfb_next_state[2:0] = LFB_RDL;
      else
        lfb_next_state[2:0] = LFB_WRDL;
    end
    LFB_RDL: begin
      if (rdl_lfb_done)
        lfb_next_state[2:0] = LFB_REQ;
      else 
        lfb_next_state[2:0] = LFB_RDL;
    end
    LFB_REQ: begin
      if (dahbif_lfb_grant)
        lfb_next_state[2:0] = LFB_WFC;
      else
        lfb_next_state[2:0] = LFB_REQ;
    end
    LFB_WFC: begin
      if (dahbif_lfb_cmplt)
        lfb_next_state[2:0] = (!lfb_ca & lfb_fld_inst & !dahbif_lfb_acc_err) ? LFB_WFC2 : LFB_REF;
      else
        lfb_next_state[2:0] = LFB_WFC;
    end
    LFB_WFC2: begin
        if (dahbif_lfb_cmplt)
          lfb_next_state[2:0] = LFB_REF;
        else
          lfb_next_state[2:0] = LFB_WFC2;
    end
    LFB_REF: begin
      if (!lfb_ca | refill_done)
        lfb_next_state[2:0] = LFB_IDLE;
      else
        lfb_next_state[2:0] = LFB_REF;
    end
    default: lfb_next_state[2:0] = LFB_IDLE;
  endcase
// &CombEnd; @100
end

assign lfb_rdl_start = dc_lfb_create_en & dc_lfb_ca | 
                       (lfb_cur_state[2:0] == LFB_WRDL);

assign lfb_rdl_start_gate = dc_lfb_create_en_gate & dc_lfb_ca | 
                            (lfb_cur_state[2:0] == LFB_WRDL);

assign lfb_stb_done = (lfb_cur_state[2:0] == LFB_REF) & refill_done;
assign lfb_stb_err  = (lfb_cur_state[2:0] == LFB_REF) & refill_err;

assign lfb_cur_idle = lfb_cur_state[2:0] == LFB_IDLE;
assign lfb_dc_busy  = !lfb_cur_idle;
assign lfb_xx_idle  = lfb_cur_idle;

assign lfb_dc_hit_idx = (dc_xx_addr[D_TAG_INDEX_LEN+4:5] == lfb_addr[D_TAG_INDEX_LEN+4:5]) & 
                        !lfb_cur_idle & lfb_ca;

// &Force("bus","dc_xx_addr",31,0); @118

assign lfb_dc_pop_en = (lfb_cur_state[2:0] == LFB_REF) & (!lfb_ca | refill_done);

always@(posedge lfb_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_fifo <= 1'b0;
  else if (rdl_lfb_fifo_save)
    lfb_fifo <= rdl_lfb_fifo;
end

assign lfb_stb_fifo_update = rdl_lfb_fifo_save;
assign lfb_stb_fifo = rdl_lfb_fifo;

//================================================
//          refill FSM
//================================================
assign refill_start = (lfb_cur_state[2:0] == LFB_WFC) & dahbif_lfb_cmplt & lfb_ca;

parameter REF_IDLE  = 4'b1000;
parameter REF_FIRST = 4'b0000;
parameter REF_SECND = 4'b0001;
parameter REF_THIRD = 4'b0010;
parameter REF_FOUR  = 4'b0011;
parameter REF_FIVE  = 4'b0100;
parameter REF_SIX   = 4'b0101;
parameter REF_SEVEN = 4'b0110;
parameter REF_EIGHT = 4'b0111;
parameter REF_ERR   = 4'b1001;

always@(posedge lfb_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ref_cur_state[3:0] <= REF_IDLE;
  else if (rtu_yy_xx_async_flush)
    ref_cur_state[3:0] <= REF_IDLE;
  else
    ref_cur_state[3:0] <= ref_next_state[3:0];
end

// &CombBeg; @159
always @( dahbif_lfb_acc_err
       or ref_cur_state[3:0]
       or dahbif_lfb_cmplt
       or refill_start)
begin
  case(ref_cur_state[3:0])
    REF_IDLE: begin
      if (refill_start)
        ref_next_state[3:0] = dahbif_lfb_acc_err ? REF_ERR : REF_FIRST;
      else
        ref_next_state[3:0] = REF_IDLE;
    end
    REF_FIRST: begin
      if (dahbif_lfb_cmplt)
        ref_next_state[3:0] = dahbif_lfb_acc_err ? REF_ERR : REF_SECND;
      else
        ref_next_state[3:0] = REF_FIRST;
    end
    REF_SECND: begin
      if (dahbif_lfb_cmplt)
        ref_next_state[3:0] = dahbif_lfb_acc_err ? REF_ERR : REF_THIRD;
      else
        ref_next_state[3:0] = REF_SECND;
    end
    REF_THIRD: begin
      if (dahbif_lfb_cmplt)
        ref_next_state[3:0] = dahbif_lfb_acc_err ? REF_ERR : REF_FOUR;
      else
        ref_next_state[3:0] = REF_THIRD;
    end
    REF_FOUR: begin
      if (dahbif_lfb_cmplt)
        ref_next_state[3:0] = dahbif_lfb_acc_err ? REF_ERR : REF_FIVE;
      else
        ref_next_state[3:0] = REF_FOUR;
    end
    REF_FIVE: begin
      if (dahbif_lfb_cmplt)
        ref_next_state[3:0] = dahbif_lfb_acc_err ? REF_ERR : REF_SIX;
      else
        ref_next_state[3:0] = REF_FIVE;
    end
    REF_SIX : begin
      if (dahbif_lfb_cmplt)
        ref_next_state[3:0] = dahbif_lfb_acc_err ? REF_ERR : REF_SEVEN;
      else
        ref_next_state[3:0] = REF_SIX;
    end
    REF_SEVEN:begin
      if (dahbif_lfb_cmplt)
        ref_next_state[3:0] = dahbif_lfb_acc_err ? REF_ERR : REF_EIGHT;
      else
        ref_next_state[3:0] = REF_SEVEN;
    end
    REF_EIGHT: begin
      ref_next_state[3:0] = REF_IDLE;
    end
    REF_ERR: begin
      ref_next_state[3:0] = REF_IDLE;
    end
    default: ref_next_state[3:0] = REF_IDLE;
  endcase
// &CombEnd; @217
end

always@(posedge lfb_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    refill_vld <= 1'b0;
  else if (((lfb_cur_state[2:0] == LFB_REF) | (lfb_cur_state[2:0] == LFB_WFC)) & lfb_ca)
    refill_vld <= dahbif_lfb_cmplt & !dahbif_lfb_acc_err;
end

assign refill_idle  = ref_cur_state[3:0] == REF_IDLE;
assign refill_first = ref_cur_state[3:0] == REF_FIRST;
assign refill_done = (ref_cur_state[3:0] == REF_EIGHT) |
                     (ref_cur_state[3:0] == REF_ERR);
assign refill_err  = (ref_cur_state[3:0] == REF_ERR);
assign vld_set     = (ref_cur_state[3:0] == REF_EIGHT);

assign lfb_arb_tag_req        = ((ref_cur_state[3:0] == REF_FIRST) | 
                                 (ref_cur_state[3:0] == REF_EIGHT)) & refill_vld;
assign lfb_arb_tag_wen[1:0]   = {lfb_fifo, !lfb_fifo};
assign lfb_arb_tag_din[22:0]  = {vld_set,{(22-D_TAG_TAG_LEN){1'b0}}, lfb_addr[31:D_TAG_INDEX_LEN+5]};
assign lfb_arb_tag_idx[9:0]   = lfb_addr[14:5];

assign lfb_arb_dirty_req      = (ref_cur_state[3:0] == REF_EIGHT) & refill_vld;
assign lfb_arb_dirty_wen[2:0] = {1'b1, lfb_fifo, !lfb_fifo};
assign lfb_arb_dirty_din[2:0] = {!lfb_fifo,2'b0};
assign lfb_arb_dirty_idx[9:0] = lfb_addr[14:5];

// &Force("output", "lfb_arb_dcache_sel"); @249

assign lfb_arb_data_req       = lfb_arb_dcache_sel & refill_vld;
assign lfb_arb_data_way[1:0]  = {lfb_fifo, !lfb_fifo};
assign lfb_arb_data_bank[1:0] = {lfb_offset[0], !lfb_offset[0]};
assign lfb_arb_data_wen[3:0]  = 4'b1111;
assign lfb_arb_data_din[63:0] = {lfb_data[31:0],lfb_data[31:0]};
assign lfb_arb_data_idx[11:0] = {lfb_addr[14:5], lfb_offset[2:1]};
assign lfb_offset[2:0]        = lfb_addr[4:2] + ref_cur_state[2:0];
assign lfb_arb_dcache_sel     = !(ref_cur_state[3:0] == REF_IDLE | ref_cur_state[3:0] == REF_ERR) ;

//================================================
//   Request bus
//================================================
assign lfb_dahbif_req = (lfb_cur_state[2:0] == LFB_REQ);
assign lfb_dahbif_addr[31:0] = lfb_ca ? {lfb_addr[31:2],2'b00} : lfb_addr[31:0];
assign lfb_dahbif_size[1:0]  = lfb_ca ? 2'b10 : lfb_size[1:0];
assign lfb_dahbif_prot[3:0]  = {lfb_prot_ca,lfb_buf,lfb_mach_mode,1'b1};
assign lfb_dahbif_lock       = lfb_lock;
assign lfb_dahbif_lr_inst    = lfb_lr;
assign lfb_dahbif_burst[2:0] = lfb_ca ? 3'b100 : (lfb_fld_inst ? 3'b001 : 3'b000); //WRAP8

//================================================
//          LFB content
//================================================

always@(posedge lfb_dp_clk)
begin
  if (dc_lfb_create_en | ifu_lsu_warm_up) begin
    lfb_addr[31:0]     <= dc_lfb_addr[31:0];
    lfb_ca             <= dc_lfb_ca;
    lfb_prot_ca        <= dc_lfb_ca_raw;
    lfb_buf            <= dc_lfb_buf;
    lfb_mach_mode      <= dc_lfb_mach_mode;
    lfb_size[1:0]      <= dc_lfb_size[1:0];
    lfb_lock           <= dc_lfb_lock_trans;
    lfb_ld             <= dc_lfb_inst_ld;
    lfb_lr             <= dc_lfb_lr_inst;
  end
end

assign lfb_fld_inst = lfb_ld & lfb_size[1:0] == 2'b11;


always@(posedge lfb_data_clk)
begin
  if (dahbif_lfb_cmplt & !dahbif_lfb_acc_err | ifu_lsu_warm_up)
    lfb_data[31:0] <= dahbif_lfb_data[31:0];
end

assign lfb_dc_ld_data[31:0] = lfb_data[31:0];

assign lfb_rdl_index[9:0] = (lfb_cur_state[2:0] == LFB_WRDL) 
                          ? lfb_addr[14:5]
                          : dc_lfb_addr[14:5];

//================================================
//          CMPLT and data vld
//================================================

always@(posedge lfb_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b) 
    lfb_cmplt <= 1'b0;
  else if (dahbif_lfb_cmplt & lfb_ld & 
                 (lfb_fld_inst & lfb_ca & (refill_idle & refill_start & dahbif_lfb_acc_err | refill_first) | 
                 !lfb_fld_inst & (lfb_cur_state[2:0] == LFB_WFC) |
                  lfb_fld_inst & !lfb_ca & ((lfb_cur_state[2:0] == LFB_WFC) & dahbif_lfb_acc_err |
                                            (lfb_cur_state[2:0] == LFB_WFC2))))
    lfb_cmplt <= 1'b1;
  else
    lfb_cmplt <= 1'b0;
end

assign lfb_dc_ld_cmplt      = lfb_cmplt;
assign lfb_dc_ld_data_vld   = lfb_cmplt;

assign lfb_dc_async_expt    = dahbif_lfb_cmplt & dahbif_lfb_acc_err & lfb_ld;


//==========================================================
//      gated cell
//==========================================================
assign lfb_fsm_clk_en = dc_lfb_create_en_gate |
                        lfb_cmplt | 
                        !(lfb_cur_state[2:0] == LFB_IDLE) | 
                        !(ref_cur_state[3:0] == REF_IDLE);

// &Instance("gated_clk_cell", "x_pa_lsu_lfb_fsm_gated_clk"); @396
gated_clk_cell  x_pa_lsu_lfb_fsm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lfb_fsm_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (lfb_fsm_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @397
//          .external_en (1'b0), @398
//          .global_en   (1'b1), @399
//          .module_en     (cp0_lsu_icg_en     ), @400
//          .local_en    (lfb_fsm_clk_en), @401
//          .clk_out     (lfb_fsm_clk)); @402

assign lfb_dp_clk_en = dc_lfb_create_en_gate | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_lfb_dp_gated_clk"); @405
gated_clk_cell  x_pa_lsu_lfb_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lfb_dp_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (lfb_dp_clk_en     ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @406
//          .external_en (1'b0), @407
//          .global_en   (1'b1), @408
//          .module_en     (cp0_lsu_icg_en     ), @409
//          .local_en    (lfb_dp_clk_en), @410
//          .clk_out     (lfb_dp_clk)); @411

assign lfb_data_clk_en = dahbif_lfb_cmplt & !dahbif_lfb_acc_err | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_lfb_data_gated_clk"); @414
gated_clk_cell  x_pa_lsu_lfb_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lfb_data_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (lfb_data_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @415
//          .external_en (1'b0), @416
//          .global_en   (1'b1), @417
//          .module_en     (cp0_lsu_icg_en     ), @418
//          .local_en    (lfb_data_clk_en), @419
//          .clk_out     (lfb_data_clk)); @420

// &Instance("gated_clk_cell", "x_pa_lsu_lfb_data_ff_gated_clk"); @424
// &Connect(.clk_in      (forever_cpuclk), @425
//          .external_en (1'b0), @426
//          .global_en   (1'b1), @427
//          .module_en     (cp0_lsu_icg_en     ), @428
//          .local_en    (lfb_data_ff_clk_en), @429
//          .clk_out     (lfb_data_ff_clk)); @430

assign lfb_dbginfo[3:0] = {refill_vld,lfb_cur_state[2:0]};
// &ModuleEnd; @434
endmodule


