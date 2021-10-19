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
##//set PSR
.macro SETFPU
  li x1,0x2000
  csrrs x0, mstatus,x1
##//  cpseti 1
.endm

##//set fxcr
.macro FXCR_DQNaN IMM
  #write DqNaN
  li     x9,0x200000
  csrc   fxcr,x9
  csrr   x9,fxcr
  li     x10, \IMM
  slli   x10,x10,23
  or     x9,x9,x10
  csrw   fxcr,x9
.endm



##//SET single precision number, 1
.macro FPUMOVS FDESREG, IMME32, IMM_REG
  li \IMM_REG, \IMME32
  fmv.w.x \FDESREG, \IMM_REG
.endm

##//Send double format data to frx
.macro FPUMOVD FDESREG,IMME64H,IMME64L,IMM_REG
  li \IMM_REG, \IMME64L
  fmv.w.x \FDESREG, \IMM_REG
  li \IMM_REG, \IMME64H
  fmv.hw.x \FDESREG, \IMM_REG
.endm

##//for 32FD
##//only high 32bits are all 1 and low 32bits are equal to expect result, IMM_REG0 will be 0xffffffff
##// A:high 32bits of freg                B:low 32bits of freg
##// C:high 32bits of expect result       D:low 32bits of expect result
##// C = 32'hffffffff
##// not(A xor B) and not(C xor D) = not(A xor B) and D
##//====================================================================
##//if not define FPU_DOUBLE
##//for 32F
.macro FPUSCHECKS FDESREG, EXPNUM, IMM_REG0, IMM_REG1
  fmv.x.w \IMM_REG1, \FDESREG
  li \IMM_REG0, \EXPNUM
.endm

##//Check double
##//check 64 bits data in frx
##// A:high 32bits of freg                B:low 32bits of freg
##// C:high 32bits of expect result       D:low 32bits of expect result
##// not(A xor B) and not(C xor D)
.macro FPUSCHECKD FDESREG, EXPNUMH, EXPNUML, IMM_REG0, IMM_REG1
  fmv.x.hw \IMM_REG1, \FDESREG
  li \IMM_REG0, \EXPNUMH
  xor \IMM_REG0, \IMM_REG0, \IMM_REG1
  not \IMM_REG0, \IMM_REG0
  sw \IMM_REG0, -100(x2)
  fmv.x.w \IMM_REG1, \FDESREG
  li \IMM_REG0, \EXPNUML
  xor \IMM_REG1, \IMM_REG0, \IMM_REG1
  not \IMM_REG1, \IMM_REG1
  lw \IMM_REG0, -100(x2)
  and \IMM_REG0, \IMM_REG0, \IMM_REG1
  li \IMM_REG1, 0xffffffff
.endm

.macro FPUEXCHK EXPNUM32, IMM_REG0, IMM_REG1
  #//to see if fccee is enabled
  li   \IMM_REG0, 0x7f
  csrrs \IMM_REG1,fxcr,x0
  csrrc x0,fxcr, \IMM_REG0  #//clear flag bits
  and  \IMM_REG0, \IMM_REG0,\IMM_REG1
  li   \IMM_REG1, \EXPNUM32
.endm

.macro FPUEXCHK_REG IMM_REG0, IMM_REG1
  li   \IMM_REG0, 0x3f
  csrrs \IMM_REG1,fxcr,x0
  csrrc x0,fxcr, \IMM_REG0  #//clear flag bits
  and  \IMM_REG1, \IMM_REG0,\IMM_REG1
  mv   \IMM_REG0, \IMM_REG1
.endm

##//#//Set qNaN of FCR and other bits don't change
##//0--- compatible with ck860  1----- compatible with IEEE-754
.macro  FPUQNANCH IMME2, IMM_REG0   ##//imm_reg0 is a tmp reg
  csrrs  x18, fxcr,x0
  li   \IMM_REG0, 0xff7fffff
  and x18,\IMM_REG0,x18
  li  \IMM_REG0, \IMME2
  slli  \IMM_REG0,\IMM_REG0, 23             #//left shift 23  bits
  or    \IMM_REG0, \IMM_REG0,x18            #//set the current QNAN
  csrrw  x0, fxcr,\IMM_REG0        #//put in relative vcr
.endm

##//
##//#//Set RM of FCR and other bits don't change
##//#//0--->nearest  1--->0  2--->+inf   3--->-inf
##//imm_reg0 is a tmp reg
.macro  FPURMCH IMME2 , IMM_REG0
  li x18, 0xf8ffffff
  csrrs \IMM_REG0, fxcr, x0
  and \IMM_REG0, \IMM_REG0,x18
  li x18,\IMME2
  slli x18, x18,24
  or x18, x18,\IMM_REG0
  csrrw x0, fxcr,x18
.endm

##//#//Set FM of FCR and other bits don't change
##//#//IMM1=3---->flush denomalized number to signed zero
##//#//IMM1=2---->flush denomalized number to minimal normal number
.macro FPUFMCH IMM1 , IMM_REG0
  li \IMM_REG0, 0xe7ffffff
  csrrs x18, fxcr, x0
  and \IMM_REG0, x18,\IMM_REG0
  li x18, \IMM1
  slli x18, x18,27
  or x18, x18,\IMM_REG0
  csrrw x0, fxcr,x18
.endm


###################################################################################

##//use scalar single inst,data as the input source,do selfcheck
.macro ADDS_SC SOURCE1, SOURCE2, RESULT, EXPNUM32
  FPUMOVS f1,\SOURCE1,x3
  FPUMOVS f2,\SOURCE2,x3
  fadd.s f12, f1 , f2
  #//CHECK
  FPUSCHECKS f12, \RESULT,x3,x4
  bne x4,x3, RESULTFAIL
  FPUEXCHK \EXPNUM32 , x3, x4
  bne x3,x4, FLAGCFAIL
.endm


##//use scalar single inst,data as the input source,no selfcheck
.macro ADDS_NOSC SOURCE1, SOURCE2, IMM1, IMM2  ##//NO USE
  FPUMOVS f1 , \SOURCE1, x3
  FPUMOVS f2 , \SOURCE2, x3
  fadd.s f12, f1 , f2
.endm


##//use scalar single inst,data as the input source,no selfcheck
.macro ADDS_NOSC_TWO_INPUT SOURCE1, SOURCE2
  FPUMOVS f1 , \SOURCE1, x3
  FPUMOVS f2 , \SOURCE2, x3
  fadd.s f12, f1 , f2
