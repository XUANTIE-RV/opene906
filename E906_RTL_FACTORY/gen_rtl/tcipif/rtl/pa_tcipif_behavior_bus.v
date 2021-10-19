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
module pa_tcipif_behavior_bus(
  bmu_tcipif_dbus_acc_deny,
  bmu_tcipif_dbus_addr,
  bmu_tcipif_dbus_req,
  bmu_tcipif_dbus_req_dp,
  bmu_tcipif_dbus_size,
  bmu_tcipif_dbus_supv_mode,
  bmu_tcipif_dbus_wdata,
  bmu_tcipif_dbus_write,
  clic_tcipif_cmplt,
  clic_tcipif_rdata,
  clint_tcipif_cmplt,
  clint_tcipif_rdata,
  cp0_biu_icg_en,
  cpurst_b,
  forever_cpuclk,
  pad_cpu_tcip_base,
  pad_yy_icg_scan_en,
  rtu_yy_xx_dbgon,
  sysmap_tcipif_cmplt,
  sysmap_tcipif_rdata,
  tcip_cp0_clic_base,
  tcipif_bmu_dbus_acc_err,
  tcipif_bmu_dbus_data,
  tcipif_bmu_dbus_grnt,
  tcipif_bmu_dbus_trans_cmplt,
  tcipif_clic_sel,
  tcipif_clic_size,
  tcipif_clint_sel,
  tcipif_sysmap_sel,
  tcipif_xx_addr,
  tcipif_xx_wdata,
  tcipif_xx_write
);

// &Ports; @24
input           bmu_tcipif_dbus_acc_deny;   
input   [31:0]  bmu_tcipif_dbus_addr;       
input           bmu_tcipif_dbus_req;        
input           bmu_tcipif_dbus_req_dp;     
input   [1 :0]  bmu_tcipif_dbus_size;       
input           bmu_tcipif_dbus_supv_mode;  
input   [31:0]  bmu_tcipif_dbus_wdata;      
input           bmu_tcipif_dbus_write;      
input           clic_tcipif_cmplt;          
input   [31:0]  clic_tcipif_rdata;          
input           clint_tcipif_cmplt;         
input   [31:0]  clint_tcipif_rdata;         
input           cp0_biu_icg_en;             
input           cpurst_b;                   
input           forever_cpuclk;             
input   [31:0]  pad_cpu_tcip_base;          
input           pad_yy_icg_scan_en;         
input           rtu_yy_xx_dbgon;            
input           sysmap_tcipif_cmplt;        
input   [31:0]  sysmap_tcipif_rdata;        
output  [31:0]  tcip_cp0_clic_base;         
output          tcipif_bmu_dbus_acc_err;    
output  [31:0]  tcipif_bmu_dbus_data;       
output          tcipif_bmu_dbus_grnt;       
output          tcipif_bmu_dbus_trans_cmplt; 
output          tcipif_clic_sel;            
output  [1 :0]  tcipif_clic_size;           
output          tcipif_clint_sel;           
output          tcipif_sysmap_sel;          
output  [15:0]  tcipif_xx_addr;             
output  [31:0]  tcipif_xx_wdata;            
output          tcipif_xx_write;            

// &Regs; @25
reg             clic_sel_ff;                
reg     [1 :0]  clic_size_ff;               
reg             clint_sel_ff;               
reg             dummy_addr_cmplt;           
reg             sysmap_sel_ff;              
reg             tcip_acc_deny_ff;           
reg             tcipif_acc_err;             
reg     [15:0]  tcipif_xx_addr;             
reg             tcipif_xx_write;            

