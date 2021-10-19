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
module pa_dtu_ctrl(
  async_halt_req_wakeup,
  bmu_dtu_debug_info,
  cp0_dtu_addr,
  cp0_dtu_debug_info,
  cp0_dtu_icg_en,
  cp0_dtu_mexpt_vld,
  cp0_dtu_pcfifo_frz,
  cp0_dtu_rreg,
  cp0_dtu_wdata,
  cp0_dtu_wreg,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  dahbl_dtu_debug_info,
  dcsr_mprven,
  dcsr_prv,
  dcsr_step,
  dcsr_stopcount,
  dpc,
  dscratch0,
  dtu_cp0_rdata,
  dtu_ifu_halt_info0,
  dtu_ifu_halt_info1,
  dtu_ifu_halt_info_vld,
  dtu_lsu_halt_info,
  dtu_lsu_halt_info_vld,
  dtu_rtu_async_halt_req,
  dtu_rtu_pending_tval,
  dtu_rtu_sync_halt_req,
  ebreak_action,
  forever_cpuclk,
  fpu_dtu_debug_info,
  iahbl_dtu_debug_info,
  icount_enable,
  idu_dtu_debug_info,
  idu_dtu_fpr_info,
  ifu_dtu_addr_vld0,
  ifu_dtu_addr_vld1,
  ifu_dtu_data_vld0,
  ifu_dtu_data_vld1,
  ifu_dtu_debug_info,
  ifu_dtu_exe_addr0,
  ifu_dtu_exe_addr1,
  ifu_dtu_exe_data0,
  ifu_dtu_exe_data1,
  int_mask,
  iu_dtu_debug_info,
  latest_pc,
  ldst_addr_mcontrol,
  ldst_data_mcontrol,
  low_power_wakeup,
  lsu_dtu_debug_info,
  lsu_dtu_halt_info,
  lsu_dtu_last_check,
  lsu_dtu_ldst_addr,
  lsu_dtu_ldst_addr_vld,
  lsu_dtu_ldst_bytes_vld,
  lsu_dtu_ldst_data,
  lsu_dtu_ldst_data_vld,
  lsu_dtu_ldst_type,
  lsu_dtu_mem_access_size,
  pad_yy_icg_scan_en,
  rtu_dtu_debug_info,
  rtu_dtu_dpc,
  rtu_dtu_halt_ack,
  rtu_dtu_nmi_pending,
  rtu_dtu_pending_ack,
  rtu_dtu_retire_chgflw,
  rtu_dtu_retire_halt_info,
  rtu_dtu_retire_mret,
  rtu_dtu_retire_next_pc,
  rtu_dtu_retire_vld,
  rtu_dtu_tval,
  rtu_yy_xx_dbgon,
  sahbl_dtu_debug_info,
  tdt_dm_wdata,
  tdt_dm_wr_flg,
  tdt_dm_wr_vld
);

