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
module pa_ifu_ipack(
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ibuf_ipack_stall,
  id_pred_ipack_chgflw_vld0,
  id_pred_ipack_delay_stall,
  id_pred_ipack_mask,
  id_pred_ipack_ret_stall,
  idu_ifu_tail_vld,
  ifetch_ipack_acc_err,
  ifetch_ipack_inst,
  ifetch_ipack_inst_vld,
  ifetch_ipack_inst_vld_gate,
  ifetch_ipack_unalign,
  ipack_ibuf_acc_err,
  ipack_ibuf_inst,
  ipack_ibuf_inst_all,
  ipack_ibuf_inst_empty,
  ipack_ibuf_inst_full,
  ipack_ibuf_inst_one,
  ipack_ibuf_inst_one_raw,
  ipack_ibuf_inst_two,
  ipack_ibuf_inst_vld,
  ipack_ibuf_inst_vld_raw,
  ipack_id_pred_h0_create,
  ipack_id_pred_h0_vld,
  ipack_id_pred_inst0,
  ipack_id_pred_inst0_expt,
  ipack_id_pred_inst0_vld,
  ipack_id_pred_inst1,
  ipack_id_pred_inst1_expt,
  ipack_id_pred_inst1_vld,
  ipack_id_pred_new_vld,
  ipack_id_pred_unalign,
  ipack_pcgen_reissue,
  ipack_pcgen_reissue_gate,
  ipack_top_entry0_vld,
  ipack_top_entry1_vld,
  ipack_top_entry2_vld,
  iu_ifu_tar_pc_vld,
  pad_yy_icg_scan_en,
  pcgen_ipack_chgflw_vld,
  rtu_ifu_chgflw_vld,
  rtu_ifu_flush_fe,
  rtu_yy_xx_expt_vld,
  rtu_yy_xx_tail_int_vld,
  vec_ipack_inst_mask
);

// &Ports; @24
input           cp0_ifu_icg_en;            
input           cp0_yy_clk_en;             
input           cpurst_b;                  
input           forever_cpuclk;            
input           ibuf_ipack_stall;          
input           id_pred_ipack_chgflw_vld0; 
input           id_pred_ipack_delay_stall; 
input           id_pred_ipack_mask;        
input           id_pred_ipack_ret_stall;   
input           idu_ifu_tail_vld;          
input           ifetch_ipack_acc_err;      
input   [31:0]  ifetch_ipack_inst;         
input           ifetch_ipack_inst_vld;     
input           ifetch_ipack_inst_vld_gate; 
input           ifetch_ipack_unalign;      
input           iu_ifu_tar_pc_vld;         
input           pad_yy_icg_scan_en;        
input           pcgen_ipack_chgflw_vld;    
input           rtu_ifu_chgflw_vld;        
input           rtu_ifu_flush_fe;          
input           rtu_yy_xx_expt_vld;        
input           rtu_yy_xx_tail_int_vld;    
input           vec_ipack_inst_mask;       
output  [2 :0]  ipack_ibuf_acc_err;        
output  [47:0]  ipack_ibuf_inst;           
output          ipack_ibuf_inst_all;       
output          ipack_ibuf_inst_empty;     
output          ipack_ibuf_inst_full;      
output          ipack_ibuf_inst_one;       
output          ipack_ibuf_inst_one_raw;   
output          ipack_ibuf_inst_two;       
output          ipack_ibuf_inst_vld;       
output          ipack_ibuf_inst_vld_raw;   
output          ipack_id_pred_h0_create;   
output          ipack_id_pred_h0_vld;      
output  [31:0]  ipack_id_pred_inst0;       
output          ipack_id_pred_inst0_expt;  
output          ipack_id_pred_inst0_vld;   
output  [15:0]  ipack_id_pred_inst1;       
output          ipack_id_pred_inst1_expt;  
output          ipack_id_pred_inst1_vld;   
output          ipack_id_pred_new_vld;     
output          ipack_id_pred_unalign;     
output          ipack_pcgen_reissue;       
output          ipack_pcgen_reissue_gate;  
output          ipack_top_entry0_vld;      
output          ipack_top_entry1_vld;      
output          ipack_top_entry2_vld;      

// &Regs; @25

