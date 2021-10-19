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

// &ModuleBeg; @27
module pa_fadd_single(
  cp0_fpu_xx_dqnan,
  ctrl_xx_ex1_warm_up,
  ctrl_xx_ex2_warm_up,
  dp_xx_ex1_id,
  dp_xx_ex1_inf,
  dp_xx_ex1_norm,
  dp_xx_ex1_qnan,
  dp_xx_ex1_rm,
  dp_xx_ex1_snan,
  dp_xx_ex1_zero,
  dp_xx_ex2_srcf2,
  dp_xx_ex3_rm,
  fadd_ex1_dp_fflags,
  fadd_ex1_dp_special_result,
  fadd_ex1_dp_special_sel,
  fadd_ex1_dp_special_sign,
  fadd_ex1_dp_wb_vld,
  fadd_ex1_pipe_clk,
  fadd_ex1_pipedown,
  fadd_ex1_sel,
  fadd_ex1_sel_dp,
  fadd_ex2_dp_fflags,
  fadd_ex2_dp_rst,
  fadd_ex2_dp_wb_vld,
  fadd_ex2_nocmp,
  fadd_ex2_nocmp_pipe_clk,
  fadd_ex2_nocmp_pipedown,
  fadd_ex2_pipe_clk,
  fadd_ex2_pipedown,
  fadd_ex2_sel,
  fadd_ex3_dp_fflags,
  fadd_ex3_dp_rst,
  fadd_ex3_dp_wb_vld,
  fadd_ex3_rtu_fflags,
  fadd_ex3_rtu_rst,
  fadd_ex3_rtu_wb_vld,
  fadd_ex3_sel,
  falu_ctrl_xx_ex1_vld,
  falu_ctrl_xx_ex2_vld,
  falu_ctrl_xx_ex3_vld,
  falu_fpu_ex1_src_reuse,
  falu_fpu_ex1_src_reuse_data,
  idu_fpu_ex1_func,
  idu_fpu_ex1_srcf0,
  idu_fpu_ex1_srcf1
);

// &Ports; @28
input           cp0_fpu_xx_dqnan;           
input           ctrl_xx_ex1_warm_up;        
input           ctrl_xx_ex2_warm_up;        
input   [2 :0]  dp_xx_ex1_id;               
input   [2 :0]  dp_xx_ex1_inf;              
input   [2 :0]  dp_xx_ex1_norm;             
input   [2 :0]  dp_xx_ex1_qnan;             
input   [2 :0]  dp_xx_ex1_rm;               
input   [2 :0]  dp_xx_ex1_snan;             
input   [2 :0]  dp_xx_ex1_zero;             
input   [31:0]  dp_xx_ex2_srcf2;            
input   [2 :0]  dp_xx_ex3_rm;               
input           fadd_ex1_pipe_clk;          
input           fadd_ex1_pipedown;          
input           fadd_ex1_sel;               
input           fadd_ex1_sel_dp;            
input           fadd_ex2_nocmp_pipe_clk;    
input           fadd_ex2_nocmp_pipedown;    
input           fadd_ex2_pipe_clk;          
input           fadd_ex2_pipedown;          
input           fadd_ex2_sel;               
input           fadd_ex3_sel;               
input           falu_ctrl_xx_ex1_vld;       
input           falu_ctrl_xx_ex2_vld;       
input           falu_ctrl_xx_ex3_vld;       
input   [9 :0]  idu_fpu_ex1_func;           
input   [31:0]  idu_fpu_ex1_srcf0;          
input   [31:0]  idu_fpu_ex1_srcf1;          
output  [4 :0]  fadd_ex1_dp_fflags;         
output  [31:0]  fadd_ex1_dp_special_result; 
output  [7 :0]  fadd_ex1_dp_special_sel;    
output  [2 :0]  fadd_ex1_dp_special_sign;   
output          fadd_ex1_dp_wb_vld;         
output  [4 :0]  fadd_ex2_dp_fflags;         
output  [31:0]  fadd_ex2_dp_rst;            
output          fadd_ex2_dp_wb_vld;         
output          fadd_ex2_nocmp;             
output  [4 :0]  fadd_ex3_dp_fflags;         
output  [31:0]  fadd_ex3_dp_rst;            
output          fadd_ex3_dp_wb_vld;         
output  [4 :0]  fadd_ex3_rtu_fflags;        
output  [31:0]  fadd_ex3_rtu_rst;           
output          fadd_ex3_rtu_wb_vld;        
output          falu_fpu_ex1_src_reuse;     
output  [31:0]  falu_fpu_ex1_src_reuse_data; 

// &Regs; @29
reg     [7 :0]  ex1_e_onehot;               
reg             ex1_special_feq_rst;        
reg             ex1_special_flt_rst;        
reg     [5 :0]  ex1_special_sel_0_a;        
reg     [5 :0]  ex1_special_sel_0_b;        
reg     [8 :0]  ex1_special_sel_1_a;        
reg     [8 :0]  ex1_special_sel_2_a;        
reg     [8 :0]  ex1_special_sel_2_b;        
reg             ex2_act_s_raw;              
reg             ex2_act_sub;                
reg     [23:0]  ex2_addr_a;                 
reg     [23:0]  ex2_addr_b;                 
reg             ex2_both_dn;                
reg             ex2_both_zero;              
reg             ex2_cmp_special_vld;        
reg             ex2_diff_less_2;            
reg     [1 :0]  ex2_e_mask_h;               
reg     [7 :0]  ex2_e_onehot_pre;           
reg     [31:0]  ex2_e_onehot_raw;           
reg     [2 :0]  ex2_grs;                    
reg             ex2_op_cmp;                 
reg             ex2_op_feq;                 
reg             ex2_op_fle;                 
reg             ex2_op_flt;                 
reg             ex2_op_max;                 
reg             ex2_op_sel;                 
reg             ex2_r_0_sign;               
reg             ex2_shift_no_limit;         
reg     [7 :0]  ex2_src0_e;                 
reg             ex2_src0_f_position;        
reg             ex2_src0_s;                 
reg             ex2_src1_s;                 
reg             ex2_src_chg;                
reg             ex2_src_equal;              
reg             ex3_act_s;                  
reg             ex3_act_sub;                
reg             ex3_both_dn;                
reg             ex3_both_zero;              
reg             ex3_cmp_rst;                
reg     [27:0]  ex3_data;                   
reg     [4 :0]  ex3_e_adjust;               
reg             ex3_op_cmp;                 
reg             ex3_op_sel;                 
reg     [7 :0]  ex3_org_e;                  
reg             ex3_r_0_sign;               
reg     [8 :0]  ex3_r_e;                    
reg     [22:0]  ex3_r_f;                    
reg     [31:0]  ex3_r_special;              
reg     [24:0]  ex3_rd_r;                   
reg             ex3_rslt_nv;                
reg             ex3_rst_shift;              
reg             ex3_shift_max;              
reg             ex3_shift_one;              
reg             ex3_src_equal;              
reg             ex3_sub01xxx;               

