module DATA_SYNC #(
    parameter NUM_STAGES = 2,
    parameter BUS_WIDTH = 8
) (
    input  wire                 CLK,
    input  wire                 RST,
    input  wire                 bus_enable,
    input  wire [BUS_WIDTH-1:0] unsync_bus,
    output reg                  enable_pulse,
    output reg  [BUS_WIDTH-1:0] sync_bus
);

    //chain of flip flops
    reg [NUM_STAGES-1:0] en_sync_chain;

    //last flip flop out
    wire last_ff_out; 
    assign last_ff_out = en_sync_chain[NUM_STAGES-1];
    
    // pulse gen signals
    reg pulse_gen_ff;
    wire pulse_gen_out;
    

    //mux
    wire [BUS_WIDTH-1:0] mux_out;
    assign mux_out = (pulse_gen_out)? unsync_bus : 0;


    //multi FLIP FLOP 
    always @(posedge CLK or negedge RST) begin
        if(!RST)begin
            en_sync_chain <=0;        
        end
        else begin
            en_sync_chain <= {en_sync_chain[NUM_STAGES-2:0],bus_enable};
        end
    end

    //pulse gen   
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            pulse_gen_ff <= 0;
        end
        else begin
            pulse_gen_ff <= last_ff_out;
        end
    end
    assign pulse_gen_out = ((!pulse_gen_ff) && last_ff_out);
    
    //bit sync
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            sync_bus <= 0;
            enable_pulse <= 0;
        end
        else begin
            sync_bus <= mux_out;
            enable_pulse <= pulse_gen_out;
        end
    end
    
    
    
    

endmodule