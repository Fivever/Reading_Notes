module Sobel_Calculation(clk25M, rst_n, result,
            matrix_p11, matrix_p12, matrix_p13, 
            matrix_p21,  matrix_p22,  matrix_p23, 
            matrix_p31,  matrix_p32,  matrix_p33
);

input clk25M, rst_n;
output reg [11:0] result;

input [3:0] matrix_p11,  matrix_p12,  matrix_p13, 
            matrix_p21,  matrix_p22,  matrix_p23, 
            matrix_p31,  matrix_p32,  matrix_p33;

//����ˮƽ�ݶȵ�ƽ��ֵ
reg [9:0] Gx_temp1;//����
reg [9:0] Gx_temp2;//����
reg [9:0] Gx_data;//ˮƽ�ݶ���ֵ
always @(posedge clk25M)
begin
      Gx_temp1 <= matrix_p13 + (matrix_p23 << 1) + matrix_p33;//����
      Gx_temp2 <= matrix_p11 + (matrix_p21 << 1) + matrix_p31;//����
      Gx_data <= (Gx_temp1 >= Gx_temp2) ? Gx_temp1 - Gx_temp2 : Gx_temp2 - Gx_temp1;
end

//���㴹ֱ�ݶȵľ���ֵ
reg   [9:0]   Gy_temp1;//����
reg   [9:0]   Gy_temp2;//����
reg   [9:0]   Gy_data;//��ֱ�ݶ���ֵ
always @(posedge clk25M)
begin
      Gy_temp1 <= matrix_p11 + (matrix_p12 << 1) + matrix_p13;//����
      Gy_temp2 <= matrix_p31 + (matrix_p32 << 1) + matrix_p33;//����
      Gy_data <= (Gy_temp1 >= Gy_temp2) ? Gy_temp1 - Gy_temp2 : Gy_temp2 - Gy_temp1;
end


//����ƽ���� = (Gx^2 + Gy^2)
reg [20:0] Gxy_square;
always @(posedge clk25M)
begin
      Gxy_square <= Gx_data * Gx_data + Gy_data * Gy_data;
end

always @(posedge clk25M)
begin
     if(Gxy_square>80) result<=12'hfff;//��ֵ����Ϊ80
     else result<=12'h000;
end

endmodule