`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:52:35 05/13/2017
// Design Name:   mod_I2C
// Module Name:   /home/kristofkalocsai/School/SYSARCH/HW/RSZA/project/tb_i2c.v
// Project Name:  HW
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mod_I2C
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_i2c;

	// Inputs
	//reg [31:0] r_command;
	reg [31:0] dataIn;
	reg clk;
	reg rst;

	// Outputs
	wire SCL;
	wire [31:0] dataOut;

	// Bidirs
	wire SDA;

	// Instantiate the Unit Under Test (UUT)
	mod_I2C uut (
		.SDA(SDA), 
		.SCL(SCL), 
		//.command(r_command), 
		.dataIn(dataIn), 
		.dataOut(dataOut), 
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		//r_command = 0;
		dataIn = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst = 0;
		#50;
		//r_command <= 0'b001;
		//#10;
		dataIn <= 0'b0101010010101010001;
		
		//#436 SDA <= 0;
		#300;
		dataIn <= 0'b0101010010101010000;

	end
	
	always begin
		#4 clk = ~clk;
	end
      
endmodule

