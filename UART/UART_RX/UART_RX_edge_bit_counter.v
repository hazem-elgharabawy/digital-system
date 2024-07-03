module edge_bit_counter (
    input clk,
    input rst,
    input counter_enable,
    output edge_count,
    output bit_count);

    always @(posedge clk ) begin
        if (!rst) begin
            edge_count <= 0;
            bit_count <= 0;
        end
        else if (counter_enable) begin
            if (edge_count == prsesample) begin
                edge_count <= 0;
                bit_count <= bit_count + 1;
            end
            else begin
                edge_count <= edge_count + 1;
            end
        else begin
            bit_count <= 0;
            edge_count <= 0;
        end
        end
    end

    
endmodule