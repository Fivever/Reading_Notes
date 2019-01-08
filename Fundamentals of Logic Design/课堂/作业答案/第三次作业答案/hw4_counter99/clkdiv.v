`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:46:29 11/03/2016 
// Design Name:    clkdiv
// Module Name:    clkdiv 
// Project Name:   seg7_d_top
// Target Devices: Spartan 6 xc6slx16-3csg324
// Tool versions: ISE 13.1
// Description: clock divider generates 190Hz clock frequency.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clkdiv( clk190, clk, rst_n
    );
	 
	 input clk, rst_n;
	 output clk190;
	 
	 reg [18:0] counter;
	 
	 always @(posedge clk or negedge rst_n) begin
	    if (~rst_n) counter <= 0;
		 else counter <= counter + 1;
	 end
	 
	 assign clk190 = counter[18]; //190Hz clock frequency


endmodule
