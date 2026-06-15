module m_proc1(w_clk);
  input wire w_clk;
  wire [31:0] w_npc, w_ir, w_r1, w_r2, w_rt;
  wire w_cmp1, w_cmp2;
  reg [31:0] r_pc = 0, r_x1 = 3;  // m1, m6
  assign w_npc = 32'h4 + r_pc;    // m2
  assign w_ir =
    (r_pc==0) ? {7'd0,5'd1,5'd0,3'd0,5'd1,7'b0110011} :  // m3
    (r_pc==4) ? {7'd0,5'd0,5'd1,3'd0,5'd1,7'b0110011} :  // m3
                {7'd0,5'd1,5'd1,3'd0,5'd1,7'b0110011};   // m3
  assign w_cmp1 = (5'd1 == w_ir[19:15]);    // m4
  assign w_cmp2 = (5'd1 == w_ir[24:20]);    // m5
  assign w_r1 = (w_cmp1) ? r_x1 : 32'h0;  // m7
  assign w_r2 = (w_cmp2) ? r_x1 : 32'h0;  // m8
  assign w_rt = w_r1 + w_r2;        // m9
  always @(posedge w_clk) r_pc <= w_npc;
  always @(posedge w_clk) r_x1 <= w_rt;
endmodule
