`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/17 15:46:48
// Design Name: 
// Module Name: rom16_32_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rom16_32_top(dout, clk, addr);

    input clk;
    input [4:0] addr;
    output [15:0] dout;

    rom16_32 your_instance_name (.clka(clk), .addra(addr), .douta(dout));

endmodule
