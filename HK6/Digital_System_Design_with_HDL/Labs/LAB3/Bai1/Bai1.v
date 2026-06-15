module Bai1 (
	input wire [3:0] KEY, 		//rst_n, clk
	input wire [17:0] SW,
	output reg [8:0] LEDG
);

	parameter 	S = 4'd0,
					S_1 = 4'd1,
					S_11 = 4'd2,
					S_111 = 4'd3,
					S_1111 = 4'd4,
					S_0 = 4'd5,
					S_00 = 4'd6,
					S_000 = 4'd7,
					S_0000 = 4'd8;
	
	reg [3:0] state, next_state;
	
	always @ (posedge KEY[0] or negedge KEY[1]) begin
		if (!KEY[1])
			state <= S;
		else
			state <= next_state;
	end
	
	always @ (*) begin
		case (state)
			S: next_state = SW[0] ? S_1 : S_0;
			S_1: next_state = SW[0] ? S_11 : S_0;
			S_11: next_state = SW[0] ? S_111 : S_0;
			S_111: next_state = SW[0] ? S_1111 : S_0;
			S_1111: next_state = SW[0] ? S_1111 : S_0;
			S_0: next_state = SW[0] ? S_1 : S_00;
			S_00: next_state = SW[0] ? S_1 : S_000;
			S_000: next_state = SW[0] ? S_1: S_0000;
			S_0000: next_state = SW[0] ? S_1 : S_0000;
			default: next_state = S;
		endcase
	end
	
	always @ (*) begin
		LEDG[0] = (state == S_1111) || (state == S_0000);
	end
endmodule

		