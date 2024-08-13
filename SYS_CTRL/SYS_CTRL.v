module SYS_CTRL (
    input wire CLK,
    input wire RST,
    input wire DATA_IN,
    input wire DATA_IN_VALID,
    input wire Rd_D,
    input wire Rd_D_Valid,
    input wire ALU_OUT,
    input wire ALU_OUT_Valid,
    input wire F_FULL,
    output reg WrEn,
    output reg RdEn,
    output reg Addr,
    output reg Wr_D,
    output reg FUN,
    output reg ALU_EN,
    output reg W_INC,
    output reg WR_DATA
);







endmodule