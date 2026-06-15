`timescale 1ns/1ps

module tb_ram_wave();
    reg clk, cs, wr_e, oe;
    reg [6:0] addr;
    reg [7:0] data_in;    
    wire [7:0] data;

    single_port_RAM uut (
        .clk(clk), .cs(cs), .wr_e(wr_e), 
        .oe(oe), .addr(addr), .data(data)
    );

    assign data = (cs && wr_e) ? data_in : 8'bz;

    always #5 clk = ~clk;

    initial begin
        // Khởi tạo
        clk = 0; cs = 0; wr_e = 0; oe = 0; addr = 0; data_in = 0;
        #10;

        // --- TRƯỜNG HỢP 1: Đọc địa chỉ chưa được ghi dữ liệu ---
        $display("TC1: Reading uninitialized memory");
        cs = 1; wr_e = 0; oe = 1;
        addr = 7'h55; // Địa chỉ này chưa bao giờ được ghi
        #10; // Kết quả mong đợi trên Wave: data = 8'hxx

        // --- TRƯỜNG HỢP 2: Thao tác khi cs = 0 (Chip Disable) ---
        $display("TC2: Write attempt when cs=0");
        cs = 0; wr_e = 1; oe = 0; addr = 7'h01; data_in = 8'hFF; 
        #10; 
        // Đọc lại địa chỉ 01 để xem FF có bị ghi vào không
        wr_e = 0; cs = 1; oe = 1; addr = 7'h01;
        #10; // Kết quả mong đợi: data vẫn là 8'hxx (vì lệnh ghi trước đó bị chặn bởi cs=0)

        // --- TRƯỜNG HỢP 3: Ghi và Đọc tại biên cao nhất (Address 127) ---
        $display("TC3: Boundary address 127");
        cs = 1; wr_e = 1; oe = 0; addr = 7'd127; data_in = 8'hEE;
        #10;
        wr_e = 0; oe = 1; addr = 7'd127;
        #10; // Kết quả mong đợi: data = 8'hEE

        // --- TRƯỜNG HỢP 4: Dữ liệu Inout khi oe = 0 ---
        $display("TC4: Data bus high-Z when oe=0");
        cs = 1; wr_e = 0; oe = 0; addr = 7'd127;
        #10; // Kết quả mong đợi: data = 8'hzz (dù bên trong RAM có dữ liệu)

        // --- TRƯỜNG HỢP 5: Địa chỉ "Out of range" (Lưu ý về kích thước bus) ---
        $display("TC5: Address rollover/out of range");
        // Vì addr chỉ có 7 bit, nên giá trị 128 (8'h80) sẽ bị cắt thành 7'h00
        cs = 1; wr_e = 1; addr = 8'h80; data_in = 8'h99; 
        #10;
        addr = 7'h00; wr_e = 0;
        #10; // Quan sát xem địa chỉ 00 có bị ghi đè bởi giá trị 99 hay không

        #20;
        $display("All corner cases tested.");
        $stop; 
    end
endmodule