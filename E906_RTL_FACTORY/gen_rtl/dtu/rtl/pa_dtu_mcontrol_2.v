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
module pa_dtu_mcontrol_2(
  already_match,
  cp0_dtu_icg_en,
  cp0_dtu_wdata,
  cp0_write_tdata1,
  cp0_write_tdata2,
  cp0_write_tdata3,
  cp0_yy_clk_en,
  cpurst_b,
  exe0_16bit,
  exe0_32bit,
  exe0_match,
  exe0_may_hit,
  exe1_16bit,
  exe1_32bit,
  exe1_match,
  exe1_may_hit,
  exe_mcontrol,
  forever_cpuclk,
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
  ldst_match,
  ldst_may_hit,
  ldst_mcontrol,
  load_addr_vld,
  load_data_vld,
  lsu_dtu_ldst_addr,
  lsu_dtu_ldst_addr_vld,
  lsu_dtu_ldst_bytes_vld,
  lsu_dtu_ldst_data,
  lsu_dtu_ldst_data_vld,
  m_mode,
  mcontext,
  mpriority,
  mpriority_after_chain,
  mpriority_mask,
  mpriority_mask_after_chain,
  mtiming,
  mtiming_after_chain,
  mtiming_mask,
  mtiming_mask_after_chain,
  next_mpriority,
  next_mpriority_mask,
  next_mtiming,
  next_mtiming_mask,
  next_trigger_chain,
  next_trigger_dmode,
  pad_yy_icg_scan_en,
  previous_mpriority,
  previous_mpriority_mask,
  previous_mtiming,
  previous_mtiming_mask,
  previous_trigger_chian,
  previous_trigger_dmode,
  rtu_yy_xx_dbgon,
  set_trigger_hit,
  store_addr_vld,
  store_data_vld,
  tcontrol,
  tdata1,
  tdata1_action0,
  tdata1_action1,
  tdata1_chain,
  tdata1_dmode,
  tdata1_timing,
  tdata2,
  tdata3,
  tinfo,
  trigger_selected,
  u_mode
);

// &Ports; @24
input           already_match;                             
input           cp0_dtu_icg_en;                            
input   [31:0]  cp0_dtu_wdata;                             
input           cp0_write_tdata1;                          
input           cp0_write_tdata2;                          
input           cp0_write_tdata3;                          
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
input   [31:0]  lsu_dtu_ldst_addr;                         
input           lsu_dtu_ldst_addr_vld;                     
input   [7 :0]  lsu_dtu_ldst_bytes_vld;                    
input   [31:0]  lsu_dtu_ldst_data;                         
input           lsu_dtu_ldst_data_vld;                     
input           m_mode;                                    
input   [31:0]  mcontext;                                  
input   [1 :0]  next_mpriority;                            
input   [1 :0]  next_mpriority_mask;                       
input           next_mtiming;                              
input           next_mtiming_mask;                         
input           next_trigger_chain;                        
input           next_trigger_dmode;                        
input           pad_yy_icg_scan_en;                        
input   [1 :0]  previous_mpriority;                        
input   [1 :0]  previous_mpriority_mask;                   
input           previous_mtiming;                          
input           previous_mtiming_mask;                     
input           previous_trigger_chian;                    
input           previous_trigger_dmode;                    
input           rtu_yy_xx_dbgon;                           
input           set_trigger_hit;                           
input           store_addr_vld;                            
input           store_data_vld;                            
input   [31:0]  tcontrol;                                  
input           trigger_selected;                          
input           u_mode;                                    
output          exe0_match;                                
output          exe0_may_hit;                              
output          exe1_match;                                
output          exe1_may_hit;                              
output          exe_mcontrol;                              
output          ldst_addr_mcontrol;                        
output          ldst_data_mcontrol;                        
output          ldst_match;                                
output          ldst_may_hit;                              
output          ldst_mcontrol;                             
output  [1 :0]  mpriority;                                 
output  [1 :0]  mpriority_after_chain;                     
output  [1 :0]  mpriority_mask;                            
output  [1 :0]  mpriority_mask_after_chain;                
output          mtiming;                                   
output          mtiming_after_chain;                       
output          mtiming_mask;                              
output          mtiming_mask_after_chain;                  
output  [31:0]  tdata1;                                    
output          tdata1_action0;                            
output          tdata1_action1;                            
output          tdata1_chain;                              
output          tdata1_dmode;                              
output          tdata1_timing;                             
output  [31:0]  tdata2;                                    
output  [31:0]  tdata3;                                    
output  [31:0]  tinfo;                                     

// &Regs; @25
reg             dmode_legal;                               
reg             exe0_match;                                
reg             exe1_match;                                
reg             ldst_match;                                
reg     [3 :0]  m_mask_four_bits;                          
reg     [7 :0]  m_mask_reg;                                
reg             match_ldst_addr;                           
reg     [1 :0]  mpriority;                                 
reg     [1 :0]  mpriority_mask;                            
reg             size1;                                     
reg             size2;                                     
reg     [31:0]  size_mask;                                 
reg             tdata1_action;                             
reg             tdata1_dmode;                              
reg             tdata1_execute;                            
reg             tdata1_hit;                                
reg             tdata1_load;                               
reg             tdata1_m;                                  
reg     [3 :0]  tdata1_match;                              
reg     [1 :0]  tdata1_sizelo;                             
reg             tdata1_store;                              
reg             tdata1_timing;                             
reg             tdata1_u;                                  
reg     [31:0]  tdata2;                                    
reg     [7 :0]  tdata2_ldst_bytes_vld_0;                   
reg     [3 :0]  tdata2_ldst_bytes_vld_for_match1_four_bits; 
reg     [3 :0]  tdata2_ldst_bytes_vld_four_bits;           
reg     [7 :0]  tdata2_ldst_bytes_vld_reg_0;               
reg             tdata3_mselect;                            
reg     [5 :0]  tdata3_mvalue;                             
reg             write_tdata1_f;                            
reg             write_tdata2_f;                            

