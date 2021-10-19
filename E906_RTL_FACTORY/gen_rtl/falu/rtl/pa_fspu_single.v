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
module pa_fspu_single(
  dp_xx_ex1_id,
  dp_xx_ex1_inf,
  dp_xx_ex1_norm,
  dp_xx_ex1_qnan,
  dp_xx_ex1_snan,
  dp_xx_ex1_zero,
  falu_ctrl_xx_ex1_vld,
  fspu_ex1_dp_fflags,
  fspu_ex1_dp_special_result,
  fspu_ex1_dp_special_sel,
  fspu_ex1_dp_special_sign,
  fspu_ex1_dp_wb_vld,
  fspu_ex1_rtu_rst,
  fspu_ex1_rtu_wb_vld,
  fspu_ex1_rtu_wb_vld_gate,
  fspu_sel,
  fspu_sel_dp,
  fspu_sel_gate,
  idu_fpu_ex1_func,
  idu_fpu_ex1_srcf0,
  idu_fpu_ex1_srcf1,
  idu_fpu_ex1_srci
);

// &Ports; @24
input   [2 :0]  dp_xx_ex1_id;              
input   [2 :0]  dp_xx_ex1_inf;             
input   [2 :0]  dp_xx_ex1_norm;            
input   [2 :0]  dp_xx_ex1_qnan;            
input   [2 :0]  dp_xx_ex1_snan;            
input   [2 :0]  dp_xx_ex1_zero;            
input           falu_ctrl_xx_ex1_vld;      
input           fspu_sel;                  
input           fspu_sel_dp;               
input           fspu_sel_gate;             
input   [9 :0]  idu_fpu_ex1_func;          
input   [31:0]  idu_fpu_ex1_srcf0;         
input   [31:0]  idu_fpu_ex1_srcf1;         
input   [31:0]  idu_fpu_ex1_srci;          
output  [4 :0]  fspu_ex1_dp_fflags;        
output  [31:0]  fspu_ex1_dp_special_result; 
output  [7 :0]  fspu_ex1_dp_special_sel;   
output  [2 :0]  fspu_ex1_dp_special_sign;  
output          fspu_ex1_dp_wb_vld;        
output  [31:0]  fspu_ex1_rtu_rst;          
output          fspu_ex1_rtu_wb_vld;       
output          fspu_ex1_rtu_wb_vld_gate;  

// &Regs; @25

// &Wires; @26
wire    [2 :0]  dp_xx_ex1_id;              
wire    [2 :0]  dp_xx_ex1_inf;             
wire    [2 :0]  dp_xx_ex1_norm;            
wire    [2 :0]  dp_xx_ex1_qnan;            
wire    [2 :0]  dp_xx_ex1_snan;            
wire    [2 :0]  dp_xx_ex1_zero;            
wire    [31:0]  ex1_class_r;               
wire            ex1_dest_f;                
wire            ex1_dest_i;                
wire    [31:0]  ex1_f_rst;                 
wire    [31:0]  ex1_fmvwx_r;               
wire    [31:0]  ex1_fmvxw_r;               
wire    [31:0]  ex1_fsgnj_r;               
wire    [31:0]  ex1_fsgnjn_r;              
wire    [31:0]  ex1_fsgnjx_r;              
wire    [31:0]  ex1_i_rst;                 
wire    [31:0]  ex1_int_src;               
wire    [31:0]  ex1_op0_single;            
wire    [31:0]  ex1_op1_single;            
wire            ex1_op_class;              
wire            ex1_op_fmvwx;              
wire            ex1_op_fmvxw;              
wire            ex1_op_fsgnj;              
wire            ex1_op_fsgnjn;             
wire            ex1_op_fsgnjx;             
wire    [31:0]  ex1_src0;                  
wire            ex1_src0_dn;               
wire            ex1_src0_inf;              
wire            ex1_src0_norm;             
wire            ex1_src0_qnan;             
wire            ex1_src0_sign;             
wire            ex1_src0_snan;             
wire            ex1_src0_zero;             
wire    [31:0]  ex1_src1;                  
wire            ex1_src1_sign;             
wire            falu_ctrl_xx_ex1_vld;      
wire    [4 :0]  fspu_ex1_dp_fflags;        
wire    [31:0]  fspu_ex1_dp_special_result; 
wire    [7 :0]  fspu_ex1_dp_special_sel;   
wire    [2 :0]  fspu_ex1_dp_special_sign;  
wire            fspu_ex1_dp_wb_vld;        
wire    [31:0]  fspu_ex1_rtu_rst;          
wire            fspu_ex1_rtu_wb_vld;       
wire            fspu_ex1_rtu_wb_vld_gate;  
wire            fspu_sel;                  
wire            fspu_sel_dp;               
wire            fspu_sel_gate;             
wire    [9 :0]  idu_fpu_ex1_func;          
wire    [31:0]  idu_fpu_ex1_srcf0;         
wire    [31:0]  idu_fpu_ex1_srcf1;         
wire    [31:0]  idu_fpu_ex1_srci;          


