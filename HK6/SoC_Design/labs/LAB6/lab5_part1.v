module lab5_part1 (
	input CLOCK_50,
	input [0:0] KEY,
	output LCD_RW,
	output LCD_EN,
	output LCD_RS,
	output LCD_ON,
	output LCD_BLON,
	output [7:0] LCD_DATA
);

	system u0 (
		.clk_clk (CLOCK_50),
		.reset_reset_n (KEY[0]),
		.lcd_on_export (LCD_ON),
		.lcd_blon_export (LCD_BLON),
		.lcd_en_export (LCD_EN),
		.lcd_rw_export (LCD_RW),
		.lcd_rs_export (LCD_RS),
		.lcd_d_export (LCD_DATA)
	);
endmodule
