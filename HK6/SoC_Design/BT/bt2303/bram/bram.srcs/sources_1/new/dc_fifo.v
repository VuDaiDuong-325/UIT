`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2026 10:03:20 PM
// Design Name: 
// Module Name: dc_fifo
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

module dc_fifo #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    // Giao tiep mien Write (wr_clk)
    input  wire                  wr_clk,
    input  wire                  wr_rst,
    input  wire                  we,
    input  wire [DATA_WIDTH-1:0] din,
    output wire                  full,

    // Giao tiep mien Read (rd_clk)
    input  wire                  rd_clk,
    input  wire                  rd_rst,
    input  wire                  re,
    output reg  [DATA_WIDTH-1:0] dout,
    output wire                  empty
);

    localparam DEPTH = (1 << ADDR_WIDTH);

    // Bo nho RAM
    (* ram_style = "block" *)
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Con tro Binary
    reg [ADDR_WIDTH:0] wr_ptr_bin;
    reg [ADDR_WIDTH:0] rd_ptr_bin;

    // Con tro Gray
    wire [ADDR_WIDTH:0] wr_ptr_gray;
    wire [ADDR_WIDTH:0] rd_ptr_gray;

    // Con tro Gray da duoc dong bo
    wire [ADDR_WIDTH:0] wr_ptr_gray_sync;
    wire [ADDR_WIDTH:0] rd_ptr_gray_sync;

    // -------------------------------------------------------------------------
    // 1. Mien Write (wr_clk)
    // -------------------------------------------------------------------------
    always @(posedge wr_clk) begin
        if (wr_rst) begin
            wr_ptr_bin <= 0;
        end else if (we && !full) begin
            mem[wr_ptr_bin[ADDR_WIDTH-1:0]] <= din;
            wr_ptr_bin <= wr_ptr_bin + 1;
        end
    end

    bin_to_gray #(.WIDTH(ADDR_WIDTH + 1)) b2g_wr (
        .bin(wr_ptr_bin),
        .gray(wr_ptr_gray)
    );

    synchronizer #(.WIDTH(ADDR_WIDTH + 1)) sync_rd2wr (
        .clk(wr_clk),
        .rst(wr_rst),
        .d_in(rd_ptr_gray),
        .d_out(rd_ptr_gray_sync)
    );

    // Tinh toan co Full (So sanh ma Gray: 2 bit cao nhat dao dao ngich)
    assign full = (wr_ptr_gray == {~rd_ptr_gray_sync[ADDR_WIDTH:ADDR_WIDTH-1], 
                                    rd_ptr_gray_sync[ADDR_WIDTH-2:0]});

    // -------------------------------------------------------------------------
    // 2. Mien Read (rd_clk)
    // -------------------------------------------------------------------------
    always @(posedge rd_clk) begin
        if (rd_rst) begin
            rd_ptr_bin <= 0;
            dout       <= 0;
        end else if (re && !empty) begin
            dout       <= mem[rd_ptr_bin[ADDR_WIDTH-1:0]];
            rd_ptr_bin <= rd_ptr_bin + 1;
        end
    end

    bin_to_gray #(.WIDTH(ADDR_WIDTH + 1)) b2g_rd (
        .bin(rd_ptr_bin),
        .gray(rd_ptr_gray)
    );

    synchronizer #(.WIDTH(ADDR_WIDTH + 1)) sync_wr2rd (
        .clk(rd_clk),
        .rst(rd_rst),
        .d_in(wr_ptr_gray),
        .d_out(wr_ptr_gray_sync)
    );

    // Tinh toan co Empty (So sanh ma Gray: giong nhau hoan toan)
    assign empty = (rd_ptr_gray == wr_ptr_gray_sync);

endmodule