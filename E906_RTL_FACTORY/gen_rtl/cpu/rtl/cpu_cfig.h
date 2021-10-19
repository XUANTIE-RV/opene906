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
























`define PRODUCT_ID 12'h000





`define RESET_VAL 16'hABCD




`define E906





`ifdef E906
`define REVISION    4'd2
`define SUB_VERSION 6'd2
`define PATCH       6'd2
`endif








`define FPGA
















`define NEW_DFT











































`define BHT
`ifdef BHT
  //`define BHT_2K
  //`define BHT_4K
  `define BHT_8K
  //`define BHT_16K
`endif




`define BTB




`define RAS




`define CLIC_MODE













`define HARDWARE_STACK









`define LS_MISALIGN




`define FPU


`ifdef FPU_DOUBLE
  `define FLEN  64
`else
  `define FLEN  32
`endif












`ifdef E906
  `define IAHB_LITE
  `define DAHB_LITE
`endif

`ifdef IAHB_LITE
  //`define FLOP_OUT_IBUS
  `define IBUS_32
`endif

`ifdef DAHB_LITE
  //`define FLOP_OUT_DBUS
  `define DBUS_32
`endif






`define SYS_AHB_LITE
`define BIU_32




`define FLOP_OUT_BIU




`define PMP

`ifdef PMP
  //`define PMP_REGION_4
  `define PMP_REGION_8
  //`define PMP_REGION_12
  //`define PMP_REGION_16
`endif





`define ICACHE
`define DCACHE

`ifdef ICACHE



  `define ICACHE_16K

`endif



`ifdef DCACHE


  //`define DCACHE_8K
  `define DCACHE_16K


`endif




`define TCIPIF

`define DYNAMIC_SYSMAP

`ifdef CLIC_MODE
  // Attention:
  //   1. EXT_INT_NUM *MUST* > 0.
  //   2. If you don't want to use extensional clic int, use //`define EXT_INT_NUM rather than change EXT_INT_NUM to 0.
  //   3. If EXT_INT_NUM > 48, you need define CLIC_2_CYCLES unless the timing is loose.
  //   4. Don't change definition of CLIC_INTNUM.

  `define CLIC_2_CYCLES
  //`define U_MODE_INT
  `define CLIC_INTCTLBITS      3
  `define EXT_INT_NUM          128

  `ifdef EXT_INT_NUM
    `define CLIC_INTNUM   `EXT_INT_NUM+16
  `else
    `define CLIC_INTNUM   16
  `endif
`endif










`define PMU




`define THEAD_IP




`define TDT_DEBUG












`define TDT_DM_PB_EN




`ifdef TDT_DM_PB_EN
  `define TDT_DM_IEBREAK                  
  `define TDT_DM_PB_SIZE                    2
`endif









`ifdef TDT_DM_EXT_TRIGGER_EN
  //`define TDT_DM_EXTHALTTRI_4
  //`define TDT_DM_EXTHALTTRI_3
  //`define TDT_DM_EXTHALTTRI_2
  `define TDT_DM_EXTHALTTRI_1

  //`define TDT_DM_EXTRESUMETRI_4  
  //`define TDT_DM_EXTRESUMETRI_3 
  //`define TDT_DM_EXTRESUMETRI_2  
  `define TDT_DM_EXTRESUMETRI_1  
`endif





`define TDT_DM_NEXTDM_BA                    32'h00000000










`define TDT_TM_TYPICAL






`define TDT_DEBUG_PCFIFO


`ifdef TDT_DEBUG_PCFIFO
  `define TDT_DEBUG_PCFIFO_8_ENTRY
  //`define TDT_DEBUG_PCFIFO_16_ENTRY
`endif




`define TDT_DEBUG_INFO





`define TDT_SYSAPB_ASYNC_CLK









`ifdef BHT_2K
  `define BHT_IDX_WIDTH  7
`endif

`ifdef BHT_4K
  `define BHT_IDX_WIDTH  8
`endif

`ifdef BHT_8K
  `define BHT_IDX_WIDTH  9
`endif

`ifdef BHT_16K
  `define BHT_IDX_WIDTH  10
`endif






`ifdef E906
  `define AHB_LITE
`endif







`ifdef PMP_REGION_2
  `define REGION_ENTRY0
  `define REGION_ENTRY1
`endif

`ifdef PMP_REGION_4
  `define REGION_ENTRY0
  `define REGION_ENTRY1
  `define REGION_ENTRY2
  `define REGION_ENTRY3
`endif

`ifdef PMP_REGION_8
  `define REGION_ENTRY0
  `define REGION_ENTRY1
  `define REGION_ENTRY2
  `define REGION_ENTRY3
  `define REGION_ENTRY4
  `define REGION_ENTRY5
  `define REGION_ENTRY6
  `define REGION_ENTRY7
`endif

`ifdef PMP_REGION_12
  `define REGION_ENTRY0
  `define REGION_ENTRY1
  `define REGION_ENTRY2
  `define REGION_ENTRY3
  `define REGION_ENTRY4
  `define REGION_ENTRY5
  `define REGION_ENTRY6
  `define REGION_ENTRY7
  `define REGION_ENTRY8
  `define REGION_ENTRY9
  `define REGION_ENTRY10
  `define REGION_ENTRY11
`endif

