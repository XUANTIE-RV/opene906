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
module pa_lsu_stb_entry(
  cp0_lsu_dcache_wb,
  cp0_lsu_icg_en,
  cpurst_b,
  dc_hit_stb_addr_x,
  dc_hit_stb_dca_x,
  dc_hit_stb_full_x,
  dc_hit_stb_index_x,
  dc_hit_stb_part_x,
  dc_xx_addr,
  dc_xx_bytes_vld,
  forever_cpuclk,
  ifu_lsu_warm_up,
  lfb_stb_done,
  lfb_stb_err,
  lfb_stb_fifo,
  lfb_stb_fifo_update,
  lfb_xx_idle,
  pad_yy_icg_scan_en,
  rtu_lsu_fgpr_wb_data,
  rtu_lsu_fgpr_wb_reg,
  rtu_lsu_fgpr_wb_vld,
  rtu_yy_xx_async_flush,
  stb_clk,
  stb_create_addr,
  stb_create_age,
  stb_create_attr,
  stb_create_bytes_vld,
  stb_create_data,
  stb_create_dca_inst,
  stb_create_dca_type,
  stb_create_dirty,
  stb_create_en_gate_x,
  stb_create_en_x,
  stb_create_fls,
  stb_create_lock,
  stb_create_sc_inst,
  stb_create_shift,
  stb_create_size,
  stb_create_split_first,
  stb_create_src1_depd,
  stb_create_src1_reg,
  stb_create_wait_lfb,
  stb_create_way,
  stb_create_wt_ca,
  stb_dca_done_x,
  stb_dca_grant_x,
  stb_entry_age_x,
  stb_entry_biu_req_x,
  stb_entry_burst_x,
  stb_entry_busy_x,
  stb_entry_data_vld_x,
  stb_entry_dcache_req_x,
  stb_entry_dirty_x,
  stb_entry_lock_x,
  stb_entry_pop_vld_x,
  stb_entry_rdl_req_x,
  stb_entry_sc_inst_x,
  stb_entry_split_first_x,
  stb_entry_vld_dp_x,
  stb_entry_vld_x,
  stb_entry_way_x,
  stb_entryx_addr,
  stb_entryx_bank,
  stb_entryx_bytes_vld,
  stb_entryx_data,
  stb_entryx_dbginfo,
  stb_entryx_dca_type,
  stb_entryx_prot,
  stb_entryx_size,
  stb_pop_vld,
  stb_wbus_cmplt_x,
  stb_wbus_grant_x,
  stb_wca_grant_x
);

// &Ports; @21
input           cp0_lsu_dcache_wb;      
input           cp0_lsu_icg_en;         
input           cpurst_b;               
input   [31:0]  dc_xx_addr;             
input   [7 :0]  dc_xx_bytes_vld;        
input           forever_cpuclk;         
input           ifu_lsu_warm_up;        
input           lfb_stb_done;           
input           lfb_stb_err;            
input           lfb_stb_fifo;           
input           lfb_stb_fifo_update;    
input           lfb_xx_idle;            
input           pad_yy_icg_scan_en;     
input   [31:0]  rtu_lsu_fgpr_wb_data;   
input   [4 :0]  rtu_lsu_fgpr_wb_reg;    
input           rtu_lsu_fgpr_wb_vld;    
input           rtu_yy_xx_async_flush;  
input           stb_clk;                
input   [31:0]  stb_create_addr;        
input           stb_create_age;         
input   [2 :0]  stb_create_attr;        
input   [3 :0]  stb_create_bytes_vld;   
input   [31:0]  stb_create_data;        
input           stb_create_dca_inst;    
input   [1 :0]  stb_create_dca_type;    
input           stb_create_dirty;       
input           stb_create_en_gate_x;   
input           stb_create_en_x;        
input           stb_create_fls;         
input           stb_create_lock;        
input           stb_create_sc_inst;     
input   [3 :0]  stb_create_shift;       
input   [1 :0]  stb_create_size;        
input           stb_create_split_first; 
input           stb_create_src1_depd;   
input   [4 :0]  stb_create_src1_reg;    
input           stb_create_wait_lfb;    
input           stb_create_way;         
input           stb_create_wt_ca;       
input           stb_dca_done_x;         
input           stb_dca_grant_x;        
input           stb_pop_vld;            
input           stb_wbus_cmplt_x;       
input           stb_wbus_grant_x;       
input           stb_wca_grant_x;        
output          dc_hit_stb_addr_x;      
output          dc_hit_stb_dca_x;       
output          dc_hit_stb_full_x;      
output          dc_hit_stb_index_x;     
output          dc_hit_stb_part_x;      
output          stb_entry_age_x;        
output          stb_entry_biu_req_x;    
output          stb_entry_burst_x;      
output          stb_entry_busy_x;       
output          stb_entry_data_vld_x;   
output          stb_entry_dcache_req_x; 
output          stb_entry_dirty_x;      
output          stb_entry_lock_x;       
output          stb_entry_pop_vld_x;    
output          stb_entry_rdl_req_x;    
output          stb_entry_sc_inst_x;    
output          stb_entry_split_first_x; 
output          stb_entry_vld_dp_x;     
output          stb_entry_vld_x;        
output          stb_entry_way_x;        
output  [31:0]  stb_entryx_addr;        
output  [1 :0]  stb_entryx_bank;        
output  [3 :0]  stb_entryx_bytes_vld;   
output  [31:0]  stb_entryx_data;        
output  [10:0]  stb_entryx_dbginfo;     
output  [1 :0]  stb_entryx_dca_type;    
output  [3 :0]  stb_entryx_prot;        
output  [1 :0]  stb_entryx_size;        