// &Ports; @24
input           async_halt_req_wakeup;    
input   [3 :0]  bmu_dtu_debug_info;       
input   [11:0]  cp0_dtu_addr;             
input   [5 :0]  cp0_dtu_debug_info;       
input           cp0_dtu_icg_en;           
input           cp0_dtu_mexpt_vld;        
input           cp0_dtu_pcfifo_frz;       
input           cp0_dtu_rreg;             
input   [31:0]  cp0_dtu_wdata;            
input           cp0_dtu_wreg;             
input           cp0_yy_clk_en;            
input   [1 :0]  cp0_yy_priv_mode;         
input           cpurst_b;                 
input   [10:0]  dahbl_dtu_debug_info;     
input           dtu_rtu_async_halt_req;   
input           dtu_rtu_sync_halt_req;    
input           forever_cpuclk;           
input   [7 :0]  fpu_dtu_debug_info;       
input   [10:0]  iahbl_dtu_debug_info;     
input   [21:0]  idu_dtu_debug_info;       
input   [95:0]  idu_dtu_fpr_info;         
input           ifu_dtu_addr_vld0;        
input           ifu_dtu_addr_vld1;        
input           ifu_dtu_data_vld0;        
input           ifu_dtu_data_vld1;        
input   [26:0]  ifu_dtu_debug_info;       
input   [31:0]  ifu_dtu_exe_addr0;        
input   [31:0]  ifu_dtu_exe_addr1;        
input   [31:0]  ifu_dtu_exe_data0;        
input   [31:0]  ifu_dtu_exe_data1;        
input   [8 :0]  iu_dtu_debug_info;        
input   [78:0]  lsu_dtu_debug_info;       
input   [14:0]  lsu_dtu_halt_info;        
input           lsu_dtu_last_check;       
input   [31:0]  lsu_dtu_ldst_addr;        
input           lsu_dtu_ldst_addr_vld;    
input   [7 :0]  lsu_dtu_ldst_bytes_vld;   
input   [31:0]  lsu_dtu_ldst_data;        
input           lsu_dtu_ldst_data_vld;    
input   [1 :0]  lsu_dtu_ldst_type;        
input   [1 :0]  lsu_dtu_mem_access_size;  
input           pad_yy_icg_scan_en;       
input   [13:0]  rtu_dtu_debug_info;       
input   [31:0]  rtu_dtu_dpc;              
input           rtu_dtu_halt_ack;         
input           rtu_dtu_nmi_pending;      
input           rtu_dtu_pending_ack;      
input           rtu_dtu_retire_chgflw;    
input   [14:0]  rtu_dtu_retire_halt_info; 
input           rtu_dtu_retire_mret;      
input   [31:0]  rtu_dtu_retire_next_pc;   
input           rtu_dtu_retire_vld;       
input   [31:0]  rtu_dtu_tval;             
input           rtu_yy_xx_dbgon;          
input   [10:0]  sahbl_dtu_debug_info;     
input   [31:0]  tdt_dm_wdata;             
input   [1 :0]  tdt_dm_wr_flg;            
input           tdt_dm_wr_vld;            
output          dcsr_mprven;              
output  [1 :0]  dcsr_prv;                 
output          dcsr_step;                
output          dcsr_stopcount;           
output  [31:0]  dpc;                      
output  [31:0]  dscratch0;                
output  [31:0]  dtu_cp0_rdata;            
output  [14:0]  dtu_ifu_halt_info0;       
output  [14:0]  dtu_ifu_halt_info1;       
output          dtu_ifu_halt_info_vld;    
output  [14:0]  dtu_lsu_halt_info;        
output          dtu_lsu_halt_info_vld;    
output  [31:0]  dtu_rtu_pending_tval;     
output          ebreak_action;            
output          icount_enable;            
output          int_mask;                 
output  [31:0]  latest_pc;                
output          ldst_addr_mcontrol;       
output          ldst_data_mcontrol;       
output          low_power_wakeup;         

// &Regs; @25
reg     [2 :0]  dcsr_cause;               
reg             dcsr_ebreakm;             
reg             dcsr_ebreaku;             
reg             dcsr_mprven;              
reg     [1 :0]  dcsr_prv;                 
reg             dcsr_step;                
reg             dcsr_stepie;              
reg             dcsr_stopcount;           
reg     [31:0]  dpc;                      
reg     [31:0]  dscratch0;                
reg     [31:0]  dscratch1;                
reg     [31:0]  dtu_cp0_rdata;            
reg     [3 :0]  haltcause;                