// &Wires; @26
wire            action_is_legal;                           
wire            action_legal;                              
wire            already_match;                             
wire            bytes_vld_match;                           
wire            cp0_dtu_icg_en;                            
wire    [31:0]  cp0_dtu_wdata;                             
wire            cp0_write_tdata1;                          
wire            cp0_write_tdata2;                          
wire            cp0_write_tdata3;                          
wire            cp0_yy_clk_en;                             
wire            cpurst_b;                                  
wire            exe0_16bit;                                
wire            exe0_32bit;                                
wire            exe0_have_value_match0;                    
wire            exe0_have_value_match1;                    
wire            exe0_match_equal;                          
wire            exe0_match_need_reg;                       
wire            exe0_match_top_mbits_equal;                
wire            exe0_may_hit;                              
wire            exe0_size_match;                           
wire            exe0_type_match;                           
wire            exe0_type_size_match;                      
wire    [31:0]  exe0_value;                                
wire    [31:0]  exe0_value_before_size_mask;               
wire    [7 :0]  exe0_value_masked_low_8bis;                
wire            exe0_value_match;                          
wire    [31:0]  exe0_value_top_mbits;                      
wire            exe1_16bit;                                
wire            exe1_32bit;                                
wire            exe1_have_value_match0;                    
wire            exe1_have_value_match1;                    
wire            exe1_match_equal;                          
wire            exe1_match_need_reg;                       
wire            exe1_match_top_mbits_equal;                
wire            exe1_may_hit;                              
wire            exe1_size_match;                           
wire            exe1_type_match;                           
wire            exe1_type_size_match;                      
wire    [31:0]  exe1_value;                                
wire    [31:0]  exe1_value_before_size_mask;               
wire    [7 :0]  exe1_value_masked_low_8bis;                
wire            exe1_value_match;                          
wire    [31:0]  exe1_value_top_mbits;                      
wire            exe_addr_mcontrol;                         
wire            exe_data_mcontrol;                         
wire            exe_mcontrol;                              
wire            exe_size_is_legal;                         
wire            forever_cpuclk;                            
wire            ifu_dtu_addr_vld0;                         
wire            ifu_dtu_addr_vld1;                         
wire            ifu_dtu_data_vld0;                         
wire            ifu_dtu_data_vld1;                         
wire    [31:0]  ifu_dtu_exe_addr0;                         
wire    [31:0]  ifu_dtu_exe_addr1;                         
wire            ldst_16bit;                                
wire            ldst_32bit;                                
wire            ldst_8bit;                                 
wire            ldst_addr_match_equal;                     
wire            ldst_addr_mcontrol;                        
wire            ldst_addr_top_mbits_equal;                 
wire            ldst_bytes_vld_equal;                      
wire            ldst_bytes_vld_mbits_equal;                
wire            ldst_data_mcontrol;                        
wire            ldst_have_value_match0;                    
wire            ldst_have_value_match1;                    
wire    [7 :0]  ldst_m_mask;                               
wire            ldst_match_equal;                          
wire            ldst_match_need_reg;                       
wire            ldst_match_top_mbits_equal;                
wire            ldst_may_hit;                              
wire            ldst_mcontrol;                             
wire            ldst_mcontrol_match;                       
wire            ldst_size_is_legal;                        
wire            ldst_size_match;                           
wire            ldst_type_match;                           
wire            ldst_type_size_match;                      
wire    [31:0]  ldst_value;                                
wire    [31:0]  ldst_value_before_size_mask;               
wire            ldst_value_equal;                          
wire    [7 :0]  ldst_value_masked_low_8bis;                
wire            ldst_value_match;                          
wire    [31:0]  ldst_value_top_mbits;                      
wire            ldst_value_top_mbits_equal;                
wire            load_addr_mcontrol;                        
wire            load_addr_vld;                             
wire            load_data_mcontrol;                        
wire            load_data_trigger;                         
wire            load_data_vld;                             
wire    [31:0]  lsu_dtu_ldst_addr;                         
wire            lsu_dtu_ldst_addr_vld;                     
wire    [7 :0]  lsu_dtu_ldst_bytes_vld;                    
wire            lsu_dtu_ldst_data_vld;                     
wire            lsu_have_bytes_vld;                        
wire            m_enable;                                  
wire    [7 :0]  m_mask;                                    
wire            m_mode;                                    
wire    [5 :0]  maskmax;                                   
wire            match_is_legal;                            
wire    [3 :0]  match_legal;                               
wire    [31:0]  mcontext;                                  
wire            mcontext_enable;                           
wire            mcontext_must_match;                       
wire    [1 :0]  mpriority_after_chain;                     
wire    [1 :0]  mpriority_mask_after_chain;                
wire            ms_context_enable;                         
wire            msu_mode_enable;                           
wire            mtiming;                                   
wire            mtiming_after_chain;                       
wire            mtiming_mask;                              
wire            mtiming_mask_after_chain;                  
wire            not_dbg_mode_enable;                       
wire            pad_yy_icg_scan_en;                        
wire            previous_trigger_chian;                    
wire            previous_trigger_dmode;                    
wire            rtu_yy_xx_dbgon;                           
wire            set_trigger_hit;                           
wire            size_is_legal;                             
wire    [1 :0]  size_legal;                                
wire            store_addr_mcontrol;                       
wire            store_addr_vld;                            
wire            store_data_mcontrol;                       
wire            store_data_vld;                            
wire    [31:0]  tcontrol;                                  
wire            tcontrol_enable;                           
wire    [31:0]  tdata1;                                    
wire            tdata1_action0;                            
wire            tdata1_action1;                            
wire            tdata1_chain;                              
wire            tdata1_chain_for_macro;                    
wire            tdata1_execute_for_macro;                  
wire            tdata1_load_for_macro;                     
wire            tdata1_matchinfo_clk;                      
wire            tdata1_matchinfo_clk_en;                   
wire            tdata1_select_for_macro;                   
wire    [1 :0]  tdata1_size;                               
wire            tdata1_store_for_macro;                    
wire            tdata23_clk;                               
wire            tdata23_clk_en;                            
wire    [3 :0]  tdata2_4bits_value_for_m_mask;             
wire    [7 :0]  tdata2_exe_value_masked_low_8bits;         
wire    [31:0]  tdata2_exe_value_top_mbits;                
wire    [7 :0]  tdata2_ldst_addr_masked_low_8bits;         
wire    [7 :0]  tdata2_ldst_bytes_vld;                     
wire    [7 :0]  tdata2_ldst_bytes_vld_for_match1;          
wire    [31:0]  tdata2_ldst_value_top_mbits;               
wire    [31:0]  tdata2_value;                              
wire    [31:0]  tdata2_value_before_size_mask;             
wire    [31:0]  tdata3;                                    
wire            tdata_writable;                            
wire            timing_exe_or_wdata;                       
wire            timing_legal;                              
wire    [31:0]  tinfo;                                     
wire            tri_already_match;                         
wire            trigger_enable;                            
wire            trigger_selected;                          
wire    [3 :0]  type_legal;                                
wire            u_enable;                                  
wire            u_mode;                                    
wire    [1 :0]  wdata_tdata1_size;                         
wire            write_tdata1;                              
wire            write_tdata2;                              
wire            zero_lsb_higher_than_4;                    


