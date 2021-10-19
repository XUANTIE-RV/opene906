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

// &ModuleBeg; @24
module pa_fmau_src2_shifter_single(
  ex2_data_for_shift,
  ex2_shift_data_out,
  ex2_shift_index
);

// &Ports; @25
input   [23:0]  ex2_data_for_shift; 
input   [5 :0]  ex2_shift_index;   
output  [52:0]  ex2_shift_data_out; 

// &Regs; @26
reg     [52:0]  shift_data;        

// &Wires; @27
wire    [52:0]  data_for_shift;    
wire    [23:0]  ex2_data_for_shift; 
wire    [52:0]  ex2_shift_data_out; 
wire    [5 :0]  ex2_shift_index;   
wire    [5 :0]  shift_index;       


parameter DATA_WIDTH  = 53;
parameter SINGLE_FRAC = 23;

assign data_for_shift[DATA_WIDTH-1:0] = {1'b0,ex2_data_for_shift[SINGLE_FRAC:0], {SINGLE_FRAC{1'b0}}, 5'b0};

assign shift_index[5:0] = ex2_shift_index[5:0];

// &CombBeg; @36
always @( data_for_shift[52: 17]
       or data_for_shift[52:  3]
       or data_for_shift[52: 45]
       or data_for_shift[52:  8]
       or data_for_shift[52: 10]
       or data_for_shift[52: 39]
       or data_for_shift[52: 35]
       or data_for_shift[52: 28]
       or data_for_shift[52: 46]
       or data_for_shift[52:  7]
       or data_for_shift[52: 49]
       or data_for_shift[52: 29]
       or data_for_shift[52:  2]
       or data_for_shift[52: 24]
       or data_for_shift[52: 38]
       or data_for_shift[52: 43]
       or data_for_shift[52: 52]
       or data_for_shift[52: 33]
       or data_for_shift[52: 48]
       or data_for_shift[52: 27]
       or data_for_shift[52: 18]
       or data_for_shift[52: 14]
       or data_for_shift[52: 15]
       or shift_index[5:0]
       or data_for_shift[52: 13]
       or data_for_shift[52:  5]
       or data_for_shift[52: 22]
       or data_for_shift[52: 23]
       or data_for_shift[52: 34]
       or data_for_shift[52: 37]
       or data_for_shift[52: 12]
       or data_for_shift[52: 40]
       or data_for_shift[52:  6]
       or data_for_shift[52: 25]
       or data_for_shift[52: 21]
       or data_for_shift[52: 31]
       or data_for_shift[52: 47]
       or data_for_shift[52: 19]
       or data_for_shift[52:  4]
       or data_for_shift[52: 32]
       or data_for_shift[51:0]
       or data_for_shift[52:  1]
       or data_for_shift[52: 26]
       or data_for_shift[52: 16]
       or data_for_shift[52: 42]
       or data_for_shift[52: 50]
       or data_for_shift[52: 41]
       or data_for_shift[52: 36]
       or data_for_shift[52: 30]
       or data_for_shift[52:  9]
       or data_for_shift[52: 51]
       or data_for_shift[52: 44]
       or data_for_shift[52: 20]
       or data_for_shift[52: 11])
