module BCD_counter_2digit (
	input wire clk, reset_n,
	output reg [3:0] ones, tens
);
	always @(posedge clk or negedge reset_n) begin 
		if (!reset_n) begin
			ones <= 4'd0;
			tens <= 4'd0;
		end
		else begin
			if (tens == 4'd2 && ones == 4'd0) begin 
				tens <= 4'd0;
				ones <= 4'd0;
			end
			else begin
				if (ones == 4'd9) begin 
					ones <= 4'd0;
					tens <= tens + 1'b1;
				end
				else 
					ones <= ones + 1'b1;
			end
		end
	end
endmodule
