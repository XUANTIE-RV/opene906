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

// &ModuleBeg; @19
module pa_lsu_wb_entry(
  ag_ld_inst,
  ag_ncb_inst_vld_dp,
  cp0_lsu_icg_en,
  cpurst_b,
  da_xx_fwd_data,
  da_xx_fwd_fls,
  da_xx_fwd_preg,
  da_xx_fwd_vld,
  forever_cpuclk,
  ifu_lsu_warm_up,
  ld_hit_wb_f_x,
  ld_hit_wb_x,
  pad_yy_icg_scan_en,
  rtu_lsu_fgpr_wb_data,
  rtu_lsu_fgpr_wb_reg,
  rtu_lsu_fgpr_wb_vld,
  rtu_yy_xx_async_flush,
  wb_addr_pop_en_x,
  wb_clk,
  wb_create_addr,
  wb_create_buf,
  wb_create_bytes_vld,
  wb_create_ca,
  wb_create_data,
  wb_create_dest_preg,
  wb_create_en_dp_x,
  wb_create_en_x,
  wb_create_fls,
  wb_create_lock,
  wb_create_mach_mode,
  wb_create_pmp_deny,
  wb_create_sc_fail,
  wb_create_sc_inst,
  wb_create_shift,
  wb_create_size,
  wb_create_so,
  wb_create_split_first,
  wb_create_src1_depd,
  wb_create_src1_reg,
  wb_data_pop_en_x,
  wb_entry_addr_vld_x,
  wb_entry_data_vld_x,
  wb_entry_fls_x,
  wb_entry_lock_x,
  wb_entry_lrsc_x,
  wb_entry_pmp_deny_x,
  wb_entry_sc_fail_x,
  wb_entry_split_first_x,
  wb_entry_vld_x,
  wb_entryx_addr,
  wb_entryx_dbginfo,
  wb_entryx_dest_preg,
  wb_entryx_prot,
  wb_entryx_shift,
  wb_entryx_size,
  wb_entryx_wdata,
  wb_so_req_x
);

// &Ports; @20
input           ag_ld_inst;            
input           ag_ncb_inst_vld_dp;    
input           cp0_lsu_icg_en;        
input           cpurst_b;              
input   [31:0]  da_xx_fwd_data;        
input           da_xx_fwd_fls;         
input   [5 :0]  da_xx_fwd_preg;        
input           da_xx_fwd_vld;         
input           forever_cpuclk;        
input           ifu_lsu_warm_up;       
input           pad_yy_icg_scan_en;    
input   [31:0]  rtu_lsu_fgpr_wb_data;  
input   [4 :0]  rtu_lsu_fgpr_wb_reg;   
input           rtu_lsu_fgpr_wb_vld;   
input           rtu_yy_xx_async_flush; 
input           wb_addr_pop_en_x;      
input           wb_clk;                
input   [31:0]  wb_create_addr;        
input           wb_create_buf;         
input   [7 :0]  wb_create_bytes_vld;   
input           wb_create_ca;          
input   [31:0]  wb_create_data;        
input   [5 :0]  wb_create_dest_preg;   
input           wb_create_en_dp_x;     
input           wb_create_en_x;        
input           wb_create_fls;         
input           wb_create_lock;        
input           wb_create_mach_mode;   
input           wb_create_pmp_deny;    
input           wb_create_sc_fail;     
input           wb_create_sc_inst;     
input   [3 :0]  wb_create_shift;       
input   [1 :0]  wb_create_size;        
input           wb_create_so;          
input           wb_create_split_first; 
input           wb_create_src1_depd;   
input   [5 :0]  wb_create_src1_reg;    
input           wb_data_pop_en_x;      
output          ld_hit_wb_f_x;         
output          ld_hit_wb_x;           
output          wb_entry_addr_vld_x;   
output          wb_entry_data_vld_x;   
output          wb_entry_fls_x;        
output          wb_entry_lock_x;       
output          wb_entry_lrsc_x;       
output          wb_entry_pmp_deny_x;   
output          wb_entry_sc_fail_x;    
output          wb_entry_split_first_x; 
output          wb_entry_vld_x;        
output  [31:0]  wb_entryx_addr;        
output  [2 :0]  wb_entryx_dbginfo;     
output  [5 :0]  wb_entryx_dest_preg;   
output  [3 :0]  wb_entryx_prot;        
output  [2 :0]  wb_entryx_shift;       
output  [1 :0]  wb_entryx_size;        
output  [31:0]  wb_entryx_wdata;       
output          wb_so_req_x;           

