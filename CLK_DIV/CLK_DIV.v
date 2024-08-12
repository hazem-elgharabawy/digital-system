module ClkDiv (
    input       i_ref_clk,
    input       i_rst_n,
    input       i_clk_en,
    input [7:0] i_div_ratio,
    output reg  o_div_clk
);
    wire        is_odd;
    wire        ClK_DIV_EN;
    reg [7:0]   counter;
    reg         flag;

    assign is_odd = i_div_ratio[0];

    assign ClK_DIV_EN = i_clk_en && (i_div_ratio != 0) && ( i_div_ratio != 1);

    always @(posedge i_ref_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            o_div_clk <= 0;
            flag <= 0;
        end
        else if (!ClK_DIV_EN)begin
            o_div_clk <= ~o_div_clk;
        end
        else begin
            case (is_odd)
                0 : begin
                    if (counter >= (i_div_ratio >> 1)) begin
                        o_div_clk <= ~ o_div_clk;
                        counter <= 0;
                    end
                end
                1: begin
                    if (counter >= (i_div_ratio>>1) && !flag) begin
                        o_div_clk <= ~ o_div_clk;
                        flag <= 1;
                        counter <= 0;
                    end
                    else if (counter >= ((i_div_ratio>>1)+1) && flag) begin
                        o_div_clk <= ~ o_div_clk;
                        flag <= 0;
                        counter <= 0;
                    end
                end
            endcase
        end
       
    end

    always @(posedge i_ref_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            counter <= 0;
        end
        else if (ClK_DIV_EN) begin
            if (counter == i_div_ratio) begin
                counter <= 0;
            end
            else begin
                counter <= counter + 1;
            end 
        end
    end

endmodule