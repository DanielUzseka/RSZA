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
	
	input [3:0]		command,
		//0: start
		//1: 
		//2: reset periphery
		//3: speed
	input [7:0]		address, //7 bits address + read/write bit
	input [7:0]		data , //1 byte data
	input 			clk, //16MHz clk
	input				rst,
	
	output reg ready
    );
	 

reg rSDA = 1;
reg rSCL = 1;

reg i2c_clk;

reg [3:0]	states			= 0;
reg [3:0]	IDLE 				= 0;
reg [3:0]	START 			= 1;
reg [3:0] 	STOP 				= 2;
reg [3:0] 	WRITE_ADDR		= 3;
reg [3:0]	READ				= 4;
reg [3:0]	WRITE				= 5;
reg [3:0]	WAIT_ADDR_ACK 	= 6;
reg [3:0] 	WAIT_DATA_ACK	= 7;
reg [3:0]	SEND_ACK			= 8;

reg SPEED_100kBPS		= 0;
reg SPEED_400kBPS		= 1;

reg [3:0]	byteCounter = 0;	

reg 	[7:0]	div;
reg	[7:0] cnt;

reg read;

//initial begin
//   for (i=0; i<=addrWidth; i=i+1) begin
//      mem[i] = 0;
//   end
//end

always @(posedge clk) 
begin
	if (rst | command[2]) //reset
	begin
		states <= IDLE;
		rSDA <= 1;
		rSCL <= 1;
		cnt <= 0;
	end
	
	case (states)
		IDLE : 
		begin
			if (1 == command[0]) //start
			begin
				ready <= 0; //i2c is not ready for another communication
				
				//set the speed of the communication
				if (command[3] == SPEED_100kBPS)
				begin
					div <= 1; //16Mbps to 100kbps (x2) - 80
				end
				else
				begin
					div <= 0; //16Mbps to 400kbps (x2) - 20
				end
				
				cnt <= 0;
				states <= START;
			end
		end
		
		START :
		begin
			rSDA = 0; //pull down the wire
			
			if (cnt == div) //divided clock -> toggle the scl
			begin
				cnt <= 0;
				
				rSCL <= ~rSCL; //pull scl down
				
				byteCounter <= 0;
				read <= address[7];
				states = WRITE_ADDR; //go to the next state
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
			
			if(cnt == (div/2))
			begin
				if(0 == rSCL)
				begin
					if(8 == byteCounter)
					begin
						states <= WAIT_ADDR_ACK;
					end
					else
					begin
						rSDA <= address[byteCounter];
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
					if(1 == SDA)
					begin
						byteCounter <= 0;
						if(1 == read)
							states <= READ;
						else
							states <= WRITE;
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
		end
		
		WRITE :
		begin
		end
		
	endcase
	
	$display("state: %d",states);
			
end


// Open Drain assignment
assign SDA = rSDA ? 1'bz : 1'b0;
assign SCL = rSCL;
//assign SCL = rSCL ? 1'bz : 1'b0;
// assign i2c_clk = (cnt == div);


endmodule
