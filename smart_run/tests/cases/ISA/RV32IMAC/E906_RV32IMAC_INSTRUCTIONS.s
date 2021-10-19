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
.text
.align 2
.global main
main:
.option norvc 
.global addi
addi:
    li              x5 , 0x4
    li              x4 , 0x5
    addi            x4 , x4 , 0xffffffff
    bne             x4 , x5 , __fail
    li              x5 , 0xffe
    li              x4 , 0x7ff
    addi            x4 , x4 , 0x7ff
    bne             x4 , x5 , __fail
    li              x5 , 0xfffff000
    li              x4 , 0xfffff800
    addi            x4 , x4 , 0xfffff800
    bne             x4 , x5 , __fail
    addi            x4 , x4 , 0x123
    addi            x5 , x4 , 0x0
    bne             x4 , x5 , __fail
    li              x5 , 0x0
    addi            x5 , x5 , 0x0
    addi            x0 , x0 , 0x0
    addi            x0 , x0 , 0x5
    bne             x5 , x0 , __fail
.global SLTI
SLTI:
    li              x4 , 0x1
    li              x5 , 0xfff
    slti            x5 , x5 , 0xffffffff
    bne             x5 , x0 , __fail
    li              x5 , 0xfff
    slti            x5 , x5 , 0x1
    bne             x5 , x0 , __fail
    li              x5 , 0xffffffff
    slti            x5 , x5 , 0x1
    bne             x5 , x4 , __fail
    li              x5 , 0x1
    slti            x5 , x5 , 0x1
    bne             x5 , x0 , __fail
    li              x5 , 0xffffffff
    slti            x5 , x5 , 0xfffffffe
    bne             x5 , x0 , __fail
    li              x5 , 0xffffffff
    slti            x5 , x5 , 0xffffffff
    bne             x5 , x0 , __fail
.global SLTIU
SLTIU:
    li              x4 , 0x1
    li              x5 , 0xffffffff
    sltiu           x5 , x5 , 0x7ff
    bne             x5 , x0 , __fail
    li              x5 , 0xfff
    sltiu           x5 , x5 , 0x1
    bne             x5 , x0 , __fail
    li              x5 , 0x1
    sltiu           x5 , x5 , -1 
    bne             x5 , x4 , __fail
    li              x5 , 0x7ff
    sltiu           x5 , x5 , 0x7ff
    bne             x5 , x0 , __fail
.global ANDI
ANDI:
    li              x4 , 0xaaaaaaaa
    li              x5 , 0xaaaaaaaa
    andi            x5 , x5 , 0xffffffff
    bne             x4 , x5 , __fail
    li              x4 , 0x2aa
    li              x5 , 0xaaaaaaaa
    andi            x5 , x5 , 0x7ff
    bne             x4 , x5 , __fail
    li              x4 , 0x0
    li              x5 , 0xaaaaaaaa
    andi            x5 , x5 , 0x0
    bne             x4 , x5 , __fail
.global ORI
ORI:
    li              x4 , 0xffffffff
    li              x5 , 0xaaaaaaaa
    ori             x5 , x5 , 0xffffffff
    bne             x4 , x5 , __fail
    li              x4 , 0xaaaaafff
    li              x5 , 0xaaaaaaaa
    ori             x5 , x5 , 0x7ff
    bne             x4 , x5 , __fail
    li              x4 , 0xaaaaaaaa
    li              x5 , 0xaaaaaaaa
    ori             x5 , x5 , 0x0
    bne             x4 , x5 , __fail
.global XORI
XORI:
    li              x4 , 0xabcdabcd
    xori            x5 , x4 , 0xffffffff
    not             x6 , x4 
    bne             x6 , x5 , __fail
    li              x4 , 0xabcdffff
    li              x6 , 0xabcdfff0
    xori            x5 , x4 , 0xf
    bne             x6 , x5 , __fail
    li              x4 , 0xabcdabcd
    li              x6 , 0xabcdabcd
    xori            x5 , x4 , 0x0
    bne             x6 , x5 , __fail
.global SLLI
SLLI:
    li              x4 , 0xabcd1234
    slli            x2 , x4 , 0  
    bne             x2 , x4 , __fail
    li              x4 , 0xabcd1234
    slli            x2 , x4 , 31 
    bne             x2 , x0 , __fail
    li              x4 , 0xaaaaaaaa
    slli            x2 , x4 , 8  
    li              x3 , 0xaaaaaa00
    bne             x2 , x3 , __fail
