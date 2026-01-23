module SignExtend (
    input  [15:0] inst_15_0, 
    output [31:0] data_32    
);
    assign data_32 = { {16{inst_15_0[15]}}, inst_15_0 };

endmodule
