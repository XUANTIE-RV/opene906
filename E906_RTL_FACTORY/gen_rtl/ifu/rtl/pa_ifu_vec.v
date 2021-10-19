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
module pa_ifu_vec(
  cp0_ifu_icg_en,
  cp0_ifu_mtvec,
  cp0_ifu_rst_inv_done,
  cp0_yy_clk_en,
  cpurst_b,
  dtu_ifu_halt_on_reset,
  forever_cpuclk,
  ifetch_vec_acc_err,
  ifetch_vec_cmplt,
  ifetch_vec_grant,
  ifetch_vec_idle,
  ifu_clic_warm_up,
  ifu_cp0_rst_inv_req,
  ifu_cp0_vec_err,
  ifu_cp0_vec_succeed,
  ifu_cp0_warm_up,
  ifu_fpu_warm_up,
  ifu_idu_warm_up,
  ifu_iu_reset_vld,
  ifu_iu_warm_up,
  ifu_lsu_warm_up,
  ifu_rtu_reset_halt_req,
  ifu_rtu_warm_up,
  ifu_sysmap_rst_sample,
  ifu_xx_in_warm_up,
  pad_yy_icg_scan_en,
  rtu_ifu_lockup_expt_vld,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vld,
  rtu_yy_xx_int_hv,
  rtu_yy_xx_tail_int_vld,
  sysio_ifu_rst_addr_done,
  vec_ctrl_reset_mask,
  vec_ctrl_seq_mask,
  vec_ibuf_warm_up,
  vec_ifetch_data_fetch,
  vec_ipack_inst_mask,
  vec_pcgen_chgflw_vld,
  vec_pcgen_idle,
  vec_pcgen_inst_fetch,
  vec_pcgen_iu_chgflw,
  vec_pcgen_pc_flop,
  vec_pcgen_rst_vld,
  vec_pcgen_tar_pc,
  vec_top_cur_st
);

// &Ports; @24
input           cp0_ifu_icg_en;         
input   [31:0]  cp0_ifu_mtvec;          
input           cp0_ifu_rst_inv_done;   
input           cp0_yy_clk_en;          
input           cpurst_b;               
input           dtu_ifu_halt_on_reset;  
input           forever_cpuclk;         
input           ifetch_vec_acc_err;     
input           ifetch_vec_cmplt;       
input           ifetch_vec_grant;       
input           ifetch_vec_idle;        
input           pad_yy_icg_scan_en;     
input           rtu_ifu_lockup_expt_vld; 
input           rtu_yy_xx_dbgon;        
input           rtu_yy_xx_expt_int;     
input           rtu_yy_xx_expt_vld;     
input           rtu_yy_xx_int_hv;       
input           rtu_yy_xx_tail_int_vld; 
input           sysio_ifu_rst_addr_done; 
output          ifu_clic_warm_up;       
output          ifu_cp0_rst_inv_req;    
output          ifu_cp0_vec_err;        
output          ifu_cp0_vec_succeed;    
output          ifu_cp0_warm_up;        
output          ifu_fpu_warm_up;        
output          ifu_idu_warm_up;        
output          ifu_iu_reset_vld;       
output          ifu_iu_warm_up;         
output          ifu_lsu_warm_up;        
output          ifu_rtu_reset_halt_req; 
output          ifu_rtu_warm_up;        
output          ifu_sysmap_rst_sample;  
output          ifu_xx_in_warm_up;      
output          vec_ctrl_reset_mask;    
output          vec_ctrl_seq_mask;      
output          vec_ibuf_warm_up;       
output          vec_ifetch_data_fetch;  
output          vec_ipack_inst_mask;    
output          vec_pcgen_chgflw_vld;   
output          vec_pcgen_idle;         
output          vec_pcgen_inst_fetch;   
output          vec_pcgen_iu_chgflw;    
output          vec_pcgen_pc_flop;      
output          vec_pcgen_rst_vld;      
output  [31:0]  vec_pcgen_tar_pc;       
output  [3 :0]  vec_top_cur_st;         

// &Regs; @25
reg     [3 :0]  vec_cur_state;          
reg     [3 :0]  vec_next_state;         
reg             vector_rst_inv_ff;      
reg     [2 :0]  warm_up_cnt;            

