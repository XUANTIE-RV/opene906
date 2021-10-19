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
module pa_lsu_icc(
  arb_icc_data_grant,
  cp0_lsu_icc_addr,
  cp0_lsu_icc_op,
  cp0_lsu_icc_req,
  cp0_lsu_icc_type,
  cp0_lsu_icg_en,
  cpurst_b,
  dc_icc_way0_data,
  dc_icc_way0_dirty,
  dc_icc_way0_tag,
  dc_icc_way1_data,
  dc_icc_way1_dirty,
  dc_icc_way1_tag,
  forever_cpuclk,
  icc_arb_data_bank,
  icc_arb_data_din,
  icc_arb_data_idx,
  icc_arb_data_req,
  icc_arb_data_way,
  icc_arb_data_wen,
  icc_arb_dirty_din,
  icc_arb_dirty_idx,
  icc_arb_dirty_req,
  icc_arb_dirty_wen,
  icc_arb_tag_din,
  icc_arb_tag_idx,
  icc_arb_tag_req,
  icc_arb_tag_wen,
  icc_vb_addr,
  icc_vb_clr_vld,
  icc_vb_create_en,
  icc_vb_data,
  icc_vb_data_cnt,
  icc_vb_data_create,
  icc_vb_line_dirty,
  icc_xx_idle,
  ifu_lsu_warm_up,
  lsu_cp0_icc_done,
  pad_yy_icg_scan_en,
  vb_icc_empty,
  vb_icc_grant
);

// &Ports; @21
input           arb_icc_data_grant; 
input   [31:0]  cp0_lsu_icc_addr;  
input   [1 :0]  cp0_lsu_icc_op;    
input           cp0_lsu_icc_req;   
input   [1 :0]  cp0_lsu_icc_type;  
input           cp0_lsu_icg_en;    
input           cpurst_b;          
input   [63:0]  dc_icc_way0_data;  
input           dc_icc_way0_dirty; 
input   [21:0]  dc_icc_way0_tag;   
input   [63:0]  dc_icc_way1_data;  
input           dc_icc_way1_dirty; 
input   [21:0]  dc_icc_way1_tag;   
input           forever_cpuclk;    
input           ifu_lsu_warm_up;   
input           pad_yy_icg_scan_en; 
input           vb_icc_empty;      
input           vb_icc_grant;      
output  [1 :0]  icc_arb_data_bank; 
output  [63:0]  icc_arb_data_din;  
output  [11:0]  icc_arb_data_idx;  
output          icc_arb_data_req;  
output  [1 :0]  icc_arb_data_way;  
output  [3 :0]  icc_arb_data_wen;  
output  [2 :0]  icc_arb_dirty_din; 
output  [9 :0]  icc_arb_dirty_idx; 
output          icc_arb_dirty_req; 
output  [2 :0]  icc_arb_dirty_wen; 
output  [22:0]  icc_arb_tag_din;   
output  [9 :0]  icc_arb_tag_idx;   
output          icc_arb_tag_req;   
output  [1 :0]  icc_arb_tag_wen;   
output  [26:0]  icc_vb_addr;       
output          icc_vb_clr_vld;    
output          icc_vb_create_en;  
output  [63:0]  icc_vb_data;       
output  [1 :0]  icc_vb_data_cnt;   
output          icc_vb_data_create; 
output          icc_vb_line_dirty; 
output          icc_xx_idle;       
output          lsu_cp0_icc_done;  

// &Regs; @22
reg     [1 :0]  data_offset;       
reg     [1 :0]  data_offset_f;     
reg     [9 :0]  icc_cnt;           
reg     [3 :0]  icc_cur_state;     
reg             icc_data_vld;      
reg             icc_data_way0;     
reg     [3 :0]  icc_next_state;    
reg     [21:0]  way1_tag;          