// &Wires; @26
wire            async_halt_req_wakeup;    
wire    [3 :0]  bmu_dtu_debug_info;       
wire    [11:0]  cp0_dtu_addr;             
wire    [5 :0]  cp0_dtu_debug_info;       
wire            cp0_dtu_icg_en;           
wire            cp0_dtu_mexpt_vld;        
wire            cp0_dtu_pcfifo_frz;       
wire            cp0_dtu_rreg;             
wire    [31:0]  cp0_dtu_wdata;            
wire            cp0_dtu_wreg;             
wire            cp0_write_dcsr;           
wire            cp0_write_dpc;            
wire            cp0_write_dscratch0;      
wire            cp0_write_dscratch1;      
wire            cp0_yy_clk_en;            
wire    [1 :0]  cp0_yy_priv_mode;         
wire            cpurst_b;                 
wire    [10:0]  dahbl_dtu_debug_info;     
wire    [31:0]  dbgfifo_regs_data;        
wire    [31:0]  dcsr;                     
wire            dcsr_dpc_haltcause_clk;   
wire            dcsr_dpc_haltcause_clk_en; 
wire            dcsr_nmip;                
wire    [3 :0]  dcsr_xdebugver;           
wire            dscratch01_clk;           
wire            dscratch01_clk_en;        
wire    [3 :0]  dtu_cause;                
wire    [14:0]  dtu_ifu_halt_info0;       
wire    [14:0]  dtu_ifu_halt_info1;       
wire            dtu_ifu_halt_info_vld;    
wire    [14:0]  dtu_lsu_halt_info;        
wire            dtu_lsu_halt_info_vld;    
wire            dtu_rtu_async_halt_req;   
wire    [31:0]  dtu_rtu_pending_tval;     
wire            dtu_rtu_sync_halt_req;    
wire            ebreak_action;            
wire            forever_cpuclk;           
wire    [7 :0]  fpu_dtu_debug_info;       
wire    [10:0]  iahbl_dtu_debug_info;     
wire            icount_enable;            
wire    [21:0]  idu_dtu_debug_info;       
wire    [95:0]  idu_dtu_fpr_info;         
wire            ifu_dtu_addr_vld0;        
wire            ifu_dtu_addr_vld1;        
wire            ifu_dtu_data_vld0;        
wire            ifu_dtu_data_vld1;        
wire    [26:0]  ifu_dtu_debug_info;       
wire    [31:0]  ifu_dtu_exe_addr0;        
wire    [31:0]  ifu_dtu_exe_addr1;        
wire    [31:0]  ifu_dtu_exe_data0;        
wire    [31:0]  ifu_dtu_exe_data1;        
wire            int_mask;                 
wire    [8 :0]  iu_dtu_debug_info;        
wire    [31:0]  latest_pc;                
wire            ldst_addr_mcontrol;       
wire            ldst_data_mcontrol;       
wire            low_power_wakeup;         
wire    [78:0]  lsu_dtu_debug_info;       
wire    [14:0]  lsu_dtu_halt_info;        
wire            lsu_dtu_last_check;       
wire    [31:0]  lsu_dtu_ldst_addr;        
wire            lsu_dtu_ldst_addr_vld;    
wire    [7 :0]  lsu_dtu_ldst_bytes_vld;   
wire    [31:0]  lsu_dtu_ldst_data;        
wire            lsu_dtu_ldst_data_vld;    
wire    [1 :0]  lsu_dtu_ldst_type;        
wire    [1 :0]  lsu_dtu_mem_access_size;  
wire    [31:0]  mcontext;                 
wire            pad_yy_icg_scan_en;       
wire    [31:0]  pcfifo_regs_data;         
wire            pending_halt;             
wire    [13:0]  rtu_dtu_debug_info;       
wire    [31:0]  rtu_dtu_dpc;              
wire            rtu_dtu_halt_ack;         
wire            rtu_dtu_nmi_pending;      
wire            rtu_dtu_pending_ack;      
wire            rtu_dtu_retire_chgflw;    
wire    [14:0]  rtu_dtu_retire_halt_info; 
wire            rtu_dtu_retire_mret;      
wire    [31:0]  rtu_dtu_retire_next_pc;   
wire            rtu_dtu_retire_vld;       
wire    [31:0]  rtu_dtu_tval;             
wire            rtu_yy_xx_dbgon;          
wire    [10:0]  sahbl_dtu_debug_info;     
wire    [31:0]  tcontrol;                 
wire    [31:0]  tdata1;                   
wire    [31:0]  tdata2;                   
wire    [31:0]  tdata3;                   
wire    [31:0]  tdt_dm_wdata;             
wire    [1 :0]  tdt_dm_wr_flg;            
wire            tdt_dm_wr_vld;            
wire            tdt_dm_write_dscratch0;   
wire    [31:0]  tinfo;                    
wire    [31:0]  tselect;                  
wire            updata_tval;              


