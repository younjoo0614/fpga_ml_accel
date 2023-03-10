/*
* conv_apb.v
*/

module conv_apb 
  (
    input wire PCLK,           // APB clock
    input wire PRESETB,        // APB asynchronous reset (0: reset, 1: normal)
    input wire [31:0] PADDR,   // APB address
    input wire PSEL,           // APB select
    input wire PENABLE,        // APB enable
    input wire PWRITE,         // APB write enable
    input wire [31:0] PWDATA,  // APB write data
    output wire [31:0] PRDATA,

    input wire [31:0] clk_counter,
    input wire [0:0] conv_done,
    output reg [0:0] conv_start,

    //////////////////////////////////////////////////////////////////////////
    // TODO : Add ports if you need them
    //////////////////////////////////////////////////////////////////////////
    output reg [2:0] COMMAND,
    output reg [5:0] Flen,
    output reg [8:0] num_INCH,
    output reg [8:0] num_OUTCH,
    output reg RSTN,
    input wire F_writedone, rdy_to_send, B_writedone
  );
  
  wire state_enable;
  wire state_enable_pre;
  reg [31:0] prdata_reg;
  
  assign state_enable = PSEL & PENABLE;
  assign state_enable_pre = PSEL & ~PENABLE;

  //////////////////////////////////////////////////////////////////////////
  // TODO : Write your code here
  //////////////////////////////////////////////////////////////////////////
  
  // READ OUTPUT
  always @(posedge PCLK, negedge PRESETB) begin
    if (PRESETB == 1'b0) begin
      prdata_reg <= 32'h00000000;
    end
    else begin
      if (~PWRITE & state_enable_pre) begin
        case ({PADDR[31:2], 2'h0})
          /*READOUT*/
          32'h00000000 : prdata_reg <= {31'h0,conv_start};
          32'h00000020 : prdata_reg <= {31'h0,F_writedone};
          32'h00000024 : prdata_reg <= {31'h0,B_writedone};
          32'h00000028 : prdata_reg <= {31'h0,rdy_to_send};
          32'h0000002c : prdata_reg <= {31'h0,conv_done};
          32'h00000008 : prdata_reg <= clk_counter;
          default: prdata_reg <= 32'h0;
        endcase
      end
      else begin
        prdata_reg <= 32'h0;
      end
    end
  end
  
  assign PRDATA = (~PWRITE & state_enable) ? prdata_reg : 32'h00000000;
  
  // WRITE ACCESS
  always @(posedge PCLK, negedge PRESETB) begin
    if (PRESETB == 1'b0) begin
      /*WRITERES*/
      conv_start <= 1'b0;
    end
    else begin
      if (PWRITE & state_enable) begin
        case ({PADDR[31:2], 2'b0})
          /*WRITEIN*/
          32'h00000000 : begin
            COMMAND <= PWDATA[2:0];
            conv_start <= PWDATA[0];
            RSTN <= |PWDATA;
          end
          32'h0000000c : begin
            Flen <= PWDATA[5:0];
          end
          32'h00000004 : begin
            num_INCH <= PWDATA[8:0];
          end
          32'h00000008 : begin
            num_OUTCH <= PWDATA[8:0];
          end
          default: ;
        endcase
      end
    end
  end

endmodule
