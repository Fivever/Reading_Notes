`include "vga_CONFIG.vh"
`include "color_CONFIG.vh"
`include "pos_CONFIG.vh"
module vga_data( red, green, blue, vidon, hc, vc, addr, char_data
    );
	 
	 input [9:0] hc, vc;
	 input vidon;
	 input [63:0] char_data;
	 output [3:0] red, green, blue;
	 output [8:0] addr;
	 
	 reg [3:0] red, green, blue;
	 reg [10:0] lcd_xpos, lcd_ypos;
	 reg spriteon;
	 reg [8:0] addr;
	 
	 always @(*) begin
	   if(vidon == 1) begin
		   lcd_xpos = hc - (`H_SYNC + `H_BACK);
		   lcd_ypos = vc - (`V_SYNC + `V_BACK);
		end
		else begin
		   lcd_xpos = 0;
			lcd_ypos = 0;
      end
         // get the display area of characters		
		   spriteon = (lcd_xpos >= `CHAR_XPOS && lcd_xpos < (`CHAR_XPOS + `CHAR_WIDTH)) && (lcd_ypos >= `CHAR_YPOS && lcd_ypos < (`CHAR_YPOS + `CHAR_DEPTH));
	      addr = lcd_xpos[8:0] - (`CHAR_XPOS - 1); // synchronize with character ROM, generate the address of ROM 1 cycles in advance
	 end

	 always @(*) begin
			{red, green, blue} = 0;
			if(vidon == 1) begin
			   {red, green, blue} = `YELLOW;
				if(spriteon == 1 && char_data[6'd63-lcd_ypos[5:0]] == 1'b1) {red, green, blue} = `BLUE;
			end
	 end
	 
endmodule
