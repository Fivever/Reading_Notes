`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/04 23:26:11
// Design Name: 
// Module Name: debounce
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


module debounce(btn_pluse, clk190, rstn, btn
);

    input clk190, rstn, btn;
    output btn_pluse;
    reg delay0, delay1, delay2;
    
    always @(posedge clk190) begin
        if (~rstn) {delay0, delay1, delay2} <= 3'b000;
        else begin
            delay0 <= btn;
            delay1 <= delay0;
            delay2 <= delay1;
        end
    end
    assign btn_pluse = delay0 & delay1 & (~delay2);

endmodule
