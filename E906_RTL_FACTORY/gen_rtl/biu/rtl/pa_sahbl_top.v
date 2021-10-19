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
module pa_sahbl_top(
  bmu_sahbl_dbus_acc_deny,
  bmu_sahbl_dbus_addr,
  bmu_sahbl_dbus_burst,
  bmu_sahbl_dbus_lock,
  bmu_sahbl_dbus_lrsc,
  bmu_sahbl_dbus_prot,
  bmu_sahbl_dbus_req,
  bmu_sahbl_dbus_req_dp,
  bmu_sahbl_dbus_seq,
  bmu_sahbl_dbus_size,
  bmu_sahbl_dbus_wdata,
  bmu_sahbl_dbus_write,
  bmu_sahbl_ibus_acc_deny,
  bmu_sahbl_ibus_addr,
  bmu_sahbl_ibus_burst,
  bmu_sahbl_ibus_prot,
  bmu_sahbl_ibus_req,
  bmu_sahbl_ibus_req_dp,
  bmu_sahbl_ibus_seq,
  bmu_sahbl_ibus_size,
  clk_en_f,
  cp0_biu_icg_en,
  cpurst_b,
  forever_cpuclk,
  lsu_biu_amo_pmp_deny,
  lsu_biu_async_expt_ack,
  lsu_xx_flush,
  lsu_xx_warm_up,
  pad_sahbl_hrdata,
  pad_sahbl_hready,
  pad_sahbl_hresp,
  pad_yy_icg_scan_en,
  sahbl_bmu_dbus_acc_err,
  sahbl_bmu_dbus_data,
  sahbl_bmu_dbus_grnt,
  sahbl_bmu_dbus_trans_cmplt,
  sahbl_bmu_ibus_acc_err,
  sahbl_bmu_ibus_data,
  sahbl_bmu_ibus_grnt,
  sahbl_bmu_ibus_trans_cmplt,
  sahbl_dtu_debug_info,
  sahbl_pad_haddr,
  sahbl_pad_hburst,
  sahbl_pad_hlock,
  sahbl_pad_hprot,
  sahbl_pad_hsize,
  sahbl_pad_htrans,
  sahbl_pad_hwdata,
  sahbl_pad_hwrite,
  sahbl_sysio_idle,
  sysio_xx_halt_req
);

// &Ports; @23
input           bmu_sahbl_dbus_acc_deny;   
input   [31:0]  bmu_sahbl_dbus_addr;       
input   [2 :0]  bmu_sahbl_dbus_burst;      
input           bmu_sahbl_dbus_lock;       
input           bmu_sahbl_dbus_lrsc;       
input   [3 :0]  bmu_sahbl_dbus_prot;       
input           bmu_sahbl_dbus_req;        
input           bmu_sahbl_dbus_req_dp;     
input           bmu_sahbl_dbus_seq;        
input   [1 :0]  bmu_sahbl_dbus_size;       
input   [31:0]  bmu_sahbl_dbus_wdata;      
input           bmu_sahbl_dbus_write;      
input           bmu_sahbl_ibus_acc_deny;   
input   [31:0]  bmu_sahbl_ibus_addr;       
input   [2 :0]  bmu_sahbl_ibus_burst;      
input   [3 :0]  bmu_sahbl_ibus_prot;       
input           bmu_sahbl_ibus_req;        
input           bmu_sahbl_ibus_req_dp;     
input           bmu_sahbl_ibus_seq;        
input   [1 :0]  bmu_sahbl_ibus_size;       
input           clk_en_f;                  
input           cp0_biu_icg_en;            
input           cpurst_b;                  
input           forever_cpuclk;            
input           lsu_biu_amo_pmp_deny;      
input           lsu_biu_async_expt_ack;    
input           lsu_xx_flush;              
input           lsu_xx_warm_up;            
input   [31:0]  pad_sahbl_hrdata;          
input           pad_sahbl_hready;          
input           pad_sahbl_hresp;           
input           pad_yy_icg_scan_en;        
input           sysio_xx_halt_req;         
output          sahbl_bmu_dbus_acc_err;    
output  [31:0]  sahbl_bmu_dbus_data;       
output          sahbl_bmu_dbus_grnt;       
output          sahbl_bmu_dbus_trans_cmplt; 
output          sahbl_bmu_ibus_acc_err;    
output  [31:0]  sahbl_bmu_ibus_data;       
output          sahbl_bmu_ibus_grnt;       
output          sahbl_bmu_ibus_trans_cmplt; 
output  [10:0]  sahbl_dtu_debug_info;      
output  [31:0]  sahbl_pad_haddr;           
output  [2 :0]  sahbl_pad_hburst;          
output          sahbl_pad_hlock;           
output  [3 :0]  sahbl_pad_hprot;           
output  [2 :0]  sahbl_pad_hsize;           
output  [1 :0]  sahbl_pad_htrans;          
output  [31:0]  sahbl_pad_hwdata;          
output          sahbl_pad_hwrite;          
output          sahbl_sysio_idle;          

