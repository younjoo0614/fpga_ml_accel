-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Fri Nov  6 00:57:17 2020
-- Host        : localhost.localdomain running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub
--               /home/jaewoong/Work/code/FPGA/project/2020/common_ip/clk_gen/clk_gen_stub.vhdl
-- Design      : clk_gen
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_gen is
  Port ( 
    clk_100mhz : out STD_LOGIC;
    clk_200mhz : out STD_LOGIC;
    clk_325mhz : out STD_LOGIC;
    resetn : in STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_gen;

architecture stub of clk_gen is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_100mhz,clk_200mhz,clk_325mhz,resetn,clk_in1";
begin
end;
