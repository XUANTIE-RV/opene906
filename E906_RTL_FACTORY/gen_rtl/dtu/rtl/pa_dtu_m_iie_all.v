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
module pa_dtu_m_iie_all(
  cp0_dtu_icg_en,
  cp0_dtu_mexpt_vld,
  cp0_dtu_wdata,
  cp0_write_mcontext,
  cp0_write_tcontrol,
  cp0_write_tdata1,
  cp0_write_tdata2,
  cp0_write_tdata3,
  cp0_write_tselect,
  cp0_yy_clk_en,
  cpurst_b,
  dtu_cause,
  dtu_ifu_halt_info0,
  dtu_ifu_halt_info1,
  dtu_ifu_halt_info_vld,
  dtu_lsu_halt_info,
  dtu_lsu_halt_info_vld,
  exe0_16bit,
  exe0_32bit,
  exe1_16bit,
  exe1_32bit,
  forever_cpuclk,
  icount_enable,
  ifu_dtu_addr_vld0,
  ifu_dtu_addr_vld1,
  ifu_dtu_data_vld0,
  ifu_dtu_data_vld1,
  ifu_dtu_exe_addr0,
  ifu_dtu_exe_addr1,
  ldst_16bit,
  ldst_32bit,
  ldst_8bit,
  ldst_addr_mcontrol,
  ldst_data_mcontrol,
  load_addr_vld,
  load_data_vld,
  lsu_dtu_halt_info,
  lsu_dtu_last_check,
  lsu_dtu_ldst_addr,
  lsu_dtu_ldst_addr_vld,
  lsu_dtu_ldst_bytes_vld,
  lsu_dtu_ldst_data,
  lsu_dtu_ldst_data_vld,
  m_mode,
  mcontext,
  pad_yy_icg_scan_en,
  pending_halt,
  rtu_dtu_halt_ack,
  rtu_dtu_pending_ack,
  rtu_dtu_retire_halt_info,
  rtu_dtu_retire_mret,
  rtu_dtu_retire_vld,
  rtu_yy_xx_dbgon,
  store_addr_vld,
  store_data_vld,
  tcontrol,
  tdata1,
  tdata2,
  tdata3,
  tinfo,
  tselect,
  u_mode,
  updata_tval
);

// &Ports; @24
input           cp0_dtu_icg_en;               
input           cp0_dtu_mexpt_vld;            
input   [31:0]  cp0_dtu_wdata;                
input           cp0_write_mcontext;           
input           cp0_write_tcontrol;           
input           cp0_write_tdata1;             
input           cp0_write_tdata2;             
input           cp0_write_tdata3;             
input           cp0_write_tselect;            
input           cp0_yy_clk_en;                
input           cpurst_b;                     
input           exe0_16bit;                   
input           exe0_32bit;                   
input           exe1_16bit;                   
input           exe1_32bit;                   
input           forever_cpuclk;               
input           ifu_dtu_addr_vld0;            
input           ifu_dtu_addr_vld1;            
input           ifu_dtu_data_vld0;            
input           ifu_dtu_data_vld1;            
input   [31:0]  ifu_dtu_exe_addr0;            
input   [31:0]  ifu_dtu_exe_addr1;            
input           ldst_16bit;                   
input           ldst_32bit;                   
input           ldst_8bit;                    
input           load_addr_vld;                
input           load_data_vld;                
input   [14:0]  lsu_dtu_halt_info;            
input           lsu_dtu_last_check;           
input   [31:0]  lsu_dtu_ldst_addr;            
input           lsu_dtu_ldst_addr_vld;        
input   [7 :0]  lsu_dtu_ldst_bytes_vld;       
input   [31:0]  lsu_dtu_ldst_data;            
input           lsu_dtu_ldst_data_vld;        
input           m_mode;                       
input           pad_yy_icg_scan_en;           
input           rtu_dtu_halt_ack;             
input           rtu_dtu_pending_ack;          
input   [14:0]  rtu_dtu_retire_halt_info;     
input           rtu_dtu_retire_mret;          
input           rtu_dtu_retire_vld;           
input           rtu_yy_xx_dbgon;              
input           store_addr_vld;               
input           store_data_vld;               
input           u_mode;                       
output  [3 :0]  dtu_cause;                    
output  [14:0]  dtu_ifu_halt_info0;           
output  [14:0]  dtu_ifu_halt_info1;           
output          dtu_ifu_halt_info_vld;        
output  [14:0]  dtu_lsu_halt_info;            
output          dtu_lsu_halt_info_vld;        
output          icount_enable;                
output          ldst_addr_mcontrol;           
output          ldst_data_mcontrol;           
output  [31:0]  mcontext;                     
output          pending_halt;                 
output  [31:0]  tcontrol;                     
output  [31:0]  tdata1;                       
output  [31:0]  tdata2;                       
output  [31:0]  tdata3;                       
output  [31:0]  tinfo;                        
output  [31:0]  tselect;                      
output          updata_tval;                  

// &Regs; @25
reg     [3 :0]  dtu_cause;                    
reg     [5 :0]  mcontext_lowbits;             
reg             mpte_reg;                     
reg             mte_reg;                      
reg             pending_halt;                 
reg             record_action01_reg;          
reg             record_action_reg;            
reg     [3 :0]  record_cause_reg;             
reg     [2 :0]  record_hit_reg;               
reg             record_ldst_reg;              
reg             retire_action01;              
reg     [31:0]  tdata1;                       
reg     [31:0]  tdata2;                       
reg     [31:0]  tdata3;                       
reg     [31:0]  tinfo;                        
reg     [2 :0]  triggers_hit;                 
reg     [3 :0]  tselect_lowbits;              
reg     [9 :0]  tselect_wr_en;                

