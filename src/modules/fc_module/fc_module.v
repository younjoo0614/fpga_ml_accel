/*
* fc_module.v
*/

module CLA_16Bit
(
  input [15:0] A, 
  input [15:0] B, 
  input   C_in,     // if 0 --> add, 1 --> sub

  output [15:0] S,    // sum
  output  C_out,      // borrow if C_in = 1 (subtract)
  output  OF      // overflow
);

wire [3:0] C_out_LCU;   // carry
wire [3:0] P;
wire [3:0] G;

wire [15:0] A_1;    // if C_in = 1, inverse of A

//--------- assign A_1, C_out using C_in condition --------------
assign A_1 = C_in ? ~A : A;
assign C_out = C_in ? ~C_out_LCU[3] : C_out_LCU[3];
//---------------------------------------------------------------

CLG4 clg4(.C_in(C_in), .p(P), .g(G), .C_out(C_out_LCU));
CLA4 cla4_0(.a(A_1[3:0]), .b(B[3:0]), .C_in(C_in), .s(S[3:0]), .C_out(C_out_LCU[0]), .p_g(P[0]), .g_g(G[0]), .of());
CLA4 cla4_1(.a(A_1[7:4]), .b(B[7:4]), .C_in(C_out_LCU[0]), .s(S[7:4]), .C_out(C_out_LCU[1]), .p_g(P[1]), .g_g(G[1]), .of());
CLA4 cla4_2(.a(A_1[11:8]), .b(B[11:8]), .C_in(C_out_LCU[1]), .s(S[11:8]), .C_out(C_out_LCU[2]), .p_g(P[2]), .g_g(G[2]), .of());
CLA4 cla4_3(.a(A_1[15:12]), .b(B[15:12]), .C_in(C_out_LCU[2]), .s(S[15:12]), .C_out(C_out_LCU[3]), .p_g(P[3]), .g_g(G[3]), .of(OF));

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

