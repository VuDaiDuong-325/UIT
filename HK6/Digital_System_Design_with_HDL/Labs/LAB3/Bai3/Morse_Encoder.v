module Morse_Encoder #(
    parameter CLK_FREQ = 50_000_000 
)(
    input  wire       CLOCK_50, // Xung clock hệ thống
    input  wire [1:0] KEY,      // KEY[0]: Reset, KEY[1]: Start
    input  wire [2:0] SW,       // SW[2:0]: Chọn chữ cái
    output reg  [0:0] LEDR      // LEDR[0]: Ngõ ra mã Morse
);

    wire clk = CLOCK_50;
    wire rst_n = KEY[0]; 

    reg [2:0] key_sync;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            key_sync <= 3'b000;
        else
            key_sync <= {key_sync[1:0], ~KEY[1]}; 
    end
	 
    wire start_pulse = key_sync[1] & ~key_sync[2];

    reg [7:0] load_sym;
    always @(*) begin
        case(SW)
            3'b000: load_sym = 8'b01_10_00_00; // A: .-
            3'b001: load_sym = 8'b10_01_01_01; // B: -...
            3'b010: load_sym = 8'b10_01_10_01; // C: -.-.
            3'b011: load_sym = 8'b10_01_01_00; // D: -..
            3'b100: load_sym = 8'b01_00_00_00; // E: .
            3'b101: load_sym = 8'b01_01_10_01; // F: ..-.
            3'b110: load_sym = 8'b10_10_01_00; // G: --.
            3'b111: load_sym = 8'b01_01_01_01; // H: ....
        endcase
    end

    localparam IDLE = 3'd0,
               READ = 3'd1,
               DOT  = 3'd2,
               DASH = 3'd3,
               GAP  = 3'd4;

    reg [2:0] state;
    reg [7:0] sym_reg; 
    reg [1:0] dash_cnt; 

    // timer 0.5s
    localparam TICK_MAX = (CLK_FREQ / 2) - 1; 
    reg [25:0] timer;
    wire tick = (timer == TICK_MAX);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            sym_reg <= 8'd0;
            dash_cnt <= 2'd0;
            timer <= 26'd0;
            LEDR <= 1'b0;
        end else begin
            if (state == IDLE || tick) timer <= 26'd0;
            else timer <= timer + 1'b1;

            case (state)
                IDLE: begin
                    LEDR <= 1'b0;
                    if (start_pulse) begin
                        sym_reg <= load_sym;
                        state <= READ;
                    end
                end

                READ: begin
                    if (sym_reg[7:6] == 2'b00) begin
                        state <= IDLE; // Hết ký hiệu
                    end else if (sym_reg[7:6] == 2'b01) begin
                        state <= DOT;
                    end else if (sym_reg[7:6] == 2'b10) begin
                        dash_cnt <= 2'd2; 
                        state <= DASH;
                    end
                end

                DOT: begin
                    LEDR <= 1'b1;
                    if (tick) state <= GAP;
                end

                DASH: begin
                    LEDR <= 1'b1;
                    if (tick) begin
                        if (dash_cnt == 2'd0) state <= GAP;
                        else dash_cnt <= dash_cnt - 1'b1;
                    end
                end

                GAP: begin
                    LEDR <= 1'b0;
                    if (tick) begin
                        sym_reg <= {sym_reg[5:0], 2'b00}; // Dịch trái 2 bit để lấy ký hiệu tiếp theo
                        state <= READ;
                    end
                end
                
                default: state <= IDLE;
            endcase
        end
    end

endmodule
