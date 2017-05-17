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

`include "macros.vh"

module tb_top();
	
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
		PRESETn = 1;
		PADDR = 0;
		PSELx = 0;
		PENABLE = 0;
		PWRITE = 0;
		PWDATA = 0;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here
		
		//reset
		#10 PRESETn = 0;
		#80 PRESETn = 1;
		
		// kezdocimre 1 beirasa
		#40 PADDR = 32'h80000000; PWDATA = 32'b0101010010101010001;
		#5 PWRITE = 1;
		#10 PSELx = 1;
		#25 //penable csak kovetkezo ciklusban!
		#10 PENABLE = 1;		
		#50

		//to idle
		#10 PENABLE = 0; PSELx = 0;
		
		#40
		
		//kiolvasas
		#10 PWRITE = 0;
		#10 PSELx = 1;
		#10 PENABLE = 1;
		
		#40
		
		//to idle
		#10 PENABLE = 0;
		#10 PSELx = 0;
		
		//
		// ervenytelen cimbe iras
		#10 PADDR = 32'h80000004;
		#10 PWDATA = 144;
		#10 PSELx = 1;
		#10 PENABLE = 1;

		#40
		
		
		
		
		#100
		
		//to idle
		#10 PENABLE = 0;
		#10 PSELx = 0;
		
		#50
		
		#100 PRESETn = 1;

		
	end
		
	
	always begin
		#25 PCLK = ~PCLK;
	end
      
      
endmodule

