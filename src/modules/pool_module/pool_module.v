/*
* pool_module.v
*/
module CLA_8Bit
(
  input [7:0] A, 
  input [7:0] B, 
  input   C_in,     // if 0 --> add, 1 --> sub

  output [7:0] S,    // sum
  output  C_out,      // borrow if C_in = 1 (subtract)
  output  OF      // overflow
);

wire carry, carry1;
wire [1:0] P;
wire [1:0] G;

wire [7:0] A_1;    // if C_in = 1, inverse of A

//--------- assign A_1, C_out using C_in condition --------------
assign A_1 = C_in ? ~A : A;
assign C_out = C_in ? ~carry1 : carry1;
//---------------------------------------------------------------


CLA4 CLA4_0 (.a(A_1[3:0]), .b(B[3:0]), .C_in(C_in), .s(S[3:0]), .C_out(carry), .p_g(P[0]), .g_g(G[0]), .of());
CLA4 CLA4_1 (.a(A_1[7:4]), .b(B[7:4]), .C_in(carry), .s(S[7:4]), .C_out(carry1), .p_g(P[1]), .g_g(G[1]), .of(OF));


endmodule

module CLG4
(
  input C_in,
  input [3:0] p, 
  input [3:0] g,

  output [3:0] C_out
);

//-------- assign carry out ------------------------------------
assign C_out[0] = g[0] | (p[0] & C_in);
assign C_out[1] = g[1] | (p[1] & C_out[0]);
assign C_out[2] = g[2] | (p[2] & C_out[1]);
assign C_out[3] = g[3] | (p[3] & C_out[2]);
//--------------------------------------------------------------

endmodule

module CLA4
(
  input [3:0] a,
  input [3:0] b,
  input C_in,

  output [3:0] s,
  output C_out,
  output p_g,
  output g_g,
  output of
);

wire [3:0] p;
wire [3:0] g;
wire [3:0] c;

//-------- assign each bits of g, p, s -------------------------
assign p[0]=a[0]^b[0];
assign p[1]=a[1]^b[1];
assign p[2]=a[2]^b[2];
assign p[3]=a[3]^b[3];
assign g[0]=a[0]&b[0];
assign g[1]=a[1]&b[1];
assign g[2]=a[2]&b[2];
assign g[3]=a[3]&b[3];
assign s[0]=p[0]^C_in;
assign s[1]=p[1]^c[0];
assign s[2]=p[2]^c[1];
assign s[3]=p[3]^c[2];
//--------------------------------------------------------------


//-------- assign group p, group g, Carry_out, overflow --------
assign p_g = p[0]&p[1]&p[2]&p[3];
assign g_g = g[3]|(g[2]&p[3])|(g[1]&p[2]&p[3])|(g[0]&p[1]&p[2]&p[3]); 
assign C_out = g_g|(p_g&C_in);
assign of = c[3] ^ c[2];
//--------------------------------------------------------------


//-------- CLG_4bit --------------------------------------------
CLG4 clg4(.C_in(C_in), .p(p), .g(g), .C_out(c));

