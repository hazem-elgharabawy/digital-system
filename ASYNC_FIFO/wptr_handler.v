module wptr_handler #(
    parameter PTR_WIDTH = 3
) (
    input wire                wclk,
    input wire                wrst_n,
    input wire                winc,
    input wire  [PTR_WIDTH:0] wq2_rptr,
    output reg [PTR_WIDTH:0] waddr,
    output wire [PTR_WIDTH:0] wptr,
    output reg                wfull
);

    wire full;
    assign full = (wq2_rptr[PTR_WIDTH-1] != wptr[PTR_WIDTH-1]) && (wq2_rptr[PTR_WIDTH-2] != wptr[PTR_WIDTH-2]) && (wq2_rptr[PTR_WIDTH-3:0] == wptr[PTR_WIDTH-3:0]);
    
    //registering full flag
    always@(posedge wclk or negedge wrst_n) begin
        if(!wrst_n) begin
            wfull <= 0;
        end
        else begin
            wfull <= full;    
        end           
    end

    // INCREMENTING WRITE POINTER   
    always @(posedge wclk or negedge wrst_n) begin
        if (!wrst_n) begin
            waddr <= 0;
        end
        else if (winc && !wfull) begin
            waddr <= waddr + 1;
        end
    end

    //CONVERT BINARY ADDRESS TO GRAY POINTER
    b2g_conv #(.WIDTH(PTR_WIDTH)) wconv (.binary(waddr),.gray(wptr));




    
endmodule