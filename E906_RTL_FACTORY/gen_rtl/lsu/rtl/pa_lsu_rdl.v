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
module pa_lsu_rdl(
  arb_rdl_grant,
  cp0_lsu_icg_en,
  cpurst_b,
  dc_rdl_fifo,
  dc_rdl_way0_data,
  dc_rdl_way0_dirty,
  dc_rdl_way0_tag,
  dc_rdl_way0_vld,
  dc_rdl_way1_data,
  dc_rdl_way1_dirty,
  dc_rdl_way1_tag,
  dc_rdl_way1_vld,
  forever_cpuclk,
  ifu_lsu_warm_up,
  lfb_rdl_index,
  lfb_rdl_start,
  lfb_rdl_start_gate,
  pad_yy_icg_scan_en,
  rdl_arb_data_bank,
  rdl_arb_data_din,
  rdl_arb_data_idx,
  rdl_arb_data_req,
  rdl_arb_data_way,
  rdl_arb_data_wen,
  rdl_arb_dcache_sel,
  rdl_arb_dirty_din,
  rdl_arb_dirty_idx,
  rdl_arb_dirty_req,
  rdl_arb_dirty_wen,
  rdl_arb_tag_din,
  rdl_arb_tag_idx,
  rdl_arb_tag_req,
  rdl_arb_tag_wen,
  rdl_dbginfo,
  rdl_lfb_done,
  rdl_lfb_fifo,
  rdl_lfb_fifo_save,
  rdl_lfb_grant,
  rdl_stb_cmplt_id,
  rdl_stb_dca_cmplt,
  rdl_stb_dca_grant,
  rdl_vb_addr,
  rdl_vb_create_en,
  rdl_vb_data,
  rdl_vb_data_cnt,
  rdl_vb_data_create,
  rdl_vb_line_dirty,
  rdl_vb_warm_up,
  rtu_yy_xx_async_flush,
  stb_rdl_addr,
  stb_rdl_dca_type,
  stb_rdl_dirty,
  stb_rdl_id,
  stb_rdl_start,
  stb_rdl_way,
  vb_rdl_grant
);

// &Ports; @21
input           arb_rdl_grant;        
input           cp0_lsu_icg_en;       
input           cpurst_b;             
input           dc_rdl_fifo;          
input   [63:0]  dc_rdl_way0_data;     
input           dc_rdl_way0_dirty;    
input   [21:0]  dc_rdl_way0_tag;      
input           dc_rdl_way0_vld;      
input   [63:0]  dc_rdl_way1_data;     
input           dc_rdl_way1_dirty;    
input   [21:0]  dc_rdl_way1_tag;      
input           dc_rdl_way1_vld;      
input           forever_cpuclk;       
input           ifu_lsu_warm_up;      
input   [9 :0]  lfb_rdl_index;        
input           lfb_rdl_start;        
input           lfb_rdl_start_gate;   
input           pad_yy_icg_scan_en;   
input           rtu_yy_xx_async_flush; 
input   [26:0]  stb_rdl_addr;         
input   [1 :0]  stb_rdl_dca_type;     
input           stb_rdl_dirty;        
input   [1 :0]  stb_rdl_id;           
input           stb_rdl_start;        
input           stb_rdl_way;          
input           vb_rdl_grant;         
output  [1 :0]  rdl_arb_data_bank;    
output  [63:0]  rdl_arb_data_din;     
output  [11:0]  rdl_arb_data_idx;     
output          rdl_arb_data_req;     
output  [1 :0]  rdl_arb_data_way;     
output  [3 :0]  rdl_arb_data_wen;     
output          rdl_arb_dcache_sel;   
output  [2 :0]  rdl_arb_dirty_din;    
output  [9 :0]  rdl_arb_dirty_idx;    
output          rdl_arb_dirty_req;    
output  [2 :0]  rdl_arb_dirty_wen;    
output  [22:0]  rdl_arb_tag_din;      
output  [9 :0]  rdl_arb_tag_idx;      
output          rdl_arb_tag_req;      
output  [1 :0]  rdl_arb_tag_wen;      
output  [2 :0]  rdl_dbginfo;          
output          rdl_lfb_done;         
output          rdl_lfb_fifo;         
output          rdl_lfb_fifo_save;    
output          rdl_lfb_grant;        
output  [1 :0]  rdl_stb_cmplt_id;     
output          rdl_stb_dca_cmplt;    
output          rdl_stb_dca_grant;    
output  [26:0]  rdl_vb_addr;          
output          rdl_vb_create_en;     
output  [63:0]  rdl_vb_data;          
output  [1 :0]  rdl_vb_data_cnt;      
output          rdl_vb_data_create;   
output          rdl_vb_line_dirty;    
output          rdl_vb_warm_up;       