// &Wires; @30
wire            cp0_fpu_xx_dqnan;           
wire            ctrl_xx_ex1_warm_up;        
wire            ctrl_xx_ex2_warm_up;        
wire    [2 :0]  dp_xx_ex1_id;               
wire    [2 :0]  dp_xx_ex1_inf;              
wire    [2 :0]  dp_xx_ex1_norm;             
wire    [2 :0]  dp_xx_ex1_qnan;             
wire    [2 :0]  dp_xx_ex1_rm;               
wire    [2 :0]  dp_xx_ex1_snan;             
wire    [2 :0]  dp_xx_ex1_zero;             
wire    [31:0]  dp_xx_ex2_srcf2;            
wire    [2 :0]  dp_xx_ex3_rm;               
wire            e_dec_1;                    
wire    [8 :0]  e_diff_adder0;              
wire    [8 :0]  e_diff_adder1;              
wire    [7 :0]  ea;                         
wire    [7 :0]  ea_tmp;                     
wire    [7 :0]  eb;                         
wire    [7 :0]  eb_tmp;                     
wire            ex1_act_s;                  
wire            ex1_act_sub;                
wire    [23:0]  ex1_adder_a;                
wire    [23:0]  ex1_adder_a_final;          
wire    [23:0]  ex1_adder_a_nor;            
wire    [23:0]  ex1_adder_b_final;          
wire            ex1_both_dn;                
wire            ex1_both_zero;              
wire            ex1_cmp_nv;                 
wire            ex1_cmp_sel;                
wire            ex1_cmp_special_nv;         
wire            ex1_cmp_special_r;          
wire            ex1_cmp_special_rst;        
wire            ex1_cmp_special_wb_vld;     
wire            ex1_cmp_sub;                
wire            ex1_diff_less_2;            
wire    [7 :0]  ex1_e_big;                  
wire    [8 :0]  ex1_e_big_diff;             
wire            ex1_e_big_s;                
wire    [7 :0]  ex1_e_big_t;                
wire    [8 :0]  ex1_e_diff;                 
wire    [7 :0]  ex1_e_ed;                   
wire            ex1_es;                     
wire            ex1_f_e_equal;              
wire            ex1_float_nv;               
wire            ex1_g_bit;                  
wire    [2 :0]  ex1_grs;                    
wire            ex1_nv_add_sub;             
wire            ex1_nv_eq;                  
wire            ex1_nv_inf;                 
wire            ex1_nv_lt_le;               
wire            ex1_nv_sel;                 
wire            ex1_op_add;                 
wire            ex1_op_add_sub;             
wire            ex1_op_cmp;                 
wire            ex1_op_feq;                 
wire            ex1_op_feq_borrow;          
wire            ex1_op_fle;                 
wire            ex1_op_fle_borrow;          
wire            ex1_op_flt;                 
wire            ex1_op_max;                 
wire            ex1_op_min;                 
wire            ex1_op_sel;                 
wire            ex1_op_sub;                 
wire            ex1_r_0_sign;               
wire            ex1_r_bit;                  
wire            ex1_r_inf_sign_0_a;         
wire            ex1_r_inf_sign_0_b;         
wire            ex1_r_inf_sign_0_c;         
wire            ex1_r_inf_sign_2_a;         
wire            ex1_r_inf_sign_2_b;         
wire            ex1_rdn;                    
wire            ex1_s_bit;                  
wire            ex1_sel_nm_vld;             
wire    [23:0]  ex1_shift;                  
wire            ex1_shift_no_limit;         
wire    [23:0]  ex1_shift_pre;              
wire            ex1_special_fle_rst;        
wire            ex1_special_inf_rst;        
wire    [5 :0]  ex1_special_sel_0;          
wire    [8 :0]  ex1_special_sel_1;          
wire    [8 :0]  ex1_special_sel_2;          
wire    [7 :0]  ex1_special_sel_final;      
wire    [8 :0]  ex1_special_sel_final_t;    
wire    [2 :0]  ex1_special_sign_0;         
wire    [2 :0]  ex1_special_sign_1;         
wire    [2 :0]  ex1_special_sign_1_a;       
wire    [2 :0]  ex1_special_sign_2;         
wire    [2 :0]  ex1_special_sign_2_a;       
wire    [2 :0]  ex1_special_sign_2_b;       
wire    [2 :0]  ex1_special_sign_final;     
wire            ex1_src0_0;                 
wire            ex1_src0_dn_0;              
wire    [7 :0]  ex1_src0_e;                 
wire    [7 :0]  ex1_src0_e_raw;             
wire            ex1_src0_equal_src1;        
wire    [22:0]  ex1_src0_f;                 
wire    [23:0]  ex1_src0_f_nm;              
wire            ex1_src0_f_raw;             
wire            ex1_src0_id;                
wire            ex1_src0_inf;               
wire            ex1_src0_nan;               
wire            ex1_src0_norm;              
wire            ex1_src0_qnan;              
wire            ex1_src0_s;                 
wire            ex1_src0_s_raw;             
wire            ex1_src0_snan;              
wire            ex1_src1_0;                 
wire            ex1_src1_dn_0;              
wire    [7 :0]  ex1_src1_e;                 
wire    [7 :0]  ex1_src1_e_raw;             
wire    [22:0]  ex1_src1_f;                 
wire    [23:0]  ex1_src1_f_nm;              
wire    [22:0]  ex1_src1_f_raw;             
wire            ex1_src1_id;                
wire            ex1_src1_inf;               
wire            ex1_src1_nan;               
wire            ex1_src1_norm;              
wire            ex1_src1_qnan;              
wire            ex1_src1_s;                 
wire            ex1_src1_s_raw;             
wire    [31:0]  ex1_src1_sel_raw;           
wire            ex1_src1_snan;              
wire            ex2_act_add;                
wire            ex2_act_s;                  
wire            ex2_act_s_tmp;              
wire            ex2_act_sign;               
wire    [27:0]  ex2_adder0_r;               
wire    [27:0]  ex2_adder1_r;               
wire    [27:0]  ex2_adder2_r;               
wire    [27:0]  ex2_adder_src0;             
wire    [27:0]  ex2_adder_src1;             
wire    [27:0]  ex2_adder_sub_r;            
wire            ex2_cmp_feq;                
wire            ex2_cmp_fle;                
wire            ex2_cmp_flt;                
wire            ex2_cmp_r;                  
wire            ex2_cmp_r_nor;              
wire            ex2_cmp_rst;                
wire    [4 :0]  ex2_e_adjust;               
wire    [4 :0]  ex2_e_adjust_pre;           
wire    [31:0]  ex2_e_onehot;               
wire    [27:0]  ex2_e_onehot_mask;          
wire    [27:0]  ex2_ff1_and_mask;           
wire    [4 :0]  ex2_ff1_pred;               
wire    [4 :0]  ex2_ff1_pred_d;             
wire    [27:0]  ex2_ff1_pred_onehot;        
wire    [27:0]  ex2_final_rst;              
wire    [27:0]  ex2_lop_src0;               
wire    [27:0]  ex2_lop_src1;               
wire            ex2_nocmp_nosel;            
wire            ex2_op_no_sel;              
wire    [7 :0]  ex2_org_e;                  
wire            ex2_rslt_nv;                
wire            ex2_rst_shift;              
wire    [27:0]  ex2_rst_tmp;                
wire            ex2_s_equal;                
wire    [7 :0]  ex2_sel_final_e;            
wire    [22:0]  ex2_sel_final_f;            
wire            ex2_sel_final_sign;         
wire            ex2_sel_rst_both0_sign;     
wire    [7 :0]  ex2_sel_rst_max_e;          
wire    [22:0]  ex2_sel_rst_max_f;          
wire            ex2_sel_rst_max_s;          
wire    [7 :0]  ex2_sel_rst_min_e;          
wire    [22:0]  ex2_sel_rst_min_f;          
wire            ex2_sel_rst_min_s;          
wire            ex2_shift_max;              
wire            ex2_shift_one;              
wire            ex2_src0_e_eq_0;            
wire            ex2_src0_eq_src1;           
wire    [22:0]  ex2_src0_f;                 
wire    [23:0]  ex2_src0_f_tmp;             
wire    [7 :0]  ex2_src1_e;                 
wire    [22:0]  ex2_src1_f;                 
wire    [31:0]  ex2_src1_sel;               
wire            ex2_sub01xxx;               
wire            ex2_sub_1;                  
wire            ex2_sub_neg;                
wire    [27:0]  ex2_sub_r_shift;            
wire    [27:0]  ex2_sub_r_shift_t;          
wire            ex3_act_add;                
wire            ex3_cin_e;                  
wire    [24:0]  ex3_data_add2;              
wire            ex3_dn_add;                 
wire            ex3_dn_e_1;                 
wire            ex3_dn_e_inc1;              
wire            ex3_dn_sub;                 
wire    [8 :0]  ex3_e_addr_src1;            
wire            ex3_e_max;                  
wire    [8 :0]  ex3_e_tmp_0;                
wire    [8 :0]  ex3_e_tmp_1;                
wire    [8 :0]  ex3_e_tmp_1_a;              
wire    [8 :0]  ex3_e_tmp_1_b;              
wire            ex3_expt_nx;                
wire            ex3_expt_of;                
wire            ex3_f_all1;                 
wire            ex3_f_all1_a;               
wire            ex3_f_all1_b;               
wire    [31:0]  ex3_final_r_0;              
wire    [31:0]  ex3_final_r_e_add1;         
wire    [31:0]  ex3_final_r_inf;            
wire    [31:0]  ex3_final_r_lfn;            
wire    [24:0]  ex3_inc0_r;                 
wire    [24:0]  ex3_inc1_r;                 
wire    [24:0]  ex3_inc2_r;                 
wire            ex3_nx;                     
wire            ex3_r_0;                    
wire            ex3_r_add01xxx;             
wire            ex3_r_add1xxxx;             
wire            ex3_r_e_add1;               
wire    [22:0]  ex3_r_f_single;             
wire            ex3_r_inc1;                 
wire            ex3_r_inc2;                 
wire            ex3_r_inf;                  
wire            ex3_r_lfn;                  
wire            ex3_r_lfn_sel;              
wire    [31:0]  ex3_r_normal;               
wire            ex3_r_sub000xx;             
wire            ex3_r_sub001xx;             
wire            ex3_r_sub01xxx;             
wire            ex3_rdn;                    
wire            ex3_rdn_inc1;               
wire            ex3_rmm;                    
wire            ex3_rmm_inc1;               
wire    [27:0]  ex3_rnd_data;               
wire            ex3_rne;                    
wire            ex3_rne_inc1;               
wire            ex3_round_g;                
wire            ex3_round_inc1;             
wire            ex3_round_l;                
wire            ex3_round_nm;               
wire            ex3_round_r;                
wire            ex3_round_s;                
wire            ex3_rtz;                    
wire            ex3_rtz_inc1;               
wire            ex3_rup;                    
wire            ex3_rup_inc1;               
wire    [31:0]  ex3_sel_rst;                
wire    [27:0]  ex3_shift_1_bit;            
wire            ex3_special_vld;            
wire    [27:0]  ex3_sub000xx_data;          
wire            ex3_sub_001xx_e_inc1;       
wire            ex3_sub_one;                
wire    [22:0]  fa;                         
wire            fadd_ex1_act_sub;           
wire    [4 :0]  fadd_ex1_dp_fflags;         
wire    [31:0]  fadd_ex1_dp_special_result; 
wire    [7 :0]  fadd_ex1_dp_special_sel;    
wire    [2 :0]  fadd_ex1_dp_special_sign;   
wire            fadd_ex1_dp_wb_vld;         
wire            fadd_ex1_op_add_sub;        
wire            fadd_ex1_op_sel;            
wire            fadd_ex1_pipe_clk;          
wire            fadd_ex1_pipedown;          
wire            fadd_ex1_sel;               
wire            fadd_ex1_sel_dp;            
wire    [4 :0]  fadd_ex2_dp_fflags;         
wire    [31:0]  fadd_ex2_dp_rst;            
wire            fadd_ex2_dp_wb_vld;         
wire            fadd_ex2_nocmp;             
wire            fadd_ex2_nocmp_pipe_clk;    
wire            fadd_ex2_nocmp_pipedown;    
wire            fadd_ex2_pipe_clk;          
wire            fadd_ex2_pipedown;          
wire    [4 :0]  fadd_ex3_dp_fflags;         
wire    [31:0]  fadd_ex3_dp_rst;            
wire            fadd_ex3_dp_wb_vld;         
wire    [4 :0]  fadd_ex3_expt;              
wire    [31:0]  fadd_ex3_final_r;           
wire    [4 :0]  fadd_ex3_rtu_fflags;        
wire    [31:0]  fadd_ex3_rtu_rst;           
wire            fadd_ex3_rtu_wb_vld;        
wire            fadd_ex3_sel;               
wire    [31:0]  fadd_src0;                  
wire    [31:0]  fadd_src1;                  
wire            falu_ctrl_xx_ex1_vld;       
wire            falu_ctrl_xx_ex3_vld;       
wire            falu_fpu_ex1_src_reuse;     
wire    [31:0]  falu_fpu_ex1_src_reuse_data; 
wire    [22:0]  fb;                         
wire    [4 :0]  ff1_pred_a;                 
wire    [4 :0]  ff1_pred_b;                 
wire    [4 :0]  ff1_pred_d_a;               
wire    [4 :0]  ff1_pred_d_b;               
wire    [27:0]  ff1_pred_onehot_a;          
wire    [27:0]  ff1_pred_onehot_b;          
wire    [9 :0]  idu_fpu_ex1_func;           
wire    [31:0]  idu_fpu_ex1_srcf0;          
wire    [31:0]  idu_fpu_ex1_srcf1;          
wire            sa;                         
wire            sb;                         


