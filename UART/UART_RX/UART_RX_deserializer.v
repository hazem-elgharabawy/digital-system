module deserializer (
    input           clk,
    input           rst,
    input           sampled_bit,
    input           deser_en,
    output [7:0]    P_DATA
);

    reg [7:0] data;
    always @(posedge clk) begin
        if (!rst) begin
            data <= 0; 
        end
        else begin
            if (deser_en) begin
                data <= {data,sampled_bit};
            end 
        end     
    end
    
assign P_DATA = data;


endmodule