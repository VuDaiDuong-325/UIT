module BCD_counter_1s (
	input wire CLOCK_50, 
	input wire [1:0] KEY,
	output wire [6:0] HEX0
);

	wire clk_1s;
	wire [3:0] bcd;
	
	clock_1s clk (CLOCK_50, clk_1s);
	BCD_counter cnt (clk_1s, KEY[0], bcd);
	bcd_4bit_to_led7 decoder (bcd, HEX0);
endmodule
