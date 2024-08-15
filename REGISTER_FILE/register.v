module Register_file #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
) (
    input wire          CLK,
    input wire          RST,
    input wire          WrEn,
    input wire          RdEn,
    input wire  [ADDR_WIDTH-1:0]   Address,
    input wire  [DATA_WIDTH-1:0]   WrData,
    output wire [DATA_WIDTH-1:0]   REG0,
    output wire [DATA_WIDTH-1:0]   REG1,
    output wire [DATA_WIDTH-1:0]   REG2,
    output wire [DATA_WIDTH-1:0]   REG3,
    output reg  [DATA_WIDTH-1:0]   RdData,
    output reg                     RdData_Valid

);
    reg [DATA_WIDTH-1:0] REG [(2**ADDR_WIDTH)-1:0];
    integer i=0;
    assign REG0 = REG[0];
    assign REG1 = REG[1];
    assign REG2 = REG[2];
    assign REG3 = REG[3];


    always @(posedge CLK or negedge RST) begin
        if (~RST) begin

            for (i =0 ; i<(2**ADDR_WIDTH); i=i+1 ) begin
                if (i==2) begin
                    REG[i] <= {6'd32, 1'b0, 1'b1};
                end
                else if(i==3)begin
                    REG[i] <= 32;
                end
                else begin
                    REG[i] <= 0;
                end
            end

            RdData <= 0;
            RdData_Valid <= 0;

        end
         else if (WrEn && ~RdEn) begin
            REG[Address] <= WrData;
        end
         else if (RdEn && ~WrEn)begin
            RdData <= REG[Address];
            RdData_Valid <= 1;
        end
    end





endmodule