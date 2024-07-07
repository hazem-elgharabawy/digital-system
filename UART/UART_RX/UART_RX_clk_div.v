module CLK_DIV (
    input clk_32,
    input rst,
    output clk_16,
    output clk_8,
    output clk_1);
    
    reg [4:0] counter;


    assign clk_16 = counter[1];
    assign clk_8 = counter[2];
    assign clk_1 = counter[4];
    
    always @(posedge clk_32 ) begin
        if (!rst) begin
            counter<=0;
        end
        else if (counter == 5'b11111)begin
            counter<=0;
        end
        else begin
            counter<=counter+1;
        end
    end

endmodule