.endm


##//use scalar double inst,data as the input source,do selfcheck
.macro ADDD_SC SOURCE1H, SOURCE1L, SOURCE2H, SOURCE2L, RESULTH, RESULTL, EXPNUM32
  FPUMOVD f1 , \SOURCE1H, \SOURCE1L, x3
  FPUMOVD f2 , \SOURCE2H, \SOURCE2L, x3
  fadd.d f12, f1 , f2
  FPUSCHECKD f12, \RESULTH, \RESULTL, x3, x4
  bne x3,x4, RESULTFAIL
  FPUEXCHK \EXPNUM32 , x3, x4
  bne x3,x4,  FLAGCFAIL
.endm


##//use scalar double inst,data as the input source,no selfcheck
.macro ADDD_NOSC SOURCE1H, SOURCE1L, SOURCE2H, SOURCE2L, IMM1, IMM2, IMM3
  FPUMOVD f1 , \SOURCE1H, \SOURCE1L, x3
  FPUMOVD f2 , \SOURCE2H, \SOURCE2L, x3
  fadd.d f12, f1 , f2
.endm


##//use scalar single inst,vreg as the input source,do selfcheck
.macro ADDS_VR FDESREG0, FDESREG1, RESULT, EXPNUM32
  FPUMOVS f12, SpZero  , x3#//PUT CASE TOP
  fadd.s f12, \FDESREG0 , \FDESREG1
 #//CHECK
  FPUSCHECKS f12, \RESULT, x3,x4
  bne x3, x4, RESULTFAIL
  FPUEXCHK \EXPNUM32 , x3, x4  #//close self check
  bne x3,x4, FLAGCFAIL
.endm


##//just delate self_check
##//use scalar single inst,vreg as the input source,no selfcheck
.macro ADDS_VR_NOSC FDESREG0, FDESREG1, RESULT, EXPNUM32
  FPUMOVS f12, SpZero  , x3#//PUT CASE TOP
  fadd.s f12, \FDESREG0 , \FDESREG1
.endm


##//use single sub inst
.macro SUBS_SC IMM1, IMM2, IMM3, EXPNUM32
  FPUMOVS f1 , \IMM1, x3
  FPUMOVS f2 , \IMM2, x3
  fsub.s f12, f1 , f2
  #//CHECK
  FPUSCHECKS f12,\IMM3,x3,x4
  bne x3,x4, RESULTFAIL
  FPUEXCHK \EXPNUM32 , x4, x3
  bne x3,x4,  FLAGCFAIL
.endm


##//use sigle sub inst NOSC
.macro SUBS_NOSC  IMM1, IMM2, IMM3, EXPNUM32
  FPUMOVS f1 , \IMM1, x3
  FPUMOVS f2 , \IMM2, x3
  fsub.s f12, f1 , f2
.endm


##//use sigle sub inst NOSC
.macro SUBS_NOSC_TWO_INPUT  IMM1, IMM2
  FPUMOVS f1 , \IMM1, x3
  FPUMOVS f2 , \IMM2, x3
  fsub.s f12, f1 , f2
.endm


##//use double sub inst
.macro SUBD_SC SOURCE1H, SOURCE1L, SOURCE2H, SOURCE2L, RESULTH, RESULTL, EXPNUM32
  FPUMOVD f1 , \SOURCE1H, \SOURCE1L, x3
  FPUMOVD f2 , \SOURCE2H, \SOURCE2L, x3
  fsub.d f12, f1 , f2

  FPUSCHECKD f12, \RESULTH, \RESULTL, x3, x4
  bne x3,x4, RESULTFAIL
  FPUEXCHK \EXPNUM32 , x3, x4
  bne x3,x4, FLAGCFAIL
.endm


##//for nosc
.macro SUBD_NOSC SOURCE1H, SOURCE1L, SOURCE2H, SOURCE2L, RESULTH, RESULTL, EXPNUM32
  FPUMOVD f1, \SOURCE1H, \SOURCE1L, x3
  FPUMOVD f2, \SOURCE2H, \SOURCE2L, x3
  fsub.d f12, f1 , f2
.endm

.macro FPURMCH_REG IMM_REG0, IMM_REG1
  li \IMM_REG1, 0x7000000
  csrrc x0, fxcr, \IMM_REG1
  slli \IMM_REG0, \IMM_REG0,24
  csrrs x0, fxcr,\IMM_REG0
#  //restore \IMM_REG0
  srli \IMM_REG0, \IMM_REG0,24

.endm

.macro EXIT
  fence
  la   x1, __exit
  jr   x1
.endm

.macro FAIL
  fence
  la   x1, __fail 
  jr   x1
.endm  

#//==========================================================
#// single format
#//==========================================================
.set SpsNaN,   0x7f800001 #//0_111'1111'1_000'0000'0000'0000'0000'0001
.set SnsNaN,   0xff800001 #//1_111'1111'1_000'0000'0000'0000'0000'0001
.set SpqNaN,   0x7fc00000 #//0_111'1111'1_100'0000'0000'0000'0000'0000
.set SnqNaN,   0xffc00000 #//1_111'1111'1_100'0000'0000'0000'0000'0000
.set SpInf,    0x7f800000 #//0_111'1111'1_000'0000'0000'0000'0000'0000
.set SnInf,    0xff800000 #//1_111'1111'1_000'0000'0000'0000'0000'0000
.set SpNorm,   0x3f000000 #//0_011'1111'0_000'0000'0000'0000'0000'0000 (+0.5)
.set SnNorm,   0xbf000000 #//1_011'1111'0_000'0000'0000'0000'0000'0000 (-0.5)
.set SpDeNorm, 0x00000001 #//0_000'0000'0_000'0000'0000'0000'0000'0001
.set SnDeNorm, 0x80000001 #//1_000'0000'0_000'0000'0000'0000'0000'0001
.set SpZero,   0x00000000 #//0_000'0000'0_000'0000'0000'0000'0000'0000
.set SnZero,   0x80000000 #//1_000'0000'0_000'0000'0000'0000'0000'0000
.set SpLFN,    0x7f7fffff #//0_111'1111'0_111'1111'1111'1111'1111'1111
.set SnLFN,    0xff7fffff #//1_111'1111'0_111'1111'1111'1111'1111'1111
.set SpMIN,    0x00800000 #//0_000'0000'1_000'0000'0000'0000'0000'0000
.set SnMIN,    0x80800000 #//1_000'0000'1_000'0000'0000'0000'0000'0000
.set SpOne,    0x3f800000 #//+1.0

