module UART_TX_TOP #(
    parameter FRAME_WIDTH = 8,
    parameter COUNTER_WIDTH = 3
) (
    input clk , reset,
    input Data_Valid,
    input par_en, PAR_TYP,
    input [FRAME_WIDTH-1:0] P_Data,
    output TX_OUT, busy
);
    
    //internal signals 
    wire ser_en;
    wire ser_done;
    wire par_bit;
    wire [1:0] mux_sel;
    wire start_bit;
    wire stop_bit;
    wire ser_data;


    assign start_bit  = 0;
    assign stop_bit  = 1;

    // instantiation
    serializer serializer (.*);
    parity_calc parity (.*);
    FSM fsm (.*);
    
    mux mux (
        .IN0(stop_bit),
        .IN1(start_bit),
        .IN3(ser_data),
        .IN4(par_bit),
        .mux_sel(mux_sel),
        .TX_OUT(TX_OUT)
        );





endmodule