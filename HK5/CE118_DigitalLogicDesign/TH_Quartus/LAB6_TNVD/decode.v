//======================================================
//  Module: decoder5to32
//  Chức năng: Giải mã 5 bit đầu vào thành 32 đầu ra one-hot
//  Không có tín hiệu Enable
//======================================================

module decoder5to32 (
    input  [4:0] A,        // Đầu vào 5 bit
    output reg [31:0] Y    // Đầu ra 32 bit
);

    always @(*) begin
        // Tất cả đầu ra = 0
        Y = 32'b0;
        // Gán bit tương ứng với giá trị A = 1
        Y[A] = 1'b1;
    end

endmodule
