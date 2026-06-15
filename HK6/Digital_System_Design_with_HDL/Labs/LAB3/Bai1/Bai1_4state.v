module Bai1_4state (
	input wire [1:0] KEY, 		// KEY[1]: rst_n, KEY[0]: clk
	input wire [0:0] SW,        
	output reg [0:0] LEDG       
);

	parameter 	S0 = 2'd0,
					S1 = 2'd1,
					S2 = 2'd2,
					S3 = 2'd3;
					
	reg [1:0] state, next_state;
	reg pre_val;              
	
	wire clk = KEY[0];
	wire rst_n = KEY[1];
	

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			state <= S0;
			pre_val <= 1'b0;
		end
		else begin             
			state <= next_state;
			pre_val <= SW[0];
		end
	end
	
	always @(*) begin
		next_state = state;
		LEDG[0] = 1'b0;
		
		case (state)
			S0: begin
				next_state = S1;
			end
			S1: begin
				if (SW[0] == pre_val)
					next_state = S2;
				else 
					next_state = S1;
			end
			S2: begin
				if (SW[0] == pre_val)
					next_state = S3;
				else 
					next_state = S1;
			end
			S3: begin
				if (SW[0] == pre_val) begin
					next_state = S3;
					LEDG[0] = 1'b1;
				end
				else begin
					next_state = S1;
				end
			end
			default: next_state = S0; 
		endcase
	end
endmodule
