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

// &ModuleBeg; @25
module pa_fcnvt_single(
  ctrl_xx_ex1_warm_up,
  dp_xx_ex1_cnan,
  dp_xx_ex1_inf,
  dp_xx_ex1_qnan,
  dp_xx_ex1_snan,
  dp_xx_ex1_zero,
  dp_xx_ex2_rm,
  falu_ctrl_xx_ex1_vld,
  falu_ctrl_xx_ex3_vld,
  fcnvt_ex1_dp_fflags,
  fcnvt_ex1_dp_special_result,
  fcnvt_ex1_dp_special_sel,
  fcnvt_ex1_dp_special_sign,
  fcnvt_ex1_dp_wb_vld,
  fcnvt_ex1_pipe_clk,
  fcnvt_ex1_pipedown,
  fcnvt_ex1_sel,
  fcnvt_ex1_sel_dp,
  fcnvt_ex2_pipe_clk,
  fcnvt_ex2_pipedown,
  fcnvt_ex3_dp_fflags,
  fcnvt_ex3_dp_rst,
  fcnvt_ex3_dp_wb_vld,
  fcnvt_ex3_fspu_vld,
  fcnvt_ex3_rtu_fflags,
  fcnvt_ex3_rtu_rst,
  fcnvt_ex3_rtu_wb_vld,
  fcnvt_ex3_sel,
  fspu_ex1_rtu_rst,
  fspu_ex1_rtu_wb_vld,
  idu_fpu_ex1_func,
  idu_fpu_ex1_srcf0,
  idu_fpu_ex1_srci
);

// &Ports; @26
input           ctrl_xx_ex1_warm_up;        
input   [2 :0]  dp_xx_ex1_cnan;             
input   [2 :0]  dp_xx_ex1_inf;              
input   [2 :0]  dp_xx_ex1_qnan;             
input   [2 :0]  dp_xx_ex1_snan;             
input   [2 :0]  dp_xx_ex1_zero;             
input   [2 :0]  dp_xx_ex2_rm;               
input           falu_ctrl_xx_ex1_vld;       
input           falu_ctrl_xx_ex3_vld;       
input           fcnvt_ex1_pipe_clk;         
input           fcnvt_ex1_pipedown;         
input           fcnvt_ex1_sel;              
input           fcnvt_ex1_sel_dp;           
input           fcnvt_ex2_pipe_clk;         
input           fcnvt_ex2_pipedown;         
input           fcnvt_ex3_sel;              
input   [31:0]  fspu_ex1_rtu_rst;           
input           fspu_ex1_rtu_wb_vld;        
input   [9 :0]  idu_fpu_ex1_func;           
input   [31:0]  idu_fpu_ex1_srcf0;          
input   [31:0]  idu_fpu_ex1_srci;           
output  [4 :0]  fcnvt_ex1_dp_fflags;        
output  [31:0]  fcnvt_ex1_dp_special_result; 
output  [7 :0]  fcnvt_ex1_dp_special_sel;   
output  [2 :0]  fcnvt_ex1_dp_special_sign;  
output          fcnvt_ex1_dp_wb_vld;        
output  [4 :0]  fcnvt_ex3_dp_fflags;        
output  [31:0]  fcnvt_ex3_dp_rst;           
output          fcnvt_ex3_dp_wb_vld;        
output          fcnvt_ex3_fspu_vld;         
output  [4 :0]  fcnvt_ex3_rtu_fflags;       
output  [31:0]  fcnvt_ex3_rtu_rst;          
output          fcnvt_ex3_rtu_wb_vld;       

// &Regs; @27
reg     [2 :0]  ex1_special_sel_2;          
reg             ex2_dest_float;             
reg             ex2_dest_si;                
reg     [8 :0]  ex2_exp;                    
reg     [23:0]  ex2_frac;                   
reg             ex2_fspu_vld;               
reg     [31:0]  ex2_int_r;                  
reg             ex2_sign;                   
reg             ex2_special_nv;             
reg             ex2_special_vld;            
reg             ex2_src_is_0;               
reg     [24:0]  ex2_tail;                   
reg             ex3_dest_float;             
reg     [3 :0]  ex3_expt;                   
reg             ex3_fspu_vld;               
reg     [31:0]  ex3_result;                 
reg             ex3_special_vld;            

