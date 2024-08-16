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
    output reg [7:0]    TX_P_DATA
);

    //states
    parameter  IDLE = 0;
    parameter  RF_WR_ADDR = 1;
    parameter  RF_WR_DATA = 2;
    parameter  RF_RD_ADDR = 3;
    parameter  RF_RD_DATA_SEND = 4;
    parameter  ALU_A = 5;
    parameter  ALU_B = 6;
    parameter  ALU_FUNC = 7;
    parameter  ALU_OUT_STORE = 8;
    parameter  ALU_OUT_FIRST = 9;
    parameter  ALU_OUT_SECOND = 10;

    reg [3:0] current_state;
    reg [3:0] next_state;

    reg ALU_OUT_SAVE;
    reg RF_ADDR_SAVE;
    reg [7:0] RF_ADDR_SAVED;
    reg [15:0] ALU_OUT_SAVED;



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
                if (RX_P_Data_VALID) begin
                    next_state = RF_WR_DATA;    
                end
                else begin
                    next_state = RF_WR_ADDR;
                end
                
            end
            RF_WR_DATA: begin
                if (RX_P_Data_VALID) begin
                    next_state = IDLE;
                end
                else begin
                    next_state = RF_WR_DATA;
                end 
            end
            RF_RD_ADDR: begin
                if (RX_P_Data_VALID) begin
                    next_state = RF_RD_DATA_SEND;    
                end
                else begin
                    next_state = RF_RD_ADDR ;
                end
                
            end
            RF_RD_DATA_SEND: begin
               if(Rd_D_Valid) begin
                    next_state = IDLE;
               end 
               else begin
                    next_state = RF_RD_DATA_SEND;
               end
            end
            ALU_A: begin
                if (RX_P_Data_VALID) begin
                    next_state = ALU_B;    
                end
                else begin
                    next_state = ALU_A ;
                end
            end
            ALU_B: begin
                if (RX_P_Data_VALID) begin
                    next_state = ALU_FUNC;    
                end
                else begin
                    next_state = ALU_B;
                end
            end
            ALU_FUNC: begin
                if (RX_P_Data_VALID) begin
                    next_state = ALU_OUT_STORE;    
                end
                else begin
                    next_state = ALU_FUNC  ;
                end
            end
            ALU_OUT_STORE: begin
                if (ALU_OUT_Valid) begin
                    next_state = ALU_OUT_FIRST;
                end
                else begin
                    next_state = ALU_OUT_STORE;
                end
            end
            ALU_OUT_FIRST: begin
                next_state = ALU_OUT_SECOND;
            end
            ALU_OUT_SECOND: begin
                next_state = IDLE;
            end
            default: next_state = IDLE; 
        endcase
    end

    //output logic
    always @(*) begin
        CLK_G_EN=0;
        WrEn=0;
        RdEn=0;
        Address=0;
        Wr_D=0;
        ALU_FUN=0;
        ALU_EN=0;
        W_INC=0;
        TX_P_DATA=0;
        RF_ADDR_SAVE=0;
        ALU_OUT_SAVE=0;
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
                TX_P_DATA=0;
                RF_ADDR_SAVE=0;
                ALU_OUT_SAVE=0;
            end 
            RF_WR_ADDR:begin
                if(RX_P_Data_VALID)
			       begin
			        RF_ADDR_SAVE = 1'b1 ; 				
                   end
			     else
			       begin
			        RF_ADDR_SAVE = 1'b0 ; 			
                   end	
                   
            end
            RF_WR_DATA:begin
                if(RX_P_Data_VALID)
			       begin
			        WrEn = 1;
                    Address = RF_ADDR_SAVED[3:0];
                    Wr_D = RX_P_Data;
                   end
			     else
			       begin
			        WrEn = 0;
                    Address = RF_ADDR_SAVED[3:0];
                    Wr_D = RX_P_Data; 			
                   end	
            end
            RF_RD_ADDR:begin
                if(RX_P_Data_VALID)
			      begin
					RdEn    = 1'b1 ;
				    Address = RX_P_Data[3:0] ;
				  end	
			    else
			       begin
			        RdEn = 1'b0 ; 			
                   end
            end
            RF_RD_DATA_SEND : begin
						if(Rd_D_Valid && !F_FULL)
							begin
								TX_P_DATA  = Rd_D ; 
								W_INC   = 1'b1 ;	
							end
						else
							begin
								W_INC   = 1'b0 ;	
							end	
					end
            ALU_A:begin
                if(RX_P_Data_VALID)
				   begin
				    WrEn    = 1'b1         ;
				    Address = 'b00         ;
					Wr_D  = RX_P_Data ;
				   end	
			     else
			       begin
				    WrEn    = 1'b0         ;
					Address = 'b00         ;
					Wr_D  = RX_P_Data ; 			
                   end	
            end
            ALU_B:begin
                if(RX_P_Data_VALID)
				   begin
				    WrEn    = 1'b1         ;
				    Address = 'b01         ;
					Wr_D  = RX_P_Data ;
				   end	
			     else
			       begin
				    WrEn    = 1'b0         ;
					Address = 'b01         ;
					Wr_D  = RX_P_Data ; 			
                   end
            end
            ALU_FUNC:begin
                CLK_G_EN = 1'b1 ;  
				 if(RX_P_Data_VALID)
			       begin
                     ALU_EN  = 1'b1 ;
                     ALU_FUN = RX_P_Data[3:0] ; 
                   end
			     else
			       begin
                     ALU_EN  = 1'b0 ;
                     ALU_FUN = RX_P_Data[3:0] ; 
                   end			  
               
            end      
            ALU_OUT_STORE: begin
                CLK_G_EN = 1'b1 ;
						if(ALU_OUT_Valid)
							begin
								ALU_OUT_SAVE = 1'b1 ;					 
							end
						else
							begin
								ALU_OUT_SAVE   = 1'b0 ;	
							end	
								
            end 
            ALU_OUT_FIRST: begin
                CLK_G_EN = 1'b1 ;
				if(!F_FULL)begin	
    				TX_P_DATA  = ALU_OUT_SAVED[7:0] ; 
					W_INC = 1'b1 ;	
        		end
            end
            ALU_OUT_SECOND: begin
                CLK_G_EN = 1'b1 ;
				if(!F_FULL)begin	
    				TX_P_DATA  = ALU_OUT_SAVED[15:8] ; 
					W_INC = 1'b1 ;	
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
                TX_P_DATA=0; 
            end
        endcase
    end
// **************** storing RF Address **************** //
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    RF_ADDR_SAVED <= 8'b0 ;
   end
  else
   begin
    if (RF_ADDR_SAVE)
	 begin	
      RF_ADDR_SAVED <= RX_P_Data ;
	 end 
   end
 end
// **************** storing ALU Function **************** //
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    ALU_OUT_SAVED <= 'b0 ;
   end
  else
   begin
    if (ALU_OUT_SAVE)
	 begin	
      ALU_OUT_SAVED <= ALU_OUT ;
	 end 
   end
 end 

endmodule