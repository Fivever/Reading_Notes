`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:32:34 12/02/2016 
// Design Name: 
// Module Name:    taillight_fsm 
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
module taillight_fsm( tl_led, clk, rst_n, haz, left, right
    );
	 
	 input clk, rst_n, haz, left, right;
	 output [5:0] tl_led; // vehicle taillight
	 
	 reg [5:0] tl_led;
	 reg [7:0] current_state, next_state;
	 parameter [7:0] IDLE = 8'b00000001, LA = 8'b00000010, LB = 8'b00000100, LC = 8'b00001000;
	 parameter [7:0] RA = 8'b00010000, RB = 8'b00100000, RC = 8'b01000000, WARN = 8'b10000000;
	 
	 always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) current_state <= IDLE;
		 else current_state <= next_state;
	 end
	 
	 always @(*) begin
	    if(~rst_n) next_state = IDLE;
		 else begin
		    case(current_state)
			    IDLE : begin
				    if (haz || (left & right)) next_state = WARN;
					 else if (left && (~haz) && (~right)) next_state = LA;
					 else if (right && (~haz) && (~left)) next_state = RA;
					 else next_state = IDLE;
				 end
				 LA : begin
				    if (haz) next_state = WARN;
					 else next_state = LB;
				 end
				 LB : begin
				    if (haz) next_state = WARN;
					 else next_state = LC;
				 end
				 LC : next_state = IDLE;
				 RA : begin
				    if (haz) next_state = WARN;
					 else next_state = RB;
				 end
				 RB : begin
				    if (haz) next_state = WARN;
					 else next_state = RC;
				 end
				 RC : next_state = IDLE;
				 WARN : next_state = IDLE;
				 default : next_state = IDLE;
			 endcase
		 end
	 end
	 
	  always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) tl_led <= 0;
		 else begin
		    case(current_state)
			    IDLE : tl_led <= 6'b000000;
				 LA : tl_led <= 6'b001000;
				 LB : tl_led <= 6'b011000;
				 LC : tl_led <= 6'b111000;
				 RA : tl_led <= 6'b000100;
				 RB : tl_led <= 6'b000110;
				 RC : tl_led <= 6'b000111;
				 WARN : tl_led <= 6'b111111;
			 endcase
		 end
	 end


endmodule
