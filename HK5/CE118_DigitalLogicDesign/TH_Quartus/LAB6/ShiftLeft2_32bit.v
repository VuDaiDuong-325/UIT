module ShiftLeft2_32bit (
    input  [31:0] I,  
    output [31:0] O  
);
    assign O = {I[29:0], 2'b00};

endmodule