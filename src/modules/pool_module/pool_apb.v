/*
* pool_apb.v
*/

module pool_apb 
  (
    input wire PCLK,          // APB clock
    input wire PRESETB,       // APB asynchronous reset (0: reset, 1: normal)
    input wire [31:0] PADDR,  // APB address
    input wire PSEL,          // APB select
    input wire PENABLE,       // APB enable
    input wire PWRITE,        // APB write enable
    input wire [31:0] PWDATA, // APB write data
    output wire [31:0] PRDATA,

    input wire [31:0] clk_counter,
    input wire [0:0] pool_done,
    output reg [0:0] pool_start,

    //////////////////////////////////////////////////////////////////////////
    // TODO : Add ports if you need them
    //////////////////////////////////////////////////////////////////////////

    output reg[5:0] flen,
    output reg[8:0] inch
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
          32'h00000000 : prdata_reg <= {31'h0,pool_start};
          32'h00000004 : prdata_reg <= {31'd0,pool_done};
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
      pool_start <= 1'b0;
    end
    else begin
      if (PWRITE & state_enable) begin
        case ({PADDR[31:2], 2'h0})
          /*WRITEIN*/
          32'h00000000 : begin
            pool_start <= PWDATA[0];
          end
          32'h00000004: begin
            flen <= PWDATA;
          end
          32'h0000000c: begin
            inch <= PWDATA;
          end
          default: ;
        endcase
      end
    end
  end

endmodule
