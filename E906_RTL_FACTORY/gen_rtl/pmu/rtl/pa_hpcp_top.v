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

// &ModuleBeg; @22
module pa_hpcp_top(
  cp0_hpcp_icg_en,
  cp0_hpcp_index,
  cp0_hpcp_pmdm,
  cp0_hpcp_pmdu,
  cp0_hpcp_wdata,
  cp0_hpcp_wreg,
  cp0_yy_priv_mode,
  cpurst_b,
  dtu_hpcp_dcsr_stopcount,
  forever_cpuclk,
  hpcp_cp0_data,
  ifu_hpcp_icache_access,
  ifu_hpcp_icache_miss,
  iu_hpcp_inst_bht_mispred,
  iu_hpcp_inst_condbr,
  iu_hpcp_inst_condbr_gate,
  lsu_hpcp_cache_read_access,
  lsu_hpcp_cache_read_access_gate,
  lsu_hpcp_cache_read_miss,
  lsu_hpcp_cache_read_miss_gate,
  lsu_hpcp_cache_write_access,
  lsu_hpcp_cache_write_access_gate,
  lsu_hpcp_cache_write_miss,
  lsu_hpcp_cache_write_miss_gate,
  lsu_hpcp_inst_store,
  lsu_hpcp_inst_store_gate,
  pad_yy_icg_scan_en,
  rtu_hpcp_retire_inst_vld,
  rtu_yy_xx_dbgon,
  sysio_hpcp_time
);

// &Ports; @23
input           cp0_hpcp_icg_en;                  
input   [11:0]  cp0_hpcp_index;                   
input           cp0_hpcp_pmdm;                    
input           cp0_hpcp_pmdu;                    
input   [31:0]  cp0_hpcp_wdata;                   
input           cp0_hpcp_wreg;                    
input   [1 :0]  cp0_yy_priv_mode;                 
input           cpurst_b;                         
input           dtu_hpcp_dcsr_stopcount;          
input           forever_cpuclk;                   
input           ifu_hpcp_icache_access;           
input           ifu_hpcp_icache_miss;             
input           iu_hpcp_inst_bht_mispred;         
input           iu_hpcp_inst_condbr;              
input           iu_hpcp_inst_condbr_gate;         
input           lsu_hpcp_cache_read_access;       
input           lsu_hpcp_cache_read_access_gate;  
input           lsu_hpcp_cache_read_miss;         
input           lsu_hpcp_cache_read_miss_gate;    
input           lsu_hpcp_cache_write_access;      
input           lsu_hpcp_cache_write_access_gate; 
input           lsu_hpcp_cache_write_miss;        
input           lsu_hpcp_cache_write_miss_gate;   
input           lsu_hpcp_inst_store;              
input           lsu_hpcp_inst_store_gate;         
input           pad_yy_icg_scan_en;               
input           rtu_hpcp_retire_inst_vld;         
input           rtu_yy_xx_dbgon;                  
input   [63:0]  sysio_hpcp_time;                  
output  [31:0]  hpcp_cp0_data;                    

// &Regs; @24
reg             cy;                               
reg     [31:0]  data_out;                         
reg     [27:0]  hpm;                              
reg             ir;                               

