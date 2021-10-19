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
module pa_lsu_vb(
  cp0_lsu_fence_req,
  cp0_lsu_icg_en,
  cpurst_b,
  dahbif_vb_acc_ecc,
  dahbif_vb_cmplt,
  dahbif_vb_grant,
  dc_vb_st_amold,
  dc_xx_addr,
  forever_cpuclk,
  icc_vb_addr,
  icc_vb_clr_vld,
  icc_vb_create_en,
  icc_vb_data,
  icc_vb_data_cnt,
  icc_vb_data_create,
  icc_vb_line_dirty,
  pad_yy_icg_scan_en,
  rdl_vb_addr,
  rdl_vb_create_en,
  rdl_vb_data,
  rdl_vb_data_cnt,
  rdl_vb_data_create,
  rdl_vb_line_dirty,
  rdl_vb_warm_up,
  rtu_yy_xx_async_flush,
  vb_dahbif_addr,
  vb_dahbif_data,
  vb_dahbif_prot,
  vb_dahbif_req,
  vb_dbginfo,
  vb_dc_hit_dirty,
  vb_dc_ld_data,
  vb_dc_ld_fwd_vld,
  vb_dc_pop_en,
  vb_icc_empty,
  vb_icc_grant,
  vb_idle,
  vb_rdl_grant,
  vb_wb_idle
);

// &Ports; @21
input            cp0_lsu_fence_req;    
input            cp0_lsu_icg_en;       
input            cpurst_b;             
input            dahbif_vb_acc_ecc;    
input            dahbif_vb_cmplt;      
input            dahbif_vb_grant;      
input            dc_vb_st_amold;       
input   [31 :0]  dc_xx_addr;           
input            forever_cpuclk;       
input   [26 :0]  icc_vb_addr;          
input            icc_vb_clr_vld;       
input            icc_vb_create_en;     
input   [63 :0]  icc_vb_data;          
input   [1  :0]  icc_vb_data_cnt;      
input            icc_vb_data_create;   
input            icc_vb_line_dirty;    
input            pad_yy_icg_scan_en;   
input   [26 :0]  rdl_vb_addr;          
input            rdl_vb_create_en;     
input   [63 :0]  rdl_vb_data;          
input   [1  :0]  rdl_vb_data_cnt;      
input            rdl_vb_data_create;   
input            rdl_vb_line_dirty;    
input            rdl_vb_warm_up;       
input            rtu_yy_xx_async_flush; 
output  [31 :0]  vb_dahbif_addr;       
output  [31 :0]  vb_dahbif_data;       
output  [3  :0]  vb_dahbif_prot;       
output           vb_dahbif_req;        
output  [7  :0]  vb_dbginfo;           
output           vb_dc_hit_dirty;      
output  [31 :0]  vb_dc_ld_data;        
output           vb_dc_ld_fwd_vld;     
output           vb_dc_pop_en;         
output           vb_icc_empty;         
output           vb_icc_grant;         
output           vb_idle;              
output           vb_rdl_grant;         
output           vb_wb_idle;           

// &Regs; @22
reg     [26 :0]  vb_addr;              
reg     [31 :0]  vb_dahbif_data;       
reg     [2  :0]  vb_data_cnt;          
reg     [1  :0]  vb_data_sel;          
reg              vb_lru;               
reg     [1  :0]  wb_cur_state;         
reg     [1  :0]  wb_next_state;        