// &Regs; @22
reg             stb_age;                
reg     [3 :0]  stb_cur_state;          
reg     [31:0]  stb_data_align;         
reg     [31:0]  stb_entry_addr;         
reg     [2 :0]  stb_entry_attr;         
reg     [3 :0]  stb_entry_bytes_vld;    
reg     [31:0]  stb_entry_data;         
reg     [1 :0]  stb_entry_dca_type;     
reg             stb_entry_dirty;        
reg             stb_entry_fls;          
reg             stb_entry_lock;         
reg             stb_entry_sc_inst;      
reg     [2 :0]  stb_entry_shift;        
reg     [1 :0]  stb_entry_size;         
reg             stb_entry_split_first;  
reg     [4 :0]  stb_entry_src1_reg;     
reg             stb_entry_way;          
reg             stb_entry_wb;           
reg             stb_entry_wt_ca;        
reg     [3 :0]  stb_next_state;         
reg             stb_src1_depd;          

// &Wires; @23
wire            cp0_lsu_dcache_wb;      
wire            cp0_lsu_icg_en;         
wire            cpurst_b;               
wire            dc_hit_stb_addr;        
wire            dc_hit_stb_addr_x;      
wire            dc_hit_stb_bytes;       
wire            dc_hit_stb_bytes_full;  
wire            dc_hit_stb_dca_x;       
wire            dc_hit_stb_dword;       
wire            dc_hit_stb_full_x;      
wire            dc_hit_stb_index_x;     
wire            dc_hit_stb_line;        
wire            dc_hit_stb_part_x;      
wire    [31:0]  dc_xx_addr;             
wire    [7 :0]  dc_xx_bytes_vld;        
wire            forever_cpuclk;         
wire            ifu_lsu_warm_up;        
wire            lfb_stb_done;           
wire            lfb_stb_err;            
wire            lfb_stb_fifo;           
wire            lfb_stb_fifo_update;    
wire            lfb_xx_idle;            
wire            pad_yy_icg_scan_en;     
wire    [31:0]  rtu_lsu_fgpr_wb_data;   
wire    [4 :0]  rtu_lsu_fgpr_wb_reg;    
wire            rtu_lsu_fgpr_wb_vld;    
wire            rtu_yy_xx_async_flush;  
wire    [7 :0]  stb_bytes_vld_extend;   
wire            stb_clk;                
wire    [31:0]  stb_create_addr;        
wire            stb_create_age;         
wire    [2 :0]  stb_create_attr;        
wire    [3 :0]  stb_create_bytes_vld;   
wire    [31:0]  stb_create_data;        
wire            stb_create_dca_inst;    
wire    [1 :0]  stb_create_dca_type;    
wire            stb_create_dirty;       
wire            stb_create_en;          
wire            stb_create_en_gate_x;   
wire            stb_create_en_x;        
wire            stb_create_fls;         
wire            stb_create_lock;        
wire            stb_create_sc_inst;     
wire    [3 :0]  stb_create_shift;       
wire    [1 :0]  stb_create_size;        
wire            stb_create_split_first; 
wire            stb_create_src1_depd;   
wire    [4 :0]  stb_create_src1_reg;    
wire            stb_create_wait_lfb;    
wire            stb_create_way;         
wire            stb_create_wt_ca;       
wire            stb_cur_idle;           
wire            stb_cur_rdl;            
wire            stb_cur_wbus;           
wire            stb_cur_wca;            
wire            stb_cur_wfc;            
wire            stb_cur_wlfb;           
wire            stb_cur_wrdl;           
wire            stb_dca_done_x;         
wire            stb_dca_grant_x;        
wire            stb_dp_clk;             
wire            stb_dp_clk_en;          
wire            stb_entry_age_x;        
wire            stb_entry_biu_req_x;    
wire            stb_entry_burst_x;      
wire            stb_entry_busy_x;       
wire            stb_entry_data_vld_x;   
wire            stb_entry_dca_inst;     
wire            stb_entry_dcache_req_x; 
wire            stb_entry_dirty_x;      
wire            stb_entry_dw;           
wire            stb_entry_lock_x;       
wire            stb_entry_pop_vld_x;    
wire            stb_entry_rdl_req_x;    
wire            stb_entry_sc_inst_x;    
wire            stb_entry_split_first_x; 
wire            stb_entry_src1_depd;    
wire            stb_entry_vld_dp_x;     
wire            stb_entry_vld_x;        
wire            stb_entry_way_x;        
wire    [31:0]  stb_entryx_addr;        
wire    [1 :0]  stb_entryx_bank;        
wire    [3 :0]  stb_entryx_bytes_vld;   
wire    [31:0]  stb_entryx_data;        
wire    [10:0]  stb_entryx_dbginfo;     
wire    [1 :0]  stb_entryx_dca_type;    
wire    [3 :0]  stb_entryx_prot;        
wire    [1 :0]  stb_entryx_size;        
wire    [31:0]  stb_fwd_data;           
wire            stb_fwd_fwb;            
wire            stb_fwd_vld;            
wire            stb_pop_vld;            
wire            stb_vld;                
wire            stb_wbus_cmplt_x;       
wire            stb_wbus_grant_x;       
wire            stb_wca_grant_x;        
wire            stb_wdata_clk;          
wire            stb_wdata_clk_en;       