// &Force("bus", "dp_xx_ex1_cnan", 2, 0); @32
// &Force("bus", "dp_xx_ex1_snan", 2, 0); @33
// &Force("bus", "dp_xx_ex1_qnan", 2, 0); @34
// &Force("bus", "dp_xx_ex1_norm", 2, 0); @35
// &Force("bus", "dp_xx_ex1_zero", 2, 0); @36
// &Force("bus", "dp_xx_ex1_inf", 2, 0); @37
// &Force("bus", "dp_xx_ex1_id", 2, 0); @38
// &Force("bus", "idu_fpu_ex1_func", 9, 0); @39


//==============================================================================
//                     EX1 Operation
//==============================================================================
//------------------------------------------------------------------------------
//                    Interface with idu :
//------------------------------------------------------------------------------
assign ex1_op_add     = idu_fpu_ex1_func[7] &&  idu_fpu_ex1_func[4];
assign ex1_op_sub     = idu_fpu_ex1_func[7] &&  idu_fpu_ex1_func[3];
assign ex1_op_fle     = idu_fpu_ex1_func[6] &&  idu_fpu_ex1_func[4];
assign ex1_op_feq     = idu_fpu_ex1_func[6] &&  !idu_fpu_ex1_func[4] && !idu_fpu_ex1_func[3];
assign ex1_op_flt     = idu_fpu_ex1_func[6] &&  idu_fpu_ex1_func[3];
assign ex1_op_max     = idu_fpu_ex1_func[5] &&  idu_fpu_ex1_func[4];
assign ex1_op_min     = idu_fpu_ex1_func[5] &&  idu_fpu_ex1_func[3];
assign ex1_op_cmp     = idu_fpu_ex1_func[6];
assign ex1_op_sel     = idu_fpu_ex1_func[5];
assign ex1_op_add_sub = idu_fpu_ex1_func[7];
assign ex1_rdn        = dp_xx_ex1_rm[2:0] == 3'b010;


//------------------------------------------------------------------------------
//                    Valid Add/Sub :
//------------------------------------------------------------------------------
//According to origin operate and sign of two oprand
//Get to valid operate
//  Add/sub  |   S0  |   S1  |  Result  |
//    Add        +       +        Add
//    Add        +       -        Sub
//    Add        -       +        Sub
//    Add        -       -        Add
//    Sub        +       +        Sub
//    Sub        +       -        Add
//    Sub        -       +        Add
//    Sub        -       -        Sub
//Ex1 Actural Operation


assign ex1_act_sub = (ex1_op_add) &&
                     (sa ^ sb) ||
                     (ex1_op_sub  || ex1_op_cmp  || ex1_cmp_sel) &&
                     (sa ^~ sb);
assign ex1_act_s   = (ex1_es && ex1_cmp_sub)
                   ? ~ex1_e_big_s
                   : ex1_e_big_s;
assign ex1_cmp_sub = ex1_op_sub || ex1_op_cmp || ex1_cmp_sel;
assign ex1_cmp_sel = ex1_op_sel;


//------------------------------------------------------------------------------
//                    EX1 Double/Single Merge:
//------------------------------------------------------------------------------
//sa : input src_0 sign, fa : input src_0 frac
//sb : input src_1 sign  fb : input src_1 frac
//ex1_s_big_s : the expnt bigger number's sign
assign sa       = fadd_src0[31];
assign ea[7:0]  = fadd_src0[30:23];
assign fa[22:0] = fadd_src0[22:0];
assign sb       = fadd_src1[31];
assign eb[7:0]  = fadd_src1[30:23];
assign fb[22:0] = fadd_src1[22:0];

assign ex1_e_big_s      = ex1_es ? sb : sa;
assign ex1_src0_e[7:0]  = ea[7:0];
assign ex1_src1_e[7:0]  = eb[7:0];
assign ex1_src0_f[22:0] = fa[22:0];
assign ex1_src1_f[22:0] = fb[22:0];

// norm : src is not nan/inf/dn/0
// id   : input denormal
assign ex1_src0_norm = dp_xx_ex1_norm[0];
assign ex1_src1_norm = dp_xx_ex1_norm[1];
assign ex1_src0_id   = dp_xx_ex1_id[0];
assign ex1_src1_id   = dp_xx_ex1_id[1];

// for power : add ex1 src mux
assign fadd_src0[31:0] = idu_fpu_ex1_srcf0[31:0] & {32{fadd_ex1_sel_dp}};
assign fadd_src1[31:0] = idu_fpu_ex1_srcf1[31:0] & {32{fadd_ex1_sel_dp}} ;
assign ex1_src0_s      = sa;
assign ex1_src1_s      = sb;

assign ex1_f_e_equal       = (ex1_src0_e[7:0] == ex1_src1_e[7:0]) && (ex1_src0_f[22:0] == ex1_src1_f[22:0]);
assign ex1_src0_equal_src1 = ex1_f_e_equal;


//------------------------------------------------------------------------------
//                    EX1 Exponent Sub:
//------------------------------------------------------------------------------
// two adders in parallel
// the sign of the result of adder 0 is used to select
//   e_diff_adder0 = Ea - Eb;
//   e_diff_adder1 = Eb - Ea;
// we just need to positive one
assign ea_tmp[7:0] = fadd_src0[30:23];
assign eb_tmp[7:0] = fadd_src1[30:23];
assign e_diff_adder0[8:0] = {1'b0,ea_tmp[7:0]} - {1'b0,eb_tmp[7:0]};
assign e_diff_adder1[8:0] = {1'b0,eb_tmp[7:0]} - {1'b0,ea_tmp[7:0]};

// when ex1_es is 1, src_0 expnt is less than src_1 expnt
assign ex1_es          = e_diff_adder0[8];
assign ex1_e_diff[8:0] = ex1_es ? e_diff_adder1[8:0]  : e_diff_adder0[8:0];
assign ex1_e_ed[7:0]   = ex1_e_diff[7:0];

