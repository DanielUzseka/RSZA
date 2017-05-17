`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:43 04/28/2017 
// Design Name: 
// Module Name:    apb_mod 
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
`include "macros.vh"


module apb_mod
(
   input clk,
    input reset,
    input [`addrWidth-1:0] paddr,
    input [`dataWidth-1:0] pwdata,
    output [`dataWidth-1:0] prdata,
    input pwrite,
    input psel,
    input penable,
	 input [`dataWidth-1:0] in_perdata,
	 output [`dataWidth-1:0] out_perdata
    );

/*reg [7:0] clk_counter;
initial clk_counter = 0;*/

reg [1:0] apb_status;

parameter IDLE     = 2'b00;
parameter SELECTED = 2'b01;
parameter READ     = 2'b10;
parameter WRITE    = 2'b11;

assign out_perdata = (WRITE == apb_status)? pwdata : 'bz;
assign prdata = (READ == apb_status)? in_perdata : prdata;


//always @(apb_status) begin	// combinatorial block
//	if(0 == reset) begin
//		regprdata <= 0;		// reset amba output data
//		regperdata <= 0;		// reset I2C output data
//	end
//	else if (apb_status == 2) 		// AMBA read
//		regprdata <= regperdata;
//	else if (apb_status == 3) 	// AMBA write
//		regperdata <= pwdata;
//end

always @ (posedge clk) begin	// clocked 
	if(0 == reset) begin
		apb_status <= IDLE; 	// reset state
	end
	else if (psel == 0) // not selected
		apb_status <= IDLE;
	else begin	// selected
		if (penable == 0) // but not enabled
			apb_status <= SELECTED;
		else begin	// selected and enabled
			if (32'h80000000 == paddr) begin // base address is 0x80000000	
				if (pwrite == 0)
					apb_status <= READ;	//read
				else
					apb_status <= WRITE;	//write
			end
		end
	end

end

endmodule