// &Force("bus", "dp_xx_ex1_snan", 2, 0); @28
// &Force("bus", "dp_xx_ex1_qnan", 2, 0); @29
// &Force("bus", "dp_xx_ex1_norm", 2, 0); @30
// &Force("bus", "dp_xx_ex1_zero", 2, 0); @31
// &Force("bus", "dp_xx_ex1_inf", 2, 0); @32
// &Force("bus", "dp_xx_ex1_id", 2, 0); @33
// &Force("bus", "idu_fpu_ex1_func", 9, 0); @34


//------------------------------------------------------------------------------
//                           Interface with idu and fpu:
//------------------------------------------------------------------------------
assign ex1_src0[31:0]    = {32{fspu_sel_dp}} & idu_fpu_ex1_srcf0[31:0];
assign ex1_src1[31:0]    = {32{fspu_sel_dp}} & idu_fpu_ex1_srcf1[31:0];
assign ex1_int_src[31:0] = idu_fpu_ex1_srci[31:0];
//assign fspu_sel          = ctrl_falu_ex1_sel && idu_fpu_ex1_func[2];
//assign fspu_ex1_sel      = fspu_sel;
assign ex1_op_fsgnjx     = idu_fpu_ex1_func[6] &&  idu_fpu_ex1_func[4];
assign ex1_op_fsgnjn     = idu_fpu_ex1_func[6] && !idu_fpu_ex1_func[3] && !idu_fpu_ex1_func[4];
assign ex1_op_fsgnj      = idu_fpu_ex1_func[6] &&  idu_fpu_ex1_func[3];
assign ex1_op_fmvwx      = idu_fpu_ex1_func[7] &&  idu_fpu_ex1_func[3];
assign ex1_op_fmvxw      = idu_fpu_ex1_func[5] &&  idu_fpu_ex1_func[3];
assign ex1_op_class      = idu_fpu_ex1_func[5] &&  idu_fpu_ex1_func[4];
assign ex1_dest_f        = idu_fpu_ex1_func[6] ||  idu_fpu_ex1_func[7] && !idu_fpu_ex1_func[4];
assign ex1_dest_i        = idu_fpu_ex1_func[5] ||  idu_fpu_ex1_func[7] &&  idu_fpu_ex1_func[4];

assign ex1_src0_snan     = dp_xx_ex1_snan[0];
assign ex1_src0_qnan     = dp_xx_ex1_qnan[0];
assign ex1_src0_norm     = dp_xx_ex1_norm[0];
assign ex1_src0_zero     = dp_xx_ex1_zero[0];
assign ex1_src0_inf      = dp_xx_ex1_inf[0];
assign ex1_src0_dn       = dp_xx_ex1_id[0];
assign ex1_src0_sign     = ex1_op0_single[31];
assign ex1_src1_sign     = ex1_op1_single[31];

