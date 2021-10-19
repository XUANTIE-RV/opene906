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
module pa_clic_expand(
  // input
  data_in_vec,
  // output
  expand_out_vec
);

parameter WIDTH = 6;
parameter NUM   = 32;
localparam EXP_WIDTH = 1 <<< WIDTH;

input  [WIDTH*NUM-1:0]      data_in_vec;
output [EXP_WIDTH*NUM-1:0]  expand_out_vec;

wire   [WIDTH*NUM-1:0]      data_in_vec;
wire   [EXP_WIDTH*NUM-1:0]  expand_out_vec;

genvar i;

generate
  for (i = 0; i < NUM; i = i+1)
  begin: EXPAND
    assign expand_out_vec[EXP_WIDTH*i+:EXP_WIDTH] = {{EXP_WIDTH-1{1'b0}}, 1'b1} << data_in_vec[WIDTH*i+:WIDTH];
  end
endgenerate

endmodule

