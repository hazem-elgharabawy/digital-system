/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 16 02:41:28 2024
/////////////////////////////////////////////////////////////


module serializer ( clk, reset, ser_en, Data_Valid, P_Data, ser_done, ser_data
 );
  input [7:0] P_Data;
  input clk, reset, ser_en, Data_Valid;
  output ser_done, ser_data;
  wire   n1, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n2, n3, n4, n5, n6;
  wire   [7:0] temp;
  wire   [2:0] counter;
  tri   clk;
  tri   reset;
  tri   [7:0] P_Data;

  DFFRX1M \temp_reg[0]  ( .D(n27), .CK(clk), .RN(reset), .QN(n1) );
  DFFRQX2M \temp_reg[7]  ( .D(n28), .CK(clk), .RN(reset), .Q(temp[7]) );
  DFFRQX2M \temp_reg[6]  ( .D(n29), .CK(clk), .RN(reset), .Q(temp[6]) );
  DFFRQX2M \temp_reg[5]  ( .D(n30), .CK(clk), .RN(reset), .Q(temp[5]) );
  DFFRQX2M \temp_reg[4]  ( .D(n31), .CK(clk), .RN(reset), .Q(temp[4]) );
  DFFRQX2M \temp_reg[3]  ( .D(n32), .CK(clk), .RN(reset), .Q(temp[3]) );
  DFFRQX2M \temp_reg[2]  ( .D(n33), .CK(clk), .RN(reset), .Q(temp[2]) );
  DFFRQX2M \temp_reg[1]  ( .D(n34), .CK(clk), .RN(reset), .Q(temp[1]) );
  DFFRQX2M ser_done_reg ( .D(n23), .CK(clk), .RN(reset), .Q(ser_done) );
  DFFRQX2M ser_data_reg ( .D(n26), .CK(clk), .RN(reset), .Q(ser_data) );
  DFFRQX2M \counter_reg[2]  ( .D(n24), .CK(clk), .RN(reset), .Q(counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(n22), .CK(clk), .RN(reset), .Q(counter[1]) );
  DFFRQX2M \counter_reg[0]  ( .D(n25), .CK(clk), .RN(reset), .Q(counter[0]) );
  NAND2X2M U3 ( .A(n3), .B(n10), .Y(n14) );
  INVX2M U4 ( .A(n10), .Y(n2) );
  OAI22X1M U5 ( .A0(n11), .A1(n6), .B0(n9), .B1(n7), .Y(n24) );
  AND2X2M U6 ( .A(n7), .B(n8), .Y(n11) );
  NAND2X2M U7 ( .A(ser_en), .B(n13), .Y(n7) );
  NAND3BX2M U8 ( .AN(Data_Valid), .B(n3), .C(n13), .Y(n12) );
  INVX2M U9 ( .A(ser_en), .Y(n3) );
  NAND2X2M U10 ( .A(Data_Valid), .B(n3), .Y(n10) );
  OAI32X1M U11 ( .A0(n7), .A1(counter[1]), .A2(n4), .B0(n8), .B1(n5), .Y(n22)
         );
  INVX2M U12 ( .A(counter[1]), .Y(n5) );
  OAI22X1M U13 ( .A0(n4), .A1(n12), .B0(counter[0]), .B1(n7), .Y(n25) );
  OAI2BB2X1M U14 ( .B0(n9), .B1(n6), .A0N(ser_done), .A1N(n10), .Y(n23) );
  OAI2BB2X1M U15 ( .B0(n3), .B1(n1), .A0N(ser_data), .A1N(n3), .Y(n26) );
  OAI2B1X2M U16 ( .A1N(temp[1]), .A0(n14), .B0(n21), .Y(n34) );
  AOI22X1M U17 ( .A0(temp[2]), .A1(ser_en), .B0(P_Data[1]), .B1(n2), .Y(n21)
         );
  OAI2B1X2M U18 ( .A1N(temp[2]), .A0(n14), .B0(n20), .Y(n33) );
  AOI22X1M U19 ( .A0(temp[3]), .A1(ser_en), .B0(P_Data[2]), .B1(n2), .Y(n20)
         );
  OAI2B1X2M U20 ( .A1N(temp[3]), .A0(n14), .B0(n19), .Y(n32) );
  AOI22X1M U21 ( .A0(temp[4]), .A1(ser_en), .B0(P_Data[3]), .B1(n2), .Y(n19)
         );
  OAI2B1X2M U22 ( .A1N(temp[4]), .A0(n14), .B0(n18), .Y(n31) );
  AOI22X1M U23 ( .A0(temp[5]), .A1(ser_en), .B0(P_Data[4]), .B1(n2), .Y(n18)
         );
  OAI2B1X2M U24 ( .A1N(temp[5]), .A0(n14), .B0(n17), .Y(n30) );
  AOI22X1M U25 ( .A0(temp[6]), .A1(ser_en), .B0(P_Data[5]), .B1(n2), .Y(n17)
         );
  OAI2B1X2M U26 ( .A1N(temp[6]), .A0(n14), .B0(n16), .Y(n29) );
  AOI22X1M U27 ( .A0(temp[7]), .A1(ser_en), .B0(P_Data[6]), .B1(n2), .Y(n16)
         );
  OAI21X2M U28 ( .A0(n1), .A1(n14), .B0(n15), .Y(n27) );
  AOI22X1M U29 ( .A0(temp[1]), .A1(ser_en), .B0(P_Data[0]), .B1(n2), .Y(n15)
         );
  NAND2X2M U30 ( .A(counter[1]), .B(counter[0]), .Y(n9) );
  NAND2BX2M U31 ( .AN(n9), .B(counter[2]), .Y(n13) );
  OA21X2M U32 ( .A0(counter[0]), .A1(n7), .B0(n12), .Y(n8) );
  INVX2M U33 ( .A(counter[0]), .Y(n4) );
  INVX2M U34 ( .A(counter[2]), .Y(n6) );
  AO2B2X2M U35 ( .B0(P_Data[7]), .B1(n2), .A0(temp[7]), .A1N(n14), .Y(n28) );
endmodule


module parity_calc ( Data_Valid, PAR_TYP, clk, reset, P_Data, par_bit );
  input [7:0] P_Data;
  input Data_Valid, PAR_TYP, clk, reset;
  output par_bit;
  wire   n1, n3, n4, n5, n6, n7, n2;
  tri   clk;
  tri   reset;
  tri   [7:0] P_Data;

  DFFRQX2M par_bit_reg ( .D(n7), .CK(clk), .RN(reset), .Q(par_bit) );
  XOR3XLM U2 ( .A(P_Data[1]), .B(P_Data[0]), .C(n5), .Y(n4) );
  XNOR2X2M U3 ( .A(P_Data[3]), .B(P_Data[2]), .Y(n5) );
  OAI2BB2X1M U4 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n7) );
  INVX2M U5 ( .A(Data_Valid), .Y(n2) );
  XOR3XLM U6 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U7 ( .A(P_Data[5]), .B(P_Data[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U8 ( .A(P_Data[7]), .B(P_Data[6]), .Y(n6) );
endmodule


module UART_TX_FSM ( clk, reset, Data_Valid, par_en, ser_done, ser_en, busy, 
        mux_sel );
  output [1:0] mux_sel;
  input clk, reset, Data_Valid, par_en, ser_done;
  output ser_en, busy;
  wire   busy_c, n5, n6, n1, n2, n3, n4, n7;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  tri   clk;
  tri   reset;

  DFFRQX2M busy_reg ( .D(busy_c), .CK(clk), .RN(reset), .Q(busy) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(reset), 
        .Q(current_state[1]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(reset), 
        .Q(current_state[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(reset), 
        .Q(current_state[2]) );
  AOI2B1X1M U3 ( .A1N(n5), .A0(n3), .B0(n4), .Y(next_state[2]) );
  INVX2M U4 ( .A(mux_sel[1]), .Y(n4) );
  OAI32X1M U5 ( .A0(n4), .A1(current_state[0]), .A2(n5), .B0(current_state[1]), 
        .B1(n2), .Y(next_state[1]) );
  INVX2M U6 ( .A(mux_sel[0]), .Y(n2) );
  NOR2X2M U7 ( .A(n1), .B(current_state[2]), .Y(ser_en) );
  XNOR2X2M U8 ( .A(current_state[1]), .B(current_state[0]), .Y(n1) );
  NOR2X2M U9 ( .A(n7), .B(current_state[2]), .Y(mux_sel[1]) );
  NOR2X2M U10 ( .A(n3), .B(current_state[2]), .Y(mux_sel[0]) );
  OAI21BX1M U11 ( .A0(current_state[2]), .A1(n3), .B0N(ser_en), .Y(busy_c) );
  NOR2BX2M U12 ( .AN(ser_done), .B(par_en), .Y(n5) );
  INVX2M U13 ( .A(current_state[0]), .Y(n3) );
  NOR2X2M U14 ( .A(current_state[0]), .B(n6), .Y(next_state[0]) );
  AOI32X1M U15 ( .A0(mux_sel[1]), .A1(ser_done), .A2(par_en), .B0(Data_Valid), 
        .B1(n7), .Y(n6) );
  INVX2M U16 ( .A(current_state[1]), .Y(n7) );
endmodule


module MUX ( IN0, IN1, mux_sel, TX_OUT );
  input [1:0] mux_sel;
  input IN0, IN1;
  output TX_OUT;
  wire   n1, n2;

  OAI21X4M U3 ( .A0(mux_sel[0]), .A1(n1), .B0(n2), .Y(TX_OUT) );
  NAND3X2M U4 ( .A(mux_sel[0]), .B(IN1), .C(mux_sel[1]), .Y(n2) );
  NOR2BX2M U5 ( .AN(mux_sel[1]), .B(IN0), .Y(n1) );
endmodule


module UART_TX_TOP ( CLK, RST, Data_Valid, par_en, PAR_TYP, P_Data, TX_OUT, 
        busy );
  input [7:0] P_Data;
  input CLK, RST, Data_Valid, par_en, PAR_TYP;
  output TX_OUT, busy;
  wire   ser_en, ser_done, ser_data, par_bit;
  wire   [1:0] mux_sel;
  tri   CLK;
  tri   RST;
  tri   [7:0] P_Data;

  serializer serializer ( .clk(CLK), .reset(RST), .ser_en(ser_en), 
        .Data_Valid(Data_Valid), .P_Data(P_Data), .ser_done(ser_done), 
        .ser_data(ser_data) );
  parity_calc parity ( .Data_Valid(Data_Valid), .PAR_TYP(PAR_TYP), .clk(CLK), 
        .reset(RST), .P_Data(P_Data), .par_bit(par_bit) );
  UART_TX_FSM fsm ( .clk(CLK), .reset(RST), .Data_Valid(Data_Valid), .par_en(
        par_en), .ser_done(ser_done), .ser_en(ser_en), .busy(busy), .mux_sel(
        mux_sel) );
  MUX mux ( .IN0(ser_data), .IN1(par_bit), .mux_sel(mux_sel), .TX_OUT(TX_OUT)
         );
endmodule


module data_sampling ( clk, rst, RX_IN, Prescale, data_sample_en, edge_count, 
        sampled_bit );
  input [5:0] Prescale;
  input [4:0] edge_count;
  input clk, rst, RX_IN, data_sample_en;
  output sampled_bit;
  wire   \sampled_ones[0] , N92, n5, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n1, n2, n3, n4, n6, n7, n8, n9, n10, n11;
  tri   rst;

  DFFQX2M sampled_bit_reg ( .D(N92), .CK(clk), .Q(sampled_bit) );
  DFFQNX2M \sampled_ones_reg[1]  ( .D(n37), .CK(clk), .QN(n5) );
  DFFQX2M \sampled_ones_reg[0]  ( .D(n38), .CK(clk), .Q(\sampled_ones[0] ) );
  INVX2M U3 ( .A(n26), .Y(n3) );
  NAND2X2M U4 ( .A(n4), .B(n6), .Y(n26) );
  NOR2X2M U5 ( .A(n25), .B(n26), .Y(n34) );
  AND3X2M U6 ( .A(n25), .B(n8), .C(n27), .Y(n24) );
  INVX2M U7 ( .A(n30), .Y(n10) );
  INVX2M U8 ( .A(n36), .Y(n8) );
  OAI221X1M U9 ( .A0(n31), .A1(n29), .B0(edge_count[2]), .B1(n32), .C0(n33), 
        .Y(n21) );
  AOI2BB2XLM U10 ( .B0(n36), .B1(n3), .A0N(n28), .A1N(n27), .Y(n31) );
  NAND4BX1M U11 ( .AN(n25), .B(edge_count[2]), .C(n3), .D(n2), .Y(n33) );
  AOI32X1M U12 ( .A0(edge_count[1]), .A1(edge_count[0]), .A2(n34), .B0(n35), 
        .B1(n2), .Y(n32) );
  OAI32X1M U13 ( .A0(n6), .A1(edge_count[3]), .A2(n27), .B0(n8), .B1(n28), .Y(
        n35) );
  NOR3X2M U14 ( .A(Prescale[2]), .B(Prescale[1]), .C(Prescale[0]), .Y(n30) );
  NOR3X2M U15 ( .A(Prescale[3]), .B(Prescale[5]), .C(n9), .Y(n36) );
  OAI32X1M U16 ( .A0(n18), .A1(\sampled_ones[0] ), .A2(n11), .B0(n20), .B1(n7), 
        .Y(n38) );
  INVX2M U17 ( .A(RX_IN), .Y(n11) );
  INVX2M U18 ( .A(\sampled_ones[0] ), .Y(n7) );
  OA21X2M U19 ( .A0(n18), .A1(RX_IN), .B0(n16), .Y(n20) );
  NAND3BX2M U20 ( .AN(Prescale[5]), .B(n9), .C(Prescale[3]), .Y(n25) );
  NAND4BX1M U21 ( .AN(n21), .B(rst), .C(data_sample_en), .D(n22), .Y(n16) );
  AOI211X2M U22 ( .A0(n1), .A1(n23), .B0(n10), .C0(n24), .Y(n22) );
  INVX2M U23 ( .A(n29), .Y(n1) );
  OAI222X1M U24 ( .A0(n25), .A1(n26), .B0(n4), .B1(n27), .C0(n8), .C1(n28), 
        .Y(n23) );
  NAND3BX2M U25 ( .AN(Prescale[3]), .B(n9), .C(Prescale[5]), .Y(n27) );
  NOR4BX1M U26 ( .AN(rst), .B(n24), .C(n10), .D(n5), .Y(N92) );
  NAND2X2M U27 ( .A(edge_count[3]), .B(n6), .Y(n28) );
  OAI22X1M U28 ( .A0(n5), .A1(n16), .B0(n17), .B1(n18), .Y(n37) );
  XNOR2X2M U29 ( .A(n19), .B(n5), .Y(n17) );
  NAND2X2M U30 ( .A(\sampled_ones[0] ), .B(RX_IN), .Y(n19) );
  NAND4X2M U31 ( .A(rst), .B(data_sample_en), .C(n30), .D(n21), .Y(n18) );
  INVX2M U32 ( .A(edge_count[3]), .Y(n4) );
  NAND3X2M U33 ( .A(edge_count[0]), .B(edge_count[2]), .C(edge_count[1]), .Y(
        n29) );
  INVX2M U34 ( .A(edge_count[4]), .Y(n6) );
  INVX2M U35 ( .A(Prescale[4]), .Y(n9) );
  INVX2M U36 ( .A(edge_count[1]), .Y(n2) );
endmodule


module UART_RX_FSM ( clk, rst, PAR_EN, RX_IN, Prescale, edge_count, bit_count, 
        stop_error, start_glitch, par_error, data_sample_en, counter_enable, 
        deser_en, data_valid, stop_check_en, start_check_en, par_check_en );
  input [5:0] Prescale;
  input [4:0] edge_count;
  input [3:0] bit_count;
  input clk, rst, PAR_EN, RX_IN, stop_error, start_glitch, par_error;
  output data_sample_en, counter_enable, deser_en, data_valid, stop_check_en,
         start_check_en, par_check_en;

  assign par_check_en = 1'b0;
  assign start_check_en = 1'b0;
  assign stop_check_en = 1'b0;
  assign data_valid = 1'b0;
  assign deser_en = 1'b0;
  assign counter_enable = 1'b0;
  assign data_sample_en = 1'b0;

endmodule


module edge_bit_counter ( clk, rst, Prescale, counter_enable, PAR_EN, 
        edge_count, bit_count );
  input [5:0] Prescale;
  output [4:0] edge_count;
  output [3:0] bit_count;
  input clk, rst, counter_enable, PAR_EN;
  wire   N48, N49, N50, N51, n6, n7, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, \r101/carry[4] ,
         \r101/carry[3] , \r101/carry[2] , n1, n2, n3, n4, n5, n8, n9, n10,
         n11, n12;
  tri   rst;

  DFFQX2M \bit_count_reg[2]  ( .D(n41), .CK(clk), .Q(bit_count[2]) );
  DFFQX2M \bit_count_reg[3]  ( .D(n43), .CK(clk), .Q(bit_count[3]) );
  DFFQX2M \bit_count_reg[0]  ( .D(n44), .CK(clk), .Q(bit_count[0]) );
  DFFQX2M \bit_count_reg[1]  ( .D(n42), .CK(clk), .Q(bit_count[1]) );
  DFFTRX2M \edge_count_reg[0]  ( .D(n7), .RN(n36), .CK(clk), .Q(edge_count[0]), 
        .QN(n7) );
  DFFTRX2M \edge_count_reg[4]  ( .D(N51), .RN(n36), .CK(clk), .Q(edge_count[4]) );
  DFFTRX2M \edge_count_reg[1]  ( .D(N48), .RN(n36), .CK(clk), .Q(edge_count[1]), .QN(n6) );
  DFFTRX2M \edge_count_reg[2]  ( .D(N49), .RN(n36), .CK(clk), .Q(edge_count[2]) );
  DFFTRX2M \edge_count_reg[3]  ( .D(N50), .RN(n36), .CK(clk), .Q(edge_count[3]) );
  INVX2M U3 ( .A(n13), .Y(n2) );
  NAND2X2M U4 ( .A(n20), .B(n21), .Y(n13) );
  OAI32X1M U5 ( .A0(n12), .A1(n25), .A2(n31), .B0(n31), .B1(n32), .Y(n21) );
  AOI222X1M U6 ( .A0(n33), .A1(n28), .B0(n8), .B1(n27), .C0(n5), .C1(n29), .Y(
        n31) );
  INVX2M U7 ( .A(n34), .Y(n5) );
  INVX2M U8 ( .A(n35), .Y(n8) );
  INVX2M U9 ( .A(n17), .Y(n1) );
  AND2X2M U10 ( .A(n22), .B(n23), .Y(n20) );
  NAND2X2M U11 ( .A(n30), .B(n12), .Y(n32) );
  AND2X2M U12 ( .A(n20), .B(n37), .Y(n36) );
  OAI32X1M U13 ( .A0(n12), .A1(n25), .A2(n38), .B0(n38), .B1(n32), .Y(n37) );
  AOI222X1M U14 ( .A0(n28), .A1(n4), .B0(n27), .B1(n35), .C0(n29), .C1(n34), 
        .Y(n38) );
  INVX2M U15 ( .A(n33), .Y(n4) );
  NOR4BX1M U16 ( .AN(edge_count[2]), .B(n6), .C(n7), .D(edge_count[4]), .Y(n39) );
  NOR3BX2M U17 ( .AN(Prescale[4]), .B(Prescale[3]), .C(Prescale[5]), .Y(n29)
         );
  NOR3BX2M U18 ( .AN(Prescale[3]), .B(Prescale[4]), .C(Prescale[5]), .Y(n28)
         );
  NOR3BX2M U19 ( .AN(Prescale[5]), .B(Prescale[3]), .C(Prescale[4]), .Y(n27)
         );
  NAND4BX1M U20 ( .AN(n21), .B(n22), .C(n23), .D(n24), .Y(n17) );
  AOI21X2M U21 ( .A0(n25), .A1(PAR_EN), .B0(n26), .Y(n24) );
  OAI32X1M U22 ( .A0(n27), .A1(n28), .A2(n29), .B0(PAR_EN), .B1(n30), .Y(n26)
         );
  OAI32X1M U23 ( .A0(n13), .A1(bit_count[1]), .A2(n3), .B0(n16), .B1(n10), .Y(
        n42) );
  INVX2M U24 ( .A(bit_count[1]), .Y(n10) );
  AOI21X2M U25 ( .A0(n2), .A1(n3), .B0(n1), .Y(n16) );
  OAI32X1M U26 ( .A0(n13), .A1(bit_count[2]), .A2(n14), .B0(n15), .B1(n9), .Y(
        n41) );
  AOI21X2M U27 ( .A0(n2), .A1(n14), .B0(n1), .Y(n15) );
  NOR3X2M U28 ( .A(n14), .B(bit_count[2]), .C(n11), .Y(n25) );
  NAND4X2M U29 ( .A(edge_count[4]), .B(edge_count[3]), .C(n40), .D(
        edge_count[2]), .Y(n35) );
  NOR2X2M U30 ( .A(n7), .B(n6), .Y(n40) );
  NOR3X2M U31 ( .A(Prescale[2]), .B(Prescale[1]), .C(Prescale[0]), .Y(n22) );
  OAI22X1M U32 ( .A0(n11), .A1(n17), .B0(n18), .B1(n13), .Y(n43) );
  XNOR2X2M U33 ( .A(bit_count[3]), .B(n19), .Y(n18) );
  NOR2X2M U34 ( .A(n14), .B(n9), .Y(n19) );
  OAI22X1M U35 ( .A0(n3), .A1(n17), .B0(bit_count[0]), .B1(n13), .Y(n44) );
  NOR2BX2M U36 ( .AN(n39), .B(edge_count[3]), .Y(n33) );
  NAND2X2M U37 ( .A(n39), .B(edge_count[3]), .Y(n34) );
  NAND2X2M U38 ( .A(bit_count[1]), .B(bit_count[0]), .Y(n14) );
  NAND4X2M U39 ( .A(bit_count[3]), .B(bit_count[1]), .C(n3), .D(n9), .Y(n30)
         );
  INVX2M U40 ( .A(bit_count[0]), .Y(n3) );
  INVX2M U41 ( .A(PAR_EN), .Y(n12) );
  INVX2M U42 ( .A(bit_count[2]), .Y(n9) );
  ADDHX1M U43 ( .A(edge_count[2]), .B(\r101/carry[2] ), .CO(\r101/carry[3] ), 
        .S(N49) );
  ADDHX1M U44 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\r101/carry[2] ), 
        .S(N48) );
  INVX2M U45 ( .A(bit_count[3]), .Y(n11) );
  AND2X2M U46 ( .A(rst), .B(counter_enable), .Y(n23) );
  ADDHX1M U47 ( .A(edge_count[3]), .B(\r101/carry[3] ), .CO(\r101/carry[4] ), 
        .S(N50) );
  CLKXOR2X2M U48 ( .A(\r101/carry[4] ), .B(edge_count[4]), .Y(N51) );
endmodule


module deserializer ( clk, rst, sampled_bit, deser_en, Prescale, edge_count, 
        P_DATA );
  input [5:0] Prescale;
  input [4:0] edge_count;
  output [7:0] P_DATA;
  input clk, rst, sampled_bit, deser_en;
  wire   N5, N6, N7, N8, N9, N10, N11, \add_18/carry[4] , \add_18/carry[3] ,
         n1, n2, n3, n4, n5, n6, n7, n8, n9;
  tri   rst;
  assign N5 = Prescale[1];

  EDFFTRX1M \data_reg[0]  ( .RN(rst), .D(P_DATA[1]), .E(n1), .CK(clk), .Q(
        P_DATA[0]) );
  EDFFTRX1M \data_reg[5]  ( .RN(rst), .D(P_DATA[6]), .E(n1), .CK(clk), .Q(
        P_DATA[5]) );
  EDFFTRX1M \data_reg[1]  ( .RN(rst), .D(P_DATA[2]), .E(n1), .CK(clk), .Q(
        P_DATA[1]) );
  EDFFTRX1M \data_reg[4]  ( .RN(rst), .D(P_DATA[5]), .E(n1), .CK(clk), .Q(
        P_DATA[4]) );
  EDFFTRX1M \data_reg[7]  ( .RN(rst), .D(sampled_bit), .E(n1), .CK(clk), .Q(
        P_DATA[7]) );
  EDFFTRX1M \data_reg[3]  ( .RN(rst), .D(P_DATA[4]), .E(n1), .CK(clk), .Q(
        P_DATA[3]) );
  EDFFTRX1M \data_reg[6]  ( .RN(rst), .D(P_DATA[7]), .E(n1), .CK(clk), .Q(
        P_DATA[6]) );
  EDFFTRX1M \data_reg[2]  ( .RN(rst), .D(P_DATA[3]), .E(n1), .CK(clk), .Q(
        P_DATA[2]) );
  INVX2M U3 ( .A(Prescale[2]), .Y(N6) );
  AND2X2M U4 ( .A(deser_en), .B(N11), .Y(n1) );
  AND2X1M U5 ( .A(Prescale[5]), .B(\add_18/carry[4] ), .Y(N10) );
  CLKXOR2X2M U6 ( .A(Prescale[5]), .B(\add_18/carry[4] ), .Y(N9) );
  AND2X1M U7 ( .A(\add_18/carry[3] ), .B(Prescale[4]), .Y(\add_18/carry[4] )
         );
  CLKXOR2X2M U8 ( .A(Prescale[4]), .B(\add_18/carry[3] ), .Y(N8) );
  AND2X1M U9 ( .A(Prescale[2]), .B(Prescale[3]), .Y(\add_18/carry[3] ) );
  CLKXOR2X2M U10 ( .A(Prescale[3]), .B(Prescale[2]), .Y(N7) );
  NOR2BX1M U11 ( .AN(N5), .B(edge_count[0]), .Y(n2) );
  OAI2B2X1M U12 ( .A1N(edge_count[1]), .A0(n2), .B0(N6), .B1(n2), .Y(n5) );
  NOR2BX1M U13 ( .AN(edge_count[0]), .B(N5), .Y(n3) );
  OAI2B2X1M U14 ( .A1N(N6), .A0(n3), .B0(edge_count[1]), .B1(n3), .Y(n4) );
  NAND3BX1M U15 ( .AN(N10), .B(n5), .C(n4), .Y(n9) );
  CLKXOR2X2M U16 ( .A(N9), .B(edge_count[4]), .Y(n8) );
  CLKXOR2X2M U17 ( .A(N7), .B(edge_count[2]), .Y(n7) );
  CLKXOR2X2M U18 ( .A(N8), .B(edge_count[3]), .Y(n6) );
  NOR4X1M U19 ( .A(n9), .B(n8), .C(n7), .D(n6), .Y(N11) );
endmodule


module start_check ( clk, rst, start_check_en, sampled_bit, edge_count, 
        Prescale, start_glitch );
  input [4:0] edge_count;
  input [5:0] Prescale;
  input clk, rst, start_check_en, sampled_bit;
  output start_glitch;
  wire   N2, N3, N4, N5, N6, N7, N8, N12, \add_14/carry[4] , \add_14/carry[3] ,
         n1, n2, n3, n4, n5, n6, n7, n8;
  tri   rst;
  assign N2 = Prescale[1];

  DFFQX2M start_glitch_reg ( .D(N12), .CK(clk), .Q(start_glitch) );
  INVX2M U3 ( .A(Prescale[2]), .Y(N3) );
  AND4X2M U4 ( .A(start_check_en), .B(sampled_bit), .C(rst), .D(N8), .Y(N12)
         );
  AND2X1M U5 ( .A(\add_14/carry[4] ), .B(Prescale[5]), .Y(N7) );
  CLKXOR2X2M U6 ( .A(Prescale[5]), .B(\add_14/carry[4] ), .Y(N6) );
  AND2X1M U7 ( .A(\add_14/carry[3] ), .B(Prescale[4]), .Y(\add_14/carry[4] )
         );
  CLKXOR2X2M U8 ( .A(Prescale[4]), .B(\add_14/carry[3] ), .Y(N5) );
  AND2X1M U9 ( .A(Prescale[2]), .B(Prescale[3]), .Y(\add_14/carry[3] ) );
  CLKXOR2X2M U10 ( .A(Prescale[3]), .B(Prescale[2]), .Y(N4) );
  NOR2BX1M U11 ( .AN(N2), .B(edge_count[0]), .Y(n1) );
  OAI2B2X1M U12 ( .A1N(edge_count[1]), .A0(n1), .B0(N3), .B1(n1), .Y(n4) );
  NOR2BX1M U13 ( .AN(edge_count[0]), .B(N2), .Y(n2) );
  OAI2B2X1M U14 ( .A1N(N3), .A0(n2), .B0(edge_count[1]), .B1(n2), .Y(n3) );
  NAND3BX1M U15 ( .AN(N7), .B(n4), .C(n3), .Y(n8) );
  CLKXOR2X2M U16 ( .A(N6), .B(edge_count[4]), .Y(n7) );
  CLKXOR2X2M U17 ( .A(N4), .B(edge_count[2]), .Y(n6) );
  CLKXOR2X2M U18 ( .A(N5), .B(edge_count[3]), .Y(n5) );
  NOR4X1M U19 ( .A(n8), .B(n7), .C(n6), .D(n5), .Y(N8) );
endmodule


module stop_check ( clk, rst, stop_check_en, sampled_bit, edge_count, Prescale, 
        stop_error );
  input [4:0] edge_count;
  input [5:0] Prescale;
  input clk, rst, stop_check_en, sampled_bit;
  output stop_error;
  wire   N2, N3, N4, N5, N6, N7, N8, N13, n7, \add_16/carry[4] ,
         \add_16/carry[3] , n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n12;
  tri   rst;
  assign N2 = Prescale[1];

  DFFQX2M stop_error_reg ( .D(N13), .CK(clk), .Q(stop_error) );
  INVX2M U3 ( .A(N5), .Y(n12) );
  INVX2M U4 ( .A(N4), .Y(n11) );
  NOR3BX2M U5 ( .AN(N8), .B(n7), .C(sampled_bit), .Y(N13) );
  NAND2X2M U6 ( .A(stop_check_en), .B(rst), .Y(n7) );
  INVX2M U7 ( .A(edge_count[4]), .Y(n6) );
  INVX2M U8 ( .A(edge_count[3]), .Y(n8) );
  INVX2M U9 ( .A(edge_count[2]), .Y(n9) );
  INVX2M U10 ( .A(edge_count[1]), .Y(n10) );
  INVX2M U11 ( .A(Prescale[2]), .Y(N3) );
  AND2X1M U12 ( .A(\add_16/carry[4] ), .B(Prescale[5]), .Y(N7) );
  CLKXOR2X2M U13 ( .A(Prescale[5]), .B(\add_16/carry[4] ), .Y(N6) );
  AND2X1M U14 ( .A(\add_16/carry[3] ), .B(Prescale[4]), .Y(\add_16/carry[4] )
         );
  CLKXOR2X2M U15 ( .A(Prescale[4]), .B(\add_16/carry[3] ), .Y(N5) );
  AND2X1M U16 ( .A(Prescale[2]), .B(Prescale[3]), .Y(\add_16/carry[3] ) );
  CLKXOR2X2M U17 ( .A(Prescale[3]), .B(Prescale[2]), .Y(N4) );
  AOI2BB1X1M U18 ( .A0N(N3), .A1N(n10), .B0(edge_count[0]), .Y(n1) );
  AOI222X1M U19 ( .A0(N4), .A1(n9), .B0(n1), .B1(N2), .C0(N3), .C1(n10), .Y(n2) );
  AOI221XLM U20 ( .A0(edge_count[3]), .A1(n12), .B0(edge_count[2]), .B1(n11), 
        .C0(n2), .Y(n3) );
  AOI221XLM U21 ( .A0(N6), .A1(n6), .B0(N5), .B1(n8), .C0(n3), .Y(n4) );
  AOI2BB1X1M U22 ( .A0N(N6), .A1N(n6), .B0(n4), .Y(n5) );
  NOR2X1M U23 ( .A(N7), .B(n5), .Y(N8) );
endmodule


module parity_check ( clk, rst, PAR_TYP, par_check_en, sampled_bit, Prescale, 
        edge_count, P_data, par_error );
  input [5:0] Prescale;
  input [4:0] edge_count;
  input [7:0] P_data;
  input clk, rst, PAR_TYP, par_check_en, sampled_bit;
  output par_error;
  wire   N8, N9, N10, N11, N12, N13, N14, N20, n7, n8, n9, n10, n11, n12,
         \add_20/carry[4] , \add_20/carry[3] , n1, n2, n3, n4, n5, n6, n13,
         n14, n15, n16, n17;
  tri   rst;
  assign N8 = Prescale[1];

  DFFQX2M par_error_reg ( .D(N20), .CK(clk), .Q(par_error) );
  INVX2M U3 ( .A(N11), .Y(n17) );
  INVX2M U4 ( .A(N10), .Y(n16) );
  XOR3XLM U5 ( .A(P_data[1]), .B(P_data[0]), .C(n11), .Y(n10) );
  XNOR2X2M U6 ( .A(P_data[3]), .B(P_data[2]), .Y(n11) );
  XOR3XLM U7 ( .A(P_data[5]), .B(P_data[4]), .C(n12), .Y(n9) );
  XNOR2X2M U8 ( .A(P_data[7]), .B(P_data[6]), .Y(n12) );
  INVX2M U9 ( .A(edge_count[4]), .Y(n6) );
  INVX2M U10 ( .A(edge_count[3]), .Y(n13) );
  INVX2M U11 ( .A(edge_count[2]), .Y(n14) );
  INVX2M U12 ( .A(edge_count[1]), .Y(n15) );
  INVX2M U13 ( .A(Prescale[2]), .Y(N9) );
  AND4X2M U14 ( .A(rst), .B(par_check_en), .C(N14), .D(n7), .Y(N20) );
  XOR3XLM U15 ( .A(n8), .B(n9), .C(n10), .Y(n7) );
  CLKXOR2X2M U16 ( .A(sampled_bit), .B(PAR_TYP), .Y(n8) );
  AND2X1M U17 ( .A(\add_20/carry[4] ), .B(Prescale[5]), .Y(N13) );
  CLKXOR2X2M U18 ( .A(Prescale[5]), .B(\add_20/carry[4] ), .Y(N12) );
  AND2X1M U19 ( .A(\add_20/carry[3] ), .B(Prescale[4]), .Y(\add_20/carry[4] )
         );
  CLKXOR2X2M U20 ( .A(Prescale[4]), .B(\add_20/carry[3] ), .Y(N11) );
  AND2X1M U21 ( .A(Prescale[2]), .B(Prescale[3]), .Y(\add_20/carry[3] ) );
  CLKXOR2X2M U22 ( .A(Prescale[3]), .B(Prescale[2]), .Y(N10) );
  AOI2BB1X1M U23 ( .A0N(N9), .A1N(n15), .B0(edge_count[0]), .Y(n1) );
  AOI222X1M U24 ( .A0(N10), .A1(n14), .B0(n1), .B1(N8), .C0(N9), .C1(n15), .Y(
        n2) );
  AOI221XLM U25 ( .A0(edge_count[3]), .A1(n17), .B0(edge_count[2]), .B1(n16), 
        .C0(n2), .Y(n3) );
  AOI221XLM U26 ( .A0(N12), .A1(n6), .B0(N11), .B1(n13), .C0(n3), .Y(n4) );
  AOI2BB1X1M U27 ( .A0N(N12), .A1N(n6), .B0(n4), .Y(n5) );
  NOR2X1M U28 ( .A(N13), .B(n5), .Y(N14) );
endmodule


module UART_RX_TOP ( CLK, RST, PAR_TYP, PAR_EN, Prescale, RX_IN, P_DATA, 
        par_error, stop_error, data_valid );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, PAR_TYP, PAR_EN, RX_IN;
  output par_error, stop_error, data_valid;
  wire   start_glitch, sampled_bit;
  wire   [4:0] edge_count;
  wire   [3:0] bit_count;
  tri   RST;
  assign data_valid = 1'b0;

  data_sampling sampler ( .clk(CLK), .rst(RST), .RX_IN(RX_IN), .Prescale(
        Prescale), .data_sample_en(1'b0), .edge_count(edge_count), 
        .sampled_bit(sampled_bit) );
  UART_RX_FSM fsm ( .clk(CLK), .rst(RST), .PAR_EN(PAR_EN), .RX_IN(RX_IN), 
        .Prescale(Prescale), .edge_count(edge_count), .bit_count(bit_count), 
        .stop_error(stop_error), .start_glitch(start_glitch), .par_error(
        par_error) );
  edge_bit_counter edge_bit_counter ( .clk(CLK), .rst(RST), .Prescale(Prescale), .counter_enable(1'b0), .PAR_EN(PAR_EN), .edge_count(edge_count), .bit_count(
        bit_count) );
  deserializer deserializer ( .clk(CLK), .rst(RST), .sampled_bit(sampled_bit), 
        .deser_en(1'b0), .Prescale(Prescale), .edge_count(edge_count), 
        .P_DATA(P_DATA) );
  start_check start_check ( .clk(CLK), .rst(RST), .start_check_en(1'b0), 
        .sampled_bit(sampled_bit), .edge_count(edge_count), .Prescale(Prescale), .start_glitch(start_glitch) );
  stop_check stop_check ( .clk(CLK), .rst(RST), .stop_check_en(1'b0), 
        .sampled_bit(sampled_bit), .edge_count(edge_count), .Prescale(Prescale), .stop_error(stop_error) );
  parity_check parity_check ( .clk(CLK), .rst(RST), .PAR_TYP(PAR_TYP), 
        .par_check_en(1'b0), .sampled_bit(sampled_bit), .Prescale(Prescale), 
        .edge_count(edge_count), .P_data(P_DATA), .par_error(par_error) );
endmodule


module UART_TOP ( TX_CLK, RX_CLK, RST, RX_IN, UART_CONFIG, TX_P_DATA, 
        TX_P_DATA_VALID, RX_P_DATA, RX_P_DATA_VALID, par_error, stop_error, 
        TX_OUT, busy );
  input [7:0] UART_CONFIG;
  input [7:0] TX_P_DATA;
  output [7:0] RX_P_DATA;
  input TX_CLK, RX_CLK, RST, RX_IN, TX_P_DATA_VALID;
  output RX_P_DATA_VALID, par_error, stop_error, TX_OUT, busy;

  tri   TX_CLK;
  tri   RST;
  tri   [7:0] TX_P_DATA;
  assign RX_P_DATA_VALID = 1'b0;

  UART_TX_TOP TX ( .CLK(TX_CLK), .RST(RST), .Data_Valid(TX_P_DATA_VALID), 
        .par_en(UART_CONFIG[0]), .PAR_TYP(UART_CONFIG[1]), .P_Data(TX_P_DATA), 
        .TX_OUT(TX_OUT), .busy(busy) );
  UART_RX_TOP RX ( .CLK(RX_CLK), .RST(RST), .PAR_TYP(UART_CONFIG[1]), .PAR_EN(
        UART_CONFIG[0]), .Prescale(UART_CONFIG[7:2]), .RX_IN(RX_IN), .P_DATA(
        RX_P_DATA), .par_error(par_error), .stop_error(stop_error) );
endmodule


module PULSE_GEN ( CLK, RST, IN, PULSE );
  input CLK, RST, IN;
  output PULSE;
  wire   pulse_gen_ff;
  tri   CLK;
  tri   RST;
  tri   PULSE;

  DFFRQX2M pulse_gen_ff_reg ( .D(IN), .CK(CLK), .RN(RST), .Q(pulse_gen_ff) );
  NOR2BX2M U3 ( .AN(IN), .B(pulse_gen_ff), .Y(PULSE) );
endmodule


module SYS_CTRL ( CLK, RST, RX_P_Data, RX_P_Data_VALID, Rd_D, Rd_D_Valid, 
        ALU_OUT, ALU_OUT_Valid, F_FULL, CLK_G_EN, WrEn, RdEn, Address, Wr_D, 
        ALU_FUN, ALU_EN, W_INC, TX_P_DATA );
  input [7:0] RX_P_Data;
  input [7:0] Rd_D;
  input [15:0] ALU_OUT;
  output [3:0] Address;
  output [7:0] Wr_D;
  output [3:0] ALU_FUN;
  output [7:0] TX_P_DATA;
  input CLK, RST, RX_P_Data_VALID, Rd_D_Valid, ALU_OUT_Valid, F_FULL;
  output CLK_G_EN, WrEn, RdEn, ALU_EN, W_INC;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n1, n2, n3,
         n4, n5, n6, n7, n8, n29, n30, n31, n32, n33, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n109, n110;
  wire   [3:0] current_state;
  wire   [3:0] next_state;
  tri   CLK;
  tri   RST;
  tri   F_FULL;
  tri   W_INC;
  tri   [7:0] TX_P_DATA;

  DFFRX1M \ALU_OUT_SAVED_reg[7]  ( .D(n96), .CK(CLK), .RN(RST), .QN(n21) );
  DFFRX1M \ALU_OUT_SAVED_reg[6]  ( .D(n95), .CK(CLK), .RN(RST), .QN(n22) );
  DFFRX1M \ALU_OUT_SAVED_reg[5]  ( .D(n94), .CK(CLK), .RN(RST), .QN(n23) );
  DFFRX1M \ALU_OUT_SAVED_reg[4]  ( .D(n93), .CK(CLK), .RN(RST), .QN(n24) );
  DFFRX1M \ALU_OUT_SAVED_reg[3]  ( .D(n92), .CK(CLK), .RN(RST), .QN(n25) );
  DFFRX1M \ALU_OUT_SAVED_reg[2]  ( .D(n91), .CK(CLK), .RN(RST), .QN(n26) );
  DFFRX1M \ALU_OUT_SAVED_reg[1]  ( .D(n90), .CK(CLK), .RN(RST), .QN(n27) );
  DFFRX1M \ALU_OUT_SAVED_reg[0]  ( .D(n89), .CK(CLK), .RN(RST), .QN(n28) );
  DFFRX1M \ALU_OUT_SAVED_reg[15]  ( .D(n104), .CK(CLK), .RN(RST), .QN(n13) );
  DFFRX1M \ALU_OUT_SAVED_reg[14]  ( .D(n103), .CK(CLK), .RN(RST), .QN(n14) );
  DFFRX1M \ALU_OUT_SAVED_reg[13]  ( .D(n102), .CK(CLK), .RN(RST), .QN(n15) );
  DFFRX1M \ALU_OUT_SAVED_reg[12]  ( .D(n101), .CK(CLK), .RN(RST), .QN(n16) );
  DFFRX1M \ALU_OUT_SAVED_reg[11]  ( .D(n100), .CK(CLK), .RN(RST), .QN(n17) );
  DFFRX1M \ALU_OUT_SAVED_reg[10]  ( .D(n99), .CK(CLK), .RN(RST), .QN(n18) );
  DFFRX1M \ALU_OUT_SAVED_reg[9]  ( .D(n98), .CK(CLK), .RN(RST), .QN(n19) );
  DFFRX1M \ALU_OUT_SAVED_reg[8]  ( .D(n97), .CK(CLK), .RN(RST), .QN(n20) );
  DFFRX1M \RF_ADDR_SAVED_reg[0]  ( .D(n105), .CK(CLK), .RN(RST), .QN(n12) );
  DFFRX1M \RF_ADDR_SAVED_reg[3]  ( .D(n108), .CK(CLK), .RN(RST), .QN(n9) );
  DFFRX1M \RF_ADDR_SAVED_reg[2]  ( .D(n107), .CK(CLK), .RN(RST), .QN(n10) );
  DFFRX1M \RF_ADDR_SAVED_reg[1]  ( .D(n106), .CK(CLK), .RN(RST), .QN(n11) );
  DFFRQX1M \current_state_reg[3]  ( .D(next_state[3]), .CK(CLK), .RN(RST), .Q(
        current_state[3]) );
  DFFRQX1M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX1M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX1M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  OAI22X4M U3 ( .A0(n8), .A1(n50), .B0(n57), .B1(n9), .Y(Address[3]) );
  NOR2X2M U4 ( .A(n74), .B(n29), .Y(ALU_FUN[2]) );
  NOR2X2M U5 ( .A(n74), .B(n31), .Y(ALU_FUN[0]) );
  NOR4X1M U6 ( .A(n48), .B(n47), .C(current_state[0]), .D(current_state[2]), 
        .Y(n87) );
  OAI22X2M U7 ( .A0(n29), .A1(n50), .B0(n57), .B1(n10), .Y(Address[2]) );
  INVX2M U8 ( .A(n79), .Y(n46) );
  INVX2M U9 ( .A(n80), .Y(n32) );
  NAND2BX2M U10 ( .AN(ALU_EN), .B(n46), .Y(next_state[3]) );
  NOR2X2M U11 ( .A(n46), .B(n45), .Y(n61) );
  NOR2X2M U12 ( .A(n61), .B(n87), .Y(n83) );
  NOR2X2M U13 ( .A(n47), .B(n62), .Y(n79) );
  NAND2X2M U14 ( .A(n48), .B(n109), .Y(n62) );
  NAND3X2M U15 ( .A(n74), .B(n46), .C(n83), .Y(CLK_G_EN) );
  AND3X2M U16 ( .A(n51), .B(n49), .C(n57), .Y(n81) );
  NOR2X2M U17 ( .A(n74), .B(n30), .Y(ALU_FUN[1]) );
  NAND3X2M U18 ( .A(n45), .B(n109), .C(n88), .Y(n57) );
  NOR2X2M U19 ( .A(n81), .B(n33), .Y(WrEn) );
  AOI211X2M U20 ( .A0(n33), .A1(n72), .B0(n73), .C0(n55), .Y(n58) );
  NOR4BX1M U21 ( .AN(n78), .B(n68), .C(n7), .D(n31), .Y(n73) );
  AND3X2M U22 ( .A(n53), .B(n5), .C(n29), .Y(n78) );
  OAI211X2M U23 ( .A0(n33), .A1(n51), .B0(n58), .C0(n63), .Y(next_state[0]) );
  AOI221XLM U24 ( .A0(n64), .A1(n33), .B0(n53), .B1(n65), .C0(n66), .Y(n63) );
  OAI21X2M U25 ( .A0(n45), .A1(n71), .B0(n49), .Y(n64) );
  NOR2X2M U26 ( .A(n81), .B(n31), .Y(Wr_D[0]) );
  NOR2X2M U27 ( .A(n81), .B(n30), .Y(Wr_D[1]) );
  NOR2X2M U28 ( .A(n81), .B(n29), .Y(Wr_D[2]) );
  NOR2X2M U29 ( .A(n81), .B(n8), .Y(Wr_D[3]) );
  NOR2X2M U30 ( .A(n81), .B(n7), .Y(Wr_D[4]) );
  NOR2X2M U31 ( .A(n81), .B(n6), .Y(Wr_D[5]) );
  NOR2X2M U32 ( .A(n81), .B(n5), .Y(Wr_D[6]) );
  NOR2X2M U33 ( .A(n81), .B(n4), .Y(Wr_D[7]) );
  NOR2X2M U34 ( .A(n74), .B(n8), .Y(ALU_FUN[3]) );
  INVX2M U35 ( .A(n50), .Y(RdEn) );
  NOR3X2M U36 ( .A(n33), .B(n45), .C(n71), .Y(n80) );
  NOR3X2M U37 ( .A(n8), .B(n33), .C(n4), .Y(n77) );
  NOR2X2M U38 ( .A(n33), .B(n74), .Y(ALU_EN) );
  BUFX2M U39 ( .A(n66), .Y(n2) );
  BUFX2M U40 ( .A(n66), .Y(n1) );
  AND2X2M U41 ( .A(n82), .B(n45), .Y(n54) );
  NAND2X2M U42 ( .A(n87), .B(n110), .Y(n86) );
  NAND2X2M U43 ( .A(n61), .B(n110), .Y(n85) );
  NAND3X2M U44 ( .A(current_state[0]), .B(n88), .C(current_state[2]), .Y(n74)
         );
  NOR2X2M U45 ( .A(n48), .B(current_state[3]), .Y(n88) );
  INVX2M U46 ( .A(current_state[0]), .Y(n45) );
  INVX2M U47 ( .A(current_state[2]), .Y(n109) );
  INVX2M U48 ( .A(current_state[1]), .Y(n48) );
  INVX2M U49 ( .A(current_state[3]), .Y(n47) );
  NOR3X2M U50 ( .A(current_state[1]), .B(current_state[3]), .C(n109), .Y(n82)
         );
  NAND2X2M U51 ( .A(n72), .B(RX_P_Data_VALID), .Y(n50) );
  NAND3X2M U52 ( .A(n88), .B(n45), .C(current_state[2]), .Y(n51) );
  NAND2X2M U53 ( .A(n82), .B(current_state[0]), .Y(n49) );
  AND3X2M U54 ( .A(n88), .B(n109), .C(current_state[0]), .Y(n72) );
  OAI221X1M U55 ( .A0(n57), .A1(n12), .B0(n31), .B1(n50), .C0(n51), .Y(
        Address[0]) );
  OAI22X1M U56 ( .A0(RX_P_Data_VALID), .A1(n74), .B0(n75), .B1(n76), .Y(n55)
         );
  NAND3X2M U57 ( .A(n30), .B(n6), .C(n69), .Y(n75) );
  NAND3X2M U58 ( .A(RX_P_Data[0]), .B(n53), .C(RX_P_Data[4]), .Y(n76) );
  NOR2X2M U59 ( .A(n71), .B(current_state[0]), .Y(n53) );
  OAI211X2M U60 ( .A0(RX_P_Data_VALID), .A1(n57), .B0(n58), .C0(n59), .Y(
        next_state[1]) );
  AOI211X2M U61 ( .A0(RX_P_Data_VALID), .A1(n60), .B0(n44), .C0(n61), .Y(n59)
         );
  OAI21X2M U62 ( .A0(n62), .A1(n45), .B0(n49), .Y(n60) );
  INVX2M U63 ( .A(n51), .Y(n44) );
  INVX2M U64 ( .A(RX_P_Data_VALID), .Y(n33) );
  INVX2M U65 ( .A(RX_P_Data[1]), .Y(n30) );
  INVX2M U66 ( .A(RX_P_Data[2]), .Y(n29) );
  INVX2M U67 ( .A(RX_P_Data[0]), .Y(n31) );
  INVX2M U68 ( .A(RX_P_Data[3]), .Y(n8) );
  OR2X2M U69 ( .A(n62), .B(current_state[3]), .Y(n71) );
  OAI22X1M U70 ( .A0(n30), .A1(n50), .B0(n57), .B1(n11), .Y(Address[1]) );
  OAI31X1M U71 ( .A0(n67), .A1(RX_P_Data[0]), .A2(n68), .B0(n56), .Y(n65) );
  NAND3X2M U72 ( .A(n7), .B(n5), .C(n29), .Y(n67) );
  OAI22X1M U73 ( .A0(n31), .A1(n32), .B0(n80), .B1(n12), .Y(n105) );
  OAI22X1M U74 ( .A0(n30), .A1(n32), .B0(n80), .B1(n11), .Y(n106) );
  OAI22X1M U75 ( .A0(n29), .A1(n32), .B0(n80), .B1(n10), .Y(n107) );
  OAI22X1M U76 ( .A0(n8), .A1(n32), .B0(n80), .B1(n9), .Y(n108) );
  AND3X2M U77 ( .A(ALU_OUT_Valid), .B(n79), .C(n45), .Y(n66) );
  AND3X2M U78 ( .A(n77), .B(RX_P_Data[2]), .C(RX_P_Data[6]), .Y(n69) );
  OAI2BB2X1M U79 ( .B0(n1), .B1(n28), .A0N(ALU_OUT[0]), .A1N(n2), .Y(n89) );
  OAI2BB2X1M U80 ( .B0(n1), .B1(n27), .A0N(ALU_OUT[1]), .A1N(n2), .Y(n90) );
  OAI2BB2X1M U81 ( .B0(n1), .B1(n26), .A0N(ALU_OUT[2]), .A1N(n2), .Y(n91) );
  OAI2BB2X1M U82 ( .B0(n1), .B1(n25), .A0N(ALU_OUT[3]), .A1N(n2), .Y(n92) );
  OAI2BB2X1M U83 ( .B0(n1), .B1(n24), .A0N(ALU_OUT[4]), .A1N(n2), .Y(n93) );
  OAI2BB2X1M U84 ( .B0(n1), .B1(n23), .A0N(ALU_OUT[5]), .A1N(n2), .Y(n94) );
  OAI2BB2X1M U85 ( .B0(n1), .B1(n22), .A0N(ALU_OUT[6]), .A1N(n2), .Y(n95) );
  OAI2BB2X1M U86 ( .B0(n2), .B1(n21), .A0N(ALU_OUT[7]), .A1N(n2), .Y(n96) );
  OAI2BB2X1M U87 ( .B0(n2), .B1(n20), .A0N(ALU_OUT[8]), .A1N(n2), .Y(n97) );
  OAI2BB2X1M U88 ( .B0(n2), .B1(n19), .A0N(ALU_OUT[9]), .A1N(n2), .Y(n98) );
  OAI2BB2X1M U89 ( .B0(n1), .B1(n18), .A0N(ALU_OUT[10]), .A1N(n2), .Y(n99) );
  OAI2BB2X1M U90 ( .B0(n2), .B1(n17), .A0N(ALU_OUT[11]), .A1N(n2), .Y(n100) );
  OAI2BB2X1M U91 ( .B0(n1), .B1(n16), .A0N(ALU_OUT[12]), .A1N(n2), .Y(n101) );
  OAI2BB2X1M U92 ( .B0(n1), .B1(n15), .A0N(ALU_OUT[13]), .A1N(n2), .Y(n102) );
  OAI2BB2X1M U93 ( .B0(n1), .B1(n14), .A0N(ALU_OUT[14]), .A1N(n2), .Y(n103) );
  OAI2BB2X1M U94 ( .B0(n1), .B1(n13), .A0N(ALU_OUT[15]), .A1N(n2), .Y(n104) );
  NAND3X2M U95 ( .A(n69), .B(n31), .C(n70), .Y(n56) );
  NOR3X2M U96 ( .A(RX_P_Data[1]), .B(RX_P_Data[5]), .C(RX_P_Data[4]), .Y(n70)
         );
  NAND4X2M U97 ( .A(n49), .B(n50), .C(n51), .D(n52), .Y(next_state[2]) );
  AOI221XLM U98 ( .A0(n3), .A1(n53), .B0(n54), .B1(n35), .C0(n55), .Y(n52) );
  INVX2M U99 ( .A(Rd_D_Valid), .Y(n35) );
  INVX2M U100 ( .A(n56), .Y(n3) );
  NAND3X2M U101 ( .A(RX_P_Data[1]), .B(n77), .C(RX_P_Data[5]), .Y(n68) );
  INVX2M U102 ( .A(RX_P_Data[4]), .Y(n7) );
  INVX2M U103 ( .A(RX_P_Data[5]), .Y(n6) );
  INVX2M U104 ( .A(RX_P_Data[6]), .Y(n5) );
  INVX2M U105 ( .A(RX_P_Data[7]), .Y(n4) );
  OAI222X1M U106 ( .A0(n28), .A1(n85), .B0(n20), .B1(n86), .C0(n84), .C1(n43), 
        .Y(TX_P_DATA[0]) );
  INVX2M U107 ( .A(Rd_D[0]), .Y(n43) );
  OAI222X1M U108 ( .A0(n27), .A1(n85), .B0(n19), .B1(n86), .C0(n84), .C1(n42), 
        .Y(TX_P_DATA[1]) );
  INVX2M U109 ( .A(Rd_D[1]), .Y(n42) );
  OAI222X1M U110 ( .A0(n26), .A1(n85), .B0(n18), .B1(n86), .C0(n84), .C1(n41), 
        .Y(TX_P_DATA[2]) );
  INVX2M U111 ( .A(Rd_D[2]), .Y(n41) );
  OAI222X1M U112 ( .A0(n25), .A1(n85), .B0(n17), .B1(n86), .C0(n84), .C1(n40), 
        .Y(TX_P_DATA[3]) );
  INVX2M U113 ( .A(Rd_D[3]), .Y(n40) );
  OAI222X1M U114 ( .A0(n24), .A1(n85), .B0(n16), .B1(n86), .C0(n84), .C1(n39), 
        .Y(TX_P_DATA[4]) );
  INVX2M U115 ( .A(Rd_D[4]), .Y(n39) );
  OAI222X1M U116 ( .A0(n23), .A1(n85), .B0(n15), .B1(n86), .C0(n84), .C1(n38), 
        .Y(TX_P_DATA[5]) );
  INVX2M U117 ( .A(Rd_D[5]), .Y(n38) );
  OAI222X1M U118 ( .A0(n22), .A1(n85), .B0(n14), .B1(n86), .C0(n84), .C1(n37), 
        .Y(TX_P_DATA[6]) );
  INVX2M U119 ( .A(Rd_D[6]), .Y(n37) );
  OAI222X1M U120 ( .A0(n21), .A1(n85), .B0(n13), .B1(n86), .C0(n84), .C1(n36), 
        .Y(TX_P_DATA[7]) );
  INVX2M U121 ( .A(Rd_D[7]), .Y(n36) );
  NAND3X2M U122 ( .A(n54), .B(n110), .C(Rd_D_Valid), .Y(n84) );
  OAI21X2M U123 ( .A0(F_FULL), .A1(n83), .B0(n84), .Y(W_INC) );
  INVX2M U124 ( .A(F_FULL), .Y(n110) );
endmodule


module Register_file ( CLK, RST, WrEn, RdEn, Address, WrData, REG0, REG1, REG2, 
        REG3, RdData, RdData_Valid );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  output [7:0] RdData;
  input CLK, RST, WrEn, RdEn;
  output RdData_Valid;
  wire   N11, N12, N13, N14, \REG[15][7] , \REG[15][6] , \REG[15][5] ,
         \REG[15][4] , \REG[15][3] , \REG[15][2] , \REG[15][1] , \REG[15][0] ,
         \REG[14][7] , \REG[14][6] , \REG[14][5] , \REG[14][4] , \REG[14][3] ,
         \REG[14][2] , \REG[14][1] , \REG[14][0] , \REG[13][7] , \REG[13][6] ,
         \REG[13][5] , \REG[13][4] , \REG[13][3] , \REG[13][2] , \REG[13][1] ,
         \REG[13][0] , \REG[12][7] , \REG[12][6] , \REG[12][5] , \REG[12][4] ,
         \REG[12][3] , \REG[12][2] , \REG[12][1] , \REG[12][0] , \REG[11][7] ,
         \REG[11][6] , \REG[11][5] , \REG[11][4] , \REG[11][3] , \REG[11][2] ,
         \REG[11][1] , \REG[11][0] , \REG[10][7] , \REG[10][6] , \REG[10][5] ,
         \REG[10][4] , \REG[10][3] , \REG[10][2] , \REG[10][1] , \REG[10][0] ,
         \REG[9][7] , \REG[9][6] , \REG[9][5] , \REG[9][4] , \REG[9][3] ,
         \REG[9][2] , \REG[9][1] , \REG[9][0] , \REG[8][7] , \REG[8][6] ,
         \REG[8][5] , \REG[8][4] , \REG[8][3] , \REG[8][2] , \REG[8][1] ,
         \REG[8][0] , \REG[7][7] , \REG[7][6] , \REG[7][5] , \REG[7][4] ,
         \REG[7][3] , \REG[7][2] , \REG[7][1] , \REG[7][0] , \REG[6][7] ,
         \REG[6][6] , \REG[6][5] , \REG[6][4] , \REG[6][3] , \REG[6][2] ,
         \REG[6][1] , \REG[6][0] , \REG[5][7] , \REG[5][6] , \REG[5][5] ,
         \REG[5][4] , \REG[5][3] , \REG[5][2] , \REG[5][1] , \REG[5][0] ,
         \REG[4][7] , \REG[4][6] , \REG[4][5] , \REG[4][4] , \REG[4][3] ,
         \REG[4][2] , \REG[4][1] , \REG[4][0] , N36, N37, N38, N39, N40, N41,
         N42, N43, n1, n3, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n27, n28, n29, n30, n31, n32, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n2, n4, n5, n6, n7, n8, n9, n10, n11, n26, n33,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220;
  tri   CLK;
  tri   RST;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFSQX2M \REG_reg[3][5]  ( .D(n76), .CK(CLK), .SN(n2), .Q(REG3[5]) );
  DFFRQX2M RdData_Valid_reg ( .D(n38), .CK(CLK), .RN(n2), .Q(RdData_Valid) );
  DFFSQX2M \REG_reg[2][0]  ( .D(n63), .CK(CLK), .SN(n2), .Q(REG2[0]) );
  DFFRQX2M \REG_reg[2][2]  ( .D(n65), .CK(CLK), .RN(n2), .Q(REG2[2]) );
  DFFRQX2M \REG_reg[2][3]  ( .D(n66), .CK(CLK), .RN(n2), .Q(REG2[3]) );
  DFFRQX2M \REG_reg[2][6]  ( .D(n69), .CK(CLK), .RN(n2), .Q(REG2[6]) );
  DFFSQX2M \REG_reg[2][7]  ( .D(n70), .CK(CLK), .SN(n2), .Q(REG2[7]) );
  DFFRQX2M \REG_reg[1][4]  ( .D(n59), .CK(CLK), .RN(n2), .Q(REG1[4]) );
  DFFRQX1M \REG_reg[8][7]  ( .D(n118), .CK(CLK), .RN(n2), .Q(\REG[8][7] ) );
  DFFRQX1M \REG_reg[8][6]  ( .D(n117), .CK(CLK), .RN(n2), .Q(\REG[8][6] ) );
  DFFRQX1M \REG_reg[8][5]  ( .D(n116), .CK(CLK), .RN(n2), .Q(\REG[8][5] ) );
  DFFRQX1M \REG_reg[8][4]  ( .D(n115), .CK(CLK), .RN(n2), .Q(\REG[8][4] ) );
  DFFRQX1M \REG_reg[8][3]  ( .D(n114), .CK(CLK), .RN(n2), .Q(\REG[8][3] ) );
  DFFRQX1M \REG_reg[8][2]  ( .D(n113), .CK(CLK), .RN(n2), .Q(\REG[8][2] ) );
  DFFRQX1M \REG_reg[8][1]  ( .D(n112), .CK(CLK), .RN(n2), .Q(\REG[8][1] ) );
  DFFRQX1M \REG_reg[8][0]  ( .D(n111), .CK(CLK), .RN(n2), .Q(\REG[8][0] ) );
  DFFRQX1M \REG_reg[9][7]  ( .D(n126), .CK(CLK), .RN(n2), .Q(\REG[9][7] ) );
  DFFRQX1M \REG_reg[9][6]  ( .D(n125), .CK(CLK), .RN(n2), .Q(\REG[9][6] ) );
  DFFRQX1M \REG_reg[9][5]  ( .D(n124), .CK(CLK), .RN(n2), .Q(\REG[9][5] ) );
  DFFRQX1M \REG_reg[9][4]  ( .D(n123), .CK(CLK), .RN(n2), .Q(\REG[9][4] ) );
  DFFRQX1M \REG_reg[9][3]  ( .D(n122), .CK(CLK), .RN(n2), .Q(\REG[9][3] ) );
  DFFRQX1M \REG_reg[9][2]  ( .D(n121), .CK(CLK), .RN(n2), .Q(\REG[9][2] ) );
  DFFRQX1M \REG_reg[9][1]  ( .D(n120), .CK(CLK), .RN(n2), .Q(\REG[9][1] ) );
  DFFRQX1M \REG_reg[9][0]  ( .D(n119), .CK(CLK), .RN(n2), .Q(\REG[9][0] ) );
  DFFRQX1M \REG_reg[11][7]  ( .D(n142), .CK(CLK), .RN(n2), .Q(\REG[11][7] ) );
  DFFRQX1M \REG_reg[11][6]  ( .D(n141), .CK(CLK), .RN(n2), .Q(\REG[11][6] ) );
  DFFRQX1M \REG_reg[11][5]  ( .D(n140), .CK(CLK), .RN(n2), .Q(\REG[11][5] ) );
  DFFRQX1M \REG_reg[11][4]  ( .D(n139), .CK(CLK), .RN(n2), .Q(\REG[11][4] ) );
  DFFRQX1M \REG_reg[11][3]  ( .D(n138), .CK(CLK), .RN(n2), .Q(\REG[11][3] ) );
  DFFRQX1M \REG_reg[11][2]  ( .D(n137), .CK(CLK), .RN(n2), .Q(\REG[11][2] ) );
  DFFRQX1M \REG_reg[11][1]  ( .D(n136), .CK(CLK), .RN(n2), .Q(\REG[11][1] ) );
  DFFRQX1M \REG_reg[11][0]  ( .D(n135), .CK(CLK), .RN(n2), .Q(\REG[11][0] ) );
  DFFRQX1M \REG_reg[10][7]  ( .D(n134), .CK(CLK), .RN(n2), .Q(\REG[10][7] ) );
  DFFRQX1M \REG_reg[10][6]  ( .D(n133), .CK(CLK), .RN(n2), .Q(\REG[10][6] ) );
  DFFRQX1M \REG_reg[10][5]  ( .D(n132), .CK(CLK), .RN(n2), .Q(\REG[10][5] ) );
  DFFRQX1M \REG_reg[10][4]  ( .D(n131), .CK(CLK), .RN(n2), .Q(\REG[10][4] ) );
  DFFRQX1M \REG_reg[10][3]  ( .D(n130), .CK(CLK), .RN(n2), .Q(\REG[10][3] ) );
  DFFRQX1M \REG_reg[10][2]  ( .D(n129), .CK(CLK), .RN(n2), .Q(\REG[10][2] ) );
  DFFRQX1M \REG_reg[10][1]  ( .D(n128), .CK(CLK), .RN(n2), .Q(\REG[10][1] ) );
  DFFRQX1M \REG_reg[10][0]  ( .D(n127), .CK(CLK), .RN(n2), .Q(\REG[10][0] ) );
  DFFRQX1M \REG_reg[15][7]  ( .D(n174), .CK(CLK), .RN(n2), .Q(\REG[15][7] ) );
  DFFRQX1M \REG_reg[15][6]  ( .D(n173), .CK(CLK), .RN(n2), .Q(\REG[15][6] ) );
  DFFRQX1M \REG_reg[15][5]  ( .D(n172), .CK(CLK), .RN(n2), .Q(\REG[15][5] ) );
  DFFRQX1M \REG_reg[15][4]  ( .D(n171), .CK(CLK), .RN(n2), .Q(\REG[15][4] ) );
  DFFRQX1M \REG_reg[15][3]  ( .D(n170), .CK(CLK), .RN(n2), .Q(\REG[15][3] ) );
  DFFRQX1M \REG_reg[15][2]  ( .D(n169), .CK(CLK), .RN(n2), .Q(\REG[15][2] ) );
  DFFRQX1M \REG_reg[15][1]  ( .D(n168), .CK(CLK), .RN(n2), .Q(\REG[15][1] ) );
  DFFRQX1M \REG_reg[15][0]  ( .D(n167), .CK(CLK), .RN(n2), .Q(\REG[15][0] ) );
  DFFRQX1M \REG_reg[14][7]  ( .D(n166), .CK(CLK), .RN(n2), .Q(\REG[14][7] ) );
  DFFRQX1M \REG_reg[14][6]  ( .D(n165), .CK(CLK), .RN(n2), .Q(\REG[14][6] ) );
  DFFRQX1M \REG_reg[14][5]  ( .D(n164), .CK(CLK), .RN(n2), .Q(\REG[14][5] ) );
  DFFRQX1M \REG_reg[14][4]  ( .D(n163), .CK(CLK), .RN(n2), .Q(\REG[14][4] ) );
  DFFRQX1M \REG_reg[14][3]  ( .D(n162), .CK(CLK), .RN(n2), .Q(\REG[14][3] ) );
  DFFRQX1M \REG_reg[14][2]  ( .D(n161), .CK(CLK), .RN(n2), .Q(\REG[14][2] ) );
  DFFRQX1M \REG_reg[14][1]  ( .D(n160), .CK(CLK), .RN(n2), .Q(\REG[14][1] ) );
  DFFRQX1M \REG_reg[14][0]  ( .D(n159), .CK(CLK), .RN(n2), .Q(\REG[14][0] ) );
  DFFRQX1M \REG_reg[13][7]  ( .D(n158), .CK(CLK), .RN(n2), .Q(\REG[13][7] ) );
  DFFRQX1M \REG_reg[13][6]  ( .D(n157), .CK(CLK), .RN(n2), .Q(\REG[13][6] ) );
  DFFRQX1M \REG_reg[13][5]  ( .D(n156), .CK(CLK), .RN(n2), .Q(\REG[13][5] ) );
  DFFRQX1M \REG_reg[13][4]  ( .D(n155), .CK(CLK), .RN(n2), .Q(\REG[13][4] ) );
  DFFRQX1M \REG_reg[13][3]  ( .D(n154), .CK(CLK), .RN(n2), .Q(\REG[13][3] ) );
  DFFRQX1M \REG_reg[13][2]  ( .D(n153), .CK(CLK), .RN(n2), .Q(\REG[13][2] ) );
  DFFRQX1M \REG_reg[13][1]  ( .D(n152), .CK(CLK), .RN(n2), .Q(\REG[13][1] ) );
  DFFRQX1M \REG_reg[13][0]  ( .D(n151), .CK(CLK), .RN(n2), .Q(\REG[13][0] ) );
  DFFRQX1M \REG_reg[12][7]  ( .D(n150), .CK(CLK), .RN(n2), .Q(\REG[12][7] ) );
  DFFRQX1M \REG_reg[12][6]  ( .D(n149), .CK(CLK), .RN(n2), .Q(\REG[12][6] ) );
  DFFRQX1M \REG_reg[12][5]  ( .D(n148), .CK(CLK), .RN(n2), .Q(\REG[12][5] ) );
  DFFRQX1M \REG_reg[12][4]  ( .D(n147), .CK(CLK), .RN(n2), .Q(\REG[12][4] ) );
  DFFRQX1M \REG_reg[12][3]  ( .D(n146), .CK(CLK), .RN(n2), .Q(\REG[12][3] ) );
  DFFRQX1M \REG_reg[12][2]  ( .D(n145), .CK(CLK), .RN(n2), .Q(\REG[12][2] ) );
  DFFRQX1M \REG_reg[12][1]  ( .D(n144), .CK(CLK), .RN(n2), .Q(\REG[12][1] ) );
  DFFRQX1M \REG_reg[12][0]  ( .D(n143), .CK(CLK), .RN(n2), .Q(\REG[12][0] ) );
  DFFRQX1M \REG_reg[6][7]  ( .D(n102), .CK(CLK), .RN(n2), .Q(\REG[6][7] ) );
  DFFRQX1M \REG_reg[6][6]  ( .D(n101), .CK(CLK), .RN(n2), .Q(\REG[6][6] ) );
  DFFRQX1M \REG_reg[6][5]  ( .D(n100), .CK(CLK), .RN(n2), .Q(\REG[6][5] ) );
  DFFRQX1M \REG_reg[6][4]  ( .D(n99), .CK(CLK), .RN(n2), .Q(\REG[6][4] ) );
  DFFRQX1M \REG_reg[6][3]  ( .D(n98), .CK(CLK), .RN(n2), .Q(\REG[6][3] ) );
  DFFRQX1M \REG_reg[6][2]  ( .D(n97), .CK(CLK), .RN(n2), .Q(\REG[6][2] ) );
  DFFRQX1M \REG_reg[6][1]  ( .D(n96), .CK(CLK), .RN(n2), .Q(\REG[6][1] ) );
  DFFRQX1M \REG_reg[6][0]  ( .D(n95), .CK(CLK), .RN(n2), .Q(\REG[6][0] ) );
  DFFRQX1M \REG_reg[4][7]  ( .D(n86), .CK(CLK), .RN(n2), .Q(\REG[4][7] ) );
  DFFRQX1M \REG_reg[4][6]  ( .D(n85), .CK(CLK), .RN(n2), .Q(\REG[4][6] ) );
  DFFRQX1M \REG_reg[4][5]  ( .D(n84), .CK(CLK), .RN(n2), .Q(\REG[4][5] ) );
  DFFRQX1M \REG_reg[4][4]  ( .D(n83), .CK(CLK), .RN(n2), .Q(\REG[4][4] ) );
  DFFRQX1M \REG_reg[4][3]  ( .D(n82), .CK(CLK), .RN(n2), .Q(\REG[4][3] ) );
  DFFRQX1M \REG_reg[4][2]  ( .D(n81), .CK(CLK), .RN(n2), .Q(\REG[4][2] ) );
  DFFRQX1M \REG_reg[4][1]  ( .D(n80), .CK(CLK), .RN(n2), .Q(\REG[4][1] ) );
  DFFRQX1M \REG_reg[4][0]  ( .D(n79), .CK(CLK), .RN(n2), .Q(\REG[4][0] ) );
  DFFRQX1M \REG_reg[7][7]  ( .D(n110), .CK(CLK), .RN(n2), .Q(\REG[7][7] ) );
  DFFRQX1M \REG_reg[7][6]  ( .D(n109), .CK(CLK), .RN(n2), .Q(\REG[7][6] ) );
  DFFRQX1M \REG_reg[7][5]  ( .D(n108), .CK(CLK), .RN(n2), .Q(\REG[7][5] ) );
  DFFRQX1M \REG_reg[7][4]  ( .D(n107), .CK(CLK), .RN(n2), .Q(\REG[7][4] ) );
  DFFRQX1M \REG_reg[7][3]  ( .D(n106), .CK(CLK), .RN(n2), .Q(\REG[7][3] ) );
  DFFRQX1M \REG_reg[7][2]  ( .D(n105), .CK(CLK), .RN(n2), .Q(\REG[7][2] ) );
  DFFRQX1M \REG_reg[7][1]  ( .D(n104), .CK(CLK), .RN(n2), .Q(\REG[7][1] ) );
  DFFRQX1M \REG_reg[7][0]  ( .D(n103), .CK(CLK), .RN(n2), .Q(\REG[7][0] ) );
  DFFRQX1M \REG_reg[5][7]  ( .D(n94), .CK(CLK), .RN(n2), .Q(\REG[5][7] ) );
  DFFRQX1M \REG_reg[5][6]  ( .D(n93), .CK(CLK), .RN(n2), .Q(\REG[5][6] ) );
  DFFRQX1M \REG_reg[5][5]  ( .D(n92), .CK(CLK), .RN(n2), .Q(\REG[5][5] ) );
  DFFRQX1M \REG_reg[5][4]  ( .D(n91), .CK(CLK), .RN(n2), .Q(\REG[5][4] ) );
  DFFRQX1M \REG_reg[5][3]  ( .D(n90), .CK(CLK), .RN(n2), .Q(\REG[5][3] ) );
  DFFRQX1M \REG_reg[5][2]  ( .D(n89), .CK(CLK), .RN(n2), .Q(\REG[5][2] ) );
  DFFRQX1M \REG_reg[5][1]  ( .D(n88), .CK(CLK), .RN(n2), .Q(\REG[5][1] ) );
  DFFRQX1M \REG_reg[5][0]  ( .D(n87), .CK(CLK), .RN(n2), .Q(\REG[5][0] ) );
  DFFRQX1M \REG_reg[2][5]  ( .D(n68), .CK(CLK), .RN(n2), .Q(REG2[5]) );
  DFFRQX1M \REG_reg[2][4]  ( .D(n67), .CK(CLK), .RN(n2), .Q(REG2[4]) );
  DFFRQX1M \REG_reg[2][1]  ( .D(n64), .CK(CLK), .RN(n2), .Q(REG2[1]) );
  DFFRQX1M \REG_reg[3][7]  ( .D(n78), .CK(CLK), .RN(n2), .Q(REG3[7]) );
  DFFRQX1M \REG_reg[3][6]  ( .D(n77), .CK(CLK), .RN(n2), .Q(REG3[6]) );
  DFFRQX1M \REG_reg[3][4]  ( .D(n75), .CK(CLK), .RN(n2), .Q(REG3[4]) );
  DFFRQX1M \REG_reg[3][3]  ( .D(n74), .CK(CLK), .RN(n2), .Q(REG3[3]) );
  DFFRQX1M \REG_reg[3][2]  ( .D(n73), .CK(CLK), .RN(n2), .Q(REG3[2]) );
  DFFRQX1M \REG_reg[3][1]  ( .D(n72), .CK(CLK), .RN(n2), .Q(REG3[1]) );
  DFFRQX1M \REG_reg[3][0]  ( .D(n71), .CK(CLK), .RN(n2), .Q(REG3[0]) );
  DFFRQX1M \REG_reg[1][7]  ( .D(n62), .CK(CLK), .RN(n2), .Q(REG1[7]) );
  DFFRQX1M \REG_reg[1][6]  ( .D(n61), .CK(CLK), .RN(n2), .Q(REG1[6]) );
  DFFRQX1M \REG_reg[1][5]  ( .D(n60), .CK(CLK), .RN(n2), .Q(REG1[5]) );
  DFFRQX1M \REG_reg[1][3]  ( .D(n58), .CK(CLK), .RN(n2), .Q(REG1[3]) );
  DFFRQX1M \REG_reg[1][2]  ( .D(n57), .CK(CLK), .RN(n2), .Q(REG1[2]) );
  DFFRQX1M \REG_reg[1][1]  ( .D(n56), .CK(CLK), .RN(n2), .Q(REG1[1]) );
  DFFRQX1M \REG_reg[1][0]  ( .D(n55), .CK(CLK), .RN(n2), .Q(REG1[0]) );
  DFFRQX1M \REG_reg[0][7]  ( .D(n54), .CK(CLK), .RN(n2), .Q(REG0[7]) );
  DFFRQX1M \REG_reg[0][6]  ( .D(n53), .CK(CLK), .RN(n2), .Q(REG0[6]) );
  DFFRQX1M \REG_reg[0][5]  ( .D(n52), .CK(CLK), .RN(n2), .Q(REG0[5]) );
  DFFRQX1M \REG_reg[0][4]  ( .D(n51), .CK(CLK), .RN(n2), .Q(REG0[4]) );
  DFFRQX1M \REG_reg[0][3]  ( .D(n50), .CK(CLK), .RN(n2), .Q(REG0[3]) );
  DFFRQX1M \REG_reg[0][2]  ( .D(n49), .CK(CLK), .RN(n2), .Q(REG0[2]) );
  DFFRQX1M \REG_reg[0][1]  ( .D(n48), .CK(CLK), .RN(n2), .Q(REG0[1]) );
  DFFRQX1M \REG_reg[0][0]  ( .D(n47), .CK(CLK), .RN(n2), .Q(REG0[0]) );
  DFFRQX1M \RdData_reg[0]  ( .D(n39), .CK(CLK), .RN(n2), .Q(RdData[0]) );
  DFFRQX1M \RdData_reg[7]  ( .D(n46), .CK(CLK), .RN(n2), .Q(RdData[7]) );
  DFFRQX1M \RdData_reg[6]  ( .D(n45), .CK(CLK), .RN(n2), .Q(RdData[6]) );
  DFFRQX1M \RdData_reg[5]  ( .D(n44), .CK(CLK), .RN(n2), .Q(RdData[5]) );
  DFFRQX1M \RdData_reg[1]  ( .D(n40), .CK(CLK), .RN(n2), .Q(RdData[1]) );
  DFFRQX1M \RdData_reg[4]  ( .D(n43), .CK(CLK), .RN(n2), .Q(RdData[4]) );
  DFFRQX1M \RdData_reg[3]  ( .D(n42), .CK(CLK), .RN(n2), .Q(RdData[3]) );
  DFFRQX1M \RdData_reg[2]  ( .D(n41), .CK(CLK), .RN(n2), .Q(RdData[2]) );
  NOR3BX2M U3 ( .AN(n24), .B(N11), .C(N14), .Y(n12) );
  NOR3BX2M U4 ( .AN(n24), .B(N14), .C(n210), .Y(n15) );
  BUFX10M U5 ( .A(RST), .Y(n2) );
  NOR2X2M U6 ( .A(n211), .B(N13), .Y(n17) );
  NOR2X2M U7 ( .A(N13), .B(n198), .Y(n13) );
  INVX2M U8 ( .A(n199), .Y(n200) );
  INVX2M U9 ( .A(n197), .Y(n198) );
  INVX2M U10 ( .A(n199), .Y(n201) );
  BUFX2M U11 ( .A(n210), .Y(n199) );
  INVX2M U12 ( .A(n1), .Y(n220) );
  BUFX2M U13 ( .A(n211), .Y(n197) );
  NOR2BX2M U14 ( .AN(WrEn), .B(RdEn), .Y(n24) );
  BUFX2M U15 ( .A(n16), .Y(n207) );
  NAND2X2M U16 ( .A(n17), .B(n12), .Y(n16) );
  BUFX2M U17 ( .A(n18), .Y(n206) );
  NAND2X2M U18 ( .A(n17), .B(n15), .Y(n18) );
  BUFX2M U19 ( .A(n19), .Y(n205) );
  NAND2X2M U20 ( .A(n20), .B(n12), .Y(n19) );
  BUFX2M U21 ( .A(n21), .Y(n204) );
  NAND2X2M U22 ( .A(n20), .B(n15), .Y(n21) );
  BUFX2M U23 ( .A(n22), .Y(n203) );
  NAND2X2M U24 ( .A(n23), .B(n12), .Y(n22) );
  BUFX2M U25 ( .A(n25), .Y(n202) );
  NAND2X2M U26 ( .A(n23), .B(n15), .Y(n25) );
  BUFX2M U27 ( .A(n14), .Y(n208) );
  NAND2X2M U28 ( .A(n15), .B(n13), .Y(n14) );
  BUFX2M U29 ( .A(n3), .Y(n209) );
  NAND2X2M U30 ( .A(n12), .B(n13), .Y(n3) );
  NOR2BX2M U31 ( .AN(RdEn), .B(WrEn), .Y(n1) );
  NAND2X2M U32 ( .A(n28), .B(n17), .Y(n31) );
  NAND2X2M U33 ( .A(n30), .B(n17), .Y(n32) );
  NAND2X2M U34 ( .A(n28), .B(n13), .Y(n27) );
  NAND2X2M U35 ( .A(n30), .B(n13), .Y(n29) );
  NAND2X2M U36 ( .A(n28), .B(n20), .Y(n34) );
  NAND2X2M U37 ( .A(n30), .B(n20), .Y(n35) );
  NAND2X2M U38 ( .A(n28), .B(n23), .Y(n36) );
  NAND2X2M U39 ( .A(n30), .B(n23), .Y(n37) );
  AND3X2M U40 ( .A(n24), .B(n210), .C(N14), .Y(n28) );
  AND3X2M U41 ( .A(N11), .B(n24), .C(N14), .Y(n30) );
  INVX2M U42 ( .A(WrData[0]), .Y(n219) );
  INVX2M U43 ( .A(WrData[1]), .Y(n218) );
  INVX2M U44 ( .A(WrData[2]), .Y(n217) );
  INVX2M U45 ( .A(WrData[3]), .Y(n216) );
  INVX2M U46 ( .A(WrData[4]), .Y(n215) );
  INVX2M U47 ( .A(WrData[5]), .Y(n214) );
  INVX2M U48 ( .A(WrData[6]), .Y(n213) );
  INVX2M U49 ( .A(WrData[7]), .Y(n212) );
  AND2X2M U50 ( .A(N13), .B(n211), .Y(n20) );
  AND2X2M U51 ( .A(N13), .B(n198), .Y(n23) );
  OAI2BB2X1M U52 ( .B0(n219), .B1(n208), .A0N(REG1[0]), .A1N(n208), .Y(n55) );
  OAI2BB2X1M U53 ( .B0(n218), .B1(n208), .A0N(REG1[1]), .A1N(n208), .Y(n56) );
  OAI2BB2X1M U54 ( .B0(n217), .B1(n208), .A0N(REG1[2]), .A1N(n208), .Y(n57) );
  OAI2BB2X1M U55 ( .B0(n216), .B1(n208), .A0N(REG1[3]), .A1N(n208), .Y(n58) );
  OAI2BB2X1M U56 ( .B0(n215), .B1(n208), .A0N(REG1[4]), .A1N(n208), .Y(n59) );
  OAI2BB2X1M U57 ( .B0(n214), .B1(n208), .A0N(REG1[5]), .A1N(n208), .Y(n60) );
  OAI2BB2X1M U58 ( .B0(n213), .B1(n208), .A0N(REG1[6]), .A1N(n208), .Y(n61) );
  OAI2BB2X1M U59 ( .B0(n212), .B1(n208), .A0N(REG1[7]), .A1N(n208), .Y(n62) );
  OAI2BB2X1M U60 ( .B0(n218), .B1(n207), .A0N(REG2[1]), .A1N(n207), .Y(n64) );
  OAI2BB2X1M U61 ( .B0(n217), .B1(n207), .A0N(REG2[2]), .A1N(n207), .Y(n65) );
  OAI2BB2X1M U62 ( .B0(n216), .B1(n207), .A0N(REG2[3]), .A1N(n207), .Y(n66) );
  OAI2BB2X1M U63 ( .B0(n215), .B1(n207), .A0N(REG2[4]), .A1N(n207), .Y(n67) );
  OAI2BB2X1M U64 ( .B0(n214), .B1(n207), .A0N(REG2[5]), .A1N(n207), .Y(n68) );
  OAI2BB2X1M U65 ( .B0(n213), .B1(n207), .A0N(REG2[6]), .A1N(n207), .Y(n69) );
  OAI2BB2X1M U66 ( .B0(n219), .B1(n206), .A0N(REG3[0]), .A1N(n206), .Y(n71) );
  OAI2BB2X1M U67 ( .B0(n218), .B1(n206), .A0N(REG3[1]), .A1N(n206), .Y(n72) );
  OAI2BB2X1M U68 ( .B0(n217), .B1(n206), .A0N(REG3[2]), .A1N(n206), .Y(n73) );
  OAI2BB2X1M U69 ( .B0(n216), .B1(n206), .A0N(REG3[3]), .A1N(n206), .Y(n74) );
  OAI2BB2X1M U70 ( .B0(n215), .B1(n206), .A0N(REG3[4]), .A1N(n206), .Y(n75) );
  OAI2BB2X1M U71 ( .B0(n213), .B1(n206), .A0N(REG3[6]), .A1N(n206), .Y(n77) );
  OAI2BB2X1M U72 ( .B0(n212), .B1(n206), .A0N(REG3[7]), .A1N(n206), .Y(n78) );
  OAI2BB2X1M U73 ( .B0(n219), .B1(n205), .A0N(\REG[4][0] ), .A1N(n205), .Y(n79) );
  OAI2BB2X1M U74 ( .B0(n218), .B1(n205), .A0N(\REG[4][1] ), .A1N(n205), .Y(n80) );
  OAI2BB2X1M U75 ( .B0(n217), .B1(n205), .A0N(\REG[4][2] ), .A1N(n205), .Y(n81) );
  OAI2BB2X1M U76 ( .B0(n216), .B1(n205), .A0N(\REG[4][3] ), .A1N(n205), .Y(n82) );
  OAI2BB2X1M U77 ( .B0(n215), .B1(n205), .A0N(\REG[4][4] ), .A1N(n205), .Y(n83) );
  OAI2BB2X1M U78 ( .B0(n214), .B1(n205), .A0N(\REG[4][5] ), .A1N(n205), .Y(n84) );
  OAI2BB2X1M U79 ( .B0(n213), .B1(n205), .A0N(\REG[4][6] ), .A1N(n205), .Y(n85) );
  OAI2BB2X1M U80 ( .B0(n212), .B1(n205), .A0N(\REG[4][7] ), .A1N(n205), .Y(n86) );
  OAI2BB2X1M U81 ( .B0(n219), .B1(n204), .A0N(\REG[5][0] ), .A1N(n204), .Y(n87) );
  OAI2BB2X1M U82 ( .B0(n218), .B1(n204), .A0N(\REG[5][1] ), .A1N(n204), .Y(n88) );
  OAI2BB2X1M U83 ( .B0(n217), .B1(n204), .A0N(\REG[5][2] ), .A1N(n204), .Y(n89) );
  OAI2BB2X1M U84 ( .B0(n216), .B1(n204), .A0N(\REG[5][3] ), .A1N(n204), .Y(n90) );
  OAI2BB2X1M U85 ( .B0(n215), .B1(n204), .A0N(\REG[5][4] ), .A1N(n204), .Y(n91) );
  OAI2BB2X1M U86 ( .B0(n214), .B1(n204), .A0N(\REG[5][5] ), .A1N(n204), .Y(n92) );
  OAI2BB2X1M U87 ( .B0(n213), .B1(n204), .A0N(\REG[5][6] ), .A1N(n204), .Y(n93) );
  OAI2BB2X1M U88 ( .B0(n212), .B1(n204), .A0N(\REG[5][7] ), .A1N(n204), .Y(n94) );
  OAI2BB2X1M U89 ( .B0(n219), .B1(n203), .A0N(\REG[6][0] ), .A1N(n203), .Y(n95) );
  OAI2BB2X1M U90 ( .B0(n218), .B1(n203), .A0N(\REG[6][1] ), .A1N(n203), .Y(n96) );
  OAI2BB2X1M U91 ( .B0(n217), .B1(n203), .A0N(\REG[6][2] ), .A1N(n203), .Y(n97) );
  OAI2BB2X1M U92 ( .B0(n216), .B1(n203), .A0N(\REG[6][3] ), .A1N(n203), .Y(n98) );
  OAI2BB2X1M U93 ( .B0(n215), .B1(n203), .A0N(\REG[6][4] ), .A1N(n203), .Y(n99) );
  OAI2BB2X1M U94 ( .B0(n214), .B1(n203), .A0N(\REG[6][5] ), .A1N(n203), .Y(
        n100) );
  OAI2BB2X1M U95 ( .B0(n213), .B1(n203), .A0N(\REG[6][6] ), .A1N(n203), .Y(
        n101) );
  OAI2BB2X1M U96 ( .B0(n212), .B1(n203), .A0N(\REG[6][7] ), .A1N(n203), .Y(
        n102) );
  OAI2BB2X1M U97 ( .B0(n219), .B1(n202), .A0N(\REG[7][0] ), .A1N(n202), .Y(
        n103) );
  OAI2BB2X1M U98 ( .B0(n218), .B1(n202), .A0N(\REG[7][1] ), .A1N(n202), .Y(
        n104) );
  OAI2BB2X1M U99 ( .B0(n217), .B1(n202), .A0N(\REG[7][2] ), .A1N(n202), .Y(
        n105) );
  OAI2BB2X1M U100 ( .B0(n216), .B1(n202), .A0N(\REG[7][3] ), .A1N(n202), .Y(
        n106) );
  OAI2BB2X1M U101 ( .B0(n215), .B1(n202), .A0N(\REG[7][4] ), .A1N(n202), .Y(
        n107) );
  OAI2BB2X1M U102 ( .B0(n214), .B1(n202), .A0N(\REG[7][5] ), .A1N(n202), .Y(
        n108) );
  OAI2BB2X1M U103 ( .B0(n213), .B1(n202), .A0N(\REG[7][6] ), .A1N(n202), .Y(
        n109) );
  OAI2BB2X1M U104 ( .B0(n212), .B1(n202), .A0N(\REG[7][7] ), .A1N(n202), .Y(
        n110) );
  OAI2BB2X1M U105 ( .B0(n209), .B1(n219), .A0N(REG0[0]), .A1N(n209), .Y(n47)
         );
  OAI2BB2X1M U106 ( .B0(n209), .B1(n218), .A0N(REG0[1]), .A1N(n209), .Y(n48)
         );
  OAI2BB2X1M U107 ( .B0(n209), .B1(n217), .A0N(REG0[2]), .A1N(n209), .Y(n49)
         );
  OAI2BB2X1M U108 ( .B0(n209), .B1(n216), .A0N(REG0[3]), .A1N(n209), .Y(n50)
         );
  OAI2BB2X1M U109 ( .B0(n209), .B1(n215), .A0N(REG0[4]), .A1N(n209), .Y(n51)
         );
  OAI2BB2X1M U110 ( .B0(n209), .B1(n214), .A0N(REG0[5]), .A1N(n209), .Y(n52)
         );
  OAI2BB2X1M U111 ( .B0(n209), .B1(n213), .A0N(REG0[6]), .A1N(n209), .Y(n53)
         );
  OAI2BB2X1M U112 ( .B0(n209), .B1(n212), .A0N(REG0[7]), .A1N(n209), .Y(n54)
         );
  OAI2BB2X1M U113 ( .B0(n219), .B1(n207), .A0N(REG2[0]), .A1N(n207), .Y(n63)
         );
  OAI2BB2X1M U114 ( .B0(n212), .B1(n207), .A0N(REG2[7]), .A1N(n207), .Y(n70)
         );
  OAI2BB2X1M U115 ( .B0(n214), .B1(n206), .A0N(REG3[5]), .A1N(n206), .Y(n76)
         );
  AO22X1M U116 ( .A0(N43), .A1(n1), .B0(RdData[0]), .B1(n220), .Y(n39) );
  MX4X1M U117 ( .A(n7), .B(n5), .C(n6), .D(n4), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U118 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(n198), .Y(n7) );
  MX4X1M U119 ( .A(\REG[8][0] ), .B(\REG[9][0] ), .C(\REG[10][0] ), .D(
        \REG[11][0] ), .S0(N11), .S1(n198), .Y(n5) );
  AO22X1M U120 ( .A0(N42), .A1(n1), .B0(RdData[1]), .B1(n220), .Y(n40) );
  MX4X1M U121 ( .A(n11), .B(n9), .C(n10), .D(n8), .S0(N14), .S1(N13), .Y(N42)
         );
  MX4X1M U122 ( .A(\REG[8][1] ), .B(\REG[9][1] ), .C(\REG[10][1] ), .D(
        \REG[11][1] ), .S0(N11), .S1(n198), .Y(n9) );
  MX4X1M U123 ( .A(\REG[12][1] ), .B(\REG[13][1] ), .C(\REG[14][1] ), .D(
        \REG[15][1] ), .S0(n201), .S1(n198), .Y(n8) );
  AO22X1M U124 ( .A0(N41), .A1(n1), .B0(RdData[2]), .B1(n220), .Y(n41) );
  MX4X1M U125 ( .A(n176), .B(n33), .C(n175), .D(n26), .S0(N14), .S1(N13), .Y(
        N41) );
  MX4X1M U126 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n200), 
        .S1(n198), .Y(n176) );
  MX4X1M U127 ( .A(\REG[8][2] ), .B(\REG[9][2] ), .C(\REG[10][2] ), .D(
        \REG[11][2] ), .S0(n200), .S1(n198), .Y(n33) );
  AO22X1M U128 ( .A0(N40), .A1(n1), .B0(RdData[3]), .B1(n220), .Y(n42) );
  MX4X1M U129 ( .A(n180), .B(n178), .C(n179), .D(n177), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U130 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n200), 
        .S1(n198), .Y(n180) );
  MX4X1M U131 ( .A(\REG[8][3] ), .B(\REG[9][3] ), .C(\REG[10][3] ), .D(
        \REG[11][3] ), .S0(n200), .S1(N12), .Y(n178) );
  AO22X1M U132 ( .A0(N39), .A1(n1), .B0(RdData[4]), .B1(n220), .Y(n43) );
  MX4X1M U133 ( .A(n184), .B(n182), .C(n183), .D(n181), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U134 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n201), 
        .S1(N12), .Y(n184) );
  MX4X1M U135 ( .A(\REG[8][4] ), .B(\REG[9][4] ), .C(\REG[10][4] ), .D(
        \REG[11][4] ), .S0(n200), .S1(n198), .Y(n182) );
  AO22X1M U136 ( .A0(N38), .A1(n1), .B0(RdData[5]), .B1(n220), .Y(n44) );
  MX4X1M U137 ( .A(n188), .B(n186), .C(n187), .D(n185), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U138 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n201), 
        .S1(n198), .Y(n188) );
  MX4X1M U139 ( .A(\REG[8][5] ), .B(\REG[9][5] ), .C(\REG[10][5] ), .D(
        \REG[11][5] ), .S0(n201), .S1(n198), .Y(n186) );
  AO22X1M U140 ( .A0(N37), .A1(n1), .B0(RdData[6]), .B1(n220), .Y(n45) );
  MX4X1M U141 ( .A(n192), .B(n190), .C(n191), .D(n189), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U142 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n201), 
        .S1(n198), .Y(n192) );
  MX4X1M U143 ( .A(\REG[8][6] ), .B(\REG[9][6] ), .C(\REG[10][6] ), .D(
        \REG[11][6] ), .S0(n201), .S1(n198), .Y(n190) );
  AO22X1M U144 ( .A0(N36), .A1(n1), .B0(RdData[7]), .B1(n220), .Y(n46) );
  MX4X1M U145 ( .A(n196), .B(n194), .C(n195), .D(n193), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U146 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n201), 
        .S1(n198), .Y(n196) );
  MX4X1M U147 ( .A(\REG[8][7] ), .B(\REG[9][7] ), .C(\REG[10][7] ), .D(
        \REG[11][7] ), .S0(n201), .S1(n198), .Y(n194) );
  MX4X1M U148 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n200), 
        .S1(n198), .Y(n11) );
  MX4X1M U149 ( .A(\REG[4][0] ), .B(\REG[5][0] ), .C(\REG[6][0] ), .D(
        \REG[7][0] ), .S0(N11), .S1(n198), .Y(n6) );
  MX4X1M U150 ( .A(\REG[4][1] ), .B(\REG[5][1] ), .C(\REG[6][1] ), .D(
        \REG[7][1] ), .S0(n200), .S1(n198), .Y(n10) );
  MX4X1M U151 ( .A(\REG[4][2] ), .B(\REG[5][2] ), .C(\REG[6][2] ), .D(
        \REG[7][2] ), .S0(n200), .S1(N12), .Y(n175) );
  MX4X1M U152 ( .A(\REG[4][3] ), .B(\REG[5][3] ), .C(\REG[6][3] ), .D(
        \REG[7][3] ), .S0(n200), .S1(n198), .Y(n179) );
  MX4X1M U153 ( .A(\REG[4][4] ), .B(\REG[5][4] ), .C(\REG[6][4] ), .D(
        \REG[7][4] ), .S0(n200), .S1(N12), .Y(n183) );
  MX4X1M U154 ( .A(\REG[4][5] ), .B(\REG[5][5] ), .C(\REG[6][5] ), .D(
        \REG[7][5] ), .S0(n201), .S1(N12), .Y(n187) );
  MX4X1M U155 ( .A(\REG[4][6] ), .B(\REG[5][6] ), .C(\REG[6][6] ), .D(
        \REG[7][6] ), .S0(n201), .S1(N12), .Y(n191) );
  MX4X1M U156 ( .A(\REG[4][7] ), .B(\REG[5][7] ), .C(\REG[6][7] ), .D(
        \REG[7][7] ), .S0(n201), .S1(N12), .Y(n195) );
  MX4X1M U157 ( .A(\REG[12][0] ), .B(\REG[13][0] ), .C(\REG[14][0] ), .D(
        \REG[15][0] ), .S0(n200), .S1(n198), .Y(n4) );
  MX4X1M U158 ( .A(\REG[12][2] ), .B(\REG[13][2] ), .C(\REG[14][2] ), .D(
        \REG[15][2] ), .S0(n200), .S1(n198), .Y(n26) );
  MX4X1M U159 ( .A(\REG[12][3] ), .B(\REG[13][3] ), .C(\REG[14][3] ), .D(
        \REG[15][3] ), .S0(n200), .S1(n198), .Y(n177) );
  MX4X1M U160 ( .A(\REG[12][4] ), .B(\REG[13][4] ), .C(\REG[14][4] ), .D(
        \REG[15][4] ), .S0(n200), .S1(n198), .Y(n181) );
  MX4X1M U161 ( .A(\REG[12][5] ), .B(\REG[13][5] ), .C(\REG[14][5] ), .D(
        \REG[15][5] ), .S0(n201), .S1(n198), .Y(n185) );
  MX4X1M U162 ( .A(\REG[12][6] ), .B(\REG[13][6] ), .C(\REG[14][6] ), .D(
        \REG[15][6] ), .S0(n201), .S1(n198), .Y(n189) );
  MX4X1M U163 ( .A(\REG[12][7] ), .B(\REG[13][7] ), .C(\REG[14][7] ), .D(
        \REG[15][7] ), .S0(n201), .S1(n198), .Y(n193) );
  INVX2M U164 ( .A(N11), .Y(n210) );
  OAI2BB2X1M U165 ( .B0(n219), .B1(n27), .A0N(\REG[8][0] ), .A1N(n27), .Y(n111) );
  OAI2BB2X1M U166 ( .B0(n218), .B1(n27), .A0N(\REG[8][1] ), .A1N(n27), .Y(n112) );
  OAI2BB2X1M U167 ( .B0(n217), .B1(n27), .A0N(\REG[8][2] ), .A1N(n27), .Y(n113) );
  OAI2BB2X1M U168 ( .B0(n216), .B1(n27), .A0N(\REG[8][3] ), .A1N(n27), .Y(n114) );
  OAI2BB2X1M U169 ( .B0(n215), .B1(n27), .A0N(\REG[8][4] ), .A1N(n27), .Y(n115) );
  OAI2BB2X1M U170 ( .B0(n214), .B1(n27), .A0N(\REG[8][5] ), .A1N(n27), .Y(n116) );
  OAI2BB2X1M U171 ( .B0(n213), .B1(n27), .A0N(\REG[8][6] ), .A1N(n27), .Y(n117) );
  OAI2BB2X1M U172 ( .B0(n212), .B1(n27), .A0N(\REG[8][7] ), .A1N(n27), .Y(n118) );
  OAI2BB2X1M U173 ( .B0(n219), .B1(n29), .A0N(\REG[9][0] ), .A1N(n29), .Y(n119) );
  OAI2BB2X1M U174 ( .B0(n218), .B1(n29), .A0N(\REG[9][1] ), .A1N(n29), .Y(n120) );
  OAI2BB2X1M U175 ( .B0(n217), .B1(n29), .A0N(\REG[9][2] ), .A1N(n29), .Y(n121) );
  OAI2BB2X1M U176 ( .B0(n216), .B1(n29), .A0N(\REG[9][3] ), .A1N(n29), .Y(n122) );
  OAI2BB2X1M U177 ( .B0(n215), .B1(n29), .A0N(\REG[9][4] ), .A1N(n29), .Y(n123) );
  OAI2BB2X1M U178 ( .B0(n214), .B1(n29), .A0N(\REG[9][5] ), .A1N(n29), .Y(n124) );
  OAI2BB2X1M U179 ( .B0(n213), .B1(n29), .A0N(\REG[9][6] ), .A1N(n29), .Y(n125) );
  OAI2BB2X1M U180 ( .B0(n212), .B1(n29), .A0N(\REG[9][7] ), .A1N(n29), .Y(n126) );
  OAI2BB2X1M U181 ( .B0(n219), .B1(n31), .A0N(\REG[10][0] ), .A1N(n31), .Y(
        n127) );
  OAI2BB2X1M U182 ( .B0(n218), .B1(n31), .A0N(\REG[10][1] ), .A1N(n31), .Y(
        n128) );
  OAI2BB2X1M U183 ( .B0(n217), .B1(n31), .A0N(\REG[10][2] ), .A1N(n31), .Y(
        n129) );
  OAI2BB2X1M U184 ( .B0(n216), .B1(n31), .A0N(\REG[10][3] ), .A1N(n31), .Y(
        n130) );
  OAI2BB2X1M U185 ( .B0(n215), .B1(n31), .A0N(\REG[10][4] ), .A1N(n31), .Y(
        n131) );
  OAI2BB2X1M U186 ( .B0(n214), .B1(n31), .A0N(\REG[10][5] ), .A1N(n31), .Y(
        n132) );
  OAI2BB2X1M U187 ( .B0(n213), .B1(n31), .A0N(\REG[10][6] ), .A1N(n31), .Y(
        n133) );
  OAI2BB2X1M U188 ( .B0(n212), .B1(n31), .A0N(\REG[10][7] ), .A1N(n31), .Y(
        n134) );
  OAI2BB2X1M U189 ( .B0(n219), .B1(n32), .A0N(\REG[11][0] ), .A1N(n32), .Y(
        n135) );
  OAI2BB2X1M U190 ( .B0(n218), .B1(n32), .A0N(\REG[11][1] ), .A1N(n32), .Y(
        n136) );
  OAI2BB2X1M U191 ( .B0(n217), .B1(n32), .A0N(\REG[11][2] ), .A1N(n32), .Y(
        n137) );
  OAI2BB2X1M U192 ( .B0(n216), .B1(n32), .A0N(\REG[11][3] ), .A1N(n32), .Y(
        n138) );
  OAI2BB2X1M U193 ( .B0(n215), .B1(n32), .A0N(\REG[11][4] ), .A1N(n32), .Y(
        n139) );
  OAI2BB2X1M U194 ( .B0(n214), .B1(n32), .A0N(\REG[11][5] ), .A1N(n32), .Y(
        n140) );
  OAI2BB2X1M U195 ( .B0(n213), .B1(n32), .A0N(\REG[11][6] ), .A1N(n32), .Y(
        n141) );
  OAI2BB2X1M U196 ( .B0(n212), .B1(n32), .A0N(\REG[11][7] ), .A1N(n32), .Y(
        n142) );
  OAI2BB2X1M U197 ( .B0(n219), .B1(n34), .A0N(\REG[12][0] ), .A1N(n34), .Y(
        n143) );
  OAI2BB2X1M U198 ( .B0(n218), .B1(n34), .A0N(\REG[12][1] ), .A1N(n34), .Y(
        n144) );
  OAI2BB2X1M U199 ( .B0(n217), .B1(n34), .A0N(\REG[12][2] ), .A1N(n34), .Y(
        n145) );
  OAI2BB2X1M U200 ( .B0(n216), .B1(n34), .A0N(\REG[12][3] ), .A1N(n34), .Y(
        n146) );
  OAI2BB2X1M U201 ( .B0(n215), .B1(n34), .A0N(\REG[12][4] ), .A1N(n34), .Y(
        n147) );
  OAI2BB2X1M U202 ( .B0(n214), .B1(n34), .A0N(\REG[12][5] ), .A1N(n34), .Y(
        n148) );
  OAI2BB2X1M U203 ( .B0(n213), .B1(n34), .A0N(\REG[12][6] ), .A1N(n34), .Y(
        n149) );
  OAI2BB2X1M U204 ( .B0(n212), .B1(n34), .A0N(\REG[12][7] ), .A1N(n34), .Y(
        n150) );
  OAI2BB2X1M U205 ( .B0(n219), .B1(n35), .A0N(\REG[13][0] ), .A1N(n35), .Y(
        n151) );
  OAI2BB2X1M U206 ( .B0(n218), .B1(n35), .A0N(\REG[13][1] ), .A1N(n35), .Y(
        n152) );
  OAI2BB2X1M U207 ( .B0(n217), .B1(n35), .A0N(\REG[13][2] ), .A1N(n35), .Y(
        n153) );
  OAI2BB2X1M U208 ( .B0(n216), .B1(n35), .A0N(\REG[13][3] ), .A1N(n35), .Y(
        n154) );
  OAI2BB2X1M U209 ( .B0(n215), .B1(n35), .A0N(\REG[13][4] ), .A1N(n35), .Y(
        n155) );
  OAI2BB2X1M U210 ( .B0(n214), .B1(n35), .A0N(\REG[13][5] ), .A1N(n35), .Y(
        n156) );
  OAI2BB2X1M U211 ( .B0(n213), .B1(n35), .A0N(\REG[13][6] ), .A1N(n35), .Y(
        n157) );
  OAI2BB2X1M U212 ( .B0(n212), .B1(n35), .A0N(\REG[13][7] ), .A1N(n35), .Y(
        n158) );
  OAI2BB2X1M U213 ( .B0(n219), .B1(n36), .A0N(\REG[14][0] ), .A1N(n36), .Y(
        n159) );
  OAI2BB2X1M U214 ( .B0(n218), .B1(n36), .A0N(\REG[14][1] ), .A1N(n36), .Y(
        n160) );
  OAI2BB2X1M U215 ( .B0(n217), .B1(n36), .A0N(\REG[14][2] ), .A1N(n36), .Y(
        n161) );
  OAI2BB2X1M U216 ( .B0(n216), .B1(n36), .A0N(\REG[14][3] ), .A1N(n36), .Y(
        n162) );
  OAI2BB2X1M U217 ( .B0(n215), .B1(n36), .A0N(\REG[14][4] ), .A1N(n36), .Y(
        n163) );
  OAI2BB2X1M U218 ( .B0(n214), .B1(n36), .A0N(\REG[14][5] ), .A1N(n36), .Y(
        n164) );
  OAI2BB2X1M U219 ( .B0(n213), .B1(n36), .A0N(\REG[14][6] ), .A1N(n36), .Y(
        n165) );
  OAI2BB2X1M U220 ( .B0(n212), .B1(n36), .A0N(\REG[14][7] ), .A1N(n36), .Y(
        n166) );
  OAI2BB2X1M U221 ( .B0(n219), .B1(n37), .A0N(\REG[15][0] ), .A1N(n37), .Y(
        n167) );
  OAI2BB2X1M U222 ( .B0(n218), .B1(n37), .A0N(\REG[15][1] ), .A1N(n37), .Y(
        n168) );
  OAI2BB2X1M U223 ( .B0(n217), .B1(n37), .A0N(\REG[15][2] ), .A1N(n37), .Y(
        n169) );
  OAI2BB2X1M U224 ( .B0(n216), .B1(n37), .A0N(\REG[15][3] ), .A1N(n37), .Y(
        n170) );
  OAI2BB2X1M U225 ( .B0(n215), .B1(n37), .A0N(\REG[15][4] ), .A1N(n37), .Y(
        n171) );
  OAI2BB2X1M U226 ( .B0(n214), .B1(n37), .A0N(\REG[15][5] ), .A1N(n37), .Y(
        n172) );
  OAI2BB2X1M U227 ( .B0(n213), .B1(n37), .A0N(\REG[15][6] ), .A1N(n37), .Y(
        n173) );
  OAI2BB2X1M U228 ( .B0(n212), .B1(n37), .A0N(\REG[15][7] ), .A1N(n37), .Y(
        n174) );
  INVX2M U229 ( .A(N12), .Y(n211) );
  OR2X2M U230 ( .A(RdData_Valid), .B(n1), .Y(n38) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n18), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n18), .Y(n5) );
  NAND2X2M U15 ( .A(n5), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n7) );
  NAND2X2M U17 ( .A(n5), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U18 ( .A(a[2]), .Y(n8) );
  NAND2X2M U19 ( .A(n5), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U20 ( .A(a[1]), .Y(n9) );
  NAND2X2M U21 ( .A(n5), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U22 ( .A(a[0]), .Y(n10) );
  NAND2X2M U23 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U24 ( .A(a[6]), .Y(n2) );
  INVX2M U25 ( .A(n18), .Y(n1) );
  XNOR2X2M U26 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(b[1]), .Y(n17) );
  INVX2M U29 ( .A(b[2]), .Y(n16) );
  INVX2M U30 ( .A(b[3]), .Y(n15) );
  INVX2M U31 ( .A(b[4]), .Y(n14) );
  INVX2M U32 ( .A(b[5]), .Y(n13) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [9:0] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n9), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n5), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n7), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n8), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n3), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n4), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(B[6]), .Y(n4) );
  INVX2M U2 ( .A(carry[8]), .Y(DIFF[8]) );
  XNOR2X2M U3 ( .A(n10), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U4 ( .A(B[0]), .Y(n10) );
  INVX2M U5 ( .A(B[7]), .Y(n3) );
  INVX2M U6 ( .A(B[2]), .Y(n8) );
  INVX2M U7 ( .A(B[3]), .Y(n7) );
  INVX2M U8 ( .A(B[4]), .Y(n6) );
  INVX2M U9 ( .A(B[5]), .Y(n5) );
  INVX2M U10 ( .A(B[1]), .Y(n9) );
  NAND2X2M U11 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U12 ( .A(A[0]), .Y(n1) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20
;
  assign SUM[6] = A[6];
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  AOI21BX2M U2 ( .A0(n11), .A1(A[12]), .B0N(n12), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n8) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n2), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n2) );
  XNOR2X1M U7 ( .A(n3), .B(n4), .Y(SUM[9]) );
  NOR2X1M U8 ( .A(n5), .B(n6), .Y(n4) );
  CLKXOR2X2M U9 ( .A(n7), .B(n8), .Y(SUM[8]) );
  NAND2BX1M U10 ( .AN(n9), .B(n10), .Y(n7) );
  OAI21X1M U11 ( .A0(A[12]), .A1(n11), .B0(B[12]), .Y(n12) );
  XOR3XLM U12 ( .A(B[12]), .B(A[12]), .C(n11), .Y(SUM[12]) );
  OAI21BX1M U13 ( .A0(n13), .A1(n14), .B0N(n15), .Y(n11) );
  XNOR2X1M U14 ( .A(n14), .B(n16), .Y(SUM[11]) );
  NOR2X1M U15 ( .A(n15), .B(n13), .Y(n16) );
  NOR2X1M U16 ( .A(B[11]), .B(A[11]), .Y(n13) );
  AND2X1M U17 ( .A(B[11]), .B(A[11]), .Y(n15) );
  OA21X1M U18 ( .A0(n17), .A1(n18), .B0(n19), .Y(n14) );
  CLKXOR2X2M U19 ( .A(n20), .B(n18), .Y(SUM[10]) );
  AOI2BB1X1M U20 ( .A0N(n3), .A1N(n6), .B0(n5), .Y(n18) );
  AND2X1M U21 ( .A(B[9]), .B(A[9]), .Y(n5) );
  NOR2X1M U22 ( .A(B[9]), .B(A[9]), .Y(n6) );
  OA21X1M U23 ( .A0(n8), .A1(n9), .B0(n10), .Y(n3) );
  CLKNAND2X2M U24 ( .A(B[8]), .B(A[8]), .Y(n10) );
  NOR2X1M U25 ( .A(B[8]), .B(A[8]), .Y(n9) );
  NAND2BX1M U26 ( .AN(n17), .B(n19), .Y(n20) );
  CLKNAND2X2M U27 ( .A(B[10]), .B(A[10]), .Y(n19) );
  NOR2X1M U28 ( .A(B[10]), .B(A[10]), .Y(n17) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n15, n13, n14, n12, n11, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n7), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n6), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n5), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n4), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n3), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  AND2X2M U2 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U13 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U15 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U16 ( .A(\ab[0][7] ), .Y(n23) );
  AND2X2M U17 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U21 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U22 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U23 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U24 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n14) );
  AND2X2M U25 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U27 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  INVX2M U28 ( .A(\SUMB[7][1] ), .Y(n17) );
  CLKXOR2X2M U29 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U30 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U31 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U32 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U33 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U34 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  INVX2M U35 ( .A(A[1]), .Y(n38) );
  INVX2M U36 ( .A(A[0]), .Y(n39) );
  INVX2M U37 ( .A(B[6]), .Y(n25) );
  XNOR2X2M U38 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U39 ( .A(A[3]), .Y(n36) );
  INVX2M U40 ( .A(A[2]), .Y(n37) );
  INVX2M U41 ( .A(A[4]), .Y(n35) );
  XNOR2X2M U42 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[6]), .Y(n33) );
  INVX2M U45 ( .A(A[5]), .Y(n34) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU ( CLK, RST, ALU_EN, ALU_FUN, A, B, ALU_OUT, ALU_OUT_VALID );
  input [3:0] ALU_FUN;
  input [7:0] A;
  input [7:0] B;
  output [15:0] ALU_OUT;
  input CLK, RST, ALU_EN;
  output ALU_OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140;
  wire   [15:0] ALU_OUT_COMB;
  tri   RST;

  ALU_DW_div_uns_0 div_48 ( .a({n11, n10, n9, n8, n7, n6, n5, n4}), .b({B[7], 
        n3, B[5:0]}), .quotient({N132, N131, N130, N129, N128, N127, N126, 
        N125}) );
  ALU_DW01_sub_0 sub_41 ( .A({1'b0, n11, n10, n9, n8, n7, n6, n5, n4}), .B({
        1'b0, B[7], n3, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, N105, 
        N104, N103, N102, N101, N100}) );
  ALU_DW01_add_0 add_37 ( .A({1'b0, n11, n10, n9, n8, n7, n6, n5, n4}), .B({
        1'b0, B[7], n3, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92, N91}) );
  ALU_DW02_mult_0 mult_44 ( .A({n11, n10, n9, n8, n7, n6, n5, n4}), .B({B[7], 
        n3, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, N120, N119, 
        N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
  DFFRQX1M ALU_OUT_VALID_reg ( .D(ALU_EN), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_VALID) );
  DFFRQX1M \ALU_OUT_reg[5]  ( .D(ALU_OUT_COMB[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX1M \ALU_OUT_reg[6]  ( .D(ALU_OUT_COMB[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX1M \ALU_OUT_reg[7]  ( .D(ALU_OUT_COMB[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX1M \ALU_OUT_reg[8]  ( .D(ALU_OUT_COMB[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX1M \ALU_OUT_reg[9]  ( .D(ALU_OUT_COMB[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX1M \ALU_OUT_reg[10]  ( .D(ALU_OUT_COMB[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX1M \ALU_OUT_reg[11]  ( .D(ALU_OUT_COMB[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX1M \ALU_OUT_reg[4]  ( .D(ALU_OUT_COMB[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX1M \ALU_OUT_reg[12]  ( .D(ALU_OUT_COMB[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX1M \ALU_OUT_reg[13]  ( .D(ALU_OUT_COMB[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX1M \ALU_OUT_reg[14]  ( .D(ALU_OUT_COMB[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX1M \ALU_OUT_reg[15]  ( .D(ALU_OUT_COMB[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX1M \ALU_OUT_reg[3]  ( .D(ALU_OUT_COMB[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX1M \ALU_OUT_reg[2]  ( .D(ALU_OUT_COMB[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX1M \ALU_OUT_reg[1]  ( .D(ALU_OUT_COMB[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX1M \ALU_OUT_reg[0]  ( .D(ALU_OUT_COMB[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  BUFX2M U3 ( .A(A[6]), .Y(n10) );
  OAI2BB1X2M U4 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[15]) );
  OAI2BB1X2M U7 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[14]) );
  OAI2BB1X2M U8 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[12]) );
  OAI2BB1X2M U9 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[13]) );
  OAI2BB1X2M U10 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[9]) );
  OAI2BB1X2M U11 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[10]) );
  OAI2BB1X2M U12 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[11]) );
  OAI2BB1X2M U13 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  OAI2BB1X2M U14 ( .A0N(n126), .A1N(n105), .B0(n101), .Y(n47) );
  NOR2BX2M U15 ( .AN(n106), .B(n124), .Y(n37) );
  AND2X2M U16 ( .A(n99), .B(n105), .Y(n42) );
  NOR2BX2M U17 ( .AN(n35), .B(n129), .Y(n31) );
  BUFX2M U18 ( .A(n41), .Y(n13) );
  NOR2X2M U19 ( .A(n107), .B(n124), .Y(n41) );
  AND2X2M U20 ( .A(n106), .B(n105), .Y(n50) );
  INVX2M U21 ( .A(n100), .Y(n124) );
  INVX2M U22 ( .A(n91), .Y(n125) );
  INVX2M U23 ( .A(n107), .Y(n126) );
  INVX2M U24 ( .A(ALU_FUN[1]), .Y(n127) );
  NAND2X2M U25 ( .A(ALU_EN), .B(n123), .Y(n32) );
  AND2X2M U26 ( .A(ALU_FUN[2]), .B(n127), .Y(n99) );
  AND4X2M U27 ( .A(N159), .B(n99), .C(n12), .D(n128), .Y(n90) );
  NOR3BX2M U28 ( .AN(n105), .B(n127), .C(ALU_FUN[2]), .Y(n49) );
  NOR3X2M U29 ( .A(n124), .B(ALU_FUN[2]), .C(n127), .Y(n35) );
  NOR2X2M U30 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  AND3X2M U31 ( .A(n106), .B(n128), .C(n12), .Y(n46) );
  NAND3X2M U32 ( .A(n126), .B(n128), .C(n12), .Y(n36) );
  NAND2X2M U33 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  INVX2M U34 ( .A(ALU_FUN[0]), .Y(n128) );
  NOR2X2M U35 ( .A(n128), .B(n12), .Y(n105) );
  NOR2X2M U36 ( .A(n12), .B(ALU_FUN[0]), .Y(n100) );
  NAND3X2M U37 ( .A(n12), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  NAND3X2M U38 ( .A(n106), .B(ALU_FUN[0]), .C(n12), .Y(n101) );
  INVX2M U39 ( .A(ALU_EN), .Y(n129) );
  AOI31X2M U40 ( .A0(n93), .A1(n94), .A2(n95), .B0(n129), .Y(ALU_OUT_COMB[0])
         );
  AOI22X1M U41 ( .A0(N100), .A1(n50), .B0(N91), .B1(n37), .Y(n93) );
  AOI211X2M U42 ( .A0(n13), .A1(n140), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X1M U43 ( .A0(N109), .A1(n35), .B0(n4), .B1(n42), .C0(N125), .C1(n49), 
        .Y(n94) );
  AOI31X2M U44 ( .A0(n81), .A1(n82), .A2(n83), .B0(n129), .Y(ALU_OUT_COMB[1])
         );
  AOI222X1M U45 ( .A0(N92), .A1(n37), .B0(N110), .B1(n35), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI211X2M U46 ( .A0(n6), .A1(n125), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U47 ( .A0(N126), .A1(n49), .B0(n13), .B1(n139), .C0(n5), .C1(n42), 
        .Y(n82) );
  AOI31X2M U48 ( .A0(n75), .A1(n76), .A2(n77), .B0(n129), .Y(ALU_OUT_COMB[2])
         );
  AOI22X1M U49 ( .A0(N102), .A1(n50), .B0(N93), .B1(n37), .Y(n75) );
  AOI221XLM U50 ( .A0(n7), .A1(n125), .B0(n13), .B1(n138), .C0(n78), .Y(n77)
         );
  AOI222X1M U51 ( .A0(N111), .A1(n35), .B0(n6), .B1(n42), .C0(N127), .C1(n49), 
        .Y(n76) );
  AOI31X2M U52 ( .A0(n69), .A1(n70), .A2(n71), .B0(n129), .Y(ALU_OUT_COMB[3])
         );
  AOI22X1M U53 ( .A0(N103), .A1(n50), .B0(N94), .B1(n37), .Y(n69) );
  AOI221XLM U54 ( .A0(n8), .A1(n125), .B0(n13), .B1(n137), .C0(n72), .Y(n71)
         );
  AOI222X1M U55 ( .A0(N112), .A1(n35), .B0(n7), .B1(n42), .C0(N128), .C1(n49), 
        .Y(n70) );
  AOI31X2M U56 ( .A0(n63), .A1(n64), .A2(n65), .B0(n129), .Y(ALU_OUT_COMB[4])
         );
  AOI22X1M U57 ( .A0(N104), .A1(n50), .B0(N95), .B1(n37), .Y(n63) );
  AOI221XLM U58 ( .A0(n125), .A1(n9), .B0(n13), .B1(n136), .C0(n66), .Y(n65)
         );
  AOI222X1M U59 ( .A0(N113), .A1(n35), .B0(n8), .B1(n42), .C0(N129), .C1(n49), 
        .Y(n64) );
  AOI31X2M U60 ( .A0(n57), .A1(n58), .A2(n59), .B0(n129), .Y(ALU_OUT_COMB[5])
         );
  AOI22X1M U61 ( .A0(N105), .A1(n50), .B0(N96), .B1(n37), .Y(n57) );
  AOI221XLM U62 ( .A0(n125), .A1(n10), .B0(n13), .B1(n135), .C0(n60), .Y(n59)
         );
  AOI222X1M U63 ( .A0(N114), .A1(n35), .B0(n9), .B1(n42), .C0(N130), .C1(n49), 
        .Y(n58) );
  AOI31X2M U64 ( .A0(n38), .A1(n39), .A2(n40), .B0(n129), .Y(ALU_OUT_COMB[7])
         );
  AOI22X1M U65 ( .A0(N107), .A1(n50), .B0(N98), .B1(n37), .Y(n38) );
  AOI221XLM U66 ( .A0(n13), .A1(n133), .B0(n42), .B1(n11), .C0(n43), .Y(n40)
         );
  AOI22X1M U67 ( .A0(N132), .A1(n49), .B0(N116), .B1(n35), .Y(n39) );
  AOI21X2M U68 ( .A0(n33), .A1(n34), .B0(n129), .Y(ALU_OUT_COMB[8]) );
  AOI21X2M U69 ( .A0(N99), .A1(n37), .B0(n123), .Y(n33) );
  AOI2BB2XLM U70 ( .B0(N117), .B1(n35), .A0N(n133), .A1N(n36), .Y(n34) );
  OAI222X1M U71 ( .A0(n55), .A1(n122), .B0(n3), .B1(n56), .C0(n36), .C1(n135), 
        .Y(n54) );
  AOI221XLM U72 ( .A0(n10), .A1(n46), .B0(n47), .B1(n134), .C0(n13), .Y(n56)
         );
  AOI221XLM U73 ( .A0(n46), .A1(n134), .B0(n10), .B1(n48), .C0(n42), .Y(n55)
         );
  INVX2M U74 ( .A(n25), .Y(n120) );
  AOI31X2M U75 ( .A0(n51), .A1(n52), .A2(n53), .B0(n129), .Y(ALU_OUT_COMB[6])
         );
  AOI22X1M U76 ( .A0(N106), .A1(n50), .B0(N97), .B1(n37), .Y(n51) );
  AOI221XLM U77 ( .A0(n125), .A1(n11), .B0(n13), .B1(n134), .C0(n54), .Y(n53)
         );
  AOI222X1M U78 ( .A0(N115), .A1(n35), .B0(n42), .B1(n10), .C0(N131), .C1(n49), 
        .Y(n52) );
  INVX2M U79 ( .A(n116), .Y(N158) );
  INVX2M U80 ( .A(n3), .Y(n122) );
  INVX2M U81 ( .A(n92), .Y(n123) );
  AOI211X2M U82 ( .A0(N108), .A1(n50), .B0(n13), .C0(n47), .Y(n92) );
  BUFX2M U83 ( .A(ALU_FUN[3]), .Y(n12) );
  INVX2M U84 ( .A(n5), .Y(n139) );
  INVX2M U85 ( .A(n4), .Y(n140) );
  INVX2M U86 ( .A(n10), .Y(n134) );
  INVX2M U87 ( .A(n11), .Y(n133) );
  INVX2M U88 ( .A(n7), .Y(n137) );
  INVX2M U89 ( .A(n6), .Y(n138) );
  INVX2M U90 ( .A(n9), .Y(n135) );
  INVX2M U91 ( .A(n8), .Y(n136) );
  BUFX2M U92 ( .A(B[6]), .Y(n3) );
  BUFX2M U93 ( .A(A[7]), .Y(n11) );
  BUFX2M U94 ( .A(A[5]), .Y(n9) );
  BUFX2M U95 ( .A(A[4]), .Y(n8) );
  BUFX2M U96 ( .A(A[3]), .Y(n7) );
  BUFX2M U97 ( .A(A[2]), .Y(n6) );
  BUFX2M U98 ( .A(A[1]), .Y(n5) );
  BUFX2M U99 ( .A(A[0]), .Y(n4) );
  OAI2B2X1M U100 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n140), .Y(n85) );
  AOI221XLM U101 ( .A0(n46), .A1(n139), .B0(n5), .B1(n48), .C0(n42), .Y(n86)
         );
  OAI222X1M U102 ( .A0(n79), .A1(n119), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n139), .Y(n78) );
  AOI221XLM U103 ( .A0(n6), .A1(n46), .B0(n47), .B1(n138), .C0(n13), .Y(n80)
         );
  AOI221XLM U104 ( .A0(n46), .A1(n138), .B0(n6), .B1(n48), .C0(n42), .Y(n79)
         );
  OAI222X1M U105 ( .A0(n73), .A1(n121), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n138), .Y(n72) );
  AOI221XLM U106 ( .A0(n7), .A1(n46), .B0(n47), .B1(n137), .C0(n13), .Y(n74)
         );
  AOI221XLM U107 ( .A0(n46), .A1(n137), .B0(n7), .B1(n48), .C0(n42), .Y(n73)
         );
  OAI222X1M U108 ( .A0(n67), .A1(n132), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n137), .Y(n66) );
  INVX2M U109 ( .A(B[4]), .Y(n132) );
  AOI221XLM U110 ( .A0(n8), .A1(n46), .B0(n47), .B1(n136), .C0(n13), .Y(n68)
         );
  AOI221XLM U111 ( .A0(n46), .A1(n136), .B0(n8), .B1(n48), .C0(n42), .Y(n67)
         );
  OAI222X1M U112 ( .A0(n61), .A1(n131), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n136), .Y(n60) );
  INVX2M U113 ( .A(B[5]), .Y(n131) );
  AOI221XLM U114 ( .A0(n9), .A1(n46), .B0(n47), .B1(n135), .C0(n13), .Y(n62)
         );
  AOI221XLM U115 ( .A0(n46), .A1(n135), .B0(n9), .B1(n48), .C0(n42), .Y(n61)
         );
  OAI222X1M U116 ( .A0(n44), .A1(n130), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n134), .Y(n43) );
  INVX2M U117 ( .A(B[7]), .Y(n130) );
  AOI221XLM U118 ( .A0(n46), .A1(n11), .B0(n47), .B1(n133), .C0(n13), .Y(n45)
         );
  AOI221XLM U119 ( .A0(n46), .A1(n133), .B0(n11), .B1(n48), .C0(n42), .Y(n44)
         );
  INVX2M U120 ( .A(n14), .Y(n118) );
  OAI2B2X1M U121 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n139), .Y(n97) );
  AOI221XLM U122 ( .A0(n46), .A1(n140), .B0(n4), .B1(n48), .C0(n42), .Y(n98)
         );
  OAI21X2M U123 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI221XLM U124 ( .A0(n4), .A1(n46), .B0(n47), .B1(n140), .C0(n13), .Y(n102)
         );
  AOI31X2M U125 ( .A0(N157), .A1(n12), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U126 ( .A(n127), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  OAI21X2M U127 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  AOI221XLM U128 ( .A0(n5), .A1(n46), .B0(n47), .B1(n139), .C0(n13), .Y(n87)
         );
  AOI31X2M U129 ( .A0(N158), .A1(n12), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U130 ( .A(n128), .B(ALU_FUN[2]), .C(n127), .Y(n89) );
  INVX2M U131 ( .A(B[0]), .Y(n117) );
  INVX2M U132 ( .A(B[2]), .Y(n119) );
  INVX2M U133 ( .A(B[3]), .Y(n121) );
  NOR2X1M U134 ( .A(n133), .B(B[7]), .Y(n113) );
  NAND2BX1M U135 ( .AN(B[4]), .B(n8), .Y(n29) );
  NAND2BX1M U136 ( .AN(n8), .B(B[4]), .Y(n18) );
  CLKNAND2X2M U137 ( .A(n29), .B(n18), .Y(n108) );
  NOR2X1M U138 ( .A(n121), .B(n7), .Y(n26) );
  NOR2X1M U139 ( .A(n119), .B(n6), .Y(n17) );
  NOR2X1M U140 ( .A(n117), .B(n4), .Y(n14) );
  CLKNAND2X2M U141 ( .A(n6), .B(n119), .Y(n28) );
  NAND2BX1M U142 ( .AN(n17), .B(n28), .Y(n23) );
  AOI21X1M U143 ( .A0(n14), .A1(n139), .B0(B[1]), .Y(n15) );
  AOI211X1M U144 ( .A0(n5), .A1(n118), .B0(n23), .C0(n15), .Y(n16) );
  CLKNAND2X2M U145 ( .A(n7), .B(n121), .Y(n27) );
  OAI31X1M U146 ( .A0(n26), .A1(n17), .A2(n16), .B0(n27), .Y(n19) );
  NAND2BX1M U147 ( .AN(n9), .B(B[5]), .Y(n111) );
  OAI211X1M U148 ( .A0(n108), .A1(n19), .B0(n18), .C0(n111), .Y(n20) );
  NAND2BX1M U149 ( .AN(B[5]), .B(n9), .Y(n30) );
  XNOR2X1M U150 ( .A(n10), .B(n3), .Y(n110) );
  AOI32X1M U151 ( .A0(n20), .A1(n30), .A2(n110), .B0(n3), .B1(n134), .Y(n21)
         );
  CLKNAND2X2M U152 ( .A(B[7]), .B(n133), .Y(n114) );
  OAI21X1M U153 ( .A0(n113), .A1(n21), .B0(n114), .Y(N159) );
  CLKNAND2X2M U154 ( .A(n4), .B(n117), .Y(n24) );
  OA21X1M U155 ( .A0(n24), .A1(n139), .B0(B[1]), .Y(n22) );
  AOI211X1M U156 ( .A0(n24), .A1(n139), .B0(n23), .C0(n22), .Y(n25) );
  AOI31X1M U157 ( .A0(n120), .A1(n28), .A2(n27), .B0(n26), .Y(n109) );
  OAI2B11X1M U158 ( .A1N(n109), .A0(n108), .B0(n30), .C0(n29), .Y(n112) );
  AOI32X1M U159 ( .A0(n112), .A1(n111), .A2(n110), .B0(n10), .B1(n122), .Y(
        n115) );
  AOI2B1X1M U160 ( .A1N(n115), .A0(n114), .B0(n113), .Y(n116) );
  NOR2X1M U161 ( .A(N159), .B(N158), .Y(N157) );
endmodule


module DATA_SYNC ( CLK, RST, unsync_bus, bus_enable, sync_bus, enable_pulse_d
 );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse_d;
  wire   enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_reg;
  tri   CLK;
  tri   RST;

  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        sync_reg[0]) );
  DFFRQX1M \sync_reg_reg[1]  ( .D(sync_reg[0]), .CK(CLK), .RN(RST), .Q(
        sync_reg[1]) );
  DFFRQX1M enable_flop_reg ( .D(sync_reg[1]), .CK(CLK), .RN(RST), .Q(
        enable_flop) );
  DFFRQX1M enable_pulse_d_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse_d) );
  DFFRQX1M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX1M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX1M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX1M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(enable_flop), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module RST_SYNC_1 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \sync_chain[0] ;
  tri   CLK;
  tri   SYNC_RST;

  DFFRQX2M \sync_chain_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(
        \sync_chain[0] ) );
  DFFRQX4M \sync_chain_reg[1]  ( .D(\sync_chain[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
endmodule


module RST_SYNC_0 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \sync_chain[0] ;
  tri   SYNC_RST;

  DFFRQX4M \sync_chain_reg[1]  ( .D(\sync_chain[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_chain_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(
        \sync_chain[0] ) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;
  wire   Latch_Out;
  tri   CLK;

  TLATNX2M Latch_Out_reg ( .D(CLK_EN), .GN(CLK), .Q(Latch_Out) );
  AND2X2M U2 ( .A(Latch_Out), .B(CLK), .Y(GATED_CLK) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n1, n2, n3, n4;
  assign OUT[4] = 1'b0;
  assign OUT[5] = 1'b0;
  assign OUT[6] = 1'b0;
  assign OUT[7] = 1'b0;

  NAND4BX1M U3 ( .AN(IN[4]), .B(IN[3]), .C(n2), .D(n1), .Y(n6) );
  NAND4BX1M U4 ( .AN(IN[3]), .B(IN[4]), .C(n2), .D(n1), .Y(n7) );
  NOR3X2M U5 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR3X2M U6 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR4X1M U7 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U8 ( .A(n4), .B(n3), .C(IN[2]), .Y(n5) );
  OAI211X2M U9 ( .A0(n8), .A1(n9), .B0(n4), .C0(n3), .Y(OUT[0]) );
  NAND2X2M U10 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U11 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n2), .Y(n8) );
  INVX2M U12 ( .A(IN[2]), .Y(n2) );
  INVX2M U13 ( .A(IN[1]), .Y(n3) );
  INVX2M U14 ( .A(IN[0]), .Y(n4) );
  INVX2M U15 ( .A(IN[5]), .Y(n1) );
endmodule


module ClkDiv_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module ClkDiv_0 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  tri   i_rst;

  ClkDiv_0_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFSQX2M odd_edge_tog_reg ( .D(n17), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog) );
  DFFRQX2M div_clk_reg ( .D(n18), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFRQX2M \count_reg[6]  ( .D(n19), .CK(i_ref_clk), .RN(i_rst), .Q(count[6])
         );
  DFFRQX2M \count_reg[0]  ( .D(n25), .CK(i_ref_clk), .RN(i_rst), .Q(count[0])
         );
  DFFRQX2M \count_reg[5]  ( .D(n20), .CK(i_ref_clk), .RN(i_rst), .Q(count[5])
         );
  DFFRQX2M \count_reg[4]  ( .D(n21), .CK(i_ref_clk), .RN(i_rst), .Q(count[4])
         );
  DFFRQX2M \count_reg[3]  ( .D(n22), .CK(i_ref_clk), .RN(i_rst), .Q(count[3])
         );
  DFFRQX2M \count_reg[2]  ( .D(n23), .CK(i_ref_clk), .RN(i_rst), .Q(count[2])
         );
  DFFRQX2M \count_reg[1]  ( .D(n24), .CK(i_ref_clk), .RN(i_rst), .Q(count[1])
         );
  INVX2M U3 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  MX2X2M U4 ( .A(i_ref_clk), .B(div_clk), .S0(n43), .Y(o_div_clk) );
  NAND2BX2M U5 ( .AN(n14), .B(i_clk_en), .Y(n7) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  NAND2BX1M U7 ( .AN(i_div_ratio[2]), .B(edge_flip_half[0]), .Y(n1) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n25) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n24) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n23) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n22) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n21) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n20) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n19) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(n43), .Y(n8) );
  CLKINVX1M U26 ( .A(n7), .Y(n43) );
  CLKXOR2X2M U27 ( .A(div_clk), .B(n11), .Y(n18) );
  AOI21X1M U28 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U29 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U30 ( .A(odd_edge_tog), .B(n13), .Y(n17) );
  OR2X1M U31 ( .A(n10), .B(n7), .Y(n13) );
  NOR4BX1M U32 ( .AN(n15), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n14) );
  NOR4X1M U33 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n15) );
  CLKNAND2X2M U34 ( .A(n16), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U35 ( .A(n26), .B(n12), .S0(odd_edge_tog), .Y(n16) );
  NAND4X1M U36 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n12) );
  NOR4X1M U37 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n34) );
  CLKXOR2X2M U39 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n33) );
  CLKXOR2X2M U40 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n32) );
  CLKXOR2X2M U41 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n31) );
  XNOR2X1M U42 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n29) );
  XNOR2X1M U43 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n28) );
  XNOR2X1M U44 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n27) );
  NAND4X1M U45 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n26) );
  NOR4X1M U46 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n42) );
  CLKXOR2X2M U48 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n41) );
  CLKXOR2X2M U49 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n40) );
  CLKXOR2X2M U50 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n39) );
  XNOR2X1M U51 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n37) );
  XNOR2X1M U52 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n36) );
  XNOR2X1M U53 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n35) );
