module FIFO_TOP #(
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 8
) (
    input  wire                   W_CLK,
    input  wire                   W_RST,
    input  wire                   W_INC,
    input  wire                   R_CLK,
    input  wire                   R_RST,
    input  wire                   R_INC,
    input  wire  [DATA_WIDTH-1:0] WR_DATA,
    output wire  [DATA_WIDTH-1:0] RD_DATA,
    output wire                   FULL,
    output wire                   EMPTY
);

    parameter PTR_WIDTH = $clog2(FIFO_DEPTH); 
    wire wfull;
    wire [PTR_WIDTH:0] waddr;
    wire [PTR_WIDTH:0] raddr;
    wire [PTR_WIDTH:0] wptr;
    wire [PTR_WIDTH:0] rptr;
    wire [PTR_WIDTH:0] wq2_rptr;
    wire [PTR_WIDTH:0] rq2_wptr;

    assign FULL = wfull;

    FIFO_mem #(.DATA_WIDTH(DATA_WIDTH),.FIFO_DEPTH(FIFO_DEPTH),.PTR_WIDTH(PTR_WIDTH)) main_mem (
        .wclk(W_CLK),
        .wclken(W_INC && !wfull),
        .waddr(waddr),
        .raddr(raddr),
        .wdata(WR_DATA),
        .rdata(RD_DATA)
    );

    wptr_handler #(.PTR_WIDTH(PTR_WIDTH)) W_handler (
        .wclk(W_CLK),
        .wrst_n(W_RST),
        .winc(W_INC),
        .wq2_rptr(wq2_rptr),
        .waddr(waddr),
        .wptr(wptr),
        .wfull(wfull)
    );

    rptr_handler #(.PTR_WIDTH(PTR_WIDTH)) R_handler (
        .rclk(R_CLK),
        .rrst_n(R_RST),
        .rinc(R_INC),
        .rq2_wptr(rq2_wptr),
        .rptr(rptr),
        .raddr(raddr),
        .rempty(EMPTY)
    );

    synchronizer #(.WIDTH(PTR_WIDTH)) sync_r2w (
        .clk(W_CLK),
        .rst_n(W_RST),
        .d_in(rptr),
        .d_out(wq2_rptr)
    );

    synchronizer #(.WIDTH(PTR_WIDTH)) sync_w2r (
        .clk(R_CLK),
        .rst_n(R_RST),
        .d_in(wptr),
        .d_out(rq2_wptr)
    );    

endmodule