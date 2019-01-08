module vending( open, clk190, rst_n, coin
    );
	 
	 input clk190, rst_n;
	 input [1:0] coin;
	 output reg open;
	 
	 reg [1:0] money, current_state, next_state;
	 parameter [1:0] IDLE = 2'b00, S5 = 2'b01, S10 = 2'b11, S15 = 2'b10; //S5: 5·Ö; S10: 1½Ç; S15: 1½Ç5·Ö; 

    //insert coins
    always @(posedge clk190) begin
	    if(~rst_n) money <= 0;
		 else begin
		    if (coin[0]) money[0] <= 1'b1;
		    else money[0] <= 1'b0;
			 if (coin[1]) money[1] <= 1'b1;
		    else money[1] <= 1'b0;
		 end
	 end
	 
	 always @(posedge clk190) begin
	    if(~rst_n) current_state <= IDLE;
		 else current_state <= next_state;
	 end
	 
	 always @(*) begin
	    if(~rst_n) next_state = IDLE;
		 else begin
		    case(current_state)
			    IDLE : begin
				   if(money == 2'b01) next_state = S5;
					else if(money == 2'b10) next_state = S10;
					else next_state = IDLE;
				 end
				 S5 : begin
				   if(money == 2'b01) next_state = S10;
					else if(money == 2'b10) next_state = S15;
					else next_state = S5;
				 end
				 S10 : begin
				   if(money == 2'b01) next_state = S15;
					else if(money == 2'b10) next_state = S15;
					else next_state = S10;
				 end
				 S15 : begin
				   if(money == 2'b01) next_state = S5;
                    else if(money == 2'b10) next_state = S10;
                    else next_state = S15;
				 end
			 endcase
		 end
	 end
	 
	 always @(posedge clk190) begin
	    if(~rst_n) open <= 0;
		 else begin
		    case(current_state)
			    IDLE, S5, S10 : open <= 0;
				 S15 : open <= 1;
			 endcase
		 end
	 end

endmodule