`timescale 1ns / 1ps

`include "macros.vh"



module mod_top
(
	input 					PCLK,
	input 					PRESETn,
	input 	[`addrWidth-1:0]		PADDR,
	input 					PSELx,
	input 					PENABLE,
	input 					PWRITE,
	output 	[`dataWidth-1:0]		PRDATA,
	input  	[`dataWidth-1:0] 		PWDATA,
	inout 					SDA,
	output 					SCL
);

// apb_mod

// Outputs
	wire [`dataWidth-1:0] prdata;
	wire startbit;
	wire resetbit;
	wire it_enable;
	wire [`dataWidth-1:0] per_addr; //azert datawith nem pedig addrwith mert ez az i2c periferiaira vonatkozik
	wire [`dataWidth-1:0] per_data;

	wire [`dataWidth-1:0] A2I;
	wire [`dataWidth-1:0] I2A;

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
    .in_perdata(I2A),
    .out_perdata(A2I)
    );

// Instantiate the module
mod_I2C inst_I2C (
    .SDA(SDA),
    .SCL(SCL),
    .dataIn(A2I),
    .dataOut(I2A),
    .clk(PCLK),
    .rst(PRESETn)
    );

endmodule
