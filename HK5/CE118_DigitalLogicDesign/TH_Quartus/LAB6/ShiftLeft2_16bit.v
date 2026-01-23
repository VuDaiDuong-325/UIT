module ShiftLeft2_16bit (
    input  [15:0] I,  
    output [15:0] O  
);
    assign O = {I[13:0], 2'b00};

endmodule
