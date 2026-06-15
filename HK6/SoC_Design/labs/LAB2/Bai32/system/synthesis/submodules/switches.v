module switches (
    input              iClk,
    input              iReset_n,
    input              iChip_select_n,
    input              iRead_n,
    input      [31:0]  iSwitches_data, // Nối với chân SW vật lý (Conduit)
    output reg [31:0]  oRead_data      // Trả về bus dữ liệu Avalon
);
    always @(posedge iClk or negedge iReset_n) begin
        if (~iReset_n)
            oRead_data <= 32'd0;
        else if (~iChip_select_n && ~iRead_n)
            oRead_data <= iSwitches_data;
    end
endmodule