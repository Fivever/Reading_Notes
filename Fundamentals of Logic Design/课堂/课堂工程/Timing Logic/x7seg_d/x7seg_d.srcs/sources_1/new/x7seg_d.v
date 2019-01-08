`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/04 16:07:39
// Design Name: 
// Module Name: x7seg_d
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
module x7seg_d(
    input clk,
    output reg[14:0] display_out    // display_out[14:7] --> 8个7段数码管使能端，display_out[6:0] --> 7段数码管数据输入端
    );
    reg [16:0]count = 0;
    reg [2:0] sel = 0;
    
    always@(*)
        begin
            case(sel)   // 根据sel扫描信号实现8个七段数码管的动态扫描
                0:display_out <= 15'b1111_1110_0000000;
                1:display_out <= 15'b1111_1101_0001111;
                2:display_out <= 15'b1111_1011_0100000;
                3:display_out <= 15'b1111_0111_0100100;
                4:display_out <= 15'b1110_1111_1001100;
                5:display_out <= 15'b1101_1111_0000110;
                6:display_out <= 15'b1011_1111_0010010;
                7:display_out <= 15'b0111_1111_1001111;
                default:display_out <= 15'b1111_1111_1111111;
            endcase
        end
        
    always@(posedge clk)
        begin
            count <= count + 1;
        end
    
    always@(posedge count[16])   // 利用低频时钟生成扫描信号sel
        begin
            sel <= sel + 1;
        end
endmodule
