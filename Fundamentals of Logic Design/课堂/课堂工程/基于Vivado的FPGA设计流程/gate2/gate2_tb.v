`timescale 1ns / 1ns
module gate2_tb;
	reg a;
	reg b;
	wire [5:0] z;
	gate2 uut (
		.a(a), 
		.b(b), 
		.z(z)
	);

	initial begin
		a = 0;
		b = 0;

		#100;   
		// Add stimulus here
	   #200
		a = 0;
		b = 0;
		#200
		a = 0;
		b = 1;
		#200
		a = 1;
		b = 0;
		#200
		a = 1;
		b = 1;
		#100
		$finish;
	end   
endmodule

