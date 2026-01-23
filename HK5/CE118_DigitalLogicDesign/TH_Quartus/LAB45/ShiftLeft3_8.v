module ShiftLeft3_8 ( 
    input [7:0] I,
    output [7:0] O     
);
    assign O = I << 3;
    
endmodule