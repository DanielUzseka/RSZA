`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    10:38:01 04/27/2017
// Design Name:
// Module Name:    mod_APB
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
module mod_APB(
    input			PCLK,      // The rising edge of PCLK is used to time all transfers on the APB.
    input			PRESETn,   // The APB bus reset signal is active LOW and this signal will normally be connected directly to the system bus reset signal.
	input 	[31:0]	PADDR,     // This is the APB address bus, which may be up to 32-bits wide and is driven by the peripheral bus bridge unit.
	input 			PSELx,     // A signal from the secondary decoder, within the peripheral bus bridge unit, to each peripheral bus slave x. This signal indicates that the slave device is selected and a data transfer is required. There is a PSELx signal for each bus slave.
	input 			PENABLE,   // This strobe signal is used to time all accesses on the peripheral bus. The enable signal is used to indicate the second cycle of an APB transfer. The rising edge of PENABLE occurs in the middle of the APB transfer.
	input 			PWRITE,    // When HIGH this signal indicates an APB write access and when LOW a read access.
	output	[31:0]	PRDATA,    // The read data bus is driven by the selected slave during read cycles (when PWRITE is LOW). The read data bus can be up to 32-bits wide.
	input 	[31:0] 	PWDATA     // The write data bus is driven by the peripheral bus bridge unit during write cycles (when PWRITE is HIGH). The write data bus can be up to 32-bits wide.
);

reg [7:0] mem [7:0];
reg [1:0] apb_status;
integer i;


always @ (posedge clk or negedge reset) begin
	/*clk_counter <= clk_counter + 1;
	PRDATA <= clk_counter;*/
	if (reset == 1)
        begin
    		apb_status = 0;
    		PRDATA <= 0;
    		for (i=0; i<=7; i=i+1)
            begin
    			mem[i] <= 0;
    		end
    	end
	else
        begin
    		if (psel == 0)
    			apb_status = 0;
    		else
    			if (PENABLE == 0)
    				apb_status <= 1;
    			else
    				if (PWRITE == 0)
    					apb_status <= 2;
    				else
    					apb_status <= 3;
        end

	if (apb_status == 2)
		PRDATA <= mem[addr];
	else if (apb_status == 3)
		mem[addr] <= PWDATA;

	$display("Status is: %d", apb_status);
	//$display("int: %d", addr_int);

	for (i=0; i<8; i=i+1)
		$display("Mem %d: %d",i,mem[i]);
	$display("------------------------");
end


endmodule
