module memory_32x128 (
    input iClk,
    input iReset_n,
    input iChipSelect_n,
    input iRead_n,
    input iWrite_n,
    input [6:0] iAddress,  // 7 bits để quản lý 128 ô nhớ
    input [31:0] iData,
    output [31:0] oData
);

    // Tín hiệu dữ liệu từ hai khối 32x64
    wire [31:0] data_bank0, data_bank1;
    
    
    reg addr_msb_reg;

    
    // Khối 0 hoạt động khi địa chỉ bit 6 = 0, Khối 1 khi bit 6 = 1
    wire cs0_n = iChipSelect_n | iAddress[6];       
    wire cs1_n = iChipSelect_n | (~iAddress[6]);    

    // Khởi tạo khối Memory 0 (Địa chỉ 0 đến 63)
    Memory #(
        .DATA_WIDTH(32),
        .ADDRESS_WIDTH(6)
    ) bank0 (
        .iClk(iClk),
        .iReset_n(iReset_n),
        .iChipSelect_n(cs0_n),
        .iRead_n(iRead_n),
        .iWrite_n(iWrite_n),
        .iAddress(iAddress[5:0]), // Dùng 6 bit thấp
        .iData(iData),
        .oData(data_bank0)
    );

    // Khởi tạo khối Memory 1 (Địa chỉ 64 đến 127)
    Memory #(
        .DATA_WIDTH(32),
        .ADDRESS_WIDTH(6)
    ) bank1 (
        .iClk(iClk),
        .iReset_n(iReset_n),
        .iChipSelect_n(cs1_n),
        .iRead_n(iRead_n),
        .iWrite_n(iWrite_n),
        .iAddress(iAddress[5:0]), // Dùng 6 bit thấp
        .iData(iData),
        .oData(data_bank1)
    );

    always @(posedge iClk) begin
        if (~iChipSelect_n & ~iRead_n) begin
            addr_msb_reg <= iAddress[6];
        end
    end

    assign oData = (addr_msb_reg == 1'b0) ? data_bank0 : data_bank1;

endmodule