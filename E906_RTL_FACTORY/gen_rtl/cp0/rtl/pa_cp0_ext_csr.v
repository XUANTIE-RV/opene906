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

// &ModuleBeg; @23
module pa_cp0_ext_csr(
  cp0_biu_icg_en,
  cp0_dtu_icg_en,
  cp0_dtu_pcfifo_frz,
  cp0_fpu_icg_en,
  cp0_hpcp_icg_en,
  cp0_idu_icg_en,
  cp0_idu_spec_push_en,
  cp0_idu_swap_sp_en,
  cp0_ifu_bht_en,
  cp0_ifu_bht_inv,
  cp0_ifu_btb_clr,
  cp0_ifu_btb_en,
  cp0_ifu_icache_en,
  cp0_ifu_icache_inv_addr,
  cp0_ifu_icache_inv_req,
  cp0_ifu_icache_inv_type,
  cp0_ifu_icg_en,
  cp0_ifu_ras_en,
  cp0_ifu_rst_inv_done,
  cp0_iu_icg_en,
  cp0_lsu_dcache_en,
  cp0_lsu_dcache_wa,
  cp0_lsu_dcache_wb,
  cp0_lsu_icc_addr,
  cp0_lsu_icc_op,
  cp0_lsu_icc_req,
  cp0_lsu_icc_type,
  cp0_lsu_icg_en,
  cp0_pmp_icg_en,
  cp0_rtu_icg_en,
  cp0_rtu_in_expt,
  cp0_rtu_wfe_en,
  cp0_xx_async_expt_en,
  cpurst_b,
  ext_inst_ifu_icc_addr,
  ext_inst_ifu_icc_req,
  ext_inst_ifu_icc_type,
  ext_inst_ifu_inv_done,
  ext_inst_lsu_icc_addr,
  ext_inst_lsu_icc_done,
  ext_inst_lsu_icc_op,
  ext_inst_lsu_icc_req,
  ext_inst_lsu_icc_type,
  forever_cpuclk,
  ifu_cp0_bht_inv_done,
  ifu_cp0_icache_inv_done,
  ifu_cp0_rst_inv_req,
  inv_sm_clk,
  iui_regs_inst_mret,
  iui_regs_wdata,
  iui_regs_wdata_srst,
  lsu_cp0_icc_done,
  mexstatus_local_en,
  mexstatus_value,
  mhcr_local_en,
  mhcr_value,
  mhint2_local_en,
  mhint2_value,
  mhint_local_en,
  mhint_value,
  mraddr_value,
  pad_yy_icg_scan_en,
  regs_clk,
  regs_cpu_in_int,
  regs_cpu_in_nmi,
  regs_flush_clk,
  regs_special_lpmd,
  regs_spswap_en,
  regs_srst_srst_vld,
  regs_srst_srstmd,
  rst_top_op_done,
  rtu_cp0_bus_error,
  rtu_cp0_lockup_clr,
  rtu_cp0_lockup_vld,
  rtu_cp0_nmi_vld,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vld,
  special_dcache_clean,
  special_icache_inv,
  special_icache_inv_done,
  special_regs_clk_en,
  special_regs_inv_sm_clk_en,
  sysio_cp0_clkratio,
  sysio_cp0_rst_addr
);

