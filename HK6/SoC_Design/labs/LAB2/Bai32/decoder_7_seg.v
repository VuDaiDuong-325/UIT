module decoder_7_seg (
    input              iClk,
    input              iReset_n,
    input              iChip_select_n,
    input              iWrite_n,
    input      [31:0]  iWrite_data,    
    output reg [6:0]   oHEX_physical   
);
    always @(posedge iClk or negedge iReset_n) begin
        if (~iReset_n)
            oHEX_physical <= 7'b1111111; 
        else if (~iChip_select_n && ~iWrite_n) begin
            case (iWrite_data[3:0])
                4'h0: oHEX_physical <= 7'b1000000;
                4'h1: oHEX_physical <= 7'b1111001;
                4'h2: oHEX_physical <= 7'b0100100;
                4'h3: oHEX_physical <= 7'b0110000;
                4'h4: oHEX_physical <= 7'b0011001;
                4'h5: oHEX_physical <= 7'b0010010;
                4'h6: oHEX_physical <= 7'b0000010;
                4'h7: oHEX_physical <= 7'b1111000;
                4'h8: oHEX_physical <= 7'b0000000;
                4'h9: oHEX_physical <= 7'b0010000;
                4'hA: oHEX_physical <= 7'b0001000;
                4'hB: oHEX_physical <= 7'b0000011;
                4'hC: oHEX_physical <= 7'b1000110;
                4'hD: oHEX_physical <= 7'b0100001;
                4'hE: oHEX_physical <= 7'b0000110;
                4'hF: oHEX_physical <= 7'b0001110;
                default: oHEX_physical <= 7'b1111111;
            endcase
        end
    end
endmodule

