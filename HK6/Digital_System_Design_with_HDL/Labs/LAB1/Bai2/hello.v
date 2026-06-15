module hello (
    input wire [17:0] SW,
    output wire [6:0] HEX0
);
    wire [2:0] MuxOut;

    Mux51_3bit mux1 (
        SW[17:15], 
        SW[14:12], 
        SW[11:9],  
        SW[8:6],   
        SW[5:3],   
        SW[2:0],   
        MuxOut     
    );

    Decoder_7segments de1 (
        MuxOut, 
        HEX0
    );
    
endmodule