endmodule


module ClkDiv_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module ClkDiv_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  tri   i_rst;
  tri   o_div_clk;

  ClkDiv_1_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFSQX2M odd_edge_tog_reg ( .D(n52), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog) );
  DFFRQX2M div_clk_reg ( .D(n51), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFRQX2M \count_reg[6]  ( .D(n50), .CK(i_ref_clk), .RN(i_rst), .Q(count[6])
         );
  DFFRQX2M \count_reg[0]  ( .D(n44), .CK(i_ref_clk), .RN(i_rst), .Q(count[0])
         );
  DFFRQX2M \count_reg[5]  ( .D(n49), .CK(i_ref_clk), .RN(i_rst), .Q(count[5])
         );
  DFFRQX2M \count_reg[4]  ( .D(n48), .CK(i_ref_clk), .RN(i_rst), .Q(count[4])
         );
  DFFRQX2M \count_reg[3]  ( .D(n47), .CK(i_ref_clk), .RN(i_rst), .Q(count[3])
         );
  DFFRQX2M \count_reg[2]  ( .D(n46), .CK(i_ref_clk), .RN(i_rst), .Q(count[2])
         );
  DFFRQX2M \count_reg[1]  ( .D(n45), .CK(i_ref_clk), .RN(i_rst), .Q(count[1])
         );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(n43), .Y(o_div_clk) );
  NAND2BX2M U4 ( .AN(n14), .B(i_clk_en), .Y(n7) );
  INVX2M U5 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  NAND2BX1M U7 ( .AN(i_div_ratio[2]), .B(edge_flip_half[0]), .Y(n1) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n44) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n45) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n46) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n47) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n48) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n49) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n50) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(n43), .Y(n8) );
  CLKINVX1M U26 ( .A(n7), .Y(n43) );
  CLKXOR2X2M U27 ( .A(div_clk), .B(n11), .Y(n51) );
  AOI21X1M U28 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U29 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U30 ( .A(odd_edge_tog), .B(n13), .Y(n52) );
  OR2X1M U31 ( .A(n10), .B(n7), .Y(n13) );
  NOR4BX1M U32 ( .AN(n15), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n14) );
  NOR4X1M U33 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n15) );
  CLKNAND2X2M U34 ( .A(n16), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U35 ( .A(n26), .B(n12), .S0(odd_edge_tog), .Y(n16) );
  NAND4X1M U36 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n12) );
  NOR4X1M U37 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n34) );
  CLKXOR2X2M U39 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n33) );
  CLKXOR2X2M U40 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n32) );
  CLKXOR2X2M U41 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n31) );
  XNOR2X1M U42 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n29) );
  XNOR2X1M U43 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n28) );
  XNOR2X1M U44 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n27) );
  NAND4X1M U45 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n26) );
  NOR4X1M U46 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n42) );
  CLKXOR2X2M U48 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n41) );
  CLKXOR2X2M U49 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n40) );
  CLKXOR2X2M U50 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n39) );
  XNOR2X1M U51 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n37) );
  XNOR2X1M U52 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n36) );
  XNOR2X1M U53 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n35) );
