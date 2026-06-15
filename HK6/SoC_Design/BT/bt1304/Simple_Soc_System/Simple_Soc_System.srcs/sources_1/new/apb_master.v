module apb_master (
    input  wire        PCLK,
    input  wire        PRESETn,

    // Giao diện điều khiển (User Interface)
    input  wire        start_write,
    input  wire        start_read,
    input  wire [7:0]  addr_in,
    input  wire [31:0] data_in,
    output reg  [31:0] data_out,
    output reg         done,

    // Giao diện APB Bus (Kết nối tới Slave)
    output reg  [7:0]  PADDR,
    output reg         PSEL,
    output reg         PENABLE,
    output reg         PWRITE,
    output reg  [31:0] PWDATA,
    input  wire [31:0] PRDATA,
    input  wire        PREADY
);

    // State Machine
    localparam IDLE   = 2'b00;
    localparam SETUP  = 2'b01;
    localparam ACCESS = 2'b10;

    reg [1:0] state;

    always @(posedge PCLK or negedge PRESETn) begin
        if (!PRESETn) begin
            state   <= IDLE;
            PSEL    <= 0;
            PENABLE <= 0;
            done    <= 0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    if (start_write || start_read) begin
                        state  <= SETUP;
                        PADDR  <= addr_in;
                        PSEL   <= 1;
                        PWRITE <= start_write;
                        PWDATA <= data_in;
                    end
                end

                SETUP: begin
                    state   <= ACCESS;
                    PENABLE <= 1; // Chu kỳ thứ 2: Kích hoạt Enable
                end

                ACCESS: begin
                    if (PREADY) begin
                        if (!PWRITE) data_out <= PRDATA; // Lưu dữ liệu nếu là lệnh đọc
                        PSEL    <= 0;
                        PENABLE <= 0;
                        done    <= 1;
                        state   <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule