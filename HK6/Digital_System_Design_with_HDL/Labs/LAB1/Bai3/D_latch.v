module D_latch (
	input D, Clk,
	output wire Qa, Qb
);

	assign Qa = ~( ~(D & Clk) & Qb );
   assign Qb = ~( ~(~D & Clk) & Qa );

endmodule
