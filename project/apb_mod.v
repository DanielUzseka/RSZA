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
    input [`addrWidth-1:0] addr,
    input [`dataWidth-1:0] pwdata,
    output reg [`dataWidth:0] prdata,
    input pwrite,
    input psel,
    input penable,
	 output reg startbit,
	 output reg resetbit,
	 output reg it_enable,
	 output reg [`dataWidth-1:0]per_addr,
	 output reg [`dataWidth-1:0]per_data
    );

/*reg [7:0] clk_counter;
initial clk_counter = 0;*/

reg [1:0] apb_status;
integer i;

reg [`dataWidth-1:0] mem [`addrWidth-1:0];

always @ (posedge clk or negedge reset) begin
	/*clk_counter <= clk_counter + 1;
	prdata <= clk_counter;*/
	if (reset == 0) begin
		apb_status = 0;
		prdata <= 0;
		for (i=0; i<=`addrWidth; i=i+1) begin
			mem[i] = 0;
		end
	end
	else
		if (psel == 0)
			apb_status = 0;
		else
			if (penable == 0)
				apb_status = 1;
			else
				if (pwrite == 0)
					apb_status = 2;
				else
					apb_status = 3;
	
	if (apb_status == 2)
		prdata = mem[addr];
	else if (apb_status == 3)
		mem[addr] = pwdata;
	
	startbit = mem[0];
	resetbit = mem[1];
	it_enable = mem[2];
	per_addr = mem[3];
	per_data = mem[4];

/*	$display("Status is: %d", apb_status);
	//$display("int: %d", addr_int);

	for (i=0; i<addrWidth; i=i+1)
		$display("Mem %d: %d",i,mem[i]);	
	$display("------------------------");*/
	
	$display("startbit: %d",startbit);
	$display("resetbit: %d",resetbit);	
	$display("it_enable: %d",it_enable);	
	$display("per_addr: %d",per_addr);	
	$display("per_data: %d",per_data);	
	$display("------------------------");

end

endmodule
