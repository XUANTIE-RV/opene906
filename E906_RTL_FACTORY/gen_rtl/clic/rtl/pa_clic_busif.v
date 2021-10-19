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
module pa_clic_busif(
  busif_ctrl_cliccfg_sel,
  busif_ctrl_clicinfo_sel,
  busif_ctrl_mintthresh_sel,
  busif_kid_clicintattr_sel,
  busif_kid_clicintctl_sel,
  busif_kid_clicintie_sel,
  busif_kid_clicintip_sel,
  busif_kid_wdata,
  busif_xx_write_vld,
  clic_clk,
  clic_clk_en,
  clic_tcipif_cmplt,
  clic_tcipif_rdata,
  cpurst_b,
  ctrl_busif_cliccfg_val,
  ctrl_busif_clicinfo_val,
  ctrl_busif_mintthresh_val,
  ifu_clic_warm_up,
  kid_busif_rdata_vec,
  pad_yy_icg_scan_en,
  pad_yy_scan_mode,
  tcipif_clic_addr,
  tcipif_clic_sel,
  tcipif_clic_size,
  tcipif_clic_wdata,
  tcipif_clic_write
);

// &Ports; @24
input             clic_clk;                    
input             clic_clk_en;                 
input             cpurst_b;                    
input   [31  :0]  ctrl_busif_cliccfg_val;      
input   [31  :0]  ctrl_busif_clicinfo_val;     
input   [31  :0]  ctrl_busif_mintthresh_val;   
input             ifu_clic_warm_up;            
input   [4607:0]  kid_busif_rdata_vec;         
input             pad_yy_icg_scan_en;          
input             pad_yy_scan_mode;            
input   [15  :0]  tcipif_clic_addr;            
input             tcipif_clic_sel;             
input   [1   :0]  tcipif_clic_size;            
input   [31  :0]  tcipif_clic_wdata;           
input             tcipif_clic_write;           
output            busif_ctrl_cliccfg_sel;      
output            busif_ctrl_clicinfo_sel;     
output            busif_ctrl_mintthresh_sel;   
output  [143 :0]  busif_kid_clicintattr_sel;   
output  [143 :0]  busif_kid_clicintctl_sel;    
output  [143 :0]  busif_kid_clicintie_sel;     
output  [143 :0]  busif_kid_clicintip_sel;     
output  [31  :0]  busif_kid_wdata;             
output            busif_xx_write_vld;          
output            clic_tcipif_cmplt;           
output  [31  :0]  clic_tcipif_rdata;           

// &Regs; @25
reg     [15  :0]  busif_addr;                  
reg     [3   :0]  busif_kid_reg_sel;           
reg               busif_sel;                   
reg     [1   :0]  busif_size;                  
reg     [31  :0]  busif_wdata;                 
reg               busif_write;                 
reg     [31  :0]  clic_tcipif_rdata_test_point; 

// &Wires; @26
wire              busif_cmplt;                 
wire              busif_ctrl_cliccfg_sel;      
wire              busif_ctrl_clicinfo_sel;     
wire              busif_ctrl_mintthresh_sel;   
wire    [143 :0]  busif_kid_sel;               
wire    [31  :0]  busif_kid_wdata;             
wire              busif_read_vld;              
wire              busif_sel_updt;              
wire              busif_xx_write_vld;          
wire              clic_clk;                    
wire              clic_clk_en;                 
wire    [15  :0]  clic_kid_base;               
wire              clic_tcipif_cmplt;           
wire    [31  :0]  clic_tcipif_rdata;           
wire    [31  :0]  clic_tcipif_rdata_pre;       
wire              cliccfg_sel;                 
wire              clicinfo_sel;                
wire              cpurst_b;                    
wire    [31  :0]  ctrl_busif_cliccfg_val;      
wire    [31  :0]  ctrl_busif_clicinfo_val;     
wire    [31  :0]  ctrl_busif_mintthresh_val;   
wire    [31  :0]  kid_busif_rdata;             
wire              mintthresh_sel;              
wire              pad_yy_icg_scan_en;          
wire              pad_yy_scan_mode;            
wire              tcip_clk;                    
wire              tcip_clk_en;                 
wire    [15  :0]  tcipif_clic_addr;            
wire              tcipif_clic_sel;             
wire    [1   :0]  tcipif_clic_size;            
wire    [31  :0]  tcipif_clic_wdata;           
wire              tcipif_clic_write;           


