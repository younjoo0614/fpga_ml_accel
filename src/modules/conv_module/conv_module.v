/*
* conv_module.v
*/

module conv_module 
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

    input conv_start, 
    output reg conv_done,

    //////////////////////////////////////////////////////////////////////////
    // TODO : Add ports if you need them
    //////////////////////////////////////////////////////////////////////////
    input[2:0] command,
    output wire F_writedone,
    output wire B_writedone,
    output wire RDY_TO_SEND

  );
  localparam STATE_IDLE = 4'd0,
  STATE_RECEIVE_FEATURE = 4'd1,
  STATE_RECEIVE_BIAS = 4'd2,
  STATE_RECEIVE_WEIGHT = 4'd3,
  STATE_READ_BIAS = 4'd4,
  STATE_COMPUTE = 4'd5,
  STATE_PSUM = 4'd6,
  STATE_ADD_BIAS = 4'd7,
  STATE_WRITE_RESULT = 4'd8,
  STATE_SEND_RESULT = 4'd9;
  
  reg                                           m_axis_tuser;
  reg [C_S00_AXIS_TDATA_WIDTH-1 : 0]            m_axis_tdata;
  reg [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0]        m_axis_tkeep;
  reg                                           m_axis_tlast;
  reg                                           m_axis_tvalid;
  reg                                           s_axis_tready;
  
  assign S_AXIS_TREADY = s_axis_tready;
  assign M_AXIS_TDATA = m_axis_tdata;
  assign M_AXIS_TLAST = m_axis_tlast;
  assign M_AXIS_TVALID = m_axis_tvalid;
  assign M_AXIS_TUSER = 1'b0;
  assign M_AXIS_TKEEP = {(C_S00_AXIS_TDATA_WIDTH/8) {1'b1}};
  

  ////////////////////////////////////////////////////////////////////////////
  // TODO : Write your code here
  ////////////////////////////////////////////////////////////////////////////
  reg [3:0] state;
  reg f_receive_done, b_receive_done, w_receive_done, ready_to_send, send_done;

  assign F_writedone = f_receive_done;
  assign B_writedone = b_receive_done;
  assign W_writedone = w_receive_done;
  assign RDY_TO_SEND = ready_to_send;

  always @(posedge clk) begin
    if (!rstn) begin
      state <= STATE_IDLE;
    end
    else begin
      case (state)
        STATE_IDLE: begin
          s_axis_tready <= 1'b0;
          if (command[2]) begin
            state <= STATE_SEND_RESULT;
          end
          else if (command[1]) begin
            if (command[0]) begin
              state <= STATE_COMPUTE;
            end
            else begin
              state <= STATE_RECEIVE_BIAS;
            end
          end
          else begin
            state <= STATE_RECEIVE_FEATURE;
          end
        end
        STATE_RECEIVE_FEATURE: begin
          if (f_receive_done) begin
            state <= STATE_IDLE;
          end
        end
        STATE_RECEIVE_BIAS: begin
          if (b_receive_done) begin
            state <= STATE_RECEIVE_WEIGHT;
          end
        end
        STATE_RECEIVE_WEIGHT: begin
          
        end
        STATE_READ_BIAS: begin
          
        end
        STATE_COMPUTE: begin
          if (ready_to_send) begin
            state <= STATE_IDLE;
          end
        end
        STATE_PSUM: begin
          
        end
        STATE_WRITE_RESULT: begin
          
        end
        STATE_SEND_RESULT: begin
          if (send_done) begin
            state <= STATE_IDLE;
          end
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
        STATE_RECEIVE_WEIGHT: begin
          
        end
        STATE_READ_BIAS: begin
          
        end
        STATE_COMPUTE: begin
          
        end
        STATE_PSUM: begin
          
        end
        STATE_WRITE_RESULT: begin
          
        end
        STATE_SEND_RESULT: begin
          
        end
      endcase
    end
  end
  
endmodule