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
module pa_fadd_nm_shift_single(
  data_cnt,
  data_g_out,
  data_in,
  data_out,
  data_r_out,
  data_s_out
);

// &Ports; @24
input   [7 :0]  data_cnt;  
input   [23:0]  data_in;   
output          data_g_out; 
output  [23:0]  data_out;  
output          data_r_out; 
output          data_s_out; 

// &Regs; @25
reg             data_g_out; 
reg     [23:0]  data_out;  
reg             data_r_out; 
reg             data_s_out; 

// &Wires; @26
wire    [7 :0]  data_cnt;  
wire    [23:0]  data_in;   
wire    [7 :0]  shift_cnt; 
wire    [23:0]  shift_pre; 


assign shift_pre[23:0] = data_in[23:0];
assign shift_cnt[7:0] = data_cnt[7:0];


// &CombBeg; @32
always @( shift_pre[23:0]
       or shift_cnt[7:0])
begin
case(shift_cnt[7:0])
  8'd0    : begin
    data_out[23:0] = {       shift_pre[23:0]};
    data_g_out = 1'b0;
    data_r_out = 1'b0;
    data_s_out = 1'b0;
  end
  8'd1    : begin
    data_out[23:0] = {1'b0,  shift_pre[23:1]};
    data_g_out = shift_pre[0];
    data_r_out = 1'b0;
    data_s_out = 1'b0;
  end
  8'd2    : begin
    data_out[23:0] = {2'b0,  shift_pre[23:2]};
    data_g_out = shift_pre[1];
    data_r_out = shift_pre[0];
    data_s_out = 1'b0;
  end
  8'd3    : begin
    data_out[23:0] = {3'b0,  shift_pre[23:3]};
    data_g_out = shift_pre[2];
    data_r_out = shift_pre[1];
    data_s_out = shift_pre[0];
  end
  8'd4    : begin
    data_out[23:0] = {4'b0,  shift_pre[23:4]};
    data_g_out = shift_pre[3];
    data_r_out = shift_pre[2];
    data_s_out = |shift_pre[1:0];
  end
  8'd5    : begin
    data_out[23:0] = {5'b0,  shift_pre[23:5]};
    data_g_out = shift_pre[4];
    data_r_out = shift_pre[3];
    data_s_out = |shift_pre[2:0];
  end
  8'd6    : begin
    data_out[23:0] = {6'b0,  shift_pre[23:6]};
    data_g_out = shift_pre[5];
    data_r_out = shift_pre[4];
    data_s_out = |shift_pre[3:0];
  end
  8'd7    : begin
    data_out[23:0] = {7'b0,  shift_pre[23:7]};
    data_g_out = shift_pre[6];
    data_r_out = shift_pre[5];
    data_s_out = |shift_pre[4:0];
  end
  8'd8    : begin
    data_out[23:0] = {8'b0,  shift_pre[23:8]};
    data_g_out = shift_pre[7];
    data_r_out = shift_pre[6];
    data_s_out = |shift_pre[5:0];
  end
  8'd9    : begin
    data_out[23:0] = {9'b0,  shift_pre[23:9]};
    data_g_out = shift_pre[8];
    data_r_out = shift_pre[7];
    data_s_out = |shift_pre[6:0];
  end
  8'd10    : begin
    data_out[23:0] = {10'b0,  shift_pre[23:10]};
    data_g_out = shift_pre[9];
    data_r_out = shift_pre[8];
    data_s_out = |shift_pre[7:0];
  end
  8'd11    : begin
    data_out[23:0] = {11'b0,  shift_pre[23:11]};
    data_g_out = shift_pre[10];
    data_r_out = shift_pre[9];
    data_s_out = |shift_pre[8:0];
  end
  8'd12    : begin
    data_out[23:0] = {12'b0,  shift_pre[23:12]};
    data_g_out = shift_pre[11];
    data_r_out = shift_pre[10];
    data_s_out = |shift_pre[9:0];
  end
  8'd13    : begin
    data_out[23:0] = {13'b0,  shift_pre[23:13]};
    data_g_out = shift_pre[12];
    data_r_out = shift_pre[11];
    data_s_out = |shift_pre[10:0];
  end
  8'd14    : begin
    data_out[23:0] = {14'b0,  shift_pre[23:14]};
    data_g_out = shift_pre[13];
    data_r_out = shift_pre[12];
    data_s_out = |shift_pre[11:0];
  end
  8'd15    : begin
    data_out[23:0] = {15'b0,  shift_pre[23:15]};
    data_g_out = shift_pre[14];
    data_r_out = shift_pre[13];
    data_s_out = |shift_pre[12:0];
  end
  8'd16    : begin
    data_out[23:0] = {16'b0,  shift_pre[23:16]};
    data_g_out = shift_pre[15];
    data_r_out = shift_pre[14];
    data_s_out = |shift_pre[13:0];
  end
  8'd17    : begin
    data_out[23:0] = {17'b0,  shift_pre[23:17]};
    data_g_out = shift_pre[16];
    data_r_out = shift_pre[15];
    data_s_out = |shift_pre[14:0];
  end
  8'd18    : begin
    data_out[23:0] = {18'b0,  shift_pre[23:18]};
    data_g_out = shift_pre[17];
    data_r_out = shift_pre[16];
    data_s_out = |shift_pre[15:0];
  end
  8'd19    : begin
    data_out[23:0] = {19'b0,  shift_pre[23:19]};
    data_g_out = shift_pre[18];
    data_r_out = shift_pre[17];
    data_s_out = |shift_pre[16:0];
  end
  8'd20    : begin
    data_out[23:0] = {20'b0,  shift_pre[23:20]};
    data_g_out = shift_pre[19];
    data_r_out = shift_pre[18];
    data_s_out = |shift_pre[17:0];
  end
  8'd21    : begin
    data_out[23:0] = {21'b0,  shift_pre[23:21]};
    data_g_out = shift_pre[20];
    data_r_out = shift_pre[19];
    data_s_out = |shift_pre[18:0];
  end
  8'd22    : begin
    data_out[23:0] = {22'b0,  shift_pre[23:22]};
    data_g_out = shift_pre[21];
    data_r_out = shift_pre[20];
    data_s_out = |shift_pre[19:0];
  end
  8'd23    : begin
    data_out[23:0] = {23'b0,  shift_pre[23]};
    data_g_out = shift_pre[22];
    data_r_out = shift_pre[21];
    data_s_out = |shift_pre[20:0];
  end
  8'd24    : begin
    data_out[23:0] = 24'b0;
    data_g_out = shift_pre[23];
    data_r_out = shift_pre[22];
    data_s_out = |shift_pre[21:0];
  end
  8'd25    : begin
    data_out[23:0] = 24'b0;
    data_g_out = 1'b0;
    data_r_out = shift_pre[23];
    data_s_out = |shift_pre[22:0];
  end
  default    : begin
    data_out[23:0] = 24'b0;
    data_g_out = 1'b0;
    data_r_out = 1'b0;
    data_s_out = |shift_pre[23:0];
  end
endcase
// &CombEnd; @197
end


// &ModuleEnd; @200
endmodule


