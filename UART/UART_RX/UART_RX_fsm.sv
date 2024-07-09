module FSM (
    input clk,
    input rst,
    input PAR_EN,
    input RX_IN,
    input [5:0] Prescale,
    input [4:0] edge_count,
    input [3:0] bit_count,
    input stop_error,
    input start_glitch,
    input par_error,
    output reg data_sample_en,
    output reg counter_enable,
    output reg deser_en,
    output reg data_valid,
    output reg stop_check_en,
    output reg start_check_en,
    output reg par_check_en
);
    
    //states def
    typedef enum  {
        IDLE,
        START,
        DATA,
        PARITY,
        STOP
    } state_e ;

    state_e current_state, next_state;

    // state trasition
    always @( posedge clk or negedge rst ) begin
        if (!rst) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end
    
    //next state logic
    always @(*) begin
        case (current_state)
            IDLE : begin
               if (!RX_IN) begin
                    next_state = START; 
                end 
                else begin
                    next_state = IDLE;
                end
            end
            START : begin
                if (edge_count == (Prescale -1)) begin
                    if (start_glitch) begin
                        next_state = IDLE;
                    end
                    else begin
                        next_state = DATA;
                    end 
                end
                else begin
                    next_state = START;
                end                
            end
            DATA : begin
                if (edge_count == (Prescale -1) ) begin
                    if (bit_count == 9) begin
                        if (PAR_EN) begin
                            next_state = PARITY;    
                        end
                        else begin
                            next_state = STOP;
                        end
                    end
                    else begin
                        next_state = DATA;
                    end
                end
                else begin
                    next_state = DATA;
                end
            end
            PARITY : begin
                if (edge_count == (Prescale -1)) begin
                    if(par_error ==1) begin
                        next_state = IDLE;
                    end
                    else begin
                        next_state = STOP;
                    end    
                end
                else begin
                    next_state = PARITY;
                end
            end
            STOP : begin
                if (edge_count == (Prescale -1)) begin
                    if (stop_error) begin
                        next_state= IDLE;
                    end
                    else begin
                        if (!RX_IN) begin
                            next_state = START;
                        end
                        else begin
                            next_state = IDLE;
                        end
                    end
                end
                else begin
                    next_state = STOP;
                end
            end

            default: next_state = IDLE;
        endcase
    end


    //OUTPUT LOGIC
    always @(*) begin
 
        case (current_state)
            IDLE : begin
                data_sample_en = 0;
                counter_enable = 0;
                deser_en = 0;
                data_valid = 0;
                stop_check_en = 0;
                start_check_en = 0;
                par_check_en = 0;
            end 
            START : begin
                data_sample_en = 1;
                counter_enable = 1;
                deser_en = 0;
                data_valid = 0;
                stop_check_en = 0;
                start_check_en = 1;
                par_check_en = 0;
            end
            DATA : begin
                data_sample_en = 1;
                counter_enable = 1;
                deser_en = 1;
                data_valid = 0;
                stop_check_en = 0;
                start_check_en = 0;
                par_check_en = 0;
            end
            PARITY : begin
                data_sample_en = 1;
                counter_enable = 1;
                deser_en = 0;
                data_valid = 0;
                stop_check_en = 0;
                start_check_en = 0;
                par_check_en = 1;
            end
            STOP : begin 
                if (edge_count >= ((Prescale/2)+2))begin
                    if (stop_error) begin
                        data_valid = 0;
                        data_sample_en = 0;
                        counter_enable = 0;
                        deser_en = 0;
                        stop_check_en = 1;
                        start_check_en = 0;
                        par_check_en = 0;
                        
                    end
                    else begin
                        data_valid = 1;
                        data_sample_en = 0;
                        counter_enable = 0;
                        deser_en = 0;
                        stop_check_en = 1;
                        start_check_en = 0;
                        par_check_en = 0;
                    end
                end
                else begin
                    data_valid = 0;
                    data_sample_en = 1;
                    counter_enable = 1;
                    deser_en = 0;
                    stop_check_en = 1;
                    start_check_en = 0;
                    par_check_en = 0;
                end
            end
            default:begin
                data_sample_en = 0;
                counter_enable = 0;
                deser_en = 0;
                data_valid = 0;
                stop_check_en = 0;
                start_check_en = 0;
                par_check_en = 0;
            end  
        endcase
    end
endmodule

