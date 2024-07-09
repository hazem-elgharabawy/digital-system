module start_check (
    input       clk,
    input       rst,    
    input       start_check_en,
    input       sampled_bit,
    input [4:0] edge_count,
    input [5:0] Prescale,
    output reg  start_glitch);

    always @(posedge clk) begin
        if (!rst) begin
            start_glitch <= 0;
        end
        else if (start_check_en && edge_count == ((Prescale/2)+2)) begin
            if (sampled_bit) begin
                start_glitch <= 1;
            end
            else begin
                start_glitch <= 0;
            end
        end
    end
endmodule