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
module pa_sysmap_access(
  sysmap_base_addr0_value,
  sysmap_base_addr1_value,
  sysmap_base_addr2_value,
  sysmap_base_addr3_value,
  sysmap_base_addr4_value,
  sysmap_base_addr5_value,
  sysmap_base_addr6_value,
  sysmap_base_addr7_value,
  sysmap_flg0_value,
  sysmap_flg1_value,
  sysmap_flg2_value,
  sysmap_flg3_value,
  sysmap_flg4_value,
  sysmap_flg5_value,
  sysmap_flg6_value,
  sysmap_flg7_value,
  sysmap_flg_y,
  sysmap_pa_y
);

// &Ports; @25
input   [19:0]  sysmap_base_addr0_value; 
input   [19:0]  sysmap_base_addr1_value; 
input   [19:0]  sysmap_base_addr2_value; 
input   [19:0]  sysmap_base_addr3_value; 
input   [19:0]  sysmap_base_addr4_value; 
input   [19:0]  sysmap_base_addr5_value; 
input   [19:0]  sysmap_base_addr6_value; 
input   [19:0]  sysmap_base_addr7_value; 
input   [4 :0]  sysmap_flg0_value;      
input   [4 :0]  sysmap_flg1_value;      
input   [4 :0]  sysmap_flg2_value;      
input   [4 :0]  sysmap_flg3_value;      
input   [4 :0]  sysmap_flg4_value;      
input   [4 :0]  sysmap_flg5_value;      
input   [4 :0]  sysmap_flg6_value;      
input   [4 :0]  sysmap_flg7_value;      
input   [19:0]  sysmap_pa_y;            
output  [4 :0]  sysmap_flg_y;           

// &Regs; @26
reg     [4 :0]  sysmap_flg_y;           

// &Wires; @27
wire            addr_ge_bottom0;        
wire            addr_ge_bottom1;        
wire            addr_ge_bottom2;        
wire            addr_ge_bottom3;        
wire            addr_ge_bottom4;        
wire            addr_ge_bottom5;        
wire            addr_ge_bottom6;        
wire            addr_ge_bottom7;        
wire            addr_ge_upaddr0;        
wire            addr_ge_upaddr1;        
wire            addr_ge_upaddr2;        
wire            addr_ge_upaddr3;        
wire            addr_ge_upaddr4;        
wire            addr_ge_upaddr5;        
wire            addr_ge_upaddr6;        
wire            addr_ge_upaddr7;        
wire    [19:0]  sysmap_base_addr0_value; 
wire    [19:0]  sysmap_base_addr1_value; 
wire    [19:0]  sysmap_base_addr2_value; 
wire    [19:0]  sysmap_base_addr3_value; 
wire    [19:0]  sysmap_base_addr4_value; 
wire    [19:0]  sysmap_base_addr5_value; 
wire    [19:0]  sysmap_base_addr6_value; 
wire    [19:0]  sysmap_base_addr7_value; 
wire            sysmap_comp_hit0;       
wire            sysmap_comp_hit1;       
wire            sysmap_comp_hit2;       
wire            sysmap_comp_hit3;       
wire            sysmap_comp_hit4;       
wire            sysmap_comp_hit5;       
wire            sysmap_comp_hit6;       
wire            sysmap_comp_hit7;       
wire    [4 :0]  sysmap_flg0_value;      
wire    [4 :0]  sysmap_flg1_value;      
wire    [4 :0]  sysmap_flg2_value;      
wire    [4 :0]  sysmap_flg3_value;      
wire    [4 :0]  sysmap_flg4_value;      
wire    [4 :0]  sysmap_flg5_value;      
wire    [4 :0]  sysmap_flg6_value;      
wire    [4 :0]  sysmap_flg7_value;      
wire    [7 :0]  sysmap_hit;             
wire            sysmap_hit0;            
wire            sysmap_hit1;            
wire            sysmap_hit2;            
wire            sysmap_hit3;            
wire            sysmap_hit4;            
wire            sysmap_hit5;            
wire            sysmap_hit6;            
wire            sysmap_hit7;            
wire    [19:0]  sysmap_pa_y;            


