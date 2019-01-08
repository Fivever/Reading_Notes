`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:31:31 12/02/2016 
// Design Name: 
// Module Name:    clkdiv 
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
module clkdiv(clk6Hz, clk, rst_n
    );
	 
	 input clk, rst_n;
	 output clk6Hz;
	 
	 reg [23:0] counter;
	 
	 always @(posedge clk or negedge rst_n) begin
	    if (~rst_n) counter <= 0;
		 else counter <= counter + 1;
	 end
	 
	 assign clk6Hz = counter[23]; // 6Hz clock frequency

endmodule
