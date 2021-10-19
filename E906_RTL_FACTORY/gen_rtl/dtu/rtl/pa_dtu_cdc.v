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

// &ModuleBeg; @23
module pa_dtu_cdc(
  async_halt_req_wakeup,
  cp0_yy_clk_en,
  cpurst_b,
  dscratch0,
  dtu_ifu_debug_inst,
  dtu_ifu_debug_inst_vld,
  dtu_ifu_halt_on_reset,
  dtu_rtu_async_halt_req,
  dtu_rtu_resume_req,
  dtu_rtu_sync_halt_req,
  dtu_tdt_dm_halted,
  dtu_tdt_dm_havereset,
  dtu_tdt_dm_itr_done,
  dtu_tdt_dm_retire_debug_expt_vld,
  dtu_tdt_dm_rx_data,
  dtu_tdt_dm_wr_ready,
  forever_cpuclk,
  latest_pc,
  pad_yy_icg_scan_en,
  rtu_dtu_retire_debug_expt_vld,
  rtu_dtu_retire_vld,
  rtu_yy_xx_dbgon,
  sys_apb_clk,
  sys_apb_rst_b,
  tdt_dm_dtu_ack_havereset,
  tdt_dm_dtu_async_halt_req,
  tdt_dm_dtu_halt_on_reset,
  tdt_dm_dtu_halt_req,
  tdt_dm_dtu_itr,
  tdt_dm_dtu_itr_vld,
  tdt_dm_dtu_resume_req,
  tdt_dm_dtu_wdata,
  tdt_dm_dtu_wr_flg,
  tdt_dm_dtu_wr_vld,
  tdt_dm_wdata,
  tdt_dm_wr_flg,
  tdt_dm_wr_vld
);

// &Ports; @24
input           cp0_yy_clk_en;                   
input           cpurst_b;                        
input   [31:0]  dscratch0;                       
input           forever_cpuclk;                  
input   [31:0]  latest_pc;                       
input           pad_yy_icg_scan_en;              
input           rtu_dtu_retire_debug_expt_vld;   
input           rtu_dtu_retire_vld;              
input           rtu_yy_xx_dbgon;                 
input           sys_apb_clk;                     
input           sys_apb_rst_b;                   
input           tdt_dm_dtu_ack_havereset;        
input           tdt_dm_dtu_async_halt_req;       
input           tdt_dm_dtu_halt_on_reset;        
input           tdt_dm_dtu_halt_req;             
input   [31:0]  tdt_dm_dtu_itr;                  
input           tdt_dm_dtu_itr_vld;              
input           tdt_dm_dtu_resume_req;           
input   [31:0]  tdt_dm_dtu_wdata;                
input   [1 :0]  tdt_dm_dtu_wr_flg;               
input           tdt_dm_dtu_wr_vld;               
output          async_halt_req_wakeup;           
output  [31:0]  dtu_ifu_debug_inst;              
output          dtu_ifu_debug_inst_vld;          
output          dtu_ifu_halt_on_reset;           
output          dtu_rtu_async_halt_req;          
output          dtu_rtu_resume_req;              
output          dtu_rtu_sync_halt_req;           
output          dtu_tdt_dm_halted;               
output          dtu_tdt_dm_havereset;            
output          dtu_tdt_dm_itr_done;             
output          dtu_tdt_dm_retire_debug_expt_vld; 
output  [31:0]  dtu_tdt_dm_rx_data;              
output          dtu_tdt_dm_wr_ready;             
output  [31:0]  tdt_dm_wdata;                    
output  [1 :0]  tdt_dm_wr_flg;                   
output          tdt_dm_wr_vld;                   