// &Wires; @23
wire            all_dirty;         
wire            arb_icc_data_grant; 
wire    [31:0]  cp0_lsu_icc_addr;  
wire    [1 :0]  cp0_lsu_icc_op;    
wire            cp0_lsu_icc_req;   
wire    [1 :0]  cp0_lsu_icc_type;  
wire            cp0_lsu_icg_en;    
wire    [9 :0]  cp0_set;           
wire    [1 :0]  cp0_way;           
wire            cpurst_b;          
wire            data_rd_last;      
wire    [63:0]  dc_icc_way0_data;  
wire            dc_icc_way0_dirty; 
wire    [21:0]  dc_icc_way0_tag;   
wire    [63:0]  dc_icc_way1_data;  
wire            dc_icc_way1_dirty; 
wire    [21:0]  dc_icc_way1_tag;   
wire            dirty_wen;         
wire            fifo_wen;          
wire            forever_cpuclk;    
wire    [1 :0]  icc_arb_data_bank; 
wire    [63:0]  icc_arb_data_din;  
wire    [11:0]  icc_arb_data_idx;  
wire            icc_arb_data_req;  
wire    [1 :0]  icc_arb_data_way;  
wire    [3 :0]  icc_arb_data_wen;  
wire    [2 :0]  icc_arb_dirty_din; 
wire    [9 :0]  icc_arb_dirty_idx; 
wire            icc_arb_dirty_req; 
wire    [2 :0]  icc_arb_dirty_wen; 
wire    [22:0]  icc_arb_tag_din;   
wire    [9 :0]  icc_arb_tag_idx;   
wire            icc_arb_tag_req;   
wire    [1 :0]  icc_arb_tag_wen;   
wire            icc_clk;           
wire            icc_clk_en;        
wire            icc_cnt_done;      
wire            icc_cnt_en;        
wire            icc_cnt_start;     
wire            icc_cur_clr_vb;    
wire            icc_cur_data;      
wire            icc_cur_data0;     
wire            icc_cur_data1;     
wire            icc_cur_inv_all;   
wire            icc_cur_tag_rd;    
wire            icc_cur_tag_wt;    
wire            icc_cur_wfvb;      
wire            icc_cur_wfvb0;     
wire            icc_cur_wfvb1;     
wire            icc_fsm_clk;       
wire            icc_fsm_clk_en;    
wire            icc_req_cln;       
wire            icc_req_inv;       
wire            icc_req_vld;       
wire    [26:0]  icc_vb_addr;       
wire            icc_vb_clr_vld;    
wire            icc_vb_create_en;  
wire    [63:0]  icc_vb_data;       
wire    [1 :0]  icc_vb_data_cnt;   
wire            icc_vb_data_create; 
wire            icc_vb_line_dirty; 
wire            icc_xx_idle;       
wire            ifu_lsu_warm_up;   
wire            inv_all_setway;    
wire            line_dirty;        
wire            lsu_cp0_icc_done;  
wire            lsu_icc_no_op;     
wire            pad_yy_icg_scan_en; 
wire            setway_dirty;      
wire    [9 :0]  tag_idx;           
wire            tag_wen;           
wire            type_all;          
wire            type_setway;       
wire            vb_icc_empty;      
wire            vb_icc_grant;      
wire            way0_dirty;        
wire            way1_dirty;        
wire    [1 :0]  way_sel;           


parameter D_TAG_TAG_LEN    = `D_TAG_TAG_WIDTH;
parameter D_TAG_INDEX_LEN  = `D_TAG_INDEX_WIDTH;

parameter ICC_IDLE    = 4'b0000;
parameter ICC_TAG_RD  = 4'b0001;
parameter ICC_TAG_WEN = 4'b0010;
parameter ICC_TAG_WT  = 4'b0011;
parameter ICC_CHECK   = 4'b0100;
parameter ICC_WFVB_W0 = 4'b0101;
parameter ICC_DATA_W0 = 4'b0110;
parameter ICC_WFVB_W1 = 4'b0111;
parameter ICC_DATA_W1 = 4'b1000;
parameter ICC_INV_ALL = 4'b1001;
parameter ICC_CLR_VB  = 4'b1010;

