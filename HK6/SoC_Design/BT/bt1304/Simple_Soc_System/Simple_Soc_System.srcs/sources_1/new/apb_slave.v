module apb_slave (
    input  wire        PCLK,     // Clock của hệ thống bus
    input  wire        PRESETn,  // Reset tích cực mức thấp (Active-low)

    // Các tín hiệu chuẩn của bus APB
    input  wire        PSEL,     // Chip Select: Kích hoạt module này
    input  wire        PENABLE,  // Enable: Tín hiệu xác nhận của chu kỳ bus
    input  wire        PWRITE,   // Write Enable: 1 = Ghi, 0 = Đọc
    input  wire [7:0]  PADDR,    // Address: Bus địa chỉ (ở đây dùng 8-bit là đủ)
    input  wire [31:0] PWDATA,   // Write Data: Bus dữ liệu ghi vào (32-bit chuẩn)
    
    output wire        PREADY,   // Ready: Báo hiệu slave đã sẵn sàng (ở đây luôn = 1)
    output reg  [31:0] PRDATA,   // Read Data: Bus dữ liệu đọc ra (32-bit chuẩn)
    output wire        PSLVERR   // Slave Error: Báo lỗi (không dùng đến, gán = 0)
);

    // Khai báo các thanh ghi nội bộ có dấu
    reg signed [7:0] reg_a;
    reg signed [7:0] reg_b;
    wire signed [15:0] mult_result;

    // Khởi tạo khối nhân
    signed_multiplier_8bit u_core (
        .a(reg_a),
        .b(reg_b),
        .p(mult_result)
    );

    // APB Write Logic (Quá trình Ghi dữ liệu từ Bus vào Thanh ghi)
    // Dữ liệu được ghi khi PSEL = 1, PENABLE = 1 và PWRITE = 1
    wire apb_write = PSEL & PENABLE & PWRITE;

    always @(posedge PCLK or negedge PRESETn) begin
        if (!PRESETn) begin
            reg_a <= 8'sd0;
            reg_b <= 8'sd0;
        end else if (apb_write) begin
            case (PADDR)
                8'h00: reg_a <= PWDATA[7:0]; // Ghi 8-bit thấp vào A
                8'h04: reg_b <= PWDATA[7:0]; // Ghi 8-bit thấp vào B
                // Địa chỉ 0x08 là chỉ đọc (Read-only) nên không xử lý ghi ở đây
            endcase
        end
    end

    // APB Read Logic (Quá trình Đọc dữ liệu từ module ra Bus)
    // Dữ liệu được đưa ra PRDATA khi PSEL = 1 và PWRITE = 0 (Chế độ đọc)
    always @(*) begin
        // Mặc định xuất 0 để tránh nhiễu rác
        PRDATA = 32'd0; 
        
        if (PSEL && !PWRITE) begin
            case (PADDR)
                8'h00: PRDATA = {24'd0, reg_a};                 // Đọc thanh ghi A
                8'h04: PRDATA = {24'd0, reg_b};                 // Đọc thanh ghi B
                8'h08: PRDATA = {{16{mult_result[15]}}, mult_result}; // Đọc Kết quả (mở rộng bit dấu sign-extension lên 32-bit)
                default: PRDATA = 32'd0;
            endcase
        end
    end

    // Module này xử lý xong trong 1 chu kỳ clock, nên PREADY luôn báo sẵn sàng
    assign PREADY  = 1'b1; 
    assign PSLVERR = 1'b0; // Không thiết kế bẫy lỗi ở đây

endmodule