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

	//N=23
	Prescaler #(.N(1)) pres(.clk_in(ADC_CLK_10), .clk_out(clk));

	SevSegController ssc0(.dig(dig0),.dot(clk),.leds(HEX0));
	SevSegController ssc1(.dig(dig1),.dot(clk),.leds(HEX1));
	SevSegController ssc2(.dig(dig2),.dot(clk),.leds(HEX2));
	SevSegController ssc3(.dig(dig3),.dot(clk),.leds(HEX3));
	SevSegController ssc4(.dig(dig4),.dot(clk),.leds(HEX4));
	SevSegController ssc5(.dig(dig5),.dot(clk),.leds(HEX5));
	
	
	wire [7:0] aluA;
	wire [7:0] aluB;
	wire [7:0] aluR;
	
	wire [7:0] ShiftO;
	
	wire [7:0] Rout;
	wire [7:0] Zin;
	wire [7:0] Yin;
	wire [7:0] Yout;
	wire [7:0] ABZ;
	
	wire [7:0] romO;	
	wire [7:0] ramO;
	wire [7:0] ramAddr;	
	wire [7:0] ramI;		

	reg [3:0] opCmd;
	reg [3:0] dataRaw;
	reg [3:0] data;
	
	wire [3:0] cnt;	
	
	wire [7:0] muxAO;
	wire [7:0] muxAIA;
	wire [7:0] muxAIB;
	
	wire [7:0] muxBO;
	wire [7:0] muxBIA;
	wire [7:0] muxBIB;
	
	wire [7:0] dexI;
	wire [7:0] dexOA;
	wire [7:0] dexOB;
	
	
	wire [7:0] debugFlagA;
	wire [7:0] debugFlagB;
	
	wire [11:0] cSignals;
	
	reg ucA;
	reg ucB;
	reg ucZ;
	reg ucY;
	reg ucR;
	reg ucALU;
	reg ucShfU;
	reg ucShfD;
	reg ucRam;
	reg ucMuxA;
	reg ucMuxB;
	reg ucDex;

	
	Register regA(.clk(clk), .dataIN(ABZ), .dataOUT(aluA), .sel(ucA));
	Register regB(.clk(clk), .dataIN(ABZ), .dataOUT(aluB), .sel(ucB));
	Register regR(.clk(clk), .dataIN(aluR), .dataOUT(Rout), .sel(ucR));
	Register regZ(.clk(clk), .dataIN(Zin), .dataOUT(ABZ), .sel(ucZ));
	Register regY(.clk(clk), .dataIN(Yin), .dataOUT(Yout), .sel(ucY));
	
	Shifter shft(.clk(clk), .dataIN(data),.dataOUT(ShiftO), .up(ucShfU), .down(ucShfD));
	
	Counter cont(.clk(KEY[0]), .cnt(cnt));
	ROMemory rom(.clk(clk), .data(romO), .addr(cnt));
	RAMemory ram(.clk(clk), .dataIN(ramI), .dataOUT(ramO), .addr(ramAddr), .sel(ucRam));
	
	ALU alu(.clk(clk), .opA(aluA), .opB(aluB), .sel(ucALU), .res(aluR));
	
	Multiplexor muxA(.dataINA(muxAIA), .dataINB(muxAIB), .dataOUT(muxAO), .sel(ucMuxA));
	Multiplexor muxB(.dataINA(muxBIA), .dataINB(muxBIB), .dataOUT(muxBO), .sel(ucMuxB));
	
	Demultiplexor Demux(.dataIN(dexI), .dataOUTA(dexOA), .dataOUTB(dexOB), .sel(ucDex));
	
	ControlUnit cuA(.clk(clk), .opCode(opCmd), .ctrlSignals(cSignals));
	
	//MUX A
	assign Zin = muxAO;	
	assign muxAIA = ShiftO;
	assign muxAIB = ramO; 
	//MUX B
	assign ramI = muxBO;
	assign muxBIA = Rout;
	//DEMUX
	assign dexI = ShiftO;
	assign Yin = dexOA;	
	//assign ramAddr = Yout; DEBUG
	assign muxBIB = dexOB;
	
	assign cSignals[0] = ucA;     
	assign cSignals[1] = ucB;
	assign cSignals[2] = ucZ;
	assign cSignals[3] = ucY;
	assign cSignals[4] = ucR;
	assign cSignals[5] = ucALU;  
	assign cSignals[6] = ucShfU; 
	assign cSignals[7] = ucShfD; 
	assign cSignals[8] = ucRam; 
	assign cSignals[9] = ucMuxA; 
	assign cSignals[10] = ucMuxB; 
	assign cSignals[11] = ucDex; 

	always opCmd = romO[7:4];
	always dataRaw = romO[3:0];
	
	
	
	
	
	
	// DEBUG		
	
	Multiplexor muxD(.dataINA(Yout), .dataINB(SW[7:0]), .dataOUT(ramAddr), .sel(SW[9]));
	
	always dig4 = ramO[3:0];
	always dig5 = ramO[7:4];
	
	always dig2 = ramAddr[3:0];
	always dig3 = ramAddr[7:4];
	
	
	assign LEDR[0] = ucA;
	assign LEDR[1] = ucB;
	assign LEDR[2] = ucY;
	assign LEDR[3] = ucR;
	//assign LEDR[4] = ucALU;	
	assign LEDR[4] = ucShfD;
	assign LEDR[5] = ucShfU;
	assign LEDR[6] = ucRam;
	assign LEDR[7] = ucMuxA;
	assign LEDR[8] = ucMuxB;
	assign LEDR[9] = ucDex;
	
	always opCmd = dig1;
	always dataRaw = dig0;
	//
	
	always @(posedge(clk)) data <= dataRaw;
	

	
	
	


endmodule