.global SRLI
SRLI:
    li              x2 , 0xabcd1234
    srli            x3 , x2 , 0  
    bne             x2 , x3 , __fail
    li              x2 , 0xaaaaaaaa
    srli            x3 , x2 , 31 
    li              x4 , 0x1
    bne             x3 , x4 , __fail
    li              x2 , 0xaaaaaaaa
    srli            x2 , x2 , 1  
    li              x3 , 0x55555555
    bne             x2 , x3 , __fail
.global SRAI
SRAI:
    li              x2 , 0xaaaaaaaa
    srai            x2 , x2 , 31 
    li              x3 , 0xffffffff
    bne             x2 , x3 , __fail
    li              x2 , 0x55555555
    srai            x2 , x2 , 31 
    bne             x2 , x0 , __fail
    li              x2 , 0x55555555
    srai            x2 , x2 , 1  
    li              x3 , 0x2aaaaaaa
    bne             x2 , x3 , __fail
    li              x2 , 0xabcd1234
    srai            x2 , x2 , 0  
    li              x3 , 0xabcd1234
    bne             x2 , x3 , __fail
.global LUI
LUI:
    lui             x2 , 0x7bcd1
    li              x3 , 0x7bcd1000
    bne             x2 , x3 , __fail
    lui             x2 , 0x89abc
    li              x3 , 0x89abc000
    bne             x2 , x3 , __fail
.global AUIPC
AUIPC:
    auipc           x2 , 0x0
.option norvc 
    li              x3 , 0xa00e
.option rvc 
    c.add           x2 , x3 
.option norvc 
    auipc           x4 , 0xa
    bne             x2 , x4 , __fail
    auipc           x2 , 0x0
    li              x3 , 0x80000010
    add             x2 , x3 , x2 
    auipc           x4 , 0x80000
    bne             x2 , x4 , __fail
.option norvc 
.global ADD
ADD:
    li              x3 , 0xffffffff
    li              x4 , 0xffffffff
    add             x5 , x3 , x4 
    li              x6 , 0xfffffffe
    bne             x5 , x6 , __fail
    li              x3 , 0x80000000
    li              x4 , 0x80000000
    add             x5 , x3 , x4 
    li              x6 , 0x0
    bne             x5 , x6 , __fail
    li              x3 , 0x7fffffff
    li              x4 , 0x7fffffff
    add             x5 , x3 , x4 
    li              x6 , 0xfffffffe
    bne             x5 , x6 , __fail
.global SUB
SUB:
    li              x3 , 0x80000000
    li              x4 , 0x7fffffff
    sub             x5 , x3 , x4 
    li              x6 , 0x1
    bne             x5 , x6 , __fail
    li              x3 , 0x7fffffff
    li              x4 , 0x80000000
    sub             x5 , x3 , x4 
    li              x6 , 0xffffffff
    bne             x5 , x6 , __fail
    li              x3 , 0xf
    li              x4 , 0x2
    sub             x5 , x3 , x4 
    li              x6 , 0xd
    bne             x5 , x6 , __fail
.global SLT
SLT:
    li              x3 , 0x1
    li              x4 , 0x0
    li              x5 , 0x80000000
    li              x6 , 0xffffffff
    li              x8 , 0xfffffffe
    slt             x7 , x3 , x3 
    bne             x7 , x4 , __fail
    slt             x7 , x3 , x4 
    bne             x7 , x4 , __fail
    slt             x7 , x4 , x3 
    bne             x7 , x3 , __fail
    slt             x7 , x5 , x3 
    bne             x7 , x3 , __fail
    slt             x7 , x6 , x8 
    bne             x7 , x4 , __fail
.global SLTU
SLTU:
    li              x3 , 0x1
    li              x4 , 0x0
    li              x5 , 0x80000000
    li              x6 , 0xffffffff
    sltu            x7 , x3 , x3 
    bne             x7 , x4 , __fail
    sltu            x7 , x3 , x4 
    bne             x7 , x4 , __fail
    sltu            x7 , x4 , x3 
    bne             x7 , x3 , __fail
    sltu            x7 , x5 , x3 
    bne             x7 , x4 , __fail
.global AND
AND:
    li              x3 , 0x0
    li              x4 , 0xffffffff
    li              x5 , 0xabcdabcd
    and             x6 , x5 , x4 
    bne             x6 , x5 , __fail
    li              x5 , 0xabcdabcd
    and             x6 , x5 , x3 
    bne             x6 , x3 , __fail
