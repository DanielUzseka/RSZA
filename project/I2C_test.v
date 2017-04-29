`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:15:23 04/29/2017
// Design Name:   mod_I2C
// Module Name:   D:/RSZA/project/I2C_test.v
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

module I2C_test;

	// Inputs
	reg [3:0] command;
	reg [7:0] address;
	reg [7:0] data;
	reg clk;
	reg rst;

	// Outputs
	wire SCL;
	wire ready;

	// Bidirs
	wire SDA;

	// Instantiate the Unit Under Test (UUT)
	mod_I2C uut (
		.SDA(SDA), 
		.SCL(SCL), 
		.command(command), 
		.address(address), 
		.data(data), 
		.clk(clk), 
		.rst(rst), 
		.ready(ready)
	);

	initial begin
		// Initialize Inputs
		command = 0;
		address = 0'b00101010;
		data = 0'b01010101;
		clk = 0;
		rst = 0;


		// Wait 100 ns for global reset to finish
		#100;
		
		#10 rst = 1;
		#30 rst = 0;
		
		#10 command = 1;
		
		#40 command = 0;
		
		//#296 SDA = 0;
		//#32 SDA = 0'bz;
        
		// Add stimulus here
		
	end
	
	always begin
		#4 clk = ~clk;
	end
      
endmodule

