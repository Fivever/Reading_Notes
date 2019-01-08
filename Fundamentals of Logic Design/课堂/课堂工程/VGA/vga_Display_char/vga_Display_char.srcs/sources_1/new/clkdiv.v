module clkdiv( clk25M, clk, rst_n
    );
	 
	 input clk, rst_n;
	 output clk25M;
	 
	 reg [1:0] counter;

	 always @(posedge clk or negedge rst_n) begin
	    if (~rst_n) counter <= 0;
		 else counter <= counter + 1;
	 end
	 
	 assign clk25M = counter[1];

endmodule