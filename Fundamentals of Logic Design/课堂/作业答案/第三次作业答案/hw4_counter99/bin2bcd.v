`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:02:56 04/19/2013 
// Design Name: 
// Module Name:    binbcd8 
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
`define WIDTH 8
module bin2bcd( bcd, bin
    );
	 
	 input [`WIDTH - 1:0] bin;
	 output reg [15:0] bcd;
	 
	 reg [`WIDTH + 15:0] temp;
	 integer i;
	 
	 always @(*)
	 begin
	 
		for (i=0; i <= 'd23; i = i + 1)
			temp[i] = 0;
		temp[7:0] = bin;
		
		repeat(`WIDTH)
		begin
		
			if (temp[11:8] > 4) temp[11:8] = temp[11:8] + 3; // the unit >= 5?
			if (temp[15:12] > 4) temp[15:12] = temp[15:12] + 3; // the decade >= 5?
			temp[`WIDTH + 15:1] = temp[`WIDTH + 14:0]; // left shift one bit
		
		end
		
		bcd = temp[`WIDTH + 15:8];
	 
	 end

endmodule
