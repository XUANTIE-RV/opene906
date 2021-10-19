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
module pa_cp0_trap_csr(
  cp0_dtu_int_id,
  cp0_dtu_mexpt_vld,
  cp0_hpcp_pmdm,
  cp0_hpcp_pmdu,
  cp0_idu_fs,
  cp0_idu_mcause,
  cp0_idu_mepc,
  cp0_idu_sp_use_scratch,
  cp0_idu_sp_wdata,
  cp0_idu_sp_wen,
  cp0_idu_sp_wen_gate,
  cp0_lsu_mm,
  cp0_pmp_mstatus_mpp,
  cp0_pmp_mstatus_mprv,
  cp0_rtu_in_nmi,
  cp0_rtu_int_level,
  cp0_rtu_int_mode,
  cp0_rtu_mie,
  cp0_rtu_mnxti_vld,
  cp0_rtu_mpil,
  cp0_rtu_pm_bypass,
  cp0_rtu_tail_int_hv,
  cp0_rtu_tail_int_id,
  cp0_yy_cskyisaee,
  cpurst_b,
  dtu_cp0_dcsr_mprven,
  dtu_cp0_dcsr_prv,
  fcsr_local_en,
  fflags_clk,
  fflags_local_en,
  fpu_cp0_wb_fflags_updt,
  frm_local_en,
  fs_dirty_upd,
  fxcr_local_en,
  idu_cp0_id_tail_vld,
  idu_cp0_ipop_data,
  idu_cp0_mcause_wen,
  idu_cp0_mepc_wen,
  idu_cp0_sp_reg,
  idu_cp0_sp_swap_pending,
  idu_cp0_sp_swap_req,
  idu_cp0_sp_swap_req_gate,
  idu_yy_xx_tail_ack,
  ifu_cp0_vec_err,
  ifu_cp0_vec_succeed,
  iui_regs_inst_mret,
  iui_regs_wdata,
  iui_regs_wdata_mie,
  iui_regs_wdata_rs1,
  mcause_local_en,
  mcause_value,
  mclicbase_value,
  mcnten_local_en,
  mcnten_value,
  medeleg_value,
  mepc_local_en,
  mepc_value,
  mideleg_value,
  mie_value,
  mintstatus_value,
  mip_value,
  misa_value,
  mnmicause_local_en,
  mnmicause_value,
  mnmipc_local_en,
  mnmipc_value,
  mnxti_local_en,
  mnxti_value,
  mscratch_local_en,
  mscratch_value,
  mscratchcsw_local_en,
  mscratchcsw_value,
  mscratchcswl_local_en,
  mscratchcswl_value,
  mstatus_local_en,
  mstatus_value,
  mtval_local_en,
  mtval_value,
  mtvec_local_en,
  mtvec_rslt,
  mtvec_value,
  mtvt_local_en,
  mtvt_value,
  mxstatus_local_en,
  mxstatus_value,
  regs_clk,
  regs_cpu_in_int,
  regs_cpu_in_nmi,
  regs_flush_clk,
  regs_fs_off,
  regs_iui_mie,
  regs_spswap_en,
  regs_swap_int_sp_en_gate,
  rtu_cp0_epc,
  rtu_cp0_exit_debug,
  rtu_cp0_fp_dirty_vld,
  rtu_cp0_int_level,
  rtu_cp0_mie_en,
  rtu_cp0_mnxti_pending_vld,
  rtu_cp0_nmi_vld,
  rtu_cp0_pending_int_hv,
  rtu_cp0_pending_int_id,
  rtu_cp0_pending_int_level,
  rtu_cp0_tval,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vec,
  rtu_yy_xx_expt_vld,
  rtu_yy_xx_int_hv,
  rtu_yy_xx_tail_int_vld,
  tcip_cp0_clic_base,
  trap_csr_pm
);

