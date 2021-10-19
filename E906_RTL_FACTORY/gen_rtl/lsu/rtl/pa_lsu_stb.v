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
module pa_lsu_stb(
  arb_stb_xx_grant,
  cp0_lsu_dcache_wb,
  cp0_lsu_icg_en,
  cpurst_b,
  dahbif_stb_acc_ecc,
  dahbif_stb_cmplt,
  dahbif_stb_grant,
  dahbif_stb_grant_2,
  dc_stb_addr,
  dc_stb_attr,
  dc_stb_bytes_vld,
  dc_stb_cache_hit,
  dc_stb_create_en,
  dc_stb_create_en_gate,
  dc_stb_data,
  dc_stb_dcache_dirty,
  dc_stb_dcache_inst,
  dc_stb_dcache_type,
  dc_stb_dcache_way,
  dc_stb_fls,
  dc_stb_lock_trans,
  dc_stb_sc_inst,
  dc_stb_shift,
  dc_stb_size,
  dc_stb_split_first,
  dc_stb_src1_depd,
  dc_stb_src1_reg,
  dc_stb_wait_lfb,
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
  rdl_stb_cmplt_id,
  rdl_stb_dca_cmplt,
  rdl_stb_dca_grant,
  rtu_lsu_fgpr_wb_data,
  rtu_lsu_fgpr_wb_reg,
  rtu_lsu_fgpr_wb_vld,
  rtu_yy_xx_async_flush,
  stb_arb_data_bank,
  stb_arb_data_din,
  stb_arb_data_idx,
  stb_arb_data_req,
  stb_arb_data_way,
  stb_arb_data_wen,
  stb_arb_dcache_sel,
  stb_arb_dirty_din,
  stb_arb_dirty_idx,
  stb_arb_dirty_req,
  stb_arb_dirty_wen,
  stb_dahbif_addr,
  stb_dahbif_data,
  stb_dahbif_lock,
  stb_dahbif_prot,
  stb_dahbif_req,
  stb_dahbif_sc_inst,
  stb_dahbif_size,
  stb_dbginfo,
  stb_dc_async_expt,
  stb_dc_busy,
  stb_dc_full,
  stb_dc_hit_addr,
  stb_dc_hit_dca,
  stb_dc_hit_idx,
  stb_dc_ld_data,
  stb_dc_ld_fwd_vld,
  stb_dc_mtval,
  stb_dc_multi_or_part_hit,
  stb_dc_pop_en,
  stb_idle,
  stb_rdl_addr,
  stb_rdl_dca_type,
  stb_rdl_dirty,
  stb_rdl_id,
  stb_rdl_start,
  stb_rdl_way
);

// &Ports; @21
input           arb_stb_xx_grant;        
input           cp0_lsu_dcache_wb;       
input           cp0_lsu_icg_en;          
input           cpurst_b;                
input           dahbif_stb_acc_ecc;      
input           dahbif_stb_cmplt;        
input           dahbif_stb_grant;        
input           dahbif_stb_grant_2;      
input   [31:0]  dc_stb_addr;             
input   [2 :0]  dc_stb_attr;             
input   [3 :0]  dc_stb_bytes_vld;        
input           dc_stb_cache_hit;        
input           dc_stb_create_en;        
input           dc_stb_create_en_gate;   
input   [31:0]  dc_stb_data;             
input           dc_stb_dcache_dirty;     
input           dc_stb_dcache_inst;      
input   [1 :0]  dc_stb_dcache_type;      
input           dc_stb_dcache_way;       
input           dc_stb_fls;              
input           dc_stb_lock_trans;       
input           dc_stb_sc_inst;          
input   [2 :0]  dc_stb_shift;            
input   [1 :0]  dc_stb_size;             
input           dc_stb_split_first;      
input           dc_stb_src1_depd;        
input   [4 :0]  dc_stb_src1_reg;         
input           dc_stb_wait_lfb;         
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
input   [1 :0]  rdl_stb_cmplt_id;        
input           rdl_stb_dca_cmplt;       
input           rdl_stb_dca_grant;       
input   [31:0]  rtu_lsu_fgpr_wb_data;    
input   [4 :0]  rtu_lsu_fgpr_wb_reg;     
input           rtu_lsu_fgpr_wb_vld;     
input           rtu_yy_xx_async_flush;   
output  [1 :0]  stb_arb_data_bank;       
output  [63:0]  stb_arb_data_din;        
output  [11:0]  stb_arb_data_idx;        
output          stb_arb_data_req;        
output  [1 :0]  stb_arb_data_way;        
output  [3 :0]  stb_arb_data_wen;        
output          stb_arb_dcache_sel;      
output  [2 :0]  stb_arb_dirty_din;       
output  [9 :0]  stb_arb_dirty_idx;       
output          stb_arb_dirty_req;       
output  [2 :0]  stb_arb_dirty_wen;       
output  [31:0]  stb_dahbif_addr;         
output  [31:0]  stb_dahbif_data;         
output          stb_dahbif_lock;         
output  [3 :0]  stb_dahbif_prot;         
output          stb_dahbif_req;          
output          stb_dahbif_sc_inst;      
output  [1 :0]  stb_dahbif_size;         
output  [23:0]  stb_dbginfo;             
output          stb_dc_async_expt;       
output          stb_dc_busy;             
output          stb_dc_full;             
output          stb_dc_hit_addr;         
output          stb_dc_hit_dca;          
output          stb_dc_hit_idx;          
output  [31:0]  stb_dc_ld_data;          
output          stb_dc_ld_fwd_vld;       
output  [31:0]  stb_dc_mtval;            
output          stb_dc_multi_or_part_hit; 
output          stb_dc_pop_en;           
output          stb_idle;                
output  [26:0]  stb_rdl_addr;            
output  [1 :0]  stb_rdl_dca_type;        
output          stb_rdl_dirty;           
output  [1 :0]  stb_rdl_id;              
output          stb_rdl_start;           
output          stb_rdl_way;             

