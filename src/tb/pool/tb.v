`timescale 1ns / 1ps


module tb;
     
    // system parameters
    parameter   CLK_PERIOD          = 2.5;              // 400MHz
    parameter   HALF_CLK_PERIODD    = CLK_PERIOD / 2;
    
    // addresses for vdma registers 
    parameter   S2MM_VDMACR_REG_ADDR        = 32'h00000030;
    parameter   S2MM_START_ADDRESS_REG_ADDR = 32'h000000AC;
    parameter   S2MM_FRMDLY_STRIDE_REG_ADDR = 32'h000000A8;
    parameter   S2MM_HSIZE_REG_ADDR         = 32'h000000A4;
    parameter   S2MM_VSIZE_REG_ADDR         = 32'h000000A0;
    
    parameter   MM2S_VDMACR_REG_ADDR        = 32'h00000000;
    parameter   MM2S_START_ADDRESS_REG_ADDR = 32'h0000005C;
    parameter   MM2S_FRMDLY_STRIDE_REG_ADDR = 32'h00000058;
    parameter   MM2S_HSIZE_REG_ADDR         = 32'h00000054;
    parameter   MM2S_VSIZE_REG_ADDR         = 32'h00000050;
    
    
    /////////////////////// ������ �κ� begin ////////////////////////////
    
    ////// �̷� ������ paramterȭ ��Ű�� �� ���ϰ� ������ ���Խ�ų �� �ֽ��ϴ�. ��, �̰��� FC Layer�� �����̰�, CONV�� POOL�� �ٸ��ϴ�.
    parameter   INPUT_FEATURE_LENGTH = 32'd8;
    parameter   INPUT_CHANNEL_SIZE = 32'd8;
    
    // HSIZE*VSIZE �� �� �������� �� ( 8-bit�� �� = byte ��) �Դϴ�. �Ϲ������� VSIZE�� 1 ���ϰ� HSZIE ������ ǥ���ϸ� �Ǹ� HSIZE�� Ŭ ���� �����Ͻø� �˴ϴ�.
    // STRIDE SIZE �� HSIZE�� �����մϴ�.
    parameter   FEATURE_BASE_ADDR   = 32'h0000_1000;    // 00000_0000 �� ��� ù ��° �����Ͱ� �� �����ϴ�. Feature Size, Weight Size, Bias SIze, Output Size�� ����ؼ� ��ġ�� �ʰ� �ּҸ� �����ϼ���.
    parameter   FEATURE_STRIDE_SIZE = INPUT_FEATURE_LENGTH*INPUT_FEATURE_LENGTH*INPUT_CHANNEL_SIZE;
    parameter   FEATURE_HSIZE       = INPUT_FEATURE_LENGTH*INPUT_FEATURE_LENGTH*INPUT_CHANNEL_SIZE;    // 65536 (2�� 16��) ���� ũ�� �ȵ˴ϴ�. ũ�� VSIZE�� �÷��� HSIZE*VSIZE�� INPUT SIZE�� �Ȱ��� ����� �˴ϴ�.
    parameter   FEATURE_VSIZE       = 32'd1;
//    parameter   WEIGHT_BASE_ADDR    = 32'h0000_2000;    // 00000_0000 �� ��� ù ��° �����Ͱ� �� �����ϴ�. Feature Size, Weight Size, Bias SIze, Output Size�� ����ؼ� ��ġ�� �ʰ� �ּҸ� �����ϼ���.
//    parameter   WEIGHT_STRIDE_SIZE  = INPUT_SIZE*OUTPUT_SIZE;
//    parameter   WEIGHT_HSIZE        = INPUT_SIZE*OUTPUT_SIZE;    // 65536 (2�� 16��) ���� ũ�� �ȵ˴ϴ�. ũ�� VSIZE�� �÷��� HSIZE*VSIZE�� INPUT SIZE�� �Ȱ��� ����� �˴ϴ�.
//    parameter   WEIGHT_VSIZE        = 32'd1;
//    parameter   BIAS_BASE_ADDR      = 32'h0000_3000;    // 00000_0000 �� ��� ù ��° �����Ͱ� �� �����ϴ�. Feature Size, Weight Size, Bias SIze, Output Size�� ����ؼ� ��ġ�� �ʰ� �ּҸ� �����ϼ���.
//    parameter   BIAS_STRIDE_SIZE    = OUTPUT_SIZE;   
//    parameter   BIAS_HSIZE          = OUTPUT_SIZE;
//    parameter   BIAS_VSIZE          = 32'd1;    
    parameter   RESULT_BASE_ADDR    = 32'h0000_4000;    // Feature Size, Weight Size, Bias SIze, Output Size�� ����ؼ� ��ġ�� �ʰ� �ּҸ� �����ϼ���.
    parameter   RESULT_STRIDE_SIZE  = INPUT_FEATURE_LENGTH*INPUT_FEATURE_LENGTH*INPUT_CHANNEL_SIZE/4;    
    parameter   RESULT_HSIZE        = INPUT_FEATURE_LENGTH*INPUT_FEATURE_LENGTH*INPUT_CHANNEL_SIZE/4;    // 65536 (2�� 16��) ���� ũ�� �ȵ˴ϴ�. ũ�� VSIZE�� �÷��� HSIZE*VSIZE�� INPUT SIZE�� �Ȱ��� ����� �˴ϴ�.   
    parameter   RESULT_VSIZE        = 32'd1; 
    /////////////////////// ������ �κ� end //////////////////////////////////////
    
    
    localparam integer  OP_SIZE         = 4;
    localparam integer  ADDR_SIZE       = 28;
    localparam integer  DATA_SIZE       = 32;
    
    /////////////////////// ������ �κ� begin ////////////////////////////
    localparam integer  FEATURE_SIZE    = FEATURE_HSIZE*FEATURE_VSIZE/4;                 // txt ���ϵ��� �� line�� 32 bit�� �� line �� �Դϴ�. ������ ���� HSZIE*VSIZE �� 1/4 �� �����ϴ�.
//    localparam integer  WEIGHT_SIZE     = WEIGHT_HSIZE*WEIGHT_VSIZE/4;                
//    localparam integer  BIAS_SIZE       = BIAS_HSIZE*BIAS_VSIZE/4;                   
    localparam integer  RESULT_SIZE     = RESULT_HSIZE*RESULT_VSIZE/4;                   
    /////////////////////// ������ �κ� end //////////////////////////////////////
    
    // FC, CONV�� ��� a,b,c �� �� ��� �ʿ������� POOL�� weight�� bias�� �����Ƿ� b,c�� �ʿ� �����ϴ�.
    // bram write 
    reg [31:0]          data_a_32bit [0:FEATURE_SIZE-1];        // data_a
//    reg [31:0]          data_b_32bit [0:WEIGHT_SIZE-1];         // data_b
//    reg [31:0]          data_c_32bit [0:BIAS_SIZE-1];           // data_c  
    
    
    /////////////////////// ������ �κ� begin //////////////////////////// 
    // module_example
    reg           init;
    reg [5:0]     input_size;
    reg [8:0]     input_channel_size;
    wire          maxpool_done;
    /////////////////////// ������ �κ� end //////////////////////////////////////
    
    // system
    reg         clk;
    reg         resetn;
    
    // vdma_control
    reg         init_txn;
    reg [31:0]  addr;
    reg [31:0]  data;
    wire        txn_done;
    
    // axi_m_interface (for read)
    reg         init_read;
    reg [31:0]  r_addr;
    wire [31:0] r_data;
    wire        read_done;  
    
    // For result check
    integer     file;
    reg [31:0]  result_32bit;                           // output result
    reg [31:0]  result_expected_32bit[0:RESULT_SIZE-1]; // expected result
    reg [27:0]  addr_test;
    
    integer    i;
    
    reg         compare_flag;


    //----------------------
    // ******* Clock *******
    //----------------------
    
    initial clk = 1'b1;
    always #HALF_CLK_PERIODD clk = ~clk;
    
    
    
    //-----------------------
    //****** Main test ******
    //-----------------------
    
    initial begin
        resetn = 1'b0;
        init_txn = 1'b0;
        init_read = 1'b0;
        result_32bit = 0;
        compare_flag = 1'b1;
        
        /////////////////////// ������ �κ� begin ////////////////////////////
        // ����� port���� �ʱ�ȭ
        init = 1'b0;
        /////////////////////// ������ �κ� end //////////////////////////////////////
        
        repeat (100)
          @(posedge clk);      
          
        resetn = 1'b1;   
        
        
        //** writing data to BRAM **//     
        repeat (500)
          @(posedge clk);
        $display("- Force write starts -");
        
        
        ////////////////////////////////////////////////////////////   INPUT FILES   ///////////////////////////////////////////////////////////
        /////////////////////// ������ �κ� begin ////////////////////////////
        // ���ϴ� ���ϵ��� add simulation sources�� �߰����ֽð�, �Ʒ��� �����̸��� �ٲ��ּ���
        // input data file
        //$readmemb("pool_input_32bits.txt", data_a_32bit);
        $readmemb("pool_input_32bits_2s.txt", data_a_32bit);
//        // weight file
//        $readmemb("pool_weight_32bits.txt", data_b_32bit);
//        // bias file
//        $readmemb("pool_bias_32bits.txt", data_c_32bit);
        /////////////////////// ������ �κ� end //////////////////////////////////////
                 
        // writing pool_input_32bits.txt
        for (i = 0; i < FEATURE_SIZE; i = i + 1) begin
            force tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_4_inst.ADDRA = (FEATURE_BASE_ADDR + i*4)/4; 
            force tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_4_inst.ENA = 1'b1;
            force tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_4_inst.WEA = 4'b1111;
            @(posedge tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_4_inst.CLKA);
            force tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_4_inst.DINA = {data_a_32bit[i][7:0],data_a_32bit[i][15:8],data_a_32bit[i][23:16],data_a_32bit[i][31:24]};   // UART version - big to little
                                                             
            @(posedge tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_4_inst.CLKA);
        end 
          
//        // writing pool_weight_32bits.txt  
//        for (i = 0; i < WEIGHT_SIZE; i = i + 1) begin            
//            force tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_1_inst.ADDRA = (WEIGHT_BASE_ADDR + i*4)/4; 
//            force tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_1_inst.ENA = 1'b1;
//            force tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_1_inst.WEA = 4'b1111;
//            @(posedge tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_1_inst.CLKA); 
//            force tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_1_inst.DINA = {data_b_32bit[i][7:0],data_b_32bit[i][15:8],data_b_32bit[i][23:16],data_b_32bit[i][31:24]};   // UART version - big to little                                                  
    
//            @(posedge tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_1_inst.CLKA);
//        end 
          
//        // writing pool_bias_32bits.txt  
//        for (i = 0; i < BIAS_SIZE; i = i + 1) begin
//             force tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_1_inst.ADDRA = (BIAS_BASE_ADDR + i*4)/4;
//             force tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_1_inst.ENA = 1'b1;
//             force tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_1_inst.WEA = 4'b1111;
//             @(posedge tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_1_inst.CLKA);
//             force tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_1_inst.DINA = {data_c_32bit[i][7:0],data_c_32bit[i][15:8],data_c_32bit[i][23:16],data_c_32bit[i][31:24]};  // UART version - big to little
                                                                 
//             @(posedge tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_1_inst.CLKA);
//        end
 
        release tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_4_inst.ADDRA;
        release tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_4_inst.ENA;
        release tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_4_inst.WEA;
        release tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_4_inst.DINA;
        @(posedge tb.u_top_simulation.u_sram_32x131072.inst.axi_mem_module.blk_mem_gen_v8_4_4_inst.CLKA);
        
        $display("- Force write is done -\n\n");
        
        

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
        ////////////////////////////////////////////////////////   VDMA control starts   ///////////////////////////////////////////////////////  

  
        /////////////////////// ������ �κ� begin ////////////////////////////
        // �� �κ��� �����Ͻ� ��� ������ VDMA�� �Ѱ� signal���� �ְ� ������ �˴ϴ�.
        
        $display("- VDMA control starts -\n");
        # CLK_PERIOD;
        
        // VDMA�� ����� �޵��� �̸� �ѵδ� ���Դϴ�. VDMA�� input data�� �����ִ� �Ͱ��� �����̹Ƿ� �̸� �ѵΰ� �����մϴ�. �� �� �κ��� ������ �ʿ䰡 �����ϴ�.
        // S2MM //
        // write result (from FC to memory)
        write_data(S2MM_VDMACR_REG_ADDR, 32'h00010091);                 // control
        write_data(S2MM_START_ADDRESS_REG_ADDR, RESULT_BASE_ADDR);      // start address
        write_data(S2MM_FRMDLY_STRIDE_REG_ADDR, RESULT_STRIDE_SIZE);    // stride
        write_data(S2MM_HSIZE_REG_ADDR, RESULT_HSIZE);                  // hsize (= line size) (Bytes)
        write_data(S2MM_VSIZE_REG_ADDR, RESULT_VSIZE);                  // the number of lines
        $display("VDMA is ready to receive result from FC\n");
    
    
    
    
        // MM2S //
        // feature read (from memory to FC) 
        $display("VDMA transmits feature to FC");
        write_data(MM2S_VDMACR_REG_ADDR, 32'h00010091);                 // control
        write_data(MM2S_START_ADDRESS_REG_ADDR, FEATURE_BASE_ADDR);     // start address
        write_data(MM2S_FRMDLY_STRIDE_REG_ADDR, FEATURE_STRIDE_SIZE);   // stride
        write_data(MM2S_HSIZE_REG_ADDR, FEATURE_HSIZE);                 // hsize (= line size) (Bytes)
        write_data(MM2S_VSIZE_REG_ADDR, FEATURE_VSIZE);                 // the number of lines 


        repeat(100)
            @(posedge clk);

            
        // sending control signals to FC
        input_size = INPUT_FEATURE_LENGTH;
        input_channel_size = INPUT_CHANNEL_SIZE;
        init = 1'b1;
        
        $display("POOL starts to calculate");        
        
        repeat(2)
            @(posedge clk);
            
        wait(maxpool_done);
        init = 1'b0;
        
        $display("POOL finishes to calculate\n");
        
        
        repeat(100)                                                     //** Please do not remove this. **//
            @(posedge clk);                                             //** VDMA needs enough time interval between transmissions of the same direction. (this case: MM2S & MM2S) **//
            
        /////////////////////// ������ �κ� end //////////////////////////////////////
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
        //////////////////////////////////////////////////////  VDMA control is finished  //////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
    
    
    
        // comparing results
        $display("- Comparing result starts -\n");
        
        
        ////////////////////////////////////////////////////////////   RESULT FILE   ///////////////////////////////////////////////////////////
        /////////////////////// ������ �κ� begin ////////////////////////////
        // �Ʒ��� ���ϸ��� ���ϴ� ������Ϸ� �ٲ��ּ���
        //import_result_nowrite("pool_output_32bits.txt");          
        import_result_nowrite("pool_output_32bits_2s.txt");          
        ////////////////////// ������ �κ� end //////////////////////////////////////
        
        addr_test = RESULT_BASE_ADDR;
        
        for (i = 0; i < RESULT_SIZE; i = i + 1) begin
            read_data (addr_test+i*4, result_32bit);
            
            $display("Index: %d", i);
            
            if (result_32bit != {result_expected_32bit[i][7:0], result_expected_32bit[i][15:8], result_expected_32bit[i][23:16],result_expected_32bit[i][31:24]}) begin
                $display("\nResult is different!");
                $display("Expected value: %h", {result_expected_32bit[i][7:0], result_expected_32bit[i][15:8], result_expected_32bit[i][23:16],result_expected_32bit[i][31:24]});
                $display("Output value: %h\n", result_32bit);
                
                compare_flag = 1'b0;
            end
        end
        
        if (compare_flag) begin
            $display("\nResult is correct!\n");
        end
        
        $display("- Comparing result is done!! -\n");
        $finish;
    end
    
    
    
    //-----------------------
    //******** Task ********
    //-----------------------
    
    task write_data (input [31:0] i_addr, input [31:0] i_data);
        begin   
            addr = i_addr;
            data = i_data;
            
            init_txn = 1'b1;
            
            # CLK_PERIOD 
            init_txn = 1'b0;
            
            wait(txn_done);
             # CLK_PERIOD;
        end
    endtask
    
    
    task read_data (input [31:0] i_addr, output reg [31:0] o_data);
        begin
            r_addr = i_addr;
            
            init_read = 1'b1;
         
            # CLK_PERIOD 
            init_read = 1'b0;
            
            wait(read_done);
            # CLK_PERIOD;      
             
            o_data = r_data;      
        end
    endtask

    task import_result_nowrite(input [128 * 8:0] file_name);
        begin
            file = 0;  
            file = $fopen(file_name,"rb");
            
            if (!file) begin
                $display("read: Open Error!\n");
                $finish;
            end
            
            $display("input file : %s\n", file_name);
            
            $readmemb(file_name, result_expected_32bit);
            
            $display("import result(no write) is done. \n");
            
            $fclose(file);
        end
    endtask
    
    
    
    //-----------------------
    //**** Instantiation ****
    //-----------------------
     
    top_simulation u_top_simulation
        (.clk(clk),
        .resetn(resetn),
        .init_txn(init_txn),
        .i_addr(addr),
        .i_data(data),
        .txn_done(txn_done),
        .init_read(init_read),
        .r_addr(r_addr),
        .r_data(r_data),
        .read_done(read_done),
        
        
        /////////////////////// ������ �κ� begin ////////////////////////////
        .init(init),
        .input_size(input_size),
        .input_channel_size(input_channel_size),
        .maxpool_done(maxpool_done)
        ////////////////////// ������ �κ� end //////////////////////////////////////
        );
endmodule
