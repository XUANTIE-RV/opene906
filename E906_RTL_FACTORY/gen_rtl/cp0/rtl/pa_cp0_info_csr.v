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
module pa_cp0_info_csr(
  cpurst_b,
  iui_regs_inst_csr,
  marchid_value,
  mcpuid_local_en,
  mcpuid_value,
  mhartid_value,
  mimpid_value,
  mvendorid_value,
  regs_clk
);

// &Ports; @24
input           cpurst_b;          
input           iui_regs_inst_csr; 
input           mcpuid_local_en;   
input           regs_clk;          
output  [31:0]  marchid_value;     
output  [31:0]  mcpuid_value;      
output  [31:0]  mhartid_value;     
output  [31:0]  mimpid_value;      
output  [31:0]  mvendorid_value;   

// &Regs; @25
reg     [31:0]  cpuid_value;       
reg     [1 :0]  index;             

// &Wires; @26
wire    [31:0]  cpuid_index0_value; 
wire    [31:0]  cpuid_index1_value; 
wire    [31:0]  cpuid_index2_value; 
wire            cpurst_b;          
wire            index_max;         
wire    [1 :0]  index_next_val;    
wire            iui_regs_inst_csr; 
wire    [31:0]  marchid_value;     
wire            mcpuid_local_en;   
wire    [31:0]  mcpuid_value;      
wire    [31:0]  mhartid_value;     
wire    [31:0]  mimpid_value;      
wire    [31:0]  mvendorid_value;   
wire            regs_clk;          


//==========================================================
// Machine Information CSR Module
// 1. RISC-V Priviledge 1.11 Information Group
// 2. RISC-V Priviledge 1.11 Basic Counters
// 3. T-Head CPU Information Extension
//==========================================================
//----------------------------------------------------------
// 1. RISC-V Priviledge 1.11 Information Group
//----------------------------------------------------------

//==========================================================
//               Define the MVENDORID Register
//==========================================================
//  Machine Vendor ID Register
//  32-bit readonly
//  Providing the JEDEC ID of T-Head
//==========================================================
assign mvendorid_value[31:0] = 32'h5B7;

//==========================================================
//               Define the MARCHID Register
//==========================================================
//  Machine Architecture ID Register
//  32-bit readonly
//  *Currently not implemented, need to be defined
//==========================================================
assign marchid_value[31:0] = 32'b0;

//==========================================================
//               Define the MIMPID Register
//==========================================================
//  Machine Implementation ID Register
//  32-bit readonly
//  Providing the implementation ID of the version of core
//  *Currently not implemented, need to be defined
//==========================================================
assign mimpid_value[31:0] = 32'b0;

//==========================================================
//               Define the MHARTID Register
//==========================================================
//  Machine Hart ID Register
//  32-bit readonly
//  Providing the Hart ID of the current core
//  For single core only, fix to 32'b0
//==========================================================
assign mhartid_value[31:0] = 32'b0;

//----------------------------------------------------------
// 2. RISC-V Priviledge 1.11 Basic Counters
//----------------------------------------------------------
// mcycle, minstret now in HPCP.

//----------------------------------------------------------
// 3. T-Head CPU Information Extension
//----------------------------------------------------------

//==========================================================
//               Define the cpuid register
//==========================================================

