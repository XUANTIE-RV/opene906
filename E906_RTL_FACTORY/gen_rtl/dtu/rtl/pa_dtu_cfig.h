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

//---------------------Minimum Define-----------------------
`ifdef TDT_TM_MINIMUM
//mcontrol trigger legal number is 0/1/2/3/4/5/6/7/8, there is 
//no mcontrol when define "TDT_TM_MCONTROL_TRI_NUM_0"
//`define TDT_TM_MCONTROL_TRI_NUM_0
`define TDT_TM_MCONTROL_TRI_NUM_1
//`define TDT_TM_MCONTROL_TRI_NUM_2
//`define TDT_TM_MCONTROL_TRI_NUM_3
//`define TDT_TM_MCONTROL_TRI_NUM_4
//`define TDT_TM_MCONTROL_TRI_NUM_5
//`define TDT_TM_MCONTROL_TRI_NUM_6
//`define TDT_TM_MCONTROL_TRI_NUM_7
//`define TDT_TM_MCONTROL_TRI_NUM_8

//`define TDT_TM_MCONTROL_CHAIN

//mcontrol trigger configuration
//when MCONTROL_TRI_NUM >= 1, macros of MCONTROL0 are used
`define TDT_TM_MCONTROL0_EXE
//`define TDT_TM_MCONTROL0_LDST
`define TDT_TM_MCONTROL0_ADDR
//`define TDT_TM_MCONTROL0_DATA
`define TDT_TM_MCONTROL0_MATCH_TYP0
//`define TDT_TM_MCONTROL0_MATCH_TYP1
//`define TDT_TM_MCONTROL0_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 2, macros of MCONTROL1 are used
//`define TDT_TM_MCONTROL1_EXE
//`define TDT_TM_MCONTROL1_LDST
//`define TDT_TM_MCONTROL1_ADDR
//`define TDT_TM_MCONTROL1_DATA
//`define TDT_TM_MCONTROL1_MATCH_TYP0
//`define TDT_TM_MCONTROL1_MATCH_TYP1
//`define TDT_TM_MCONTROL1_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 3, macros of MCONTROL2 are used
//`define TDT_TM_MCONTROL2_EXE
//`define TDT_TM_MCONTROL2_LDST
//`define TDT_TM_MCONTROL2_ADDR
//`define TDT_TM_MCONTROL2_DATA
//`define TDT_TM_MCONTROL2_MATCH_TYP0
//`define TDT_TM_MCONTROL2_MATCH_TYP1
//`define TDT_TM_MCONTROL2_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 4, macros of MCONTROL3 are used
//`define TDT_TM_MCONTROL3_EXE
//`define TDT_TM_MCONTROL3_LDST
//`define TDT_TM_MCONTROL3_ADDR
//`define TDT_TM_MCONTROL3_DATA
//`define TDT_TM_MCONTROL3_MATCH_TYP0
//`define TDT_TM_MCONTROL3_MATCH_TYP1
//`define TDT_TM_MCONTROL3_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 5, macros of MCONTROL4 are used
//`define TDT_TM_MCONTROL4_EXE
//`define TDT_TM_MCONTROL4_LDST
//`define TDT_TM_MCONTROL4_ADDR
//`define TDT_TM_MCONTROL4_DATA
//`define TDT_TM_MCONTROL4_MATCH_TYP0
//`define TDT_TM_MCONTROL4_MATCH_TYP1
//`define TDT_TM_MCONTROL4_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 6, macros of MCONTROL5 are used
//`define TDT_TM_MCONTROL5_EXE
//`define TDT_TM_MCONTROL5_LDST
//`define TDT_TM_MCONTROL5_ADDR
//`define TDT_TM_MCONTROL5_DATA
//`define TDT_TM_MCONTROL5_MATCH_TYP0
//`define TDT_TM_MCONTROL5_MATCH_TYP1
//`define TDT_TM_MCONTROL5_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 7, macros of MCONTROL6 are used
//`define TDT_TM_MCONTROL6_EXE
//`define TDT_TM_MCONTROL6_LDST
//`define TDT_TM_MCONTROL6_ADDR
//`define TDT_TM_MCONTROL6_DATA
//`define TDT_TM_MCONTROL6_MATCH_TYP0
//`define TDT_TM_MCONTROL6_MATCH_TYP1
//`define TDT_TM_MCONTROL6_MATCH_TYP2

