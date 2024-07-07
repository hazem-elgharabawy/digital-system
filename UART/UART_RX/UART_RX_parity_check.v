module parity_check (
    input           PAR_TYP,
    input           parity_check_en,
    input           sampled_bit,
    input  [7:0]    P_data,
    output reg      par_err );

    reg calculated_par;
    reg par_err_c;

    
    always @(*) begin
        
        if (parity_check_en) begin
                if (PAR_TYP) begin
                    calculated_par = ~^P_data;
                    if (sampled_bit == calculated_par) begin
                        par_err = 0;
                    end
                    else begin
                        par_err = 1;
                    end
                end
                else begin
                    calculated_par = ^P_data;
                    if (sampled_bit == calculated_par) begin
                        par_err = 0;
                    end
                    else begin
                        par_err = 1;
                    end
                end    
        end
        else begin
            par_err = 0;
        end
    end
    
endmodule