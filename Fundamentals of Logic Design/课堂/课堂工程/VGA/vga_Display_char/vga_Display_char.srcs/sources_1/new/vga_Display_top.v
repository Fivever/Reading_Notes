module vga_Display_top( hsync, vsync, red, green, blue, clk, rst_n
    );
	 
	 input clk, rst_n;
	 output hsync, vsync;
	 output [3:0] red, green, blue;
	 
	 wire clk25M, vidon;
	 wire [9:0] hc, vc;
	 wire [8:0] addr;
	 wire [63:0] char_data;
	 
	 clkdiv U1(.clk(clk), .rst_n(rst_n), .clk25M(clk25M));   
	 vga_driver U2(.hsync(hsync), .vsync(vsync), .hc(hc), .vc(vc), .vidon(vidon), .clk(clk25M), .rst_n(rst_n));
	 vga_data U3(.red(red), .green(green), .blue(blue), .hc(hc), .vc(vc), .vidon(vidon), .addr(addr), .char_data(char_data));
	 char_rom U4(.clka(clk25M), .addra(addr), .douta(char_data));


endmodule