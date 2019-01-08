`include "vga_CONFIG.vh"
module vga_driver( hsync, vsync, hc, vc, vidon, clk, rst_n
    );
	 
	 input clk, rst_n;
	 output hsync, vsync, vidon; //hsync: horizontal synchronization signal; vsync: vertical synchronization signal
	 output [9:0] hc, vc; // hc: horizontal counter; vc: vertical counter
	 
	 reg hsync, vsync, vidon;
	 reg [9:0] hc, vc;
	 reg vsenable;
	 
	 always @(posedge clk or negedge rst_n)
		begin
		
			if(~rst_n) begin
				hc <= 0;
				vsenable <= 0;
			end
			else
				begin
				
					if(hc == `H_TOTAL - 1)
						begin
						
							hc <= 0;
							vsenable <= 1;
						
						end
					else
						begin
						
							hc <= hc + 1; // hc is used to record how many pixels has been scanned in one row of screen
							vsenable <= 0;
						end
				end
		
		end
		
	  // set horizontal synchronization signal according to hc counter	
	  always @(*)
		begin
		
			if(hc < `H_SYNC)
				hsync = 0;
			else
				hsync = 1;
		
		end
		
	  always @(posedge clk)
		begin
		
			if(~rst_n)
				vc <= 0;
			else
				begin
				
					if(vsenable == 1)
						begin
						
							if(vc == `V_TOTAL - 1)
								vc <= 0;
							else
								vc <= vc + 1;   // vc is used to record how many rows has been scanned in the screen						
						end
				
				end
		
		end
		
	  // set vertical synchronization signal according to vc counter
	  always @(*)
		begin
		
			if(vc < `V_SYNC)
				vsync = 0;
			else
				vsync = 1;
		
		end
		
	  // set the display area according to hc and vc counters
	  always @(*)
		begin
		
			if((hc < `H_SYNC + `H_BACK + `H_DISP) && (hc >= `H_SYNC + `H_BACK) && (vc < `V_SYNC + `V_BACK + `V_DISP) && (vc >= `V_SYNC + `V_BACK))
				vidon = 1;
			else
				vidon = 0;
		
	   end


endmodule