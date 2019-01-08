module sel_4_1(OUT, en, sel, x
    );
	 
	 input [1:0] sel;
	 input [7:0] x;
	 input en;
	 output reg [1:0] OUT;
	 
	 always @(*) begin
	    if(~en) begin
		 // 4-to-1 multiplexer
		    case(sel)
			 2'b00 : OUT = x[1:0];
			 2'b01 : OUT = x[3:2];
			 2'b10 : OUT = x[5:4];
			 2'b11 : OUT = x[7:6];
			 endcase
		 end
		 else OUT = 2'b00;
	 end


endmodule