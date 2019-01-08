`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:54:56 12/02/2016 
// Design Name: 
// Module Name:    taillight_top 
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
module taillight_top( tl_led, clk, rst_n, haz, left, right
    );
	 
	 input clk, rst_n, haz, left, right;
	 output [5:0] tl_led;
	 
	 wire clk6Hz;
	 
	 clkdiv U1(.clk6Hz(clk6Hz), .clk(clk), .rst_n(rst_n));
	 taillight_fsm U2(.tl_led(tl_led), .clk(clk6Hz), .rst_n(rst_n), .haz(haz), .left(left), .right(right));

endmodule