//when MCONTROL_TRI_NUM = 8, macros of MCONTROL7 are used
//`define TDT_TM_MCONTROL7_EXE
//`define TDT_TM_MCONTROL7_LDST
//`define TDT_TM_MCONTROL7_ADDR
//`define TDT_TM_MCONTROL7_DATA
//`define TDT_TM_MCONTROL7_MATCH_TYP0
//`define TDT_TM_MCONTROL7_MATCH_TYP1
//`define TDT_TM_MCONTROL7_MATCH_TYP2

//icount/int/expt shared trigger legal number is 0/1/2, there is 
//no icount/int/expt shared trigger when define "TDT_TM_OTHER_TRI_NUM_0"
`define TDT_TM_OTHER_TRI_NUM_0
//`define TDT_TM_OTHER_TRI_NUM_1
//`define TDT_TM_OTHER_TRI_NUM_2
`endif

//---------------------Typical Define-----------------------
`ifdef TDT_TM_TYPICAL
//mcontrol trigger legal number is 0/1/2/3/4/5/6/7/8, there is 
//no mcontrol when define "TDT_TM_MCONTROL_TRI_NUM_0"
//`define TDT_TM_MCONTROL_TRI_NUM_0
//`define TDT_TM_MCONTROL_TRI_NUM_1
//`define TDT_TM_MCONTROL_TRI_NUM_2
`define TDT_TM_MCONTROL_TRI_NUM_3
//`define TDT_TM_MCONTROL_TRI_NUM_4
//`define TDT_TM_MCONTROL_TRI_NUM_5
//`define TDT_TM_MCONTROL_TRI_NUM_6
//`define TDT_TM_MCONTROL_TRI_NUM_7
//`define TDT_TM_MCONTROL_TRI_NUM_8

//`define TDT_TM_MCONTROL_CHAIN

//mcontrol trigger configuration
//when MCONTROL_TRI_NUM >= 1, macros of MCONTROL0 are used
`define TDT_TM_MCONTROL0_EXE
`define TDT_TM_MCONTROL0_LDST
`define TDT_TM_MCONTROL0_ADDR
//`define TDT_TM_MCONTROL0_DATA
`define TDT_TM_MCONTROL0_MATCH_TYP0
//`define TDT_TM_MCONTROL0_MATCH_TYP1
//`define TDT_TM_MCONTROL0_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 2, macros of MCONTROL1 are used
`define TDT_TM_MCONTROL1_EXE
`define TDT_TM_MCONTROL1_LDST
`define TDT_TM_MCONTROL1_ADDR
//`define TDT_TM_MCONTROL1_DATA
`define TDT_TM_MCONTROL1_MATCH_TYP0
//`define TDT_TM_MCONTROL1_MATCH_TYP1
//`define TDT_TM_MCONTROL1_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 3, macros of MCONTROL2 are used
`define TDT_TM_MCONTROL2_EXE
`define TDT_TM_MCONTROL2_LDST
`define TDT_TM_MCONTROL2_ADDR
//`define TDT_TM_MCONTROL2_DATA
`define TDT_TM_MCONTROL2_MATCH_TYP0
//`define TDT_TM_MCONTROL2_MATCH_TYP1
//`define TDT_TM_MCONTROL2_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 4, macros of MCONTROL3 are used
//`define TDT_TM_MCONTROL3_EXE
//`define TDT_TM_MCONTROL3_LDST
//`define TDT_TM_MCONTROL3_ADDR
//`define TDT_TM_MCONTROL3_DATA
//`define TDT_TM_MCONTROL3_MATCH_TYP0
//`define TDT_TM_MCONTROL3_MATCH_TYP1
//`define TDT_TM_MCONTROL3_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 5, macros of MCONTROL4 are used
//`define TDT_TM_MCONTROL4_EXE
//`define TDT_TM_MCONTROL4_LDST
//`define TDT_TM_MCONTROL4_ADDR
//`define TDT_TM_MCONTROL4_DATA
//`define TDT_TM_MCONTROL4_MATCH_TYP0
//`define TDT_TM_MCONTROL4_MATCH_TYP1
//`define TDT_TM_MCONTROL4_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 6, macros of MCONTROL5 are used
//`define TDT_TM_MCONTROL5_EXE
//`define TDT_TM_MCONTROL5_LDST
//`define TDT_TM_MCONTROL5_ADDR
//`define TDT_TM_MCONTROL5_DATA
//`define TDT_TM_MCONTROL5_MATCH_TYP0
//`define TDT_TM_MCONTROL5_MATCH_TYP1
//`define TDT_TM_MCONTROL5_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 7, macros of MCONTROL6 are used
//`define TDT_TM_MCONTROL6_EXE
//`define TDT_TM_MCONTROL6_LDST
//`define TDT_TM_MCONTROL6_ADDR
//`define TDT_TM_MCONTROL6_DATA
//`define TDT_TM_MCONTROL6_MATCH_TYP0
//`define TDT_TM_MCONTROL6_MATCH_TYP1
//`define TDT_TM_MCONTROL6_MATCH_TYP2