.global OR
OR:
    li              x3 , 0x0
    li              x4 , 0xffffffff
    li              x5 , 0xabcdabcd
    or              x6 , x5 , x4 
    bne             x6 , x4 , __fail
    li              x5 , 0xabcdabcd
    or              x6 , x5 , x3 
    bne             x6 , x5 , __fail
.global XOR
XOR:
    li              x3 , 0x0
    li              x4 , 0xffffffff
    li              x5 , 0xabcdabcd
    xor             x6 , x5 , x4 
    not             x5 , x5 
    bne             x6 , x5 , __fail
    li              x5 , 0xabcdabcd
    xor             x6 , x5 , x3 
    bne             x6 , x5 , __fail
.global SLL
SLL:
    li              x4 , 0xabcd1234
    sll             x2 , x4 , x0 
    bne             x2 , x4 , __fail
    li              x4 , 0xabcd1234
    li              x5 , 31 
    sll             x2 , x4 , x5 
    li              x3 , 0x0
    bne             x2 , x3 , __fail
    li              x4 , 0xaaaaaaaa
    li              x5 , 0x8
    sll             x2 , x4 , x5 
    li              x3 , 0xaaaaaa00
    bne             x2 , x3 , __fail
    li              x4 , 0xaaaaaaaa
    li              x5 , 0x1
    sll             x2 , x4 , x5 
    li              x3 , 0x55555554
    bne             x2 , x3 , __fail
.global SRL
SRL:
    li              x2 , 0xabcd1234
    srl             x3 , x2 , x0 
    bne             x2 , x3 , __fail
    li              x2 , 0xaaaaaaaa
    li              x5 , 31 
    srl             x3 , x2 , x5 
    li              x4 , 0x1
    bne             x3 , x4 , __fail
    li              x2 , 0xaaaaaaaa
    li              x5 , 0x1
    srl             x2 , x2 , x5 
    li              x3 , 0x55555555
    bne             x2 , x3 , __fail
.global SRA
SRA:
    li              x2 , 0xaaaaaaaa
    li              x5 , 0x1f
    sra             x2 , x2 , x5 
    li              x3 , 0xffffffff
    bne             x2 , x3 , __fail
    li              x2 , 0x55555555
    li              x5 , 0x1f
    sra             x2 , x2 , x5 
    li              x3 , 0  
    bne             x2 , x3 , __fail
    li              x2 , 0x55555555
    li              x5 , 0x1
    sra             x2 , x2 , x5 
    li              x3 , 0x2aaaaaaa
    bne             x2 , x3 , __fail
    li              x2 , 0xabcd1234
    sra             x2 , x2 , x0 
    li              x3 , 0xabcd1234
    bne             x2 , x3 , __fail
.global MUL
MUL:
    li              x3 , 0x80000000
    li              x4 , 0x7fffffff
    li              x10, 0xabcde
    mul             x5 , x0 , x3 
    bne             x5 , x0 , __fail
    mul             x5 , x0 , x0 
    bne             x5 , x0 , __fail
    mul             x5 , x0 , x4 
    bne             x5 , x0 , __fail
    mul             x5 , x4 , x4 
    li              x6 , 0x1
    bne             x5 , x6 , __fail
    mul             x5 , x4 , x0 
    bne             x5 , x0 , __fail
    mul             x5 , x4 , x3 
    li              x6 , 0x80000000
    bne             x5 , x6 , __fail
    mul             x5 , x4 , x10
    li              x6 , 0xfff54322
    bne             x5 , x6 , __fail
    mul             x5 , x3 , x3 
    li              x6 , 0x0
    bne             x5 , x6 , __fail
    mul             x5 , x3 , x0 
    bne             x5 , x0 , __fail
    mul             x5 , x3 , x4 
    li              x6 , 0x80000000
    bne             x6 , x5 , __fail
    mul             x5 , x3 , x10
    li              x6 , 0x0
    bne             x6 , x5 , __fail
    mul             x5 , x10, x10
    li              x6 , 0x4caed084
    bne             x6 , x5 , __fail
