`timescale 1ns / 1ps

module tb_top_W;

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
	
	reg rSDA = 1'bz;

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
		#100;
        
		// Add stimulus here
		
		//reset
		#10 PRESETn = 0;
		#80 PRESETn = 1;
		
		// helytelen cimre iras
		// DATA | ADDR |R/W|Sp|R|S|
		#40 PADDR = 32'h70000000; 
		PWDATA[18:11] = 8'h3D; //data
		PWDATA[10:4] = 7'h60; // address
		PWDATA[3] = 0; // write
		PWDATA[2] = 0; // speed
		PWDATA[0] = 1; // start
		
		#5 PWRITE = 1; // AMBA write
		#10 PSELx = 1;	// selecting
		#25 //penable csak kovetkezo ciklusban!
		#10 PENABLE = 1;  //enabling
		
		//to idle
		#60 PENABLE = 0; PSELx = 0;
		
		#200;
		
		// DATA | ADDR |R/W|Sp|R|S|
		#40 PADDR = 32'h80000000; 
		PWDATA[18:11] = 8'hF5; //data
		PWDATA[10:4] = 7'h42; // address
		PWDATA[3] = 0; // write
		PWDATA[2] = 0; // speed
		PWDATA[0] = 1; // start
		
		#5 PWRITE = 1; // AMBA write
		#10 PSELx = 1;	// selecting
		#25 //penable csak kovetkezo ciklusban!
		#10 PENABLE = 1;  //enabling
		
		//to idle
		#60 PENABLE = 0; PSELx = 0;
		
		#5288;
		// addr ACK (for speed=0)
		rSDA = 0;
		# 600; 
		rSDA = 'bz;
		
		#4797;
		// data ACK (for speed=0)
		rSDA = 0;
		# 600; 
		rSDA = 'bz;
		

	end
	
	assign SDA = rSDA;
	
	always begin
		#25 PCLK = ~PCLK;
	end
      
endmodule

