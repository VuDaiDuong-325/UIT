
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2026 10:16:23 PM
// Design Name: 
// Module Name: tb_dc_fifo
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

module tb_dc_fifo;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4; // Chứa tối đa 16 giá trị

    // Tín hiệu miền Write (100MHz)
    reg wr_clk;
    reg wr_rst;
    reg we;
    reg [DATA_WIDTH-1:0] din;
    wire full;

    // Tín hiệu miền Read (40MHz)
    reg rd_clk;
    reg rd_rst;
    reg re;
    wire [DATA_WIDTH-1:0] dout;
    wire empty;

    // Khởi tạo DUT
    dc_fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dut (
        .wr_clk(wr_clk),
        .wr_rst(wr_rst),
        .we(we),
        .din(din),
        .full(full),
        .rd_clk(rd_clk),
        .rd_rst(rd_rst),
        .re(re),
        .dout(dout),
        .empty(empty)
    );

    // Tạo xung nhịp bất đồng bộ
    initial begin
        wr_clk = 0;
        forever #5 wr_clk = ~wr_clk; // Chu kỳ 10ns (100MHz)
    end

    initial begin
        rd_clk = 0;
        forever #12.5 rd_clk = ~rd_clk; // Chu kỳ 25ns (40MHz)
    end

    integer i;

    initial begin
        // ---------------------------------------------------------------------
        // KHỞI TẠO VÀ RESET HỆ THỐNG
        // ---------------------------------------------------------------------
        wr_rst = 1; rd_rst = 1;
        we = 0; re = 0; din = 0;
        
        #50;
        @(negedge wr_clk) wr_rst = 0;
        @(negedge rd_clk) rd_rst = 0;
        
        #50;

        // ---------------------------------------------------------------------
        // CASE 1: BƠM ĐẦY TỐC ĐỘ CAO & CỐ TÌNH GHI TRÀN (OVERFLOW)
        // ---------------------------------------------------------------------
        $display("[%0t] CASE 1: Ghi lien tuc 16 gia tri (100MHz)", $time);
        for (i = 0; i < 16; i = i + 1) begin
            @(negedge wr_clk);
            we = 1;
            din = i + 8'hA0;
        end
        
        // Ghi thêm khi đã đầy (kiểm tra chống tràn)
        @(negedge wr_clk);
        we = 1; din = 8'hFF; // Giá trị FF không được phép lọt vào RAM
        $display("[%0t] Co full = %b. Dang co ghi de FF vao RAM...", $time, full);
        
        @(negedge wr_clk);
        we = 0;

        #100;

        // ---------------------------------------------------------------------
        // CASE 2: RÚT CẠN TỐC ĐỘ CHẬM & CỐ TÌNH ĐỌC LỐ (UNDERFLOW)
        // ---------------------------------------------------------------------
        $display("[%0t] CASE 2: Doc lien tuc ra khoi FIFO (40MHz)", $time);
        for (i = 0; i < 16; i = i + 1) begin
            @(negedge rd_clk);
            re = 1;
        end
        
        // Đọc thêm khi đã rỗng (kiểm tra chống underflow)
        @(negedge rd_clk);
        re = 1;
        $display("[%0t] Co empty = %b. Dang co doc khi FIFO rong...", $time, empty);

        @(negedge rd_clk);
        re = 0;

        #100;

        // ---------------------------------------------------------------------
        // CASE 3: GHI VÀ ĐỌC ĐỒNG THỜI XUYÊN MIỀN CLOCK (CDC TEST)
        // ---------------------------------------------------------------------
        $display("[%0t] CASE 3: Vua doc vua ghi voi 2 Clock lech pha", $time);
        
        // Mồi trước 3 giá trị để FIFO không rỗng
        for (i = 0; i < 3; i = i + 1) begin
            @(negedge wr_clk);
            we = 1; din = 8'hB0 + i;
        end
        @(negedge wr_clk) we = 0;

        #20;
        
        // Bật cả Read và Write đồng thời.
        // Do wr_clk (100MHz) nhanh hơn rd_clk (40MHz), FIFO sẽ dần dần bị đầy.
        we = 1;
        re = 1;
        
        for (i = 0; i < 20; i = i + 1) begin
            @(negedge wr_clk);
            din = din + 1; // Dữ liệu ghi thay đổi liên tục
        end

        we = 0;
        re = 0;

        #200;
        $display("[%0t] HOAN TAT MO PHONG!", $time);
        $finish;
    end

endmodule
