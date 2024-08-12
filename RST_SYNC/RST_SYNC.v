module RST_SYNC #(
    parameter NUMBER_OF_STAGES = 2
) (
    input CLK,
    input RST,
    output SYNC_RST
);
    reg [NUMBER_OF_STAGES-1:0] sync_chain;

    assign SYNC_RST = sync_chain[NUMBER_OF_STAGES-1];
    
    always @(posedge CLK or negedge RST) begin
        if(!RST) begin
            sync_chain <=0;
        end
        else begin
            sync_chain <= {sync_chain[NUMBER_OF_STAGES-2:0],1'b1};
        end
    end
endmodule