.set SpSPECIAL_1,  0x3f000001 #//0_011'1111'0_000'0000'0000'0000'0000'0001
.set SnSPECIAL_1,  0xbf000001 #//1_011'1111'0_000'0000'0000'0000'0000'0001
.set SpSPECIAL_2,  0x3effffff #//0_011'1110'1_111'1111'1111'1111'1111'1111
.set SnSPECIAL_2,  0xbeffffff #//1_011'1110'1_111'1111'1111'1111'1111'1111
.set SpSPECIAL_3,  0x00000002 #//0_000'0000'0_000'0000'0000'0000'0000'0010
.set SnSPECIAL_3,  0x80000002 #//1_000'0000'0_000'0000'0000'0000'0000'0010
.set SpONE,  0x3f800000 #//0_011'1111'1_000'0000'0000'0000'0000'0000
.set SnONE,  0xbf800000 #//1_011'1111'1_000'0000'0000'0000'0000'0000

#//==========================================================
#//    deformal
#//==========================================================
#// Single
.set SpNmMAX,  0x7f7fffff #//0_111'1111'0_111'1111'1111'1111'1111'1111
.set SpNmMIN,  0x00800000 #//0_000'0000'1_000'0000'0000'0000'0000'0000
.set SnNmMAX,  0xff7fffff #//1_111'1111'0_111'1111'1111'1111'1111'1111
.set SnNmMIN,  0x80800000 #//1_000'0000'1_000'0000'0000'0000'0000'0000
.set SpDmMAX,  0x007fffff #//0_000'0000'0_111'1111'1111'1111'1111'1111
.set SpDmMIN,  0x00000001 #//0_000'0000'0_000'0000'0000'0000'0000'0001
.set SnDmMAX,  0x807fffff #//1_000'0000'0_111'1111'1111'1111'1111'1111
.set SnDmMIN,  0x80000001 #//0_000'0000'0_000'0000'0000'0000'0000'0001
.set SpqNaN1,  0x7fc00001 #//0_111'1111'1_100'0000'0000'0000'0000'0000
.set SnqNaN1,  0xffc00001 #//1_111'1111'1_100'0000'0000'0000'0000'0000


.text
.align 2
.global main
main:
    li              x3 , 0x6000
    csrs            mstatus, x3 
    li              x3 , 0x400000
    csrs            mxstatus, x3 
.global TEST1
TEST1:
    FPURMCH         0  , x4 
    FPUMOVS         f4 , 0x00800001, x4 
    FPUMOVS         f7 , 0x80800000, x4 
    ADDS_VR         f4 , f7 , 0x00000001, 0x0000
.global TEST2
TEST2:
    FPURMCH         1  , x4 
    FPUMOVS         f0 , SpLFN, x4 
    FPUMOVS         f2 , 0x73000000, x4 
    ADDS_VR         f0 , f2 , SpLFN, 0x00000021
.global TEST3
TEST3:
    FPURMCH         3  , x4 
    FPUMOVS         f0 , SpLFN, x4 
    FPUMOVS         f2 , 0x73000000, x4 
    ADDS_VR         f0 , f2 , SpInf, 0x00000025
.global TEST4
TEST4:
    FPURMCH         2  , x4 
    FPUMOVS         f5 , 0x80800001, x4 
    FPUMOVS         f6 , 0x00800000, x4 
    ADDS_VR         f5 , f6 , 0x80000001, 0x0000
.global TEST5
TEST5:
    FPURMCH         4  , x4 
    FPUMOVS         f4 , 0x00800001, x4 
    FPUMOVS         f7 , 0x80800000, x4 
    ADDS_VR         f4 , f7 , 0x00000001, 0x0
    FPUMOVS         f1 , 0x3f800000, x3 
    FPUMOVS         f2 , 0x3f000000, x3 
.global FADDS_STATIC_1
FADDS_STATIC_1:
    fadd.s          f3 , f1 , f2 , rne
    FPUSCHECKS      f3 , 0x3fc00000, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
.global FADDS_STATIC_2
FADDS_STATIC_2:
    fadd.s          f3 , f1 , f2 , rtz
    FPUSCHECKS      f3 , 0x3fc00000, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
.global FADDS_STATIC_3
FADDS_STATIC_3:
    fadd.s          f3 , f1 , f2 , rdn
    FPUSCHECKS      f3 , 0x3fc00000, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
.global FADDS_STATIC_4
FADDS_STATIC_4:
    fadd.s          f3 , f1 , f2 , rup
    FPUSCHECKS      f3 , 0x3fc00000, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
.global FADDS_STATIC_5
FADDS_STATIC_5:
    fadd.s          f3 , f1 , f2 , rmm
    FPUSCHECKS      f3 , 0x3fc00000, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
    FPURMCH         0  , x4 
    SUBS_SC         0x4dffffff, 0x40800000, 0x4dffffff, 0x00000021
    FPURMCH         1  , x4 
    SUBS_SC         SpLFN, 0xf3000000, SpLFN, 0x00000021
    FPURMCH         3  , x4 
    SUBS_SC         SpLFN, 0xf3000000, SpInf, 0x00000025
    FPURMCH         2  , x4 
    SUBS_SC         0x80800001, 0x80800000, 0x80000001, 0x000000
    FPURMCH         4  , x4 
    SUBS_SC         0x4dffffff, 0x40800000, 0x4dffffff, 0x00000021
    FPUMOVS         f1 , 0x3f800000, x3 
    FPUMOVS         f2 , 0x3f000000, x3 
.global SUBS_STATIC_1
SUBS_STATIC_1:
    fsub.s          f3 , f1 , f2 , rne
    FPUSCHECKS      f3 , 0x3f000000, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
.global SUBS_STATIC_2
SUBS_STATIC_2:
    fsub.s          f3 , f1 , f2 , rtz
    FPUSCHECKS      f3 , 0x3f000000, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
.global SUBS_STATIC_3
SUBS_STATIC_3:
    fsub.s          f3 , f1 , f2 , rdn
    FPUSCHECKS      f3 , 0x3f000000, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
.global SUBS_STATIC_4
SUBS_STATIC_4:
    fsub.s          f3 , f1 , f2 , rup
    FPUSCHECKS      f3 , 0x3f000000, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
