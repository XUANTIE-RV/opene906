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
module pa_lsu_vb_entry(
  cp0_lsu_icg_en,
  cpurst_b,
  dc_vb_st_amold,
  dc_xx_addr,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  rdl_vb_warm_up,
  rtu_yy_xx_async_flush,
  vb_clk,
  vb_clr_en_x,
  vb_create_addr,
  vb_create_data,
  vb_create_data_cnt,
  vb_create_data_vld,
  vb_create_en_x,
  vb_create_line_dirty,
  vb_entry_biu_req_x,
  vb_entry_vld_x,
  vb_entryx_addr,
  vb_entryx_data,
  vb_entryx_dbginfo,
  vb_entryx_fwd_data,
  vb_fwd_vld_x,
  vb_hit_dirty_x,
  vb_pop_en_x,
  vb_wb_cmplt_x,
  vb_wb_grant_x
);

// &Ports; @21
input            cp0_lsu_icg_en;       
input            cpurst_b;             
input            dc_vb_st_amold;       
input   [31 :0]  dc_xx_addr;           
input            forever_cpuclk;       
input            pad_yy_icg_scan_en;   
input            rdl_vb_warm_up;       
input            rtu_yy_xx_async_flush; 
input            vb_clk;               
input            vb_clr_en_x;          
input   [26 :0]  vb_create_addr;       
input   [63 :0]  vb_create_data;       
input   [1  :0]  vb_create_data_cnt;   
input            vb_create_data_vld;   
input            vb_create_en_x;       
input            vb_create_line_dirty; 
input            vb_wb_cmplt_x;        
input            vb_wb_grant_x;        
output           vb_entry_biu_req_x;   
output           vb_entry_vld_x;       
output  [26 :0]  vb_entryx_addr;       
output  [255:0]  vb_entryx_data;       
output  [2  :0]  vb_entryx_dbginfo;    
output  [31 :0]  vb_entryx_fwd_data;   
output           vb_fwd_vld_x;         
output           vb_hit_dirty_x;       
output           vb_pop_en_x;          

// &Regs; @22
reg     [2  :0]  vb_cur_state;         
reg     [26 :0]  vb_entry_addr;        
reg     [63 :0]  vb_entry_data0;       
reg     [63 :0]  vb_entry_data1;       
reg     [63 :0]  vb_entry_data2;       
reg     [63 :0]  vb_entry_data3;       
reg              vb_entry_dirty;       
reg     [63 :0]  vb_fwd_data;          
reg     [2  :0]  vb_next_state;        

// &Wires; @23
wire             cp0_lsu_icg_en;       
wire             cpurst_b;             
wire    [29 :0]  dc_addr;              
wire             dc_hit_vb;            
wire             dc_st_hit_vb;         
wire             dc_vb_st_amold;       
wire    [31 :0]  dc_xx_addr;           
wire             forever_cpuclk;       
wire             pad_yy_icg_scan_en;   
wire             rdl_vb_warm_up;       
wire             rtu_yy_xx_async_flush; 
wire             vb_addr_clk;          
wire             vb_addr_clk_en;       
wire             vb_clk;               
wire             vb_clr_en_x;          
wire    [26 :0]  vb_create_addr;       
wire    [63 :0]  vb_create_data;       
wire    [1  :0]  vb_create_data_cnt;   
wire             vb_create_data_vld;   
wire             vb_create_en_x;       
wire             vb_create_line_dirty; 
wire             vb_data0_clk;         
wire             vb_data0_clk_en;      
wire             vb_data1_clk;         
wire             vb_data1_clk_en;      
wire             vb_data2_clk;         
wire             vb_data2_clk_en;      
wire             vb_data3_clk;         
wire             vb_data3_clk_en;      
wire    [3  :0]  vb_data_create;       
wire    [3  :0]  vb_data_create_en;    
wire             vb_data_create_last;  
wire             vb_data_create_vld;   
wire             vb_entry_biu_req_x;   
wire             vb_entry_vld_x;       
wire    [26 :0]  vb_entryx_addr;       
wire    [255:0]  vb_entryx_data;       
wire    [2  :0]  vb_entryx_dbginfo;    
wire    [31 :0]  vb_entryx_fwd_data;   
wire             vb_fsm_rdy;           
wire             vb_fwd_vld_x;         
wire             vb_hit_dirty_x;       
wire             vb_pop_en_x;          
wire             vb_wb_cmplt_x;        
wire             vb_wb_grant_x;        


