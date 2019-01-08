`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:54:18 11/23/2016 
// Design Name: 
// Module Name:    counter99_top 
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
module counter99_top( a_to_g, an, clk, rst_n, btn
    );
   input clk, rst_n, btn;
	output [6:0] a_to_g;
	output [3:0] an;
	
	wire clk190;
	wire [`WIDTH - 1:0] counter;
	wire [15:0] seg7_data;
	
	clkdiv U1( .clk190(clk190), .clk(clk), .rst_n(rst_n));
	counter99 U2(.counter(counter), .clk(clk190), .rst_n(rst_n), .btn(btn));
	bin2bcd U3(.bcd(seg7_data), .bin(counter));
	seg7_d U4(.a_to_g(a_to_g), .an(an), .clk190(clk190), .rst_n(rst_n), .x(seg7_data));

endmodule