.global MULH
MULH:
    li              x3 , 0x7fffffff
    li              x4 , 0x80000000
    li              x10, 0xabcde
    li              x11, 0xcdeabcde
    mulh            x5 , x0 , x3 
    bne             x5 , x0 , __fail
    mulh            x5 , x0 , x0 
    bne             x5 , x0 , __fail
    mulh            x5 , x0 , x4 
    bne             x5 , x0 , __fail
    mulh            x5 , x4 , x3 
    li              x6 , 0xc0000000
    bne             x5 , x6 , __fail
    mulh            x5 , x4 , x0 
    bne             x5 , x0 , __fail
    mulh            x5 , x4 , x4 
    li              x6 , 0x40000000
    bne             x5 , x6 , __fail
    mulh            x5 , x4 , x10
    li              x6 , 0xfffaa191
    bne             x5 , x6 , __fail
    mulh            x5 , x11, x11
    li              x6 , 0x9cc4ffd
    bne             x6 , x5 , __fail
.global MULHU
MULHU:
    li              x3 , 0xffffffff
    li              x4 , 0x23456
    li              x10, 0xabcde
    mulhu           x5 , x0 , x3 
    bne             x5 , x0 , __fail
    mulhu           x5 , x0 , x0 
    bne             x5 , x0 , __fail
    mulhu           x5 , x0 , x4 
    bne             x5 , x0 , __fail
    mulhu           x5 , x4 , x3 
    li              x6 , 0x23455
    bne             x5 , x6 , __fail
    mulhu           x5 , x4 , x4 
    li              x6 , 0x4
    bne             x5 , x6 , __fail
    mulhu           x5 , x3 , x3 
    li              x6 , 0xfffffffe
    bne             x5 , x6 , __fail
    mulhu           x5 , x3 , x4 
    li              x6 , 0x23455
    bne             x6 , x5 , __fail
.global MULHSU
MULHSU:
    li              x3 , 0x80000000
    li              x4 , 0x7fffffff
    li              x10, 0x23456
    mulhsu          x5 , x0 , x3 
    bne             x5 , x0 , __fail
    mulhsu          x5 , x0 , x0 
    bne             x5 , x0 , __fail
    mulhsu          x5 , x0 , x4 
    bne             x5 , x0 , __fail
    mulhsu          x5 , x0 , x10
    bne             x5 , x0 , __fail
    mulhsu          x5 , x4 , x3 
    li              x6 , 0x3fffffff
    bne             x5 , x6 , __fail
    mulhsu          x5 , x4 , x4 
    li              x6 , 0x3fffffff
    bne             x5 , x6 , __fail
    mulhsu          x5 , x4 , x10
    li              x6 , 0x11a2a
    bne             x5 , x6 , __fail
    mulhsu          x5 , x3 , x3 
    li              x6 , 0xc0000000
    bne             x5 , x6 , __fail
    mulhsu          x5 , x3 , x4 
    li              x6 , 0xc0000000
    bne             x6 , x5 , __fail
    mulhsu          x5 , x3 , x10
    li              x6 , 0xfffee5d5
    bne             x6 , x5 , __fail
.global DIV
DIV:
    li              x2 , 0x80000000
    li              x3 , 0xabcdabcd
    li              x4 , 0x789a789a
    li              x5 , 0xffffffff
    div             x6 , x0 , x4 
    li              x7 , 0x0
    bne             x6 , x7 , __fail
    div             x6 , x3 , x4 
    li              x7 , 0x0
    bne             x6 , x7 , __fail
    div             x6 , x4 , x3 
    li              x7 , 0xffffffff
    bne             x6 , x7 , __fail
    div             x6 , x3 , x0 
    mv              x7 , x5 
    bne             x6 , x7 , __fail
    div             x6 , x2 , x5 
    mv              x7 , x2 
    bne             x6 , x7 , __fail
.global DIVU
DIVU:
    li              x2 , 0x80000000
    li              x3 , 0xabcdabcd
    li              x4 , 0x789a789a
    li              x5 , 0xffffffff
    divu            x6 , x0 , x4 
    li              x7 , 0x0
    bne             x6 , x7 , __fail
    divu            x6 , x3 , x4 
    li              x7 , 0x1
    bne             x6 , x7 , __fail
    divu            x6 , x4 , x3 
    li              x7 , 0x0
    bne             x6 , x7 , __fail
    divu            x6 , x3 , x0 
    mv              x7 , x5 
    bne             x6 , x7 , __fail
    divu            x6 , x2 , x5 
    mv              x7 , x0 
    bne             x6 , x7 , __fail
