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
module pa_pmp_enc(
  cp0_pmp_mstatus_mpp,
  cp0_pmp_mstatus_mprv,
  cp0_yy_mach_mode,
  ifu_pmp_machine_mode,
  lsu_4k_cross,
  lsu_pmp_write,
  pmp_entry_lock,
  pmp_ifu_acc_deny,
  pmp_ifu_hit,
  pmp_lsu_acc_deny,
  pmp_lsu_hit,
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
input   [1 :0]  cp0_pmp_mstatus_mpp;   
input           cp0_pmp_mstatus_mprv;  
input           cp0_yy_mach_mode;      
input           ifu_pmp_machine_mode;  
input   [15:0]  lsu_4k_cross;          
input           lsu_pmp_write;         
input   [7 :0]  pmp_ifu_hit;           
input   [7 :0]  pmp_lsu_hit;           
input           regs_comp_excut0;      
input           regs_comp_excut1;      
input           regs_comp_excut2;      
input           regs_comp_excut3;      
input           regs_comp_excut4;      
input           regs_comp_excut5;      
input           regs_comp_excut6;      
input           regs_comp_excut7;      
input           regs_comp_lock0;       
input           regs_comp_lock1;       
input           regs_comp_lock10;      
input           regs_comp_lock11;      
input           regs_comp_lock12;      
input           regs_comp_lock13;      
input           regs_comp_lock14;      
input           regs_comp_lock15;      
input           regs_comp_lock2;       
input           regs_comp_lock3;       
input           regs_comp_lock4;       
input           regs_comp_lock5;       
input           regs_comp_lock6;       
input           regs_comp_lock7;       
input           regs_comp_lock8;       
input           regs_comp_lock9;       
input           regs_comp_read0;       
input           regs_comp_read1;       
input           regs_comp_read2;       
input           regs_comp_read3;       
input           regs_comp_read4;       
input           regs_comp_read5;       
input           regs_comp_read6;       
input           regs_comp_read7;       
input           regs_comp_write0;      
input           regs_comp_write1;      
input           regs_comp_write2;      
input           regs_comp_write3;      
input           regs_comp_write4;      
input           regs_comp_write5;      
input           regs_comp_write6;      
input           regs_comp_write7;      
output  [15:0]  pmp_entry_lock;        
output          pmp_ifu_acc_deny;      
output          pmp_lsu_acc_deny;      

// &Regs; @25
reg             ifu_access_deny;       
reg             lsu_access_deny;       

// &Wires; @26
wire    [1 :0]  cp0_pmp_mstatus_mpp;   
wire            cp0_pmp_mstatus_mprv;  
wire            cp0_yy_mach_mode;      
wire            ifu_acc_machine_mode;  
wire            ifu_acc_user_mode;     
wire    [7 :0]  ifu_access_deny_region; 
wire            ifu_access_no_hit_deny; 
wire            ifu_pmp_machine_mode;  
wire            lsu_acc_machine_mode;  
wire            lsu_acc_user_mode;     
wire    [7 :0]  lsu_access_deny_region; 
wire            lsu_access_no_hit_deny; 
wire            lsu_pmp_write;         
wire    [15:0]  pmp_entry_lock;        
wire            pmp_ifu_acc_deny;      
wire    [7 :0]  pmp_ifu_hit;           
wire            pmp_lsu_acc_deny;      
wire    [7 :0]  pmp_lsu_hit;           
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


//----------------------------------------------------------
// region access arbitor
//----------------------------------------------------------
//==========================================================
//                Attribute Matching Logic
//==========================================================
//-------------------------------------------
// Check the access attribute of each region
//-------------------------------------------
assign lsu_acc_machine_mode = cp0_yy_mach_mode && !cp0_pmp_mstatus_mprv
                           || (cp0_pmp_mstatus_mpp[1:0] == 2'b11) && cp0_pmp_mstatus_mprv;
                     
assign lsu_acc_user_mode    = !cp0_yy_mach_mode && !cp0_pmp_mstatus_mprv
                           || (cp0_pmp_mstatus_mpp[1:0] == 2'b00)  && cp0_pmp_mstatus_mprv;

//when bmu not grant,acc machine mode and secure mode should not change
assign ifu_acc_machine_mode = ifu_pmp_machine_mode;
assign ifu_acc_user_mode    = !ifu_pmp_machine_mode;

// &Instance("pa_pmp_acc_arb","x_pa_pmp_acc_arb"); @67
pa_pmp_acc_arb  x_pa_pmp_acc_arb (
  .ifu_acc_machine_mode   (ifu_acc_machine_mode  ),
  .ifu_acc_user_mode      (ifu_acc_user_mode     ),
  .ifu_access_deny_region (ifu_access_deny_region),
  .ifu_access_no_hit_deny (ifu_access_no_hit_deny),
  .lsu_acc_machine_mode   (lsu_acc_machine_mode  ),
  .lsu_acc_user_mode      (lsu_acc_user_mode     ),
  .lsu_access_deny_region (lsu_access_deny_region),
  .lsu_access_no_hit_deny (lsu_access_no_hit_deny),
  .lsu_pmp_is_st          (lsu_pmp_write         ),
  .regs_comp_excut0       (regs_comp_excut0      ),
  .regs_comp_excut1       (regs_comp_excut1      ),
  .regs_comp_excut2       (regs_comp_excut2      ),
  .regs_comp_excut3       (regs_comp_excut3      ),
  .regs_comp_excut4       (regs_comp_excut4      ),
  .regs_comp_excut5       (regs_comp_excut5      ),
  .regs_comp_excut6       (regs_comp_excut6      ),
  .regs_comp_excut7       (regs_comp_excut7      ),
  .regs_comp_lock0        (regs_comp_lock0       ),
  .regs_comp_lock1        (regs_comp_lock1       ),
  .regs_comp_lock2        (regs_comp_lock2       ),
  .regs_comp_lock3        (regs_comp_lock3       ),
  .regs_comp_lock4        (regs_comp_lock4       ),
  .regs_comp_lock5        (regs_comp_lock5       ),
  .regs_comp_lock6        (regs_comp_lock6       ),
  .regs_comp_lock7        (regs_comp_lock7       ),
  .regs_comp_read0        (regs_comp_read0       ),
  .regs_comp_read1        (regs_comp_read1       ),
  .regs_comp_read2        (regs_comp_read2       ),
  .regs_comp_read3        (regs_comp_read3       ),
  .regs_comp_read4        (regs_comp_read4       ),
  .regs_comp_read5        (regs_comp_read5       ),
  .regs_comp_read6        (regs_comp_read6       ),
  .regs_comp_read7        (regs_comp_read7       ),
  .regs_comp_write0       (regs_comp_write0      ),
  .regs_comp_write1       (regs_comp_write1      ),
  .regs_comp_write2       (regs_comp_write2      ),
  .regs_comp_write3       (regs_comp_write3      ),
  .regs_comp_write4       (regs_comp_write4      ),
  .regs_comp_write5       (regs_comp_write5      ),
  .regs_comp_write6       (regs_comp_write6      ),
  .regs_comp_write7       (regs_comp_write7      )
);

// &Connect( @68
//          .lsu_pmp_is_st (lsu_pmp_write) @69
//         ); @70

// &CombBeg; @76
// &CombEnd; @83
// &CombBeg; @85
// &CombEnd; @92

// &CombBeg; @99
// &CombEnd; @108
// &CombBeg; @110
// &CombEnd; @119

//----------------------------------------------------------
//priority encoder for access_deny
//----------------------------------------------------------
// &CombBeg; @126
always @( ifu_access_deny_region[7:4]
       or ifu_access_no_hit_deny
       or ifu_access_deny_region[3:0]
       or pmp_ifu_hit[7:0])
begin
  casez(pmp_ifu_hit[7:0])
    8'b???????1  : ifu_access_deny = ifu_access_deny_region[0];
    8'b??????10  : ifu_access_deny = ifu_access_deny_region[1];
    8'b?????100  : ifu_access_deny = ifu_access_deny_region[2];
    8'b????1000  : ifu_access_deny = ifu_access_deny_region[3];
    8'b???10000  : ifu_access_deny = ifu_access_deny_region[4];
    8'b??100000  : ifu_access_deny = ifu_access_deny_region[5];
    8'b?1000000  : ifu_access_deny = ifu_access_deny_region[6];
    8'b10000000  : ifu_access_deny = ifu_access_deny_region[7];
    8'b00000000  : ifu_access_deny = ifu_access_no_hit_deny;
    default      : ifu_access_deny = 1'bx;
endcase
// &CombEnd; @139
end

// &CombBeg; @141
always @( lsu_access_deny_region[7:4]
       or pmp_lsu_hit[7:0]
       or lsu_access_no_hit_deny
       or lsu_access_deny_region[3:0])
begin
  casez(pmp_lsu_hit[7:0])
    8'b???????1  : lsu_access_deny = lsu_access_deny_region[0];
    8'b??????10  : lsu_access_deny = lsu_access_deny_region[1];
    8'b?????100  : lsu_access_deny = lsu_access_deny_region[2];
    8'b????1000  : lsu_access_deny = lsu_access_deny_region[3];
    8'b???10000  : lsu_access_deny = lsu_access_deny_region[4];
    8'b??100000  : lsu_access_deny = lsu_access_deny_region[5];
    8'b?1000000  : lsu_access_deny = lsu_access_deny_region[6];
    8'b10000000  : lsu_access_deny = lsu_access_deny_region[7];
    8'b00000000  : lsu_access_deny = lsu_access_no_hit_deny;
    default      : lsu_access_deny = 1'bx;
endcase
// &CombEnd; @154
end

// &CombBeg; @161
// &CombEnd; @178
// &CombBeg; @180
// &CombEnd; @197

// &CombBeg; @204
// &CombEnd; @225
// &CombBeg; @227
// &CombEnd; @248

assign pmp_entry_lock[15:0] = {
          regs_comp_lock15, regs_comp_lock14, regs_comp_lock13, regs_comp_lock12,
          regs_comp_lock11, regs_comp_lock10, regs_comp_lock9,  regs_comp_lock8,
          regs_comp_lock7,  regs_comp_lock6,  regs_comp_lock5,  regs_comp_lock4,
          regs_comp_lock3,  regs_comp_lock2,  regs_comp_lock1,  regs_comp_lock0
          };
// &Force("input", "lsu_4k_cross"); @261
// &Force("bus", "lsu_4k_cross", 15, 0); @262

//----------------------------------------------------------
//  Interface to Bus Matrix Unit
assign pmp_ifu_acc_deny = ifu_access_deny;
assign pmp_lsu_acc_deny = lsu_access_deny;


// &ModuleEnd;     @271
endmodule


