`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:48:39 11/23/2016 
// Design Name: 
// Module Name:    counter99 
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
module counter99( counter, clk, rst_n, btn
    );
	 
	 input clk, rst_n, btn;
	 output reg [`WIDTH - 1:0] counter;
	 
	 reg delay1, delay2, delay3;
	 wire btn_pluse;
	 
	 // single pluse generation
	 always @(posedge clk or negedge rst_n) begin
	    if (~rst_n) {delay1, delay2, delay3} <= 3'b000;
		 else begin
		    delay1 <= btn;
			 delay2 <= delay1;
			 delay3 <= delay2;
		 end
	 end
	 
	 assign btn_pluse = delay1 & delay2 & (~delay3);
	 
	 // counter from 0 to 99
	 always @(posedge clk or negedge rst_n) begin
	    if (~rst_n) counter <= 0;
		 else if (btn_pluse == 1'b1) begin
		    if (counter < 'd99) counter <= counter + 1;
			 else counter <= 0;
		 end
		 else counter <= counter;
	 end

endmodule
