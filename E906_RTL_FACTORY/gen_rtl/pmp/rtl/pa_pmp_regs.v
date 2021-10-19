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
module pa_pmp_regs(
  cp0_pmp_csr_sel,
  cp0_pmp_updt_data,
  cp0_yy_secu_mode_aft_dbg,
  cpuclk,
  cpurst_b,
  pmp_cp0_data,
  pmp_csr_wen,
  pmpaddr0_value,
  pmpaddr1_value,
  pmpaddr2_value,
  pmpaddr3_value,
  pmpaddr4_value,
  pmpaddr5_value,
  pmpaddr6_value,
  pmpaddr7_value,
  regs_comp_addr_mode0,
  regs_comp_addr_mode1,
  regs_comp_addr_mode2,
  regs_comp_addr_mode3,
  regs_comp_addr_mode4,
  regs_comp_addr_mode5,
  regs_comp_addr_mode6,
  regs_comp_addr_mode7,
  regs_comp_excut0,
  regs_comp_excut1,
  regs_comp_excut2,
  regs_comp_excut3,
  regs_comp_excut4,
  regs_comp_excut5,
  regs_comp_excut6,
  regs_comp_excut7,
  regs_comp_lock0,
  regs_comp_lock1,
  regs_comp_lock10,
  regs_comp_lock11,
  regs_comp_lock12,
  regs_comp_lock13,
  regs_comp_lock14,
  regs_comp_lock15,
  regs_comp_lock2,
  regs_comp_lock3,
  regs_comp_lock4,
  regs_comp_lock5,
  regs_comp_lock6,
  regs_comp_lock7,
  regs_comp_lock8,
  regs_comp_lock9,
  regs_comp_read0,
  regs_comp_read1,
  regs_comp_read2,
  regs_comp_read3,
  regs_comp_read4,
  regs_comp_read5,
  regs_comp_read6,
  regs_comp_read7,
  regs_comp_write0,
  regs_comp_write1,
  regs_comp_write2,
  regs_comp_write3,
  regs_comp_write4,
  regs_comp_write5,
  regs_comp_write6,
  regs_comp_write7
);

// &Ports; @24
input   [19:0]  cp0_pmp_csr_sel;         
input   [31:0]  cp0_pmp_updt_data;       
input           cp0_yy_secu_mode_aft_dbg; 
input           cpuclk;                  
input           cpurst_b;                
input   [19:0]  pmp_csr_wen;             
output  [31:0]  pmp_cp0_data;            
output  [25:0]  pmpaddr0_value;          
output  [25:0]  pmpaddr1_value;          
output  [25:0]  pmpaddr2_value;          
output  [25:0]  pmpaddr3_value;          
output  [25:0]  pmpaddr4_value;          
output  [25:0]  pmpaddr5_value;          
output  [25:0]  pmpaddr6_value;          
output  [25:0]  pmpaddr7_value;          
output  [1 :0]  regs_comp_addr_mode0;    
output  [1 :0]  regs_comp_addr_mode1;    
output  [1 :0]  regs_comp_addr_mode2;    
output  [1 :0]  regs_comp_addr_mode3;    
output  [1 :0]  regs_comp_addr_mode4;    
output  [1 :0]  regs_comp_addr_mode5;    
output  [1 :0]  regs_comp_addr_mode6;    
output  [1 :0]  regs_comp_addr_mode7;    
output          regs_comp_excut0;        
output          regs_comp_excut1;        
output          regs_comp_excut2;        
output          regs_comp_excut3;        
output          regs_comp_excut4;        
output          regs_comp_excut5;        
output          regs_comp_excut6;        
output          regs_comp_excut7;        
output          regs_comp_lock0;         
output          regs_comp_lock1;         
output          regs_comp_lock10;        
output          regs_comp_lock11;        
output          regs_comp_lock12;        
output          regs_comp_lock13;        
output          regs_comp_lock14;        
output          regs_comp_lock15;        
output          regs_comp_lock2;         
output          regs_comp_lock3;         
output          regs_comp_lock4;         
output          regs_comp_lock5;         
output          regs_comp_lock6;         
output          regs_comp_lock7;         
output          regs_comp_lock8;         
output          regs_comp_lock9;         
output          regs_comp_read0;         
output          regs_comp_read1;         
output          regs_comp_read2;         
output          regs_comp_read3;         
output          regs_comp_read4;         
output          regs_comp_read5;         
output          regs_comp_read6;         
output          regs_comp_read7;         
output          regs_comp_write0;        
output          regs_comp_write1;        
output          regs_comp_write2;        
output          regs_comp_write3;        
output          regs_comp_write4;        
output          regs_comp_write5;        
output          regs_comp_write6;        
output          regs_comp_write7;        

