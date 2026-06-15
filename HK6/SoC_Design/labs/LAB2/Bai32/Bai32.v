module Bai32 (
    input              CLOCK_50,    
    input      [0:0]   KEY,         
    input      [3:0]   SW,          
    output     [6:0]   HEX0         
);

    system Nios_system (
        .clk_clk                           (CLOCK_50),  
        .reset_reset_n                     (KEY[0]),    
        .switches_0_conduit_end_export     (SW),        
        .decoder_7_seg_0_conduit_end_export    (HEX0)       
    );

endmodule