// &Wires; @28
wire            ctrl_xx_ex1_warm_up;        
wire    [2 :0]  dp_xx_ex1_cnan;             
wire    [2 :0]  dp_xx_ex1_inf;              
wire    [2 :0]  dp_xx_ex1_qnan;             
wire    [2 :0]  dp_xx_ex1_snan;             
wire    [2 :0]  dp_xx_ex1_zero;             
wire    [2 :0]  dp_xx_ex2_rm;               
wire            ex1_dest_float;             
wire            ex1_dest_si;                
wire    [8 :0]  ex1_e_without_bias;         
wire    [8 :0]  ex1_exp_bias;               
wire    [4 :0]  ex1_ff1_d_cnt;              
wire    [31:0]  ex1_ff1_sh_f_v;             
wire    [8 :0]  ex1_final_exp;              
wire    [23:0]  ex1_final_frac;             
wire            ex1_final_sign;             
wire    [24:0]  ex1_final_tail;             
wire    [24:0]  ex1_final_tail_t;           
wire    [31:0]  ex1_fsh_i_v_nm;             
wire    [24:0]  ex1_fsh_i_x_nm;             
wire    [31:0]  ex1_ftoi_0;                 
wire    [31:0]  ex1_ftoi_int;               
wire    [24:0]  ex1_ftoi_int_tail;          
wire    [31:0]  ex1_ftoi_max;               
wire    [31:0]  ex1_ftoi_min;               
wire    [31:0]  ex1_ftoi_specail;           
wire    [23:0]  ex1_ftoi_trans;             
wire    [31:0]  ex1_ftosi_max;              
wire    [31:0]  ex1_ftosi_min;              
wire    [31:0]  ex1_ftoui_max;              
wire    [31:0]  ex1_ftoui_min;              
wire            ex1_ia_0;                   
wire    [23:0]  ex1_itof_dest_frac;         
wire    [24:0]  ex1_itof_dest_tail;         
wire    [8 :0]  ex1_itof_expnt;             
wire    [31:0]  ex1_itof_neg_i;             
wire    [31:0]  ex1_itof_src;               
wire            ex1_op_ftoi;                
wire            ex1_op_itof;                
wire    [22:0]  ex1_single_f;               
wire            ex1_special_i_nv;           
wire            ex1_special_nv;             
wire    [7 :0]  ex1_src_e;                  
wire    [22:0]  ex1_src_f;                  
wire            ex1_src_f_0;                
wire            ex1_src_f_cnan;             
wire            ex1_src_f_inf;              
wire            ex1_src_f_qnan;             
wire            ex1_src_f_snan;             
wire            ex1_src_float;              
wire            ex1_src_i;                  
wire            ex1_src_i_sign;             
wire    [31:0]  ex1_src_int;                
wire            ex1_src_is_0;               
wire            ex1_src_neg_shf;            
wire            ex1_src_s;                  
wire            ex1_src_si;                 
wire            ex2_dest_sel_float;         
wire    [8 :0]  ex2_eadder_bias;            
wire    [8 :0]  ex2_eadder_bias1;           
wire    [8 :0]  ex2_expnt;                  
wire            ex2_expnt_add1;             
wire    [8 :0]  ex2_expnt_src1;             
wire    [3 :0]  ex2_expt;                   
wire            ex2_expt_nv;                
wire            ex2_expt_nv_f;              
wire            ex2_expt_nv_i;              
wire            ex2_expt_nx;                
wire            ex2_expt_nx_t;              
wire            ex2_expt_of;                
wire            ex2_expt_uf;                
wire    [31:0]  ex2_float_result;           
wire            ex2_frac_lst;               
wire    [31:0]  ex2_int;                    
wire            ex2_int_lst;                
wire    [32:0]  ex2_int_nm_result;          
wire    [31:0]  ex2_int_result;             
wire    [8 :0]  ex2_norm_expnt;             
wire    [23:0]  ex2_orig_f;                 
wire            ex2_rm_rdn;                 
wire            ex2_rm_rmm;                 
wire            ex2_rm_rne;                 
wire            ex2_rm_rup;                 
wire    [32:0]  ex2_rnd_adder_f_p1;         
wire    [32:0]  ex2_rnd_adder_f_src0;       
wire    [32:0]  ex2_rnd_adder_f_src1;       
wire    [32:0]  ex2_rnd_adder_i_p1;         
wire    [32:0]  ex2_rnd_adder_i_src0;       
wire            ex2_rnd_lst;                
wire            ex2_round_add;              
wire    [31:0]  ex2_si_result;              
wire    [22:0]  ex2_single_f;               
wire    [31:0]  ex2_single_norm_result;     
wire            ex2_single_of;              
wire    [31:0]  ex2_single_result;          
wire            ex2_single_uf;              
wire            ex2_tosi_neg_exp_crit_of;   
wire            ex2_tosi_neg_exp_of;        
wire            ex2_tosi_of;                
wire            ex2_tosi_pos_exp_of;        
wire            ex2_tosi_uf;                
wire    [31:0]  ex2_total_result;           
wire            ex2_toui_exp_of;            
wire            ex2_toui_of;                
wire            ex2_toui_uf;                
wire    [31:0]  ex2_ui_result;              
wire    [32:0]  ex2_uint_nm_result;         
wire            ex2_x_eq_0p5;               
wire            ex2_x_gt_0p5;               
wire            ex2_x_zero;                 
wire            falu_ctrl_xx_ex1_vld;       
wire            falu_ctrl_xx_ex3_vld;       
wire            fcnvt_dest_f;               
wire    [31:0]  fcnvt_ex1_borrow_rslt;      
wire            fcnvt_ex1_borrow_vld;       
wire    [31:0]  fcnvt_ex1_comb_int_rslt;    
wire    [4 :0]  fcnvt_ex1_dp_fflags;        
wire    [31:0]  fcnvt_ex1_dp_special_result; 
wire    [7 :0]  fcnvt_ex1_dp_special_sel;   
wire    [2 :0]  fcnvt_ex1_dp_special_sign;  
wire            fcnvt_ex1_dp_wb_vld;        
wire            fcnvt_ex1_op_ftoi;          
wire            fcnvt_ex1_pipe_clk;         
wire            fcnvt_ex1_pipedown;         
wire    [31:0]  fcnvt_ex1_rslt_rst;         
wire            fcnvt_ex1_rslt_wb_vld;      
wire            fcnvt_ex1_sel;              
wire            fcnvt_ex1_sel_dp;           
wire            fcnvt_ex2_pipe_clk;         
wire            fcnvt_ex2_pipedown;         
wire    [4 :0]  fcnvt_ex3_dp_fflags;        
wire    [31:0]  fcnvt_ex3_dp_rst;           
wire            fcnvt_ex3_dp_wb_vld;        
wire    [4 :0]  fcnvt_ex3_expt;             
wire            fcnvt_ex3_fspu_vld;         
wire    [31:0]  fcnvt_ex3_result;           
wire    [4 :0]  fcnvt_ex3_rtu_fflags;       
wire    [31:0]  fcnvt_ex3_rtu_rst;          
wire            fcnvt_ex3_rtu_wb_vld;       
wire            fcnvt_ex3_sel;              
wire    [31:0]  fcnvt_src0;                 
wire    [31:0]  fspu_ex1_rtu_rst;           
wire            fspu_ex1_rtu_wb_vld;        
wire    [9 :0]  idu_fpu_ex1_func;           
wire    [31:0]  idu_fpu_ex1_srcf0;          
wire    [31:0]  idu_fpu_ex1_srci;           
wire            int_dest_max_si;            
wire            int_dest_max_ui;            
wire            int_dest_min_si;            
wire    [23:0]  itof_dest_single_f;         
wire    [24:0]  itof_dest_single_t;         
wire            single_expnt_add;           
wire            single_norm_f_all_1;        