//XLEN
parameter XLEN = `TDT_DM_CORE_MAX_XLEN;

//dcsr parameter
parameter PRV = 1; 
parameter STEP = 2;
parameter MPRVEN = 4;
//parameter DCSR_CAUSE = 8;
//parameter STOPTIME = 9;
parameter STOPCOUNT = 10;
parameter STEPIE = 11;
parameter EBREAKU = 12;
parameter EBREAKS = 13;
parameter EBREAKM = 15;

//===============================================================
//Core Debug Register
//
//dcsr, dpc, dscratch0, dscratch1, hatlcause, dbginfo, pcfifo
//===============================================================

//core csr and write req
assign cp0_write_dcsr      = cp0_dtu_wreg && cp0_dtu_addr[11:0] == 12'h7b0 && rtu_yy_xx_dbgon;
assign cp0_write_dpc       = cp0_dtu_wreg && cp0_dtu_addr[11:0] == 12'h7b1 && rtu_yy_xx_dbgon;
assign cp0_write_dscratch0 = cp0_dtu_wreg && cp0_dtu_addr[11:0] == 12'h7b2 && rtu_yy_xx_dbgon;
assign cp0_write_dscratch1 = cp0_dtu_wreg && cp0_dtu_addr[11:0] == 12'h7b3 && rtu_yy_xx_dbgon;
assign tdt_dm_write_dscratch0  = tdt_dm_wr_vld && tdt_dm_wr_flg[1:0] == 2'b01 && rtu_yy_xx_dbgon;

//===============================================================
//                      Define the DCSR
//===============================================================
assign dcsr_nmip      = rtu_dtu_nmi_pending;//nmip
assign dcsr_xdebugver[3:0] = 4'b0100;//xdebugver

always @(posedge dcsr_dpc_haltcause_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      dcsr_step       <= 1'b0;
      dcsr_mprven     <= 1'b0;
      dcsr_stopcount  <= 1'b0;
      dcsr_stepie     <= 1'b0;
      dcsr_ebreaku    <= 1'b0;
      //dcsr_ebreaks    <= 1'b0;
      dcsr_ebreakm    <= 1'b0;
    end
  else if(cp0_write_dcsr)
    begin
      dcsr_step       <= cp0_dtu_wdata[STEP];
      dcsr_mprven     <= cp0_dtu_wdata[MPRVEN];
      dcsr_stopcount  <= cp0_dtu_wdata[STOPCOUNT];
      dcsr_stepie     <= cp0_dtu_wdata[STEPIE];
      dcsr_ebreaku    <= cp0_dtu_wdata[EBREAKU];
      //dcsr_ebreaks    <= cp0_dtu_wdata[EBREAKS];
      dcsr_ebreakm    <= cp0_dtu_wdata[EBREAKM];
    end
end
// &Force("output","dcsr_mprven"); @85
// &Force("output","dcsr_stopcount"); @86
// &Force("output","dcsr_step"); @87

always @(posedge dcsr_dpc_haltcause_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dcsr_prv[1:0] <= 2'b0;
  else if(rtu_dtu_halt_ack)
    dcsr_prv[1:0] <= cp0_yy_priv_mode[1:0];
  else if(cp0_write_dcsr)
    dcsr_prv[1:0] <= cp0_dtu_wdata[PRV:0];
end
// &Force("output","dcsr_prv"); @98

always @(posedge dcsr_dpc_haltcause_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dcsr_cause[2:0] <= 3'b0;
  else if(rtu_dtu_halt_ack)
    dcsr_cause[2:0] <= dtu_cause[2:0];
end

assign dcsr[31:0] ={dcsr_xdebugver[3:0],{12{1'b0}},dcsr_ebreakm,1'b0,1'b0,dcsr_ebreaku,
              dcsr_stepie,dcsr_stopcount,1'b0,dcsr_cause[2:0],1'b0,dcsr_mprven,
              dcsr_nmip,dcsr_step,dcsr_prv[1:0]};
//generate int_mask and ebreak_action for rtu
assign int_mask = dcsr_step && !dcsr_stepie;
assign ebreak_action = cp0_yy_priv_mode[1:0] == 2'b00 && dcsr_ebreaku ||
                       //cp0_yy_priv_mode[1:0] == 2'b01 && dcsr_ebreaks ||
                       cp0_yy_priv_mode[1:0] == 2'b11 && dcsr_ebreakm;

//===============================================================
//                      Define the DPC
//===============================================================
always @(posedge dcsr_dpc_haltcause_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dpc[XLEN-1:0] <= {XLEN{1'b0}};
  else if(cp0_write_dpc)
    dpc[XLEN-1:0] <= cp0_dtu_wdata[XLEN-1:0];
  else if(rtu_dtu_halt_ack)
    dpc[XLEN-1:0] <= rtu_dtu_dpc[XLEN-1:0];
end
// &Force("output","dpc"); @129

//===============================================================
//                      Define the DSCRATCH0
//===============================================================
always @(posedge dscratch01_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dscratch0[XLEN-1:0] <= {XLEN{1'b0}};
  else if(updata_tval)
    dscratch0[XLEN-1:0] <= rtu_dtu_tval[XLEN-1:0];
  else if(cp0_write_dscratch0)
    dscratch0[XLEN-1:0] <= cp0_dtu_wdata[XLEN-1:0];
  else if(tdt_dm_write_dscratch0)
    dscratch0[XLEN-1:0] <= tdt_dm_wdata[XLEN-1:0];
end
// &Force("output","dscratch0"); @145
assign dtu_rtu_pending_tval[XLEN-1:0] = dscratch0[XLEN-1:0];
//===============================================================
//                      Define the DSCRATCH1
//===============================================================
always @(posedge dscratch01_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dscratch1[XLEN-1:0] <= {XLEN{1'b0}};
  else if(cp0_write_dscratch1)
    dscratch1[XLEN-1:0] <= cp0_dtu_wdata[XLEN-1:0];
end

//===============================================================
//                      Define the HALTCAUSE
//===============================================================
always @(posedge dcsr_dpc_haltcause_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    haltcause[3:0] <= {4{1'b0}};
  else if(rtu_dtu_halt_ack)
    haltcause[3:0] <= dtu_cause[3:0];
end

//===============================================================
//                      Define the pcfifo
//===============================================================
// &Instance("pa_dtu_pcfifo"); @173
pa_dtu_pcfifo  x_pa_dtu_pcfifo (
  .cp0_dtu_addr           (cp0_dtu_addr          ),
  .cp0_dtu_icg_en         (cp0_dtu_icg_en        ),
  .cp0_dtu_pcfifo_frz     (cp0_dtu_pcfifo_frz    ),
  .cp0_dtu_rreg           (cp0_dtu_rreg          ),
  .cp0_yy_clk_en          (cp0_yy_clk_en         ),
  .cpurst_b               (cpurst_b              ),
  .forever_cpuclk         (forever_cpuclk        ),
  .latest_pc              (latest_pc             ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    ),
  .pcfifo_regs_data       (pcfifo_regs_data      ),
  .rtu_dtu_halt_ack       (rtu_dtu_halt_ack      ),
  .rtu_dtu_retire_chgflw  (rtu_dtu_retire_chgflw ),
  .rtu_dtu_retire_next_pc (rtu_dtu_retire_next_pc),
  .rtu_dtu_retire_vld     (rtu_dtu_retire_vld    )
);

// &Force("input","cp0_dtu_pcfifo_frz"); @175
// &Force("input","rtu_dtu_retire_chgflw"); @176
// &Force("input","rtu_dtu_retire_next_pc");&Force("bus","rtu_dtu_retire_next_pc",`PA_WIDTH-1,0); @177