// &Wires; @26
wire    [2 :0]  action0_match_trigger;        
wire    [2 :0]  action0_mcontrol;             
wire    [2 :0]  action0_triggers;             
wire    [2 :0]  action1_match_trigger;        
wire    [2 :0]  action1_mcontrol;             
wire    [2 :0]  action1_triggers;             
wire            clear_action01_reg;           
wire            clear_record;                 
wire            cp0_dtu_icg_en;               
wire            cp0_dtu_mexpt_vld;            
wire    [31:0]  cp0_dtu_wdata;                
wire            cp0_write_mcontext;           
wire            cp0_write_tcontrol;           
wire            cp0_write_tdata1;             
wire            cp0_write_tdata2;             
wire            cp0_write_tdata3;             
wire            cp0_write_tselect;            
wire            cp0_yy_clk_en;                
wire            cpurst_b;                     
wire    [14:0]  dtu_ifu_halt_info0;           
wire    [14:0]  dtu_ifu_halt_info1;           
wire            dtu_ifu_halt_info_vld;        
wire    [14:0]  dtu_lsu_halt_info;            
wire            dtu_lsu_halt_info_vld;        
wire            exe0_16bit;                   
wire            exe0_32bit;                   
wire            exe1_16bit;                   
wire            exe1_32bit;                   
wire            forever_cpuclk;               
wire            generate_pending_halt;        
wire            generate_retire_action01;     
wire            generate_timing0;             
wire            give_action01_halt_info;      
wire            icount_enable;                
wire            ifu_dtu_addr_vld0;            
wire            ifu_dtu_addr_vld1;            
wire            ifu_dtu_data_vld0;            
wire            ifu_dtu_data_vld1;            
wire    [31:0]  ifu_dtu_exe_addr0;            
wire    [31:0]  ifu_dtu_exe_addr1;            
wire            iie_pending_halt;             
wire            ldst_16bit;                   
wire            ldst_32bit;                   
wire            ldst_8bit;                    
wire            ldst_addr_mcontrol;           
wire            ldst_data_mcontrol;           
wire            load_addr_vld;                
wire            load_data_vld;                
wire    [14:0]  lsu_dtu_halt_info;            
wire            lsu_dtu_last_check;           
wire    [31:0]  lsu_dtu_ldst_addr;            
wire            lsu_dtu_ldst_addr_vld;        
wire    [7 :0]  lsu_dtu_ldst_bytes_vld;       
wire    [31:0]  lsu_dtu_ldst_data;            
wire            lsu_dtu_ldst_data_vld;        
wire    [31:0]  m0_tdata1;                    
wire    [31:0]  m0_tdata2;                    
wire    [31:0]  m0_tdata3;                    
wire    [31:0]  m0_tinfo;                     
wire    [31:0]  m1_tdata1;                    
wire    [31:0]  m1_tdata2;                    
wire    [31:0]  m1_tdata3;                    
wire    [31:0]  m1_tinfo;                     
wire    [31:0]  m2_tdata1;                    
wire    [31:0]  m2_tdata2;                    
wire    [31:0]  m2_tdata3;                    
wire    [31:0]  m2_tinfo;                     
wire    [31:0]  m3_tdata1;                    
wire    [31:0]  m3_tdata2;                    
wire    [31:0]  m3_tdata3;                    
wire    [31:0]  m3_tinfo;                     
wire    [31:0]  m4_tdata1;                    
wire    [31:0]  m4_tdata2;                    
wire    [31:0]  m4_tdata3;                    
wire    [31:0]  m4_tinfo;                     
wire    [31:0]  m5_tdata1;                    
wire    [31:0]  m5_tdata2;                    
wire    [31:0]  m5_tdata3;                    
wire    [31:0]  m5_tinfo;                     
wire    [31:0]  m6_tdata1;                    
wire    [31:0]  m6_tdata2;                    
wire    [31:0]  m6_tdata3;                    
wire    [31:0]  m6_tinfo;                     
wire    [31:0]  m7_tdata1;                    
wire    [31:0]  m7_tdata2;                    
wire    [31:0]  m7_tdata3;                    
wire    [31:0]  m7_tinfo;                     
wire            m_iie_clk;                    
wire            m_iie_clk_en;                 
wire            m_mode;                       
wire    [31:0]  mcontext;                     
wire    [14:0]  mcontrol_halt_info0;          
wire    [14:0]  mcontrol_halt_info1;          
wire    [2 :0]  mcontrol_hit;                 
wire            other_pending_halt;           
wire            pad_yy_icg_scan_en;           
wire            pending_halt_action;          
wire    [2 :0]  pending_halt_hit;             
wire            penging_halt_action01;        
wire            record_aciton01;              
wire            record_action;                
wire    [3 :0]  record_cause;                 
wire    [14:0]  record_halt_info;             
wire    [2 :0]  record_hit;                   
wire            record_ldst;                  
wire            record_match;                 
wire            record_pending_halt;          
wire    [3 :0]  rtu_cause;                    
wire            rtu_dtu_halt_ack;             
wire            rtu_dtu_pending_ack;          
wire    [14:0]  rtu_dtu_retire_halt_info;     
wire            rtu_dtu_retire_mret;          
wire            rtu_dtu_retire_vld;           
wire            rtu_pending_ack;              
wire            rtu_pending_halt;             
wire    [14:0]  rtu_retire_halt_info;         
wire            rtu_yy_xx_dbgon;              
wire            store_addr_vld;               
wire            store_data_vld;               
wire    [31:0]  tcontrol;                     
wire            timing0_mcontrol_match;       
wire    [2 :0]  triggers_match;               
wire    [31:0]  tselect;                      
wire            u_mode;                       
wire            updata_tval;                  
wire            use_record_halt_info;         
wire            wdata_bigger_than_trigger_num; 


