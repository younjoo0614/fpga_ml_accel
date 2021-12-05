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
  input [7:0]      A,
  input [7:0]      B,
  input             en,
  input            first,
  input              clk,
  output wire [7:0] out_a, out_b,
  output reg  [15:0] result,
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
  reg    [7:0]   A_reg;
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
  wire [15:0] temp;
  wire [15:0] result_temp;
  assign result_temp = (f8_reg) ? 16'h0000: result;
  CLA_16Bit u_cla_16bit (
    .A(sum),
    .B(result_temp),
    .C_in(1'b0),
    .C_out(),
    .S(temp),
    .OF(of)
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
    input wire [20:0] size,
    // output wire [31:0] FEAT_SIZE, BIAS_SIZE, WEIGHT_SIZE,
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
  reg [10:0] f_addr, w1_addr, w2_addr, w3_addr, w4_addr;
  reg w1_we, w2_we, w3_we, w4_we, f_we;
  reg [1:0] weight_n;
  reg [7:0] weight_cnt;
  wire [31:0] w_dout, f_dout;
  // reg [31:0] din;
  wire [31:0] din;

  assign din = S_AXIS_TDATA;

  reg [31:0] tdata;
  wire [7:0] a12, a23, a34;
  reg [1:0] delay;
  reg f_bram_en, w1_bram_en, w2_bram_en, w3_bram_en, w4_bram_en;
  reg first1, first2, first3, first4;
  reg pe_1_en, pe_2_en, pe_3_en, pe_4_en;
  reg [31:0] weight1, weight2, weight3, weight4, feat;
  reg f_receive_done, b_receive_done, w_receive_done;

  sram_32x1024 weight1_sram_32x1024(
  .addra(w1_addr[9:0]),
  .clka(clk),
  .dina(din),
  .douta(w_dout),
  .ena(w1_bram_en),
  .wea(w1_we)
  );

  sram_32x1024 weight2_sram_32x1024(
  .addra(w2_addr[9:0]),
  .clka(clk),
  .dina(din),
  .douta(w_dout),
  .ena(w2_bram_en),
  .wea(w2_we)
  );

  sram_32x1024 weight3_sram_32x1024(
  .addra(w3_addr[9:0]),
  .clka(clk),
  .dina(din),
  .douta(w_dout),
  .ena(w3_bram_en),
  .wea(w3_we)
  );

  sram_32x1024 weight4_sram_32x1024(
  .addra(w4_addr[9:0]),
  .clka(clk),
  .dina(din),
  .douta(w_dout),
  .ena(w4_bram_en),
  .wea(w4_we)
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
    .en(pe_1_en),
    .A(f_dout),
    .B(w_dout[31:24]),
    .out_A(a12),
    .out_b(),
    .result(tdata[31:24]),
    .first(first1),
    .of()
  );

  pe pe2 (
    .clk(clk),
    .en(pe_2_en),
    .A(a12),
    .B(w_dout[23:16]),
    .out_a(a23),
    .out_b(),
    .result(tdata[23:16]),
    .first(first2),
    .of()
  );

  pe pe3 (
    .clk(clk),
    .en(pe_3_en),
    .A(a23),
    .B(w_dout[15:8]),
    .out_a(a34),
    .out_b(),
    .result(tdata[15:8]),
    .first(first3),
    .of()
  );

  pe pe4 (
    .clk(clk),
    .en(pe_4_en),
    .A(a34),
    .B(w_dout[15:8]),
    .out_a(),
    .out_b(),
    .result(tdata[7:0]),
    .first(first4),
    .of()
  );

  // reg [31:0] feat_size, bias_size, weight_size;
  reg [10:0] feat_size;
  reg fc_done;

  // assign FEAT_SIZE = feat_size;
  // assign BIAS_SIZE = bias_size;
  // assign WEIGHT_SIZE = weight_size;
  assign FC_DONE = fc_done;

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
    end
    else begin
      case (state)
        STATE_IDLE: begin
          delay <= 1'b0;
          f_receive_done <= 1'b0;
          b_receive_done <= 1'b0;
          w_receive_done <= 1'b0;
          if (command[0]) begin
            state <= STATE_RECEIVE_FEATURE;
            feat_size <= size[10:0];
            s_axis_tready <= 1'b1;
            f_bram_en <= 1'b1;
            f_we <= 1'b1;
            f_addr <= 11'b0;
          end
          else if (command[1]) begin
            state <= STATE_RECEIVE_BIAS;
            s_axis_tready <= 1'b1;
            f_addr <= 11'h200;
            f_bram_en <= 1'b1;
            f_we <= 1'b1;
          end
          else if (command[2]) begin
            state <= STATE_RECEIVE_WEIGHT_AND_READ_FEATURE;
            s_axis_tready <= 1'b1;
            w1_addr <= 11'b0;
            w2_addr <= 11'b0;
            w3_addr <= 11'b0;
            w4_addr <= 11'b0;
            weight_n <= 2'b0;
            w1_bram_en <= 1'b1;
            w1_we <= 1'b1;
          end
          else s_axis_tready <= 1'b0;
        end
        STATE_RECEIVE_FEATURE: begin
          f_addr <= f_addr + 1;
          if (S_AXIS_TLAST) begin
            s_axis_tready <= 1'b0;
            state <= STATE_IDLE;
            f_receive_done <= 1'b1;
            f_bram_en <= 1'b0;
            f_we <= 1'b0;
          end
        end
        STATE_RECEIVE_BIAS: begin
          f_addr <= f_addr + 1;
          if (S_AXIS_TLAST) begin
            s_axis_tready <= 1'b0;
            state <= STATE_IDLE;
            f_receive_done <= 1'b1;
            f_bram_en <= 1'b0;
            f_we <= 1'b0;
          end
        end
        STATE_RECEIVE_WEIGHT_AND_READ_FEATURE: begin
          if (weight_n == 2'b00) begin
            if (w1_bram_en && w1_we) begin
              w1_addr <= w1_addr + 1;
              weight_cnt <= weight_cnt + 1;
              if (weight_cnt >= feat_size/4 - 1) begin
                weight_cnt <= 8'b0;
                weight_n <= 2'b01;
                w1_bram_en <= 1'b0;
                w1_we <= 1'b0;
                w2_bram_en <= 1'b1;
                w2_we <= 1'b1;
              end
            end
          end
          else if (weight_n == 2'b01) begin
            if (w2_bram_en && w2_we) begin
              w2_addr <= w2_addr + 1;
              weight_cnt <= weight_cnt + 1;
              if (weight_cnt >= feat_size/4 - 1) begin
                weight_cnt <= 8'b0;
                weight_n <= 2'b01;
                w2_bram_en <= 1'b0;
                w2_we <= 1'b0;
                w3_bram_en <= 1'b1;
                w3_we <= 1'b1;
              end
            end
          end
          else if (weight_n == 2'b10) begin
            if (w3_bram_en && w3_we) begin
              w3_addr <= w3_addr + 1;
              weight_cnt <= weight_cnt + 1;
              if (weight_cnt >= feat_size/4 - 1) begin
                weight_cnt <= 8'b0;
                weight_n <= 2'b01;
                w3_bram_en <= 1'b0;
                w3_we <= 1'b0;
                w4_bram_en <= 1'b1;
                w4_we <= 1'b1;
              end
            end
          end
          else if (weight_n == 2'b11) begin
            if (w4_bram_en && w4_we) begin
              w4_addr <= w4_addr + 1;
              weight_cnt <= weight_cnt + 1;
              if (weight_cnt >= feat_size/4 - 1) begin
                weight_cnt <= 8'b0;
                weight_n <= 2'b01;
                w4_bram_en <= 1'b0;
                w4_we <= 1'b0;
                w1_bram_en <= 1'b1;
                w1_we <= 1'b1;
              end
            end
          end

          if (w4_addr[9:0] >= 10'd1023 || (!feat_size[10] && S_AXIS_TLAST)) begin
            weight_cnt <= 8'b0;
            w_receive_done <= 1'b1;
            w1_bram_en <= 1'b0;
            w1_we <= 1'b0;
            w2_bram_en <= 1'b0;
            w2_we <= 1'b0;
            w3_bram_en <= 1'b0;
            w3_we <= 1'b0;
            w4_bram_en <= 1'b0;
            w4_we <= 1'b0;
            s_axis_tready <= 1'b0;
            state <= STATE_READ_BIAS;
          end
        end
        STATE_READ_BIAS: begin
          state <= STATE_PSUM;
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

  reg [15:0] next_faddr, next_waddr;
  CLA_16Bit faddr_adder (
    .A({6'h00,f_addr}),
    .B(16'h0001),
    .C_in(1'b1),
    .S(next_faddr),
    .C_out(),
    .OF()
  );

  CLA_16Bit waddr_adder (
    .A({6'h00,w_addr}),
    .B(16'h0001),
    .C_in(1'b1),
    .S(next_waddr),
    .C_out(),
    .OF()
  );
 
  
  // data path
  always @(posedge clk) begin
    if (!rstn) begin
      f_addr <= 10'b0;
      w_addr <= 10'b0;
      first1 <= 1'b0;
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
          first2 <= first1;
          first3 <= first2;
          first4 <= first3;
          if (first1) begin
            first1 <= 1'b0;
            f_addr <= next_faddr;
            w_addr <= next_waddr;
          end
          else begin
            first1 <= 1'b1;
          end          
        end
        STATE_PSUM: begin
          if (!delay[0]) begin
            delay <= delay +1;
          end
          else begin
            delay <= 2'b00;
            
          end
        end
        STATE_WRITE_RESULT: begin
          
        end
        STATE_SEND_RESULT: begin
          
        end
      endcase
    end
  end
  
endmodule