// &Regs; @25
reg     [1 :0]  pmp0cfg_addr_mode;       
reg             pmp0cfg_executeable;     
reg             pmp0cfg_lock;            
reg             pmp0cfg_readable;        
reg             pmp0cfg_writable;        
reg     [1 :0]  pmp1cfg_addr_mode;       
reg             pmp1cfg_executeable;     
reg             pmp1cfg_lock;            
reg             pmp1cfg_readable;        
reg             pmp1cfg_writable;        
reg     [1 :0]  pmp2cfg_addr_mode;       
reg             pmp2cfg_executeable;     
reg             pmp2cfg_lock;            
reg             pmp2cfg_readable;        
reg             pmp2cfg_writable;        
reg     [1 :0]  pmp3cfg_addr_mode;       
reg             pmp3cfg_executeable;     
reg             pmp3cfg_lock;            
reg             pmp3cfg_readable;        
reg             pmp3cfg_writable;        
reg     [1 :0]  pmp4cfg_addr_mode;       
reg             pmp4cfg_executeable;     
reg             pmp4cfg_lock;            
reg             pmp4cfg_readable;        
reg             pmp4cfg_writable;        
reg     [1 :0]  pmp5cfg_addr_mode;       
reg             pmp5cfg_executeable;     
reg             pmp5cfg_lock;            
reg             pmp5cfg_readable;        
reg             pmp5cfg_writable;        
reg     [1 :0]  pmp6cfg_addr_mode;       
reg             pmp6cfg_executeable;     
reg             pmp6cfg_lock;            
reg             pmp6cfg_readable;        
reg             pmp6cfg_writable;        
reg     [1 :0]  pmp7cfg_addr_mode;       
reg             pmp7cfg_executeable;     
reg             pmp7cfg_lock;            
reg             pmp7cfg_readable;        
reg             pmp7cfg_writable;        
reg     [25:0]  pmpaddr0_value;          
reg     [25:0]  pmpaddr1_value;          
reg     [25:0]  pmpaddr2_value;          
reg     [25:0]  pmpaddr3_value;          
reg     [25:0]  pmpaddr4_value;          
reg     [25:0]  pmpaddr5_value;          
reg     [25:0]  pmpaddr6_value;          
reg     [25:0]  pmpaddr7_value;          

// &Wires; @26
wire    [19:0]  cp0_pmp_csr_sel;         
wire    [31:0]  cp0_pmp_updt_data;       
wire            cp0_yy_secu_mode_aft_dbg; 
wire            cpuclk;                  
wire            cpurst_b;                
wire    [1 :0]  pmp0cfg_mode;            
wire    [1 :0]  pmp10cfg_mode;           
wire    [1 :0]  pmp11cfg_mode;           
wire    [1 :0]  pmp12cfg_mode;           
wire    [1 :0]  pmp13cfg_mode;           
wire    [1 :0]  pmp14cfg_mode;           
wire    [1 :0]  pmp15cfg_mode;           
wire    [1 :0]  pmp1cfg_mode;            
wire    [1 :0]  pmp2cfg_mode;            
wire    [1 :0]  pmp3cfg_mode;            
wire    [1 :0]  pmp4cfg_mode;            
wire    [1 :0]  pmp5cfg_mode;            
wire    [1 :0]  pmp6cfg_mode;            
wire    [1 :0]  pmp7cfg_mode;            
wire    [1 :0]  pmp8cfg_mode;            
wire    [1 :0]  pmp9cfg_mode;            
wire    [31:0]  pmp_cp0_data;            
wire    [19:0]  pmp_csr_wen;             
wire            pmp_updt_pmp0cfg;        
wire            pmp_updt_pmp1cfg;        
wire            pmp_updt_pmp2cfg;        
wire            pmp_updt_pmp3cfg;        
wire            pmp_updt_pmp4cfg;        
wire            pmp_updt_pmp5cfg;        
wire            pmp_updt_pmp6cfg;        
wire            pmp_updt_pmp7cfg;        
wire            pmp_updt_pmpaddr0;       
wire            pmp_updt_pmpaddr1;       
wire            pmp_updt_pmpaddr2;       
wire            pmp_updt_pmpaddr3;       
wire            pmp_updt_pmpaddr4;       
wire            pmp_updt_pmpaddr5;       
wire            pmp_updt_pmpaddr6;       
wire            pmp_updt_pmpaddr7;       
wire    [4 :0]  pmpaddr0_low;            
wire    [4 :0]  pmpaddr10_low;           
wire    [25:0]  pmpaddr10_value;         
wire    [4 :0]  pmpaddr11_low;           
wire    [25:0]  pmpaddr11_value;         
wire    [4 :0]  pmpaddr12_low;           
wire    [25:0]  pmpaddr12_value;         
wire    [4 :0]  pmpaddr13_low;           
wire    [25:0]  pmpaddr13_value;         
wire    [4 :0]  pmpaddr14_low;           
wire    [25:0]  pmpaddr14_value;         
wire    [4 :0]  pmpaddr15_low;           
wire    [25:0]  pmpaddr15_value;         
wire    [4 :0]  pmpaddr1_low;            
wire    [4 :0]  pmpaddr2_low;            
wire    [4 :0]  pmpaddr3_low;            
wire    [4 :0]  pmpaddr4_low;            
wire    [4 :0]  pmpaddr5_low;            
wire    [4 :0]  pmpaddr6_low;            
wire    [4 :0]  pmpaddr7_low;            
wire    [4 :0]  pmpaddr8_low;            
wire    [25:0]  pmpaddr8_value;          
wire    [4 :0]  pmpaddr9_low;            
wire    [25:0]  pmpaddr9_value;          
wire    [31:0]  pmpcfg0_value;           
wire    [31:0]  pmpcfg1_value;           
wire    [31:0]  pmpcfg2_value;           
wire    [31:0]  pmpcfg3_value;           
wire            pmpteecfg_s0;            
wire            pmpteecfg_s1;            
wire            pmpteecfg_s2;            
wire            pmpteecfg_s3;            
wire            pmpteecfg_s4;            
wire            pmpteecfg_s5;            
wire            pmpteecfg_s6;            
wire            pmpteecfg_s7;            
wire    [1 :0]  regs_comp_addr_mode0;    
wire    [1 :0]  regs_comp_addr_mode1;    
wire    [1 :0]  regs_comp_addr_mode2;    
wire    [1 :0]  regs_comp_addr_mode3;    
wire    [1 :0]  regs_comp_addr_mode4;    
wire    [1 :0]  regs_comp_addr_mode5;    
wire    [1 :0]  regs_comp_addr_mode6;    
wire    [1 :0]  regs_comp_addr_mode7;    
wire            regs_comp_excut0;        
wire            regs_comp_excut1;        
wire            regs_comp_excut2;        
wire            regs_comp_excut3;        
wire            regs_comp_excut4;        
wire            regs_comp_excut5;        
wire            regs_comp_excut6;        
wire            regs_comp_excut7;        
wire            regs_comp_lock0;         
wire            regs_comp_lock1;         
wire            regs_comp_lock10;        
wire            regs_comp_lock11;        
wire            regs_comp_lock12;        
wire            regs_comp_lock13;        
wire            regs_comp_lock14;        
wire            regs_comp_lock15;        
wire            regs_comp_lock2;         
wire            regs_comp_lock3;         
wire            regs_comp_lock4;         
wire            regs_comp_lock5;         
wire            regs_comp_lock6;         
wire            regs_comp_lock7;         
wire            regs_comp_lock8;         
wire            regs_comp_lock9;         
wire            regs_comp_read0;         
wire            regs_comp_read1;         
wire            regs_comp_read2;         
wire            regs_comp_read3;         
wire            regs_comp_read4;         
wire            regs_comp_read5;         
wire            regs_comp_read6;         
wire            regs_comp_read7;         
wire            regs_comp_write0;        
wire            regs_comp_write1;        
wire            regs_comp_write2;        
wire            regs_comp_write3;        
wire            regs_comp_write4;        
wire            regs_comp_write5;        
wire            regs_comp_write6;        
wire            regs_comp_write7;        


