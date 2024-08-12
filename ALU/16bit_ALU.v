module ALU_16Bit (
    input wire [15:0] A, B,
    input wire [3:0] ALU_FUN,
    input wire CLK,
    output reg [15:0] ALU_OUT,
    output reg Arith_Flag, Logic_Flag, CMP_Flag, Shift_Flag
);
    always @(posedge CLK) begin
        case (ALU_FUN)
           4'b0000 : begin 
                ALU_OUT <= A + B;
                Arith_Flag <= 1;
                Logic_Flag <= 0;
                CMP_Flag <= 0;
                Shift_Flag <= 0;
           end
           4'b0001 : begin
                ALU_OUT <= A - B;
                Arith_Flag <= 1;
                Logic_Flag <= 0;
                CMP_Flag <= 0;
                Shift_Flag <= 0;
           end
           4'b0010 :begin 
                ALU_OUT <= A * B;
                Arith_Flag <= 1;
                Logic_Flag <= 0;
                CMP_Flag <= 0;
                Shift_Flag <= 0;
           end

           4'b0011 : begin 
                ALU_OUT <= A / B;
                Arith_Flag <= 1;
                Logic_Flag <= 0;
                CMP_Flag <= 0;
                Shift_Flag <= 0;
           end
           4'b0100 : begin
                ALU_OUT <= A & B;
                Arith_Flag <= 0;
                Logic_Flag <= 1;
                CMP_Flag <= 0;
                Shift_Flag <= 0;
           end
           4'b0101 : begin
                ALU_OUT <= A | B;
                Arith_Flag <= 0;
                Logic_Flag <= 1;
                CMP_Flag <= 0;
                Shift_Flag <= 0;
           end
           4'b0110 : begin
                ALU_OUT <= ~(A & B);
                Arith_Flag <= 0;
                Logic_Flag <= 1;
                CMP_Flag <= 0;
                Shift_Flag <= 0;
           end
           4'b0111 : begin
                ALU_OUT <= ~(A | B);
                Arith_Flag <= 0;
                Logic_Flag <= 1;
                CMP_Flag <= 0;
                Shift_Flag <= 0;
           end
           4'b1000 : begin
                ALU_OUT <= A ^ B;
                Arith_Flag <= 0;
                Logic_Flag <= 1;
                CMP_Flag <= 0;
                Shift_Flag <= 0;
           end
           4'b1001 : begin
                ALU_OUT <= ~(A ^ B);
                Arith_Flag <= 0;
                Logic_Flag <= 1;
                CMP_Flag <= 0;
                Shift_Flag <= 0;
           end    
           4'b1010 : begin
                if (A == B)
                    ALU_OUT <= 1;
                else 
                    ALU_OUT  <= 0;
                Arith_Flag <= 0;
                Logic_Flag <= 0;
                CMP_Flag <= 1;
                Shift_Flag <= 0;       
           end
            4'b1011 : begin
                if (A > B)
                    ALU_OUT <= 2;
                else 
                    ALU_OUT  <= 0;
                Arith_Flag <= 0;
                Logic_Flag <= 0;
                CMP_Flag <= 1;
                Shift_Flag <= 0;
            end
            4'b1100 : begin
                if (A < B)
                    ALU_OUT <= 3;
                else 
                    ALU_OUT  <= 0;
                Arith_Flag <= 0;
                Logic_Flag <= 0;
                CMP_Flag <= 1;
                Shift_Flag <= 0;
            end
            4'b1101 : begin
                ALU_OUT <= A >> 1;
                Arith_Flag <= 0;
                Logic_Flag <= 0;
                CMP_Flag <= 0;
                Shift_Flag <= 1;
            end
            4'b1110: begin
                ALU_OUT <= A << 1;
                Arith_Flag <= 0;
                Logic_Flag <= 0;
                CMP_Flag <= 0;
                Shift_Flag <= 1;
            end
            default:begin
                ALU_OUT <= 16'b0;
                Arith_Flag <= 0;
                Logic_Flag <= 0;
                CMP_Flag <= 0;
                Shift_Flag <= 0;
            end 
        endcase
    end
endmodule