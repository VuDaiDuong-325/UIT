module BCD_counter (
	input wire clk, reset_n,
	output reg [3:0] bcd
);

	always @(posedge clk or negedge reset_n) begin 
		if (!reset_n) begin
			bcd <= 4'b0000;
		end
		else begin
			if (bcd >= 4'b1001) begin 
				bcd <= 4'b0000;
			end
			else begin
				bcd <= bcd + 1'b1;
			end
		end
	end
endmodule

		