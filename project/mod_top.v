`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    07:42:55 04/07/2017
// Design Name:
// Module Name:    mod_top
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



module mod_top
(
	input			PCLK,      // The rising edge of PCLK is used to time all transfers on the APB.
   input			PRESETn,   // The APB bus reset signal is active LOW and this signal will normally be connected directly to the system bus reset signal.
	input 	[`addrWidth-1:0]	PADDR,     // This is the APB address bus, which may be up to 32-bits wide and is driven by the peripheral bus bridge unit.
	input 			PSELx,     // A signal from the secondary decoder, within the peripheral bus bridge unit, to each peripheral bus slave x. This signal indicates that the slave device is selected and a data transfer is required. There is a PSELx signal for each bus slave.
	input 			PENABLE,   // This strobe signal is used to time all accesses on the peripheral bus. The enable signal is used to indicate the second cycle of an APB transfer. The rising edge of PENABLE occurs in the middle of the APB transfer.
	input 			PWRITE,    // When HIGH this signal indicates an APB write access and when LOW a read access.
	output	[`dataWidth-1:0]	PRDATA,    // The read data bus is driven by the selected slave during read cycles (when PWRITE is LOW). The read data bus can be up to 32-bits wide.
	input 	[`dataWidth-1:0] 	PWDATA,     // The write data bus is driven by the peripheral bus bridge unit during write cycles (when PWRITE is HIGH). The write data bus can be up to 32-bits wide.
	inout SDA,
	output SCL
);

// apb_mod

// Outputs
	wire [`dataWidth-1:0] prdata;
	wire startbit;
	wire resetbit;
	wire it_enable;
	wire [`dataWidth-1:0] per_addr; //azert datawith nem pedig addrwith mert ez az i2c periferiaira vonatkozik
	wire [`dataWidth-1:0] per_data;
	
// Instantiate the module
apb_mod inst_APB (
    .clk(PCLK), 
    .reset(PRESETn), 
    .paddr(PADDR), 
    .pwdata(PWDATA), 
    .prdata(PRDATA), 
    .pwrite(PWRITE), 
    .psel(PSELx), 
    .penable(PENABLE), 
    .perdata(perdata)
    );
	 
// Instantiate the module
mod_I2C instance_name (
    .SDA(SDA), 
    .SCL(SCL), 
    //.command(command), 
    //.address(address), 
    .dataIn(dataIn),
	 .dataOut(dataOut),
    .clk(clk), 
    .rst(rst) 
    //.ready(ready)
    );
	 
endmodule
