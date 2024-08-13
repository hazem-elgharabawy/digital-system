module PULSE_GEN (
    input CLK,
    input RST,
    input IN,
    output PULSE
);

    reg pulse_gen_ff;
    
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            pulse_gen_ff <= 0;
        end
        else begin
            pulse_gen_ff <= IN;
        end
    end

    assign PULSE = ((!pulse_gen_ff) && IN);
    
endmodule