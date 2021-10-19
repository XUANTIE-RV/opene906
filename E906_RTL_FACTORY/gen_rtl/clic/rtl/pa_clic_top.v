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

// &ModuleBeg; @27
module pa_clic_top(
  clic_cpu_int_hv,
  clic_cpu_int_id,
  clic_cpu_int_il,
  clic_cpu_int_priv,
  clic_tcipif_cmplt,
  clic_tcipif_rdata,
  clint_cpu_me_int,
  clint_cpu_ms_int,
  clint_cpu_mt_int,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpu_clic_mode,
  cpurst_b,
  forever_cpuclk,
  ifu_clic_warm_up,
  pad_clic_int_vld,
  pad_yy_dft_clk_rst_b,
  pad_yy_icg_scan_en,
  pad_yy_scan_mode,
  tcipif_clic_addr,
  tcipif_clic_sel,
  tcipif_clic_size,
  tcipif_clic_wdata,
  tcipif_clic_write
);

// &Ports; @28
input             clint_cpu_me_int;         
input             clint_cpu_ms_int;         
input             clint_cpu_mt_int;         
input   [11  :0]  cpu_clic_curid;           
input             cpu_clic_int_exit;        
input   [1   :0]  cpu_clic_mode;            
input             cpurst_b;                 
input             forever_cpuclk;           
input             ifu_clic_warm_up;         
input   [127 :0]  pad_clic_int_vld;         
input             pad_yy_dft_clk_rst_b;     
input             pad_yy_icg_scan_en;       
input             pad_yy_scan_mode;         
input   [15  :0]  tcipif_clic_addr;         
input             tcipif_clic_sel;          
input   [1   :0]  tcipif_clic_size;         
input   [31  :0]  tcipif_clic_wdata;        
input             tcipif_clic_write;        
output            clic_cpu_int_hv;          
output  [11  :0]  clic_cpu_int_id;          
output  [7   :0]  clic_cpu_int_il;          
output  [1   :0]  clic_cpu_int_priv;        
output            clic_tcipif_cmplt;        
output  [31  :0]  clic_tcipif_rdata;        

// &Regs; @29
reg               clic_clk_en_raw;          
reg               clic_test_point;          

// &Wires; @30
wire              arb_ctrl_int_hv;          
wire    [11  :0]  arb_ctrl_int_id;          
wire    [7   :0]  arb_ctrl_int_il;          
wire              arb_ctrl_int_mode;        
wire              arb_ctrl_int_req_raw;     
wire              busif_ctrl_cliccfg_sel;   
wire              busif_ctrl_clicinfo_sel;  
wire              busif_ctrl_mintthresh_sel; 
wire    [143 :0]  busif_kid_clicintattr_sel; 
wire    [143 :0]  busif_kid_clicintctl_sel; 
wire    [143 :0]  busif_kid_clicintie_sel;  
wire    [143 :0]  busif_kid_clicintip_sel;  
wire    [31  :0]  busif_kid_wdata;          
wire              busif_xx_write_vld;       
wire              clic_clk;                 
wire              clic_clk_en;              
wire              clic_cpu_int_hv;          
wire    [11  :0]  clic_cpu_int_id;          
wire    [7   :0]  clic_cpu_int_il;          
wire    [1   :0]  clic_cpu_int_priv;        
wire              clic_rst_b;               
wire              clic_tcipif_cmplt;        
wire    [31  :0]  clic_tcipif_rdata;        
wire              clicreg_clk;              
wire              clint_cpu_me_int;         
wire              clint_cpu_ms_int;         
wire              clint_cpu_mt_int;         
wire    [11  :0]  cpu_clic_curid;           
wire              cpu_clic_int_exit;        
wire    [1   :0]  cpu_clic_mode;            
wire              cpurst_b;                 
wire    [31  :0]  ctrl_busif_cliccfg_val;   
wire    [31  :0]  ctrl_busif_clicinfo_val;  
wire    [31  :0]  ctrl_busif_mintthresh_val; 
wire              ctrl_clicreg_en;          
wire    [143 :0]  ctrl_kid_ack_int;         
wire    [2   :0]  ctrl_xx_int_lv_or_mask;   
wire              ctrl_xx_mode_or_mask;     
wire              forever_cpuclk;           
wire              ifu_clic_warm_up;         
wire    [575 :0]  kid_arb_int_all_vec;      
wire    [143 :0]  kid_arb_int_hv;           
wire    [143 :0]  kid_arb_int_req;          
wire    [4607:0]  kid_busif_rdata_vec;      
wire    [143 :0]  kid_int_vld;              
wire    [127 :0]  pad_clic_int_vld;         
wire              pad_yy_dft_clk_rst_b;     
wire              pad_yy_icg_scan_en;       
wire              pad_yy_scan_mode;         
wire    [15  :0]  tcipif_clic_addr;         
wire              tcipif_clic_sel;          
wire    [1   :0]  tcipif_clic_size;         
wire    [31  :0]  tcipif_clic_wdata;        
wire              tcipif_clic_write;        


