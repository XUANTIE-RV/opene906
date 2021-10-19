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

// &ModuleBeg; @22
module pa_fcnvt_ftoi_s(
  fsh_cnt,
  fsh_i_v_nm,
  fsh_i_x_nm,
  fsh_src
);

// &Ports; @23
input   [5 :0]  fsh_cnt;   
input   [23:0]  fsh_src;   
output  [31:0]  fsh_i_v_nm; 
output  [24:0]  fsh_i_x_nm; 

// &Regs; @24
reg     [31:0]  fsh_i_v_nm; 
reg     [24:0]  fsh_i_x_nm; 

// &Wires; @25
wire    [5 :0]  fsh_cnt;   
wire    [23:0]  fsh_src;   


// &CombBeg; @27
always @( fsh_src[23:0]
       or fsh_cnt[5:0])
begin
case(fsh_cnt[5:0])
  6'h3f : begin      //for actual exponent = -1, should consider rouding
    fsh_i_v_nm[31:0] = 32'd0;
    fsh_i_x_nm[24:0] = {fsh_src[23:0], 1'd0};
  end
  6'd0 : begin
    fsh_i_v_nm[31:0] = {31'd0, fsh_src[23]};
    fsh_i_x_nm[24:0] = {fsh_src[22:0], 2'd0};
  end
  6'd1 : begin
    fsh_i_v_nm[31:0] = {30'd0, fsh_src[23:22]};
    fsh_i_x_nm[24:0] = {fsh_src[21:0], 3'd0};
  end
  6'd2 : begin
    fsh_i_v_nm[31:0] = {29'd0, fsh_src[23:21]};
    fsh_i_x_nm[24:0] = {fsh_src[20:0], 4'd0};
  end
  6'd3 : begin
    fsh_i_v_nm[31:0] = {28'd0, fsh_src[23:20]};
    fsh_i_x_nm[24:0] = {fsh_src[19:0], 5'd0};
  end
  6'd4 : begin
    fsh_i_v_nm[31:0] = {27'd0, fsh_src[23:19]};
    fsh_i_x_nm[24:0] = {fsh_src[18:0], 6'd0};
  end
  6'd5 : begin
    fsh_i_v_nm[31:0] = {26'd0, fsh_src[23:18]};
    fsh_i_x_nm[24:0] = {fsh_src[17:0], 7'd0};
  end
  6'd6 : begin
    fsh_i_v_nm[31:0] = {25'd0, fsh_src[23:17]};
    fsh_i_x_nm[24:0] = {fsh_src[16:0], 8'd0};
  end
  6'd7 : begin
    fsh_i_v_nm[31:0] = {24'd0, fsh_src[23:16]};
    fsh_i_x_nm[24:0] = {fsh_src[15:0], 9'd0};
  end
  6'd8 : begin
    fsh_i_v_nm[31:0] = {23'd0, fsh_src[23:15]};
    fsh_i_x_nm[24:0] = {fsh_src[14:0], 10'd0};
  end
  6'd9 : begin
    fsh_i_v_nm[31:0] = {22'd0, fsh_src[23:14]};
    fsh_i_x_nm[24:0] = {fsh_src[13:0], 11'd0};
  end
  6'd10 : begin
    fsh_i_v_nm[31:0] = {21'd0, fsh_src[23:13]};
    fsh_i_x_nm[24:0] = {fsh_src[12:0], 12'd0};
  end
  6'd11 : begin
    fsh_i_v_nm[31:0] = {20'd0, fsh_src[23:12]};
    fsh_i_x_nm[24:0] = {fsh_src[11:0], 13'd0};
  end
  6'd12 : begin
    fsh_i_v_nm[31:0] = {19'd0, fsh_src[23:11]};
    fsh_i_x_nm[24:0] = {fsh_src[10:0], 14'd0};
  end
  6'd13 : begin
    fsh_i_v_nm[31:0] = {18'd0, fsh_src[23:10]};
    fsh_i_x_nm[24:0] = {fsh_src[9:0], 15'd0};
  end
  6'd14 : begin
    fsh_i_v_nm[31:0] = {17'd0, fsh_src[23:9]};
    fsh_i_x_nm[24:0] = {fsh_src[8:0], 16'd0};
  end
  6'd15 : begin
    fsh_i_v_nm[31:0] = {16'd0, fsh_src[23:8]};
    fsh_i_x_nm[24:0] = {fsh_src[7:0], 17'd0};
  end
  6'd16 : begin
    fsh_i_v_nm[31:0] = {15'd0, fsh_src[23:7]};
    fsh_i_x_nm[24:0] = {fsh_src[6:0], 18'd0};
  end
  6'd17 : begin
    fsh_i_v_nm[31:0] = {14'd0, fsh_src[23:6]};
    fsh_i_x_nm[24:0] = {fsh_src[5:0], 19'd0};
  end
  6'd18 : begin
    fsh_i_v_nm[31:0] = {13'd0, fsh_src[23:5]};
    fsh_i_x_nm[24:0] = {fsh_src[4:0], 20'd0};
  end
  6'd19 : begin
    fsh_i_v_nm[31:0] = {12'd0, fsh_src[23:4]};
    fsh_i_x_nm[24:0] = {fsh_src[3:0], 21'd0};
  end
  6'd20 : begin
    fsh_i_v_nm[31:0] = {11'd0, fsh_src[23:3]};
    fsh_i_x_nm[24:0] = {fsh_src[2:0], 22'd0};
  end
  6'd21 : begin
    fsh_i_v_nm[31:0] = {10'd0, fsh_src[23:2]};
    fsh_i_x_nm[24:0] = {fsh_src[1:0], 23'd0};
  end
  6'd22 : begin
    fsh_i_v_nm[31:0] = {9'd0, fsh_src[23:1]};
    fsh_i_x_nm[24:0] = {fsh_src[0], 24'd0};
  end
  6'd23 : begin
    fsh_i_v_nm[31:0] = {8'd0, fsh_src[23:0]};
    fsh_i_x_nm[24:0] = 25'd0;
  end
  6'd24 : begin
    fsh_i_v_nm[31:0] = {7'd0, fsh_src[23:0], 1'b0};
    fsh_i_x_nm[24:0] = 25'b0;
  end
  6'd25 : begin
    fsh_i_v_nm[31:0] = {6'd0, fsh_src[23:0], 2'b0};
    fsh_i_x_nm[24:0] = 25'd0;
  end
  6'd26 : begin
    fsh_i_v_nm[31:0] = {5'd0, fsh_src[23:0], 3'b0};
    fsh_i_x_nm[24:0] = 25'b0;
  end
  6'd27 : begin
    fsh_i_v_nm[31:0] = {4'd0, fsh_src[23:0], 4'b0};
    fsh_i_x_nm[24:0] = 25'd0;
  end
  6'd28 : begin
    fsh_i_v_nm[31:0] = {3'd0, fsh_src[23:0], 5'b0};
    fsh_i_x_nm[24:0] = 25'd0;
  end
  6'd29 : begin
    fsh_i_v_nm[31:0] = {2'd0, fsh_src[23:0], 6'b0};
    fsh_i_x_nm[24:0] = 25'd0;
  end
  6'd30 : begin
    fsh_i_v_nm[31:0] = {1'd0, fsh_src[23:0], 7'b0};
    fsh_i_x_nm[24:0] = 25'd0;
  end
  6'd31 : begin
    fsh_i_v_nm[31:0] = {fsh_src[23:0], 8'b0};
    fsh_i_x_nm[24:0] = 25'b0;
  end
    default : begin
    fsh_i_v_nm[31:0] = {32{1'bx}};
    fsh_i_x_nm[24:0] = {25{1'bx}};
  end
endcase
// &CombEnd; @166
end

// &ModuleEnd; @168
endmodule


