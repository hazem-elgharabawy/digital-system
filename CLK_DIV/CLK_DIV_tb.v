module CLK_DIV_tb ();
    
    reg i_ref_clk;
    reg i_rst_n;
    reg i_clk_en;
    reg [7:0] i_div_ratio;
    wire o_div_clk;

    ClkDiv clock_div (.*);

    initial begin
        i_ref_clk = 0;
        forever begin
            #10 i_ref_clk = ~i_ref_clk;
        end
    end

    initial begin
        i_rst_n = 0;
        i_clk_en = 0;
        i_div_ratio = 0;
        repeat(20) @(negedge i_ref_clk);
        i_rst_n = 1;
        i_clk_en = 1;
        i_div_ratio = 8'h04;
        repeat(20) @(negedge i_ref_clk);
        i_div_ratio = 8'h02;
        repeat(20) @(negedge i_ref_clk);
        i_div_ratio = 8'h08;
        repeat(40) @(negedge i_ref_clk);
        i_div_ratio = 8'h03;
        repeat(20) @(negedge i_ref_clk);
        i_div_ratio = 8'h05;
        repeat(20) @(negedge i_ref_clk);
        i_div_ratio = 8'h00;
        repeat(20) @(negedge i_ref_clk);
        $stop;
    end


endmodule