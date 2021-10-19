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
module pa_clic_ctrl(
  arb_ctrl_int_hv,
  arb_ctrl_int_id,
  arb_ctrl_int_il,
  arb_ctrl_int_mode,
  arb_ctrl_int_req_raw,
  busif_ctrl_cliccfg_sel,
  busif_ctrl_clicinfo_sel,
  busif_ctrl_mintthresh_sel,
  busif_kid_wdata,
  busif_xx_write_vld,
  clic_clk,
  clic_clk_en,
  clic_cpu_int_hv,
  clic_cpu_int_id,
  clic_cpu_int_il,
  clic_cpu_int_priv,
  clicreg_clk,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpu_clic_mode,
  cpurst_b,
  ctrl_busif_cliccfg_val,
  ctrl_busif_clicinfo_val,
  ctrl_busif_mintthresh_val,
  ctrl_clicreg_en,
  ctrl_kid_ack_int,
  ctrl_xx_int_lv_or_mask,
  ctrl_xx_mode_or_mask,
  forever_cpuclk,
  pad_yy_icg_scan_en
);

// &Ports; @23
input            arb_ctrl_int_hv;          
input   [11 :0]  arb_ctrl_int_id;          
input   [7  :0]  arb_ctrl_int_il;          
input            arb_ctrl_int_mode;        
input            arb_ctrl_int_req_raw;     
input            busif_ctrl_cliccfg_sel;   
input            busif_ctrl_clicinfo_sel;  
input            busif_ctrl_mintthresh_sel; 
input   [31 :0]  busif_kid_wdata;          
input            busif_xx_write_vld;       
input            clic_clk;                 
input            clic_clk_en;              
input            clicreg_clk;              
input   [11 :0]  cpu_clic_curid;           
input            cpu_clic_int_exit;        
input   [1  :0]  cpu_clic_mode;            
input            cpurst_b;                 
input            forever_cpuclk;           
input            pad_yy_icg_scan_en;       
output           clic_cpu_int_hv;          
output  [11 :0]  clic_cpu_int_id;          
output  [7  :0]  clic_cpu_int_il;          
output  [1  :0]  clic_cpu_int_priv;        
output  [31 :0]  ctrl_busif_cliccfg_val;   
output  [31 :0]  ctrl_busif_clicinfo_val;  
output  [31 :0]  ctrl_busif_mintthresh_val; 
output           ctrl_clicreg_en;          
output  [143:0]  ctrl_kid_ack_int;         
output  [2  :0]  ctrl_xx_int_lv_or_mask;   
output           ctrl_xx_mode_or_mask;     

// &Regs; @24
reg              clic_int_hv;              
reg     [11 :0]  clic_int_id;              
reg     [7  :0]  clic_int_il_raw;          
reg     [1  :0]  clic_int_priv;            
reg     [3  :0]  cliccfg_nlbits;           
reg     [7  :0]  mintthresh_mth;           

// &Wires; @25
wire             arb_ctrl_int_hv;          
wire    [11 :0]  arb_ctrl_int_id;          
wire    [7  :0]  arb_ctrl_int_il;          
wire             arb_ctrl_int_mode;        
wire             arb_ctrl_int_req_raw;     
wire             busif_ctrl_cliccfg_sel;   
wire             busif_ctrl_mintthresh_sel; 
wire    [31 :0]  busif_kid_wdata;          
wire             busif_xx_write_vld;       
wire             clic_clk;                 
wire             clic_clk_en;              
wire             clic_cpu_int_hv;          
wire    [11 :0]  clic_cpu_int_id;          
wire    [7  :0]  clic_cpu_int_il;          
wire    [1  :0]  clic_cpu_int_priv;        
wire    [1  :0]  cliccfg_nmbits;           
wire             cliccfg_nmbits_0;         
wire             cliccfg_nvbits;           
wire    [31 :0]  cliccfg_reg;              
wire    [7  :0]  cliccfg_updt_val;         
wire    [3  :0]  clicinfo_arch_ver;        
wire    [3  :0]  clicinfo_clicintctlbits;  
wire    [3  :0]  clicinfo_impl_ver;        
wire    [12 :0]  clicinfo_num_int;         
wire    [31 :0]  clicinfo_reg;             
wire             clicreg_clk;              
wire    [11 :0]  cpu_clic_curid;           
wire             cpu_clic_int_exit;        
wire    [1  :0]  cpu_clic_mode;            
wire             cpu_int_exit;             
wire             cpurst_b;                 
wire    [31 :0]  ctrl_busif_cliccfg_val;   
wire    [31 :0]  ctrl_busif_clicinfo_val;  
wire    [31 :0]  ctrl_busif_mintthresh_val; 
wire             ctrl_cliccfg_updt_vld;    
wire             ctrl_clicreg_en;          
wire             ctrl_int_gt_thresh;       
wire    [143:0]  ctrl_kid_ack_int;         
wire             ctrl_mintthresh_updt_vld; 
wire             ctrl_mode_vld;            
wire    [7  :0]  ctrl_thresh;              
wire             ctrl_write_vld;           
wire             ctrl_xx_mode_or_mask;     
wire             forever_cpuclk;           
wire    [7  :0]  mintthresh_hth;           
wire    [31 :0]  mintthresh_reg;           
wire    [7  :0]  mintthresh_sth;           
wire    [31 :0]  mintthresh_updt_val;      
wire    [7  :0]  mintthresh_uth;           
wire             out_clk;                  
wire             out_clk_en;               
wire             pad_yy_icg_scan_en;       


