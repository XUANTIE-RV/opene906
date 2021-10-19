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
module pa_dahbl_top(
  bmu_dahbl_dbus_acc_deny,
  bmu_dahbl_dbus_addr,
  bmu_dahbl_dbus_burst,
  bmu_dahbl_dbus_lock,
  bmu_dahbl_dbus_lrsc,
  bmu_dahbl_dbus_prot,
  bmu_dahbl_dbus_req,
  bmu_dahbl_dbus_req_dp,
  bmu_dahbl_dbus_seq,
  bmu_dahbl_dbus_size,
  bmu_dahbl_dbus_wdata,
  bmu_dahbl_dbus_write,
  bmu_dahbl_ibus_acc_deny,
  bmu_dahbl_ibus_addr,
  bmu_dahbl_ibus_burst,
  bmu_dahbl_ibus_prot,
  bmu_dahbl_ibus_req,
  bmu_dahbl_ibus_req_dp,
  bmu_dahbl_ibus_seq,
  bmu_dahbl_ibus_size,
  cp0_biu_icg_en,
  cpurst_b,
  dahbl_bmu_dbus_acc_err,
  dahbl_bmu_dbus_data,
  dahbl_bmu_dbus_grnt,
  dahbl_bmu_dbus_trans_cmplt,
  dahbl_bmu_ibus_acc_err,
  dahbl_bmu_ibus_data,
  dahbl_bmu_ibus_grnt,
  dahbl_bmu_ibus_trans_cmplt,
  dahbl_dtu_debug_info,
  dahbl_pad_haddr,
  dahbl_pad_hburst,
  dahbl_pad_hlock,
  dahbl_pad_hprot,
  dahbl_pad_hsize,
  dahbl_pad_htrans,
  dahbl_pad_hwdata,
  dahbl_pad_hwrite,
  dahbl_sysio_idle,
  forever_cpuclk,
  lsu_biu_amo_pmp_deny,
  lsu_biu_async_expt_ack,
  lsu_xx_flush,
  lsu_xx_warm_up,
  pad_dahbl_hrdata,
  pad_dahbl_hready,
  pad_dahbl_hresp,
  pad_yy_icg_scan_en,
  rtu_yy_xx_async_flush,
  sysio_xx_halt_req
);

// &Ports; @23
input           bmu_dahbl_dbus_acc_deny;   
input   [31:0]  bmu_dahbl_dbus_addr;       
input   [2 :0]  bmu_dahbl_dbus_burst;      
input           bmu_dahbl_dbus_lock;       
input           bmu_dahbl_dbus_lrsc;       
input   [3 :0]  bmu_dahbl_dbus_prot;       
input           bmu_dahbl_dbus_req;        
input           bmu_dahbl_dbus_req_dp;     
input           bmu_dahbl_dbus_seq;        
input   [1 :0]  bmu_dahbl_dbus_size;       
input   [31:0]  bmu_dahbl_dbus_wdata;      
input           bmu_dahbl_dbus_write;      
input           bmu_dahbl_ibus_acc_deny;   
input   [31:0]  bmu_dahbl_ibus_addr;       
input   [2 :0]  bmu_dahbl_ibus_burst;      
input   [3 :0]  bmu_dahbl_ibus_prot;       
input           bmu_dahbl_ibus_req;        
input           bmu_dahbl_ibus_req_dp;     
input           bmu_dahbl_ibus_seq;        
input   [1 :0]  bmu_dahbl_ibus_size;       
input           cp0_biu_icg_en;            
input           cpurst_b;                  
input           forever_cpuclk;            
input           lsu_biu_amo_pmp_deny;      
input           lsu_biu_async_expt_ack;    
input           lsu_xx_flush;              
input           lsu_xx_warm_up;            
input   [31:0]  pad_dahbl_hrdata;          
input           pad_dahbl_hready;          
input           pad_dahbl_hresp;           
input           pad_yy_icg_scan_en;        
input           rtu_yy_xx_async_flush;     
input           sysio_xx_halt_req;         
output          dahbl_bmu_dbus_acc_err;    
output  [31:0]  dahbl_bmu_dbus_data;       
output          dahbl_bmu_dbus_grnt;       
output          dahbl_bmu_dbus_trans_cmplt; 
output          dahbl_bmu_ibus_acc_err;    
output  [31:0]  dahbl_bmu_ibus_data;       
output          dahbl_bmu_ibus_grnt;       
output          dahbl_bmu_ibus_trans_cmplt; 
output  [10:0]  dahbl_dtu_debug_info;      
output  [31:0]  dahbl_pad_haddr;           
output  [2 :0]  dahbl_pad_hburst;          
output          dahbl_pad_hlock;           
output  [3 :0]  dahbl_pad_hprot;           
output  [2 :0]  dahbl_pad_hsize;           
output  [1 :0]  dahbl_pad_htrans;          
output  [31:0]  dahbl_pad_hwdata;          
output          dahbl_pad_hwrite;          
output          dahbl_sysio_idle;          