//===============================================================
//                      Define the dbginfo
//===============================================================
// &Instance("pa_dtu_dbginfo"); @184
pa_dtu_dbginfo  x_pa_dtu_dbginfo (
  .bmu_dtu_debug_info     (bmu_dtu_debug_info    ),
  .cp0_dtu_addr           (cp0_dtu_addr          ),
  .cp0_dtu_debug_info     (cp0_dtu_debug_info    ),
  .cp0_dtu_icg_en         (cp0_dtu_icg_en        ),
  .cp0_dtu_rreg           (cp0_dtu_rreg          ),
  .cp0_yy_clk_en          (cp0_yy_clk_en         ),
  .cpurst_b               (cpurst_b              ),
  .dahbl_dtu_debug_info   (dahbl_dtu_debug_info  ),
  .dbgfifo_regs_data      (dbgfifo_regs_data     ),
  .dtu_rtu_async_halt_req (dtu_rtu_async_halt_req),
  .forever_cpuclk         (forever_cpuclk        ),
  .fpu_dtu_debug_info     (fpu_dtu_debug_info    ),
  .iahbl_dtu_debug_info   (iahbl_dtu_debug_info  ),
  .idu_dtu_debug_info     (idu_dtu_debug_info    ),
  .idu_dtu_fpr_info       (idu_dtu_fpr_info      ),
  .ifu_dtu_debug_info     (ifu_dtu_debug_info    ),
  .iu_dtu_debug_info      (iu_dtu_debug_info     ),
  .lsu_dtu_debug_info     (lsu_dtu_debug_info    ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    ),
  .rtu_dtu_debug_info     (rtu_dtu_debug_info    ),
  .sahbl_dtu_debug_info   (sahbl_dtu_debug_info  )
);

