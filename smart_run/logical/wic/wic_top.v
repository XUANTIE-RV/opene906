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


// &Depend("cpu_cfig.h"); @23
// &ModuleBeg; @24
module wic_top(
  ctl_xx_awake_enable,
  gpio_vic_int,
  intraw_vld,
  nmi_wake_int_higher,
  pad_cpu_rst_b,
  pad_vic_int_vld,
  pulse_int,
  stim_vic_int,
  tim1_vic_int,
  tim_vic_int,
  uart0_vic_int,
  wic_clk
);

// &Ports; @25
input   [31:0]  ctl_xx_awake_enable; 
input   [7 :0]  gpio_vic_int;       
input   [1 :0]  nmi_wake_int_higher; 
input           pad_cpu_rst_b;      
input           pulse_int;          
input   [3 :0]  stim_vic_int;       
input   [3 :0]  tim1_vic_int;       
input   [3 :0]  tim_vic_int;        
input           uart0_vic_int;      
input           wic_clk;            
output          intraw_vld;         
output  [31:0]  pad_vic_int_vld;    

// &Regs; @26
reg     [31:0]  arb_int_ack;        
reg     [31:0]  arb_int_ack_ff;     

// &Wires; @27
wire    [31:0]  arb_int_ack_clr;    
wire            ctim_int_vld;       
wire    [31:0]  ctl_xx_awake_enable; 
wire    [7 :0]  gpio_vic_int;       
wire    [4 :0]  int_ack_vec;        
wire    [31:0]  int_pending;        
wire            intraw_vld;         
wire    [1 :0]  nmi_wake_int_higher; 
wire            pad_cpu_rst_b;      
wire    [31:0]  pad_vic_int_cfg;    
wire    [31:0]  pad_vic_int_vld;    
wire    [31:0]  pad_wic_int_cfg;    
wire    [31:0]  pad_wic_int_vld;    
wire    [31:0]  pending_clr;        
wire            pulse_int;          
wire    [3 :0]  stim_vic_int;       
wire    [3 :0]  tim1_vic_int;       
wire    [3 :0]  tim_vic_int;        
wire            uart0_vic_int;      
wire            vec_int;            
wire    [31:0]  wic_awake_en;       
wire            wic_clk;            


// &Force("nonport","ctim_int_vld"); @30
// &Force("nonport","pad_vic_int_cfg"); @31
assign ctim_int_vld = 0;
// //&Force("bus", "biu_pad_psr", 31, 0); @34
// &Force("nonport","pad_wic_int_cfg"); @35
assign vec_int = 1'b0;
assign int_ack_vec[4:0] = 5'b0;

always @( int_ack_vec[4:0])
begin
  case(int_ack_vec[4:0])
    5'd0   : arb_int_ack[31:0] = 32'b00000000000000000000000000000001;
    5'd1   : arb_int_ack[31:0] = 32'b00000000000000000000000000000010;
    5'd2   : arb_int_ack[31:0] = 32'b00000000000000000000000000000100;
    5'd3   : arb_int_ack[31:0] = 32'b00000000000000000000000000001000;
    5'd4   : arb_int_ack[31:0] = 32'b00000000000000000000000000010000;
    5'd5   : arb_int_ack[31:0] = 32'b00000000000000000000000000100000;
    5'd6   : arb_int_ack[31:0] = 32'b00000000000000000000000001000000;
    5'd7   : arb_int_ack[31:0] = 32'b00000000000000000000000010000000;
    5'd8   : arb_int_ack[31:0] = 32'b00000000000000000000000100000000;
    5'd9   : arb_int_ack[31:0] = 32'b00000000000000000000001000000000;
    5'd10  : arb_int_ack[31:0] = 32'b00000000000000000000010000000000;
    5'd11  : arb_int_ack[31:0] = 32'b00000000000000000000100000000000;
    5'd12  : arb_int_ack[31:0] = 32'b00000000000000000001000000000000;
    5'd13  : arb_int_ack[31:0] = 32'b00000000000000000010000000000000;
    5'd14  : arb_int_ack[31:0] = 32'b00000000000000000100000000000000;
    5'd15  : arb_int_ack[31:0] = 32'b00000000000000001000000000000000;
    5'd16  : arb_int_ack[31:0] = 32'b00000000000000010000000000000000;
    5'd17  : arb_int_ack[31:0] = 32'b00000000000000100000000000000000;
    5'd18  : arb_int_ack[31:0] = 32'b00000000000001000000000000000000;
    5'd19  : arb_int_ack[31:0] = 32'b00000000000010000000000000000000;
    5'd20  : arb_int_ack[31:0] = 32'b00000000000100000000000000000000;
    5'd21  : arb_int_ack[31:0] = 32'b00000000001000000000000000000000;
    5'd22  : arb_int_ack[31:0] = 32'b00000000010000000000000000000000;
    5'd23  : arb_int_ack[31:0] = 32'b00000000100000000000000000000000;
    5'd24  : arb_int_ack[31:0] = 32'b00000001000000000000000000000000;
    5'd25  : arb_int_ack[31:0] = 32'b00000010000000000000000000000000;
    5'd26  : arb_int_ack[31:0] = 32'b00000100000000000000000000000000;
    5'd27  : arb_int_ack[31:0] = 32'b00001000000000000000000000000000;
    5'd28  : arb_int_ack[31:0] = 32'b00010000000000000000000000000000;
    5'd29  : arb_int_ack[31:0] = 32'b00100000000000000000000000000000;
    5'd30  : arb_int_ack[31:0] = 32'b01000000000000000000000000000000;
    5'd31  : arb_int_ack[31:0] = 32'b10000000000000000000000000000000;
    default: arb_int_ack[31:0] = 32'bx;
  endcase