// &Wires; @26
wire            cp0_ifu_icg_en;            
wire            cp0_yy_clk_en;             
wire            cpurst_b;                  
wire            entry0_acc_err;            
wire            entry0_create_en;          
wire            entry0_create_icg_en;      
wire    [15:0]  entry0_inst;               
wire            entry0_retire_en;          
wire            entry0_upd_acc_err;        
wire    [15:0]  entry0_upd_inst;           
wire            entry0_vld;                
wire            entry1_acc_err;            
wire            entry1_create_en;          
wire            entry1_create_icg_en;      
wire    [15:0]  entry1_inst;               
wire            entry1_retire_en;          
wire            entry1_upd_acc_err;        
wire    [15:0]  entry1_upd_inst;           
wire            entry1_vld;                
wire            entry2_acc_err;            
wire            entry2_create_en;          
wire            entry2_create_icg_en;      
wire    [15:0]  entry2_inst;               
wire            entry2_retire_en;          
wire            entry2_upd_acc_err;        
wire    [15:0]  entry2_upd_inst;           
wire            entry2_vld;                
wire            forever_cpuclk;            
wire            h0_vld;                    
wire            h1_16bit_vld;              
wire            h1_32bit_vld;              
wire            h2_16bit_vld;              
wire            h2_32bit_vld;              
wire            ibuf_ipack_stall;          
wire            id_pred_ipack_chgflw_vld0; 
wire            id_pred_ipack_delay_stall; 
wire            id_pred_ipack_mask;        
wire            id_pred_ipack_ret_stall;   
wire            idu_ifu_tail_vld;          
wire            ifetch_inst_vld;           
wire            ifetch_ipack_acc_err;      
wire    [31:0]  ifetch_ipack_inst;         
wire            ifetch_ipack_inst_vld;     
wire            ifetch_ipack_inst_vld_gate; 
wire            ifetch_ipack_unalign;      
wire            ipack_acc_err0;            
wire            ipack_acc_err1;            
wire            ipack_acc_err2;            
wire            ipack_align_create;        
wire            ipack_all_vld;             
wire            ipack_buf_flush;           
wire            ipack_buf_stall;           
wire            ipack_cpuclk;              
wire            ipack_empty;               
wire    [31:0]  ipack_first_inst;          
wire            ipack_first_vld;           
wire            ipack_full;                
wire    [2 :0]  ipack_ibuf_acc_err;        
wire    [47:0]  ipack_ibuf_inst;           
wire            ipack_ibuf_inst_all;       
wire            ipack_ibuf_inst_empty;     
wire            ipack_ibuf_inst_full;      
wire            ipack_ibuf_inst_one;       
wire            ipack_ibuf_inst_one_raw;   
wire            ipack_ibuf_inst_two;       
wire            ipack_ibuf_inst_vld;       
wire            ipack_ibuf_inst_vld_raw;   
wire            ipack_icg_en;              
wire            ipack_id_pred_h0_create;   
wire            ipack_id_pred_h0_vld;      
wire    [31:0]  ipack_id_pred_inst0;       
wire            ipack_id_pred_inst0_expt;  
wire            ipack_id_pred_inst0_vld;   
wire    [15:0]  ipack_id_pred_inst1;       
wire            ipack_id_pred_inst1_expt;  
wire            ipack_id_pred_inst1_vld;   
wire            ipack_id_pred_new_vld;     
wire            ipack_id_pred_unalign;     
wire            ipack_one_16bit_raw;       
wire            ipack_one_16bit_vld;       
wire            ipack_pcgen_reissue;       
wire            ipack_pcgen_reissue_gate;  
wire    [47:0]  ipack_retire_inst;         
wire            ipack_retire_one;          
wire            ipack_retire_vld;          
wire    [15:0]  ipack_secnd_inst;          
wire            ipack_secnd_vld;           
wire            ipack_top_entry0_vld;      
wire            ipack_top_entry1_vld;      
wire            ipack_top_entry2_vld;      
wire            iu_ifu_tar_pc_vld;         
wire            pad_yy_icg_scan_en;        
wire            pcgen_ipack_chgflw_vld;    
wire            rtu_ifu_chgflw_vld;        
wire            rtu_ifu_flush_fe;          
wire            rtu_yy_xx_expt_vld;        
wire            rtu_yy_xx_tail_int_vld;    
wire            vec_ipack_inst_mask;       


//==========================================================
// Instruction Package Module
// 1. Instance ICG Cell
// 2. Instruction Package Buffer to ID stage
// 3. Generate Valid Instruction
//==========================================================

//------------------------------------------------
// 1. Instance ICG Cell
//------------------------------------------------
assign ipack_icg_en = ifetch_ipack_inst_vld_gate
                   | ~ipack_empty;