endmodule


module SYS_TOP ( REF_CLK, RST, UART_CLK, RX_IN, parity_error, stop_error, 
        TX_OUT );
  input REF_CLK, RST, UART_CLK, RX_IN;
  output parity_error, stop_error, TX_OUT;
  wire   RX_CLK, _0_net_, busy, RX_P_Data_VALID_S, Rd_D_Valid, ALU_OUT_VALID,
         GATE_EN, WrEn, RdEn, ALU_EN, ALU_CLK, n3, n4;
  wire   [7:0] UART_CONFIG;
  wire   [7:0] RX_P_DATA_A;
  wire   [7:0] RX_P_Data_S;
  wire   [7:0] Rd_D;
  wire   [15:0] ALU_OUT;
  wire   [3:0] Addr;
  wire   [7:0] Wr_D;
  wire   [3:0] FUN;
  wire   [7:0] Op_A;
  wire   [7:0] Op_B;
  wire   [7:0] Div_Ratio;
  wire   [7:0] Div_Ratio_RX;
  tri   REF_CLK;
  tri   TX_CLK;
  tri   SYNC_RST_2;
  tri   [7:0] TX_P_DATA_S;
  tri   F_EMPTY;
  tri   R_INC;
  tri   SYNC_RST_1;
  tri   W_INC;
  tri   [7:0] TX_P_DATA_A;
  tri   F_FULL;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  UART_TOP UART ( .TX_CLK(TX_CLK), .RX_CLK(RX_CLK), .RST(SYNC_RST_2), .RX_IN(
        RX_IN), .UART_CONFIG(UART_CONFIG), .TX_P_DATA(TX_P_DATA_S), 
        .TX_P_DATA_VALID(_0_net_), .RX_P_DATA(RX_P_DATA_A), .par_error(
        parity_error), .stop_error(stop_error), .TX_OUT(TX_OUT), .busy(busy)
         );
  PULSE_GEN PULSE_GEN ( .CLK(TX_CLK), .RST(SYNC_RST_2), .IN(busy), .PULSE(
        R_INC) );
  Async_fifo U0_UART_FIFO ( .i_w_clk(REF_CLK), .i_w_rstn(SYNC_RST_1), 
        .i_w_inc(W_INC), .i_w_data(TX_P_DATA_A), .i_r_clk(TX_CLK), .i_r_rstn(
        SYNC_RST_2), .i_r_inc(R_INC), .o_r_data(TX_P_DATA_S), .o_full(F_FULL), 
        .o_empty(F_EMPTY) );
  SYS_CTRL SYS_CTRL ( .CLK(REF_CLK), .RST(SYNC_RST_1), .RX_P_Data(RX_P_Data_S), 
        .RX_P_Data_VALID(RX_P_Data_VALID_S), .Rd_D(Rd_D), .Rd_D_Valid(
        Rd_D_Valid), .ALU_OUT(ALU_OUT), .ALU_OUT_Valid(ALU_OUT_VALID), 
        .F_FULL(F_FULL), .CLK_G_EN(GATE_EN), .WrEn(WrEn), .RdEn(RdEn), 
        .Address(Addr), .Wr_D(Wr_D), .ALU_FUN(FUN), .ALU_EN(ALU_EN), .W_INC(
        W_INC), .TX_P_DATA(TX_P_DATA_A) );
  Register_file REG_FILE ( .CLK(REF_CLK), .RST(SYNC_RST_1), .WrEn(WrEn), 
        .RdEn(RdEn), .Address({Addr[3:1], n4}), .WrData(Wr_D), .REG0(Op_A), 
        .REG1(Op_B), .REG2(UART_CONFIG), .REG3(Div_Ratio), .RdData(Rd_D), 
        .RdData_Valid(Rd_D_Valid) );
  ALU ALU ( .CLK(ALU_CLK), .RST(SYNC_RST_1), .ALU_EN(ALU_EN), .ALU_FUN(FUN), 
        .A(Op_A), .B(Op_B), .ALU_OUT(ALU_OUT), .ALU_OUT_VALID(ALU_OUT_VALID)
         );
  DATA_SYNC DATA_SYNCHRONIZER ( .CLK(REF_CLK), .RST(SYNC_RST_1), .unsync_bus(
        RX_P_DATA_A), .bus_enable(1'b0), .sync_bus(RX_P_Data_S), 
        .enable_pulse_d(RX_P_Data_VALID_S) );
  RST_SYNC_1 RST_SYNC_1 ( .CLK(REF_CLK), .RST(RST), .SYNC_RST(SYNC_RST_1) );
  RST_SYNC_0 RST_SYNC_2 ( .CLK(n3), .RST(RST), .SYNC_RST(SYNC_RST_2) );
  CLK_GATE Clock_Gating ( .CLK_EN(GATE_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  CLKDIV_MUX CLKDIV_MUX ( .IN(UART_CONFIG[7:2]), .OUT({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, Div_Ratio_RX[3:0]}) );
  ClkDiv_0 RX_CLK_DIV ( .i_ref_clk(n3), .i_rst(SYNC_RST_2), .i_clk_en(1'b1), 
        .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, Div_Ratio_RX[3:0]}), .o_div_clk(
        RX_CLK) );
  ClkDiv_1 TX_CLK_DIV ( .i_ref_clk(n3), .i_rst(SYNC_RST_2), .i_clk_en(1'b1), 
        .i_div_ratio(Div_Ratio), .o_div_clk(TX_CLK) );
  BUFX2M U3 ( .A(Addr[0]), .Y(n4) );
  INVX2M U4 ( .A(F_EMPTY), .Y(_0_net_) );
  BUFX2M U5 ( .A(UART_CLK), .Y(n3) );
endmodule

