module UART_TOP (
    input  wire         TX_CL,
    input  wire         RX_CLK,
    input  wire         SYNC_RST_2,
    input  wire [7:0]   UART_CONFIG,
    input  wire         RD_DATA,
    input  wire         F_EMPTY,
    output wire         RX_DATA,
    output wire         RX_DATA_VALID,
    output wire         TX_OUT,
    output wire         busy
);
    
    wire par_error;
    wire stop_error;

    UART_TX_TOP TX (
        .CLK(TX_CLK) ,
        .RST(SYNC_RST_2),
        .Data_Valid(!F_EMPTY),
        .par_en(UART_CONFIG[0]),
        .PAR_TYP(UART_CONFIG[1]),
        .P_Data(RD_DATA),
        .TX_OUT(TX_OUT),
        .busy(busy)
    );

    UART_RX_TOP RX (
        .CLK(RX_CLK),
        .RST(SYNC_RST_2),
        .PAR_EN(UART_CONFIG[0]),
        .PAR_TYP(UART_CONFIG[1]),
        .Prescale(UART_CONFIG[7:2]),
        .RX_IN(RX_IN),
        .P_DATA(RX_DATA),
        .par_error(par_error),
        .stop_error(stop_error),
        .data_valid(RX_DATA_VALID)
    );


endmodule