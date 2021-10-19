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
module pa_iu_alu(
  alu_dp_ex1_cmplt,
  alu_dp_ex1_cmplt_dp,
  alu_dp_ex1_fwd_vld,
  alu_dp_ex1_rslt,
  dp_xx_ex1_stall,
  idu_iu_ex1_alu_cmplt_dp_sel,
  idu_iu_ex1_alu_gateclk_sel,
  idu_iu_ex1_alu_sel,
  idu_iu_ex1_func,
  idu_iu_ex1_inst_vld,
  idu_iu_ex1_src0,
  idu_iu_ex1_src1
);

// &Ports; @26
input           dp_xx_ex1_stall;            
input           idu_iu_ex1_alu_cmplt_dp_sel; 
input           idu_iu_ex1_alu_gateclk_sel; 
input           idu_iu_ex1_alu_sel;         
input   [19:0]  idu_iu_ex1_func;            
input           idu_iu_ex1_inst_vld;        
input   [31:0]  idu_iu_ex1_src0;            
input   [31:0]  idu_iu_ex1_src1;            
output          alu_dp_ex1_cmplt;           
output          alu_dp_ex1_cmplt_dp;        
output          alu_dp_ex1_fwd_vld;         
output  [31:0]  alu_dp_ex1_rslt;            

// &Regs; @27
reg     [31:0]  alu_shifter_res_raw;        

// &Wires; @28
wire    [31:0]  alu_adder_add_res;          
wire            alu_adder_c_in;             
wire            alu_adder_c_out_raw;        
wire    [31:0]  alu_adder_comp_res;         
wire            alu_adder_comp_rslt;        
wire    [31:0]  alu_adder_minmax_res;       
wire            alu_adder_oper_add;         
wire            alu_adder_oper_addsl;       
wire            alu_adder_oper_comp;        
wire            alu_adder_oper_max;         
wire            alu_adder_oper_minmax;      
wire            alu_adder_oper_signed;      
wire    [31:0]  alu_adder_res;              
wire    [31:0]  alu_adder_res_raw;          
wire            alu_adder_res_signed_lt;    
wire            alu_adder_res_unsigned_lt;  
wire    [31:0]  alu_adder_rs1;              
wire    [31:0]  alu_adder_rs2;              
wire    [31:0]  alu_adder_rs2_raw;          
wire    [31:0]  alu_adder_rs2_shift;        
wire            alu_adder_sel;              
wire    [31:0]  alu_adder_slt_res;          
wire    [4 :0]  alu_adder_sub_func;         
wire    [31:0]  alu_bitop_rst;              
wire            alu_dp_ex1_cmplt;           
wire            alu_dp_ex1_cmplt_dp;        
wire            alu_dp_ex1_fwd_vld;         
wire    [31:0]  alu_dp_ex1_rslt;            
wire    [31:0]  alu_logic_and_res;          
wire    [31:0]  alu_logic_or_res;           
wire    [31:0]  alu_logic_res;              
wire    [31:0]  alu_logic_rs1;              
wire    [31:0]  alu_logic_rs2;              
wire    [31:0]  alu_logic_rs2_raw;          
wire            alu_logic_sel;              
wire    [4 :0]  alu_logic_sub_func;         
wire    [31:0]  alu_logic_xor_res;          
wire            alu_minmax_sel_rs1;         
wire    [31:0]  alu_pack_encry_rst;         
wire    [31:0]  alu_pack_mov_rst;           
wire            alu_pack_pack_inst;         
wire    [31:0]  alu_pack_rs1;               
wire    [31:0]  alu_pack_rs2;               
wire    [31:0]  alu_pack_rst;               
wire            alu_pack_sel;               
wire    [4 :0]  alu_pack_sub_func;          
wire    [31:0]  alu_packh_rst;              
wire    [31:0]  alu_packhl_rst;             
wire    [31:0]  alu_packl_rst;              
wire    [31:0]  alu_res;                    
wire    [4 :0]  alu_sel;                    
wire            alu_shifter_dir_right;      
wire    [31:0]  alu_shifter_ext_rst;        
wire            alu_shifter_inst_ext;       
wire            alu_shifter_inst_sll;       
wire            alu_shifter_inst_sra;       
wire    [31:0]  alu_shifter_res;            
wire    [31:0]  alu_shifter_res_raw_rev;    
wire    [31:0]  alu_shifter_res_tmp;        
wire    [31:0]  alu_shifter_rs1;            
wire    [31:0]  alu_shifter_rs1_raw;        
wire    [31:0]  alu_shifter_rs1_raw_rev;    
wire    [9 :0]  alu_shifter_rs2;            
wire            alu_shifter_sel;            
wire            alu_shifter_shift_in;       
wire    [4 :0]  alu_shifter_sub_func;       
wire            dp_xx_ex1_stall;            
wire            idu_iu_ex1_alu_cmplt_dp_sel; 
wire            idu_iu_ex1_alu_sel;         
wire    [19:0]  idu_iu_ex1_func;            
wire            idu_iu_ex1_inst_vld;        
wire    [31:0]  idu_iu_ex1_src0;            
wire    [31:0]  idu_iu_ex1_src1;            


