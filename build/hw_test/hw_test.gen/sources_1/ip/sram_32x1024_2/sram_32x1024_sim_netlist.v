// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Wed Dec 22 13:11:12 2021
// Host        : DESKTOP-L4F61F4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.gen/sources_1/ip/sram_32x1024_2/sram_32x1024_sim_netlist.v
// Design      : sram_32x1024
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sram_32x1024,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module sram_32x1024
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.632725 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "sram_32x1024.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  sram_32x1024_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sbNGmomEbP78s1hfxgX3P1Jo01EKJk0i0C7iGpF+Yibr9EK0s4mcIifHDN/ag4jpPwW3bPllMHvn
U8AEY3mO8hCXVVoilrcRuCaEna/98GycCzy4G7FnYMfowsJb5k9ifRdE2jnurzeTLFbupUSpDF0H
Rl3Ci3DTGeExAZZ9UQE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zZZZoIprBFYfDWmCCcduELBM7HU98/+rvP9g8+y1mYyD3r3HEDm4ZwehwZvPoYWqoGXYoFqWZh3h
utt0abIfUW9/oF2vJ9hXn7nArtcm/Eui18rPYqp3aj/AItPNVXojk9zp7uFZLPTqcyig5v3Jtenl
qPnLi1Z84ZCW7NIRw6Y0bgmw6z26E8VPbYrZHs+0YW8Sztjo6CdIrQeEL5WBDolA0aHoKHWRZyFs
l5eRDmBAolj2uF07t/3eY3J7cYJmEDaoZ0TR1qcz25VFNu0OlcrEJ19IT+QdAxTah4jqJtknGZrT
6lUMwDZ7dBQwF1EuaE6p90gGNERhGAsbHLdvaw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KUbz0Iu2faeWqD6HFeuGLtSOAlqZmpKCCJfzym8tkcWUUNgNMn2mYvx6PTM7j4tyig8JdUG3uZYs
NfPgAsNXQtTI7b19u9CkMks9jR+oEzX1rW7QtTvSj/nHZLg2smoFwuB5Ieb7/B8IIs1NTUrIz6Rc
itLQVG+L+GMziamsrx4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G7XYdRx9VGclyxTEtwMG+rjJHV8bfBxEGdkcN82UL3koN3Dt0M5AWkzEvHcskt1W0hTOjyYgmvYj
/p70w1nz96tlg226+e4UubpRmBH9QXBBX6UmqIwSiHj9H+XI1yNfTIdlwBKGQvfzwCAMwBwrrrGL
/804k5Ux3RhWRvwezZB4+sj9DFm4akREVXmNpfeqjI2X02LU/MxWMUbKxvjJnD9YxikAAO6ccTd6
8DKv76V76MEFVyXc7E2FeQDToW3lqkRTa6MTpIXbYSekRihQC+qPVuhPUneA4kepvQDfgFYE8/Ir
gu5gK+s/qNfuXhJUAqyLjslrUcY4+XD9ckpSvQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YXkYRXpUPv/tETnwnThdQ46UaPmI23lN9vrxHQjIOhq3WNJCuz7TYZK9hyzSdo6k0U6QE9ihQy2L
rYZg68RGbrK8bzlcnQ41r18LZb4GYlAn9PH7IrF1B+aHm3578doOZHf8wzUE2s+d1aHQIn6VIZjL
14pCTAjErJfMO13fgX6h8sgxb4GFC3eIORmkrq2J/fB9HALyh/qdGiLi7DejMfmdsssbOcPQTZUh
6Belf7fHTkIEr9B44rFZgMyrMVx4N9p0XpXD3JPe7Xeg6a3jxdqxHATaMuLdIa4s+ZiAz1TRx0EO
FFihCnLLb7weBBITQyTIncRL817BrF/ZXZD8Yw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g7FbNw1ywd4TBNHq8OmK/4zoKI/t7vKmyT8R8SeiyUtKywhn0/7DZ/lV0Lf4IhY8X5MYsKtOQ5l6
DIl3fxtOhxpi8NHn9Nw3Nfb8NnS38Zuy6DSpwOL0f/GSmUSf2/YdB5Ben6xibQT0Oy//oBl5/1kR
pV5fWjj8WRgI6cnmfyj3g1MxepxPu1A/UHxlm1/i9yUHHi114N/hEQ0iujjrn6GxfZSiJUVF+r6c
rnxD//eOAl/YaxhdU/KhUkfsMn+MxtA5m6hTYYE0bnze8rpmEU5UGYKyY0p8KUs+MgsdTe+m/7gV
HSf6puBqQmEa1qksRfl742aL9B9y169or7Jp9Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kd1A2zIphLxXB0RyfHIqLkHXfWl0n38vROERuDghYrhK0ItcWGEP0XBrri6k1VZCSPYwiSu//pM6
83BfcPKbk09/A+ksvDIa3xS8Tg7DJK2AS+0pdnzBSjVWh+QD+glA3Hjk6LG9OMbjXyqD3hnMKacA
VRMwxKktV+KT5NXj5a7fMxXjo9exc0xM+woUJiSYs8onoUSwfBeH5/xhUy+iu+w0/OOydQE2LXZ0
1y+RObiz5C22dD4GGCfuvUCGAthYpUf633ZxRYN45mmAn5PxPsH4o+l2GhH/50Gu/VPVoAWDhgXQ
e93oPri++HinkK2uvDhDl4PI9HtRkq11Ky3uXQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gDrrFgXHVyBo+Cn0bYn+SOSOCXPg7besukY6l0JmA/nu4gap105Wxbg11c7TJZ9ctHVLc5DXAxr+
EIvFpAIepoZBREtMjTlaIdNJ8k1nUpwAv2jaQeseq1TudTjugV1jtOYYk0RKd88z/6SJ8t9urDW0
yKqsfEWU3PwGcUGHOWtTn2hfAceNznmEIFWLmFmzSQJ1hQNdsIQn3jHnfMVYu8cAz5xvPVQWYyJW
pMHXhNYk6GyAjIshh991slb1g01K1ilR2tKD1EmxH5WGrX9BEUqBjHQo6uluC/d3mvcEQ5nJ1v+P
hIlj4qzUQT1wXjpk6d/BvNx7LyWmj5iq35dzNm+cdhfGwaFGG//vgmB6D/dFfs2BYSjHsa6VlpVM
7e2OgoFenuG9p1SVPI6gAs2MuFtnDKfxW7jS3RGhvsquS3tg1iFCDH/OU7E5aWfY7twF3yyN6G10
l72RZw62DfNoCdyUMG9sA8nc4qf6dEhyrr5S6XxpJhoBDJvkeq0TCUQZ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XR7vRF1m+9DS2Pv4r/O4uHwmvtXkChnKbsJCYczn1dvkZbcZSbBm/2UH78dXUaNorOh9XAuCvSjb
ER73y7e0anAfaIf1tJ9Y9pIb8EuNxGS/Pqdvg36cWarwGac9tsscdv/HWfb5Z+qWEk0/uFcLI7pH
CZO7fF2/ONQjA0NtUFBjW4idlx8WrySIuJgDs4jyGkMhbHR3U/ghF1YhMhwgwsbbcptfC1XLrIqQ
OecZnZu8E2hyc5eK/ccYdKcHnXoL55z1p5amI6Fuvz0wKTz2QQ/mwXodfGjEC1ZRWwTn7zCFM91M
qrA1Is49i6pSa7/VICjgn8ULMT1oKGfJLPm7hg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27920)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
