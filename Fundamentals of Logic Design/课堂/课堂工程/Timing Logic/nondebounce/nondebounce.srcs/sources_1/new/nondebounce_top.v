`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/04 23:22:06
// Design Name: 
// Module Name: debounce_top
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


module nondebounce_top(a_to_g, an, clk, rstn, btn
);

    input clk, rstn, btn;
    output [6:0] a_to_g;
    output [7:0] an;
    
    wire [31:0] seg7_data;
    
    counter U1(.count(seg7_data), .rstn(rstn), .btn_pluse(btn));
    x7seg_d U2(.a_to_g(a_to_g), .an(an), .clk(clk), .x(seg7_data));

endmodule