// &Force("bus","idu_iu_ex1_func",19,0); @30
assign alu_sel[4:0]            = idu_iu_ex1_func[9:5] & {5{idu_iu_ex1_alu_sel}};
//==========================================================
//                        Adder
//==========================================================
//----------- Operation Type -----------
// &Force("bus", "idu_iu_ex1_ag_imm", 31, 0); @36
assign alu_adder_sel           = alu_sel[0];
assign alu_adder_rs1[31:0]     = {32{alu_adder_sel}} & idu_iu_ex1_src0[31:0];
assign alu_adder_rs2_raw[31:0] = {32{alu_adder_sel}} & idu_iu_ex1_src1[31:0];
assign alu_adder_sub_func[4:0] = { 5{alu_adder_sel}} & idu_iu_ex1_func[4:0];

assign alu_adder_oper_add    = alu_adder_sub_func[0]; // sub_func[0]: 0-add,              1-sub.
assign alu_adder_oper_comp   = alu_adder_sub_func[1]; // sub_func[1]: 0-compare,          1-arithmetic.
assign alu_adder_oper_minmax = alu_adder_sub_func[2]; // sub_func[2]: 0-not min_max,      1-min_max.
assign alu_adder_oper_max    = alu_adder_sub_func[3]; // sub_func[3]: 0-min,              1-max.
assign alu_adder_oper_signed = alu_adder_sub_func[4]; // sub_func[4]: 0-unsigned compare, 1-signed compare.
assign alu_adder_oper_addsl      = 1'b0;
assign alu_adder_rs2_shift[31:0] = 32'b0;

// &Force("input","idu_iu_ex1_alu_gateclk_sel"); @57
//---------- Operand Generate ----------
// If operation is not add (sub, compare), rs2 = ~rs2 + 1.
// ADDSL : rs2 : rs2_raw >> imm2

assign alu_adder_rs2[31:0] = alu_adder_oper_addsl ?  alu_adder_rs2_shift[31:0] :
                                                     alu_adder_oper_add ? alu_adder_rs2_raw[31:0]
                                                                        : ~alu_adder_rs2_raw[31:0];
assign alu_adder_c_in      = !alu_adder_oper_add;