.global REM
REM:
    li              x2 , 0x80000000
    li              x3 , 0xabcdabcd
    li              x4 , 0x789a789a
    li              x5 , 0xffffffff
    rem             x6 , x0 , x4 
    li              x7 , 0x0
    bne             x6 , x7 , __fail
    rem             x6 , x3 , x4 
    li              x7 , 0xabcdabcd
    bne             x6 , x7 , __fail
    rem             x6 , x4 , x3 
    li              x7 , 0x24682467
    bne             x6 , x7 , __fail
    rem             x6 , x3 , x0 
    mv              x7 , x3 
    bne             x6 , x7 , __fail
    rem             x6 , x2 , x5 
    mv              x7 , x0 
    bne             x6 , x7 , __fail
.global REMU
REMU:
    li              x2 , 0x80000000
    li              x3 , 0xabcdabcd
    li              x4 , 0x789a789a
    li              x5 , 0xffffffff
    remu            x6 , x0 , x4 
    li              x7 , 0x0
    bne             x6 , x7 , __fail
    remu            x6 , x3 , x4 
    li              x7 , 0x33333333
    bne             x6 , x7 , __fail
    remu            x6 , x4 , x3 
    li              x7 , 0x789a789a
    bne             x6 , x7 , __fail
    remu            x6 , x3 , x0 
    mv              x7 , x3 
    bne             x6 , x7 , __fail
    remu            x6 , x2 , x5 
    mv              x7 , x2 
    bne             x6 , x7 , __fail
.option rvc 
.global CLI
CLI:
    c.li            x4 , 0x1f
    li              x5 , 0x1f
    bne             x4 , x5 , __fail
    c.li            x4 , -32
    li              x5 , -32
    bne             x4 , x5 , __fail
.global CLUI
CLUI:
    c.lui           x4 , 0xfffe0
    li              x5 , 0xfffe0000
    bne             x4 , x5 , __fail
    c.lui           x4 , 0x1f
    li              x5 , 0x1f000
    bne             x4 , x5 , __fail
.global CADDI
CADDI:
    li              x4 , 0x80000000
    li              x5 , 0x7fffffe0
    c.addi          x4 , -32
    bne             x4 , x5 , __fail
    li              x4 , 0x7fffffff
    li              x5 , 0x8000001e
    c.addi          x4 , 31 
    bne             x4 , x5 , __fail
.global CADDI16SP
CADDI16SP:
    li              x2 , 0x0
    li              x3 , -512
    c.addi16sp      x2 , -512
    bne             x2 , x3 , __fail
    li              x2 , 0xffffff20
    li              x3 , 0xfffffee0
    c.addi16sp      x2 , -64
    bne             x2 , x3 , __fail
    li              x2 , 0x0
    li              x3 , 0x1f0
    c.addi16sp      x2 , 0x1f0
    bne             x2 , x3 , __fail
.global CADDI4SPN
CADDI4SPN:
    li              x2 , 0x0
    li              x3 , 0x3fc
    c.addi4spn      x8 , x2 , 0x3fc
    bne             x8 , x3 , __fail
    li              x2 , 0x0
    li              x3 , 124
    c.addi4spn      x8 , x2 , 0x7c
    bne             x8 , x3 , __fail
.global CSLLI
CSLLI:
    li              x3 , 0xaaaaaaaa
    li              x4 , 0x0
    c.slli          x3 , 0x1f
    bne             x3 , x4 , __fail
    li              x3 , 0xaaaa
    li              x4 , 0x55550000
    c.slli          x3 , 0xf
    bne             x3 , x4 , __fail
    li              x8 , 0xaaaaaaaa
    li              x4 , 0x1
    c.srli          x8 , 0x1f
    bne             x8 , x4 , __fail
    li              x8 , 0x55555555
    li              x4 , 0x5555555
    c.srli          x8 , 0x4
    bne             x8 , x4 , __fail
    li              x8 , 0xffffffff
    li              x4 , 0xfffffff
    c.srli          x8 , 0x4
    bne             x8 , x4 , __fail
.global CSRAI
CSRAI:
    li              x8 , 0xaaaaaaaa
    li              x4 , 0xffffffff
    c.srai          x8 , 0x1f
    bne             x8 , x4 , __fail
    li              x8 , 0x55555555
    li              x4 , 0x5555555
    c.srai          x8 , 0x4
    bne             x8 , x4 , __fail
.global CANDI
CANDI:
    li              x8 , 0xaaaaaaaa
    li              x4 , 0xaaaaaaaa
    c.andi          x8 , -1 
    bne             x8 , x4 , __fail
    li              x8 , 0xaaaaaaaa
    li              x4 , 0xa
    c.andi          x8 , 0x1f
    bne             x8 , x4 , __fail
    li              x8 , 0xaaaaaaaa
    li              x4 , 0xaaaaaaa0
    c.andi          x8 , -32
    bne             x8 , x4 , __fail