// &Regs; @25
reg     [1 :0]  cur_state;                       
reg             debug_inst_vld_pulse_f;          
reg     [31:0]  dm_rdata;                        
reg     [31:0]  dm_rdata_reg;                    
reg             dtu_havereset;                   
reg             dtu_rtu_async_halt_req_lvl_f;    
reg             dtu_rtu_async_halt_req_lvl_ff;   
reg             dtu_tdt_dm_wr_ready;             
reg     [31:0]  itr_reg;                         
reg     [1 :0]  next_state;                      
reg             rtu_yy_xx_dbgon_reg;             
reg     [31:0]  rx_data;                         
reg     [31:0]  tdt_dm_wdata;                    
reg     [1 :0]  tdt_dm_wr_flg;                   
reg             tdt_dm_wr_vld_f;                 
reg             tdt_dm_wr_vld_pulse_f;           

// &Wires; @26
wire            async_halt_req_wakeup;           
wire            cp0_yy_clk_en;                   
wire            cpurst_b;                        
wire            debug_inst_vld_pulse;            
wire    [31:0]  dscratch0;                       
wire            dtu_cdc_clk;                     
wire    [31:0]  dtu_ifu_debug_inst;              
wire            dtu_ifu_debug_inst_vld;          
wire            dtu_ifu_halt_on_reset;           
wire            dtu_rtu_async_halt_req;          
wire            dtu_rtu_async_halt_req_lvl;      
wire            dtu_rtu_resume_req;              
wire            dtu_rtu_sync_halt_req;           
wire            dtu_tdt_dm_halted;               
wire            dtu_tdt_dm_havereset;            
wire            dtu_tdt_dm_itr_done;             
wire            dtu_tdt_dm_retire_debug_expt_vld; 
wire    [31:0]  dtu_tdt_dm_rx_data;              
wire            dtu_tdt_dm_wr_ready_pulse;       
wire            forever_cpuclk;                  
wire    [31:0]  latest_pc;                       
wire    [31:0]  latest_pc_for_dm;                
wire            pad_yy_icg_scan_en;              
wire            rtu_dtu_retire_debug_expt_vld;   
wire            rtu_dtu_retire_vld;              
wire            rtu_dtu_retire_vld_dbgon;        
wire            rtu_yy_xx_dbgon;                 
wire            sys_apb_clk;                     
wire            sys_apb_rst_b;                   
wire            tdt_dm_ack_havereset;            
wire            tdt_dm_dtu_ack_havereset;        
wire            tdt_dm_dtu_async_halt_req;       
wire            tdt_dm_dtu_halt_on_reset;        
wire            tdt_dm_dtu_halt_req;             
wire    [31:0]  tdt_dm_dtu_itr;                  
wire            tdt_dm_dtu_itr_vld;              
wire            tdt_dm_dtu_resume_req;           
wire    [31:0]  tdt_dm_dtu_wdata;                
wire    [1 :0]  tdt_dm_dtu_wr_flg;               
wire            tdt_dm_dtu_wr_vld;               
wire            tdt_dm_wr_vld;                   
wire            tdt_dm_wr_vld_pulse;             


