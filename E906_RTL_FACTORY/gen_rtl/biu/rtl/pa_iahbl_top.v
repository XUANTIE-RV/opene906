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
module pa_iahbl_top(
  bmu_iahbl_dbus_acc_deny,
  bmu_iahbl_dbus_addr,
  bmu_iahbl_dbus_burst,
  bmu_iahbl_dbus_lock,
  bmu_iahbl_dbus_lrsc,
  bmu_iahbl_dbus_prot,
  bmu_iahbl_dbus_req,
  bmu_iahbl_dbus_req_dp,
  bmu_iahbl_dbus_seq,
  bmu_iahbl_dbus_size,
  bmu_iahbl_dbus_wdata,
  bmu_iahbl_dbus_write,
  bmu_iahbl_ibus_acc_deny,
  bmu_iahbl_ibus_addr,
  bmu_iahbl_ibus_burst,
  bmu_iahbl_ibus_prot,
  bmu_iahbl_ibus_req,
  bmu_iahbl_ibus_req_dp,
  bmu_iahbl_ibus_seq,
  bmu_iahbl_ibus_size,
  cp0_biu_icg_en,
  cpurst_b,
  forever_cpuclk,
  iahbl_bmu_dbus_acc_err,
  iahbl_bmu_dbus_data,
  iahbl_bmu_dbus_grnt,
  iahbl_bmu_dbus_trans_cmplt,
  iahbl_bmu_ibus_acc_err,
  iahbl_bmu_ibus_data,
  iahbl_bmu_ibus_grnt,
  iahbl_bmu_ibus_trans_cmplt,
  iahbl_dtu_debug_info,
  iahbl_pad_haddr,
  iahbl_pad_hburst,
  iahbl_pad_hlock,
  iahbl_pad_hprot,
  iahbl_pad_hsize,
  iahbl_pad_htrans,
  iahbl_pad_hwdata,
  iahbl_pad_hwrite,
  iahbl_sysio_idle,
  lsu_biu_amo_pmp_deny,
  lsu_biu_async_expt_ack,
  lsu_xx_flush,
  lsu_xx_warm_up,
  pad_iahbl_hrdata,
  pad_iahbl_hready,
  pad_iahbl_hresp,
  pad_yy_icg_scan_en,
  rtu_yy_xx_async_flush,
  sysio_xx_halt_req
);

// &Ports; @23
input           bmu_iahbl_dbus_acc_deny;   
input   [31:0]  bmu_iahbl_dbus_addr;       
input   [2 :0]  bmu_iahbl_dbus_burst;      
input           bmu_iahbl_dbus_lock;       
input           bmu_iahbl_dbus_lrsc;       
input   [3 :0]  bmu_iahbl_dbus_prot;       
input           bmu_iahbl_dbus_req;        
input           bmu_iahbl_dbus_req_dp;     
input           bmu_iahbl_dbus_seq;        
input   [1 :0]  bmu_iahbl_dbus_size;       
input   [31:0]  bmu_iahbl_dbus_wdata;      
input           bmu_iahbl_dbus_write;      
input           bmu_iahbl_ibus_acc_deny;   
input   [31:0]  bmu_iahbl_ibus_addr;       
input   [2 :0]  bmu_iahbl_ibus_burst;      
input   [3 :0]  bmu_iahbl_ibus_prot;       
input           bmu_iahbl_ibus_req;        
input           bmu_iahbl_ibus_req_dp;     
input           bmu_iahbl_ibus_seq;        
input   [1 :0]  bmu_iahbl_ibus_size;       
input           cp0_biu_icg_en;            
input           cpurst_b;                  
input           forever_cpuclk;            
input           lsu_biu_amo_pmp_deny;      
input           lsu_biu_async_expt_ack;    
input           lsu_xx_flush;              
input           lsu_xx_warm_up;            
input   [31:0]  pad_iahbl_hrdata;          
input           pad_iahbl_hready;          
input           pad_iahbl_hresp;           
input           pad_yy_icg_scan_en;        
input           rtu_yy_xx_async_flush;     
input           sysio_xx_halt_req;         
output          iahbl_bmu_dbus_acc_err;    
output  [31:0]  iahbl_bmu_dbus_data;       
output          iahbl_bmu_dbus_grnt;       
output          iahbl_bmu_dbus_trans_cmplt; 
output          iahbl_bmu_ibus_acc_err;    
output  [31:0]  iahbl_bmu_ibus_data;       
output          iahbl_bmu_ibus_grnt;       
output          iahbl_bmu_ibus_trans_cmplt; 
output  [10:0]  iahbl_dtu_debug_info;      
output  [31:0]  iahbl_pad_haddr;           
output  [2 :0]  iahbl_pad_hburst;          
output          iahbl_pad_hlock;           
output  [3 :0]  iahbl_pad_hprot;           
output  [2 :0]  iahbl_pad_hsize;           
output  [1 :0]  iahbl_pad_htrans;          
output  [31:0]  iahbl_pad_hwdata;          
output          iahbl_pad_hwrite;          
output          iahbl_sysio_idle;          