// this signal is used to select sub rst in ex2
assign ex1_diff_less_2 = (ex1_e_ed[7:0] < 8'b10);

// shift number prepare, the number who has smaller expnt need shift
assign ex1_src0_f_nm[23:0] = ex1_src0_id ? {fadd_src0[22:0], 1'b0} : {ex1_src0_norm, fadd_src0[22:0]};
assign ex1_src1_f_nm[23:0] = ex1_src1_id ? {fadd_src1[22:0], 1'b0} : {ex1_src1_norm, fadd_src1[22:0]};
assign ex1_shift_pre[23:0] = ex1_es ? ex1_src0_f_nm[23:0] : ex1_src1_f_nm[23:0];
assign ex1_adder_a[23:0]   = ex1_es ? ex1_src1_f_nm[23:0] : ex1_src0_f_nm[23:0];


// &Instance("pa_fadd_nm_shift_single","x_pa_fadd_nm_shift"); @153
pa_fadd_nm_shift_single  x_pa_fadd_nm_shift (
  .data_cnt      (ex1_e_ed     ),
  .data_g_out    (ex1_g_bit    ),
  .data_in       (ex1_shift_pre),
  .data_out      (ex1_shift    ),
  .data_r_out    (ex1_r_bit    ),
  .data_s_out    (ex1_s_bit    )
);

// &Connect( @154
//           .data_in        (ex1_shift_pre          ), @155
//           .data_cnt       (ex1_e_ed               ), @156
//           .data_out       (ex1_shift              ), @157
//           .data_g_out     (ex1_g_bit              ), @158
//           .data_r_out     (ex1_r_bit              ), @159
//           .data_s_out     (ex1_s_bit              ) @160
//         ); @161

assign ex1_adder_a_nor[23:0]     = ~ex1_adder_a[23:0];
assign ex1_adder_a_final[23:0]   = ex1_act_sub ? ex1_adder_a_nor[23:0] : ex1_adder_a[23:0];
assign ex1_adder_b_final[23:0]   = ex1_shift[23:0];
assign ex1_both_dn               = ex1_src0_dn_0 && ex1_src1_dn_0;

// These signals are for max/min result
assign ex1_src0_e_raw[7:0]  = ex1_es ? eb_tmp[7:0] : ea_tmp[7:0];
assign ex1_src1_e_raw[7:0]  = ex1_es ? ea_tmp[7:0] : eb_tmp[7:0];
assign ex1_src1_f_raw[22:0] = ex1_es ? fa[22:0] : fb[22:0];
assign ex1_src0_f_raw       = ex1_es ? ex1_src1_dn_0 : ex1_src0_dn_0;
assign ex1_src0_s_raw       = ex1_es ? sb : sa;
assign ex1_src1_s_raw       = ex1_es ? sa : sb;

assign ex1_src0_dn_0        = ex1_src0_0 || ex1_src0_id;
assign ex1_src1_dn_0        = ex1_src1_0 || ex1_src1_id;
assign ex1_grs[2:0]         = {ex1_g_bit, ex1_r_bit, ex1_s_bit};

assign ex1_src1_sel_raw[31:0] = {ex1_src1_s_raw, ex1_src1_e_raw[7:0], ex1_src1_f_raw[22:0]};
assign ex1_sel_nm_vld         = !(ex1_nv_lt_le || ex1_src0_inf || ex1_src1_inf) && ex1_op_sel && falu_ctrl_xx_ex1_vld
                                && fadd_ex1_sel;

assign falu_fpu_ex1_src_reuse_data[31:0] = ex1_src1_sel_raw[31:0];
assign falu_fpu_ex1_src_reuse            = ex1_sel_nm_vld;

//------------------------------------------------------------------------------
//                    EX1 Most Shift NM:
//------------------------------------------------------------------------------
//For rst is dn, shift_cnt has a limit
//the shift base is 1, and when e euqal 0 seem as 1
assign ex1_e_big_t[7:0]    = ex1_es ? ex1_src1_e[7:0] : ex1_src0_e[7:0];
assign ex1_e_big_diff[8:0] = {1'b0,ex1_e_big_t[7:0]} - 9'b1;
assign ex1_e_big[7:0]      = ex1_e_big_diff[7:0] & {8{!ex1_e_big_diff[8]}};
assign ex1_shift_no_limit  = |ex1_e_big[7:5];

// &CombBeg; @197
always @( ex1_e_big[2:0])
begin
case(ex1_e_big[2:0])
  3'd0 : ex1_e_onehot[7:0] = 8'b1000_0000;
  3'd1 : ex1_e_onehot[7:0] = 8'b0100_0000;
  3'd2 : ex1_e_onehot[7:0] = 8'b0010_0000;
  3'd3 : ex1_e_onehot[7:0] = 8'b0001_0000;
  3'd4 : ex1_e_onehot[7:0] = 8'b0000_1000;
  3'd5 : ex1_e_onehot[7:0] = 8'b0000_0100;
  3'd6 : ex1_e_onehot[7:0] = 8'b0000_0010;
  3'd7 : ex1_e_onehot[7:0] = 8'b0000_0001;
  default: ex1_e_onehot[7:0] = {8{1'bx}};
endcase
// &CombEnd; @209
end


//------------------------------------------------------------------------------
//                    EX1 float special result:
//------------------------------------------------------------------------------
//Add/Sub, all op is add
//|  S0  |  S1  | Result |Result Sign|Result f| Expt|
//  snan           qnan     s0            f0     nv
//         snan |  qnan     s1            f1`    nv
//  qnan           qnan     s0            f0
//         qnan    qnan     s1            f1
//   inf   no inf  inf      s0            f0
//   inf    inf    inf      s0
//  no inf  inf    inf      s1            f1
//   inf  - inf    cnan                          nv
//CMP
//|  S0  |  S1  | Result |Result Sign|Result f| Expt|
//  snan            0                            nv
//         snan     0                            nv
//  qnan            0
//         qnan     0
//
//MAX/MIN
//|  S0  |  S1  | Result |Result Sign|Result f| Expt|
//  snan   qnan    cnan                          nv
//  snan    nm      nm                           nv
//  nm     snan     nm                           nv
//  qnan    nm      nm
//  nm     qnan     nm
//  nan     nan    cnan                           /
// Tips:cnan seem as qnan in op

assign ex1_src0_snan = dp_xx_ex1_snan[0];
assign ex1_src1_snan = dp_xx_ex1_snan[1];
assign ex1_src0_qnan = dp_xx_ex1_qnan[0];
assign ex1_src1_qnan = dp_xx_ex1_qnan[1];
assign ex1_src0_inf  = dp_xx_ex1_inf[0];
assign ex1_src1_inf  = dp_xx_ex1_inf[1];
assign ex1_src0_nan  = ex1_src0_qnan || ex1_src0_snan;
assign ex1_src1_nan  = ex1_src1_qnan || ex1_src1_snan;
assign ex1_src0_0    = dp_xx_ex1_zero[0];
assign ex1_src1_0    = dp_xx_ex1_zero[1];
assign ex1_both_zero = ex1_src0_0 && ex1_src1_0;

// for add/sub
assign ex1_nv_add_sub = ex1_src0_snan || ex1_src1_snan || (ex1_src0_inf && ex1_src1_inf) && ex1_act_sub;
assign ex1_nv_inf     = (ex1_src0_inf && ex1_src1_inf) && ex1_act_sub;
assign ex1_nv_lt_le   = ex1_src0_snan || ex1_src1_snan || ex1_src0_qnan || ex1_src1_qnan;
assign ex1_nv_eq      = ex1_src0_snan || ex1_src1_snan;
assign ex1_nv_sel     = ex1_src0_snan || ex1_src1_snan;


// for add/sub nan
// qnan_src1, qnan_src0, cnan, inf, zero, src2, 6 bit
// &CombBeg; @264
always @( cp0_fpu_xx_dqnan
       or ex1_src1_snan
       or ex1_src1_qnan
       or ex1_src0_qnan
       or ex1_src0_snan)
begin
if(ex1_src0_snan && cp0_fpu_xx_dqnan)
  ex1_special_sel_0_a[5:0] = {1'b0, 1'b1, 4'b0};  // src0_qnan
else if(ex1_src1_snan && cp0_fpu_xx_dqnan)
  ex1_special_sel_0_a[5:0] = {1'b1, 5'b0};        // src1_qnan
else if(ex1_src0_qnan  && cp0_fpu_xx_dqnan)
  ex1_special_sel_0_a[5:0] = {1'b0, 1'b1, 4'b0};  // src0_qnan
else if(ex1_src1_qnan  && cp0_fpu_xx_dqnan)
  ex1_special_sel_0_a[5:0] = {1'b1, 5'b0};        // src1_qnan
else
  ex1_special_sel_0_a[5:0] = {2'b0, 1'b1, 3'b0};  // cnan
// &CombEnd; @275
end

// for add/sub inf
// qnan_src1, qnan_src0, cnan, inf, zero, src2, 6 bit
// &CombBeg; @279
always @( ex1_nv_inf)
begin
  if(ex1_nv_inf)
    ex1_special_sel_0_b[5:0] = {2'b0, 1'b1, 3'b0}; // cnan
  else
    ex1_special_sel_0_b[5:0] = {3'b0, 1'b1, 2'b0}; // inf
// &CombEnd; @284
end

assign ex1_special_sel_0[5:0] = ex1_nv_lt_le ? ex1_special_sel_0_a[5:0] : ex1_special_sel_0_b[5:0];

assign ex1_r_inf_sign_0_b = ex1_src0_s;
assign ex1_r_inf_sign_0_a = ex1_src0_inf && ex1_src0_s || ex1_src1_inf && (ex1_src1_s ^ ex1_op_sub);
assign ex1_r_inf_sign_0_c = ex1_src0_inf && ex1_src1_inf ? ex1_r_inf_sign_0_b : ex1_r_inf_sign_0_a;
assign ex1_special_sign_0[2:0] = {ex1_r_inf_sign_0_c,  2'b0};

// for max/min, has nan
// &CombBeg; @294
always @( cp0_fpu_xx_dqnan
       or ex1_src1_snan
       or ex1_src1_qnan
       or ex1_src0_qnan
       or ex1_src0_snan)
begin
if(ex1_src0_snan && cp0_fpu_xx_dqnan)
  ex1_special_sel_1_a[8:0] = {4'b0, 1'b1, 4'b0};  // qnan_src0
else if(ex1_src1_snan && cp0_fpu_xx_dqnan)
  ex1_special_sel_1_a[8:0] = {3'b0, 1'b1, 5'b0};  // qnan_src1
else if(ex1_src0_qnan && ex1_src1_qnan && cp0_fpu_xx_dqnan)
  ex1_special_sel_1_a[8:0] = {4'b0, 1'b1, 4'b0};  // qnan_src0
else if(ex1_src0_snan || ex1_src1_snan || ex1_src0_qnan && ex1_src1_qnan)
  ex1_special_sel_1_a[8:0] = {5'b0, 1'b1, 3'b0};  // cnan
else if(ex1_src0_qnan)
  ex1_special_sel_1_a[8:0] = {1'b1, 1'b0, 7'b0};  // src1
else// if(ex1_src1_qnan)
  ex1_special_sel_1_a[8:0] = {1'b0, 1'b1, 7'b0};  // src0
// &CombEnd; @307
end

assign ex1_special_sign_1_a[2:0] = 3'b0;

// max inf
// src1, src0, qnan_src1,qnan_src0,cnan,inf,zero,src2
// &CombBeg; @313
always @( ex1_src0_s
       or ex1_src1_inf
       or ex1_src0_inf
       or ex1_src1_s)
begin
if(ex1_src0_inf && !ex1_src0_s)
  ex1_special_sel_2_a[8:0] = {6'b0, 1'b1, 2'b0};
else if(ex1_src0_inf && ex1_src0_s)
  ex1_special_sel_2_a[8:0] = {1'b1, 8'b0}; // src1
else if(ex1_src1_inf && !ex1_src1_s)
  ex1_special_sel_2_a[8:0] = {6'b0, 1'b1, 2'b0};
else //if(ex2_src1_inf && ex1_src1_s)
  ex1_special_sel_2_a[8:0] = {1'b0, 1'b1, 7'b0}; //src0
// &CombEnd; @322
end
assign ex1_r_inf_sign_2_a = ex1_src0_s && ex1_src1_s;
assign ex1_special_sign_2_a[2:0] = {ex1_r_inf_sign_2_a, 2'b0};

// min inf
// src1, src0, qnan_src1,qnan_src0,cnan,inf,zero,src2
// &CombBeg; @328
always @( ex1_src0_s
       or ex1_src1_inf
       or ex1_src0_inf
       or ex1_src1_s)
begin
if(ex1_src0_inf && !ex1_src0_s)
  ex1_special_sel_2_b[8:0] = {1'b1, 8'b0}; // src1
else if(ex1_src0_inf && ex1_src0_s)
  ex1_special_sel_2_b[8:0] = {6'b0, 1'b1, 2'b0};
else if(ex1_src1_inf && !ex1_src1_s)
  ex1_special_sel_2_b[8:0] = {1'b0, 1'b1, 7'b0}; // src0
else //if(ex2_src1_inf && ex1_src1_s)
  ex1_special_sel_2_b[8:0] = {6'b0, 1'b1, 2'b0};
// &CombEnd; @337
end
assign ex1_r_inf_sign_2_b =  ex1_src0_s || ex1_src1_s;
assign ex1_special_sign_2_b[2:0] = {ex1_r_inf_sign_2_b, 2'b0};


//max result
assign ex1_special_sel_1[8:0] = (ex1_src0_nan || ex1_src1_nan) ? ex1_special_sel_1_a[8:0] : ex1_special_sel_2_a[8:0];
assign ex1_special_sign_1[2:0] = (ex1_src0_nan || ex1_src1_nan) ? ex1_special_sign_1_a[2:0] : ex1_special_sign_2_a[2:0];

//min result
assign ex1_special_sel_2[8:0] = (ex1_src0_nan || ex1_src1_nan) ? ex1_special_sel_1_a[8:0] : ex1_special_sel_2_b[8:0];
assign ex1_special_sign_2[2:0] = (ex1_src0_nan || ex1_src1_nan) ? ex1_special_sign_1_a[2:0] : ex1_special_sign_2_b[2:0];

//special result merge
assign ex1_special_sel_final[7:0]   = { |ex1_special_sel_final_t[8:7], ex1_special_sel_final_t[6:0]};
assign ex1_special_sel_final_t[8:0] = {9{ex1_op_add_sub}} & {3'b0, ex1_special_sel_0[5:0]} |
                                      {9{ex1_op_max}}     & ex1_special_sel_1[8:0]         |
                                      {9{ex1_op_min}}     & ex1_special_sel_2[8:0];
assign ex1_special_sign_final[2:0]  = {3{ex1_op_add_sub}} & ex1_special_sign_0[2:0] |
                                      {3{ex1_op_max}}     & ex1_special_sign_1[2:0] |
                                      {3{ex1_op_min}}     & ex1_special_sign_2[2:0];
assign ex1_float_nv                 = ex1_op_add_sub && ex1_nv_add_sub || ex1_op_sel && ex1_nv_sel;


//------------------------------------------------------------------------------
//                    EX1 float result rename for output:
//------------------------------------------------------------------------------
assign fadd_ex1_dp_special_result[31:0] = ex1_special_sel_final_t[8] ? fadd_src1[31:0] : fadd_src0[31:0];
assign fadd_ex1_dp_special_sel[7:0]     = ex1_special_sel_final[7:0];
assign fadd_ex1_dp_fflags[4:0]          = {ex1_float_nv, 4'b0};
assign fadd_ex1_dp_wb_vld               = (ex1_nv_lt_le || ex1_src0_inf || ex1_src1_inf) && !ex1_op_cmp && falu_ctrl_xx_ex1_vld
                                          && fadd_ex1_sel;
assign fadd_ex1_dp_special_sign[2:0]    = ex1_special_sign_final[2:0];


//------------------------------------------------------------------------------
//                    EX1 int special result:
//------------------------------------------------------------------------------
//cmp instruction
//if src0 or src1 is nan, rst is 0

//flt
// &CombBeg; @379
always @( ex1_src0_s
       or ex1_src1_inf
       or ex1_src0_inf
       or ex1_src1_s)
begin
if(ex1_src0_inf && ex1_src1_inf)
  ex1_special_flt_rst = ex1_src0_s && !ex1_src1_s;
else if(ex1_src0_inf)
  ex1_special_flt_rst = ex1_src0_s;
else//if (ex1_src1_inf)
  ex1_special_flt_rst = !ex1_src1_s;
// &CombEnd; @386
end

//feq
// &CombBeg; @389
always @( ex1_src0_s
       or ex1_src1_inf
       or ex1_src0_inf
       or ex1_src1_s)
begin
if(ex1_src0_inf && ex1_src1_inf)
  ex1_special_feq_rst = ex1_src0_s ^ ~ex1_src1_s;
else //if only one inf
  ex1_special_feq_rst = 1'b0;
// &CombEnd; @394
end

//fle
assign ex1_special_fle_rst = ex1_special_feq_rst || ex1_special_flt_rst;
assign ex1_special_inf_rst = ex1_op_fle & ex1_special_fle_rst | ex1_op_feq & ex1_special_feq_rst | ex1_op_flt & ex1_special_flt_rst;
assign ex1_cmp_special_r   = ex1_nv_lt_le ? 1'b0 : ex1_special_inf_rst;
assign ex1_cmp_nv          = ex1_op_feq && ex1_nv_eq || (ex1_op_flt || ex1_op_fle) && ex1_nv_lt_le;


//------------------------------------------------------------------------------
//                    EX1 int result rename for output:
//------------------------------------------------------------------------------

assign ex1_cmp_special_rst           = {ex1_cmp_special_r};
assign ex1_cmp_special_nv            = {ex1_cmp_nv};
assign ex1_cmp_special_wb_vld        = (ex1_nv_lt_le || ex1_src0_inf || ex1_src1_inf) && ex1_op_cmp && fadd_ex1_sel && falu_ctrl_xx_ex1_vld;


assign ex1_op_fle_borrow            = ex1_cmp_special_wb_vld ? ex1_cmp_special_rst
                                                             : ex1_op_fle;
assign ex1_op_feq_borrow            = ex1_cmp_special_wb_vld ? ex1_cmp_special_nv
                                                             : ex1_op_feq;

// the sign when rst is 0
assign ex1_r_0_sign = ex1_op_add &&
                      ((ex1_src0_s && ex1_src1_s) ||
                      (ex1_src0_s || ex1_src1_s) && ex1_rdn) ||
                      ex1_op_sub &
                      ((ex1_src0_s && !ex1_src1_s) ||
                      (ex1_src0_s || !ex1_src1_s) && ex1_rdn);

// output for icg
assign fadd_ex1_act_sub    = ex1_act_sub;
assign fadd_ex1_op_add_sub = ex1_op_add_sub;
assign fadd_ex1_op_sel     = ex1_op_sel;


//==============================================================================
//                     EX1 pipedown to EX2
//==============================================================================
always @(posedge fadd_ex1_pipe_clk)
begin
  if(fadd_ex1_pipedown) begin
    ex2_addr_a[23:0]  <= ex1_adder_a_final[23:0];
    ex2_addr_b[23:0]  <= ex1_adder_b_final[23:0];
    ex2_grs[2:0]      <= ex1_grs[2:0];
    ex2_act_s_raw     <= ex1_act_s;
    ex2_act_sub       <= ex1_act_sub;
    ex2_both_dn       <= ex1_both_dn;
    ex2_src_chg       <= ex1_es;
    ex2_both_zero        <= ex1_both_zero;
    ex2_src_equal     <= ex1_src0_equal_src1;
    ex2_r_0_sign      <= ex1_r_0_sign;
    ex2_op_sel        <= ex1_op_sel;
    ex2_op_cmp        <= ex1_op_cmp;
    ex2_src0_s        <= ex1_src0_s_raw;
    ex2_src1_s        <= ex1_src1_s_raw;
    ex2_src0_e[7:0]   <= ex1_src0_e_raw[7:0];
  end
end

always @(posedge fadd_ex1_pipe_clk)
begin
  if(fadd_ex1_pipedown && fadd_ex1_act_sub && fadd_ex1_op_add_sub || ctrl_xx_ex1_warm_up) begin
    ex2_e_mask_h[1:0]     <= ex1_e_big[4:3];
    ex2_e_onehot_pre[7:0] <= ex1_e_onehot[7:0];
    ex2_shift_no_limit    <= ex1_shift_no_limit;
    ex2_diff_less_2       <= ex1_diff_less_2;
  end
end

always @(posedge fadd_ex1_pipe_clk)
begin
  if(fadd_ex1_pipedown && ex1_op_cmp || ctrl_xx_ex1_warm_up) begin
    ex2_op_fle    <= ex1_op_fle_borrow;
    ex2_op_feq    <= ex1_op_feq_borrow;
    ex2_op_flt    <= ex1_op_flt;
    ex2_cmp_special_vld    <= ex1_cmp_special_wb_vld;
  end
end


always @(posedge fadd_ex1_pipe_clk)
begin
  if(fadd_ex1_pipedown && fadd_ex1_op_sel || ctrl_xx_ex1_warm_up) begin
    ex2_op_max           <= ex1_op_max;
    ex2_src0_f_position  <= ex1_src0_f_raw;
  end
end

//==============================================================================
//                     EX2 Operation
//==============================================================================
//------------------------------------------------------------------------------
//                     EX2 Most Shift Mask:
//------------------------------------------------------------------------------
//This for dn rst to limit the shift_cnt
// &CombBeg; @581
always @( ex2_e_onehot_pre[7:0]
       or ex2_e_mask_h[1:0])
begin
case(ex2_e_mask_h[1:0])
  2'd0 : ex2_e_onehot_raw[31:0]   = {ex2_e_onehot_pre[7:0], 24'b0};
  2'd1 : ex2_e_onehot_raw[31:0]   = {8'b0,  ex2_e_onehot_pre[7:0], 16'b0};
  2'd2 : ex2_e_onehot_raw[31:0]   = {16'b0, ex2_e_onehot_pre[7:0], 8'b0};
  2'd3 : ex2_e_onehot_raw[31:0]   = {24'b0, ex2_e_onehot_pre[7:0]};
  default: ex2_e_onehot_raw[31:0] = {32{1'bx}};
endcase
// &CombEnd; @589
end
assign ex2_e_onehot[31:0]      =  ex2_e_onehot_raw[31:0] & {32{!ex2_shift_no_limit}};
assign ex2_e_onehot_mask[27:0] = {1'b0, ex2_e_onehot[31:7], 2'b0};


//------------------------------------------------------------------------------
//                     EX2 LOP and Adder:
//------------------------------------------------------------------------------
assign ex2_adder_src0[27:0] = {ex2_act_sub, ex2_addr_a[23:0], {3{ex2_act_sub}}};
assign ex2_adder_src1[27:0] = {1'b0, ex2_addr_b[23:0], ex2_grs[2:0]};
assign ex2_lop_src0[27:0]   = {1'b0, ~ex2_addr_a[23:0], 3'b0} & {28{ex2_act_sub}};
assign ex2_lop_src1[27:0]   = ex2_adder_src1[27:0] & {28{ex2_act_sub}};


assign ex2_src0_eq_src1 = ex2_src_equal;
assign ex2_act_s_tmp    = ex2_act_s_raw;
assign ex2_act_add      = !ex2_act_sub;
assign ex2_src0_e_eq_0  = ex2_src0_e[7:0] == 8'b0;

assign ex2_op_no_sel     = ex2_act_sub && !ex2_op_sel;


assign ex2_adder0_r[27:0] = ex2_adder_src0[27:0] + ex2_adder_src1[27:0];
assign ex2_adder1_r[27:0] = ex2_adder_src0[27:0] + ex2_adder_src1[27:0] + 1'b1;
assign ex2_adder2_r[27:0] = ~ex2_adder0_r[27:0];
//src1 - src0 < 0
assign ex2_sub_neg        = ex2_adder1_r[27];

assign ex2_adder_sub_r[27:0] = ex2_sub_neg ? ex2_adder2_r[27:0] : ex2_adder1_r[27:0];
assign ex2_rst_tmp[27:0]     = ex2_op_sel  ? {5'b0, ex2_sel_final_f[22:0]}
                                           : ex2_act_add ? ex2_adder0_r[27:0]
                                                         : ex2_adder_sub_r[27:0];


// &Instance("pa_fadd_lop_s1_s","x_pa_fadd_lop_s1_s_a"); @623
pa_fadd_lop_s1_s  x_pa_fadd_lop_s1_s_a (
  .ff1_mask          (ex2_e_onehot_mask),
  .ff1_pred          (ff1_pred_a       ),
  .ff1_pred_d        (ff1_pred_d_a     ),
  .ff1_pred_onehot   (ff1_pred_onehot_a),
  .src0_adder        (ex2_lop_src0     ),
  .src1_adder        (ex2_lop_src1     )
);

// &Connect( @624
//           .src0_adder        (ex2_lop_src0       ), @625
//           .src1_adder        (ex2_lop_src1       ), @626
//           .ff1_pred_onehot   (ff1_pred_onehot_a  ), @627
//           .ff1_pred          (ff1_pred_a         ), @628
//           .ff1_mask          (ex2_e_onehot_mask  ), @629
//           .ff1_pred_d        (ff1_pred_d_a       ) @630
//         ); @631

// &Instance("pa_fadd_lop_s1_s","x_pa_fadd_lop_s1_s_b"); @633
pa_fadd_lop_s1_s  x_pa_fadd_lop_s1_s_b (
  .ff1_mask          (ex2_e_onehot_mask),
  .ff1_pred          (ff1_pred_b       ),
  .ff1_pred_d        (ff1_pred_d_b     ),
  .ff1_pred_onehot   (ff1_pred_onehot_b),
  .src0_adder        (ex2_lop_src1     ),
  .src1_adder        (ex2_lop_src0     )
);

// &Connect( @634
//           .src0_adder        (ex2_lop_src1       ), @635
//           .src1_adder        (ex2_lop_src0       ), @636
//           .ff1_pred_onehot   (ff1_pred_onehot_b  ), @637
//           .ff1_pred          (ff1_pred_b         ), @638
//           .ff1_mask          (ex2_e_onehot_mask  ), @639
//           .ff1_pred_d        (ff1_pred_d_b       ) @640
//         ); @641

assign ex2_ff1_pred_onehot[27:0] = ex2_sub_neg ? ff1_pred_onehot_b[27:0] : ff1_pred_onehot_a[27:0];
assign ex2_ff1_pred[4:0]         = ex2_sub_neg ? ff1_pred_b[4:0]         : ff1_pred_a[4:0];
assign ex2_ff1_pred_d[4:0]       = ex2_sub_neg ? ff1_pred_d_b[4:0]       : ff1_pred_d_a[4:0];
assign ex2_e_adjust_pre[4:0]     = ex2_ff1_pred_d[4:0];

// &Instance("pa_fadd_shift_sub_single","x_pa_fadd_shift_sub_single"); @648
pa_fadd_shift_sub_single  x_pa_fadd_shift_sub_single (
  .data_in           (ex2_adder_sub_r  ),
  .data_out          (ex2_sub_r_shift_t),
  .shift_cnt         (ex2_ff1_pred     )
);

// &Connect( @649
//           .data_in           (ex2_adder_sub_r    ), @650
//           .shift_cnt         (ex2_ff1_pred       ), @651
//           .data_out          (ex2_sub_r_shift_t  ) @652
//         ); @653
assign ex2_sub_r_shift[27:0] = {1'b0, ex2_sub_r_shift_t[27:1]};


// This is just for LOP 1 bit error
assign ex2_ff1_and_mask[27:0] = ex2_ff1_pred_onehot[27:0] & ex2_e_onehot_mask[27:0];
assign ex2_shift_max          = |ex2_ff1_and_mask[27:0];
assign ex2_shift_one          = !ex2_shift_max && !ex2_sub_r_shift[26];

// in sub op, expnt don't change
assign ex2_sub_1    = ex2_adder_sub_r[26];
assign ex2_sub01xxx = ex2_act_sub && ex2_sub_1 && !ex2_src0_e_eq_0;


//------------------------------------------------------------------------------
//                          EX2 Normal Result:
//------------------------------------------------------------------------------
//EX2: generate cmp sel instruction result and special add/sub result

assign ex2_act_s     = ex2_act_sub && !ex2_src_chg && !ex2_sub_neg ? !ex2_act_s_tmp : ex2_act_s_tmp;


//------------------------------------------------------------------------------
//                          Max/Min Normal Result:
//------------------------------------------------------------------------------
//To gengrate max/min rst
//In double, for timing design, max/min rst pipedown to ex3. Here in order to
//simplify rtu design, we also pipedown to ex3 in single
assign ex2_src1_sel[31:0]      = dp_xx_ex2_srcf2[31:0];
assign ex2_src1_e[7:0]        = ex2_src1_sel[30:23];
assign ex2_src1_f[22:0]        = ex2_src1_sel[22:0];

assign ex2_src0_f_tmp[23:0]    = ex2_act_sub         ? ~ex2_addr_a[23:0]    : ex2_addr_a[23:0];
assign ex2_src0_f[22:0]        = ex2_src0_f_position ? ex2_src0_f_tmp[23:1] : ex2_src0_f_tmp[22:0];

assign ex2_sel_rst_both0_sign  =  ex2_op_max ? ex2_src0_s && ex2_src1_s : ex2_src0_s || ex2_src1_s;
assign ex2_sel_rst_max_s       =  ex2_act_s ^ ex2_src_chg ? ex2_src1_s  : ex2_src0_s;
assign ex2_sel_rst_min_s       = !ex2_act_s ^ ex2_src_chg ? ex2_src1_s  : ex2_src0_s;
assign ex2_sel_rst_max_e[7:0]  =  ex2_act_s ^ ex2_src_chg ? ex2_src1_e[7:0]  : ex2_src0_e[7:0];
assign ex2_sel_rst_min_e[7:0]  = !ex2_act_s ^ ex2_src_chg ? ex2_src1_e[7:0]  : ex2_src0_e[7:0];
assign ex2_sel_rst_max_f[22:0] =  ex2_act_s ^ ex2_src_chg ? ex2_src1_f[22:0] : ex2_src0_f[22:0];
assign ex2_sel_rst_min_f[22:0] = !ex2_act_s ^ ex2_src_chg ? ex2_src1_f[22:0] : ex2_src0_f[22:0];

assign ex2_sel_final_sign      = ex2_both_zero ? ex2_sel_rst_both0_sign
                                               : ex2_op_max ? ex2_sel_rst_max_s
                                                            : ex2_sel_rst_min_s;
assign ex2_sel_final_f[22:0]   = ex2_op_max ? ex2_sel_rst_max_f[22:0] : ex2_sel_rst_min_f[22:0];
assign ex2_sel_final_e[7:0]    = ex2_op_max ? ex2_sel_rst_max_e[7:0]  : ex2_sel_rst_min_e[7:0];


//------------------------------------------------------------------------------
//                          CMP Normal Result:
//------------------------------------------------------------------------------

assign ex2_s_equal  = ex2_src0_s == ex2_src1_s;
assign ex2_cmp_feq  = ex2_s_equal && ex2_src0_eq_src1 || ex2_both_zero;
assign ex2_cmp_flt  = (ex2_act_s && !ex2_cmp_feq);
assign ex2_cmp_fle  = ex2_cmp_feq || ex2_cmp_flt;

assign ex2_cmp_r_nor    = ex2_op_fle & ex2_cmp_fle |
                      ex2_op_feq & ex2_cmp_feq |
                      ex2_op_flt & ex2_cmp_flt;
assign ex2_cmp_r     = ex2_cmp_special_vld ? ex2_op_fle
                                           : ex2_cmp_r_nor;
assign ex2_rslt_nv   = ex2_op_cmp & ex2_cmp_special_vld & ex2_op_feq;
//==============================================================================
//                          EX2 Result Merge
//==============================================================================
//for rtu design : falu write back int only in ex1 and ex3, so cmp normal result
//need pipedown to ex3, here we choose ex3_single reg to pipedown cmp result

assign fadd_ex2_dp_fflags[4:0] = 5'b0;
assign fadd_ex2_dp_wb_vld      = 1'b0;
assign fadd_ex2_dp_rst[31:0]   = 32'b0;


// &Force("input", "fadd_ex2_sel"); @729
// &Force("input", "falu_ctrl_xx_ex2_vld"); @730

//------------------------------------------------------------------------------
//                     EX2 Singal pipedown to EX3:
//------------------------------------------------------------------------------
//For sub rst maybe has three types :
//1.sub01xx, no need shift rst
//2.sub001x, also no need shift rst
//3.sub000x, this need shift, dn sub is also in this type
//
//For ex2_final_rst, maybe has 4 meanings:
//1. rst of add op
//2. rst of sub op(no need shift)
//3. rst of sub op(need shift, only shiift partial)
//4. frac of the rst of max/min

assign ex2_final_rst[27:0] = ex2_op_no_sel && ex2_diff_less_2 && !ex2_sub01xxx ? ex2_sub_r_shift[27:0] : ex2_rst_tmp[27:0];
assign ex2_rst_shift       = ex2_op_no_sel && ex2_diff_less_2 && !ex2_sub01xxx ;
assign ex2_org_e[7:0]      = ex2_op_sel ? ex2_sel_final_e[7:0] : ex2_src0_e[7:0];
assign ex2_e_adjust[4:0]   = ex2_e_adjust_pre[4:0];
assign ex2_act_sign        = ex2_op_sel ? ex2_sel_final_sign : ex2_act_s;
assign ex2_cmp_rst         = ex2_cmp_r;
assign ex2_nocmp_nosel     = !ex2_op_cmp && !ex2_op_sel;

// Output for icg
assign fadd_ex2_nocmp   = !ex2_op_cmp;


//==============================================================================
//                          EX2 pipedown to EX3:
//==============================================================================
always @(posedge fadd_ex2_pipe_clk)
begin
  if(fadd_ex2_pipedown) begin
    ex3_cmp_rst       <= ex2_cmp_rst;
    ex3_op_cmp        <= ex2_op_cmp;
    ex3_op_sel        <= ex2_op_sel;
    ex3_rslt_nv       <= ex2_rslt_nv;
  end
end

always @(posedge fadd_ex2_nocmp_pipe_clk)
begin
  if(fadd_ex2_nocmp_pipedown && ex2_act_sub && ex2_nocmp_nosel || ctrl_xx_ex2_warm_up) begin
    ex3_e_adjust[4:0] <= ex2_e_adjust[4:0];
    ex3_shift_max     <= ex2_shift_max;
    ex3_sub01xxx      <= ex2_sub01xxx;
    ex3_shift_one     <= ex2_shift_one;
  end
end

always @(posedge fadd_ex2_nocmp_pipe_clk)
begin
  if(fadd_ex2_nocmp_pipedown) begin
    ex3_data[27:0]   <= ex2_final_rst[27:0];
    ex3_org_e[7:0]   <= ex2_org_e[7:0];
    ex3_both_dn      <= ex2_both_dn;
    ex3_both_zero    <= ex2_both_zero;
    ex3_act_s        <= ex2_act_sign;
    ex3_act_sub      <= ex2_act_sub;
    ex3_src_equal    <= ex2_src0_eq_src1;
    ex3_r_0_sign     <= ex2_r_0_sign;
    ex3_rst_shift    <= ex2_rst_shift;
  end
end


//=============================================================================
//                     EX3 Operation
//=============================================================================
//EX3 Op: generate the normal result of add/sub, and result of cmp
assign ex3_act_add     = !ex3_act_sub;
assign ex3_rne         = dp_xx_ex3_rm[2:0] == 3'b000;
assign ex3_rtz         = dp_xx_ex3_rm[2:0] == 3'b001;
assign ex3_rup         = dp_xx_ex3_rm[2:0] == 3'b011;
assign ex3_rdn         = dp_xx_ex3_rm[2:0] == 3'b010;
assign ex3_rmm         = dp_xx_ex3_rm[2:0] == 3'b100;
assign ex3_e_max       = !ex3_org_e[0] && &ex3_org_e[7:1]; //11...11110
assign ex3_f_all1_a    = &ex3_data[25:3];
assign ex3_f_all1_b    = &ex3_data[24:2];
assign ex3_f_all1      = ex3_r_sub001xx ? ex3_f_all1_b : ex3_f_all1_a;
assign ex3_shift_1_bit[27:0]   = {ex3_data[26:0],1'b0};
assign ex3_sub000xx_data[27:0] = ex3_shift_one ? ex3_shift_1_bit[27:0] : ex3_data[27:0];


//------------------------------------------------------------------------------
//                           EX3 Rounding Merge:
//------------------------------------------------------------------------------
// Merge all round mode to one, because g/r/s is accurate
assign ex3_round_nm = ex3_r_add01xxx || ex3_r_sub01xxx;
assign ex3_round_g  = ex3_r_add1xxxx &  ex3_data[3] | ex3_r_sub001xx & ex3_data[1] | ex3_round_nm & ex3_data[2];
assign ex3_round_r  = ex3_r_add1xxxx &  ex3_data[2] | ex3_r_sub001xx & 1'b0 | ex3_round_nm & ex3_data[1];
assign ex3_round_s  = ex3_r_add1xxxx & (ex3_data[1] | ex3_data[0]) | (ex3_round_nm |ex3_r_sub001xx)  & ex3_data[0];
assign ex3_round_l  = ex3_r_add1xxxx &  ex3_data[4] | ex3_r_sub001xx & ex3_data[2] | ex3_round_nm & ex3_data[3];

assign ex3_rne_inc1 = ex3_round_g && (ex3_round_l || !ex3_round_l && (ex3_round_s || ex3_round_r));
assign ex3_rtz_inc1 = 1'b0;
assign ex3_rdn_inc1 = ex3_act_s  && (ex3_round_g || ex3_round_r || ex3_round_s);
assign ex3_rup_inc1 = !ex3_act_s && (ex3_round_g || ex3_round_r || ex3_round_s);
assign ex3_rmm_inc1 = ex3_round_g;

assign ex3_round_inc1 = ex3_rne && ex3_rne_inc1 ||
                        ex3_rtz && ex3_rtz_inc1 ||
                        ex3_rdn && ex3_rdn_inc1 ||
                        ex3_rup && ex3_rup_inc1 ||
                        ex3_rmm && ex3_rmm_inc1;


//------------------------------------------------------------------------------
//                           Expnt and Frac Adder:
//------------------------------------------------------------------------------
assign ex3_rnd_data[27:0] = e_dec_1 ? {ex3_data[26:0],1'b0} : ex3_data[27:0];
assign ex3_data_add2[24:0] = ex3_rnd_data[27:3] + 25'b10;

//ex3 rst expnt adder : one for nm rst, one for sub rst which need shift
//merge addder for sub rst (which need shift and lop is accurate) and nm rst
//to one : ex3_e_tmp_0
assign ex3_e_addr_src1[8:0] = ex3_r_sub000xx ? {4'b0, ex3_e_adjust[4:0]}
                                              : ex3_act_sub ? 9'b1
                                                            : 9'h1ff;
assign ex3_e_tmp_0[8:0]    = {1'b0, ex3_org_e[7:0]} - ex3_e_addr_src1[8:0];
assign ex3_e_tmp_1_a[8:0]  = ex3_e_tmp_0[8:0];
assign ex3_e_tmp_1_b[8:0]  = ex3_e_tmp_0[8:0] - 9'b1;

assign ex3_sub_one          = ex3_shift_max && !ex3_data[26] || ex3_shift_one;
assign ex3_e_tmp_1[8:0]     = ex3_sub_one ? ex3_e_tmp_1_b[8:0] : ex3_e_tmp_1_a[8:0];


//------------------------------------------------------------------------------
//                           Both DN Result:
//------------------------------------------------------------------------------
assign ex3_dn_add    = ex3_both_dn && ex3_act_add;
assign ex3_dn_sub    = ex3_both_dn && ex3_act_sub;
assign ex3_dn_e_inc1 = ex3_data[27];
assign ex3_dn_e_1    = ex3_dn_e_inc1 && ex3_dn_add;


//------------------------------------------------------------------------------
//                           Merge Result:
//------------------------------------------------------------------------------
//ex3 normal result judge
//add1xxxx: rst is 1x.xxx
//add01xxx: rst is 01.xxx
//sub01xxx: rst is 01.xxx
//sub001xx: rst is 00.1xx
//sub000xx: rst is 00.0xx, in this type rst need shift, but not need round
assign ex3_cin_e      = ex3_data[27];
assign ex3_r_add1xxxx = ex3_act_add && ex3_cin_e;
assign ex3_r_add01xxx = ex3_act_add && !ex3_cin_e;
assign ex3_r_sub01xxx = ex3_sub01xxx && ex3_act_sub;
assign ex3_r_sub001xx = e_dec_1;
assign ex3_r_sub000xx = ex3_rst_shift && ex3_act_sub;
assign e_dec_1        = ex3_act_sub && !ex3_rst_shift && !ex3_r_sub01xxx;

assign ex3_r_inc1     = (ex3_r_add01xxx || ex3_r_sub01xxx || ex3_r_sub001xx) && ex3_round_inc1;
assign ex3_r_inc2     = ex3_r_add1xxxx && ex3_round_inc1;

assign ex3_inc1_r[24:0] = ex3_rnd_data[3] ? {ex3_data_add2[24:1], 1'b0}
                                          : {ex3_rnd_data[27:4],  1'b1};
assign ex3_inc2_r[24:0] = ex3_data_add2[24:0];
assign ex3_inc0_r[24:0] = ex3_r_add1xxxx ? {1'b0,ex3_rnd_data[27:4]} : ex3_rnd_data[27:3];

// &CombBeg; @956
always @( ex3_inc0_r[24:0]
       or ex3_inc1_r[24:0]
       or ex3_r_inc2
       or ex3_r_inc1
       or ex3_inc2_r[24:0])
begin
if(ex3_r_inc1)
  ex3_rd_r[24:0] = ex3_inc1_r[24:0];
else if(ex3_r_inc2)
  ex3_rd_r[24:0] = ex3_inc2_r[24:0];
else
  ex3_rd_r[24:0] = ex3_inc0_r[24:0];
// &CombEnd; @963
end


//------------------------------------------------------------------------------
//                              Expt Result:
//------------------------------------------------------------------------------
assign ex3_expt_of = ex3_act_add && ex3_e_max && (ex3_cin_e || ex3_rd_r[24]);
assign ex3_nx      = (ex3_r_add1xxxx || ex3_r_add01xxx || ex3_r_sub01xxx || ex3_r_sub001xx) &&
                     (ex3_round_g    || ex3_round_r    || ex3_round_s);
assign ex3_expt_nx = ex3_expt_of     || ex3_nx;


//------------------------------------------------------------------------------
//                             Special Result :
//------------------------------------------------------------------------------
assign ex3_r_lfn_sel        = ex3_rtz || ex3_rup && ex3_act_s || ex3_rdn && !ex3_act_s;
assign ex3_r_lfn            = ex3_r_lfn_sel && ex3_expt_of;
assign ex3_r_inf            = ex3_expt_of && !ex3_r_lfn_sel;
assign ex3_r_0              = ex3_both_zero || ex3_src_equal && ex3_act_sub;
assign ex3_r_e_add1         = ex3_f_all1 && ex3_r_inc1 && !ex3_r_sub001xx;
assign ex3_sub_001xx_e_inc1 = ex3_f_all1 && ex3_r_inc1;

assign ex3_final_r_inf[31:0]    = {ex3_act_s, {8{1'b1}}, 23'b0};
assign ex3_final_r_lfn[31:0]    = {ex3_act_s, {7{1'b1}}, 1'b0, {23{1'b1}}};
assign ex3_final_r_0[31:0]      = {ex3_r_0_sign, 8'b0, 23'b0};
assign ex3_final_r_e_add1[31:0] = {ex3_act_s, ex3_e_tmp_0[7:0], {23{1'b0}}};

assign ex3_special_vld = ex3_r_inf || ex3_r_lfn || ex3_r_0 || ex3_r_e_add1;


//------------------------------------------------------------------------------
//                             Final Result Merge:
//------------------------------------------------------------------------------
// &CombBeg @996
always @( ex3_e_tmp_0[8:0]
       or ex3_r_sub000xx
       or ex3_org_e[7:0]
       or ex3_dn_sub
       or ex3_sub_001xx_e_inc1
       or ex3_e_tmp_1[8:0]
       or ex3_r_add1xxxx
       or e_dec_1
       or ex3_r_e_add1
       or ex3_dn_e_1)
begin
if(ex3_dn_sub)
  ex3_r_e[8:0] = 9'b0;
else if(ex3_dn_e_1)
  ex3_r_e[8:0] = {8'b0, 1'b1};
else if(ex3_r_e_add1 || ex3_r_add1xxxx || e_dec_1 && !ex3_sub_001xx_e_inc1)
  ex3_r_e[8:0] = ex3_e_tmp_0[8:0];
else if(ex3_r_sub000xx)
  ex3_r_e[8:0] = ex3_e_tmp_1[8:0];
else
  ex3_r_e[8:0] = {1'b0, ex3_org_e[7:0]};
// &CombEnd @1007
end

// &CombBeg @1009
always @( ex3_r_sub000xx
       or ex3_dn_sub
       or ex3_sub000xx_data[26:3]
       or ex3_r_inc2
       or ex3_data[26:4]
       or ex3_rd_r[23:0]
       or ex3_dn_add)
begin
if(ex3_dn_add)
  ex3_r_f[22:0] = ex3_data[26:4];
else if(ex3_dn_sub)
  ex3_r_f[22:0] = ex3_sub000xx_data[26:4];
else if(ex3_r_inc2)
  ex3_r_f[22:0] = ex3_rd_r[23:1];
else if(ex3_r_sub000xx)
  ex3_r_f[22:0] = ex3_sub000xx_data[25:3];
else
  ex3_r_f[22:0] = ex3_rd_r[22:0];
// &CombEnd @1020
end

assign ex3_r_normal[31:0]   = {ex3_act_s, ex3_r_e[7:0] , ex3_r_f_single[22:0]};
assign ex3_r_f_single[22:0] = ex3_r_f[22:0];


// &CombBeg @1026
always @( ex3_r_inf
       or ex3_final_r_lfn[31:0]
       or ex3_final_r_e_add1[31:0]
       or ex3_r_lfn
       or ex3_r_0
       or ex3_final_r_0[31:0]
       or ex3_final_r_inf[31:0])
begin
if(ex3_r_inf)
  ex3_r_special[31:0] = ex3_final_r_inf[31:0];
else if(ex3_r_lfn)
  ex3_r_special[31:0] = ex3_final_r_lfn[31:0];
else if(ex3_r_0)
  ex3_r_special[31:0] = ex3_final_r_0[31:0];
else
  ex3_r_special[31:0] = ex3_final_r_e_add1[31:0];
// &CombEnd @1035
end


//------------------------------------------------------------------------------
//                             Max/Min Result:
//------------------------------------------------------------------------------
assign ex3_sel_rst[31:0] = {ex3_act_s, ex3_org_e[7:0], ex3_data[22:0]};


//------------------------------------------------------------------------------
//                            Rename For Output:
//------------------------------------------------------------------------------

assign fadd_ex3_final_r[31:0] = ex3_special_vld ? ex3_r_special[31:0] : ex3_r_normal[31:0];
assign fadd_ex3_expt[4:0]     = {2'b0, ex3_expt_of, 1'b0, ex3_expt_nx};


assign fadd_ex3_dp_wb_vld      = fadd_ex3_sel && falu_ctrl_xx_ex3_vld && !ex3_op_cmp;
assign fadd_ex3_dp_rst[31:0]   = ex3_op_sel ? ex3_sel_rst[31:0] : fadd_ex3_final_r[31:0];
assign fadd_ex3_dp_fflags[4:0] = ex3_op_sel ? 5'b0 : fadd_ex3_expt[4:0];
//assign fadd_ex3_dp_single = ex3_single;

assign fadd_ex3_rtu_wb_vld      = fadd_ex3_sel && falu_ctrl_xx_ex3_vld && ex3_op_cmp;
assign fadd_ex3_rtu_fflags[4:0] =  {ex3_rslt_nv,4'b0};
assign fadd_ex3_rtu_rst[31:0]   = {31'b0, ex3_cmp_rst};


// &ModuleEnd; @1062
endmodule


