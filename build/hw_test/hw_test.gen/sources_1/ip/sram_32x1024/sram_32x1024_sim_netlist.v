// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Wed Dec 22 12:35:55 2021
// Host        : DESKTOP-L4F61F4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/younj/Desktop/dsd_final/build/hw_test/hw_test.gen/sources_1/ip/sram_32x1024/sram_32x1024_sim_netlist.v
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