parameter ADDR_WIDTH = 25+1;

assign regs_comp_read0           = pmp0cfg_readable;
assign regs_comp_write0          = pmp0cfg_writable;
assign regs_comp_excut0          = pmp0cfg_executeable;
assign regs_comp_addr_mode0[1:0] = pmp0cfg_mode[1:0];
assign regs_comp_lock0           = pmp0cfg_lock;

assign regs_comp_read1           = pmp1cfg_readable;
assign regs_comp_write1          = pmp1cfg_writable;
assign regs_comp_excut1          = pmp1cfg_executeable;
assign regs_comp_addr_mode1[1:0] = pmp1cfg_mode[1:0];
assign regs_comp_lock1           = pmp1cfg_lock;

assign regs_comp_read2           = pmp2cfg_readable;
assign regs_comp_write2          = pmp2cfg_writable;
assign regs_comp_excut2          = pmp2cfg_executeable;
assign regs_comp_addr_mode2[1:0] = pmp2cfg_mode[1:0];
assign regs_comp_lock2           = pmp2cfg_lock;

assign regs_comp_read3           = pmp3cfg_readable;
assign regs_comp_write3          = pmp3cfg_writable;
assign regs_comp_excut3          = pmp3cfg_executeable;
assign regs_comp_addr_mode3[1:0] = pmp3cfg_mode[1:0];
assign regs_comp_lock3           = pmp3cfg_lock;

assign regs_comp_read4           = pmp4cfg_readable;
assign regs_comp_write4          = pmp4cfg_writable;
assign regs_comp_excut4          = pmp4cfg_executeable;
assign regs_comp_addr_mode4[1:0] = pmp4cfg_mode[1:0];
assign regs_comp_lock4           = pmp4cfg_lock;

assign regs_comp_read5           = pmp5cfg_readable;
assign regs_comp_write5          = pmp5cfg_writable;
assign regs_comp_excut5          = pmp5cfg_executeable;
assign regs_comp_addr_mode5[1:0] = pmp5cfg_mode[1:0];
assign regs_comp_lock5           = pmp5cfg_lock;

assign regs_comp_read6           = pmp6cfg_readable;
assign regs_comp_write6          = pmp6cfg_writable;
assign regs_comp_excut6          = pmp6cfg_executeable;
assign regs_comp_addr_mode6[1:0] = pmp6cfg_mode[1:0];
assign regs_comp_lock6           = pmp6cfg_lock;

assign regs_comp_read7           = pmp7cfg_readable;
assign regs_comp_write7          = pmp7cfg_writable;
assign regs_comp_excut7          = pmp7cfg_executeable;
assign regs_comp_addr_mode7[1:0] = pmp7cfg_mode[1:0];
assign regs_comp_lock7           = pmp7cfg_lock;









//==========================================================
//                PMP Entry Configuration Register
//==========================================================
//------------------------------------------------
//pmpcfg0 register
//------------------------------------------------
assign pmp_updt_pmp0cfg = pmp_csr_wen[0] && !pmp0cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp0cfg_readable       <= 1'b0;
    pmp0cfg_writable       <= 1'b0;
    pmp0cfg_executeable    <= 1'b0;
    pmp0cfg_addr_mode[1:0] <= 2'b0;
    pmp0cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp0cfg && (!pmpteecfg_s0 || cp0_yy_secu_mode_aft_dbg))
  begin
    pmp0cfg_readable        <= cp0_pmp_updt_data[0];
    pmp0cfg_writable        <= cp0_pmp_updt_data[1];
    pmp0cfg_executeable     <= cp0_pmp_updt_data[2];
    pmp0cfg_addr_mode[1:0]  <= cp0_pmp_updt_data[4:3];
    pmp0cfg_lock            <= cp0_pmp_updt_data[7];
  end
  else
  begin
    pmp0cfg_readable       <= pmp0cfg_readable;     
    pmp0cfg_writable       <= pmp0cfg_writable;     
    pmp0cfg_executeable    <= pmp0cfg_executeable;     
    pmp0cfg_addr_mode[1:0] <= pmp0cfg_addr_mode[1:0];
    pmp0cfg_lock           <= pmp0cfg_lock;     
  end