// &Regs; @22
reg     [1 :0]  dca_id;               
reg             dca_sel;              
reg     [1 :0]  dca_type;             
reg             pf_cache_hit_ff;      
reg     [1 :0]  rdl_cnt;              
reg     [1 :0]  rdl_cnt_f;            
reg     [2 :0]  rdl_cur_state;        
reg             rdl_data_vld;         
reg     [2 :0]  rdl_next_state;       
reg             replace_dirty;        
reg             replace_fifo;         
reg     [9 :0]  replace_index;        
reg     [21:0]  replace_tag;          
reg             replace_vld;          

// &Wires; @23
wire            arb_rdl_grant;        
wire            cp0_lsu_icg_en;       
wire            cpurst_b;             
wire            data_rd_done;         
wire            dc_rdl_fifo;          
wire    [63:0]  dc_rdl_way0_data;     
wire            dc_rdl_way0_dirty;    
wire    [21:0]  dc_rdl_way0_tag;      
wire            dc_rdl_way0_vld;      
wire    [63:0]  dc_rdl_way1_data;     
wire            dc_rdl_way1_dirty;    
wire    [21:0]  dc_rdl_way1_tag;      
wire            dc_rdl_way1_vld;      
wire            dca_cln;              
wire            dca_inv;              
wire            dirty_clr;            
wire            forever_cpuclk;       
wire            ifu_lsu_warm_up;      
wire    [9 :0]  lfb_rdl_index;        
wire            lfb_rdl_start;        
wire            lfb_rdl_start_gate;   
wire            lfb_tag_wen;          
wire    [63:0]  line_data;            
wire            line_dirty;           
wire    [21:0]  line_tag;             
wire            line_vld;             
wire            pad_yy_icg_scan_en;   
wire            pf_cache_hit;         
wire            rdl_addr_clk;         
wire            rdl_addr_clk_en;      
wire    [1 :0]  rdl_arb_data_bank;    
wire    [63:0]  rdl_arb_data_din;     
wire    [11:0]  rdl_arb_data_idx;     
wire            rdl_arb_data_req;     
wire    [1 :0]  rdl_arb_data_way;     
wire    [3 :0]  rdl_arb_data_wen;     
wire            rdl_arb_dcache_sel;   
wire    [2 :0]  rdl_arb_dirty_din;    
wire    [9 :0]  rdl_arb_dirty_idx;    
wire            rdl_arb_dirty_req;    
wire    [2 :0]  rdl_arb_dirty_wen;    
wire    [22:0]  rdl_arb_tag_din;      
wire    [9 :0]  rdl_arb_tag_idx;      
wire            rdl_arb_tag_req;      
wire    [1 :0]  rdl_arb_tag_wen;      
wire            rdl_cnt_last;         
wire            rdl_cur_check;        
wire            rdl_cur_data;         
wire            rdl_cur_data_grnt;    
wire            rdl_cur_idle;         
wire            rdl_cur_inv;          
wire    [2 :0]  rdl_dbginfo;          
wire            rdl_fsm_clk;          
wire            rdl_fsm_clk_en;       
wire            rdl_lfb_done;         
wire            rdl_lfb_fifo;         
wire            rdl_lfb_fifo_save;    
wire            rdl_lfb_grant;        
wire            rdl_line_inv;         
wire            rdl_line_rd;          
wire            rdl_replace_clk;      
wire            rdl_replace_clk_en;   
wire    [1 :0]  rdl_stb_cmplt_id;     
wire            rdl_stb_dca_cmplt;    
wire            rdl_stb_dca_grant;    
wire    [26:0]  rdl_vb_addr;          
wire            rdl_vb_create_en;     
wire    [63:0]  rdl_vb_data;          
wire    [1 :0]  rdl_vb_data_cnt;      
wire            rdl_vb_data_create;   
wire            rdl_vb_line_dirty;    
wire            rdl_vb_warm_up;       
wire            rtu_yy_xx_async_flush; 
wire    [26:0]  stb_rdl_addr;         
wire    [1 :0]  stb_rdl_dca_type;     
wire            stb_rdl_dirty;        
wire    [1 :0]  stb_rdl_id;           
wire            stb_rdl_start;        
wire    [21:0]  stb_rdl_tag;          
wire            stb_rdl_way;          
wire            tag_inv;              
wire            tag_rd;               
wire            vb_rdl_grant;         


