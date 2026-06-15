`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2026 09:42:09 PM
// Design Name: 
// Module Name: tb_bram_mode
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

module tb_bram_mode_advanced;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    reg clk;
    reg en;
    reg we;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] din;

    wire [DATA_WIDTH-1:0] dout_wf;
    wire [DATA_WIDTH-1:0] dout_rf;
    wire [DATA_WIDTH-1:0] dout_nc;

    // Khởi tạo 3 BRAM (Write First, Read First, No Change)
    bram_mode #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH), .MODE(0)) dut_wf (.clk(clk), .en(en), .we(we), .addr(addr), .din(din), .dout(dout_wf));
    bram_mode #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH), .MODE(1)) dut_rf (.clk(clk), .en(en), .we(we), .addr(addr), .din(din), .dout(dout_rf));
    bram_mode #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH), .MODE(2)) dut_nc (.clk(clk), .en(en), .we(we), .addr(addr), .din(din), .dout(dout_nc));

    // Tạo Clock 100MHz
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Kịch bản Test
    initial begin
        // --- KHỞI TẠO BAN ĐẦU ---
        en = 0; we = 0; addr = 0; din = 0;
        #50;

        // --- BƯỚC 1: GHI DỮ LIỆU CƠ BẢN ---
        @(negedge clk); // Cấp tín hiệu ở sườn xuống để tránh Race Condition
        en = 1; we = 1; addr = 4'h1; din = 8'hAA; 
        
        @(negedge clk);
        en = 1; we = 1; addr = 4'h2; din = 8'hBB; 

        // Đọc địa chỉ 2 để mồi giá trị dout (tất cả đều sẽ ra BB)
        @(negedge clk);
        en = 1; we = 0; addr = 4'h2; din = 8'h00;

        // --- BƯỚC 2: TEST SỰ KHÁC BIỆT 3 CHẾ ĐỘ (GHI ĐÈ) ---
        @(negedge clk);
        en = 1; we = 1; addr = 4'h1; din = 8'hCC; 
        // Kỳ vọng: wf=CC, rf=AA, nc=BB

        // ---------------------------------------------------------------------
        // CÁC TRƯỜNG HỢP ĐẶC BIỆT (SPECIAL CASES)
        // ---------------------------------------------------------------------

        // [Case 1] Ghi liên tiếp vào cùng 1 địa chỉ (Back-to-back write)
        @(negedge clk);
        en = 1; we = 1; addr = 4'h1; din = 8'hDD;
        // Kỳ vọng: wf lập tức chuyển sang DD. rf xuất ra CC (dữ liệu vừa ghi ở chu kỳ trước). nc vẫn giữ nguyên BB.

        // [Case 2] Tắt Enable (en = 0) nhưng vẫn bật Write (we = 1)
        @(negedge clk);
        en = 0; we = 1; addr = 4'h5; din = 8'hFF;
        // Kỳ vọng: BRAM bị vô hiệu hóa. Dữ liệu KHÔNG được ghi vào địa chỉ 5. Cả 3 dout KHÔNG thay đổi.

        // [Case 3] Đọc kiểm tra lại địa chỉ 5 (Xác nhận Case 2 an toàn)
        @(negedge clk);
        en = 1; we = 0; addr = 4'h5; din = 8'h00;
        // Kỳ vọng: Do lúc nãy không ghi được FF vào địa chỉ 5, ngõ ra sẽ xuất hiện giá trị X (Undefined) trên Waveform vì mảng RAM chưa được khởi tạo.

        // Kết thúc
        @(negedge clk);
        en = 0;
        
        #50;
        $finish;
    end

endmodule