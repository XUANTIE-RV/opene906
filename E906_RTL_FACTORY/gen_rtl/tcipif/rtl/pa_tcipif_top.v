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
module pa_tcipif_top(
  bmu_tcipif_dbus_acc_deny,
  bmu_tcipif_dbus_addr,
  bmu_tcipif_dbus_req,
  bmu_tcipif_dbus_req_dp,
  bmu_tcipif_dbus_size,
  bmu_tcipif_dbus_supv_mode,
  bmu_tcipif_dbus_wdata,
  bmu_tcipif_dbus_write,
  bmu_tcipif_ibus_acc_deny,
  bmu_tcipif_ibus_addr,
  bmu_tcipif_ibus_req,
  bmu_tcipif_ibus_req_dp,
  bmu_tcipif_ibus_size,
  bmu_tcipif_ibus_supv_mode,
  bmu_tcipif_ibus_wdata,
  bmu_tcipif_ibus_write,
  clic_cpu_int_hv,
  clic_cpu_int_id,
  clic_cpu_int_il,
  clic_cpu_int_priv,
  cp0_biu_icg_en,
  cp0_yy_priv_mode,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpurst_b,
  forever_cpuclk,
  ifu_clic_warm_up,
  pad_clic_int_vld,
  pad_cpu_tcip_base,
  pad_yy_dft_clk_rst_b,
  pad_yy_icg_scan_en,
  pad_yy_scan_mode,
  rtu_yy_xx_dbgon,
  sysio_clint_me_int,
  sysio_clint_mtime,
  sysmap_tcipif_cmplt,
  sysmap_tcipif_rdata,
  tcip_cp0_clic_base,
  tcipif_bmu_dbus_acc_err,
  tcipif_bmu_dbus_data,
  tcipif_bmu_dbus_grnt,
  tcipif_bmu_dbus_trans_cmplt,
  tcipif_bmu_ibus_acc_err,
  tcipif_bmu_ibus_data,
  tcipif_bmu_ibus_grnt,
  tcipif_bmu_ibus_trans_cmplt,
  tcipif_sysmap_addr,
  tcipif_sysmap_sel,
  tcipif_sysmap_wdata,
  tcipif_sysmap_write
);

// &Ports; @23
input            bmu_tcipif_dbus_acc_deny;   
input   [31 :0]  bmu_tcipif_dbus_addr;       
input            bmu_tcipif_dbus_req;        
input            bmu_tcipif_dbus_req_dp;     
input   [1  :0]  bmu_tcipif_dbus_size;       
input            bmu_tcipif_dbus_supv_mode;  
input   [31 :0]  bmu_tcipif_dbus_wdata;      
input            bmu_tcipif_dbus_write;      
input            bmu_tcipif_ibus_acc_deny;   
input   [31 :0]  bmu_tcipif_ibus_addr;       
input            bmu_tcipif_ibus_req;        
input            bmu_tcipif_ibus_req_dp;     
input   [1  :0]  bmu_tcipif_ibus_size;       
input            bmu_tcipif_ibus_supv_mode;  
input   [31 :0]  bmu_tcipif_ibus_wdata;      
input            bmu_tcipif_ibus_write;      
input            cp0_biu_icg_en;             
input   [1  :0]  cp0_yy_priv_mode;           
input   [11 :0]  cpu_clic_curid;             
input            cpu_clic_int_exit;          
input            cpurst_b;                   
input            forever_cpuclk;             
input            ifu_clic_warm_up;           
input   [127:0]  pad_clic_int_vld;           
input   [31 :0]  pad_cpu_tcip_base;          
input            pad_yy_dft_clk_rst_b;       
input            pad_yy_icg_scan_en;         
input            pad_yy_scan_mode;           
input            rtu_yy_xx_dbgon;            
input            sysio_clint_me_int;         
input   [63 :0]  sysio_clint_mtime;          
input            sysmap_tcipif_cmplt;        
input   [31 :0]  sysmap_tcipif_rdata;        
output           clic_cpu_int_hv;            
output  [11 :0]  clic_cpu_int_id;            
output  [7  :0]  clic_cpu_int_il;            
output  [1  :0]  clic_cpu_int_priv;          
output  [31 :0]  tcip_cp0_clic_base;         
output           tcipif_bmu_dbus_acc_err;    
output  [31 :0]  tcipif_bmu_dbus_data;       
output           tcipif_bmu_dbus_grnt;       
output           tcipif_bmu_dbus_trans_cmplt; 
output           tcipif_bmu_ibus_acc_err;    
output  [31 :0]  tcipif_bmu_ibus_data;       
output           tcipif_bmu_ibus_grnt;       
output           tcipif_bmu_ibus_trans_cmplt; 
output  [15 :0]  tcipif_sysmap_addr;         
output           tcipif_sysmap_sel;          
output  [31 :0]  tcipif_sysmap_wdata;        
output           tcipif_sysmap_write;        

