module deserializer (
    input           clk,
    input           rst,
    input           sampled_bit,
    input           deser_en,
    input  [5:0]    Prescale,
    input  [4:0]    edge_count,
    output [7:0]    P_DATA
);

    reg [7:0] data;
    always @(posedge clk) begin
        if (!rst) begin
            data <= 0; 
        end
        else begin
            if (deser_en) begin
                if (edge_count == ((Prescale/2)+2)) begin
                    data <= {sampled_bit,data[7:1]};
                end   
            end 
        end     
    end
    
assign P_DATA = data;


endmodule