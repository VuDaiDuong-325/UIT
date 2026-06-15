`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2026 04:30:44 PM
// Design Name: 
// Module Name: apb_system
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


module apb_system (
    input wire PCLK,
    input wire PRESETn,
    
    // Điều khiển từ bên ngoài (ví dụ từ Testbench)
    input  wire        sw_wr, 
    input  wire        sw_rd,
    input  wire [7:0]  sw_addr,
    input  wire [31:0] sw_data,
    output wire [31:0] sw_out,
    output wire        sw_done
);

    // Các đường dây bus nội bộ
    wire [7:0]  w_paddr;
    wire        w_psel;
    wire        w_penable;
    wire        w_pwrite;
    wire [31:0] w_pwdata;
    wire [31:0] w_prdata;
    wire        w_pready;

    // Instantiate Master
    apb_master u_master (
        .PCLK(PCLK), .PRESETn(PRESETn),
        .start_write(sw_wr), .start_read(sw_rd),
        .addr_in(sw_addr), .data_in(sw_data),
        .data_out(sw_out), .done(sw_done),
        .PADDR(w_paddr), .PSEL(w_psel), .PENABLE(w_penable),
        .PWRITE(w_pwrite), .PWDATA(w_pwdata), .PRDATA(w_prdata),
        .PREADY(w_pready)
    );

    // Instantiate Slave (Bộ nhân từ câu trả lời trước)
    apb_slave u_slave (
        .PCLK(PCLK), .PRESETn(PRESETn),
        .PADDR(w_paddr), .PSEL(w_psel), .PENABLE(w_penable),
        .PWRITE(w_pwrite), .PWDATA(w_pwdata), .PRDATA(w_prdata),
        .PREADY(w_pready), .PSLVERR()
    );

endmodule
