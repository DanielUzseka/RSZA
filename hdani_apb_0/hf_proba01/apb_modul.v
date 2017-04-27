`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:32:29 04/27/2017 
// Design Name: 
// Module Name:    apb_modul 
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
module apb_modul(
    input clk,
    input reset,
    input [7:0] addr,
    input [7:0] pwdata,
    output reg [7:0] prdata,
    input pwrite,
    input psel,
    input penable
    );

/*reg [7:0] clk_counter;
initial clk_counter = 0;*/

reg [1:0] apb_status;
integer i;

reg [7:0] mem [7:0];
initial begin
   for (i=0; i<=7; i=i+1) begin
      mem[i] = 0;
   end
end


always @ (posedge clk or negedge reset) begin
	/*clk_counter <= clk_counter + 1;
	prdata <= clk_counter;*/
	if (reset == 1) begin
		apb_status = 0;
		prdata <= 0;
		for (i=0; i<=7; i=i+1) begin
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
	
	

	$display("Status is: %d", apb_status);
	//$display("int: %d", addr_int);

	for (i=0; i<8; i=i+1)
		$display("Mem %d: %d",i,mem[i]);	
	$display("------------------------");


end

endmodule
