module Mux51_3bit (
	input wire [2:0] s, U, V, W, X, Y,
	output wire [2:0] M
);

Mux51_1bit bit0 (s, U[0], V[0], W[0], X[0], Y[0], M[0]);
Mux51_1bit bit1 (s, U[1], V[1], W[1], X[1], Y[1], M[1]);
Mux51_1bit bit2 (s, U[2], V[2], W[2], X[2], Y[2], M[2]);

endmodule

