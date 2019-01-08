module vga_640x480_picture_top( hsync, vsync, red, green, blue, clk, rst_n
    );
	 
	 input clk, rst_n;
	 output hsync, vsync;
	 output [3:0] red, green, blue;
	 
	 wire clk25M, vidon;
	 wire [9:0] hc, vc;
	 wire [11:0] M;
	 wire [15:0] rom_addr16;
	 
	 clkdiv U1(.clk25M(clk25M), .clk(clk), .rst_n(rst_n));
	 vga_driver U2(.hsync(hsync), .vsync(vsync), .hc(hc), .vc(vc), .vidon(vidon), .clk(clk25M), .rst_n(rst_n));
	 vga_data U3(.rom_addr16(rom_addr16), .red(red), .green(green), .blue(blue), .vidon(vidon), .hc(hc), .vc(vc), .M(M));
	 picture_rom U4(.clka(clk25M), .addra(rom_addr16), .douta(M));


endmodule