// &Regs; @21
reg             req_mask_f;            
reg     [31:0]  wb_entry_addr;         
reg             wb_entry_addr_vld;     
reg             wb_entry_buf;          
reg     [3 :0]  wb_entry_bytes_vld;    
reg             wb_entry_ca;           
reg     [5 :0]  wb_entry_dest_preg;    
reg             wb_entry_fls;          
reg             wb_entry_lock;         
reg             wb_entry_mach_mode;    
reg             wb_entry_pmp_deny;     
reg             wb_entry_sc_fail;      
reg             wb_entry_sc_inst;      
reg     [2 :0]  wb_entry_shift;        
reg     [1 :0]  wb_entry_size;         
reg             wb_entry_so;           
reg             wb_entry_split_first;  
reg             wb_entry_src1_depd;    
reg     [5 :0]  wb_entry_src1_reg;     
reg             wb_entry_vld;          
reg     [31:0]  wb_entry_wdata;        

// &Wires; @22
wire            ag_addr_hit;           
wire            ag_ld_inst;            
wire            ag_ncb_inst_vld_dp;    
wire            bytes_vld_hit;         
wire            cp0_lsu_icg_en;        
wire            cpurst_b;              
wire    [31:0]  da_xx_fwd_data;        
wire            da_xx_fwd_fls;         
wire    [5 :0]  da_xx_fwd_preg;        
wire            da_xx_fwd_vld;         
wire            forever_cpuclk;        
wire    [31:0]  fwd_data;              
wire            fwd_fpu;               
wire    [31:0]  fwd_fpu_data;          
wire            fwd_lsu;               
wire            fwd_vld;               
wire            ifu_lsu_warm_up;       
wire            ld_hit_wb_f_x;         
wire            ld_hit_wb_x;           
wire            pad_yy_icg_scan_en;    
wire            req_mask;              
wire    [31:0]  rtu_lsu_fgpr_wb_data;  
wire    [4 :0]  rtu_lsu_fgpr_wb_reg;   
wire            rtu_lsu_fgpr_wb_vld;   
wire            rtu_yy_xx_async_flush; 
wire            wb_addr_pop_en_x;      
wire            wb_clk;                
wire    [31:0]  wb_create_addr;        
wire            wb_create_buf;         
wire    [7 :0]  wb_create_bytes_vld;   
wire            wb_create_ca;          
wire    [31:0]  wb_create_data;        
wire    [5 :0]  wb_create_dest_preg;   
wire            wb_create_en_dp_x;     
wire            wb_create_en_x;        
wire            wb_create_fls;         
wire            wb_create_lock;        
wire            wb_create_mach_mode;   
wire            wb_create_pmp_deny;    
wire            wb_create_sc_fail;     
wire            wb_create_sc_inst;     
wire    [3 :0]  wb_create_shift;       
wire    [1 :0]  wb_create_size;        
wire            wb_create_so;          
wire            wb_create_split_first; 
wire            wb_create_src1_depd;   
wire    [5 :0]  wb_create_src1_reg;    
wire            wb_data_clk;           
wire            wb_data_clk_en;        
wire            wb_data_pop_en_x;      
wire            wb_entry_addr_vld_x;   
wire    [7 :0]  wb_entry_bytes_vld_ext; 
wire            wb_entry_clk;          
wire            wb_entry_clk_en;       
wire            wb_entry_data_vld_x;   
wire            wb_entry_dw;           
wire            wb_entry_fls_x;        
wire            wb_entry_lock_x;       
wire            wb_entry_lrsc_x;       
wire            wb_entry_pmp_deny_x;   
wire            wb_entry_sc_fail_x;    
wire            wb_entry_split_first_x; 
wire            wb_entry_vld_x;        
wire    [31:0]  wb_entryx_addr;        
wire    [2 :0]  wb_entryx_dbginfo;     
wire    [5 :0]  wb_entryx_dest_preg;   
wire    [3 :0]  wb_entryx_prot;        
wire    [2 :0]  wb_entryx_shift;       
wire    [1 :0]  wb_entryx_size;        
wire    [31:0]  wb_entryx_wdata;       
wire            wb_so_req_x;           


