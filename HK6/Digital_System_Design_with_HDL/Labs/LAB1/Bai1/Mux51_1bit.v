module Mux51_1bit (
	input wire [2:0] s,
	input wire u, v, w, x, y,
	output wire m
);
wire uv, wx, uvwx;
Mux21_1bit mux1 (u, v, s[0], uv);
Mux21_1bit mux2 (w, x, s[0], wx);
Mux21_1bit mux3 (uv, wx, s[1], uvwx);
Mux21_1bit mux4 (uvwx, y, s[2], m);

endmodule