//    &Force("input","pahbl_dtu_debug_info");&Force("bus","pahbl_dtu_debug_info",6,0); @187
//    &Force("input","biu_dtu_debug_info");&Force("bus","biu_dtu_debug_info",9,0); @188
//    &Force("input","sahbl_dtu_debug_info");&Force("bus","sahbl_dtu_debug_info",10,0); @190
//    &Force("input","dahbl_dtu_debug_info");&Force("bus","dahbl_dtu_debug_info",10,0); @191
//    &Force("input","iahbl_dtu_debug_info");&Force("bus","iahbl_dtu_debug_info",10,0); @192
//    &Force("input","bmu_dtu_debug_info");&Force("bus","bmu_dtu_debug_info",3,0); @193
// &Force("input","idu_dtu_fpr_info");&Force("bus","idu_dtu_fpr_info",95,0); @195
// &Force("input","fpu_dtu_debug_info");&Force("bus","fpu_dtu_debug_info",7,0); @197
// &Force("input","cp0_dtu_debug_info");&Force("bus","cp0_dtu_debug_info",5,0); @200
// &Force("input","rtu_dtu_debug_info");&Force("bus","rtu_dtu_debug_info",13,0); @201
// &Force("input","iu_dtu_debug_info");&Force("bus","iu_dtu_debug_info",8,0); @202
// &Force("input","lsu_dtu_debug_info");&Force("bus","lsu_dtu_debug_info",78,0); @203
// &Force("input","idu_dtu_debug_info");&Force("bus","idu_dtu_debug_info",21,0); @204
// &Force("input","ifu_dtu_debug_info");&Force("bus","ifu_dtu_debug_info",26,0); @205
//csr and read req

