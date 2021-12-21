/*
* pool_top.v
*/

`timescale 1ns / 1ps

module pool_top 
  #(
    parameter integer C_S00_AXIS_TDATA_WIDTH = 32
  )
  (
    input wire CLK,
    input wire RESETN,

    // AXIS protocol
    output wire S_AXIS_TREADY,
    input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] S_AXIS_TDATA,
    input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] S_AXIS_TKEEP, 
    input wire S_AXIS_TUSER, 
    input wire S_AXIS_TLAST, 
    input wire S_AXIS_TVALID, 

    input wire M_AXIS_TREADY, 
    output wire M_AXIS_TUSER, 
    output wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] M_AXIS_TDATA, 
    output wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] M_AXIS_TKEEP, 
    output wire M_AXIS_TLAST, 
    output wire M_AXIS_TVALID, 

    // APB protocol
    input wire [31:0] PADDR, 
    input wire PSEL, 
    input wire PENABLE, 
    input wire PWRITE, 
    input wire [31:0] PWDATA, 
    output wire PSLVERR, 
    output wire PREADY, 
    output wire [31:0] PRDATA
  );
  
  // For Pool control path
  wire pool_start;   // you can use respond of this signal for handshaking
  wire pool_done;    // you can use respond of this signal for handshaking
  wire [31:0] clk_counter;
  assign PREADY = 1'b1;
  assign PSLVERR = 1'b0;

  wire [5:0] Flen;
  wire [8:0] num_INCH;
  
  clk_counter_pool u_clk_counter(
    .clk(CLK),
    .rstn(RESETN),
    .start(pool_start),
    .done(pool_done),

    .clk_counter(clk_counter)
  );
  
  pool_module #(.C_S00_AXIS_TDATA_WIDTH(C_S00_AXIS_TDATA_WIDTH)) 
  u_pool_module
  (
    .clk  (CLK),
    .rstn (RESETN),

    .S_AXIS_TREADY (S_AXIS_TREADY),
    .S_AXIS_TDATA  (S_AXIS_TDATA),
    .S_AXIS_TKEEP  (S_AXIS_TKEEP),
    .S_AXIS_TUSER  (S_AXIS_TUSER),
    .S_AXIS_TLAST  (S_AXIS_TLAST),
    .S_AXIS_TVALID (S_AXIS_TVALID),

    .M_AXIS_TREADY (M_AXIS_TREADY),
    .M_AXIS_TUSER  (M_AXIS_TUSER),
    .M_AXIS_TDATA  (M_AXIS_TDATA),
    .M_AXIS_TKEEP  (M_AXIS_TKEEP),
    .M_AXIS_TLAST  (M_AXIS_TLAST),
    .M_AXIS_TVALID (M_AXIS_TVALID),

    .pool_start(pool_start),
    .pool_done(pool_done),

    //////////////////////////////////////////////////////////////////////////
    // TODO : Add ports if you need them
    //////////////////////////////////////////////////////////////////////////

    .Flen(Flen),
    .num_INCH(num_INCH)
  );

  pool_apb u_pool_apb(
    .PCLK(CLK),
    .PRESETB(RESETN),
    .PADDR({16'd0,PADDR[15:0]}),
    .PSEL(PSEL),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PWDATA(PWDATA),
    .PRDATA(PRDATA),

    .pool_start(pool_start),
    .pool_done(pool_done),
    .clk_counter(clk_counter),

    //////////////////////////////////////////////////////////////////////////
    // TODO : Add ports if you need them
    //////////////////////////////////////////////////////////////////////////

    .Flen(Flen),
    .num_INCH(num_INCH)
  );
  
endmodule