.global SUBS_STATIC_5
SUBS_STATIC_5:
    fsub.s          f3 , f1 , f2 , rmm
    FPUSCHECKS      f3 , 0x3f000000, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
    FPURMCH         0  , x4 
    FPUMOVS         f9 , SnDeNorm, x4 
.global INST5
INST5:
    fabs.s          f12, f9 
    FPUSCHECKS      f12, SpDeNorm, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    FPUMOVS         f0 , SpsNaN, x4 
.global INST7
INST7:
    fneg.s          f12, f0 
    FPUSCHECKS      f12, SnsNaN, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    FPUMOVS         f0 , 0xbf7fffff, x4 
.global INST15
INST15:
    fcvt.w.s        x15, f0 
    li              x1 , 0xffffffff
    bne             x1 , x15, RESULTFAIL
    FPUEXCHK        0x00000021, x4 , x3 
    bne             x3 , x4 , FLAGCFAIL
    FPUMOVS         f0 , 0xbf800000, x4 
.global INST15_1
INST15_1:
    fcvt.w.s        x15, f0 , rne
    li              x1 , 0xffffffff
    bne             x1 , x15, RESULTFAIL
.global INST15_2
INST15_2:
    fcvt.w.s        x15, f0 , rtz
    li              x1 , 0xffffffff
    bne             x1 , x15, RESULTFAIL
.global INST15_3
INST15_3:
    fcvt.w.s        x15, f0 , rdn
    li              x1 , 0xffffffff
    bne             x1 , x15, RESULTFAIL
.global INST15_4
INST15_4:
    fcvt.w.s        x15, f0 , rup
    li              x1 , 0xffffffff
    bne             x1 , x15, RESULTFAIL
.global INST15_5
INST15_5:
    fcvt.w.s        x15, f0 , rmm
    li              x1 , 0xffffffff
    bne             x1 , x15, RESULTFAIL
    FPUMOVS         f0 , 0x3fc00000, x4 
.global INST16
INST16:
    fcvt.wu.s       x15, f0 
    li              x1 , 0x00000002
    bne             x1 , x15, RESULTFAIL
    FPUEXCHK        0x00000021, x4 , x3 
    bne             x3 , x4 , FLAGCFAIL
.global INST16_1
INST16_1:
    fcvt.wu.s       x15, f0 , rne
    li              x1 , 0x00000002
    bne             x1 , x15, RESULTFAIL
.global INST16_2
INST16_2:
    fcvt.wu.s       x15, f0 , rtz
    li              x1 , 0x00000001
    bne             x1 , x15, RESULTFAIL
.global INST16_3
INST16_3:
    fcvt.wu.s       x15, f0 , rdn
    li              x1 , 0x00000001
    bne             x1 , x15, RESULTFAIL
.global INST16_4
INST16_4:
    fcvt.wu.s       x15, f0 , rup
    li              x1 , 0x00000002
    bne             x1 , x15, RESULTFAIL
.global INST16_5
INST16_5:
    fcvt.wu.s       x15, f0 , rmm
    li              x1 , 0x00000002
    bne             x1 , x15, RESULTFAIL
    li              x1 , 0x7fffffff
.global INST23
INST23:
    fcvt.s.w        f15, x1 
    FPUSCHECKS      f15, 0x4f000000, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    FPUEXCHK        0x21, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    li              x1 , 0xfffff001
    FPUMOVS         f15, SpqNaN, x3 
.global INST23_1
INST23_1:
    fcvt.s.w        f15, x1 , rne
    FPUSCHECKS      f15, 0xc57ff000, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    FPUMOVS         f15, SpqNaN, x3 
.global INST23_2
INST23_2:
    fcvt.s.w        f15, x1 , rtz
    FPUSCHECKS      f15, 0xc57ff000, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    FPUMOVS         f15, SpqNaN, x3 
.global INST23_3
INST23_3:
    fcvt.s.w        f15, x1 , rdn
    FPUSCHECKS      f15, 0xc57ff000, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    FPUMOVS         f15, SpqNaN, x3 
.global INST23_4
INST23_4:
    fcvt.s.w        f15, x1 , rup
    FPUSCHECKS      f15, 0xc57ff000, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    FPUMOVS         f15, SpqNaN, x3 
.global INST23_5
INST23_5:
    fcvt.s.w        f15, x1 , rmm
    FPUSCHECKS      f15, 0xc57ff000, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    li              x1 , 0xffffffff
.global INST24
INST24:
    fcvt.s.wu       f15, x1 
    FPUSCHECKS      f15, 0x4f800000, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    FPUEXCHK        0x21, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    li              x1 , 0xfff
    FPUMOVS         f15, SpqNaN, x3 
.global INST24_1
INST24_1:
    fcvt.s.wu       f15, x1 , rne
    FPUSCHECKS      f15, 0x457ff000, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    FPUMOVS         f15, SpqNaN, x3 
.global INST24_2
INST24_2:
    fcvt.s.wu       f15, x1 , rtz
    FPUSCHECKS      f15, 0x457ff000, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    FPUMOVS         f15, SpqNaN, x3 
.global INST24_3
INST24_3:
    fcvt.s.wu       f15, x1 , rdn
    FPUSCHECKS      f15, 0x457ff000, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    FPUMOVS         f15, SpqNaN, x3 
.global INST24_4
INST24_4:
    fcvt.s.wu       f15, x1 , rup
    FPUSCHECKS      f15, 0x457ff000, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
    FPUMOVS         f15, SpqNaN, x3 
.global INST24_5
INST24_5:
    fcvt.s.wu       f15, x1 , rmm
    FPUSCHECKS      f15, 0x457ff000, x4 , x3 
    bne             x3 , x4 , RESULTFAIL
.global A2
A2:
    FPUMOVS         f1  0xfbc00000, x4 
    fmv.x.w         x4 , f1 
    li              x1 , 0xfbc00000
    bne             x1 , x4 , RESULTFAIL
.global FSGNJS
FSGNJS:
    FPUMOVS         f1 , SpZero, x3 
    FPUMOVS         f2 , SnInf, x3 
    FPUMOVS         f15, SpsNaN, x3 
.global INST38
INST38:
    fsgnj.s         f15, f1 , f2 
    FPUSCHECKS      f15, SnZero, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
.global FSGNJNS
FSGNJNS:
    FPUMOVS         f1 , SpZero, x3 
    FPUMOVS         f2 , SpInf, x3 
    FPUMOVS         f15, SpsNaN, x3 
