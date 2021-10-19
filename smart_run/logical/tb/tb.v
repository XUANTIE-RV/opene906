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
`define E906
`define SOC_TOP       tb.x_soc
`define RTL_MEM       tb.x_soc.x_smem_ctrl
`define ISA_MEM       tb.x_pa_isa
`define JTAG_5

`define IAHB_LITE
`ifdef IAHB_LITE
  `define RTL_IAHBL_MEM tb.x_soc.x_cpu_sub_system_ahb.x_iahb_mem_ctrl
`else
  `define RTL_IAHBL_MEM tb.x_soc.x_imem_ctrl
`endif

`define DAHB_LITE
`ifdef DAHB_LITE
  `define RTL_DAHBL_MEM tb.x_soc.x_cpu_sub_system_ahb.x_dahb_mem_ctrl
`else
  `define RTL_DAHBL_MEM tb.x_soc.x_dmem_ctrl
`endif 

//clock period
`define CLK_PERIOD          10
`define TCLK_PERIOD         33
`define MAX_RUN_TIME        700000000
`define clk           tb.clk
`define rst_b         tb.rst_b
// `include "../cpu/environment.h"
`timescale 1ns/100ps

module tb();
reg clk;
reg jclk;
reg rst_b;
reg jrst_b;
reg nrst_b;
reg jtap_en;
//wire jtag2_sel;
wire jtg_tms;
wire jtg_tdi;
wire jtg_tdo;

wire uart0_sin;
wire [7:0]b_pad_gpio_porta;
static integer FILE;
//Clock Generator
initial
begin
  clk =0;
  forever begin
    #(`CLK_PERIOD/2) clk = ~clk;
  end
end

initial 
begin 
  jclk = 0;
  forever begin
    #(`TCLK_PERIOD/2) jclk = ~jclk;
  end
end

//Reset Generater
initial
begin
  rst_b = 1;
  #100;
  rst_b = 0;
  #100;
  rst_b = 1;
end

initial 
begin
  jrst_b = 1;
  #100;
  jrst_b = 0;
  #100;
  jrst_b = 1;
end

initial 
begin
  nrst_b = 1;
  #100;
  nrst_b = 0;
  #100;
  nrst_b = 1;
end

///////////////////////////////////////
// Memory Initialization  
///////////////////////////////////////
integer i;
reg [31:0] mem_data_size;
reg [31:0] mem_inst_size;

reg [31:0] mem_inst_temp [65536];
reg [31:0] mem_data_temp [65536];

