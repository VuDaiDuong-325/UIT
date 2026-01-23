module Control_Unit (
    // --- Inputs (Giữ nguyên) ---
    input  wire       START,      // 1: Run, 0: Reset
    input  wire [5:0] Opcode,     // Mã lệnh [31:26]
    input  wire       Zero,       // Cờ Zero từ ALU (dùng cho Branch)

    // --- Outputs (Giữ nguyên) ---
    output reg        CLR,        // Reset PC
    output reg        PCSrc,      // 0: PC+4, 1: Branch Target
    output reg        RegDst,     // 0: rt, 1: rd
    output reg        RegWrite,   // 1: Ghi thanh ghi
    output reg        ALUSrc,     // 0: ReadData2, 1: Immediate
    output reg [1:0]  ALUOp,      // 2-bit mã điều khiển ALU
    output reg        MemWrite,   // 1: Ghi RAM
    output reg        MemRead,    // 1: Đọc RAM
    output reg        MemtoReg    // 0: Từ ALU, 1: Từ Memory
);

    // --- 1. Định nghĩa Opcode (Theo bảng của bạn) ---
    localparam OP_R_TYPE = 6'h00; // add, sub, and, or, nor, sll, srl
    
    // Lệnh I-Type tính toán
    localparam OP_ADDI   = 6'h08;
    localparam OP_ANDI   = 6'h0C; // Lệnh mới thêm
    localparam OP_ORI    = 6'h0D;
    
    // Lệnh Memory
    localparam OP_LW     = 6'h23;
    localparam OP_SW     = 6'h2B;
    
    // Lệnh Rẽ nhánh
    localparam OP_BEQ    = 6'h04;
    localparam OP_BNE    = 6'h05;

    // --- 2. Logic Điều khiển ---
    always @(*) begin
        // Gán mặc định để tránh Latch (Default state)
        CLR      = 0;
        PCSrc    = 0;
        RegDst   = 0;
        RegWrite = 0;
        ALUSrc   = 0;
        ALUOp    = 2'b00;
        MemWrite = 0;
        MemRead  = 0;
        MemtoReg = 0;

        // Logic Reset
        if (START == 0) begin
            CLR = 1; // Reset PC về 0
            // Các tín hiệu Write giữ ở 0
        end 
        else begin
            // Logic Run
            case (Opcode)
                // --- Nhóm R-Type ---
                // (add, sub, and, or, nor, sll, srl)
                // Main Controller chỉ cần biết Opcode=0, việc phân biệt Funct do ALU Control lo.
                OP_R_TYPE: begin
                    RegDst   = 1;       // Ghi vào rd
                    RegWrite = 1;       // Có ghi
                    ALUOp    = 2'b10;   // Code 10: R-Type (Check Funct)
                end

                // --- Nhóm Load/Store/Addi (Dùng phép CỘNG) ---
                OP_LW: begin
                    ALUSrc   = 1;       // Offset
                    MemtoReg = 1;       // Từ Mem
                    RegWrite = 1;
                    MemRead  = 1;       // Đọc Mem
                    ALUOp    = 2'b00;   // Code 00: Cộng
                end

                OP_SW: begin
                    ALUSrc   = 1;       // Offset
                    MemWrite = 1;       // Ghi Mem
                    ALUOp    = 2'b00;   // Code 00: Cộng
                end

                OP_ADDI: begin
                    ALUSrc   = 1;       // Immediate
                    RegWrite = 1;
                    ALUOp    = 2'b00;   // Code 00: Cộng
                end

                // --- Nhóm Logic Immediate (ANDI, ORI) ---
                OP_ANDI: begin
                    ALUSrc   = 1;       // Immediate (Zero-extended)
                    RegWrite = 1;
                    ALUOp    = 2'b11;   // Code 11: Logic Imm (AND)
                end

                OP_ORI: begin
                    ALUSrc   = 1;       // Immediate (Zero-extended)
                    RegWrite = 1;
                    ALUOp    = 2'b11;   // Code 11: Logic Imm (OR)
                end

                // --- Nhóm Branch (Dùng phép TRỪ) ---
                OP_BEQ: begin
                    ALUOp = 2'b01;      // Code 01: Trừ
                    if (Zero == 1) PCSrc = 1; // Nhảy nếu Bằng (Zero=1)
                end

                OP_BNE: begin
                    ALUOp = 2'b01;      // Code 01: Trừ
                    if (Zero == 0) PCSrc = 1; // Nhảy nếu Khác (Zero=0)
                end

                default: begin
                    // Các lệnh không xác định -> Giữ nguyên mặc định (An toàn)
                end
            endcase
        end
    end

endmodule
