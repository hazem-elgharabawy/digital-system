module stop_check (
    input       clk,
    input       rst,
    input       stop_check_en,
    input       sampled_bit,
    output reg  stop_err );

    reg stop_err_c;
    always @(posedge clk ) begin
        if (!rst) begin
            stop_err <= 0;
        end
        else begin
            stop_err <= stop_err_c;
        end
        
    end
    
    always @(*) begin
        stop_err_c = 0;
        if (stop_check_en) begin
            if (sampled_bit) begin
                stop_err_c = 0;
            end
            else begin
                stop_err_c = 1;
            end
        end
    end
endmodule