begin
case(shift_index[5:0])
6'b00_0000: shift_data[DATA_WIDTH-1:0] =  {            data_for_shift[DATA_WIDTH-1:  1], data_for_shift[0]    };
6'b00_0001: shift_data[DATA_WIDTH-1:0] =  {{  1{1'b0}},data_for_shift[DATA_WIDTH-1:  2],|data_for_shift[1  :0]};
6'b00_0010: shift_data[DATA_WIDTH-1:0] =  {{  2{1'b0}},data_for_shift[DATA_WIDTH-1:  3],|data_for_shift[2  :0]};
6'b00_0011: shift_data[DATA_WIDTH-1:0] =  {{  3{1'b0}},data_for_shift[DATA_WIDTH-1:  4],|data_for_shift[3  :0]};
6'b00_0100: shift_data[DATA_WIDTH-1:0] =  {{  4{1'b0}},data_for_shift[DATA_WIDTH-1:  5],|data_for_shift[4  :0]};
6'b00_0101: shift_data[DATA_WIDTH-1:0] =  {{  5{1'b0}},data_for_shift[DATA_WIDTH-1:  6],|data_for_shift[5  :0]};
6'b00_0110: shift_data[DATA_WIDTH-1:0] =  {{  6{1'b0}},data_for_shift[DATA_WIDTH-1:  7],|data_for_shift[6  :0]};
6'b00_0111: shift_data[DATA_WIDTH-1:0] =  {{  7{1'b0}},data_for_shift[DATA_WIDTH-1:  8],|data_for_shift[7  :0]};
6'b00_1000: shift_data[DATA_WIDTH-1:0] =  {{  8{1'b0}},data_for_shift[DATA_WIDTH-1:  9],|data_for_shift[8  :0]};
6'b00_1001: shift_data[DATA_WIDTH-1:0] =  {{  9{1'b0}},data_for_shift[DATA_WIDTH-1: 10],|data_for_shift[9  :0]};
6'b00_1010: shift_data[DATA_WIDTH-1:0] =  {{ 10{1'b0}},data_for_shift[DATA_WIDTH-1: 11],|data_for_shift[10 :0]};
6'b00_1011: shift_data[DATA_WIDTH-1:0] =  {{ 11{1'b0}},data_for_shift[DATA_WIDTH-1: 12],|data_for_shift[11 :0]};
6'b00_1100: shift_data[DATA_WIDTH-1:0] =  {{ 12{1'b0}},data_for_shift[DATA_WIDTH-1: 13],|data_for_shift[12 :0]};
6'b00_1101: shift_data[DATA_WIDTH-1:0] =  {{ 13{1'b0}},data_for_shift[DATA_WIDTH-1: 14],|data_for_shift[13 :0]};
6'b00_1110: shift_data[DATA_WIDTH-1:0] =  {{ 14{1'b0}},data_for_shift[DATA_WIDTH-1: 15],|data_for_shift[14 :0]};
6'b00_1111: shift_data[DATA_WIDTH-1:0] =  {{ 15{1'b0}},data_for_shift[DATA_WIDTH-1: 16],|data_for_shift[15 :0]};
6'b01_0000: shift_data[DATA_WIDTH-1:0] =  {{ 16{1'b0}},data_for_shift[DATA_WIDTH-1: 17],|data_for_shift[16 :0]};
6'b01_0001: shift_data[DATA_WIDTH-1:0] =  {{ 17{1'b0}},data_for_shift[DATA_WIDTH-1: 18],|data_for_shift[17 :0]};
6'b01_0010: shift_data[DATA_WIDTH-1:0] =  {{ 18{1'b0}},data_for_shift[DATA_WIDTH-1: 19],|data_for_shift[18 :0]};
6'b01_0011: shift_data[DATA_WIDTH-1:0] =  {{ 19{1'b0}},data_for_shift[DATA_WIDTH-1: 20],|data_for_shift[19 :0]};
6'b01_0100: shift_data[DATA_WIDTH-1:0] =  {{ 20{1'b0}},data_for_shift[DATA_WIDTH-1: 21],|data_for_shift[20 :0]};
6'b01_0101: shift_data[DATA_WIDTH-1:0] =  {{ 21{1'b0}},data_for_shift[DATA_WIDTH-1: 22],|data_for_shift[21 :0]};
6'b01_0110: shift_data[DATA_WIDTH-1:0] =  {{ 22{1'b0}},data_for_shift[DATA_WIDTH-1: 23],|data_for_shift[22 :0]};
6'b01_0111: shift_data[DATA_WIDTH-1:0] =  {{ 23{1'b0}},data_for_shift[DATA_WIDTH-1: 24],|data_for_shift[23 :0]};
6'b01_1000: shift_data[DATA_WIDTH-1:0] =  {{ 24{1'b0}},data_for_shift[DATA_WIDTH-1: 25],|data_for_shift[24 :0]};
6'b01_1001: shift_data[DATA_WIDTH-1:0] =  {{ 25{1'b0}},data_for_shift[DATA_WIDTH-1: 26],|data_for_shift[25 :0]};
6'b01_1010: shift_data[DATA_WIDTH-1:0] =  {{ 26{1'b0}},data_for_shift[DATA_WIDTH-1: 27],|data_for_shift[26 :0]};
6'b01_1011: shift_data[DATA_WIDTH-1:0] =  {{ 27{1'b0}},data_for_shift[DATA_WIDTH-1: 28],|data_for_shift[27 :0]};
6'b01_1100: shift_data[DATA_WIDTH-1:0] =  {{ 28{1'b0}},data_for_shift[DATA_WIDTH-1: 29],|data_for_shift[28 :0]};
6'b01_1101: shift_data[DATA_WIDTH-1:0] =  {{ 29{1'b0}},data_for_shift[DATA_WIDTH-1: 30],|data_for_shift[29 :0]};
6'b01_1110: shift_data[DATA_WIDTH-1:0] =  {{ 30{1'b0}},data_for_shift[DATA_WIDTH-1: 31],|data_for_shift[30 :0]};
6'b01_1111: shift_data[DATA_WIDTH-1:0] =  {{ 31{1'b0}},data_for_shift[DATA_WIDTH-1: 32],|data_for_shift[31 :0]};
6'b10_0000: shift_data[DATA_WIDTH-1:0] =  {{ 32{1'b0}},data_for_shift[DATA_WIDTH-1: 33],|data_for_shift[32 :0]};
6'b10_0001: shift_data[DATA_WIDTH-1:0] =  {{ 33{1'b0}},data_for_shift[DATA_WIDTH-1: 34],|data_for_shift[33 :0]};
6'b10_0010: shift_data[DATA_WIDTH-1:0] =  {{ 34{1'b0}},data_for_shift[DATA_WIDTH-1: 35],|data_for_shift[34 :0]};
6'b10_0011: shift_data[DATA_WIDTH-1:0] =  {{ 35{1'b0}},data_for_shift[DATA_WIDTH-1: 36],|data_for_shift[35 :0]};
6'b10_0100: shift_data[DATA_WIDTH-1:0] =  {{ 36{1'b0}},data_for_shift[DATA_WIDTH-1: 37],|data_for_shift[36 :0]};
6'b10_0101: shift_data[DATA_WIDTH-1:0] =  {{ 37{1'b0}},data_for_shift[DATA_WIDTH-1: 38],|data_for_shift[37 :0]};
6'b10_0110: shift_data[DATA_WIDTH-1:0] =  {{ 38{1'b0}},data_for_shift[DATA_WIDTH-1: 39],|data_for_shift[38 :0]};
6'b10_0111: shift_data[DATA_WIDTH-1:0] =  {{ 39{1'b0}},data_for_shift[DATA_WIDTH-1: 40],|data_for_shift[39 :0]};
6'b10_1000: shift_data[DATA_WIDTH-1:0] =  {{ 40{1'b0}},data_for_shift[DATA_WIDTH-1: 41],|data_for_shift[40 :0]};
6'b10_1001: shift_data[DATA_WIDTH-1:0] =  {{ 41{1'b0}},data_for_shift[DATA_WIDTH-1: 42],|data_for_shift[41 :0]};
6'b10_1010: shift_data[DATA_WIDTH-1:0] =  {{ 42{1'b0}},data_for_shift[DATA_WIDTH-1: 43],|data_for_shift[42 :0]};
6'b10_1011: shift_data[DATA_WIDTH-1:0] =  {{ 43{1'b0}},data_for_shift[DATA_WIDTH-1: 44],|data_for_shift[43 :0]};
6'b10_1100: shift_data[DATA_WIDTH-1:0] =  {{ 44{1'b0}},data_for_shift[DATA_WIDTH-1: 45],|data_for_shift[44 :0]};
6'b10_1101: shift_data[DATA_WIDTH-1:0] =  {{ 45{1'b0}},data_for_shift[DATA_WIDTH-1: 46],|data_for_shift[45 :0]};
6'b10_1110: shift_data[DATA_WIDTH-1:0] =  {{ 46{1'b0}},data_for_shift[DATA_WIDTH-1: 47],|data_for_shift[46 :0]};
6'b10_1111: shift_data[DATA_WIDTH-1:0] =  {{ 47{1'b0}},data_for_shift[DATA_WIDTH-1: 48],|data_for_shift[47 :0]};
6'b11_0000: shift_data[DATA_WIDTH-1:0] =  {{ 48{1'b0}},data_for_shift[DATA_WIDTH-1: 49],|data_for_shift[48 :0]};
6'b11_0001: shift_data[DATA_WIDTH-1:0] =  {{ 49{1'b0}},data_for_shift[DATA_WIDTH-1: 50],|data_for_shift[49 :0]};
6'b11_0010: shift_data[DATA_WIDTH-1:0] =  {{ 50{1'b0}},data_for_shift[DATA_WIDTH-1: 51],|data_for_shift[50 :0]};
6'b11_0011: shift_data[DATA_WIDTH-1:0] =  {{ 51{1'b0}},data_for_shift[DATA_WIDTH-1: 52],|data_for_shift[51 :0]};
   default: shift_data[DATA_WIDTH-1:0] =  {DATA_WIDTH{1'bx}};
endcase
// &CombEnd; @92
end

assign ex2_shift_data_out[DATA_WIDTH-1:0] = shift_data[DATA_WIDTH-1:0];   

// &ModuleEnd; @96
endmodule


   
   
   
   
   
   
   
   
   
   
   
   
   
