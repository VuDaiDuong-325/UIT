//////////////////////////////////////////////////////////////////////////////////
// Company: Kyutech
// Engineer: Imamura Yuki
// 
// Create Date: 2025/06/27 19:56:30
// Design Name: 
// Module Name: Counter
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module Counter(
    input CLK,          // Clock
    input RST,          // Asynchronous reset (used as synchronous)
    input CNT,          // Count enable
    output reg [3:0] Q, // Count Output
    output reg temp_LED // Status display LED
);

    always @(posedge CLK) begin
        if (RST) begin
            Q <= 4'h0;
            temp_LED <= 1'b1;
        end else if (CNT) begin
            Q <= Q + 1;
            temp_LED <= 1'b0;
        end
    end

endmodule