// &Wires @25
wire            bht_mispred;                      
wire            cnt_mode_dis;                     
wire            cp0_hpcp_icg_en;                  
wire    [11:0]  cp0_hpcp_index;                   
wire            cp0_hpcp_pmdm;                    
wire            cp0_hpcp_pmdu;                    
wire    [31:0]  cp0_hpcp_wdata;                   
wire            cp0_hpcp_wreg;                    
wire    [1 :0]  cp0_yy_priv_mode;                 
wire            cpurst_b;                         
wire            debug_mode_en;                    
wire            dtu_hpcp_dcsr_stopcount;          
wire            forever_cpuclk;                   
wire    [31:0]  hpcp_cp0_data;                    
wire            hpcp_ifu_icache_access;           
wire            hpcp_ifu_icache_miss;             
wire            hpcp_lsu_dcache_read_access;      
wire            hpcp_lsu_dcache_read_access_gate; 
wire            hpcp_lsu_dcache_read_miss;        
wire            hpcp_lsu_dcache_read_miss_gate;   
wire            hpcp_lsu_dcache_write_access;     
wire            hpcp_lsu_dcache_write_access_gate; 
wire            hpcp_lsu_dcache_write_miss;       
wire            hpcp_lsu_dcache_write_miss_gate;  
wire            hpcp_retire_bht_mispred;          
wire            hpcp_retire_inst_condbr;          
wire            hpcp_retire_inst_condbr_gate;     
wire            hpcp_retire_inst_store;           
wire            hpcp_retire_inst_store_gate;      
wire            hpcp_retire_inst_vld;             
wire    [31:0]  hpcp_wdata;                       
wire            ifu_hpcp_icache_access;           
wire            ifu_hpcp_icache_miss;             
wire            inhibt_clk;                       
wire            inst_condbr;                      
wire            inst_condbr_gate;                 
wire            inst_store;                       
wire            inst_store_gate;                  
wire            iu_hpcp_inst_bht_mispred;         
wire            iu_hpcp_inst_condbr;              
wire            iu_hpcp_inst_condbr_gate;         
wire            lsu_hpcp_cache_read_access;       
wire            lsu_hpcp_cache_read_access_gate;  
wire            lsu_hpcp_cache_read_miss;         
wire            lsu_hpcp_cache_read_miss_gate;    
wire            lsu_hpcp_cache_write_access;      
wire            lsu_hpcp_cache_write_access_gate; 
wire            lsu_hpcp_cache_write_miss;        
wire            lsu_hpcp_cache_write_miss_gate;   
wire            lsu_hpcp_inst_store;              
wire            lsu_hpcp_inst_store_gate;         
wire    [31:0]  mcntinhbt_value;                  
wire            mcntinhbt_wen;                    
wire            mcycle_clk_en;                    
wire            mcycle_cnt_en;                    
wire            mcycle_en;                        
wire    [63:0]  mcycle_value;                     
wire            mcycle_wen;                       
wire            mcycleh_wen;                      
wire            mhpmcnt13_adder;                  
wire            mhpmcnt13_clk_en;                 
wire            mhpmcnt13_cnt_en;                 
wire            mhpmcnt13_cnt_en_gate;            
wire            mhpmcnt13_en;                     
wire    [63:0]  mhpmcnt13_value;                  
wire            mhpmcnt13_wen;                    
wire            mhpmcnt13h_wen;                   
wire            mhpmcnt14_adder;                  
wire            mhpmcnt14_clk_en;                 
wire            mhpmcnt14_cnt_en;                 
wire            mhpmcnt14_cnt_en_gate;            
wire            mhpmcnt14_en;                     
wire    [63:0]  mhpmcnt14_value;                  
wire            mhpmcnt14_wen;                    
wire            mhpmcnt14h_wen;                   
wire            mhpmcnt15_adder;                  
wire            mhpmcnt15_clk_en;                 
wire            mhpmcnt15_cnt_en;                 
wire            mhpmcnt15_cnt_en_gate;            
wire            mhpmcnt15_en;                     
wire    [63:0]  mhpmcnt15_value;                  
wire            mhpmcnt15_wen;                    
wire            mhpmcnt15h_wen;                   
wire            mhpmcnt16_adder;                  
wire            mhpmcnt16_clk_en;                 
wire            mhpmcnt16_cnt_en;                 
wire            mhpmcnt16_cnt_en_gate;            
wire            mhpmcnt16_en;                     
wire    [63:0]  mhpmcnt16_value;                  
wire            mhpmcnt16_wen;                    
wire            mhpmcnt16h_wen;                   
wire            mhpmcnt17_adder;                  
wire            mhpmcnt17_clk_en;                 
wire            mhpmcnt17_cnt_en;                 
wire            mhpmcnt17_cnt_en_gate;            
wire            mhpmcnt17_en;                     
wire    [63:0]  mhpmcnt17_value;                  
wire            mhpmcnt17_wen;                    
wire            mhpmcnt17h_wen;                   
wire            mhpmcnt3_adder;                   
wire            mhpmcnt3_clk_en;                  
wire            mhpmcnt3_cnt_en;                  
wire            mhpmcnt3_en;                      
wire    [63:0]  mhpmcnt3_value;                   
wire            mhpmcnt3_wen;                     
wire            mhpmcnt3h_wen;                    
wire            mhpmcnt4_adder;                   
wire            mhpmcnt4_clk_en;                  
wire            mhpmcnt4_cnt_en;                  
wire            mhpmcnt4_en;                      
wire    [63:0]  mhpmcnt4_value;                   
wire            mhpmcnt4_wen;                     
wire            mhpmcnt4h_wen;                    
wire            mhpmcnt8_adder;                   
wire            mhpmcnt8_clk_en;                  
wire            mhpmcnt8_cnt_en;                  
wire            mhpmcnt8_en;                      
wire    [63:0]  mhpmcnt8_value;                   
wire            mhpmcnt8_wen;                     
wire            mhpmcnt8h_wen;                    
wire            mhpmcnt9_adder;                   
wire            mhpmcnt9_clk_en;                  
wire            mhpmcnt9_cnt_en;                  
wire            mhpmcnt9_cnt_en_gate;             
wire            mhpmcnt9_en;                      
wire    [63:0]  mhpmcnt9_value;                   
wire            mhpmcnt9_wen;                     
wire            mhpmcnt9h_wen;                    
wire            mhpmevt13_clk_en;                 
wire    [31:0]  mhpmevt13_value;                  
wire            mhpmevt13_wen;                    
wire            mhpmevt14_clk_en;                 
wire    [31:0]  mhpmevt14_value;                  
wire            mhpmevt14_wen;                    
wire            mhpmevt15_clk_en;                 
wire    [31:0]  mhpmevt15_value;                  
wire            mhpmevt15_wen;                    
wire            mhpmevt16_clk_en;                 
wire    [31:0]  mhpmevt16_value;                  
wire            mhpmevt16_wen;                    
wire            mhpmevt17_clk_en;                 
wire    [31:0]  mhpmevt17_value;                  
wire            mhpmevt17_wen;                    
wire            mhpmevt3_clk_en;                  
wire    [31:0]  mhpmevt3_value;                   
wire            mhpmevt3_wen;                     
wire            mhpmevt4_clk_en;                  
wire    [31:0]  mhpmevt4_value;                   
wire            mhpmevt4_wen;                     
wire            mhpmevt8_clk_en;                  
wire    [31:0]  mhpmevt8_value;                   
wire            mhpmevt8_wen;                     
wire            mhpmevt9_clk_en;                  
wire    [31:0]  mhpmevt9_value;                   
wire            mhpmevt9_wen;                     
wire            minstret_adder;                   
wire            minstret_clk_en;                  
wire            minstret_cnt_en;                  
wire            minstret_en;                      
wire    [63:0]  minstret_value;                   
wire            minstret_wen;                     
wire            minstreth_wen;                    
wire            pad_yy_icg_scan_en;               
wire            rtu_hpcp_retire_inst_vld;         
wire            rtu_yy_xx_dbgon;                  
wire    [63:0]  sysio_hpcp_time;                  


     
// performance monitor regs list in E906
// Machine Counter Setup
parameter MCNTINHBT = 12'h320;
parameter MHPMEVT3  = 12'h323;
parameter MHPMEVT4  = 12'h324;
parameter MHPMEVT5  = 12'h325;
parameter MHPMEVT6  = 12'h326;
parameter MHPMEVT7  = 12'h327;
parameter MHPMEVT8  = 12'h328;
parameter MHPMEVT9  = 12'h329;
parameter MHPMEVT10 = 12'h32A;
parameter MHPMEVT11 = 12'h32B;
parameter MHPMEVT12 = 12'h32C;
parameter MHPMEVT13 = 12'h32D;
parameter MHPMEVT14 = 12'h32E;
parameter MHPMEVT15 = 12'h32F;
parameter MHPMEVT16 = 12'h330;
parameter MHPMEVT17 = 12'h331;
parameter MHPMEVT18 = 12'h332;
parameter MHPMEVT19 = 12'h333;
parameter MHPMEVT20 = 12'h334;
parameter MHPMEVT21 = 12'h335;
parameter MHPMEVT22 = 12'h336;
parameter MHPMEVT23 = 12'h337;
parameter MHPMEVT24 = 12'h338;
parameter MHPMEVT25 = 12'h339;
parameter MHPMEVT26 = 12'h33A;
parameter MHPMEVT27 = 12'h33B;
parameter MHPMEVT28 = 12'h33C;
parameter MHPMEVT29 = 12'h33D;
parameter MHPMEVT30 = 12'h33E;
parameter MHPMEVT31 = 12'h33F;
parameter MCNTWEN   = 12'h7C9;

// Machine Counters/Timers
parameter MCYCLE    = 12'hB00;
parameter MINSTRET  = 12'hB02;
parameter MHPMCNT3  = 12'hB03;
parameter MHPMCNT4  = 12'hB04;
parameter MHPMCNT5  = 12'hB05;
parameter MHPMCNT6  = 12'hB06;
parameter MHPMCNT7  = 12'hB07;
parameter MHPMCNT8  = 12'hB08;
parameter MHPMCNT9  = 12'hB09;
parameter MHPMCNT10 = 12'hB0A;
parameter MHPMCNT11 = 12'hB0B;
parameter MHPMCNT12 = 12'hB0C;
parameter MHPMCNT13 = 12'hB0D;
parameter MHPMCNT14 = 12'hB0E;
parameter MHPMCNT15 = 12'hB0F;
parameter MHPMCNT16 = 12'hB10;
parameter MHPMCNT17 = 12'hB11;
parameter MHPMCNT18 = 12'hB12;
parameter MHPMCNT19 = 12'hB13;
parameter MHPMCNT20 = 12'hB14;
parameter MHPMCNT21 = 12'hB15;
parameter MHPMCNT22 = 12'hB16;
parameter MHPMCNT23 = 12'hB17;
parameter MHPMCNT24 = 12'hB18;
parameter MHPMCNT25 = 12'hB19;
parameter MHPMCNT26 = 12'hB1A;
parameter MHPMCNT27 = 12'hB1B;
parameter MHPMCNT28 = 12'hB1C;
parameter MHPMCNT29 = 12'hB1D;
parameter MHPMCNT30 = 12'hB1E;
parameter MHPMCNT31 = 12'hB1F;