// &Regs; @24

// &Wires; @25
wire             bmu_tcipif_dbus_acc_deny;   
wire    [31 :0]  bmu_tcipif_dbus_addr;       
wire             bmu_tcipif_dbus_req;        
wire             bmu_tcipif_dbus_req_dp;     
wire    [1  :0]  bmu_tcipif_dbus_size;       
wire             bmu_tcipif_dbus_supv_mode;  
wire    [31 :0]  bmu_tcipif_dbus_wdata;      
wire             bmu_tcipif_dbus_write;      
wire             bmu_tcipif_ibus_acc_deny;   
wire    [31 :0]  bmu_tcipif_ibus_addr;       
wire             bmu_tcipif_ibus_req;        
wire             bmu_tcipif_ibus_req_dp;     
wire    [1  :0]  bmu_tcipif_ibus_size;       
wire             bmu_tcipif_ibus_supv_mode;  
wire    [31 :0]  bmu_tcipif_ibus_wdata;      
wire             bmu_tcipif_ibus_write;      
wire             clic_cpu_int_hv;            
wire    [11 :0]  clic_cpu_int_id;            
wire    [7  :0]  clic_cpu_int_il;            
wire    [1  :0]  clic_cpu_int_priv;          
wire             clic_tcipif_cmplt;          
wire    [31 :0]  clic_tcipif_rdata;          
wire             clint_cpu_me_int;           
wire             clint_cpu_ms_int;           
wire             clint_cpu_mt_int;           
wire             clint_tcipif_cmplt;         
wire    [31 :0]  clint_tcipif_rdata;         
wire             cp0_biu_icg_en;             
wire    [1  :0]  cp0_yy_priv_mode;           
wire    [11 :0]  cpu_clic_curid;             
wire             cpu_clic_int_exit;          
wire             cpurst_b;                   
wire             forever_cpuclk;             
wire             ifu_clic_warm_up;           
wire    [127:0]  pad_clic_int_vld;           
wire    [31 :0]  pad_cpu_tcip_base;          
wire             pad_yy_dft_clk_rst_b;       
wire             pad_yy_icg_scan_en;         
wire             pad_yy_scan_mode;           
wire             rtu_yy_xx_dbgon;            
wire             sysio_clint_me_int;         
wire    [63 :0]  sysio_clint_mtime;          
wire             sysmap_tcipif_cmplt;        
wire    [31 :0]  sysmap_tcipif_rdata;        
wire    [31 :0]  tcip_cp0_clic_base;         
wire             tcipif_bmu_dbus_acc_err;    
wire    [31 :0]  tcipif_bmu_dbus_data;       
wire             tcipif_bmu_dbus_grnt;       
wire             tcipif_bmu_dbus_trans_cmplt; 
wire             tcipif_bmu_ibus_acc_err;    
wire    [31 :0]  tcipif_bmu_ibus_data;       
wire             tcipif_bmu_ibus_grnt;       
wire             tcipif_bmu_ibus_trans_cmplt; 
wire             tcipif_clic_sel;            
wire    [1  :0]  tcipif_clic_size;           
wire             tcipif_clint_sel;           
wire    [15 :0]  tcipif_sysmap_addr;         
wire             tcipif_sysmap_sel;          
wire    [31 :0]  tcipif_sysmap_wdata;        
wire             tcipif_sysmap_write;        
wire    [15 :0]  tcipif_xx_addr;             
wire    [31 :0]  tcipif_xx_wdata;            
wire             tcipif_xx_write;            


