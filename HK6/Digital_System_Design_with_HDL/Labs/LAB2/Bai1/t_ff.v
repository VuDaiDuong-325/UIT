module t_ff (
	input wire t, clk, clear_n,
	output reg q
);

always @(posedge clk or negedge clear_n) begin
	if (clear_n == 0) begin 
		q <= 1'b0;
	end 
	else if (t) begin 
		q <= ~q;
	end
end
endmodule

