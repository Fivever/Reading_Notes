`include "vga_CONFIG.vh"
module vga_data( rom_addr16, red, green, blue, vidon, hc, vc, M
    );
	 
	 input vidon;
	 input [9:0] hc, vc;
	 input [11:0] M;
	 output [15:0] rom_addr16;
	 output [3:0] red, green,blue;
	 
	 reg [3:0] red, green, blue;
	 
	 parameter hbp = `H_SYNC + `H_BACK;  //����ʾ���� = 96 + 48 = 144
	 parameter vbp = `V_SYNC + `V_BACK; //����ʾ���� = 2 + 33 = 35
	 parameter W = `IMG_WIDTH;
	 parameter H = `IMG_HEIGH;
	 
	 wire [10:0] xpix, ypix;
	 wire [16:0] rom_addr1, rom_addr2;
	 reg spriteon, R, G, B;
	 
	 assign ypix = vc - vbp;
	 assign xpix = hc - hbp;
	 assign rom_addr1 = {ypix, 7'b0000000} + {1'b0, ypix, 6'b000000} + {2'b00, ypix, 5'b00000} + {3'b000, ypix, 4'b0000}; //ypix * 240 = ypix * (128 + 64 + 32 + 16)
	 assign rom_addr2 = rom_addr1 + {8'b00000000, xpix};
	 assign rom_addr16 = rom_addr2[15:0];
	 
	 always @(*)
		begin
		
			if((hc >= hbp) && (hc < hbp + W) && (vc >=  vbp) && (vc < vbp + H))
				spriteon = 1;
			else
				spriteon = 0;
		
		end
		
	 always @(*)
		begin
		
			red = 0;
			green = 0;
			blue = 0;
			if((spriteon == 1) && (vidon == 1))
				begin
				
					red = M[11 : 8];
					green = M[7 : 4];
					blue = M[3 : 0];
				
				end
		
		end

endmodule