parameter ICC_ALL = 2'b00;
parameter SETWAY  = 2'b01;
parameter VA      = 2'b10;

always@(posedge icc_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    icc_cur_state[3:0] <= ICC_IDLE;
  else 
    icc_cur_state[3:0] <= icc_next_state[3:0];
end

assign icc_req_vld = cp0_lsu_icc_req;

assign icc_req_inv  = cp0_lsu_icc_op[0];
assign icc_req_cln  = cp0_lsu_icc_op[1];
//assign icc_req_icln = icc_req_inv & icc_req_cln;

assign type_all    = cp0_lsu_icc_type[1:0] == ICC_ALL;
assign type_setway = cp0_lsu_icc_type[1:0] == SETWAY;

assign inv_all_setway = icc_req_inv & !icc_req_cln & (type_all | type_setway);

assign lsu_icc_no_op = 1'b1;

// &CombBeg; @68
always @( inv_all_setway
       or data_rd_last
       or type_all
       or icc_cnt_done
       or way1_dirty
       or icc_req_vld
       or icc_req_cln
       or icc_cur_state[3:0]
       or way0_dirty
       or vb_icc_empty
       or lsu_icc_no_op
       or line_dirty
       or vb_icc_grant)
begin
  case (icc_cur_state[3:0])
    ICC_IDLE: begin
      if (icc_req_vld & lsu_icc_no_op)
        icc_next_state[3:0] = inv_all_setway ? ICC_INV_ALL : ICC_TAG_RD;
      else
        icc_next_state[3:0] = ICC_IDLE;
    end
    ICC_INV_ALL: begin
      if (icc_cnt_done)
        icc_next_state[3:0] = ICC_CLR_VB;
      else
        icc_next_state[3:0] = ICC_INV_ALL;
    end
    ICC_TAG_RD: begin
      icc_next_state[3:0] = ICC_TAG_WEN;
    end
    ICC_TAG_WEN: begin
      icc_next_state[3:0] = ICC_CHECK;
    end
    ICC_CHECK: begin
      if (icc_req_cln & line_dirty)
        icc_next_state[3:0] = way0_dirty ? ICC_WFVB_W0 : ICC_WFVB_W1;
      else
        icc_next_state[3:0] = ICC_TAG_WT;
    end
    ICC_WFVB_W0: begin
      if (vb_icc_grant)
        icc_next_state[3:0] = ICC_DATA_W0;
      else
        icc_next_state[3:0] = ICC_WFVB_W0;
    end
    ICC_DATA_W0: begin
      if (data_rd_last)
        icc_next_state[3:0] = (type_all & way1_dirty) ? ICC_WFVB_W1 : ICC_TAG_WT;
      else
        icc_next_state[3:0] = ICC_DATA_W0;
    end
    ICC_WFVB_W1: begin
      if (vb_icc_grant)
        icc_next_state[3:0] = ICC_DATA_W1;
      else
        icc_next_state[3:0] = ICC_WFVB_W1;
    end
    ICC_DATA_W1: begin
      if (data_rd_last)
        icc_next_state[3:0] = ICC_TAG_WT;
      else
        icc_next_state[3:0] = ICC_DATA_W1;
    end
    ICC_TAG_WT: begin
      if (icc_cnt_done)
        icc_next_state[3:0] = ICC_CLR_VB;
      else
        icc_next_state[3:0] = ICC_TAG_RD;
    end
    ICC_CLR_VB: begin
      if (vb_icc_empty)
        icc_next_state[3:0] = ICC_IDLE;
      else 
        icc_next_state[3:0] = ICC_CLR_VB;
    end
    default: icc_next_state[3:0] = ICC_IDLE;
  endcase
// &CombEnd; @132
end

assign icc_xx_idle     = icc_cur_state[3:0] == ICC_IDLE;
assign icc_cur_wfvb0   = icc_cur_state[3:0] == ICC_WFVB_W0;
assign icc_cur_data0   = icc_cur_state[3:0] == ICC_DATA_W0;
assign icc_cur_wfvb1   = icc_cur_state[3:0] == ICC_WFVB_W1;
assign icc_cur_data1   = icc_cur_state[3:0] == ICC_DATA_W1;
assign icc_cur_inv_all = icc_cur_state[3:0] == ICC_INV_ALL;
assign icc_cur_tag_rd  = icc_cur_state[3:0] == ICC_TAG_RD;
assign icc_cur_tag_wt  = icc_cur_state[3:0] == ICC_TAG_WT;
assign icc_cur_clr_vb  = icc_cur_state[3:0] == ICC_CLR_VB;

assign icc_cur_wfvb = icc_cur_wfvb0 | icc_cur_wfvb1;
assign icc_cur_data = icc_cur_data0 | icc_cur_data1;

assign icc_cnt_en    = icc_cur_inv_all | icc_cur_tag_wt;

assign icc_cnt_start = (icc_cur_state[3:0] == ICC_IDLE) & icc_req_vld;

always@(posedge icc_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    icc_cnt[9:0] <= 10'b0;
  else if (icc_cnt_start)
    icc_cnt[9:0] <= type_all ? {10{1'b1}} : {10{1'b0}};
  else if (icc_cnt_en)
    icc_cnt[9:0] <= icc_cnt[9:0] - 10'b1;
end

assign icc_cnt_done = icc_cnt[D_TAG_INDEX_LEN-1:0] == {D_TAG_INDEX_LEN{1'b0}};

assign lsu_cp0_icc_done = vb_icc_empty & icc_cur_clr_vb;

//================================================
//           dcache request
//================================================
// &Force("bus","cp0_lsu_icc_addr",31,0); @168
assign cp0_way[1:0] = {cp0_lsu_icc_addr[31],~cp0_lsu_icc_addr[31]};
assign cp0_set[9:0] = cp0_lsu_icc_addr[14:5];

assign way_sel[1:0] = type_setway ? cp0_way[1:0] : 2'b11;

assign way0_dirty   = dc_icc_way0_dirty & way_sel[0];
assign way1_dirty   = dc_icc_way1_dirty & way_sel[1];
assign all_dirty    = way0_dirty | way1_dirty;
assign setway_dirty = |(cp0_way[1:0] & {way1_dirty, way0_dirty});
assign line_dirty   = type_all ? all_dirty : setway_dirty;

assign tag_idx[9:0] = type_setway 
                    ? cp0_set[9:0]
                    : icc_cnt[9:0];

//tag_req
assign tag_wen = icc_cur_inv_all | 
                 icc_cur_tag_wt & icc_req_inv;

assign icc_arb_tag_req = tag_wen |
                         icc_cur_tag_rd;

assign icc_arb_tag_wen[1:0]  = {2{tag_wen}} & way_sel[1:0];
assign icc_arb_tag_din[22:0] = 23'b0;
assign icc_arb_tag_idx[9:0]  = tag_idx[9:0];

//dirty_req
assign dirty_wen = icc_cur_inv_all & type_all | 
                   icc_cur_tag_wt & icc_req_cln;

assign fifo_wen  = type_all & icc_req_inv & dirty_wen;

assign icc_arb_dirty_req = dirty_wen |
                           icc_cur_tag_rd; 

assign icc_arb_dirty_wen[2:0] = {fifo_wen, {2{dirty_wen}} & way_sel[1:0]};
assign icc_arb_dirty_din[2:0] = 3'b0;
assign icc_arb_dirty_idx[9:0] = tag_idx[9:0];

//data_req
assign icc_arb_data_req = icc_cur_data;
assign icc_arb_data_way[1:0] = way_sel[1:0];
assign icc_arb_data_wen[3:0] = 4'b0;
assign icc_arb_data_din[63:0] = 64'b0;
assign icc_arb_data_idx[11:0] = {tag_idx[9:0],data_offset[1:0]};
assign icc_arb_data_bank[1:0] = 2'b11;

//assign icc_arb_dcache_sel = icc_cur_data | icc_cur_inv_all | icc_cur_tag_wt | icc_cur_tag_rd;


//================================================
//           VB request
//================================================

always@(posedge icc_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    icc_data_vld <= 1'b0;
  else 
    icc_data_vld <= arb_icc_data_grant & icc_cur_data;
end

always@(posedge icc_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b) 
    icc_data_way0 <= 1'b0;
  else if (vb_icc_grant & icc_cur_wfvb0)
    icc_data_way0 <= 1'b1;
  else if (vb_icc_grant & icc_cur_wfvb1)
    icc_data_way0 <= 1'b0; 
end

always@(posedge icc_fsm_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    data_offset[1:0]   <= 2'b0;
    data_offset_f[1:0] <= 2'b0;
  end
  else if (icc_cur_wfvb & vb_icc_grant) begin
    data_offset[1:0]   <= 2'b0;
    data_offset_f[1:0] <= 2'b0;
  end
  else if (icc_cur_data) begin
    data_offset[1:0]   <= data_offset[1:0] + 2'b1;
    data_offset_f[1:0] <= data_offset[1:0];
  end
end

assign data_rd_last = data_offset[1:0] == 2'b11;

// &Force("bus", "dc_icc_way0_tag", 21,0); @263
// &Force("bus", "dc_icc_way1_tag", 21,0); @264

always@(posedge icc_clk)
begin
  if (ifu_lsu_warm_up)
    way1_tag[21:0] <= {22{1'b0}};
  else if ((icc_cur_state[3:0] == ICC_TAG_WEN) & way1_dirty)
    way1_tag[21:0] <= dc_icc_way1_tag[21:0];
end

assign icc_vb_create_en  = icc_cur_wfvb;
assign icc_vb_addr[26:0] = icc_cur_wfvb0 ? {dc_icc_way0_tag[D_TAG_TAG_LEN-1:0], tag_idx[D_TAG_INDEX_LEN-1:0]}
                                         : {way1_tag[D_TAG_TAG_LEN-1:0], tag_idx[D_TAG_INDEX_LEN-1:0]};

assign icc_vb_data_create   = icc_data_vld;
assign icc_vb_data[63:0]    = icc_data_way0 ? dc_icc_way0_data[63:0] : dc_icc_way1_data[63:0];
assign icc_vb_line_dirty    = 1'b1;
assign icc_vb_data_cnt[1:0] = data_offset_f[1:0];

assign icc_vb_clr_vld       = icc_cur_clr_vb;

assign icc_fsm_clk_en = icc_req_vld | !(icc_cur_state[3:0] == ICC_IDLE);
// &Instance("gated_clk_cell", "x_icc_fsm_gated_clk"); @298
gated_clk_cell  x_icc_fsm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icc_fsm_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (icc_fsm_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @299
//          .external_en (1'b0), @300
//          .global_en   (1'b1), @301
//          .module_en     (cp0_lsu_icg_en     ), @302
//          .local_en    (icc_fsm_clk_en), @303
//          .clk_out     (icc_fsm_clk)); @304

assign icc_clk_en = (icc_cur_state[3:0] == ICC_TAG_WEN) & way1_dirty | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_icc_dp_gated_clk"); @307
gated_clk_cell  x_icc_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (icc_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (icc_clk_en        ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @308
//          .external_en (1'b0), @309
//          .global_en   (1'b1), @310
//          .module_en     (cp0_lsu_icg_en     ), @311
//          .local_en    (icc_clk_en), @312
//          .clk_out     (icc_clk)); @313

// &ModuleEnd; @315
endmodule


