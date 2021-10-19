#/*Copyright 2020-2021 T-Head Semiconductor Co., Ltd.
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
#*/
#*/
#*/
CPU_ARCH_FLAG_0 := e906f
CPU_ARCH_FLAG_1 := nodsp
CASE_LIST := \
      debug_2wire_jtag \
      ISA_RV32F \
      dhry \
      memset \
      debug \
      memcp \
      ISA_RV32IMAC \
      csr_rw_extend \
      coremark \
      hello_world \



debug_2wire_jtag_build:
	@cp ./tests/cases/debug_2wire_jtag/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=e906f CPU_ARCH_FLAG_1=nodsp  ENDIAN_MODE=little-endian CASENAME=debug_2wire_jtag FILE=E906_DEBUG_PATTERN >& debug_2wire_jtag_build.case.log 


ISA_RV32F_build:
	@cp ./tests/cases/ISA/RV32F/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=e906f CPU_ARCH_FLAG_1=nodsp  ENDIAN_MODE=little-endian CASENAME=ISA_RV32F FILE=E906_RV32F_INSTRUCTIONS >& ISA_RV32F_build.case.log 


dhry_build:
	@cp ./tests/cases/dhry/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cp ./tests/lib/clib/* ./work
	@cp ./tests/lib/newlib_wrap/* ./work
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=e906f CPU_ARCH_FLAG_1=nodsp  ENDIAN_MODE=little-endian CASENAME=dhry FILE=dhry_1_main >& dhry_build.case.log 


memset_build:
	@cp ./tests/cases/memset/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cp ./tests/lib/clib/* ./work
	@cp ./tests/lib/newlib_wrap/* ./work
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=e906f CPU_ARCH_FLAG_1=nodsp  ENDIAN_MODE=little-endian CASENAME=memset FILE=mem_set_main >& memset_build.case.log 


debug_build:
	@cp ./tests/cases/debug/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=e906f CPU_ARCH_FLAG_1=nodsp  ENDIAN_MODE=little-endian CASENAME=debug FILE=E906_DEBUG_PATTERN >& debug_build.case.log 


memcp_build:
	@cp ./tests/cases/memcp/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cp ./tests/lib/clib/* ./work
	@cp ./tests/lib/newlib_wrap/* ./work
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=e906f CPU_ARCH_FLAG_1=nodsp  ENDIAN_MODE=little-endian CASENAME=memcp FILE=mem_copy_main >& memcp_build.case.log 




ISA_RV32IMAC_build:
	@cp ./tests/cases/ISA/RV32IMAC/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=e906f CPU_ARCH_FLAG_1=nodsp  ENDIAN_MODE=little-endian CASENAME=ISA_RV32IMAC FILE=E906_RV32IMAC_INSTRUCTIONS >& ISA_RV32IMAC_build.case.log 



csr_rw_extend_build:
	@cp ./tests/cases/csr/csr_rw_extend/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=e906f CPU_ARCH_FLAG_1=nodsp  ENDIAN_MODE=little-endian CASENAME=csr_rw_extend FILE=E906_EXTEND_CSR_RW >& csr_rw_extend_build.case.log 


coremark_build:
	@cp ./tests/cases/coremark/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cp ./tests/lib/clib/* ./work
	@cp ./tests/lib/newlib_wrap/* ./work
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=e906f CPU_ARCH_FLAG_1=nodsp  ENDIAN_MODE=little-endian CASENAME=coremark FILE=core_main >& coremark_build.case.log 


hello_world_build:
	@cp ./tests/cases/hello_world/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cp ./tests/lib/clib/* ./work
	@cp ./tests/lib/newlib_wrap/* ./work
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=e906f CPU_ARCH_FLAG_1=nodsp  ENDIAN_MODE=little-endian CASENAME=hello_world FILE=hello_world_main >& hello_world_build.case.log 



# Adjust verilog filelist for *.v case...
ifeq ($(CASE), debug_2wire_jtag)
SIM_FILELIST := ../tests/cases/debug_2wire_jtag/_TEST_MACRO_2_WIRE_JTAG.vh ../tests/cases/debug_2wire_jtag/JTAG_DRV.vh ../tests/cases/debug_2wire_jtag/E906_DEBUG_PATTERN.v
endif
ifeq ($(CASE), debug)
SIM_FILELIST := ../tests/cases/debug/JTAG_DRV.vh ../tests/cases/debug/E906_DEBUG_PATTERN.v
endif


define newline


endef