//===============================================================
//                      Define the Trigger Module
//===============================================================
// &Instance("pa_dtu_trigger_module"); @212
pa_dtu_trigger_module  x_pa_dtu_trigger_module (
  .cp0_dtu_addr             (cp0_dtu_addr            ),
  .cp0_dtu_icg_en           (cp0_dtu_icg_en          ),
  .cp0_dtu_mexpt_vld        (cp0_dtu_mexpt_vld       ),
  .cp0_dtu_wdata            (cp0_dtu_wdata           ),
  .cp0_dtu_wreg             (cp0_dtu_wreg            ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cp0_yy_priv_mode         (cp0_yy_priv_mode        ),
  .cpurst_b                 (cpurst_b                ),
  .dtu_cause                (dtu_cause               ),
  .dtu_ifu_halt_info0       (dtu_ifu_halt_info0      ),
  .dtu_ifu_halt_info1       (dtu_ifu_halt_info1      ),
  .dtu_ifu_halt_info_vld    (dtu_ifu_halt_info_vld   ),
  .dtu_lsu_halt_info        (dtu_lsu_halt_info       ),
  .dtu_lsu_halt_info_vld    (dtu_lsu_halt_info_vld   ),
  .forever_cpuclk           (forever_cpuclk          ),
  .icount_enable            (icount_enable           ),
  .ifu_dtu_addr_vld0        (ifu_dtu_addr_vld0       ),
  .ifu_dtu_addr_vld1        (ifu_dtu_addr_vld1       ),
  .ifu_dtu_data_vld0        (ifu_dtu_data_vld0       ),
  .ifu_dtu_data_vld1        (ifu_dtu_data_vld1       ),
  .ifu_dtu_exe_addr0        (ifu_dtu_exe_addr0       ),
  .ifu_dtu_exe_addr1        (ifu_dtu_exe_addr1       ),
  .ifu_dtu_exe_data0        (ifu_dtu_exe_data0       ),
  .ifu_dtu_exe_data1        (ifu_dtu_exe_data1       ),
  .ldst_addr_mcontrol       (ldst_addr_mcontrol      ),
  .ldst_data_mcontrol       (ldst_data_mcontrol      ),
  .lsu_dtu_halt_info        (lsu_dtu_halt_info       ),
  .lsu_dtu_last_check       (lsu_dtu_last_check      ),
  .lsu_dtu_ldst_addr        (lsu_dtu_ldst_addr       ),
  .lsu_dtu_ldst_addr_vld    (lsu_dtu_ldst_addr_vld   ),
  .lsu_dtu_ldst_bytes_vld   (lsu_dtu_ldst_bytes_vld  ),
  .lsu_dtu_ldst_data        (lsu_dtu_ldst_data       ),
  .lsu_dtu_ldst_data_vld    (lsu_dtu_ldst_data_vld   ),
  .lsu_dtu_ldst_type        (lsu_dtu_ldst_type       ),
  .lsu_dtu_mem_access_size  (lsu_dtu_mem_access_size ),
  .mcontext                 (mcontext                ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .pending_halt             (pending_halt            ),
  .rtu_dtu_halt_ack         (rtu_dtu_halt_ack        ),
  .rtu_dtu_pending_ack      (rtu_dtu_pending_ack     ),
  .rtu_dtu_retire_halt_info (rtu_dtu_retire_halt_info),
  .rtu_dtu_retire_mret      (rtu_dtu_retire_mret     ),
  .rtu_dtu_retire_vld       (rtu_dtu_retire_vld      ),
  .rtu_yy_xx_dbgon          (rtu_yy_xx_dbgon         ),
  .tcontrol                 (tcontrol                ),
  .tdata1                   (tdata1                  ),
  .tdata2                   (tdata2                  ),
  .tdata3                   (tdata3                  ),
  .tinfo                    (tinfo                   ),
  .tselect                  (tselect                 ),
  .updata_tval              (updata_tval             )
);


// &CombBeg; @214
always @( dpc[31:0]
       or tdata1[31:0]
       or tinfo[31:0]
       or dbgfifo_regs_data[31:0]
       or dcsr[31:0]
       or tdata2[31:0]
       or cp0_dtu_addr[11:0]
       or haltcause[3:0]
       or dscratch0[31:0]
       or tselect[31:0]
       or pcfifo_regs_data[31:0]
       or tdata3[31:0]
       or tcontrol[31:0]
       or dscratch1[31:0]
       or mcontext[31:0])
begin
case(cp0_dtu_addr[11:0])
  12'h7a0:
    dtu_cp0_rdata[XLEN-1:0] = tselect[XLEN-1:0];
  12'h7a1:
    dtu_cp0_rdata[XLEN-1:0] = tdata1[XLEN-1:0];
  12'h7a2:
    dtu_cp0_rdata[XLEN-1:0] = tdata2[XLEN-1:0];
  12'h7a3:
    dtu_cp0_rdata[XLEN-1:0] = tdata3[XLEN-1:0];
  12'h7a4:
    dtu_cp0_rdata[XLEN-1:0] = tinfo[XLEN-1:0];
  12'h7a5:
    dtu_cp0_rdata[XLEN-1:0] = tcontrol[XLEN-1:0];
  12'h7a8:
    dtu_cp0_rdata[XLEN-1:0] = mcontext[XLEN-1:0];

  12'h7b0:
    dtu_cp0_rdata[XLEN-1:0] = dcsr[31:0];
  12'h7b1:
    dtu_cp0_rdata[XLEN-1:0] = dpc[XLEN-1:0];
  12'h7b2:
    dtu_cp0_rdata[XLEN-1:0] = dscratch0[XLEN-1:0];
  12'h7b3:
    dtu_cp0_rdata[XLEN-1:0] = dscratch1[XLEN-1:0];
  12'hfe0:
    dtu_cp0_rdata[XLEN-1:0] = {{XLEN-4{1'b0}},haltcause[3:0]};
  
  12'hfe1:
    dtu_cp0_rdata[XLEN-1:0] = dbgfifo_regs_data[XLEN-1:0];

  12'hfe2:
    dtu_cp0_rdata[XLEN-1:0] = pcfifo_regs_data[XLEN-1:0];

  default:
    dtu_cp0_rdata[XLEN-1:0] = {XLEN{1'bx}};
endcase
// &CombEnd; @295
end

//low power wakeup
assign low_power_wakeup = dtu_rtu_sync_halt_req || 
                          async_halt_req_wakeup ||
                          dcsr_step ||
                          pending_halt;
                        
//==========================================================
//                     gate clk
//==========================================================
//make dcsr, dpc, haltcause a gated clk cell
assign dcsr_dpc_haltcause_clk_en = rtu_dtu_halt_ack ||
                                   cp0_write_dcsr   ||
                                   cp0_write_dpc;
// &Instance("gated_clk_cell", "x_dcsr_dpc_haltcause_reg_gated_clk"); @310
gated_clk_cell  x_dcsr_dpc_haltcause_reg_gated_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (dcsr_dpc_haltcause_clk   ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (dcsr_dpc_haltcause_clk_en),
  .module_en                 (cp0_dtu_icg_en           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);

// &Connect(.clk_in      (forever_cpuclk), @311
//          .external_en (1'b0), @312
//          .global_en   (cp0_yy_clk_en), @313
//          .module_en   (cp0_dtu_icg_en), @314
//          .local_en    (dcsr_dpc_haltcause_clk_en), @315
//          //.local_en    (1'b1), @316
//          .clk_out     (dcsr_dpc_haltcause_clk)); @317

//make dscratch0, dscratch1 a gated clk cell
assign dscratch01_clk_en = cp0_write_dscratch0 || tdt_dm_write_dscratch0 ||  updata_tval ||
                           cp0_write_dscratch1;
// &Instance("gated_clk_cell", "x_dscratch01_reg_gated_clk"); @322
gated_clk_cell  x_dscratch01_reg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dscratch01_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (dscratch01_clk_en ),
  .module_en          (cp0_dtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @323
//          .external_en (1'b0), @324
//          .global_en   (cp0_yy_clk_en), @325
//          .module_en   (cp0_dtu_icg_en), @326
//          .local_en    (dscratch01_clk_en), @327
//          //.local_en    (1'b1), @328
//          .clk_out     (dscratch01_clk)); @329


// &ModuleEnd; @338
endmodule


