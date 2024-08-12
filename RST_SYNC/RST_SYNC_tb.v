module sync_rst_tb ();
    
    reg CLK;
    reg RST;
    wire SYNC_RST;

    initial begin
       CLK = 0;
       forever begin
           #1 CLK =~ CLK;
       end
    end   

    RST_SYNC reset_sync (.*);

    initial begin
        RST = 0;
        repeat(20) @(negedge CLK);
        RST = 1;
        repeat(20) @(negedge CLK);
        RST = 0;
        repeat(20) @(negedge CLK);
        RST = 1;
        $stop;
    end

endmodule