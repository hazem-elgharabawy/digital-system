module Register_file (
    input wire          CLK,
    input wire          RST,
    input wire          WrEn,
    input wire          RdEn,
    input wire [2:0]    Address,
    input wire [15:0]   WrData,
    output reg [15:0]   RdData  
);
    reg [15:0] REG [7:0];

    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            REG[0] <= 16'b0;
            REG[1] <= 16'b0;
            REG[2] <= 16'b0;
            REG[3] <= 16'b0;
            REG[4] <= 16'b0;
            REG[5] <= 16'b0;
            REG[6] <= 16'b0;
            REG[7] <= 16'b0;
        end
         else if (WrEn && ~RdEn) begin
            reg_file[Address] <= WrData;
        end
         else if (RdEn && ~WrEn)begin
            RdData <= reg_file[Address];
        end
    end





endmodule