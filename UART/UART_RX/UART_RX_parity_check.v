module parity_check (
    input            clk,
    input            rst,   
    input            PAR_TYP,
    input            par_check_en,
    input            sampled_bit,
    input   [5:0]    Prescale,
    input   [4:0]    edge_count,
    input   [7:0]    P_data,
    output reg      par_error);

    wire calculated_par;

    assign calculated_par = (PAR_TYP)? ~^P_data: ^P_data;

    always @(posedge clk) begin
        if (!rst) begin
            par_error <= 0;
        end
        else if (par_check_en && edge_count >= ((Prescale/2)+2)) begin
                if (sampled_bit == calculated_par)begin
                    par_error <= 0;
                end
                else begin
                    par_error <= 1; 
                end
        end
        else begin
            par_error <= 0;
        end
    end
    
endmodule