`ifdef PMP_REGION_16
  `define REGION_ENTRY0
  `define REGION_ENTRY1
  `define REGION_ENTRY2
  `define REGION_ENTRY3
  `define REGION_ENTRY4
  `define REGION_ENTRY5
  `define REGION_ENTRY6
  `define REGION_ENTRY7
  `define REGION_ENTRY8
  `define REGION_ENTRY9
  `define REGION_ENTRY10
  `define REGION_ENTRY11
  `define REGION_ENTRY12
  `define REGION_ENTRY13
  `define REGION_ENTRY14
  `define REGION_ENTRY15
`endif





`ifdef ICACHE_2K
  `define I_TAG_INDEX_WIDTH  5
  `define I_TAG_TAG_WIDTH    22
`endif

`ifdef ICACHE_4K
  `define I_TAG_INDEX_WIDTH  6
  `define I_TAG_TAG_WIDTH    21
`endif

`ifdef ICACHE_8K
  `define I_TAG_INDEX_WIDTH  7
  `define I_TAG_TAG_WIDTH    20
`endif

`ifdef ICACHE_16K
  `define I_TAG_INDEX_WIDTH  8
  `define I_TAG_TAG_WIDTH    19
`endif

`ifdef ICACHE_32K
  `define I_TAG_INDEX_WIDTH  9
  `define I_TAG_TAG_WIDTH    18
`endif

`ifdef ICACHE_64K
  `define I_TAG_INDEX_WIDTH  10
  `define I_TAG_TAG_WIDTH    17
`endif





`ifdef DCACHE_2K
  `define D_TAG_INDEX_WIDTH  5
  `define D_TAG_TAG_WIDTH    22
  `define D_DATA_INDEX_WIDTH 7
`endif

`ifdef DCACHE_4K
  `define D_TAG_INDEX_WIDTH  6
  `define D_TAG_TAG_WIDTH    21
  `define D_DATA_INDEX_WIDTH 8
`endif

`ifdef DCACHE_8K
  `define D_TAG_INDEX_WIDTH  7
  `define D_TAG_TAG_WIDTH    20
  `define D_DATA_INDEX_WIDTH 9
`endif

`ifdef DCACHE_16K
  `define D_TAG_INDEX_WIDTH  8
  `define D_TAG_TAG_WIDTH    19
  `define D_DATA_INDEX_WIDTH 10
`endif

`ifdef DCACHE_32K
  `define D_TAG_INDEX_WIDTH  9
  `define D_TAG_TAG_WIDTH    18
  `define D_DATA_INDEX_WIDTH 11
`endif

`ifdef DCACHE_64K
  `define D_TAG_INDEX_WIDTH  10
  `define D_TAG_TAG_WIDTH    17
  `define D_DATA_INDEX_WIDTH 12
`endif



`ifdef IAHBL_ICACHE_2K
  `define IC_TAG_TAG_LENGTH    22
  `define IC_TAG_LINE_LENGTH   47
  `define IC_TAG_INDEX_LENGTH  5
  `define IC_DATA_INDEX_LENGTH 8
`endif

`ifdef IAHBL_ICACHE_4K
  `define IC_TAG_TAG_LENGTH    21
  `define IC_TAG_LINE_LENGTH   45
  `define IC_TAG_INDEX_LENGTH  6
  `define IC_DATA_INDEX_LENGTH 9
`endif

`ifdef IAHBL_ICACHE_8K
  `define IC_TAG_TAG_LENGTH    20
  `define IC_TAG_LINE_LENGTH   43
  `define IC_TAG_INDEX_LENGTH  7
  `define IC_DATA_INDEX_LENGTH 10
`endif

`ifdef IAHBL_ICACHE_16K
  `define IC_TAG_TAG_LENGTH    19
  `define IC_TAG_LINE_LENGTH   41
  `define IC_TAG_INDEX_LENGTH  8
  `define IC_DATA_INDEX_LENGTH 11
`endif

`ifdef IAHBL_ICACHE_32K
  `define IC_TAG_TAG_LENGTH    18
  `define IC_TAG_LINE_LENGTH   39
  `define IC_TAG_INDEX_LENGTH  9
  `define IC_DATA_INDEX_LENGTH 12
`endif

`ifdef IAHBL_ICACHE_64K
  `define IC_TAG_TAG_LENGTH    17
  `define IC_TAG_LINE_LENGTH   37
  `define IC_TAG_INDEX_LENGTH  10
  `define IC_DATA_INDEX_LENGTH 13
`endif






`ifdef TDT_DM_SBA
  `ifdef E907
     `define TDT_DM_SBA_AXI
   `endif
   `ifdef E906
     `define TDT_DM_SBA_AHB
   `endif
`endif













`define PA_WIDTH 32
`define VA_WIDTH 31





`define INDEPENDENT_AXI_SLAVE_ENV
`define INDEPENDENT_AXI_SLAVE_64
`define AXI_SLV_AGENT_NUM 2





`define TDT_DM_CORE_RV32

`define TDT_DM_CORE_NSCRATCH            4'h2






`ifdef TDT_DM_SBA
    //`define TDT_DM_SBA_DW_128
    `ifdef TDT_DM_SBA_AXI
      `define TDT_DM_SBA_DW_64
    `endif
    `ifdef TDT_DM_SBA_AHB
      `define TDT_DM_SBA_DW_32
    `endif

    `ifdef TDT_DM_SBA_AHB
        `define TDT_DM_SBAW                   `PA_WIDTH
    `else
        `define TDT_DM_SBAW                   `PA_WIDTH
    `endif
`endif