.global CMV
CMV:
    li              x4 , 0xabcdabcd
    li              x5 , 0x0
    c.mv            x5 , x4 
    bne             x4 , x5 , __fail
.global CADD
CADD:
    li              x3 , 0xffffffff
    li              x4 , 0xffffffff
    c.add           x3 , x4 
    li              x5 , 0xfffffffe
    bne             x3 , x5 , __fail
    li              x3 , 0x80000000
    li              x4 , 0x80000000
    c.add           x3 , x4 
    li              x5 , 0x0
    bne             x3 , x5 , __fail
    li              x3 , 0x7fffffff
    li              x4 , 0x7fffffff
    c.add           x3 , x4 
    li              x5 , 0xfffffffe
    bne             x3 , x5 , __fail
.global CAND
CAND:
    li              x8 , 0x0
    li              x9 , 0xffffffff
    li              x5 , 0xabcdabcd
    li              x10, 0xabcdabcd
    c.and           x10, x9 
    bne             x10, x5 , __fail
    li              x10, 0xabcdabcd
    c.and           x10, x8 
    bne             x10, x8 , __fail
.global COR
COR:
    li              x8 , 0x0
    li              x9 , 0xffffffff
    li              x5 , 0xabcdabcd
    li              x10, 0xabcdabcd
    c.or            x10, x9 
    bne             x10, x9 , __fail
    li              x5 , 0xabcdabcd
    li              x10, 0xabcdabcd
    c.or            x10, x8 
    bne             x10, x5 , __fail
.global CXOR
CXOR:
    li              x8 , 0x0
    li              x9 , 0xffffffff
    li              x10, 0xabcdabcd
    not             x5 , x10
    c.xor           x10, x9 
    bne             x10, x5 , __fail
    li              x5 , 0xabcdabcd
    li              x10, 0xabcdabcd
    c.xor           x10, x8 
    bne             x10, x5 , __fail
.global CSUB
CSUB:
    li              x8 , 0x80000000
    li              x9 , 0x7fffffff
    c.sub           x8 , x9 
    li              x5 , 0x1
    bne             x8 , x5 , __fail
    li              x8 , 0x7fffffff
    li              x9 , 0x80000000
    c.sub           x8 , x9 
    li              x5 , 0xffffffff
    bne             x8 , x5 , __fail
    li              x8 , 0xf
    li              x9 , 0x2
    c.sub           x8 , x9 
    li              x5 , 0xd
    bne             x8 , x5 , __fail
    jal             x1 , BRANCH_LABEL
.global A
A:
    jal             x0 , JREG_LABEL
.global BRANCH_LABEL
BRANCH_LABEL:
    li              x4 , 0x80000000
    li              x3 , 0xffffffff
    beq             x0 , x4 , __fail
    beq             x4 , x4 , BNE_LABEL
    beq             x0 , x0 , __fail
.global BNE_LABEL
BNE_LABEL:
    bne             x4 , x4 , __fail
    bne             x0 , x4 , BLT_LABEL
    beq             x0 , x0 , __fail
.global BLT_LABEL
BLT_LABEL:
    blt             x0 , x4 , __fail
    blt             x4 , x4 , __fail
    blt             x4 , x0 , BGE_LABEL
    beq             x0 , x0 , __fail
.global BGE_LABEL
BGE_LABEL:
    bge             x4 , x3 , __fail
    bge             x3 , x4 , BGEE_LABEL
    beq             x0 , x0 , __fail
.global BGEE_LABEL
BGEE_LABEL:
    bge             x3 , x3 , BGEU_LABEL
    beq             x0 , x0 , __fail
.global BGEU_LABEL
BGEU_LABEL:
    bgeu            x4 , x3 , __fail
    bgeu            x3 , x4 , BGEUE_LABEL
    beq             x0 , x0 , __fail
.global BGEUE_LABEL
BGEUE_LABEL:
    bgeu            x3 , x3 , BLTU_LABEL
    beq             x0 , x0 , __fail
.global BLTU_LABEL
BLTU_LABEL:
    bltu            x4 , x0 , __fail
    bltu            x4 , x4 , __fail
    bltu            x0 , x4 , J_LABEL
    beq             x0 , x0 , __fail
.global J_LABEL
J_LABEL:
    jalr            x1 , x1 , 0x0
