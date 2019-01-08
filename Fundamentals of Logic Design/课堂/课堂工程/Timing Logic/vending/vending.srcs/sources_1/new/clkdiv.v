module clkdiv( clk190, clk
    );
	 input clk;
	 output clk190;
	 
	 reg [18:0] counter;
	 
	 always @(posedge clk) begin
	    counter <= counter + 1;
	 end
	 
	 assign clk190 = counter[18]; //190Hz clock

endmodule