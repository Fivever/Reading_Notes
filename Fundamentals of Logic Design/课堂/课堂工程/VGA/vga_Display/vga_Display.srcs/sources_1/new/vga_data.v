`include "vga_CONFIG.vh"
`include "color_CONFIG.vh"
`define VGA_VERTICAL_COLOR
//`define VGA_HORIZONTAL_COLOR

module vga_data( red, green, blue, vidon, hc, vc
    );
	 
	 input [9:0] hc, vc;
	 input vidon;
	 output [3:0] red, green, blue;
	 
	 reg [3:0] red, green, blue;
	 reg [10:0] lcd_xpos, lcd_ypos;
	 
	 // get the x and y coordinates of the display area
	 always @(*) begin
		if(vidon == 1) begin
		   lcd_xpos = hc - (`H_SYNC + `H_BACK);
		   lcd_ypos = vc - (`V_SYNC + `V_BACK);
		end
		else begin
		   lcd_xpos = 0;
			lcd_ypos = 0;
      end		
	 end
	 
	 `ifdef VGA_HORIZONTAL_COLOR
	 always @(*) begin		
			red = 0;
			green = 0;
			blue = 0;
			if(vidon == 1) begin
				if(lcd_ypos >= 0 && lcd_ypos < (`V_DISP >> 3) * 1) {red, green, blue} = `RED;
				else if(lcd_ypos >= (`V_DISP >> 3) * 1 && lcd_ypos < (`V_DISP >> 3) * 2) {red, green, blue} = `GREEN;
				else if(lcd_ypos >= (`V_DISP >> 3) * 2 && lcd_ypos < (`V_DISP >> 3) * 3) {red, green, blue} = `BLUE;
				else if(lcd_ypos >= (`V_DISP >> 3) * 3 && lcd_ypos < (`V_DISP >> 3) * 4) {red, green, blue} = `WHITE;
				else if(lcd_ypos >= (`V_DISP >> 3) * 4 && lcd_ypos < (`V_DISP >> 3) * 5) {red, green, blue} = `BLACK;
				else if(lcd_ypos >= (`V_DISP >> 3) * 5 && lcd_ypos < (`V_DISP >> 3) * 6) {red, green, blue} = `YELLOW;
				else if(lcd_ypos >= (`V_DISP >> 3) * 6 && lcd_ypos < (`V_DISP >> 3) * 7) {red, green, blue} = `CYAN;
				else if(lcd_ypos >= (`V_DISP >> 3) * 7 && lcd_ypos < (`V_DISP >> 3) * 8) {red, green, blue} = `ROYAL;
				else {red, green, blue} = `BLACK;
		   end
    end
	 `endif
	 
	 `ifdef VGA_VERTICAL_COLOR
	 always @(*) begin		
			red = 0;
			green = 0;
			blue = 0;
			if(vidon == 1) begin
				if(lcd_xpos >= 0 && lcd_xpos < (`H_DISP >> 3) * 1) {red, green, blue} = `RED;
				else if(lcd_xpos >= (`H_DISP >> 3) * 1 && lcd_xpos < (`H_DISP >> 3) * 2) {red, green, blue} = `GREEN;
				else if(lcd_xpos >= (`H_DISP >> 3) * 2 && lcd_xpos < (`H_DISP >> 3) * 3) {red, green, blue} = `BLUE;
				else if(lcd_xpos >= (`H_DISP >> 3) * 3 && lcd_xpos < (`H_DISP >> 3) * 4) {red, green, blue} = `WHITE;
				else if(lcd_xpos >= (`H_DISP >> 3) * 4 && lcd_xpos < (`H_DISP >> 3) * 5) {red, green, blue} = `BLACK;
				else if(lcd_xpos >= (`H_DISP >> 3) * 5 && lcd_xpos < (`H_DISP >> 3) * 6) {red, green, blue} = `YELLOW;
				else if(lcd_xpos >= (`H_DISP >> 3) * 6 && lcd_xpos < (`H_DISP >> 3) * 7) {red, green, blue} = `CYAN;
				else if(lcd_xpos >= (`H_DISP >> 3) * 7 && lcd_xpos < (`H_DISP >> 3) * 8) {red, green, blue} = `ROYAL;
				else {red, green, blue} = `BLACK;
		   end
    end
	 `endif
	 
endmodule