// &Wires; @23
wire             bus_vb_acc_ecc;       
wire             bus_vb_cmplt;         
wire             bus_vb_grant;         
wire             cp0_lsu_fence_req;    
wire             cp0_lsu_icg_en;       
wire             cpurst_b;             
wire             dahbif_vb_acc_ecc;    
wire             dahbif_vb_cmplt;      
wire             dahbif_vb_grant;      
wire             dc_vb_st_amold;       
wire    [31 :0]  dc_xx_addr;           
wire             forever_cpuclk;       
wire    [26 :0]  icc_vb_addr;          
wire             icc_vb_clr_vld;       
wire             icc_vb_create_en;     
wire    [63 :0]  icc_vb_data;          
wire    [1  :0]  icc_vb_data_cnt;      
wire             icc_vb_data_create;   
wire             icc_vb_line_dirty;    
wire             pad_yy_icg_scan_en;   
wire    [26 :0]  rdl_vb_addr;          
wire             rdl_vb_create_en;     
wire    [63 :0]  rdl_vb_data;          
wire    [1  :0]  rdl_vb_data_cnt;      
wire             rdl_vb_data_create;   
wire             rdl_vb_line_dirty;    
wire             rdl_vb_warm_up;       
wire             rtu_yy_xx_async_flush; 
wire    [1  :0]  vb_addr_sel;          
wire             vb_biu_req_vld;       
wire             vb_clk;               
wire             vb_clk_en;            
wire    [1  :0]  vb_clr_en;            
wire             vb_clr_vld;           
wire             vb_cmplt_last;        
wire             vb_cnt_last;          
wire    [26 :0]  vb_create_addr;       
wire    [63 :0]  vb_create_data;       
wire    [1  :0]  vb_create_data_cnt;   
wire             vb_create_data_vld;   
wire    [1  :0]  vb_create_en;         
wire             vb_create_line_dirty; 
wire    [1  :0]  vb_create_ptr;        
wire             vb_create_vld;        
wire    [31 :0]  vb_dahbif_addr;       
wire    [3  :0]  vb_dahbif_prot;       
wire             vb_dahbif_req;        
wire    [255:0]  vb_data;              
wire    [2  :0]  vb_data_cnt_inc;      
wire    [7  :0]  vb_dbginfo;           
wire             vb_dc_hit_dirty;      
wire    [31 :0]  vb_dc_ld_data;        
wire             vb_dc_ld_fwd_vld;     
wire             vb_dc_pop_en;         
wire    [26 :0]  vb_entry0_addr;       
wire    [255:0]  vb_entry0_data;       
wire    [2  :0]  vb_entry0_dbginfo;    
wire    [31 :0]  vb_entry0_fwd_data;   
wire    [26 :0]  vb_entry1_addr;       
wire    [255:0]  vb_entry1_data;       
wire    [2  :0]  vb_entry1_dbginfo;    
wire    [31 :0]  vb_entry1_fwd_data;   
wire    [1  :0]  vb_entry_biu_req;     
wire    [1  :0]  vb_entry_vld;         
wire             vb_full;              
wire    [1  :0]  vb_fwd_vld;           
wire    [1  :0]  vb_hit_dirty;         
wire             vb_icc_empty;         
wire             vb_icc_grant;         
wire             vb_idle;              
wire    [1  :0]  vb_pop_en;            
wire             vb_rdl_grant;         
wire    [1  :0]  vb_wb_cmplt;          
wire    [1  :0]  vb_wb_grant;          
wire             vb_wb_idle;           
wire             wb_cur_idle;          
wire             wb_cur_wfc;           
wire             wb_cur_wfg;           