// &Regs; @24

// &Wires; @25
wire            bmu_sahbl_dbus_acc_deny;   
wire    [31:0]  bmu_sahbl_dbus_addr;       
wire    [2 :0]  bmu_sahbl_dbus_burst;      
wire            bmu_sahbl_dbus_lock;       
wire            bmu_sahbl_dbus_lrsc;       
wire    [3 :0]  bmu_sahbl_dbus_prot;       
wire            bmu_sahbl_dbus_req;        
wire            bmu_sahbl_dbus_req_dp;     
wire            bmu_sahbl_dbus_seq;        
wire    [1 :0]  bmu_sahbl_dbus_size;       
wire    [31:0]  bmu_sahbl_dbus_wdata;      
wire            bmu_sahbl_dbus_write;      
wire            bmu_sahbl_ibus_acc_deny;   
wire    [31:0]  bmu_sahbl_ibus_addr;       
wire    [2 :0]  bmu_sahbl_ibus_burst;      
wire    [3 :0]  bmu_sahbl_ibus_prot;       
wire            bmu_sahbl_ibus_req;        
wire            bmu_sahbl_ibus_req_dp;     
wire            bmu_sahbl_ibus_seq;        
wire    [1 :0]  bmu_sahbl_ibus_size;       
wire            clk_en_f;                  
wire            cp0_biu_icg_en;            
wire            cpurst_b;                  
wire            forever_cpuclk;            
wire            lsu_biu_amo_pmp_deny;      
wire            lsu_biu_async_expt_ack;    
wire            lsu_xx_flush;              
wire            lsu_xx_warm_up;            
wire    [31:0]  pad_sahbl_hrdata;          
wire            pad_sahbl_hready;          
wire            pad_sahbl_hresp;           
wire            pad_yy_icg_scan_en;        
wire            sahbl_bmu_dbus_acc_err;    
wire    [31:0]  sahbl_bmu_dbus_data;       
wire            sahbl_bmu_dbus_grnt;       
wire            sahbl_bmu_dbus_trans_cmplt; 
wire            sahbl_bmu_ibus_acc_err;    
wire    [31:0]  sahbl_bmu_ibus_data;       
wire            sahbl_bmu_ibus_grnt;       
wire            sahbl_bmu_ibus_trans_cmplt; 
wire            sahbl_clk_en;              
wire    [10:0]  sahbl_dbginfo;             
wire    [10:0]  sahbl_dtu_debug_info;      
wire            sahbl_gated_clk;           
wire    [31:0]  sahbl_pad_haddr;           
wire    [2 :0]  sahbl_pad_hburst;          
wire            sahbl_pad_hlock;           
wire    [3 :0]  sahbl_pad_hprot;           
wire    [2 :0]  sahbl_pad_hsize;           
wire    [1 :0]  sahbl_pad_htrans;          
wire    [31:0]  sahbl_pad_hwdata;          
wire            sahbl_pad_hwrite;          
wire            sahbl_sysio_idle;          
wire            sysio_xx_halt_req;         


