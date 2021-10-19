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
module pa_sys_io(
  biu_sysio_idle,
  clk_en,
  cp0_biu_icg_en,
  cp0_sysio_ipend_b,
  cp0_sysio_lpmd_b,
  cp0_sysio_srst,
  cpu_pad_dfs_ack,
  cpu_pad_halted,
  cpu_pad_lockup,
  cpu_pad_soft_rst,
  cpurst_b,
  dahbl_sysio_idle,
  dtu_cp0_wake_up,
  forever_cpuclk,
  iahbl_sysio_idle,
  pad_cpu_dfs_req,
  pad_cpu_ext_int_b,
  pad_cpu_nmi,
  pad_cpu_rst_addr,
  pad_cpu_sys_cnt,
  pad_cpu_wakeup_event,
  pad_yy_icg_scan_en,
  rtu_sysio_halted,
  rtu_sysio_lockup_on,
  rtu_yy_xx_dbgon,
  sysio_clint_me_int,
  sysio_clint_mtime,
  sysio_cp0_clk_en,
  sysio_cp0_clkratio,
  sysio_cp0_rst_addr,
  sysio_hpcp_time,
  sysio_ifu_rst_addr,
  sysio_ifu_rst_addr_done,
  sysio_iu_rst_addr,
  sysio_pad_lpmd_b,
  sysio_rtu_nmi_int,
  sysio_rtu_wk_event,
  sysio_xx_halt_req
);

// &Ports; @24
input           biu_sysio_idle;         
input           clk_en;                 
input           cp0_biu_icg_en;         
input           cp0_sysio_ipend_b;      
input   [1 :0]  cp0_sysio_lpmd_b;       
input   [1 :0]  cp0_sysio_srst;         
input           cpurst_b;               
input           dahbl_sysio_idle;       
input           dtu_cp0_wake_up;        
input           forever_cpuclk;         
input           iahbl_sysio_idle;       
input           pad_cpu_dfs_req;        
input           pad_cpu_ext_int_b;      
input           pad_cpu_nmi;            
input   [31:0]  pad_cpu_rst_addr;       
input   [63:0]  pad_cpu_sys_cnt;        
input           pad_cpu_wakeup_event;   
input           pad_yy_icg_scan_en;     
input           rtu_sysio_halted;       
input           rtu_sysio_lockup_on;    
input           rtu_yy_xx_dbgon;        
output          cpu_pad_dfs_ack;        
output          cpu_pad_halted;         
output          cpu_pad_lockup;         
output  [1 :0]  cpu_pad_soft_rst;       
output          sysio_clint_me_int;     
output  [63:0]  sysio_clint_mtime;      
output          sysio_cp0_clk_en;       
output  [2 :0]  sysio_cp0_clkratio;     
output  [31:0]  sysio_cp0_rst_addr;     
output  [63:0]  sysio_hpcp_time;        
output  [31:0]  sysio_ifu_rst_addr;     
output          sysio_ifu_rst_addr_done; 
output  [31:0]  sysio_iu_rst_addr;      
output  [1 :0]  sysio_pad_lpmd_b;       
output          sysio_rtu_nmi_int;      
output          sysio_rtu_wk_event;     
output          sysio_xx_halt_req;      

// &Regs; @25
reg     [63:0]  ccvr;                   
reg             cpu_ext_int_b;          
reg             cpu_nmi;                
reg     [30:0]  cpu_rst_addr_31;        
reg             cpu_wk_event;           
reg             pad_cpu_halt_ff1;       
reg             pad_cpu_halt_ff2;       
reg             sysio_pad_dbg_b;        
reg             sysio_pad_halted;       
reg             sysio_pad_ipend_b;      
reg             sysio_pad_lockup;       
reg     [1 :0]  sysio_pad_lpmd_b;       
reg     [1 :0]  sysio_pad_srst;         
reg             sysio_pad_wakeup_b;     