parameter CLICINTNUM     = `CLIC_INTNUM;
parameter CLICINTCTLBITS = `CLIC_INTCTLBITS;

// &Instance("pa_clic_arb"); @35
pa_clic_arb  x_pa_clic_arb (
  .arb_ctrl_int_hv        (arb_ctrl_int_hv       ),
  .arb_ctrl_int_id        (arb_ctrl_int_id       ),
  .arb_ctrl_int_il        (arb_ctrl_int_il       ),
  .arb_ctrl_int_mode      (arb_ctrl_int_mode     ),
  .arb_ctrl_int_req_raw   (arb_ctrl_int_req_raw  ),
  .ctrl_xx_int_lv_or_mask (ctrl_xx_int_lv_or_mask),
  .kid_arb_int_all_vec    (kid_arb_int_all_vec   ),
  .kid_arb_int_hv         (kid_arb_int_hv        ),
  .kid_arb_int_req        (kid_arb_int_req       )
);

// &Instance("pa_clic_busif"); @36
pa_clic_busif  x_pa_clic_busif (
  .busif_ctrl_cliccfg_sel    (busif_ctrl_cliccfg_sel   ),
  .busif_ctrl_clicinfo_sel   (busif_ctrl_clicinfo_sel  ),
  .busif_ctrl_mintthresh_sel (busif_ctrl_mintthresh_sel),
  .busif_kid_clicintattr_sel (busif_kid_clicintattr_sel),
  .busif_kid_clicintctl_sel  (busif_kid_clicintctl_sel ),
  .busif_kid_clicintie_sel   (busif_kid_clicintie_sel  ),
  .busif_kid_clicintip_sel   (busif_kid_clicintip_sel  ),
  .busif_kid_wdata           (busif_kid_wdata          ),
  .busif_xx_write_vld        (busif_xx_write_vld       ),
  .clic_clk                  (clic_clk                 ),
  .clic_clk_en               (clic_clk_en              ),
  .clic_tcipif_cmplt         (clic_tcipif_cmplt        ),
  .clic_tcipif_rdata         (clic_tcipif_rdata        ),
  .cpurst_b                  (cpurst_b                 ),
  .ctrl_busif_cliccfg_val    (ctrl_busif_cliccfg_val   ),
  .ctrl_busif_clicinfo_val   (ctrl_busif_clicinfo_val  ),
  .ctrl_busif_mintthresh_val (ctrl_busif_mintthresh_val),
  .ifu_clic_warm_up          (ifu_clic_warm_up         ),
  .kid_busif_rdata_vec       (kid_busif_rdata_vec      ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .pad_yy_scan_mode          (pad_yy_scan_mode         ),
  .tcipif_clic_addr          (tcipif_clic_addr         ),
  .tcipif_clic_sel           (tcipif_clic_sel          ),
  .tcipif_clic_size          (tcipif_clic_size         ),
  .tcipif_clic_wdata         (tcipif_clic_wdata        ),
  .tcipif_clic_write         (tcipif_clic_write        )
);

// &Instance("pa_clic_ctrl"); @37
pa_clic_ctrl  x_pa_clic_ctrl (
  .arb_ctrl_int_hv           (arb_ctrl_int_hv          ),
  .arb_ctrl_int_id           (arb_ctrl_int_id          ),
  .arb_ctrl_int_il           (arb_ctrl_int_il          ),
  .arb_ctrl_int_mode         (arb_ctrl_int_mode        ),
  .arb_ctrl_int_req_raw      (arb_ctrl_int_req_raw     ),
  .busif_ctrl_cliccfg_sel    (busif_ctrl_cliccfg_sel   ),
  .busif_ctrl_clicinfo_sel   (busif_ctrl_clicinfo_sel  ),
  .busif_ctrl_mintthresh_sel (busif_ctrl_mintthresh_sel),
  .busif_kid_wdata           (busif_kid_wdata          ),
  .busif_xx_write_vld        (busif_xx_write_vld       ),
  .clic_clk                  (clic_clk                 ),
  .clic_clk_en               (clic_clk_en              ),
  .clic_cpu_int_hv           (clic_cpu_int_hv          ),
  .clic_cpu_int_id           (clic_cpu_int_id          ),
  .clic_cpu_int_il           (clic_cpu_int_il          ),
  .clic_cpu_int_priv         (clic_cpu_int_priv        ),
  .clicreg_clk               (clicreg_clk              ),
  .cpu_clic_curid            (cpu_clic_curid           ),
  .cpu_clic_int_exit         (cpu_clic_int_exit        ),
  .cpu_clic_mode             (cpu_clic_mode            ),
  .cpurst_b                  (cpurst_b                 ),
  .ctrl_busif_cliccfg_val    (ctrl_busif_cliccfg_val   ),
  .ctrl_busif_clicinfo_val   (ctrl_busif_clicinfo_val  ),
  .ctrl_busif_mintthresh_val (ctrl_busif_mintthresh_val),
  .ctrl_clicreg_en           (ctrl_clicreg_en          ),
  .ctrl_kid_ack_int          (ctrl_kid_ack_int         ),
  .ctrl_xx_int_lv_or_mask    (ctrl_xx_int_lv_or_mask   ),
  .ctrl_xx_mode_or_mask      (ctrl_xx_mode_or_mask     ),
  .forever_cpuclk            (forever_cpuclk           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);


assign kid_int_vld[CLICINTNUM-1:16] = pad_clic_int_vld[CLICINTNUM-17:0];
// &Force("input", "pad_clic_int_vld"); &Force("bus", "pad_clic_int_vld", CLICINTNUM-17, 0); @41
assign kid_int_vld[15:0] = {3'b0, 1'b0,   // clic software int
                            clint_cpu_me_int, 3'b0,
                            clint_cpu_mt_int, 3'b0,
                            clint_cpu_ms_int, 3'b0};
// &Force("nonport", "kid_int_vld"); @47

// &Force("nonport", "kid_busif_rdata_bus"); @49
// &Force("nonport", "busif_kid_clicintattr_sel"); @50
// &Force("nonport", "busif_kid_clicintctl_sel"); @51
// &Force("nonport", "busif_kid_clicintie_sel"); @52
// &Force("nonport", "busif_kid_clicintip_sel"); @53
// &Force("nonport", "ctrl_kid_ack_int"); @54
// &Force("nonport", "ctrl_kid_int_exit_gate"); @55
// &Force("nonport", "ctrl_xx_mode_or_mask"); @56
// &Force("nonport", "kid_arb_int_all_vec"); @57
// &Force("nonport", "kid_arb_int_hv"); @58
// &Force("nonport", "kid_arb_int_req"); @59
// &Force("nonport", "kid_busif_rdata_vec"); @60
//csky vperl_off
genvar i;
generate
for (i = 0; i < CLICINTNUM; i = i+1)
begin: INT_KID
  case(i)
    0, 1, 2,
    4, 5, 6,
    8, 9, 10,
    13, 14, 15:
    begin: KID_DUMMY
      pa_clic_kid_dummy x_pa_clic_kid(
        .kid_arb_int_all            (kid_arb_int_all_vec[(CLICINTCTLBITS+1)*i+:(CLICINTCTLBITS+1)]),
        .kid_arb_int_hv             (kid_arb_int_hv[i]),
        .kid_arb_int_req            (kid_arb_int_req[i]),
        .kid_busif_rdata            (kid_busif_rdata_vec[32*i+:32])
      );
    end
    default:
    begin: KID_TRUE
      pa_clic_kid x_pa_clic_kid(
        .busif_kid_clicintattr_sel  (busif_kid_clicintattr_sel[i]),
        .busif_kid_clicintctl_sel   (busif_kid_clicintctl_sel[i]),
        .busif_kid_clicintie_sel    (busif_kid_clicintie_sel[i]),
        .busif_kid_clicintip_sel    (busif_kid_clicintip_sel[i]),
        .busif_kid_wdata            (busif_kid_wdata),
        .busif_xx_write_vld         (busif_xx_write_vld),
        .clic_clk                   (clic_clk),
        .cpu_clic_mode              (cpu_clic_mode),
        .cpurst_b                   (cpurst_b),
        .ctrl_kid_ack_int           (ctrl_kid_ack_int[i]),
        .ctrl_xx_mode_or_mask       (ctrl_xx_mode_or_mask),
        .forever_cpuclk             (forever_cpuclk),
        .kid_arb_int_all            (kid_arb_int_all_vec[(CLICINTCTLBITS+1)*i+:(CLICINTCTLBITS+1)]),
        .kid_arb_int_hv             (kid_arb_int_hv[i]),
        .kid_arb_int_req            (kid_arb_int_req[i]),
        .kid_busif_rdata            (kid_busif_rdata_vec[32*i+:32]),
        .kid_int_vld                (kid_int_vld[i]),
        .pad_yy_icg_scan_en         (pad_yy_icg_scan_en )
      );
    end
  endcase
end
endgenerate
//csky vperl_on

assign clic_rst_b = pad_yy_scan_mode ? pad_yy_dft_clk_rst_b : cpurst_b;

always @ (posedge forever_cpuclk or negedge clic_rst_b)
begin
  if (!clic_rst_b) begin
    clic_clk_en_raw <= 1'b0;
  end
  else begin
    clic_clk_en_raw <= !clic_clk_en_raw;
  end
end

always @ (posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    clic_test_point <= 1'b0;
  end
  else begin
    clic_test_point <= 1'b1;
  end
end


assign clic_clk_en = pad_yy_scan_mode ? clic_test_point : clic_clk_en_raw;

// &Force("nonport", "clic_clk"); @134
BUFGCE clic_clk_buf
(.O   (clic_clk),
 .I   (forever_cpuclk),
 .CE  (clic_clk_en_raw)
);
// &Instance("gated_clk_cell", "x_clic_clk"); @141
// &Connect(.clk_in      (forever_cpuclk), @142
//          .external_en (1'b0), @143
//          .global_en   (1'b1), @144
//          .module_en   (1'b0), @145
//          .local_en    (clic_clk_en_raw), @146
//          .clk_out     (clic_clk), @147
//          .pad_yy_icg_scan_en (1'b0)); @148

//==========================================================
//                    Gate Clk Cell
//==========================================================

// &Instance("gated_clk_cell", "x_clicreg_clk"); @160
gated_clk_cell  x_clicreg_clk (
  .clk_in             (clic_clk          ),
  .clk_out            (clicreg_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctrl_clicreg_en   ),
  .module_en          (1'b0              ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (clic_clk), @161
//          .external_en (1'b0), @162
//          .global_en   (1'b1), @163
//          .module_en   (1'b0), @164
//          .local_en    (ctrl_clicreg_en), @165
//          .clk_out     (clicreg_clk)); @166

// &ModuleEnd; @168
endmodule