parameter CLICINTNUM = `CLIC_INTNUM;
parameter CLICINTCTLBITS = `CLIC_INTCTLBITS;
parameter ID_WIDTH = 12;

parameter INT_MODE_U     = 1'b0;
parameter INT_MODE_M     = 1'b1;
parameter CPU_MODE_U     = 2'b00;
parameter CPU_MODE_M     = 2'b11;

//==========================================================
//                    Rename Input
//==========================================================
assign cliccfg_updt_val[7:0]     = busif_kid_wdata[7:0];
// assign clicinfo_updt_val[31:0]   = busif_kid_wdata[31:0];
assign mintthresh_updt_val[31:0] = busif_kid_wdata[31:0];


//==========================================================
//                    Write Vld
//==========================================================
assign ctrl_mode_vld = cpu_clic_mode[1:0] == CPU_MODE_M;
assign ctrl_write_vld = busif_xx_write_vld && ctrl_mode_vld;
assign ctrl_cliccfg_updt_vld    = ctrl_write_vld && busif_ctrl_cliccfg_sel;
// &Force("input", "busif_ctrl_clicinfo_sel"); @50
// assign ctrl_clicinfo_updt_vld   = ctrl_write_vld && busif_ctrl_clicinfo_sel;
assign ctrl_mintthresh_updt_vld = ctrl_write_vld && busif_ctrl_mintthresh_sel;