// &Force("bus", "dp_xx_ex1_cnan", 2, 0); @30
// &Force("bus", "dp_xx_ex1_snan", 2, 0); @31
// &Force("bus", "dp_xx_ex1_qnan", 2, 0); @32
// &Force("bus", "dp_xx_ex1_norm", 2, 0); @33
// &Force("bus", "dp_xx_ex1_zero", 2, 0); @34
// &Force("bus", "dp_xx_ex1_inf", 2, 0); @35
// &Force("bus", "dp_xx_ex1_id", 2, 0); @36
// &Force("bus", "idu_fpu_ex1_func", 9, 0); @37


//==============================================================================
//                     EX1 Operation
//==============================================================================
//------------------------------------------------------------------------------
//                    Interface with idu :
//------------------------------------------------------------------------------
assign ex1_op_ftoi       = idu_fpu_ex1_func[6] || idu_fpu_ex1_func[5];
assign ex1_op_itof       = idu_fpu_ex1_func[3] || idu_fpu_ex1_func[4];
assign ex1_dest_si       = idu_fpu_ex1_func[6];
assign ex1_src_int[31:0] = {32{fcnvt_ex1_sel_dp}} & idu_fpu_ex1_srci[31:0];
assign fcnvt_src0[31:0]  = {32{fcnvt_ex1_sel_dp}} & idu_fpu_ex1_srcf0[31:0];
assign ex1_src_float     = idu_fpu_ex1_func[6] || idu_fpu_ex1_func[5];
assign ex1_dest_float    = |idu_fpu_ex1_func[4:3];
assign ex1_src_si        = idu_fpu_ex1_func[4];
assign ex1_src_i         = idu_fpu_ex1_func[3] || idu_fpu_ex1_func[4];
assign ex1_ia_0          = ~|ex1_src_int[31:0];
assign ex1_src_s         = ex1_src_si ? ex1_src_int[31] : fcnvt_src0[31];