end
assign pmp0cfg_mode[1:0] = pmp0cfg_addr_mode[1:0] == 2'b10 ? 2'b00 : pmp0cfg_addr_mode[1:0];

assign pmp_updt_pmp1cfg = pmp_csr_wen[0] && !pmp1cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp1cfg_readable       <= 1'b0;
    pmp1cfg_writable       <= 1'b0;
    pmp1cfg_executeable    <= 1'b0;
    pmp1cfg_addr_mode[1:0] <= 2'b0;
    pmp1cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp1cfg && (!pmpteecfg_s1 || cp0_yy_secu_mode_aft_dbg))
  begin
    pmp1cfg_readable       <= cp0_pmp_updt_data[8];
    pmp1cfg_writable       <= cp0_pmp_updt_data[9];
    pmp1cfg_executeable    <= cp0_pmp_updt_data[10];
    pmp1cfg_addr_mode[1:0] <= cp0_pmp_updt_data[12:11];
    pmp1cfg_lock           <= cp0_pmp_updt_data[15];
  end
  else
  begin
    pmp1cfg_readable       <= pmp1cfg_readable;     
    pmp1cfg_writable       <= pmp1cfg_writable;     
    pmp1cfg_executeable    <= pmp1cfg_executeable;     
    pmp1cfg_addr_mode[1:0] <= pmp1cfg_addr_mode[1:0];
    pmp1cfg_lock           <= pmp1cfg_lock;     
  end
end
assign pmp1cfg_mode[1:0] = pmp1cfg_addr_mode[1:0] == 2'b10 ? 2'b00 : pmp1cfg_addr_mode[1:0];

assign pmp_updt_pmp2cfg = pmp_csr_wen[0] && !pmp2cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp2cfg_readable       <= 1'b0;
    pmp2cfg_writable       <= 1'b0;
    pmp2cfg_executeable    <= 1'b0;
    pmp2cfg_addr_mode[1:0] <= 2'b0;
    pmp2cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp2cfg && (!pmpteecfg_s2 || cp0_yy_secu_mode_aft_dbg))
  begin
    pmp2cfg_readable       <= cp0_pmp_updt_data[16];
    pmp2cfg_writable       <= cp0_pmp_updt_data[17];
    pmp2cfg_executeable    <= cp0_pmp_updt_data[18];
    pmp2cfg_addr_mode[1:0] <= cp0_pmp_updt_data[20:19];
    pmp2cfg_lock           <= cp0_pmp_updt_data[23];
  end
  else
  begin
    pmp2cfg_readable       <= pmp2cfg_readable;     
    pmp2cfg_writable       <= pmp2cfg_writable;     
    pmp2cfg_executeable    <= pmp2cfg_executeable;     
    pmp2cfg_addr_mode[1:0] <= pmp2cfg_addr_mode[1:0];
    pmp2cfg_lock           <= pmp2cfg_lock;     
  end
end
assign pmp2cfg_mode[1:0] = pmp2cfg_addr_mode[1:0] == 2'b10 ? 2'b00 : pmp2cfg_addr_mode[1:0];

assign pmp_updt_pmp3cfg = pmp_csr_wen[0] && !pmp3cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp3cfg_readable       <= 1'b0;
    pmp3cfg_writable       <= 1'b0;
    pmp3cfg_executeable    <= 1'b0;
    pmp3cfg_addr_mode[1:0] <= 2'b0;
    pmp3cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp3cfg && (!pmpteecfg_s3 || cp0_yy_secu_mode_aft_dbg))
  begin
    pmp3cfg_readable       <= cp0_pmp_updt_data[24];
    pmp3cfg_writable       <= cp0_pmp_updt_data[25];
    pmp3cfg_executeable    <= cp0_pmp_updt_data[26];
    pmp3cfg_addr_mode[1:0] <= cp0_pmp_updt_data[28:27];
    pmp3cfg_lock           <= cp0_pmp_updt_data[31];
  end
  else
  begin
    pmp3cfg_readable       <= pmp3cfg_readable;     
    pmp3cfg_writable       <= pmp3cfg_writable;     
    pmp3cfg_executeable    <= pmp3cfg_executeable;     
    pmp3cfg_addr_mode[1:0] <= pmp3cfg_addr_mode[1:0];
    pmp3cfg_lock           <= pmp3cfg_lock;     
  end
end
assign pmp3cfg_mode[1:0] = pmp3cfg_addr_mode[1:0] == 2'b10 ? 2'b00 : pmp3cfg_addr_mode[1:0];