.global INST40
INST40:
    fsgnjn.s        f15, f1 , f2 
    FPUSCHECKS      f15, SnZero, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
.global FSGNJXS
FSGNJXS:
    FPUMOVS         f1 , SnZero, x3 
    FPUMOVS         f2 , SpInf, x3 
    FPUMOVS         f15, SpsNaN, x3 
.global INST42
INST42:
    fsgnjx.s        f15, f1 , f2 
    FPUSCHECKS      f15, SnZero, x3 , x4 
    bne             x3 , x4 , RESULTFAIL
.global FCLASSS
FCLASSS:
    FPUMOVS         f1 , SnInf, x3 
.global INST44
INST44:
    fclass.s        x1 , f1 
    li              x3 , 0x1
    bne             x1 , x3 , RESULTFAIL
    FPUMOVS         f1 , SnqNaN, x3 
.global INST45
INST45:
    fclass.s        x1 , f1 
    li              x3 , 0x200
    bne             x1 , x3 , RESULTFAIL
    FPUMOVS         f0 , 0x7f801111, x4 
    FPUMOVS         f1 , 0x7f800111, x4 
    FPUMOVS         f2 , 0x7fc00011, x4 
    FPUMOVS         f3 , 0x7fc00010, x4 
    FPUMOVS         f4 , SpInf, x4 
    FPUMOVS         f5 , SnInf, x4 
    FPUMOVS         f6 , SpNorm, x4 
    FPUMOVS         f7 , SnNorm, x4 
    FPUMOVS         f8 , SpDeNorm, x4 
    FPUMOVS         f9 , SnDeNorm, x4 
    FPUMOVS         f10, SpZero, x4 
    FPUMOVS         f11, SnZero, x4 
.global FMAXSTEST
FMAXSTEST:
.global INST48
INST48:
    fmax.s          f15, f0 , f4 
    FPUSCHECKS      f15, SpqNaN, x4 , x3 
    bne             x3 , x4 , FMAXSFAIL
    FPUEXCHK        0x30, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST49
INST49:
    fmax.s          f15, f2 , f6 
    FPUSCHECKS      f15, SpNorm, x4 , x3 
    bne             x3 , x4 , FMAXSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST50
INST50:
    fmax.s          f15, f6 , f7 
    FPUSCHECKS      f15, SpNorm, x4 , x3 
    bne             x3 , x4 , FMAXSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global FMINSTEST
FMINSTEST:
    fmin.s          f15, f0 , f4 
    FPUSCHECKS      f15, SpqNaN, x4 , x3 
    bne             x3 , x4 , FMINSFAIL
    FPUEXCHK        0x30, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST55
INST55:
    fmin.s          f15, f2 , f6 
    FPUSCHECKS      f15, SpNorm, x4 , x3 
    bne             x3 , x4 , FMINSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST56
INST56:
    fmin.s          f15, f6 , f7 
    FPUSCHECKS      f15, SnNorm, x4 , x3 
    bne             x3 , x4 , FMINSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global FEQSTEST
FEQSTEST:
    feq.s           x1 , f0 , f6 
    bne             x1 , x0 , FEQSFAIL
    FPUEXCHK        0x30, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST61
INST61:
    feq.s           x1 , f2 , f4 
    bne             x1 , x0 , FEQSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST62
INST62:
    feq.s           x1 , f7 , f7 
    li              x3 , 0x1
    bne             x1 , x3 , FEQSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global FLESTEST
FLESTEST:
.global INST63
INST63:
    fle.s           x1 , f0 , f6 
    bne             x1 , x0 , FLESFAIL
    FPUEXCHK        0x30, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST64
INST64:
    fle.s           x1 , f2 , f4 
    bne             x1 , x0 , FLESFAIL
    FPUEXCHK        0x30, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST65
INST65:
    fle.s           x1 , f7 , f6 
    li              x3 , 0x1
    bne             x1 , x3 , FLESFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global FLTSTEST
FLTSTEST:
    flt.s           x1 , f0 , f6 
    bne             x1 , x0 , FLTSFAIL
    FPUEXCHK        0x30, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST67
INST67:
    flt.s           x1 , f2 , f4 
    bne             x1 , x0 , FLTSFAIL
    FPUEXCHK        0x30, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST68
INST68:
    flt.s           x1 , f7 , f6 
    li              x3 , 0x1
    bne             x1 , x3 , FLTSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUMOVS         f0 , 0x7f801111, x4 
    FPUMOVS         f1 , 0x7f800111, x4 
    FPUMOVS         f2 , 0x7fc00011, x4 
    FPUMOVS         f3 , 0x7fc00010, x4 
    FPUMOVS         f4 , SpInf, x4 
    FPUMOVS         f5 , SnInf, x4 
    FPUMOVS         f6 , 0x40827900, x4 
    FPUMOVS         f7 , 0xc0838000, x4 
    FPUMOVS         f8 , SpDeNorm, x4 
    FPUMOVS         f9 , SnDeNorm, x4 
    FPUMOVS         f10, SpZero, x4 
    FPUMOVS         f11, SnZero, x4 
.global FDIVS
FDIVS:
.global INST90
INST90:
    fdiv.s          f15, f0 , f1 
    FPUSCHECKS      f15, SpqNaN, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
    FPUEXCHK        0x30, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST91
INST91:
    fdiv.s          f15, f2 , f6 
    FPUSCHECKS      f15, SpqNaN, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST92
INST92:
    fdiv.s          f15, f6 , f7 
    FPUSCHECKS      f15, 0xbf7e0000, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST93
INST93:
    fdiv.s          f15, f4 , f5 
    FPUSCHECKS      f15, SpqNaN, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
    FPUEXCHK        0x30, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST94
INST94:
    fdiv.s          f15, f10, f11
    FPUSCHECKS      f15, SpqNaN, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
    FPUEXCHK        0x30, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUMOVS         f20, 0x71f00000, x3 
    FPUMOVS         f21, 0x58c00000, x3 
.global INST94_1
INST94_1:
    fdiv.s          f15, f20, f21, rne
    FPUSCHECKS      f15, 0x58a00000, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST94_2
INST94_2:
    fdiv.s          f15, f20, f21, rtz
    FPUSCHECKS      f15, 0x58a00000, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST94_3