// &Regs; @24

// &Wires; @25
wire            bmu_iahbl_dbus_acc_deny;   
wire    [31:0]  bmu_iahbl_dbus_addr;       
wire    [2 :0]  bmu_iahbl_dbus_burst;      
wire            bmu_iahbl_dbus_lock;       
wire            bmu_iahbl_dbus_lrsc;       
wire    [3 :0]  bmu_iahbl_dbus_prot;       
wire            bmu_iahbl_dbus_req;        
wire            bmu_iahbl_dbus_req_dp;     
wire            bmu_iahbl_dbus_seq;        
wire    [1 :0]  bmu_iahbl_dbus_size;       
wire    [31:0]  bmu_iahbl_dbus_wdata;      
wire            bmu_iahbl_dbus_write;      
wire            bmu_iahbl_ibus_acc_deny;   
wire    [31:0]  bmu_iahbl_ibus_addr;       
wire    [2 :0]  bmu_iahbl_ibus_burst;      
wire    [3 :0]  bmu_iahbl_ibus_prot;       
wire            bmu_iahbl_ibus_req;        
wire            bmu_iahbl_ibus_req_dp;     
wire            bmu_iahbl_ibus_seq;        
wire    [1 :0]  bmu_iahbl_ibus_size;       
wire            cp0_biu_icg_en;            
wire            cpurst_b;                  
wire            forever_cpuclk;            
wire            iahbl_bmu_dbus_acc_err;    
wire    [31:0]  iahbl_bmu_dbus_data;       
wire            iahbl_bmu_dbus_grnt;       
wire            iahbl_bmu_dbus_trans_cmplt; 
wire            iahbl_bmu_ibus_acc_err;    
wire    [31:0]  iahbl_bmu_ibus_data;       
wire            iahbl_bmu_ibus_grnt;       
wire            iahbl_bmu_ibus_trans_cmplt; 
wire            iahbl_clk_en;              
wire    [10:0]  iahbl_dbginfo;             
wire    [10:0]  iahbl_dtu_debug_info;      
wire            iahbl_gated_clk;           
wire    [31:0]  iahbl_pad_haddr;           
wire    [2 :0]  iahbl_pad_hburst;          
wire            iahbl_pad_hlock;           
wire    [3 :0]  iahbl_pad_hprot;           
wire    [2 :0]  iahbl_pad_hsize;           
wire    [1 :0]  iahbl_pad_htrans;          
wire    [31:0]  iahbl_pad_hwdata;          
wire            iahbl_pad_hwrite;          
wire            iahbl_sysio_idle;          
wire            lsu_biu_amo_pmp_deny;      
wire            lsu_biu_async_expt_ack;    
wire            lsu_xx_flush;              
wire    [31:0]  pad_iahbl_hrdata;          
wire            pad_iahbl_hready;          
wire            pad_iahbl_hresp;           
wire            pad_yy_icg_scan_en;        
wire            rtu_yy_xx_async_flush;     
wire            sysio_xx_halt_req;         