//------------- Main Adder -------------
assign {alu_adder_c_out_raw, alu_adder_res_raw[31:0]} =
         {1'b0, alu_adder_rs1[31:0]} + {1'b0, alu_adder_rs2[31:0]} + {32'b0, alu_adder_c_in};

//---------- Result Generate -----------
assign alu_adder_res_signed_lt =
            (alu_adder_rs1[31] & alu_adder_rs2[31])
         | ((alu_adder_rs1[31] ^ alu_adder_rs2[31]) & alu_adder_res_raw[31]);
assign alu_adder_res_unsigned_lt = !alu_adder_c_out_raw;

// alu_adder_comp_rslt means rs1 < rs2.
assign alu_adder_comp_rslt     = alu_adder_oper_signed ? alu_adder_res_signed_lt
                                                       : alu_adder_res_unsigned_lt;

assign alu_adder_add_res[31:0]  = alu_adder_res_raw[31:0];
assign alu_adder_comp_res[31:0] = alu_adder_oper_minmax ? alu_adder_minmax_res[31:0]
                                                        : alu_adder_slt_res[31:0];

assign alu_adder_slt_res[31:0]  = {31'b0, alu_adder_comp_rslt};

assign alu_minmax_sel_rs1 = alu_adder_oper_max ^ alu_adder_comp_rslt;

assign alu_adder_minmax_res[31:0] = alu_minmax_sel_rs1 ? alu_adder_rs1[31:0]
                                                       : alu_adder_rs2_raw[31:0];

assign alu_adder_res[31:0] = alu_adder_oper_comp ? alu_adder_comp_res[31:0]
                                                 : alu_adder_add_res[31:0];

//==========================================================
//                       Shifter
//==========================================================
// Only have one RIGHT-SHIFTER, which shift-in can be either 0 or 1.
assign alu_shifter_sel           = alu_sel[1];
assign alu_shifter_rs1_raw[31:0] = {32{alu_shifter_sel}} & idu_iu_ex1_src0[31:0];
assign alu_shifter_rs2[9:0]      = { 10{alu_shifter_sel}} & idu_iu_ex1_src1[9:0];
assign alu_shifter_sub_func[4:0] = { 5{alu_shifter_sel}} & idu_iu_ex1_func[4:0];

assign alu_shifter_inst_sll = alu_shifter_sub_func[0] && !alu_shifter_sub_func[4];
//assign alu_shifter_inst_srl = alu_shifter_sub_func[1];
assign alu_shifter_inst_sra = alu_shifter_sub_func[2];
//assign alu_shifter_inst_srri = 1'b0;
assign alu_shifter_inst_ext  = 1'b0;
// &Force("nonport", "alu_shifter_inst_sll"); @115

assign alu_shifter_dir_right = !alu_shifter_inst_sll;

// Reversal LEFT-SHIFT oprand.
assign alu_shifter_rs1_raw_rev[31:0] = {alu_shifter_rs1_raw[0],  alu_shifter_rs1_raw[1],
                                        alu_shifter_rs1_raw[2],  alu_shifter_rs1_raw[3],
                                        alu_shifter_rs1_raw[4],  alu_shifter_rs1_raw[5],
                                        alu_shifter_rs1_raw[6],  alu_shifter_rs1_raw[7],
                                        alu_shifter_rs1_raw[8],  alu_shifter_rs1_raw[9],
                                        alu_shifter_rs1_raw[10], alu_shifter_rs1_raw[11],
                                        alu_shifter_rs1_raw[12], alu_shifter_rs1_raw[13],
                                        alu_shifter_rs1_raw[14], alu_shifter_rs1_raw[15],
                                        alu_shifter_rs1_raw[16], alu_shifter_rs1_raw[17],
                                        alu_shifter_rs1_raw[18], alu_shifter_rs1_raw[19],
                                        alu_shifter_rs1_raw[20], alu_shifter_rs1_raw[21],
                                        alu_shifter_rs1_raw[22], alu_shifter_rs1_raw[23],
                                        alu_shifter_rs1_raw[24], alu_shifter_rs1_raw[25],
                                        alu_shifter_rs1_raw[26], alu_shifter_rs1_raw[27],
                                        alu_shifter_rs1_raw[28], alu_shifter_rs1_raw[29],
                                        alu_shifter_rs1_raw[30], alu_shifter_rs1_raw[31]};

assign alu_shifter_rs1[31:0] = alu_shifter_dir_right ? alu_shifter_rs1_raw[31:0]
                                                     : alu_shifter_rs1_raw_rev[31:0];

assign alu_shifter_shift_in = alu_shifter_inst_sra && alu_shifter_rs1_raw[31];

// &CombBeg; @147
// &CombEnd; @183
// &CombBeg; @185
// &CombEnd; @221
//-------------- Right Shifter----------

// &CombBeg; @237
always @( alu_shifter_rs2[4:0]
       or alu_shifter_rs1[31:0]
       or alu_shifter_shift_in)
begin
  case(alu_shifter_rs2[4:0])
    5'b00000:
      alu_shifter_res_raw[31:0] = alu_shifter_rs1[31:0];
    5'b00001:
      alu_shifter_res_raw[31:0] = {{ 1{alu_shifter_shift_in}}, alu_shifter_rs1[31:1]};
    5'b00010:
      alu_shifter_res_raw[31:0] = {{ 2{alu_shifter_shift_in}}, alu_shifter_rs1[31:2]};
    5'b00011:
      alu_shifter_res_raw[31:0] = {{ 3{alu_shifter_shift_in}}, alu_shifter_rs1[31:3]};
    5'b00100:
      alu_shifter_res_raw[31:0] = {{ 4{alu_shifter_shift_in}}, alu_shifter_rs1[31:4]};
    5'b00101:
      alu_shifter_res_raw[31:0] = {{ 5{alu_shifter_shift_in}}, alu_shifter_rs1[31:5]};
    5'b00110:
      alu_shifter_res_raw[31:0] = {{ 6{alu_shifter_shift_in}}, alu_shifter_rs1[31:6]};
    5'b00111:
      alu_shifter_res_raw[31:0] = {{ 7{alu_shifter_shift_in}}, alu_shifter_rs1[31:7]};
    5'b01000:
      alu_shifter_res_raw[31:0] = {{ 8{alu_shifter_shift_in}}, alu_shifter_rs1[31:8]};
    5'b01001:
      alu_shifter_res_raw[31:0] = {{ 9{alu_shifter_shift_in}}, alu_shifter_rs1[31:9]};
    5'b01010:
      alu_shifter_res_raw[31:0] = {{10{alu_shifter_shift_in}}, alu_shifter_rs1[31:10]};
    5'b01011:
      alu_shifter_res_raw[31:0] = {{11{alu_shifter_shift_in}}, alu_shifter_rs1[31:11]};
    5'b01100:
      alu_shifter_res_raw[31:0] = {{12{alu_shifter_shift_in}}, alu_shifter_rs1[31:12]};
    5'b01101:
      alu_shifter_res_raw[31:0] = {{13{alu_shifter_shift_in}}, alu_shifter_rs1[31:13]};
    5'b01110:
      alu_shifter_res_raw[31:0] = {{14{alu_shifter_shift_in}}, alu_shifter_rs1[31:14]};
    5'b01111:
      alu_shifter_res_raw[31:0] = {{15{alu_shifter_shift_in}}, alu_shifter_rs1[31:15]};
    5'b10000:
      alu_shifter_res_raw[31:0] = {{16{alu_shifter_shift_in}}, alu_shifter_rs1[31:16]};
    5'b10001:
      alu_shifter_res_raw[31:0] = {{17{alu_shifter_shift_in}}, alu_shifter_rs1[31:17]};
    5'b10010:
      alu_shifter_res_raw[31:0] = {{18{alu_shifter_shift_in}}, alu_shifter_rs1[31:18]};
    5'b10011:
      alu_shifter_res_raw[31:0] = {{19{alu_shifter_shift_in}}, alu_shifter_rs1[31:19]};
    5'b10100:
      alu_shifter_res_raw[31:0] = {{20{alu_shifter_shift_in}}, alu_shifter_rs1[31:20]};
    5'b10101:
      alu_shifter_res_raw[31:0] = {{21{alu_shifter_shift_in}}, alu_shifter_rs1[31:21]};
    5'b10110:
      alu_shifter_res_raw[31:0] = {{22{alu_shifter_shift_in}}, alu_shifter_rs1[31:22]};
    5'b10111:
      alu_shifter_res_raw[31:0] = {{23{alu_shifter_shift_in}}, alu_shifter_rs1[31:23]};
    5'b11000:
      alu_shifter_res_raw[31:0] = {{24{alu_shifter_shift_in}}, alu_shifter_rs1[31:24]};
    5'b11001:
      alu_shifter_res_raw[31:0] = {{25{alu_shifter_shift_in}}, alu_shifter_rs1[31:25]};
    5'b11010:
      alu_shifter_res_raw[31:0] = {{26{alu_shifter_shift_in}}, alu_shifter_rs1[31:26]};
    5'b11011:
      alu_shifter_res_raw[31:0] = {{27{alu_shifter_shift_in}}, alu_shifter_rs1[31:27]};
    5'b11100:
      alu_shifter_res_raw[31:0] = {{28{alu_shifter_shift_in}}, alu_shifter_rs1[31:28]};
    5'b11101:
      alu_shifter_res_raw[31:0] = {{29{alu_shifter_shift_in}}, alu_shifter_rs1[31:29]};
    5'b11110:
      alu_shifter_res_raw[31:0] = {{30{alu_shifter_shift_in}}, alu_shifter_rs1[31:30]};
    5'b11111:
      alu_shifter_res_raw[31:0] = {{31{alu_shifter_shift_in}}, alu_shifter_rs1[31]};
    default:
      alu_shifter_res_raw[31:0] = {32{1'bx}};
  endcase
// &CombEnd; @306
end

assign alu_shifter_ext_rst[31:0]  = 32'b0;

// Reversal LEFT-SHIFT result.
assign alu_shifter_res_raw_rev[31:0] = {alu_shifter_res_raw[0],  alu_shifter_res_raw[1],
                                        alu_shifter_res_raw[2],  alu_shifter_res_raw[3],
                                        alu_shifter_res_raw[4],  alu_shifter_res_raw[5],
                                        alu_shifter_res_raw[6],  alu_shifter_res_raw[7],
                                        alu_shifter_res_raw[8],  alu_shifter_res_raw[9],
                                        alu_shifter_res_raw[10], alu_shifter_res_raw[11],
                                        alu_shifter_res_raw[12], alu_shifter_res_raw[13],
                                        alu_shifter_res_raw[14], alu_shifter_res_raw[15],
                                        alu_shifter_res_raw[16], alu_shifter_res_raw[17],
                                        alu_shifter_res_raw[18], alu_shifter_res_raw[19],
                                        alu_shifter_res_raw[20], alu_shifter_res_raw[21],
                                        alu_shifter_res_raw[22], alu_shifter_res_raw[23],
                                        alu_shifter_res_raw[24], alu_shifter_res_raw[25],
                                        alu_shifter_res_raw[26], alu_shifter_res_raw[27],
                                        alu_shifter_res_raw[28], alu_shifter_res_raw[29],
                                        alu_shifter_res_raw[30], alu_shifter_res_raw[31]};

assign alu_shifter_res_tmp[31:0] = alu_shifter_dir_right ? alu_shifter_res_raw[31:0]
                                                         : alu_shifter_res_raw_rev[31:0];

assign alu_shifter_res[31:0] = alu_shifter_inst_ext ? alu_shifter_ext_rst[31:0] : alu_shifter_res_tmp[31:0];

//==========================================================
//                        Logic
//==========================================================
assign alu_logic_sel               = alu_sel[2];
assign alu_logic_rs1[31:0]         = {32{alu_logic_sel}} & idu_iu_ex1_src0[31:0];
assign alu_logic_rs2_raw[31:0]     = {32{alu_logic_sel}} & idu_iu_ex1_src1[31:0];

// Sub function:
//   0 - and;
//   1 - or;
//   2 - xor.
assign alu_logic_sub_func[4:0] = { 5{alu_logic_sel}} & idu_iu_ex1_func[4:0];

assign alu_logic_rs2[31:0] =  alu_logic_rs2_raw[31:0];

assign alu_logic_and_res[31:0] = alu_logic_rs1[31:0] & alu_logic_rs2[31:0];
assign alu_logic_or_res[31:0]  = alu_logic_rs1[31:0] | alu_logic_rs2[31:0];
assign alu_logic_xor_res[31:0] = alu_logic_rs1[31:0] ^ alu_logic_rs2[31:0];

//-------------- Logic Mux -------------
assign alu_logic_res[31:0] = {32{alu_logic_sub_func[0]}} & alu_logic_and_res[31:0]
                           | {32{alu_logic_sub_func[1]}} & alu_logic_or_res[31:0]
                           | {32{alu_logic_sub_func[2]}} & alu_logic_xor_res[31:0];

//==========================================================
//                        PACK
//==========================================================
assign alu_pack_sel           = alu_sel[3];
assign alu_pack_sub_func[4:0] =  {5{alu_pack_sel}} & idu_iu_ex1_func[4:0];

assign alu_pack_rs1[31:0] = {32{alu_pack_sel}} & idu_iu_ex1_src0[31:0];
assign alu_pack_rs2[31:0] = {32{alu_pack_sel}} & idu_iu_ex1_src1[31:0];
assign alu_pack_pack_inst = |alu_pack_sub_func[2:0];

// &Force("nonport", "alu_pack_rs1"); @372
// &Force("nonport", "alu_pack_rs2"); @373

assign alu_packl_rst[31:0]  = 32'b0;
assign alu_packh_rst[31:0]  = 32'b0;
assign alu_packhl_rst[31:0] = 32'b0;
//-------------- Pack Mux -------------
assign alu_pack_encry_rst[31:0] = {32{alu_pack_sub_func[0]}} & alu_packl_rst[31:0] |
                                  {32{alu_pack_sub_func[1]}} & alu_packh_rst[31:0] |
                                  {32{alu_pack_sub_func[2]}} & alu_packhl_rst[31:0];

assign alu_pack_mov_rst[31:0] = 32'b0;
assign alu_pack_rst[31:0] = alu_pack_pack_inst ? alu_pack_encry_rst[31:0] : alu_pack_mov_rst[31:0];

//==========================================================
//                        BITOP
//==========================================================
// &CombBeg; @418
// &CombEnd; @454
// &CombBeg; @461
// &CombEnd; @497
assign alu_bitop_rst[31:0] = 32'b0;


//==========================================================
//                       ALU Mux
//==========================================================
assign alu_res[31:0] = alu_adder_res[31:0]
                     | alu_shifter_res[31:0]
                     | alu_logic_res[31:0]
                     | alu_pack_rst[31:0]
                     | alu_bitop_rst[31:0];


//==========================================================
//                   Output for RTU
//==========================================================

assign alu_dp_ex1_fwd_vld  = (|alu_sel[4:0]) & idu_iu_ex1_alu_cmplt_dp_sel;
assign alu_dp_ex1_cmplt    = idu_iu_ex1_inst_vld && (|alu_sel[4:0]) && (~dp_xx_ex1_stall);
assign alu_dp_ex1_cmplt_dp = idu_iu_ex1_alu_cmplt_dp_sel;
assign alu_dp_ex1_rslt[31:0] = alu_res[31:0];

// &ModuleEnd; @548
endmodule