// &Ports; @24
input           cpurst_b;                    
input           dtu_cp0_dcsr_mprven;         
input   [1 :0]  dtu_cp0_dcsr_prv;            
input           fcsr_local_en;               
input           fflags_clk;                  
input           fflags_local_en;             
input           fpu_cp0_wb_fflags_updt;      
input           frm_local_en;                
input           fxcr_local_en;               
input           idu_cp0_id_tail_vld;         
input   [31:0]  idu_cp0_ipop_data;           
input           idu_cp0_mcause_wen;          
input           idu_cp0_mepc_wen;            
input   [31:0]  idu_cp0_sp_reg;              
input           idu_cp0_sp_swap_pending;     
input           idu_cp0_sp_swap_req;         
input           idu_cp0_sp_swap_req_gate;    
input           idu_yy_xx_tail_ack;          
input           ifu_cp0_vec_err;             
input           ifu_cp0_vec_succeed;         
input           iui_regs_inst_mret;          
input   [31:0]  iui_regs_wdata;              
input           iui_regs_wdata_mie;          
input   [31:0]  iui_regs_wdata_rs1;          
input           mcause_local_en;             
input           mcnten_local_en;             
input           mepc_local_en;               
input           mnmicause_local_en;          
input           mnmipc_local_en;             
input           mnxti_local_en;              
input           mscratch_local_en;           
input           mscratchcsw_local_en;        
input           mscratchcswl_local_en;       
input           mstatus_local_en;            
input           mtval_local_en;              
input           mtvec_local_en;              
input           mtvt_local_en;               
input           mxstatus_local_en;           
input           regs_clk;                    
input           regs_cpu_in_nmi;             
input           regs_flush_clk;              
input           regs_spswap_en;              
input   [31:0]  rtu_cp0_epc;                 
input           rtu_cp0_exit_debug;          
input           rtu_cp0_fp_dirty_vld;        
input   [7 :0]  rtu_cp0_int_level;           
input           rtu_cp0_mie_en;              
input           rtu_cp0_mnxti_pending_vld;   
input           rtu_cp0_nmi_vld;             
input           rtu_cp0_pending_int_hv;      
input   [11:0]  rtu_cp0_pending_int_id;      
input   [7 :0]  rtu_cp0_pending_int_level;   
input   [31:0]  rtu_cp0_tval;                
input           rtu_yy_xx_dbgon;             
input           rtu_yy_xx_expt_int;          
input   [11:0]  rtu_yy_xx_expt_vec;          
input           rtu_yy_xx_expt_vld;          
input           rtu_yy_xx_int_hv;            
input           rtu_yy_xx_tail_int_vld;      
input   [31:0]  tcip_cp0_clic_base;          
output  [11:0]  cp0_dtu_int_id;              
output          cp0_dtu_mexpt_vld;           
output          cp0_hpcp_pmdm;               
output          cp0_hpcp_pmdu;               
output  [1 :0]  cp0_idu_fs;                  
output  [31:0]  cp0_idu_mcause;              
output  [31:0]  cp0_idu_mepc;                
output          cp0_idu_sp_use_scratch;      
output  [31:0]  cp0_idu_sp_wdata;            
output          cp0_idu_sp_wen;              
output          cp0_idu_sp_wen_gate;         
output          cp0_lsu_mm;                  
output  [1 :0]  cp0_pmp_mstatus_mpp;         
output          cp0_pmp_mstatus_mprv;        
output          cp0_rtu_in_nmi;              
output  [7 :0]  cp0_rtu_int_level;           
output  [1 :0]  cp0_rtu_int_mode;            
output          cp0_rtu_mie;                 
output          cp0_rtu_mnxti_vld;           
output  [7 :0]  cp0_rtu_mpil;                
output  [1 :0]  cp0_rtu_pm_bypass;           
output          cp0_rtu_tail_int_hv;         
output  [11:0]  cp0_rtu_tail_int_id;         
output          cp0_yy_cskyisaee;            
output          fs_dirty_upd;                
output  [31:0]  mcause_value;                
output  [31:0]  mclicbase_value;             
output  [31:0]  mcnten_value;                
output  [31:0]  medeleg_value;               
output  [31:0]  mepc_value;                  
output  [31:0]  mideleg_value;               
output  [31:0]  mie_value;                   
output  [31:0]  mintstatus_value;            
output  [31:0]  mip_value;                   
output  [31:0]  misa_value;                  
output  [31:0]  mnmicause_value;             
output  [31:0]  mnmipc_value;                
output  [31:0]  mnxti_value;                 
output  [31:0]  mscratch_value;              
output  [31:0]  mscratchcsw_value;           
output  [31:0]  mscratchcswl_value;          
output  [31:0]  mstatus_value;               
output  [31:0]  mtval_value;                 
output  [29:0]  mtvec_rslt;                  
output  [31:0]  mtvec_value;                 
output  [31:0]  mtvt_value;                  
output  [31:0]  mxstatus_value;              
output          regs_cpu_in_int;             
output          regs_fs_off;                 
output          regs_iui_mie;                
output          regs_swap_int_sp_en_gate;    
output  [1 :0]  trap_csr_pm;                 

// &Regs; @25
reg             cskyisaee;                   
reg     [1 :0]  fs;                          
reg             m_intr;                      
reg     [11:0]  m_vector;                    
reg     [11:0]  m_vector_tail;               
reg             mcnten_hpm13;                
reg             mcnten_hpm14;                
reg             mcnten_hpm15;                
reg             mcnten_hpm16;                
reg             mcnten_hpm17;                
reg             mcnten_hpm3;                 
reg             mcnten_hpm4;                 
reg             mcnten_hpm8;                 
reg             mcnten_hpm9;                 
reg     [2 :0]  mcnten_reg;                  
reg     [31:0]  mepc_reg;                    
reg             mie_bit;                     
reg     [7 :0]  mil;                         
reg     [7 :0]  mil_tail;                    
reg             minhv;                       
reg             minhv_tail;                  
reg             mm;                          
reg             mpie;                        
reg     [7 :0]  mpil;                        
reg     [1 :0]  mpp;                         
reg             mprv;                        
reg     [31:0]  mscratch;                    
reg     [31:0]  mtval_data;                  
reg     [29:0]  mtvec_base;                  
reg     [25:0]  mtvt_base;                   
reg             nmi_intr;                    
reg             nmi_mpie;                    
reg     [1 :0]  nmi_mpp;                     
reg     [30:0]  nmi_pc_31_1;                 
reg     [11:0]  nmi_vector;                  
reg     [1 :0]  pm;                          
reg             pmdm;                        
reg             pmdu;                        