parameter VB_IDLE = 3'b000;
parameter VB_RFC  = 3'b001;
parameter VB_RDY  = 3'b010;
parameter VB_WFC  = 3'b011;
parameter VB_WB   = 3'b100;

always@(posedge vb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_cur_state[2:0] <= VB_IDLE;
  else if (rtu_yy_xx_async_flush)
    vb_cur_state[2:0] <= VB_IDLE;
  else
    vb_cur_state[2:0] <= vb_next_state[2:0];
end

// &CombBeg; @51
always @( vb_create_en_x
       or dc_st_hit_vb
       or vb_wb_cmplt_x
       or vb_clr_en_x
       or vb_entry_dirty
       or vb_cur_state[2:0]
       or vb_wb_grant_x
       or vb_data_create_last)
begin
  case(vb_cur_state[2:0])
    VB_IDLE: begin
      if (vb_create_en_x)
        vb_next_state[2:0] = VB_RFC;
      else
        vb_next_state[2:0] = VB_IDLE;
    end
    VB_RFC: begin
      if (vb_data_create_last)
        vb_next_state[2:0] = VB_RDY;
      else
        vb_next_state[2:0] = VB_RFC;
    end
    VB_RDY: begin
      if (vb_clr_en_x | dc_st_hit_vb)
        vb_next_state[2:0] = vb_entry_dirty ? VB_WB : VB_IDLE;
      else
        vb_next_state[2:0] = VB_RDY;
    end
    VB_WB: begin
      if (vb_wb_grant_x)
        vb_next_state[2:0] = VB_WFC;
      else
        vb_next_state[2:0] = VB_WB;
    end
    VB_WFC: begin
      if (vb_wb_cmplt_x)
        vb_next_state[2:0] = VB_IDLE;
      else
        vb_next_state[2:0] = VB_WFC;
    end
    default: vb_next_state[2:0] = VB_IDLE;
  endcase
// &CombEnd; @85
end

assign vb_fsm_rdy     =  (vb_cur_state[2:0] == VB_RDY) | (vb_cur_state[2:0] == VB_WB) | (vb_cur_state[2:0] == VB_WFC);
assign vb_entry_vld_x = !(vb_cur_state[2:0] == VB_IDLE);
assign vb_pop_en_x    =  (vb_cur_state[2:0] == VB_WFC) & vb_wb_cmplt_x |
                         (vb_cur_state[2:0] == VB_RDY) & (vb_clr_en_x | dc_st_hit_vb) & !vb_entry_dirty;

//================================================
//  bus request
//================================================
assign vb_entry_biu_req_x    = vb_cur_state[2];//VB_WB
assign vb_entryx_addr[26:0]  = vb_entry_addr[26:0];
assign vb_entryx_data[255:0] = {vb_entry_data3[63:0],
                                vb_entry_data2[63:0],
                                vb_entry_data1[63:0],
                                vb_entry_data0[63:0]};

//================================================
//  VB entry content
//================================================
// &Force("bus","dc_xx_addr",31,0); @105
assign dc_addr[29:0] = dc_xx_addr[31:2] & {30{vb_fsm_rdy}};
assign dc_hit_vb     = dc_addr[29:3] == vb_entry_addr[26:0];

assign dc_st_hit_vb = dc_hit_vb & dc_vb_st_amold;

always@(posedge vb_addr_clk)
begin
  if (vb_create_en_x | rdl_vb_warm_up) begin
    vb_entry_addr[26:0] <= vb_create_addr[26:0];
    vb_entry_dirty      <= vb_create_line_dirty;
  end
end

assign vb_data_create_last = vb_data_create_en[3];

assign vb_data_create_vld = (vb_cur_state[2:0] == VB_RFC) & vb_create_data_vld;
assign vb_data_create[3:0] = (4'b1 << vb_create_data_cnt[1:0]);
assign vb_data_create_en[3:0] = vb_data_create[3:0] & {4{vb_data_create_vld}};

always@(posedge vb_data0_clk)
begin
  if (vb_data_create_en[0] | rdl_vb_warm_up)
    vb_entry_data0[63:0] <= vb_create_data[63:0];
end

always@(posedge vb_data1_clk)
begin
  if (vb_data_create_en[1] | rdl_vb_warm_up)
    vb_entry_data1[63:0] <= vb_create_data[63:0];
end

always@(posedge vb_data2_clk)
begin
  if (vb_data_create_en[2] | rdl_vb_warm_up)
    vb_entry_data2[63:0] <= vb_create_data[63:0];
end

always@(posedge vb_data3_clk)
begin
  if (vb_data_create_en[3] | rdl_vb_warm_up)
    vb_entry_data3[63:0] <= vb_create_data[63:0];
end

// &Force("bus","pfb_xx_pa",31,0); @207
//================================================
//  ld fwd VB
//================================================
assign vb_fwd_vld_x   = dc_hit_vb & vb_fsm_rdy;

// &CombBeg; @216
always @( dc_addr[2:1]
       or vb_entry_data0[63:0]
       or vb_entry_data2[63:0]
       or vb_entry_data3[63:0]
       or vb_entry_data1[63:0])
begin
  case(dc_addr[2:1])
    2'b00:  vb_fwd_data[63:0] = vb_entry_data0[63:0];
    2'b01:  vb_fwd_data[63:0] = vb_entry_data1[63:0];
    2'b10:  vb_fwd_data[63:0] = vb_entry_data2[63:0];
    2'b11:  vb_fwd_data[63:0] = vb_entry_data3[63:0];
    default:vb_fwd_data[63:0] = {64{1'bx}};
  endcase
// &CombEnd; @224
end

assign vb_entryx_fwd_data[31:0] = dc_addr[0] ? vb_fwd_data[63:32] : vb_fwd_data[31:0];

assign vb_hit_dirty_x = dc_hit_vb & vb_fsm_rdy & vb_entry_dirty;

assign vb_addr_clk_en = vb_create_en_x | rdl_vb_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_vb_addr_gated_clk"); @239
gated_clk_cell  x_pa_lsu_vb_addr_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vb_addr_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (vb_addr_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @240
//          .external_en (1'b0), @241
//          .global_en   (1'b1), @242
//          .module_en     (cp0_lsu_icg_en     ), @243
//          .local_en    (vb_addr_clk_en), @244
//          .clk_out     (vb_addr_clk)); @245

assign vb_data3_clk_en = vb_data_create_en[3] | rdl_vb_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_vb_data3_gated_clk"); @248
gated_clk_cell  x_pa_lsu_vb_data3_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vb_data3_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (vb_data3_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @249
//          .external_en (1'b0), @250
//          .global_en   (1'b1), @251
//          .module_en     (cp0_lsu_icg_en     ), @252
//          .local_en    (vb_data3_clk_en), @253
//          .clk_out     (vb_data3_clk)); @254

assign vb_data2_clk_en = vb_data_create_en[2] | rdl_vb_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_vb_data2_gated_clk"); @257
gated_clk_cell  x_pa_lsu_vb_data2_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vb_data2_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (vb_data2_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @258
//          .external_en (1'b0), @259
//          .global_en   (1'b1), @260
//          .module_en     (cp0_lsu_icg_en     ), @261
//          .local_en    (vb_data2_clk_en), @262
//          .clk_out     (vb_data2_clk)); @263

assign vb_data1_clk_en = vb_data_create_en[1] | rdl_vb_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_vb_data1_gated_clk"); @266
gated_clk_cell  x_pa_lsu_vb_data1_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vb_data1_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (vb_data1_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @267
//          .external_en (1'b0), @268
//          .global_en   (1'b1), @269
//          .module_en     (cp0_lsu_icg_en     ), @270
//          .local_en    (vb_data1_clk_en), @271
//          .clk_out     (vb_data1_clk)); @272

assign vb_data0_clk_en = vb_data_create_en[0] | rdl_vb_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_vb_data0_gated_clk"); @275
gated_clk_cell  x_pa_lsu_vb_data0_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vb_data0_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (vb_data0_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @276
//          .external_en (1'b0), @277
//          .global_en   (1'b1), @278
//          .module_en     (cp0_lsu_icg_en     ), @279
//          .local_en    (vb_data0_clk_en), @280
//          .clk_out     (vb_data0_clk)); @281

assign vb_entryx_dbginfo[2:0] = vb_cur_state[2:0];

// &ModuleEnd; @285
endmodule


