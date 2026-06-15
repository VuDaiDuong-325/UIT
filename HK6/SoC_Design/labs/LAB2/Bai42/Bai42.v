module Bai42 (
    input              CLOCK_50,
    input      [0:0]   KEY,
    input      [11:0]  SW,      
    output     [7:0]   LEDG     
);

    system nios_system (
        .clk_clk                           (CLOCK_50),
        .reset_reset_n                     (KEY[0]),
        
        .switches_0_conduit_end_export     (SW),
        
        .ledg_0_conduit_end_export         (LEDG)
    );

endmodule