// &Regs; @22
reg     [1 :0]  biu_wdata_sel;           
reg     [1 :0]  bytes_vld_decode;        
reg             data_last;               
reg             req_burst_vld;           
reg             req_cnt;                 
reg             stb_create_ptr;          
reg     [1 :0]  wb_cur_state;            
reg     [1 :0]  wb_next_state;           
reg     [1 :0]  wb_req_sel;              

// &Wires; @23
wire            arb_stb_xx_grant;        
wire    [1 :0]  biu_sel;                 
wire            cp0_lsu_dcache_wb;       
wire            cp0_lsu_icg_en;          
wire            cpurst_b;                
wire            dahbif_stb_acc_ecc;      
wire            dahbif_stb_cmplt;        
wire            dahbif_stb_grant;        
wire            dahbif_stb_grant_2;      
wire    [11:0]  data_index;              
wire    [1 :0]  dc_hit_stb_addr;         
wire    [1 :0]  dc_hit_stb_dca;          
wire    [1 :0]  dc_hit_stb_full;         
wire    [1 :0]  dc_hit_stb_index;        
wire    [1 :0]  dc_hit_stb_part;         
wire    [31:0]  dc_stb_addr;             
wire    [2 :0]  dc_stb_attr;             
wire    [3 :0]  dc_stb_bytes_vld;        
wire            dc_stb_cache_hit;        
wire            dc_stb_create_en;        
wire            dc_stb_create_en_gate;   
wire    [31:0]  dc_stb_data;             
wire            dc_stb_dcache_dirty;     
wire            dc_stb_dcache_inst;      
wire    [1 :0]  dc_stb_dcache_type;      
wire            dc_stb_dcache_way;       
wire            dc_stb_fls;              
wire            dc_stb_lock_trans;       
wire            dc_stb_sc_inst;          
wire    [2 :0]  dc_stb_shift;            
wire    [1 :0]  dc_stb_size;             
wire            dc_stb_split_first;      
wire            dc_stb_src1_depd;        
wire    [4 :0]  dc_stb_src1_reg;         
wire            dc_stb_wait_lfb;         
wire    [31:0]  dc_xx_addr;              
wire    [7 :0]  dc_xx_bytes_vld;         
wire    [1 :0]  dca_sel;                 
wire            forever_cpuclk;          
wire            ifu_lsu_warm_up;         
wire            lfb_stb_done;            
wire            lfb_stb_err;             
wire            lfb_stb_fifo;            
wire            lfb_stb_fifo_update;     
wire            lfb_xx_idle;             
wire            pad_yy_icg_scan_en;      
wire    [1 :0]  rdl_sel;                 
wire    [1 :0]  rdl_stb_cmplt_id;        
wire            rdl_stb_dca_cmplt;       
wire            rdl_stb_dca_grant;       
wire            req_done;                
wire    [31:0]  rtu_lsu_fgpr_wb_data;    
wire    [4 :0]  rtu_lsu_fgpr_wb_reg;     
wire            rtu_lsu_fgpr_wb_vld;     
wire            rtu_yy_xx_async_flush;   
wire    [2 :0]  shift_from_bytes;        
wire    [31:0]  stb_arb_data;            
wire    [1 :0]  stb_arb_data_bank;       
wire    [63:0]  stb_arb_data_din;        
wire    [11:0]  stb_arb_data_idx;        
wire            stb_arb_data_req;        
wire    [1 :0]  stb_arb_data_way;        
wire    [3 :0]  stb_arb_data_wen;        
wire            stb_arb_dcache_sel;      
wire    [2 :0]  stb_arb_dirty_din;       
wire    [9 :0]  stb_arb_dirty_idx;       
wire            stb_arb_dirty_req;       
wire    [2 :0]  stb_arb_dirty_wen;       
wire            stb_biu_req_vld;         
wire    [1 :0]  stb_biu_sel;             
wire            stb_clk;                 
wire            stb_clk_en;              
wire    [31:0]  stb_create_addr;         
wire            stb_create_age;          
wire    [2 :0]  stb_create_attr;         
wire    [3 :0]  stb_create_bytes_vld;    
wire    [31:0]  stb_create_data;         
wire            stb_create_dca_inst;     
wire    [1 :0]  stb_create_dca_type;     
wire            stb_create_dirty;        
wire    [1 :0]  stb_create_en;           
wire    [1 :0]  stb_create_en_gate;      
wire            stb_create_fls;          
wire            stb_create_lock;         
wire            stb_create_sc_inst;      
wire    [3 :0]  stb_create_shift;        
wire    [2 :0]  stb_create_shift_raw;    
wire    [1 :0]  stb_create_size;         
wire            stb_create_split_first;  
wire            stb_create_src1_depd;    
wire    [4 :0]  stb_create_src1_reg;     
wire            stb_create_wait_lfb;     
wire            stb_create_way;          
wire            stb_create_wt_ca;        
wire    [31:0]  stb_dahbif_addr;         
wire    [31:0]  stb_dahbif_data;         
wire            stb_dahbif_lock;         
wire    [3 :0]  stb_dahbif_prot;         
wire            stb_dahbif_req;          
wire            stb_dahbif_sc_inst;      
wire    [1 :0]  stb_dahbif_size;         
wire    [23:0]  stb_dbginfo;             
wire            stb_dc_async_expt;       
wire            stb_dc_busy;             
wire            stb_dc_full;             
wire            stb_dc_hit_addr;         
wire            stb_dc_hit_dca;          
wire            stb_dc_hit_idx;          
wire    [31:0]  stb_dc_ld_data;          
wire            stb_dc_ld_fwd_vld;       
wire    [31:0]  stb_dc_mtval;            
wire            stb_dc_multi_or_part_hit; 
wire            stb_dc_pop_en;           
wire    [1 :0]  stb_dca_done;            
wire    [1 :0]  stb_dca_grant;           
wire            stb_dca_req;             
wire    [31:0]  stb_entry0_addr;         
wire    [1 :0]  stb_entry0_bank;         
wire    [3 :0]  stb_entry0_bytes_vld;    
wire    [31:0]  stb_entry0_data;         
wire    [10:0]  stb_entry0_dbginfo;      
wire    [1 :0]  stb_entry0_dca_type;     
wire    [3 :0]  stb_entry0_prot;         
wire    [1 :0]  stb_entry0_size;         
wire    [31:0]  stb_entry1_addr;         
wire    [1 :0]  stb_entry1_bank;         
wire    [3 :0]  stb_entry1_bytes_vld;    
wire    [31:0]  stb_entry1_data;         
wire    [10:0]  stb_entry1_dbginfo;      
wire    [1 :0]  stb_entry1_dca_type;     
wire    [3 :0]  stb_entry1_prot;         
wire    [1 :0]  stb_entry1_size;         
wire    [1 :0]  stb_entry_age;           
wire    [1 :0]  stb_entry_biu_req;       
wire    [1 :0]  stb_entry_burst;         
wire    [1 :0]  stb_entry_busy;          
wire    [1 :0]  stb_entry_data_vld;      
wire    [1 :0]  stb_entry_dcache_req;    
wire    [1 :0]  stb_entry_dirty;         
wire    [1 :0]  stb_entry_lock;          
wire    [1 :0]  stb_entry_pop_vld;       
wire    [1 :0]  stb_entry_rdl_req;       
wire    [1 :0]  stb_entry_sc_inst;       
wire    [1 :0]  stb_entry_split_first;   
wire    [1 :0]  stb_entry_vld;           
wire    [1 :0]  stb_entry_vld_dp;        
wire    [1 :0]  stb_entry_way;           
wire            stb_hit_way1;            
wire            stb_idle;                
wire            stb_pop_vld;             
wire    [31:0]  stb_pop_wdata;           
wire    [26:0]  stb_rdl_addr;            
wire    [1 :0]  stb_rdl_dca_type;        
wire            stb_rdl_dirty;           
wire    [1 :0]  stb_rdl_id;              
wire            stb_rdl_start;           
wire            stb_rdl_way;             
wire            stb_req_burst;           
wire            stb_split_first;         
wire    [1 :0]  stb_wbus_cmplt;          
wire    [1 :0]  stb_wbus_grant;          
wire    [1 :0]  stb_wca_grant;           
wire            wb_cur_idle;             


