`timescale 1ns/1ps

module tb_ram_self_checking();
    reg clk, cs, wr_e, oe;
    reg [6:0] addr;
    reg [7:0] data_in;    
    wire [7:0] data;

    single_port_RAM uut (
        .clk(clk), .cs(cs), .wr_e(wr_e), 
        .oe(oe), .addr(addr), .data(data)
    );

    assign data = (cs && wr_e) ? data_in : 8'bz;

    always #5 clk = ~clk;

    task check_result(input [7:0] expected);
        begin
            #1;
            if (data === expected)
                $display("[PASS] Time: %t | Addr: %h | Data: %h", $time, addr, data);
            else
                $display("[FAIL] Time: %t | Addr: %h | Got: %h | Exp: %h", $time, addr, data, expected);
        end
    endtask

    initial begin
        clk = 0; cs = 0; wr_e = 0; oe = 0; addr = 0; data_in = 0;
        #10;

        cs = 1; wr_e = 0; oe = 1; addr = 7'h55; 
        #10; 
        check_result(8'hxx); 

        cs = 0; wr_e = 1; addr = 7'h01; data_in = 8'hFF; 
        #10; 
        wr_e = 0; cs = 1; oe = 1; addr = 7'h01;
        #10; 
        check_result(8'hxx); 

        cs = 1; wr_e = 1; addr = 7'd127; data_in = 8'hEE;
        #10; 
        wr_e = 0; 
        #10; 
        check_result(8'hEE);

        cs = 1; wr_e = 0; oe = 0; addr = 7'd127;
        #10; 
        check_result(8'hzz); 

        wr_e = 1; oe = 1; addr = 7'h00; data_in = 8'h11;
        #10; 
        addr = 8'h80; data_in = 8'h99; 
        #10; 
        wr_e = 0; addr = 7'h00;
        #10; 
        check_result(8'h99); 

        #20;
        $stop; 
    end

endmodule