// ============================================================================
//   Ver  :| Author					:| Mod. Date :| Changes Made:
//   V1.1 :| Alexandra Du			:| 06/01/2016:| Added Verilog file
// ============================================================================


//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

`define ENABLE_ADC_CLOCK
`define ENABLE_CLOCK1
//`define ENABLE_CLOCK2
//`define ENABLE_SDRAM
`define ENABLE_HEX0
`define ENABLE_HEX1
`define ENABLE_HEX2
`define ENABLE_HEX3
`define ENABLE_HEX4
`define ENABLE_HEX5
`define ENABLE_KEY
`define ENABLE_LED
`define ENABLE_SW
/*`define ENABLE_VGA
`define ENABLE_ACCELEROMETER
`define ENABLE_ARDUINO*/
`define ENABLE_GPIO

module DE10_LITE_Golden_Top(

	//////////// ADC CLOCK: 3.3-V LVTTL //////////
`ifdef ENABLE_ADC_CLOCK
	input 		          		ADC_CLK_10,
`endif
	//////////// CLOCK 1: 3.3-V LVTTL //////////
`ifdef ENABLE_CLOCK1
	input 		          		MAX10_CLK1_50,
`endif
	//////////// CLOCK 2: 3.3-V LVTTL //////////
`ifdef ENABLE_CLOCK2
	input 		          		MAX10_CLK2_50,
`endif

	//////////// SDRAM: 3.3-V LVTTL //////////
`ifdef ENABLE_SDRAM
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,
`endif

	//////////// SEG7: 3.3-V LVTTL //////////
`ifdef ENABLE_HEX0
	output		     [7:0]		HEX0,
`endif
`ifdef ENABLE_HEX1
	output		     [7:0]		HEX1,
`endif
`ifdef ENABLE_HEX2
	output		     [7:0]		HEX2,
`endif
`ifdef ENABLE_HEX3
	output		     [7:0]		HEX3,
`endif
`ifdef ENABLE_HEX4
	output		     [7:0]		HEX4,
`endif
`ifdef ENABLE_HEX5
	output		     [7:0]		HEX5,
`endif

	//////////// KEY: 3.3 V SCHMITT TRIGGER //////////
`ifdef ENABLE_KEY
	input 		     [1:0]		KEY,
`endif

	//////////// LED: 3.3-V LVTTL //////////
`ifdef ENABLE_LED
	output		     [9:0]		LEDR,
`endif

	//////////// SW: 3.3-V LVTTL //////////
`ifdef ENABLE_SW
	input 		     [9:0]		SW,
`endif

	//////////// VGA: 3.3-V LVTTL //////////
`ifdef ENABLE_VGA
	output		     [3:0]		VGA_B,
	output		     [3:0]		VGA_G,
	output		          		VGA_HS,
	output		     [3:0]		VGA_R,
	output		          		VGA_VS,
`endif

	//////////// Accelerometer: 3.3-V LVTTL //////////
`ifdef ENABLE_ACCELEROMETER
	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO,
`endif

	//////////// Arduino: 3.3-V LVTTL //////////
`ifdef ENABLE_ARDUINO
	inout 		    [15:0]		ARDUINO_IO,
	inout 		          		ARDUINO_RESET_N,
`endif

	//////////// GPIO, GPIO connect to GPIO Default: 3.3-V LVTTL //////////
`ifdef ENABLE_GPIO
	inout 		    [35:0]		GPIO
`endif
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

	wire clk;
	reg [3:0]dig0;
	reg [3:0]dig1;
	reg [3:0]dig2;
	reg [3:0]dig3;
	reg [3:0]dig4;
	reg [3:0]dig5;

//=======================================================
//  Structural coding
//=======================================================
<<<<<<< HEAD

Prescaler #(.N(21)) pres(.clk_in(ADC_CLK_10), .clk_out(clk));

SevSegController ssc0(.dig(dig0),.dot(clk),.leds(HEX0));
SevSegController ssc1(.dig(dig1),.dot(clk),.leds(HEX1));
SevSegController ssc2(.dig(dig2),.dot(clk),.leds(HEX2));
SevSegController ssc3(.dig(dig3),.dot(clk),.leds(HEX3));
SevSegController ssc4(.dig(dig4),.dot(clk),.leds(HEX4));
SevSegController ssc5(.dig(dig5),.dot(clk),.leds(HEX5));

wire [7:0] counterA;

Counter countA(.clk(clk), .cnt(counterA));

assign counterA[3:0] = dig0;
assign counterA[7:4] = dig1;



=======
	//N=23
	Prescaler #(.N(1)) pres(.clk_in(ADC_CLK_10), .clk_out(clk));

	SevSegController ssc0(.dig(dig0),.dot(clk),.leds(HEX0));
	SevSegController ssc1(.dig(dig1),.dot(clk),.leds(HEX1));
	SevSegController ssc2(.dig(dig2),.dot(clk),.leds(HEX2));
	SevSegController ssc3(.dig(dig3),.dot(clk),.leds(HEX3));
	SevSegController ssc4(.dig(dig4),.dot(clk),.leds(HEX4));
	SevSegController ssc5(.dig(dig5),.dot(clk),.leds(HEX5));


	wire [7:0] opA;
	wire [7:0] opB;
	wire [7:0] res;
	wire sel;
	
	
	ALU aluA(.clk(clk), .opA(opA), .opB(opB), .sel(sel), .res(res));

	assign sel = KEY[0];
	
	assign opA[4:0] = SW[9:5];
	assign opB[4:0] = SW[4:0];
	
	always @(posedge(clk)) begin
		dig5 = opA[7:4];
		dig4 = opA[3:0];
		dig3 = opB[7:4];
		dig2 = opB[3:0];
	
		dig1 = res[7:4];
		dig0 = res[3:0];
	end
>>>>>>> feature/ALU

endmodule
