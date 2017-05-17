`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:43:03 05/15/2017
// Design Name:   mod_top
// Module Name:   /home/kristofkalocsai/School/SYSARCH/HW/RSZA/project/test_top.v
// Project Name:  HW
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mod_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_top;

	// Inputs
	reg PCLK;
	reg PRESETn;
	reg [31:0] PADDR;
	reg PSELx;
	reg PENABLE;
	reg PWRITE;
	reg [31:0] PWDATA;

	// Outputs
	wire [31:0] PRDATA;
	wire SCL;

	// Bidirs
	wire SDA;

	// Instantiate the Unit Under Test (UUT)
	mod_top uut (
		.PCLK(PCLK), 
		.PRESETn(PRESETn), 
		.PADDR(PADDR), 
		.PSELx(PSELx), 
		.PENABLE(PENABLE), 
		.PWRITE(PWRITE), 
		.PRDATA(PRDATA), 
		.PWDATA(PWDATA), 
		.SDA(SDA), 
		.SCL(SCL)
	);

	initial begin
		// Initialize Inputs
		PCLK = 0;
		PRESETn = 0;
		PADDR = 0;
		PSELx = 0;
		PENABLE = 0;
		PWRITE = 0;
		PWDATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

