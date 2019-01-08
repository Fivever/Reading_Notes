`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:37:10 11/04/2016 
// Design Name:    ledbanner
// Module Name:    ledbanner 
// Project Name:   ledbanner_top
// Target Devices: Spartan 6 xc6slx16-3csg324
// Tool versions: ISE 13.1
// Description: circularly lighten 8 leds
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ledbanner( led, clk6Hz, rst_n, set
    );
	 
	 input clk6Hz, rst_n, set;
	 output reg [7:0] led;
	 
	 always @(posedge clk6Hz or negedge rst_n) begin
	    if(~rst_n) led <= 8'b00000000;
		 else if(set) led <= 8'b00000001;
		 //circularly lighten 8 leds using shifting register
		 else begin
		    led[7:1] <= led[6:0];
		    led[0] <= led[7];
		 end
	 end


endmodule
