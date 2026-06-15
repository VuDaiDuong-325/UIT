module D_LF (
	input D, Clock,
	output wire Qa, Qan, Qb, Qbn, Qc, Qcn
);

	D_latch d1 (D, Clock, Qa, Qan);
	D_FF d2 (D, Clock, Qb, Qbn);
	D_FF d3 (D, ~Clock, Qc, Qcn);
	
endmodule