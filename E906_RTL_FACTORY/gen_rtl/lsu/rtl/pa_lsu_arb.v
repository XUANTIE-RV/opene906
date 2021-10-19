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

// &Depend("cpu_cfig.h"); @18

// &ModuleBeg; @20
module pa_lsu_arb(
  ag_arb_data_bank,
  ag_arb_data_din,
  ag_arb_data_idx,
  ag_arb_data_req,
  ag_arb_data_req_dp,
  ag_arb_data_wen,
  ag_arb_dirty_din,
  ag_arb_dirty_idx,
  ag_arb_dirty_req,
  ag_arb_dirty_req_dp,
  ag_arb_dirty_wen,
  ag_arb_tag_din,
  ag_arb_tag_idx,
  ag_arb_tag_req,
  ag_arb_tag_wen,
  arb_ag_grant,
  arb_icc_data_grant,
  arb_rdl_grant,
  arb_stb_xx_grant,
  dcache_data_cen_way0_bank0,
  dcache_data_cen_way0_bank1,
  dcache_data_cen_way1_bank0,
  dcache_data_cen_way1_bank1,
  dcache_data_din,
  dcache_data_idx,
  dcache_data_wen,
  dcache_dirty_cen,
  dcache_dirty_din,
  dcache_dirty_idx,
  dcache_dirty_wen,
  dcache_tag_cen,
  dcache_tag_din,
  dcache_tag_idx,
  dcache_tag_wen,
  icc_arb_data_bank,
  icc_arb_data_din,
  icc_arb_data_idx,
  icc_arb_data_req,
  icc_arb_data_way,
  icc_arb_data_wen,
  icc_arb_dirty_din,
  icc_arb_dirty_idx,
  icc_arb_dirty_req,
  icc_arb_dirty_wen,
  icc_arb_tag_din,
  icc_arb_tag_idx,
  icc_arb_tag_req,
  icc_arb_tag_wen,
  lfb_arb_data_bank,
  lfb_arb_data_din,
  lfb_arb_data_idx,
  lfb_arb_data_req,
  lfb_arb_data_way,
  lfb_arb_data_wen,
  lfb_arb_dcache_sel,
  lfb_arb_dirty_din,
  lfb_arb_dirty_idx,
  lfb_arb_dirty_req,
  lfb_arb_dirty_wen,
  lfb_arb_tag_din,
  lfb_arb_tag_idx,
  lfb_arb_tag_req,
  lfb_arb_tag_wen,
  rdl_arb_data_bank,
  rdl_arb_data_din,
  rdl_arb_data_idx,
  rdl_arb_data_req,
  rdl_arb_data_way,
  rdl_arb_data_wen,
  rdl_arb_dcache_sel,
  rdl_arb_dirty_din,
  rdl_arb_dirty_idx,
  rdl_arb_dirty_req,
  rdl_arb_dirty_wen,
  rdl_arb_tag_din,
  rdl_arb_tag_idx,
  rdl_arb_tag_req,
  rdl_arb_tag_wen,
  stb_arb_data_bank,
  stb_arb_data_din,
  stb_arb_data_idx,
  stb_arb_data_req,
  stb_arb_data_way,
  stb_arb_data_wen,
  stb_arb_dcache_sel,
  stb_arb_dirty_din,
  stb_arb_dirty_idx,
  stb_arb_dirty_req,
  stb_arb_dirty_wen
);

