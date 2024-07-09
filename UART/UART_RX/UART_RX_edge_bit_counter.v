module edge_bit_counter (
    input               clk,
    input               rst,
    input      [5:0]    Prescale,
    input               counter_enable,
    output reg [4:0]    edge_count,
    output reg [3:0]    bit_count);
    


    always @(posedge clk) begin
        case (Prescale)
            8: begin
                if (edge_count == 7) begin
                    edge_count <= 0;
                    bit_count = bit_count +1;
                end                
                else begin
                    edge_count = edge_count + 1;
                end
            end

            16: begin
                if (edge_count == 15) begin
                    edge_count <= 0;
                    bit_count = bit_count +1;
                end                
                else begin
                    edge_count = edge_count + 1;
                end
            end

            32:begin
                if (edge_count == 31) begin
                    edge_count <= 0;
                    bit_count = bit_count +1;
                end                
                else begin
                    edge_count = edge_count + 1;
                end
            end
            default: begin
                edge_count <= 0;
                bit_count = 0;
            end
        endcase
    end
endmodule