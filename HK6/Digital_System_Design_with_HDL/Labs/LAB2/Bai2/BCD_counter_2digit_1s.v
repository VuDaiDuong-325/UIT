module BCD_counter_2digit_1s (
	input wire CLOCK_50,
	input wire [1:0] KEY,
	output wire [6:0] HEX0, HEX1
);
	wire clk_1s;
	wire [3:0] ones, tens;
	
	clock_1s clk (CLOCK_50, clk_1s);
	BCD_counter_2digit cnt (clk_1s, KEY[0], ones, tens);
	bcd_4bit_to_led7 l0 (ones, HEX0);
	bcd_4bit_to_led7 l1 (tens, HEX1);
	
endmodule
