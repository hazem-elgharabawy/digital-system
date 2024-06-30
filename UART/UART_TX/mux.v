module mux (
    input IN0,IN1,IN3,IN4,
    input [1:0] mux_sel,
    output reg TX_OUT
);
    always @(*) begin
        case (mux_sel)
            0 : TX_OUT = IN0;
            1 : TX_OUT = IN1;
            2 : TX_OUT = IN3;
            3 : TX_OUT = IN4;
            default: TX_OUT = 0;
        endcase    
    end
    
endmodule