// &Instance("gated_clk_cell", "x_pa_ifu_ipack_icg_cell"); @40
gated_clk_cell  x_pa_ifu_ipack_icg_cell (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ipack_cpuclk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ipack_icg_en      ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @41
//          .clk_out     (ipack_cpuclk), @42
//          .external_en (1'b0), @43
//          .global_en   (cp0_yy_clk_en), @44
//          .module_en   (cp0_ifu_icg_en), @45
//          .local_en    (ipack_icg_en) @46
// ); @47

//------------------------------------------------
// 2. Instruction Package Buffer Implementation
// a. Flush Condition
// b. Create Condition
// c. Retire Condition
// d. Instance Instruction Package Buffer Entry
//------------------------------------------------

// a. Flush Condition
assign ipack_buf_flush      = rtu_ifu_flush_fe | iu_ifu_tar_pc_vld | rtu_yy_xx_expt_vld
                           | rtu_ifu_chgflw_vld | idu_ifu_tail_vld | rtu_yy_xx_tail_int_vld;
assign ifetch_inst_vld      = ifetch_ipack_inst_vld & ~pcgen_ipack_chgflw_vld & ~vec_ipack_inst_mask & ~id_pred_ipack_mask;
// b. Create Condition
assign ipack_align_create   = ifetch_inst_vld & ~ifetch_ipack_unalign;
//assign ipack_unalign_create = ifetch_inst_vld & ifetch_ipack_unalign;
assign ipack_buf_stall      = id_pred_ipack_ret_stall | ibuf_ipack_stall
                           ; //| id_pred_ipack_delay_stall;

assign entry0_create_en = (~entry1_vld & h2_32bit_vld
                        | ~h0_vld & h1_16bit_vld & h2_32bit_vld
                        | h0_vld & entry1_vld & h2_32bit_vld)
                          & ~id_pred_ipack_chgflw_vld0
                          & ~ipack_buf_stall;
assign entry1_create_en = ipack_align_create 
                       & ~((entry1_vld |h2_16bit_vld) & ipack_buf_stall)
                       & ~id_pred_ipack_delay_stall;
assign entry2_create_en = ifetch_inst_vld
                       & ~(entry2_vld & ipack_buf_stall)
                       & ~id_pred_ipack_delay_stall;
assign entry0_create_icg_en = ~entry1_vld & h2_32bit_vld
                        | ~h0_vld & h1_16bit_vld & h2_32bit_vld
                        | h0_vld & entry1_vld & h2_32bit_vld;
assign entry1_create_icg_en = ipack_align_create;
assign entry2_create_icg_en = ifetch_inst_vld;

// create inst
assign entry0_upd_inst[15:0] = entry2_inst[15:0];
assign entry1_upd_inst[15:0] = ifetch_ipack_inst[15:0];
assign entry2_upd_inst[15:0] = ifetch_ipack_inst[31:16];

// create acc err
assign entry0_upd_acc_err = entry2_acc_err;
assign entry1_upd_acc_err = ifetch_ipack_acc_err;
assign entry2_upd_acc_err = ifetch_ipack_acc_err;

// c. Retire Condition
assign entry0_retire_en = ~ipack_buf_stall & entry1_vld;
assign entry1_retire_en = ~ipack_buf_stall;
assign entry2_retire_en = ~ipack_buf_stall & ~id_pred_ipack_delay_stall;

// d. Instance Instruction Package Buffer Entry
// &ConnRule(s/ipack_entry/entry0/); @100
// &Instance("pa_ifu_ipack_entry","x_pa_ifu_ipack_entry0"); @101
pa_ifu_ipack_entry  x_pa_ifu_ipack_entry0 (
  .cp0_ifu_icg_en            (cp0_ifu_icg_en           ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .ipack_buf_flush           (ipack_buf_flush          ),
  .ipack_cpuclk              (ipack_cpuclk             ),
  .ipack_entry_acc_err       (entry0_acc_err           ),
  .ipack_entry_create_en     (entry0_create_en         ),
  .ipack_entry_create_icg_en (entry0_create_icg_en     ),
  .ipack_entry_inst          (entry0_inst              ),
  .ipack_entry_retire_en     (entry0_retire_en         ),
  .ipack_entry_upd_acc_err   (entry0_upd_acc_err       ),
  .ipack_entry_upd_inst      (entry0_upd_inst          ),
  .ipack_entry_vld           (entry0_vld               ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);


// &ConnRule(s/ipack_entry/entry1/); @103
// &Instance("pa_ifu_ipack_entry","x_pa_ifu_ipack_entry1"); @104
pa_ifu_ipack_entry  x_pa_ifu_ipack_entry1 (
  .cp0_ifu_icg_en            (cp0_ifu_icg_en           ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .ipack_buf_flush           (ipack_buf_flush          ),
  .ipack_cpuclk              (ipack_cpuclk             ),
  .ipack_entry_acc_err       (entry1_acc_err           ),
  .ipack_entry_create_en     (entry1_create_en         ),
  .ipack_entry_create_icg_en (entry1_create_icg_en     ),
  .ipack_entry_inst          (entry1_inst              ),
  .ipack_entry_retire_en     (entry1_retire_en         ),
  .ipack_entry_upd_acc_err   (entry1_upd_acc_err       ),
  .ipack_entry_upd_inst      (entry1_upd_inst          ),
  .ipack_entry_vld           (entry1_vld               ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);


// &ConnRule(s/ipack_entry/entry2/); @106
// &Instance("pa_ifu_ipack_entry","x_pa_ifu_ipack_entry2"); @107
pa_ifu_ipack_entry  x_pa_ifu_ipack_entry2 (
  .cp0_ifu_icg_en            (cp0_ifu_icg_en           ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .ipack_buf_flush           (ipack_buf_flush          ),
  .ipack_cpuclk              (ipack_cpuclk             ),
  .ipack_entry_acc_err       (entry2_acc_err           ),
  .ipack_entry_create_en     (entry2_create_en         ),
  .ipack_entry_create_icg_en (entry2_create_icg_en     ),
  .ipack_entry_inst          (entry2_inst              ),
  .ipack_entry_retire_en     (entry2_retire_en         ),
  .ipack_entry_upd_acc_err   (entry2_upd_acc_err       ),
  .ipack_entry_upd_inst      (entry2_upd_inst          ),
  .ipack_entry_vld           (entry2_vld               ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);


//------------------------------------------------
// 3. Generate Valid Instruction
// a. Instruction Length Judgement
// b. Valid Instruction Package
// c. Instruction Access Error for I-Buffer
//------------------------------------------------

// a. Instruction Length Judgement
assign h0_vld       = entry0_vld & entry0_inst[1:0] == 2'b11;

assign h1_16bit_vld = entry1_vld & entry1_inst[1:0] != 2'b11;
assign h1_32bit_vld = entry1_vld & entry1_inst[1:0] == 2'b11;

assign h2_16bit_vld = entry2_vld & entry2_inst[1:0] != 2'b11;
assign h2_32bit_vld = entry2_vld & entry2_inst[1:0] == 2'b11 
                   & ~id_pred_ipack_chgflw_vld0;

// b. Valid Instruction Package
// Generate Empty Statu for Prediction
assign ipack_empty = ~entry0_vld & ~entry1_vld & ~entry2_vld;
assign ipack_full = entry0_vld & entry1_vld & entry2_vld;// & entry2_inst[1:0] != 2'b11;

// Generate First Valid Inst for Prediction
assign ipack_first_vld        = entry1_vld | ~h0_vld & h2_16bit_vld;
assign ipack_first_inst[31:0] = entry0_vld ? {entry1_inst[15:0], entry0_inst[15:0]}
                              : entry1_vld ? {entry2_inst[15:0], entry1_inst[15:0]}
                                           : {entry2_inst[15:0], entry2_inst[15:0]};
// Generate Second Valid Inst for Prediction
assign ipack_secnd_vld        = (h0_vld | h1_16bit_vld) & h2_16bit_vld;
                              //& ~id_pred_ipack_chgflw_vld0;
assign ipack_secnd_inst[15:0] = entry2_inst[15:0];

// Generate I-Pack Retire Number for I-Buffer
// 1 16-bit Inst Valid
assign ipack_one_16bit_vld = ~h0_vld & h1_16bit_vld & ~(h2_16bit_vld
                                 & ~id_pred_ipack_chgflw_vld0
                                 & ~id_pred_ipack_delay_stall)
                          | ~entry1_vld & h2_16bit_vld;
assign ipack_one_16bit_raw = ~h0_vld & h1_16bit_vld & ~(h2_16bit_vld
                                 & ~id_pred_ipack_chgflw_vld0)
                          | ~entry1_vld & h2_16bit_vld;

//// 1 32-bit Inst Valid
//assign ipack_one_32bit_vld = ~h0_vld & h1_32bit_vld & entry2_vld
//                           | h0_vld & entry1_vld & h2_32bit_vld;
//
//// 2 16-bit Inst Valid
//assign ipack_two_16bit_vld = ~h0_vld & h1_16bit_vld & h2_16bit_vld;

// 1 16-bit and 1 32-bit Inst Valid
assign ipack_all_vld     = h0_vld & entry1_vld & h2_16bit_vld
                         & ~id_pred_ipack_chgflw_vld0
                         & ~id_pred_ipack_delay_stall;

//assign ipack_entry_all_vld = h0_vld & entry1_vld & h2_16bit_vld;

// Retire Number for I-Buffer
assign ipack_retire_vld    = entry1_vld | h2_16bit_vld;
assign ipack_retire_one    = ipack_one_16bit_vld;
//assign ipack_retire_two    = ipack_one_32bit_vld | ipack_two_16bit_vld;

// Retire Inst for I-Buffer
assign ipack_retire_inst[47:0] = {entry2_inst[15:0], ipack_first_inst[31:0]};

// c. Instruction Access Error for I-Buffer
assign ipack_acc_err0 = ~h0_vld & h1_16bit_vld & entry1_acc_err
                     | ~h0_vld & h1_32bit_vld & entry1_acc_err
                     | ~entry1_vld & h2_16bit_vld & entry2_acc_err
                     | h0_vld & entry1_vld & entry0_acc_err;
assign ipack_acc_err1 = ~h0_vld & h1_32bit_vld & entry2_vld
                         & entry2_acc_err
                     | ~h0_vld & h1_16bit_vld & h2_16bit_vld
                         & entry2_acc_err 
                     | h0_vld & entry1_vld & entry1_acc_err;
assign ipack_acc_err2 = h0_vld & entry1_vld & h2_16bit_vld
                     & entry2_acc_err;

//==========================================================
// Rename for Output
//==========================================================

// Output to id pred
assign ipack_id_pred_inst0_vld   = ipack_first_vld;// & ~ibuf_ipack_stall;
assign ipack_id_pred_inst0[31:0] = ipack_first_inst[31:0];
assign ipack_id_pred_inst0_expt  = ipack_acc_err0
                             | ~h0_vld & h1_32bit_vld & entry2_vld & entry2_acc_err
                             | h0_vld & entry1_vld & entry1_acc_err;

assign ipack_id_pred_inst1_vld   = ipack_secnd_vld;// & ~ibuf_ipack_stall;
assign ipack_id_pred_inst1[15:0] = ipack_secnd_inst[15:0];
assign ipack_id_pred_inst1_expt  = ipack_acc_err2
                             | ~h0_vld & h1_16bit_vld & h2_16bit_vld & entry2_acc_err;

assign ipack_id_pred_h0_create   = entry0_create_en;
assign ipack_id_pred_h0_vld      = h0_vld;
assign ipack_id_pred_unalign     = ~entry1_vld & h2_16bit_vld;
//assign ipack_id_pred_inst_full   = ipack_full;

assign ipack_id_pred_new_vld     = ifetch_ipack_inst_vld;

// Output to ibuf
assign ipack_ibuf_inst_vld   = ipack_retire_vld & ~ipack_buf_stall;
assign ipack_ibuf_inst_vld_raw = ipack_retire_vld;
assign ipack_ibuf_inst_one   = ipack_retire_one;
assign ipack_ibuf_inst_one_raw = ipack_one_16bit_raw;
assign ipack_ibuf_inst_two   = ipack_secnd_vld
                              & ~id_pred_ipack_chgflw_vld0
                              & ~id_pred_ipack_delay_stall;
assign ipack_ibuf_inst_all   = ipack_all_vld;
//assign ipack_ibuf_first_16   = ~h0_vld & h1_16bit_vld;
assign ipack_ibuf_inst[47:0] = ipack_retire_inst[47:0];
assign ipack_ibuf_acc_err[2:0] = {ipack_acc_err2,ipack_acc_err1,ipack_acc_err0};
assign ipack_ibuf_inst_empty = ipack_empty;
assign ipack_ibuf_inst_full  = ipack_full;
//assign ipack_ibuf_entry_all  = ipack_entry_all_vld;

assign ipack_pcgen_reissue   = ibuf_ipack_stall & ifetch_ipack_inst_vld;
assign ipack_pcgen_reissue_gate = ibuf_ipack_stall;

// Output to top
assign ipack_top_entry0_vld  = entry0_vld;
assign ipack_top_entry1_vld  = entry1_vld;
assign ipack_top_entry2_vld  = entry2_vld;


// &ModuleEnd; @252
endmodule