// inf/nan only for float
assign ex1_src_f_inf     = dp_xx_ex1_inf[0];
assign ex1_src_f_qnan    = dp_xx_ex1_qnan[0];
assign ex1_src_f_cnan    = dp_xx_ex1_cnan[0];
assign ex1_src_f_snan    = dp_xx_ex1_snan[0];
assign ex1_src_f_0       = dp_xx_ex1_zero[0];
assign ex1_src_e[7:0]    = fcnvt_src0[30:23];
assign ex1_exp_bias[8:0] = 9'h181; // -127

//float or int equal 0
assign ex1_src_is_0       = ex1_src_f_0 && ex1_src_float || ex1_ia_0 && ex1_src_i;
assign ex1_single_f[22:0] = fcnvt_src0[22:0];


//------------------------------------------------------------------------------
//                    expnt adjust:
//------------------------------------------------------------------------------
assign ex1_e_without_bias[8:0] = {1'b0, ex1_src_e[7:0]} + ex1_exp_bias[8:0];


//------------------------------------------------------------------------------
//                    EX1 FTOI Path:
//------------------------------------------------------------------------------
//In FTOI, generate int and tail, shift by ex1_e_without_bias
//Corner: when  ex1_e_without_bias == -1, round bits is different with other
//case
assign ex1_src_f[22:0]      = ex1_single_f[22:0];
assign ex1_ftoi_trans[23:0] = {~ex1_src_is_0, ex1_src_f[22:0]};

// &Instance("pa_fcnvt_ftoi_s","x_pa_fcnvt_ftoi_s"); @87
pa_fcnvt_ftoi_s  x_pa_fcnvt_ftoi_s (
  .fsh_cnt                 (ex1_e_without_bias[5:0]),
  .fsh_i_v_nm              (ex1_fsh_i_v_nm         ),
  .fsh_i_x_nm              (ex1_fsh_i_x_nm         ),
  .fsh_src                 (ex1_ftoi_trans         )
);

// &Connect( @88
//           .fsh_cnt    (ex1_e_without_bias[5:0]), @89
//           .fsh_src    (ex1_ftoi_trans), @90
//           .fsh_i_v_nm (ex1_fsh_i_v_nm), @91
//           .fsh_i_x_nm (ex1_fsh_i_x_nm) @92
//         ); @93

assign ex1_ftoi_int[31:0]      = ex1_e_without_bias[8] ? 32'b0 : ex1_fsh_i_v_nm[31:0];
assign ex1_ftoi_int_tail[24:0] = ex1_e_without_bias[8] && ex1_e_without_bias[7:0] != 8'hff ? {1'b0,ex1_ftoi_trans[23:0]}
                                                                                           :  ex1_fsh_i_x_nm[24:0];
assign ex1_src_i_sign          = idu_fpu_ex1_srci[31];


//------------------------------------------------------------------------------
//                    EX1 ITOF Path:
//------------------------------------------------------------------------------
//In ITOF, if dest is single, need rounding
assign ex1_src_neg_shf      = ex1_src_i_sign && ex1_src_si;
assign ex1_itof_neg_i[31:0] = ~ex1_src_int[31:0] + 32'b1;
assign ex1_itof_src[31:0]   = ex1_src_neg_shf ? ex1_itof_neg_i[31:0] : ex1_src_int[31:0];
// &Instance("pa_fcnvt_itof_s","x_pa_fcnvt_itof_s"); @108
pa_fcnvt_itof_s  x_pa_fcnvt_itof_s (
  .ff1_sh_cnt     (ex1_ff1_d_cnt ),
  .ff1_sh_f_v     (ex1_ff1_sh_f_v),
  .ff1_sh_src     (ex1_itof_src  )
);

