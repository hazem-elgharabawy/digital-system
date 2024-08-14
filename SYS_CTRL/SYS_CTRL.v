module SYS_CTRL (
    input wire          CLK,
    input wire          RST,
    input wire [7:0]    RX_P_Data,
    input wire          RX_P_Data_VALID,
    input wire [7:0]    Rd_D,
    input wire          Rd_D_Valid,
    input wire [15:0]   ALU_OUT,
    input wire          ALU_OUT_Valid,
    input wire          F_FULL,
    output reg          CLK_G_EN,
    output reg          WrEn,
    output reg          RdEn,
    output reg [3:0]    Address,
    output reg [7:0]    Wr_D,
    output reg [3:0]    ALU_FUN,
    output reg          ALU_EN,
    output reg          W_INC,
    output reg [7:0]    WR_DATA
);

    //states
    parameter  IDLE = 0;
    parameter  RF_WR_ADDR = 1;
    parameter  RF_WR_DATA = 2;
    parameter  RF_RD_ADDR = 3;
    parameter  ALU_A = 4;
    parameter  ALU_B = 5;
    parameter  ALU_FUNC = 6;

    reg [2:0] current_state;
    reg [2:0] next_state;



    // state trasition
    always @( posedge CLK or negedge RST ) begin
        if (!RST) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end


    //next state logic
    always @(*) begin
        case (current_state)
            IDLE: begin
                if (RX_P_Data_VALID && RX_P_Data==8'hAA) begin
                    next_state = RF_WR_ADDR;
                end
                else if (RX_P_Data_VALID && RX_P_Data==8'hBB) begin
                    next_state = RF_RD_ADDR;
                end 
                else if (RX_P_Data_VALID && RX_P_Data==8'hCC) begin
                    next_state = ALU_A;
                end
                else if (RX_P_Data_VALID && RX_P_Data==8'hDD) begin
                    next_state = ALU_FUNC;
                end
                else next_state = IDLE;

            end 
            RF_WR_ADDR: begin
                next_state = RF_WR_DATA;
            end
            RF_WR_DATA: begin
                next_state = IDLE;;
            end
            RF_RD_ADDR: begin
                next_state = IDLE;
            end
            ALU_A: begin
                next_state = ALU_B;
            end
            ALU_B: begin
                next_state = ALU_FUNC;
            end
            ALU_FUNC: begin
                next_state = IDLE;
            end

            default: next_state = IDLE; 
        endcase
    end

    //output logic
    always @(*) begin
        case (current_state)
            IDLE:begin
                CLK_G_EN=0;
                WrEn=0;
                RdEn=0;
                Address=0;
                Wr_D=0;
                ALU_FUN=0;
                ALU_EN=0;
                W_INC=0;
                WR_DATA=0;
            end 
            RF_WR_ADDR:begin
                CLK_G_EN=0;
                WrEn=0;
                RdEn=0;
                Address=RX_P_Data;
                Wr_D=0;
                ALU_FUN=0;
                ALU_EN=0;
                W_INC=0;
                WR_DATA=0;
            end
            RF_WR_DATA:begin
                CLK_G_EN=0;
                WrEn=1;
                RdEn=0;
                Wr_D=RX_P_Data;
                ALU_FUN=0;
                ALU_EN=0;
                W_INC=0;
                WR_DATA=0;
            end
            RF_RD_ADDR:begin
                CLK_G_EN=0;
                WrEn=0;
                RdEn=1;
                Address=RX_P_Data;
                Wr_D=0;
                ALU_FUN=0;
                ALU_EN=0;
                W_INC=1;
                WR_DATA=Rd_D;
            end
            ALU_A:begin
                CLK_G_EN=0;
                WrEn=1;
                RdEn=0;
                Address=8'h00;
                Wr_D=RX_P_Data;
                ALU_FUN=0;
                ALU_EN=0;
                W_INC=0;
                WR_DATA=0;
            end
            ALU_B:begin
                CLK_G_EN=0;
                WrEn=1;
                RdEn=0;
                Address=8'h01;
                Wr_D=RX_P_Data;
                ALU_FUN=0;
                ALU_EN=0;
                W_INC=0;
                WR_DATA=0;
            end
            ALU_FUNC:begin
                CLK_G_EN=1;
                WrEn=0;
                RdEn=0;
                Address=0;
                Wr_D=0;
                ALU_FUN=RX_P_Data;
                ALU_EN=1;
                if (ALU_OUT_VALID && !F_FULL) begin
                    W_INC = 1;
                    WR_DATA = ALU_OUT;    
                end
                else begin
                    W_INC = 0;
                    WR_DATA = 0; 
                end
            end            
            default: begin
                CLK_G_EN=0;
                WrEn=0;
                RdEn=0;
                Address=0;
                Wr_D=0;
                ALU_FUN=0;
                ALU_EN=0;
                W_INC=0;
                WR_DATA=0;
            end
        endcase
    end

endmodule