module serializer #(
    parameter FRAME_WIDTH = 8,
    parameter COUNTER_WIDTH = 3
) (
    input clk,
    input reset, 
    input ser_en,
    input Data_Valid,
    input [FRAME_WIDTH-1:0] P_Data,
    output reg ser_done,
    output reg ser_data
);
    reg [FRAME_WIDTH-1:0] temp;
    reg [COUNTER_WIDTH-1 :0] counter;
//////////////////SERIAL OUTPUT///////////////////////////
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            ser_data <= 0
            temp <=0;
        end
        else if (ser_en)begin
            {temp,ser_data} <= {1'b0,temp};
        end
        else if (Data_Valid) begin
            temp <= P_Data;
        end
    end

///////////////COUNTER///////////////////
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            counter <= 0; 
            ser_done <= 0;
        end
        else if (counter == (2**COUNTER_WIDTH)-1) begin
            ser_done <= 1;
            counter <= 0;
        end
        else if (ser_en) begin
            counter <= counter + 1;

        end
        else if (Data_Valid) begin
            counter <= 0;
            ser_done <= 0;
        end

    end

endmodule