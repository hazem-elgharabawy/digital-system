module Register_file #(
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;
) (
    input wire          CLK,
    input wire          RST,
    input wire          WrEn,
    input wire          RdEn,
    input wire  [ADDR_WIDTH-1:0]    Address,
    input wire  [DATA_WIDTH-1:0]   WrData,
    output wire [DATA_WIDTH-1:0]   REG_0,
    output reg [DATA_WIDTH-1:0]   REG_1,
    output reg [DATA_WIDTH-1:0]   REG_2,
    output reg [DATA_WIDTH-1:0]   REG_3,
    output reg [DATA_WIDTH-1:0]   RdData,

);
    reg [DATA_WIDTH-1:0] REG [(2**ADDR_WIDTH)-1:0];

    assign REG_0 = REG[0];
    assign REG_1 = REG[1];
    assign REG_2 = REG[2];
    assign REG_3 = REG[3];


    always @(posedge CLK or negedge RST) begin
        if (~RST) begin
            for (i =0 ;i<2**a ; ) begin
                
            end
        end
         else if (WrEn && ~RdEn) begin
            reg_file[Address] <= WrData;
        end
         else if (RdEn && ~WrEn)begin
            RdData <= reg_file[Address];
        end
    end





endmodule