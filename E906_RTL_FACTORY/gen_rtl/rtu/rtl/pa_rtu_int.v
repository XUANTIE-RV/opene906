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
module pa_rtu_int(
  cbus_int_ex1_split_inst,
  cbus_int_ipop_int_mask,
  cbus_int_ipush_mie_en,
  clic_cpu_int_hv,
  clic_cpu_int_id,
  clic_cpu_int_il,
  clic_cpu_int_priv,
  cp0_rtu_ex1_mret,
  cp0_rtu_icg_en,
  cp0_rtu_in_nmi,
  cp0_rtu_int_level,
  cp0_rtu_int_mode,
  cp0_rtu_mie,
  cp0_rtu_mnxti_vld,
  cp0_rtu_mpil,
  cp0_rtu_pm_bypass,
  cp0_rtu_tail_int_hv,
  cp0_rtu_tail_int_id,
  cp0_rtu_wfe_en,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpurst_b,
  dtu_rtu_int_mask,
  forever_cpuclk,
  idu_yy_xx_tail_ack,
  int_cbus_ex1_int_vld,
  int_cbus_ex1_nmi_req,
  int_cbus_int_hv,
  int_lockup_nmi_req,
  int_retire_pending_int_hv,
  int_top_nmi_req,
  int_xx_int_id,
  int_xx_int_lv,
  pad_yy_icg_scan_en,
  retire_int_nmi_ack,
  retire_xx_ex2_expt_raw,
  rtu_cp0_mnxti_pending_vld,
  rtu_cp0_pending_int_hv,
  rtu_cp0_pending_int_id,
  rtu_cp0_pending_int_level,
  rtu_cp0_wk_int,
  rtu_dtu_nmi_pending,
  rtu_idu_id_tail_int_vld,
  rtu_yy_xx_expt_int,
  rtu_yy_xx_expt_vec,
  rtu_yy_xx_expt_vld,
  rtu_yy_xx_int_hv,
  sysio_rtu_nmi_int,
  sysio_rtu_wk_event
);

// &Ports; @24
input           cbus_int_ex1_split_inst;  
input           cbus_int_ipop_int_mask;   
input           cbus_int_ipush_mie_en;    
input           clic_cpu_int_hv;          
input   [11:0]  clic_cpu_int_id;          
input   [7 :0]  clic_cpu_int_il;          
input   [1 :0]  clic_cpu_int_priv;        
input           cp0_rtu_ex1_mret;         
input           cp0_rtu_icg_en;           
input           cp0_rtu_in_nmi;           
input   [7 :0]  cp0_rtu_int_level;        
input   [1 :0]  cp0_rtu_int_mode;         
input           cp0_rtu_mie;              
input           cp0_rtu_mnxti_vld;        
input   [7 :0]  cp0_rtu_mpil;             
input   [1 :0]  cp0_rtu_pm_bypass;        
input           cp0_rtu_tail_int_hv;      
input   [11:0]  cp0_rtu_tail_int_id;      
input           cp0_rtu_wfe_en;           
input           cpurst_b;                 
input           dtu_rtu_int_mask;         
input           forever_cpuclk;           
input           idu_yy_xx_tail_ack;       
input           pad_yy_icg_scan_en;       
input           retire_int_nmi_ack;       
input           retire_xx_ex2_expt_raw;   
input           rtu_yy_xx_expt_int;       
input   [11:0]  rtu_yy_xx_expt_vec;       
input           rtu_yy_xx_expt_vld;       
input           rtu_yy_xx_int_hv;         
input           sysio_rtu_nmi_int;        
input           sysio_rtu_wk_event;       
output  [11:0]  cpu_clic_curid;           
output          cpu_clic_int_exit;        
output          int_cbus_ex1_int_vld;     
output          int_cbus_ex1_nmi_req;     
output          int_cbus_int_hv;          
output          int_lockup_nmi_req;       
output          int_retire_pending_int_hv; 
output          int_top_nmi_req;          
output  [11:0]  int_xx_int_id;            
output  [7 :0]  int_xx_int_lv;            
output          rtu_cp0_mnxti_pending_vld; 
output          rtu_cp0_pending_int_hv;   
output  [11:0]  rtu_cp0_pending_int_id;   
output  [7 :0]  rtu_cp0_pending_int_level; 
output          rtu_cp0_wk_int;           
output          rtu_dtu_nmi_pending;      
output          rtu_idu_id_tail_int_vld;  

