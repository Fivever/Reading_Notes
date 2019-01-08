`timescale 1ns/1ps
module decoder3_8_tb;

	// Inputs
	reg en;
	reg [2:0] A;

	// Outputs
	wire [7:0] Y;

	// Instantiate the Unit Under Test (UUT)
	decoder3_8 uut (
		.Y(Y), 
		.en(en), 
		.A(A)
	);

	initial begin
		// Initialize Inputs
		en = 0;
		A = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		en = 1;
		#20 A = 3'b001;
		#20 A = 3'b010;
		#20 A = 3'b011;
		#20 A = 3'b100;
		#20 A = 3'b101;
		#20 A = 3'b110;
		#20 A = 3'b111;

	end
	
	initial
	   $monitor("Simulation Time:", $time, ,"A = %b, Y = %b", A, Y);
      
endmodule