// &Wires; @26
wire    [11:0]  cp0_dtu_int_id;              
wire            cp0_dtu_mexpt_vld;           
wire            cp0_hpcp_pmdm;               
wire            cp0_hpcp_pmdu;               
wire    [1 :0]  cp0_idu_fs;                  
wire    [31:0]  cp0_idu_mcause;              
wire    [31:0]  cp0_idu_mepc;                
wire            cp0_idu_sp_use_scratch;      
wire    [31:0]  cp0_idu_sp_wdata;            
wire            cp0_idu_sp_wen;              
wire            cp0_idu_sp_wen_gate;         
wire            cp0_lsu_mm;                  
wire    [1 :0]  cp0_pmp_mstatus_mpp;         
wire            cp0_pmp_mstatus_mprv;        
wire            cp0_rtu_in_nmi;              
wire    [7 :0]  cp0_rtu_int_level;           
wire    [1 :0]  cp0_rtu_int_mode;            
wire            cp0_rtu_mie;                 
wire            cp0_rtu_mnxti_vld;           
wire    [7 :0]  cp0_rtu_mpil;                
wire    [1 :0]  cp0_rtu_pm_bypass;           
wire            cp0_rtu_tail_int_hv;         
wire    [11:0]  cp0_rtu_tail_int_id;         
wire            cp0_yy_cskyisaee;            
wire            cpurst_b;                    
wire    [3 :0]  dsp_m_value;                 
wire            dtu_cp0_dcsr_mprven;         
wire    [1 :0]  dtu_cp0_dcsr_prv;            
wire    [25:0]  extensions;                  
wire            fcsr_local_en;               
wire            fflags_clk;                  
wire            fflags_local_en;             
wire            fpu_cp0_wb_fflags_updt;      
wire            frm_local_en;                
wire            fs_dirty_upd;                
wire            fs_off;                      
wire            fxcr_local_en;               
wire            hw_vector_clic_on;           
wire            idu_cp0_id_tail_vld;         
wire    [31:0]  idu_cp0_ipop_data;           
wire            idu_cp0_mcause_wen;          
wire            idu_cp0_mepc_wen;            
wire    [31:0]  idu_cp0_sp_reg;              
wire            idu_cp0_sp_swap_pending;     
wire            idu_cp0_sp_swap_req;         
wire            idu_cp0_sp_swap_req_gate;    
wire            idu_yy_xx_tail_ack;          
wire            ifu_cp0_vec_err;             
wire            ifu_cp0_vec_succeed;         
wire            int_mret_vld;                
wire            ipush_sp_use_mscratch;       
wire            iui_regs_inst_mret;          
wire    [31:0]  iui_regs_wdata;              
wire            iui_regs_wdata_mie;          
wire    [31:0]  iui_regs_wdata_rs1;          
wire    [31:0]  mcause_bypass_value;         
wire            mcause_local_en;             
wire    [31:0]  mcause_spec_value;           
wire    [31:0]  mcause_value;                
wire    [31:0]  mclicbase_value;             
wire    [28:0]  mcnten_hpm;                  
wire            mcnten_local_en;             
wire    [31:0]  mcnten_value;                
wire    [31:0]  medeleg_value;               
wire            mepc_local_en;               
wire    [31:0]  mepc_value;                  
wire    [31:0]  mideleg_value;               
wire            mie_valid;                   
wire    [31:0]  mie_value;                   
wire    [7 :0]  mil_val;                     
wire    [31:0]  mintstatus_value;            
wire    [31:0]  mip_value;                   
wire    [31:0]  misa_value;                  
wire            mnmicause_local_en;          
wire    [31:0]  mnmicause_value;             
wire            mnmipc_local_en;             
wire    [31:0]  mnmipc_value;                
wire            mnxti_local_en;              
wire    [29:0]  mnxti_pending_addr;          
wire    [31:0]  mnxti_value;                 
wire            mnxti_vld_int_pending;       
wire            mscratch_local_en;           
wire            mscratch_swap_int_sp_en;     
wire            mscratch_swap_int_sp_en_gate; 
wire    [31:0]  mscratch_value;              
wire            mscratchcsw_local_en;        
wire            mscratchcsw_swap_en;         
wire    [31:0]  mscratchcsw_value;           
wire            mscratchcswl_local_en;       
wire            mscratchcswl_swap_en;        
wire    [31:0]  mscratchcswl_value;          
wire            mstatus_local_en;            
wire    [31:0]  mstatus_value;               
wire            mtval_local_en;              
wire    [31:0]  mtval_value;                 
wire            mtvec_local_en;              
wire    [1 :0]  mtvec_mode;                  
wire    [29:0]  mtvec_rslt;                  
wire            mtvec_rslt_use_base;         
wire    [31:0]  mtvec_value;                 
wire            mtvt_local_en;               
wire    [31:0]  mtvt_value;                  
wire    [1 :0]  mxl;                         
wire            mxstatus_local_en;           
wire    [31:0]  mxstatus_value;              
wire    [7 :0]  opt_value;                   
wire    [1 :0]  pm_bypass;                   
wire            regs_clk;                    
wire            regs_cpu_in_int;             
wire            regs_cpu_in_nmi;             
wire            regs_flush_clk;              
wire            regs_fs_off;                 
wire            regs_inst_nmi_mret;          
wire            regs_iui_mie;                
wire            regs_spswap_en;              
wire            regs_swap_int_sp_en_gate;    
wire    [31:0]  rtu_cp0_epc;                 
wire            rtu_cp0_exit_debug;          
wire            rtu_cp0_fp_dirty_vld;        
wire    [7 :0]  rtu_cp0_int_level;           
wire            rtu_cp0_mie_en;              
wire            rtu_cp0_mnxti_pending_vld;   
wire            rtu_cp0_nmi_vld;             
wire            rtu_cp0_pending_int_hv;      
wire    [11:0]  rtu_cp0_pending_int_id;      
wire    [7 :0]  rtu_cp0_pending_int_level;   
wire    [31:0]  rtu_cp0_tval;                
wire            rtu_yy_xx_dbgon;             
wire            rtu_yy_xx_expt_int;          
wire    [11:0]  rtu_yy_xx_expt_vec;          
wire            rtu_yy_xx_expt_vld;          
wire            rtu_yy_xx_int_hv;            
wire            rtu_yy_xx_tail_int_vld;      
wire            sd;                          
wire    [7 :0]  spec_mil;                    
wire    [7 :0]  spec_mpil;                   
wire            swap_int_sp;                 
wire    [31:0]  tcip_cp0_clic_base;          
wire    [1 :0]  trap_csr_pm;                 
wire    [29:0]  vec_adder_vbr;               
wire    [11:0]  vec_adder_vec;               
wire    [1 :0]  xs;                          


//==========================================================
// Trap Setup and Handling CSR Module
// 1. Trap Setup CSRs
// 2. Trap Handling CSRs
//==========================================================

