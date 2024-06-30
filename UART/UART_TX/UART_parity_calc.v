module parity_calc #(
    parameter FRAME_WIDTH = 8
) (
    input   Data_Valid,
    input   PAR_TYP,
    input   clk,
    input   reset,
    input   [FRAME_WIDTH-1:0] P_Data,
    output reg  par_bit 
);
        
    always @(posedge clk or  negedge reset) begin
        if (!reset) begin
            par_bit <= 0;
        end
        else if (Data_Valid) begin
            if (PAR_TYP) begin
                par_bit <= ~^P_Data;    
            end
            else begin
                par_bit <= ^P_Data;
            end
        end
    end
endmodule