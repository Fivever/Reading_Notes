`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/04 23:04:26
// Design Name: 
// Module Name: xseg7_d
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
    input [31:0] x,
    output reg [6:0] a_to_g,   //a_to_g[6:0] --> 7段数码管数据输入端
    output reg [7:0] an       // an --> 8个7段数码管使能端
    );
    reg [16:0] count = 0;
    reg [2:0] sel = 0;
    reg [3:0] digit;        // 每次扫描需显示的数字
    
    always@(*)
        begin
            case(sel)   // 根据sel扫描信号实现8个七段数码管的动态扫描
                0:begin
                    an <= 8'b1111_1110;
                    digit = x[3:0];
                end
                1:begin
                    an <= 8'b1111_1101;
                    digit = x[7:4];
                end
                2:begin
                    an <= 8'b1111_1011;
                    digit = x[11:8];
                end
                3:begin
                    an <= 8'b1111_0111;
                    digit = x[15:12];
                end
                4:begin
                    an <= 8'b1110_1111;
                    digit = x[19:16];
                end
                5:begin
                    an <= 8'b1101_1111;
                    digit = x[23:20];
                end
                6:begin
                    an <= 8'b1011_1111;
                    digit = x[27:24];
                end
                7:begin
                    an <= 8'b0111_1111;
                    digit = x[31:28];
                end
                default:begin
                    an <= 8'b1111_1111;
                    digit = 4'b0000;
                end
            endcase
        end
    always @(*) begin
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
        default: a_to_g = 7'b0000001; // 0
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