module Decoder_7segments(
    input [17:15] SW, 
    output wire [6:0] HEX0
);
    assign HEX0[0] = (SW == 3'b001 || SW == 3'b100) ? 1'b0 : 1'b1;

    assign HEX0[1] = (SW == 3'b000 || SW == 3'b100) ? 1'b0 : 1'b1;

    assign HEX0[2] = (SW == 3'b000 || SW == 3'b100) ? 1'b0 : 1'b1;

    assign HEX0[3] = (SW == 3'b001 || SW == 3'b010 || SW == 3'b011 || SW == 3'b100) ? 1'b0 : 1'b1;

    assign HEX0[4] = (SW <= 3'b100) ? 1'b0 : 1'b1;

    assign HEX0[5] = (SW <= 3'b100) ? 1'b0 : 1'b1;

    assign HEX0[6] = (SW == 3'b000 || SW == 3'b001) ? 1'b0 : 1'b1;

endmodule