parameter DATAW = `FLEN;
//================================================
//      vb create ptr
//================================================
assign vb_create_vld = (rdl_vb_create_en | icc_vb_create_en) & !vb_full;

always@(posedge vb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_lru <= 1'b0;
  else if (vb_create_vld)
    vb_lru <= ~vb_lru;
  else if (vb_fwd_vld[0])
    vb_lru <= 1'b1;
  else if (vb_fwd_vld[1])
    vb_lru <= 1'b0;
end

assign vb_create_ptr[1:0] = vb_full ? {vb_lru,!vb_lru}
                                    : {vb_entry_vld[0],!vb_entry_vld[0]};

assign vb_create_en[1:0] = vb_create_ptr[1:0] & {2{vb_create_vld}};
assign vb_full           = &vb_entry_vld[1:0];

assign vb_clr_vld     = rdl_vb_create_en & vb_full | icc_vb_create_en;
assign vb_clr_en[1:0] = {2{cp0_lsu_fence_req | icc_vb_clr_vld}} | {2{vb_clr_vld}} & vb_create_ptr[1:0];
assign vb_rdl_grant   = !vb_full;
assign vb_icc_grant   = !rdl_vb_create_en & !vb_full;

assign vb_create_addr[26:0]    = rdl_vb_warm_up 
                               ? 27'b0
                               : rdl_vb_create_en ? rdl_vb_addr[26:0]    : icc_vb_addr[26:0];
assign vb_create_line_dirty    = rdl_vb_warm_up
                               ? 1'b0
                               : rdl_vb_create_en ? rdl_vb_line_dirty    : icc_vb_line_dirty;

assign vb_create_data_vld      = rdl_vb_data_create | icc_vb_data_create;
assign vb_create_data[63:0]    = rdl_vb_warm_up 
                               ? 64'b0
                               : (rdl_vb_data_create ? rdl_vb_data[63:0]    : icc_vb_data[63:0]);
assign vb_create_data_cnt[1:0] = rdl_vb_data_create ? rdl_vb_data_cnt[1:0] : icc_vb_data_cnt[1:0];

assign vb_idle = !cp0_lsu_fence_req & wb_cur_idle & !vb_biu_req_vld | 
                  cp0_lsu_fence_req & (!(|vb_entry_vld[1:0]));

assign vb_icc_empty = !(|vb_entry_vld[1:0]);

assign vb_wb_idle = wb_cur_idle;
//================================================
//  vb request dahbif
//================================================
parameter WB_IDLE = 2'b01;
parameter WB_WFG  = 2'b10;
parameter WB_WFC  = 2'b00;

assign vb_biu_req_vld = |vb_entry_biu_req[1:0];

always@(posedge vb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wb_cur_state[1:0] <= WB_IDLE;
  else if (rtu_yy_xx_async_flush)
    wb_cur_state[1:0] <= WB_IDLE;
  else
    wb_cur_state[1:0] <= wb_next_state[1:0];
end

// &CombBeg; @106
always @( vb_cmplt_last
       or bus_vb_grant
       or wb_cur_state[1:0]
       or vb_biu_req_vld)
begin
  case (wb_cur_state[1:0])
    WB_IDLE: begin
      if (vb_biu_req_vld)
        wb_next_state[1:0] = bus_vb_grant ? WB_WFC : WB_WFG;
      else
        wb_next_state[1:0] = WB_IDLE;
    end
    WB_WFG: begin
      if (bus_vb_grant)
        wb_next_state[1:0] = WB_WFC;
      else
        wb_next_state[1:0] = WB_WFG;
    end
    WB_WFC: begin
      if (vb_cmplt_last)
        wb_next_state[1:0] = WB_IDLE;
      else
        wb_next_state[1:0] = WB_WFC;
    end
    default: wb_next_state[1:0] = WB_IDLE;
  endcase
// &CombEnd; @128
end

assign wb_cur_idle = wb_cur_state[0]; //WB_IDLE;
assign wb_cur_wfc  = wb_cur_state[1:0] == WB_WFC;
assign wb_cur_wfg  = wb_cur_state[1:0] == WB_WFG;

always@(posedge vb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_data_sel[1:0] <= 2'b0;
  else if (rtu_yy_xx_async_flush)
    vb_data_sel[1:0] <= 2'b0;
  else if (wb_cur_idle & vb_biu_req_vld)
    vb_data_sel[1:0] <= {vb_entry_biu_req[1] & !vb_entry_biu_req[0],vb_entry_biu_req[0]};
  else if (wb_cur_wfc & vb_cmplt_last)
    vb_data_sel[1:0] <= 2'b0;
end

assign vb_addr_sel[1] = wb_cur_idle & !vb_entry_biu_req[0] | vb_data_sel[1];
assign vb_addr_sel[0] = wb_cur_idle &  vb_entry_biu_req[0] | vb_data_sel[0];

always@(posedge vb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_data_cnt[2:0] <= 3'b0;
  else if (bus_vb_grant)
    vb_data_cnt[2:0] <= 3'b0;
  else if (bus_vb_cmplt)
    vb_data_cnt[2:0] <= bus_vb_acc_ecc ? 3'b111 : vb_data_cnt_inc[2:0];
end

assign vb_data_cnt_inc[2:0] = vb_data_cnt[2:0] + 3'b1;

assign vb_cnt_last = (vb_data_cnt[2:0] == 3'b111);
assign vb_cmplt_last = bus_vb_cmplt & vb_cnt_last;

// &CombBeg; @180
always @( vb_entry0_addr[26:0]
       or vb_addr_sel[1:0]
       or vb_entry1_addr[26:0])
begin
  case(vb_addr_sel[1:0])
    2'b01:  vb_addr[26:0]  = vb_entry0_addr[26:0]; 
    2'b10:  vb_addr[26:0]  = vb_entry1_addr[26:0]; 
    default:vb_addr[26:0]  = {27{1'bx}}; 
  endcase
// &CombEnd; @186
end

assign vb_data[255:0] = {256{vb_data_sel[1]}} & vb_entry1_data[255:0] | 
                        {256{vb_data_sel[0]}} & vb_entry0_data[255:0];

//-----------------------------------------------
//     bus interface
//-----------------------------------------------
//-----------------bus req----------------------
// &CombBeg; @213
// &CombEnd; @221
assign vb_dahbif_req        = vb_biu_req_vld & wb_cur_idle | wb_cur_wfg;
assign vb_dahbif_addr[31:0] = {vb_addr[26:0],5'b0};
assign vb_dahbif_prot[3:0]  = {1'b1,1'b1,1'b1,1'b1};

// &CombBeg; @233
always @( vb_data[255:0]
       or vb_data_cnt[2:0])
begin
  case (vb_data_cnt[2:0])
    3'b000: vb_dahbif_data[31:0] = vb_data[31:0];
    3'b001: vb_dahbif_data[31:0] = vb_data[63:32];
    3'b010: vb_dahbif_data[31:0] = vb_data[95:64];
    3'b011: vb_dahbif_data[31:0] = vb_data[127:96];
    3'b100: vb_dahbif_data[31:0] = vb_data[159:128];
    3'b101: vb_dahbif_data[31:0] = vb_data[191:160];
    3'b110: vb_dahbif_data[31:0] = vb_data[223:192];
    3'b111: vb_dahbif_data[31:0] = vb_data[255:224];
    default:vb_dahbif_data[31:0] = {32{1'bx}};
  endcase
// &CombEnd; @245
end

//-----------------bus resp----------------------
assign bus_vb_grant   = dahbif_vb_grant;
assign bus_vb_cmplt   = dahbif_vb_cmplt;
assign bus_vb_acc_ecc = dahbif_vb_acc_ecc;

//================================================
//      to VB entry
//================================================

assign vb_wb_grant[1:0] = {2{bus_vb_grant}} & vb_addr_sel[1:0];
assign vb_wb_cmplt[1:0] = {2{vb_cmplt_last}} & vb_data_sel[1:0];

//================================================
//  ld fwd VB
//================================================

assign vb_dc_ld_fwd_vld    = |vb_fwd_vld[1:0];
assign vb_dc_ld_data[DATAW-1:0] = {DATAW{vb_fwd_vld[1]}} & vb_entry1_fwd_data[DATAW-1:0] |
                                  {DATAW{vb_fwd_vld[0]}} & vb_entry0_fwd_data[DATAW-1:0];
assign vb_dc_pop_en        = |vb_pop_en[1:0];
assign vb_dc_hit_dirty     = |vb_hit_dirty[1:0];

// &ConnRule(s/_x$/[0]/); @281
// &ConnRule(s/entryx/entry0/); @282
// &Instance("pa_lsu_vb_entry","x_pa_lsu_vb_entry_0"); @283
pa_lsu_vb_entry  x_pa_lsu_vb_entry_0 (
  .cp0_lsu_icg_en        (cp0_lsu_icg_en       ),
  .cpurst_b              (cpurst_b             ),
  .dc_vb_st_amold        (dc_vb_st_amold       ),
  .dc_xx_addr            (dc_xx_addr           ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rdl_vb_warm_up        (rdl_vb_warm_up       ),
  .rtu_yy_xx_async_flush (rtu_yy_xx_async_flush),
  .vb_clk                (vb_clk               ),
  .vb_clr_en_x           (vb_clr_en[0]         ),
  .vb_create_addr        (vb_create_addr       ),
  .vb_create_data        (vb_create_data       ),
  .vb_create_data_cnt    (vb_create_data_cnt   ),
  .vb_create_data_vld    (vb_create_data_vld   ),
  .vb_create_en_x        (vb_create_en[0]      ),
  .vb_create_line_dirty  (vb_create_line_dirty ),
  .vb_entry_biu_req_x    (vb_entry_biu_req[0]  ),
  .vb_entry_vld_x        (vb_entry_vld[0]      ),
  .vb_entryx_addr        (vb_entry0_addr       ),
  .vb_entryx_data        (vb_entry0_data       ),
  .vb_entryx_dbginfo     (vb_entry0_dbginfo    ),
  .vb_entryx_fwd_data    (vb_entry0_fwd_data   ),
  .vb_fwd_vld_x          (vb_fwd_vld[0]        ),
  .vb_hit_dirty_x        (vb_hit_dirty[0]      ),
  .vb_pop_en_x           (vb_pop_en[0]         ),
  .vb_wb_cmplt_x         (vb_wb_cmplt[0]       ),
  .vb_wb_grant_x         (vb_wb_grant[0]       )
);


// &ConnRule(s/_x$/[1]/); @285
// &ConnRule(s/entryx/entry1/); @286
// &Instance("pa_lsu_vb_entry","x_pa_lsu_vb_entry_1"); @287
pa_lsu_vb_entry  x_pa_lsu_vb_entry_1 (
  .cp0_lsu_icg_en        (cp0_lsu_icg_en       ),
  .cpurst_b              (cpurst_b             ),
  .dc_vb_st_amold        (dc_vb_st_amold       ),
  .dc_xx_addr            (dc_xx_addr           ),
  .forever_cpuclk        (forever_cpuclk       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rdl_vb_warm_up        (rdl_vb_warm_up       ),
  .rtu_yy_xx_async_flush (rtu_yy_xx_async_flush),
  .vb_clk                (vb_clk               ),
  .vb_clr_en_x           (vb_clr_en[1]         ),
  .vb_create_addr        (vb_create_addr       ),
  .vb_create_data        (vb_create_data       ),
  .vb_create_data_cnt    (vb_create_data_cnt   ),
  .vb_create_data_vld    (vb_create_data_vld   ),
  .vb_create_en_x        (vb_create_en[1]      ),
  .vb_create_line_dirty  (vb_create_line_dirty ),
  .vb_entry_biu_req_x    (vb_entry_biu_req[1]  ),
  .vb_entry_vld_x        (vb_entry_vld[1]      ),
  .vb_entryx_addr        (vb_entry1_addr       ),
  .vb_entryx_data        (vb_entry1_data       ),
  .vb_entryx_dbginfo     (vb_entry1_dbginfo    ),
  .vb_entryx_fwd_data    (vb_entry1_fwd_data   ),
  .vb_fwd_vld_x          (vb_fwd_vld[1]        ),
  .vb_hit_dirty_x        (vb_hit_dirty[1]      ),
  .vb_pop_en_x           (vb_pop_en[1]         ),
  .vb_wb_cmplt_x         (vb_wb_cmplt[1]       ),
  .vb_wb_grant_x         (vb_wb_grant[1]       )
);


assign vb_clk_en = vb_create_vld | vb_entry_vld[0] | vb_entry_vld[1];
// &Instance("gated_clk_cell", "x_pa_lsu_vb_gated_clk"); @290
gated_clk_cell  x_pa_lsu_vb_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vb_clk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (vb_clk_en         ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @291
//          .external_en (1'b0), @292
//          .global_en   (1'b1), @293
//          .module_en     (cp0_lsu_icg_en     ), @294
//          .local_en    (vb_clk_en), @295
//          .clk_out     (vb_clk)); @296

assign vb_dbginfo[7:0] = {vb_entry1_dbginfo[2:0], vb_entry0_dbginfo[2:0], wb_cur_state[1:0]};

// &ModuleEnd; @300
endmodule


