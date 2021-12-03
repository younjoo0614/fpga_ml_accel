/*
* pool_module.v
*/

module pool_module 
  #(
    parameter integer C_S00_AXIS_TDATA_WIDTH = 32
  )
  (
    input wire clk,
    input wire rstn,

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

    input pool_start, 
    output reg pool_done,

    
    //////////////////////////////////////////////////////////////////////////
    // TODO : Add ports if you need them
    //////////////////////////////////////////////////////////////////////////
    input flen_receive, inch_receive
  );

  localparam STATE_IDLE = 2'd0,
  STATE_RECEIVE_FLEN = 2'd1,
  STATE_RECEIVE_INCH = 2'd2;

  reg [1:0] state;
  
  reg m_axis_tuser;
  reg [C_S00_AXIS_TDATA_WIDTH-1 : 0] m_axis_tdata;
  reg [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] m_axis_tkeep;
  reg m_axis_tlast;
  reg m_axis_tvalid;
  reg s_axis_tready;
  
  assign S_AXIS_TREADY = s_axis_tready;
  assign M_AXIS_TDATA = m_axis_tdata;
  assign M_AXIS_TLAST = m_axis_tlast;
  assign M_AXIS_TVALID = m_axis_tvalid;
  assign M_AXIS_TUSER = 1'b0;
  assign M_AXIS_TKEEP = {(C_S00_AXIS_TDATA_WIDTH/8) {1'b1}};
  
  //////////////////////////////////////////////////////////////////////////
  // TODO : Write your code here
  //////////////////////////////////////////////////////////////////////////

  sram_32x16 u_sram_32x16(
  .addra(addr),
  .clka(clk),
  .dina(din),
  .douta(dout),
  .ena(bram_en),
  .wea(we)
);

  always @ (posedge clk ) begin
    if (!rstn) begin
      state <= STATE_IDLE;
    end
    else begin
      case (state)
        STATE_IDLE: begin
          s_axis_tready <= 1'b0;
          if (flen_receive) begin
            state <= STATE_RECEIVE_FLEN;
          end
          else if (inch_receive) begin
            state <= STATE_RECEIVE_INCH;
          end
        end
        STATE_RECEIVE_FLEN: begin
          s_axis_tready <= 1'b1;
          if (S_AXIS_TLAST) begin
            state <= STATE_IDLE;
          end
          
        end
        STATE_RECEIVE_INCH: begin
          s_axis_tready <= 1'b1;
          if (S_AXIS_TLAST) begin
            state <= STATE_IDLE;
          end
          
        end
      endcase
    end
  end

  
endmodule
