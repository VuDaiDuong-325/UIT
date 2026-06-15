module D_FF (
    input wire D, Clock,
    output wire Q, Qn
);

    wire Qm;
    
    D_latch d0 (D, ~Clock, Qm, );

    D_latch d1 (Qm, Clock, Q, Qn);
    
endmodule