end

assign arb_int_ack_clr[31:0] = vec_int ? arb_int_ack[31:0] : 32'b0;  

always@(posedge wic_clk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)
    arb_int_ack_ff[31:0] <= 32'b0;
  else
    arb_int_ack_ff[31:0] <= arb_int_ack_clr[31:0];
end



//     &Force("nonport", "arb_int_ack"); @92
//     &Force("nonport", "arb_int_ack_ff"); @93
  assign pending_clr[31:0] = arb_int_ack_clr[31:0] & ~arb_int_ack_ff[31:0];

//----------------------------------------------------------
// instantiate wic
//-------------------------------------------------------------------------

// &Force("nonport", "wic_awake_en"); @120
// &Force("nonport", "wic_awake_en"); @125
// &Instance("wic_awake_en_64", "x_wic_awake_en"); @130
// &Connect(.awake_enable   (vic_wic_awake_enable     ), @132
//          .awake_disable  (vic_wic_awake_disable    ), @133
//          .awake_data     (vic_wic_awake_data[63:0] ), @134
//          .int_exit       (vic_wic_int_exit[63:0]   ), @135
//          .pending_set    (vic_wic_pending_set[63:0]), @136
//          .pending_clr    (vic_wic_pending_clr[63:0]), @137
//          .int_vld        (pad_wic_int_vld[63:0]    ), @138
//          .int_cfg        (pad_wic_int_cfg[63:0]    ), @139
//          .wic_awake_en   (wic_awake_en[63:0]       ), @140
//          .int_pending    (int_pending[63:0]        ) @141
//          ); @142
// &Connect(.awake_enable   (1'b0                     ), @144
//          .awake_disable  (1'b0                     ), @145
//          .awake_data     (64'b0                    ), @146
//          .int_exit       (64'hffffffff_ffffffff    ), @147
//          .pending_set    (64'b0                    ), @148
//    //      .pending_clr    (32'b0                    ), @149
//          .int_vld        (pad_wic_int_vld[63:0]    ), @150
//          .int_cfg        (pad_wic_int_cfg[63:0]    ), @151
//          .wic_awake_en   (wic_awake_en[63:0]       ), @152
//          .int_pending    (int_pending[63:0]        ) @153
//          ); @154


assign pad_wic_int_vld[31:0] = {6'b0,tim1_vic_int[3:0],nmi_wake_int_higher[1:0],pulse_int,stim_vic_int[3:0],gpio_vic_int[7:0],1'b0,
                                tim_vic_int[3:0],ctim_int_vld,uart0_vic_int};
