module clock_1s (
    input wire CLOCK_50,    
    output reg clk_1Hz     
);
    reg [24:0] counter = 25'd0; 

    always @(posedge CLOCK_50) begin
        if (counter == 25'd24_999_999) begin
            counter <= 25'd0;      
            clk_1Hz <= ~clk_1Hz;   
        end
        else begin
            counter <= counter + 1'b1;
        end
    end
	
endmodule