//when MCONTROL_TRI_NUM = 8, macros of MCONTROL7 are used
//`define TDT_TM_MCONTROL7_EXE
//`define TDT_TM_MCONTROL7_LDST
//`define TDT_TM_MCONTROL7_ADDR
//`define TDT_TM_MCONTROL7_DATA
//`define TDT_TM_MCONTROL7_MATCH_TYP0
//`define TDT_TM_MCONTROL7_MATCH_TYP1
//`define TDT_TM_MCONTROL7_MATCH_TYP2

//icount/int/expt shared trigger legal number is 0/1/2, there is 
//no icount/int/expt shared trigger when define "TDT_TM_OTHER_TRI_NUM_0"
`define TDT_TM_OTHER_TRI_NUM_0
//`define TDT_TM_OTHER_TRI_NUM_1
//`define TDT_TM_OTHER_TRI_NUM_2
`endif

//---------------------Maximum Define-----------------------
`ifdef TDT_TM_MAXIMUM
//mcontrol trigger legal number is 0/1/2/3/4/5/6/7/8, there is 
//no mcontrol when define "TDT_TM_MCONTROL_TRI_NUM_0"
//`define TDT_TM_MCONTROL_TRI_NUM_0
//`define TDT_TM_MCONTROL_TRI_NUM_1
//`define TDT_TM_MCONTROL_TRI_NUM_2
//`define TDT_TM_MCONTROL_TRI_NUM_3
//`define TDT_TM_MCONTROL_TRI_NUM_4
//`define TDT_TM_MCONTROL_TRI_NUM_5
//`define TDT_TM_MCONTROL_TRI_NUM_6
//`define TDT_TM_MCONTROL_TRI_NUM_7
`define TDT_TM_MCONTROL_TRI_NUM_8

`define TDT_TM_MCONTROL_CHAIN