// &Connect( @109
//           .ff1_sh_src       (ex1_itof_src     ),     // input data @110
//           .ff1_sh_cnt       (ex1_ff1_d_cnt    ),     // find fist 1 @111
//           .ff1_sh_f_v       (ex1_ff1_sh_f_v   )      // output frac @112
//         ); @113


// i to f: f is frac of float, and t is for rounding
assign itof_dest_single_f[23:0] = {ex1_ff1_sh_f_v[31:8]};
assign itof_dest_single_t[24:0] = {ex1_ff1_sh_f_v[7:0], 17'b0};

assign ex1_itof_expnt[8:0]      = {4'b0, ex1_ff1_d_cnt[4:0]};
assign ex1_itof_dest_frac[23:0] = itof_dest_single_f[23:0];
assign ex1_itof_dest_tail[24:0] = itof_dest_single_t[24:0];


//------------------------------------------------------------------------------
//                    EX1 final result:
//------------------------------------------------------------------------------
assign ex1_final_frac[23:0]   = ex1_itof_dest_frac[23:0];
assign ex1_final_tail_t[24:0] = ex1_op_itof ? ex1_itof_dest_tail[24:0]
                                            : 25'b0;
// merge dest int and float result
assign ex1_final_tail[24:0] = ex1_op_ftoi ? ex1_ftoi_int_tail[24:0] : ex1_final_tail_t[24:0];
assign ex1_final_exp[8:0]   = ex1_op_itof ? ex1_itof_expnt[8:0] : ex1_e_without_bias[8:0];
// merge dest float expnt and dest int
assign ex1_final_sign       = ex1_src_s && !(ex1_src_float && !ex1_dest_float && ex1_src_is_0
                                                           || !ex1_src_float  && !ex1_src_si);


//------------------------------------------------------------------------------
//                    EX1 special result:
//------------------------------------------------------------------------------
//In fcnvt single, here is no float to float convert, so it is impossiblt to
//generate special float result
assign fcnvt_ex1_dp_wb_vld               = 1'b0;
assign fcnvt_ex1_dp_fflags[4:0]          = 5'b0;
assign fcnvt_ex1_dp_special_sel[7:0]     = 8'b0;
assign fcnvt_ex1_dp_special_sign[2:0]    = 3'b0;
assign fcnvt_ex1_dp_special_result[31:0] = 32'b0;

//f to i
//max, min, 0
// &CombBeg; @152
always @( ex1_src_f_qnan
       or ex1_src_f_inf
       or ex1_src_f_snan
       or ex1_src_s)
begin
if(ex1_src_f_snan)
  ex1_special_sel_2[2:0] = {1'b1, 2'b0};       // max
else if(ex1_src_f_qnan)
  ex1_special_sel_2[2:0] = {1'b1, 2'b0};       // max
else if(ex1_src_f_inf && ex1_src_s)
  ex1_special_sel_2[2:0] = {1'b0, 1'b1, 1'b0}; // min
else if(ex1_src_f_inf && !ex1_src_s)
  ex1_special_sel_2[2:0] = {1'b1, 2'b0};       // max
else //if(ex1_src_f_0)
  ex1_special_sel_2[2:0] = {2'b0, 1'b1};       // 0
// &CombEnd; @163
end

assign ex1_ftosi_max[31:0] = {1'b0, 31'h7fffffff};
assign ex1_ftosi_min[31:0] = {1'b1, 31'b0};
assign ex1_ftoi_0[31:0]    = 32'b0;
assign ex1_ftoui_max[31:0] = 32'hffffffff;
assign ex1_ftoui_min[31:0] = 32'b0;
assign ex1_ftoi_min[31:0]  = ex1_dest_si ? ex1_ftosi_min[31:0] : ex1_ftoui_min[31:0];
assign ex1_ftoi_max[31:0]  = ex1_dest_si ? ex1_ftosi_max[31:0] : ex1_ftoui_max[31:0];

assign ex1_ftoi_specail[31:0] = {32{ex1_special_sel_2[2]}}  & ex1_ftoi_max[31:0] |
                                {32{ex1_special_sel_2[1]}}  & ex1_ftoi_min[31:0] |
                                {32{ex1_special_sel_2[0]}}  & ex1_ftoi_0[31:0];
assign ex1_special_i_nv       = ex1_src_f_snan || ex1_src_f_qnan || ex1_src_f_inf;


//------------------------------------------------------------------------------
//                    EX1 int result rename for output:
//------------------------------------------------------------------------------
assign fcnvt_ex1_rslt_rst[31:0] = ex1_ftoi_specail[31:0];
//assign fcnvt_ex1_rtu_fflags[4:0] = {ex1_special_i_nv, 4'b0};
assign fcnvt_ex1_rslt_wb_vld = ex1_op_ftoi && (ex1_src_f_snan || ex1_src_f_cnan || ex1_src_f_qnan || ex1_src_f_inf || ex1_src_f_0)
                              && fcnvt_ex1_sel && falu_ctrl_xx_ex1_vld;
assign fcnvt_ex1_borrow_vld        = fcnvt_ex1_rslt_wb_vld | fspu_ex1_rtu_wb_vld;
assign fcnvt_ex1_borrow_rslt[31:0] = fspu_ex1_rtu_wb_vld ? fspu_ex1_rtu_rst[31:0]
                                                         : fcnvt_ex1_rslt_rst[31:0];
assign fcnvt_ex1_comb_int_rslt[31:0] = fcnvt_ex1_borrow_vld ? fcnvt_ex1_borrow_rslt[31:0]
                                                            : ex1_ftoi_int[31:0];
assign ex1_special_nv                = fspu_ex1_rtu_wb_vld ? 1'b0 
                                                           : ex1_special_i_nv;
//Output for icg
assign fcnvt_ex1_op_ftoi = ex1_op_ftoi;
assign fcnvt_dest_f      = ex1_dest_float;

//------------------------------------------------------------------------------
//                    EX1 pipedown to EX2:
//------------------------------------------------------------------------------
always @(posedge fcnvt_ex1_pipe_clk)
begin
  if(fcnvt_ex1_pipedown) begin
    ex2_tail[24:0]  <= ex1_final_tail[24:0];
    ex2_sign        <= ex1_final_sign;
    ex2_dest_float  <= ex1_dest_float;
    ex2_dest_si     <= ex1_dest_si;
    ex2_src_is_0    <= ex1_src_is_0;
    ex2_exp[8:0]    <= ex1_final_exp[8:0];
    ex2_special_nv  <= ex1_special_nv;
    ex2_special_vld <= fcnvt_ex1_borrow_vld;
    ex2_fspu_vld    <= fspu_ex1_rtu_wb_vld;
  end
end

always @(posedge fcnvt_ex1_pipe_clk)
begin
  if(fcnvt_ex1_pipedown && (fcnvt_ex1_op_ftoi || fcnvt_ex1_borrow_vld) || ctrl_xx_ex1_warm_up ) begin
    ex2_int_r[31:0] <= fcnvt_ex1_comb_int_rslt[31:0];
  end
end

always @(posedge fcnvt_ex1_pipe_clk)
begin
  if(fcnvt_ex1_pipedown && fcnvt_dest_f || ctrl_xx_ex1_warm_up) begin
    ex2_frac[23:0]  <= ex1_final_frac[23:0];
  end
end

//==============================================================================
//                                EX2  Operation:
//==============================================================================
assign ex2_expnt[8:0] = ex2_exp[8:0];
assign ex2_int[31:0]  = ex2_int_r[31:0];
assign ex2_rm_rne     = dp_xx_ex2_rm[2:0] == 3'b000;
assign ex2_rm_rup     = dp_xx_ex2_rm[2:0] == 3'b011;
assign ex2_rm_rdn     = dp_xx_ex2_rm[2:0] == 3'b010;
assign ex2_rm_rmm     = dp_xx_ex2_rm[2:0] == 3'b100;

//frac rounding
assign ex2_x_zero     = ~|ex2_tail[24:0];
assign ex2_x_eq_0p5   = ex2_tail[24] && (~|ex2_tail[23:0]);
assign ex2_x_gt_0p5   = ex2_tail[24] && (|ex2_tail[23:0]);


//------------------------------------------------------------------------------
//                                EX2 rounding:
//------------------------------------------------------------------------------
assign ex2_int_lst   = ex2_int[0];
assign ex2_frac_lst  = ex2_frac[0];
assign ex2_rnd_lst   = ex2_dest_float  ? ex2_frac_lst : ex2_int_lst;

assign ex2_round_add = (ex2_rm_rup  && !ex2_sign && (!ex2_x_zero))      ||
                       (ex2_rm_rdn  && ex2_sign  && (!ex2_x_zero))      ||
                       (ex2_rm_rmm) && (ex2_x_gt_0p5 || ex2_x_eq_0p5)   ||
                       (ex2_rm_rne  && (ex2_x_gt_0p5 || (ex2_x_eq_0p5 && ex2_rnd_lst)));  // round add 1


assign ex2_rnd_adder_f_src0[32:0] = ex2_dest_float ? {9'b0, ex2_frac[23:0]} : {ex2_rnd_adder_i_src0[32:0]};
assign ex2_rnd_adder_f_src1[32:0] = 33'b1;
assign ex2_rnd_adder_f_p1[32:0]   = ex2_rnd_adder_f_src0[32:0] + ex2_rnd_adder_f_src1[32:0];
assign ex2_rnd_adder_i_p1[32:0]   = ex2_rnd_adder_f_p1[32:0];

assign ex2_rnd_adder_i_src0[32:0] = ex2_dest_si && ex2_sign ? {1'b1, ~ex2_int[31:0]}
                                                            : {1'b0, ex2_int[31:0]};

assign ex2_orig_f[23:0]   = ex2_frac[23:0];
assign ex2_single_f[22:0] = ex2_round_add ? ex2_rnd_adder_f_p1[22:0] : ex2_orig_f[22:0];


//------------------------------------------------------------------------------
//                               EX2 normal result:
//------------------------------------------------------------------------------
// int normal result
assign ex2_int_nm_result[32:0]  = ex2_sign ^ ex2_round_add ? ex2_rnd_adder_i_p1[32:0]
                                                           : ex2_rnd_adder_i_src0[32:0];
assign ex2_uint_nm_result[32:0] = (ex2_round_add ? ex2_rnd_adder_i_p1[32:0]
                                                 : ex2_rnd_adder_i_src0[32:0]) & {33{!ex2_sign}};

assign ex2_eadder_bias[8:0]  = 9'd127;
assign ex2_eadder_bias1[8:0] = 9'd128;


assign ex2_expnt_add1        = single_expnt_add;
assign ex2_expnt_src1[8:0]   = ex2_expnt_add1 ? ex2_eadder_bias1[8:0] : ex2_eadder_bias[8:0];
assign ex2_norm_expnt[8:0]   = ex2_expnt[8:0] + ex2_expnt_src1[8:0];
//assign ex2_single_denorm         = ex2_norm_expnt[8];

// normal result
//assign ex2_double_norm_result[63:0]    = {ex2_sign, ex2_norm_expnt[10:0], ex2_double_f[51:0]};
assign ex2_single_norm_result[31:0] = {ex2_sign, ex2_norm_expnt[7:0], ex2_single_f[22:0]};


//------------------------------------------------------------------------------
//                                EX2 exception:
//------------------------------------------------------------------------------
//1. Dest is Int:
//NV : 1. the float number is out of range of int
//NX : 1. tail is not zero
//2. Int to Float
//NX : 1. tail is not zero
//3. Double to Single
//NX : 1. tail is not zero
//     2. of
//     3. uf
//OF : 1. input is not nan or inf, and e > 8'b11111110
//UF : 1. input is not zero, and e < 381

// Dest is float
assign single_norm_f_all_1 = &ex2_frac[22:0];
assign single_expnt_add    = single_norm_f_all_1 && ex2_round_add;

assign ex2_single_of       = 1'b0;
assign ex2_single_uf       = 1'b0;

assign ex2_expt_of = ex2_single_of;
assign ex2_expt_uf = ex2_single_uf;
assign ex2_expt_nx_t = !ex2_x_zero; // including int nx

assign ex2_expt_nv_f = 1'b0;

// Dest is int
assign ex2_tosi_pos_exp_of          = !ex2_expnt[8] && (ex2_expnt[7:0] > 8'd30);
assign ex2_tosi_neg_exp_of          = !ex2_expnt[8] && (ex2_expnt[7:0] > 8'd31);
assign ex2_tosi_neg_exp_crit_of     =  ex2_expnt[8:0] == 9'd31;

assign ex2_tosi_of = ex2_dest_si && !ex2_sign && (ex2_tosi_pos_exp_of || ex2_int_nm_result[31]);
assign ex2_tosi_uf = ex2_dest_si && ex2_sign && (ex2_tosi_neg_exp_of || ex2_tosi_neg_exp_crit_of && !ex2_int_nm_result[31]);


assign ex2_toui_exp_of      = !ex2_expnt[8] && (ex2_expnt[7:0] > 8'd31);
assign ex2_toui_of          = !ex2_dest_si && !ex2_sign && (ex2_toui_exp_of || ex2_uint_nm_result[32]);
assign ex2_toui_uf          = !ex2_dest_si && ex2_sign && (!ex2_expnt[8] || ex2_round_add);

assign ex2_expt_nv_i        =  ex2_tosi_of || ex2_tosi_uf ||
                               ex2_toui_of || ex2_toui_uf;
assign ex2_expt_nv          = !ex2_dest_float && ex2_expt_nv_i || ex2_expt_nv_f;

// Finally, NX expt, here nx_t include uf
assign ex2_expt_nx          = !ex2_expt_nv && (ex2_expt_of || ex2_expt_nx_t);
assign ex2_expt[3:0]        = ex2_special_vld ? {ex2_special_nv,3'b0}
                                             : {ex2_expt_nv, ex2_expt_of, ex2_expt_uf, ex2_expt_nx};


//------------------------------------------------------------------------------
//                                EX2 special result:
//------------------------------------------------------------------------------
assign ex2_single_result[31:0] = ex2_src_is_0 ? 32'b0 : ex2_single_norm_result[31:0];


//------------------------------------------------------------------------------
//                                EX2 Merge final results:
//------------------------------------------------------------------------------
assign ex2_float_result[31:0] = ex2_single_result[31:0];
//int result
assign int_dest_max_si        = ex2_dest_si && (ex2_tosi_of);
assign int_dest_min_si        = ex2_dest_si && ex2_tosi_uf;

assign ex2_si_result[31:0]    = int_dest_max_si ? {1'b0,{31{1'b1}}} :
                                int_dest_min_si ? {1'b1,31'b0}
                                                  : ex2_int_nm_result[31:0];

assign int_dest_max_ui        = !ex2_dest_si && (ex2_toui_of);
assign ex2_ui_result[31:0]    = int_dest_max_ui ? {32{1'b1}} :
                                 ex2_toui_uf     ? {32{1'b0}}
                                                 : ex2_uint_nm_result[31:0];
assign ex2_int_result[31:0]   = ex2_special_vld ? ex2_int_r[31:0] :
                                ex2_dest_si ? ex2_si_result[31:0]
                                             : ex2_ui_result[31:0];

assign ex2_dest_sel_float     = ex2_dest_float ;
assign ex2_total_result[31:0] = ex2_dest_sel_float 
                                 & ~ex2_special_vld ? ex2_float_result[31:0]
                                                    : ex2_int_result[31:0];


//------------------------------------------------------------------------------
//                                EX2 pipedown to EX3:
//------------------------------------------------------------------------------
always @(posedge fcnvt_ex2_pipe_clk)
begin
  if(fcnvt_ex2_pipedown)
  begin
    ex3_expt[3:0]      <= ex2_expt[3:0];
    ex3_result[31:0]   <= ex2_total_result[31:0];
    ex3_dest_float     <= ex2_dest_float;
    ex3_special_vld    <= ex2_special_vld;
    ex3_fspu_vld       <= ex2_fspu_vld;
  end
end


assign fcnvt_ex3_result[31:0]   = ex3_result[31:0];
assign fcnvt_ex3_expt[4:0]      = {ex3_expt[3], 1'b0, ex3_expt[2:0]};


//------------------------------------------------------------------------------
//                            EX3 float result rename for output:
//------------------------------------------------------------------------------
assign fcnvt_ex3_dp_fflags[4:0] = fcnvt_ex3_expt[4:0];
assign fcnvt_ex3_dp_rst[31:0]   = fcnvt_ex3_result[31:0];
assign fcnvt_ex3_dp_wb_vld      = ex3_dest_float && ~ex3_special_vld && fcnvt_ex3_sel && falu_ctrl_xx_ex3_vld;
assign fcnvt_ex3_fspu_vld         = ex3_fspu_vld;
//------------------------------------------------------------------------------
//                            EX3 int result rename for output:
//------------------------------------------------------------------------------
assign fcnvt_ex3_rtu_fflags[4:0] = fcnvt_ex3_expt[4:0];
assign fcnvt_ex3_rtu_rst[31:0]   = fcnvt_ex3_result[31:0];
assign fcnvt_ex3_rtu_wb_vld      = (!ex3_dest_float & ~ex3_special_vld | ex3_special_vld) && fcnvt_ex3_sel && falu_ctrl_xx_ex3_vld;



// &ModuleEnd; @483
endmodule


