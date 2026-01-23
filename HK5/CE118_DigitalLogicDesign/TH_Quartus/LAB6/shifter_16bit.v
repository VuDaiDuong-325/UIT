module shifter_16bit (
    input  [15:0] I,
    input  [4:0]  shamt,      
    input         shift_type, 
    output [15:0] O
);
    assign O = (shamt >= 5'd16) ? 16'd0 : 
                      (shift_type == 1'b0) ? (I << shamt) : (I >> shamt);
endmodule