//XLEN
parameter XLEN = `TDT_DM_CORE_MAX_XLEN;

parameter TRIGGER_NUM = `MCONTROL_NUM + `IIE_NUM - 4'd1;

//tcontrol parameter
parameter MPTE       = 7;
parameter MTE        = 3;
//=========================================================            
//                    tselect write             
//=========================================================
//tselect write. When wdata > TRIGGER_NUM, write TRIGGER_NUM to tselsect.

assign wdata_bigger_than_trigger_num = cp0_dtu_wdata[3:0] >= TRIGGER_NUM || (|cp0_dtu_wdata[XLEN-1:4]);

always @(posedge m_iie_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tselect_lowbits[3:0] <= 4'b0;
  else if(cp0_write_tselect && wdata_bigger_than_trigger_num)
    tselect_lowbits[3:0] <= TRIGGER_NUM;
  else if(cp0_write_tselect && !wdata_bigger_than_trigger_num)
    tselect_lowbits[3:0] <= cp0_dtu_wdata[3:0];
end
assign tselect[XLEN-1:0] = {{XLEN-4{1'b0}},tselect_lowbits[3:0]};
// &Force("output","tselect");&Force("bus","tselect",XLEN-1,0); @69

//select trigger
// &CombBeg; @72
always @( tselect[3:0])
begin
case(tselect[3:0])
  4'b0000:tselect_wr_en[9:0] = 10'b0000000001;
  4'b0001:tselect_wr_en[9:0] = 10'b0000000010;
  4'b0010:tselect_wr_en[9:0] = 10'b0000000100;
  4'b0011:tselect_wr_en[9:0] = 10'b0000001000;
  4'b0100:tselect_wr_en[9:0] = 10'b0000010000;
  4'b0101:tselect_wr_en[9:0] = 10'b0000100000;
  4'b0110:tselect_wr_en[9:0] = 10'b0001000000;
  4'b0111:tselect_wr_en[9:0] = 10'b0010000000;
  4'b1000:tselect_wr_en[9:0] = 10'b0100000000;
  4'b1001:tselect_wr_en[9:0] = 10'b1000000000;
  default:tselect_wr_en[9:0] = {10{1'bx}};
endcase
// &CombEnd; @86
end

//=========================================================            
//              trigger csr read              
//=========================================================
// &CombBeg; @91
always @( tselect[3:0]
       or m1_tinfo[31:0]
       or m2_tinfo[31:0]
       or m3_tdata1[31:0]
       or m3_tdata2[31:0]
       or m7_tinfo[31:0]
       or m6_tdata3[31:0]
       or m0_tinfo[31:0]
       or m6_tdata2[31:0]
       or m3_tdata3[31:0]
       or m5_tinfo[31:0]
       or m5_tdata1[31:0]
       or m0_tdata1[31:0]
       or m7_tdata1[31:0]
       or m4_tdata1[31:0]
       or m2_tdata1[31:0]
       or m5_tdata2[31:0]
       or m6_tinfo[31:0]
       or m1_tdata3[31:0]
       or m7_tdata3[31:0]
       or m5_tdata3[31:0]
       or m2_tdata2[31:0]
       or m3_tinfo[31:0]
       or m1_tdata1[31:0]
       or m6_tdata1[31:0]
       or m4_tdata2[31:0]
       or m2_tdata3[31:0]
       or m4_tinfo[31:0]
       or m0_tdata2[31:0]
       or m7_tdata2[31:0]
       or m1_tdata2[31:0]
       or m0_tdata3[31:0]
       or m4_tdata3[31:0])
begin
//   &Force("nonport","m0_tdata1");&Force("nonport","m0_tdata2"); @125
//   &Force("nonport","m0_tdata3");&Force("nonport","m0_tinfo"); @126
//   &Force("nonport","m0_tdata1");&Force("nonport","m0_tdata2"); @143
//   &Force("nonport","m0_tdata3");&Force("nonport","m0_tinfo"); @144
//   &Force("nonport","m1_tdata1");&Force("nonport","m1_tdata2"); @145
//   &Force("nonport","m1_tdata3");&Force("nonport","m1_tinfo"); @146

//   &Force("nonport","m1_tdata1");&Force("nonport","m1_tdata2"); @240
//   &Force("nonport","m1_tdata3");&Force("nonport","m1_tinfo"); @241
//   &Force("nonport","m1_tdata1");&Force("nonport","m1_tdata2"); @258
//   &Force("nonport","m1_tdata3");&Force("nonport","m1_tinfo"); @259
//   &Force("nonport","m2_tdata1");&Force("nonport","m2_tdata2"); @260
//   &Force("nonport","m2_tdata3");&Force("nonport","m2_tinfo");  @261

//   &Force("nonport","m2_tdata1");&Force("nonport","m2_tdata2"); @355
//   &Force("nonport","m2_tdata3");&Force("nonport","m2_tinfo"); @356
//   &Force("nonport","m2_tdata1");&Force("nonport","m2_tdata2"); @373
//   &Force("nonport","m2_tdata3");&Force("nonport","m2_tinfo"); @374
//   &Force("nonport","m3_tdata1");&Force("nonport","m3_tdata2"); @375
//   &Force("nonport","m3_tdata3");&Force("nonport","m3_tinfo"); @376

case(tselect[3:0])
  4'b0000:
    begin
      tdata1[XLEN-1:0]   = m0_tdata1[XLEN-1:0];
      tdata2[XLEN-1:0]   = m0_tdata2[XLEN-1:0];
      tdata3[XLEN-1:0]   = m0_tdata3[XLEN-1:0];
      tinfo[XLEN-1:0]    = m0_tinfo[XLEN-1:0];
    end
  4'b0001:
    begin
      tdata1[XLEN-1:0]   = m1_tdata1[XLEN-1:0];
      tdata2[XLEN-1:0]   = m1_tdata2[XLEN-1:0];
      tdata3[XLEN-1:0]   = m1_tdata3[XLEN-1:0];
      tinfo[XLEN-1:0]    = m1_tinfo[XLEN-1:0];
    end
  4'b0010:
    begin
      tdata1[XLEN-1:0]   = m2_tdata1[XLEN-1:0];
      tdata2[XLEN-1:0]   = m2_tdata2[XLEN-1:0];
      tdata3[XLEN-1:0]   = m2_tdata3[XLEN-1:0];
      tinfo[XLEN-1:0]    = m2_tinfo[XLEN-1:0];
    end
  4'b0011:
    begin
      tdata1[XLEN-1:0]   = m3_tdata1[XLEN-1:0];
      tdata2[XLEN-1:0]   = m3_tdata2[XLEN-1:0];
      tdata3[XLEN-1:0]   = m3_tdata3[XLEN-1:0];
      tinfo[XLEN-1:0]    = m3_tinfo[XLEN-1:0];
    end
  4'b0100:
    begin
      tdata1[XLEN-1:0]   = m4_tdata1[XLEN-1:0];
      tdata2[XLEN-1:0]   = m4_tdata2[XLEN-1:0];
      tdata3[XLEN-1:0]   = m4_tdata3[XLEN-1:0];
      tinfo[XLEN-1:0]    = m4_tinfo[XLEN-1:0];
    end
//   &Force("nonport","m3_tdata1");&Force("nonport","m3_tdata2"); @470
//   &Force("nonport","m3_tdata3");&Force("nonport","m3_tinfo"); @471
//   &Force("nonport","m3_tdata1");&Force("nonport","m3_tdata2"); @488
//   &Force("nonport","m3_tdata3");&Force("nonport","m3_tinfo"); @489
//   &Force("nonport","m4_tdata1");&Force("nonport","m4_tdata2"); @490
//   &Force("nonport","m4_tdata3");&Force("nonport","m4_tinfo"); @491
  4'b0101:
    begin
      tdata1[XLEN-1:0]   = m5_tdata1[XLEN-1:0];
      tdata2[XLEN-1:0]   = m5_tdata2[XLEN-1:0];
      tdata3[XLEN-1:0]   = m5_tdata3[XLEN-1:0];
      tinfo[XLEN-1:0]    = m5_tinfo[XLEN-1:0];
    end
  4'b0110:
    begin
      tdata1[XLEN-1:0]   = m6_tdata1[XLEN-1:0];
      tdata2[XLEN-1:0]   = m6_tdata2[XLEN-1:0];
      tdata3[XLEN-1:0]   = m6_tdata3[XLEN-1:0];
      tinfo[XLEN-1:0]    = m6_tinfo[XLEN-1:0];
    end
  4'b0111:
    begin
      tdata1[XLEN-1:0]   = m7_tdata1[XLEN-1:0];
      tdata2[XLEN-1:0]   = m7_tdata2[XLEN-1:0];
      tdata3[XLEN-1:0]   = m7_tdata3[XLEN-1:0];
      tinfo[XLEN-1:0]    = m7_tinfo[XLEN-1:0];
    end
  default:
    begin
      tdata1[XLEN-1:0]   = {XLEN{1'bx}};
      tdata2[XLEN-1:0]   = {XLEN{1'bx}};
      tdata3[XLEN-1:0]   = {XLEN{1'bx}};
      tinfo[XLEN-1:0]    = {XLEN{1'bx}};
    end
endcase

//   &Force("nonport","m4_tdata1");&Force("nonport","m4_tdata2"); @585
//   &Force("nonport","m4_tdata3");&Force("nonport","m4_tinfo"); @586
//   &Force("nonport","m4_tdata1");&Force("nonport","m4_tdata2"); @603
//   &Force("nonport","m4_tdata3");&Force("nonport","m4_tinfo"); @604
//   &Force("nonport","m5_tdata1");&Force("nonport","m5_tdata2"); @605
//   &Force("nonport","m5_tdata3");&Force("nonport","m5_tinfo"); @606

//   &Force("nonport","m5_tdata1");&Force("nonport","m5_tdata2"); @700
//   &Force("nonport","m5_tdata3");&Force("nonport","m5_tinfo"); @701
//   &Force("nonport","m5_tdata1");&Force("nonport","m5_tdata2"); @718
//   &Force("nonport","m5_tdata3");&Force("nonport","m5_tinfo"); @719
//   &Force("nonport","m6_tdata1");&Force("nonport","m6_tdata2"); @720
//   &Force("nonport","m6_tdata3");&Force("nonport","m6_tinfo"); @721

//   &Force("nonport","m6_tdata1");&Force("nonport","m6_tdata2"); @815
//   &Force("nonport","m6_tdata3");&Force("nonport","m6_tinfo"); @816
//   &Force("nonport","m6_tdata1");&Force("nonport","m6_tdata2"); @833
//   &Force("nonport","m6_tdata3");&Force("nonport","m6_tinfo"); @834
//   &Force("nonport","m7_tdata1");&Force("nonport","m7_tdata2"); @835
//   &Force("nonport","m7_tdata3");&Force("nonport","m7_tinfo"); @836
//   &Force("nonport","m7_tdata1");&Force("nonport","m7_tdata2"); @915
//   &Force("nonport","m7_tdata3");&Force("nonport","m7_tinfo"); @916
//   &Force("nonport","m7_tdata1");&Force("nonport","m7_tdata2"); @933
//   &Force("nonport","m7_tdata3");&Force("nonport","m7_tinfo"); @934

// &CombEnd; @1038
end
//=========================================================            
//              trigger instance              
//=========================================================
//--------------mcontrol instance--------------------------
// &Instance("pa_dtu_mcontrol_output_select"); @1043
pa_dtu_mcontrol_output_select  x_pa_dtu_mcontrol_output_select (
  .action0_mcontrol       (action0_mcontrol      ),
  .action1_mcontrol       (action1_mcontrol      ),
  .cp0_dtu_icg_en         (cp0_dtu_icg_en        ),
  .cp0_dtu_wdata          (cp0_dtu_wdata         ),
  .cp0_write_tdata1       (cp0_write_tdata1      ),
  .cp0_write_tdata2       (cp0_write_tdata2      ),
  .cp0_write_tdata3       (cp0_write_tdata3      ),
  .cp0_yy_clk_en          (cp0_yy_clk_en         ),
  .cpurst_b               (cpurst_b              ),
  .dtu_ifu_halt_info_vld  (dtu_ifu_halt_info_vld ),
  .dtu_lsu_halt_info      (dtu_lsu_halt_info     ),
  .dtu_lsu_halt_info_vld  (dtu_lsu_halt_info_vld ),
  .exe0_16bit             (exe0_16bit            ),
  .exe0_32bit             (exe0_32bit            ),
  .exe1_16bit             (exe1_16bit            ),
  .exe1_32bit             (exe1_32bit            ),
  .forever_cpuclk         (forever_cpuclk        ),
  .ifu_dtu_addr_vld0      (ifu_dtu_addr_vld0     ),
  .ifu_dtu_addr_vld1      (ifu_dtu_addr_vld1     ),
  .ifu_dtu_data_vld0      (ifu_dtu_data_vld0     ),
  .ifu_dtu_data_vld1      (ifu_dtu_data_vld1     ),
  .ifu_dtu_exe_addr0      (ifu_dtu_exe_addr0     ),
  .ifu_dtu_exe_addr1      (ifu_dtu_exe_addr1     ),
  .ldst_16bit             (ldst_16bit            ),
  .ldst_32bit             (ldst_32bit            ),
  .ldst_8bit              (ldst_8bit             ),
  .ldst_addr_mcontrol     (ldst_addr_mcontrol    ),
  .ldst_data_mcontrol     (ldst_data_mcontrol    ),
  .load_addr_vld          (load_addr_vld         ),
  .load_data_vld          (load_data_vld         ),
  .lsu_dtu_halt_info      (lsu_dtu_halt_info     ),
  .lsu_dtu_last_check     (lsu_dtu_last_check    ),
  .lsu_dtu_ldst_addr      (lsu_dtu_ldst_addr     ),
  .lsu_dtu_ldst_addr_vld  (lsu_dtu_ldst_addr_vld ),
  .lsu_dtu_ldst_bytes_vld (lsu_dtu_ldst_bytes_vld),
  .lsu_dtu_ldst_data      (lsu_dtu_ldst_data     ),
  .lsu_dtu_ldst_data_vld  (lsu_dtu_ldst_data_vld ),
  .m0_tdata1              (m0_tdata1             ),
  .m0_tdata2              (m0_tdata2             ),
  .m0_tdata3              (m0_tdata3             ),
  .m0_tinfo               (m0_tinfo              ),
  .m1_tdata1              (m1_tdata1             ),
  .m1_tdata2              (m1_tdata2             ),
  .m1_tdata3              (m1_tdata3             ),
  .m1_tinfo               (m1_tinfo              ),
  .m2_tdata1              (m2_tdata1             ),
  .m2_tdata2              (m2_tdata2             ),
  .m2_tdata3              (m2_tdata3             ),
  .m2_tinfo               (m2_tinfo              ),
  .m3_tdata1              (m3_tdata1             ),
  .m3_tdata2              (m3_tdata2             ),
  .m3_tdata3              (m3_tdata3             ),
  .m3_tinfo               (m3_tinfo              ),
  .m4_tdata1              (m4_tdata1             ),
  .m4_tdata2              (m4_tdata2             ),
  .m4_tdata3              (m4_tdata3             ),
  .m4_tinfo               (m4_tinfo              ),
  .m5_tdata1              (m5_tdata1             ),
  .m5_tdata2              (m5_tdata2             ),
  .m5_tdata3              (m5_tdata3             ),
  .m5_tinfo               (m5_tinfo              ),
  .m6_tdata1              (m6_tdata1             ),
  .m6_tdata2              (m6_tdata2             ),
  .m6_tdata3              (m6_tdata3             ),
  .m6_tinfo               (m6_tinfo              ),
  .m7_tdata1              (m7_tdata1             ),
  .m7_tdata2              (m7_tdata2             ),
  .m7_tdata3              (m7_tdata3             ),
  .m7_tinfo               (m7_tinfo              ),
  .m_mode                 (m_mode                ),
  .mcontext               (mcontext              ),
  .mcontrol_halt_info0    (mcontrol_halt_info0   ),
  .mcontrol_halt_info1    (mcontrol_halt_info1   ),
  .mcontrol_hit           (mcontrol_hit          ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    ),
  .rtu_yy_xx_dbgon        (rtu_yy_xx_dbgon       ),
  .store_addr_vld         (store_addr_vld        ),
  .store_data_vld         (store_data_vld        ),
  .tcontrol               (tcontrol              ),
  .tselect_wr_en          (tselect_wr_en         ),
  .u_mode                 (u_mode                )
);


//--------------iie trigger instance--------------------------
// &Instance("pa_dtu_iie_trigger","x_pa_dtu_iie_trigger_0"); @1047
// &Connect( @1048
//          .trigger_selected(tselect_wr_en[`TDT_TM_MCONTROL_TRI_NUM]), @1049
//          .set_trigger_hit(iie_hit), @1050
//          .exception_codes_onehot(exception_codes_onehot), @1051
//          .icount_enable  (iie0_icount_enable), @1052
//          .tdata1_action0 (iie0_tdata1_action0), @1053
//          .tdata1_action1 (iie0_tdata1_action1), @1054
//          .trigger_match  (iie0_match) @1055
//          .tdata1         (iie0_tdata1), @1056
//          .tdata2         (iie0_tdata2), @1057
//          .tdata3         (iie0_tdata3), @1058
//          .tinfo          (iie0_tinfo)); @1059
// &Force("input","rtu_yy_xx_expt_vec");&Force("bus","rtu_yy_xx_expt_vec",11,0); @1072
// &Force("input","cp0_dtu_int_id");&Force("bus","cp0_dtu_int_id",11,0); @1073

