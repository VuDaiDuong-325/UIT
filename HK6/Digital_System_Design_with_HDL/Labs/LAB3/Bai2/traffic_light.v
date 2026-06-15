module traffic_light (
    input wire clk, rst_n,                 
    output reg [2:0] ns_light, ew_light		// red - yellow - green
);
    parameter S0 = 3'd0, 
              S1 = 3'd1, 
              S2 = 3'd2,
              S3 = 3'd3, 
              S4 = 3'd4, 
              S5 = 3'd5;
                    
    reg [2:0] state, cnt;

    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S0;
            cnt   <= 3'd0; 
        end
        else begin
            case (state)
                S0: begin
                    if (cnt == 3'd4) begin
                        state <= S1;
                        cnt   <= 3'd0;
                    end else cnt <= cnt + 1'b1;
                end
                
                S1: begin
                    state <= S2;   
                    cnt   <= 3'd0;
                end
                
                S2: begin
                    state <= S3;   
                    cnt   <= 3'd0;
                end
                
                S3: begin
                    if (cnt == 3'd4) begin 
                        state <= S4;
                        cnt   <= 3'd0;
                    end else cnt <= cnt + 1'b1;
                end
                
                S4: begin
                    state <= S5;   
                    cnt   <= 3'd0;
                end
                
                S5: begin
                    state <= S0;   
                    cnt   <= 3'd0;
                end
                
                default: begin
                    state <= S0;
                    cnt   <= 3'd0;
                end
            endcase
        end
    end
    
    always @ (*) begin
        case (state)
            S0: begin ns_light = 3'b001; ew_light = 3'b100; end 
            S1: begin ns_light = 3'b010; ew_light = 3'b100; end 
            S2: begin ns_light = 3'b100; ew_light = 3'b100; end 
            S3: begin ns_light = 3'b100; ew_light = 3'b001; end 
            S4: begin ns_light = 3'b100; ew_light = 3'b010; end 
            S5: begin ns_light = 3'b100; ew_light = 3'b100; end 
            default: begin ns_light = 3'b100; ew_light = 3'b100; end
        endcase
    end

endmodule
