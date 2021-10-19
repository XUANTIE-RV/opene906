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
module pa_tcipif_dummy_bus(
  bmu_tcipif_ibus_acc_deny,
  bmu_tcipif_ibus_addr,
  bmu_tcipif_ibus_req,
  bmu_tcipif_ibus_req_dp,
  bmu_tcipif_ibus_size,
  bmu_tcipif_ibus_supv_mode,
  bmu_tcipif_ibus_wdata,
  bmu_tcipif_ibus_write,
  cp0_biu_icg_en,
  cpurst_b,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  tcipif_bmu_ibus_acc_err,
  tcipif_bmu_ibus_data,
  tcipif_bmu_ibus_grnt,
  tcipif_bmu_ibus_trans_cmplt
);

// &Ports; @23
input           bmu_tcipif_ibus_acc_deny;   
input   [31:0]  bmu_tcipif_ibus_addr;       
input           bmu_tcipif_ibus_req;        
input           bmu_tcipif_ibus_req_dp;     
input   [1 :0]  bmu_tcipif_ibus_size;       
input           bmu_tcipif_ibus_supv_mode;  
input   [31:0]  bmu_tcipif_ibus_wdata;      
input           bmu_tcipif_ibus_write;      
input           cp0_biu_icg_en;             
input           cpurst_b;                   
input           forever_cpuclk;             
input           pad_yy_icg_scan_en;         
output          tcipif_bmu_ibus_acc_err;    
output  [31:0]  tcipif_bmu_ibus_data;       
output          tcipif_bmu_ibus_grnt;       
output          tcipif_bmu_ibus_trans_cmplt; 

// &Regs; @24
reg             bus_next_state;             
reg             bus_state;                  

// &Wires; @25
wire            bmu_tcipif_ibus_req;        
wire            bmu_tcipif_ibus_req_dp;     
wire            cp0_biu_icg_en;             
wire            cpurst_b;                   
wire            forever_cpuclk;             
wire            ibus_acc_err;               
wire            ibus_busy;                  
wire            ibus_req;                   
wire            pad_yy_icg_scan_en;         
wire            sel_clk;                    
wire            sel_clk_en;                 
wire            tcipif_bmu_ibus_acc_err;    
wire    [31:0]  tcipif_bmu_ibus_data;       
wire            tcipif_bmu_ibus_grnt;       
wire            tcipif_bmu_ibus_trans_cmplt; 


//==========================================================
//  ACK to IBUS
//==========================================================
// &Force("input","bmu_tcipif_ibus_addr"); @30
// &Force("input","bmu_tcipif_ibus_write"); @31
// &Force("input","bmu_tcipif_ibus_size"); @32
// &Force("input","bmu_tcipif_ibus_acc_deny"); @33
// &Force("input","bmu_tcipif_ibus_supv_mode"); @34
// &Force("input","bmu_tcipif_ibus_wdata"); @35
// &Force("input","bmu_tcipif_ibus_sec"); @37
// &Force("bus","bmu_tcipif_ibus_addr",31,0); @39
// &Force("bus","bmu_tcipif_ibus_size",1,0); @40
// &Force("bus","bmu_tcipif_ibus_wdata",31,0); @41

parameter IDLE  = 1'b0,
          ERROR = 1'b1;

assign sel_clk_en = bmu_tcipif_ibus_req_dp | ibus_busy;
// &Instance("gated_clk_cell", "x_tcipif_ibus_sel_clk"); @47
gated_clk_cell  x_tcipif_ibus_sel_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sel_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (sel_clk_en        ),
  .module_en          (cp0_biu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk     ), @48
//          .external_en (1'b0               ), @49
//          .global_en   (1'b1               ), @50
//          .module_en   (cp0_biu_icg_en     ), @51
//          .local_en    (sel_clk_en         ), @52
//          .clk_out     (sel_clk            ) @53
//         ); @54

always@(posedge sel_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    bus_state <= IDLE;
  else
    bus_state <= bus_next_state;
end

// &CombBeg; @64
always @( bus_state
       or ibus_req)
begin
case(bus_state)
  IDLE:
    if(ibus_req)
      bus_next_state = ERROR;
    else
      bus_next_state = IDLE;
  ERROR:
    if(ibus_req)
      bus_next_state = ERROR;
    else
      bus_next_state = IDLE;
  default:
    bus_next_state = IDLE;
endcase
// &CombEnd; @79
end

assign ibus_req     = bmu_tcipif_ibus_req;
assign ibus_busy    = (bus_state != IDLE);
assign ibus_acc_err = (bus_state == ERROR);

assign tcipif_bmu_ibus_grnt        = bmu_tcipif_ibus_req_dp;
assign tcipif_bmu_ibus_trans_cmplt = ibus_acc_err;
assign tcipif_bmu_ibus_acc_err     = ibus_acc_err;
assign tcipif_bmu_ibus_data[31:0]  = 32'b0;

// &ModuleEnd; @90
endmodule



