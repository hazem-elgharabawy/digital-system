module stop_check (
    input            clk,
    input            rst,    
    input           stop_check_en,
    input           sampled_bit,
    input [4:0]     edge_count,
    input [5:0]     Prescale,
    output reg      stop_error );


    
    always @(posedge clk) begin
        if (!rst) begin
            stop_error <= 0;
        end
        else if (stop_check_en && edge_count >= ((Prescale/2)+2)) begin
            if (sampled_bit) begin
                stop_error <= 0;
            end
            else begin
                stop_error <= 1;
            end
        end
        else begin
            stop_error <= 0;
        end
    end
endmodule