//==========================================================
//  Instance Gated Cell for Most Common Use
//==========================================================
// &Instance("gated_clk_cell", "x_pa_sahbl_cpuclk_cell"); @30
gated_clk_cell  x_pa_sahbl_cpuclk_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sahbl_gated_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (sahbl_clk_en      ),
  .module_en          (cp0_biu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in     (forever_cpuclk ), @31
//          .global_en  (1'b1           ), @32
//          .local_en   (sahbl_clk_en   ), @33
//          .module_en  (cp0_biu_icg_en ), @34
//          .external_en(1'b0           ), @35
//          .clk_out    (sahbl_gated_clk)); @36

// &ConnRule(s/ahbl/sahbl/);  @38
// &Instance("pa_ahbl_if_fo", "x_pa_ahbl_if"); @40
pa_ahbl_if_fo  x_pa_ahbl_if (
  .ahbl_bmu_dbus_acc_err      (sahbl_bmu_dbus_acc_err    ),
  .ahbl_bmu_dbus_data         (sahbl_bmu_dbus_data       ),
  .ahbl_bmu_dbus_grnt         (sahbl_bmu_dbus_grnt       ),
  .ahbl_bmu_dbus_trans_cmplt  (sahbl_bmu_dbus_trans_cmplt),
  .ahbl_bmu_ibus_acc_err      (sahbl_bmu_ibus_acc_err    ),
  .ahbl_bmu_ibus_data         (sahbl_bmu_ibus_data       ),
  .ahbl_bmu_ibus_grnt         (sahbl_bmu_ibus_grnt       ),
  .ahbl_bmu_ibus_trans_cmplt  (sahbl_bmu_ibus_trans_cmplt),
  .ahbl_clk_en                (sahbl_clk_en              ),
  .ahbl_dbginfo               (sahbl_dbginfo             ),
  .ahbl_gated_clk             (sahbl_gated_clk           ),
  .ahbl_pad_haddr             (sahbl_pad_haddr           ),
  .ahbl_pad_hburst            (sahbl_pad_hburst          ),
  .ahbl_pad_hlock             (sahbl_pad_hlock           ),
  .ahbl_pad_hprot             (sahbl_pad_hprot           ),
  .ahbl_pad_hsize             (sahbl_pad_hsize           ),
  .ahbl_pad_htrans            (sahbl_pad_htrans          ),
  .ahbl_pad_hwdata            (sahbl_pad_hwdata          ),
  .ahbl_pad_hwrite            (sahbl_pad_hwrite          ),
  .ahbl_sysio_idle            (sahbl_sysio_idle          ),
  .bmu_ahbl_dbus_acc_deny     (bmu_sahbl_dbus_acc_deny   ),
  .bmu_ahbl_dbus_addr         (bmu_sahbl_dbus_addr       ),
  .bmu_ahbl_dbus_burst        (bmu_sahbl_dbus_burst      ),
  .bmu_ahbl_dbus_lock         (bmu_sahbl_dbus_lock       ),
  .bmu_ahbl_dbus_lrsc         (bmu_sahbl_dbus_lrsc       ),
  .bmu_ahbl_dbus_prot         (bmu_sahbl_dbus_prot       ),
  .bmu_ahbl_dbus_req          (bmu_sahbl_dbus_req        ),
  .bmu_ahbl_dbus_req_dp       (bmu_sahbl_dbus_req_dp     ),
  .bmu_ahbl_dbus_seq          (bmu_sahbl_dbus_seq        ),
  .bmu_ahbl_dbus_size         (bmu_sahbl_dbus_size       ),
  .bmu_ahbl_dbus_wdata        (bmu_sahbl_dbus_wdata      ),
  .bmu_ahbl_dbus_write        (bmu_sahbl_dbus_write      ),
  .bmu_ahbl_ibus_acc_deny     (bmu_sahbl_ibus_acc_deny   ),
  .bmu_ahbl_ibus_addr         (bmu_sahbl_ibus_addr       ),
  .bmu_ahbl_ibus_burst        (bmu_sahbl_ibus_burst      ),
  .bmu_ahbl_ibus_prot         (bmu_sahbl_ibus_prot       ),
  .bmu_ahbl_ibus_req          (bmu_sahbl_ibus_req        ),
  .bmu_ahbl_ibus_req_dp       (bmu_sahbl_ibus_req_dp     ),
  .bmu_ahbl_ibus_seq          (bmu_sahbl_ibus_seq        ),
  .bmu_ahbl_ibus_size         (bmu_sahbl_ibus_size       ),
  .clk_en                     (clk_en_f                  ),
  .cpurst_b                   (cpurst_b                  ),
  .lsu_biu_amo_pmp_deny       (lsu_biu_amo_pmp_deny      ),
  .lsu_biu_async_expt_ack     (lsu_biu_async_expt_ack    ),
  .lsu_xx_flush               (lsu_xx_flush              ),
  .lsu_xx_warm_up             (lsu_xx_warm_up            ),
  .pad_ahbl_hrdata            (pad_sahbl_hrdata          ),
  .pad_ahbl_hready            (pad_sahbl_hready          ),
  .pad_ahbl_hresp             (pad_sahbl_hresp           ),
  .sysio_xx_halt_req          (sysio_xx_halt_req         )
);

// &Connect(.clk_en(clk_en_f)); @41

assign sahbl_dtu_debug_info[10:0] = sahbl_dbginfo[10:0];

// &Force("input", "lsu_xx_warm_up"); @46
// &Instance("pa_ahbl_if", "x_pa_ahbl_if"); @47
// &Force("nonport","sahbl_dbginfo"); @48

// &ModuleEnd; @51
endmodule