// &Wires; @26
wire            cp0_ifu_icg_en;         
wire    [31:0]  cp0_ifu_mtvec;          
wire            cp0_ifu_rst_inv_done;   
wire            cp0_yy_clk_en;          
wire            cpurst_b;               
wire            dtu_ifu_halt_on_reset;  
wire            forever_cpuclk;         
wire            ifetch_vec_acc_err;     
wire            ifetch_vec_cmplt;       
wire            ifetch_vec_grant;       
wire            ifetch_vec_idle;        
wire            ifu_clic_warm_up;       
wire            ifu_cp0_rst_inv_req;    
wire            ifu_cp0_vec_err;        
wire            ifu_cp0_vec_succeed;    
wire            ifu_cp0_warm_up;        
wire            ifu_fpu_warm_up;        
wire            ifu_idu_warm_up;        
wire            ifu_iu_reset_vld;       
wire            ifu_iu_warm_up;         
wire            ifu_lsu_warm_up;        
wire            ifu_rtu_reset_halt_req; 
wire            ifu_rtu_warm_up;        
wire            ifu_sysmap_rst_sample;  
wire            ifu_xx_in_warm_up;      
wire            ifu_xx_warm_up_clk;     
wire            pad_yy_icg_scan_en;     
wire            rtu_ifu_lockup_expt_vld; 
wire            rtu_yy_xx_dbgon;        
wire            rtu_yy_xx_expt_int;     
wire            rtu_yy_xx_expt_vld;     
wire            rtu_yy_xx_int_hv;       
wire            rtu_yy_xx_tail_int_vld; 
wire            sysio_ifu_rst_addr_done; 
wire    [31:0]  vec_chgflw_pc;          
wire            vec_chgflw_vld;         
wire            vec_ctrl_reset_mask;    
wire            vec_ctrl_seq_mask;      
wire            vec_data_fetch;         
wire            vec_err_occur;          
wire            vec_ibuf_warm_up;       
wire            vec_ifetch_data_fetch;  
wire            vec_inst_fetch;         
wire            vec_ipack_inst_mask;    
wire            vec_pc_flop;            
wire            vec_pcgen_chgflw_vld;   
wire            vec_pcgen_idle;         
wire            vec_pcgen_inst_fetch;   
wire            vec_pcgen_iu_chgflw;    
wire            vec_pcgen_pc_flop;      
wire            vec_pcgen_rst_vld;      
wire    [31:0]  vec_pcgen_tar_pc;       
wire            vec_rst_inv_req;        
wire            vec_seq_mask;           
wire            vec_sm_clk;             
wire            vec_sm_clk_en;          
wire            vec_sm_idle;            
wire            vec_sm_pcload;          
wire            vec_sm_reset;           
wire            vec_sm_vec_cmpt;        
wire            vec_sm_vec_err;         
wire            vec_sm_vec_pcg;         
wire            vec_sm_vec_prep;        
wire            vec_sm_vec_req;         
wire            vec_sm_vec_wfc;         
wire            vec_sm_warm_up;         
wire    [3 :0]  vec_top_cur_st;         
wire            vec_warm_up_clk_en;     
wire            warm_up_cnt_done;       


//==========================================================
// Branch History Table Module
// 1. Instance ICG Cell
// 2. Vector FSM
// 3. Reset Invalid Control
// 4. Generate Change Flow for non-vec and vec pc fetch
// 5. Generate vec table data fetch
// 6. Vector Error Handling
//==========================================================

//------------------------------------------------
// 1. Instance ICG Cell
//------------------------------------------------
assign vec_sm_clk_en = rtu_yy_xx_expt_vld
                    | rtu_yy_xx_tail_int_vld
                    | ~vec_sm_idle
                    | rtu_yy_xx_dbgon
                    | vector_rst_inv_ff;