//XLEN
parameter XLEN       = `TDT_DM_CORE_MAX_XLEN;
//parameter (`TDT_DM_CORE_HALF_XLEN)  = (`TDT_DM_CORE_HALF_XLEN);

//tdata1 parameter
parameter TYPE_TDATA1       = XLEN-1;
parameter DMODE      = XLEN-5;

//mcontrol parameter
parameter SIZEHI     = 22;
parameter HIT        = 20;
parameter SELECT_TDATA1     = 19;
parameter TIMING     = 18;
parameter SIZELO     = 17;
parameter ACTION     = 15;
parameter CHAIN      = 11;
parameter MATCH      = 10;
parameter M          = 6;
parameter S          = 4;
parameter U          = 3;
parameter EXECUTE    = 2;
parameter STORE      = 1;
parameter LOAD       = 0;

//tdata3 parameter
parameter MVALUE     = 31;
parameter MSELECT_TDATA1    = 25;

//tcontrol parameter
//parameter MPTE       = 7;
parameter MTE        = 3;

//=========================================================
//
//                       tdata1 wdata legalization
//
//=========================================================

//type
assign type_legal[3:0] = 4'd2;//mcontrol type = 2

//dmode
// &CombBeg; @70
always @( rtu_yy_xx_dbgon
       or previous_trigger_dmode
       or cp0_dtu_wdata[27]
       or tdata1[27]
       or previous_trigger_chian)
begin
  if(!rtu_yy_xx_dbgon)//dmode only writable in debug mode
    dmode_legal = tdata1[DMODE]; 
  else if(!previous_trigger_dmode && previous_trigger_chian)
    dmode_legal = 1'b0;
  else
    dmode_legal = cp0_dtu_wdata[DMODE];
// &CombEnd; @77
end

//---------------------------------------------------------
//                 mcontrol tdata1 wdata legalization
//---------------------------------------------------------
//size
assign wdata_tdata1_size[1:0] = cp0_dtu_wdata[SIZELO:SIZELO-1];
assign exe_size_is_legal  = cp0_dtu_wdata[EXECUTE] && (wdata_tdata1_size[1:0] == 2'd0 ||
                            wdata_tdata1_size[1:0] == 2'd2 || wdata_tdata1_size[1:0] == 2'd3);//exe only suppurt size = 0,2,3
    
assign ldst_size_is_legal = (cp0_dtu_wdata[LOAD] || cp0_dtu_wdata[STORE]) && (wdata_tdata1_size[1:0] == 2'd0 || wdata_tdata1_size[1:0] == 2'd1 ||
                             wdata_tdata1_size[1:0] == 2'd2 || wdata_tdata1_size[1:0] == 2'd3);
// &Force("nonport","ldst_size_is_legal"); @97
assign size_is_legal      = exe_size_is_legal || ldst_size_is_legal;
assign size_legal[1:0]    = size_is_legal ? wdata_tdata1_size[1:0] : 2'b0;

//action
assign action_is_legal   = cp0_dtu_wdata[ACTION:ACTION-2] == 3'd0 && dmode_legal;
//(1)action <= 1;(2)dmode=1;action can be set to 0 or 1.
assign action_legal = action_is_legal ? cp0_dtu_wdata[ACTION-3] : 1'b0;

//match
assign match_is_legal   = cp0_dtu_wdata[MATCH:MATCH-3] == 4'd0 || cp0_dtu_wdata[MATCH:MATCH-3] == 4'd1;

assign match_legal[3:0] = match_is_legal ? cp0_dtu_wdata[MATCH:MATCH-3] : 4'b0;

//timing
assign load_data_trigger = 1'b0;
assign timing_exe_or_wdata = cp0_dtu_wdata[EXECUTE] ? 1'b0 : cp0_dtu_wdata[TIMING];
assign timing_legal = load_data_trigger ? 1'b1 : timing_exe_or_wdata;

//chain
//1.if previous trigger chain=1, this trigger chain can't set to 1.
//2.if next trigger chain=1, this trigger chain can't set to 1.
//3.if next trigger dmode =1, this write operation will set this trigger dmode to 0,
//then the write operation can't set this trigger chain to 1.
//     &Force("input","previous_trigger_chian"); @146
//     &Force("input","next_trigger_chain"); @147
//     &Force("input","next_trigger_dmode"); @148
// &Force("input","previous_trigger_chian"); @155
// &Force("input","next_trigger_chain"); @156
// &Force("input","next_trigger_dmode"); @157

//---------------------------------------------------------
//                legal tdata1 wdata
//---------------------------------------------------------
assign maskmax[5:0] = 6'd8;//TODO

//=========================================================
//
//                    write trigger CSR
//
//=========================================================

//---------------------------------------------------------
//                    write and update tdata1 
//---------------------------------------------------------

assign tdata_writable = !tdata1[DMODE] && (m_mode || rtu_yy_xx_dbgon) ||
                         tdata1[DMODE] && rtu_yy_xx_dbgon;
assign write_tdata1 = cp0_write_tdata1 && trigger_selected && tdata_writable;

always @(posedge tdata1_matchinfo_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      tdata1_dmode       <= 1'b0;
      tdata1_timing      <= 1'b0;
      tdata1_sizelo[1:0] <= 2'b0;
      tdata1_action      <= 1'b0;
      tdata1_match[3:0]  <= 4'b0;
      tdata1_m           <= 1'b0;
      tdata1_u           <= 1'b0;
      tdata1_store       <= 1'b0;
      tdata1_load        <= 1'b0;
      tdata1_execute     <= 1'b0;
    end
  else if(write_tdata1)
    begin
      tdata1_dmode       <= dmode_legal;
      tdata1_timing      <= timing_legal;
      tdata1_sizelo[1:0] <= size_legal[1:0];
      tdata1_action      <= action_legal;
      tdata1_match[3:0]  <= match_legal[3:0];
      tdata1_m           <= cp0_dtu_wdata[M];
      tdata1_u           <= cp0_dtu_wdata[U];
      tdata1_store       <= cp0_dtu_wdata[STORE];
      tdata1_load        <= cp0_dtu_wdata[LOAD];
      tdata1_execute     <= cp0_dtu_wdata[EXECUTE];
  end
end
always @(posedge tdata1_matchinfo_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      size1 <= 1'b0;
      size2 <= 1'b0;
    end
  else if(write_tdata1)
    begin
      size1 <= size_legal[1:0] == 2'd1;
      size2 <= size_legal[1:0] == 2'd2; 
    end
end

always @(posedge tdata1_matchinfo_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tdata1_hit <= 1'b0;
  else if(set_trigger_hit)
    tdata1_hit <= 1'b1;
  else if(write_tdata1)
    tdata1_hit <= cp0_dtu_wdata[HIT];
end

    assign tdata1_select_for_macro = 1'b0;
assign tdata1_execute_for_macro = tdata1_execute;
 assign tdata1_store_for_macro = tdata1_store;
 assign tdata1_load_for_macro = tdata1_load;

assign tdata1_chain = 1'b0;
assign tdata1_chain_for_macro = tdata1_chain;

assign tdata1[XLEN-1:0] = {type_legal[3:0],tdata1_dmode,maskmax[5:0],
                           tdata1_hit,tdata1_select_for_macro,tdata1_timing,tdata1_sizelo[1:0],3'b0,tdata1_action,
                           tdata1_chain_for_macro,tdata1_match[3:0],tdata1_m,1'b0,1'b0,tdata1_u,
                           tdata1_execute_for_macro,tdata1_store_for_macro,tdata1_load_for_macro}; 

// &Force("output","tdata1");&Force("bus","tdata1",XLEN-1,0); @291

always @(posedge tdata1_matchinfo_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    write_tdata1_f <= 1'b0;
  else
    write_tdata1_f <= write_tdata1;
end
// &Force("nonport","write_tdata1_f"); @300
//tdata1 output
// &Force("output","tdata1_chain"); @302
// &Force("output","tdata1_dmode"); @303
// &Force("output","tdata1_timing"); @304
//assign tdata1_chain  = tdata1[CHAIN];
//assign tdata1_dmode  = tdata1[DMODE];
assign tdata1_action0 = !tdata1[ACTION-3];
assign tdata1_action1 = tdata1[ACTION-3];
//assign tdata1_timing = tdata1[TIMING];

//---------------------------------------------------------
//                    write tdata2
//---------------------------------------------------------
assign write_tdata2 = cp0_write_tdata2 && trigger_selected && tdata_writable;
always @(posedge tdata23_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tdata2[XLEN-1:0] <= {XLEN{1'b0}};
  else if(write_tdata2)
    tdata2[XLEN-1:0] <= cp0_dtu_wdata[XLEN-1:0];
end
// &Force("output","tdata2");&Force("bus","tdata2",XLEN-1,0); @322

always @(posedge tdata23_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    write_tdata2_f <= 1'b0;
  else
    write_tdata2_f <= write_tdata2;
end
// &Force("nonport","write_tdata2_f"); @331
//---------------------------------------------------------
//                    write tdata3
//---------------------------------------------------------

//write tdata3
always @(posedge tdata23_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      tdata3_mvalue[5:0] <= 6'b0;
      tdata3_mselect      <= 1'b0;
    end
  else if(cp0_write_tdata3 && trigger_selected && tdata_writable)
    begin
      tdata3_mvalue[5:0] <= cp0_dtu_wdata[MVALUE:MVALUE-5];
      tdata3_mselect      <= cp0_dtu_wdata[MSELECT_TDATA1];
    end
end
assign tdata3[XLEN-1:0] = {tdata3_mvalue[5:0],tdata3_mselect,25'b0};
// &Force("output","tdata3");&Force("bus","tdata3",XLEN-1,0); @351
//---------------------------------------------------------
//                    tinfo(read only)
//---------------------------------------------------------
assign tinfo[XLEN-1:0] = {{XLEN-3{1'b0}},3'b100};
// &Force("output","tinfo");&Force("bus","tinfo",XLEN-1,0); @356
//mcontrol type =2

//=========================================================
//
//                        decode
//
//=========================================================
//---------------------------------------------------------
//                  trigger enable signal
//---------------------------------------------------------
//tcontrol enable
//assign tdata1_action[3:0] = tdata1[ACTION:ACTION-3];

assign tcontrol_enable = !(!tcontrol[MTE] && !tdata1_action && m_mode);//!(MTE=0 && action=0 && m_mode)
// &Force("bus","tcontrol",XLEN-1,0); @371

//m s context enable
assign mcontext_must_match = tdata3[MSELECT_TDATA1] && m_mode;
assign mcontext_enable = mcontext_must_match ? tdata3[MVALUE:MVALUE-5] == mcontext[5:0] : 1'b1;
// &Force("bus","mcontext",XLEN-1,0); @376

assign ms_context_enable = mcontext_enable;
assign m_enable = tdata1[M] && m_mode;
assign u_enable = tdata1[U] && u_mode;

assign msu_mode_enable = m_enable || u_enable;

//trigger can't match in debug mode
assign not_dbg_mode_enable = !rtu_yy_xx_dbgon;

//trigger enable
assign trigger_enable = tcontrol_enable && ms_context_enable &&
                        msu_mode_enable && not_dbg_mode_enable;

//---------------------------------------------------------
//               information for match 
//---------------------------------------------------------
//type of mcontrol
assign exe_mcontrol        = tdata1[EXECUTE];
assign ldst_mcontrol       = tdata1[LOAD] || tdata1[STORE];
// &Force("output","exe_mcontrol"); @397
// &Force("output","ldst_mcontrol"); @398
assign exe_addr_mcontrol   = tdata1[EXECUTE] && !tdata1[SELECT_TDATA1];
assign exe_data_mcontrol   = tdata1[EXECUTE] && tdata1[SELECT_TDATA1];

assign store_addr_mcontrol = tdata1[STORE] && !tdata1[SELECT_TDATA1];
assign store_data_mcontrol = tdata1[STORE] && tdata1[SELECT_TDATA1];
//assign load_mcontrol       = tdata1[LOAD];
//assign ldst_mcontrol       = store_mcontrol && load_mcontrol; 
assign load_addr_mcontrol  = tdata1[LOAD] && !tdata1[SELECT_TDATA1];
assign load_data_mcontrol  = tdata1[LOAD] && tdata1[SELECT_TDATA1];

assign ldst_addr_mcontrol = store_addr_mcontrol || load_addr_mcontrol;
assign ldst_data_mcontrol = store_data_mcontrol || load_data_mcontrol;
//priorty
// &CombBeg; @414
always @( tdata1[2]
       or tdata1[19])
begin
  if(tdata1[EXECUTE] && !tdata1[SELECT_TDATA1])
    begin
      mpriority[1:0] = 2'b10;
      mpriority_mask[1:0] = 2'b00;
    end
  else if(tdata1[EXECUTE] && tdata1[SELECT_TDATA1])
    begin
      mpriority[1:0] = 2'b01;
      mpriority_mask[1:0] = 2'b10;
    end
  else//ldst mcontrol or no mcontrol
    begin
      mpriority[1:0] = 2'b00;
      mpriority_mask[1:0] = 2'b11;
    end
// &CombEnd; @430
end
//mtiming
assign mtiming      = !tdata1[TIMING];
assign mtiming_mask = tdata1[TIMING];
// &Force("output","mpriority");&Force("bus","mpriority",1,0); @434
// &Force("output","mpriority_mask");&Force("bus","mpriority_mask",1,0); @435
// &Force("output","mtiming"); @436
// &Force("output","mtiming_mask"); @437

// &CombBeg; @443
// &CombEnd; @459
// &CombBeg; @463
// &CombEnd; @479
// &Force("input","previous_mpriority");&Force("bus","previous_mpriority",1,0); @480
// &Force("input","previous_mpriority_mask");&Force("bus","previous_mpriority_mask",1,0); @481
// &Force("input","next_mpriority");&Force("bus","next_mpriority",1,0); @482
// &Force("input","next_mpriority_mask");&Force("bus","next_mpriority_mask",1,0); @483
// &Force("input","previous_mtiming"); @484
// &Force("input","previous_mtiming_mask"); @485
// &Force("input","next_mtiming"); @486
// &Force("input","next_mtiming_mask"); @487
assign mpriority_after_chain[1:0]     = mpriority[1:0];
assign mpriority_mask_after_chain[1:0]= mpriority_mask[1:0];
assign mtiming_after_chain            = mtiming;
assign mtiming_mask_after_chain       = mtiming_mask;
// &Force("input","previous_mpriority");&Force("bus","previous_mpriority",1,0); @493
// &Force("input","previous_mpriority_mask");&Force("bus","previous_mpriority_mask",1,0); @494
// &Force("input","next_mpriority");&Force("bus","next_mpriority",1,0); @495
// &Force("input","next_mpriority_mask");&Force("bus","next_mpriority_mask",1,0); @496
// &Force("input","previous_mtiming"); @497
// &Force("input","previous_mtiming_mask"); @498
// &Force("input","next_mtiming"); @499
// &Force("input","next_mtiming_mask"); @500

//size
assign tdata1_size[1:0]    = tdata1[SIZELO:SIZELO-1];

//assign size_mask_63_32 = !(size1 || size2 || size3);
//assign size_mask_31_16 = !(size1 || size2);
//assign size_mask_15_8  = !size1;
//assign size_mask[XLEN-1:0] = {{32{size_mask_63_32}},{16{size_mask_31_16}},{8{size_mask_15_8}},{8{1'b1}}};
// &CombBeg; @510
always @( size1
       or size2)
begin
  if(size1)
    size_mask[XLEN-1:0] = 32'h0000_00ff;
  else if(size2)
    size_mask[XLEN-1:0] = 32'h0000_ffff;
  else
    size_mask[XLEN-1:0] = 32'hffff_ffff;
// &CombEnd; @517
end

always @(posedge tdata1_matchinfo_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    match_ldst_addr <= 1'b0;
  else if(!tdata1[SELECT_TDATA1] && (tdata1[LOAD] || tdata1[STORE]))
    match_ldst_addr <= 1'b1;
  else if(tdata1[LOAD] || tdata1[STORE] || tdata1[EXECUTE])
    match_ldst_addr <= 1'b0;
end

//tdata2 need to be masked off by size
assign tdata2_value_before_size_mask[XLEN-1:0] = {tdata2[XLEN-1:3], tdata2[2:0] & {3{!match_ldst_addr}}};
assign tdata2_value[XLEN-1:0] = tdata2_value_before_size_mask[XLEN-1:0] & size_mask[XLEN-1:0];

//translate tdata2[23:20] to bytes_vld. when select = 0, match = 4.
//tdata2_ldst_value_lower_half == ldst_value_lower_half & tdata2_exe_value_upper_half
//tdata2_ldst_bytes_vld == lsu_dtu_ldst_bytes_vld & tdata2_ldst_bytes_vld_for_match4

 //tdata2[3:0] generate low_bytes_vld
// &CombBeg; @558
always @( tdata2[1:0])
begin
  case(tdata2[1:0])
    2'b00:
      begin
        tdata2_ldst_bytes_vld_four_bits[3:0]             = 4'b0001;
        tdata2_ldst_bytes_vld_for_match1_four_bits[3:0] = 4'b0011;
      end
    2'b01:
      begin
        tdata2_ldst_bytes_vld_four_bits[3:0]             = 4'b0010;
        tdata2_ldst_bytes_vld_for_match1_four_bits[3:0] = 4'b1111;
      end
    2'b10:
      begin
        tdata2_ldst_bytes_vld_four_bits[3:0]             = 4'b0100;
        tdata2_ldst_bytes_vld_for_match1_four_bits[3:0] = 4'b1100;
      end
    2'b11:
      begin
        tdata2_ldst_bytes_vld_four_bits[3:0]             = 4'b1000;
        tdata2_ldst_bytes_vld_for_match1_four_bits[3:0] = 4'b1111;
      end
    default:
      begin
        tdata2_ldst_bytes_vld_four_bits[3:0]             = {4{1'bx}};
        tdata2_ldst_bytes_vld_for_match1_four_bits[3:0] = {4{1'bx}};
      end
 endcase
// &CombEnd; @611
end
assign tdata2_ldst_bytes_vld[7:0] = tdata2[2] ? {tdata2_ldst_bytes_vld_four_bits[3:0],4'b0} : {4'b0,tdata2_ldst_bytes_vld_four_bits[3:0]};
assign tdata2_ldst_bytes_vld_for_match1[7:0] = tdata2[2] ? {{4{tdata2[1] && tdata2[0]}},tdata2_ldst_bytes_vld_for_match1_four_bits[3:0]} :
                                                           {tdata2_ldst_bytes_vld_for_match1_four_bits[3:0],{4{tdata2[1] && tdata2[0]}}};
//when tdata2[1] && tdata2[0] = 1, bytes_vld_for_match1 should be 8'bff no matter what tdata2[2] is

// &CombBeg; @625
// &CombEnd; @642

// &CombBeg; @645
always @( tdata2_ldst_bytes_vld_for_match1[7:0]
       or tdata2_ldst_bytes_vld[7:0]
       or tdata1[10:7])
begin
  case(tdata1[MATCH:MATCH-3])
    4'd0:tdata2_ldst_bytes_vld_0[7:0] = tdata2_ldst_bytes_vld[7:0];
    4'd1:tdata2_ldst_bytes_vld_0[7:0] = tdata2_ldst_bytes_vld_for_match1[7:0];
    default:tdata2_ldst_bytes_vld_0[7:0] = {8{1'bx}};
  endcase
// &CombEnd; @661
end

//when match = 4, need reg_0 and reg_1 both.
always @(posedge tdata1_matchinfo_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    tdata2_ldst_bytes_vld_reg_0[7:0] <= 8'b0;
  else if(tdata1[STORE] && !tdata1[SELECT_TDATA1] || tdata1[LOAD] && !tdata1[SELECT_TDATA1])
    tdata2_ldst_bytes_vld_reg_0[7:0] <= tdata2_ldst_bytes_vld_0[7:0];
end

//----------------------maksed value for match = 1------------------------------------
assign zero_lsb_higher_than_4 = tdata2[3:0] == 4'b1111;
assign tdata2_4bits_value_for_m_mask[3:0] = zero_lsb_higher_than_4 ? tdata2[7:4] : tdata2[3:0];
// &CombBeg; @677
always @( tdata2_4bits_value_for_m_mask[3:0])
begin
  //m_mask and ldst_addr_mask(maskmax = 8). the low 4 bit of ldst addr are 0 
  casez(tdata2_4bits_value_for_m_mask[3:0]) 
    4'b???0:m_mask_four_bits[3:0] = 4'b1110;
    4'b??01:m_mask_four_bits[3:0] = 4'b1100;
    4'b?011:m_mask_four_bits[3:0] = 4'b1000;
    4'b0111:m_mask_four_bits[3:0] = 4'b0000;
    4'b1111:m_mask_four_bits[3:0] = 4'b0000;
    default:m_mask_four_bits[3:0] = {4{1'bx}};
  endcase
// &CombEnd; @687
end

assign m_mask[7:0]            = zero_lsb_higher_than_4 ? {m_mask_four_bits[3:0],4'b0} : {4'b1111,m_mask_four_bits[3:0]};

always @(posedge tdata1_matchinfo_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    m_mask_reg[7:0]             <= 8'b11111111;
  else if(tdata1[MATCH:MATCH-3] == 4'b1)
    m_mask_reg[7:0]             <= m_mask[7:0];
end 

//exe top M bits
assign tdata2_exe_value_masked_low_8bits[7:0]   = tdata2_value[7:0] & m_mask_reg[7:0];
assign tdata2_exe_value_top_mbits[XLEN-1:0]       = {tdata2_value[XLEN-1:8],tdata2_exe_value_masked_low_8bits[7:0]};

//ldst top M bits
assign ldst_m_mask[7:0] = tdata1[SELECT_TDATA1] ? m_mask_reg[7:0] : {m_mask_reg[7:3],3'b0};
assign tdata2_ldst_addr_masked_low_8bits[7:0]   = tdata2_value[7:0] & ldst_m_mask[7:0];
assign tdata2_ldst_value_top_mbits[XLEN-1:0]      = {tdata2_value[XLEN-1:8],tdata2_ldst_addr_masked_low_8bits[7:0]};

//=========================================================
//
//               exe0 match logic
//
//=========================================================
//---------------------------------------------------------
//              exe0 type match and size match
//---------------------------------------------------------
assign exe0_type_match      = ifu_dtu_addr_vld0 && exe_addr_mcontrol || ifu_dtu_data_vld0 && exe_data_mcontrol;
assign exe0_size_match      = tdata1_size[1:0] == 2'd0 || size2 && exe0_16bit || 
                              tdata1_size[1:0] == 2'd3 && exe0_32bit || (ifu_dtu_addr_vld0 && !ifu_dtu_data_vld0);
assign exe0_type_size_match = exe0_type_match && exe0_size_match && trigger_enable;
//---------------------------------------------------------
//               exe0 value match
//---------------------------------------------------------
//value for exe0 trigger match
assign exe0_value_before_size_mask[XLEN-1:0] = ifu_dtu_exe_addr0[`PA_WIDTH-1:0];
assign exe0_value[XLEN-1:0]       = exe0_value_before_size_mask[XLEN-1:0] & size_mask[XLEN-1:0];
assign exe0_value_masked_low_8bis[7:0]   = exe0_value[7:0] & m_mask_reg[7:0];
assign exe0_value_top_mbits[XLEN-1:0]      = {exe0_value[XLEN-1:8],exe0_value_masked_low_8bis[7:0]};

