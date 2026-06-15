module counter_4bit_const (
	input wire enable, clock, clear,
	output wire [3:0] q
);
	wire t1, t2, t3;
	
	assign t1 = q[0] & enable;
	assign t2 = q[1] & t1;
	assign t3 = q[2] & t2;
	
	t_ff tff0 (enable, clock, clear, q[0]);
	t_ff tff1 (t1, clock, clear, q[1]);
	t_ff tff2 (t2, clock, clear, q[2]);
	t_ff tff3 (t3, clock, clear, q[3]);
	
	endmodule
	