//------------------------------------------------
//pmpcfg1 register
//------------------------------------------------
assign pmp_updt_pmp4cfg = pmp_csr_wen[1] && !pmp4cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp4cfg_readable       <= 1'b0;
    pmp4cfg_writable       <= 1'b0;
    pmp4cfg_executeable    <= 1'b0;
    pmp4cfg_addr_mode[1:0] <= 2'b0;
    pmp4cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp4cfg && (!pmpteecfg_s4 || cp0_yy_secu_mode_aft_dbg))
  begin
    pmp4cfg_readable        <= cp0_pmp_updt_data[0];
    pmp4cfg_writable        <= cp0_pmp_updt_data[1];
    pmp4cfg_executeable     <= cp0_pmp_updt_data[2];
    pmp4cfg_addr_mode[1:0]  <= cp0_pmp_updt_data[4:3];
    pmp4cfg_lock            <= cp0_pmp_updt_data[7];
  end
  else
  begin
    pmp4cfg_readable       <= pmp4cfg_readable;     
    pmp4cfg_writable       <= pmp4cfg_writable;     
    pmp4cfg_executeable    <= pmp4cfg_executeable;     
    pmp4cfg_addr_mode[1:0] <= pmp4cfg_addr_mode[1:0];
    pmp4cfg_lock           <= pmp4cfg_lock;     
  end
end
assign pmp4cfg_mode[1:0] = pmp4cfg_addr_mode[1:0] == 2'b10 ? 2'b00 : pmp4cfg_addr_mode[1:0];

assign pmp_updt_pmp5cfg = pmp_csr_wen[1] && !pmp5cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp5cfg_readable       <= 1'b0;
    pmp5cfg_writable       <= 1'b0;
    pmp5cfg_executeable    <= 1'b0;
    pmp5cfg_addr_mode[1:0] <= 2'b0;
    pmp5cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp5cfg && (!pmpteecfg_s5 || cp0_yy_secu_mode_aft_dbg))
  begin
    pmp5cfg_readable       <= cp0_pmp_updt_data[8];
    pmp5cfg_writable       <= cp0_pmp_updt_data[9];
    pmp5cfg_executeable    <= cp0_pmp_updt_data[10];
    pmp5cfg_addr_mode[1:0] <= cp0_pmp_updt_data[12:11];
    pmp5cfg_lock           <= cp0_pmp_updt_data[15];
  end
  else
  begin
    pmp5cfg_readable       <= pmp5cfg_readable;     
    pmp5cfg_writable       <= pmp5cfg_writable;     
    pmp5cfg_executeable    <= pmp5cfg_executeable;     
    pmp5cfg_addr_mode[1:0] <= pmp5cfg_addr_mode[1:0];
    pmp5cfg_lock           <= pmp5cfg_lock;     
  end
end
assign pmp5cfg_mode[1:0] = pmp5cfg_addr_mode[1:0] == 2'b10 ? 2'b00 : pmp5cfg_addr_mode[1:0];

assign pmp_updt_pmp6cfg = pmp_csr_wen[1] && !pmp6cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp6cfg_readable       <= 1'b0;
    pmp6cfg_writable       <= 1'b0;
    pmp6cfg_executeable    <= 1'b0;
    pmp6cfg_addr_mode[1:0] <= 2'b0;
    pmp6cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp6cfg && (!pmpteecfg_s6 || cp0_yy_secu_mode_aft_dbg))
  begin
    pmp6cfg_readable       <= cp0_pmp_updt_data[16];
    pmp6cfg_writable       <= cp0_pmp_updt_data[17];
    pmp6cfg_executeable    <= cp0_pmp_updt_data[18];
    pmp6cfg_addr_mode[1:0] <= cp0_pmp_updt_data[20:19];
    pmp6cfg_lock           <= cp0_pmp_updt_data[23];
  end
  else
  begin
    pmp6cfg_readable       <= pmp6cfg_readable;     
    pmp6cfg_writable       <= pmp6cfg_writable;     
    pmp6cfg_executeable    <= pmp6cfg_executeable;     
    pmp6cfg_addr_mode[1:0] <= pmp6cfg_addr_mode[1:0];
    pmp6cfg_lock           <= pmp6cfg_lock;     
  end
end
assign pmp6cfg_mode[1:0] = pmp6cfg_addr_mode[1:0] == 2'b10 ? 2'b00 : pmp6cfg_addr_mode[1:0];

assign pmp_updt_pmp7cfg = pmp_csr_wen[1] && !pmp7cfg_lock;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    pmp7cfg_readable       <= 1'b0;
    pmp7cfg_writable       <= 1'b0;
    pmp7cfg_executeable    <= 1'b0;
    pmp7cfg_addr_mode[1:0] <= 2'b0;
    pmp7cfg_lock           <= 1'b0;
  end
  else if(pmp_updt_pmp7cfg && (!pmpteecfg_s7 || cp0_yy_secu_mode_aft_dbg))
  begin
    pmp7cfg_readable       <= cp0_pmp_updt_data[24];
    pmp7cfg_writable       <= cp0_pmp_updt_data[25];
    pmp7cfg_executeable    <= cp0_pmp_updt_data[26];
    pmp7cfg_addr_mode[1:0] <= cp0_pmp_updt_data[28:27];
    pmp7cfg_lock           <= cp0_pmp_updt_data[31];
  end
  else
  begin
    pmp7cfg_readable       <= pmp7cfg_readable;     
    pmp7cfg_writable       <= pmp7cfg_writable;     
    pmp7cfg_executeable    <= pmp7cfg_executeable;     
    pmp7cfg_addr_mode[1:0] <= pmp7cfg_addr_mode[1:0];
    pmp7cfg_lock           <= pmp7cfg_lock;     
  end
end
assign pmp7cfg_mode[1:0] = pmp7cfg_addr_mode[1:0] == 2'b10 ? 2'b00 : pmp7cfg_addr_mode[1:0];