endmodule

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
    input wire [5:0] flen,
    input wire [8:0] inch
  );

  localparam STATE_IDLE = 3'd0,  
  STATE_RECEIVE_DATA = 3'd1,
  STATE_POOL = 3'd2,
  STATE_ACCUM = 3'd3,
  STATE_DATA_SEND = 3'd4;
  

  reg [2:0] state;
  
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
  reg [7:0] feat[63:0];
  reg [6:0] addr;
  reg [5:0] flen_reg;
  reg [8:0] inch_reg;
  reg [5:0] idx_16;
  reg [1:0] delay;
  reg [7:0] input_a, input_b, max;
  reg [2:0] cnt_4;
  wire [7:0] bigb;
  reg receive_done;
  reg [31:0] tdata;

  CLA_8Bit ab_cla_8bit(
    .A(input_a),
    .B(input_b),
    .C_in(1'b1),
    .S(bigb),
    .C_out(),
    .OF()
  );
  

  always @ (posedge clk ) begin
    if (!rstn) begin
      state <= STATE_IDLE;
      addr <= 17'b0;
      delay <= 2'b0;
      idx_16 <= 6'b000000;
      cnt_4 <= 3'b000;
    end
    else begin
      case (state)
        STATE_IDLE: begin
          receive_done <= 1'b0;
          pool_done <= 1'b0;
          s_axis_tready <= 1'b0;
          m_axis_tvalid <= 1'b0;
          m_axis_tlast <= 1'b0;
          if (pool_start) begin
            flen_reg <= flen;
            inch_reg <= inch;
            state<= STATE_RECEIVE_DATA;
            s_axis_tready <= 1'b1;
          end
        end

        STATE_RECEIVE_DATA: begin     
          m_axis_tvalid <= 1'b0;     
          s_axis_tready <= 1'b1;
          if (addr[6] && flen_reg [5]) begin
            state <= STATE_POOL;
            addr <= 7'h00;
            s_axis_tready <= 1'b0; 
          end
          else if (addr[5] && flen_reg [4]) begin
            state <= STATE_POOL;
            addr <= 7'h00;
            s_axis_tready <= 1'b0; 
          end
          else if (addr[4] && flen_reg [3]) begin
            state <= STATE_POOL;
            addr <= 7'h00;
            s_axis_tready <= 1'b0; 
          end
          else if (addr[3] && flen_reg [2]) begin
            state <= STATE_POOL;
            addr <= 7'h00;
            s_axis_tready <= 1'b0; 
          end
          else begin  
            if (s_axis_tready) begin
              addr <= addr + 4;
              feat[addr+3] <= S_AXIS_TDATA[31:24];
              feat[addr+2] <= S_AXIS_TDATA[23:16];
              feat[addr+1] <= S_AXIS_TDATA[15:8];
              feat[addr] <= S_AXIS_TDATA[7:0];
              if (S_AXIS_TLAST) receive_done <= 1'b1;    
              s_axis_tready <= 1'b0;   
            end           
          end
        end

        STATE_POOL: begin  
          s_axis_tready <= 1'b0; 
          m_axis_tvalid <= 1'b0;                 
          delay <= delay + 1;
          if (delay== 2'b00) begin
            input_a <= feat[idx_16];
            input_b <= feat[idx_16 + 1];
          end
          else if (delay == 2'b01) begin
            input_a <= (input_b > input_a) ? input_b:input_a;
            if (flen_reg[2]) input_b <= feat[idx_16 + 6'd4];
            else if (flen_reg[3]) input_b <= feat[idx_16 + 6'd8];
            else if (flen_reg[4]) input_b <= feat[idx_16 + 6'd16];
            else input_b <= feat[idx_16 + 6'd32];              
          end
          else if (delay == 2'b10) begin             
            input_a <= (input_b > input_a) ? input_b:input_a;
            if (flen_reg[3]) input_b <= feat[idx_16 + 6'd9];
            else if (flen_reg[4]) input_b <= feat[idx_16 + 6'd17];
            else if (flen_reg[2]) input_b <= feat[idx_16 + 6'd5];
            else input_b <= feat[idx_16 + 6'd33];
          end
          else begin
            max <= (input_b > input_a) ? input_b:input_a;
            state <= STATE_ACCUM;
            delay <= 2'b0;
          end
        end

        STATE_ACCUM: begin
          idx_16 <= idx_16 + 2;
          cnt_4 <= cnt_4 +1;
          if (cnt_4 == 3'b000) begin
            tdata[7:0] <= max;            
            state <= STATE_POOL;
          end
          else if (cnt_4 == 3'b001) begin
            tdata[15:8] <= max;
            if (flen_reg[2]) begin
              state <= STATE_RECEIVE_DATA;              
              idx_16 <= 6'b000000;
            end
            else state <= STATE_POOL;
          end
          else if (cnt_4 == 3'b010) begin
            tdata[23:16] <= max;          
            state <= STATE_POOL;
          end
          else begin
            state <= STATE_DATA_SEND;
            tdata[31:24] <= max;
            cnt_4 <= 3'b000;
          end          
        end

        STATE_DATA_SEND: begin
          m_axis_tvalid <= 1'b1;
          m_axis_tdata <= tdata;
          
          if (flen_reg[5] && idx_16[5]) begin
            if (receive_done) begin
              m_axis_tlast <= 1'b1;
              pool_done <= 1'b1;
              state <= STATE_IDLE;
            end
            else begin
              state <= STATE_RECEIVE_DATA;
              
              idx_16 <= 6'b000000;
            end            
          end
          else if (flen_reg[4] && idx_16[4]) begin
            if (receive_done) begin
              m_axis_tlast <= 1'b1;
              pool_done <= 1'b1;
              state <= STATE_IDLE;
            end
            else begin
              state <= STATE_RECEIVE_DATA;
              
              idx_16 <= 6'b000000;
            end
          end           
          else if (flen_reg[3] && idx_16[3]) begin
            if (receive_done) begin
              m_axis_tlast <= 1'b1;
              pool_done <= 1'b1;
              state <= STATE_IDLE;
            end
            else begin
              state <= STATE_RECEIVE_DATA;
              
              idx_16 <= 6'b000000;
            end
          end   
          else if (flen_reg[2] && idx_16[2]) begin
            if (receive_done) begin
              m_axis_tlast <= 1'b1;
              pool_done <= 1'b1;
              state <= STATE_IDLE;
            end
            else begin
              state <= STATE_RECEIVE_DATA;
              
              idx_16 <= 6'b000000;
            end
          end   
          else begin
            state <= STATE_POOL;
          end          
        end        
      endcase
    end
  end
  
endmodule
