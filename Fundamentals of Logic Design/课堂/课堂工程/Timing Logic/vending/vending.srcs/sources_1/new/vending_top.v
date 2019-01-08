module vending_top( open, clk, rst_n, cin
    );
	 
	 input clk, rst_n;
	 input [1:0] cin;
	 output open;
	 
	 wire clk190;
	 wire [1:0] coin;
	 
	 clkdiv U1(.clk190(clk190), .clk(clk));
	 clk_pluse U2(.coin(coin), .clk190(clk190), .rst_n(rst_n), .cin(cin));
	 vending U3(.open(open), .clk190(clk190), .rst_n(rst_n), .coin(coin));

endmodule