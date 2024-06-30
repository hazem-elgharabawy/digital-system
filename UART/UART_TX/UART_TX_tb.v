module UART_TX_tb # (parameter FRAME_WIDTH = 8) ();
    
    //signals
    reg clk , reset;
    reg Data_Valid;
    reg par_en,PAR_TYP;
    reg [FRAME_WIDTH-1:0] P_Data;
    wire TX_OUT, busy;

    //counters
    integer error_counter = 0;
    integer correct_counter = 0;
 

    //instantiation
    UART_TX_TOP DUT (.*);


    //clock geberation
    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    //initial block
    initial begin
        initialize();
        check_reset();
        input_data_without_parity(8'b11100010);
        check_output_without_parity(8'b11100010);
        input_data_with_even_parity(8'b11001100);
        check_output_with_parity(8'b11001100);
        input_data_with_odd_parity(8'b00110011);
        check_output_with_parity(8'b00110011);
        report();
    $stop;
    end


    //////////////////////TASKS/////////////////////



//initialization

task initialize();begin
    Data_Valid = 0;
    P_Data = 0;
    par_en = 0;
    PAR_TYP = 0;
    reset = 1;
    end
endtask

//check reset
task check_reset(); begin
        @(negedge clk);
        reset = 0;
        @(negedge clk);
        if (!TX_OUT | busy)begin
            error_counter = error_counter + 1;
            $display("ERROR: reset is not working");
        end
        else begin
            correct_counter = correct_counter +1;
        end

        reset = 1;
    end
    
endtask

task input_data_without_parity (input [FRAME_WIDTH-1:0] DATA ); begin
    P_Data = DATA;
    par_en = 0;
    PAR_TYP = 0;
    Data_Valid = 1;
    @(negedge clk);
    Data_Valid = 0;
    end
endtask


task input_data_with_odd_parity (input [FRAME_WIDTH-1:0] DATA ); begin
    P_Data = DATA;
    par_en = 1;
    PAR_TYP = 0;
    Data_Valid = 1;
    @(negedge clk);
    Data_Valid = 0;
    end
    
endtask


task input_data_with_even_parity (input [FRAME_WIDTH-1:0] DATA ); begin
    P_Data = DATA;
    par_en = 1;
    PAR_TYP = 1;
    Data_Valid = 1;
    @(negedge clk);
    Data_Valid = 0;
    end
    
endtask

task check_output_without_parity (input [FRAME_WIDTH+1 :0] expected_out); 
        integer i;
        reg [FRAME_WIDTH + 1:0] temp_out_without_parity;
        begin
            
            if(par_en)begin
                $display("ERROR: parity is enabled");
                error_counter = error_counter + 1;
            end    
            else begin
                correct_counter = correct_counter +1;
                for ( i = 0 ;i < FRAME_WIDTH +2 ;i=i+1 ) begin
                    if (!busy) begin
                        error_counter = error_counter +1;
                        $display("busy is not high");
                    end
                    temp_out_without_parity[i] = TX_OUT;  
                    @(negedge clk);
                end
            end
            if (temp_out_without_parity[0] !== 0) begin
                error_counter = error_counter +1;
                $display("ERROR: start bit error");
            end
            else begin
                correct_counter = correct_counter +1; 
            end
            if (temp_out_without_parity[FRAME_WIDTH:1] !== expected_out) begin
                    error_counter = error_counter + 1;
                    $display("ERROR : output is not as expected , expected out = %0b , output = %0b ",expected_out,temp_out_without_parity[8:1]);
            end
            else begin
                correct_counter = correct_counter +1; 
            end
            if (temp_out_without_parity[FRAME_WIDTH +1] !== 1) begin
                error_counter = error_counter +1;
                $display("ERROR: stop bit error");
            end
            else begin
                correct_counter = correct_counter +1; 
            end    
    end

endtask


task check_output_with_parity (input [FRAME_WIDTH -1 :0] expected_out); 
        integer i;
        reg [FRAME_WIDTH + 2:0] temp_out_with_parity;
        begin
            
            if(!par_en)begin
                $display("ERROR: parity is not enabled");
                error_counter = error_counter + 1;
            end
            else begin
                correct_counter = correct_counter +1;
                for ( i = 0 ;i < FRAME_WIDTH + 3 ;i=i+1 ) begin
                    temp_out_with_parity[i] = TX_OUT;
                    @(negedge clk);  
                end
            end
            if (temp_out_with_parity[0] !== 0) begin
                error_counter = error_counter +1;
                $display("ERROR: start bit error");
            end
            else begin
                correct_counter = correct_counter +1; 
            end
            if (temp_out_with_parity[FRAME_WIDTH:1] !== expected_out) begin
                    error_counter = error_counter + 1;
                    $display("ERROR : output is not as expected , expected out = %0b , output = %0b ",expected_out,temp_out_with_parity[8:1]);
            end
            else begin
                correct_counter = correct_counter +1; 
            end

            if (PAR_TYP) begin
                if (temp_out_with_parity[FRAME_WIDTH+1] !== ~^expected_out) begin
                    error_counter = error_counter +1;
                    $display("ERROR: even parity error");    
                end
                else begin
                correct_counter = correct_counter +1; 
                end 
            end
            else begin
                if (temp_out_with_parity[FRAME_WIDTH+1] !== ^expected_out) begin
                    error_counter = error_counter +1;
                    $display("ERROR: odd parity error");    
                end
                else begin
                correct_counter = correct_counter +1; 
                end
            end
                   
            if (temp_out_with_parity[FRAME_WIDTH+2] !== 1) begin
                error_counter = error_counter +1;
                $display("ERROR: stop bit error");
            end
            else begin
                correct_counter = correct_counter +1; 
            end    
    end

endtask



task report(); begin
    $display("-------------------------------------");
    $display("TEST REPORT");
    if(error_counter == 0) begin
        $display("test passed with no errors");
    end
    else begin
        $display("test failed with %0d errors",error_counter);    
    end 
    $display("-------------------------------------");
end
endtask
endmodule