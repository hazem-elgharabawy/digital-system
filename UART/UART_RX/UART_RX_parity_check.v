module parity_check (
    input           clk,
    input           rst,
    input           PAR_TYP,
    input           parity_check_en,
    input           sampled_bit,
    input  [7:0]    P_data,
    output reg      par_err );

    reg calculated_par;
    reg par_err_c;

    always @(posedge clk ) begin
        if(!rst)begin
            par_err <= 0;
        end
            par_err = par_err_c
        end


    always @(*) begin
        par_err_c  = 0;
        if (parity_check_en) begin
                if (PAR_TYP) begin
                    calculated_par = ~^P_data;
                    if (sampled_bit == calculated_par) begin
                        par_err_c = 0;
                    end
                    else begin
                        par_err_c = 1;
                    end
                end
                else begin
                    calculated_par = ^P_data;
                    if (sampled_bit == calculated_par) begin
                        par_err_c = 0;
                    end
                    else begin
                        par_err_c = 1;
                    end
                end    
        end
    end
    
endmodule