module BCD_counter_posedge_clk (
	input wire 		[3:0]		KEY,
	output wire		[6:0] 	HEX0
);

	wire [3:0] bcd;
	BCD_counter cnt (KEY[3], KEY[0], bcd);
	bcd_4bit_to_led7 decoder (bcd, HEX0);

endmodule
