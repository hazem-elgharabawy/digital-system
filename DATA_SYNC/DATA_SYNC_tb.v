module DATA_SYNC_tb ();
    
    reg         CLK;
    reg         RST;
    reg         bus_enable;
    reg   [7:0] unsync_bus;
    wire        enable_pulse;
    wire  [7:0] sync_bus;

    DATA_SYNC data_sunc (.*);

    initial begin
        CLK = 0;
        forever begin
            #10 CLK = !CLK;
        end
    end

    initial begin
        RST = 0;
        bus_enable = 0;
        unsync_bus = 0;
        repeat(10) @(negedge CLK);
        RST = 1;
        bus_enable = 1;
        unsync_bus = 8'b11001100;
        repeat(4) @(negedge CLK);
        bus_enable = 0;
        unsync_bus = 8'b0;
	@(negedge CLK); 
        #9 
        bus_enable = 1;
        unsync_bus = 8'b1101_1000;
        repeat(4) @(negedge CLK);
        $stop;
    end
endmodule