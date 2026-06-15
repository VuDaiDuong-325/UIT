`timescale 1ns / 1ps

module tb_sc_fifo;

    // Cac tham so tuong ung voi thiet ke
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4; // Do sau = 16 o nho

    // Khai bao tin hieu Testbench
    reg clk;
    reg rst;
    reg we;
    reg re;
    reg [DATA_WIDTH-1:0] din;

    wire [DATA_WIDTH-1:0] dout;
    wire full;
    wire empty;

    // Khoi tao Module SC FIFO (Device Under Test - DUT)
    sc_fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .re(re),
        .we(we),
        .din(din),
        .dout(dout),
        .full(full),
        .empty(empty)
    );

    // -------------------------------------------------------------------------
    // Tao xung nhip Clock (100MHz -> Chu ky 10ns)
    // -------------------------------------------------------------------------
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Bien dem dung trong vong lap for
    integer i;

    // -------------------------------------------------------------------------
    // Kich ban Test (Test Sequence)
    // -------------------------------------------------------------------------
    initial begin
        // 1. KHOI TAO VA RESET HE THONG
        rst = 1;
        we  = 0;
        re  = 0;
        din = 0;

        #25; // Doi mot chut cho he thong on dinh
        @(negedge clk);
        rst = 0; // Nha Reset -> Luc nay co `empty` phai len 1 (muc cao)

        #10;
        
        // =====================================================================
        // GIAI DOAN 1: BOM DAY FIFO (TEST CO FULL & CHONG TRAN)
        // =====================================================================
        $display("[%0t] BAT DAU GHI 16 GIA TRI VAO FIFO...", $time);
        for (i = 0; i < 16; i = i + 1) begin
            @(negedge clk);
            we  = 1;
            din = i + 8'hA0; // Lan luot ghi A0, A1, A2... den AF
        end
        
        // Kich ban dac biet: Co tinh ghi them khi FIFO da day!
        @(negedge clk);
        $display("[%0t] FIFO DA DAY! Co full = %b", $time, full);
        we  = 1;
        din = 8'hFF; // Chu FF nay KHONG duoc phep lot vao trong RAM do bi chan boi !full
        
        @(negedge clk);
        we  = 0; // Tat lenh ghi

        #20;

        // =====================================================================
        // GIAI DOAN 2: RUT CAN FIFO (TEST CO EMPTY & CHONG LOI DOC)
        // =====================================================================
        $display("[%0t] BAT DAU RUT DU LIEU RA...", $time);
        for (i = 0; i < 16; i = i + 1) begin
            @(negedge clk);
            re = 1; // Ngo ra se lan luot xuat hien A0, A1... den AF
        end
        
        // Kich ban dac biet: Co tinh doc them khi FIFO da rong!
        @(negedge clk);
        $display("[%0t] FIFO DA RONG! Co empty = %b", $time, empty);
        re = 1; // Con tro doc khong duoc phep tang them do bi chan boi !empty
        
        @(negedge clk);
        re = 0; // Tat lenh doc

        #20;

        // =====================================================================
        // GIAI DOAN 3: VUA DOC VUA GHI DONG THOI (DUAL-PORT TEST)
        // =====================================================================
        $display("[%0t] BAT DAU TEST VUA DOC VUA GHI CUNG LUC...", $time);
        
        // Ghi moi truoc 2 gia tri vao FIFO
        @(negedge clk); we = 1; re = 0; din = 8'h11;
        @(negedge clk); we = 1; re = 0; din = 8'h22;
        
        // Kich hoat CA DOC VA GHI trong cung mot chu ky clock
        @(negedge clk);
        we  = 1; din = 8'h33; // Ghi vao 33
        re  = 1;              // Dong thoi lay du lieu cu ra (se ra 11)
        
        @(negedge clk);
        we  = 1; din = 8'h44; // Ghi vao 44
        re  = 1;              // Lay du lieu ra (se ra 22)

        @(negedge clk);
        we  = 0;
        re  = 0;

        #50;
        $display("[%0t] HOAN TAT MO PHONG!", $time);
        $finish; // Ket thuc mo phong
    end

endmodule