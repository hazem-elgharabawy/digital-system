module UART_TOP (
    input  wire         TX_CLK,
    input  wire         RX_CLK,
    input  wire         RST,
    input  wire         RX_IN,
    input  wire [7:0]   UART_CONFIG,
    input  wire [7:0]   TX_P_DATA,             //TX_P_DATA
    input  wire         TX_P_DATA_VALID,
    output wire [7:0]   RX_P_DATA, 
    output wire         RX_P_DATA_VALID,
    output wire         par_error,
    output wire         stop_error,
    output wire         TX_OUT,
    output wire         busy
);
    

    UART_TX_TOP TX (
        .CLK(TX_CLK) ,
        .RST(RST),
        .Data_Valid(TX_P_DATA_VALID),
        .par_en(UART_CONFIG[0]),
        .PAR_TYP(UART_CONFIG[1]),
        .P_Data(TX_P_DATA),
        .TX_OUT(TX_OUT),
        .busy(busy)
    );

    UART_RX_TOP RX (
        .CLK(RX_CLK),
        .RST(RST),
        .PAR_EN(UART_CONFIG[0]),
        .PAR_TYP(UART_CONFIG[1]),
        .Prescale(UART_CONFIG[7:2]),
        .RX_IN(RX_IN),
        .P_DATA(RX_P_DATA),
        .par_error(par_error),
        .stop_error(stop_error),
        .data_valid(RX_P_DATA_VALID)
    );


endmodule