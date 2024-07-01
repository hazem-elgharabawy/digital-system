module MUX (
    input IN0,IN1,
    input [1:0] mux_sel,
    output reg TX_OUT
);
    always @(*) begin
        case (mux_sel)
            0 : TX_OUT = 1;
            1 : TX_OUT = 0;
            2 : TX_OUT = IN0;
            3 : TX_OUT = IN1;
            default: TX_OUT = 1;
        endcase    
    end
    
endmodule