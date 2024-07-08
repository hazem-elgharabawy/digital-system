module parity_check (
    input           PAR_TYP,
    input           parity_check_en,
    input           sampled_bit,
    input  [7:0]    P_data,
    output reg      par_err );

    wire calculated_par;

    assign calculated_par = (PAR_TYP)? ~^P_data: ^P_data;

    always @(posedge clk) begin
        if (!rst) begin
            par_err <= 0;
        end
        else if (parity_check_en && edge_count == ((Prescale/2)+2)) begin
                if (sampled_bit == calculated_par)begin
                    par_err <= 0;
                end
                else begin
                    par_err <= 1; 
                end
        end
    end
    
endmodule