parameter CLICINTNUM = `CLIC_INTNUM;

parameter CLICCFG_BASE    = 16'h0000;
parameter CLICINFO_BASE   = 16'h0004;
parameter MINTTHRESH_BASE = 16'h0008;

parameter CLICKID_BASE    = 16'h1000;

assign clic_kid_base[15:0] = CLICKID_BASE;
// &Force("nonport", "clic_kid_base"); @37

assign busif_sel_updt = busif_sel ^ tcipif_clic_sel;
always @ (posedge tcip_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    busif_sel <= 1'b0;
  end
  else if (busif_sel) begin
    busif_sel <= 1'b0;
  end
  else if (busif_sel_updt) begin
    busif_sel <= tcipif_clic_sel;
  end
end

always @ (posedge tcip_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    busif_addr[15:0]  <= 16'b0;
    busif_write       <= 1'b0;
    busif_size[1:0]   <= 2'b0;
    busif_wdata[31:0] <= 32'b0;
  end
  else if (tcipif_clic_sel) begin
    busif_addr[15:0]  <= tcipif_clic_addr[15:0];
    busif_write       <= tcipif_clic_write;
    busif_size[1:0]   <= tcipif_clic_size[1:0];
    busif_wdata[31:0] <= tcipif_clic_wdata[31:0];
  end
end

assign tcip_clk_en = tcipif_clic_sel
                  || busif_sel_updt;
// &Instance("gated_clk_cell", "x_tcip_clk"); @72
gated_clk_cell  x_tcip_clk (
  .clk_in             (clic_clk          ),
  .clk_out            (tcip_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (tcip_clk_en       ),
  .module_en          (1'b0              ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (clic_clk), @73
//          .external_en (1'b0), @74
//          .global_en   (1'b1), @75
//          .module_en   (1'b0), @76
//          .local_en    (tcip_clk_en), @77
//          .clk_out     (tcip_clk)); @78

// &Force("input", "ifu_clic_warm_up"); @87

assign cliccfg_sel    = busif_addr[15:0] == CLICCFG_BASE;
assign clicinfo_sel   = busif_addr[15:0] == CLICINFO_BASE;
assign mintthresh_sel = busif_addr[15:0] == MINTTHRESH_BASE;
assign busif_ctrl_cliccfg_sel    = cliccfg_sel;
assign busif_ctrl_clicinfo_sel   = clicinfo_sel;
assign busif_ctrl_mintthresh_sel = mintthresh_sel;

assign busif_cmplt = busif_sel;
assign clic_tcipif_cmplt = busif_cmplt && clic_clk_en;
assign busif_kid_wdata[31:0] = busif_wdata[31:0];

// &CombBeg; @100
always @( busif_addr[1:0]
       or busif_size[1:0])
begin
  case({busif_addr[1:0], busif_size[1:0]})
    4'b00_00: busif_kid_reg_sel[3:0] = 4'b0001; // Byte
    4'b01_00: busif_kid_reg_sel[3:0] = 4'b0010;
    4'b10_00: busif_kid_reg_sel[3:0] = 4'b0100;
    4'b11_00: busif_kid_reg_sel[3:0] = 4'b1000; // Half word
    4'b00_01: busif_kid_reg_sel[3:0] = 4'b0011;
    4'b10_01: busif_kid_reg_sel[3:0] = 4'b1100;
    4'b00_10: busif_kid_reg_sel[3:0] = 4'b1111;
    default:  busif_kid_reg_sel[3:0] = 4'b0000;
  endcase
// &CombEnd; @111
end
// &Force("nonport", "busif_kid_reg_sel"); @112
// &Force("nonport", "busif_kid_sel"); @113

// &Force("output", "busif_kid_clicintip_sel"); @115
// &Force("output", "busif_kid_clicintie_sel"); @116
// &Force("output", "busif_kid_clicintattr_sel"); @117
// &Force("output", "busif_kid_clicintctl_sel"); @118
// &Force("bus", "busif_kid_clicintip_sel", CLICINTNUM-1, 0); @119
// &Force("bus", "busif_kid_clicintie_sel", CLICINTNUM-1, 0); @120
// &Force("bus", "busif_kid_clicintattr_sel", CLICINTNUM-1, 0); @121
// &Force("bus", "busif_kid_clicintctl_sel", CLICINTNUM-1, 0); @122

//csky vperl_off
wire [CLICINTNUM-1:0] busif_kid_clicintip_sel;
wire [CLICINTNUM-1:0] busif_kid_clicintie_sel;
wire [CLICINTNUM-1:0] busif_kid_clicintattr_sel;
wire [CLICINTNUM-1:0] busif_kid_clicintctl_sel;

genvar i;
generate
for (i = 0; i < CLICINTNUM; i = i+1)
begin: BUSIF_KID
  assign busif_kid_sel[i]             = (busif_addr[15:2] - clic_kid_base[15:2]) == $unsigned(i);
  assign busif_kid_clicintip_sel[i]   = busif_kid_sel[i] && busif_kid_reg_sel[0];
  assign busif_kid_clicintie_sel[i]   = busif_kid_sel[i] && busif_kid_reg_sel[1];
  assign busif_kid_clicintattr_sel[i] = busif_kid_sel[i] && busif_kid_reg_sel[2];
  assign busif_kid_clicintctl_sel[i]  = busif_kid_sel[i] && busif_kid_reg_sel[3];
end
endgenerate
//csky vperl_on

assign busif_xx_write_vld = busif_sel && busif_write;
assign busif_read_vld     = busif_sel && !busif_write;
//==========================================================
//                      Read Sel
//==========================================================
// &Force("input", "kid_busif_rdata_vec"); @148
// &Force("bus", "kid_busif_rdata_vec", (CLICINTNUM)*32-1, 0); @149
// &Force("nonport", "kid_busif_rdata"); @150
//csky vperl_off
pa_clic_sel #(32, CLICINTNUM) x_pa_clic_kid_rdata_sel(
  .data_in         (kid_busif_rdata_vec),
  .sel_in_onehot   (busif_kid_sel),
  .data_out        (kid_busif_rdata)
);
//csky vperl_on

assign clic_tcipif_rdata_pre[31:0] = {{32{cliccfg_sel}}    & ctrl_busif_cliccfg_val[31:0]
                                | {32{clicinfo_sel}}   & ctrl_busif_clicinfo_val[31:0]
                                | {32{mintthresh_sel}} & ctrl_busif_mintthresh_val[31:0]
                                | {32{|busif_kid_sel[CLICINTNUM-1:0]}} & kid_busif_rdata[31:0]}
                                & {32{busif_read_vld}};
assign clic_tcipif_rdata[31:0] = pad_yy_scan_mode ? clic_tcipif_rdata_test_point[31:0] : clic_tcipif_rdata_pre[31:0];

always @(posedge clic_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    clic_tcipif_rdata_test_point[31:0] <= 32'b0;
  end
  else begin
    clic_tcipif_rdata_test_point[31:0] <= clic_tcipif_rdata_pre[31:0];
  end
end
// &ModuleEnd; @175
endmodule