// &Wires; @26
wire            bmu_tcipif_dbus_acc_deny;   
wire    [31:0]  bmu_tcipif_dbus_addr;       
wire            bmu_tcipif_dbus_req;        
wire            bmu_tcipif_dbus_req_dp;     
wire    [1 :0]  bmu_tcipif_dbus_size;       
wire            bmu_tcipif_dbus_supv_mode;  
wire    [31:0]  bmu_tcipif_dbus_wdata;      
wire            bmu_tcipif_dbus_write;      
wire            clic_req_mask;              
wire            clic_sel;                   
wire            clic_tcipif_cmplt;          
wire    [31:0]  clic_tcipif_rdata;          
wire            clint_req_mask;             
wire            clint_sel;                  
wire            clint_tcipif_cmplt;         
wire    [31:0]  clint_tcipif_rdata;         
wire            cp0_biu_icg_en;             
wire            cpurst_b;                   
wire            dbus_err;                   
wire            dbus_req_pre;               
wire            dbus_sel;                   
wire            dummy_addr_sel;             
wire            forever_cpuclk;             
wire    [31:0]  pad_cpu_tcip_base;          
wire            pad_yy_icg_scan_en;         
wire            rtu_yy_xx_dbgon;            
wire            sysmap_req_mask;            
wire            sysmap_sel;                 
wire            sysmap_tcipif_cmplt;        
wire    [31:0]  sysmap_tcipif_rdata;        
wire            tcip_acc_deny;              
wire    [31:0]  tcip_cp0_clic_base;         
wire            tcip_ctrl_clk;              
wire            tcip_ctrl_clk_en;           
wire            tcip_dp_clk;                
wire            tcip_err;                   
wire    [31:0]  tcip_req_addr;              
wire            tcip_req_gate;              
wire            tcip_req_mask;              
wire            tcip_req_pre;               
wire    [1 :0]  tcip_req_size;              
wire            tcip_req_write;             
wire            tcipif_bmu_dbus_acc_err;    
wire    [31:0]  tcipif_bmu_dbus_data;       
wire            tcipif_bmu_dbus_grnt;       
wire            tcipif_bmu_dbus_trans_cmplt; 
wire            tcipif_clic_sel;            
wire    [1 :0]  tcipif_clic_size;           
wire            tcipif_clint_sel;           
wire    [31:0]  tcipif_rdata;               
wire            tcipif_sysmap_sel;          
wire            tcipif_trans_cmplt;         
wire    [31:0]  tcipif_xx_wdata;            
wire            xx_tcipif_cmplt;            


//==========================================================
//  Req Arb
//==========================================================
//for grnt

assign dbus_req_pre = bmu_tcipif_dbus_req && !tcip_req_mask;
assign tcip_req_pre = dbus_req_pre;

assign tcip_req_gate = bmu_tcipif_dbus_req_dp;

assign dbus_sel = bmu_tcipif_dbus_req_dp && !tcip_req_mask;

//data path
assign dbus_err = !bmu_tcipif_dbus_supv_mode && !rtu_yy_xx_dbgon;// | bmu_tcipif_dbus_acc_deny;
assign tcip_err = dbus_sel && dbus_err;

assign tcip_acc_deny       = dbus_sel & bmu_tcipif_dbus_acc_deny;

assign tcip_req_addr[31:0] = {32{dbus_sel}} & bmu_tcipif_dbus_addr[31:0];

assign tcip_req_write      = dbus_sel & bmu_tcipif_dbus_write;

assign tcip_req_size[1:0]  = {2{dbus_sel}} & bmu_tcipif_dbus_size[1:0];

//==========================================================
//  Addr Arb for IPs
//==========================================================