//------------------------------------------------
//pmpcfg2 register
//------------------------------------------------
assign pmp8cfg_mode[1:0] = 2'b00;
assign regs_comp_lock8   = 1'b0;

assign pmp9cfg_mode[1:0] = 2'b00;
assign regs_comp_lock9   = 1'b0;

assign pmp10cfg_mode[1:0] = 2'b00;
assign regs_comp_lock10   = 1'b0;

assign pmp11cfg_mode[1:0] = 2'b00;
assign regs_comp_lock11   = 1'b0;

//------------------------------------------------
//pmpcfg3 register
//------------------------------------------------
assign pmp12cfg_mode[1:0] = 2'b00;
assign regs_comp_lock12   = 1'b0;

assign pmp13cfg_mode[1:0] = 2'b00;
assign regs_comp_lock13   = 1'b0;

assign pmp14cfg_mode[1:0] = 2'b00;
assign regs_comp_lock14   = 1'b0;

assign pmp15cfg_mode[1:0] = 2'b00;
assign regs_comp_lock15   = 1'b0;



assign pmpcfg0_value[31:0] = {pmp3cfg_lock,2'b0,pmp3cfg_mode[1:0],pmp3cfg_executeable,pmp3cfg_writable,pmp3cfg_readable,
                              pmp2cfg_lock,2'b0,pmp2cfg_mode[1:0],pmp2cfg_executeable,pmp2cfg_writable,pmp2cfg_readable,
                              pmp1cfg_lock,2'b0,pmp1cfg_mode[1:0],pmp1cfg_executeable,pmp1cfg_writable,pmp1cfg_readable,
                              pmp0cfg_lock,2'b0,pmp0cfg_mode[1:0],pmp0cfg_executeable,pmp0cfg_writable,pmp0cfg_readable};
assign pmpcfg1_value[31:0] = {pmp7cfg_lock,2'b0,pmp7cfg_mode[1:0],pmp7cfg_executeable,pmp7cfg_writable,pmp7cfg_readable,
                              pmp6cfg_lock,2'b0,pmp6cfg_mode[1:0],pmp6cfg_executeable,pmp6cfg_writable,pmp6cfg_readable,
                              pmp5cfg_lock,2'b0,pmp5cfg_mode[1:0],pmp5cfg_executeable,pmp5cfg_writable,pmp5cfg_readable,
                              pmp4cfg_lock,2'b0,pmp4cfg_mode[1:0],pmp4cfg_executeable,pmp4cfg_writable,pmp4cfg_readable};
assign pmpcfg2_value[31:0] = 32'b0;
assign pmpcfg3_value[31:0] = 32'b0;





//==========================================================
//                PMP Entry Address Register
//==========================================================
//------------------------------------------------
//pmpaddr0 register
//------------------------------------------------
assign pmp_updt_pmpaddr0 = pmp_csr_wen[4] && !pmpcfg0_value[7] && !(pmpcfg0_value[15] && (pmpcfg0_value[12:11] == 2'b01)) ;
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr0_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr0 && (!pmpteecfg_s0 || cp0_yy_secu_mode_aft_dbg))
    pmpaddr0_value[ADDR_WIDTH-1:0] <= cp0_pmp_updt_data[ADDR_WIDTH+3:4];
  else
    pmpaddr0_value[ADDR_WIDTH-1:0] <= pmpaddr0_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr0_value"); @866

assign pmp_updt_pmpaddr1 = pmp_csr_wen[5] && !pmpcfg0_value[15] && !(pmpcfg0_value[23] && (pmpcfg0_value[20:19] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr1_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr1 && (!pmpteecfg_s1 || cp0_yy_secu_mode_aft_dbg))
    pmpaddr1_value[ADDR_WIDTH-1:0] <= cp0_pmp_updt_data[ADDR_WIDTH+3:4];
  else
    pmpaddr1_value[ADDR_WIDTH-1:0] <= pmpaddr1_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr1_value"); @882

assign pmp_updt_pmpaddr2 = pmp_csr_wen[6] && !pmpcfg0_value[23] && !(pmpcfg0_value[31] && (pmpcfg0_value[28:27] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr2_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr2 && (!pmpteecfg_s2 || cp0_yy_secu_mode_aft_dbg))
    pmpaddr2_value[ADDR_WIDTH-1:0] <= cp0_pmp_updt_data[ADDR_WIDTH+3:4];
  else
    pmpaddr2_value[ADDR_WIDTH-1:0] <= pmpaddr2_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr2_value"); @898

assign pmp_updt_pmpaddr3 = pmp_csr_wen[7] && !pmpcfg0_value[31] && !(pmpcfg1_value[7] && (pmpcfg1_value[4:3] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr3_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr3 && (!pmpteecfg_s3 || cp0_yy_secu_mode_aft_dbg))
    pmpaddr3_value[ADDR_WIDTH-1:0] <= cp0_pmp_updt_data[ADDR_WIDTH+3:4];
  else
    pmpaddr3_value[ADDR_WIDTH-1:0] <= pmpaddr3_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr3_value"); @914

assign pmp_updt_pmpaddr4 = pmp_csr_wen[8] && !pmpcfg1_value[7] && !(pmpcfg1_value[15] && (pmpcfg1_value[12:11] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr4_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr4 && (!pmpteecfg_s4 || cp0_yy_secu_mode_aft_dbg))
    pmpaddr4_value[ADDR_WIDTH-1:0] <= cp0_pmp_updt_data[ADDR_WIDTH+3:4];
  else
    pmpaddr4_value[ADDR_WIDTH-1:0] <= pmpaddr4_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr4_value"); @930

assign pmp_updt_pmpaddr5 = pmp_csr_wen[9] && !pmpcfg1_value[15] && !(pmpcfg1_value[23] && (pmpcfg1_value[20:19] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr5_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr5 && (!pmpteecfg_s5 || cp0_yy_secu_mode_aft_dbg))
    pmpaddr5_value[ADDR_WIDTH-1:0] <= cp0_pmp_updt_data[ADDR_WIDTH+3:4];
  else
    pmpaddr5_value[ADDR_WIDTH-1:0] <= pmpaddr5_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr5_value"); @946

assign pmp_updt_pmpaddr6 = pmp_csr_wen[10] && !pmpcfg1_value[23] && !(pmpcfg1_value[31] && (pmpcfg1_value[28:27] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr6_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr6 && (!pmpteecfg_s6 || cp0_yy_secu_mode_aft_dbg))
    pmpaddr6_value[ADDR_WIDTH-1:0] <= cp0_pmp_updt_data[ADDR_WIDTH+3:4];
  else
    pmpaddr6_value[ADDR_WIDTH-1:0] <= pmpaddr6_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr6_value"); @962

assign pmp_updt_pmpaddr7 = pmp_csr_wen[11] && !pmpcfg1_value[31] && !(pmpcfg2_value[7] && (pmpcfg2_value[4:3] == 2'b01));
always @(posedge cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pmpaddr7_value[ADDR_WIDTH-1:0] <= {ADDR_WIDTH{1'b0}};
  else if(pmp_updt_pmpaddr7 && (!pmpteecfg_s7 || cp0_yy_secu_mode_aft_dbg))
    pmpaddr7_value[ADDR_WIDTH-1:0] <= cp0_pmp_updt_data[ADDR_WIDTH+3:4];
  else
    pmpaddr7_value[ADDR_WIDTH-1:0] <= pmpaddr7_value[ADDR_WIDTH-1:0];
end
// &Force("output","pmpaddr7_value"); @978

// &Force("output","pmpaddr8_value"); @994
assign pmpaddr8_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};

// &Force("output","pmpaddr9_value"); @1010
assign pmpaddr9_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};

// &Force("output","pmpaddr10_value"); @1026
assign pmpaddr10_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};

// &Force("output","pmpaddr11_value"); @1042
assign pmpaddr11_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};


// &Force("output","pmpaddr12_value"); @1059
assign pmpaddr12_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};

// &Force("output","pmpaddr13_value"); @1075
assign pmpaddr13_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};

// &Force("output","pmpaddr14_value"); @1091
assign pmpaddr14_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};

// &Force("output","pmpaddr15_value"); @1107
assign pmpaddr15_value[ADDR_WIDTH-1:0] = {ADDR_WIDTH{1'b0}};

//==========================================================
//          PMP Entry TEE Configuration Register
//==========================================================
//------------------------------------------------
//pmpteecfg[0] register
//------------------------------------------------
assign pmpteecfg_s0 = 1'b0;

//------------------------------------------------
//pmpteecfg[1] register
//------------------------------------------------
assign pmpteecfg_s1 = 1'b0;

//------------------------------------------------
//pmpteecfg[2] register
//------------------------------------------------
assign pmpteecfg_s2 = 1'b0;

//------------------------------------------------
//pmpteecfg[3] register
//------------------------------------------------
assign pmpteecfg_s3 = 1'b0;

//------------------------------------------------
//pmpteecfg[4] register
//------------------------------------------------
assign pmpteecfg_s4 = 1'b0;

//------------------------------------------------
//pmpteecfg[5] register
//------------------------------------------------
assign pmpteecfg_s5 = 1'b0;

//------------------------------------------------
//pmpteecfg[6] register
//------------------------------------------------
assign pmpteecfg_s6 = 1'b0;

//------------------------------------------------
//pmpteecfg[7] register
//------------------------------------------------
assign pmpteecfg_s7 = 1'b0;

//------------------------------------------------
//pmpteecfg[8] register
//------------------------------------------------

//------------------------------------------------
//pmpteecfg[9] register
//------------------------------------------------

//------------------------------------------------
//pmpteecfg[10] register
//------------------------------------------------

//------------------------------------------------
//pmpteecfg[11] register
//------------------------------------------------

//------------------------------------------------
//pmpteecfg[12] register
//------------------------------------------------

//------------------------------------------------
//pmpteecfg[13] register
//------------------------------------------------

//------------------------------------------------
//pmpteecfg[14] register
//------------------------------------------------

//------------------------------------------------
//pmpteecfg[15] register
//------------------------------------------------

// &Force("nonport","pmpteecfg_value"); @1504
assign pmpaddr0_low[4:0]  = pmp0cfg_mode[1]  ? {pmpaddr0_value[0],  4'hf} : {5{1'b0}};
assign pmpaddr1_low[4:0]  = pmp1cfg_mode[1]  ? {pmpaddr1_value[0],  4'hf} : {5{1'b0}};
assign pmpaddr2_low[4:0]  = pmp2cfg_mode[1]  ? {pmpaddr2_value[0],  4'hf} : {5{1'b0}};
assign pmpaddr3_low[4:0]  = pmp3cfg_mode[1]  ? {pmpaddr3_value[0],  4'hf} : {5{1'b0}};
assign pmpaddr4_low[4:0]  = pmp4cfg_mode[1]  ? {pmpaddr4_value[0],  4'hf} : {5{1'b0}};
assign pmpaddr5_low[4:0]  = pmp5cfg_mode[1]  ? {pmpaddr5_value[0],  4'hf} : {5{1'b0}};
assign pmpaddr6_low[4:0]  = pmp6cfg_mode[1]  ? {pmpaddr6_value[0],  4'hf} : {5{1'b0}};
assign pmpaddr7_low[4:0]  = pmp7cfg_mode[1]  ? {pmpaddr7_value[0],  4'hf} : {5{1'b0}};
assign pmpaddr8_low[4:0]  = pmp8cfg_mode[1]  ? {pmpaddr8_value[0],  4'hf} : {5{1'b0}};
assign pmpaddr9_low[4:0]  = pmp9cfg_mode[1]  ? {pmpaddr9_value[0],  4'hf} : {5{1'b0}};
assign pmpaddr10_low[4:0] = pmp10cfg_mode[1] ? {pmpaddr10_value[0], 4'hf} : {5{1'b0}};
assign pmpaddr11_low[4:0] = pmp11cfg_mode[1] ? {pmpaddr11_value[0], 4'hf} : {5{1'b0}};
assign pmpaddr12_low[4:0] = pmp12cfg_mode[1] ? {pmpaddr12_value[0], 4'hf} : {5{1'b0}};
assign pmpaddr13_low[4:0] = pmp13cfg_mode[1] ? {pmpaddr13_value[0], 4'hf} : {5{1'b0}};
assign pmpaddr14_low[4:0] = pmp14cfg_mode[1] ? {pmpaddr14_value[0], 4'hf} : {5{1'b0}};
assign pmpaddr15_low[4:0] = pmp15cfg_mode[1] ? {pmpaddr15_value[0], 4'hf} : {5{1'b0}};