parameter MCYCLEH    = 12'hB80;
parameter MINSTRETH  = 12'hB82;
parameter MHPMCNT3H  = 12'hB83;
parameter MHPMCNT4H  = 12'hB84;
parameter MHPMCNT5H  = 12'hB85;
parameter MHPMCNT6H  = 12'hB86;
parameter MHPMCNT7H  = 12'hB87;
parameter MHPMCNT8H  = 12'hB88;
parameter MHPMCNT9H  = 12'hB89;
parameter MHPMCNT10H = 12'hB8A;
parameter MHPMCNT11H = 12'hB8B;
parameter MHPMCNT12H = 12'hB8C;
parameter MHPMCNT13H = 12'hB8D;
parameter MHPMCNT14H = 12'hB8E;
parameter MHPMCNT15H = 12'hB8F;
parameter MHPMCNT16H = 12'hB90;
parameter MHPMCNT17H = 12'hB91;
parameter MHPMCNT18H = 12'hB92;
parameter MHPMCNT19H = 12'hB93;
parameter MHPMCNT20H = 12'hB94;
parameter MHPMCNT21H = 12'hB95;
parameter MHPMCNT22H = 12'hB96;
parameter MHPMCNT23H = 12'hB97;
parameter MHPMCNT24H = 12'hB98;
parameter MHPMCNT25H = 12'hB99;
parameter MHPMCNT26H = 12'hB9A;
parameter MHPMCNT27H = 12'hB9B;
parameter MHPMCNT28H = 12'hB9C;
parameter MHPMCNT29H = 12'hB9D;
parameter MHPMCNT30H = 12'hB9E;
parameter MHPMCNT31H = 12'hB9F;

// User Counters/Timers
parameter CYCLE    = 12'hC00;
parameter REG_TIME     = 12'hC01;
parameter INSTRET  = 12'hC02;
parameter HPMCNT3  = 12'hC03;
parameter HPMCNT4  = 12'hC04;
parameter HPMCNT5  = 12'hC05;
parameter HPMCNT6  = 12'hC06;
parameter HPMCNT7  = 12'hC07;
parameter HPMCNT8  = 12'hC08;
parameter HPMCNT9  = 12'hC09;
parameter HPMCNT10 = 12'hC0A;
parameter HPMCNT11 = 12'hC0B;
parameter HPMCNT12 = 12'hC0C;
parameter HPMCNT13 = 12'hC0D;
parameter HPMCNT14 = 12'hC0E;
parameter HPMCNT15 = 12'hC0F;
parameter HPMCNT16 = 12'hC10;
parameter HPMCNT17 = 12'hC11;
parameter HPMCNT18 = 12'hC12;
parameter HPMCNT19 = 12'hC13;
parameter HPMCNT20 = 12'hC14;
parameter HPMCNT21 = 12'hC15;
parameter HPMCNT22 = 12'hC16;
parameter HPMCNT23 = 12'hC17;
parameter HPMCNT24 = 12'hC18;
parameter HPMCNT25 = 12'hC19;
parameter HPMCNT26 = 12'hC1A;
parameter HPMCNT27 = 12'hC1B;
parameter HPMCNT28 = 12'hC1C;
parameter HPMCNT29 = 12'hC1D;
parameter HPMCNT30 = 12'hC1E;
parameter HPMCNT31 = 12'hC1F;

parameter CYCLEH    = 12'hC80;
parameter REG_TIMEH     = 12'hC81;
parameter INSTRETH  = 12'hC82;
parameter HPMCNT3H  = 12'hC83;
parameter HPMCNT4H  = 12'hC84;
parameter HPMCNT5H  = 12'hC85;
parameter HPMCNT6H  = 12'hC86;
parameter HPMCNT7H  = 12'hC87;
parameter HPMCNT8H  = 12'hC88;
parameter HPMCNT9H  = 12'hC89;
parameter HPMCNT10H = 12'hC8A;
parameter HPMCNT11H = 12'hC8B;
parameter HPMCNT12H = 12'hC8C;
parameter HPMCNT13H = 12'hC8D;
parameter HPMCNT14H = 12'hC8E;
parameter HPMCNT15H = 12'hC8F;
parameter HPMCNT16H = 12'hC90;
parameter HPMCNT17H = 12'hC91;
parameter HPMCNT18H = 12'hC92;
parameter HPMCNT19H = 12'hC93;
parameter HPMCNT20H = 12'hC94;
parameter HPMCNT21H = 12'hC95;
parameter HPMCNT22H = 12'hC96;
parameter HPMCNT23H = 12'hC97;
parameter HPMCNT24H = 12'hC98;
parameter HPMCNT25H = 12'hC99;
parameter HPMCNT26H = 12'hC9A;
parameter HPMCNT27H = 12'hC9B;
parameter HPMCNT28H = 12'hC9C;
parameter HPMCNT29H = 12'hC9D;
parameter HPMCNT30H = 12'hC9E;
parameter HPMCNT31H = 12'hC9F;

//==============================================================================
// Write signal 
//==============================================================================
//machine mode counter inhibit
assign mcntinhbt_wen   = (cp0_hpcp_index[11:0] == MCNTINHBT ) && cp0_hpcp_wreg; 

//Now hpmevent can only write leagal data,that is : 0 or corresponding data
assign mhpmevt3_wen    = (cp0_hpcp_index[11:0] == MHPMEVT3 ) && cp0_hpcp_wreg
                      && ((cp0_hpcp_wdata[4:0] == 5'b0) || (cp0_hpcp_wdata[4:0] == 5'd1));
assign mhpmevt4_wen    = (cp0_hpcp_index[11:0] == MHPMEVT4 ) && cp0_hpcp_wreg
                      && ((cp0_hpcp_wdata[4:0] == 5'b0) || (cp0_hpcp_wdata[4:0] == 5'd2));
assign mhpmevt8_wen    = (cp0_hpcp_index[11:0] == MHPMEVT8 ) && cp0_hpcp_wreg
                      && ((cp0_hpcp_wdata[4:0] == 5'b0) || (cp0_hpcp_wdata[4:0] == 5'd6));
assign mhpmevt9_wen    = (cp0_hpcp_index[11:0] == MHPMEVT9 ) && cp0_hpcp_wreg
                      && ((cp0_hpcp_wdata[4:0] == 5'b0) || (cp0_hpcp_wdata[4:0] == 5'd7));
assign mhpmevt13_wen   = (cp0_hpcp_index[11:0] == MHPMEVT13) && cp0_hpcp_wreg
                      && ((cp0_hpcp_wdata[4:0] == 5'b0) || (cp0_hpcp_wdata[4:0] == 5'd11));
assign mhpmevt14_wen   = (cp0_hpcp_index[11:0] == MHPMEVT14) && cp0_hpcp_wreg
                      && ((cp0_hpcp_wdata[4:0] == 5'b0) || (cp0_hpcp_wdata[4:0] == 5'd12));
assign mhpmevt15_wen   = (cp0_hpcp_index[11:0] == MHPMEVT15) && cp0_hpcp_wreg
                      && ((cp0_hpcp_wdata[4:0] == 5'b0) || (cp0_hpcp_wdata[4:0] == 5'd13));
assign mhpmevt16_wen   = (cp0_hpcp_index[11:0] == MHPMEVT16) && cp0_hpcp_wreg
                      && ((cp0_hpcp_wdata[4:0] == 5'b0) || (cp0_hpcp_wdata[4:0] == 5'd14));
assign mhpmevt17_wen   = (cp0_hpcp_index[11:0] == MHPMEVT17) && cp0_hpcp_wreg
                      && ((cp0_hpcp_wdata[4:0] == 5'b0) || (cp0_hpcp_wdata[4:0] == 5'd15));
 
