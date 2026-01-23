module Decoder2to4 (
	 input E,
    input  [1:0] Select,  
    output reg [3:0] Y     
);

    always @* begin
	 
        if (E == 1'b0) 	begin
				Y = 4'b0000;
			end
        else begin 
				Y = 4'b0000;
			  case (Select)
					2'b00: Y[0] = 1; 
					
					2'b01: Y[1] = 1; 
					
					2'b10: Y[2] = 1; 
					
					2'b11: Y[3] = 1; 
					
					default: Y = 4'bxxxx; 
			  endcase
		  end
    end
    
endmodule