//mcontrol trigger configuration
//when MCONTROL_TRI_NUM >= 1, macros of MCONTROL0 are used
`define TDT_TM_MCONTROL0_EXE
`define TDT_TM_MCONTROL0_LDST
`define TDT_TM_MCONTROL0_ADDR
`define TDT_TM_MCONTROL0_DATA
//`define TDT_TM_MCONTROL0_MATCH_TYP0
//`define TDT_TM_MCONTROL0_MATCH_TYP1
`define TDT_TM_MCONTROL0_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 2, macros of MCONTROL1 are used
`define TDT_TM_MCONTROL1_EXE
`define TDT_TM_MCONTROL1_LDST
`define TDT_TM_MCONTROL1_ADDR
`define TDT_TM_MCONTROL1_DATA
//`define TDT_TM_MCONTROL1_MATCH_TYP0
//`define TDT_TM_MCONTROL1_MATCH_TYP1
`define TDT_TM_MCONTROL1_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 3, macros of MCONTROL2 are used
`define TDT_TM_MCONTROL2_EXE
`define TDT_TM_MCONTROL2_LDST
`define TDT_TM_MCONTROL2_ADDR
`define TDT_TM_MCONTROL2_DATA
//`define TDT_TM_MCONTROL2_MATCH_TYP0
//`define TDT_TM_MCONTROL2_MATCH_TYP1
`define TDT_TM_MCONTROL2_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 4, macros of MCONTROL3 are used
`define TDT_TM_MCONTROL3_EXE
`define TDT_TM_MCONTROL3_LDST
`define TDT_TM_MCONTROL3_ADDR
`define TDT_TM_MCONTROL3_DATA
//`define TDT_TM_MCONTROL3_MATCH_TYP0
//`define TDT_TM_MCONTROL3_MATCH_TYP1
`define TDT_TM_MCONTROL3_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 5, macros of MCONTROL4 are used
`define TDT_TM_MCONTROL4_EXE
`define TDT_TM_MCONTROL4_LDST
`define TDT_TM_MCONTROL4_ADDR
`define TDT_TM_MCONTROL4_DATA
//`define TDT_TM_MCONTROL4_MATCH_TYP0
//`define TDT_TM_MCONTROL4_MATCH_TYP1
`define TDT_TM_MCONTROL4_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 6, macros of MCONTROL5 are used
`define TDT_TM_MCONTROL5_EXE
`define TDT_TM_MCONTROL5_LDST
`define TDT_TM_MCONTROL5_ADDR
`define TDT_TM_MCONTROL5_DATA
//`define TDT_TM_MCONTROL5_MATCH_TYP0
//`define TDT_TM_MCONTROL5_MATCH_TYP1
`define TDT_TM_MCONTROL5_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 7, macros of MCONTROL6 are used
`define TDT_TM_MCONTROL6_EXE
`define TDT_TM_MCONTROL6_LDST
`define TDT_TM_MCONTROL6_ADDR
`define TDT_TM_MCONTROL6_DATA
//`define TDT_TM_MCONTROL6_MATCH_TYP0
//`define TDT_TM_MCONTROL6_MATCH_TYP1
`define TDT_TM_MCONTROL6_MATCH_TYP2

//when MCONTROL_TRI_NUM = 8, macros of MCONTROL7 are used
`define TDT_TM_MCONTROL7_EXE
`define TDT_TM_MCONTROL7_LDST
`define TDT_TM_MCONTROL7_ADDR
`define TDT_TM_MCONTROL7_DATA
//`define TDT_TM_MCONTROL7_MATCH_TYP0
//`define TDT_TM_MCONTROL7_MATCH_TYP1
`define TDT_TM_MCONTROL7_MATCH_TYP2

//icount/int/expt shared trigger legal number is 0/1/2, there is 
//no icount/int/expt shared trigger when define "TDT_TM_OTHER_TRI_NUM_0"
//`define TDT_TM_OTHER_TRI_NUM_0
//`define TDT_TM_OTHER_TRI_NUM_1
`define TDT_TM_OTHER_TRI_NUM_2
`endif

//---------------------Self Define-----------------------
`ifdef TDT_TM_SELF_DEF
//mcontrol trigger legal number is 0/1/2/3/4/5/6/7/8, there is 
//no mcontrol when define "TDT_TM_MCONTROL_TRI_NUM_0"
//`define TDT_TM_MCONTROL_TRI_NUM_0
//`define TDT_TM_MCONTROL_TRI_NUM_1
//`define TDT_TM_MCONTROL_TRI_NUM_2
`define TDT_TM_MCONTROL_TRI_NUM_3
//`define TDT_TM_MCONTROL_TRI_NUM_4
//`define TDT_TM_MCONTROL_TRI_NUM_5
//`define TDT_TM_MCONTROL_TRI_NUM_6
//`define TDT_TM_MCONTROL_TRI_NUM_7
//`define TDT_TM_MCONTROL_TRI_NUM_8

//`define TDT_TM_MCONTROL_CHAIN