//----------------------------------------------------------
//                    Index Register
//----------------------------------------------------------
assign index_max = (index[1:0] == 2'd2);
assign index_next_val[1:0] = (index_max) ? 2'd0
                                         : index[1:0] + 2'd1;

always @(posedge regs_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      index[1:0] <= 2'b0;
    end
  else if (iui_regs_inst_csr && mcpuid_local_en)
    begin
      index[1:0] <= index_next_val[1:0];
    end
  else
    begin
      index[1:0] <= index[1:0];
    end
end

//----------------------------------------------------------
//                Implement of cpuid register
//----------------------------------------------------------
// &CombBeg; @115
always @( cpuid_index1_value[31:0]
       or cpuid_index0_value[31:0]
       or index[1:0]
       or cpuid_index2_value[31:0])
begin
  case(index[1:0])
  2'b00   : cpuid_value[31:0] = cpuid_index0_value[31:0];
  2'b01   : cpuid_value[31:0] = cpuid_index1_value[31:0];
  2'b10   : cpuid_value[31:0] = cpuid_index2_value[31:0];
  default : cpuid_value[31:0] = {32{1'bx}};
  endcase
// &CombEnd; @122
end

//---------------------------------------------------------
//                    Index 0
//---------------------------------------------------------
    assign cpuid_index0_value[31:28] = 4'b0000;

//------------------------------------------------
//                     Arch  
//------------------------------------------------
    assign cpuid_index0_value[27:26] = 2'b10; // CSKY V3 instruction set

//------------------------------------------------
//                     Family
//------------------------------------------------
    assign cpuid_index0_value[25:22] = 4'b0000; // E Series

//------------------------------------------------
//                     Class 
//------------------------------------------------
    assign cpuid_index0_value[21:18] = 4'b0100; // E906

//------------------------------------------------
//                     Model 
//------------------------------------------------
    assign cpuid_index0_value[17:11] = 7'b0; 
  
    assign cpuid_index0_value[9] = 1'b0;

    assign cpuid_index0_value[8] = 1'b1;

    assign cpuid_index0_value[10] = 1'b0;
//------------------------------------------------
//                   ISA Revision
//------------------------------------------------
    assign cpuid_index0_value[7:3] = 5'b00001;

//------------------------------------------------
//                     Version
//------------------------------------------------
    assign cpuid_index0_value[2:0] = 3'b101; //CPID Rev.5

//---------------------------------------------------------
//                    Index 1
//---------------------------------------------------------
    assign cpuid_index1_value[31:28] = 4'b0001;

//------------------------------------------------
//                    Revision
//------------------------------------------------
    assign cpuid_index1_value[27:24] = `REVISION;

//------------------------------------------------
//                  Sub Revision
//------------------------------------------------
    assign cpuid_index1_value[23:18] = `SUB_VERSION;

//------------------------------------------------
//                      Patch
//------------------------------------------------
    assign cpuid_index1_value[17:12] = `PATCH;

//------------------------------------------------
//                     PRODUCT ID
//------------------------------------------------
    assign cpuid_index1_value[11:0] = `PRODUCT_ID;

//------------------------------------------------
//                    Index 2
//------------------------------------------------
    assign cpuid_index2_value[31:28] = 4'b0010;

//------------------------------------------------
//                    IBUS
//------------------------------------------------
    assign cpuid_index2_value[27:26] = 2'b01;

//------------------------------------------------
//                    DBUS
//------------------------------------------------
    assign cpuid_index2_value[25:24] = 2'b01;

//------------------------------------------------
//                    SBUS
//------------------------------------------------
    assign cpuid_index2_value[23:21] = 3'b001;

//------------------------------------------------
//                    BTB
//------------------------------------------------
    assign cpuid_index2_value[20:19] = 2'b01;

//------------------------------------------------
//                    BHT
//------------------------------------------------
    assign cpuid_index2_value[18:16] = 3'b011;

//------------------------------------------------
//                    INTC
//------------------------------------------------
    assign cpuid_index2_value[15:12] = 4'b1111;

//------------------------------------------------
//                  DCACHE Todo
//------------------------------------------------
    assign cpuid_index2_value[11:9] = 3'b100;

//------------------------------------------------
//                  ICACHE
//------------------------------------------------
    assign cpuid_index2_value[8:6] = 3'b100;

//------------------------------------------------
//                   PMP zone size
//------------------------------------------------
    assign cpuid_index2_value[5:3] = 3'b111; // 4B

//------------------------------------------------
//                   MGU zone num
//------------------------------------------------
    assign cpuid_index2_value[2:0] = 3'b011;
assign mcpuid_value[31:0] = cpuid_value[31:0];


//==========================================================
// Rename for Output
//==========================================================

//assign info_csr_cpuid0_value[31:0] = cpuid_index0_value[31:0];

// &ModuleEnd; @365
endmodule