.global B
B:
    jal             x0 , C_LABEL
.global JREG_LABEL
JREG_LABEL:
    jalr            x0 , x1 , 0x0
.global C_LABEL
C_LABEL:
    nop            
    jal             x2 , JR_LABEL1
.global C
C:
    c.jr            x1 
.global JR_LABEL1
JR_LABEL1:
    c.j             BRANCH_LABEL_16
    beq             x8 , x8 , __fail
.global BRANCH_LABEL_16
BRANCH_LABEL_16:
    li              x10, 0x80000000
    li              x9 , 0x00000000
    li              x8 , 0xffffffff
    c.beqz          x8 , JMP_TO___fail
    c.beqz          x10, JMP_TO___fail
    c.beqz          x9 , BNEZ_LABEL
    beq             x0 , x0 , __fail
.global BNEZ_LABEL
BNEZ_LABEL:
    c.bnez          x9 , JMP_TO___fail
    c.bnez          x10, C_J
.global C_J
C_J:
    c.jalr          x2 
.global D
D:
    jal             x1 , CJAL_LABEL
    beq             x0 , x0 , __fail
.global JMP_TO___fail
JMP_TO___fail:
    j               __fail
.global CJAL_LABEL
CJAL_LABEL:
    la              x15, FENCE_LABEL
    c.jal           FENCE_LABEL
.global FENCE_LABEL
FENCE_LABEL:
    bne             x15, x1 , __fail
    fence.i        
    fence           iorw, iorw
.option norvc 
    li              x4 , 0x0000a000
    li              x6 , 0x80000000
    sw              x6 , 0x0( x4 )
    lw              x7 , 0x0( x4 )
    bne             x7 , x6 , __fail
    li              x6 , 0xffff8000
    li              x8 , 0x00008000
    li              x9 , 0xaaaaaaaa
    li              x31, 0xaaaa8000
    sw              x9 , 0x0( x4 )
    sh              x6 , 0x0( x4 )
    lhu             x7 , 0x0( x4 )
    lh              x5 , 0x0( x4 )
    lw              x11, 0x0( x4 )
    bne             x7 , x8 , __fail
    bne             x6 , x5 , __fail
    bne             x11, x31, __fail
    li              x3 , 0xffffffff
    li              x8 , 0x000000ff
    li              x9 , 0xaaaaaaaa
    li              x31, 0xaaaaaaff
    sw              x9 , 0x0( x4 )
    sb              x3 , 0x0( x4 )
    lbu             x7 , 0x0( x4 )
    lb              x5 , 0x0( x4 )
    lw              x11, 0x0( x4 )
    bne             x7 , x8 , __fail
    bne             x3 , x5 , __fail
    bne             x31, x11, __fail
.option rvc 
    li              x8 , 0xffffffff
    li              x9 , 0xaaaaaaaa
    li              x10, 0x0000b000
    c.sw            x8 , 0x0( x10)
    lw              x11, 0x0( x10)
    bne             x8 , x11, __fail
    c.sw            x8 , 0x7c( x10)
    lw              x11, 0x7c( x10)
    bne             x8 , x11, __fail
    c.sw            x8 , 0x3c( x10)
    lw              x11, 0x3c( x10)
    bne             x8 , x11, __fail
    c.sw            x8 , 0x40( x10)
    lw              x11, 0x40( x10)
    bne             x8 , x11, __fail
    sw              x9 , 0x40( x10)
    c.lw            x11, 0x40( x10)
    li              x31, 0xaaaaaaaa
    bne             x31, x11, __fail
    sw              x9 , 0x3c( x10)
    c.lw            x11, 0x3c( x10)
    li              x31, 0xaaaaaaaa
    bne             x31, x11, __fail
    sw              x9 , 0x7c( x10)
    c.lw            x11, 0x7c( x10)
    li              x31, 0xaaaaaaaa
    bne             x31, x11, __fail
    sw              x9 , 0x0( x10)
    c.lw            x11, 0x0( x10)
    li              x31, 0xaaaaaaaa
    bne             x31, x11, __fail
    li              x8 , 0x55555555
    li              x9 , 0xaaaaaaaa
    li              x2 , 110000
    mv              x7 , x2 
    c.swsp          x8 , 0x0( sp )
    lw              x12, 0x0( x7 )
    li              x31, 0x55555555
    bne             x31, x12, __fail
    c.swsp          x9 , 0xfc( sp )
    lw              x12, 0xfc( x7 )
    li              x30, 0xaaaaaaaa
    bne             x30, x12, __fail
    c.swsp          x8 , 0x80( sp )
    lw              x12, 0x80( x7 )
    li              x31, 0x55555555
    bne             x31, x12, __fail
    c.swsp          x8 , 0x7c( sp )
    lw              x12, 0x7c( x7 )
    li              x31, 0x55555555
    bne             x31, x12, __fail
    sw              x7 , 0x0( x7 )
    c.lwsp          x12, 0x0( sp )
    bne             x7 , x12, __fail
    sw              x7 , 0x80( x7 )
    c.lwsp          x12, 0x80( sp )
    bne             x7 , x12, __fail
    sw              x7 , 0xfc( x7 )
    c.lwsp          x12, 0xfc( sp )
    bne             x7 , x12, __fail
    sw              x7 , 0x7c( x7 )
    c.lwsp          x12, 0x7c( sp )
    bne             x7 , x12, __fail
    c.swsp          x9 , 0xfc( sp )
    c.lwsp          x12, 0xfc( sp )
    li              x31, 0xaaaaaaaa
    bne             x31, x12, __fail
    li              x4 , 1  
    li              x5 , 0xfffffffa
    li              x6 , 0xaaaaaaaa
    li              x7 , 0xffffffff
    li              x8 , 0x55555555
    li              x2 , 0x60008888
    sw              x0 , 0  ( x2 )
