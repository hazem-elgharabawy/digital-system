module data_sampling (
    input clk_8,
    input clk_16,
    input clk_32,
    input rst,
    input RX_IN,
    input Prescale,
    input data_sample_en,
    input edge_count,
    output reg sampled_bit
);
    reg [1:0] sampled_ones_32;
    reg [1:0] sampled_ones_16;
    reg [1:0] sampled_ones_8;

    always @(*) begin
        if (Prescale ==32)begin
            if (sampled_ones_32==2 || sampled_ones_32==3 ) begin
                sampled_bit = 1;
            end
            else begin
                sampled_bit = 0;
            end
        end
        else if (Prescale ==16)begin
            if (sampled_ones_16==2 || sampled_ones_16==3) begin
                sampled_bit = 1;
            end
            else begin
                sampled_bit = 0;
            end
        end
        else if (Prescale ==8)begin
            if (sampled_ones_8 == 2 || sampled_ones_8 == 3) begin
                sampled_bit = 1;
            end
            else begin
                sampled_bit = 0;
            end
        end
    end
    
    //prescale = 32
    always @(posedge clk_32) begin
        if (!rst) begin
            sampled_ones_32 <= 0;
        end
        else if (data_sample_en && Prescale == 32) begin
            if (edge_count== 31) begin
                sampled_ones_32 <= 0;
            end
            else if (edge_count==15||edge_count==16||edge_count==17) begin
                sampled_ones_32 <= sampled_ones_32 + RX_IN;
            end
        end
        else begin
            sampled_ones_32 <= 0;
        end
    end

    // prescale = 16
    always @(posedge clk_16) begin
        if (!rst) begin
            sampled_ones_16 <= 0;
        end
        else if (data_sample_en && Prescale == 16) begin
            if (edge_count == 15) begin
                sampled_ones_16 <= 0;
            end
            else if (edge_count==7||edge_count==8||edge_count==9) begin
                sampled_ones_16 <= sampled_ones_16 + RX_IN;
            end
        end
        else begin
            sampled_ones_16 <= 0;
        end        
    end
    
    // prescale = 8
    always @(posedge clk_8) begin
        if (!rst) begin
            sampled_ones_8 <= 0;
        end
        else if (data_sample_en && Prescale == 8) begin
            if (edge_count == 7) begin
                sampled_ones_8 <= 0;
            end
            else if (edge_count==3||edge_count==4||edge_count==5) begin
                sampled_ones_8 <= sampled_ones_8 + RX_IN;
            end
        end
        else begin
            sampled_ones_8 <= 0;
        end        
    end    
endmodule