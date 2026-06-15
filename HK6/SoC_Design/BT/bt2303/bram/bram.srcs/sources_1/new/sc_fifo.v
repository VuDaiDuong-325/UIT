`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2026 10:15:56 PM
// Design Name: 
// Module Name: sc_fifo
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


module sc_fifo #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
    )(
    input clk, rst,
    input re,    
    input we,    
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout,
    output wire full, empty
    );
    
    localparam DEPTH = (1 << ADDR_WIDTH);
    
    (*ram_style = "block" *)
    reg [DATA_WIDTH-1:0] mem[0:DEPTH-1];
    reg [ADDR_WIDTH:0] wr_ptr, rd_ptr;
    
    assign empty = (wr_ptr == rd_ptr);
    assign full = ((wr_ptr[ADDR_WIDTH] != rd_ptr[ADDR_WIDTH]) && (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]));
    
    always @(posedge clk) begin
        if (rst) 
            wr_ptr <= 0;
        else begin
            if (we && !full) begin
                mem[wr_ptr[ADDR_WIDTH-1:0]] <= din;
                wr_ptr <= wr_ptr + 1;
            end
        end
     end
     
     always @(posedge clk) begin
        if (rst) begin
            rd_ptr <= 0;
            dout <= 0;
        end else begin
            if (re && !empty) begin
                dout <= mem[rd_ptr[ADDR_WIDTH-1:0]];
                rd_ptr <= rd_ptr + 1;
            end
         end
      end
endmodule
