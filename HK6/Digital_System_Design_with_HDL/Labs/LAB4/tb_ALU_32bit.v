`timescale 1ns / 1ps
module tb_ALU_32bit;

reg [31:0] a;
reg [31:0] b;
reg [1:0] s;
reg m;
wire [31:0] out;

ALU_32bit u_ALU (
	a, b,
	s,
	m,
	out
);

initial begin 
	$display("Time	|	M	S1	S0	|	A				|	B				|	Out");
	$monitor("%4t	|	%b	%b	%b	|	%32b	|	%32b	|	%32b", $time, m, s[1], s[0], a, b, out);
end

initial begin
	a = 32'd20; b = 32'd10;
	m = 1'b0; s = 2'b00;
	
	#20;
	m = 1'b0; s = 2'b01;
	
	#20; 
	m = 1'b0; s = 2'b10;
	
	#20;
	m = 1'b0; s = 2'b11;
	
	#20; 
	m = 1'b1; s = 2'b00;
	
	#20; 
	m = 1'b1; s = 2'b01;
	
	#20; 
	m = 1'b1; s = 2'b10;
	
	#20; 
	m = 1'b1; s = 2'b11;
	
	#20;
	$finish;
end
endmodule
