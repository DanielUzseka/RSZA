`timescale 1ns / 1ps

module tb_top_R;

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
		
		// issuing i2c write command
		// DATA | ADDR |R/W|Sp|R|S|
		#40 PADDR = 32'h80000000; // peripheral address
		PWDATA[10:4] = 7'h63; // I2C address
		PWDATA[3] = 1; // read
		PWDATA[2] = 1; // speed
		PWDATA[0] = 1; // start
		
		#5 PWRITE = 1; // AMBA write
		#10 PSELx = 1;	// selecting
		#25 //penable csak kovetkezo ciklusban!
		#10 PENABLE = 1;  //enabling
		
		//to idle
		#60 PENABLE = 0; PSELx = 0;
		
		// polling peripheral
		# 3000;
		// DATA | ADDR |R/W|Sp|R|S|
		#40 PADDR = 32'h80000000; // peripheral address
	
		#5 PWRITE = 0; // AMBA read
		#10 PSELx = 1;	// selecting
		#25 //penable csak kovetkezo ciklusban!
		#10 PENABLE = 1;  //enabling
		
		//to idle
		#60 PENABLE = 0; PSELx = 0;
		
		// I2C is not ready (PRDATA[19] == 0), data is not reliable!
		
		
		// addr ACK (for speed=1)
		# 285;
		rSDA = 0;
		# 400; 
		rSDA = 'bz;
		
		// slave data 8'hC5; MSB first
		rSDA = 'bz;  // 1
		# 400 rSDA = 'bz; // 1
		# 400 rSDA = 0; // 0
		# 400 rSDA = 0; // 0
		# 400 rSDA = 0; // 0
		# 400 rSDA = 'bz; // 1
		# 400 rSDA = 0; // 0
		# 400 rSDA = 'bz; // 1

		
		// polling peripheral
		# 1250;
		// DATA | ADDR |R/W|Sp|R|S|
		#40 PADDR = 32'h80000000; // peripheral address
	
		#5 PWRITE = 0; // AMBA read
		#10 PSELx = 1;	// selecting
		#25 //penable csak kovetkezo ciklusban!
		#10 PENABLE = 1;  //enabling
		
		//to idle
		#60 PENABLE = 0; PSELx = 0;
		
		// I2C was ready! (PRDATA[19] == 1)
		

	end
	
	assign SDA = rSDA;
	
	always begin
		#25 PCLK = ~PCLK;
	end
      
endmodule

