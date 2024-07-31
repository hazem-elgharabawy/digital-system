module UART_TX_TOP #(
    parameter FRAME_WIDTH = 8,
    parameter COUNTER_WIDTH = 3
) (
    input clk , reset,
    input Data_Valid,
    input par_en,
    input PAR_TYP,
    input [FRAME_WIDTH-1:0] P_Data,
    output TX_OUT,
    output busy,
    //DFT PORTS
    input test_mode,
    input scan_clk,
    input scan_rst,
    input SE,
    input SI,
    output SO
    
);
    
    //internal signals 
    wire ser_en;
    wire ser_done;
    wire par_bit;
    wire [1:0] mux_sel;
    wire start_bit;
    wire stop_bit;
    wire ser_data;
    // DFT signals
    wire M_CLK;
    wire M_RST;

    assign start_bit  = 0;
    assign stop_bit  = 1;

    //DFT_insertion
    mux2X1 mux_CLK (.IN_0(clk),.IN_1(scan_clk),.SEL(test_mode),.OUT(M_CLK));
    mux2X1 mux_RST (.IN_0(reset),.IN_1(scan_rst),.SEL(test_mode),.OUT(M_RST));

    // instantiation
    serializer serializer (
        .clk(M_CLK),
        .reset(M_RST), 
        .ser_en(ser_en),
        .Data_Valid(Data_Valid),
        .P_Data(P_Data),
        .ser_done(ser_done),
        .ser_data(ser_data)
    );
    parity_calc parity (
        .clk(M_CLK),
        .reset(M_RST),
        .Data_Valid(Data_Valid),
        .PAR_TYP(PAR_TYP),
        .P_Data(P_Data),
        .par_bit(par_bit)
    );

    FSM fsm (
        .clk(M_CLK),
        .reset(M_RST),
        .Data_Valid(Data_Valid),
        .par_en(par_en),
        .ser_done(ser_done),
        .ser_en(ser_en),
        .busy(busy),
        .mux_sel(mux_sel)
    );
    
    MUX mux (
        .IN0(ser_data),
        .IN1(par_bit),
        .mux_sel(mux_sel),
        .TX_OUT(TX_OUT)
        );





endmodule