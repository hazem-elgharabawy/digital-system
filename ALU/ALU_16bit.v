module ALU_16Bit (
    input wire          CLK,
    input wire          RST,
    input wire          ALU_EN,
    input wire [3:0]    ALU_FUN,
    input wire [15:0]   A,
    input wire [15:0]   B,
    output reg [15:0]   ALU_OUT, 
    output reg          ALU_OUT_VALID
);
    reg [15:0] ALU_OUT_COMB;
    reg ALU_OUT_VALID_COMB;


    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            ALU_OUT <= 0;
            ALU_OUT_VALID <= 0;
        end
        else begin
            ALU_OUT <= ALU_OUT_COMB;
            ALU_OUT_VALID <= ALU_OUT_VALID_COMB; 
        end
    end


    always @(*) begin
        ALU_OUT_VALID_COMB = 0;
        ALU_OUT_COMB = 0;
        if (ALU_EN) begin
        ALU_OUT_VALID_COMB = 1;
        case (ALU_FUN)
           4'b0000 : begin 
                ALU_OUT_COMB = A + B;
                
           end
           4'b0001 : begin
                ALU_OUT_COMB = A - B;
           end
           4'b0010 :begin 
                ALU_OUT_COMB = A * B;
           end

           4'b0011 : begin 
                ALU_OUT_COMB = A / B;
           end
           4'b0100 : begin
                ALU_OUT_COMB = A & B;

           end
           4'b0101 : begin
                ALU_OUT_COMB = A | B;
                
           end
           4'b0110 : begin
                ALU_OUT_COMB = ~(A & B);
            
           end
           4'b0111 : begin
                ALU_OUT_COMB = ~(A | B);

           end
           4'b1000 : begin
                ALU_OUT_COMB = A ^ B;
                
           end
           4'b1001 : begin
                ALU_OUT_COMB = ~(A ^ B);
                
           end    
           4'b1010 : begin
                if (A == B)
                    ALU_OUT_COMB = 1;
                else 
                    ALU_OUT_COMB <= 0;
            end
            4'b1011 : begin
                if (A > B)
                    ALU_OUT_COMB = 2;
                else 
                    ALU_OUT_COMB = 0;
            end
            4'b1100 : begin
                if (A < B)
                    ALU_OUT_COMB = 3;
                else 
                    ALU_OUT_COMB = 0;
    
            end
            4'b1101 : begin
                ALU_OUT_COMB = A >> 1;
            end
            4'b1110: begin
                ALU_OUT_COMB = A << 1;
            end
            default:begin
                ALU_OUT_COMB = 16'b0;
            end 
        endcase
    end
    end
endmodule