// conter write enable  signal                      
assign mcycle_wen      = (cp0_hpcp_index[11:0] == MCYCLE)    && cp0_hpcp_wreg;
assign minstret_wen    = (cp0_hpcp_index[11:0] == MINSTRET)  && cp0_hpcp_wreg;
assign mhpmcnt3_wen    = (cp0_hpcp_index[11:0] == MHPMCNT3)  && cp0_hpcp_wreg && (mhpmevt3_value[4:0]  == 5'b00001);
assign mhpmcnt4_wen    = (cp0_hpcp_index[11:0] == MHPMCNT4)  && cp0_hpcp_wreg && (mhpmevt4_value[4:0]  == 5'b00010);
assign mhpmcnt8_wen    = (cp0_hpcp_index[11:0] == MHPMCNT8)  && cp0_hpcp_wreg && (mhpmevt8_value[4:0]  == 5'b00110);
assign mhpmcnt9_wen    = (cp0_hpcp_index[11:0] == MHPMCNT9)  && cp0_hpcp_wreg && (mhpmevt9_value[4:0]  == 5'b00111);
assign mhpmcnt13_wen   = (cp0_hpcp_index[11:0] == MHPMCNT13) && cp0_hpcp_wreg && (mhpmevt13_value[4:0] == 5'b01011);
assign mhpmcnt14_wen   = (cp0_hpcp_index[11:0] == MHPMCNT14) && cp0_hpcp_wreg && (mhpmevt14_value[4:0] == 5'b01100);
assign mhpmcnt15_wen   = (cp0_hpcp_index[11:0] == MHPMCNT15) && cp0_hpcp_wreg && (mhpmevt15_value[4:0] == 5'b01101);
assign mhpmcnt16_wen   = (cp0_hpcp_index[11:0] == MHPMCNT16) && cp0_hpcp_wreg && (mhpmevt16_value[4:0] == 5'b01110);
assign mhpmcnt17_wen   = (cp0_hpcp_index[11:0] == MHPMCNT17) && cp0_hpcp_wreg && (mhpmevt17_value[4:0] == 5'b01111);

assign mcycleh_wen     = (cp0_hpcp_index[11:0] == MCYCLEH)    && cp0_hpcp_wreg;
assign minstreth_wen   = (cp0_hpcp_index[11:0] == MINSTRETH)  && cp0_hpcp_wreg;
assign mhpmcnt3h_wen   = (cp0_hpcp_index[11:0] == MHPMCNT3H)  && cp0_hpcp_wreg && (mhpmevt3_value[4:0]  == 5'b00001);
assign mhpmcnt4h_wen   = (cp0_hpcp_index[11:0] == MHPMCNT4H)  && cp0_hpcp_wreg && (mhpmevt4_value[4:0]  == 5'b00010);
assign mhpmcnt8h_wen   = (cp0_hpcp_index[11:0] == MHPMCNT8H)  && cp0_hpcp_wreg && (mhpmevt8_value[4:0]  == 5'b00110);
assign mhpmcnt9h_wen   = (cp0_hpcp_index[11:0] == MHPMCNT9H)  && cp0_hpcp_wreg && (mhpmevt9_value[4:0]  == 5'b00111);
assign mhpmcnt13h_wen  = (cp0_hpcp_index[11:0] == MHPMCNT13H) && cp0_hpcp_wreg && (mhpmevt13_value[4:0] == 5'b01011);
assign mhpmcnt14h_wen  = (cp0_hpcp_index[11:0] == MHPMCNT14H) && cp0_hpcp_wreg && (mhpmevt14_value[4:0] == 5'b01100);
assign mhpmcnt15h_wen  = (cp0_hpcp_index[11:0] == MHPMCNT15H) && cp0_hpcp_wreg && (mhpmevt15_value[4:0] == 5'b01101);
assign mhpmcnt16h_wen  = (cp0_hpcp_index[11:0] == MHPMCNT16H) && cp0_hpcp_wreg && (mhpmevt16_value[4:0] == 5'b01110);
assign mhpmcnt17h_wen  = (cp0_hpcp_index[11:0] == MHPMCNT17H) && cp0_hpcp_wreg && (mhpmevt17_value[4:0] == 5'b01111);

//==============================================================================
//                Counter Control Signals
//==============================================================================
//when user/supervisor/machine counter disable,counter can not count
assign cnt_mode_dis = (cp0_yy_priv_mode[1:0] == 2'b11) && cp0_hpcp_pmdm
                   || (cp0_yy_priv_mode[1:0] == 2'b00) && cp0_hpcp_pmdu;

assign debug_mode_en = !rtu_yy_xx_dbgon || !dtu_hpcp_dcsr_stopcount;
// enable counter
assign mcycle_en    = debug_mode_en && !cnt_mode_dis && !mcntinhbt_value[0];
assign minstret_en  = debug_mode_en && !cnt_mode_dis && !mcntinhbt_value[2];
assign mhpmcnt3_en  = debug_mode_en && !cnt_mode_dis && !mcntinhbt_value[3]  && (mhpmevt3_value[4:0]  == 5'b00001);
assign mhpmcnt4_en  = debug_mode_en && !cnt_mode_dis && !mcntinhbt_value[4]  && (mhpmevt4_value[4:0]  == 5'b00010);
assign mhpmcnt8_en  = debug_mode_en && !cnt_mode_dis && !mcntinhbt_value[8]  && (mhpmevt8_value[4:0]  == 5'b00110);
assign mhpmcnt9_en  = debug_mode_en && !cnt_mode_dis && !mcntinhbt_value[9]  && (mhpmevt9_value[4:0]  == 5'b00111);
assign mhpmcnt13_en = debug_mode_en && !cnt_mode_dis && !mcntinhbt_value[13] && (mhpmevt13_value[4:0] == 5'b01011);
assign mhpmcnt14_en = debug_mode_en && !cnt_mode_dis && !mcntinhbt_value[14] && (mhpmevt14_value[4:0] == 5'b01100);
assign mhpmcnt15_en = debug_mode_en && !cnt_mode_dis && !mcntinhbt_value[15] && (mhpmevt15_value[4:0] == 5'b01101);
assign mhpmcnt16_en = debug_mode_en && !cnt_mode_dis && !mcntinhbt_value[16] && (mhpmevt16_value[4:0] == 5'b01110);
assign mhpmcnt17_en = debug_mode_en && !cnt_mode_dis && !mcntinhbt_value[17] && (mhpmevt17_value[4:0] == 5'b01111);

//counter count enable signal
assign mcycle_cnt_en    = mcycle_en;
assign minstret_cnt_en  = minstret_en  && hpcp_retire_inst_vld;
assign mhpmcnt3_cnt_en  = mhpmcnt3_en  && hpcp_ifu_icache_access;
assign mhpmcnt4_cnt_en  = mhpmcnt4_en  && hpcp_ifu_icache_miss;
assign mhpmcnt8_cnt_en  = mhpmcnt8_en  && bht_mispred;
assign mhpmcnt9_cnt_en  = mhpmcnt9_en  && inst_condbr;
assign mhpmcnt13_cnt_en = mhpmcnt13_en && inst_store;
assign mhpmcnt14_cnt_en = mhpmcnt14_en && hpcp_lsu_dcache_read_access;
assign mhpmcnt15_cnt_en = mhpmcnt15_en && hpcp_lsu_dcache_read_miss;
assign mhpmcnt16_cnt_en = mhpmcnt16_en && hpcp_lsu_dcache_write_access;
assign mhpmcnt17_cnt_en = mhpmcnt17_en && hpcp_lsu_dcache_write_miss;

assign mhpmcnt9_cnt_en_gate = mhpmcnt9_en  && inst_condbr_gate;
assign mhpmcnt13_cnt_en_gate = mhpmcnt13_en && inst_store_gate;
assign mhpmcnt14_cnt_en_gate = mhpmcnt14_en && hpcp_lsu_dcache_read_access_gate;
assign mhpmcnt15_cnt_en_gate = mhpmcnt15_en && hpcp_lsu_dcache_read_miss_gate;
assign mhpmcnt16_cnt_en_gate = mhpmcnt16_en && hpcp_lsu_dcache_write_access_gate;
assign mhpmcnt17_cnt_en_gate = mhpmcnt17_en && hpcp_lsu_dcache_write_miss_gate;
//==========================================================
//                Event Signals Rename
//==========================================================
assign hpcp_retire_inst_vld           = rtu_hpcp_retire_inst_vld;
assign hpcp_retire_inst_condbr        = iu_hpcp_inst_condbr;
assign hpcp_retire_bht_mispred        = iu_hpcp_inst_bht_mispred;
assign hpcp_retire_inst_store         = lsu_hpcp_inst_store;
assign hpcp_ifu_icache_access         = ifu_hpcp_icache_access;
assign hpcp_ifu_icache_miss           = ifu_hpcp_icache_miss;
assign hpcp_lsu_dcache_read_access    = lsu_hpcp_cache_read_access;
assign hpcp_lsu_dcache_read_miss      = lsu_hpcp_cache_read_miss;
assign hpcp_lsu_dcache_write_access   = lsu_hpcp_cache_write_access;
assign hpcp_lsu_dcache_write_miss     = lsu_hpcp_cache_write_miss;

assign hpcp_retire_inst_condbr_gate      = iu_hpcp_inst_condbr_gate;
assign hpcp_retire_inst_store_gate       = lsu_hpcp_inst_store_gate;
assign hpcp_lsu_dcache_read_access_gate  = lsu_hpcp_cache_read_access_gate;
assign hpcp_lsu_dcache_read_miss_gate    = lsu_hpcp_cache_read_miss_gate;
assign hpcp_lsu_dcache_write_access_gate = lsu_hpcp_cache_write_access_gate;
assign hpcp_lsu_dcache_write_miss_gate   = lsu_hpcp_cache_write_miss_gate;
//==========================================================
//                 Clk Enable of Gated Cell 
//==========================================================
assign mhpmevt3_clk_en   =  mhpmevt3_wen; 
assign mhpmevt4_clk_en   =  mhpmevt4_wen; 
assign mhpmevt8_clk_en   =  mhpmevt8_wen; 
assign mhpmevt9_clk_en   =  mhpmevt9_wen; 
assign mhpmevt13_clk_en  =  mhpmevt13_wen; 
assign mhpmevt14_clk_en  =  mhpmevt14_wen; 
assign mhpmevt15_clk_en  =  mhpmevt15_wen; 
assign mhpmevt16_clk_en  =  mhpmevt16_wen; 
assign mhpmevt17_clk_en  =  mhpmevt17_wen; 
assign mcycle_clk_en     =  mcycle_cnt_en    || mcycle_wen   ;
assign minstret_clk_en   =  minstret_cnt_en  || minstret_wen ;
assign mhpmcnt3_clk_en   =  mhpmcnt3_cnt_en  || mhpmcnt3_wen ;
assign mhpmcnt4_clk_en   =  mhpmcnt4_cnt_en  || mhpmcnt4_wen ;
assign mhpmcnt8_clk_en   =  mhpmcnt8_cnt_en  || mhpmcnt8_wen ;
assign mhpmcnt9_clk_en   =  mhpmcnt9_cnt_en_gate || mhpmcnt9_wen ;
assign mhpmcnt13_clk_en  =  mhpmcnt13_cnt_en_gate || mhpmcnt13_wen;
assign mhpmcnt14_clk_en  =  mhpmcnt14_cnt_en_gate || mhpmcnt14_wen;
assign mhpmcnt15_clk_en  =  mhpmcnt15_cnt_en_gate || mhpmcnt15_wen;
assign mhpmcnt16_clk_en  =  mhpmcnt16_cnt_en_gate || mhpmcnt16_wen;
assign mhpmcnt17_clk_en  =  mhpmcnt17_cnt_en_gate || mhpmcnt17_wen;

//data prepare
assign hpcp_wdata[31:0] = cp0_hpcp_wdata[31:0];

//==========================================================
//                Control Registers
//==========================================================
// &Instance("gated_clk_cell", "x_inhibt_gated_clk"); @335
gated_clk_cell  x_inhibt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (inhibt_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (mcntinhbt_wen     ),
  .module_en          (cp0_hpcp_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @336
//          .external_en (1'b0), @337
//          .global_en   (1'b1), @338
//          .module_en   (cp0_hpcp_icg_en), @339
//          .local_en    (mcntinhbt_wen), @340
//          .clk_out     (inhibt_clk)); @341

//==========================================================
// MCOUNTINHIBIT - Machine Counter-Inhibit Register
//==========================================================
// +----+----+----+-----------+---+---+---+---+---+---+
// | 31 | 30 | 29 |      28:6 | 5 | 4 | 3 | 2 | 1 | 0 |
// +----+----+----+-----------+---+---+---+---+---+---+
//    |    |    |               |   |   |   |   |   |
//    |    |    |               |   |   |   |   |   +---- CY
//    |    |    |               |   |   |   |   +-------- 0
//    |    |    |               |   |   |   +------------ IR
//    |    |    |               |   |   +---------------- HPM3
//    |    |    |               |   +-------------------- HPM4
//    |    |    |               +------------------------ HPM5
//    |    |    + --------------------------------------- HPM29
//    |    +--------------------------------------------- HPM30
//    +-------------------------------------------------- HPPM31

assign mcntinhbt_value[31:0] = {1'b0, hpm[27:0], ir, 1'b0, cy};

//=====================================
// HPM31~3/IR/CY bit in mnountinhibt
//=====================================
always @(posedge inhibt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ir        <= 1'b0;
    cy        <= 1'b0;
  end
  else if(mcntinhbt_wen) 
  begin
    ir        <= hpcp_wdata[2];
    cy        <= hpcp_wdata[0];
  end
  else
  begin
    ir        <= ir;
    cy        <= cy;
  end
end

always @(posedge inhibt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    hpm[27:0] <= 28'b0;
  else if(mcntinhbt_wen) 
    hpm[27:0] <= hpcp_wdata[30:3];
  else
    hpm[27:0] <= hpm[27:0];
end
//==========================================================
//                Configure Registers
//==========================================================

// &Instance("pa_hpcp_event", "x_hpcp_mhpmevent3"); @402
pa_hpcp_event  x_hpcp_mhpmevent3 (
  .clk_en             (mhpmevt3_clk_en   ),
  .cnt_output         (mhpmevt3_value    ),
  .cnt_wen            (mhpmevt3_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_event_dummy", "x_hpcp_mhpmevent3"); @404
// &Connect(.clk_en         (mhpmevt3_clk_en), @406
//          .cnt_wen        (mhpmevt3_wen), @407
//          .cnt_output     (mhpmevt3_value)); @408

// &Instance("pa_hpcp_event", "x_hpcp_mhpmevent4"); @411
pa_hpcp_event  x_hpcp_mhpmevent4 (
  .clk_en             (mhpmevt4_clk_en   ),
  .cnt_output         (mhpmevt4_value    ),
  .cnt_wen            (mhpmevt4_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_event_dummy", "x_hpcp_mhpmevent4"); @413
// &Connect(.clk_en         (mhpmevt4_clk_en), @415
//          .cnt_wen        (mhpmevt4_wen), @416
//          .cnt_output     (mhpmevt4_value)); @417

// &Instance("pa_hpcp_event", "x_hpcp_mhpmevent8"); @420
pa_hpcp_event  x_hpcp_mhpmevent8 (
  .clk_en             (mhpmevt8_clk_en   ),
  .cnt_output         (mhpmevt8_value    ),
  .cnt_wen            (mhpmevt8_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_event_dummy", "x_hpcp_mhpmevent8"); @422
// &Connect(.clk_en         (mhpmevt8_clk_en), @424
//          .cnt_wen        (mhpmevt8_wen), @425
//          .cnt_output     (mhpmevt8_value)); @426

// &Instance("pa_hpcp_event", "x_hpcp_mhpmevent9"); @429
pa_hpcp_event  x_hpcp_mhpmevent9 (
  .clk_en             (mhpmevt9_clk_en   ),
  .cnt_output         (mhpmevt9_value    ),
  .cnt_wen            (mhpmevt9_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_event_dummy", "x_hpcp_mhpmevent9"); @431
// &Connect(.clk_en         (mhpmevt9_clk_en), @433
//          .cnt_wen        (mhpmevt9_wen), @434
//          .cnt_output     (mhpmevt9_value)); @435

// &Instance("pa_hpcp_event", "x_hpcp_mhpmevent13"); @438
pa_hpcp_event  x_hpcp_mhpmevent13 (
  .clk_en             (mhpmevt13_clk_en  ),
  .cnt_output         (mhpmevt13_value   ),
  .cnt_wen            (mhpmevt13_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_event_dummy", "x_hpcp_mhpmevent13"); @440
// &Connect(.clk_en         (mhpmevt13_clk_en), @442
//          .cnt_wen        (mhpmevt13_wen), @443
//          .cnt_output     (mhpmevt13_value)); @444

// &Instance("pa_hpcp_event", "x_hpcp_mhpmevent14"); @447
pa_hpcp_event  x_hpcp_mhpmevent14 (
  .clk_en             (mhpmevt14_clk_en  ),
  .cnt_output         (mhpmevt14_value   ),
  .cnt_wen            (mhpmevt14_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_event_dummy", "x_hpcp_mhpmevent14"); @449
// &Connect(.clk_en         (mhpmevt14_clk_en), @451
//          .cnt_wen        (mhpmevt14_wen), @452
//          .cnt_output     (mhpmevt14_value)); @453

// &Instance("pa_hpcp_event", "x_hpcp_mhpmevent15"); @456
pa_hpcp_event  x_hpcp_mhpmevent15 (
  .clk_en             (mhpmevt15_clk_en  ),
  .cnt_output         (mhpmevt15_value   ),
  .cnt_wen            (mhpmevt15_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_event_dummy", "x_hpcp_mhpmevent15"); @458
// &Connect(.clk_en         (mhpmevt15_clk_en), @460
//          .cnt_wen        (mhpmevt15_wen), @461
//          .cnt_output     (mhpmevt15_value)); @462

// &Instance("pa_hpcp_event", "x_hpcp_mhpmevent16"); @465
pa_hpcp_event  x_hpcp_mhpmevent16 (
  .clk_en             (mhpmevt16_clk_en  ),
  .cnt_output         (mhpmevt16_value   ),
  .cnt_wen            (mhpmevt16_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_event_dummy", "x_hpcp_mhpmevent16"); @467
// &Connect(.clk_en         (mhpmevt16_clk_en), @469
//          .cnt_wen        (mhpmevt16_wen), @470
//          .cnt_output     (mhpmevt16_value)); @471

// &Instance("pa_hpcp_event", "x_hpcp_mhpmevent17"); @474
pa_hpcp_event  x_hpcp_mhpmevent17 (
  .clk_en             (mhpmevt17_clk_en  ),
  .cnt_output         (mhpmevt17_value   ),
  .cnt_wen            (mhpmevt17_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_event_dummy", "x_hpcp_mhpmevent17"); @476
// &Connect(.clk_en         (mhpmevt17_clk_en), @478
//          .cnt_wen        (mhpmevt17_wen), @479
//          .cnt_output     (mhpmevt17_value)); @480

//==========================================================
//                Cycle and Counters 
//==========================================================
// Cycle counter 
// &Instance("pa_hpcp_cnt", "x_hpcp_mcycle"); @486
pa_hpcp_cnt  x_hpcp_mcycle (
  .clk_en             (mcycle_clk_en     ),
  .cnt_adder          (1'b1              ),
  .cnt_en             (mcycle_cnt_en     ),
  .cnt_hwen           (mcycleh_wen       ),
  .cnt_output         (mcycle_value      ),
  .cnt_wen            (mcycle_wen        ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_en         (mcycle_clk_en), @487
//          .cnt_en         (mcycle_cnt_en), @488
//          .cnt_wen        (mcycle_wen), @489
//          .cnt_hwen       (mcycleh_wen), @490
//          .cnt_adder      (1'b1), @491
//          .cnt_output     (mcycle_value)); @492

// Instruction Retire counter
// Event counter 0x2: total instruction counter
assign minstret_adder = hpcp_retire_inst_vld;
// &Instance("pa_hpcp_cnt", "x_hpcp_minstret"); @497
pa_hpcp_cnt  x_hpcp_minstret (
  .clk_en             (minstret_clk_en   ),
  .cnt_adder          (minstret_adder    ),
  .cnt_en             (minstret_cnt_en   ),
  .cnt_hwen           (minstreth_wen     ),
  .cnt_output         (minstret_value    ),
  .cnt_wen            (minstret_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_en         (minstret_clk_en), @498
//          .cnt_en         (minstret_cnt_en), @499
//          .cnt_wen        (minstret_wen), @500
//          .cnt_hwen       (minstreth_wen), @501
//          .cnt_adder      (minstret_adder), @502
//          .cnt_output     (minstret_value)); @503

// mhpmcnt3: L1 icache access counter
assign mhpmcnt3_adder = hpcp_ifu_icache_access;
// &Instance("pa_hpcp_cnt", "x_hpcp_mhpmcnt3"); @508
pa_hpcp_cnt  x_hpcp_mhpmcnt3 (
  .clk_en             (mhpmcnt3_clk_en   ),
  .cnt_adder          (mhpmcnt3_adder    ),
  .cnt_en             (mhpmcnt3_cnt_en   ),
  .cnt_hwen           (mhpmcnt3h_wen     ),
  .cnt_output         (mhpmcnt3_value    ),
  .cnt_wen            (mhpmcnt3_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_cnt_dummy", "x_hpcp_mhpmcnt3"); @510
// &Connect(.clk_en         (mhpmcnt3_clk_en), @512
//          .cnt_en         (mhpmcnt3_cnt_en), @513
//          .cnt_wen        (mhpmcnt3_wen), @514
//          .cnt_hwen       (mhpmcnt3h_wen), @515
//          .cnt_adder      (mhpmcnt3_adder), @516
//          .cnt_output     (mhpmcnt3_value)); @517

// mhpmcnt4: L1 icache miss counter
assign mhpmcnt4_adder = hpcp_ifu_icache_miss;
// &Instance("pa_hpcp_cnt", "x_hpcp_mhpmcnt4"); @522
pa_hpcp_cnt  x_hpcp_mhpmcnt4 (
  .clk_en             (mhpmcnt4_clk_en   ),
  .cnt_adder          (mhpmcnt4_adder    ),
  .cnt_en             (mhpmcnt4_cnt_en   ),
  .cnt_hwen           (mhpmcnt4h_wen     ),
  .cnt_output         (mhpmcnt4_value    ),
  .cnt_wen            (mhpmcnt4_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_cnt_dummy", "x_hpcp_mhpmcnt4"); @524
// &Connect(.clk_en         (mhpmcnt4_clk_en), @526
//          .cnt_en         (mhpmcnt4_cnt_en), @527
//          .cnt_wen        (mhpmcnt4_wen), @528
//          .cnt_hwen       (mhpmcnt4h_wen), @529
//          .cnt_adder      (mhpmcnt4_adder), @530
//          .cnt_output     (mhpmcnt4_value)); @531

// mhpmcnt8:Conditional Branch Mispredict counter
assign bht_mispred         = hpcp_retire_bht_mispred;
assign mhpmcnt8_adder      = bht_mispred;
// &Instance("pa_hpcp_cnt", "x_hpcp_mhpmcnt8"); @537
pa_hpcp_cnt  x_hpcp_mhpmcnt8 (
  .clk_en             (mhpmcnt8_clk_en   ),
  .cnt_adder          (mhpmcnt8_adder    ),
  .cnt_en             (mhpmcnt8_cnt_en   ),
  .cnt_hwen           (mhpmcnt8h_wen     ),
  .cnt_output         (mhpmcnt8_value    ),
  .cnt_wen            (mhpmcnt8_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_cnt_dummy", "x_hpcp_mhpmcnt8"); @539
// &Connect(.clk_en         (mhpmcnt8_clk_en), @541
//          .cnt_en         (mhpmcnt8_cnt_en), @542
//          .cnt_wen        (mhpmcnt8_wen), @543
//          .cnt_hwen       (mhpmcnt8h_wen), @544
//          .cnt_adder      (mhpmcnt8_adder), @545
//          .cnt_output     (mhpmcnt8_value)); @546

// mhpmcnt9:Conditional Branch Instruction counter
assign inst_condbr    = hpcp_retire_inst_condbr;
assign inst_condbr_gate = hpcp_retire_inst_condbr_gate;
assign mhpmcnt9_adder = inst_condbr;
// &Instance("pa_hpcp_cnt", "x_hpcp_mhpmcnt9"); @553
pa_hpcp_cnt  x_hpcp_mhpmcnt9 (
  .clk_en             (mhpmcnt9_clk_en   ),
  .cnt_adder          (mhpmcnt9_adder    ),
  .cnt_en             (mhpmcnt9_cnt_en   ),
  .cnt_hwen           (mhpmcnt9h_wen     ),
  .cnt_output         (mhpmcnt9_value    ),
  .cnt_wen            (mhpmcnt9_wen      ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_cnt_dummy", "x_hpcp_mhpmcnt9"); @555
// &Connect(.clk_en         (mhpmcnt9_clk_en), @557
//          .cnt_en         (mhpmcnt9_cnt_en), @558
//          .cnt_wen        (mhpmcnt9_wen), @559
//          .cnt_hwen       (mhpmcnt9h_wen), @560
//          .cnt_adder      (mhpmcnt9_adder), @561
//          .cnt_output     (mhpmcnt9_value)); @562

// mhpmcnt13: Store Instruction counter
assign inst_store      = hpcp_retire_inst_store;
assign inst_store_gate = hpcp_retire_inst_store_gate;
assign mhpmcnt13_adder = inst_store;
// &Instance("pa_hpcp_cnt", "x_hpcp_mhpmcnt13"); @569
pa_hpcp_cnt  x_hpcp_mhpmcnt13 (
  .clk_en             (mhpmcnt13_clk_en  ),
  .cnt_adder          (mhpmcnt13_adder   ),
  .cnt_en             (mhpmcnt13_cnt_en  ),
  .cnt_hwen           (mhpmcnt13h_wen    ),
  .cnt_output         (mhpmcnt13_value   ),
  .cnt_wen            (mhpmcnt13_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_cnt_dummy", "x_hpcp_mhpmcnt13"); @571
// &Connect(.clk_en         (mhpmcnt13_clk_en), @573
//          .cnt_en         (mhpmcnt13_cnt_en), @574
//          .cnt_wen        (mhpmcnt13_wen), @575
//          .cnt_hwen       (mhpmcnt13h_wen), @576
//          .cnt_adder      (mhpmcnt13_adder), @577
//          .cnt_output     (mhpmcnt13_value));                             @578

// mhpmcnt14: LSU read access counter
assign mhpmcnt14_adder = hpcp_lsu_dcache_read_access;
// &Instance("pa_hpcp_cnt", "x_hpcp_mhpmcnt14"); @583
pa_hpcp_cnt  x_hpcp_mhpmcnt14 (
  .clk_en             (mhpmcnt14_clk_en  ),
  .cnt_adder          (mhpmcnt14_adder   ),
  .cnt_en             (mhpmcnt14_cnt_en  ),
  .cnt_hwen           (mhpmcnt14h_wen    ),
  .cnt_output         (mhpmcnt14_value   ),
  .cnt_wen            (mhpmcnt14_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_cnt_dummy", "x_hpcp_mhpmcnt14"); @585
// &Connect(.clk_en         (mhpmcnt14_clk_en), @587
//          .cnt_en         (mhpmcnt14_cnt_en), @588
//          .cnt_wen        (mhpmcnt14_wen), @589
//          .cnt_hwen       (mhpmcnt14h_wen), @590
//          .cnt_adder      (mhpmcnt14_adder), @591
//          .cnt_output     (mhpmcnt14_value));  @592

// mhpmcnt15: LSU read miss counter
assign mhpmcnt15_adder = hpcp_lsu_dcache_read_miss;
// &Instance("pa_hpcp_cnt", "x_hpcp_mhpmcnt15"); @597
pa_hpcp_cnt  x_hpcp_mhpmcnt15 (
  .clk_en             (mhpmcnt15_clk_en  ),
  .cnt_adder          (mhpmcnt15_adder   ),
  .cnt_en             (mhpmcnt15_cnt_en  ),
  .cnt_hwen           (mhpmcnt15h_wen    ),
  .cnt_output         (mhpmcnt15_value   ),
  .cnt_wen            (mhpmcnt15_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_cnt_dummy", "x_hpcp_mhpmcnt15"); @599
// &Connect(.clk_en         (mhpmcnt15_clk_en), @601
//          .cnt_en         (mhpmcnt15_cnt_en), @602
//          .cnt_wen        (mhpmcnt15_wen), @603
//          .cnt_hwen       (mhpmcnt15h_wen), @604
//          .cnt_adder      (mhpmcnt15_adder), @605
//          .cnt_output     (mhpmcnt15_value));      @606

// mhpmcnt16: LSU write access counter
assign mhpmcnt16_adder = hpcp_lsu_dcache_write_access;
// &Instance("pa_hpcp_cnt", "x_hpcp_mhpmcnt16"); @611
pa_hpcp_cnt  x_hpcp_mhpmcnt16 (
  .clk_en             (mhpmcnt16_clk_en  ),
  .cnt_adder          (mhpmcnt16_adder   ),
  .cnt_en             (mhpmcnt16_cnt_en  ),
  .cnt_hwen           (mhpmcnt16h_wen    ),
  .cnt_output         (mhpmcnt16_value   ),
  .cnt_wen            (mhpmcnt16_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_cnt_dummy", "x_hpcp_mhpmcnt16"); @613
// &Connect(.clk_en         (mhpmcnt16_clk_en), @615
//          .cnt_en         (mhpmcnt16_cnt_en), @616
//          .cnt_wen        (mhpmcnt16_wen), @617
//          .cnt_hwen       (mhpmcnt16h_wen), @618
//          .cnt_adder      (mhpmcnt16_adder), @619
//          .cnt_output     (mhpmcnt16_value));    @620

// mhpmcnt17: LSU write miss counter
assign mhpmcnt17_adder = hpcp_lsu_dcache_write_miss;
// &Instance("pa_hpcp_cnt", "x_hpcp_mhpmcnt17"); @625
pa_hpcp_cnt  x_hpcp_mhpmcnt17 (
  .clk_en             (mhpmcnt17_clk_en  ),
  .cnt_adder          (mhpmcnt17_adder   ),
  .cnt_en             (mhpmcnt17_cnt_en  ),
  .cnt_hwen           (mhpmcnt17h_wen    ),
  .cnt_output         (mhpmcnt17_value   ),
  .cnt_wen            (mhpmcnt17_wen     ),
  .cp0_hpcp_icg_en    (cp0_hpcp_icg_en   ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .hpcp_wdata         (hpcp_wdata        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Instance("pa_hpcp_cnt_dummy", "x_hpcp_mhpmcnt17"); @627
// &Connect(.clk_en         (mhpmcnt17_clk_en), @629
//          .cnt_en         (mhpmcnt17_cnt_en), @630
//          .cnt_wen        (mhpmcnt17_wen), @631
//          .cnt_hwen       (mhpmcnt17h_wen), @632
//          .cnt_adder      (mhpmcnt17_adder), @633
//          .cnt_output     (mhpmcnt17_value));   @634

//==========================================================
// Read Operation
//==========================================================
// &CombBeg; @639
always @( mhpmcnt14_value[63:0]
       or mhpmevt16_value[31:0]
       or mhpmcnt9_value[63:0]
       or mhpmevt13_value[31:0]
       or mhpmevt4_value[31:0]
       or sysio_hpcp_time[63:0]
       or mcntinhbt_value[31:0]
       or mcycle_value[63:0]
       or cp0_hpcp_index[11:0]
       or mhpmcnt4_value[63:0]
       or mhpmevt3_value[31:0]
       or mhpmcnt16_value[63:0]
       or mhpmevt15_value[31:0]
       or mhpmevt9_value[31:0]
       or mhpmcnt17_value[63:0]
       or minstret_value[63:0]
       or mhpmcnt15_value[63:0]
       or mhpmcnt8_value[63:0]
       or mhpmcnt13_value[63:0]
       or mhpmcnt3_value[63:0]
       or mhpmevt14_value[31:0]
       or mhpmevt8_value[31:0]
       or mhpmevt17_value[31:0])
begin
  case(cp0_hpcp_index[11:0])
    MCNTINHBT  : data_out[31:0] = mcntinhbt_value[31:0];
    MHPMEVT3   : data_out[31:0] = mhpmevt3_value[31:0]; 
    MHPMEVT4   : data_out[31:0] = mhpmevt4_value[31:0]; 
    MHPMEVT8   : data_out[31:0] = mhpmevt8_value[31:0];
    MHPMEVT9   : data_out[31:0] = mhpmevt9_value[31:0];
    MHPMEVT13  : data_out[31:0] = mhpmevt13_value[31:0];
    MHPMEVT14  : data_out[31:0] = mhpmevt14_value[31:0];
    MHPMEVT15  : data_out[31:0] = mhpmevt15_value[31:0];
    MHPMEVT16  : data_out[31:0] = mhpmevt16_value[31:0];
    MHPMEVT17  : data_out[31:0] = mhpmevt17_value[31:0];

    MCYCLE     : data_out[31:0] = mcycle_value[31:0];
    MINSTRET   : data_out[31:0] = minstret_value[31:0]; 
    MHPMCNT3   : data_out[31:0] = mhpmcnt3_value[31:0]; 
    MHPMCNT4   : data_out[31:0] = mhpmcnt4_value[31:0];
    MHPMCNT8   : data_out[31:0] = mhpmcnt8_value[31:0];
    MHPMCNT9   : data_out[31:0] = mhpmcnt9_value[31:0];
    MHPMCNT13  : data_out[31:0] = mhpmcnt13_value[31:0];
    MHPMCNT14  : data_out[31:0] = mhpmcnt14_value[31:0];
    MHPMCNT15  : data_out[31:0] = mhpmcnt15_value[31:0];
    MHPMCNT16  : data_out[31:0] = mhpmcnt16_value[31:0];
    MHPMCNT17  : data_out[31:0] = mhpmcnt17_value[31:0];

    MCYCLEH    : data_out[31:0] = mcycle_value[63:32];
    MINSTRETH  : data_out[31:0] = minstret_value[63:32]; 
    MHPMCNT3H  : data_out[31:0] = mhpmcnt3_value[63:32]; 
    MHPMCNT4H  : data_out[31:0] = mhpmcnt4_value[63:32];
    MHPMCNT8H  : data_out[31:0] = mhpmcnt8_value[63:32];
    MHPMCNT9H  : data_out[31:0] = mhpmcnt9_value[63:32];
    MHPMCNT13H : data_out[31:0] = mhpmcnt13_value[63:32];
    MHPMCNT14H : data_out[31:0] = mhpmcnt14_value[63:32];
    MHPMCNT15H : data_out[31:0] = mhpmcnt15_value[63:32];
    MHPMCNT16H : data_out[31:0] = mhpmcnt16_value[63:32];
    MHPMCNT17H : data_out[31:0] = mhpmcnt17_value[63:32];

    CYCLE      : data_out[31:0] = mcycle_value[31:0]; 
    REG_TIME       : data_out[31:0] = sysio_hpcp_time[31:0];
    INSTRET    : data_out[31:0] = minstret_value[31:0];
    HPMCNT3    : data_out[31:0] = mhpmcnt3_value[31:0]; 
    HPMCNT4    : data_out[31:0] = mhpmcnt4_value[31:0];
    HPMCNT8    : data_out[31:0] = mhpmcnt8_value[31:0];
    HPMCNT9    : data_out[31:0] = mhpmcnt9_value[31:0];
    HPMCNT13   : data_out[31:0] = mhpmcnt13_value[31:0];
    HPMCNT14   : data_out[31:0] = mhpmcnt14_value[31:0];
    HPMCNT15   : data_out[31:0] = mhpmcnt15_value[31:0];
    HPMCNT16   : data_out[31:0] = mhpmcnt16_value[31:0];
    HPMCNT17   : data_out[31:0] = mhpmcnt17_value[31:0];

    CYCLEH     : data_out[31:0] = mcycle_value[63:32]; 
    REG_TIMEH      : data_out[31:0] = sysio_hpcp_time[63:32];
    INSTRETH   : data_out[31:0] = minstret_value[63:32];
    HPMCNT3H   : data_out[31:0] = mhpmcnt3_value[63:32]; 
    HPMCNT4H   : data_out[31:0] = mhpmcnt4_value[63:32];
    HPMCNT8H   : data_out[31:0] = mhpmcnt8_value[63:32];
    HPMCNT9H   : data_out[31:0] = mhpmcnt9_value[63:32];
    HPMCNT13H  : data_out[31:0] = mhpmcnt13_value[63:32];
    HPMCNT14H  : data_out[31:0] = mhpmcnt14_value[63:32];
    HPMCNT15H  : data_out[31:0] = mhpmcnt15_value[63:32];
    HPMCNT16H  : data_out[31:0] = mhpmcnt16_value[63:32];
    HPMCNT17H  : data_out[31:0] = mhpmcnt17_value[63:32];
    default    : data_out[31:0] = 32'b0;
  endcase
// &CombEnd; @703
end

//==========================================================
// Output to CP0
//==========================================================
assign hpcp_cp0_data[31:0] = data_out[31:0];

//==========================================================
// Output to IFU
//==========================================================
//assign hpcp_ifu_cnt_en  = mhpmcnt3_en
//                       || mhpmcnt4_en;

//==========================================================
// Output to IDU
//==========================================================
//assign hpcp_idu_cnt_en  = mhpmcnt22_en 
//                       || mhpmcnt23_en
//                       || mhpmcnt24_en;  

//==========================================================
// Output to RTU
//==========================================================
//assign hpcp_rtu_cnt_en  = minstret_en
//                       || mhpmcnt8_en
//                       || mhpmcnt9_en
//                       || mhpmcnt13_en;

//==========================================================
// Output to LSU
//==========================================================
//assign hpcp_lsu_cnt_en  = mhpmcnt14_en
//                       || mhpmcnt15_en
//                       || mhpmcnt16_en
//                       || mhpmcnt17_en;


// &ModuleEnd; @740
endmodule