//==========================================================
//  Instance Gated Cell for Most Common Use
//==========================================================
// &Instance("gated_clk_cell", "x_pa_iahbl_cpuclk_cell"); @30
gated_clk_cell  x_pa_iahbl_cpuclk_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (iahbl_gated_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (iahbl_clk_en      ),
  .module_en          (cp0_biu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in     (forever_cpuclk ), @31
//          .global_en  (1'b1           ), @32
//          .local_en   (iahbl_clk_en   ), @33
//          .module_en  (cp0_biu_icg_en ), @34
//          .external_en(1'b0           ), @35
//          .clk_out    (iahbl_gated_clk)); @36

// &ConnRule(s/ahbl/iahbl/); @38
// &Instance("pa_ahbl_if_fo", "x_pa_ahbl_if"); @40
// &Connect(.clk_en     (ilite_clk_en_f)); @41
// &Force("input","lsu_xx_warm_up"); @43
// &Instance("pa_ahbl_if", "x_pa_ahbl_if"); @44
pa_ahbl_if  x_pa_ahbl_if (
  .ahbl_bmu_dbus_acc_err      (iahbl_bmu_dbus_acc_err    ),
  .ahbl_bmu_dbus_data         (iahbl_bmu_dbus_data       ),
  .ahbl_bmu_dbus_grnt         (iahbl_bmu_dbus_grnt       ),
  .ahbl_bmu_dbus_trans_cmplt  (iahbl_bmu_dbus_trans_cmplt),
  .ahbl_bmu_ibus_acc_err      (iahbl_bmu_ibus_acc_err    ),
  .ahbl_bmu_ibus_data         (iahbl_bmu_ibus_data       ),
  .ahbl_bmu_ibus_grnt         (iahbl_bmu_ibus_grnt       ),
  .ahbl_bmu_ibus_trans_cmplt  (iahbl_bmu_ibus_trans_cmplt),
  .ahbl_clk_en                (iahbl_clk_en              ),
  .ahbl_dbginfo               (iahbl_dbginfo             ),
  .ahbl_gated_clk             (iahbl_gated_clk           ),
  .ahbl_pad_haddr             (iahbl_pad_haddr           ),
  .ahbl_pad_hburst            (iahbl_pad_hburst          ),
  .ahbl_pad_hlock             (iahbl_pad_hlock           ),
  .ahbl_pad_hprot             (iahbl_pad_hprot           ),
  .ahbl_pad_hsize             (iahbl_pad_hsize           ),
  .ahbl_pad_htrans            (iahbl_pad_htrans          ),
  .ahbl_pad_hwdata            (iahbl_pad_hwdata          ),
  .ahbl_pad_hwrite            (iahbl_pad_hwrite          ),
  .ahbl_sysio_idle            (iahbl_sysio_idle          ),
  .bmu_ahbl_dbus_acc_deny     (bmu_iahbl_dbus_acc_deny   ),
  .bmu_ahbl_dbus_addr         (bmu_iahbl_dbus_addr       ),
  .bmu_ahbl_dbus_burst        (bmu_iahbl_dbus_burst      ),
  .bmu_ahbl_dbus_lock         (bmu_iahbl_dbus_lock       ),
  .bmu_ahbl_dbus_lrsc         (bmu_iahbl_dbus_lrsc       ),
  .bmu_ahbl_dbus_prot         (bmu_iahbl_dbus_prot       ),
  .bmu_ahbl_dbus_req          (bmu_iahbl_dbus_req        ),
  .bmu_ahbl_dbus_req_dp       (bmu_iahbl_dbus_req_dp     ),
  .bmu_ahbl_dbus_seq          (bmu_iahbl_dbus_seq        ),
  .bmu_ahbl_dbus_size         (bmu_iahbl_dbus_size       ),
  .bmu_ahbl_dbus_wdata        (bmu_iahbl_dbus_wdata      ),
  .bmu_ahbl_dbus_write        (bmu_iahbl_dbus_write      ),
  .bmu_ahbl_ibus_acc_deny     (bmu_iahbl_ibus_acc_deny   ),
  .bmu_ahbl_ibus_addr         (bmu_iahbl_ibus_addr       ),
  .bmu_ahbl_ibus_burst        (bmu_iahbl_ibus_burst      ),
  .bmu_ahbl_ibus_prot         (bmu_iahbl_ibus_prot       ),
  .bmu_ahbl_ibus_req          (bmu_iahbl_ibus_req        ),
  .bmu_ahbl_ibus_req_dp       (bmu_iahbl_ibus_req_dp     ),
  .bmu_ahbl_ibus_seq          (bmu_iahbl_ibus_seq        ),
  .bmu_ahbl_ibus_size         (bmu_iahbl_ibus_size       ),
  .cpurst_b                   (cpurst_b                  ),
  .lsu_biu_amo_pmp_deny       (lsu_biu_amo_pmp_deny      ),
  .lsu_biu_async_expt_ack     (lsu_biu_async_expt_ack    ),
  .lsu_xx_flush               (lsu_xx_flush              ),
  .pad_ahbl_hrdata            (pad_iahbl_hrdata          ),
  .pad_ahbl_hready            (pad_iahbl_hready          ),
  .pad_ahbl_hresp             (pad_iahbl_hresp           ),
  .rtu_yy_xx_async_flush      (rtu_yy_xx_async_flush     ),
  .sysio_xx_halt_req          (sysio_xx_halt_req         )
);

assign iahbl_dtu_debug_info[10:0] = iahbl_dbginfo[10:0];
// &ModuleEnd; @47
endmodule


