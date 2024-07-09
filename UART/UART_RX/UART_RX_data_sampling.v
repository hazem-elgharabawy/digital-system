module data_sampling (
    input       clk,
    input       rst,
    input       RX_IN,
    input [5:0] Prescale,
    input       data_sample_en,
    input [4:0] edge_count,
    output reg  sampled_bit
);
    
    reg [1:0] sampled_ones;

    // oversampling 
    always @(posedge clk) begin
        if (!rst) begin
            sampled_ones <= 0;
        end
        else begin
            case (Prescale)
                8 :begin
                    if (data_sample_en) begin
                        if (edge_count== 7) begin
                            sampled_ones <= 0;
                        end
                        else if (edge_count==3||edge_count==4||edge_count==5) begin
                            sampled_ones <= sampled_ones + RX_IN;
                        end
                    end
                    else begin
                        sampled_ones <= 0;
                    end
                end 
                16 : begin
                    if (data_sample_en) begin
                        if (edge_count== 15) begin
                            sampled_ones <= 0;
                        end
                        else if (edge_count==7||edge_count==8||edge_count==9) begin
                            sampled_ones <= sampled_ones + RX_IN;
                        end
                    end
                    else begin
                        sampled_ones <= 0;
                    end
                end
                32 : begin
                    if (data_sample_en) begin
                        if (edge_count== 31) begin
                            sampled_ones <= 0;
                        end
                        else if (edge_count==15||edge_count==16||edge_count==17) begin
                            sampled_ones <= sampled_ones + RX_IN;
                        end
                    end
                    else begin
                        sampled_ones <= 0;
                    end
                end
                default:   begin 
                    sampled_ones <=0;
                end
            endcase    
        end
        
    end

    // deciding sampled bit
    always @(posedge clk) begin
        if (!rst) begin
            sampled_bit <= 0;
        end
        else begin
            case (Prescale)
                8 :begin
                    if (sampled_ones == 2 || sampled_ones == 3) begin
                        sampled_bit = 1;
                    end
                    else begin
                        sampled_bit = 0;
                    end
                end
                16 : begin
                    if (sampled_ones == 2 || sampled_ones == 3) begin
                        sampled_bit = 1;
                    end
                    else begin
                        sampled_bit = 0;
                    end
                end
                32 : begin
                   if (sampled_ones == 2 || sampled_ones == 3 ) begin
                        sampled_bit = 1;
                    end
                    else begin
                        sampled_bit = 0;
                    end 
                end
                default:   begin
                end
            endcase
        end
    end
    
endmodule