// &Ports; @24
input           cpurst_b;                  
input   [31:0]  ext_inst_ifu_icc_addr;     
input           ext_inst_ifu_icc_req;      
input           ext_inst_ifu_icc_type;     
input   [31:0]  ext_inst_lsu_icc_addr;     
input   [1 :0]  ext_inst_lsu_icc_op;       
input           ext_inst_lsu_icc_req;      
input   [1 :0]  ext_inst_lsu_icc_type;     
input           forever_cpuclk;            
input           ifu_cp0_bht_inv_done;      
input           ifu_cp0_icache_inv_done;   
input           ifu_cp0_rst_inv_req;       
input           iui_regs_inst_mret;        
input   [31:0]  iui_regs_wdata;            
input   [1 :0]  iui_regs_wdata_srst;       
input           lsu_cp0_icc_done;          
input           mexstatus_local_en;        
input           mhcr_local_en;             
input           mhint2_local_en;           
input           mhint_local_en;            
input           pad_yy_icg_scan_en;        
input           regs_clk;                  
input           regs_cpu_in_int;           
input           regs_flush_clk;            
input           rtu_cp0_bus_error;         
input           rtu_cp0_lockup_clr;        
input           rtu_cp0_lockup_vld;        
input           rtu_cp0_nmi_vld;           
input           rtu_yy_xx_dbgon;           
input           rtu_yy_xx_expt_int;        
input           rtu_yy_xx_expt_vld;        
input           special_dcache_clean;      
input           special_icache_inv;        
input           special_regs_clk_en;       
input           special_regs_inv_sm_clk_en; 
input   [2 :0]  sysio_cp0_clkratio;        
input   [31:0]  sysio_cp0_rst_addr;        
output          cp0_biu_icg_en;            
output          cp0_dtu_icg_en;            
output          cp0_dtu_pcfifo_frz;        
output          cp0_fpu_icg_en;            
output          cp0_hpcp_icg_en;           
output          cp0_idu_icg_en;            
output          cp0_idu_spec_push_en;      
output          cp0_idu_swap_sp_en;        
output          cp0_ifu_bht_en;            
output          cp0_ifu_bht_inv;           
output          cp0_ifu_btb_clr;           
output          cp0_ifu_btb_en;            
output          cp0_ifu_icache_en;         
output  [31:0]  cp0_ifu_icache_inv_addr;   
output          cp0_ifu_icache_inv_req;    
output          cp0_ifu_icache_inv_type;   
output          cp0_ifu_icg_en;            
output          cp0_ifu_ras_en;            
output          cp0_ifu_rst_inv_done;      
output          cp0_iu_icg_en;             
output          cp0_lsu_dcache_en;         
output          cp0_lsu_dcache_wa;         
output          cp0_lsu_dcache_wb;         
output  [31:0]  cp0_lsu_icc_addr;          
output  [1 :0]  cp0_lsu_icc_op;            
output          cp0_lsu_icc_req;           
output  [1 :0]  cp0_lsu_icc_type;          
output          cp0_lsu_icg_en;            
output          cp0_pmp_icg_en;            
output          cp0_rtu_icg_en;            
output          cp0_rtu_in_expt;           
output          cp0_rtu_wfe_en;            
output          cp0_xx_async_expt_en;      
output          ext_inst_ifu_inv_done;     
output          ext_inst_lsu_icc_done;     
output          inv_sm_clk;                
output  [31:0]  mexstatus_value;           
output  [31:0]  mhcr_value;                
output  [31:0]  mhint2_value;              
output  [31:0]  mhint_value;               
output  [31:0]  mraddr_value;              
output          regs_cpu_in_nmi;           
output  [1 :0]  regs_special_lpmd;         
output          regs_spswap_en;            
output          regs_srst_srst_vld;        
output  [1 :0]  regs_srst_srstmd;          
output          rst_top_op_done;           
output          special_icache_inv_done;   

// &Regs; @25
reg             bpe;                       
reg             de;                        
reg             ie;                        
reg             l0btb;                     
reg             mexstatus_bus_err;         
reg             mexstatus_expt;            
reg             mexstatus_lockup;          
reg     [1 :0]  mexstatus_lpmd;            
reg             mexstatus_nmi;             
reg     [1 :0]  mexstatus_rstmd;           
reg             mexstatus_spswapen;        
reg             mexstatus_spushen;         
reg             mexstatus_wfeen;           
reg             mhint_aee;                 
reg     [8 :0]  module_icg_en;             
reg             pcfifo_freeze;             
reg             rs;                        
reg     [1 :0]  rst_bht_inv;               
reg     [1 :0]  rst_bht_inv_nxt;           
reg     [1 :0]  rst_cache_inv;             
reg     [1 :0]  rst_cache_inv_nxt;         
reg     [1 :0]  rst_dcache_inv;            
reg     [1 :0]  rst_dcache_inv_nxt;        
reg     [1 :0]  rst_icache_inv;            
reg     [1 :0]  rst_icache_inv_nxt;        
reg             wa;                        
reg             wb;                        

