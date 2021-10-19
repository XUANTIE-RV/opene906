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
module pa_fcnvt_itof_s(
  ff1_sh_cnt,
  ff1_sh_f_v,
  ff1_sh_src
);

// &Ports; @24
input   [31:0]  ff1_sh_src; 
output  [4 :0]  ff1_sh_cnt; 
output  [31:0]  ff1_sh_f_v; 

// &Regs; @25
reg     [4 :0]  ff1_sh_cnt; 
reg     [31:0]  ff1_sh_f_v; 

// &Wires; @26
wire    [31:0]  ff1_sh_src; 



// &CombBeg; @29
always @( ff1_sh_src[31:0])
begin
casez(ff1_sh_src[31:0])
 32'b1???_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[4:0]     = 5'd31;
    ff1_sh_f_v[31:0]    = {ff1_sh_src[31:0]};
  end
 32'b01??_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd30;
    ff1_sh_f_v[31:0] = {ff1_sh_src[30:0],1'b0};
  end
 32'b001?_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd29;
    ff1_sh_f_v[31:0] = {ff1_sh_src[29:0],2'b0};
  end
 32'b0001_????_????_????_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd28;
    ff1_sh_f_v[31:0] = {ff1_sh_src[28:0],3'b0};
  end
 32'b0000_1???_????_????_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd27;
    ff1_sh_f_v[31:0] = {ff1_sh_src[27:0],4'b0};
  end
 32'b0000_01??_????_????_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd26;
    ff1_sh_f_v[31:0] = {ff1_sh_src[26:0],5'b0};
  end
 32'b0000_001?_????_????_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd25;
    ff1_sh_f_v[31:0] = {ff1_sh_src[25:0],6'b0};
  end
 32'b0000_0001_????_????_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd24;
    ff1_sh_f_v[31:0] = {ff1_sh_src[24:0],7'b0};
  end
 32'b0000_0000_1???_????_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd23;
    ff1_sh_f_v[31:0] = {ff1_sh_src[23:0],8'b0};
  end
 32'b0000_0000_01??_????_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd22;
    ff1_sh_f_v[31:0] = {ff1_sh_src[22:0],9'b0};
  end
 32'b0000_0000_001?_????_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd21;
    ff1_sh_f_v[31:0] = {ff1_sh_src[21:0],10'b0};
  end
 32'b0000_0000_0001_????_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd20;
    ff1_sh_f_v[31:0] = {ff1_sh_src[20:0],11'b0};
  end
 32'b0000_0000_0000_1???_????_????_????_????: begin
    ff1_sh_cnt[4:0]  = 5'd19;
    ff1_sh_f_v[31:0] = {ff1_sh_src[19:0],12'b0};
  end
 32'b0000_0000_0000_01??_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd18;
    ff1_sh_f_v[31:0] = {ff1_sh_src[18:0],13'b0};
  end
 32'b0000_0000_0000_001?_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd17;
    ff1_sh_f_v[31:0] = {ff1_sh_src[17:0],14'b0};
  end
 32'b0000_0000_0000_0001_????_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd16;
    ff1_sh_f_v[31:0] = {ff1_sh_src[16:0],15'b0};
  end
 32'b0000_0000_0000_0000_1???_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd15;
    ff1_sh_f_v[31:0] = {ff1_sh_src[15:0],16'b0};
  end
 32'b0000_0000_0000_0000_01??_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd14;
    ff1_sh_f_v[31:0] = {ff1_sh_src[14:0],17'b0};
  end
 32'b0000_0000_0000_0000_001?_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd13;
    ff1_sh_f_v[31:0] = {ff1_sh_src[13:0],18'b0};
  end
 32'b0000_0000_0000_0000_0001_????_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd12;
    ff1_sh_f_v[31:0] = {ff1_sh_src[12:0],19'b0};
  end
 32'b0000_0000_0000_0000_0000_1???_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd11;
    ff1_sh_f_v[31:0] = {ff1_sh_src[11:0],20'b0};
  end
 32'b0000_0000_0000_0000_0000_01??_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd10;
    ff1_sh_f_v[31:0] = {ff1_sh_src[10:0],21'b0};
  end
 32'b0000_0000_0000_0000_0000_001?_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd9;
    ff1_sh_f_v[31:0] = {ff1_sh_src[9:0],22'b0};
  end
 32'b0000_0000_0000_0000_0000_0001_????_???? : begin
    ff1_sh_cnt[4:0]  = 5'd8;
    ff1_sh_f_v[31:0] = {ff1_sh_src[8:0],23'b0};
  end
 32'b0000_0000_0000_0000_0000_0000_1???_????: begin
    ff1_sh_cnt[4:0]  = 5'd7;
    ff1_sh_f_v[31:0] = {ff1_sh_src[7:0],24'b0};
  end
 32'b0000_0000_0000_0000_0000_0000_01??_???? : begin
    ff1_sh_cnt[4:0]  = 5'd6;
    ff1_sh_f_v[31:0] = {ff1_sh_src[6:0],25'b0};
  end
 32'b0000_0000_0000_0000_0000_0000_001?_???? : begin
    ff1_sh_cnt[4:0]  = 5'd5;
    ff1_sh_f_v[31:0] = {ff1_sh_src[5:0],26'b0};
  end
 32'b0000_0000_0000_0000_0000_0000_0001_???? : begin
    ff1_sh_cnt[4:0]  = 5'd4;
    ff1_sh_f_v[31:0] = {ff1_sh_src[4:0],27'b0};
  end
 32'b0000_0000_0000_0000_0000_0000_0000_1??? : begin
    ff1_sh_cnt[4:0]  = 5'd3;
    ff1_sh_f_v[31:0] = {ff1_sh_src[3:0],28'b0};
  end
 32'b0000_0000_0000_0000_0000_0000_0000_01?? : begin
    ff1_sh_cnt[4:0]  = 5'd2;
    ff1_sh_f_v[31:0] = {ff1_sh_src[2:0],29'b0};
  end
 32'b0000_0000_0000_0000_0000_0000_0000_001? : begin
    ff1_sh_cnt[4:0]  = 5'd1;
    ff1_sh_f_v[31:0] = {ff1_sh_src[1:0],30'b0};
  end
 32'b0000_0000_0000_0000_0000_0000_0000_0001 : begin
    ff1_sh_cnt[4:0]  = 5'd0;
    ff1_sh_f_v[31:0] = {ff1_sh_src[0],31'b0};
  end
   default : begin
    ff1_sh_cnt[4:0]  = 5'b0;
    ff1_sh_f_v[31:0] = 32'b0;
  end
endcase
// &CombEnd; @164
end

// &ModuleEnd; @166
endmodule


