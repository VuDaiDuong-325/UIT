module ALU_32bit (
	input [31:0] a, b,
	input [1:0] s,
	input m,
	output reg [31:0] out
);

	always @(*) begin
		case({m, s[1], s[0]})
			3'b000: out = ~a;
			3'b001: out = a&b;
			3'b010: out = a^b;
			3'b011: out = a|b;
			3'b100: out = a-1;
			3'b101: out = a+b;
			3'b110: out = a-b;
			3'b111: out = a+1;
			default: out = 32'b0;
		endcase
	end 
endmodule