module pe (
                    A,    // Signed 8 bit
                    B,    // Signed 8 bit
                    clk,
                    en, result, done, of);
  
  input [7:0]      A;
  input [7:0]      B;
  input              clk,en;
  output reg  [15:0] result;
  output reg done, of;
  // Internal Wires 
  wire   [7:0]   A_mag;         
  wire   [7:0]   B_mag;
  wire   [7:0]   p1, p2, p3, p4, p5, p6, p7, p8;    // partial product
  wire   [5:0]   lsb_sum21, lsb_sum22, lsb_sum23, lsb_sum24;
  wire   [4:0]   msb_sum31, msb_sum32, msb_sum33, msb_sum34;
  wire   [9:0]   sum31, sum32, sum33, sum34;
  wire   [7:0]   lsb_sum41, lsb_sum42;
  wire   [4:0]   msb_sum51, msb_sum52;
  wire   [11:0]  sum51, sum52;
  wire   [9:0]   lsb_sum6;
  wire   [6:0]   msb_sum7;      
  wire   [15:0]  sum_unsigned;
  wire           sign;           
  
  // Internal Registers
  reg    [15:0]  sum;
  reg    [7:0]   A_reg;
  reg    [7:0]   B1_reg, B2_reg, B3_reg, B4_reg, B5_reg, B6_reg, B7_reg, B8_reg, B9_reg;
  reg    [7:0]   p1_reg, p2_reg, p3_reg, p4_reg, p5_reg, p6_reg, p7_reg, p8_reg;
  reg    [5:0]   lsb_sum21_reg, lsb_sum22_reg, lsb_sum23_reg, lsb_sum24_reg;
  reg    [7:4]   p2_msb, p4_msb, p6_msb, p8_msb;
  reg    [7:5]   p1_msb, p3_msb, p5_msb, p7_msb;
  reg    [9:0]   sum31_reg, sum32_reg, sum33_reg, sum34_reg;
  reg    [7:0]   lsb_sum41_reg, lsb_sum42_reg;
  reg    [9:7]   msb_41, msb_43;
  reg    [9:5]   msb_42, msb_44;
  reg    [11:0]  sum51_reg, sum52_reg;
  reg    [9:0]   lsb_sum6_reg;
  reg    [11:9]  msb_61;
  reg    [11:5]  msb_62;
  reg    [15:0]  sum_unsigned_reg;
  reg            sign_s1, sign_s2, sign_s3, sign_s4, sign_s5, sign_s6, sign_s7; // sign bit
          
    
  // Stage 1: Partial Products
  // Take the Magnitude of Signed Numbers.  
    assign A_mag = A[7] ? ~A[7:0] + 1 : A[7:0];               
    assign B_mag = B[7] ? ~B[7:0] + 1 : B[7:0];  
  ///////////////////////////////////////////////////////
  // TODO: insert value to each p using "A_mag" and "B_mag"
  assign p1 = B_mag[0] ? A_mag[7:0] : 8'b0;
  assign p2 = B_mag[1] ? A_mag[7:0] : 8'b0;
  assign p3 = B_mag[2] ? A_mag[7:0] : 8'b0;
  assign p4 = B_mag[3] ? A_mag[7:0] : 8'b0;
  assign p5 = B_mag[4] ? A_mag[7:0] : 8'b0;
  assign p6 = B_mag[5] ? A_mag[7:0] : 8'b0;
  assign p7 = B_mag[6] ? A_mag[7:0] : 8'b0;
  assign p8 = B_mag[7] ? A_mag[7:0] : 8'b0;
  ///////////////////////////////////////////////////////
  
  ///////////////////////////////////////////////////////
    // TODO: insert value to sign(sign of multiplication result)  
  assign sign = A[7] ^ B[7];
  ///////////////////////////////////////////////////////
  
  always @(posedge clk) begin
    if (en) begin
      p1_reg <= p1;
      p3_reg <= p3;
      p5_reg <= p5;
      p7_reg <= p7;
      p2_reg <= p2;
      p4_reg <= p4;
      p6_reg <= p6;
      p8_reg <= p8;
      sign_s1 <= sign; 
      B1_reg <= B;  
    end                               
  end
  
  
  // Stage 2: Add LSBs
  ///////////////////////////////////////////////////////
    // TODO: insert value to each lsb_sum2x using "px_reg"
  assign lsb_sum21 = p1_reg[4:0] + {p2_reg [3:0],1'b0};
  assign lsb_sum22 = p3_reg[4:0] + {p4_reg [3:0],1'b0};
  assign lsb_sum23 = p5_reg[4:0] + {p6_reg [3:0],1'b0};
  assign lsb_sum24 = p7_reg[4:0] + {p8_reg [3:0],1'b0};
  ///////////////////////////////////////////////////////

  always @(posedge clk) begin 
    if (en) begin
      lsb_sum21_reg <= lsb_sum21;
      lsb_sum22_reg <= lsb_sum22;
      lsb_sum23_reg <= lsb_sum23;
      lsb_sum24_reg <= lsb_sum24;
      
      p1_msb <= p1_reg[7:5];
      p2_msb <= p2_reg[7:4];
      p3_msb <= p3_reg[7:5];
      p4_msb <= p4_reg[7:4];
      p5_msb <= p5_reg[7:5];
      p6_msb <= p6_reg[7:4];
      p7_msb <= p7_reg[7:5];
      p8_msb <= p8_reg[7:4];
      
      sign_s2 <= sign_s1;         
      B2_reg <= B1_reg;  
    end
            
  end


  // Stage 3: Add MSBs
  ///////////////////////////////////////////////////////
    // TODO: insert value to each msb_sum3x using "px_msb" and "lsb_sum2x_reg"
  assign msb_sum31 = p1_msb[7:5] + p2_msb [7:4] + lsb_sum21_reg[5];
  assign msb_sum32 = p3_msb[7:5] + p4_msb [7:4] + lsb_sum22_reg[5];
  assign msb_sum33 = p5_msb[7:5] + p6_msb [7:4] + lsb_sum23_reg[5];
  assign msb_sum34 = p7_msb[7:5] + p8_msb [7:4] + lsb_sum24_reg[5];
  ///////////////////////////////////////////////////////
  
  assign sum31 = {msb_sum31[4:0], lsb_sum21_reg[4:0]};
  assign sum32 = {msb_sum32[4:0], lsb_sum22_reg[4:0]};
  assign sum33 = {msb_sum33[4:0], lsb_sum23_reg[4:0]};
  assign sum34 = {msb_sum34[4:0], lsb_sum24_reg[4:0]};
  
  always @(posedge clk) begin
    if (en) begin
      sum31_reg <= sum31;
      sum32_reg <= sum32;
      sum33_reg <= sum33;
      sum34_reg <= sum34;
    
      sign_s3 <= sign_s2;    
      B3_reg <= B2_reg;    
    end                        
  end
  
  
  // Stage 4: Add LSBs, shift bits two times.
  ///////////////////////////////////////////////////////
    // TODO: insert value to each lsb_sum4x using "sum3x_reg"
  assign lsb_sum41 = sum31_reg[6:0] + {sum32_reg[4:0],2'b0};
  assign lsb_sum42 = sum33_reg[6:0] + {sum34_reg[4:0],2'b0};
  ///////////////////////////////////////////////////////
  
  always @(posedge clk) begin
    if (en) begin
      lsb_sum41_reg <= lsb_sum41;
      lsb_sum42_reg <= lsb_sum42;
      
      msb_41 <= sum31_reg[9:7];
      msb_42 <= sum32_reg[9:5];
      msb_43 <= sum33_reg[9:7];
      msb_44 <= sum34_reg[9:5];
    
      sign_s4 <= sign_s3;     
      B4_reg <= B3_reg;                
    end       
  end
  
  
  //Stage 5: Add MSBs
  ///////////////////////////////////////////////////////
    // TODO: insert value to each msb_sum5x using "msb_4x" and "lsb_sum4x_reg"
  assign msb_sum51 =  msb_41[9:7] + msb_42[9:5] + lsb_sum41_reg[7];
  assign msb_sum52 =  msb_43[9:7] + msb_44[9:5] + lsb_sum42_reg[7];
  ///////////////////////////////////////////////////////
  
  assign sum51 = {msb_sum51[4:0], lsb_sum41_reg[6:0]};
  assign sum52 = {msb_sum52[4:0], lsb_sum42_reg[6:0]};
  
  always @(posedge clk) begin
    if (en) begin
      sum51_reg <= sum51;
      sum52_reg <= sum52;

      sign_s5 <= sign_s4;  
      B5_reg <= B4_reg; 
    end                  
  end
  
  
  // Stage 6: Add LSBs, shift bits 4 times.
  ///////////////////////////////////////////////////////
    // TODO: insert value to lsb_sum6 using "sum5x_reg"
  assign lsb_sum6 = sum51_reg[8:0] + {sum52_reg[4:0], 4'b0};
  ///////////////////////////////////////////////////////
   
  always @(posedge clk) begin
    if (en) begin
      lsb_sum6_reg <= lsb_sum6;

      msb_61 <= sum51_reg[11:9];
      msb_62 <= sum52_reg[11:5];            
    
      sign_s6 <= sign_s5; 
      B6_reg <= B5_reg;     
    end               
  end
  
  // Stage 7: Add MSBs
  ///////////////////////////////////////////////////////
    // TODO: insert value to sum_unsigned using "msb_6x" and "lsb_sum6_reg"
  assign msb_sum7 = msb_61[11:9] + msb_62[11:5] + lsb_sum6_reg[9];
  ///////////////////////////////////////////////////////
  
  assign sum_unsigned = {msb_sum7, lsb_sum6_reg[8:0]};             
  
  always @(posedge clk) begin
    if (en) begin
      sum_unsigned_reg <= sum_unsigned;                     
    
      sign_s7 <= sign_s6;   
      B7_reg <= B6_reg;    
    end                   
  end
  
  // Stage 8: Take the Result of Multiplication
  ///////////////////////////////////////////////////////
    // TODO: insert value to sum for each condition using "sum_unsigned_reg"
  always @(posedge clk) begin
    if (en) begin
      if(sign_s7==1'b0) sum <= sum_unsigned_reg;

      else sum <= ~sum_unsigned_reg[15:0] + 1;
      B7_reg <= B6_reg;       
    end
     
  ///////////////////////////////////////////////////////
  end
  // Stage 9: Add inputa*inputb and outputc
  reg [15:0] temp;
  CLA_16Bit u_cla_16bit (
    .A(sum),
    .B(B7_reg),
    .C_in(1'b0),
    .C_out(),
    .S(temp),
    .OF(of)
  );
  always @(posedge clk) begin
    if (en) begin
      result <= temp;
      done <= 1'b1;
    end    
  end
endmodule

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
    output wire M_AXIS_TVALID,

    //////////////////////////////////////////////////////////////////////////
    // TODO : Add ports as you need
    //////////////////////////////////////////////////////////////////////////
    input wire [2:0] command,
    input wire[20:0] size,
    output wire [31:0] FEAT_SIZE, BIAS_SIZE, WEIGHT_SIZE,
    output wire FC_DONE
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
  reg s_axis_tready;
  
  assign S_AXIS_TREADY = s_axis_tready;
  assign M_AXIS_TDATA = m_axis_tdata;
  assign M_AXIS_TLAST = m_axis_tlast;
  assign M_AXIS_TVALID = m_axis_tvalid;
  assign M_AXIS_TUSER = 1'b0;
  assign M_AXIS_TKEEP = {(C_S00_AXIS_TDATA_WIDTH/8) {1'b1}};

  ////////////////////////////////////////////////////////////////////////////
  // TODO : Write your code here
  ////////////////////////////////////////////////////////////////////////////
  reg[10:0] w_addr, f_addr;
  reg bram_en, w_we, f_we;
  wire [31:0] w_dout, f_dout;
  reg [31:0] din;
  reg [31:0] tdata;
  wire [7:0] a12, a23, a34;
  reg [1:0] delay;
  reg f_bram_en, w_bram_en;

  sram_32x1024 weight_sram_32x1024(
  .addra(w_addr[9:0]),
  .clka(clk),
  .dina(din),
  .douta(w_dout),
  .ena(w_bram_en),
  .wea(w_we)
  );

  sram_32x1024 feat_sram_32x1024(
  .addra(f_addr[9:0]),
  .clka(clk),
  .dina(din),
  .douta(f_dout),
  .ena(f_bram_en),
  .wea(f_we)
  );

  pe pe1 (
    .clk(clk),
    .rstn(rstn),
    .in_a(f_dout),
    .in_b(w_dout[31:24]),
    .out_a(a12),
    .out_b(),
    .out_c(tdata[31:24])
  );

  pe pe2 (
    .clk(clk),
    .rstn(rstn),
    .in_a(a12),
    .in_b(w_dout[23:16]),
    .out_a(a23),
    .out_b(),
    .out_c(tdata[23:16])
  );

  pe pe3 (
    .clk(clk),
    .rstn(rstn),
    .in_a(a23),
    .in_b(w_dout[15:8]),
    .out_a(a34),
    .out_b(),
    .out_c(tdata[15:8])
  );

  pe pe4 (
    .clk(clk),
    .rstn(rstn),
    .in_a(a34),
    .in_b(w_dout[15:8]),
    .out_a(),
    .out_b(),
    .out_c(tdata[7:0])
  );

  reg [31:0] feat_size, bias_size, weight_size;
  reg fc_done;

  assign FEAT_SIZE = feat_size;
  assign BIAS_SIZE = bias_size;
  assign WEIGHT_SIZE = weight_size;
  assign FC_DONE = fc_done;

  // control path
  always @(posedge clk) begin
    if (!rstn) begin
      state <= STATE_IDLE;
    end
    else begin
      case (state)
        STATE_IDLE: begin
          s_axis_tready <= 1'b0;
          if (command[0]) begin
            state <= STATE_RECEIVE_FEATURE;
            s_axis_tready <= 1'b1;
          end
          else if (command[1]) begin
            state <= STATE_RECEIVE_BIAS;
            s_axis_tready <= 1'b1;
          end
          else if (command[2]) begin
            state <= STATE_RECEIVE_WEIGHT_AND_READ_FEATURE;
            s_axis_tready <= 1'b1;
          end
        end
        STATE_RECEIVE_FEATURE: begin
          f_we <= 1'b1;
          if (f_we) begin
            if (size[11]) begin
              
            end
            else if (size[9]) begin
              
            end
            else begin
              
            end
          end
        end
        STATE_RECEIVE_BIAS: begin
          w_we <= 1'b1;
          if (w_we) begin
            if (size[19]) begin
              
            end
            else if (size[15]) begin
              
            end
            else begin
              
            end
          end
        end
        STATE_RECEIVE_WEIGHT_AND_READ_FEATURE: begin
          
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
  
  // data path
  always @(posedge clk) begin
    if (!rstn) begin
      f_addr <= 10'b0;
      w_addr <= 10'b0;
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
        STATE_COMPUTE: begin
          f_bram_en <= 1'b1;
          w_bram_en <= 1'b1;
          f_addr <= f_addr + 1;
          if (f_addr[10]) begin
            f_bram_en <= 1'b0;
          end
          else begin
            
          end
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