parameter D_DATA_INDEX_LEN = `D_DATA_INDEX_WIDTH;
parameter D_TAG_TAG_LEN    = `D_TAG_TAG_WIDTH;
parameter D_TAG_INDEX_LEN  = `D_TAG_INDEX_WIDTH;

//================================================
//          RDL FSM
//================================================
parameter RDL_IDLE   = 3'b000;
parameter RDL_CHECK  = 3'b001;
parameter RDL_DATA   = 3'b010;
parameter RDL_LAST   = 3'b011;
parameter RDL_TAG_RD = 3'b100;
parameter RDL_TAG_WT = 3'b101;
parameter RDL_INV    = 3'b110;

always@(posedge rdl_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    rdl_cur_state[2:0] <= RDL_IDLE;
  else if (rtu_yy_xx_async_flush)
    rdl_cur_state[2:0] <= RDL_IDLE;
  else
    rdl_cur_state[2:0] <= rdl_next_state[2:0];
end

// &CombBeg; @60
always @( data_rd_done
       or arb_rdl_grant
       or rdl_cur_state[2:0]
       or rdl_line_inv
       or dca_sel
       or vb_rdl_grant
       or rdl_line_rd
       or lfb_rdl_start
       or stb_rdl_start)
begin
  case(rdl_cur_state[2:0])
    RDL_IDLE: begin
      if (stb_rdl_start)
        rdl_next_state[2:0] = RDL_CHECK;
      else if (lfb_rdl_start)
        rdl_next_state[2:0] = RDL_TAG_RD;
      else 
        rdl_next_state[2:0] = RDL_IDLE;
    end
    RDL_TAG_RD: begin
    if (arb_rdl_grant)
      rdl_next_state[2:0] = RDL_TAG_WT;
    else
      rdl_next_state[2:0] = RDL_TAG_RD;
    end
    RDL_TAG_WT: begin
      rdl_next_state[2:0] = RDL_CHECK;
    end
    RDL_CHECK: begin
      if (rdl_line_rd)
        rdl_next_state[2:0] = vb_rdl_grant ? RDL_DATA : RDL_CHECK;
      else if (rdl_line_inv)
        rdl_next_state[2:0] = RDL_INV;
      else
        rdl_next_state[2:0] = RDL_IDLE;
    end
    RDL_DATA:begin
      if (data_rd_done)
        rdl_next_state[2:0] = dca_sel ? RDL_INV : RDL_LAST;
      else
        rdl_next_state[2:0] = RDL_DATA;
    end
    RDL_INV:begin 
    if (arb_rdl_grant)
      rdl_next_state[2:0] = RDL_IDLE;
    else
      rdl_next_state[2:0] = RDL_INV;
    end
    RDL_LAST:
      rdl_next_state[2:0] = RDL_IDLE;
    default: rdl_next_state[2:0] = RDL_IDLE;
  endcase
// &CombEnd; @103
end

assign rdl_cur_idle  = rdl_cur_state[2:0] == RDL_IDLE;
assign rdl_cur_data  = rdl_cur_state[2:0] == RDL_DATA;
assign rdl_cur_check = rdl_cur_state[2:0] == RDL_CHECK;

assign rdl_lfb_grant = !stb_rdl_start & rdl_cur_idle;
assign rdl_lfb_done  = rdl_cur_check & !dca_sel & (!replace_vld | pf_cache_hit_ff) |
                       rdl_cur_data & !dca_sel & data_rd_done;


assign rdl_stb_dca_grant = rdl_cur_idle;
assign rdl_stb_dca_cmplt = (rdl_cur_state[2:0] == RDL_INV) |
                           (rdl_cur_state[2:0] == RDL_CHECK) & dca_sel & !rdl_line_rd & !rdl_line_inv;
assign rdl_stb_cmplt_id[1:0] = dca_id[1:0];

assign rdl_cur_data_grnt = arb_rdl_grant & rdl_cur_data;

always@(posedge rdl_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    rdl_cnt[1:0]   <= 2'b00;
    rdl_cnt_f[1:0] <= 2'b00;
  end
  else if (rdl_cur_data_grnt) begin
    rdl_cnt[1:0]   <= rdl_cnt[1:0] + 2'b01;
    rdl_cnt_f[1:0] <= rdl_cnt[1:0];
  end
end

assign rdl_cnt_last = rdl_cnt[1:0] == 2'b11;
assign data_rd_done = rdl_cnt_last & arb_rdl_grant;

always@(posedge rdl_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    rdl_data_vld <= 1'b0;
  else 
    rdl_data_vld <= rdl_cur_data_grnt;
end

//================================================
//  RDL content
//================================================
//-----------for pfb hit check------------------
// &Force("bus", "lfb_rdl_tag",21,0); @152
assign pf_cache_hit = 1'b0;

assign line_vld        = dc_rdl_fifo  ? dc_rdl_way1_vld   : dc_rdl_way0_vld;
assign line_dirty      = dc_rdl_fifo  ? dc_rdl_way1_dirty : dc_rdl_way0_dirty;
assign line_tag[21:0]  = dc_rdl_fifo  ? dc_rdl_way1_tag[21:0]  : dc_rdl_way0_tag[21:0];
assign line_data[63:0] = replace_fifo ? dc_rdl_way1_data[63:0] : dc_rdl_way0_data[63:0];

assign stb_rdl_tag[21:0] =  {{22-D_TAG_TAG_LEN{1'b0}}, stb_rdl_addr[26:D_TAG_INDEX_LEN]};

always@(posedge rdl_addr_clk)
begin
  if (stb_rdl_start & rdl_cur_idle | ifu_lsu_warm_up) begin
    dca_sel            <= 1'b1;
    dca_type[1:0]      <= stb_rdl_dca_type[1:0];
    dca_id[1:0]        <= stb_rdl_id[1:0];
    replace_index[9:0] <= stb_rdl_addr[9:0];
  end
  else if (lfb_rdl_start & rdl_cur_idle) begin
    dca_sel            <= 1'b0;
    dca_type[1:0]      <= 2'b0;
    dca_id[1:0]        <= 2'b0;
    replace_index[9:0] <= lfb_rdl_index[9:0];
  end
end

assign dca_cln = dca_type[1];
assign dca_inv = dca_type[0];

assign lfb_tag_wen   = rdl_cur_state[2:0] == RDL_TAG_WT;

always@(posedge rdl_replace_clk)
begin
  if (stb_rdl_start & rdl_cur_idle | ifu_lsu_warm_up) begin
    replace_vld       <= 1'b1;
    replace_fifo      <= stb_rdl_way;
    replace_dirty     <= stb_rdl_dirty;
    replace_tag[21:0] <= stb_rdl_tag[21:0];
    pf_cache_hit_ff   <= 1'b0;
  end
  else if (lfb_tag_wen) begin
    replace_vld       <= line_vld;
    replace_fifo      <= dc_rdl_fifo; 
    replace_dirty     <= line_dirty;
    replace_tag[21:0] <= line_tag[21:0];
    pf_cache_hit_ff   <= pf_cache_hit;
  end
end

assign rdl_line_rd = dca_sel & dca_cln & replace_dirty |
                    !dca_sel & replace_vld & !pf_cache_hit_ff;

assign rdl_line_inv = dca_sel & dca_inv & replace_vld;

assign rdl_lfb_fifo_save = lfb_tag_wen;
assign rdl_lfb_fifo      = dc_rdl_fifo;

//================================================
//        request cache
//================================================
// &Force("output", "rdl_arb_tag_wen"); @291

assign rdl_cur_inv = (rdl_cur_state[2:0] == RDL_INV);
assign tag_inv     = rdl_cur_inv & dca_inv;
assign tag_rd      = rdl_cur_state[2:0] == RDL_TAG_RD;
assign dirty_clr   = rdl_cur_inv;

assign rdl_arb_tag_req        = tag_rd | tag_inv;
assign rdl_arb_tag_wen[1:0]   = {2{tag_inv}} & {replace_fifo,~replace_fifo};
assign rdl_arb_tag_din[22:0]  = {1'b0,22'b0};
assign rdl_arb_tag_idx[9:0]   = replace_index[9:0];

assign rdl_arb_dirty_req      = tag_rd | dirty_clr;
assign rdl_arb_dirty_wen[2:0] = {1'b0,{2{dirty_clr}} & {replace_fifo,~replace_fifo}};
assign rdl_arb_dirty_din[2:0] = 3'b0;
assign rdl_arb_dirty_idx[9:0] = replace_index[9:0];
                              
assign rdl_arb_data_req       = rdl_cur_data;
assign rdl_arb_data_way[1:0]  = {replace_fifo,~replace_fifo};
assign rdl_arb_data_bank[1:0] = 2'b11;
assign rdl_arb_data_wen[3:0]  = 4'b0;
assign rdl_arb_data_din[63:0] = 64'b0;
assign rdl_arb_data_idx[11:0] = {replace_index[9:0],rdl_cnt[1:0]};

assign rdl_arb_dcache_sel     = rdl_cur_data | rdl_cur_inv | tag_rd;

//================================================
//        request VB
//================================================

assign rdl_vb_create_en     = rdl_cur_check & rdl_line_rd;
assign rdl_vb_addr[26:0]    = {replace_tag[D_TAG_TAG_LEN-1:0], replace_index[D_TAG_INDEX_LEN-1:0]};
assign rdl_vb_line_dirty    = replace_dirty;
assign rdl_vb_data_create   = rdl_data_vld;
assign rdl_vb_data_cnt[1:0] = rdl_cnt_f[1:0];
assign rdl_vb_data[63:0]    = line_data[63:0];
assign rdl_vb_warm_up       = ifu_lsu_warm_up;

assign rdl_fsm_clk_en = lfb_rdl_start_gate | stb_rdl_start | !(rdl_cur_state[2:0] == RDL_IDLE) | rdl_data_vld;
// &Instance("gated_clk_cell", "x_pa_lsu_rdl_fsm_gated_clk"); @330
gated_clk_cell  x_pa_lsu_rdl_fsm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rdl_fsm_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (rdl_fsm_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @331
//          .external_en (1'b0), @332
//          .global_en   (1'b1), @333
//          .module_en     (cp0_lsu_icg_en     ), @334
//          .local_en    (rdl_fsm_clk_en), @335
//          .clk_out     (rdl_fsm_clk)); @336

assign rdl_addr_clk_en = lfb_rdl_start_gate | stb_rdl_start | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_rdl_addr_gated_clk"); @339
gated_clk_cell  x_pa_lsu_rdl_addr_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rdl_addr_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (rdl_addr_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @340
//          .external_en (1'b0), @341
//          .global_en   (1'b1), @342
//          .module_en     (cp0_lsu_icg_en     ), @343
//          .local_en    (rdl_addr_clk_en), @344
//          .clk_out     (rdl_addr_clk)); @345

assign rdl_replace_clk_en = lfb_tag_wen | stb_rdl_start | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_rdl_replace_gated_clk"); @348
gated_clk_cell  x_pa_lsu_rdl_replace_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rdl_replace_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (rdl_replace_clk_en),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @349
//          .external_en (1'b0), @350
//          .global_en   (1'b1), @351
//          .module_en     (cp0_lsu_icg_en     ), @352
//          .local_en    (rdl_replace_clk_en), @353
//          .clk_out     (rdl_replace_clk)); @354

assign rdl_dbginfo[2:0] = rdl_cur_state[2:0];

// &ModuleEnd; @358
endmodule


