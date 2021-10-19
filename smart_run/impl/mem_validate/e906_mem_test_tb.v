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

module e906_mem_test_tb();

wire  bht_mem_test_pass;



initial
begin
  #100000;
  if(bht_mem_test_pass)
  begin
    $display("*************************************************\n");
    $display("*************BHT MEMORY TEST PASS!!!*************\n");
    $display("*************************************************\n");
  end
  else begin
    $display("*************************************************\n");
    $display("*************BHT MEMORY TEST FAIL!!!*************\n");
    $display("*************************************************\n");
    $display("*************************************************\n");
    $display("**********SORRY!!! MEMORY TEST FAIL!!!***********\n");
    $display("*************************************************\n");
    $finish;
  end

end

e906_bht_mem_test    x_bht_mem_test   (.bht_mem_test_pass(bht_mem_test_pass));

initial
begin
  $dumpfile("test.vcd");
  $dumpvars;
end

endmodule