parameter DATAW = `FLEN;

always@(posedge wb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wb_entry_vld <= 1'b0;
  else if (rtu_yy_xx_async_flush)
    wb_entry_vld <= 1'b0;
  else if (wb_create_en_x)
    wb_entry_vld <= 1'b1;
  else if (wb_data_pop_en_x)
    wb_entry_vld <= 1'b0;
end

always@(posedge wb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wb_entry_addr_vld <= 1'b0;
  else if (rtu_yy_xx_async_flush)
    wb_entry_addr_vld <= 1'b0;
  else if (wb_create_en_x)
    wb_entry_addr_vld <= 1'b1;
  else if (wb_addr_pop_en_x)
    wb_entry_addr_vld <= 1'b0;
end

// &Force("bus", "wb_create_shift",3,0); @50
always@(posedge wb_entry_clk)
begin
  if (wb_create_en_dp_x | ifu_lsu_warm_up) begin
    wb_entry_addr[31:0]     <= wb_create_addr[31:0];
    wb_entry_size[1:0]      <= wb_create_size[1:0];
    wb_entry_fls            <= wb_create_fls;
    wb_entry_ca             <= wb_create_ca;
    wb_entry_buf            <= wb_create_buf;
    wb_entry_so             <= wb_create_so;
    wb_entry_mach_mode      <= wb_create_mach_mode;
    wb_entry_lock           <= wb_create_lock;
    wb_entry_sc_inst        <= wb_create_sc_inst;
    wb_entry_pmp_deny       <= wb_create_pmp_deny;
    wb_entry_sc_fail        <= wb_create_sc_fail;
    wb_entry_dest_preg[5:0] <= wb_create_dest_preg[5:0];
    wb_entry_src1_reg[5:0]  <= wb_create_src1_reg[5:0];
    wb_entry_shift[2:0]     <= wb_create_shift[2:0];
    wb_entry_split_first    <= wb_create_split_first;
  end
end

// &CombBeg; @112
always @( wb_entry_addr[1:0]
       or wb_entry_size[1:0])
begin
  casez({wb_entry_size[1:0],wb_entry_addr[1:0]})
    4'b0000: wb_entry_bytes_vld[3:0] = 4'b0001;
    4'b0001: wb_entry_bytes_vld[3:0] = 4'b0010;
    4'b0010: wb_entry_bytes_vld[3:0] = 4'b0100;
    4'b0011: wb_entry_bytes_vld[3:0] = 4'b1000;
    4'b0100: wb_entry_bytes_vld[3:0] = 4'b0011;
    4'b0110: wb_entry_bytes_vld[3:0] = 4'b1100;
    4'b1?00: wb_entry_bytes_vld[3:0] = 4'b1111;
    default: wb_entry_bytes_vld[3:0] = 4'b1111;
  endcase
// &CombEnd; @123
end

assign wb_entry_dw = wb_entry_size[1:0] == 2'b11;

assign wb_entry_bytes_vld_ext[7:0] = wb_entry_addr[2]
                                   ? {wb_entry_bytes_vld[3:0], 4'b0000}
                                   : {{4{wb_entry_dw}},wb_entry_bytes_vld[3:0]};

//assign depd_ex2  = lsu_xx_ex2_data_vld &
//                   (wb_entry_fls == lsu_xx_ex2_fls) &
//                   (wb_entry_src1_reg[5:0] == lsu_xx_ex2_preg[5:0]);
assign fwd_lsu   = da_xx_fwd_vld &
//                   !depd_ex2 &
                   (wb_entry_fls == da_xx_fwd_fls) &
                   (wb_entry_src1_reg[5:0] == da_xx_fwd_preg[5:0]);

assign fwd_fpu   = rtu_lsu_fgpr_wb_vld & wb_entry_fls &
                   (wb_entry_src1_reg[4:0] == rtu_lsu_fgpr_wb_reg[4:0]);
assign fwd_fpu_data[DATAW-1:0] 
                 = rtu_lsu_fgpr_wb_data[DATAW-1:0];
assign fwd_vld   = wb_entry_vld & wb_entry_src1_depd & (fwd_lsu | fwd_fpu);
assign fwd_data[DATAW-1:0] = fwd_lsu
                             ? da_xx_fwd_data[DATAW-1:0]
                             : fwd_fpu_data[DATAW-1:0]; 

always@(posedge wb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wb_entry_src1_depd <= 1'b0;
  else if (wb_create_en_dp_x)
    wb_entry_src1_depd <= wb_create_src1_depd;
  else if (fwd_vld)
    wb_entry_src1_depd <= 1'b0;
end

always@(posedge wb_data_clk)
begin
  if (wb_create_en_dp_x | ifu_lsu_warm_up)
    wb_entry_wdata[DATAW-1:0] <= wb_create_data[DATAW-1:0];
  else if (fwd_vld)
    wb_entry_wdata[DATAW-1:0] <= fwd_data[DATAW-1:0];
end

//output
assign wb_entry_vld_x       = wb_entry_vld;
assign wb_entry_addr_vld_x  = wb_entry_addr_vld & !wb_entry_src1_depd;
assign wb_entry_data_vld_x  = wb_entry_vld & !wb_entry_src1_depd;
assign wb_entryx_addr[31:0] = wb_entry_addr[31:0];
assign wb_entryx_size[1:0]  = wb_entry_size[1:0];
assign wb_entry_fls_x       = wb_entry_fls;
assign wb_entry_lock_x      = wb_entry_lock;
assign wb_entry_lrsc_x      = wb_entry_sc_inst;
assign wb_entryx_prot[3:0]  = {wb_entry_ca,wb_entry_buf,wb_entry_mach_mode,1'b1};
assign wb_entry_pmp_deny_x  = wb_entry_pmp_deny;
assign wb_entry_sc_fail_x   = wb_entry_sc_fail;
assign wb_so_req_x          = wb_entry_addr_vld & wb_entry_so;
assign wb_entry_split_first_x = wb_entry_split_first;

assign wb_entryx_wdata[DATAW-1:0] = wb_entry_wdata[DATAW-1:0];
assign wb_entryx_dest_preg[5:0] = wb_entry_dest_preg[5:0];
assign wb_entryx_shift[2:0]     = wb_entry_shift[2:0];

// //&Force("bus","ag_ncb_addr",31,0); @202
assign ag_addr_hit   = wb_create_addr[31:3] == wb_entry_addr[31:3];
assign bytes_vld_hit = |(wb_create_bytes_vld[7:0] & wb_entry_bytes_vld_ext[7:0]);

assign req_mask    = wb_entry_addr_vld & ag_ncb_inst_vld_dp & ag_ld_inst & ag_addr_hit & bytes_vld_hit;

always@(posedge wb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    req_mask_f <= 1'b0;
  else if (wb_create_en_dp_x)
    req_mask_f <= 1'b0;
  else if (wb_addr_pop_en_x)
    req_mask_f <= 1'b0;
  else if (req_mask)
    req_mask_f <= 1'b1;
end

assign ld_hit_wb_x   = wb_entry_addr_vld & !req_mask_f & ag_ld_inst & ag_addr_hit & bytes_vld_hit;
assign ld_hit_wb_f_x = wb_entry_addr_vld & req_mask_f;

assign wb_entry_clk_en = wb_create_en_dp_x | ifu_lsu_warm_up;
// &Instance("gated_clk_cell", "x_pa_lsu_wb_entry_gated_clk"); @224
gated_clk_cell  x_pa_lsu_wb_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wb_entry_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (wb_entry_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @225
//          .external_en (1'b0), @226
//          .global_en   (1'b1), @227
//          .module_en     (cp0_lsu_icg_en     ), @228
//          .local_en    (wb_entry_clk_en), @229
//          .clk_out     (wb_entry_clk)); @230

assign wb_data_clk_en = wb_create_en_dp_x | ifu_lsu_warm_up | fwd_vld;
// &Instance("gated_clk_cell", "x_pa_lsu_wb_data_gated_clk"); @233
gated_clk_cell  x_pa_lsu_wb_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wb_data_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (wb_data_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @234
//          .external_en (1'b0), @235
//          .global_en   (1'b1), @236
//          .module_en     (cp0_lsu_icg_en     ), @237
//          .local_en    (wb_data_clk_en), @238
//          .clk_out     (wb_data_clk)); @239

assign wb_entryx_dbginfo[2:0] = {req_mask_f,wb_entry_addr_vld,wb_entry_vld};

// &ModuleEnd; @243
endmodule