//value match
assign exe0_match_equal              = exe0_value[XLEN-1:0] == tdata2_value[XLEN-1:0];//match = 0
assign exe0_match_top_mbits_equal    = exe0_value_top_mbits[XLEN-1:0] == tdata2_exe_value_top_mbits[XLEN-1:0];//match = 1

assign exe0_have_value_match0 = tdata1[MATCH:MATCH-3] == 4'd0 && exe0_match_equal;
assign exe0_have_value_match1 = tdata1[MATCH:MATCH-3] == 4'd1 && exe0_match_top_mbits_equal;

assign exe0_value_match = exe0_have_value_match0 || exe0_have_value_match1;
//---------------------------------------------------------
//             exe0 match result
//---------------------------------------------------------
assign exe0_match_need_reg   = exe0_value_match && exe0_type_size_match;
always @(posedge tdata1_matchinfo_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    exe0_match      <= 1'b0;
  else
    exe0_match      <= exe0_match_need_reg;
end
// &Force("output","exe0_match"); @820

assign exe0_may_hit = exe0_value_match;// && ifu_dtu_addr_vld0;

//=========================================================
//
//                     exe1 match logic
//               
//=========================================================
//---------------------------------------------------------
//              exe1 type match and size match
//---------------------------------------------------------
assign exe1_type_match      = ifu_dtu_addr_vld1 && exe_addr_mcontrol || ifu_dtu_data_vld1 && exe_data_mcontrol;
assign exe1_size_match      = tdata1_size[1:0] == 2'd0 || size2 && exe1_16bit || 
                              tdata1_size[1:0] == 2'd3 && exe1_32bit || (ifu_dtu_addr_vld1 && !ifu_dtu_data_vld1);
assign exe1_type_size_match = exe1_type_match && exe1_size_match && trigger_enable;
//---------------------------------------------------------
//               exe1 value match
//---------------------------------------------------------
//value for exe1 trigger match
assign exe1_value_before_size_mask[XLEN-1:0] = ifu_dtu_exe_addr1[`PA_WIDTH-1:0];
assign exe1_value[XLEN-1:0]       = exe1_value_before_size_mask[XLEN-1:0] & size_mask[XLEN-1:0];
assign exe1_value_masked_low_8bis[7:0]   = exe1_value[7:0] & m_mask_reg[7:0];
assign exe1_value_top_mbits[XLEN-1:0]      = {exe1_value[XLEN-1:8],exe1_value_masked_low_8bis[7:0]};

//value match
assign exe1_match_equal              = exe1_value[XLEN-1:0] == tdata2_value[XLEN-1:0];//match = 0
assign exe1_match_top_mbits_equal    = exe1_value_top_mbits[XLEN-1:0] == tdata2_exe_value_top_mbits[XLEN-1:0];//match = 1


assign exe1_have_value_match0 = tdata1[MATCH:MATCH-3] == 4'd0 && exe1_match_equal;
assign exe1_have_value_match1 = tdata1[MATCH:MATCH-3] == 4'd1 && exe1_match_top_mbits_equal;

assign exe1_value_match = exe1_have_value_match0 || exe1_have_value_match1;
//---------------------------------------------------------
//             exe1 match result
//---------------------------------------------------------
assign exe1_match_need_reg   = exe1_value_match && exe1_type_size_match;
always @(posedge tdata1_matchinfo_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    exe1_match      <= 1'b0;
  else
    exe1_match      <= exe1_match_need_reg;
end
// &Force("output","exe1_match"); @916

assign exe1_may_hit = exe1_value_match;// && ifu_dtu_addr_vld1;
// &Force("input","exe0_16bit"); @920
// &Force("input","exe0_32bit"); @921
// &Force("input","exe1_16bit"); @922
// &Force("input","exe1_32bit"); @923
// &Force("input","ifu_dtu_addr_vld0"); @924
// &Force("input","ifu_dtu_addr_vld1"); @925
// &Force("input","ifu_dtu_data_vld0"); @926
// &Force("input","ifu_dtu_data_vld1"); @927
// &Force("input","ifu_dtu_exe_addr0");&Force("bus","ifu_dtu_exe_addr0",`PA_WIDTH-1,0); @928
// &Force("input","ifu_dtu_exe_addr1");&Force("bus","ifu_dtu_exe_addr1",`PA_WIDTH-1,0); @929
// &Force("input","ifu_dtu_exe_data0");&Force("bus","ifu_dtu_exe_data0",31,0); @930
// &Force("input","ifu_dtu_exe_data1");&Force("bus","ifu_dtu_exe_data1",31,0); @931
// &Force("output","exe0_match"); @932
// &Force("output","exe1_match"); @933

//=========================================================
//             
//                    ldst match logic
//             
//=========================================================
//---------------------------------------------------------
//              ldst type match and size match
//---------------------------------------------------------
assign ldst_type_match = store_addr_vld  && store_addr_mcontrol ||
                         store_data_vld  && store_data_mcontrol ||
                         load_addr_vld && load_addr_mcontrol || 
                         load_data_vld && load_data_mcontrol;
assign ldst_size_match = tdata1_size[1:0] == 2'd0 || size1 && ldst_8bit || 
                         size2 && ldst_16bit || tdata1_size[1:0] == 2'd3 && ldst_32bit;
assign ldst_type_size_match = ldst_type_match && ldst_size_match && trigger_enable;

//---------------------------------------------------------
//               ldst value match
//---------------------------------------------------------
//value for ldst trigger match
// &Force("input","lsu_dtu_ldst_addr");&Force("bus","lsu_dtu_ldst_addr",`PA_WIDTH-1,0); @963
// &Force("input","lsu_dtu_ldst_data");&Force("bus","lsu_dtu_ldst_data",XLEN-1,0); @964
assign ldst_value_before_size_mask[XLEN-1:0] = {lsu_dtu_ldst_addr[`PA_WIDTH-1:3],3'b0};

assign ldst_value[XLEN-1:0]       = ldst_value_before_size_mask[XLEN-1:0] & size_mask[XLEN-1:0];

//masked value
assign ldst_value_masked_low_8bis[7:0]   = ldst_value[7:0] & ldst_m_mask[7:0];
assign ldst_value_top_mbits[XLEN-1:0]      = {ldst_value[XLEN-1:8],ldst_value_masked_low_8bis[7:0]};

//value match
assign lsu_have_bytes_vld = |lsu_dtu_ldst_bytes_vld[7:0];
// &Force("nonport","lsu_have_bytes_vld"); @990
assign bytes_vld_match = |(lsu_dtu_ldst_bytes_vld[7:0] & tdata2_ldst_bytes_vld_reg_0[7:0]);
//match = 0
assign ldst_value_equal           = ldst_value[XLEN-1:0] == tdata2_value[XLEN-1:0];
assign ldst_bytes_vld_equal       = bytes_vld_match;
assign ldst_addr_match_equal      = ldst_bytes_vld_equal && ldst_value_equal;
assign ldst_match_equal           = ldst_addr_match_equal;

//match = 1
assign ldst_value_top_mbits_equal = ldst_value_top_mbits[XLEN-1:0] == tdata2_ldst_value_top_mbits[XLEN-1:0];
assign ldst_bytes_vld_mbits_equal = bytes_vld_match;
assign ldst_addr_top_mbits_equal  = ldst_value_top_mbits_equal && ldst_bytes_vld_mbits_equal;
assign ldst_match_top_mbits_equal = ldst_addr_top_mbits_equal;




assign ldst_have_value_match0 = tdata1[MATCH:MATCH-3] == 4'd0 && ldst_match_equal;
assign ldst_have_value_match1 = tdata1[MATCH:MATCH-3] == 4'd1 && ldst_match_top_mbits_equal;

assign ldst_value_match = ldst_have_value_match0 || ldst_have_value_match1;
//---------------------------------------------------------
//             ldst match result
//---------------------------------------------------------
assign tri_already_match        = already_match && (lsu_dtu_ldst_addr_vld || lsu_dtu_ldst_data_vld);
assign ldst_mcontrol_match     = ldst_value_match && ldst_type_size_match;
assign ldst_match_need_reg      = ldst_mcontrol_match || tri_already_match;

always @(posedge tdata1_matchinfo_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ldst_match      <= 1'b0;
  else
    ldst_match      <= ldst_match_need_reg;
end
// &Force("output","ldst_match"); @1176
//assign ldst_may_hit = ldst_cycle2_cannot_match ? 1'b0 : ldst_match_need_reg;
assign ldst_may_hit = ldst_match_need_reg;//ldst_value_match || tri_already_match;
// &Force("input","already_match"); @1180
// &Force("input","ldst_8bit"); @1181
// &Force("input","ldst_16bit"); @1182
// &Force("input","ldst_32bit"); @1183
// &Force("input","store_addr_vld"); @1184
// &Force("input","store_data_vld"); @1185
// &Force("input","load_addr_vld"); @1186
// &Force("input","load_data_vld"); @1187
// &Force("input","lsu_dtu_ldst_addr_vld"); @1188
// &Force("input","lsu_dtu_ldst_data_vld"); @1189
// &Force("input","lsu_dtu_ldst_addr");&Force("bus","lsu_dtu_ldst_addr",`PA_WIDTH-1,0); @1190
// &Force("input","lsu_dtu_ldst_data");&Force("bus","lsu_dtu_ldst_data",XLEN-1,0); @1191
// &Force("input","lsu_dtu_ldst_bytes_vld");&Force("bus","lsu_dtu_ldst_bytes_vld",7,0); @1192
// &Force("output","ldst_match"); @1193

//==========================================================
//                     gate clk
//==========================================================
assign tdata1_matchinfo_clk_en = trigger_selected && 
                    (cp0_write_tdata1    || write_tdata2_f || write_tdata1_f) ||
                     exe0_match_need_reg || exe0_match ||
                     exe1_match_need_reg || exe1_match ||
                     ldst_match_need_reg || ldst_match ||
                     set_trigger_hit;
// &Instance("gated_clk_cell", "x_tdata1_matchinfo_reg_gated_clk"); @1208
gated_clk_cell  x_tdata1_matchinfo_reg_gated_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (tdata1_matchinfo_clk   ),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (tdata1_matchinfo_clk_en),
  .module_en               (cp0_dtu_icg_en         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Connect(.clk_in      (forever_cpuclk), @1209
//          .external_en (1'b0), @1210
//          .global_en   (cp0_yy_clk_en), @1211
//          .module_en   (cp0_dtu_icg_en), @1212
//          .local_en    (tdata1_matchinfo_clk_en), @1213
//          //.local_en    (1'b1), @1214
//          .clk_out     (tdata1_matchinfo_clk)); @1215

//make tdata2, tdata3 a gated clk cell
assign tdata23_clk_en = trigger_selected && (cp0_write_tdata2 || cp0_write_tdata3 || write_tdata2_f);
// &Instance("gated_clk_cell", "x_tdata23_reg_gated_clk"); @1219
gated_clk_cell  x_tdata23_reg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (tdata23_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (tdata23_clk_en    ),
  .module_en          (cp0_dtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1220
//          .external_en (1'b0), @1221
//          .global_en   (cp0_yy_clk_en), @1222
//          .module_en   (cp0_dtu_icg_en), @1223
//          .local_en    (tdata23_clk_en), @1224
//          //.local_en    (1'b1), @1225
//          .clk_out     (tdata23_clk)); @1226
// &ModuleEnd; @1227
endmodule


