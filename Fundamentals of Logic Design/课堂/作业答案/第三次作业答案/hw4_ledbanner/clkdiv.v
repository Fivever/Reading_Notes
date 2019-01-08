`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:35:26 11/04/2016 
// Design Name:    clkdiv
// Module Name:    clkdiv 
// Project Name:   ledbanner_top
// Target Devices: Spartan 6 xc6slx16-3csg324
// Tool versions: ISE 13.1
// Description: clock divider generating 6Hz clock frequency
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
