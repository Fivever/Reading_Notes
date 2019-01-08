`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/04 22:56:44
// Design Name: 
// Module Name: clkdiv
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


module clkdiv( clk190, clk, rstn
);
    input clk, rstn;
    output clk190;
    reg [18:0] counter;
    always @(posedge clk) begin
        if (~rstn) counter <= 0;
        else counter <= counter + 1;
    end
    assign clk190 = counter[18]; //190Hz clock frequency
endmodule
