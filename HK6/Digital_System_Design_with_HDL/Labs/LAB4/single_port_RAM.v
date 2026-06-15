module single_port_RAM (
	input clk, cs, wr_e, oe, 
	input [6:0] addr,
	inout [7:0] data
);

	reg [7:0] mem [127:0];
	reg [7:0] d_out_r;
	
	always @(posedge clk) begin
		if (cs) begin
			if (wr_e)
				mem[addr] <= data;
			else 
				d_out_r <= mem[addr];
		end
	end
	
	assign data = (cs && !wr_e && oe) ? d_out_r : 8'bz;
endmodule