// &Wires; @26
wire    [1 :0]  amr;                       
wire            bht_inv_req;               
wire            bht_rst_inv_req;           
wire    [2 :0]  clk_ratio;                 
wire            cp0_biu_icg_en;            
wire            cp0_dtu_icg_en;            
wire            cp0_dtu_pcfifo_frz;        
wire            cp0_fpu_icg_en;            
wire            cp0_hpcp_icg_en;           
wire            cp0_idu_icg_en;            
wire            cp0_idu_spec_push_en;      
wire            cp0_idu_swap_sp_en;        
wire            cp0_ifu_bht_en;            
wire            cp0_ifu_bht_inv;           
wire            cp0_ifu_btb_clr;           
wire            cp0_ifu_btb_en;            
wire            cp0_ifu_icache_en;         
wire    [31:0]  cp0_ifu_icache_inv_addr;   
wire            cp0_ifu_icache_inv_req;    
wire            cp0_ifu_icache_inv_type;   
wire            cp0_ifu_icg_en;            
wire            cp0_ifu_ras_en;            
wire            cp0_ifu_rst_inv_done;      
wire            cp0_iu_icg_en;             
wire            cp0_lsu_dcache_en;         
wire            cp0_lsu_dcache_wa;         
wire            cp0_lsu_dcache_wb;         
wire    [31:0]  cp0_lsu_icc_addr;          
wire    [1 :0]  cp0_lsu_icc_op;            
wire            cp0_lsu_icc_req;           
wire    [1 :0]  cp0_lsu_icc_type;          
wire            cp0_lsu_icg_en;            
wire            cp0_pmp_icg_en;            
wire            cp0_rtu_icg_en;            
wire            cp0_rtu_in_expt;           
wire            cp0_rtu_wfe_en;            
wire            cp0_xx_async_expt_en;      
wire            cpurst_b;                  
wire    [1 :0]  dcache_pref_dist;          
wire            dcache_pref_en;            
wire            dcache_rst_inv_req;        
wire            ext_ifu_inv_done;          
wire    [31:0]  ext_inst_ifu_icc_addr;     
wire            ext_inst_ifu_icc_req;      
wire            ext_inst_ifu_icc_type;     
wire            ext_inst_ifu_inv_done;     
wire    [31:0]  ext_inst_lsu_icc_addr;     
wire            ext_inst_lsu_icc_done;     
wire    [1 :0]  ext_inst_lsu_icc_op;       
wire            ext_inst_lsu_icc_req;      
wire    [1 :0]  ext_inst_lsu_icc_type;     
wire            forever_cpuclk;            
wire            icache_inv_req;            
wire            icache_rst_inv_req;        
wire            ifu_cp0_bht_inv_done;      
wire            ifu_cp0_icache_inv_done;   
wire            ifu_cp0_rst_inv_req;       
wire            inst_dcache_op;            
wire            inst_icache_op;            
wire            inv_sm_clk;                
wire            inv_sm_clk_en;             
wire            iui_regs_inst_mret;        
wire    [31:0]  iui_regs_wdata;            
wire    [1 :0]  iui_regs_wdata_srst;       
wire            lsu_cp0_icc_done;          
wire            mexstatus_local_en;        
wire    [31:0]  mexstatus_value;           
wire            mhcr_local_en;             
wire    [31:0]  mhcr_value;                
wire            mhint2_local_en;           
wire    [31:0]  mhint2_value;              
wire            mhint_local_en;            
wire    [31:0]  mhint_value;               
wire    [31:0]  mraddr_value;              
wire            pad_yy_icg_scan_en;        
wire            regs_clk;                  
wire            regs_cpu_in_int;           
wire            regs_cpu_in_nmi;           
wire            regs_doing_inv;            
wire            regs_flush_clk;            
wire    [1 :0]  regs_special_lpmd;         
wire            regs_spswap_en;            
wire            regs_srst_srst_vld;        
wire    [1 :0]  regs_srst_srstmd;          
wire            rst_inv_done;              
wire            rst_top_op_done;           
wire    [1 :0]  rstmd_in;                  
wire            rtu_cp0_bus_error;         
wire            rtu_cp0_lockup_clr;        
wire            rtu_cp0_lockup_vld;        
wire            rtu_cp0_nmi_vld;           
wire            rtu_yy_xx_dbgon;           
wire            rtu_yy_xx_expt_int;        
wire            rtu_yy_xx_expt_vld;        
wire            special_dcache_clean;      
wire            special_icache_inv;        
wire            special_icache_inv_done;   
wire            special_regs_clk_en;       
wire            special_regs_inv_sm_clk_en; 
wire            srst_vld;                  
wire    [2 :0]  sysio_cp0_clkratio;        
wire    [31:0]  sysio_cp0_rst_addr;        


