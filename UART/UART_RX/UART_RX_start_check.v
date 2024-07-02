module start_check (
    input       clk,
    input       rst,
    input       start_check_en,
    input       sampled_bit,
    output reg  start_glitch );


    always @(posedge clk ) begin
        if (!rst) begin
            start_glitch <= 0;
        end
            start_glitch <= start_glitch_c;
        else 
    end
    always @(*) begin
        start_glitch_c = 0;
        if (start_check_en) begin
            if (sampled_bit) begin
                start_glitch_c = 1;
            end
            else begin
                start_glitch_c = 0;
            end
        end
    end
endmodule