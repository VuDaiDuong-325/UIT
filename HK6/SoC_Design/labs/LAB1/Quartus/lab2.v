module lab2
(
    input           CLOCK_50,
    input   [0:0]   KEY,
    input   [3:0]  SW,
    output  [6:0]  HEX0
);

system nios_system(
    .clk_clk                            (CLOCK_50),
    .reset_reset_n                      (KEY[0]),
    .switch_external_connection_export  (SW[3:0]),
    .pio_hex_external_connection_export     (HEX0)
);

endmodule