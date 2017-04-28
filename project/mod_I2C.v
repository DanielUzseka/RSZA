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
	inout			SDA,		// I2C Data
	inout 		SCL		// I2C clock
    );
	 

reg rSDA;
reg rSCL;

// Open Drain assignment
assign SDA = rSDA ? 1'bz : 1'b0;
assign SCL = rSCL ? 1'bz : 1'b0;


endmodule