//mcontrol trigger configuration
//when MCONTROL_TRI_NUM >= 1, macros of MCONTROL0 are used
`define TDT_TM_MCONTROL0_EXE
`define TDT_TM_MCONTROL0_LDST
`define TDT_TM_MCONTROL0_ADDR
//`define TDT_TM_MCONTROL0_DATA
`define TDT_TM_MCONTROL0_MATCH_TYP0
//`define TDT_TM_MCONTROL0_MATCH_TYP1
//`define TDT_TM_MCONTROL0_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 2, macros of MCONTROL1 are used
`define TDT_TM_MCONTROL1_EXE
`define TDT_TM_MCONTROL1_LDST
`define TDT_TM_MCONTROL1_ADDR
//`define TDT_TM_MCONTROL1_DATA
`define TDT_TM_MCONTROL1_MATCH_TYP0
//`define TDT_TM_MCONTROL1_MATCH_TYP1
//`define TDT_TM_MCONTROL1_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 3, macros of MCONTROL2 are used
`define TDT_TM_MCONTROL2_EXE
`define TDT_TM_MCONTROL2_LDST
`define TDT_TM_MCONTROL2_ADDR
//`define TDT_TM_MCONTROL2_DATA
`define TDT_TM_MCONTROL2_MATCH_TYP0
//`define TDT_TM_MCONTROL2_MATCH_TYP1
//`define TDT_TM_MCONTROL2_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 4, macros of MCONTROL3 are used
//`define TDT_TM_MCONTROL3_EXE
//`define TDT_TM_MCONTROL3_LDST
//`define TDT_TM_MCONTROL3_ADDR
//`define TDT_TM_MCONTROL3_DATA
//`define TDT_TM_MCONTROL3_MATCH_TYP0
//`define TDT_TM_MCONTROL3_MATCH_TYP1
//`define TDT_TM_MCONTROL3_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 5, macros of MCONTROL4 are used
//`define TDT_TM_MCONTROL4_EXE
//`define TDT_TM_MCONTROL4_LDST
//`define TDT_TM_MCONTROL4_ADDR
//`define TDT_TM_MCONTROL4_DATA
//`define TDT_TM_MCONTROL4_MATCH_TYP0
//`define TDT_TM_MCONTROL4_MATCH_TYP1
//`define TDT_TM_MCONTROL4_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 6, macros of MCONTROL5 are used
//`define TDT_TM_MCONTROL5_EXE
//`define TDT_TM_MCONTROL5_LDST
//`define TDT_TM_MCONTROL5_ADDR
//`define TDT_TM_MCONTROL5_DATA
//`define TDT_TM_MCONTROL5_MATCH_TYP0
//`define TDT_TM_MCONTROL5_MATCH_TYP1
//`define TDT_TM_MCONTROL5_MATCH_TYP2

//when MCONTROL_TRI_NUM >= 7, macros of MCONTROL6 are used
//`define TDT_TM_MCONTROL6_EXE
//`define TDT_TM_MCONTROL6_LDST
//`define TDT_TM_MCONTROL6_ADDR
//`define TDT_TM_MCONTROL6_DATA
//`define TDT_TM_MCONTROL6_MATCH_TYP0
//`define TDT_TM_MCONTROL6_MATCH_TYP1
//`define TDT_TM_MCONTROL6_MATCH_TYP2

//when MCONTROL_TRI_NUM = 8, macros of MCONTROL7 are used
//`define TDT_TM_MCONTROL7_EXE
//`define TDT_TM_MCONTROL7_LDST
//`define TDT_TM_MCONTROL7_ADDR
//`define TDT_TM_MCONTROL7_DATA
//`define TDT_TM_MCONTROL7_MATCH_TYP0
//`define TDT_TM_MCONTROL7_MATCH_TYP1
//`define TDT_TM_MCONTROL7_MATCH_TYP2

//icount/int/expt shared trigger legal number is 0/1/2, there is 
//no icount/int/expt shared trigger when define "TDT_TM_OTHER_TRI_NUM_0"
`define TDT_TM_OTHER_TRI_NUM_0
//`define TDT_TM_OTHER_TRI_NUM_1
//`define TDT_TM_OTHER_TRI_NUM_2
`endif

//---------------------------------------------------------
// TM Trigger Number Configuration
//---------------------------------------------------------
`ifdef TDT_TM_OTHER_TRI_NUM_0
  `define TDT_TM_OTHER_TRI_NUM            0
`else
   `ifdef TDT_TM_OTHER_TRI_NUM_1
       `define TDT_TM_OTHER_TRI_NUM       1
    `else 
        `ifdef TDT_TM_OTHER_TRI_NUM_2
          `define TDT_TM_OTHER_TRI_NUM    2
        `endif
    `endif
`endif

`ifdef TDT_TM_MCONTROL_TRI_NUM_0
  `define TDT_TM_MCONTROL_TRI_NUM         0
