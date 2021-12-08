/*
* fc_module.v
*/

module CLA_28Bit (
  input [27:0] A, 
  input [27:0] B, 
  input   C_in,     // if 0 --> add, 1 --> sub

  output [27:0] S,
  output  C_out
);
  wire [6:0] C_out_LCU;   // carry
  wire [6:0] P;
  wire [6:0] G;

  wire [27:0] A_1; 

  assign A_1 = C_in ? ~A : A;
  assign C_out = C_in ? ~C_out_LCU[6] : C_out_LCU[6];

  CLG4 clg4(.C_in(C_in), .p(P[3:0]), .g(G[3:0]), .C_out(C_out_LCU[3:0]));
  CLG3 clg3(.C_in(C_out_LCU[3]),.p(P[6:4]), .g(G[6:4]), .C_out(C_out_LCU[6:4]));
  CLA4 cla4_0(.a(A_1[3:0]), .b(B[3:0]), .C_in(C_in), .s(S[3:0]), .C_out(C_out_LCU[0]), .p_g(P[0]), .g_g(G[0]), .of());
  CLA4 cla4_1(.a(A_1[7:4]), .b(B[7:4]), .C_in(C_out_LCU[0]), .s(S[7:4]), .C_out(C_out_LCU[1]), .p_g(P[1]), .g_g(G[1]), .of());
  CLA4 cla4_2(.a(A_1[11:8]), .b(B[11:8]), .C_in(C_out_LCU[1]), .s(S[11:8]), .C_out(C_out_LCU[2]), .p_g(P[2]), .g_g(G[2]), .of());
  CLA4 cla4_3(.a(A_1[15:12]), .b(B[15:12]), .C_in(C_out_LCU[2]), .s(S[15:12]), .C_out(C_out_LCU[3]), .p_g(P[3]), .g_g(G[3]), .of());
  CLA4 cla4_4(.a(A_1[19:16]), .b(B[19:16]), .C_in(C_out_LCU[3]), .s(S[19:16]), .C_out(C_out_LCU[4]), .p_g(P[4]), .g_g(G[4]), .of());
  CLA4 cla4_5(.a(A_1[23:20]), .b(B[23:20]), .C_in(C_out_LCU[4]), .s(S[23:20]), .C_out(C_out_LCU[5]), .p_g(P[5]), .g_g(G[5]), .of());
  CLA4 cla4_6(.a(A_1[27:24]), .b(B[27:24]), .C_in(C_out_LCU[5]), .s(S[27:24]), .C_out(C_out_LCU[6]), .p_g(P[6]), .g_g(G[6]), .of());

endmodule

module CLA_16Bit (
  input [15:0] A, 
  input [15:0] B, 
  input   C_in,     // if 0 --> add, 1 --> sub

  output [15:0] S,
  output  C_out
);
  wire [3:0] C_out_LCU;   // carry
  wire [3:0] P;
  wire [3:0] G;

  wire [15:0] A_1; 

  assign A_1 = C_in ? ~A : A;
  assign C_out = C_in ? ~C_out_LCU[3] : C_out_LCU[3];

  CLG4 clg4(.C_in(C_in), .p(P), .g(G), .C_out(C_out_LCU));
  CLA4 cla4_0(.a(A_1[3:0]), .b(B[3:0]), .C_in(C_in), .s(S[3:0]), .C_out(C_out_LCU[0]), .p_g(P[0]), .g_g(G[0]), .of());
  CLA4 cla4_1(.a(A_1[7:4]), .b(B[7:4]), .C_in(C_out_LCU[0]), .s(S[7:4]), .C_out(C_out_LCU[1]), .p_g(P[1]), .g_g(G[1]), .of());
  CLA4 cla4_2(.a(A_1[11:8]), .b(B[11:8]), .C_in(C_out_LCU[1]), .s(S[11:8]), .C_out(C_out_LCU[2]), .p_g(P[2]), .g_g(G[2]), .of());
  CLA4 cla4_3(.a(A_1[15:12]), .b(B[15:12]), .C_in(C_out_LCU[2]), .s(S[15:12]), .C_out(C_out_LCU[3]), .p_g(P[3]), .g_g(G[3]), .of());