//==========================================================
//                     CLICCFG
//==========================================================
always @ (posedge clicreg_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cliccfg_nlbits[3:0] <= 4'b0;
  else if (ctrl_cliccfg_updt_vld)
    cliccfg_nlbits[3:0] <= cliccfg_updt_val[4] ? 4'd8 : cliccfg_updt_val[4:1];  // if nlbits > 8, it will be 8.
  else
    cliccfg_nlbits[3:0] <= cliccfg_nlbits[3:0];
end

assign cliccfg_nmbits_0 = 1'b0;
assign ctrl_xx_mode_or_mask = !cliccfg_nmbits_0;
 
// cliccfg_nmbits only can be 0/1 so [1] is not use.
assign cliccfg_nmbits[1:0] = {1'b0, cliccfg_nmbits_0};
assign cliccfg_nvbits      = 1'b1;
assign cliccfg_reg[31:0]    = {25'b0,
                               cliccfg_nmbits[1:0],
                               cliccfg_nlbits[3:0],
                               cliccfg_nvbits};



//==========================================================
//                     CLICINFO
//==========================================================
//csky vperl_off
assign clicinfo_clicintctlbits[3:0] = $unsigned(CLICINTCTLBITS) & 4'hf;
assign clicinfo_arch_ver[3:0] = 4'b0;
assign clicinfo_impl_ver[3:0] = 4'b0;
assign clicinfo_num_int[12:0] = $unsigned(CLICINTNUM) & 13'h1fff;
//csky vperl_on
// &Force("nonport", "clicinfo_clicintctlbits"); @101
// &Force("nonport", "clicinfo_arch_ver"); @102
// &Force("nonport", "clicinfo_impl_ver"); @103
// &Force("nonport", "clicinfo_num_int"); @104

assign clicinfo_reg[31:0] = {7'b0,
                             clicinfo_clicintctlbits[3:0],
                             clicinfo_arch_ver[3:0],
                             clicinfo_impl_ver[3:0],
                             clicinfo_num_int[12:0]};


//==========================================================
//                     MINTTHRESH
//==========================================================
always @ (posedge clicreg_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    mintthresh_mth[7:0] <= 8'b0;
    // mintthresh_hth[7:0] <= 8'b0;
    // mintthresh_sth[7:0] <= 8'b0;
  end
  else if (ctrl_mintthresh_updt_vld) begin
    mintthresh_mth[7:0] <= mintthresh_updt_val[31:24];
    // mintthresh_hth[7:0] <= mintthresh_updt_val[23:16];
    // mintthresh_sth[7:0] <= mintthresh_updt_val[15:8];
  end
  else begin
    mintthresh_mth[7:0] <= mintthresh_mth[7:0];
    // mintthresh_hth[7:0] <= mintthresh_hth[7:0];
    // mintthresh_sth[7:0] <= mintthresh_sth[7:0];
  end
end

assign mintthresh_uth[7:0] = 8'b0;

assign mintthresh_hth[7:0] = 8'b0;
assign mintthresh_sth[7:0] = 8'b0;

assign mintthresh_reg[31:0] = {mintthresh_mth[7:0],
                               mintthresh_hth[7:0],
                               mintthresh_sth[7:0],
                               mintthresh_uth[7:0]};


//==========================================================
//                   For Gate Clk Cell
//==========================================================
assign ctrl_clicreg_en     = ctrl_mintthresh_updt_vld || ctrl_cliccfg_updt_vld;
//==========================================================
//                      To busif
//==========================================================
// &Force("output", "ctrl_xx_int_lv_or_mask"); &Force("bus", "ctrl_xx_int_lv_or_mask", CLICINTCTLBITS-1, 0); @165
//csky vperl_off
wire [CLICINTCTLBITS-1:0] ctrl_xx_int_lv_or_mask;

genvar i;
generate
for (i = 0; i < CLICINTCTLBITS; i = i+1)
begin: LEVEL_MASK
  assign ctrl_xx_int_lv_or_mask[CLICINTCTLBITS-1-i] = !(($unsigned(i) & {4'hf}) < cliccfg_nlbits[3:0]);
end
endgenerate
//csky vperl_on

//==========================================================
//                      To busif
//==========================================================
assign ctrl_busif_cliccfg_val[31:0]    = cliccfg_reg[31:0]    & {32{ctrl_mode_vld}};
assign ctrl_busif_clicinfo_val[31:0]   = clicinfo_reg[31:0]   & {32{ctrl_mode_vld}};
assign ctrl_busif_mintthresh_val[31:0] = mintthresh_reg[31:0] & {32{ctrl_mode_vld}};

//==========================================================
//                  Final judge mintthresh
//==========================================================
assign ctrl_thresh[7:0] = arb_ctrl_int_mode == INT_MODE_M ? mintthresh_mth[7:0]
                                                          : mintthresh_uth[7:0];
assign ctrl_int_gt_thresh = ctrl_thresh[7:0] < arb_ctrl_int_il[7:0];

always @ (posedge out_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    clic_int_hv               <= 1'b0;
    clic_int_id[ID_WIDTH-1:0] <= {ID_WIDTH{1'b0}};
    clic_int_priv[1:0]        <= 2'b0;
    clic_int_il_raw[7:0]      <= 8'b0;
  end
  else if (cpu_int_exit) begin
    clic_int_hv               <= 1'b0;
    clic_int_id[ID_WIDTH-1:0] <= {ID_WIDTH{1'b0}};
    clic_int_priv[1:0]        <= 2'b0;
    clic_int_il_raw[7:0]      <= 8'b0;
  end
  else if (out_clk_en) begin
    clic_int_hv               <= arb_ctrl_int_hv;
    clic_int_id[ID_WIDTH-1:0] <= arb_ctrl_int_id[ID_WIDTH-1:0];
    clic_int_priv[1:0]        <= {2{arb_ctrl_int_mode}};
    clic_int_il_raw[7:0]      <= {8{ctrl_int_gt_thresh}} & arb_ctrl_int_il[7:0];
  end
end

assign out_clk_en = arb_ctrl_int_req_raw
                 || |clic_int_il_raw[7:0];

// &Instance("gated_clk_cell", "x_out_clk"); @217
gated_clk_cell  x_out_clk (
  .clk_in             (clic_clk          ),
  .clk_out            (out_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (out_clk_en        ),
  .module_en          (1'b0              ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (clic_clk), @218
//          .external_en (1'b0), @219
//          .global_en   (1'b1), @220
//          .module_en   (1'b0), @221
//          .local_en    (out_clk_en), @222
//          .clk_out     (out_clk)); @223

// &Instance("pa_clic_cpuif_2cycle"); @226
pa_clic_cpuif_2cycle  x_pa_clic_cpuif_2cycle (
  .clic_clk_en        (clic_clk_en       ),
  .clic_cpu_int_hv    (clic_cpu_int_hv   ),
  .clic_cpu_int_id    (clic_cpu_int_id   ),
  .clic_cpu_int_il    (clic_cpu_int_il   ),
  .clic_cpu_int_priv  (clic_cpu_int_priv ),
  .clic_int_hv        (clic_int_hv       ),
  .clic_int_id        (clic_int_id       ),
  .clic_int_il_raw    (clic_int_il_raw   ),
  .clic_int_priv      (clic_int_priv     ),
  .cpu_clic_curid     (cpu_clic_curid    ),
  .cpu_clic_int_exit  (cpu_clic_int_exit ),
  .cpu_int_exit       (cpu_int_exit      ),
  .cpurst_b           (cpurst_b          ),
  .ctrl_kid_ack_int   (ctrl_kid_ack_int  ),
  .forever_cpuclk     (forever_cpuclk    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_clic_cpuif"); @228

// &ModuleEnd; @231
endmodule


