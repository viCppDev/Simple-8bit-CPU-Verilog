// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.0 :| viCppDev			   :| 27/01/2021:| Register
// ============================================================================

module Register (input clk, input wire [7:0] dataIN, output wire [7:0] dataOUT, input wire sel);

	reg [7:0] register;
	assign dataOUT = register;
	
	always @(posedge(clk)) begin
		if(sel)
			register = dataIN;
	end

endmodule
