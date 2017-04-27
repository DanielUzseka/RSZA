`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:35:01 04/27/2017
// Design Name:   apb_modul
// Module Name:   C:/Users/Daniel/Desktop/RSZA-master/hf_proba01/apb_test.v
// Project Name:  hf_proba01
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: apb_modul
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module apb_test;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] addr;
	reg [7:0] pwdata;
	reg pwrite;
	reg psel;
	reg penable;

	// Outputs
	wire [7:0] prdata;

	// Instantiate the Unit Under Test (UUT)
	apb_modul uut (
		.clk(clk), 
		.reset(reset), 
		.addr(addr), 
		.pwdata(pwdata), 
		.prdata(prdata), 
		.pwrite(pwrite), 
		.psel(psel), 
		.penable(penable)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		addr = 0;
		pwdata = 0;
		pwrite = 0;
		psel = 0;
		penable = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		//reset
		#10 reset = 1;
		#150 reset = 0;
		
		// 6-os cimbe 4 beírása
		#10 addr = 6;
		#10 pwdata = 4;
		#10 pwrite = 1;
		#10 psel = 1;
		#10 penable = 1;		
		
		#100
		
		//to idle
		#10 penable = 0;
		#10 psel = 0;
		
		#100
		
		//kilvasas
		#10 pwrite = 0;
		#10 psel = 1;
		#10 penable = 1;
		
		#100
		
		//to idle
		#10 penable = 0;
		#10 psel = 0;
		
		#50
		
		#100 reset = 1;

		
	end
		
	
	always begin
		#20 clk = ~clk;
	end
      
endmodule

