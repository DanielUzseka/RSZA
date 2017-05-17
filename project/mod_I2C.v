`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:24 04/27/2017 
// Design Name: 
// Module Name:    mod_I2C 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mod_I2C(
	inout 			SDA,		// I2C Data
	output 			SCL,		// I2C clock
	
	//input [31:0]	command,
	input [31:0]	dataIn,
		//0: start
		//1: reset
		//2: speed
		//3: read/write
		//4-10: address
		//11-18: data
	output [31:0]	dataOut,
	input 			clk, //16MHz clk
	input				rst
    );
	 

reg rSDA = 1;
reg rSCL = 1;

reg i2c_clk;

reg [31:0] regDataIn;
reg [31:0] regDataOut;

	
parameter [31:0] bSTART = 0;
parameter [31:0] bRESET = 1;
parameter [31:0] bSPEED = 2;
parameter [31:0] bRW 	= 3;
parameter [31:0] bADDR 	= 10;
parameter [31:0] bDATA 	= 18;
parameter [31:0] bRDY	= 19;



reg 		 [3:0]	states;
parameter [3:0]	IDLE 				= 0;
parameter [3:0]	START 			= 1;
parameter [3:0] 	STOP 				= 2;
parameter [3:0] 	WRITE_ADDR		= 3;
parameter [3:0]	READ				= 4;
parameter [3:0]	WRITE				= 5;
parameter [3:0]	WAIT_ADDR_ACK 	= 6;
parameter [3:0] 	WAIT_DATA_ACK	= 7;
parameter [3:0]	SEND_ACK			= 8;

parameter SPEED_100kBPS		= 1'b0;
parameter SPEED_400kBPS		= 1'b1;

reg [3:0]	byteCounter = 0;	

reg 	[7:0]	div;
reg	[7:0] cnt;

reg read;


always @(posedge clk) 
begin
	if (!rst | dataIn[1]) //reset
	begin
		states <= IDLE;
		rSDA <= 1;
		rSCL <= 1;
		cnt <= 0;
		regDataOut <= 32'b0;
		regDataOut[bRDY] <= 1;
	end
	else
	begin
	case (states)
		IDLE : 
		begin
			if (1 == dataIn[bSTART]) //start
			begin
				regDataIn <= dataIn;
				regDataOut[bRDY] <= 0; //i2c is not ready for another communication
				
				//set the speed of the communication
				if (dataIn[bSPEED] == SPEED_100kBPS) //get the speed
				begin
					div <= 5; //16Mbps to 100kbps (x2) - 80
				end
				else if (dataIn[bSPEED] == SPEED_400kBPS)
				begin
					div <= 3; //16Mbps to 400kbps (x2) - 20
				end
				
				cnt <= 0;
				states <= START;
			end
			else
			begin
				regDataOut[bRDY] <= 1; //ready
			end
		end
		
		START :
		begin
			rSDA <= 0; //pull down the wire
			
			if (cnt == div) //divided clock -> toggle the scl
			begin
				cnt <= 0;
				
				rSCL <= ~rSCL; //pull scl down
				
				byteCounter <= 0;
				read <= regDataIn[bRW];
				states <= WRITE_ADDR; //go to the next state
			end
			else
			begin
				cnt <= cnt + 1;
			end
		end
		
		WRITE_ADDR :
		begin
			if (cnt == div) //divided clock -> toggle the scl
			begin
				cnt <= 0;
				
				rSCL <= ~rSCL; //pull scl down	
			end
			else
			begin
				cnt <= cnt + 1;
			end
			
			if(cnt == (div >> 1))
			begin
				if(0 == rSCL)
				begin
					if(8 == byteCounter)
					begin
						states <= WAIT_ADDR_ACK;
						rSDA <= 1;
					end
					else
					begin
						rSDA <= regDataIn[bADDR-byteCounter]; 
						//from the 7th to the 1st bit
						byteCounter <= byteCounter + 1;
					end
				end
			end
		end
		
		WAIT_ADDR_ACK :
		begin
			if(cnt == div)
			begin
				cnt <= 0;
				rSCL <= ~rSCL; //pull scl down
				
				if(1 == rSCL)
				begin
					if(0 == SDA) //for tests, otherwise: 0
					begin
						byteCounter <= 0;
						if(1 == read)
							states <= READ;
						else
							states <= WRITE;
					end
					else
					begin
						//error - no Ack
						states <= IDLE;
					end
				end
			end
			else
			begin
				cnt <= cnt + 1;
			end
		end
		
		READ :
		begin
			if (cnt == div)
			begin
				cnt <= 0;
				rSCL <= ~rSCL;
				if(8 == byteCounter)
				begin
					states <= SEND_ACK;
				end
			end
			else
			begin
				cnt <= cnt + 1;
			end
			if(cnt == (div >> 1))
			begin
				if(1 == rSCL)
				begin
					regDataOut[bDATA-byteCounter] <= SDA; //save the incoming data
					byteCounter <= byteCounter + 1;
				end
			end
		end
		
		WRITE :
		begin
			if (cnt == div)
			begin
				cnt <= 0;
				rSCL <= ~rSCL;
			end
			else
			begin
				cnt <= cnt + 1;
			end
			if(cnt == (div >> 1))
			begin
				if(0 == rSCL)
				begin
					if(8 == byteCounter)
					begin
						states <= WAIT_DATA_ACK;
						rSDA <= 1;
					end
					else
					begin
						rSDA <= regDataIn[bDATA-byteCounter]; //send the data
						byteCounter <= byteCounter + 1;
					end
				end
			end
		end
		
		WAIT_DATA_ACK :
		begin
			if(cnt == div)
			begin
				cnt <= 0;
				rSCL <= ~rSCL; //pull scl down
			end
			else
			begin
				cnt <= cnt + 1;
			end
			if(cnt == (div))
			begin
				if(1 == rSCL)
				begin
					if(0 == SDA) //for tests, otherwise: 0
					begin
						byteCounter <= 0;
						states <= STOP;
						rSDA <= 0; //just for tests
					end
					else
					begin
						//error - no Ack
						states <= IDLE;
					end
				end
			end
		end
		
		SEND_ACK :
		begin
			if(cnt == div)
			begin
				cnt <= 0;
				rSCL <= ~rSCL; //pull scl down
			end
			else
			begin
				cnt <= cnt + 1;
			end
			if(cnt == (div >> 1))
			begin
				if(0 == rSCL)
				begin
					rSDA <= 0;
				end
				else
				begin
					states <= STOP;
				end
			end
		end
		
		STOP :
		begin
			if(cnt == div)
			begin
				cnt <= 0;
				rSCL <= ~rSCL; //pull scl down
			end
			else
			begin
				cnt <= cnt + 1;
			end
			if(cnt == (div >> 1))
			begin
				if(1 == rSCL)
				begin
					rSDA <= 1;
					states <= IDLE;
				end
			end
		end
	endcase
	end
end


// Open Drain assignment
pullup(SDA); //for simulation only!
assign SDA = rSDA ? 1'bz : 1'b0;
assign SCL = rSCL;
//assign command = regCommand;

//assign dataIn = regDataIn;
assign dataOut = regDataOut;
//assign SCL = rSCL ? 1'bz : 1'b0;
// assign i2c_clk = (cnt == div);


endmodule
