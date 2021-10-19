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
set ClkMargin 1

################################################################################
# GLOBAL UNITS
################################################################################
set_units -time ns
set_units -capacitance pF

set_case_analysis 0 [get_ports pad_yy_scan_mode]
set_case_analysis 0 [get_ports pad_yy_icg_scan_en]
set_case_analysis 0 [get_ports pad_yy_icg_scan_en]

# CPU_CLOCK
#set CPUClkFrequency 150
set CPUClkFrequency 1000
set CPUClkName CPU_CLOCK
set CPUClkPoint pll_core_cpuclk
create_clock -period [expr 1000.0/($CPUClkFrequency*$ClkMargin)]  -name $CPUClkName [get_ports pll_core_cpuclk]

# JTG_CLOCK
set JTAGClkFrequency 25
set JTAGClkName JTG_CLOCK
set JTAGClkPoint pad_had_jtg_tclk
create_clock -period [expr 1000.0/($JTAGClkFrequency*$ClkMargin)]  -name $JTAGClkName [get_ports pad_had_jtg_tclk]

set CPU_PERIOD [expr 1000.0/($CPUClkFrequency*$ClkMargin)]
set JTG_PERIOD [expr 1000.0/($JTAGClkFrequency*$ClkMargin)]

set CLK_INPUTS               [get_ports {*clk *clock *tck}]
set DATA_INPUTS              [remove_from_collection [all_inputs] $CLK_INPUTS]
# CLIC_CLKx_pa_tcipif_top.x_pa_clic_top.x_clicreg_clk.clk_out
set CLIC_CLK "yes"
if {$CLIC_CLK == "yes"} {
create_generated_clock -name CLIC_CLK -source [get_ports pll_core_cpuclk] -edges {1 2 5} [filter [get_flat_pins x_pa_tcipif_top*x_pa_clic_top*x_clicreg_clk*x_gated_clk_cell/*] direction==out]
set_multicycle_path -from CPU_CLOCK -to CLIC_CLK -setup 2 -start
set_multicycle_path -from CPU_CLOCK -to CLIC_CLK -hold  1 -start
set_multicycle_path -from CLIC_CLK -to CPU_CLOCK -setup 2 -end
set_multicycle_path -from CLIC_CLK -to CPU_CLOCK -hold  1 -end
}

set DC_setup_uncertainty   0.2
set DC_hold_uncertainty    0.08
set DC_max_fanout          32
set DC_max_transition      0.5

if {$PROCESS == "UMC28"} {
  set DC_setup_uncertainty   0.3
}

set_max_fanout $DC_max_fanout [current_design]
set_max_transition $DC_max_transition [current_design]
set_input_transition 0.1 $CLK_INPUTS

set_clock_uncertainty -setup $DC_setup_uncertainty [all_clocks]
set_clock_uncertainty -hold  $DC_hold_uncertainty  [all_clocks]



if {$CLIC_CLK == "yes"} {
  set CLIC_INPUTS [get_ports {pad_clic_int_vld* pad_cpu_ext_int_b pad_cpu_sys_cnt*}]
  set DATA_INPUTS [remove_from_collection $DATA_INPUTS $CLIC_INPUTS]
}


################################################################################
# Ports Constrains
################################################################################
#JTAG Ports
set JTAG_INPUTS  [get_ports {pad_had_jtg_*}]
set JTAG_OUTPUTS [get_ports {had_pad_jtg_*}]
set DATA_INPUTS  [remove_from_collection $DATA_INPUTS $JTAG_INPUTS]
set DATA_OUTPUTS [remove_from_collection [all_outputs] $JTAG_OUTPUTS]

#JTAG Ports
set JTAG_INPUTS  [get_ports {pad_had_jtg_*}]
set JTAG_OUTPUTS [get_ports {had_pad_jtg_*}]
set DATA_INPUTS  [remove_from_collection $DATA_INPUTS $JTAG_INPUTS]
set DATA_OUTPUTS [remove_from_collection [all_outputs] $JTAG_OUTPUTS]

set LOOSE_BUS_CONSTRAIN "no"
if {$LOOSE_BUS_CONSTRAIN == "yes"} {
  set_false_path -from [all_inputs]
  set_false_path -to [all_outputs]
} else {
  #Jtag
  set_input_delay  -max [expr $JTG_PERIOD*0.4] -clock $JTAGClkName $JTAG_INPUTS
  set_input_delay  -min [expr $JTG_PERIOD*0.2] -clock $JTAGClkName $JTAG_INPUTS

  set_output_delay -max [expr $JTG_PERIOD*0.4] -clock $JTAGClkName $JTAG_OUTPUTS
  set_output_delay -min [expr $JTG_PERIOD*0.2] -clock $JTAGClkName $JTAG_OUTPUTS

  #Default IO
  set_input_delay  -max [expr $CPU_PERIOD*0.4] -clock $CPUClkName $DATA_INPUTS
  set_input_delay  -min [expr $CPU_PERIOD*0.2] -clock $CPUClkName $DATA_INPUTS

  set_output_delay -max [expr $CPU_PERIOD*0.4] -clock $CPUClkName $DATA_OUTPUTS
  set_output_delay -min [expr $CPU_PERIOD*0.2] -clock $CPUClkName $DATA_OUTPUTS

  #Timing Critical Ports
  set_input_delay  -max [expr $CPU_PERIOD*0.6] -clock $CPUClkName [get_ports {*hrdata*}]
  set_input_delay  -min [expr $CPU_PERIOD*0.3] -clock $CPUClkName [get_ports {*hrdata*}]

  set_output_delay -max [expr $CPU_PERIOD*0.6] -clock $CPUClkName [get_ports {*haddr* biu_pad_*}]
  set_output_delay -min [expr $CPU_PERIOD*0.3] -clock $CPUClkName [get_ports {*haddr* biu_pad_*}]

}


set_output_delay 0 -clock CPU_CLOCK [get_ports rtu_pad_inst_retire*]
set_output_delay 0 -clock CPU_CLOCK [get_ports rtu_pad_inst_split*]
set_output_delay 0 -clock CPU_CLOCK [get_ports rtu_pad_retire_pc*]
set_output_delay 0 -clock CPU_CLOCK [get_ports rtu_pad_wb_data*]
set_output_delay 0 -clock CPU_CLOCK [get_ports rtu_pad_wb_preg*]
set_output_delay 0 -clock CPU_CLOCK [get_ports rtu_pad_wb_vld*]
set_output_delay 0 -clock CPU_CLOCK [get_ports lsu_pad_sc_pass*]
set_output_delay 0 -clock CPU_CLOCK [get_ports cp0_pad_mcause*]
set_output_delay 0 -clock CPU_CLOCK [get_ports cp0_pad_mintstatus*]
set_output_delay 0 -clock CPU_CLOCK [get_ports cp0_pad_mstatus*]


set_false_path -from CPU_CLOCK    -to JTG_CLOCK
set_false_path -from JTG_CLOCK    -to CPU_CLOCK
set_false_path -from [get_ports pad_cpu_rst_b]
set_false_path -from [get_ports pad_had_rst_b]
set_false_path -from [get_ports {pad_*_dahbl_base* pad_*_dahbl_mask* pad_*_iahbl_base* pad_*_iahbl_mask*}]


set CPUCLK_PER [expr 1000.0/($CPUClkFrequency*$ClkMargin)]
set Gateclk_cell  [remove_from_collection [get_cells -hierarchical *  -filter "ref_name =~ *CKLNQD1BWP*"] [get_cells -hierarchical *  -filter "@full_name=~ *x_clic_clk*"]]

if {$PROCESS == "UMC28"} {
  set_clock_gating_check -setup [expr $CPUCLK_PER*0.2]  [get_cells -hierarchical *  -filter "ref_name =~ *PREICG*"]
} else {
  set_clock_gating_check -setup [expr $CPUCLK_PER*0.2]  [get_cells -hierarchical *  -filter "ref_name =~ *CKLNQD*"]
}
#design for mul two cycle
set_clock_latency  0.2 [get_pins -of_objects [get_cells -hierarchical * -filter "full_name=~*x_pa_iu_mul/mul_ex2_wb_res_*&&is_sequential==true&&is_hierarchical==false&&ref_name!~*CKGT*"] -filter "direction==in&&full_name=~*clocked_on*"]

############################################################
# clock gating varailbes define
############################################################
set ClockGatingSetup [expr 0.1*(1000.0/($CPUClkFrequency*$ClkMargin))]
set ClockGatingHold 0

set ClockGatingSyn true ; # true/false