// &Force("input","pad_cpu_tcip_base"); @59
// &Force("bus","pad_cpu_tcip_base",31,0); @60
assign clint_sel  =  (tcip_req_addr[31:16] == {pad_cpu_tcip_base[31:28],12'h000});

assign clic_sel  =  (tcip_req_addr[31:16] == {pad_cpu_tcip_base[31:28], 12'h080});
assign tcip_cp0_clic_base[31:0] = {pad_cpu_tcip_base[31:28], 28'h0800000};

assign sysmap_sel     = (tcip_req_addr[31:12] == {pad_cpu_tcip_base[31:28],16'hffff});

assign dummy_addr_sel = !(clint_sel | clic_sel | sysmap_sel);

//==========================================================
//  error
//==========================================================

always @(posedge tcip_ctrl_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tcipif_acc_err <= 1'b0;
  else if(tcip_req_pre)
    tcipif_acc_err <= tcip_err;
  else if(tcipif_acc_err)
    tcipif_acc_err <= 1'b0;
end

always @(posedge tcip_ctrl_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    clint_sel_ff <= 1'b0;
  else if(tcip_req_pre)
    clint_sel_ff <= clint_sel;
  else if(clint_tcipif_cmplt)
    clint_sel_ff <= 1'b0;
end
assign clint_req_mask   = clint_sel_ff && !clint_tcipif_cmplt;
assign tcipif_clint_sel = clint_sel_ff && !tcipif_acc_err & !tcip_acc_deny_ff;

always @(posedge tcip_ctrl_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    clic_sel_ff <= 1'b0;
  else if(tcip_req_pre)
    clic_sel_ff <= clic_sel;
  else if(clic_tcipif_cmplt)
    clic_sel_ff <= 1'b0;
end

always @(posedge tcip_ctrl_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    clic_size_ff[1:0] <= 2'b0;
  else if(tcip_req_pre)
    clic_size_ff[1:0] <= tcip_req_size[1:0];
end
assign clic_req_mask   = clic_sel_ff && !clic_tcipif_cmplt;
assign tcipif_clic_sel = clic_sel_ff && !tcipif_acc_err && !tcip_acc_deny_ff;
assign tcipif_clic_size[1:0] = clic_size_ff[1:0];
// &Force("nonport", "tcip_req_size"); @126


always @(posedge tcip_ctrl_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sysmap_sel_ff   <= 1'b0;
  else if(tcip_req_pre)
    sysmap_sel_ff   <= sysmap_sel;
  else if(sysmap_tcipif_cmplt)
    sysmap_sel_ff   <= 1'b0;
end
assign sysmap_req_mask   = sysmap_sel_ff && !sysmap_tcipif_cmplt;
assign tcipif_sysmap_sel = sysmap_sel_ff & !tcipif_acc_err && !tcip_acc_deny_ff;

always @(posedge tcip_ctrl_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dummy_addr_cmplt <= 1'b0;
  else if(tcip_req_pre)
    dummy_addr_cmplt <= dummy_addr_sel;
  else if(dummy_addr_cmplt)
    dummy_addr_cmplt <= 1'b0;
end

assign tcip_req_mask  = clint_req_mask
                     || clic_req_mask
                     || sysmap_req_mask;


always @(posedge tcip_ctrl_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tcip_acc_deny_ff <= 1'b0;
  else if (tcip_req_pre)
    tcip_acc_deny_ff <= tcip_acc_deny;
  else if (tcip_acc_deny_ff)
    tcip_acc_deny_ff <= 1'b0;
end

//==========================================================
//  Addr, Wdata to IPs
//==========================================================
//addr and write en
always @(posedge tcip_dp_clk)
begin
  if(tcip_req_pre)
  begin
    tcipif_xx_write      <= tcip_req_write;
    tcipif_xx_addr[15:0] <= tcip_req_addr[15:0];
  end
end

assign tcipif_xx_wdata[31:0] = bmu_tcipif_dbus_wdata[31:0];

//==========================================================
//  Grant and Cmplt from IPs to BMU
//==========================================================
//grant to BMU

//cmplt to BMU
assign xx_tcipif_cmplt = clint_tcipif_cmplt
                       | clic_tcipif_cmplt
                       | sysmap_tcipif_cmplt;

assign tcipif_trans_cmplt =  xx_tcipif_cmplt
                          |  dummy_addr_cmplt
                          |  tcipif_acc_err
                          |  tcip_acc_deny_ff;

assign tcipif_rdata[31:0]   = {32{clint_tcipif_cmplt}}   & clint_tcipif_rdata[31:0]
                            | {32{clic_tcipif_cmplt}}    & clic_tcipif_rdata[31:0]
                            | {32{sysmap_tcipif_cmplt}}  & sysmap_tcipif_rdata[31:0];

assign tcipif_bmu_dbus_grnt        = dbus_sel;
assign tcipif_bmu_dbus_trans_cmplt = tcipif_trans_cmplt;
assign tcipif_bmu_dbus_acc_err     = tcipif_acc_err;
assign tcipif_bmu_dbus_data[31:0]  = tcipif_rdata[31:0];

assign tcip_ctrl_clk_en = tcip_req_gate | tcipif_trans_cmplt;
// &Instance("gated_clk_cell", "x_tcipif_dbus_ctrl_clk"); @240
gated_clk_cell  x_tcipif_dbus_ctrl_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (tcip_ctrl_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (tcip_ctrl_clk_en  ),
  .module_en          (cp0_biu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk     ), @241
//          .external_en (1'b0               ), @242
//          .global_en   (1'b1               ), @243
//          .module_en   (cp0_biu_icg_en     ), @244
//          .local_en    (tcip_ctrl_clk_en   ), @245
//          .clk_out     (tcip_ctrl_clk      ) @246
//         ); @247

// &Instance("gated_clk_cell", "x_tcipif_dbus_dp_clk"); @249
gated_clk_cell  x_tcipif_dbus_dp_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (tcip_dp_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (tcip_req_gate     ),
  .module_en          (cp0_biu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk     ), @250
//          .external_en (1'b0               ), @251
//          .global_en   (1'b1               ), @252
//          .module_en   (cp0_biu_icg_en     ), @253
//          .local_en    (tcip_req_gate      ), @254
//          .clk_out     (tcip_dp_clk        ) @255
//         ); @256


// &ModuleEnd; @266
endmodule


