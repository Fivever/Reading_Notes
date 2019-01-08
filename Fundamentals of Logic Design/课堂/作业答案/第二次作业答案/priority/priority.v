`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:41:54 11/20/2016 
// Design Name: 
// Module Name:    priority 
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
module priority( Y, I
    );
	 
	 input [7:0] I;
	 output reg [2:0] Y;
	 
	 always @(*) begin
		if (I[7] == 0) Y = 4'b111; //The priority of I[7] is highest
		else if (I[6] == 0) Y = 4'b110;
		else if (I[5] == 0) Y = 4'b101;
		else if (I[4] == 0) Y = 4'b100;
		else if (I[3] == 0) Y = 4'b011;
		else if (I[2] == 0) Y = 4'b010;
		else if (I[1] == 0) Y = 4'b001;
		else if (I[0] == 0) Y = 4'b000; //The priority of I[0] is lowest
		else Y = 4'b000;
	 end

endmodule