INST94_3:
    fdiv.s          f15, f20, f21, rdn
    FPUSCHECKS      f15, 0x58a00000, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST94_4
INST94_4:
    fdiv.s          f15, f20, f21, rup
    FPUSCHECKS      f15, 0x58a00000, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST94_5
INST94_5:
    fdiv.s          f15, f20, f21, rmm
    FPUSCHECKS      f15, 0x58a00000, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUQNANCH       1  , x4 
.global INST95
INST95:
    fdiv.s          f15, f0 , f1 
    FPUSCHECKS      f15, 0x7fc01111, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
.global INST96
INST96:
    fdiv.s          f15, f2 , f1 
    FPUSCHECKS      f15, 0x7fc00111, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
.global INST97
INST97:
    fdiv.s          f15, f4 , f4 
    FPUSCHECKS      f15, SpqNaN, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
.global INST98
INST98:
    fdiv.s          f15, f10, f11
    FPUSCHECKS      f15, SpqNaN, x4 , x3 
    bne             x3 , x4 , FDIVSFAIL
    FPUQNANCH       0  , x4 
.global FSQRTS
FSQRTS:
    fsqrt.s         f15, f0 
    FPUSCHECKS      f15, SpqNaN, x4 , x3 
    bne             x3 , x4 , FSQRTSFAIL
    FPUEXCHK        0x30, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST100
INST100:
    fsqrt.s         f15, f3 
    FPUSCHECKS      f15, SpqNaN, x4 , x3 
    bne             x3 , x4 , FSQRTSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST101
INST101:
    fsqrt.s         f15, f6 
    FPUSCHECKS      f15, 0x40013afc, x4 , x3 
    bne             x3 , x4 , FSQRTSFAIL
    FPUEXCHK        0x21, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUMOVS         f20, 0x71a20000, x3 
.global INST101_1
INST101_1:
    fsqrt.s         f15, f20, rne
    FPUSCHECKS      f15, 0x58900000, x4 , x3 
    bne             x3 , x4 , FSQRTSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUMOVS         f15, SpqNaN, x3 
.global INST101_2
INST101_2:
    fsqrt.s         f15, f20, rtz
    FPUSCHECKS      f15, 0x58900000, x4 , x3 
    bne             x3 , x4 , FSQRTSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUMOVS         f15, SpqNaN, x3 
.global INST101_3
INST101_3:
    fsqrt.s         f15, f20, rdn
    FPUSCHECKS      f15, 0x58900000, x4 , x3 
    bne             x3 , x4 , FSQRTSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUMOVS         f15, SpqNaN, x3 
.global INST101_4
INST101_4:
    fsqrt.s         f15, f20, rup
    FPUSCHECKS      f15, 0x58900000, x4 , x3 
    bne             x3 , x4 , FSQRTSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUMOVS         f15, SpqNaN, x3 
.global INST101_5
INST101_5:
    fsqrt.s         f15, f20, rmm
    FPUSCHECKS      f15, 0x58900000, x4 , x3 
    bne             x3 , x4 , FSQRTSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUQNANCH       1  , x4 
.global INST102
INST102:
    fsqrt.s         f15, f0 
    FPUSCHECKS      f15, 0x7fc01111, x4 , x3 
    bne             x3 , x4 , FSQRTSFAIL
.global INST103
INST103:
    fsqrt.s         f15, f2 
    FPUSCHECKS      f15, 0x7fc00011, x4 , x3 
    bne             x3 , x4 , FSQRTSFAIL
.global INST104
INST104:
    fsqrt.s         f15, f5 
    FPUSCHECKS      f15, SpqNaN, x4 , x3 
    bne             x3 , x4 , FSQRTSFAIL
    FPUEXCHK        0x30, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUQNANCH       0  , x4 
.global FMULS
FMULS:
    FPUMOVS         f0 , 0x42d10000, x4 
    FPUMOVS         f1 , 0x436d8000, x4 
.global INST120
INST120:
    fmul.s          f2 , f0 , f1 
    FPUSCHECKS      f2 , 0x46c1e580, x4 , x3 
    bne             x3 , x4 , FMULSFAIL
    FPUEXCHK        0x0, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUMOVS         f0 , SpLFN, x4 
    FPUMOVS         f1 , 0x3fc00000, x4 
.global INST121
INST121:
    fmul.s          f2 , f0 , f1 
    FPUSCHECKS      f2 , SpInf, x3 , x4 
    bne             x3 , x4 , FMULSFAIL
    FPUEXCHK        0x25, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPURMCH         1  , x3 
.global INST122
INST122:
    fmul.s          f2 , f0 , f1 
    FPUSCHECKS      f2 , SpLFN, x3 , x4 
    bne             x3 , x4 , FMULSFAIL
    FPUEXCHK        0x25, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPURMCH         2  , x3 
.global INST123
INST123:
    fmul.s          f2 , f0 , f1 
    FPUSCHECKS      f2 , SpLFN, x3 , x4 
    bne             x3 , x4 , FMULSFAIL
    FPUEXCHK        0x25, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPURMCH         3  , x3 
.global INST124
INST124:
    fmul.s          f2 , f0 , f1 
    FPUSCHECKS      f2 , SpInf, x3 , x4 
    bne             x3 , x4 , FMULSFAIL
    FPUEXCHK        0x25, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPURMCH         4  , x3 
.global INST125
INST125:
    fmul.s          f2 , f0 , f1 
    FPUSCHECKS      f2 , SpInf, x3 , x4 
    bne             x3 , x4 , FMULSFAIL
    FPUEXCHK        0x25, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPURMCH         5  , x3 
.global INST126
INST126:
    fmul.s          f2 , f0 , f1 , rne
    FPUSCHECKS      f2 , SpInf, x3 , x4 
    bne             x3 , x4 , FMULSFAIL
    FPUEXCHK        0x25, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST127
INST127:
    fmul.s          f2 , f0 , f1 , rtz
    FPUSCHECKS      f2 , SpLFN, x3 , x4 
    bne             x3 , x4 , FMULSFAIL
    FPUEXCHK        0x25, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST128
INST128:
    fmul.s          f2 , f0 , f1 , rdn
    FPUSCHECKS      f2 , SpLFN, x3 , x4 
    bne             x3 , x4 , FMULSFAIL
    FPUEXCHK        0x25, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST129
INST129:
    fmul.s          f2 , f0 , f1 , rup
    FPUSCHECKS      f2 , SpInf, x3 , x4 
    bne             x3 , x4 , FMULSFAIL
    FPUEXCHK        0x25, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
