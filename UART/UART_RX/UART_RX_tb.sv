module UART_RX_tb ();

    //signals
    reg           clk;
    reg           rst;
    reg           PAR_TYP;
    reg           PAR_EN;
    reg   [5:0]   Prescale;
    reg           RX_IN;
    wire  [7:0]   P_DATA;
    wire          data_valid;
    wire          par_error;
    wire          stop_error;

    //Counters
    integer error_count = 0;
    integer correct_count = 0;
    
    //clock geberation
    initial begin
        clk = 0;
        forever begin
            #5  clk = ~clk;
        end
    end


    //inistantiation
    TOP DUT (.*);


    //Initial block
    initial begin
        init();
        check_rst();
        //send_packet_without_parity(8'h45, 8);
        //check_out(8'h45);
        //send_packet_with_even_parity(8'b1010_1010, 8);
        //check_out(8'b1010_1010);
        //send_packet_with_odd_parity(8'ha8, 8);
        //check_out(8'ha8);
        report();
        $stop;
    end


    ///////////////////Tasks//////////////////////

    task init ();begin
        rst = 1;
        PAR_TYP = 0;
        PAR_EN = 0;
        Prescale = 0;
        RX_IN = 1;
    end
    endtask

    task check_rst(); begin
        @(negedge clk);
        rst= 0;
        @(negedge clk);
        if ((P_DATA !== 0) || (data_valid !== 0)) begin
            $display("ERROR: Reset is not working well, at %0t",  $time);
            error_count = error_count + 1;
        end
        else begin
            correct_count = correct_count + 1;
        end
        @(negedge clk);
        rst= 1;
    end
    endtask
    
    task send_packet_without_parity(input [7:0] data , input [5:0]   Prescale_in );
    begin
      integer i;
        @(negedge clk);
        PAR_TYP = 0;
        PAR_EN = 0;
        Prescale = Prescale_in;
        RX_IN = 0; // start bit
        repeat (Prescale) @(negedge clk);
        for ( i = 0 ; i < 8 ; i = i + 1 ) begin
            RX_IN = data[i];
            repeat (Prescale) @(negedge clk);
        end
        RX_IN = 1; // stop bit
        repeat (Prescale) @(negedge clk);
    end
    endtask

    task send_packet_with_odd_parity(input [7:0] data , input [5:0] Prescale_in );
    begin
         integer i;
        @(negedge clk);
        PAR_TYP = 0;
        PAR_EN = 1;
        Prescale = Prescale_in;
        RX_IN = 0; // start bit
        repeat (Prescale) @(negedge clk);
        for ( i = 0 ; i < 8 ; i = i + 1 ) begin
            RX_IN = data[i];
            repeat (Prescale) @(negedge clk);
        end
        RX_IN = ^data; // Parity bit
        repeat (Prescale) @(negedge clk);
        RX_IN = 1; // stop bit
        repeat (Prescale) @(negedge clk);
    end
    endtask
    
    task send_packet_with_even_parity (input [7:0] data , input [5:0] Prescale_in) ;
    begin
        integer i;
        @(negedge clk);
        PAR_TYP = 1;
        PAR_EN = 1;
        Prescale = Prescale_in;
        RX_IN = 0; // start bit
        repeat (Prescale) @(negedge clk);
        for ( i = 0 ; i < 8 ; i = i + 1 ) begin
            RX_IN = data[i];
            repeat (Prescale) @(negedge clk);
        end
        RX_IN = ~^data; // Parity bit
        repeat (Prescale) @(negedge clk);
        RX_IN = 1; // stop bit
        repeat (Prescale) @(negedge clk);
    end
    endtask

    task check_out(input [7:0] expected_out);
        if(!data_valid) begin
            $display("ERROR: DATA is not valid");
            error_count = error_count + 1;
        end
        else if (P_DATA !== expected_out) begin
            $display("ERROR: P_DATA is not as expected");
            error_count = error_count + 1;
        end
        else begin
            correct_count = correct_count + 1;
        end
    endtask

    task report(); begin
        $display("-------------------------------------");
        $display("TEST REPORT");
        if(error_count == 0) begin
            $display("test passed with no errors");
        end
        else begin
            $display("test failed with %0d errors",error_count);    
        end 
        $display("-------------------------------------");
    end
    endtask
endmodule