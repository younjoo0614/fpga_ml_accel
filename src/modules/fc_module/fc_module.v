/*
* fc_module.v
*/

module fc_module 
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
    output wire M_AXIS_TVALID

    //////////////////////////////////////////////////////////////////////////
    // TODO : Add ports as you need
    //////////////////////////////////////////////////////////////////////////

  ); 

  localparam STATE_IDLE = 4'd0,
  STATE_RECEIVE_FEATURE = 4'd1,
  STATE_RECEIVE_BIAS = 4'd2,
  STATE_RECEIVE_WEIGHT_AND_READ_FEATURE = 4'd3,
  STATE_READ_BIAS = 4'd4,
  STATE_COMPUTE = 4'd5,
  STATE_PSUM = 4'd6,
  STATE_ADD_BIAS = 4'd7,
  STATE_WRITE_RESULT = 4'd7,
  STATE_SEND_RESULT = 4'd8;
  
  reg [3:0] state;
  
  reg m_axis_tuser;
  reg [C_S00_AXIS_TDATA_WIDTH-1 : 0] m_axis_tdata;
  reg [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] m_axis_tkeep;
  reg m_axis_tlast;
  reg m_axis_tvalid;
  wire s_axis_tready;
  
  assign S_AXIS_TREADY = s_axis_tready;
  assign M_AXIS_TDATA = m_axis_tdata;
  assign M_AXIS_TLAST = m_axis_tlast;
  assign M_AXIS_TVALID = m_axis_tvalid;
  assign M_AXIS_TUSER = 1'b0;
  assign M_AXIS_TKEEP = {(C_S00_AXIS_TDATA_WIDTH/8) {1'b1}};

  ////////////////////////////////////////////////////////////////////////////
  // TODO : Write your code here
  ////////////////////////////////////////////////////////////////////////////
  
  // control path
  always @(posedge clk) begin
    if (!rstn) begin
      state <= STATE_IDLE;
    end
    else begin
      case (state)
        STATE_IDLE: begin
          
        end
        STATE_RECEIVE_FEATURE: begin
          
        end
        STATE_RECEIVE_BIAS: begin
          
        end
        STATE_RECEIVE_WEIGHT_AND_READ_FEATURE: begin
          
        end
        STATE_READ_BIAS: begin
          
        end
        STATE_MAC: begin
          
        end
        STATE_ACCUM: begin
          
        end
        STATE_WRITE_RESULT: begin
          
        end
        STATE_SEND_RESULT: begin
          
        end
      endcase
    end
  end
  
  // data path
  always @(posedge clk) begin
    if (!rstn) begin
    end
    else begin
      case (state)
        STATE_IDLE: begin
          
        end
        STATE_RECEIVE_FEATURE: begin
          
        end
        STATE_RECEIVE_BIAS: begin
          
        end
        STATE_RECEIVE_WEIGHT_AND_READ_FEATURE: begin
          
        end
        STATE_READ_BIAS: begin
          
        end
        STATE_MAC: begin
          
        end
        STATE_ACCUM: begin
          
        end
        STATE_WRITE_RESULT: begin
          
        end
        STATE_SEND_RESULT: begin
          
        end
      endcase
    end
  end
  
endmodule
