module edge_bit_counter (
    input               clk_16,
    input               clk_8,
    input               clk_32,
    input               rst,
    input               Prescale,
    input               counter_enable,
    output reg [4:0]    edge_count,
    output reg [3:0]    bit_count);
    
    
    reg [4:0]   edge_count_16;
    reg [4:0]   edge_count_8;
    reg [4:0]   edge_count_32;
    reg [3:0]   bit_count_16;
    reg [3:0]   bit_count_8;
    reg [3:0]   bit_count_32;

    always @(*) begin
        if (Prescale == 16) begin
            edge_count = edge_count_16;
            bit_count = bit_count_16;
        end
        else if (Prescale == 8) begin
            edge_count = edge_count_8;
            bit_count = bit_count_8;
        end
        else if (Prescale == 32) begin
            edge_count = edge_count_32;
            bit_count = bit_count_32;
        end
        else begin
            edge_count = 0;
            bit_count = 0;
        end
    end

    // prescale = 16
    always @(posedge clk_16) begin
        if (!rst) begin
            edge_count_16 <= 0;
            bit_count_16 <= 0;
        end
        else if (counter_enable && Prescale == 16) begin
            if (edge_count_16 == 15) begin
                edge_count_16 <= 0;
                bit_count_16 <= bit_count_16 + 1;
            end
            else begin
                edge_count_16 <= edge_count_16 + 1;
            end
        else begin
            bit_count_16 <= 0;
            edge_count_16 <= 0;
        end
        end        
    end       

    // prescale = 8
    always @(posedge clk_8) begin
        if (!rst) begin
            edge_count_8 <= 0;
            bit_count_8 <= 0;
        end
        else if (counter_enable && Prescale == 8) begin
            if (edge_count_8 == 7) begin
                edge_count_8 <= 0;
                bit_count_8 <= bit_count_8 + 1;
            end
            else begin
                edge_count_8 <= edge_count_8 + 1;
            end
        else begin
            bit_count_8 <= 0;
            edge_count_8 <= 0;
        end
        end        
    end

    // prescale = 32
    always @(posedge clk_32) begin
        if (!rst) begin
            edge_count_32 <= 0;
            bit_count_32 <= 0;
        end
        else if (counter_enable && Prescale == 32) begin
            if (edge_count_32 == 31) begin
                edge_count_32 <= 0;
                bit_count_32 <= bit_count_32 + 1;
            end
            else begin
                edge_count_32 <= edge_count_32 + 1;
            end
        else begin
            bit_count_32 <= 0;
            edge_count_32 <= 0;
        end
        end        
    end

endmodule