// &Wires; @26
wire            biu_sysio_idle;         
wire            ccvr_h_clk;             
wire            ccvr_h_clk_en;          
wire            ccvr_h_updt;            
wire            clk_en;                 
wire            cp0_biu_icg_en;         
wire            cp0_sysio_ipend_b;      
wire    [1 :0]  cp0_sysio_lpmd_b;       
wire    [1 :0]  cp0_sysio_srst;         
wire            cpu_pad_dfs_ack;        
wire            cpu_pad_halted;         
wire            cpu_pad_lockup;         
wire    [1 :0]  cpu_pad_soft_rst;       
wire    [31:0]  cpu_rst_addr;           
wire            cpu_wake_up_b;          
wire            cpurst_b;               
wire            dahbl_sysio_idle;       
wire            dtu_cp0_wake_up;        
wire            forever_cpuclk;         
wire            halt_clk;               
wire            halt_clk_en;            
wire            iahbl_sysio_idle;       
wire            pad_cpu_dfs_req;        
wire            pad_cpu_ext_int_b;      
wire            pad_cpu_nmi;            
wire    [31:0]  pad_cpu_rst_addr;       
wire    [63:0]  pad_cpu_sys_cnt;        
wire            pad_cpu_wakeup_event;   
wire    [2 :0]  pad_sysio_clkratio;     
wire            pad_yy_icg_scan_en;     
wire            rtu_sysio_halted;       
wire            rtu_sysio_lockup_on;    
wire            rtu_yy_xx_dbgon;        
wire            sample_clk;             
wire            sysio_clint_me_int;     
wire    [63:0]  sysio_clint_mtime;      
wire            sysio_cp0_clk_en;       
wire    [2 :0]  sysio_cp0_clkratio;     
wire    [31:0]  sysio_cp0_rst_addr;     
wire    [63:0]  sysio_hpcp_time;        
wire    [31:0]  sysio_ifu_rst_addr;     
wire            sysio_ifu_rst_addr_done; 
wire    [31:0]  sysio_iu_rst_addr;      
wire            sysio_lpmd_gated_clk;   
wire            sysio_lpmd_gated_en;    
wire            sysio_rst_addr_neq;     
wire            sysio_rtu_nmi_int;      
wire            sysio_rtu_wk_event;     
wire            sysio_xx_halt_req;      


