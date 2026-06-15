`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2026 04:34:33 PM
// Design Name: 
// Module Name: tb_apb_system
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

module tb_apb_system;

    // Khai báo các tín hiệu
    reg         PCLK;
    reg         PRESETn;
    reg         sw_wr;
    reg         sw_rd;
    reg  [7:0]  sw_addr;
    reg  [31:0] sw_data;
    wire [31:0] sw_out;
    wire        sw_done;

    // Biến tạm để lưu kết quả đọc về
    reg  [31:0] read_val;

    // Gọi Top Module
    apb_system dut (
        .PCLK(PCLK), .PRESETn(PRESETn),
        .sw_wr(sw_wr), .sw_rd(sw_rd),
        .sw_addr(sw_addr), .sw_data(sw_data),
        .sw_out(sw_out), .sw_done(sw_done)
    );

    // Tạo xung Clock 10ns
    always #5 PCLK = ~PCLK;

    // =========================================================
    // KHAI BÁO TASKS ĐỂ TÁI SỬ DỤNG CODE APB READ/WRITE
    // =========================================================
    
    // Task Ghi qua APB
    task apb_write(input [7:0] addr, input [31:0] data);
        begin
            @(posedge PCLK);
            sw_addr = addr;
            sw_data = data;
            sw_wr   = 1;
            wait(sw_done);
            @(posedge PCLK) sw_wr = 0;
        end
    endtask

    // Task Đọc qua APB
    task apb_read(input [7:0] addr, output [31:0] data_out);
        begin
            @(posedge PCLK);
            sw_addr = addr;
            sw_rd   = 1;
            wait(sw_done);
            data_out = sw_out;
            @(posedge PCLK) sw_rd = 0;
        end
    endtask

    // Task tự động thực hiện 1 phép tính hoàn chỉnh và in kết quả
    task test_multiply(input signed [7:0] a, input signed [7:0] b);
        reg signed [15:0] theory_val;
        
        // Khai báo 2 biến kiểu 'time' để lưu trữ thời gian mô phỏng
        time start_time;
        time end_time;
        
        begin
            // 1. BẤM GIỜ BẮT ĐẦU
            start_time = $time; 
            
            // Tính toán lý thuyết
            theory_val = a;
            theory_val = theory_val * b;

            // Đẩy dữ liệu vào (Ghi 2 thanh ghi)
            apb_write(8'h00, {{24{a[7]}}, a}); 
            apb_write(8'h04, {{24{b[7]}}, b}); 
            
            // Đọc kết quả ra
            apb_read(8'h08, read_val);         
            
            // 2. BẤM GIỜ KẾT THÚC (Ngay sau khi nhận xong dữ liệu)
            end_time = $time;
            
            // In ra màn hình đầy đủ thông tin: Thời gian + Phép tính + Kết quả
            $display("[Time: %6t ns -> %6t ns] (Mat %3t ns) | Test: %4d x %4d = %6d | Ly thuyet = %6d", 
                     start_time, end_time, (end_time - start_time), a, b, $signed(read_val), theory_val);
        end
    endtask

    // =========================================================
    // KỊCH BẢN CHẠY MÔ PHỎNG (MAIN TEST)
    // =========================================================
    initial begin
        PCLK = 0; PRESETn = 0;
        sw_wr = 0; sw_rd = 0; sw_addr = 0; sw_data = 0;

        #15 PRESETn = 1;
        #10;
        
        // SỬ DỤNG TIẾNG VIỆT KHÔNG DẤU ĐỂ TRÁNH LỖI MOJIBAKE
        $display("==================================================");
        $display("          BAT DAU CHAY TEST CORNER CASES          ");
        $display("==================================================");

        test_multiply(8'sd15, -8'sd4);
        test_multiply(8'sd127, 8'sd127);
        test_multiply(-8'sd128, -8'sd128);
        test_multiply(-8'sd128, 8'sd127);
        test_multiply(8'sd0, -8'sd55);
        test_multiply(8'sd1, -8'sd100);

        $display("==================================================");
        $display("                    HOAN THANH                    ");
        $display("==================================================");

        #20 $finish;
    end
endmodule