// &Ports; @21
input   [1 :0]  ag_arb_data_bank;          
input   [63:0]  ag_arb_data_din;           
input   [11:0]  ag_arb_data_idx;           
input           ag_arb_data_req;           
input           ag_arb_data_req_dp;        
input   [3 :0]  ag_arb_data_wen;           
input   [2 :0]  ag_arb_dirty_din;          
input   [9 :0]  ag_arb_dirty_idx;          
input           ag_arb_dirty_req;          
input           ag_arb_dirty_req_dp;       
input   [2 :0]  ag_arb_dirty_wen;          
input   [22:0]  ag_arb_tag_din;            
input   [9 :0]  ag_arb_tag_idx;            
input           ag_arb_tag_req;            
input   [1 :0]  ag_arb_tag_wen;            
input   [1 :0]  icc_arb_data_bank;         
input   [63:0]  icc_arb_data_din;          
input   [11:0]  icc_arb_data_idx;          
input           icc_arb_data_req;          
input   [1 :0]  icc_arb_data_way;          
input   [3 :0]  icc_arb_data_wen;          
input   [2 :0]  icc_arb_dirty_din;         
input   [9 :0]  icc_arb_dirty_idx;         
input           icc_arb_dirty_req;         
input   [2 :0]  icc_arb_dirty_wen;         
input   [22:0]  icc_arb_tag_din;           
input   [9 :0]  icc_arb_tag_idx;           
input           icc_arb_tag_req;           
input   [1 :0]  icc_arb_tag_wen;           
input   [1 :0]  lfb_arb_data_bank;         
input   [63:0]  lfb_arb_data_din;          
input   [11:0]  lfb_arb_data_idx;          
input           lfb_arb_data_req;          
input   [1 :0]  lfb_arb_data_way;          
input   [3 :0]  lfb_arb_data_wen;          
input           lfb_arb_dcache_sel;        
input   [2 :0]  lfb_arb_dirty_din;         
input   [9 :0]  lfb_arb_dirty_idx;         
input           lfb_arb_dirty_req;         
input   [2 :0]  lfb_arb_dirty_wen;         
input   [22:0]  lfb_arb_tag_din;           
input   [9 :0]  lfb_arb_tag_idx;           
input           lfb_arb_tag_req;           
input   [1 :0]  lfb_arb_tag_wen;           
input   [1 :0]  rdl_arb_data_bank;         
input   [63:0]  rdl_arb_data_din;          
input   [11:0]  rdl_arb_data_idx;          
input           rdl_arb_data_req;          
input   [1 :0]  rdl_arb_data_way;          
input   [3 :0]  rdl_arb_data_wen;          
input           rdl_arb_dcache_sel;        
input   [2 :0]  rdl_arb_dirty_din;         
input   [9 :0]  rdl_arb_dirty_idx;         
input           rdl_arb_dirty_req;         
input   [2 :0]  rdl_arb_dirty_wen;         
input   [22:0]  rdl_arb_tag_din;           
input   [9 :0]  rdl_arb_tag_idx;           
input           rdl_arb_tag_req;           
input   [1 :0]  rdl_arb_tag_wen;           
input   [1 :0]  stb_arb_data_bank;         
input   [63:0]  stb_arb_data_din;          
input   [11:0]  stb_arb_data_idx;          
input           stb_arb_data_req;          
input   [1 :0]  stb_arb_data_way;          
input   [3 :0]  stb_arb_data_wen;          
input           stb_arb_dcache_sel;        
input   [2 :0]  stb_arb_dirty_din;         
input   [9 :0]  stb_arb_dirty_idx;         
input           stb_arb_dirty_req;         
input   [2 :0]  stb_arb_dirty_wen;         
output          arb_ag_grant;              
output          arb_icc_data_grant;        
output          arb_rdl_grant;             
output          arb_stb_xx_grant;          
output          dcache_data_cen_way0_bank0; 
output          dcache_data_cen_way0_bank1; 
output          dcache_data_cen_way1_bank0; 
output          dcache_data_cen_way1_bank1; 
output  [63:0]  dcache_data_din;           
output  [11:0]  dcache_data_idx;           
output  [3 :0]  dcache_data_wen;           
output          dcache_dirty_cen;          
output  [2 :0]  dcache_dirty_din;          
output  [9 :0]  dcache_dirty_idx;          
output  [2 :0]  dcache_dirty_wen;          
output          dcache_tag_cen;            
output  [22:0]  dcache_tag_din;            
output  [9 :0]  dcache_tag_idx;            
output  [1 :0]  dcache_tag_wen;            

