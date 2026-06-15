module Mux21_3bit (
    input [2:0] x, y,
    input s,
    output [2:0] m
);
    Mux21_1bit b0 (x[0], y[0], s, m[0]);
    Mux21_1bit b1 (x[1], y[1], s, m[1]);
    Mux21_1bit b2 (x[2], y[2], s, m[2]);
endmodule

module Mux81_3bit (
    input [2:0] s,
    input [2:0] d0, d1, d2, d3, d4, d5, d6, d7,
    output [2:0] q
);
    wire [2:0] m01, m23, m45, m67;
    wire [2:0] m03, m47;

    Mux21_3bit stage1_0 (d0, d1, s[0], m01);
    Mux21_3bit stage1_1 (d2, d3, s[0], m23);
    Mux21_3bit stage1_2 (d4, d5, s[0], m45);
    Mux21_3bit stage1_3 (d6, d7, s[0], m67);

    Mux21_3bit stage2_0 (m01, m23, s[1], m03);
    Mux21_3bit stage2_1 (m45, m67, s[1], m47);

    Mux21_3bit stage3 (m03, m47, s[2], q);
endmodule