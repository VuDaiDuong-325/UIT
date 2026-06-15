module counter_4bit_behav (
	input wire enable, clock, clear,
	output reg [3:0] q 
);

always @(posedge clock or negedge clear) begin 
	if (clear == 0) begin 
		q <= 4'd0;
	end
	else if (enable) begin
		q <= q + 1;
	end
end
endmodule