endmodule

module COMP_8Bit(
  input [7:0] A,
  input [7:0] B,

  output comp
 );
  wire [1:0] C_out_LCU;
  wire [1:0] P;
  wire [1:0] G;

  wire [7:0] A_1;

  wire [7:0] S;
  assign comp = S[7];

  assign A_1 = ~A;

  CLG2 clg2(.C_in(1'b1), .p(P), .g(G), .C_out(C_out_LCU));
  CLA4 cla4_0(.a(A_1[3:0]), .b(B[3:0]), .C_in(1'b1), .s(S[3:0]), .C_out(C_out_LCU[0]), .p_g(P[0]), .g_g(G[0]), .of());
  CLA4 cla4_1(.a(A_1[7:4]), .b(B[7:4]), .C_in(C_out_LCU[0]), .s(S[7:4]), .C_out(C_out_LCU[1]), .p_g(P[1]), .g_g(G[1]), .of());
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

module CLG3
(
  input C_in,
  input [2:0] p, 
  input [2:0] g,

  output [2:0] C_out
);

//-------- assign carry out ------------------------------------
assign C_out[0] = g[0] | (p[0] & C_in);
assign C_out[1] = g[1] | (p[1] & C_out[0]);
assign C_out[2] = g[2] | (p[2] & C_out[1]);
//--------------------------------------------------------------

endmodule

module CLG2
(
  input C_in,
  input [1:0] p,
  input [1:0] g,

  output [1:0] C_out
);
  assign C_out[0] = g[0] | (p[0] & C_in);
  assign C_out[1] = g[1] | (p[1] & C_out[0]);
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
  input [7:0]      A,
  input [7:0]      B,
  input             en,
  input            first,
  input              clk,
  output wire [7:0] out_a, out_b,
  output reg  [27:0] result,
  output wire of
  );  
  
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
  reg    [7:0]   out_a_reg, out_b_reg;
  reg            f1_reg, f2_reg, f3_reg, f4_reg, f5_reg, f6_reg, f7_reg, f8_reg;
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
          
  assign out_a = out_a_reg;
  assign out_b = out_b_reg;
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
      f1_reg <= first;
      out_a_reg <= A;
      out_b_reg <= B;
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
      f2_reg <= f1_reg;
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
      f3_reg <= f2_reg;
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
      f4_reg <= f3_reg;        
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
      f5_reg <= f4_reg;
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
      f6_reg <= f5_reg;
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
      f7_reg <= f6_reg;
    end                   
  end
  
  // Stage 8: Take the Result of Multiplication
  ///////////////////////////////////////////////////////
    // TODO: insert value to sum for each condition using "sum_unsigned_reg"
  always @(posedge clk) begin
    if (en) begin
      if(sign_s7==1'b0) sum <= sum_unsigned_reg;

      else sum <= ~sum_unsigned_reg[15:0] + 1;
      f8_reg <= f7_reg;
    end
     
  ///////////////////////////////////////////////////////
  end
  // Stage 9: Add inputa*inputb and outputc
  wire [27:0] temp;
  wire [27:0] result_temp;
  assign result_temp = (f8_reg) ? 28'h0000000: result;

  CLA_28Bit u_cla_28bit (
    .A({12'h000,sum}),
    .B(result_temp),
    .C_in(1'b0),
    .C_out(),
    .S(temp)
  );
  always @(posedge clk) begin
    if (en) begin
      result <= temp;
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
    input wire fc_start,
    input wire [20:0] size,
    // output wire [31:0] FEAT_SIZE, BIAS_SIZE, WEIGHT_SIZE,

    output wire F_writedone, B_writedone, W_writedone, FC_DONE,
    output wire [3:0] MAX_idx
  ); 

  localparam STATE_IDLE = 4'd0,
  STATE_RECEIVE_FEATURE = 4'd1,
  STATE_RECEIVE_BIAS = 4'd2,
  STATE_RECEIVE_WEIGHT_AND_READ_FEATURE = 4'd3,
  STATE_READ_BIAS = 4'd4,
  STATE_COMPUTE = 4'd5,
  STATE_PSUM = 4'd6,
  STATE_ADD_BIAS = 4'd7,
  STATE_WRITE_RESULT = 4'd8,
  STATE_SEND_RESULT = 4'd9;
  
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
  reg [10:0] f_addr, w1_addr, w2_addr, w3_addr, w4_addr, b_addr;
  wire [9:0] fb_addr;
  reg w1_we, w2_we, w3_we, w4_we, f_we;
  reg [1:0] weight_n;
  reg [10:0] receive_cnt, column_cnt;
  wire [31:0] f_dout;
  // reg [31:0] din;
  wire [31:0] din;

  assign fb_addr = (state == STATE_RECEIVE_BIAS || state == STATE_READ_BIAS) ? b_addr[9:0] : f_addr[9:0];
  assign din = S_AXIS_TDATA;

  reg [31:0] tdata;
  reg [27:0] bias_add_result1, bias_add_result2, bias_add_result3, bias_add_result4;
  wire [27:0] pe_result1_temp, pe_result2_temp, pe_result3_temp, pe_result4_temp;
  wire [7:0] a12, a23, a34;
  reg [1:0] delay;
  reg f_bram_en, w1_bram_en, w2_bram_en, w3_bram_en, w4_bram_en;
  reg first1, first2, first3, first4;
  reg pe_1_en, pe_2_en, pe_3_en, pe_4_en;
  reg [31:0] feat , bias;
  reg [63:0] weight1, weight2, weight3, weight4;
  wire [7:0] p1_a;
  wire [7:0] p1_b, p2_b, p3_b, p4_b;
  reg f_receive_done, b_receive_done, w_receive_done;
  reg [3:0] pe_delay;
  wire [31:0] w1_dout, w2_dout, w3_dout, w4_dout;
  reg [3:0] max_idx;
  reg [7:0] max_value;
  wire max_comp1, max_comp2, max_comp3, max_comp4;

  assign F_writedone = f_receive_done;
  assign B_writedone = b_receive_done;
  assign W_writedone = w_receive_done;
  assign MAX_idx = max_idx;

  sram_32x1024 weight1_sram_32x1024(
  .addra(w1_addr[9:0]),
  .clka(clk),
  .dina(din),
  .douta(w1_dout),
  .ena(w1_bram_en),
  .wea(w1_we)
  );

  sram_32x1024 weight2_sram_32x1024(
  .addra(w2_addr[9:0]),
  .clka(clk),
  .dina(din),
  .douta(w2_dout),
  .ena(w2_bram_en),
  .wea(w2_we)
  );

  sram_32x1024 weight3_sram_32x1024(
  .addra(w3_addr[9:0]),
  .clka(clk),
  .dina(din),
  .douta(w3_dout),
  .ena(w3_bram_en),
  .wea(w3_we)
  );

  sram_32x1024 weight4_sram_32x1024(
  .addra(w4_addr[9:0]),
  .clka(clk),
  .dina(din),
  .douta(w4_dout),
  .ena(w4_bram_en),
  .wea(w4_we)
  );

  sram_32x1024 feat_sram_32x1024(
  .addra(fb_addr),
  .clka(clk),
  .dina(din),
  .douta(f_dout),
  .ena(f_bram_en),
  .wea(f_we)
  );

  pe pe1 (
    .clk(clk),
    .en(pe_1_en),
    .A(p1_a),
    .B(p1_b),
    .out_a(a12),
    .out_b(),
    .result(pe_result1_temp),
    .first(first1),
    .of()
  );

  pe pe2 (
    .clk(clk),
    .en(pe_2_en),
    .A(a12),
    .B(p2_b),
    .out_a(a23),
    .out_b(),
    .result(pe_result2_temp),
    .first(first2),
    .of()
  );

  pe pe3 (
    .clk(clk),
    .en(pe_3_en),
    .A(a23),
    .B(p3_b),
    .out_a(a34),
    .out_b(),
    .result(pe_result3_temp),
    .first(first3),
    .of()
  );

  pe pe4 (
    .clk(clk),
    .en(pe_4_en),
    .A(a34),
    .B(p4_b),
    .out_a(),
    .out_b(),
    .result(pe_result4_temp),
    .first(first4),
    .of()
  );

  reg [10:0] feat_size, bias_size;
  reg fc_done;

  // assign FEAT_SIZE = feat_size;
  // assign BIAS_SIZE = bias_size;
  // assign WEIGHT_SIZE = weight_size;
  assign FC_DONE = fc_done;

  reg [5:0] cnt_4;

  wire [15:0] next_faddr, next_w1addr, next_w2addr, next_w3addr, next_w4addr, next_baddr, next_cnt;
  CLA_16Bit faddr_adder (
    .A({6'h00,f_addr[9:0]}),
    .B(16'h0001),
    .C_in(1'b0),
    .S(next_faddr),
    .C_out()
  );

  CLA_16Bit w1addr_adder (
    .A({6'h00,w1_addr[9:0]}),
    .B(16'h0001),
    .C_in(1'b0),
    .S(next_w1addr),
    .C_out()
  );
  CLA_16Bit w2addr_adder (
    .A({6'h00, w2_addr[9:0]}),
    .B(16'h0001),
    .C_in(1'b0),
    .S(next_w2addr),
    .C_out()
  );
  CLA_16Bit w3addr_adder (
    .A({6'h00,w3_addr[9:0]}),
    .B(16'h0001),
    .C_in(1'b0),
    .S(next_w3addr),
    .C_out()
  );
  CLA_16Bit w4addr_adder (
    .A({6'h00,w4_addr[9:0]}),
    .B(16'h0001),
    .C_in(1'b0),
    .S(next_w4addr),
    .C_out()
  );

  CLA_16Bit baddr_adder (
    .A({6'h00,b_addr[9:0]}),
    .B(16'h0001),
    .C_in(1'b0),
    .S(next_baddr),
    .C_out()
  );

  CLA_16Bit cnt_adder (
    .A({6'h00, receive_cnt[9:0]}),
    .B(16'h0001),
    .C_in(1'b0),
    .S(next_cnt),
    .C_out()
  );

  COMP_8Bit tdata_max_comp1 (
    .A(max_value),
    .B(tdata[7:0]),

    .comp(max_comp1)
  );

  COMP_8Bit tdata_max_comp2 (
    .A(max_value),
    .B(tdata[15:8]),

    .comp(max_comp2)
  );

  COMP_8Bit tdata_max_comp3 (
    .A(max_value),
    .B(tdata[23:16]),

    .comp(max_comp3)
  );

  COMP_8Bit tdata_max_comp4 (
    .A(max_value),
    .B(tdata[31:24]),
    
    .comp(max_comp4)
  );

  // control path
  always @(posedge clk) begin
    if (!rstn) begin
      state <= STATE_IDLE;
      f_we <= 1'b0;
      w1_we <= 1'b0;
      w2_we <= 1'b0;
      w3_we <= 1'b0;
      w4_we <= 1'b0;
      f_bram_en <= 1'b0;
      w1_bram_en <= 1'b0;
      w2_bram_en <= 1'b0;
      w3_bram_en <= 1'b0;
      w4_bram_en <= 1'b0;
      s_axis_tready <= 1'b0;
    end
    else begin
      case (state)
        STATE_IDLE: begin
          fc_done <= 1'b0;
          if (fc_start) begin
            if (command[0] && !f_receive_done) begin
              state <= STATE_RECEIVE_FEATURE;
              f_bram_en <= 1'b1;
              f_we <= 1'b1;
              s_axis_tready <= 1'b1;
            end
            else if (command[1] && !b_receive_done) begin
              state <= STATE_RECEIVE_BIAS;
              f_bram_en <= 1'b1;
              f_we <= 1'b1;
              s_axis_tready <= 1'b1;
            end
            else if (command[2] && !w_receive_done) begin
              state <= STATE_RECEIVE_WEIGHT_AND_READ_FEATURE;
              w1_bram_en <= 1'b1;
              w1_we <= 1'b1;
              s_axis_tready <= 1'b1;
            end
            else s_axis_tready <= 1'b0;
          end
        end
        STATE_RECEIVE_FEATURE: begin
          if (next_cnt[10:0] == feat_size>>2) begin            
            state <= STATE_IDLE;
            s_axis_tready <= 1'b0;
            f_bram_en <= 1'b0;
            f_we <= 1'b0;
          end
        end
        STATE_RECEIVE_BIAS: begin
          if (next_cnt[10:0] == bias_size>>2) begin            
            state <= STATE_IDLE;
            s_axis_tready <= 1'b0;
            f_bram_en <= 1'b0;
            f_we <= 1'b0;
          end
        end

        STATE_RECEIVE_WEIGHT_AND_READ_FEATURE: begin
          if (next_cnt[10:0] == feat_size>>2) begin
            if (column_cnt == bias_size - 1) begin
              s_axis_tready <= 1'b0;
              state <= STATE_PSUM;
              w1_bram_en <= 1'b0;
              w1_we <= 1'b0;
              w2_bram_en <= 1'b0;
              w2_we <= 1'b0;
              w3_bram_en <= 1'b0;
              w3_we <= 1'b0;
              w4_bram_en <= 1'b0;
              w4_we <= 1'b0;
            end
            else begin
              case (weight_n)
                2'b00: begin
                  w1_bram_en <= 1'b0;
                  w1_we <= 1'b0;
                  w2_bram_en <= 1'b1;
                  w2_we <= 1'b1;
                end
                2'b01: begin
                  w2_bram_en <= 1'b0;
                  w2_we <= 1'b0;
                  w3_bram_en <= 1'b1;
                  w3_we <= 1'b1;
                end
                2'b10: begin
                  w3_bram_en <= 1'b0;
                  w3_we <= 1'b0;
                  w4_bram_en <= 1'b1;
                  w4_we <= 1'b1;
                end
                2'b11: begin
                  w4_bram_en <= 1'b0;
                  w4_we <= 1'b0;
                  if (next_w4addr[10]) state <= STATE_PSUM;
                  else begin
                    w1_bram_en <= 1'b1;
                    w1_we <= 1'b1;
                  end
                end
                default: ;
              endcase
            end
          end
        end
        STATE_READ_BIAS: begin
          f_bram_en <= 1'b1;
          if (delay[1]) begin
            state <= STATE_ADD_BIAS;
          end
        end
        STATE_COMPUTE: begin
          m_axis_tvalid <= 1'b0;
          f_bram_en <= 1'b0;
          w1_bram_en <= 1'b0;
          w2_bram_en <= 1'b0;
          w3_bram_en <= 1'b0;
          w4_bram_en <= 1'b0;
          if (cnt_4[1] && cnt_4[0]) state <= STATE_PSUM;          
        end
        STATE_PSUM: begin
          f_bram_en <= 1'b1;
          w1_bram_en <= 1'b1;
          w2_bram_en <= 1'b1;
          w3_bram_en <= 1'b1;
          w4_bram_en <= 1'b1;
          if (delay[1]) begin            
            if (feat_size[10] && f_addr[8]) state <= STATE_READ_BIAS;
            else if (feat_size[8] && f_addr[6]) state <= STATE_READ_BIAS;
            else if (feat_size[6] && f_addr[4]) state <= STATE_READ_BIAS;
            else state <= STATE_COMPUTE;
          end
        end
        STATE_WRITE_RESULT: begin
          state <= STATE_SEND_RESULT;
        end
        STATE_ADD_BIAS: begin
          f_bram_en <= 1'b0;
          if (pe_delay[3]) state <= STATE_WRITE_RESULT;
        end
        STATE_SEND_RESULT: begin
          if (delay == 2'b11) begin
            m_axis_tvalid <= 1'b1;
            if (b_addr[9] && (b_addr[8:0]==bias_size>>2)) begin
              m_axis_tlast <= 1'b1;
              fc_done <= 1'b1;            
              state <= STATE_IDLE;
            end
            else if (w4_addr[10]) begin
              state <= STATE_RECEIVE_WEIGHT_AND_READ_FEATURE;
            end
            else state <= STATE_COMPUTE;
          end
        end
      endcase
    end
  end
 
 reg [27:0] bias_temp, pe_result;
 wire [27:0] bias_add_result;
 reg [2:0] bias_add_delay;

 CLA_28Bit u_bias_add(
   .A(pe_result),
   .B(bias_temp),
   .C_in(1'b0),
   .S(bias_add_result),
   .C_out()
 );
  
  assign p1_a = feat[31:24];
  assign p1_b = weight1[63:56];
  assign p2_b = weight2[63:56];
  assign p3_b = weight3[63:56];
  assign p4_b = weight4[63:56];
  
  // data path
  always @(posedge clk) begin
    if (!rstn) begin
      f_addr <=  10'h000;
      b_addr <= 10'h200;
      w1_addr <= 11'h000;
      w2_addr <= 11'h000;
      w3_addr <= 11'h000;
      w4_addr <= 11'h000;
      first1 <= 1'b0;
      first2 <= 1'b0;
      first3 <= 1'b0;
      first4 <= 1'b0;
      cnt_4 <= 3'b000;   
      receive_cnt <= 10'h000;
      f_receive_done <= 1'b0;
      b_receive_done <= 1'b0;
      w_receive_done <= 1'b0;
      column_cnt <= 10'h000;
      max_idx <= 4'd10;
      max_value <= 8'h80;
      pe_delay <= 4'h0;
      weight1 <= 64'h0000_0000_0000_0000;
      weight2 <= 64'h0000_0000_0000_0000;
      weight3 <= 64'h0000_0000_0000_0000;
      weight4 <= 64'h0000_0000_0000_0000;
    end
    else begin
      case (state)
        STATE_IDLE: begin
          delay <= 1'b0;
          if (command[0] && !f_receive_done) begin
            feat_size <= size[10:0];            
            f_addr <= 11'b0;
          end
          else if (command[1] && !b_receive_done) begin
            bias_size <= size[10:0];
            b_addr <= 11'h200;
          end
          else if (command[2] && !w_receive_done) begin
            w1_addr <= 11'b0;
            w2_addr <= 11'b0;
            w3_addr <= 11'b0;
            w4_addr <= 11'b0;
            weight_n <= 2'b00;            
          end
        end
        STATE_RECEIVE_FEATURE: begin
          if (!S_AXIS_TLAST) begin
            f_addr <= next_faddr[10:0];
            receive_cnt <= next_cnt[10:0];
          end
          if (next_cnt[10:0] == feat_size>>2) begin 
            f_addr <= 10'h000;
            receive_cnt <= 10'h000;           
            f_receive_done <= 1'b1;
          end
        end
        STATE_RECEIVE_BIAS: begin
          if (!S_AXIS_TLAST) begin
            b_addr <= next_baddr[10:0];
            receive_cnt <= next_cnt[10:0];
          end          
          if (next_cnt[10:0] == bias_size>>2) begin
            b_addr <= 10'h200;
            receive_cnt <= 10'h000; 
            b_receive_done <= 1'b1;
          end
        end
        STATE_RECEIVE_WEIGHT_AND_READ_FEATURE: begin
          if (!S_AXIS_TLAST) begin
            receive_cnt <= next_cnt[10:0];
            case (weight_n)
              2'b00: w1_addr <= next_w1addr[10:0];
              2'b01: w2_addr <= next_w2addr[10:0];
              2'b10: w3_addr <= next_w3addr[10:0];
              2'b11: w4_addr <= next_w4addr[10:0];
              default: ;
            endcase
          end
          if (next_cnt[10:0] == feat_size>>2) begin
            receive_cnt <= 10'b0;
            if (column_cnt == bias_size - 1) begin
              column_cnt <= 10'b0;
              w_receive_done <= 1'b1;
              w1_addr <= 10'h000;
              w2_addr <= 10'h000;
              w3_addr <= 10'h000;
              w4_addr <= 10'h000;
            end
            else begin
              column_cnt <= column_cnt + 1;
              case (weight_n)
                2'b00: weight_n <= 2'b01;
                2'b01: weight_n <= 2'b10;
                2'b10: weight_n <= 2'b11;
                2'b11: begin
                  weight_n <= 2'b00;
                  if (next_w4addr[10]) begin
                    w1_addr <= 10'h000;
                    w2_addr <= 10'h000;
                    w3_addr <= 10'h000;
                    w4_addr <= 10'h000;
                  end
                end
                default: ;
              endcase
            end 
          end
        end
        STATE_READ_BIAS: begin 
          if (delay == 2'b00) begin
            b_addr <= next_baddr[10:0];
            delay <= delay +1;
          end
          else if (!delay[1]) delay <= delay +1;
          else begin
            bias <= f_dout;
          end          
        end
        STATE_COMPUTE: begin          
          cnt_4 <= cnt_4 + 1;
          if (cnt_4[2]) begin  //cnt_4 =4
            weight1 <= weight1 << 8;
            weight2 <= weight2 << 8;
            weight3 <= weight3 << 8;
            weight4 <= weight4 << 8;       
            feat <= feat << 8;         
            if ((f_addr[8] && feat_size[10]) ||(f_addr[6] && feat_size[8]) ||(f_addr[4] && feat_size[6])) begin //column 다 읽었을 때
              if (delay[1] && delay[0]) begin
                delay <= 2'b00;  
                f_addr <= 10'h000;
                cnt_4 <= 3'b000;
                pe_1_en <= 1'b0;
                pe_2_en <= 1'b0;
                pe_3_en <= 1'b0;
                pe_4_en <= 1'b0;
              end
              else begin
                delay <= delay +1;       
              end
            end
            else begin
              cnt_4 <= 3'b000;
              pe_1_en <= 1'b0;
              pe_2_en <= 1'b0;
              pe_3_en <= 1'b0;
              pe_4_en <= 1'b0; 
            end
          end
          else if (cnt_4[1] || cnt_4[0]) begin //cnt_4 =3 or 2 or 1
            weight1 <= weight1 << 8;
            weight2 <= weight2 << 8;
            weight3 <= weight3 << 8;
            weight4 <= weight4 << 8;
            feat <= feat << 8;
            first1 <= 1'b0;
            first2 <= 1'b0;
            first3 <= 1'b0;
            first4 <= 1'b0;
          end          
          else begin //cnt_4 =0
            if (~|f_addr) begin
              first1 <= 1'b1;
              first2 <= 1'b1;
              first3 <= 1'b1;
              first4 <= 1'b1;
            end
            pe_1_en <= 1'b1;
            pe_2_en <= 1'b1;
            pe_3_en <= 1'b1;
            pe_4_en <= 1'b1;            
          end
        end
        STATE_PSUM: begin          
          if (!delay[1]) begin
            delay <= delay +1;            
          end
          else begin
            delay <= 2'b00;
            f_addr <= next_faddr[10:0];
            w1_addr <= next_w1addr[10:0];
            w2_addr <= next_w2addr[10:0];
            w3_addr <= next_w3addr[10:0];
            w4_addr <= next_w4addr[10:0];
            weight1[63:32] <= {w1_dout[7:0],w1_dout[15:8], w1_dout[23:16], w1_dout[31:24]};
            weight2[55:24] <= {w2_dout[7:0],w2_dout[15:8], w2_dout[23:16], w2_dout[31:24]};
            weight3[47:16] <= {w3_dout[7:0],w3_dout[15:8], w3_dout[23:16], w3_dout[31:24]};
            weight4[39:8] <= {w4_dout[7:0],w4_dout[15:8], w4_dout[23:16], w4_dout[31:24]};            
            feat <= {f_dout[7:0], f_dout[15:8], f_dout[23:16], f_dout[31:24]};
          end
        end

        STATE_ADD_BIAS: begin 
          pe_delay <= pe_delay + 1;
          if (pe_delay[2]) begin
            if (!pe_delay[0] &&!pe_delay[1]) begin
              pe_result <= pe_result1_temp;
              bias_temp <= bias[7:0];              
            end
            else if (pe_delay[0] && !pe_delay[1]) begin
              pe_result <= pe_result2_temp;
              bias_temp <= bias[15:8];
              bias_add_result1 <= bias_add_result;
            end
            else if (!pe_delay[0] && pe_delay[1]) begin
              pe_result <= pe_result3_temp;
              bias_temp <= bias[23:16];
              bias_add_result2 <= bias_add_result;
            end
            else if (pe_delay[0] &&pe_delay[1]) begin
              pe_result <= pe_result4_temp;
              bias_temp <= bias[31:24];
              state <= STATE_SEND_RESULT;
              bias_add_result3 <= bias_add_result;
            end
          end
          else if (pe_delay[3]) begin
            bias_add_result4 <= bias_add_result;
            pe_delay <= 4'h0;
          end
        end

        STATE_WRITE_RESULT: begin
          tdata[7:0] <= bias_add_result1[27] ? (8'b0000_0000) : 
                          ((bias_add_result1[26:13] == 14'b00_0000_0000_0000) ? {1'b0, bias_add_result1[12:6]} : 8'b0111_1111); 
          tdata[14:8] <= bias_add_result2[27] ? (8'b0000_0000) : 
                          ((bias_add_result2[26:13] == 14'b00_0000_0000_0000) ? {1'b0, bias_add_result2[12:6]} : 8'b0111_1111);
          tdata[22:16] <= bias_add_result3[27] ? (8'b0000_0000) : 
                          ((bias_add_result3[26:13] == 14'b00_0000_0000_0000) ? {1'b0, bias_add_result3[12:6]} : 8'b0111_1111);
          tdata[30:24] <= bias_add_result4[27] ? (8'b0000_0000) : 
                          ((bias_add_result4[26:13] == 14'b00_0000_0000_0000) ? {1'b0, bias_add_result4[12:6]} : 8'b0111_1111);
          delay <= 2'b00;
        end
        STATE_SEND_RESULT: begin
          m_axis_tdata <= tdata;
          delay <= delay + 1;
          if (bias_size == 11'd10) begin
            case (delay)
              2'b00: begin
                if (!max_comp1) begin
                  max_idx <= 4*(b_addr[1:0]-1);
                  max_value <= tdata[7:0];
                end
              end
              2'b01: begin
                if (!max_comp2) begin
                  max_idx <= 4*(b_addr[1:0]-1)+1;
                  max_value <= tdata[15:8];
                end
              end
              2'b10: begin
                if (!max_comp3) begin
                  max_idx <= 4*(b_addr[1:0]-1)+2;
                  max_value <= tdata[23:16];
                end
              end
              2'b11: begin
                if (!max_comp4) begin
                  max_idx <= 4*(b_addr[1:0]-1)+3;
                  max_value <= tdata[31:24];
                end
              end
              default: ;
            endcase
          end
        end
      endcase
    end
  end  
endmodule