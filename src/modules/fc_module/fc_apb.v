/*
* fc_apb.v
*/

module fc_apb
  (
    input wire PCLK,
    input wire PRESETB,        // APB asynchronous reset (0: reset, 1: normal)
    input wire [31:0] PADDR,   // APB address
    input wire PSEL,           // APB select
    input wire PENABLE,        // APB enable
    input wire PWRITE,         // APB write enable
    input wire [31:0] PWDATA,  // APB write data
    output wire [31:0] PRDATA,  // CPU interface out

    input wire [31:0] clk_counter,
    input wire [31:0] max_index,

    //////////////////////////////////////////////////////////////////////////
    // TODO : Add ports as you need
    //////////////////////////////////////////////////////////////////////////
    output reg [2:0] COMMAND,
    output reg fc_start,
    output reg [20:0] SIZE,

    input wire F_writedone, B_writedone, FC_DONE, W_writedone
  );

  wire state_enable;
  wire state_enable_pre;
  reg [31:0] prdata_reg;
  
  assign state_enable = PSEL & PENABLE;
  assign state_enable_pre = PSEL & ~PENABLE;
  
  ////////////////////////////////////////////////////////////////////////////
  // TODO : Write your code here
  ////////////////////////////////////////////////////////////////////////////
  
  // READ OUTPUT
  always @(posedge PCLK, negedge PRESETB) begin
    if (PRESETB == 1'b0) begin
      prdata_reg <= 32'h00000000;
    end
    else begin
      if (~PWRITE & state_enable_pre) begin
        case ({PADDR[31:2], 2'h0})
          /*READOUT*/
          32'h0000000c : prdata_reg <= {31'h0, FC_DONE};
          32'h00000010 : prdata_reg <= {31'h0, F_writedone};
          32'h00000014 : prdata_reg <= {31'h0, B_writedone};
          32'h00000008 : prdata_reg <= {31'h0, W_writedone};
          32'h00000018 : prdata_reg <= clk_counter;
          32'h00000020 : prdata_reg <= max_index;
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
      SIZE <= 21'h0;
      fc_start <= 1'b0;
      COMMAND <= 3'b0;
    end
    else begin
      if (PWRITE & state_enable) begin
        case ({PADDR[31:2], 2'h0})
          /*WRITEIN*/
          32'h00000000 : begin
            COMMAND <= PWDATA[2:0];
            fc_start <= |PWDATA;
          end
          32'h00000004 : begin
            SIZE <= PWDATA[20:0];
          end
          default: ;
        endcase
      end
    end
  end
endmodule
  