// &Instance("gated_clk_cell", "x_pa_gated_sysio_lpmd_cpuclk_cell"); @31
gated_clk_cell  x_pa_gated_sysio_lpmd_cpuclk_cell (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (sysio_lpmd_gated_clk),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (sysio_lpmd_gated_en ),
  .module_en            (cp0_biu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in     (forever_cpuclk               ), @32
//          .global_en  (1'b1                         ), @33
//          .module_en  (cp0_biu_icg_en               ), @34
//          .local_en   (sysio_lpmd_gated_en          ), @35
//          .external_en(1'b0                         ), @36
//          .clk_out    (sysio_lpmd_gated_clk         )); @37

assign sysio_lpmd_gated_en = ((sysio_pad_dbg_b        ^ (~rtu_yy_xx_dbgon)) ||
                             |(sysio_pad_lpmd_b[1:0]  ^ cp0_sysio_lpmd_b[1:0]) ||
                              (sysio_pad_ipend_b      ^ cp0_sysio_ipend_b) ||
                              (sysio_pad_wakeup_b     ^ cpu_wake_up_b) ||
                             |(sysio_pad_srst[1:0]    ^ cp0_sysio_srst[1:0]) ||
                              (sysio_pad_lockup       ^ rtu_sysio_lockup_on) ||
                              (rtu_sysio_halted       ^ sysio_pad_halted)    ||
                              (pad_cpu_ext_int_b      ^ cpu_ext_int_b) ||
                              (pad_cpu_nmi            ^ cpu_nmi) ||
                              (pad_cpu_wakeup_event   ^ cpu_wk_event) ||
                               sysio_rst_addr_neq)
                            && clk_en;

//=========================================
//             input port 
//=========================================
//synchronize signal
assign pad_sysio_clkratio[2:0]  = 3'b0;
assign sysio_cp0_clkratio[2:0]  = pad_sysio_clkratio[2:0];

assign halt_clk_en = pad_cpu_halt_ff1 ^ pad_cpu_dfs_req |
                     pad_cpu_halt_ff2 ^ pad_cpu_halt_ff1;

// &Instance("gated_clk_cell", "x_pa_halt_clk"); @62
gated_clk_cell  x_pa_halt_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (halt_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (halt_clk_en       ),
  .module_en          (cp0_biu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @63
//          .external_en (1'b0), @64
//          .global_en   (1'b1), @65
//          .module_en   (cp0_biu_icg_en), @66
//          .local_en    (halt_clk_en), @67
//          .clk_out     (halt_clk)); @68

always @ (posedge halt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pad_cpu_halt_ff1 <= 1'b0;
    pad_cpu_halt_ff2 <= 1'b0;
  end
  else
  begin
    pad_cpu_halt_ff1 <= pad_cpu_dfs_req;
    pad_cpu_halt_ff2 <= pad_cpu_halt_ff1;
  end
end

assign cpu_pad_dfs_ack = iahbl_sysio_idle && dahbl_sysio_idle && biu_sysio_idle
                       && pad_cpu_halt_ff2;

assign sysio_xx_halt_req = pad_cpu_halt_ff2;

assign ccvr_h_updt = |(ccvr[63:12] ^ pad_cpu_sys_cnt[63:12]) && clk_en;
always @ (posedge ccvr_h_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ccvr[63:12] <= 52'b0;
  else if (ccvr_h_updt)
    ccvr[63:12] <= pad_cpu_sys_cnt[63:12];
  else
    ccvr[63:12] <= ccvr[63:12];
end

assign ccvr_h_clk_en = ccvr_h_updt;
// &Instance("gated_clk_cell", "x_pa_ccvr_h_clk"); @106
gated_clk_cell  x_pa_ccvr_h_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ccvr_h_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ccvr_h_clk_en     ),
  .module_en          (cp0_biu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @107
//          .external_en (1'b0), @108
//          .global_en   (1'b1), @109
//          .module_en   (cp0_biu_icg_en), @110
//          .local_en    (ccvr_h_clk_en), @111
//          .clk_out     (ccvr_h_clk)); @112

always @ (posedge sample_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ccvr[11:0] <= 12'b0;
  else if (clk_en)
    ccvr[11:0] <= pad_cpu_sys_cnt[11:0];
  else
    ccvr[11:0] <= ccvr[11:0];
end

assign sysio_clint_mtime[63:0] = ccvr[63:0];
assign sysio_hpcp_time[63:0] = ccvr[63:0];

always @ (posedge sysio_lpmd_gated_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cpu_rst_addr_31[30:0] <= 31'b0;
  else if (clk_en)
    cpu_rst_addr_31[30:0] <= pad_cpu_rst_addr[31:1];
  else
    cpu_rst_addr_31[30:0] <= cpu_rst_addr_31[30:0];
end
assign cpu_rst_addr[31:0] = {cpu_rst_addr_31[30:0], 1'b0};
assign sysio_rst_addr_neq = cpu_rst_addr_31[30:0] != pad_cpu_rst_addr[31:1];
// &Force("bus", "pad_cpu_rst_addr", 31, 0); @143
assign sysio_ifu_rst_addr_done = !sysio_rst_addr_neq;

assign  sysio_cp0_rst_addr[31:0] = cpu_rst_addr[31:0];
assign  sysio_ifu_rst_addr[31:0] = cpu_rst_addr[31:0];
assign  sysio_iu_rst_addr[31:0]  = cpu_rst_addr[31:0];

always @ (posedge sysio_lpmd_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    cpu_ext_int_b <= 1'b1;
    cpu_nmi       <= 1'b0;
    cpu_wk_event  <= 1'b0;
  end
  else if(clk_en) begin
    cpu_ext_int_b <= pad_cpu_ext_int_b;
    cpu_nmi       <= pad_cpu_nmi;
    cpu_wk_event  <= pad_cpu_wakeup_event;
  end
  else begin
    cpu_ext_int_b <= cpu_ext_int_b;
    cpu_nmi       <= cpu_nmi;
    cpu_wk_event  <= cpu_wk_event;
  end
end

assign sysio_clint_me_int = !cpu_ext_int_b;
assign sysio_rtu_nmi_int   = cpu_nmi;
assign sysio_rtu_wk_event  = cpu_wk_event;

// &Instance("gated_clk_cell", "x_pa_sample_clk"); @173
gated_clk_cell  x_pa_sample_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sample_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (clk_en            ),
  .module_en          (cp0_biu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @174
//          .external_en (1'b0          ), @175
//          .global_en   (1'b1          ), @176
//          .module_en   (cp0_biu_icg_en), @177
//          .local_en    (clk_en        ), @178
//          .clk_out     (sample_clk    ) @179
//         ); @180

//=========================================
//            output port
//=========================================
// &Force("output","sysio_pad_ipend_b"); @185
// &Force("output","sysio_pad_dbg_b"); @186
// &Force("output","sysio_pad_lpmd_b"); @187
// &Force("output","sysio_pad_wakeup_b"); @188

assign cpu_wake_up_b = cp0_sysio_ipend_b && !dtu_cp0_wake_up;

always @(posedge sysio_lpmd_gated_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    sysio_pad_dbg_b       <= 1'b1;
    sysio_pad_lpmd_b[1:0] <= 2'b11;
    sysio_pad_ipend_b     <= 1'b0;
    sysio_pad_wakeup_b    <= 1'b0;
    sysio_pad_srst[1:0]   <= 2'b0;
    sysio_pad_lockup      <= 1'b0;
    sysio_pad_halted      <= 1'b0;
  end
  else if(clk_en)
  begin
    sysio_pad_dbg_b       <= ~rtu_yy_xx_dbgon;
    sysio_pad_lpmd_b[1:0] <= cp0_sysio_lpmd_b[1:0];
    sysio_pad_ipend_b     <= cp0_sysio_ipend_b;
    sysio_pad_wakeup_b    <= cpu_wake_up_b;
    sysio_pad_srst[1:0]   <= cp0_sysio_srst[1:0];
    sysio_pad_lockup      <= rtu_sysio_lockup_on;
    sysio_pad_halted      <= rtu_sysio_halted;
  end
end
// &Force("nonport", "sysio_pad_dbg_b"); @215
// &Force("nonport", "sysio_pad_ipend_b"); @216
// &Force("nonport", "sysio_pad_wakeup_b"); @217
assign sysio_cp0_clk_en = clk_en;


assign cpu_pad_soft_rst[1:0] = sysio_pad_srst[1:0];
assign cpu_pad_lockup = sysio_pad_lockup;
assign cpu_pad_halted = sysio_pad_halted;

// &ModuleEnd; @225
endmodule


