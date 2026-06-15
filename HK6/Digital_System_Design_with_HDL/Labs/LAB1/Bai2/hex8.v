module hex8 (
	input [17:15] SW,
	output [6:0] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0
);

    wire [2:0] m0, m1, m2, m3, m4, m5, m6, m7;
    
	wire [2:0] H  = 3'b000;
	wire [2:0] E  = 3'b001;
	wire [2:0] L1 = 3'b010; 
	wire [2:0] L2 = 3'b011; 
	wire [2:0] O  = 3'b100;
	wire [2:0] X  = 3'b111; 
	 
	 Mux81_3bit mux7 (SW, X, X, X, H, E, L1, L2, O, m7);
	 Mux81_3bit mux6 (SW, X, X, H, E, L1, L2, O, X, m6);
	 Mux81_3bit mux5 (SW, X, H, E, L1, L2, O, X, X, m5);
	 Mux81_3bit mux4 (SW, H, E, L1, L2, O, X, X, X, m4);
	 Mux81_3bit mux3 (SW, E, L1, L2, O, X, X, X, H, m3);
	 Mux81_3bit mux2 (SW, L1, L2, O, X, X, X, H, E, m2);
	 Mux81_3bit mux1 (SW, L2, O, X, X, X, H, E, L1, m1);
	 Mux81_3bit mux0 (SW, O, X, X, X, H, E, L1, L2, m0);
	 
	 Decoder_7segments dec7 (m7, HEX7);
	 Decoder_7segments dec6 (m6, HEX6);
	 Decoder_7segments dec5 (m5, HEX5);
	 Decoder_7segments dec4 (m4, HEX4);
	 Decoder_7segments dec3 (m3, HEX3);
	 Decoder_7segments dec2 (m2, HEX2);
	 Decoder_7segments dec1 (m1, HEX1);
	 Decoder_7segments dec0 (m0, HEX0);
	 
endmodule
	 