`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:42:21 04/07/2017
// Design Name:   mod_top
// Module Name:   F:/RSZA/HW/tb_top.v
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

module tb_top;

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

	// Instantiate the Unit Under Test (UUT)
	mod_top uut (
		.PCLK(PCLK), 
		.PRESETn(PRESETn), 
		.PADDR(PADDR), 
		.PSELx(PSELx), 
		.PENABLE(PENABLE), 
		.PWRITE(PWRITE), 
		.PRDATA(PRDATA), 
		.PWDATA(PWDATA)
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
		
		//reset
		#10 PRESETn = 1;
		#150 PRESETn = 0;
		
		// 6-os cimbe 4 be�r�sa
		#10 PADDR = 6;
		#10 PWDATA = 4;
		#10 PWRITE = 1;
		#10 PSELx = 1;
		#10 PENABLE = 1;		
		
		#100
		
		//to idle
		#10 PENABLE = 0;
		#10 PSELx = 0;
		
		#100
		
		//kilvasas
		#10 PWRITE = 0;
		#10 PSELx = 1;
		#10 PENABLE = 1;
		
		#100
		
		//to idle
		#10 PENABLE = 0;
		#10 PSELx = 0;
		
		#50
		
		#100 PRESETn = 1;

		
	end
		
	
	always begin
		#20 PCLK = ~PCLK;
	end
      
      
endmodule

