module SYS_TOP #(
    parameter DATA_WIDTH = 8,
    parameter RF_ADDR = 4
) (
    input  wire REF_CLK,
    input  wire RST,
    input  wire UART_CLK,
    input  wire RX_IN,
    output wire parity_error,
    output wire stop_error,
    output wire TX_OUT
);

    wire TX_CLK;
    wire RX_CLK;
    wire SYNC_RST_1;
    wire SYNC_RST_2;
    wire [DATA_WIDTH-1:0] TX_P_DATA_S;  // TX_DATA after sync
    wire [DATA_WIDTH-1:0] RX_P_DATA_A; // RX_P_DATA_A before sync
    wire RX_P_DATA_VALID_A;
    wire busy;
    wire [DATA_WIDTH-1:0] RX_P_Data_S;  // RX_P_DATA_A after sync
    wire RX_P_Data_VALID_S;

    wire [DATA_WIDTH-1:0] UART_CONFIG;

    wire W_INC;
    wire R_INC;
    wire [DATA_WIDTH-1:0] TX_P_DATA_A; // TX_DATA before sync
    wire F_FULL;
    wire F_EMPTY;
    //REGFILE
    wire WrEn;
    wire RdEn;
    wire [RF_ADDR-1:0] Addr;
    wire [DATA_WIDTH-1:0] Wr_D;
    wire [DATA_WIDTH-1:0] Rd_D;
    wire Rd_D_Valid;
    
    wire ALU_CLK;
    wire [3:0] FUN;
    wire ALU_EN;
    wire [DATA_WIDTH-1:0] Op_A;
    wire [DATA_WIDTH-1:0] Op_B;
    wire [(2*DATA_WIDTH)-1:0] ALU_OUT;
    wire OUT_VALID;

    wire GATE_EN;

    wire [7:0] Div_Ratio;
    wire [7:0] Div_Ratio_RX;



    UART_TOP UART(
        .TX_CLK(TX_CLK),
        .RX_CLK(RX_CLK),
        .RST(SYNC_RST_2),
        .RX_IN(RX_IN),
        .UART_CONFIG(UART_CONFIG),
        .TX_P_DATA(TX_P_DATA_S),      
        .TX_P_DATA_VALID(!F_EMPTY),
        .RX_P_DATA(RX_P_DATA_A), 
        .RX_P_DATA_VALID(RX_P_DATA_VALID_A),
        .par_error(parity_error),
        .stop_error(stop_error),
        .TX_OUT(TX_OUT),
        .busy(busy)
    );

    PULSE_GEN PULSE_GEN (
        .CLK(TX_CLK),
        .RST(SYNC_RST_2),
        .IN(busy),
        .PULSE(R_INC)    
    );

    Async_fifo #(.D_SIZE(DATA_WIDTH) , .P_SIZE(4)  , .F_DEPTH(8)) U0_UART_FIFO (
        .i_w_clk(REF_CLK),
        .i_w_rstn(SYNC_RST_1),  
        .i_w_inc(W_INC),
        .i_w_data(TX_P_DATA_A),             
        .i_r_clk(TX_CLK),              
        .i_r_rstn(SYNC_RST_2),              
        .i_r_inc(R_INC),              
        .o_r_data(TX_P_DATA_S),             
        .o_full(F_FULL),               
        .o_empty(F_EMPTY)               
    );
    /*
    ASYNC_FIFO_TOP ASYNC_FIFO (
        .W_CLK(REF_CLK),
        .W_RST(SYNC_RST_1),
        .W_INC(W_INC),
        .R_CLK(TX_CLK),
        .R_RST(SYNC_RST_2),
        .R_INC(R_INC),
        .TX_P_DATA_A(TX_P_DATA_A),
        .TX_P_DATA_S(TX_P_DATA_S),
        .FULL(F_FULL),
        .EMPTY(F_EMPTY)
    );*/

    SYS_CTRL SYS_CTRL(
        .CLK(REF_CLK),
        .RST(SYNC_RST_1),
        .RX_P_Data(RX_P_Data_S),
        .RX_P_Data_VALID(RX_P_Data_VALID_S),
        .Rd_D(Rd_D),
        .Rd_D_Valid(Rd_D_Valid),
        .ALU_OUT(ALU_OUT),
        .ALU_OUT_Valid(ALU_OUT_VALID),
        .F_FULL(F_FULL),
        .CLK_G_EN(GATE_EN),
        .WrEn(WrEn),
        .RdEn(RdEn),
        .Address(Addr),
        .Wr_D(Wr_D),
        .ALU_FUN(FUN),
        .ALU_EN(ALU_EN),
        .W_INC(W_INC),
        .TX_P_DATA(TX_P_DATA_A)
    );

    Register_file REG_FILE (
        .CLK(REF_CLK),
        .RST(SYNC_RST_1),
        .WrEn(WrEn),
        .RdEn(RdEn),
        .Address(Addr),
        .WrData(Wr_D),
        .REG0(Op_A),
        .REG1(Op_B),
        .REG2(UART_CONFIG),
        .REG3(Div_Ratio),
        .RdData(Rd_D),
        .RdData_Valid(Rd_D_Valid) 
    );

    ALU ALU (
        .CLK(ALU_CLK),
        .RST(SYNC_RST_1),
        .ALU_FUN(FUN),
        .ALU_EN(ALU_EN),
        .A(Op_A),
        .B(Op_B),
        .ALU_OUT(ALU_OUT), 
        .ALU_OUT_VALID(ALU_OUT_VALID)
        );

    DATA_SYNC DATA_SYNCHRONIZER (
        .CLK(REF_CLK),
        .RST(SYNC_RST_1),
        .bus_enable(RX_P_DATA_VALID_A),
        .unsync_bus(RX_P_DATA_A),
        .enable_pulse_d(RX_P_Data_VALID_S),
        .sync_bus(RX_P_Data_S)
    );

    RST_SYNC RST_SYNC_1 (
        .CLK(REF_CLK),
        .RST(RST),
        .SYNC_RST(SYNC_RST_1)
    );

    RST_SYNC RST_SYNC_2 (
        .CLK(UART_CLK),
        .RST(RST),
        .SYNC_RST(SYNC_RST_2)
    );

    CLK_GATE Clock_Gating(
        .CLK_EN(GATE_EN),
        .CLK(REF_CLK),
        .GATED_CLK(ALU_CLK)
    );

    CLKDIV_MUX CLKDIV_MUX (
        .IN(UART_CONFIG[7:2]),
        .OUT(Div_Ratio_RX)
    );

    ClkDiv RX_CLK_DIV (
        .i_ref_clk(UART_CLK), 
        .i_rst(SYNC_RST_2),     
        .i_clk_en(1'b1),   
        .i_div_ratio(Div_Ratio_RX),
        .o_div_clk(RX_CLK)   
    );

    ClkDiv TX_CLK_DIV (
        .i_ref_clk(UART_CLK), 
        .i_rst(SYNC_RST_2),     
        .i_clk_en(1'b1),   
        .i_div_ratio(Div_Ratio),
        .o_div_clk(TX_CLK)   
    );

    
endmodule