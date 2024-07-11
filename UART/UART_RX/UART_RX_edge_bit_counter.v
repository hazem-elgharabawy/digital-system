module edge_bit_counter (
    input               clk,
    input               rst,
    input      [5:0]    Prescale,
    input               counter_enable,
    input               PAR_EN,
    output reg [4:0]    edge_count,
    output reg [3:0]    bit_count);
    


    always @(posedge clk) begin
        if (!rst) begin
            edge_count <= 0;
        end
        else if (counter_enable) begin
            case (Prescale)
            8: begin
                if (PAR_EN) begin
                    if (bit_count == 11 ) begin
                        edge_count <= 0;
                        bit_count <= 0;
                    end
                    else if (edge_count == 7) begin
                        edge_count <= 0;
                        bit_count = bit_count +1;
                    end                
                    else begin
                        edge_count = edge_count + 1;
                    end
                end 
                else begin
                    if (bit_count == 10) begin
                        edge_count <= 0;
                        bit_count <= 0;
                    end
                    else if (edge_count == 7) begin
                        edge_count <= 0;
                        bit_count = bit_count +1;
                    end                
                    else begin
                        edge_count = edge_count + 1;
                    end
                end 
            end

            16: begin
                if (PAR_EN) begin
                if (bit_count == 11) begin
                    edge_count <= 0;
                    bit_count <= 0;
                end
                else if (edge_count == 15) begin
                    edge_count <= 0;
                    bit_count = bit_count +1;
                end                
                else begin
                    edge_count = edge_count + 1;
                end    
                end
                else begin
                   if (bit_count == 10) begin
                    edge_count <= 0;
                    bit_count <= 0;
                end
                else if (edge_count == 15) begin
                    edge_count <= 0;
                    bit_count = bit_count +1;
                end                
                else begin
                    edge_count = edge_count + 1;
                end 
                end
                
            end

            32:begin
                if (PAR_EN) begin
                    if (bit_count == 11) begin
                        edge_count <= 0;
                        bit_count <= 0;
                    end
                    else if (edge_count == 31) begin
                        edge_count <= 0;
                        bit_count = bit_count +1;
                    end                
                    else begin
                        edge_count = edge_count + 1;
                    end    
                end
                else begin
                   if (bit_count == 10) begin
                        edge_count <= 0;
                        bit_count <= 0;
                    end
                    else if (edge_count == 31) begin
                        edge_count <= 0;
                        bit_count = bit_count +1;
                    end                
                    else begin
                        edge_count = edge_count + 1;
                    end 
                end
                
            end
            default: begin
                edge_count <= 0;
                bit_count = 0;
            end
            
        endcase
        end
        else begin
                edge_count <=0;
                bit_count <= 0;
            end
        
    end
endmodule