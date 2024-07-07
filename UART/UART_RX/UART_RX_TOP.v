module TOP (
    input           clk,
    input           rst,
    input           PAR_TYP,
    input           PAR_EN,
    input           Prescale,
    input           RX_IN,
    output [7:0]    P_DATA,
    output          data_valid
);
    
    wire clk_32, clk_16, clk_1;
    
    
    wire data_sample_en, counter_enable, deser_en, stop_check_en, start_check_en, par_check_en;  

    wire stop_error, par_error, start_glitch;

    wire edge_count, bit_count, sampled_bit;


    CLK_DIV clk_div (
        .clk_32(clk),
        .rst(rst),
        .clk_16(clk_16),
        .clk_8(clk_8),
        .clk_1(clk_1)
        );

    data_sampling sampler (
        clk_8(clk_8),
        clk_16(clk_16),
        clk_32(clk),
        rst(rst),
        RX_IN(RX_IN),
        Prescale(Prescale),
        data_sample_en(data_sample_en),
        edge_count(edge_count),
        sampled_bit(sampled_bit)
    );

    FSM fsm (
        .clk(.clk_1),
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
        .clk_16(clk_16),
        .clk_8(clk_8),
        .clk_32(clk),
        .rst(rst),
        .Prescale(Prescale),
        .counter_enable(counter_enable),
        .edge_count(edge_count),
        .bit_count(bit_count)
    );

    // check deserializer clock
    deserializer deserializer (
        .clk
        .rst,
        .sampled_bit(sampled_bit),
        .deser_en(deser_en),
        .P_DATA(P_DATA)
    );

    start_check start_check (
        .start_check_en(start_check_en),
        .sampled_bit(sampled_bit),
        .start_glitch(start_glitch) 
    );

    stop_check stop_check (
        .stop_check_en(stop_check_en),
        .sampled_bit(sampled_bit),
        .stop_err(stop_err)
    );

    // P_DATA as an input???????
    parity_check parity_check (
        .PAR_TYP(PAR_TYP),
        .parity_check_en(parity_check_en),
        .sampled_bit(sampled_bit),
        .P_data(P_DATA),
        .par_err(par_err) 
    );








    
endmodule