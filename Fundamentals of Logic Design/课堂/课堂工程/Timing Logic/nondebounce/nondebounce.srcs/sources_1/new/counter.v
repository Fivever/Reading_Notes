`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/04 22:58:55
// Design Name: 
// Module Name: counter
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


module counter( count, rstn, btn_pluse
);
    input rstn, btn_pluse;
    output reg [31:0] count;
    
    always @(posedge btn_pluse) begin
        if (~rstn) count <= 0;
        else count <= count + 1;
    end
    
endmodule
