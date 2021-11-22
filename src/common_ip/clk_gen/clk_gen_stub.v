// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Fri Nov  6 00:57:17 2020
// Host        : localhost.localdomain running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/jaewoong/Work/code/FPGA/project/2020/common_ip/clk_gen/clk_gen_stub.v
// Design      : clk_gen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_gen(clk_100mhz, clk_200mhz, clk_325mhz, resetn, 
  clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_100mhz,clk_200mhz,clk_325mhz,resetn,clk_in1" */;
  output clk_100mhz;
  output clk_200mhz;
  output clk_325mhz;
  input resetn;
  input clk_in1;
endmodule