parameter D_TAG_INDEX_LEN  = `D_TAG_INDEX_WIDTH;
parameter DATAW    = `FLEN;
parameter STB_IDLE = 4'b0000;
parameter STB_WLFB = 4'b0001;
parameter STB_WCA  = 4'b0010;
parameter STB_WFC  = 4'b0011;
parameter STB_RDL  = 4'b0100;
parameter STB_WRDL = 4'b0101;
parameter STB_WBUS = 4'b1000;
parameter STB_WFD  = 4'b0110;

always@(posedge stb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    stb_cur_state[3:0] <= STB_IDLE;
  else if (rtu_yy_xx_async_flush)
    stb_cur_state[3:0] <= STB_IDLE;
  else
    stb_cur_state[3:0] <= stb_next_state[3:0];
end

assign stb_create_en = stb_create_en_x;

// &CombBeg; @48
always @( stb_fwd_vld
       or stb_entry_wb
       or stb_wbus_grant_x
       or stb_cur_state[3:0]
       or stb_create_en
       or stb_entry_src1_depd
       or stb_dca_done_x
       or stb_entry_wt_ca
       or stb_wca_grant_x
       or stb_dca_grant_x
       or stb_create_dca_inst
       or stb_create_wt_ca
       or lfb_stb_err
       or stb_create_wait_lfb
       or lfb_stb_done
       or stb_create_src1_depd
       or stb_wbus_cmplt_x)
begin
  case(stb_cur_state[3:0])
    STB_IDLE: begin
      if (stb_create_en) begin
        if (stb_create_dca_inst)
          stb_next_state[3:0] = STB_RDL;
        else if (stb_create_wait_lfb)
          stb_next_state[3:0] = STB_WLFB;
        else if (!stb_create_src1_depd)
          stb_next_state[3:0] = stb_create_wt_ca ? STB_WCA : STB_WBUS;
        else 
          stb_next_state[3:0] = STB_WFD;
      end
      else
        stb_next_state[3:0] = STB_IDLE;
    end
    STB_WFD: begin
      if (stb_fwd_vld)
        stb_next_state[3:0] = stb_entry_wt_ca ? STB_WCA : STB_WBUS;
      else
        stb_next_state[3:0] = STB_WFD;
    end
    STB_RDL: begin
      if (stb_dca_grant_x)
        stb_next_state[3:0] = STB_WRDL;
      else 
        stb_next_state[3:0] = STB_RDL;
    end
    STB_WRDL: begin
      if (stb_dca_done_x)
        stb_next_state[3:0] = STB_IDLE;
      else
        stb_next_state[3:0] = STB_WRDL;
    end
    STB_WLFB: begin
      if (lfb_stb_done & !stb_entry_src1_depd)
        stb_next_state[3:0] = lfb_stb_err ? STB_WBUS : STB_WCA;
      else if (lfb_stb_done & stb_entry_src1_depd)
        stb_next_state[3:0] = STB_WFD;
      else
        stb_next_state[3:0] = STB_WLFB;
    end
    STB_WCA: begin
      if (stb_wca_grant_x)
        stb_next_state[3:0] = stb_entry_wb ? STB_IDLE : STB_WBUS;
      else
        stb_next_state[3:0] = STB_WCA;
    end
    STB_WBUS: begin
      if (stb_wbus_grant_x)
        stb_next_state[3:0] = STB_WFC;
      else
        stb_next_state[3:0] = STB_WBUS;
    end
    STB_WFC: begin
      if (stb_wbus_cmplt_x)
        stb_next_state[3:0] = STB_IDLE;
      else
        stb_next_state[3:0] = STB_WFC;
    end
    default: stb_next_state[3:0] = STB_IDLE;
  endcase
// &CombEnd; @110
end

assign stb_cur_idle = stb_cur_state[3:0] == STB_IDLE; 
assign stb_cur_rdl  = stb_cur_state[3:0] == STB_RDL; 
assign stb_cur_wrdl = stb_cur_state[3:0] == STB_WRDL; 
assign stb_cur_wlfb = stb_cur_state[3:0] == STB_WLFB; 
assign stb_cur_wca  = stb_cur_state[3:0] == STB_WCA; 
assign stb_cur_wbus = stb_cur_state[3]; //STB_WBUS; 
assign stb_cur_wfc  = stb_cur_state[3:0] == STB_WFC; 

always@(posedge stb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    stb_entry_wt_ca <= 1'b0;
  else if (stb_create_en)
    stb_entry_wt_ca <= stb_create_wt_ca;
  else if (stb_cur_wlfb & lfb_stb_done)
    stb_entry_wt_ca <= lfb_stb_err ? 1'b0 : 1'b1;
end

always@(posedge stb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    stb_entry_way <= 1'b0;
  else if (stb_create_en)
    stb_entry_way <= stb_create_way;
  else if (lfb_stb_fifo_update & stb_cur_wlfb)
    stb_entry_way <= lfb_stb_fifo;
end

always@(posedge stb_dp_clk)
begin
  if (stb_create_en | ifu_lsu_warm_up) begin
    stb_entry_addr[31:0]     <= stb_create_addr[31:0];
    stb_entry_dca_type[1:0]  <= stb_create_dca_type[1:0];
    stb_entry_dirty          <= stb_create_dirty;
  end
end

// &Force("bus","stb_create_shift",3,0); @165
always@(posedge stb_dp_clk)
begin
  if (stb_create_en & !stb_create_dca_inst | ifu_lsu_warm_up) begin
    stb_entry_bytes_vld[3:0] <= stb_create_bytes_vld[3:0];
    stb_entry_size[1:0]      <= stb_create_size[1:0];
    stb_entry_attr[2:0]      <= stb_create_attr[2:0];
    stb_entry_wb             <= cp0_lsu_dcache_wb;
    stb_entry_lock           <= stb_create_lock;
    stb_entry_sc_inst        <= stb_create_sc_inst;
    stb_entry_src1_reg[4:0]  <= stb_create_src1_reg[4:0];
    stb_entry_fls            <= stb_create_fls;
    stb_entry_shift[2:0]     <= stb_create_shift[2:0]; 
    stb_entry_split_first    <= stb_create_split_first;
  end
end

assign stb_fwd_fwb   = rtu_lsu_fgpr_wb_vld & stb_entry_fls &
                       (stb_entry_src1_reg[4:0] == rtu_lsu_fgpr_wb_reg[4:0]);

assign stb_fwd_vld = stb_src1_depd & stb_fwd_fwb;
assign stb_fwd_data[DATAW-1:0]
                   = rtu_lsu_fgpr_wb_data[DATAW-1:0];
// &Force("nonport","stb_entry_fls"); @220
// &Force("nonport","stb_entry_src1_reg"); @221

always@(posedge stb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    stb_src1_depd <= 1'b0;
  else if (stb_create_en)
    stb_src1_depd <= stb_create_src1_depd;
  else if (stb_fwd_vld)
    stb_src1_depd <= 1'b0;
end

assign stb_entry_src1_depd = stb_src1_depd & !stb_fwd_vld;

always@(posedge stb_wdata_clk)
begin
  if (stb_create_en & !stb_create_dca_inst | ifu_lsu_warm_up)
    stb_entry_data[DATAW-1:0] <= stb_create_data[DATAW-1:0];
  else if (stb_fwd_vld)
    stb_entry_data[DATAW-1:0] <= stb_fwd_data[DATAW-1:0];
end

always@(posedge stb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    stb_age <= 1'b0;
  else if (stb_create_en)
    stb_age <= stb_create_age;
  else if (stb_pop_vld)
    stb_age <= 1'b0;
end

// &Force("output","stb_entry_pop_vld_x"); @270

assign stb_entry_vld_x           = !stb_cur_idle & !stb_entry_pop_vld_x;
assign stb_entry_busy_x          = !stb_cur_idle; 
assign stb_entry_pop_vld_x       = stb_cur_wca & stb_wca_grant_x & stb_entry_wb |
                                   stb_cur_wfc & stb_wbus_cmplt_x |
                                   stb_cur_wrdl & stb_dca_done_x;
assign stb_entry_age_x           = stb_age;

assign stb_entry_dcache_req_x    = stb_cur_wca; 
assign stb_entry_biu_req_x       = stb_cur_wbus;

assign stb_entryx_addr[31:0]     = stb_entry_addr[31:0];
assign stb_entryx_dca_type[1:0]  = stb_entry_dca_type[1:0];
assign stb_entryx_bytes_vld[3:0] = stb_entry_bytes_vld[3:0];
assign stb_entryx_size[1:0]      = stb_entry_size[1:0];
assign stb_entryx_prot[3:0]      = {stb_entry_attr[2:0], 1'b1}; 
assign stb_entry_way_x           = stb_entry_way;
assign stb_entry_lock_x          = stb_entry_lock;
assign stb_entry_sc_inst_x       = stb_entry_sc_inst;
assign stb_entryx_bank[1]        =  stb_entry_addr[2] | (stb_entry_size[1:0] == 2'b11);
assign stb_entryx_bank[0]        = !stb_entry_addr[2] | (stb_entry_size[1:0] == 2'b11);
assign stb_entry_burst_x         = (stb_entry_size[1:0] == 2'b11);
assign stb_entry_data_vld_x      = !stb_src1_depd;
assign stb_entry_split_first_x   = stb_entry_split_first;

// &CombBeg; @297
// &CombEnd; @309
// &CombBeg; @311
always @( stb_entry_data[31:0]
       or stb_entry_shift[1:0])
begin
  case(stb_entry_shift[1:0])
    2'b00: stb_data_align[31:0] = stb_entry_data[31:0];
    2'b01: stb_data_align[31:0] = {stb_entry_data[23:0],stb_entry_data[31:24]};
    2'b10: stb_data_align[31:0] = {stb_entry_data[15:0],stb_entry_data[31:16]};
    2'b11: stb_data_align[31:0] = {stb_entry_data[7:0], stb_entry_data[31:8]};
    default: stb_data_align[31:0] = stb_entry_data[31:0];
  endcase
// &CombEnd; @319
end

assign stb_entryx_data[DATAW-1:0] = stb_data_align[DATAW-1:0];

//================================================
//         dcache inst request RDL
//================================================
assign stb_entry_rdl_req_x       = stb_cur_rdl & lfb_xx_idle;
assign stb_entry_dirty_x         = stb_entry_dirty;

//================================================
//          dependency check
//================================================
// &Force("bus","dc_xx_addr",31,0); @333
assign stb_entry_dw = stb_entry_size[1:0] == 2'b11;
assign stb_bytes_vld_extend[7:0] = stb_entry_addr[2] ? {stb_entry_bytes_vld[3:0], 4'b0000}
                                                     : {{4{stb_entry_dw}},stb_entry_bytes_vld[3:0]};

assign stb_vld = !stb_cur_idle; 
assign dc_hit_stb_line  = (dc_xx_addr[31:5] == stb_entry_addr[31:5]) &
                          stb_vld;
assign dc_hit_stb_dword = (dc_xx_addr[4:3] == stb_entry_addr[4:3]);

assign dc_hit_stb_addr       = dc_hit_stb_line & dc_hit_stb_dword;
assign dc_hit_stb_bytes_full = (dc_xx_bytes_vld[7:0] == stb_bytes_vld_extend[7:0]);
assign dc_hit_stb_bytes      = |(dc_xx_bytes_vld[7:0] & stb_bytes_vld_extend[7:0]);

assign stb_entry_dca_inst = stb_cur_rdl | stb_cur_wrdl;

assign dc_hit_stb_addr_x = dc_hit_stb_addr & stb_src1_depd;
assign dc_hit_stb_full_x = dc_hit_stb_addr & dc_hit_stb_bytes_full;
assign dc_hit_stb_part_x = dc_hit_stb_addr & dc_hit_stb_bytes & !dc_hit_stb_bytes_full;
assign dc_hit_stb_dca_x  = dc_hit_stb_line & stb_entry_dca_inst;

assign dc_hit_stb_index_x = (dc_xx_addr[D_TAG_INDEX_LEN+4:5] == stb_entry_addr[D_TAG_INDEX_LEN+4:5]) &
                             stb_vld;

assign stb_entry_vld_dp_x = stb_vld;

//================================================
//      ICG
//================================================
assign stb_dp_clk_en = stb_create_en_gate_x | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_stb_dp_gated_clk"); @363
gated_clk_cell  x_pa_lsu_stb_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (stb_dp_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (stb_dp_clk_en     ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @364
//          .external_en (1'b0), @365
//          .global_en   (1'b1), @366
//          .module_en     (cp0_lsu_icg_en     ), @367
//          .local_en    (stb_dp_clk_en), @368
//          .clk_out     (stb_dp_clk)); @369

assign stb_wdata_clk_en = stb_create_en_gate_x | stb_fwd_vld | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_stb_wdata_gated_clk"); @372
gated_clk_cell  x_pa_lsu_stb_wdata_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (stb_wdata_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (stb_wdata_clk_en  ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @373
//          .external_en (1'b0), @374
//          .global_en   (1'b1), @375
//          .module_en     (cp0_lsu_icg_en     ), @376
//          .local_en    (stb_wdata_clk_en), @377
//          .clk_out     (stb_wdata_clk)); @378

assign stb_entryx_dbginfo[10:0] = {stb_entry_src1_reg[4:0], 
                                   stb_entry_fls, 
                                   stb_src1_depd, 
                                   stb_cur_state[3:0]};

// &ModuleEnd; @385
endmodule



