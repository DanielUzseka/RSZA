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
	
	inout [31:0]	data,
	input 			clk, //16MHz clk
	input				rst
    );
	 

reg rSDA = 1;
reg rSCL = 1;

reg i2c_clk;

reg [31:0] regData;
	//0: start
	//1: reset
	//2: speed
	//3: read/write
	//4-10: address
	//11-18: data
	//19: ready bit

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


always @(posedge clk) 
begin
	case (states)
		IDLE : 
		begin
			if (1 == regData[0]) //start
			begin
				regData[19] <= 0; //i2c is not ready for another communication
				regData[0] <= 0; //clear start bit
				
				//set the speed of the communication
				if (regData[2] == SPEED_100kBPS) //get the speed
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
			rSDA <= 0; //pull down the wire
			
			if (cnt == div) //divided clock -> toggle the scl
			begin
				cnt <= 0;
				
				rSCL <= ~rSCL; //pull scl down
				
				byteCounter <= 0;
				read <= regData[3]; //read or write
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
						rSDA <= regData[10-byteCounter]; 
						//from the 10th to the 3rd bit
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
					if(0 == SDA)
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
			if(cnt == (div/2))
			begin
				if(1 == rSCL)
				begin
					regData[18-byteCounter] <= SDA; //save the incoming data
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
			if(cnt == (div/2))
			begin
				if(0 == rSCL)
				begin
					if(8 == byteCounter)
					begin
						states <= WAIT_DATA_ACK;
					end
					else
					begin
						rSDA <= regData[18-byteCounter]; //send the data
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
			if(cnt == (div/2))
			begin
				if(1 == rSCL)
				begin
					if(0 == SDA)
					begin
						byteCounter <= 0;
						states <= STOP;
					end
					else
					begin
						//error - no Ack
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
			if(cnt == (div/2))
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
			if(cnt == (div/2))
			begin
				if(1 == rSCL)
				begin
					rSDA <= 1;
					states <= IDLE;
				end
			end
		end
		
	endcase
	
//	$display("state: %d, i: %d",states, byteCounter);
			
end

always @(posedge clk)
	if (rst | regData[1]) //reset
	begin
		states <= IDLE;
		rSDA <= 1;
		rSCL <= 1;
		cnt <= 0;
	end


// Open Drain assignment
assign SDA = rSDA ? 1'bz : 1'b0;
assign SCL = rSCL;
assign data = regData;
//assign SCL = rSCL ? 1'bz : 1'b0;
// assign i2c_clk = (cnt == div);


endmodule
