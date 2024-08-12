module FIFO_mem #(
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 8,
    parameter PTR_WIDTH = 3
) (
    input  wire                   wclk,
    input  wire                   wclken,
    input  wire  [PTR_WIDTH:0] waddr,
    input  wire  [PTR_WIDTH:0] raddr,
    input  wire  [DATA_WIDTH-1:0] wdata,
    output wire  [DATA_WIDTH-1:0] rdata

);
    
    reg [DATA_WIDTH-1:0] mem [0:FIFO_DEPTH-1];

    always @(posedge wclk) begin
        if (wclken) begin
            mem[waddr[PTR_WIDTH-1:0]] <= wdata;
        end
    end
    assign rdata = mem[raddr[PTR_WIDTH-1:0]];



endmodule