.global INST130
INST130:
    fmul.s          f2 , f0 , f1 , rmm
    FPUSCHECKS      f2 , SpInf, x3 , x4 
    bne             x3 , x4 , FMULSFAIL
    FPUEXCHK        0x25, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUMOVS         f0 , 0x7f7ffffe, x1 
    FPUMOVS         f1 , 0x3f800000, x1 
    FPUMOVS         f2 , 0x73000000, x1 
    FPURMCH         0  , x3 
.global FMADDS
FMADDS:
.global INST142
INST142:
    fmadd.s         f3 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7ffffe, x3 , x4 
    bne             x3 , x4 , FMADDSFAIL
    FPURMCH         1  , x3 
.global INST143
INST143:
    fmadd.s         f3 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7ffffe, x3 , x4 
    bne             x3 , x4 , FMADDSFAIL
    FPURMCH         2  , x3 
.global INST144
INST144:
    fmadd.s         f3 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7ffffe, x3 , x4 
    bne             x3 , x4 , FMADDSFAIL
    FPURMCH         3  , x3 
.global INST145
INST145:
    fmadd.s         f3 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7fffff, x3 , x4 
    bne             x3 , x4 , FMADDSFAIL
    FPURMCH         4  , x3 
.global INST146
INST146:
    fmadd.s         f3 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7fffff, x3 , x4 
    bne             x3 , x4 , FMADDSFAIL
    FPURMCH         7  , x3 
.global INST147
INST147:
    fmadd.s         f3 , f1 , f0 , f2 , rne
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7ffffe, x3 , x4 
    bne             x3 , x4 , FMADDSFAIL
.global INST148
INST148:
    fmadd.s         f3 , f1 , f0 , f2 , rtz
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7ffffe, x3 , x4 
    bne             x3 , x4 , FMADDSFAIL
.global INST149
INST149:
    fmadd.s         f3 , f1 , f0 , f2 , rdn
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7ffffe, x3 , x4 
    bne             x3 , x4 , FMADDSFAIL
.global INST150
INST150:
    fmadd.s         f3 , f1 , f0 , f2 , rup
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7fffff, x3 , x4 
    bne             x3 , x4 , FMADDSFAIL
.global INST151
INST151:
    fmadd.s         f3 , f1 , f0 , f2 , rmm
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7fffff, x3 , x4 
    bne             x3 , x4 , FMADDSFAIL
.global FMSUBS
FMSUBS:
    FPUMOVS         f0 , 0x7f7ffffe, x1 
    FPUMOVS         f1 , 0x3f800000, x1 
    FPUMOVS         f2 , 0xf3000000, x1 
    FPURMCH         0  , x3 
.global INST162
INST162:
    fmsub.s         f3 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7ffffe, x3 , x4 
    bne             x3 , x4 , FMSUBSFAIL
    FPURMCH         1  , x3 
.global INST163
INST163:
    fmsub.s         f3 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7ffffe, x3 , x4 
    bne             x3 , x4 , FMSUBSFAIL
    FPURMCH         2  , x3 
.global INST164
INST164:
    fmsub.s         f3 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7ffffe, x3 , x4 
    bne             x3 , x4 , FMSUBSFAIL
    FPURMCH         3  , x3 
.global INST165
INST165:
    fmsub.s         f3 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7fffff, x3 , x4 
    bne             x3 , x4 , FMSUBSFAIL
    FPURMCH         4  , x3 
.global INST166
INST166:
    fmsub.s         f3 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7fffff, x3 , x4 
    bne             x3 , x4 , FMSUBSFAIL
    FPURMCH         0  , x3 
.global INST167
INST167:
    fmsub.s         f3 , f1 , f0 , f2 , rne
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7ffffe, x3 , x4 
    bne             x3 , x4 , FMSUBSFAIL
.global INST168
INST168:
    fmsub.s         f3 , f1 , f0 , f2 , rtz
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7ffffe, x3 , x4 
    bne             x3 , x4 , FMSUBSFAIL
.global INST169
INST169:
    fmsub.s         f3 , f1 , f0 , f2 , rdn
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7ffffe, x3 , x4 
    bne             x3 , x4 , FMSUBSFAIL
.global INST170
INST170:
    fmsub.s         f3 , f1 , f0 , f2 , rup
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7fffff, x3 , x4 
    bne             x3 , x4 , FMSUBSFAIL
    fmsub.s         f3 , f1 , f0 , f2 , rmm
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f3 , 0x7f7fffff, x3 , x4 
    bne             x3 , x4 , FMSUBSFAIL
.global FNMADDS
FNMADDS:
    FPUMOVS         f0 , 0x7f7ffffe, x1 
    FPUMOVS         f1 , 0x3f800000, x1 
    FPUMOVS         f2 , 0x73000000, x1 
    FPURMCH         0  , x3 
.global INST181
INST181:
    fnmadd.s        f4 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7ffffe, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
    FPURMCH         1  , x3 
.global INST182
INST182:
    fnmadd.s        f4 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7ffffe, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
    FPURMCH         2  , x3 
.global INST183
INST183:
    fnmadd.s        f4 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7fffff, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
    FPURMCH         3  , x3 
.global INST184
INST184:
    fnmadd.s        f4 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7ffffe, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
    FPURMCH         4  , x3 
.global INST185
INST185:
    fnmadd.s        f4 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7fffff, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
    FPURMCH         6  , x3 
.global INST186
INST186:
    fnmadd.s        f4 , f1 , f0 , f2 , rne
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7ffffe, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
.global INST187
INST187:
    fnmadd.s        f4 , f1 , f0 , f2 , rtz
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7ffffe, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
.global INST188
INST188:
    fnmadd.s        f4 , f1 , f0 , f2 , rdn
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7fffff, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
.global INST189
INST189:
    fnmadd.s        f4 , f1 , f0 , f2 , rup
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7ffffe, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
.global INST190
INST190:
    fnmadd.s        f4 , f1 , f0 , f2 , rmm
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7fffff, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
    FPURMCH         0  , x1 
    FPUMOVS         f0 , 0x7f7ffffe, x1 
    FPUMOVS         f1 , 0x3f800000, x1 
    FPUMOVS         f2 , 0xf3000000, x1 
.global FNMSUBS
FNMSUBS:
.global INST201
INST201:
    fnmsub.s        f4 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7ffffe, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
    FPURMCH         1  , x3 