// &Force("bus", "iui_regs_wdata", 31, 0); @28
//==========================================================
//               Define the MHCR register
//  Machine Hardwire Control Register
//  32-bit Machine Mode Read/Write
//  the definiton for MHSR register is listed as follows
//==========================================================
assign clk_ratio[2:0] = sysio_cp0_clkratio[2:0];

always @ (posedge regs_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    l0btb <= 1'b0;
    bpe   <= 1'b0;
    rs    <= 1'b0;
  end
  else if (mhcr_local_en) begin
    l0btb <= iui_regs_wdata[12];
    bpe   <= iui_regs_wdata[5];
    rs    <= iui_regs_wdata[4];
  end
  else begin
    l0btb <= l0btb;
    bpe   <= bpe;
    rs    <= rs;
  end
end

always @ (posedge regs_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    wa    <= 1'b0;
    wb    <= 1'b0;
    de    <= 1'b0;
  end
  else if (mhcr_local_en) begin
    wa    <= iui_regs_wdata[3];
    wb    <= iui_regs_wdata[2];
    de    <= iui_regs_wdata[1];
  end
  else begin
    wa    <= wa;
    wb    <= wb;
    de    <= de;
  end
end

always @ (posedge regs_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ie    <= 1'b0;
  else if (mhcr_local_en)
    ie    <= iui_regs_wdata[0];
  else
    ie    <= ie;
end

assign mhcr_value[31:0] = {13'b0, clk_ratio[2:0], 3'b0, l0btb, // [31:12]
                           6'b0, bpe, rs, wa, wb, de, ie};     // [11:0]


//==========================================================
//               Define the MHINT register
//  Machine Register
//  32-bit Machine Mode Read/Write
//  the definiton for MHSR register is listed as follows
//==========================================================

always @ (posedge regs_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    mhint_aee  <= 1'b0;
  end
  else if (mhint_local_en) begin
    mhint_aee  <= iui_regs_wdata[20];
  end
  else begin
    mhint_aee  <= mhint_aee;
  end
end
assign dcache_pref_dist[1:0] = 2'b0;
assign amr[1:0]              = 2'b0;
assign dcache_pref_en        = 1'b0;




assign mhint_value[31:0] = {7'b0,pcfifo_freeze,3'b0, mhint_aee,5'b0,dcache_pref_dist[1:0],8'b0,amr[1:0], dcache_pref_en, 2'b0};

always @(posedge regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pcfifo_freeze <= 1'b0;
  else if(mhint_local_en)
    pcfifo_freeze <= iui_regs_wdata[24];
  else
    pcfifo_freeze <= pcfifo_freeze; 
end

always @(posedge regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    module_icg_en[8:0] <= 9'b0;
  end
  else if(mhint2_local_en) begin
    module_icg_en[8:0] <= iui_regs_wdata[22:14];
  end
  else begin
    module_icg_en[8:0] <= module_icg_en[8:0];
  end
end

assign mhint2_value[31:0] = {9'b0,
                             module_icg_en[8:0], 14'b0};
//for ifu control
assign cp0_ifu_icg_en = module_icg_en[0];
assign cp0_idu_icg_en = module_icg_en[1];
assign cp0_iu_icg_en  = module_icg_en[2];
assign cp0_hpcp_icg_en = module_icg_en[2];
assign cp0_lsu_icg_en = module_icg_en[3];
assign cp0_pmp_icg_en = module_icg_en[4];
assign cp0_biu_icg_en = module_icg_en[5];
assign cp0_rtu_icg_en = module_icg_en[6];
assign cp0_fpu_icg_en = module_icg_en[7];
assign cp0_dtu_icg_en     = module_icg_en[8];
//==========================================================
//               Define the MRADDR register
//  Machine Register
//  32-bit Machine Mode Read/Write
//  the definiton for MRADDR register is listed as follows
//==========================================================
assign mraddr_value[31:0] = sysio_cp0_rst_addr[31:0];

//==========================================================
//               Define the MEXSTATUS register
//  Machine Register
//  32-bit Machine Mode Read/Write
//  the definiton for MEXSTATUS register is listed as follows
//==========================================================
assign rstmd_in[1:0] = &iui_regs_wdata_srst[1:0] ? 2'b0 : iui_regs_wdata_srst[1:0];
// Use individed signal to opt timing.

always @ (posedge regs_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    mexstatus_rstmd[1:0] <= 2'b0;
    mexstatus_lpmd[1:0]  <= 2'b0;
    mexstatus_wfeen      <= 1'b1;
  end
  else if (mexstatus_local_en) begin
    mexstatus_rstmd[1:0] <= rstmd_in[1:0];
    mexstatus_lpmd[1:0]  <= {1'b0, iui_regs_wdata[2]};
    mexstatus_wfeen      <= iui_regs_wdata[4];
  end
end
assign srst_vld = mexstatus_local_en && |rstmd_in[1:0];

always @ (posedge regs_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    mexstatus_spushen    <= 1'b0;
    mexstatus_spswapen   <= 1'b0;
  end
  else if (mexstatus_local_en) begin
    mexstatus_spushen    <= iui_regs_wdata[16];
    mexstatus_spswapen   <= iui_regs_wdata[17];
  end
end

always @ (posedge regs_flush_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mexstatus_expt <= 1'b0;
  else if (mexstatus_local_en && rtu_yy_xx_dbgon)
    mexstatus_expt <= iui_regs_wdata[5];
  else if (rtu_cp0_lockup_clr)
    mexstatus_expt <= 1'b0;
  else if (rtu_yy_xx_expt_vld && !rtu_yy_xx_expt_int && !rtu_cp0_nmi_vld)
    mexstatus_expt <= 1'b1;
  else if (iui_regs_inst_mret && !mexstatus_nmi && !regs_cpu_in_int)
    mexstatus_expt <= 1'b0;
end

always @ (posedge regs_flush_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mexstatus_nmi <= 1'b0;
  else if (mexstatus_local_en && rtu_yy_xx_dbgon)
    mexstatus_nmi <= iui_regs_wdata[7];
  else if (rtu_cp0_lockup_clr)
    mexstatus_nmi <= 1'b0;
  else if (rtu_cp0_nmi_vld)
    mexstatus_nmi <= 1'b1;
  else if (iui_regs_inst_mret)
    mexstatus_nmi <= 1'b0;
end

always @ (posedge regs_flush_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mexstatus_bus_err <= 1'b0;
  else if (rtu_yy_xx_expt_vld && !rtu_yy_xx_expt_int)
    mexstatus_bus_err <= rtu_cp0_bus_error;
  else if (mexstatus_local_en)
    mexstatus_bus_err <= iui_regs_wdata[8];
end

always @ (posedge regs_flush_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mexstatus_lockup <= 1'b0;
  else if (rtu_cp0_lockup_clr)
    mexstatus_lockup <= 1'b0;
  else if (rtu_cp0_lockup_vld)
    mexstatus_lockup <= 1'b1;
end

assign mexstatus_value[31:0] = {14'b0, mexstatus_spswapen, mexstatus_spushen,
                                7'b0, mexstatus_bus_err, mexstatus_nmi, mexstatus_lockup, mexstatus_expt,
                                mexstatus_wfeen, mexstatus_lpmd[1:0], mexstatus_rstmd[1:0]};

// MNMICAUSE, MNMIPC is in trap_csr.

//==========================================================
// CP0 Extension CSR Module
//==========================================================
assign inv_sm_clk_en = regs_doing_inv
                    || special_regs_inv_sm_clk_en
                    || inst_dcache_op
                    || icache_inv_req;

// &Instance("gated_clk_cell", "x_inv_sm_gated_clk"); @307
gated_clk_cell  x_inv_sm_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (inv_sm_clk         ),
  .external_en         (1'b0               ),
  .global_en           (special_regs_clk_en),
  .local_en            (1'b0               ),
  .module_en           (inv_sm_clk_en      ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @308
//          .external_en (1'b0), @309
//          .global_en   (special_regs_clk_en), @310
//          .module_en   (inv_sm_clk_en), @311
//          .local_en    (1'b0), @312
//          .clk_out     (inv_sm_clk)); @313
// &Force("output", "inv_sm_clk"); @314

parameter RST_IDLE = 2'b00;
parameter RST_WFC  = 2'b01;
parameter RST_DONE = 2'b10;
//==========================================================
//              FSM of reset cache inv cctl logic
//==========================================================
always @(posedge inv_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rst_cache_inv[1:0] <= RST_IDLE;
  else
    rst_cache_inv[1:0] <= rst_cache_inv_nxt[1:0];
end

// &CombBeg; @330
always @( rst_cache_inv
       or rst_inv_done
       or ifu_cp0_rst_inv_req)
begin
case(rst_cache_inv)
  RST_IDLE:
  begin
    if(ifu_cp0_rst_inv_req)
      rst_cache_inv_nxt[1:0] = RST_WFC;
    else
      rst_cache_inv_nxt[1:0] = RST_IDLE;
  end
  RST_WFC:
  begin
    if(rst_inv_done)
      rst_cache_inv_nxt[1:0] = RST_IDLE;
    else
      rst_cache_inv_nxt[1:0] = RST_WFC;
  end
  default:
  begin
    rst_cache_inv_nxt[1:0] = RST_IDLE;
  end
endcase
// &CombEnd; @351
end

assign rst_inv_done         = rst_icache_inv[1:0] == RST_IDLE && 
                              rst_dcache_inv[1:0] == RST_IDLE && 
                              rst_bht_inv[1:0] == RST_IDLE;
assign cp0_ifu_rst_inv_done = rst_cache_inv[1:0] == RST_IDLE && !ifu_cp0_rst_inv_req;

//==========================================================
//                ICache Operation
//==========================================================
assign inst_icache_op = ext_inst_ifu_icc_req
                     || special_icache_inv;

assign icache_inv_req = (ifu_cp0_rst_inv_req | inst_icache_op) & (rst_bht_inv[1:0] == RST_IDLE);

always @(posedge inv_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rst_icache_inv[1:0] <= RST_IDLE;
  else
    rst_icache_inv[1:0] <= rst_icache_inv_nxt[1:0];
end

// &CombBeg; @374
always @( rst_icache_inv
       or ext_ifu_inv_done
       or ifu_cp0_icache_inv_done
       or icache_inv_req)
begin
case(rst_icache_inv)
  RST_IDLE:
  begin
    if(icache_inv_req)      
      rst_icache_inv_nxt[1:0] = RST_WFC;
    else
      rst_icache_inv_nxt[1:0] = RST_IDLE;
  end
  RST_WFC:
  begin
    if(ifu_cp0_icache_inv_done)
      rst_icache_inv_nxt[1:0] = RST_DONE;
    else
      rst_icache_inv_nxt[1:0] = RST_WFC;
  end
  RST_DONE:
    if (ext_ifu_inv_done)
      rst_icache_inv_nxt[1:0] = RST_IDLE;
    else
      rst_icache_inv_nxt[1:0] = RST_DONE;
  default:
  begin
    rst_icache_inv_nxt[1:0] = RST_IDLE;
  end
endcase
// &CombEnd; @400
end

//assign icache_sm_idle    = rst_icache_inv[1:0] == RST_IDLE;
//assign icache_sm_done    = rst_icache_inv[1:0] == RST_DONE;
//assign icache_op_done    = icache_sm_idle & ~icache_inv_req |
//                           icache_sm_done;

assign bht_inv_req = (ifu_cp0_rst_inv_req | inst_icache_op) & (rst_icache_inv[1:0] == RST_IDLE);

always @(posedge inv_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rst_bht_inv[1:0] <= RST_IDLE;
  else
    rst_bht_inv[1:0] <= rst_bht_inv_nxt[1:0];
end

// &CombBeg; @417
always @( bht_inv_req
       or ext_ifu_inv_done
       or ifu_cp0_bht_inv_done
       or rst_bht_inv)
begin
case(rst_bht_inv)
  RST_IDLE:
  begin
    if(bht_inv_req)
      rst_bht_inv_nxt[1:0] = RST_WFC;
    else
      rst_bht_inv_nxt[1:0] = RST_IDLE;
  end
  RST_WFC:
  begin
    if(ifu_cp0_bht_inv_done)
      rst_bht_inv_nxt[1:0] = RST_DONE;
    else
      rst_bht_inv_nxt[1:0] = RST_WFC;
  end
  RST_DONE:
    if (ext_ifu_inv_done)
      rst_bht_inv_nxt[1:0] = RST_IDLE;
    else
      rst_bht_inv_nxt[1:0] = RST_DONE;
  default:
  begin
    rst_bht_inv_nxt[1:0] = RST_IDLE;
  end
endcase
// &CombEnd; @443
end
//assign bht_sm_idle    = rst_bht_inv[1:0] == RST_IDLE;
//assign bht_sm_done    = rst_bht_inv[1:0] == RST_DONE;
//assign bht_op_done    = bht_sm_idle & ~bht_inv_req |
//                        bht_sm_done;
//==========================================================
//                DCache Operation
//==========================================================
assign inst_dcache_op = ext_inst_lsu_icc_req
                     || special_dcache_clean;

always @(posedge inv_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rst_dcache_inv[1:0] <= RST_IDLE;
  else
    rst_dcache_inv[1:0] <= rst_dcache_inv_nxt[1:0];
end

// &CombBeg; @462
always @( inst_dcache_op
       or rst_dcache_inv
       or ifu_cp0_rst_inv_req
       or lsu_cp0_icc_done)
begin
case(rst_dcache_inv)
  RST_IDLE:
  begin
    if(ifu_cp0_rst_inv_req)
      rst_dcache_inv_nxt[1:0] = RST_WFC;
    else if (inst_dcache_op)
      rst_dcache_inv_nxt[1:0] = RST_WFC;
    else
      rst_dcache_inv_nxt[1:0] = RST_IDLE;
  end
  RST_WFC:
  begin
    if(lsu_cp0_icc_done)
      rst_dcache_inv_nxt[1:0] = RST_DONE;
    else
      rst_dcache_inv_nxt[1:0] = RST_WFC;
  end
  RST_DONE:
    rst_dcache_inv_nxt[1:0] = RST_IDLE;
  default:
  begin
    rst_dcache_inv_nxt[1:0] = RST_IDLE;
  end
endcase
// &CombEnd; @487
end

//assign dcache_sm_idle    = rst_dcache_inv[1:0] == RST_IDLE;
//assign dcache_sm_done    = rst_dcache_inv[1:0] == RST_DONE;
//assign dcache_op_done    = dcache_sm_idle & ~dcache_inv_req |
//                           dcache_sm_done;
                           
assign regs_doing_inv = ifu_cp0_rst_inv_req
                     || !rst_inv_done
                     || rst_dcache_inv[1:0] != RST_IDLE
                     || rst_icache_inv[1:0] != RST_IDLE
                     || rst_bht_inv[1:0] != RST_IDLE
                     || rst_cache_inv[1:0] != RST_IDLE;

assign ext_ifu_inv_done = rst_bht_inv[1:0] == RST_DONE
                       && rst_icache_inv[1:0] == RST_DONE;

assign ext_inst_ifu_inv_done = ext_ifu_inv_done;
assign special_icache_inv_done = ext_ifu_inv_done;
assign ext_inst_lsu_icc_done = rst_dcache_inv[1:0] == RST_WFC && lsu_cp0_icc_done
                            || rst_dcache_inv[1:0] == RST_IDLE && !inst_dcache_op;

assign icache_rst_inv_req  = rst_icache_inv[1:0] == RST_WFC;
assign bht_rst_inv_req     = rst_bht_inv[1:0]    == RST_WFC;
assign dcache_rst_inv_req  = rst_dcache_inv[1:0] == RST_WFC;

assign cp0_lsu_icc_req        = dcache_rst_inv_req;
assign cp0_lsu_icc_type[1:0]  = ext_inst_lsu_icc_req ? ext_inst_lsu_icc_type[1:0]
                                                     : 2'b0;
assign cp0_lsu_icc_addr[31:0] = ext_inst_lsu_icc_req ? ext_inst_lsu_icc_addr[31:0]
                                                     : 32'b0;
assign cp0_lsu_icc_op[1:0]    = ext_inst_lsu_icc_req ? ext_inst_lsu_icc_op[1:0]
                              : special_dcache_clean ? 2'b10               // Clean Dcache
                                                     : 2'b01;              // Inv Dcache

assign cp0_ifu_btb_clr = 1'b0;
assign cp0_ifu_btb_en  = l0btb;
assign cp0_ifu_bht_inv = bht_rst_inv_req;
assign cp0_ifu_bht_en  = bpe;
assign cp0_ifu_ras_en  = rs;


// &Force("nonport", "cp0_ifu_btb_clr"); @531
// &Force("nonport", "cp0_ifu_btb_en"); @532

// &Force("nonport", "cp0_ifu_bht_inv"); @537
// &Force("nonport", "cp0_ifu_bht_en"); @538

// &Force("nonport", "cp0_ifu_ras_en"); @543




//==========================================================
// Rename for Output
//==========================================================
// Output to LSU
assign cp0_lsu_dcache_en = de;
assign cp0_lsu_dcache_wb = wb;
assign cp0_lsu_dcache_wa = wa;

assign cp0_ifu_icache_en = ie;
assign cp0_ifu_icache_inv_req = icache_rst_inv_req;
assign cp0_ifu_icache_inv_type = ext_inst_ifu_icc_req ? ext_inst_ifu_icc_type
                                                      : 1'b0;
assign cp0_ifu_icache_inv_addr[31:0] = ext_inst_ifu_icc_addr[31:0];
// &Force("nonport", "icache_rst_inv_req"); @572

// AEE means Accurated Expt, So Async Expt is !mhint_aee.
assign cp0_xx_async_expt_en = !mhint_aee;

//==========================================================
//                      Output for CP0
//==========================================================
assign regs_special_lpmd[1:0] = mexstatus_lpmd[1:0];
assign regs_srst_srstmd[1:0] = mexstatus_rstmd[1:0];
assign regs_srst_srst_vld = srst_vld;
assign regs_spswap_en = mexstatus_spswapen;
assign regs_cpu_in_nmi = mexstatus_nmi;

//==========================================================
//                      Output for RTU
//==========================================================
assign cp0_rtu_wfe_en = mexstatus_wfeen;
assign cp0_rtu_in_expt = mexstatus_expt;

//==========================================================
//                      Output for IDU
//==========================================================
assign cp0_idu_spec_push_en  = mexstatus_spushen;
assign cp0_idu_swap_sp_en    = mexstatus_spswapen;

//output to dbg infor
assign rst_top_op_done       = rst_inv_done;
//----------------------------------------------------------
//                         For DTU
//----------------------------------------------------------
//assign cp0_dtu_icg_en     = module_icg_en[8];

assign cp0_dtu_pcfifo_frz = pcfifo_freeze;
// &ModuleEnd; @607
endmodule