// &Instance("pa_tcipif_func","x_pa_tcipif_func"); @31
//---------------------------------------------------------
// TCIPIF Connecting with BMU
//---------------------------------------------------------
// &Instance("pa_tcipif_behavior_bus","x_pa_tcipif_dbus"); @36
pa_tcipif_behavior_bus  x_pa_tcipif_dbus (
  .bmu_tcipif_dbus_acc_deny    (bmu_tcipif_dbus_acc_deny   ),
  .bmu_tcipif_dbus_addr        (bmu_tcipif_dbus_addr       ),
  .bmu_tcipif_dbus_req         (bmu_tcipif_dbus_req        ),
  .bmu_tcipif_dbus_req_dp      (bmu_tcipif_dbus_req_dp     ),
  .bmu_tcipif_dbus_size        (bmu_tcipif_dbus_size       ),
  .bmu_tcipif_dbus_supv_mode   (bmu_tcipif_dbus_supv_mode  ),
  .bmu_tcipif_dbus_wdata       (bmu_tcipif_dbus_wdata      ),
  .bmu_tcipif_dbus_write       (bmu_tcipif_dbus_write      ),
  .clic_tcipif_cmplt           (clic_tcipif_cmplt          ),
  .clic_tcipif_rdata           (clic_tcipif_rdata          ),
  .clint_tcipif_cmplt          (clint_tcipif_cmplt         ),
  .clint_tcipif_rdata          (clint_tcipif_rdata         ),
  .cp0_biu_icg_en              (cp0_biu_icg_en             ),
  .cpurst_b                    (cpurst_b                   ),
  .forever_cpuclk              (forever_cpuclk             ),
  .pad_cpu_tcip_base           (pad_cpu_tcip_base          ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .rtu_yy_xx_dbgon             (rtu_yy_xx_dbgon            ),
  .sysmap_tcipif_cmplt         (sysmap_tcipif_cmplt        ),
  .sysmap_tcipif_rdata         (sysmap_tcipif_rdata        ),
  .tcip_cp0_clic_base          (tcip_cp0_clic_base         ),
  .tcipif_bmu_dbus_acc_err     (tcipif_bmu_dbus_acc_err    ),
  .tcipif_bmu_dbus_data        (tcipif_bmu_dbus_data       ),
  .tcipif_bmu_dbus_grnt        (tcipif_bmu_dbus_grnt       ),
  .tcipif_bmu_dbus_trans_cmplt (tcipif_bmu_dbus_trans_cmplt),
  .tcipif_clic_sel             (tcipif_clic_sel            ),
  .tcipif_clic_size            (tcipif_clic_size           ),
  .tcipif_clint_sel            (tcipif_clint_sel           ),
  .tcipif_sysmap_sel           (tcipif_sysmap_sel          ),
  .tcipif_xx_addr              (tcipif_xx_addr             ),
  .tcipif_xx_wdata             (tcipif_xx_wdata            ),
  .tcipif_xx_write             (tcipif_xx_write            )
);

// &Instance("pa_tcipif_dummy_bus","x_pa_tcipif_ibus"); @37
pa_tcipif_dummy_bus  x_pa_tcipif_ibus (
  .bmu_tcipif_ibus_acc_deny    (bmu_tcipif_ibus_acc_deny   ),
  .bmu_tcipif_ibus_addr        (bmu_tcipif_ibus_addr       ),
  .bmu_tcipif_ibus_req         (bmu_tcipif_ibus_req        ),
  .bmu_tcipif_ibus_req_dp      (bmu_tcipif_ibus_req_dp     ),
  .bmu_tcipif_ibus_size        (bmu_tcipif_ibus_size       ),
  .bmu_tcipif_ibus_supv_mode   (bmu_tcipif_ibus_supv_mode  ),
  .bmu_tcipif_ibus_wdata       (bmu_tcipif_ibus_wdata      ),
  .bmu_tcipif_ibus_write       (bmu_tcipif_ibus_write      ),
  .cp0_biu_icg_en              (cp0_biu_icg_en             ),
  .cpurst_b                    (cpurst_b                   ),
  .forever_cpuclk              (forever_cpuclk             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .tcipif_bmu_ibus_acc_err     (tcipif_bmu_ibus_acc_err    ),
  .tcipif_bmu_ibus_data        (tcipif_bmu_ibus_data       ),
  .tcipif_bmu_ibus_grnt        (tcipif_bmu_ibus_grnt       ),
  .tcipif_bmu_ibus_trans_cmplt (tcipif_bmu_ibus_trans_cmplt)
);


//---------------------------------------------------------
// TCIPIF Connecting with Off-core IP
//---------------------------------------------------------

//--------------------------------------
//  Instance Core-Local Interrupt module
//--------------------------------------
// &Instance("pa_clint_top"); @47
pa_clint_top  x_pa_clint_top (
  .clint_cpu_me_int   (clint_cpu_me_int  ),
  .clint_cpu_ms_int   (clint_cpu_ms_int  ),
  .clint_cpu_mt_int   (clint_cpu_mt_int  ),
  .clint_tcipif_cmplt (clint_tcipif_cmplt),
  .clint_tcipif_rdata (clint_tcipif_rdata),
  .cpu_clint_mode     (cp0_yy_priv_mode  ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .sysio_clint_me_int (sysio_clint_me_int),
  .sysio_clint_mtime  (sysio_clint_mtime ),
  .tcipif_clint_addr  (tcipif_xx_addr    ),
  .tcipif_clint_sel   (tcipif_clint_sel  ),
  .tcipif_clint_wdata (tcipif_xx_wdata   ),
  .tcipif_clint_write (tcipif_xx_write   )
);

// &Connect( @48
//          .tcipif_clint_addr    (tcipif_xx_addr    ), @49
//          .tcipif_clint_wdata   (tcipif_xx_wdata   ), @50
//          .tcipif_clint_write   (tcipif_xx_write   ), @51
//          .cpu_clint_mode       (cp0_yy_priv_mode  ), @52
// ); @53

//--------------------------------------
//  Instance  interrupt controller module
//--------------------------------------
// &Instance("pa_clic_top"); @59
pa_clic_top  x_pa_clic_top (
  .clic_cpu_int_hv      (clic_cpu_int_hv     ),
  .clic_cpu_int_id      (clic_cpu_int_id     ),
  .clic_cpu_int_il      (clic_cpu_int_il     ),
  .clic_cpu_int_priv    (clic_cpu_int_priv   ),
  .clic_tcipif_cmplt    (clic_tcipif_cmplt   ),
  .clic_tcipif_rdata    (clic_tcipif_rdata   ),
  .clint_cpu_me_int     (clint_cpu_me_int    ),
  .clint_cpu_ms_int     (clint_cpu_ms_int    ),
  .clint_cpu_mt_int     (clint_cpu_mt_int    ),
  .cpu_clic_curid       (cpu_clic_curid      ),
  .cpu_clic_int_exit    (cpu_clic_int_exit   ),
  .cpu_clic_mode        (cp0_yy_priv_mode    ),
  .cpurst_b             (cpurst_b            ),
  .forever_cpuclk       (forever_cpuclk      ),
  .ifu_clic_warm_up     (ifu_clic_warm_up    ),
  .pad_clic_int_vld     (pad_clic_int_vld    ),
  .pad_yy_dft_clk_rst_b (pad_yy_dft_clk_rst_b),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  ),
  .pad_yy_scan_mode     (pad_yy_scan_mode    ),
  .tcipif_clic_addr     (tcipif_xx_addr      ),
  .tcipif_clic_sel      (tcipif_clic_sel     ),
  .tcipif_clic_size     (tcipif_clic_size    ),
  .tcipif_clic_wdata    (tcipif_xx_wdata     ),
  .tcipif_clic_write    (tcipif_xx_write     )
);

// &Connect( @60
//          .tcipif_clic_addr     (tcipif_xx_addr    ), @61
//          .tcipif_clic_wdata    (tcipif_xx_wdata   ), @62
//          .tcipif_clic_write    (tcipif_xx_write   ), @63
//          .cpu_clic_mode        (cp0_yy_priv_mode), @64
//        ); @65

//  &Connect( @68
//     .clic_pad_int_sec    (clic_cpu_int_sec), @69
//   ); @70


assign tcipif_sysmap_addr[15:0]   = tcipif_xx_addr[15:0];
assign tcipif_sysmap_write        = tcipif_xx_write;
assign tcipif_sysmap_wdata[31:0]  = tcipif_xx_wdata[31:0];

// &ModuleEnd; @81
endmodule


