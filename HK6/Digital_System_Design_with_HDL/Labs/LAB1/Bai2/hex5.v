module hex5 (
    input [17:15] SW,
    output [6:0] HEX4, HEX3, HEX2, HEX1, HEX0
);
    wire [2:0] m0, m1, m2, m3, m4;
    
	wire [2:0] H  = 3'b000;
	wire [2:0] E  = 3'b001;
	wire [2:0] L1 = 3'b010; 
	wire [2:0] L2 = 3'b011; 
	wire [2:0] O  = 3'b100;
	wire [2:0] X  = 3'b111; 

    Mux51_3bit mux4 (SW, H, E, L1, L2, O, m4);
    Mux51_3bit mux3 (SW, E, L1, L2, O, H, m3);
    Mux51_3bit mux2 (SW, L1, L2, O, H, E, m2);
    Mux51_3bit mux1 (SW, L2, O, H, E, L1, m1);
    Mux51_3bit mux0 (SW, O, H, E, L1, L2, m0);
    
    Decoder_7segments dec4(m4, HEX4);
    Decoder_7segments dec3(m3, HEX3);
    Decoder_7segments dec2(m2, HEX2);
    Decoder_7segments dec1(m1, HEX1);
    Decoder_7segments dec0(m0, HEX0);
    
endmodule