assign ex1_op0_single[31:0] = ex1_src0[31:0];
assign ex1_op1_single[31:0] = ex1_src1[31:0];


//------------------------------------------------------------------------------
//                           FCLASS Instruction:
//------------------------------------------------------------------------------
//class: r[9:0] = {qnan, snan, +inf, +nm, +dn, +0, -0, -dn, -nm, -inf}
assign ex1_class_r[31:0] = {
                            22'b0,
                            ex1_src0_qnan,
                            ex1_src0_snan,
                           !ex1_src0_sign && ex1_src0_inf,
                           !ex1_src0_sign && ex1_src0_norm && !ex1_src0_dn,
                           !ex1_src0_sign && ex1_src0_dn,
                           !ex1_src0_sign && ex1_src0_zero,
                            ex1_src0_sign && ex1_src0_zero,
                            ex1_src0_sign && ex1_src0_dn,
                            ex1_src0_sign && ex1_src0_norm && !ex1_src0_dn,
                            ex1_src0_sign && ex1_src0_inf};


//------------------------------------------------------------------------------
//                           FSGNJ Instruction:
//------------------------------------------------------------------------------
//fsgnjx : r_s = s0_s ^ s1_s
//fsgnjn : r_s = ~s1_s
//fsgnj  : r_s = s1_s
assign ex1_fsgnjx_r[31:0] = {ex1_src0_sign ^ ex1_src1_sign, ex1_op0_single[30:0]};
assign ex1_fsgnjn_r[31:0] = {~ex1_src1_sign, ex1_op0_single[30:0]};
assign ex1_fsgnj_r[31:0]  = {ex1_src1_sign, ex1_op0_single[30:0]};


//------------------------------------------------------------------------------
//                           FMV Instruction:
//------------------------------------------------------------------------------
//fmv.x.w  : mov low 32bits float to int regsiter
//fmv.w.x  : mov from int register to low 32bit float regsiter
assign ex1_fmvwx_r[31:0]  = ex1_int_src[31:0];
assign ex1_fmvxw_r[31:0]  = ex1_src0[31:0];


//------------------------------------------------------------------------------
//                           Merge float and int result:
//------------------------------------------------------------------------------
assign ex1_f_rst[31:0] = {32{ex1_op_fsgnjx}}  & ex1_fsgnjx_r[31:0] |
                         {32{ex1_op_fsgnjn}}  & ex1_fsgnjn_r[31:0] |
                         {32{ex1_op_fsgnj}}   & ex1_fsgnj_r[31:0]  |
                         {32{ex1_op_fmvwx}}   & ex1_fmvwx_r[31:0];
assign ex1_i_rst[31:0] = {32{ex1_op_fmvxw}}   & ex1_fmvxw_r[31:0]   |
                         {32{ex1_op_class}}   & ex1_class_r[31:0];


//------------------------------------------------------------------------------
//                            Float result rename for output:
//------------------------------------------------------------------------------
assign fspu_ex1_dp_wb_vld  = fspu_sel && ex1_dest_f && falu_ctrl_xx_ex1_vld;
assign fspu_ex1_dp_special_sel[7:0] = {1'b1, 7'b0};
assign fspu_ex1_dp_fflags[4:0] = 5'b0;


//------------------------------------------------------------------------------
//                            Int result rename for output:
//------------------------------------------------------------------------------
assign fspu_ex1_rtu_wb_vld = fspu_sel && ex1_dest_i && falu_ctrl_xx_ex1_vld;
assign fspu_ex1_rtu_wb_vld_gate         = fspu_sel_gate && ex1_dest_i && falu_ctrl_xx_ex1_vld;

assign fspu_ex1_rtu_rst[31:0]  = ex1_i_rst[31:0];
//assign fspu_ex1_rtu_fflags[4:0] = 5'b0;
assign fspu_ex1_dp_special_sign[2:0] = 3'b0;
assign fspu_ex1_dp_special_result[31:0] = ex1_f_rst[31:0];



// &ModuleEnd; @137
endmodule