// &Instance("pa_dtu_iie_trigger","x_pa_dtu_iie_trigger_0"); @1077
// &Connect( @1078
//          .trigger_selected(tselect_wr_en[`TDT_TM_MCONTROL_TRI_NUM]), @1079
//          .set_trigger_hit(iie_hit[0]), @1080
//          .exception_codes_onehot(exception_codes_onehot), @1081
//          .icount_enable  (iie0_icount_enable), @1082
//          .tdata1_action0 (iie0_tdata1_action0), @1083
//          .tdata1_action1 (iie0_tdata1_action1), @1084
//          .trigger_match  (iie0_match) @1085
//          .tdata1         (iie0_tdata1), @1086
//          .tdata2         (iie0_tdata2), @1087
//          .tdata3         (iie0_tdata3), @1088
//          .tinfo          (iie0_tinfo)); @1089
// &Instance("pa_dtu_iie_trigger","x_pa_dtu_iie_trigger_1"); @1091
// &Connect( @1092
//          .trigger_selected(tselect_wr_en[`TDT_TM_MCONTROL_TRI_NUM + 1]),         @1093
//          .set_trigger_hit(iie_hit[1]), @1094
//          .exception_codes_onehot(exception_codes_onehot), @1095
//          .icount_enable  (iie1_icount_enable), @1096
//          .tdata1_action0 (iie1_tdata1_action0), @1097
//          .tdata1_action1 (iie1_tdata1_action1), @1098
//          .trigger_match  (iie1_match) @1099
//          .tdata1         (iie1_tdata1), @1100
//          .tdata2         (iie1_tdata2), @1101
//          .tdata3         (iie1_tdata3), @1102
//          .tinfo          (iie1_tinfo)); @1103
// &Force("input","rtu_yy_xx_expt_vec");&Force("bus","rtu_yy_xx_expt_vec",11,0); @1115
// &Force("input","cp0_dtu_int_id");&Force("bus","cp0_dtu_int_id",11,0); @1116
//-------tcontrol,mcontext for triggers---------
//write tcontrol
always @(posedge m_iie_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      mte_reg  <= 1'b0;
      mpte_reg <= 1'b0;
    end
  else if(cp0_dtu_mexpt_vld && rtu_dtu_retire_mret && rtu_dtu_retire_vld)
    begin
      mte_reg  <= 1'b0;
      mpte_reg <= mpte_reg; 
    end
  else if(cp0_dtu_mexpt_vld)//A trap into m mode is taken, set MPTE to MTE,set MTE to 0.
    begin
      mte_reg  <= 1'b0;
      mpte_reg <= mte_reg;
    end
  else if(rtu_dtu_retire_mret && rtu_dtu_retire_vld)//mret is executed, set MTE to MPTE. 
    begin
      mte_reg  <= mpte_reg;
      mpte_reg <= mpte_reg;
    end
  else if(cp0_write_tcontrol)
    begin
      mte_reg  <= cp0_dtu_wdata[MTE];
      mpte_reg <= cp0_dtu_wdata[MPTE];
    end
end
assign tcontrol[XLEN-1:0] = {{XLEN-8{1'b0}},mpte_reg,{3{1'b0}},mte_reg,{3{1'b0}}};
// &Force("output","tcontrol");&Force("bus","tcontrol",XLEN-1,0); @1149
//write mcontext
always @(posedge m_iie_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    mcontext_lowbits[5:0] <= 6'b0;
  else if(cp0_write_mcontext)
    mcontext_lowbits[5:0] <= cp0_dtu_wdata[5:0];
end
assign mcontext[XLEN-1:0] = {{XLEN-6{1'b0}},mcontext_lowbits[5:0]};
// &Force("output","mcontext");&Force("bus","mcontext",XLEN-1,0); @1159

//=========================================================            
//              mcontrol hit info from rtu                
//=========================================================
// &Force("input","rtu_dtu_retire_halt_info");&Force("bus","rtu_dtu_retire_halt_info",`TDT_HINFO_WIDTH-1,0); @1164
assign rtu_retire_halt_info[`TDT_HINFO_WIDTH-1:0] = (rtu_dtu_retire_vld || rtu_dtu_halt_ack) ?
                                                    rtu_dtu_retire_halt_info[`TDT_HINFO_WIDTH-1:0] :
                                                    {`TDT_HINFO_WIDTH{1'b0}};
assign timing0_mcontrol_match = rtu_retire_halt_info[`TDT_HINFO_MATCH] &&
                                !rtu_retire_halt_info[`TDT_HINFO_CHAIN] &&
                                !rtu_retire_halt_info[`TDT_HINFO_TIMING];
assign rtu_pending_ack  = rtu_dtu_pending_ack;
assign rtu_pending_halt = rtu_retire_halt_info[`TDT_HINFO_PENDING_HALT];
assign generate_timing0 = rtu_dtu_halt_ack || timing0_mcontrol_match;

assign triggers_match[`TDT_TM_TRIGGER_NUM-1:0] = 
       rtu_retire_halt_info[`TDT_HINFO_TRIGGER:`TDT_HINFO_TRIGGER-`TDT_TM_MCONTROL_TRI_NUM-`TDT_TM_OTHER_TRI_NUM+1];

  assign action1_triggers[`TDT_TM_TRIGGER_NUM-1:0] = action1_mcontrol[`TDT_TM_MCONTROL_TRI_NUM-1:0];
  assign action0_triggers[`TDT_TM_TRIGGER_NUM-1:0] = action0_mcontrol[`TDT_TM_MCONTROL_TRI_NUM-1:0];

assign action1_match_trigger[`TDT_TM_TRIGGER_NUM-1:0] =  triggers_match[`TDT_TM_TRIGGER_NUM-1:0] & action1_triggers[`TDT_TM_TRIGGER_NUM-1:0];
assign action0_match_trigger[`TDT_TM_TRIGGER_NUM-1:0] =  triggers_match[`TDT_TM_TRIGGER_NUM-1:0] & action0_triggers[`TDT_TM_TRIGGER_NUM-1:0]; 

//trigger hit
// &CombBeg; @1230
// &CombEnd; @1237
// &CombBeg; @1239
always @( generate_timing0
       or action0_match_trigger[2:0]
       or triggers_match[2:0]
       or rtu_retire_halt_info[5])
begin
if(generate_timing0 && !rtu_retire_halt_info[`TDT_HINFO_ACTION01])
  triggers_hit[`TDT_TM_TRIGGER_NUM-1:0] = triggers_match[`TDT_TM_TRIGGER_NUM-1:0];
else if(generate_timing0 && rtu_retire_halt_info[`TDT_HINFO_ACTION01])
  triggers_hit[`TDT_TM_TRIGGER_NUM-1:0] = action0_match_trigger[`TDT_TM_TRIGGER_NUM-1:0];
else
  triggers_hit[`TDT_TM_TRIGGER_NUM-1:0] = {`TDT_TM_TRIGGER_NUM{1'b0}};
// &CombEnd; @1246
end

//mcontrol hit
assign mcontrol_hit[`TDT_TM_MCONTROL_TRI_NUM-1:0] = triggers_hit[`TDT_TM_TRIGGER_NUM-1:`TDT_TM_TRIGGER_NUM-`TDT_TM_MCONTROL_TRI_NUM];

//iie trigger hit
//&CombBeg;
//  if(rtu_pending_ack)
//    mcontrol_hit[`TDT_TM_MCONTROL_TRI_NUM-1:0] = pending_halt_mhit_reg[`TDT_TM_MCONTROL_TRI_NUM-1:0];
//  else if(generate_timing0 && !rtu_retire_halt_info[`TDT_HINFO_ACTION01])
//    mcontrol_hit[`TDT_TM_MCONTROL_TRI_NUM-1:0] = mcontrols_match[`TDT_TM_MCONTROL_TRI_NUM-1:0];
//  else if(generate_timing0 && rtu_retire_halt_info[`TDT_HINFO_ACTION01])
//    mcontrol_hit[`TDT_TM_MCONTROL_TRI_NUM-1:0] = action1_match_trigger[`TDT_TM_MCONTROL_TRI_NUM-1:0];
//  else
//    mcontrol_hit[`TDT_TM_MCONTROL_TRI_NUM-1:0] = {`TDT_TM_MCONTROL_TRI_NUM{1'b0}};
//&CombEnd;
//iie trigger hit
//&CombBeg;
//  if(rtu_pending_ack)
//    iie_hit[`TDT_TM_OTHER_TRI_NUM-1:0] = pending_halt_iie_hit_reg[`TDT_TM_OTHER_TRI_NUM-1:0];
//  else
//    iie_hit[`TDT_TM_OTHER_TRI_NUM-1:0]= {`TDT_TM_OTHER_TRI_NUM{1'b0}};
//&CombEnd;
//=========================================================            
//                 updata pending tval                
//=========================================================
 assign updata_tval = rtu_retire_halt_info[`TDT_HINFO_MATCH] &&
                      !rtu_retire_halt_info[`TDT_HINFO_CHAIN] &&
                      rtu_retire_halt_info[`TDT_HINFO_TIMING] &&
                      !rtu_retire_halt_info[`TDT_HINFO_ACTION];                     

//always @(posedge m_iie_clk or negedge cpurst_b)
//begin
//  if(!cpurst_b)
//      pending_tval[XLEN-1:0] <= {XLEN{1'b0}};
//  else if(updata_tval)
//      pending_tval[XLEN-1:0] <= rtu_dtu_tval[XLEN-1:0];
//end
//assign dtu_rtu_pending_tval[XLEN-1:0] = pending_tval[XLEN-1:0];

//=========================================================            
//                       cause                
//=========================================================
assign rtu_cause[3:0] = rtu_retire_halt_info[`TDT_HINFO_CAUSE:`TDT_HINFO_CAUSE-3];

// &CombBeg; @1334
always @( rtu_cause[3:0]
       or rtu_dtu_halt_ack)
begin
  if(rtu_dtu_halt_ack)
    dtu_cause[3:0] = rtu_cause[3:0];
  else
    dtu_cause[3:0] = rtu_cause[3:0];
// &CombEnd; @1344
end
// &Force("output","dtu_cause"); @1345
//=========================================================            
//                 pending halt                
//=========================================================
//icount_enable for rtu
assign icount_enable = 1'b0;

//assign step_match    = dcsr_step && rtu_dtu_retire_step_fire;
//pending halt source

assign iie_pending_halt  = 1'b0;
//assign step_pending_halt     = !generate_timing0 && step_match;
assign other_pending_halt    = rtu_pending_halt;//include mcontrol pending, and other pending
assign generate_pending_halt = iie_pending_halt || other_pending_halt;

//pending halt flg
always @(posedge m_iie_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pending_halt <= 1'b0;
  else if(generate_pending_halt)
    pending_halt <= 1'b1;
  else if(rtu_pending_ack)
    pending_halt <= 1'b0;
end
// &Force("output","pending_halt"); @1382

//action select
assign pending_halt_action   = rtu_retire_halt_info[`TDT_HINFO_ACTION];
assign penging_halt_action01 = rtu_retire_halt_info[`TDT_HINFO_ACTION01];
//assign pending_halt_ldst     = rtu_retire_halt_info[`TDT_HINFO_LDST];
//pending halt info record
  assign pending_halt_hit[`TDT_TM_TRIGGER_NUM-1:0] = triggers_match[`TDT_TM_TRIGGER_NUM-1:`TDT_TM_TRIGGER_NUM-`TDT_TM_MCONTROL_TRI_NUM];
//=========================================================            
//                   retire action01             
//=========================================================
//retire action01 source
assign generate_retire_action01 = generate_timing0 && rtu_retire_halt_info[`TDT_HINFO_ACTION01];

//retire action01 flg
assign clear_action01_reg = rtu_yy_xx_dbgon && retire_action01;//(ifu_dtu_addr_vld0 || ifu_dtu_data_vld0 || ifu_dtu_addr_vld1 || ifu_dtu_data_vld1);
always @(posedge m_iie_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_action01 <= 1'b0;
  else if(generate_retire_action01)
    retire_action01 <= 1'b1;
  else if(clear_action01_reg)
    retire_action01 <= 1'b0;
end
assign give_action01_halt_info = retire_action01 && !rtu_yy_xx_dbgon;

//record hatl_info of pending halt and action01
assign record_hit[`TDT_TM_TRIGGER_NUM-1:0] = generate_pending_halt ? pending_halt_hit[`TDT_TM_TRIGGER_NUM-1:0] :
                                                                     action1_match_trigger[`TDT_TM_TRIGGER_NUM-1:0];
assign record_action                       = generate_pending_halt ? pending_halt_action :  1'b1;
assign record_aciton01                     = generate_pending_halt ? penging_halt_action01 : 1'b0;
assign record_ldst                         = rtu_retire_halt_info[`TDT_HINFO_LDST];
assign record_cause[3:0]                   = dtu_cause[3:0];
assign clear_record                        = pending_halt && rtu_pending_ack ||
                                             clear_action01_reg;

always @(posedge m_iie_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      record_hit_reg[`TDT_TM_TRIGGER_NUM-1:0] <= {`TDT_TM_TRIGGER_NUM{1'b0}};
      record_action_reg     <= 1'b0;
      record_action01_reg   <= 1'b0;
      record_ldst_reg       <= 1'b0;
      record_cause_reg[3:0] <= 4'b0;
    end
  else if(generate_pending_halt || generate_retire_action01)
    begin
      record_hit_reg[`TDT_TM_TRIGGER_NUM-1:0] <= record_hit[`TDT_TM_TRIGGER_NUM-1:0];
      record_action_reg     <= record_action;
      record_action01_reg   <= record_aciton01;
      record_ldst_reg       <= record_ldst;
      record_cause_reg[3:0] <= record_cause[3:0];
    end
  else if(clear_record)
    begin
      record_hit_reg[`TDT_TM_TRIGGER_NUM-1:0] <= {`TDT_TM_TRIGGER_NUM{1'b0}};
      record_action_reg     <= 1'b0;
      record_action01_reg   <= 1'b0;
      record_ldst_reg       <= 1'b0;
      record_cause_reg[3:0] <= 4'b0;
    end
end

assign record_match        = |record_hit_reg[`TDT_TM_TRIGGER_NUM-1:0];

assign record_pending_halt = pending_halt || retire_action01;

assign record_halt_info[`TDT_HINFO_WIDTH-1:0] =  rtu_yy_xx_dbgon ? 
                                                 {`TDT_HINFO_WIDTH{1'b0}} :
                                                 {record_hit_reg[`TDT_TM_TRIGGER_NUM-1:0],//match[7:0]
                                                 record_cause_reg[3:0],//cause
                                                 record_pending_halt,  //pengding halt
                                                 1'b0,                 //timing
                                                 record_action01_reg,  //action01
                                                 record_action_reg,    //action
                                                 1'b0,                 //chain
                                                 record_ldst_reg,      //ldst
                                                 record_match,         //match
                                                 1'b1};                //cancel


//halt_info for ifu
assign use_record_halt_info = give_action01_halt_info || pending_halt;
assign dtu_ifu_halt_info0[`TDT_HINFO_WIDTH-1:0] = use_record_halt_info ?
                                                  record_halt_info[`TDT_HINFO_WIDTH-1:0] :
                                                  mcontrol_halt_info0[`TDT_HINFO_WIDTH-1:0];
assign dtu_ifu_halt_info1[`TDT_HINFO_WIDTH-1:0] = use_record_halt_info ?
                                                  record_halt_info[`TDT_HINFO_WIDTH-1:0] :
                                                  mcontrol_halt_info1[`TDT_HINFO_WIDTH-1:0];

//==========================================================
//                     gate clk
//==========================================================
assign m_iie_clk_en =cp0_write_tselect || cp0_write_tcontrol || cp0_write_mcontext ||
                     cp0_dtu_mexpt_vld || (rtu_dtu_retire_mret && rtu_dtu_retire_vld) || //cp0_dtu_mret_vld_f ||
                    // updata_tval ||
                     generate_pending_halt    || rtu_pending_ack ||
                     generate_retire_action01 || clear_action01_reg;
// &Force("nonport","m_iie_clk_en"); @1576


// &Instance("gated_clk_cell", "x_reg_gated_clk"); @1579
gated_clk_cell  x_reg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (m_iie_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (m_iie_clk_en      ),
  .module_en          (cp0_dtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1580
//          .external_en (1'b0), @1581
//          .global_en   (cp0_yy_clk_en), @1582
//          .module_en   (cp0_dtu_icg_en), @1583
//          .local_en    (m_iie_clk_en), @1584
//          //.local_en    (1'b1), @1585
//          .clk_out     (m_iie_clk)); @1586

// &ModuleEnd; @1599
endmodule


