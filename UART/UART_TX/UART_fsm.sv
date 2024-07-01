module FSM #(
    parameter FRAME_WIDTH = 8
) (
    input clk,
    input reset,
    input Data_Valid,
    input par_en,
    input ser_done,
    output reg ser_en,
    output reg busy,
    output reg [1:0] mux_sel
);
    /*//parameters
    localparam IDLE = 0;
    localparam START = 1;
    localparam DATA = 2;
    localparam PARITY = 3;
    localparam STOP = 4;*/


    typedef enum  {
        IDLE,
        START,
        DATA,
        PARITY,
        STOP
    } state_e ;
    
    //internal signals
    state_e current_state, next_state;

    
    // state trasition
    always @( posedge clk or negedge reset ) begin
        if (!reset) begin
            current_state <= 0;
        end
        else begin
            current_state <= next_state;
        end
    end



    //next state logic
    always @(*) begin
        case (current_state)
            IDLE : begin
               if (Data_Valid) begin
                    next_state = START; 
                end 
                else begin
                    next_state = IDLE;
                end
            end
            START : begin
                next_state = DATA;
            end
            DATA : begin
                if (ser_done) begin
                    if (par_en) begin
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
            PARITY : begin
                next_state = STOP;
            end
            STOP : begin
                if (Data_Valid) begin
                    next_state= START;
                end
                else begin
                    next_state = IDLE;
                end
            end

            default: next_state = IDLE;
        endcase
    end

    //OUTPUT LOGIC
    always @(*) begin
        case (current_state)
            IDLE : begin
              ser_en = 0;
              mux_sel = 0; 
              busy = 0; 
            end 
            START : begin
                ser_en = 1;
                mux_sel = 1;
                busy = 1;
            end
            DATA : begin
                ser_en = 1;
                mux_sel = 2;
                busy = 1;
            end
            PARITY : begin
                ser_en = 0;
                mux_sel = 3;
                busy = 1;
            end
            STOP : begin
                ser_en = 0;
                mux_sel = 0;
                busy = 1; 
            end
            default:begin
                ser_en = 0 ;
                mux_sel = 0;
                busy = 0;
            end  
        endcase
    end
    
    
   


endmodule