initial
begin
  $display("\t******START TO LOAD PROGRAM******\n");
  $readmemh("./case.pat", mem_inst_temp);
  $readmemh("./data.pat", mem_data_temp);
  

  for(i=0;i<65536;i=i+1)
  begin
    `RTL_IAHBL_MEM.ram0.mem[i][7:0] = ((^mem_inst_temp[i][31:24]) === 1'bx ) ? 8'b0:mem_inst_temp[i][31:24];
    `RTL_IAHBL_MEM.ram1.mem[i][7:0] = ((^mem_inst_temp[i][23:16]) === 1'bx ) ? 8'b0:mem_inst_temp[i][23:16];
    `RTL_IAHBL_MEM.ram2.mem[i][7:0] = ((^mem_inst_temp[i][15: 8]) === 1'bx ) ? 8'b0:mem_inst_temp[i][15: 8];
    `RTL_IAHBL_MEM.ram3.mem[i][7:0] = ((^mem_inst_temp[i][ 7: 0]) === 1'bx ) ? 8'b0:mem_inst_temp[i][ 7: 0];
  end

 for(i=0;i<=65536;i=i+1)
  begin
    `RTL_DAHBL_MEM.ram0.mem[i][7:0]  = 8'b0;
    `RTL_DAHBL_MEM.ram1.mem[i][7:0]  = 8'b0;
    `RTL_DAHBL_MEM.ram2.mem[i][7:0]  = 8'b0;
    `RTL_DAHBL_MEM.ram3.mem[i][7:0]  = 8'b0;
  end
  for(i=0;i<=65536;i=i+1)
  begin
    `RTL_DAHBL_MEM.ram4.mem[i][7:0]  = 8'b0;
    `RTL_DAHBL_MEM.ram5.mem[i][7:0]  = 8'b0;
    `RTL_DAHBL_MEM.ram6.mem[i][7:0]  = 8'b0;
    `RTL_DAHBL_MEM.ram7.mem[i][7:0]  = 8'b0;
  end


end
///////////////////////////////////////
// Finish Condition Control 
///////////////////////////////////////

// Reaching the max simulation time.
reg [31:0] ins_counter;
initial
begin
#`MAX_RUN_TIME;
  $display("**********************************************");
  $display("*   meeting max simulation time, stop!       *");
  $display("**********************************************");
  FILE = $fopen("run_case.report","w");
  $fdisplay(FILE,"TEST FAIL");   
$finish;
end
// No instrunction retired in the last `LAST_CYCLE cycles
reg [31:0] retire_inst_in_period;
reg [31:0] cycle_count;
`define LAST_CYCLE 5000
always @(posedge clk or negedge rst_b)
begin
  if(!rst_b)
    cycle_count[31:0] <= 32'b1;
  else 
    cycle_count[31:0] <= cycle_count[31:0] + 1'b1;
end


always @(posedge clk or negedge rst_b)
begin
  if(!rst_b) //reset to zero
    retire_inst_in_period[31:0] <= 32'b0;
  else if( (cycle_count[31:0] % `LAST_CYCLE) == 0)//check and reset retire_inst_in_period every 50000 cycles
  begin
    if(retire_inst_in_period[31:0] == 0)begin
      $display("*************************************************************");
      $display("* Error: There is no instructions retired in the last %d cycles! *", `LAST_CYCLE);
      $display("*              Simulation Fail and Finished!                *");
      $display("*************************************************************");
      #10;
      FILE = $fopen("run_case.report","w");
      $fdisplay(FILE,"TEST FAIL");   

      $finish;
    end
    retire_inst_in_period[31:0] <= 32'b0;
  end
  else if(tb.x_soc.x_cpu_sub_system_ahb.biu_pad_retire)
    retire_inst_in_period[31:0] <= retire_inst_in_period[31:0] + 1'b1;
end


//Finish control with address 32'h0 
reg [31:0] cpu_addr;
reg [1:0]  cpu_trans;
reg        cpu_write;
wire [31:0] cpu_wdata;
always @(posedge clk)
begin
  cpu_trans[1:0] <= `SOC_TOP.biu_pad_htrans[1:0];
  cpu_addr[31:0] <= `SOC_TOP.biu_pad_haddr[31:0];
  cpu_write      <= `SOC_TOP.biu_pad_hwrite;
end
assign cpu_wdata[31:0] = `SOC_TOP.biu_pad_hwdata[31:0];
always @(posedge clk)
begin
  if((cpu_trans[1:0] == 2'b10) &&
     (cpu_addr[31:0] == 32'h6000fff8) &&
      cpu_write                &&
     (cpu_wdata[31:0] == 12'hfff || cpu_wdata[31:0] == 32'hffff0000))
  begin
   $display("\n**********************************************");
   $display("*    simulation finished successfully        *");
   $display("**********************************************");
  #10;
   FILE = $fopen("run_case.report","w");
   $fdisplay(FILE,"TEST PASS");   
	
   $finish;
  end
  else if((cpu_trans[1:0] == 2'b10) &&
     (cpu_addr[31:0] == 32'h6000fff8) &&
      cpu_write                &&
     (cpu_wdata[31:0] == 12'heee || cpu_wdata[31:0] == 32'heeee0000))
  begin
   $display("**********************************************");
   $display("*    simulation finished with error          *");
   $display("**********************************************");
  #10;
   FILE = $fopen("run_case.report","w");
   $fdisplay(FILE,"TEST FAIL");   

   $finish;
  end
  else if((cpu_trans[1:0] == 2'b10) &&
     (cpu_addr[31:0] == 32'h6000fff8) &&
      cpu_write)
  begin
//   $write("begin to display:");
   $write("%c", cpu_wdata[7:0]);
  end
end

//Dumping Control
`ifndef NO_DUMP
initial
begin
  `ifdef NC_SIM
    $dumpfile("test.vcd");
    $dumpvars;  
  `else
    `ifdef IVERILOG_SIM
       $dumpfile("test.vcd");
       $dumpvars;  
    `else
      $fsdbDumpvars();
    `endif
  `endif
end
`endif

//Monitor
`ifndef NO_MONITOR
mnt x_mnt();
`endif
uart_mnt x_uart_mnt();
assign jtg_tdi = 1'b0;

assign uart0_sin = 1'b1;

//instantiate soc    
soc x_soc(
  .i_pad_clk            ( clk                  ),
  .i_pad_uart0_sin      ( uart0_sin            ),
  .o_pad_uart0_sout     ( uart0_sout           ),
  .i_pad_jtg_tclk       ( jclk                 ),
  .i_pad_jtg_trst_b     ( jrst_b               ),
  .i_pad_jtg_nrst_b     ( nrst_b               ),
  .b_pad_gpio_porta     ( b_pad_gpio_porta     ),
`ifdef JTAG_5
  .i_pad_jtg_tdi        ( jtg_tdi              ),
  .o_pad_jtg_tdo        ( jtg_tdo              ),
`endif
  .i_pad_jtg_tms        ( jtg_tms              ),
`ifdef RST_ACTIVE_HIGH
  .i_pad_rst            ( !rst_b               )
`else     
  .i_pad_rst_b          ( rst_b                )
`endif     
);


`ifdef PG_SIM 

`define MAX_ARCH_STRLEN 100

function supply_on;
  //input string pad_name;
  input [8*`MAX_ARCH_STRLEN : 1] pad_name;
  input real value;
begin
  supply_on = $mvsim_supply_on(pad_name, value);
end
endfunction

function supply_off;
  //input string pad_name;
  input [8*`MAX_ARCH_STRLEN : 1] pad_name;
begin
  supply_off = $mvsim_supply_off(pad_name);
end
endfunction

real sp_on_vdd;
real sp_on_vss;