.global AMO_ADD
AMO_ADD:
    li              x1 , 1  
    amoadd.w        x1 , x1 ,( x2 )
    bne             x1 , x0 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x4 , __fail
    li              x1 , 0xfffffff9
    amoadd.w        x1 , x1 ,( x2 )
    bne             x1 , x4 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x5 , __fail
.global AMO_AND
AMO_AND:
    li              x1 , 0xaaaaaaaa
    amoand.w        x1 , x1 ,( x2 )
    bne             x1 , x5 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x6 , __fail
    li              x1 , 0x55555555
    amoand.w        x1 , x1 ,( x2 )
    bne             x1 , x6 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x0 , __fail
.global AMO_OR
AMO_OR:
    li              x1 , 0xaaaaaaaa
    amoor.w         x1 , x1 ,( x2 )
    bne             x1 , x0 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x6 , __fail
    li              x1 , 0x55555555
    amoor.w         x1 , x1 ,( x2 )
    bne             x1 , x6 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x7 , __fail
.global AMO_XOR
AMO_XOR:
    li              x1 , 0xaaaaaaaa
    amoxor.w        x1 , x1 ,( x2 )
    bne             x1 , x7 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x8 , __fail
    li              x1 , 0x55555554
    amoxor.w        x1 , x1 ,( x2 )
    bne             x1 , x8 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x4 , __fail
.global AMO_SWAP
AMO_SWAP:
    li              x1 , 0  
    amoswap.w       x1 , x1 ,( x2 )
    bne             x1 , x4 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x0 , __fail
    li              x1 , 0xffffffff
    amoswap.w       x1 , x1 ,( x2 )
    bne             x1 , x0 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x7 , __fail
.global AMO_MAX
AMO_MAX:
    li              x1 , 0x55555555
    amomax.w        x1 , x1 ,( x2 )
    bne             x1 , x7 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x8 , __fail
.global AMO_MAXU
AMO_MAXU:
    li              x1 , 0xffffffff
    amomaxu.w       x1 , x1 ,( x2 )
    bne             x1 , x8 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x7 , __fail
.global AMO_MIN
AMO_MIN:
    li              x1 , 0xaaaaaaaa
    amomin.w        x1 , x1 ,( x2 )
    bne             x1 , x7 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x6 , __fail
.global AMO_MINU
AMO_MINU:
    li              x1 , 0x55555555
    amominu.w       x1 , x1 ,( x2 )
    bne             x1 , x6 , __fail
    lw              x3 , 0  ( x2 )
    bne             x3 , x8 , __fail
    li              x3 , 0  
    li              x9 , 100
.global AMO_LRW_SCW
AMO_LRW_SCW:
    addi            x3 , x3 , 1  
    beq             x3 , x9 , __fail
    lr.w            x1 ,( x2 )
    bne             x1 , x8 , __fail
    sc.w            x1 , x7 ,( x2 )
    bnez            x1 , AMO_LRW_SCW
    lw              x3 , 0  ( x2 )
    bne             x3 , x7 , __fail

    j               __exit
