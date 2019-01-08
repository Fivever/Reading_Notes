`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/04 15:18:52
// Design Name: 
// Module Name: counter_N
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


module counter_N #(parameter N = 4)(cout, rstn, clk);
input clk, rstn; 
output [N-1:0] cout;
reg [N-1:0] cout;
always @(posedge clk) 
   if (~rstn) 
         cout <= 0;
   else 
         cout <= cout + 1;   // ¼Ó1¼ÆÊý
endmodule