initial
begin
     sp_on_vdd = supply_on("VDD", 1.2);
     sp_on_vss = supply_on("VSS", 0);

//     #1000
//     force tb.x_soc.pad_cpu_rst_b = 1'b0;
//     #20
//     force tb.x_soc.x_cpu_sub_system_ahb.x_ck803s.pmu_corec_isolation = 1'b1;
//     #20
//     force tb.x_soc.x_cpu_sub_system_ahb.x_ck803s.pmu_corec_sleep_in = 1'b1;
//
//     #500
//
//     release tb.x_soc.x_cpu_sub_system_ahb.x_ck803s.pmu_corec_sleep_in ;
//     #20
//     release tb.x_soc.x_cpu_sub_system_ahb.x_ck803s.pmu_corec_isolation; 
//     #20
//     release tb.x_soc.pad_cpu_rst_b ;

end

initial 
begin
  $deposit(tb.x_soc.x_cpu_sub_system_ahb.pmu_corec_sleep_in, 1'b0);
  $deposit(tb.x_soc.x_cpu_sub_system_ahb.pmu_corec_isolation, 1'b0);
  $deposit(tb.x_soc.x_cpu_sub_system_ahb.corec_pmu_sleep_out, 1'b0);
end

`endif

`ifdef E902
	`define CPU_TOP       tb.x_soc.x_cpu_sub_system_ahb.x_e902
`elsif E906
	`define CPU_TOP       tb.x_soc.x_cpu_sub_system_ahb.x_e906_top
`else
	`define CPU_TOP       tb.x_soc.x_cpu_sub_system_ahb.x_ck803s
`endif

`define CPU_CLK      `CPU_TOP.pll_core_cpuclk
`define CPU_RST      `CPU_TOP.pad_cpu_rst_b

`ifdef E902 
	`define VIRTUAL_READ `CPU_TOP.x_cr_tcipif_top.x_cr_tcipif_dbus.dummy_addr_cmplt
`elsif E906
	`define VIRTUAL_READ `CPU_TOP.x_pa_tcipif_top.x_pa_tcipif_dbus.dummy_addr_cmplt
`else
	`define VIRTUAL_READ `CPU_TOP.x_vg_tcip_top.x_nm_tcipif_dbus.dummy_addr_cmplt
`endif
`ifdef E902
	`define VIRTUAL_TIME `CPU_TOP.x_cr_tcipif_top.x_cr_tcipif_dbus.tcipif_rd_data[31:0]
`elsif E906
	`define VIRTUAL_TIME `CPU_TOP.x_pa_tcipif_top.x_pa_tcipif_dbus.tcipif_bmu_dbus_data[31:0]
`else
	`define VIRTUAL_TIME `CPU_TOP.x_vg_tcip_top.x_nm_tcipif_dbus.tcipif_dbus_rd_data[31:0]
`endif

reg [31:0] virtual_counter;

always @(posedge `CPU_CLK or negedge `CPU_RST)
begin
  if(!`CPU_RST)
    virtual_counter[31:0] <= 32'b0;
  else if(virtual_counter[31:0]==32'hffffffff)
    virtual_counter[31:0] <= virtual_counter[31:0];
  else
    virtual_counter[31:0] <= virtual_counter[31:0] +1'b1;
end 

initial 
begin 
  #1;
  wait (`VIRTUAL_READ==1'b1);
  force `VIRTUAL_TIME = virtual_counter[31:0];
  @(posedge `CPU_CLK);
  release `VIRTUAL_TIME;
  #1;
  
  wait (`VIRTUAL_READ==1'b1);
  force `VIRTUAL_TIME = virtual_counter[31:0];
  @(posedge `CPU_CLK);
  release `VIRTUAL_TIME;
  #1;

  wait (`VIRTUAL_READ==1'b1);
  force `VIRTUAL_TIME = virtual_counter[31:0];
  @(posedge `CPU_CLK);
  release `VIRTUAL_TIME;
  #1;

  wait (`VIRTUAL_READ==1'b1);
  force `VIRTUAL_TIME = virtual_counter[31:0];
  @(posedge `CPU_CLK);
  release `VIRTUAL_TIME;

  #1;
  wait (`VIRTUAL_READ==1'b1);
  force `VIRTUAL_TIME = virtual_counter[31:0];
  @(posedge `CPU_CLK);
  release `VIRTUAL_TIME;

  #1;
  wait (`VIRTUAL_READ==1'b1);
  force `VIRTUAL_TIME = virtual_counter[31:0];
  @(posedge `CPU_CLK);
  release `VIRTUAL_TIME;
  #1;
end

// count instruction number
always @(posedge `CPU_CLK or negedge `CPU_RST)
begin
  if(!`CPU_RST)
    ins_counter[31:0] <= 32'b0;
  else if(`SOC_TOP.x_cpu_sub_system_ahb.biu_pad_retire && 
         (`SOC_TOP.x_cpu_sub_system_ahb.biu_pad_retire_pc[31:0] > 32'had4))
    ins_counter[31:0] <= ins_counter[31:0] + 1'b1;
  else 
    ins_counter[31:0] <= ins_counter[31:0];
end

endmodule

