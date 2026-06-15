module Bai2 (
	input CLOCK_50,
	input [0:0] KEY,
	output wire [2:0] LEDG, LEDR
);

	wire clk_1s;
	
	clock_1s u_clock_1s (
		CLOCK_50,
		clk_1s
	);
	
	traffic_light u_traffic_light (
		clk_1s,
		KEY[0],
		LEDG,
		LEDR
	);
	
endmodule 