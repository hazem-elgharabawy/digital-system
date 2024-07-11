module TOP (
    input           clk,
    input           rst,
    input           PAR_TYP,
    input           PAR_EN,
    input  [5:0]    Prescale,
    input           RX_IN,
    output [7:0]    P_DATA,
    output          par_error,
    output          stop_error,
    output          data_valid);
    
    wire data_sample_en, counter_enable, deser_en, stop_check_en, start_check_en, par_check_en;  

    wire start_glitch;

    wire [4:0]edge_count;
    wire [3:0] bit_count;
    wire sampled_bit;

    data_sampling sampler (
        .clk(clk),
        .rst(rst),
        .RX_IN(RX_IN),
        .Prescale(Prescale),
        .data_sample_en(data_sample_en),
        .edge_count(edge_count),
        .sampled_bit(sampled_bit)
    );

    FSM fsm(
        .clk(clk),
        .rst(rst),
        .PAR_EN(PAR_EN),
        .RX_IN(RX_IN),
        .Prescale(Prescale),
        .edge_count(edge_count),
        .bit_count(bit_count),
        .stop_error(stop_error),
        .start_glitch(start_glitch),
        .par_error(par_error),
        .data_sample_en(data_sample_en),
        .counter_enable(counter_enable),
        .deser_en(deser_en),
        .data_valid(data_valid),
        .stop_check_en(stop_check_en),
        .start_check_en(start_check_en),
        .par_check_en(par_check_en)
    );

    edge_bit_counter edge_bit_counter(
        .clk(clk),
        .rst(rst),
        .Prescale(Prescale),
        .counter_enable(counter_enable),
        .PAR_EN(PAR_EN),
        .edge_count(edge_count),
        .bit_count(bit_count)
    );

    // check deserializer clock
    deserializer deserializer (
        .clk(clk),
        .rst(rst),
        .sampled_bit(sampled_bit),
        .deser_en(deser_en),
        .Prescale(Prescale),
        .edge_count(edge_count),
        .P_DATA(P_DATA)
    );

    start_check start_check (
        .clk(clk),
        .rst(rst),
        .Prescale(Prescale),
        .edge_count(edge_count),
        .start_check_en(start_check_en),
        .sampled_bit(sampled_bit),
        .start_glitch(start_glitch) 
    );

    stop_check stop_check (
        .clk(clk),
        .rst(rst),
        .Prescale(Prescale),
        .edge_count(edge_count),
        .stop_check_en(stop_check_en),
        .sampled_bit(sampled_bit),
        .stop_error(stop_error)
    );

    // P_DATA as an input???????
    parity_check parity_check (
        .clk(clk),
        .rst(rst),
        .Prescale(Prescale),
        .edge_count(edge_count),
        .PAR_TYP(PAR_TYP),
        .par_check_en(par_check_en),
        .sampled_bit(sampled_bit),
        .P_data(P_DATA),
        .par_error(par_error) 
    );

endmodule