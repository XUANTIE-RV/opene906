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
module pa_clic_kid_dummy(
  kid_arb_int_all,
  kid_arb_int_hv,
  kid_arb_int_req,
  kid_busif_rdata
);

// &Ports; @23
output  [3 :0]  kid_arb_int_all; 
output          kid_arb_int_hv; 
output          kid_arb_int_req; 
output  [31:0]  kid_busif_rdata; 

// &Regs; @24

// &Wires; @25
wire    [3 :0]  kid_arb_int_all; 
wire            kid_arb_int_hv; 
wire            kid_arb_int_req; 
wire    [31:0]  kid_busif_rdata; 


parameter CLICINTCTLBITS = `CLIC_INTCTLBITS;

assign kid_arb_int_all[CLICINTCTLBITS:0] = {CLICINTCTLBITS+1{1'b0}};
assign kid_arb_int_hv = 1'b0;
assign kid_arb_int_req = 1'b0;
assign kid_busif_rdata[31:0] = 32'b0;

// &ModuleEnd; @34
endmodule