// &Regs; @22
reg     [1 :0]  dcache_data_bank;          
reg     [63:0]  dcache_data_din;           
reg     [11:0]  dcache_data_idx;           
reg     [1 :0]  dcache_data_way;           
reg     [3 :0]  dcache_data_wen;           
reg     [2 :0]  dcache_dirty_din;          
reg     [9 :0]  dcache_dirty_idx;          
reg     [2 :0]  dcache_dirty_wen;          
reg     [22:0]  dcache_tag_din;            
reg     [9 :0]  dcache_tag_idx;            
reg     [1 :0]  dcache_tag_wen;            

// &Wires; @23
wire    [1 :0]  ag_arb_data_bank;          
wire    [63:0]  ag_arb_data_din;           
wire    [11:0]  ag_arb_data_idx;           
wire            ag_arb_data_req;           
wire            ag_arb_data_req_dp;        
wire    [3 :0]  ag_arb_data_wen;           
wire    [2 :0]  ag_arb_dirty_din;          
wire    [9 :0]  ag_arb_dirty_idx;          
wire            ag_arb_dirty_req;          
wire            ag_arb_dirty_req_dp;       
wire    [2 :0]  ag_arb_dirty_wen;          
wire    [22:0]  ag_arb_tag_din;            
wire    [9 :0]  ag_arb_tag_idx;            
wire            ag_arb_tag_req;            
wire    [1 :0]  ag_arb_tag_wen;            
wire            ag_data_dirty_sel;         
wire            arb_ag_grant;              
wire            arb_icc_data_grant;        
wire            arb_rdl_grant;             
wire            arb_stb_xx_grant;          
wire            dcache_data_cen_way0_bank0; 
wire            dcache_data_cen_way0_bank1; 
wire            dcache_data_cen_way1_bank0; 
wire            dcache_data_cen_way1_bank1; 
wire            dcache_data_req;           
wire    [4 :0]  dcache_data_sel;           
wire            dcache_dirty_cen;          
wire    [3 :0]  dcache_dirty_sel;          
wire            dcache_tag_cen;            
wire    [2 :0]  dcache_tag_sel;            
wire    [1 :0]  icc_arb_data_bank;         
wire    [63:0]  icc_arb_data_din;          
wire    [11:0]  icc_arb_data_idx;          
wire            icc_arb_data_req;          
wire    [1 :0]  icc_arb_data_way;          
wire    [3 :0]  icc_arb_data_wen;          
wire    [2 :0]  icc_arb_dirty_din;         
wire    [9 :0]  icc_arb_dirty_idx;         
wire            icc_arb_dirty_req;         
wire    [2 :0]  icc_arb_dirty_wen;         
wire    [22:0]  icc_arb_tag_din;           
wire    [9 :0]  icc_arb_tag_idx;           
wire            icc_arb_tag_req;           
wire    [1 :0]  icc_arb_tag_wen;           
wire    [1 :0]  lfb_arb_data_bank;         
wire    [63:0]  lfb_arb_data_din;          
wire    [11:0]  lfb_arb_data_idx;          
wire            lfb_arb_data_req;          
wire    [1 :0]  lfb_arb_data_way;          
wire    [3 :0]  lfb_arb_data_wen;          
wire            lfb_arb_dcache_sel;        
wire    [2 :0]  lfb_arb_dirty_din;         
wire    [9 :0]  lfb_arb_dirty_idx;         
wire            lfb_arb_dirty_req;         
wire    [2 :0]  lfb_arb_dirty_wen;         
wire    [22:0]  lfb_arb_tag_din;           
wire    [9 :0]  lfb_arb_tag_idx;           
wire            lfb_arb_tag_req;           
wire    [1 :0]  lfb_arb_tag_wen;           
wire    [1 :0]  rdl_arb_data_bank;         
wire    [63:0]  rdl_arb_data_din;          
wire    [11:0]  rdl_arb_data_idx;          
wire            rdl_arb_data_req;          
wire    [1 :0]  rdl_arb_data_way;          
wire    [3 :0]  rdl_arb_data_wen;          
wire            rdl_arb_dcache_sel;        
wire    [2 :0]  rdl_arb_dirty_din;         
wire    [9 :0]  rdl_arb_dirty_idx;         
wire            rdl_arb_dirty_req;         
wire    [2 :0]  rdl_arb_dirty_wen;         
wire    [22:0]  rdl_arb_tag_din;           
wire    [9 :0]  rdl_arb_tag_idx;           
wire            rdl_arb_tag_req;           
wire    [1 :0]  rdl_arb_tag_wen;           
wire    [1 :0]  stb_arb_data_bank;         
wire    [63:0]  stb_arb_data_din;          
wire    [11:0]  stb_arb_data_idx;          
wire            stb_arb_data_req;          
wire    [1 :0]  stb_arb_data_way;          
wire    [3 :0]  stb_arb_data_wen;          
wire            stb_arb_dcache_sel;        
wire    [2 :0]  stb_arb_dirty_din;         
wire    [9 :0]  stb_arb_dirty_idx;         
wire            stb_arb_dirty_req;         
wire    [2 :0]  stb_arb_dirty_wen;         


