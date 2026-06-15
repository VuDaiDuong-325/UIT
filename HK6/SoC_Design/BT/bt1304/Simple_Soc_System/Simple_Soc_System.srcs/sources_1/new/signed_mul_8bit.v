module signed_multiplier_8bit (
    input  wire signed [7:0] a,
    input  wire signed [7:0] b,
    output wire signed [15:0] p
);
    assign p = a * b;
endmodule