//XLEN
parameter XLEN = `TDT_DM_CORE_MAX_XLEN;

//state machine parameter
parameter IDLE       = 2'b00;
parameter PULSE      = 2'b01;
parameter HAVE_RESET = 2'b10;
parameter PENDING    = 2'b11;

//===============================================================
//                 CDC of DM to DTU 
//===============================================================
//tdt_dm_dtu_halt_req to dtu_rtu_sync_halt_req
// &Instance("pa_dtu_cdc_lvl","x_pa_tdt_dm_dtu_halt_req_cdc"); @42
pa_dtu_cdc_lvl  x_pa_tdt_dm_dtu_halt_req_cdc (
  .clk                   (forever_cpuclk       ),
  .dst_lvl               (dtu_rtu_sync_halt_req),
  .rst_b                 (cpurst_b             ),
  .src_lvl               (tdt_dm_dtu_halt_req  )
);

// &Connect(.clk      (forever_cpuclk), @43
//          .rst_b    (cpurst_b), @44
//          .src_lvl  (tdt_dm_dtu_halt_req), @45
//          .dst_lvl  (dtu_rtu_sync_halt_req)); @46

//tdt_dm_dtu_async_halt_req to dtu_rtu_async_halt_req
// &Instance("pa_dtu_cdc_lvl","x_pa_tdt_dm_dtu_async_halt_req_cdc"); @49
pa_dtu_cdc_lvl  x_pa_tdt_dm_dtu_async_halt_req_cdc (
  .clk                        (forever_cpuclk            ),
  .dst_lvl                    (dtu_rtu_async_halt_req_lvl),
  .rst_b                      (cpurst_b                  ),
  .src_lvl                    (tdt_dm_dtu_async_halt_req )
);

// &Connect(.clk      (forever_cpuclk), @50
//          .rst_b    (cpurst_b), @51
//          .src_lvl  (tdt_dm_dtu_async_halt_req), @52
//          .dst_lvl  (dtu_rtu_async_halt_req_lvl)); @53

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      dtu_rtu_async_halt_req_lvl_f  <= 1'b0;
      dtu_rtu_async_halt_req_lvl_ff <= 1'b0;
    end
  else
    begin
      dtu_rtu_async_halt_req_lvl_f  <= dtu_rtu_async_halt_req_lvl;
      dtu_rtu_async_halt_req_lvl_ff <= dtu_rtu_async_halt_req_lvl_f;
    end
end

assign async_halt_req_wakeup  = dtu_rtu_async_halt_req_lvl && !dtu_rtu_async_halt_req_lvl_f;
assign dtu_rtu_async_halt_req = dtu_rtu_async_halt_req_lvl_f && !dtu_rtu_async_halt_req_lvl_ff;

//tdt_dm_dtu_halt_on_reset to dtu_ifu_halt_on_reset
// &Instance("pa_dtu_cdc_lvl","x_pa_tdt_dm_dtu_halt_on_reset_cdc"); @73
pa_dtu_cdc_lvl  x_pa_tdt_dm_dtu_halt_on_reset_cdc (
  .clk                      (dtu_cdc_clk             ),
  .dst_lvl                  (dtu_ifu_halt_on_reset   ),
  .rst_b                    (cpurst_b                ),
  .src_lvl                  (tdt_dm_dtu_halt_on_reset)
);

// &Connect(.clk      (dtu_cdc_clk), @74
//          .rst_b    (cpurst_b), @75
//          .src_lvl  (tdt_dm_dtu_halt_on_reset), @76
//          .dst_lvl  (dtu_ifu_halt_on_reset)); @77

//tdt_dm_dtu_resume_req(pulse) to dtu_rtu_resume_req(pulse)
// &Instance("pa_dtu_cdc_pulse","x_pa_dtu_rtu_resume_req_cdc"); @80
pa_dtu_cdc_pulse  x_pa_dtu_rtu_resume_req_cdc (
  .dst_clk               (dtu_cdc_clk          ),
  .dst_pulse             (dtu_rtu_resume_req   ),
  .dst_rst_b             (cpurst_b             ),
  .src_clk               (sys_apb_clk          ),
  .src_pulse             (tdt_dm_dtu_resume_req),
  .src_rst_b             (sys_apb_rst_b        )
);

// &Connect(.src_clk (sys_apb_clk), @81
//          .src_rst_b (sys_apb_rst_b), @82
//          .dst_clk(dtu_cdc_clk), @83
//          .dst_rst_b(cpurst_b), @84
//          .src_pulse(tdt_dm_dtu_resume_req), @85
//          .dst_pulse(dtu_rtu_resume_req)); @86

//tdt_dm_dtu_ack_havereset(pulse) to tdt_dm_ack_havereset(pulse)
// &Instance("pa_dtu_cdc_pulse","x_pa_tdt_dm_dtu_ack_havereset_cdc"); @89
pa_dtu_cdc_pulse  x_pa_tdt_dm_dtu_ack_havereset_cdc (
  .dst_clk                  (dtu_cdc_clk             ),
  .dst_pulse                (tdt_dm_ack_havereset    ),
  .dst_rst_b                (cpurst_b                ),
  .src_clk                  (sys_apb_clk             ),
  .src_pulse                (tdt_dm_dtu_ack_havereset),
  .src_rst_b                (sys_apb_rst_b           )
);

// &Connect(.src_clk (sys_apb_clk), @90
//          .src_rst_b (sys_apb_rst_b), @91
//          .dst_clk(dtu_cdc_clk), @92
//          .dst_rst_b(cpurst_b), @93
//          .src_pulse(tdt_dm_dtu_ack_havereset), @94
//          .dst_pulse(tdt_dm_ack_havereset)); @95

//tdt_dm_dtu_itr_vld(pulse) to dtu_ifu_debug_inst_vld(pulse)
//tdt_dm_dtu_itr(32 bit) to dtu_ifu_debug_inst(32 bit)
// &Instance("pa_dtu_cdc_pulse","x_pa_tdt_dm_dtu_itr_vld_cdc"); @99
pa_dtu_cdc_pulse  x_pa_tdt_dm_dtu_itr_vld_cdc (
  .dst_clk              (dtu_cdc_clk         ),
  .dst_pulse            (debug_inst_vld_pulse),
  .dst_rst_b            (cpurst_b            ),
  .src_clk              (sys_apb_clk         ),
  .src_pulse            (tdt_dm_dtu_itr_vld  ),
  .src_rst_b            (sys_apb_rst_b       )
);

// &Connect(.src_clk (sys_apb_clk), @100
//          .src_rst_b (sys_apb_rst_b), @101
//          .dst_clk(dtu_cdc_clk), @102
//          .dst_rst_b(cpurst_b), @103
//          .src_pulse(tdt_dm_dtu_itr_vld), @104
//          .dst_pulse(debug_inst_vld_pulse)); @105

always @(posedge dtu_cdc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    debug_inst_vld_pulse_f <= 1'b0;
  else
    debug_inst_vld_pulse_f <= debug_inst_vld_pulse;
end
assign dtu_ifu_debug_inst_vld = debug_inst_vld_pulse_f;

always @(posedge dtu_cdc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    itr_reg[31:0] <= 32'b0;
  else if(debug_inst_vld_pulse)
    itr_reg[31:0] <= tdt_dm_dtu_itr[31:0];
end
assign dtu_ifu_debug_inst[31:0] = itr_reg[31:0];

//tdt_dm_dtu_wr_vld
//tdt_dm_dtu_wr_flg
//tdt_dm_dtu_wdata
// &Instance("pa_dtu_cdc_pulse","x_pa_tdt_dm_dtu_wr_vld_cdc"); @128
pa_dtu_cdc_pulse  x_pa_tdt_dm_dtu_wr_vld_cdc (
  .dst_clk             (dtu_cdc_clk        ),
  .dst_pulse           (tdt_dm_wr_vld_pulse),
  .dst_rst_b           (cpurst_b           ),
  .src_clk             (sys_apb_clk        ),
  .src_pulse           (tdt_dm_dtu_wr_vld  ),
  .src_rst_b           (sys_apb_rst_b      )
);

// &Connect(.src_clk (sys_apb_clk), @129
//          .src_rst_b (sys_apb_rst_b), @130
//          .dst_clk(dtu_cdc_clk), @131
//          .dst_rst_b(cpurst_b), @132
//          .src_pulse(tdt_dm_dtu_wr_vld), @133
//          .dst_pulse(tdt_dm_wr_vld_pulse)); @134

always @(posedge dtu_cdc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tdt_dm_wr_vld_pulse_f <= 1'b0;
  else
    tdt_dm_wr_vld_pulse_f <= tdt_dm_wr_vld_pulse;
end
assign tdt_dm_wr_vld = tdt_dm_wr_vld_pulse_f;
// &Force("output","tdt_dm_wr_vld"); @144
//when cpuclk = abp_clk, dtu_tdt_dm_wr_ready need wait dtu_tdt_dm_rx_data for a cycle
always @(posedge dtu_cdc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tdt_dm_wr_vld_f <= 1'b0;
  else
    tdt_dm_wr_vld_f <= tdt_dm_wr_vld;
end

always @(posedge dtu_cdc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tdt_dm_wr_flg[1:0] <= 2'b0;
  else if(tdt_dm_wr_vld_pulse)
    tdt_dm_wr_flg[1:0] <= tdt_dm_dtu_wr_flg[1:0];
end
// &Force("output","tdt_dm_wr_flg");&Force("bus","tdt_dm_wr_flg",1,0); @161

always @(posedge dtu_cdc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tdt_dm_wdata[XLEN-1:0] <= {XLEN{1'b0}};
  else if(tdt_dm_wr_vld_pulse)
    tdt_dm_wdata[XLEN-1:0] <= tdt_dm_dtu_wdata[XLEN-1:0];
end

//sample last_pc_for_dm
assign latest_pc_for_dm[`PA_WIDTH-1:0] = latest_pc[`PA_WIDTH-1:0];

//read data for dm
// &CombBeg; @179
always @( dscratch0[31:0]
       or latest_pc_for_dm[31:0]
       or tdt_dm_wr_flg[1:0])
begin
case(tdt_dm_wr_flg[1:0])
  2'b00:dm_rdata[XLEN-1:0] = dscratch0[XLEN-1:0];
  2'b01:dm_rdata[XLEN-1:0] = {XLEN{1'b0}};
  2'b10:dm_rdata[XLEN-1:0] = latest_pc_for_dm[`PA_WIDTH-1:0];
  2'b11:dm_rdata[XLEN-1:0] = {XLEN{1'b0}};
  default:dm_rdata[XLEN-1:0] = {XLEN{1'bx}};
endcase
// &CombEnd; @187
end
always @(posedge dtu_cdc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dm_rdata_reg[XLEN-1:0] <= {XLEN{1'b0}};
  else if(tdt_dm_wr_vld)
    dm_rdata_reg[XLEN-1:0] <= dm_rdata[XLEN-1:0];
end

 //===============================================================
//                 CDC of DTU to DM 
//================================================================
//rtu_yy_xx_dbgon to dtu_tdt_dm_halted
always @(posedge dtu_cdc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_yy_xx_dbgon_reg <= 1'b0;
  else
    rtu_yy_xx_dbgon_reg <= rtu_yy_xx_dbgon;
end
// &Instance("pa_dtu_cdc_lvl","x_pa_dtu_tdt_dm_halted_cdc"); @207
pa_dtu_cdc_lvl  x_pa_dtu_tdt_dm_halted_cdc (
  .clk                 (sys_apb_clk        ),
  .dst_lvl             (dtu_tdt_dm_halted  ),
  .rst_b               (sys_apb_rst_b      ),
  .src_lvl             (rtu_yy_xx_dbgon_reg)
);

// &Connect(.clk      (sys_apb_clk), @208
//          .rst_b    (sys_apb_rst_b), @209
//          .src_lvl  (rtu_yy_xx_dbgon_reg), @210
//          .dst_lvl  (dtu_tdt_dm_halted)); @211

//rtu_dtu_retire_vld(pluse) to dtu_tdt_dm_itr_done(pluse)
assign rtu_dtu_retire_vld_dbgon = rtu_dtu_retire_vld && rtu_yy_xx_dbgon;
// &Instance("pa_dtu_cdc_pulse","x_pa_dtu_tdt_dm_itr_done_cdc"); @215
pa_dtu_cdc_pulse  x_pa_dtu_tdt_dm_itr_done_cdc (
  .dst_clk                  (sys_apb_clk             ),
  .dst_pulse                (dtu_tdt_dm_itr_done     ),
  .dst_rst_b                (sys_apb_rst_b           ),
  .src_clk                  (dtu_cdc_clk             ),
  .src_pulse                (rtu_dtu_retire_vld_dbgon),
  .src_rst_b                (cpurst_b                )
);

// &Connect(.src_clk (dtu_cdc_clk), @216
//          .src_rst_b (cpurst_b), @217
//          .dst_clk(sys_apb_clk), @218
//          .dst_rst_b(sys_apb_rst_b), @219
//          .src_pulse(rtu_dtu_retire_vld_dbgon), @220
//          .dst_pulse(dtu_tdt_dm_itr_done)); @221

//rtu_dtu_retire_debug_expt_vld(pulse) to dtu_tdt_dm_retire_debug_expt_vld(pulse)
// &Instance("pa_dtu_cdc_pulse","x_pa_dtu_tdt_dm_retire_debug_expt_vld_cdc"); @224
pa_dtu_cdc_pulse  x_pa_dtu_tdt_dm_retire_debug_expt_vld_cdc (
  .dst_clk                          (sys_apb_clk                     ),
  .dst_pulse                        (dtu_tdt_dm_retire_debug_expt_vld),
  .dst_rst_b                        (sys_apb_rst_b                   ),
  .src_clk                          (dtu_cdc_clk                     ),
  .src_pulse                        (rtu_dtu_retire_debug_expt_vld   ),
  .src_rst_b                        (cpurst_b                        )
);

// &Connect(.src_clk (dtu_cdc_clk), @225
//          .src_rst_b (cpurst_b), @226
//          .dst_clk(sys_apb_clk), @227
//          .dst_rst_b(sys_apb_rst_b), @228
//          .src_pulse(rtu_dtu_retire_debug_expt_vld), @229
//          .dst_pulse(dtu_tdt_dm_retire_debug_expt_vld)); @230

//dtu_tdt_dm_wr_ready
//dtu_tdt_dm_Rx_data
// &Instance("pa_dtu_cdc_pulse","x_pa_dtu_tdt_dm_wr_ready_cdc"); @234
pa_dtu_cdc_pulse  x_pa_dtu_tdt_dm_wr_ready_cdc (
  .dst_clk                   (sys_apb_clk              ),
  .dst_pulse                 (dtu_tdt_dm_wr_ready_pulse),
  .dst_rst_b                 (sys_apb_rst_b            ),
  .src_clk                   (dtu_cdc_clk              ),
  .src_pulse                 (tdt_dm_wr_vld_f          ),
  .src_rst_b                 (cpurst_b                 )
);

// &Connect(.src_clk (dtu_cdc_clk), @235
//          .src_rst_b (cpurst_b), @236
//          .dst_clk(sys_apb_clk), @237
//          .dst_rst_b(sys_apb_rst_b), @238
//          .src_pulse(tdt_dm_wr_vld_f), @239
//          .dst_pulse(dtu_tdt_dm_wr_ready_pulse)); @240

always @(posedge sys_apb_clk or negedge sys_apb_rst_b)
begin
  if(!sys_apb_rst_b)
    dtu_tdt_dm_wr_ready <= 1'b0;
  else
    dtu_tdt_dm_wr_ready <= dtu_tdt_dm_wr_ready_pulse;
end

always @(posedge sys_apb_clk or negedge sys_apb_rst_b)
begin
  if(!sys_apb_rst_b)
    rx_data[XLEN-1:0] <= {XLEN{1'b0}};
  else if(dtu_tdt_dm_wr_ready_pulse)
    rx_data[XLEN-1:0] <= dm_rdata_reg[XLEN-1:0];
end
assign dtu_tdt_dm_rx_data[XLEN-1:0] = rx_data[XLEN-1:0];

//generate dtu_tdt_dm_havereset(lvl) when cpurst_b switch to 1
always @(posedge dtu_cdc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    cur_state[1:0] <= IDLE;
  else
    cur_state[1:0] <= next_state[1:0];
end

// &CombBeg; @268
always @( cur_state[1:0]
       or tdt_dm_ack_havereset)
begin
  case(cur_state[1:0])
    IDLE:        next_state[1:0]   = PULSE;
    PULSE:       next_state[1:0]   = HAVE_RESET;
    HAVE_RESET:  if(tdt_dm_ack_havereset)
                   next_state[1:0] = PENDING;
                 else
                   next_state[1:0] = HAVE_RESET;
    PENDING:     next_state[1:0]   = PENDING;
    default:     next_state[1:0]   = IDLE;
  endcase
// &CombEnd; @279
end

always @(posedge dtu_cdc_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dtu_havereset <= 1'b0;
  else
    dtu_havereset <= cur_state[1:0] == HAVE_RESET;
end

// &Instance("pa_dtu_cdc_lvl","x_pa_dtu_tdt_dm_havereset_cdc"); @289
pa_dtu_cdc_lvl  x_pa_dtu_tdt_dm_havereset_cdc (
  .clk                  (sys_apb_clk         ),
  .dst_lvl              (dtu_tdt_dm_havereset),
  .rst_b                (sys_apb_rst_b       ),
  .src_lvl              (dtu_havereset       )
);

// &Connect(.clk      (sys_apb_clk), @290
//          .rst_b    (sys_apb_rst_b), @291
//          .src_lvl  (dtu_havereset), @292
//          .dst_lvl  (dtu_tdt_dm_havereset)); @293

// &Force("output","dtu_rtu_resume_req"); @349
// &Force("output","dtu_ifu_debug_inst_vld"); @373
// &Force("output","tdt_dm_wr_vld"); @395
// &Force("output","tdt_dm_wr_flg");&Force("bus","tdt_dm_wr_flg",1,0); @412
// &CombBeg; @430
// &CombEnd; @438
// &Instance("pa_dtu_cdc_pulse_div_fast_to_slow","x_pa_dtu_tdt_dm_itr_done_cdc"); @467
// &Connect(.src_clk (dtu_cdc_clk), @468
//          .src_rst_b (cpurst_b), @469
//          .clk_en(sys_apb_clk_en), @470
//          .modify(itr_done_modify), @471
//          .src_pulse(rtu_dtu_retire_vld_dbgon), @472
//          .dst_pulse(dtu_tdt_dm_itr_done)); @473
// &Force("nonport","itr_done_modify"); @474
// &Instance("pa_dtu_cdc_pulse_div_fast_to_slow","x_pa_dtu_tdt_dm_retire_debug_expt_vld_cdc"); @477
// &Connect(.src_clk (dtu_cdc_clk), @478
//          .src_rst_b (cpurst_b), @479
//          .clk_en(sys_apb_clk_en), @480
//          .modify(retire_debug_expt_vld_modify), @481
//          .src_pulse(rtu_dtu_retire_debug_expt_vld), @482
//          .dst_pulse(dtu_tdt_dm_retire_debug_expt_vld)); @483
// &Force("nonport","retire_debug_expt_vld_modify"); @484
// &Instance("pa_dtu_cdc_pulse_div_fast_to_slow","x_pa_dtu_tdt_dm_wr_ready_cdc"); @488
// &Connect(.src_clk (dtu_cdc_clk), @489
//          .src_rst_b (cpurst_b), @490
//          .clk_en(sys_apb_clk_en), @491
//          .modify(wr_ready_modify), @492
//          .src_pulse(tdt_dm_wr_vld_f), @493
//          .dst_pulse(dtu_tdt_dm_wr_ready)); @494
// &CombBeg; @514
// &CombEnd; @525

// &Instance("gated_clk_cell", "x_reg_gated_clk"); @544
gated_clk_cell  x_reg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dtu_cdc_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (1'b1              ),
  .module_en          (1'b1              ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @545
//          .external_en (1'b0), @546
//          .global_en   (cp0_yy_clk_en), @547
//          //.module_en   (cp0_dtu_icg_en), @548
//          .module_en   (1'b1), @549
//          .local_en    (1'b1), @550
//          .clk_out     (dtu_cdc_clk)); @551

  
// &ModuleEnd; @560
endmodule