// &Regs; @25
reg             cpu_nmi_int_f;            
reg             cpu_wk_event_f1;          
reg             cpu_wk_event_f2;          
reg             int_nmi_req_raw;          

// &Wires; @26
wire            cbus_int_ex1_split_inst;  
wire            cbus_int_ipop_int_mask;   
wire            cbus_int_ipush_mie_en;    
wire            clic_cpu_int_hv;          
wire    [11:0]  clic_cpu_int_id;          
wire    [7 :0]  clic_cpu_int_il;          
wire    [1 :0]  clic_cpu_int_priv;        
wire            cp0_rtu_ex1_mret;         
wire            cp0_rtu_icg_en;           
wire            cp0_rtu_in_nmi;           
wire    [7 :0]  cp0_rtu_int_level;        
wire            cp0_rtu_mie;              
wire            cp0_rtu_mnxti_vld;        
wire    [7 :0]  cp0_rtu_mpil;             
wire    [1 :0]  cp0_rtu_pm_bypass;        
wire            cp0_rtu_tail_int_hv;      
wire    [11:0]  cp0_rtu_tail_int_id;      
wire            cp0_rtu_wfe_en;           
wire    [11:0]  cpu_clic_curid;           
wire            cpu_clic_int_exit;        
wire            cpu_nmi_vld;              
wire            cpurst_b;                 
wire            dtu_rtu_int_mask;         
wire            flop_clk;                 
wire            flop_clk_en;              
wire            forever_cpuclk;           
wire            idu_yy_xx_tail_ack;       
wire            int_cbus_ex1_int_vld;     
wire            int_cbus_ex1_nmi_req;     
wire            int_cbus_int_hv;          
wire            int_clic_gt_cur;          
wire            int_clic_gt_cur_pm;       
wire            int_clic_gt_pre;          
wire            int_clic_hv;              
wire    [11:0]  int_clic_id;              
wire    [7 :0]  int_clic_int_level;       
wire    [1 :0]  int_clic_int_mode;        
wire    [7 :0]  int_cur_int_level;        
wire            int_ex1_int_vld;          
wire            int_ex1_nmi_vld;          
wire            int_global_mie;           
wire            int_id_tail_vld;          
wire            int_lockup_nmi_req;       
wire            int_mask;                 
wire            int_nhv_int_ack;          
wire            int_nmi_req;              
wire            int_pending_vld;          
wire    [7 :0]  int_pre_int_level;        
wire            int_retire_pending_int_hv; 
wire            int_top_nmi_req;          
wire            int_vld;                  
wire            int_vld_raw;              
wire            int_wk_event_vld;         
wire    [11:0]  int_xx_int_id;            
wire    [7 :0]  int_xx_int_lv;            
wire            mnxti_pending_vld;        
wire            pad_yy_icg_scan_en;       
wire            retire_int_nmi_ack;       
wire            retire_xx_ex2_expt_raw;   
wire            rtu_cp0_mnxti_pending_vld; 
wire            rtu_cp0_pending_int_hv;   
wire    [11:0]  rtu_cp0_pending_int_id;   
wire    [7 :0]  rtu_cp0_pending_int_level; 
wire            rtu_cp0_wk_int;           
wire            rtu_dtu_nmi_pending;      
wire            rtu_idu_id_tail_int_vld;  
wire            rtu_yy_xx_expt_int;       
wire    [11:0]  rtu_yy_xx_expt_vec;       
wire            rtu_yy_xx_expt_vld;       
wire            rtu_yy_xx_int_hv;         
wire            sysio_rtu_nmi_int;        
wire            sysio_rtu_wk_event;       


