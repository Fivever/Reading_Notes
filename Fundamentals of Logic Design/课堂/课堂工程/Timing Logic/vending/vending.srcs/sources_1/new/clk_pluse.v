module clk_pluse( coin, clk190, rst_n, cin
    );
	 
	 input clk190, rst_n;
	 input [1:0] cin;
	 output [1:0] coin;
	 
	 reg [1:0] delay0, delay1, delay2;

    always @(posedge clk190) begin
	    if(~rst_n) {delay0, delay1, delay2} <= 6'b000000;
		 else begin
		    delay0 <= cin;
          delay1 <= delay0;
          delay2 <= delay1;
		 end
	 end
	 
	 assign coin = delay0 & delay1 & ~delay2; //single clock pluse

endmodule