`else
  `ifdef TDT_TM_MCONTROL_TRI_NUM_1
     `define TDT_TM_MCONTROL_TRI_NUM      1
   `else
     `ifdef TDT_TM_MCONTROL_TRI_NUM_2
       `define TDT_TM_MCONTROL_TRI_NUM    2
     `else
        `ifdef TDT_TM_MCONTROL_TRI_NUM_3
          `define TDT_TM_MCONTROL_TRI_NUM 3
        `else
           `ifdef TDT_TM_MCONTROL_TRI_NUM_4
             `define TDT_TM_MCONTROL_TRI_NUM 4
           `else
              `ifdef TDT_TM_MCONTROL_TRI_NUM_5
                `define TDT_TM_MCONTROL_TRI_NUM 5
              `else
                 `ifdef TDT_TM_MCONTROL_TRI_NUM_6
                   `define TDT_TM_MCONTROL_TRI_NUM 6
                 `else
                    `ifdef  TDT_TM_MCONTROL_TRI_NUM_7
                      `define TDT_TM_MCONTROL_TRI_NUM 7
                    `else
                       `ifdef  TDT_TM_MCONTROL_TRI_NUM_8
                         `define TDT_TM_MCONTROL_TRI_NUM 8
                       `endif
                    `endif
                 `endif
              `endif
           `endif
        `endif
     `endif
   `endif
`endif

`ifdef TDT_TM_MCONTROL_TRI_NUM_0
  `ifdef TDT_TM_OTHER_TRI_NUM_1
    `define TDT_TM_SINGLE_TRI
  `endif
`else
  `ifdef TDT_TM_MCONTROL_TRI_NUM_1
    `ifdef TDT_TM_OTHER_TRI_NUM_0
      `define TDT_TM_SINGLE_TRI
    `endif
  `endif
`endif

//==========================================================
//                   DTU Configuration
//==========================================================
//---------------------------------------------------------
// TM Trigger Configuration
//---------------------------------------------------------
`define TDT_TM_TRIGGER_NUM     `TDT_TM_MCONTROL_TRI_NUM + `TDT_TM_OTHER_TRI_NUM

//----------------------------------------------------------
//                  HALT INFO Define 
//----------------------------------------------------------
`define TDT_HINFO_WIDTH        `TDT_HINFO_TRIGGER      + 1

`define TDT_HINFO_TRIGGER      `TDT_HINFO_CAUSE        + `TDT_TM_TRIGGER_NUM
`define TDT_HINFO_CAUSE        `TDT_HINFO_PENDING_HALT + 4
`define TDT_HINFO_PENDING_HALT `TDT_HINFO_TIMING       + 1
`define TDT_HINFO_TIMING       `TDT_HINFO_ACTION01     + 1
`define TDT_HINFO_ACTION01     `TDT_HINFO_ACTION       + 1
`define TDT_HINFO_ACTION       `TDT_HINFO_CHAIN        + 1
`define TDT_HINFO_CHAIN        `TDT_HINFO_LDST         + 1
`define TDT_HINFO_LDST         `TDT_HINFO_MATCH        + 1
`define TDT_HINFO_MATCH        `TDT_HINFO_CANCEL       + 1
`define TDT_HINFO_CANCEL                                 0

//----------------------------------------------------------
//                     DTU Define 
//----------------------------------------------------------

`define TDT_DM_CORE_HALF_XLEN 16

`define HALF_PA_WIDTH 16

//debuginfo define
`ifdef AXI
  `define TDT_DBGINFO_WIDTH 278
  `define TDT_DBGINFO_DEPTH 10
`else
  `define TDT_DBGINFO_WIDTH 298
  `define TDT_DBGINFO_DEPTH 11
`endif

//pcfifo define
`ifdef TDT_DEBUG_PCFIFO_8_ENTRY
  `define TDT_PCFIFO_DEPTH      8
  `define TDT_PCFIFO_PTR_WIDTH  3
`else
  `ifdef TDT_DEBUG_PCFIFO_16_ENTRY
    `define TDT_PCFIFO_DEPTH      16
    `define TDT_PCFIFO_PTR_WIDTH  4
  `endif
`endif

//for fix tselect trigger number legalization(to fix lint warning)
`define MCONTROL_NUM     4'd`TDT_TM_MCONTROL_TRI_NUM
`define IIE_NUM          4'd`TDT_TM_OTHER_TRI_NUM
