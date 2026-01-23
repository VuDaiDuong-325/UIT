module ShiftLeft1_8 ( 
    input [7:0] I,
    output [7:0] O     
);
    assign O = I << 1;
    
endmodule