assign pad_wic_int_cfg[31:0] = {12'b0,1'b1,19'b0};

assign intraw_vld =|(int_pending[31:0] & ctl_xx_awake_enable[31:0]);
assign pad_vic_int_vld[31:0] = int_pending[31:0];
assign pad_vic_int_cfg[31:0] = 32'b0;
// &Force("nonport", "wic_awake_en"); @172


// &Instance("wic_awake_en_32", "x_wic_awake_en"); @176
wic_awake_en_32  x_wic_awake_en (
  .awake_data            (32'b0                ),
  .awake_disable         (1'b0                 ),
  .awake_enable          (1'b0                 ),
  .int_cfg               (pad_wic_int_cfg[31:0]),
  .int_exit              (32'hffffffff         ),
  .int_pending           (int_pending[31:0]    ),
  .int_vld               (pad_wic_int_vld[31:0]),
  .pad_cpu_rst_b         (pad_cpu_rst_b        ),
  .pending_clr           (pending_clr          ),
  .wic_awake_en          (wic_awake_en[31:0]   ),
  .wic_clk               (wic_clk              )
);

// &Connect(.awake_enable   (vic_wic_awake_enable     ), @178
//          .awake_disable  (vic_wic_awake_disable    ), @179
//          .awake_data     (vic_wic_awake_data[31:0] ), @180
//          .int_exit       (vic_wic_int_exit[31:0]   ), @181
//          .pending_set    (vic_wic_pending_set[31:0]), @182
//          .pending_clr    (vic_wic_pending_clr[31:0]), @183
//          .int_vld        (pad_wic_int_vld[31:0]    ), @184
//          .int_cfg        (pad_wic_int_cfg[31:0]    ), @185
//          .wic_awake_en   (wic_awake_en[31:0]       ), @186
//          .int_pending    (int_pending[31:0]        ) @187
//          ); @188
// &Connect(.awake_enable   (1'b0                     ), @190
//          .awake_disable  (1'b0                     ), @191
//          .awake_data     (32'b0                    ), @192
//          .int_exit       (32'hffffffff             ), @193
//          .pending_set    (32'b0                    ), @194
//    //      .pending_clr    (32'b0                    ), @195
//          .int_vld        (pad_wic_int_vld[31:0]    ), @196
//          .int_cfg        (pad_wic_int_cfg[31:0]    ), @197
//          .wic_awake_en   (wic_awake_en[31:0]       ), @198
//          .int_pending    (int_pending[31:0]        ) @199
//          ); @200

// &Force("nonport", "wic_awake_en"); @217
// &Instance("wic_awake_en_16", "x_wic_awake_en"); @221
// &Connect(.awake_enable   (vic_wic_awake_enable     ), @223
//          .awake_disable  (vic_wic_awake_disable    ), @224
//          .awake_data     (vic_wic_awake_data[15:0] ), @225
//          .int_exit       (vic_wic_int_exit[15:0]   ), @226
//          .pending_set    (vic_wic_pending_set[15:0]), @227
//          .pending_clr    (vic_wic_pending_clr[15:0]), @228
//          .int_vld        (pad_wic_int_vld[15:0]    ), @229
//          .int_cfg        (pad_wic_int_cfg[15:0]    ), @230
//          .wic_awake_en   (wic_awake_en[15:0]       ), @231
//          .int_pending    (int_pending[15:0]        ) @232
//          ); @233
// &Connect(.awake_enable   (1'b0                     ), @235
//          .awake_disable  (1'b0                     ), @236
//          .awake_data     (16'b0                    ), @237
//          .int_exit       (16'hffff                 ), @238
//          .pending_set    (16'b0                    ), @239
//    //      .pending_clr    (32'b0                    ), @240
//          .int_vld        (pad_wic_int_vld[15:0]    ), @241
//          .int_cfg        (pad_wic_int_cfg[15:0]    ), @242
//          .wic_awake_en   (wic_awake_en[15:0]       ), @243
//          .int_pending    (int_pending[15:0]        ) @244
//          ); @245

// &Force("nonport", "wic_awake_en"); @263
// &Instance("wic_awake_en_8", "x_wic_awake_en"); @267
// &Connect(.awake_enable   (vic_wic_awake_enable     ), @269
//          .awake_disable  (vic_wic_awake_disable    ), @270
//          .awake_data     (vic_wic_awake_data[7:0] ), @271
//          .int_exit       (vic_wic_int_exit[7:0]   ), @272
//          .pending_set    (vic_wic_pending_set[7:0]), @273
//          .pending_clr    (vic_wic_pending_clr[7:0]), @274
//          .int_vld        (pad_wic_int_vld[7:0]    ), @275
//          .int_cfg        (pad_wic_int_cfg[7:0]    ), @276
//          .wic_awake_en   (wic_awake_en[7:0]       ), @277
//          .int_pending    (int_pending[7:0]        ) @278
//          ); @279
// &Connect(.awake_enable   (1'b0                     ), @281
//          .awake_disable  (1'b0                     ), @282
//          .awake_data     (8'b0                    ), @283
//          .int_exit       (8'hff                   ), @284
//          .pending_set    (8'b0                    ), @285
//    //      .pending_clr    (32'b0                    ), @286
//          .int_vld        (pad_wic_int_vld[7:0]    ), @287
//          .int_cfg        (pad_wic_int_cfg[7:0]    ), @288
//          .wic_awake_en   (wic_awake_en[7:0]       ), @289
//          .int_pending    (int_pending[7:0]        ) @290
//          ); @291

// &ModuleEnd; @295
endmodule