//----------------------------------------------------------
// 1. Trap Setup CSRs
//----------------------------------------------------------
//==========================================================
//               Define the MSTATUS register
//==========================================================
//  Machine Status Register
//  32-bit Machine Mode Read/Write
//  Providing the CPU Status
//  the definiton for MSTATUS register is listed as follows
//  ========================================================
//  |31|30                     22|21| 20| 19| 18| 17 |16 15|
//  +--+-----+-----+-----+---+---+--+---+---+---+----+-----+
//  |SD|            Res          |    Res       |MPRV| Res |
//  ========================================================
//  ========================================================
//  |14 13|12 11|10 9| 8 |  7 | 6 |  5 | 4 | 3 | 2 | 1 | 0 |
//  +-----+-----+----+---+----+---+----+---+---+---+---+---+
//  | FS  | MPP | Res|Res|MPIE|Res| Res|Res|MIE|Res|Res|Res|
//  ========================================================
assign sd      = fs[1:0] == 2'b11 || xs[1:0] == 2'b11;

assign xs[1:0] = 2'b0;

assign fs_dirty_upd = (rtu_cp0_fp_dirty_vld || fpu_cp0_wb_fflags_updt)
                   && (fs[1:0] == 2'b1 || fs[1:0] == 2'b10);
// &Force("output", "fs_dirty_upd"); @61

