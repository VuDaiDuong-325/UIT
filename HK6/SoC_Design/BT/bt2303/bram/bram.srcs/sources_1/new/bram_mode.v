`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2026 03:42:27 PM
// Design Name: 
// Module Name: bram_mode
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


module bram_mode #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4,
    parameter MODE = 0  
        // 0 -> write first
        // 1 -> read first
        // 2 -> no change
    )(
    input clk,
    input en,    // BRAM Enable
    input we,    // Write Enable
    input [ADDR_WIDTH-1:0] addr,
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout
    );
    
    localparam DEPTH = (1 << ADDR_WIDTH);
    
    (*ram_style = "block" *)
    reg [DATA_WIDTH-1:0] mem[0:DEPTH-1];
    
    generate
        if (MODE == 0) begin : write_first
            always @(posedge clk) begin
                if (en) begin
                    if (we) begin 
                        mem[addr] <= din;
                        dout <= din;
                    end 
                    else 
                        dout <= mem[addr];
                end
            end
        end
        else if (MODE == 1) begin : read_first
            always @(posedge clk) begin
                if (en) begin
                    if (we)
                        mem[addr] <= din;
                    dout <= mem[addr];
                end
            end
         end
         else if (MODE == 2) begin : no_change
            always @(posedge clk) begin
                if (en) begin
                    if (we)
                        mem[addr] <= din;
                    else
                        dout <= mem[addr];
                end
             end
          end
    endgenerate
endmodule
