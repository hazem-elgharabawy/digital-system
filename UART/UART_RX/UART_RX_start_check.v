module start_check (
    input       start_check_en,
    input       sampled_bit,
    output reg  start_glitch );

    always @(*) begin
        if (start_check_en) begin
            if (sampled_bit) begin
                start_glitch = 1;
            end
            else begin
                start_glitch = 0;
            end
        end
        else begin
            start_glitch = 0;
        end
    end
endmodule