module sram_controller (
    input  [17:0] SW,        // SW[15:8]: Address, SW[7:0]: Data_in
    input  [1:0]  KEY,       // KEY[0]: Write Enable (Active Low)
    output [17:0] SRAM_ADDR, 
    inout  [15:0] SRAM_DQ,   
    output        SRAM_WE_N, SRAM_OE_N, SRAM_CE_N, SRAM_LB_N, SRAM_UB_N,
    output [6:0]  HEX0, HEX1, HEX2, HEX3
);

    assign SRAM_CE_N = 1'b0; 
    assign SRAM_LB_N = 1'b0; 
    assign SRAM_UB_N = 1'b0; 

    assign SRAM_WE_N = KEY[1];
	 assign SRAM_OE_N = KEY[0];

    assign SRAM_ADDR = {10'b0, SW[15:8]};


	 
    assign SRAM_DQ = (~SRAM_WE_N) ? {8'h00, SW[7:0]} : 16'bz;

    bcd_4bit_to_led7 h0 (SRAM_DQ[3:0],   HEX0);
    bcd_4bit_to_led7 h1 (SRAM_DQ[7:4],   HEX1);
    bcd_4bit_to_led7 h2 (SRAM_DQ[11:8],  HEX2);
    bcd_4bit_to_led7 h3 (SRAM_DQ[15:12], HEX3);

endmodule