// &Regs; @24

// &Wires; @25
wire            bmu_dahbl_dbus_acc_deny;   
wire    [31:0]  bmu_dahbl_dbus_addr;       
wire    [2 :0]  bmu_dahbl_dbus_burst;      
wire            bmu_dahbl_dbus_lock;       
wire            bmu_dahbl_dbus_lrsc;       
wire    [3 :0]  bmu_dahbl_dbus_prot;       
wire            bmu_dahbl_dbus_req;        
wire            bmu_dahbl_dbus_req_dp;     
wire            bmu_dahbl_dbus_seq;        
wire    [1 :0]  bmu_dahbl_dbus_size;       
wire    [31:0]  bmu_dahbl_dbus_wdata;      
wire            bmu_dahbl_dbus_write;      
wire            bmu_dahbl_ibus_acc_deny;   
wire    [31:0]  bmu_dahbl_ibus_addr;       
wire    [2 :0]  bmu_dahbl_ibus_burst;      
wire    [3 :0]  bmu_dahbl_ibus_prot;       
wire            bmu_dahbl_ibus_req;        
wire            bmu_dahbl_ibus_req_dp;     
wire            bmu_dahbl_ibus_seq;        
wire    [1 :0]  bmu_dahbl_ibus_size;       
wire            cp0_biu_icg_en;            
wire            cpurst_b;                  
wire            dahbl_bmu_dbus_acc_err;    
wire    [31:0]  dahbl_bmu_dbus_data;       
wire            dahbl_bmu_dbus_grnt;       
wire            dahbl_bmu_dbus_trans_cmplt; 
wire            dahbl_bmu_ibus_acc_err;    
wire    [31:0]  dahbl_bmu_ibus_data;       
wire            dahbl_bmu_ibus_grnt;       
wire            dahbl_bmu_ibus_trans_cmplt; 
wire            dahbl_clk_en;              
wire    [10:0]  dahbl_dbginfo;             
wire    [10:0]  dahbl_dtu_debug_info;      
wire            dahbl_gated_clk;           
wire    [31:0]  dahbl_pad_haddr;           
wire    [2 :0]  dahbl_pad_hburst;          
wire            dahbl_pad_hlock;           
wire    [3 :0]  dahbl_pad_hprot;           
wire    [2 :0]  dahbl_pad_hsize;           
wire    [1 :0]  dahbl_pad_htrans;          
wire    [31:0]  dahbl_pad_hwdata;          
wire            dahbl_pad_hwrite;          
wire            dahbl_sysio_idle;          
wire            forever_cpuclk;            
wire            lsu_biu_amo_pmp_deny;      
wire            lsu_biu_async_expt_ack;    
wire            lsu_xx_flush;              
wire    [31:0]  pad_dahbl_hrdata;          
wire            pad_dahbl_hready;          
wire            pad_dahbl_hresp;           
wire            pad_yy_icg_scan_en;        
wire            rtu_yy_xx_async_flush;     
wire            sysio_xx_halt_req;         


