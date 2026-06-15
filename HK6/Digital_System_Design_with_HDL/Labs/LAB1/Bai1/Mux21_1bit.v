module Mux21_1bit (
	input wire x, y, s,
	output wire m
);

assign m = s ? y : x;

endmodule