parameter ADDR_WIDTH = 32-12;
parameter FLG_WIDTH  = 5;

// compare hit
// &ConnRule(s/_x/0/); @33
// &Instance("pa_sysmap_hit", "x_pa_sysmap_hit_0"); @34
pa_sysmap_hit  x_pa_sysmap_hit_0 (
  .addr_ge_bottom_x  (addr_ge_bottom0  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr0  ),
  .sysmap_comp_hit_x (sysmap_comp_hit0 ),
  .sysmap_hit_x      (sysmap_hit0      )
);


// &ConnRule(s/_x/1/); @36
// &Instance("pa_sysmap_hit", "x_pa_sysmap_hit_1"); @37
pa_sysmap_hit  x_pa_sysmap_hit_1 (
  .addr_ge_bottom_x  (addr_ge_bottom1  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr1  ),
  .sysmap_comp_hit_x (sysmap_comp_hit1 ),
  .sysmap_hit_x      (sysmap_hit1      )
);


// &ConnRule(s/_x/2/); @39
// &Instance("pa_sysmap_hit", "x_pa_sysmap_hit_2"); @40
pa_sysmap_hit  x_pa_sysmap_hit_2 (
  .addr_ge_bottom_x  (addr_ge_bottom2  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr2  ),
  .sysmap_comp_hit_x (sysmap_comp_hit2 ),
  .sysmap_hit_x      (sysmap_hit2      )
);


// &ConnRule(s/_x/3/); @42
// &Instance("pa_sysmap_hit", "x_pa_sysmap_hit_3"); @43
pa_sysmap_hit  x_pa_sysmap_hit_3 (
  .addr_ge_bottom_x  (addr_ge_bottom3  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr3  ),
  .sysmap_comp_hit_x (sysmap_comp_hit3 ),
  .sysmap_hit_x      (sysmap_hit3      )
);


// &ConnRule(s/_x/4/); @45
// &Instance("pa_sysmap_hit", "x_pa_sysmap_hit_4"); @46
pa_sysmap_hit  x_pa_sysmap_hit_4 (
  .addr_ge_bottom_x  (addr_ge_bottom4  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr4  ),
  .sysmap_comp_hit_x (sysmap_comp_hit4 ),
  .sysmap_hit_x      (sysmap_hit4      )
);


// &ConnRule(s/_x/5/); @48
// &Instance("pa_sysmap_hit", "x_pa_sysmap_hit_5"); @49
pa_sysmap_hit  x_pa_sysmap_hit_5 (
  .addr_ge_bottom_x  (addr_ge_bottom5  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr5  ),
  .sysmap_comp_hit_x (sysmap_comp_hit5 ),
  .sysmap_hit_x      (sysmap_hit5      )
);


// &ConnRule(s/_x/6/); @51
// &Instance("pa_sysmap_hit", "x_pa_sysmap_hit_6"); @52
pa_sysmap_hit  x_pa_sysmap_hit_6 (
  .addr_ge_bottom_x  (addr_ge_bottom6  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr6  ),
  .sysmap_comp_hit_x (sysmap_comp_hit6 ),
  .sysmap_hit_x      (sysmap_hit6      )
);


// &ConnRule(s/_x/7/); @54
// &Instance("pa_sysmap_hit", "x_pa_sysmap_hit_7"); @55
pa_sysmap_hit  x_pa_sysmap_hit_7 (
  .addr_ge_bottom_x  (addr_ge_bottom7  ),
  .addr_ge_upaddr_x  (addr_ge_upaddr7  ),
  .sysmap_comp_hit_x (sysmap_comp_hit7 ),
  .sysmap_hit_x      (sysmap_hit7      )
);