// &Force("bus", "pmp_csr_wen", 19, 0); @1620
assign pmp_cp0_data[31:0]  = {32{cp0_pmp_csr_sel[0]}}  & pmpcfg0_value[31:0]
                           | {32{cp0_pmp_csr_sel[1]}}  & pmpcfg1_value[31:0]
                           | {32{cp0_pmp_csr_sel[2]}}  & pmpcfg2_value[31:0]
                           | {32{cp0_pmp_csr_sel[3]}}  & pmpcfg3_value[31:0]
                           | {32{cp0_pmp_csr_sel[4]}}  & {{2{1'b0}}, pmpaddr0_value[ADDR_WIDTH-1:1],  pmpaddr0_low[4:0]}
                           | {32{cp0_pmp_csr_sel[5]}}  & {{2{1'b0}}, pmpaddr1_value[ADDR_WIDTH-1:1],  pmpaddr1_low[4:0]}
                           | {32{cp0_pmp_csr_sel[6]}}  & {{2{1'b0}}, pmpaddr2_value[ADDR_WIDTH-1:1],  pmpaddr2_low[4:0]}
                           | {32{cp0_pmp_csr_sel[7]}}  & {{2{1'b0}}, pmpaddr3_value[ADDR_WIDTH-1:1],  pmpaddr3_low[4:0]}
                           | {32{cp0_pmp_csr_sel[8]}}  & {{2{1'b0}}, pmpaddr4_value[ADDR_WIDTH-1:1],  pmpaddr4_low[4:0]}
                           | {32{cp0_pmp_csr_sel[9]}}  & {{2{1'b0}}, pmpaddr5_value[ADDR_WIDTH-1:1],  pmpaddr5_low[4:0]}
                           | {32{cp0_pmp_csr_sel[10]}} & {{2{1'b0}}, pmpaddr6_value[ADDR_WIDTH-1:1],  pmpaddr6_low[4:0]}
                           | {32{cp0_pmp_csr_sel[11]}} & {{2{1'b0}}, pmpaddr7_value[ADDR_WIDTH-1:1],  pmpaddr7_low[4:0]}
                           | {32{cp0_pmp_csr_sel[12]}} & {{2{1'b0}}, pmpaddr8_value[ADDR_WIDTH-1:1],  pmpaddr8_low[4:0]}
                           | {32{cp0_pmp_csr_sel[13]}} & {{2{1'b0}}, pmpaddr9_value[ADDR_WIDTH-1:1],  pmpaddr9_low[4:0]}
                           | {32{cp0_pmp_csr_sel[14]}} & {{2{1'b0}}, pmpaddr10_value[ADDR_WIDTH-1:1], pmpaddr10_low[4:0]}
                           | {32{cp0_pmp_csr_sel[15]}} & {{2{1'b0}}, pmpaddr11_value[ADDR_WIDTH-1:1], pmpaddr11_low[4:0]}
                           | {32{cp0_pmp_csr_sel[16]}} & {{2{1'b0}}, pmpaddr12_value[ADDR_WIDTH-1:1], pmpaddr12_low[4:0]}
                           | {32{cp0_pmp_csr_sel[17]}} & {{2{1'b0}}, pmpaddr13_value[ADDR_WIDTH-1:1], pmpaddr13_low[4:0]}
                           | {32{cp0_pmp_csr_sel[18]}} & {{2{1'b0}}, pmpaddr14_value[ADDR_WIDTH-1:1], pmpaddr14_low[4:0]}
                           | {32{cp0_pmp_csr_sel[19]}} & {{2{1'b0}}, pmpaddr15_value[ADDR_WIDTH-1:1], pmpaddr15_low[4:0]};

// &ModuleEnd; @1643
endmodule


