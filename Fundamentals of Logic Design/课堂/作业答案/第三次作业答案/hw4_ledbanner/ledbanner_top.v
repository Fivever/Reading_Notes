`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:45:05 11/04/2016 
// Design Name: 
// Module Name:    ledbanner_top 
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
module ledbanner_top(led, clk, rst_n, set
    );
	 
	 input clk, rst_n, set;
	 output [7:0] led;
	 
	 wire clk6Hz;
	 
	 clkdiv U1(.clk6Hz(clk6Hz), .clk(clk), .rst_n(rst_n));
	 ledbanner U2(.led(led), .clk6Hz(clk6Hz), .rst_n(rst_n), .set(set));

endmodule
