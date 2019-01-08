`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:45 05/03/2015 
// Design Name:    seg7_d
// Module Name:    seg7_d 
// Project Name:   seg7_d_top
// Target Devices: Spartan 6 xc6slx16-3csg324
// Tool versions:  ISE 13.1
// Description: Dynamic scanning of four 7-segment digital tubes
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module seg7_d( a_to_g, an, clk190, rst_n, x
    );
	 
	 input clk190, rst_n;
	 input [15:0] x;
	 output [6:0] a_to_g;
	 output [3:0] an;
	 
	 reg [6:0] a_to_g;
	 reg [3:0] an;
	 reg [1:0] an_sel;
	 reg [3:0] digit;
	 
	 always @(*)
		case (digit)
			0: a_to_g = 7'b0000001;
			1: a_to_g = 7'b1001111;
			2: a_to_g = 7'b0010010;
			3: a_to_g = 7'b0000110;
			4: a_to_g = 7'b1001100;
			5: a_to_g = 7'b0100100;
			6: a_to_g = 7'b0100000;
			7: a_to_g = 7'b0001111;
			8: a_to_g = 7'b0000000;
			9: a_to_g = 7'b0000100;
			'hA: a_to_g = 7'b0001000;
			'hB: a_to_g = 7'b1100000;
			'hC: a_to_g = 7'b0110001;
			'hD: a_to_g = 7'b1000010;
			'hE: a_to_g = 7'b0110000;
			'hF: a_to_g = 7'b0111000;
			default: a_to_g = 7'b0000001;  // 0
		endcase
		
		//dynamic scanning of four 7-segment digital tubes
		always @(posedge clk190 or negedge rst_n) begin
		
			if(~rst_n) begin
		      an_sel <= 0;
				an <= 4'b1111;
			end
			else begin
		      case(an_sel)
			      0: begin
				      an <= 4'b1110;
				      digit <= x[3:0];
				   end
				   1:begin
				      an <= 4'b1101;
				      digit <= x[7:4];
				   end
				   2:begin
				      an <= 4'b1011;
				      digit <= x[11:8];
				   end
				   3:begin
				      an <= 4'b0111;
				      digit <= x[15:12];
				   end
			   endcase
			   an_sel <= an_sel + 1;
			end
		end
endmodule
