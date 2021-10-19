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
module pa_dtu_trigger_module(
  cp0_dtu_addr,
  cp0_dtu_icg_en,
  cp0_dtu_mexpt_vld,
  cp0_dtu_wdata,
  cp0_dtu_wreg,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  dtu_cause,
  dtu_ifu_halt_info0,
  dtu_ifu_halt_info1,
  dtu_ifu_halt_info_vld,
  dtu_lsu_halt_info,
  dtu_lsu_halt_info_vld,
  forever_cpuclk,
  icount_enable,
  ifu_dtu_addr_vld0,
  ifu_dtu_addr_vld1,
  ifu_dtu_data_vld0,
  ifu_dtu_data_vld1,
  ifu_dtu_exe_addr0,
  ifu_dtu_exe_addr1,
  ifu_dtu_exe_data0,
  ifu_dtu_exe_data1,
  ldst_addr_mcontrol,
  ldst_data_mcontrol,
  lsu_dtu_halt_info,
  lsu_dtu_last_check,
  lsu_dtu_ldst_addr,
  lsu_dtu_ldst_addr_vld,
  lsu_dtu_ldst_bytes_vld,
  lsu_dtu_ldst_data,
  lsu_dtu_ldst_data_vld,
  lsu_dtu_ldst_type,
  lsu_dtu_mem_access_size,
  mcontext,
  pad_yy_icg_scan_en,
  pending_halt,
  rtu_dtu_halt_ack,
  rtu_dtu_pending_ack,
  rtu_dtu_retire_halt_info,
  rtu_dtu_retire_mret,
  rtu_dtu_retire_vld,
  rtu_yy_xx_dbgon,
  tcontrol,
  tdata1,
  tdata2,
  tdata3,
  tinfo,
  tselect,
  updata_tval
);

// &Ports; @24
input   [11:0]  cp0_dtu_addr;            
input           cp0_dtu_icg_en;          
input           cp0_dtu_mexpt_vld;       
input   [31:0]  cp0_dtu_wdata;           
input           cp0_dtu_wreg;            
input           cp0_yy_clk_en;           
input   [1 :0]  cp0_yy_priv_mode;        
input           cpurst_b;                
input           forever_cpuclk;          
input           ifu_dtu_addr_vld0;       
input           ifu_dtu_addr_vld1;       
input           ifu_dtu_data_vld0;       
input           ifu_dtu_data_vld1;       
input   [31:0]  ifu_dtu_exe_addr0;       
input   [31:0]  ifu_dtu_exe_addr1;       
input   [31:0]  ifu_dtu_exe_data0;       
input   [31:0]  ifu_dtu_exe_data1;       
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
input           rtu_dtu_halt_ack;        
input           rtu_dtu_pending_ack;     
input   [14:0]  rtu_dtu_retire_halt_info; 
input           rtu_dtu_retire_mret;     
input           rtu_dtu_retire_vld;      
input           rtu_yy_xx_dbgon;         
output  [3 :0]  dtu_cause;               
output  [14:0]  dtu_ifu_halt_info0;      
output  [14:0]  dtu_ifu_halt_info1;      
output          dtu_ifu_halt_info_vld;   
output  [14:0]  dtu_lsu_halt_info;       
output          dtu_lsu_halt_info_vld;   
output          icount_enable;           
output          ldst_addr_mcontrol;      
output          ldst_data_mcontrol;      
output  [31:0]  mcontext;                
output          pending_halt;            
output  [31:0]  tcontrol;                
output  [31:0]  tdata1;                  
output  [31:0]  tdata2;                  
output  [31:0]  tdata3;                  
output  [31:0]  tinfo;                   
output  [31:0]  tselect;                 
output          updata_tval;             

// &Regs; @25

