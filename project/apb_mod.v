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
	 output [`dataWidth-1:0] perdata,
	 input [`dataWidth:0] i2cdata
    );

/*reg [7:0] clk_counter;
initial clk_counter = 0;*/

reg [1:0] apb_status;
reg [`dataWidth:0] regprdata;
reg [`dataWidth:0] regperdata;
reg readyBit;

assign prdata = regprdata;
assign perdata = regperdata;


always @(apb_status) begin	// combinatorial block
	if(0 == reset) begin
		regprdata <= 0;		// reset amba output data
		regperdata <= 0;		// reset I2C output data
	end
	else if (apb_status == 2) 		// AMBA read
		regprdata <= regperdata;
	else if (apb_status == 3) 	// AMBA write
		regperdata <= pwdata;
end

always @ (posedge clk) begin	// clocked 
	if(0 == reset) begin
		apb_status <= 0; 	// reset state
	end
	else if (psel == 0) // not selected
		apb_status <= 0;
	else begin	// selected
		if (penable == 0) // but not enabled
			apb_status <= 1;
		else begin	// selected and enabled
			if (32'h80000000 == paddr) begin // base address is 0x80000000	
				if (pwrite == 0)
					apb_status <= 2;	//read
				else
					apb_status <= 3;	//write
			end
		end
	end
	
	prdata <= i2cdata[`dataWidth-1:0];
	readyBit <= i2cdata[`dataWidth];

end

endmodule