parameter D_DATA_INDEX_LEN = `D_DATA_INDEX_WIDTH;
parameter D_TAG_TAG_WIDTH  = `D_TAG_TAG_WIDTH;
parameter D_TAG_INDEX_LEN  = `D_TAG_INDEX_WIDTH;

assign ag_data_dirty_sel  = ag_arb_data_req_dp | ag_arb_dirty_req_dp;

assign arb_ag_grant       = ~(lfb_arb_dcache_sel | rdl_arb_dcache_sel);
assign arb_icc_data_grant = 1'b1;
assign arb_rdl_grant      = 1'b1;
assign arb_stb_xx_grant   = ~(lfb_arb_dcache_sel | rdl_arb_dcache_sel | 
                              ag_data_dirty_sel);

assign dcache_tag_cen = ~(ag_arb_tag_req |
                          lfb_arb_tag_req |
                          rdl_arb_tag_req |
                          icc_arb_tag_req);

assign dcache_tag_sel[2:0] = {rdl_arb_dcache_sel, 
                              lfb_arb_dcache_sel,
                              ag_arb_tag_req};

// &CombBeg; @46
always @( ag_arb_tag_din[22:0]
       or rdl_arb_tag_idx[9:0]
       or dcache_tag_sel[2:0]
       or icc_arb_tag_wen[1:0]
       or icc_arb_tag_din[22:0]
       or lfb_arb_tag_din[22:0]
       or ag_arb_tag_idx[9:0]
       or icc_arb_tag_idx[9:0]
       or lfb_arb_tag_idx[9:0]
       or lfb_arb_tag_wen[1:0]
       or rdl_arb_tag_wen[1:0]
       or rdl_arb_tag_din[22:0]
       or ag_arb_tag_wen[1:0])
begin
  casez (dcache_tag_sel[2:0])
    3'b1?? : begin
             dcache_tag_wen[1:0]  = ~rdl_arb_tag_wen[1:0];
             dcache_tag_din[22:0] = rdl_arb_tag_din[22:0]; 
             dcache_tag_idx[9:0]  = rdl_arb_tag_idx[9:0]; 
             end
    3'b01? : begin 
             dcache_tag_wen[1:0]  = ~lfb_arb_tag_wen[1:0];
             dcache_tag_din[22:0] = lfb_arb_tag_din[22:0]; 
             dcache_tag_idx[9:0]  = lfb_arb_tag_idx[9:0]; 
             end
    3'b001 : begin 
             dcache_tag_wen[1:0]  = ~ag_arb_tag_wen[1:0];
             dcache_tag_din[22:0] = ag_arb_tag_din[22:0];
             dcache_tag_idx[9:0]  = ag_arb_tag_idx[9:0];  
             end
    default: begin 
             dcache_tag_wen[1:0]  = ~icc_arb_tag_wen[1:0];
             dcache_tag_din[22:0] = icc_arb_tag_din[22:0]; 
             dcache_tag_idx[9:0]  = icc_arb_tag_idx[9:0]; 
             end
  endcase
// &CombEnd; @69
end

assign dcache_dirty_cen = ~(lfb_arb_dirty_req | 
                            rdl_arb_dirty_req |
                            stb_arb_dirty_req |
                            ag_arb_dirty_req  |
                            icc_arb_dirty_req);

assign dcache_dirty_sel[3:0] = {rdl_arb_dcache_sel,
                                lfb_arb_dcache_sel,
                                ag_arb_dirty_req,
                                stb_arb_dcache_sel};

// &CombBeg; @82
always @( rdl_arb_dirty_wen[2:0]
       or rdl_arb_dirty_din[2:0]
       or icc_arb_dirty_din[2:0]
       or ag_arb_dirty_wen[2:0]
       or rdl_arb_dirty_idx[9:0]
       or stb_arb_dirty_din[2:0]
       or icc_arb_dirty_wen[2:0]
       or lfb_arb_dirty_din[2:0]
       or dcache_dirty_sel[3:0]
       or ag_arb_dirty_din[2:0]
       or lfb_arb_dirty_idx[9:0]
       or ag_arb_dirty_idx[9:0]
       or stb_arb_dirty_wen[2:0]
       or icc_arb_dirty_idx[9:0]
       or lfb_arb_dirty_wen[2:0]
       or stb_arb_dirty_idx[9:0])
begin
  casez (dcache_dirty_sel[3:0])
    4'b1???: begin 
             dcache_dirty_wen[2:0] = ~rdl_arb_dirty_wen[2:0];
             dcache_dirty_din[2:0] =  rdl_arb_dirty_din[2:0]; 
             dcache_dirty_idx[9:0] = rdl_arb_dirty_idx[9:0]; 
             end
    4'b01??: begin 
             dcache_dirty_wen[2:0] = ~lfb_arb_dirty_wen[2:0];
             dcache_dirty_din[2:0] =  lfb_arb_dirty_din[2:0]; 
             dcache_dirty_idx[9:0] = lfb_arb_dirty_idx[9:0]; 
             end
    4'b001?: begin 
             dcache_dirty_wen[2:0] = ~ag_arb_dirty_wen[2:0];
             dcache_dirty_din[2:0] =  ag_arb_dirty_din[2:0]; 
             dcache_dirty_idx[9:0] = ag_arb_dirty_idx[9:0]; 
             end
    4'b0001: begin 
             dcache_dirty_wen[2:0] = ~stb_arb_dirty_wen[2:0];
             dcache_dirty_din[2:0] =  stb_arb_dirty_din[2:0];
             dcache_dirty_idx[9:0] = stb_arb_dirty_idx[9:0];  
             end
    default: begin 
             dcache_dirty_wen[2:0] = ~icc_arb_dirty_wen[2:0];
             dcache_dirty_din[2:0] =  icc_arb_dirty_din[2:0]; 
             dcache_dirty_idx[9:0] = icc_arb_dirty_idx[9:0]; 
             end
  endcase
// &CombEnd; @110
end

assign dcache_data_req = rdl_arb_data_req |
                         lfb_arb_data_req |
                         ag_arb_data_req | 
                         stb_arb_data_req |
                         icc_arb_data_req;

assign dcache_data_cen_way0_bank0 = ~(dcache_data_req & dcache_data_way[0] & dcache_data_bank[0]);
assign dcache_data_cen_way0_bank1 = ~(dcache_data_req & dcache_data_way[0] & dcache_data_bank[1]);
assign dcache_data_cen_way1_bank0 = ~(dcache_data_req & dcache_data_way[1] & dcache_data_bank[0]);
assign dcache_data_cen_way1_bank1 = ~(dcache_data_req & dcache_data_way[1] & dcache_data_bank[1]);

assign dcache_data_sel[4:0] = {rdl_arb_dcache_sel, 
                               lfb_arb_dcache_sel, 
                               ag_data_dirty_sel,  
                               stb_arb_dcache_sel,
                               icc_arb_data_req};

// &CombBeg; @129
always @( icc_arb_data_way[1:0]
       or lfb_arb_data_idx[11:0]
       or ag_arb_data_bank[1:0]
       or stb_arb_data_way[1:0]
       or ag_arb_data_din[63:0]
       or dcache_data_sel[4:0]
       or rdl_arb_data_idx[11:0]
       or lfb_arb_data_bank[1:0]
       or ag_arb_data_idx[11:0]
       or icc_arb_data_bank[1:0]
       or lfb_arb_data_wen[3:0]
       or icc_arb_data_din[63:0]
       or icc_arb_data_wen[3:0]
       or stb_arb_data_bank[1:0]
       or rdl_arb_data_way[1:0]
       or rdl_arb_data_wen[3:0]
       or rdl_arb_data_bank[1:0]
       or ag_arb_data_wen[3:0]
       or stb_arb_data_wen[3:0]
       or icc_arb_data_idx[11:0]
       or stb_arb_data_idx[11:0]
       or rdl_arb_data_din[63:0]
       or lfb_arb_data_din[63:0]
       or stb_arb_data_din[63:0]
       or lfb_arb_data_way[1:0])
begin
  casez (dcache_data_sel[4:0])
    5'b1????:begin
             dcache_data_way[1:0]  = rdl_arb_data_way[1:0];
             dcache_data_bank[1:0] = rdl_arb_data_bank[1:0];
             dcache_data_wen[3:0]  = ~rdl_arb_data_wen[3:0];
             dcache_data_din[63:0] = rdl_arb_data_din[63:0]; 
             dcache_data_idx[11:0] = rdl_arb_data_idx[11:0]; 
             end
    5'b01???:begin 
             dcache_data_way[1:0]  = lfb_arb_data_way[1:0];
             dcache_data_bank[1:0] = lfb_arb_data_bank[1:0];
             dcache_data_wen[3:0]  = ~lfb_arb_data_wen[3:0];
             dcache_data_din[63:0] = lfb_arb_data_din[63:0]; 
             dcache_data_idx[11:0] = lfb_arb_data_idx[11:0]; 
             end
    5'b001??:begin 
             dcache_data_way[1:0]  = 2'b11;
             dcache_data_bank[1:0] = ag_arb_data_bank[1:0];
             dcache_data_wen[3:0]  = ~ag_arb_data_wen[3:0];
             dcache_data_din[63:0] = ag_arb_data_din[63:0]; 
             dcache_data_idx[11:0] = ag_arb_data_idx[11:0]; 
             end
    5'b0001?:begin 
             dcache_data_way[1:0]  = stb_arb_data_way[1:0];
             dcache_data_bank[1:0] = stb_arb_data_bank[1:0];
             dcache_data_wen[3:0]  = ~stb_arb_data_wen[3:0];
             dcache_data_din[63:0] = stb_arb_data_din[63:0];
             dcache_data_idx[11:0] = stb_arb_data_idx[11:0];  
             end
    5'b00001:begin 
             dcache_data_way[1:0]  = icc_arb_data_way[1:0];
             dcache_data_bank[1:0] = icc_arb_data_bank[1:0];
             dcache_data_wen[3:0]  = ~icc_arb_data_wen[3:0];
             dcache_data_din[63:0] = icc_arb_data_din[63:0]; 
             dcache_data_idx[11:0] = icc_arb_data_idx[11:0]; 
             end
    default:begin
             dcache_data_way[1:0]  = 2'b11;
             dcache_data_bank[1:0] = ag_arb_data_bank[1:0];
             dcache_data_wen[3:0]  = ~ag_arb_data_wen[3:0];
             dcache_data_din[63:0] = ag_arb_data_din[63:0]; 
             dcache_data_idx[11:0] = ag_arb_data_idx[11:0]; 
             end
  endcase
// &CombEnd; @174
end


// &ModuleEnd; @177
endmodule