always @(posedge fflags_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    fs[1:0] <= 2'b0;
  else if(mstatus_local_en || mnxti_local_en)
    fs[1:0] <= iui_regs_wdata[14:13];
  else if(fcsr_local_en || frm_local_en || fflags_local_en || fxcr_local_en)
    fs[1:0] <= 2'b11;
  else if(fs_dirty_upd)
    fs[1:0] <= 2'b11;
  else
    fs[1:0] <= fs[1:0];
end

assign fs_off = fs[1:0] == 2'b00;

always @(posedge regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    mprv <= 1'b0;
  end
  else if(mstatus_local_en || mnxti_local_en)
  begin
    mprv <= iui_regs_wdata[17];
  end
  else
  begin
    mprv <= mprv;
  end
end

always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mpp[1:0] <= 2'b11;
  else if(rtu_yy_xx_expt_vld)
    mpp[1:0] <= pm_bypass[1:0];
  else if(regs_inst_nmi_mret)
    mpp[1:0] <= nmi_mpp[1:0];
  else if(iui_regs_inst_mret)
    mpp[1:0] <= 2'b00;
  else if(mstatus_local_en || mnxti_local_en)
    mpp[1:0] <= iui_regs_wdata[12:11];
  else if(mcause_local_en)
    mpp[1:0] <= iui_regs_wdata[29:28];
  else if(idu_cp0_mcause_wen)
    mpp[1:0] <= idu_cp0_ipop_data[29:28];
  else
    mpp[1:0] <= mpp[1:0];
end

always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mpie <= 1'b0;
  else if(rtu_yy_xx_expt_vld)
    mpie <= mie_valid;
  else if(regs_inst_nmi_mret)
    mpie <= nmi_mpie;
  else if(iui_regs_inst_mret)
    mpie <= 1'b1;
  else if(mstatus_local_en || mnxti_local_en)
    mpie <= iui_regs_wdata[7];
  else if(mcause_local_en)
    mpie <= iui_regs_wdata[27];
  else if(idu_cp0_mcause_wen)
    mpie <= idu_cp0_ipop_data[27];
  else
    mpie <= mpie;
end

always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mie_bit <= 1'b0;
  else if(rtu_yy_xx_expt_vld)
    mie_bit <= 1'b0;
  else if(iui_regs_inst_mret)
    mie_bit <= mpie;
  else if(mstatus_local_en || mnxti_local_en)
    mie_bit <= iui_regs_wdata_mie;
  else if(rtu_cp0_mie_en)
    mie_bit <= 1'b1;
  else
    mie_bit <= mie_bit;
end
assign regs_iui_mie = mie_bit;

assign mie_valid = (mstatus_local_en || mnxti_local_en) ? iui_regs_wdata_mie
                                                        : iui_regs_inst_mret ? mpie : mie_bit;
assign mstatus_value[31:0]  = {sd, 13'b0, mprv, xs[1:0], fs[1:0],
                               mpp[1:0], 3'b0, mpie, 3'b0, mie_bit, 3'b0};


//==========================================================
//               Define the MISA register
//  Machine Status Register
//  32-bit Machine Mode Read/Write
//  Providing the ISA extension infor of the current core
//  the definiton for MISA register is listed as follows
//==========================================================
// [31:30]     [29:26]     [25:0]
//   MXL       Reserved  Extensions
// RV32, MXL is 1.
assign mxl[1:0] = 2'b01;

//  RV32 IMA(FD)C (G) + S Mode + U mode + Non-Standard Ex
// [23] [20] [18] [15] [12] [8] [5] [3] [2] [0]
//  X    U    S    P    M    I   F   D   C   A
assign opt_value[7:0] = {4'b0010, 4'b0101};

assign dsp_m_value[3:0] = 4'b0001;

assign extensions[25:0] = {2'b0, 4'b1001, 4'b0000, dsp_m_value[3:0],
                                 4'b0001, opt_value[7:0]};
assign misa_value[31:0] = {mxl[1:0], 4'b0, extensions[25:0]};


//==========================================================
//               Define the MEDELEG register
//  Machine Exception Delegation Register
//  64-bit Machine Mode Read/Write
//  Providing the Exception Delegation Status
//  the definiton for MEDELEG register is listed as follows
//  * Currently not implemented
//==========================================================
assign medeleg_value[31:0] = 32'b0;


//==========================================================
//               Define the MIDELEG register
//  Machine Interrupt Delegation Register
//  64-bit Machine Mode Read/Write
//  Providing the Interrupt Delegation Status
//  the definiton for MEDELEG register is listed as follows
//  * Currently not implemented
//==========================================================
assign mideleg_value[31:0] = 32'b0;


//==========================================================
//               Define the MIE register
//  Machine Interrupt Enable Register
//  31-bit Machine Mode Read/Write
//  Providing the Interrupt Local Enable of the current core
//  *Hardware to zero when CLIC MODE
//  the definiton for MIE register is listed as follows
//==========================================================
assign mie_value[31:0] = 32'b0;


//==========================================================
//               Define the MTVEC register
//  Machine Trap Vector Register
//  31-bit Machine Mode Read/Write
//  Providing the Trap Vector Base and Mode
//  the definiton for MTVEC register is listed as follows
//==========================================================
assign mtvec_mode[1:0] = 2'b11;

// Generate the valid vector address
assign vec_adder_vec[11:0] = m_vector[11:0];

always @(posedge regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mtvec_base[29:0] <= 30'b0;
  else if(mtvec_local_en)
    mtvec_base[29:0] <= {iui_regs_wdata[31:6], 4'b0};
  else
    mtvec_base[29:0] <= mtvec_base[29:0];
end

assign mtvec_value[31:0] = {mtvec_base[29:0], mtvec_mode[1:0]};

assign vec_adder_vbr[29:0] = mtvt_value[31:2]  + {18'b0, vec_adder_vec[11:0]};
assign mtvec_rslt_use_base = !minhv || !m_intr; // Non-Vec mode or expt

assign mtvec_rslt[29:0] = mtvec_rslt_use_base ? mtvec_base[29:0]
                                              : vec_adder_vbr[29:0];



//==========================================================
//               Define the MCNTEN register
//  Machine Trap Vector Register
//  31-bit Machine Mode Read/Write
//  Providing the Trap Vector Base and Mode
//  the definiton for MTVEC register is listed as follows
//  IR, TM, CY
//==========================================================
always @(posedge regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mcnten_reg[2:0] <= 3'b0;
  else if(mcnten_local_en)
    mcnten_reg[2:0] <= iui_regs_wdata[2:0];
  else
    mcnten_reg[2:0] <= mcnten_reg[2:0];
end

always @(posedge regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    mcnten_hpm3 <= 1'b0;
    mcnten_hpm4 <= 1'b0;
    mcnten_hpm8 <= 1'b0;
    mcnten_hpm9 <= 1'b0;
    mcnten_hpm13 <= 1'b0;
    mcnten_hpm14 <= 1'b0;
    mcnten_hpm15 <= 1'b0;
    mcnten_hpm16 <= 1'b0;
    mcnten_hpm17 <= 1'b0;
  end
  else if(mcnten_local_en) begin
    mcnten_hpm3 <= iui_regs_wdata[3];
    mcnten_hpm4 <= iui_regs_wdata[4];
    mcnten_hpm8 <= iui_regs_wdata[8];
    mcnten_hpm9 <= iui_regs_wdata[9];
    mcnten_hpm13 <= iui_regs_wdata[13];
    mcnten_hpm14 <= iui_regs_wdata[14];
    mcnten_hpm15 <= iui_regs_wdata[15];
    mcnten_hpm16 <= iui_regs_wdata[16];
    mcnten_hpm17 <= iui_regs_wdata[17];
  end
end

assign mcnten_hpm[28:0] = {14'b0, mcnten_hpm17, mcnten_hpm16, mcnten_hpm15,
                           mcnten_hpm14, mcnten_hpm13, 3'b0, mcnten_hpm9,
                           mcnten_hpm8,  3'b0, mcnten_hpm4, mcnten_hpm3};

assign mcnten_value[31:0] = {mcnten_hpm[28:0], mcnten_reg[2:0]};


//==========================================================
//               Define the MTVEC register
//  Machine Trap Vector Register
//  31-bit Machine Mode Read/Write
//  Providing the Base Addres of Trap Vector Table
//  the definiton for MTVEC register is listed as follows
//==========================================================
always @(posedge regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mtvt_base[25:0] <= 26'b0;
  else if(mtvt_local_en)
    mtvt_base[25:0] <= iui_regs_wdata[31:6];
  else
    mtvt_base[25:0] <= mtvt_base[25:0];
end

assign mtvt_value[31:0] = {mtvt_base[25:0], 6'b0};
// &Force("output", "mtvt_value"); @392

//==========================================================
//               Define the MSCRATCH register
//  Machine Scratch Register
//  31-bit Machine Mode Read/Write
//  Providing the Software Scratch register
//  the definiton for MSCRATCH register is listed as follows
//==========================================================
always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mscratch[31:0] <= 32'b0;
  else if(mscratch_local_en)
    mscratch[31:0] <= iui_regs_wdata[31:0];
  else if(mscratch_swap_int_sp_en)
    mscratch[31:0] <= idu_cp0_sp_reg[31:0];
  else if(mscratchcsw_swap_en || mscratchcswl_swap_en)
    mscratch[31:0] <= iui_regs_wdata[31:0];
  else
    mscratch[31:0] <= mscratch[31:0];
end
assign mscratch_value[31:0] = mscratch[31:0];


//==========================================================
//               Define the MEPC register
//  Machine Exception PC Register
//  32-bit Machine Mode Read/Write
//  Providing the Machine Exception PC Register
//  the definiton for MEPC register is listed as follows
//==========================================================
always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mepc_reg[31:0] <= 32'b0;
  else if(rtu_yy_xx_expt_vld)
    mepc_reg[31:0] <= rtu_cp0_epc[31:0];
  else if(regs_inst_nmi_mret)
    mepc_reg[31:0] <= {nmi_pc_31_1[30:0], 1'b0};
  else if(mepc_local_en)
    mepc_reg[31:0] <= {iui_regs_wdata[31:1], 1'b0};
  else if(idu_cp0_mepc_wen)
    mepc_reg[31:0] <= {idu_cp0_ipop_data[31:1], 1'b0};
  else
    mepc_reg[31:0] <= mepc_reg[31:0];
end
// &Force("bus", "idu_cp0_ipop_data", 31, 0); @441

assign mepc_value[31:0] = mepc_reg[31:0];


//==========================================================
//               Define the MCAUSE register
//  Machine CAUSE Register
//  32-bit Machine Mode Read/Write
//  Providing the Machine Trap Cause register
//  the definiton for MCAUSE register is listed as follows
//==========================================================
// &Force("output", "mcause_value"); @453
always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    m_intr <= 1'b0;
  else if(rtu_yy_xx_expt_vld)
    m_intr <= rtu_yy_xx_expt_int;
  else if(regs_inst_nmi_mret)
    m_intr <= nmi_intr;
  else if(mcause_local_en)
    m_intr <= iui_regs_wdata[31];
  else if(idu_cp0_mcause_wen)
    m_intr <= idu_cp0_ipop_data[31];
  else if(rtu_yy_xx_tail_int_vld || idu_yy_xx_tail_ack)
    // rtu_yy_xx_tail_int_vld is for vector addr. and it will be overwrite
    // immidately
    m_intr <= 1'b1;
  else
    m_intr <= m_intr;
end

assign int_mret_vld = iui_regs_inst_mret && m_intr;

assign hw_vector_clic_on = (mtvec_mode[1:0] == 2'b11 && rtu_yy_xx_int_hv)
                         && rtu_yy_xx_expt_int && rtu_yy_xx_expt_vld;
always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    minhv <= 1'b0;
  else if(mtvec_mode[1] == 1'b0) // Orignal vec mode
    minhv <= 1'b0;
  else if(mcause_local_en)
    minhv <= iui_regs_wdata[30];
  else if(idu_cp0_mcause_wen)
    minhv <= idu_cp0_ipop_data[30];
  else if(hw_vector_clic_on)    // CLIC mode
    minhv <= 1'b1;
  else if(rtu_yy_xx_tail_int_vld)
    minhv <= mtvec_mode[1:0] == 2'b11 && minhv_tail;
  else if(ifu_cp0_vec_succeed)
    minhv <= 1'b0;
end

// minhv_tail is for clic tail_ack to judge last int is hv or non-hv.
always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    minhv_tail <= 1'b0;
  else if(mtvec_mode[1] == 1'b0) // Orignal vec mode
    minhv_tail <= 1'b0;
  else if(idu_cp0_id_tail_vld)
    minhv_tail <= rtu_cp0_pending_int_hv;
end

always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mpil[7:0] <= 8'b0;
  else if(mtvec_mode[1] == 1'b0)
    mpil[7:0] <= 8'b0;
  else if(rtu_yy_xx_expt_int)
    mpil[7:0] <= mil_val[7:0];
  else if(mcause_local_en)
    mpil[7:0] <= iui_regs_wdata[23:16];
  else if(idu_cp0_mcause_wen)
    mpil[7:0] <= idu_cp0_ipop_data[23:16];
  else
    mpil[7:0] <= mpil[7:0];
end

always @ (posedge regs_flush_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    m_vector_tail[11:0] <= 12'b0;
  else if (idu_cp0_id_tail_vld)
    m_vector_tail[11:0] <= rtu_cp0_pending_int_id[11:0];
end

always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    m_vector[11:0] <= 12'b0;
  else if(rtu_yy_xx_expt_vld)
    m_vector[11:0] <= rtu_yy_xx_expt_vec[11:0];
  else if(ifu_cp0_vec_err)
    m_vector[11:0] <= 12'd1;
  else if(regs_inst_nmi_mret)
    m_vector[11:0] <= nmi_vector[11:0];
  else if(mcause_local_en)
    m_vector[11:0] <= iui_regs_wdata[11:0];
  else if(idu_cp0_mcause_wen)
    m_vector[11:0] <= idu_cp0_ipop_data[11:0];
  else if(mnxti_local_en && mnxti_vld_int_pending)
    m_vector[11:0] <= rtu_cp0_pending_int_id[11:0];
  else if(rtu_yy_xx_tail_int_vld || idu_yy_xx_tail_ack)
    // rtu_yy_xx_tail_int_vld is for vector addr. and it will be overwrite
    // immidately
    m_vector[11:0] <= m_vector_tail[11:0];
  else
    m_vector[11:0] <= m_vector[11:0];
end

assign mcause_value[31:0]    = mtvec_mode[1] ?
                              {m_intr, minhv, mpp[1:0], mpie, 3'b0,
                                     mpil[7:0], 4'b0, m_vector[11:0]}
                            : {m_intr, 27'b0, m_vector[3:0]};
assign mcause_spec_value[31:0]    = {m_intr, 1'b0, mpp[1:0], mpie, 3'b0,
                                     mpil[7:0], 4'b0, m_vector[11:0]};
assign mcause_bypass_value[31:0] = {1'b1, 1'b0, pm[1:0], mie_bit, 3'b0,
                                     mil[7:0], 4'b0, rtu_yy_xx_expt_vec[11:0]};

assign regs_inst_nmi_mret = iui_regs_inst_mret && regs_cpu_in_nmi;
//==========================================================
//               Define the MTVAL register
//  Machine Trap value Register
//  32-bit Machine Mode Read/Write
//  Providing the trap value register
//  the definiton for MTVAL register is listed as follows
//==========================================================

always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mtval_data[31:0] <= 32'b0;
  else if(rtu_yy_xx_expt_vld && !rtu_cp0_nmi_vld)
    mtval_data[31:0] <= rtu_cp0_tval[31:0];
  else if(ifu_cp0_vec_err)
    mtval_data[31:0] <= {vec_adder_vbr[29:0], 2'b0};
  else if(mtval_local_en)
    mtval_data[31:0] <= iui_regs_wdata[31:0];
  else
    mtval_data[31:0] <= mtval_data[31:0];
end
assign mtval_value[31:0] = mtval_data[31:0];


//==========================================================
//               Define the MIP register
//  Machine Interrupt Pending Register
//  32-bit Machine Mode Read/Write
//  Providing the Interrupt Pending of the current core
//  the definiton for MIP register is listed as follows
//==========================================================
assign mip_value[31:0] = 32'b0;


//==========================================================
//               Define the MNXTI register
//  Machine Next Interrupt Handler Address and Interrupt
//  -Enable CSR
//  32-bit Machine Mode Read/Write
//  Providing the Next Interrupt Information
//  the definiton for MIP register is listed as follows
//==========================================================
assign mnxti_vld_int_pending = rtu_cp0_mnxti_pending_vld;
assign mnxti_pending_addr[29:0] = mtvt_value[31:2] + {18'b0, rtu_cp0_pending_int_id[11:0]};
assign mnxti_value[31:0] = mnxti_vld_int_pending ? {mnxti_pending_addr[29:0], 2'b0}
                                                 : 32'b0;

//==========================================================
//               Define the MINTSTATUS register
//  Machine Interrupt Status Register
//  32-bit Machine Mode Read/Write
//  Providing the Interrupt Pending Level Status
//  the definiton for MIP register is listed as follows
//==========================================================
always @ (posedge regs_flush_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mil_tail[7:0] <= 8'b0;
  else if (idu_cp0_id_tail_vld)
    mil_tail[7:0] <= rtu_cp0_pending_int_level[7:0];
end
always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mil[7:0] <= 8'b0;
  else if(!mtvec_mode[1])
    mil[7:0] <= 8'b0;
  else if(rtu_yy_xx_expt_int && rtu_yy_xx_expt_vld)
    mil[7:0] <= rtu_cp0_int_level[7:0];
  else if(int_mret_vld)
    mil[7:0] <= mpil[7:0];
  else if(mnxti_local_en && mnxti_vld_int_pending)
    mil[7:0] <= rtu_cp0_pending_int_level[7:0];
  else if(idu_yy_xx_tail_ack)
    mil[7:0] <= mil_tail[7:0];
  else
    mil[7:0] <= mil[7:0];
end
assign mintstatus_value[31:0] = {mil[7:0], 24'b0};

assign mil_val[7:0] = int_mret_vld ? mpil[7:0] : mil[7:0];


//==========================================================
//               Define the MSCRATCHCSW register
//  Machine Scratch Swap Register
//  32-bit Machine Mode Read/Write
//  Providing the optional Swap Scratch Register
//  the definiton for MIP register is listed as follows
//==========================================================
assign mscratchcsw_swap_en = mscratchcsw_local_en && mpp[1:0] != pm[1:0];
assign mscratchcsw_value[31:0] = mscratchcsw_swap_en ? mscratch[31:0]
                                                     : iui_regs_wdata_rs1[31:0];


//==========================================================
//               Define the MSCRATCHCSWL register
//  Machine Scratch Swap Register for interrupt Levels
//  32-bit Machine Mode Read/Write
//  Providing the optional Swap Scratch Register for Levels
//  the definiton for MIP register is listed as follows
//==========================================================
assign spec_mil[7:0] = rtu_yy_xx_expt_int ? rtu_cp0_int_level[7:0] : mil[7:0];
assign spec_mpil[7:0] = rtu_yy_xx_expt_int ? mil[7:0] : mpil[7:0];

assign swap_int_sp = (spec_mil[7:0] == 8'b0) ^ (spec_mpil[7:0] == 8'b0);
assign mscratchcswl_swap_en = mscratchcswl_local_en && swap_int_sp;
assign mscratchcswl_value[31:0] = mscratchcswl_swap_en ? mscratch[31:0]
                                                       : iui_regs_wdata_rs1[31:0];

assign ipush_sp_use_mscratch = (rtu_yy_xx_expt_int || idu_cp0_sp_swap_pending)
                            && swap_int_sp && regs_spswap_en;

assign mscratch_swap_int_sp_en = (idu_cp0_sp_swap_req
                               || int_mret_vld)
                               && regs_spswap_en && swap_int_sp;
assign mscratch_swap_int_sp_en_gate = (idu_cp0_sp_swap_req_gate
                                    || int_mret_vld)
                                    && regs_spswap_en && swap_int_sp;
assign regs_swap_int_sp_en_gate = mscratch_swap_int_sp_en_gate;



//==========================================================
//               Define the MCLICBASE register
//  Machine Interrupt Pending Register
//  32-bit Machine Mode Read/Write
//  Providing the Base Address of CLIC Memory Map Region
//  the definiton for MIP register is listed as follows
//==========================================================
assign mclicbase_value[31:0] = tcip_cp0_clic_base[31:0];


//==========================================================
//               Define the MXSTATUS register
//  Machine Extension Status register
//  32-bit Machine Mode Read/Write
//  Providing the C-SKY Extension Status of the current core
//  the definiton for MXSTATUS register is listed as follows
//==========================================================
always @(posedge regs_flush_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pm[1:0] <= 2'b11;
  else if(rtu_cp0_exit_debug)
    pm[1:0] <= dtu_cp0_dcsr_prv[1:0];
  else if(rtu_yy_xx_expt_vld)
    pm[1:0] <= 2'b11;
  else if(iui_regs_inst_mret)
    pm[1:0] <= mpp[1:0];
  else
    pm[1:0] <= pm[1:0];
end

assign pm_bypass[1:0] = iui_regs_inst_mret ? mpp[1:0]
                                           : pm[1:0];

always @(posedge regs_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    mm    <= 1'b1;
  else if(mxstatus_local_en)
    mm    <= iui_regs_wdata[15];
  else
    mm    <= mm;
end

always @(posedge regs_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    cskyisaee <= 1'b1;
    pmdm      <= 1'b0;
    pmdu      <= 1'b0;
  end
  else if(mxstatus_local_en)
  begin
    cskyisaee <= iui_regs_wdata[22];
    pmdm      <= iui_regs_wdata[13];
    pmdu      <= iui_regs_wdata[10];
  end
  else
  begin
    cskyisaee <= cskyisaee;
    pmdm      <= pmdm;
    pmdu      <= pmdu;
  end
end
assign mxstatus_value[31:0]  = {pm[1:0], 7'b0, cskyisaee, 4'b0,
                                1'b0, 1'b0, mm, 1'b0, pmdm,
                                2'b0, pmdu, 2'b0, 8'b0};

//==========================================================
//               Define the MNMICAUSE register
//  Machine Extension Status register
//  32-bit Machine Mode Read/Write
//  Providing the C-SKY Extension Status of the current core
//  the definiton for MXSTATUS register is listed as follows
//==========================================================
always @ (posedge regs_flush_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    nmi_intr <= 1'b0;
  else if (rtu_cp0_nmi_vld)
    nmi_intr <= m_intr;
  else if (mnmicause_local_en)
    nmi_intr <= iui_regs_wdata[31];
  else
    nmi_intr <= nmi_intr;
end

always @ (posedge regs_flush_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    nmi_mpp[1:0] <= 2'b0;
  else if (rtu_cp0_nmi_vld)
    nmi_mpp[1:0] <= mpp[1:0];
  else if (regs_inst_nmi_mret)
    nmi_mpp[1:0] <= 2'b0;
  else if (mnmicause_local_en)
    nmi_mpp[1:0] <= iui_regs_wdata[29:28];
  else
    nmi_mpp[1:0] <= nmi_mpp[1:0];
end

always @ (posedge regs_flush_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    nmi_mpie <= 1'b0;
  else if (rtu_cp0_nmi_vld)
    nmi_mpie <= mpie;
  else if (regs_inst_nmi_mret)
    nmi_mpie <= 1'b1;
  else if (mnmicause_local_en)
    nmi_mpie <= iui_regs_wdata[27];
  else
    nmi_mpie <= nmi_mpie;
end

always @ (posedge regs_flush_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    nmi_vector[11:0] <= 12'b0;
  else if (rtu_cp0_nmi_vld)
    nmi_vector[11:0] <= m_vector[11:0];
  else if (mnmicause_local_en)
    nmi_vector[11:0] <= iui_regs_wdata[11:0];
  else
    nmi_vector[11:0] <= nmi_vector[11:0];
end

assign mnmicause_value[31:0] = {nmi_intr, 1'b0, nmi_mpp[1:0], nmi_mpie,
                                3'b0, 8'b0, 4'b0, nmi_vector[11:0]};

//==========================================================
//               Define the MNMIPC register
//  Machine Extension Status register
//  32-bit Machine Mode Read/Write
//  Providing the C-SKY Extension Status of the current core
//  the definiton for MXSTATUS register is listed as follows
//==========================================================
always @ (posedge regs_flush_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    nmi_pc_31_1[30:0] <= 31'b0;
  else if (mnmipc_local_en)
    nmi_pc_31_1[30:0] <= iui_regs_wdata[31:1];
  else if (rtu_cp0_nmi_vld)
    nmi_pc_31_1[30:0] <= mepc_reg[31:1];
  else
    nmi_pc_31_1[30:0] <= nmi_pc_31_1[30:0];
end

assign mnmipc_value[31:0] = {nmi_pc_31_1[30:0], 1'b0};

//==========================================================
// Rename for Output
//==========================================================

// Output to CP0
assign regs_cpu_in_int  = m_intr;
assign trap_csr_pm[1:0] = pm[1:0];

// Output to RTU
assign cp0_dtu_int_id[11:0]   = m_vector_tail[11:0];
assign cp0_rtu_tail_int_id[11:0]   = m_vector_tail[11:0];
assign cp0_rtu_tail_int_hv         = minhv_tail;
assign cp0_rtu_int_level[7:0] = mil_val[7:0];
assign cp0_rtu_int_mode[1:0]  = mtvec_mode[1:0];
assign cp0_rtu_mpil[7:0]      = mpil[7:0];
assign cp0_rtu_mnxti_vld      = mnxti_local_en && mnxti_vld_int_pending;
assign cp0_rtu_mie            = mie_valid;
assign cp0_rtu_pm_bypass[1:0] = pm_bypass[1:0];
assign cp0_rtu_in_nmi         = regs_cpu_in_nmi;

assign cp0_yy_cskyisaee       = cskyisaee;
assign cp0_lsu_mm             = mm;

assign cp0_pmp_mstatus_mprv = rtu_yy_xx_dbgon ? dtu_cp0_dcsr_mprven && mprv : mprv;
assign cp0_pmp_mstatus_mpp[1:0] = mpp[1:0];
// &Force("input","dtu_cp0_dcsr_mprven"); @929

assign cp0_idu_fs[1:0] = fs[1:0];
assign regs_fs_off = fs_off;

assign cp0_dtu_mexpt_vld = rtu_yy_xx_expt_vld;

assign cp0_idu_sp_wen = mscratch_swap_int_sp_en;
assign cp0_idu_sp_wen_gate = mscratch_swap_int_sp_en_gate;
assign cp0_idu_sp_use_scratch = ipush_sp_use_mscratch;
assign cp0_idu_sp_wdata[31:0] = mscratch[31:0];
assign cp0_idu_mepc[31:0]     = rtu_yy_xx_expt_int ? rtu_cp0_epc[31:0] : mepc_reg[31:0];
assign cp0_idu_mcause[31:0]   = rtu_yy_xx_expt_int ? mcause_bypass_value[31:0] : mcause_spec_value[31:0];

assign cp0_hpcp_pmdm = pmdm;
assign cp0_hpcp_pmdu = pmdu;


// &ModuleEnd; @958
endmodule


