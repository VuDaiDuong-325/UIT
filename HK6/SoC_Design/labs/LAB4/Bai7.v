module Bai7( 
    input CLOCK_50, 
    input [0:0] KEY,      
    input [5:0] SW,         
    output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
); 

    wire [31:0] hex_ms_wire;
    wire [15:0] hex_h_wire;

    assign HEX0 = ~hex_ms_wire[6:0];   
    assign HEX1 = ~hex_ms_wire[14:8];  
    assign HEX2 = ~hex_ms_wire[22:16]; 
    assign HEX3 = ~hex_ms_wire[30:24]; 

    assign HEX4 = ~hex_h_wire[6:0];   
    assign HEX5 = ~hex_h_wire[14:8];  

    system Nios_system( 
        .clk_clk                 	(CLOCK_50), 
        .reset_reset_n           	(KEY[0]),
        .pio_sw_export_export		   (SW),
        .pio_hex_ms_export_export	(hex_ms_wire),  
        .pio_hex_h_export_export	  	(hex_h_wire)   
    ); 
endmodule