// &Wires; @26
wire    [11:0]  cp0_dtu_addr;            
wire            cp0_dtu_icg_en;          
wire            cp0_dtu_mexpt_vld;       
wire    [31:0]  cp0_dtu_wdata;           
wire            cp0_dtu_wreg;            
wire            cp0_write_mcontext;      
wire            cp0_write_tcontrol;      
wire            cp0_write_tdata1;        
wire            cp0_write_tdata2;        
wire            cp0_write_tdata3;        
wire            cp0_write_tselect;       
wire            cp0_yy_clk_en;           
wire    [1 :0]  cp0_yy_priv_mode;        
wire            cpurst_b;                
wire    [3 :0]  dtu_cause;               
wire    [14:0]  dtu_ifu_halt_info0;      
wire    [14:0]  dtu_ifu_halt_info1;      
wire            dtu_ifu_halt_info_vld;   
wire    [14:0]  dtu_lsu_halt_info;       
wire            dtu_lsu_halt_info_vld;   
wire            exe0_16bit;              
wire            exe0_32bit;              
wire            exe1_16bit;              
wire            exe1_32bit;              
wire            forever_cpuclk;          
wire            icount_enable;           
wire            ifu_dtu_addr_vld0;       
wire            ifu_dtu_addr_vld1;       
wire            ifu_dtu_data_vld0;       
wire            ifu_dtu_data_vld1;       
wire    [31:0]  ifu_dtu_exe_addr0;       
wire    [31:0]  ifu_dtu_exe_addr1;       
wire    [31:0]  ifu_dtu_exe_data0;       
wire    [31:0]  ifu_dtu_exe_data1;       
wire            ldst_16bit;              
wire            ldst_32bit;              
wire            ldst_8bit;               
wire            ldst_addr_mcontrol;      
wire            ldst_data_mcontrol;      
wire            load_addr_vld;           
wire            load_data_vld;           
wire    [14:0]  lsu_dtu_halt_info;       
wire            lsu_dtu_last_check;      
wire    [31:0]  lsu_dtu_ldst_addr;       
wire            lsu_dtu_ldst_addr_vld;   
wire    [7 :0]  lsu_dtu_ldst_bytes_vld;  
wire    [31:0]  lsu_dtu_ldst_data;       
wire            lsu_dtu_ldst_data_vld;   
wire    [1 :0]  lsu_dtu_ldst_type;       
wire    [1 :0]  lsu_dtu_mem_access_size; 
wire            m_mode;                  
wire    [31:0]  mcontext;                
wire            pad_yy_icg_scan_en;      
wire            pending_halt;            
wire            rtu_dtu_halt_ack;        
wire            rtu_dtu_pending_ack;     
wire    [14:0]  rtu_dtu_retire_halt_info; 
wire            rtu_dtu_retire_mret;     
wire            rtu_dtu_retire_vld;      
wire            rtu_yy_xx_dbgon;         
wire            store_addr_vld;          
wire            store_data_vld;          
wire    [31:0]  tcontrol;                
wire    [31:0]  tdata1;                  
wire    [31:0]  tdata2;                  
wire    [31:0]  tdata3;                  
wire    [31:0]  tinfo;                   
wire    [31:0]  tselect;                 
wire            u_mode;                  
wire            updata_tval;             


