module SYS_TOP (
    input  wire REF_CLK,
    input  wire RST,
    input  wire UART_CLK,
    input  wire RX_IN,
    output wire TX_OUT
);

    wire TX_CLK;
    wire RX_CLK;
    wire SYNC_RST_1;
    wire SYNC_RST_2;
    wire RD_DATA;  // TX_DATA after sync
    wire F_EMPTY; 
    wire RX_DATA; // RX_DATA before sync
    wire RX_DATA_VALID;
    wire busy;
    wire RX_FRAME;  // RX_DATA after sync
    wire RX_FRAME_VALID;

    wire [7:0] UART_CONFIG;

    wire W_INC;
    wire R_INC;
    wire WR_DATA; // TX_DATA before sync
    wire F_FULL;
    wire F_EMPTY;
    //REGFILE
    wire WrEn;
    wire RdEn;
    wire Addr;
    wire Wr_d;
    wire Rd_d;

    wire ALU_CLK;
    wire FUN;
    wire Op_A;
    wire Op_B;
    wire ALU_OUT;
    wire OUT_VALID;

    wire GATE_EN;




    UART_TOP UART(
        .TX_CLK(TX_CLK),
        .RX_CLK(RX_CLK),
        .SYNC_RST_2(SYNC_RST_2),
        .UART_CONFIG(UART_CONFIG),
        .RD_DATA(RD_DATA),
        .F_EMPTY(F_EMPTY),
        .RX_DATA(RX_DATA),
        .RX_DATA_VALID(RX_DATA_VALID),
        .TX_OUT(TX_OUT),
        .busy(busy),
    );

    ASYNC_FIFO_TOP ASYNC_FIFO (
        .W_CL(REF_CLK),
        .W_RST(SYNC_RST_1),
        .W_INC(W_INC),
        .R_CLK(TX_CLK),
        .R_RST(SYNC_RST_2),
        .R_INC(R_INC),
        .WR_DATA(WR_DATA),
        .RD_DATA(RD_DATA),
        .FULL(F_FULL),
        .EMPTY(F_EMPTY)
    );

    Register_file REG_FILE (
        .CLK(REF_CLK),
        .RST(SYNC_RST_1),
        .WrEn(WrEn),
        .RdEn(RdEn),
        .Address(Addr),
        .WrData(Wr_d),
        .RdData(Rd_d) 
    );

    ALU_16Bit ALU (
        .CLK(ALU_CLK),
        .RST(SYNC_RST_1),
        .ALU_FUN(FUN),
        .A(Op_A),
        .B(Op_B),
        .ALU_OUT(ALU_OUT), 
        .OUT_VALID(OUT_VALID)
        );

    DATA_SYNC DATA_SYNCHRONIZER (
        .CLK(REF_CLK),
        .RST(SYNC_RST_1),
        .bus_enable(RX_DATA_VALID),
        .unsync_bus(RX_DATA),
        .enable_pulse(RX_FRAME_VALID),
        .sync_bus(RX_FRAME)
    );

    RST_SYNC RST_SYNC_1 (
        .CLK(REF_CLK),
        .RST(RST),
        .SYNC_RST(SYNC_RST_1)
    );

    RST_SYNC RST_SYNC_2 (
        .CLK(UART_CLK),
        .RST(RST),
        .SYNC_RST(SYNC_RST_1)
    );

    CLK_GATE Clock_Gating(
        .CLK_EN(GATE_EN),
        .CLK(REF_CLK),
        .GATED_CLK(ALU_CLK)
    );

    ClkDiv RX_CLK_DIV (
        .i_ref_clk(UART_CLK), 
        .i_rst(SYNC_RST_2),     
        .i_clk_en(),   
        .i_div_ratio(Prescale),
        .o_div_clk(RX_CLK)   
    );

    ClkDiv TX_CLK_DIV (
        .i_ref_clk(UART_CLK), 
        .i_rst(SYNC_RST_2),     
        .i_clk_en(),   
        .i_div_ratio(32),
        .o_div_clk(TX_CLK)   
    );

    
endmodule