//==========================================================
//  Instance Gated Cell for Most Common Use
//==========================================================
// &Instance("gated_clk_cell", "x_pa_dahbl_cpuclk_cell"); @30
gated_clk_cell  x_pa_dahbl_cpuclk_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dahbl_gated_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dahbl_clk_en      ),
  .module_en          (cp0_biu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in     (forever_cpuclk ), @31
//          .global_en  (1'b1           ), @32
//          .local_en   (dahbl_clk_en   ), @33
//          .module_en  (cp0_biu_icg_en), @34
//          .external_en(1'b0           ), @35
//          .clk_out    (dahbl_gated_clk)); @36

// &ConnRule(s/ahbl/dahbl/); @38
// &Instance("pa_ahbl_if_fo", "x_pa_ahbl_if"); @40
// &Connect(.clk_en     (dlite_clk_en_f)); @41
// &Force("input","lsu_xx_warm_up"); @43
// &Instance("pa_ahbl_if", "x_pa_ahbl_if"); @44
pa_ahbl_if  x_pa_ahbl_if (
  .ahbl_bmu_dbus_acc_err      (dahbl_bmu_dbus_acc_err    ),
  .ahbl_bmu_dbus_data         (dahbl_bmu_dbus_data       ),
  .ahbl_bmu_dbus_grnt         (dahbl_bmu_dbus_grnt       ),
  .ahbl_bmu_dbus_trans_cmplt  (dahbl_bmu_dbus_trans_cmplt),
  .ahbl_bmu_ibus_acc_err      (dahbl_bmu_ibus_acc_err    ),
  .ahbl_bmu_ibus_data         (dahbl_bmu_ibus_data       ),
  .ahbl_bmu_ibus_grnt         (dahbl_bmu_ibus_grnt       ),
  .ahbl_bmu_ibus_trans_cmplt  (dahbl_bmu_ibus_trans_cmplt),
  .ahbl_clk_en                (dahbl_clk_en              ),
  .ahbl_dbginfo               (dahbl_dbginfo             ),
  .ahbl_gated_clk             (dahbl_gated_clk           ),
  .ahbl_pad_haddr             (dahbl_pad_haddr           ),
  .ahbl_pad_hburst            (dahbl_pad_hburst          ),
  .ahbl_pad_hlock             (dahbl_pad_hlock           ),
  .ahbl_pad_hprot             (dahbl_pad_hprot           ),
  .ahbl_pad_hsize             (dahbl_pad_hsize           ),
  .ahbl_pad_htrans            (dahbl_pad_htrans          ),
  .ahbl_pad_hwdata            (dahbl_pad_hwdata          ),
  .ahbl_pad_hwrite            (dahbl_pad_hwrite          ),
  .ahbl_sysio_idle            (dahbl_sysio_idle          ),
  .bmu_ahbl_dbus_acc_deny     (bmu_dahbl_dbus_acc_deny   ),
  .bmu_ahbl_dbus_addr         (bmu_dahbl_dbus_addr       ),
  .bmu_ahbl_dbus_burst        (bmu_dahbl_dbus_burst      ),
  .bmu_ahbl_dbus_lock         (bmu_dahbl_dbus_lock       ),
  .bmu_ahbl_dbus_lrsc         (bmu_dahbl_dbus_lrsc       ),
  .bmu_ahbl_dbus_prot         (bmu_dahbl_dbus_prot       ),
  .bmu_ahbl_dbus_req          (bmu_dahbl_dbus_req        ),
  .bmu_ahbl_dbus_req_dp       (bmu_dahbl_dbus_req_dp     ),
  .bmu_ahbl_dbus_seq          (bmu_dahbl_dbus_seq        ),
  .bmu_ahbl_dbus_size         (bmu_dahbl_dbus_size       ),
  .bmu_ahbl_dbus_wdata        (bmu_dahbl_dbus_wdata      ),
  .bmu_ahbl_dbus_write        (bmu_dahbl_dbus_write      ),
  .bmu_ahbl_ibus_acc_deny     (bmu_dahbl_ibus_acc_deny   ),
  .bmu_ahbl_ibus_addr         (bmu_dahbl_ibus_addr       ),
  .bmu_ahbl_ibus_burst        (bmu_dahbl_ibus_burst      ),
  .bmu_ahbl_ibus_prot         (bmu_dahbl_ibus_prot       ),
  .bmu_ahbl_ibus_req          (bmu_dahbl_ibus_req        ),
  .bmu_ahbl_ibus_req_dp       (bmu_dahbl_ibus_req_dp     ),
  .bmu_ahbl_ibus_seq          (bmu_dahbl_ibus_seq        ),
  .bmu_ahbl_ibus_size         (bmu_dahbl_ibus_size       ),
  .cpurst_b                   (cpurst_b                  ),
  .lsu_biu_amo_pmp_deny       (lsu_biu_amo_pmp_deny      ),
  .lsu_biu_async_expt_ack     (lsu_biu_async_expt_ack    ),
  .lsu_xx_flush               (lsu_xx_flush              ),
  .pad_ahbl_hrdata            (pad_dahbl_hrdata          ),
  .pad_ahbl_hready            (pad_dahbl_hready          ),
  .pad_ahbl_hresp             (pad_dahbl_hresp           ),
  .rtu_yy_xx_async_flush      (rtu_yy_xx_async_flush     ),
  .sysio_xx_halt_req          (sysio_xx_halt_req         )
);


assign dahbl_dtu_debug_info[10:0] = dahbl_dbginfo[10:0];
// &ModuleEnd; @48
endmodule


