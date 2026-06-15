//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/06/27 20:33:02
// Design Name: 
// Module Name: Counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
module Counter_tb();

    // Declare test bench signals
    reg CLK;
    reg RST;
    reg CNT;
    wire [3:0] Q;
    wire temp_LED;

    // Instantiate the Unit Under Test (UUT)
    Counter C4 (
        .CLK(CLK),
        .RST(RST),
        .CNT(CNT),
        .Q(Q),
        .temp_LED(temp_LED)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10 ns period
    end

    // Test stimulus generation
    initial begin
        // VCD dump for waveform
        $dumpfile("wave.vcd");
        $dumpvars(0, Counter_tb);

        // Initialize inputs
        RST = 1;
        CNT = 0;

        // Display header
        $display("------------------------------------------------------------");
        $display("Time | CLK | RST | CNT | Q | temp_LED | Description");
        $display("------------------------------------------------------------");

        // Apply reset
        #10;
        $display("%0t | %b | %b | %b | %h | %b | Applying reset", $time, CLK, RST, CNT, Q, temp_LED);
        RST = 0;
        #10;
        $display("%0t | %b | %b | %b | %h | %b | Reset released, counter should be 0", $time, CLK, RST, CNT, Q, temp_LED);

        // CNT high for a few clock cycles to test counting
        CNT = 1; #20; // 2 clock cycles
        $display("%0t | %b | %b | %b | %h | %b | CNT=1, counter should increment twice", $time, CLK, RST, CNT, Q, temp_LED);
        CNT = 0; #10;

        // Another CNT high pulse
        CNT = 1; #30; // 3 clock cycles
        $display("%0t | %b | %b | %b | %h | %b | CNT=1, counter should increment 3 more times", $time, CLK, RST, CNT, Q, temp_LED);
        CNT = 0; #10;

        // Wrap-around test
        CNT = 1; #50; // multiple clock cycles to exceed 4-bit max
        CNT = 0; #10;
        $display("%0t | %b | %b | %b | %h | %b | Wrap-around test finished", $time, CLK, RST, CNT, Q, temp_LED);

        // Re-apply reset
        RST = 1; #10;
        RST = 0; #10;
        $display("%0t | %b | %b | %b | %h | %b | Re-apply reset, Q should be 0", $time, CLK, RST, CNT, Q, temp_LED);

        // End simulation
        #20;
        $display("------------------------------------------------------------");
        $display("Simulation Finished at %0t ns", $time);
        $finish;
    end

    // Optional: monitor every clock edge
    always @(posedge CLK) begin
        $monitor("%0t | %b | %b | %b | %h | %b |", $time, CLK, RST, CNT, Q, temp_LED);
    end

endmodule

