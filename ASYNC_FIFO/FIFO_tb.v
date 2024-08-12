`timescale 1ns/10ps
module FIFO_tb ();
    
    parameter DATA_WIDTH = 8;
    reg                    W_CLK;
    reg                    W_RST;
    reg                    W_INC;
    reg                    R_CLK;
    reg                    R_RST;
    reg                    R_INC;
    reg   [DATA_WIDTH-1:0] WR_DATA;
    wire  [DATA_WIDTH-1:0] RD_DATA;
    wire                   FULL;
    wire                   EMPTY;



    // generate WCLK
    initial begin
        W_CLK = 0;
        forever begin
            #5 W_CLK = !W_CLK;
        end
    end

    //generate RCLK
    initial begin
        R_CLK = 0;
        forever begin
            #12.5 R_CLK = !R_CLK;
        end
    end

    //Instantiate TOP
    FIFO_TOP DUT (.*);

    //WRITING
    initial begin
        W_RST = 0;
        W_INC = 0;
        WR_DATA = 0;
        repeat(10) @(negedge W_CLK);
        W_RST = 1;
        @(negedge W_CLK);
        repeat(10) write($random);
    end
    //reading
    initial begin
        R_RST = 0;
        R_INC = 0;
        repeat(10) @(negedge R_CLK);
        R_RST = 1;
        @(negedge R_CLK);
        repeat(10) read();
        $stop;
    end
/////////////////////TASKS//////////////////////////

    task write ( input [DATA_WIDTH-1:0] wdata);
        @(negedge W_CLK)
        if (!FULL) begin
            W_INC = 1;
            WR_DATA = wdata;
            $display("WR_DATA = %0d",WR_DATA);    
        end
        else begin
            $display("FIFO is FULL!!");
        end
    endtask

    task read ();
        @(negedge R_CLK)
        if (!EMPTY) begin
            R_INC = 1;
            $display("RD_DATA = %0d",RD_DATA);    
        end
        else begin
            $display("FIFO is EMPTY!!");
        end
    endtask
    
endmodule