parameter XLEN = `TDT_DM_CORE_MAX_XLEN;

//=========================================================            
//                  information from core             
//=========================================================
//privileg mode
assign m_mode = cp0_yy_priv_mode[1:0] == 2'b11 || rtu_dtu_retire_mret;
//assign s_mode = (cp0_yy_priv_mode[1:0] == 2'b01 || rtu_dtu_retire_sret) && !rtu_dtu_retire_mret;
assign u_mode = cp0_yy_priv_mode[1:0] == 2'b00 && !rtu_dtu_retire_mret;

//cp0 write trigger csrm req
assign cp0_write_tselect  = cp0_dtu_wreg && cp0_dtu_addr[11:0] == 12'h7a0;
assign cp0_write_tdata1   = cp0_dtu_wreg && cp0_dtu_addr[11:0] == 12'h7a1; 
assign cp0_write_tdata2   = cp0_dtu_wreg && cp0_dtu_addr[11:0] == 12'h7a2;
assign cp0_write_tdata3   = cp0_dtu_wreg && cp0_dtu_addr[11:0] == 12'h7a3;
assign cp0_write_tcontrol = cp0_dtu_wreg && cp0_dtu_addr[11:0] == 12'h7a5;
assign cp0_write_mcontext = cp0_dtu_wreg && cp0_dtu_addr[11:0] == 12'h7a8;



//int or expt vld

//exe, store or load vld
assign store_addr_vld  = lsu_dtu_ldst_addr_vld && lsu_dtu_ldst_type[0];
assign store_data_vld  = lsu_dtu_ldst_data_vld && lsu_dtu_ldst_type[0];
assign load_addr_vld   = lsu_dtu_ldst_addr_vld && lsu_dtu_ldst_type[1];
assign load_data_vld   = lsu_dtu_ldst_data_vld && lsu_dtu_ldst_type[1];

//mem access or execution size 
// &Force("input","ifu_dtu_exe_data0");&Force("bus","ifu_dtu_exe_data0",31,0); @81
// &Force("input","ifu_dtu_exe_data1");&Force("bus","ifu_dtu_exe_data1",31,0); @82
assign exe0_16bit = !(ifu_dtu_exe_data0[0] && ifu_dtu_exe_data0[1]);
assign exe0_32bit = ifu_dtu_exe_data0[0] && ifu_dtu_exe_data0[1];
assign exe1_16bit = !(ifu_dtu_exe_data1[0] && ifu_dtu_exe_data1[1]);
assign exe1_32bit = ifu_dtu_exe_data1[0] && ifu_dtu_exe_data1[1];

assign ldst_8bit   = lsu_dtu_mem_access_size[1:0] == 2'b00;
assign ldst_16bit  = lsu_dtu_mem_access_size[1:0] == 2'b01;
assign ldst_32bit  = lsu_dtu_mem_access_size[1:0] == 2'b10;

//     &Instance("pa_dtu_0m_0iie"); @95
//     &Instance("pa_dtu_m_iie_all"); @97
//   &Instance("pa_dtu_m_iie_all"); @100
pa_dtu_m_iie_all  x_pa_dtu_m_iie_all (
  .cp0_dtu_icg_en           (cp0_dtu_icg_en          ),
  .cp0_dtu_mexpt_vld        (cp0_dtu_mexpt_vld       ),
  .cp0_dtu_wdata            (cp0_dtu_wdata           ),
  .cp0_write_mcontext       (cp0_write_mcontext      ),
  .cp0_write_tcontrol       (cp0_write_tcontrol      ),
  .cp0_write_tdata1         (cp0_write_tdata1        ),
  .cp0_write_tdata2         (cp0_write_tdata2        ),
  .cp0_write_tdata3         (cp0_write_tdata3        ),
  .cp0_write_tselect        (cp0_write_tselect       ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .dtu_cause                (dtu_cause               ),
  .dtu_ifu_halt_info0       (dtu_ifu_halt_info0      ),
  .dtu_ifu_halt_info1       (dtu_ifu_halt_info1      ),
  .dtu_ifu_halt_info_vld    (dtu_ifu_halt_info_vld   ),
  .dtu_lsu_halt_info        (dtu_lsu_halt_info       ),
  .dtu_lsu_halt_info_vld    (dtu_lsu_halt_info_vld   ),
  .exe0_16bit               (exe0_16bit              ),
  .exe0_32bit               (exe0_32bit              ),
  .exe1_16bit               (exe1_16bit              ),
  .exe1_32bit               (exe1_32bit              ),
  .forever_cpuclk           (forever_cpuclk          ),
  .icount_enable            (icount_enable           ),
  .ifu_dtu_addr_vld0        (ifu_dtu_addr_vld0       ),
  .ifu_dtu_addr_vld1        (ifu_dtu_addr_vld1       ),
  .ifu_dtu_data_vld0        (ifu_dtu_data_vld0       ),
  .ifu_dtu_data_vld1        (ifu_dtu_data_vld1       ),
  .ifu_dtu_exe_addr0        (ifu_dtu_exe_addr0       ),
  .ifu_dtu_exe_addr1        (ifu_dtu_exe_addr1       ),
  .ldst_16bit               (ldst_16bit              ),
  .ldst_32bit               (ldst_32bit              ),
  .ldst_8bit                (ldst_8bit               ),
  .ldst_addr_mcontrol       (ldst_addr_mcontrol      ),
  .ldst_data_mcontrol       (ldst_data_mcontrol      ),
  .load_addr_vld            (load_addr_vld           ),
  .load_data_vld            (load_data_vld           ),
  .lsu_dtu_halt_info        (lsu_dtu_halt_info       ),
  .lsu_dtu_last_check       (lsu_dtu_last_check      ),
  .lsu_dtu_ldst_addr        (lsu_dtu_ldst_addr       ),
  .lsu_dtu_ldst_addr_vld    (lsu_dtu_ldst_addr_vld   ),
  .lsu_dtu_ldst_bytes_vld   (lsu_dtu_ldst_bytes_vld  ),
  .lsu_dtu_ldst_data        (lsu_dtu_ldst_data       ),
  .lsu_dtu_ldst_data_vld    (lsu_dtu_ldst_data_vld   ),
  .m_mode                   (m_mode                  ),
  .mcontext                 (mcontext                ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .pending_halt             (pending_halt            ),
  .rtu_dtu_halt_ack         (rtu_dtu_halt_ack        ),
  .rtu_dtu_pending_ack      (rtu_dtu_pending_ack     ),
  .rtu_dtu_retire_halt_info (rtu_dtu_retire_halt_info),
  .rtu_dtu_retire_mret      (rtu_dtu_retire_mret     ),
  .rtu_dtu_retire_vld       (rtu_dtu_retire_vld      ),
  .rtu_yy_xx_dbgon          (rtu_yy_xx_dbgon         ),
  .store_addr_vld           (store_addr_vld          ),
  .store_data_vld           (store_data_vld          ),
  .tcontrol                 (tcontrol                ),
  .tdata1                   (tdata1                  ),
  .tdata2                   (tdata2                  ),
  .tdata3                   (tdata3                  ),
  .tinfo                    (tinfo                   ),
  .tselect                  (tselect                 ),
  .u_mode                   (u_mode                  ),
  .updata_tval              (updata_tval             )
);


     
// &ModuleEnd; @109
endmodule


