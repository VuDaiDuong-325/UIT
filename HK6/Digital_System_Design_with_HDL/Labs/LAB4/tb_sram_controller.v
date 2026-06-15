`timescale 1ns/1ps

module tb_sram_controller();
    reg [17:0] SW;
    reg [1:0] KEY;
    wire [17:0] SRAM_ADDR;
    wire [15:0] SRAM_DQ;
    wire SRAM_WE_N, SRAM_OE_N, SRAM_CE_N, SRAM_LB_N, SRAM_UB_N;
    wire [6:0] HEX0, HEX1, HEX2, HEX3;

    sram_controller uut (
        .SW(SW), .KEY(KEY), .SRAM_ADDR(SRAM_ADDR), .SRAM_DQ(SRAM_DQ),
        .SRAM_WE_N(SRAM_WE_N), .SRAM_OE_N(SRAM_OE_N), .SRAM_CE_N(SRAM_CE_N),
        .SRAM_LB_N(SRAM_LB_N), .SRAM_UB_N(SRAM_UB_N),
        .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3)
    );

    reg [15:0] sram_mem [255:0];
    assign SRAM_DQ = (SRAM_WE_N && !SRAM_OE_N) ? sram_mem[SRAM_ADDR[7:0]] : 16'bz;

    always @(*) begin
        if (!SRAM_WE_N && !SRAM_CE_N)
            sram_mem[SRAM_ADDR[7:0]] <= SRAM_DQ;
    end

    task check_hex(input [6:0] actual, input [6:0] expected, input [255:0] msg);
        begin
            if (actual === expected)
                $display("[PASS] %s | Got: %b", msg, actual);
            else
                $display("[FAIL] %s | Got: %b | Exp: %b", msg, actual, expected);
        end
    endtask

    initial begin
        SW = 0; KEY = 2'b11; 
        #20;

        SW = {8'h05, 8'h09}; 
        KEY[1] = 0; 
        #20;
        KEY[1] = 1; 
        #10;

        SW[7:0] = 8'h00; 
        KEY[0] = 0; 
        #20;
        check_hex(HEX0, 7'b0010000, "Address 05: Check HEX0 (Value 9)");
        
        KEY[0] = 1;
        #10;
        SW = {8'h05, 8'h03};
        KEY[1] = 0;
        #20;
        KEY[1] = 1;
        #10;

        KEY[0] = 0;
        #20;
        check_hex(HEX0, 7'b0110000, "Overwrite Address 05: Check HEX0 (Value 3)");

        KEY[0] = 1;
        #20;
        SW = {8'hAA, 8'h07};
        KEY = 2'b00;
        #20;
        
        if (SRAM_DQ === 16'h0007)
            $display("[PASS] Conflicting Keys (OE=0, WE=0): Write priority observed");
        else
            $display("[FAIL] Conflicting Keys: SRAM_DQ = %h", SRAM_DQ);
            
        KEY = 2'b01;
        #20;
        check_hex(HEX0, 7'b1111000, "Read after Conflict: Check HEX0 (Value 7)");

        KEY = 2'b11;
        #10;
        SW = {8'hFF, 8'h02};
        KEY[1] = 0;
        #20;
        KEY[1] = 1;
        #10;
        
        KEY[0] = 0;
        #20;
        check_hex(HEX0, 7'b0100100, "Address FF: Check HEX0 (Value 2)");

        KEY[0] = 1;
        #10;
        if (SRAM_DQ === 16'hzzzz)
            $display("[PASS] High-Z when OE=1 and WE=1");
        else
            $display("[FAIL] Bus not High-Z. Got: %h", SRAM_DQ);

        #50;
        $display("Simulation Finished.");
        $stop;
    end

endmodule