.global INST202
INST202:
    fnmsub.s        f4 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7ffffe, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
    FPURMCH         2  , x3 
.global INST203
INST203:
    fnmsub.s        f4 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7fffff, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
    FPURMCH         3  , x3 
.global INST204
INST204:
    fnmsub.s        f4 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7ffffe, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
    FPURMCH         4  , x3 
.global INST205
INST205:
    fnmsub.s        f4 , f1 , f0 , f2 
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7fffff, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
    FPURMCH         5  , x3 
.global INST206
INST206:
    fnmsub.s        f4 , f1 , f0 , f2 , rne
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7ffffe, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
.global INST207
INST207:
    fnmsub.s        f4 , f1 , f0 , f2 , rtz
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7ffffe, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
.global INST208
INST208:
    fnmsub.s        f4 , f1 , f0 , f2 , rdn
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7fffff, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
.global INST209
INST209:
    fnmsub.s        f4 , f1 , f0 , f2 , rup
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7ffffe, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
.global INST210
INST210:
    fnmsub.s        f4 , f1 , f0 , f2 , rmm
    FPUEXCHK        0x00000021, x3 , x4 
    bne             x3 , x4 , FLAGCFAIL
    FPUSCHECKS      f4 , 0xff7fffff, x3 , x4 
    bne             x3 , x4 , FNMSUBSFAIL
.option norvc 
.global inst_flw
inst_flw:
    li              x3 , 0x00011234
    li              x4 , 0x01020304
    FPUMOVS         f4 , 0x00000000, x5 
    sw              x4 , 0x0( x3 )
    sw              x4 , 0x4( x3 )
    flw             f4 , 0x0( x3 )
    FPUSCHECKS      f4 , 0x01020304, x5 , x4 
    bne             x5 , x4 , FLWFAIL
    flw             f4 , 0x4( x3 )
    FPUSCHECKS      f4 , 0x01020304, x5 , x4 
    bne             x5 , x4 , FLWFAIL
.global inst_fsw
inst_fsw:
    li              x3 , 0x00017654
    FPUMOVS         f4 , 0xdcbadcba, x5 
    sw              x2 , 0x4( x3 )
    sw              x0 , 0x0( x3 )
    fsw             f4 , 0x0( x3 )
    lw              x5 , 0x4( x3 )
    lw              x3 , 0x0( x3 )
    li              x4 , 0xdcbadcba
    bne             x3 , x4 , FSWFAIL
    bne             x5 , x2 , FSWFAIL
.option rvc 
.global inst_cflw
inst_cflw:
    li              x13, 0x00021234
    li              x14, 0x02020304
    FPUMOVS         f8 , 0x00000000, x15
    sw              x14, 0x0( x13)
    sw              x14, 0x4( x13)
    c.flw           f8 , 0x0( x13)
    FPUSCHECKS      f8 , 0x02020304, x15, x14
    bne             x15, x14, CFLWFAIL
    c.flw           f8 , 0x4( x13)
    FPUSCHECKS      f8 , 0x02020304, x15, x14
    bne             x15, x14, CFLWFAIL
.global inst_cfsw
inst_cfsw:
    li              x13, 0x00027654
    FPUMOVS         f9 , 0xdcbadcba, x5 
    sw              x2 , 0x4( x13)
    sw              x0 , 0x0( x13)
    c.fsw           f9 , 0x0( x13)
    lw              x15, 0x4( x13)
    lw              x13, 0x0( x13)
    li              x14, 0xdcbadcba
    bne             x13, x14, CFSWFAIL
    bne             x15, x2 , CFSWFAIL
    FPUMOVS         f11, 0x00000000, x15
    FPUMOVS         f10, 0x0f0f0f0f, x15
.global inst_cfswsp
inst_cfswsp:
    fsw             f11, 0x4( sp )
    c.fswsp         f10, 0x0( sp )
    flw             f11, 0x0( sp )
    FPUSCHECKS      f11, 0x0f0f0f0f, x13, x14
    bne             x13, x14, CFSWSPFAIL
    flw             f11, 0x4( sp )
    FPUSCHECKS      f11, 0x00000000, x13, x14
    bne             x13, x14, CFSWSPFAIL
    FPUMOVS         f11, 0x00000000, x15
    FPUMOVS         f10, 0x0f0f0f0f, x15
.global inst_cflwsp
inst_cflwsp:
    fsw             f11, 0x4( sp )
    fsw             f10, 0x0( sp )
    c.flwsp         f11, 0x0( sp )
    FPUSCHECKS      f11, 0x0f0f0f0f, x13, x14
    bne             x13, x14, CFLWSPFAIL
    c.flwsp         f11, 0x4( sp )
    FPUSCHECKS      f11, 0x00000000, x13, x14
    bne             x13, x14, CFLWSPFAIL
    EXIT           
.global FMULSFAIL
FMULSFAIL:
    FAIL           
.global FMADDSFAIL
FMADDSFAIL:
    FAIL           
.global FMSUBSFAIL
FMSUBSFAIL:
    FAIL           
.global FNMADDSFAIL
FNMADDSFAIL:
    FAIL           
.global FNMSUBSFAIL
FNMSUBSFAIL:
    FAIL           
.global RESULTFAIL
RESULTFAIL:
    FAIL           
.global FLAGCFAIL
FLAGCFAIL:
    FAIL           
.global FDIVSFAIL
FDIVSFAIL:
    FAIL           
.global FRECIPSFAIL
FRECIPSFAIL:
    FAIL           
.global FSQRTSFAIL
FSQRTSFAIL:
    FAIL           
.global END
END:
    EXIT           
.global FMAXSFAIL
FMAXSFAIL:
    FAIL           
.global FMINSFAIL
FMINSFAIL:
    FAIL           
.global FEQSFAIL
FEQSFAIL:
    FAIL           
.global FLESFAIL
FLESFAIL:
    FAIL           
.global FLTSFAIL
FLTSFAIL:
    FAIL           
.global FLWFAIL
FLWFAIL:
    FAIL           
.global FSWFAIL
FSWFAIL:
    FAIL           
.global CFLWFAIL
CFLWFAIL:
    FAIL           
.global CFSWFAIL
CFSWFAIL:
    FAIL           
.global CFSWSPFAIL
CFSWSPFAIL:
    FAIL           
.global CFLWSPFAIL
CFLWSPFAIL:
    FAIL           
