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


#MHINT:
    li              x1 , 0xffffff
    li              x4 , 0x100000
    csrrs           x0 , mhint, x1 
    csrr            x3 , mhint
    bne             x4 , x3 , __fail

#MXSTATUS
    li              x1, 0xffffffff
    li              x4, 0xc040a400
    csrrs           x0, mxstatus, x1
    csrr            x3, mxstatus
    bne             x4, x3, __fail

#MHCR
.ifndef NO_CACHE_SKIP_MHCR_CHECK
    li              x1, 0xffffffff
    li              x4, 0x103f
    csrrs           x0, mhcr, x1
    csrr            x3, mhcr
    bne             x4, x3, __fail
.endif

#MRADDR
    csrr            x1, mraddr

#mcpuid
    csrr            x1, cpuid

    j               __exit