// &Force("nonport", "addr_ge_upaddr7"); @57
assign {addr_ge_bottom7, addr_ge_bottom6, 
        addr_ge_bottom5, addr_ge_bottom4,
        addr_ge_bottom3, addr_ge_bottom2,
        addr_ge_bottom1, addr_ge_bottom0} = 
       {addr_ge_upaddr6, addr_ge_upaddr5, 
        addr_ge_upaddr4, addr_ge_upaddr3,
        addr_ge_upaddr2, addr_ge_upaddr1,
        addr_ge_upaddr0, 1'b1};


assign sysmap_hit[7:0] = {sysmap_hit7, sysmap_hit6, 
                          sysmap_hit5, sysmap_hit4,
                          sysmap_hit3, sysmap_hit2,
                          sysmap_hit1, sysmap_hit0}; 

// &CombBeg; @73
always @( sysmap_flg2_value[4:0]
       or sysmap_flg1_value[4:0]
       or sysmap_flg6_value[4:0]
       or sysmap_hit[7:0]
       or sysmap_flg7_value[4:0]
       or sysmap_flg5_value[4:0]
       or sysmap_flg4_value[4:0]
       or sysmap_flg3_value[4:0]
       or sysmap_flg0_value[4:0])
begin
  case(sysmap_hit[7:0])
    8'b00000001  : sysmap_flg_y[FLG_WIDTH-1:0] = sysmap_flg0_value[FLG_WIDTH-1:0];
    8'b00000010  : sysmap_flg_y[FLG_WIDTH-1:0] = sysmap_flg1_value[FLG_WIDTH-1:0];
    8'b00000100  : sysmap_flg_y[FLG_WIDTH-1:0] = sysmap_flg2_value[FLG_WIDTH-1:0];
    8'b00001000  : sysmap_flg_y[FLG_WIDTH-1:0] = sysmap_flg3_value[FLG_WIDTH-1:0];
    8'b00010000  : sysmap_flg_y[FLG_WIDTH-1:0] = sysmap_flg4_value[FLG_WIDTH-1:0];
    8'b00100000  : sysmap_flg_y[FLG_WIDTH-1:0] = sysmap_flg5_value[FLG_WIDTH-1:0];
    8'b01000000  : sysmap_flg_y[FLG_WIDTH-1:0] = sysmap_flg6_value[FLG_WIDTH-1:0];
    8'b10000000  : sysmap_flg_y[FLG_WIDTH-1:0] = sysmap_flg7_value[FLG_WIDTH-1:0];
    //default      : sysmap_flg_y[FLG_WIDTH-1:0] = 5'b01111;
    default      : sysmap_flg_y[FLG_WIDTH-1:0] = 5'b10011;
endcase
// &CombEnd; @86
end

// sysmap addr adder
assign sysmap_comp_hit0 = sysmap_pa_y[ADDR_WIDTH-1:0]
                        < sysmap_base_addr0_value[ADDR_WIDTH-1:0];
assign sysmap_comp_hit1 = sysmap_pa_y[ADDR_WIDTH-1:0]
                        < sysmap_base_addr1_value[ADDR_WIDTH-1:0];
assign sysmap_comp_hit2 = sysmap_pa_y[ADDR_WIDTH-1:0]
                        < sysmap_base_addr2_value[ADDR_WIDTH-1:0];
assign sysmap_comp_hit3 = sysmap_pa_y[ADDR_WIDTH-1:0]
                        < sysmap_base_addr3_value[ADDR_WIDTH-1:0];
assign sysmap_comp_hit4 = sysmap_pa_y[ADDR_WIDTH-1:0]
                        < sysmap_base_addr4_value[ADDR_WIDTH-1:0];
assign sysmap_comp_hit5 = sysmap_pa_y[ADDR_WIDTH-1:0]
                        < sysmap_base_addr5_value[ADDR_WIDTH-1:0];
assign sysmap_comp_hit6 = sysmap_pa_y[ADDR_WIDTH-1:0]
                        < sysmap_base_addr6_value[ADDR_WIDTH-1:0];
assign sysmap_comp_hit7 = sysmap_pa_y[ADDR_WIDTH-1:0]
                        < sysmap_base_addr7_value[ADDR_WIDTH-1:0];


// &ModuleEnd; @107
endmodule


