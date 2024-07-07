module stop_check (
    input       stop_check_en,
    input       sampled_bit,
    output reg  stop_err );


    
    always @(*) begin
        if (stop_check_en) begin
            if (sampled_bit) begin
                stop_err = 0;
            end
            else begin
                stop_err = 1;
            end
        end
        else begin
            stop_err = 0;
        end
    end
endmodule