parameter STB_ENTRY = 2;
parameter DATAW = `FLEN;

always@(posedge stb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    stb_create_ptr <= 1'b0;
  else if (dc_stb_create_en)
    stb_create_ptr <= ~stb_create_ptr;
end

assign stb_create_en[1:0] = {stb_create_ptr,~stb_create_ptr} & {2{dc_stb_create_en}};
assign stb_create_en_gate[1:0] = {stb_create_ptr,~stb_create_ptr} & {2{dc_stb_create_en_gate}};

assign stb_create_addr[31:0]     = dc_stb_addr[31:0];
assign stb_create_size[1:0]      = dc_stb_size[1:0];
assign stb_create_data[DATAW-1:0]= dc_stb_data[DATAW-1:0];
assign stb_create_dca_inst       = dc_stb_dcache_inst;
assign stb_create_dca_type[1:0]  = dc_stb_dcache_type[1:0];
assign stb_create_bytes_vld[3:0] = dc_stb_bytes_vld[3:0];
assign stb_create_attr[2:0]      = dc_stb_attr[2:0];
assign stb_create_way            = dc_stb_dcache_way;
assign stb_create_dirty          = dc_stb_dcache_dirty;
assign stb_create_lock           = dc_stb_lock_trans;
assign stb_create_sc_inst        = dc_stb_sc_inst;
assign stb_create_src1_depd      = dc_stb_src1_depd; 
assign stb_create_src1_reg[4:0]  = dc_stb_src1_reg[4:0];
assign stb_create_fls            = dc_stb_fls;
assign stb_create_wait_lfb       = dc_stb_wait_lfb;
assign stb_create_wt_ca          = dc_stb_cache_hit;
assign stb_create_age            = |(stb_entry_vld[STB_ENTRY-1:0]);
assign stb_create_split_first    = dc_stb_split_first;

// &CombBeg; @58
always @( dc_stb_bytes_vld[3:0])
begin
  casez(dc_stb_bytes_vld[3:0])
  4'b???1: bytes_vld_decode[1:0] = 2'b00;
  4'b??10: bytes_vld_decode[1:0] = 2'b01;
  4'b?100: bytes_vld_decode[1:0] = 2'b10;
  4'b1000: bytes_vld_decode[1:0] = 2'b11;
  default: bytes_vld_decode[1:0] = 2'b00;
  endcase
// &CombEnd; @66
end

// &Force("bus","dc_stb_shift",2,0); @76
assign shift_from_bytes[2:0] = {1'b0,bytes_vld_decode[1:0]};
assign stb_create_shift_raw[2:0] = {1'b0,shift_from_bytes[1:0]} + (3'b100 - {1'b0,dc_stb_shift[1:0]});
assign stb_create_shift[1:0] = stb_create_shift_raw[1:0];
assign stb_create_shift[3:2] = 2'b0;

assign stb_pop_vld               = |(stb_entry_pop_vld[STB_ENTRY-1:0]);

//================================================
//            depedency to DC
//================================================
// &Force("output", "stb_dc_busy"); @88
assign stb_dc_full               = |({stb_create_ptr,~stb_create_ptr} & stb_entry_busy[1:0]);
assign stb_dc_busy               = |(stb_entry_busy[1:0]);
assign stb_idle                  = !stb_dc_busy;

assign stb_dc_multi_or_part_hit = (|(dc_hit_stb_part[STB_ENTRY-1:0])) | 
                                  (&(dc_hit_stb_full[STB_ENTRY-1:0])) |
                                  (|(dc_hit_stb_full[STB_ENTRY-1:0] & ~stb_entry_data_vld[STB_ENTRY-1:0]));
assign stb_dc_hit_dca           = |(dc_hit_stb_dca[STB_ENTRY-1:0]);
assign stb_dc_hit_idx           = |(dc_hit_stb_index[STB_ENTRY-1:0]);
assign stb_dc_hit_addr          = |(dc_hit_stb_addr[STB_ENTRY-1:0]);
assign stb_dc_pop_en            = stb_pop_vld;
assign stb_dc_ld_fwd_vld        = |(dc_hit_stb_full[STB_ENTRY-1:0] & stb_entry_data_vld[STB_ENTRY-1:0]);
assign stb_dc_ld_data[DATAW-1:0]= {DATAW{dc_hit_stb_full[0]}} & stb_entry0_data[DATAW-1:0] |
                                  {DATAW{dc_hit_stb_full[1]}} & stb_entry1_data[DATAW-1:0];

//================================================
//                dcache request
//================================================
assign dca_sel[1] = stb_entry_dcache_req[1] & (!stb_entry_dcache_req[0] | !stb_entry_age[1]);
assign dca_sel[0] = stb_entry_dcache_req[0] & (!stb_entry_dcache_req[1] | !stb_entry_age[0]);

assign stb_dca_req = |stb_entry_dcache_req[STB_ENTRY-1:0];
assign data_index[11:0] = {12{dca_sel[1]}} & stb_entry1_addr[14:3] |
                          {12{dca_sel[0]}} & stb_entry0_addr[14:3];

assign stb_hit_way1 = |(dca_sel[1:0] & stb_entry_way[1:0]);

assign stb_arb_dirty_req      = stb_dca_req;
assign stb_arb_dirty_wen[2:0] = {1'b0, stb_hit_way1, ~stb_hit_way1};
assign stb_arb_dirty_din[2:0] = 3'b111;
assign stb_arb_dirty_idx[9:0] = data_index[11:2];

assign stb_arb_data_req       = stb_dca_req;
assign stb_arb_data_way[1:0]  = {stb_hit_way1, ~stb_hit_way1};
assign stb_arb_data_idx[11:0] = data_index[11:0];
assign stb_arb_data_wen[3:0]  = {4{dca_sel[1]}} & stb_entry1_bytes_vld[3:0] |
                                {4{dca_sel[0]}} & stb_entry0_bytes_vld[3:0];
assign stb_arb_data[DATAW-1:0]= {DATAW{dca_sel[1]}} & stb_entry1_data[DATAW-1:0] |
                                {DATAW{dca_sel[0]}} & stb_entry0_data[DATAW-1:0];
assign stb_arb_data_bank[1:0] = {2{dca_sel[1]}} & stb_entry1_bank[1:0] |
                                {2{dca_sel[0]}} & stb_entry0_bank[1:0];

assign stb_arb_data_din[63:0] = {stb_arb_data[31:0],stb_arb_data[31:0]};
assign stb_arb_dcache_sel = stb_dca_req;

assign stb_wca_grant[1:0] = dca_sel[1:0] & {2{arb_stb_xx_grant}};

//================================================
//                biu request
//================================================
parameter WB_IDLE = 2'b00;
parameter WB_WFG  = 2'b01;
parameter WB_WFC  = 2'b10;

always@(posedge stb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wb_cur_state[1:0] <= WB_IDLE;
  else if(rtu_yy_xx_async_flush)
    wb_cur_state[1:0] <= WB_IDLE;
  else
    wb_cur_state[1:0] <= wb_next_state[1:0];
end

assign stb_biu_req_vld = |stb_entry_biu_req[1:0];

// &CombBeg; @159
always @( dahbif_stb_grant
       or dahbif_stb_cmplt
       or stb_biu_req_vld
       or dahbif_stb_acc_ecc
       or data_last
       or wb_cur_state[1:0])
begin
  case (wb_cur_state[1:0])
    WB_IDLE: begin
      if (stb_biu_req_vld)
        wb_next_state[1:0] = dahbif_stb_grant ? WB_WFC : WB_WFG;
      else
        wb_next_state[1:0] = WB_IDLE;
    end
    WB_WFG: begin
      if (dahbif_stb_grant)
        wb_next_state[1:0] = WB_WFC;
      else
        wb_next_state[1:0] = WB_WFG;
    end
    WB_WFC: begin
      if (dahbif_stb_cmplt & !dahbif_stb_acc_ecc & data_last & stb_biu_req_vld)
        wb_next_state[1:0] = dahbif_stb_grant ? WB_WFC : WB_WFG;
      else if (dahbif_stb_cmplt & (data_last | dahbif_stb_acc_ecc))
        wb_next_state[1:0] = WB_IDLE;
      else
        wb_next_state[1:0] = WB_WFC;
    end
    default: wb_next_state[1:0] = WB_IDLE;
  endcase
// &CombEnd; @183
end

assign wb_cur_idle    = wb_cur_state[1:0] == WB_IDLE | 
                    wb_cur_state[1:0] == WB_WFC & data_last & req_done; 

assign stb_biu_sel[1] = stb_entry_biu_req[1] & (!stb_entry_biu_req[0] | !stb_entry_age[1]);
assign stb_biu_sel[0] = stb_entry_biu_req[0] & (!stb_entry_biu_req[1] | !stb_entry_age[0]);

always@(posedge stb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wb_req_sel[1:0] <= 2'b0;
  else if (wb_cur_idle & stb_biu_req_vld)
    wb_req_sel[1:0] <= stb_biu_sel[1:0];
end

assign biu_sel[1:0] = wb_cur_idle ? stb_biu_sel[1:0] : wb_req_sel[1:0];

assign stb_dahbif_req        = |(biu_sel[1:0] & stb_entry_biu_req[STB_ENTRY-1:0]);
assign stb_dahbif_addr[31:0] = {32{biu_sel[1]}} & stb_entry1_addr[31:0] |
                               {32{biu_sel[0]}} & stb_entry0_addr[31:0];
assign stb_dahbif_size[1:0]  = {2{biu_sel[1]}} & stb_entry1_size[1:0] |
                               {2{biu_sel[0]}} & stb_entry0_size[1:0];
assign stb_dahbif_prot[3:0]  = {4{biu_sel[1]}} & stb_entry1_prot[3:0] |
                               {4{biu_sel[0]}} & stb_entry0_prot[3:0];
assign stb_dahbif_lock       = |(biu_sel[1:0] & stb_entry_lock[1:0]);
assign stb_dahbif_sc_inst    = |(biu_sel[1:0] & stb_entry_sc_inst[1:0]);

// &Force("output", "stb_dahbif_req"); @211
//======================================
//    data_last
//======================================
assign stb_req_burst = |(biu_sel[1:0] & stb_entry_burst[1:0]);

always@(posedge stb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    data_last <= 1'b0;
  else if (dahbif_stb_grant)
    data_last <= !stb_req_burst;
  else if (dahbif_stb_cmplt)
    data_last <= 1'b1;
end

always@(posedge stb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    req_cnt <= 1'b0;
  else if (stb_dahbif_req & stb_req_burst)
    req_cnt <= dahbif_stb_grant ? 1'b1 : 1'b0;
  else if (!wb_cur_idle & dahbif_stb_grant_2 & req_burst_vld)
    req_cnt <= ~req_cnt;
end

assign req_done = !req_burst_vld | !req_cnt;

always@(posedge stb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    req_burst_vld <= 1'b0;
  else if (dahbif_stb_grant)
    req_burst_vld <= stb_req_burst;
end

always@(posedge stb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    biu_wdata_sel[1:0] <= 2'b00;
  else if (dahbif_stb_grant)
    biu_wdata_sel[1:0] <= biu_sel[1:0];
end

assign stb_pop_wdata[DATAW-1:0] = {DATAW{biu_wdata_sel[1]}} & stb_entry1_data[DATAW-1:0] |
                                  {DATAW{biu_wdata_sel[0]}} & stb_entry0_data[DATAW-1:0];  

assign stb_dahbif_data[31:0] = stb_pop_wdata[31:0];

//======================================
//   grant and cmplt to STB
//======================================
assign stb_wbus_grant[1:0]   = biu_sel[1:0] & {2{dahbif_stb_grant}};
assign stb_wbus_cmplt[1:0]   = biu_wdata_sel[1:0] & {2{dahbif_stb_cmplt & (data_last | dahbif_stb_acc_ecc)}};

assign stb_dc_async_expt     = dahbif_stb_cmplt & dahbif_stb_acc_ecc & stb_split_first;
assign stb_split_first       = |(biu_wdata_sel[1:0] & stb_entry_split_first[1:0]);
assign stb_dc_mtval[31:0]    = {32{biu_wdata_sel[1]}} & stb_entry1_addr[31:0] |
                               {32{biu_wdata_sel[0]}} & stb_entry0_addr[31:0];

//================================================
//          request RDL
//================================================
assign rdl_sel[1] = stb_entry_rdl_req[1] & (!stb_entry_rdl_req[0] | !stb_entry_age[1]);
assign rdl_sel[0] = stb_entry_rdl_req[0] & (!stb_entry_rdl_req[1] | !stb_entry_age[0]);

assign stb_rdl_start      = |stb_entry_rdl_req[1:0];
assign stb_rdl_addr[26:0] = {27{rdl_sel[1]}} & stb_entry1_addr[31:5] |
                            {27{rdl_sel[0]}} & stb_entry0_addr[31:5];
assign stb_rdl_dirty      = |(rdl_sel[1:0] & stb_entry_dirty[1:0]);
assign stb_rdl_way        = |(rdl_sel[1:0] & stb_entry_way[1:0]);
assign stb_rdl_id[1:0]    = rdl_sel[1:0];
assign stb_rdl_dca_type[1:0] = {2{rdl_sel[1]}} & stb_entry1_dca_type[1:0] |
                               {2{rdl_sel[0]}} & stb_entry0_dca_type[1:0];

assign stb_dca_grant[1:0] = {2{rdl_stb_dca_grant}} & rdl_sel[1:0];
assign stb_dca_done[1:0]  = {2{rdl_stb_dca_cmplt}} & rdl_stb_cmplt_id[1:0];

// &ConnRule(s/_x$/[0]/); @297
// &ConnRule(s/entryx/entry0/); @298
// &Instance("pa_lsu_stb_entry","x_pa_lsu_stb_entry_0"); @299
pa_lsu_stb_entry  x_pa_lsu_stb_entry_0 (
  .cp0_lsu_dcache_wb        (cp0_lsu_dcache_wb       ),
  .cp0_lsu_icg_en           (cp0_lsu_icg_en          ),
  .cpurst_b                 (cpurst_b                ),
  .dc_hit_stb_addr_x        (dc_hit_stb_addr[0]      ),
  .dc_hit_stb_dca_x         (dc_hit_stb_dca[0]       ),
  .dc_hit_stb_full_x        (dc_hit_stb_full[0]      ),
  .dc_hit_stb_index_x       (dc_hit_stb_index[0]     ),
  .dc_hit_stb_part_x        (dc_hit_stb_part[0]      ),
  .dc_xx_addr               (dc_xx_addr              ),
  .dc_xx_bytes_vld          (dc_xx_bytes_vld         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .ifu_lsu_warm_up          (ifu_lsu_warm_up         ),
  .lfb_stb_done             (lfb_stb_done            ),
  .lfb_stb_err              (lfb_stb_err             ),
  .lfb_stb_fifo             (lfb_stb_fifo            ),
  .lfb_stb_fifo_update      (lfb_stb_fifo_update     ),
  .lfb_xx_idle              (lfb_xx_idle             ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .rtu_lsu_fgpr_wb_data     (rtu_lsu_fgpr_wb_data    ),
  .rtu_lsu_fgpr_wb_reg      (rtu_lsu_fgpr_wb_reg     ),
  .rtu_lsu_fgpr_wb_vld      (rtu_lsu_fgpr_wb_vld     ),
  .rtu_yy_xx_async_flush    (rtu_yy_xx_async_flush   ),
  .stb_clk                  (stb_clk                 ),
  .stb_create_addr          (stb_create_addr         ),
  .stb_create_age           (stb_create_age          ),
  .stb_create_attr          (stb_create_attr         ),
  .stb_create_bytes_vld     (stb_create_bytes_vld    ),
  .stb_create_data          (stb_create_data         ),
  .stb_create_dca_inst      (stb_create_dca_inst     ),
  .stb_create_dca_type      (stb_create_dca_type     ),
  .stb_create_dirty         (stb_create_dirty        ),
  .stb_create_en_gate_x     (stb_create_en_gate[0]   ),
  .stb_create_en_x          (stb_create_en[0]        ),
  .stb_create_fls           (stb_create_fls          ),
  .stb_create_lock          (stb_create_lock         ),
  .stb_create_sc_inst       (stb_create_sc_inst      ),
  .stb_create_shift         (stb_create_shift        ),
  .stb_create_size          (stb_create_size         ),
  .stb_create_split_first   (stb_create_split_first  ),
  .stb_create_src1_depd     (stb_create_src1_depd    ),
  .stb_create_src1_reg      (stb_create_src1_reg     ),
  .stb_create_wait_lfb      (stb_create_wait_lfb     ),
  .stb_create_way           (stb_create_way          ),
  .stb_create_wt_ca         (stb_create_wt_ca        ),
  .stb_dca_done_x           (stb_dca_done[0]         ),
  .stb_dca_grant_x          (stb_dca_grant[0]        ),
  .stb_entry_age_x          (stb_entry_age[0]        ),
  .stb_entry_biu_req_x      (stb_entry_biu_req[0]    ),
  .stb_entry_burst_x        (stb_entry_burst[0]      ),
  .stb_entry_busy_x         (stb_entry_busy[0]       ),
  .stb_entry_data_vld_x     (stb_entry_data_vld[0]   ),
  .stb_entry_dcache_req_x   (stb_entry_dcache_req[0] ),
  .stb_entry_dirty_x        (stb_entry_dirty[0]      ),
  .stb_entry_lock_x         (stb_entry_lock[0]       ),
  .stb_entry_pop_vld_x      (stb_entry_pop_vld[0]    ),
  .stb_entry_rdl_req_x      (stb_entry_rdl_req[0]    ),
  .stb_entry_sc_inst_x      (stb_entry_sc_inst[0]    ),
  .stb_entry_split_first_x  (stb_entry_split_first[0]),
  .stb_entry_vld_dp_x       (stb_entry_vld_dp[0]     ),
  .stb_entry_vld_x          (stb_entry_vld[0]        ),
  .stb_entry_way_x          (stb_entry_way[0]        ),
  .stb_entryx_addr          (stb_entry0_addr         ),
  .stb_entryx_bank          (stb_entry0_bank         ),
  .stb_entryx_bytes_vld     (stb_entry0_bytes_vld    ),
  .stb_entryx_data          (stb_entry0_data         ),
  .stb_entryx_dbginfo       (stb_entry0_dbginfo      ),
  .stb_entryx_dca_type      (stb_entry0_dca_type     ),
  .stb_entryx_prot          (stb_entry0_prot         ),
  .stb_entryx_size          (stb_entry0_size         ),
  .stb_pop_vld              (stb_pop_vld             ),
  .stb_wbus_cmplt_x         (stb_wbus_cmplt[0]       ),
  .stb_wbus_grant_x         (stb_wbus_grant[0]       ),
  .stb_wca_grant_x          (stb_wca_grant[0]        )
);


// &ConnRule(s/_x$/[1]/); @301
// &ConnRule(s/entryx/entry1/); @302
// &Instance("pa_lsu_stb_entry","x_pa_lsu_stb_entry_1"); @303
pa_lsu_stb_entry  x_pa_lsu_stb_entry_1 (
  .cp0_lsu_dcache_wb        (cp0_lsu_dcache_wb       ),
  .cp0_lsu_icg_en           (cp0_lsu_icg_en          ),
  .cpurst_b                 (cpurst_b                ),
  .dc_hit_stb_addr_x        (dc_hit_stb_addr[1]      ),
  .dc_hit_stb_dca_x         (dc_hit_stb_dca[1]       ),
  .dc_hit_stb_full_x        (dc_hit_stb_full[1]      ),
  .dc_hit_stb_index_x       (dc_hit_stb_index[1]     ),
  .dc_hit_stb_part_x        (dc_hit_stb_part[1]      ),
  .dc_xx_addr               (dc_xx_addr              ),
  .dc_xx_bytes_vld          (dc_xx_bytes_vld         ),
  .forever_cpuclk           (forever_cpuclk          ),
  .ifu_lsu_warm_up          (ifu_lsu_warm_up         ),
  .lfb_stb_done             (lfb_stb_done            ),
  .lfb_stb_err              (lfb_stb_err             ),
  .lfb_stb_fifo             (lfb_stb_fifo            ),
  .lfb_stb_fifo_update      (lfb_stb_fifo_update     ),
  .lfb_xx_idle              (lfb_xx_idle             ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .rtu_lsu_fgpr_wb_data     (rtu_lsu_fgpr_wb_data    ),
  .rtu_lsu_fgpr_wb_reg      (rtu_lsu_fgpr_wb_reg     ),
  .rtu_lsu_fgpr_wb_vld      (rtu_lsu_fgpr_wb_vld     ),
  .rtu_yy_xx_async_flush    (rtu_yy_xx_async_flush   ),
  .stb_clk                  (stb_clk                 ),
  .stb_create_addr          (stb_create_addr         ),
  .stb_create_age           (stb_create_age          ),
  .stb_create_attr          (stb_create_attr         ),
  .stb_create_bytes_vld     (stb_create_bytes_vld    ),
  .stb_create_data          (stb_create_data         ),
  .stb_create_dca_inst      (stb_create_dca_inst     ),
  .stb_create_dca_type      (stb_create_dca_type     ),
  .stb_create_dirty         (stb_create_dirty        ),
  .stb_create_en_gate_x     (stb_create_en_gate[1]   ),
  .stb_create_en_x          (stb_create_en[1]        ),
  .stb_create_fls           (stb_create_fls          ),
  .stb_create_lock          (stb_create_lock         ),
  .stb_create_sc_inst       (stb_create_sc_inst      ),
  .stb_create_shift         (stb_create_shift        ),
  .stb_create_size          (stb_create_size         ),
  .stb_create_split_first   (stb_create_split_first  ),
  .stb_create_src1_depd     (stb_create_src1_depd    ),
  .stb_create_src1_reg      (stb_create_src1_reg     ),
  .stb_create_wait_lfb      (stb_create_wait_lfb     ),
  .stb_create_way           (stb_create_way          ),
  .stb_create_wt_ca         (stb_create_wt_ca        ),
  .stb_dca_done_x           (stb_dca_done[1]         ),
  .stb_dca_grant_x          (stb_dca_grant[1]        ),
  .stb_entry_age_x          (stb_entry_age[1]        ),
  .stb_entry_biu_req_x      (stb_entry_biu_req[1]    ),
  .stb_entry_burst_x        (stb_entry_burst[1]      ),
  .stb_entry_busy_x         (stb_entry_busy[1]       ),
  .stb_entry_data_vld_x     (stb_entry_data_vld[1]   ),
  .stb_entry_dcache_req_x   (stb_entry_dcache_req[1] ),
  .stb_entry_dirty_x        (stb_entry_dirty[1]      ),
  .stb_entry_lock_x         (stb_entry_lock[1]       ),
  .stb_entry_pop_vld_x      (stb_entry_pop_vld[1]    ),
  .stb_entry_rdl_req_x      (stb_entry_rdl_req[1]    ),
  .stb_entry_sc_inst_x      (stb_entry_sc_inst[1]    ),
  .stb_entry_split_first_x  (stb_entry_split_first[1]),
  .stb_entry_vld_dp_x       (stb_entry_vld_dp[1]     ),
  .stb_entry_vld_x          (stb_entry_vld[1]        ),
  .stb_entry_way_x          (stb_entry_way[1]        ),
  .stb_entryx_addr          (stb_entry1_addr         ),
  .stb_entryx_bank          (stb_entry1_bank         ),
  .stb_entryx_bytes_vld     (stb_entry1_bytes_vld    ),
  .stb_entryx_data          (stb_entry1_data         ),
  .stb_entryx_dbginfo       (stb_entry1_dbginfo      ),
  .stb_entryx_dca_type      (stb_entry1_dca_type     ),
  .stb_entryx_prot          (stb_entry1_prot         ),
  .stb_entryx_size          (stb_entry1_size         ),
  .stb_pop_vld              (stb_pop_vld             ),
  .stb_wbus_cmplt_x         (stb_wbus_cmplt[1]       ),
  .stb_wbus_grant_x         (stb_wbus_grant[1]       ),
  .stb_wca_grant_x          (stb_wca_grant[1]        )
);


assign stb_clk_en = dc_stb_create_en_gate | stb_entry_vld_dp[0] | stb_entry_vld_dp[1];

// &Instance("gated_clk_cell", "x_pa_lsu_stb_gated_clk"); @307
gated_clk_cell  x_pa_lsu_stb_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (stb_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (stb_clk_en        ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @308
//          .external_en (1'b0), @309
//          .global_en   (1'b1), @310
//          .module_en     (cp0_lsu_icg_en     ), @311
//          .local_en    (stb_clk_en), @312
//          .clk_out     (stb_clk)); @313

assign stb_dbginfo[23:0] = {stb_entry1_dbginfo[10:0],stb_entry0_dbginfo[10:0],wb_cur_state[1:0]};

// &ModuleEnd; @317
endmodule