parameter CPU_MODE_M          = 2'b11;
parameter CPU_MODE_U          = 2'b00;

assign int_global_mie         = cp0_rtu_mie
                             || cbus_int_ipush_mie_en && !retire_xx_ex2_expt_raw;
//==========================================================
//                  Input from CLIC
//==========================================================
assign int_clic_id[11:0]       = clic_cpu_int_id[11:0];
assign int_clic_int_level[7:0] = clic_cpu_int_il[7:0];
assign int_clic_int_mode[1:0]  = clic_cpu_int_priv[1:0];
assign int_clic_hv             = clic_cpu_int_hv;

//==========================================================
//                  Input from CP0
//==========================================================
assign int_cur_int_level[7:0] = cp0_rtu_int_level[7:0];
// &Force("input", "cp0_rtu_int_mode");  &Force("bus", "cp0_rtu_int_mode", 1, 0); @46
// assign int_cur_int_mode[1:0]  = cp0_rtu_int_mode[1:0];

assign int_pre_int_level[7:0] = cp0_rtu_mpil[7:0];

assign int_nhv_int_ack        = cp0_rtu_mnxti_vld;
//==========================================================
//                      Judge Int
//==========================================================
assign int_clic_gt_cur    = int_clic_int_level[7:0] > int_cur_int_level[7:0];
assign int_clic_gt_cur_pm = (int_clic_int_level[7:0] != 8'b0)
                         && (cp0_rtu_pm_bypass[1:0] != CPU_MODE_M);
assign int_vld_raw     = (int_clic_gt_cur // clic int must be M mode int.
                       || int_clic_gt_cur_pm) //PM < M
                      && int_clic_int_mode[1:0] == CPU_MODE_M; // Only support M int.

//==========================================================
//                  Judge Int Pending
//==========================================================
// Using MNXTI cpu must be in M-mode.
assign int_clic_gt_pre = int_clic_int_level[7:0] > int_pre_int_level[7:0];
assign int_pending_vld = int_clic_gt_pre
                      && int_clic_int_mode[1:0] == CPU_MODE_M;
assign mnxti_pending_vld = int_pending_vld && !int_clic_hv;

//==========================================================
//                 Prepare Interrupt Source
//==========================================================
assign int_vld = int_vld_raw && (int_global_mie
                              || cp0_rtu_pm_bypass[1:0] != CPU_MODE_M);
// if idu_rtu_ex1_ipop_int_mask is 1'b1, ipop can ack int.
assign int_ex1_int_vld = int_vld
                     && (!cbus_int_ex1_split_inst || cbus_int_ipop_int_mask)
                     && !dtu_rtu_int_mask
                     && !int_mask;
//assign int_ex1_int_vld_gate = int_vld_raw
//                     && (!cbus_int_ex1_split_inst || idu_rtu_ex1_ipop_int_mask)
//                     && !dtu_rtu_int_mask
//                     && !int_mask;
// int can't be ack when in nmi.
assign int_mask = cp0_rtu_in_nmi && !cp0_rtu_ex1_mret;

//==========================================================
//                     Tail-Chain Judge
//==========================================================
assign int_id_tail_vld = int_pending_vld && !int_clic_gt_cur
                      && cp0_rtu_mie
                      && !dtu_rtu_int_mask
                      && !int_mask;


//==========================================================
//                    Prepare NMI Source
//==========================================================
always @ (posedge flop_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cpu_nmi_int_f <= 1'b0;
  else
    cpu_nmi_int_f <= sysio_rtu_nmi_int;
end

assign cpu_nmi_vld = !cpu_nmi_int_f && sysio_rtu_nmi_int;

always @ (posedge flop_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    int_nmi_req_raw <= 1'b0;
  else if (cpu_nmi_vld)
    int_nmi_req_raw <= 1'b1;
  else if (retire_int_nmi_ack)
    int_nmi_req_raw <= 1'b0;
end

assign int_top_nmi_req = int_nmi_req_raw;

assign int_nmi_req = int_nmi_req_raw && !(cp0_rtu_in_nmi && !cp0_rtu_ex1_mret);
assign int_ex1_nmi_vld = int_nmi_req
                      && !dtu_rtu_int_mask
                      && !cbus_int_ex1_split_inst;

//==========================================================
//                    Prepare WFE Source
//==========================================================
always @ (posedge flop_clk or negedge cpurst_b)
begin
  if (!cpurst_b) begin
    cpu_wk_event_f1 <= 1'b0;
    cpu_wk_event_f2 <= 1'b0;
  end
  else begin
    cpu_wk_event_f1 <= sysio_rtu_wk_event;
    cpu_wk_event_f2 <= cpu_wk_event_f1;
  end
end

assign int_wk_event_vld = !cpu_wk_event_f2 && cpu_wk_event_f1;

assign flop_clk_en = cpu_nmi_int_f ^ sysio_rtu_nmi_int
                  || cpu_wk_event_f1 ^ sysio_rtu_wk_event
                  || cpu_wk_event_f2 ^ cpu_wk_event_f1
                  || cpu_nmi_vld
                  || int_nmi_req_raw;
// &Instance("gated_clk_cell", "x_flop_clk"); @149
gated_clk_cell  x_flop_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (flop_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (flop_clk_en       ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @150
//          .external_en (1'b0), @151
//          .global_en   (1'b1), @152
//          .module_en   (cp0_rtu_icg_en), @153
//          .local_en    (flop_clk_en), @154
//          .clk_out     (flop_clk)); @155

//==========================================================
//                  Output to RTU
//==========================================================
assign int_cbus_ex1_nmi_req  = int_ex1_nmi_vld;
assign int_cbus_ex1_int_vld  = int_ex1_int_vld && !int_ex1_nmi_vld;
//assign int_cbus_ex1_int_vld_gate = int_ex1_int_vld_gate && !int_ex1_nmi_vld;
assign int_cbus_int_hv       = int_clic_hv;
assign int_retire_pending_int_hv = int_clic_hv;
assign int_xx_int_id[11:0]   = int_clic_id[11:0];
assign int_xx_int_lv[7:0]    = int_clic_int_level[7:0];
assign int_lockup_nmi_req    = int_nmi_req;
// TODO int mode
//==========================================================
//                  Output to CP0
//==========================================================
assign rtu_cp0_wk_int = int_vld_raw
                     || |int_clic_int_level[7:0] && cp0_rtu_wfe_en
                     || int_wk_event_vld && cp0_rtu_wfe_en
                     || int_nmi_req;
assign rtu_cp0_mnxti_pending_vld = mnxti_pending_vld;
assign rtu_cp0_pending_int_id[11:0] = int_clic_id[11:0];
assign rtu_cp0_pending_int_level[7:0] = int_clic_int_level[7:0];
assign rtu_cp0_pending_int_hv = int_clic_hv;

//==========================================================
//                  Output to CLIC
//==========================================================
assign cpu_clic_curid[11:0] = idu_yy_xx_tail_ack ? cp0_rtu_tail_int_id[11:0]
                            : rtu_yy_xx_expt_vld && rtu_yy_xx_expt_int ? rtu_yy_xx_expt_vec[11:0]
                                                                       : int_clic_id[11:0];
assign cpu_clic_int_exit = idu_yy_xx_tail_ack && cp0_rtu_tail_int_hv // tail_int (hv) ack
                        || rtu_yy_xx_expt_vld && rtu_yy_xx_expt_int && rtu_yy_xx_int_hv // normal hv-int ack
                        || int_nhv_int_ack; // non-hv int ack

//==========================================================
//                      Output to IDU
//==========================================================
assign rtu_idu_id_tail_int_vld = int_id_tail_vld;

//==========================================================
//                      Output to DTU
//==========================================================
assign rtu_dtu_nmi_pending = int_nmi_req_raw;

// &ModuleEnd @207
endmodule


