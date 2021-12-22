// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Wed Dec 22 13:11:12 2021
// Host        : DESKTOP-L4F61F4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ sram_32x1024_sim_netlist.v
// Design      : sram_32x1024
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sram_32x1024,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27952)
`pragma protect data_block
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
cJ0wpiHeJY6IOXqboPRr7OJ5BwJ94A==
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
