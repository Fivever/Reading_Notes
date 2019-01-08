`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/04 15:20:13
// Design Name: 
// Module Name: counter_N_tb
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


module counter_N_tb #(parameter N = 4);

reg clk, rstn; 
wire [N-1:0] cout;

counter_N uut (.clk(clk), .rstn(rstn), .cout(cout));

always begin
    #5 clk = ~clk;
end

initial begin
    clk = 0;
    rstn = 0;
    #100 rstn = 1;
    #300 $finish;
end

endmodule