// &Instance("gated_clk_cell","x_ifu_vec_sm_clk"); @47
gated_clk_cell  x_ifu_vec_sm_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vec_sm_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (vec_sm_clk_en     ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in      (forever_cpuclk), @48
//           .clk_out     (vec_sm_clk), @49
//           .external_en (1'b0), @50
//           .global_en   (cp0_yy_clk_en), @51
//           .local_en    (vec_sm_clk_en), @52
//           .module_en   (cp0_ifu_icg_en) @53
//         ); @54

assign vec_warm_up_clk_en = vec_sm_warm_up;
// &Instance("gated_clk_cell","x_ifu_warm_up_clk"); @57
gated_clk_cell  x_ifu_warm_up_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ifu_xx_warm_up_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (vec_warm_up_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in      (forever_cpuclk), @58
//           .clk_out     (ifu_xx_warm_up_clk), @59
//           .external_en (1'b0), @60
//           .global_en   (cp0_yy_clk_en), @61
//           .local_en    (vec_warm_up_clk_en), @62
//           .module_en   (cp0_ifu_icg_en) @63
//         ); @64

//------------------------------------------------
// 2. Vector FSM
// a. parameter define
// b. FSM implemetation
// c. FSM state signals
//------------------------------------------------

// a. parameter define
parameter RESET    = 4'b0001;
parameter IDLE     = 4'b0000;
parameter PC_LOAD  = 4'b0010;
parameter VEC_LOAD = 4'b0011;
parameter VEC_PREP = 4'b0100;
parameter VEC_PCG  = 4'b1100;
parameter VEC_REQ  = 4'b0101;
parameter VEC_WFC  = 4'b0110;
parameter VEC_CMPT = 4'b0111;
parameter VEC_ERR  = 4'b1000;
parameter WARM_UP  = 4'b1001;
parameter HALT     = 4'b1010;

// b. FSM implemetation
// State Description:
// RESET    : Reset logic, for memory initial invalidation
// IDLE     : Wait for rtu expt signal & send physical address req
// PC_LOAD  : Deal with NON-VEC expt and Vector-INT inst fetch
// VEC_PREP : Vector table address acquire prepare
// VEC_PCG  : Vector table address sync pcgen
// VEC_REQ  : Vector table address acquire request
// VEC_WFC  : Vector table address result waiting
// VEC_CMPT : Vector table address complete and start fetching inst.
// VEC_ERR  : Vector table address error handling

always @(posedge vec_sm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    vec_cur_state[3:0] <= RESET;
  else if(rtu_yy_xx_dbgon)
    vec_cur_state[3:0] <= IDLE;
  else
    vec_cur_state[3:0] <= vec_next_state[3:0];
end

// &CombBeg; @109
always @( vec_cur_state[3:0]
       or rtu_yy_xx_tail_int_vld
       or rtu_yy_xx_expt_vld
       or warm_up_cnt_done
       or sysio_ifu_rst_addr_done
       or dtu_ifu_halt_on_reset
       or ifetch_vec_grant
       or rtu_yy_xx_int_hv
       or rtu_ifu_lockup_expt_vld
       or cp0_ifu_rst_inv_done
       or rtu_yy_xx_expt_int
       or ifetch_vec_acc_err
       or ifetch_vec_idle
       or ifetch_vec_cmplt)
begin
case(vec_cur_state[3:0])
  RESET: 
    if(cp0_ifu_rst_inv_done & sysio_ifu_rst_addr_done)
      vec_next_state[3:0] = WARM_UP;
    else
      vec_next_state[3:0] = RESET;
  WARM_UP: 
    if(warm_up_cnt_done)
      if(dtu_ifu_halt_on_reset)
        vec_next_state[3:0] = HALT;
      else
        vec_next_state[3:0] = IDLE;
    else
      vec_next_state[3:0] = WARM_UP;
  HALT: 
    vec_next_state[3:0] = IDLE;
  IDLE: 
    if(rtu_yy_xx_expt_vld & ~rtu_ifu_lockup_expt_vld)
      if(rtu_yy_xx_expt_int & rtu_yy_xx_int_hv)
        vec_next_state[3:0] = VEC_PREP;
      else
        vec_next_state[3:0] = PC_LOAD;
    else if(rtu_yy_xx_tail_int_vld)
      if(rtu_yy_xx_int_hv)
        vec_next_state[3:0] = VEC_PREP;
      else
        vec_next_state[3:0] = PC_LOAD;
    else
      vec_next_state[3:0] = IDLE;
  PC_LOAD: 
    vec_next_state[3:0] = IDLE;
  VEC_PREP: 
    if(ifetch_vec_idle)
      vec_next_state[3:0] = VEC_PCG;
    else
      vec_next_state[3:0] = VEC_PREP;
  VEC_PCG: 
    vec_next_state[3:0] = VEC_REQ;
  VEC_REQ: 
    if(ifetch_vec_grant)
      vec_next_state[3:0] = VEC_WFC;
    else
      vec_next_state[3:0] = VEC_REQ;
  VEC_WFC: 
    if(ifetch_vec_cmplt)
      if(ifetch_vec_acc_err)
        vec_next_state[3:0] = VEC_ERR;
      else
        vec_next_state[3:0] = VEC_CMPT;
    else
      vec_next_state[3:0] = VEC_WFC;
  VEC_CMPT:
    vec_next_state[3:0] = IDLE;
  VEC_ERR: 
    vec_next_state[3:0] = IDLE;
  default:
    vec_next_state[3:0] = IDLE;
endcase
// &CombEnd; @175
end

// c. FSM state signals
assign vec_sm_reset    = vec_cur_state[3:0] == RESET;
assign vec_sm_warm_up  = vec_cur_state[3:0] == WARM_UP;
assign vec_sm_idle     = vec_cur_state[3:0] == IDLE;
assign vec_sm_pcload   = vec_cur_state[3:0] == PC_LOAD;
assign vec_sm_vec_prep = vec_cur_state[3:0] == VEC_PREP;
assign vec_sm_vec_pcg  = vec_cur_state[3:0] == VEC_PCG;
assign vec_sm_vec_req  = vec_cur_state[3:0] == VEC_REQ;
assign vec_sm_vec_wfc  = vec_cur_state[3:0] == VEC_WFC;
assign vec_sm_vec_cmpt = vec_cur_state[3:0] == VEC_CMPT;
assign vec_sm_vec_err  = vec_cur_state[3:0] == VEC_ERR;
          
//------------------------------------------------
// 3. Reset Invalid Control
//------------------------------------------------
// record reset state to generation a pulse req
always @(posedge vec_sm_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    vector_rst_inv_ff <= 1'b0;
  else
    vector_rst_inv_ff <= vec_sm_reset;
end

assign vec_rst_inv_req = vec_sm_reset & ~vector_rst_inv_ff;

always @(posedge ifu_xx_warm_up_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    warm_up_cnt[2:0] <= 3'b0;
  else if(vec_sm_warm_up)
    warm_up_cnt[2:0] <= warm_up_cnt[2:0] + 3'b1;
  else
    warm_up_cnt[2:0] <= warm_up_cnt[2:0];
end

assign warm_up_cnt_done = warm_up_cnt[2:0] == 3'b111;

//------------------------------------------------
// 4. Generate Change Flow for non-vec and vec pc fetch
//------------------------------------------------
// chgflw vld when expt vld or pc load or vector error
assign vec_chgflw_vld      = vec_sm_pcload;
assign vec_chgflw_pc[31:0] = cp0_ifu_mtvec[31:0];

//------------------------------------------------
// 5. Generate vec table data fetch
// a. Update pcgen addr flop on vector prepare
// b. Mask ibuf inst fetch on vector prepare
// c. Date fetch request on vector request
// d. Flop chgflw pc on vector complete
// e. Vec Error Occur
//------------------------------------------------

// a. Update pcgen addr flop
//assign vec_addr_updt  = vec_sm_vec_req ;

// b. Mask ibuf sequential inst fetch
assign vec_seq_mask   = vec_sm_vec_req | vec_sm_vec_wfc | vec_sm_vec_prep | vec_sm_vec_pcg;

// c. Date fetch request on vector request
assign vec_data_fetch = vec_sm_vec_req;

// d. Flop chgflw pc on vector complete
assign vec_pc_flop    = vec_sm_vec_wfc & ifetch_vec_cmplt   
                     & ~ifetch_vec_acc_err;

// e. Chgflw pc to bju pcgen and fetch inst.
assign vec_inst_fetch = vec_sm_vec_cmpt;

// e. Vec Error Occur
assign vec_err_occur  = vec_sm_vec_wfc & ifetch_vec_cmplt
                     & ifetch_vec_acc_err;

//==========================================================
// Rename for Output
//==========================================================

// Output to pcgen
assign vec_pcgen_iu_chgflw    = vec_chgflw_vld | vec_inst_fetch
                             | vec_sm_vec_err;

assign vec_pcgen_chgflw_vld   = vec_chgflw_vld | vec_sm_vec_pcg
                             | vec_sm_vec_err;
//assign vec_pcgen_addr_updt    = vec_addr_updt;
assign vec_pcgen_inst_fetch   = vec_inst_fetch;
assign vec_pcgen_pc_flop      = vec_pc_flop;
assign vec_pcgen_rst_vld      = vec_sm_reset;
assign vec_pcgen_tar_pc[31:0] = vec_chgflw_pc[31:0];
assign vec_pcgen_idle         = vec_sm_idle;

// Output to ctrl
assign vec_ctrl_reset_mask    = vec_sm_reset | vec_sm_warm_up;
assign vec_ctrl_seq_mask      = vec_seq_mask;

// Output to ifetch
assign vec_ifetch_data_fetch  = vec_data_fetch;

// Output to ibuf
assign vec_ibuf_warm_up       = vec_sm_warm_up;

// Output to vec
assign vec_ipack_inst_mask    = vec_seq_mask;

// Output to top
assign vec_top_cur_st[3:0]    = vec_cur_state[3:0];

// Output to idu
assign ifu_idu_warm_up        = vec_sm_warm_up;
assign ifu_iu_warm_up         = vec_sm_warm_up;
assign ifu_lsu_warm_up        = vec_sm_warm_up;
assign ifu_cp0_warm_up        = vec_sm_warm_up;
assign ifu_rtu_warm_up        = vec_sm_warm_up;
assign ifu_clic_warm_up       = vec_sm_warm_up;

// Output to IU
assign ifu_iu_reset_vld       = vec_sm_reset;

// Output to CP0
assign ifu_cp0_rst_inv_req    = vec_rst_inv_req;

// Output to PMP
assign ifu_sysmap_rst_sample     = vec_rst_inv_req;
// Output to rtu
assign ifu_rtu_reset_halt_req = vec_cur_state[3:0] == HALT;

assign ifu_cp0_vec_succeed       = vec_pc_flop;
assign ifu_cp0_vec_err           = vec_err_occur;

assign ifu_xx_in_warm_up      = vec_sm_warm_up;
assign ifu_fpu_warm_up        = vec_sm_warm_up;

// &ModuleEnd; @321
endmodule


