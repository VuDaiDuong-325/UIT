`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2026 09:59:51 PM
// Design Name: 
// Module Name: synchronizer
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

module synchronizer #(
    parameter WIDTH = 4
)(
    input  wire             clk,
    input  wire             rst,
    input  wire [WIDTH-1:0] d_in,
    output reg  [WIDTH-1:0] d_out
);

    reg [WIDTH-1:0] q1;

    always @(posedge clk) begin
        if (rst) begin
            q1    <= 0;
            d_out <= 0;
        end else begin
            q1    <= d_in;
            d_out <= q1;
        end
    end

endmodule
