// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			   :| 28/01/2021:| 8bit Counter
// ============================================================================

module Counter (input clk, output wire [3:0] cnt);

	reg [3:0] register;
	
	assign cnt = register;
	
	always @(posedge(clk)) begin
		register = register + 1;
	end

endmodule