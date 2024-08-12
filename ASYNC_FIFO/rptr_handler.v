module rptr_handler #(
    parameter PTR_WIDTH = 3
) (
    input  wire                   rclk,
    input  wire                   rrst_n,
    input  wire                   rinc,
    input  wire  [PTR_WIDTH:0]    rq2_wptr,
    output wire  [PTR_WIDTH:0]    rptr,
    output reg   [PTR_WIDTH:0]    raddr,
    output reg                    rempty
);

    wire empty;

    assign empty = (rq2_wptr == rptr);
    
    //REGISTERING EMPTY FLAG
    always@(posedge rclk or negedge rrst_n) begin
        if(!rrst_n) begin
            rempty <= 1;
        end
        else begin
            rempty <= empty;    
        end           
    end


    //ICREMENTING READ ADDRESS
    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
           raddr <= 0; 
        end
        else if (rinc && !rempty) begin
            raddr <= raddr + 1;
        end
    end

    //CONVERT BINARY ADDRESS TO GRAY POINTER
    b2g_conv #(.WIDTH(PTR_WIDTH)) rconv (.binary(raddr),.gray(rptr));
    
    

    


    
endmodule