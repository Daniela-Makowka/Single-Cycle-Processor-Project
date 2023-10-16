module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;
  
  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;
  
  // comment the two lines out below if you use a submodule to generate PC/NextPC
  reg [7:0] PC;
  wire MW;
  wire [7:0] NextPC;
  wire H;
  
  assign NextPC = H ? PC: PC + 8'd2;
  
  always @ (posedge CLK) begin
	if (RESET) begin
		PC <= 8'b0;
	end
	else begin
		PC <= NextPC;
	end
  end
 
  // ADD YOUR CODE BELOW THIS LINE
  //decoder
  wire [2:0] DR;
  wire [2:0] SA;
  wire [2:0] SB;
  wire LD;
  wire [5:0] IMM;
  wire MB;
  wire [2:0] FS; 
  wire MD;
  wire [2:0] BS;
  wire [7:0] OFF;
  wire HALT;
  
  wire [7:0] SEIMM;
  
  //ALU
  wire C;
  wire V;
  wire N;
  wire Z;
  
  
  //assign DataC = (Iin[15:12] == 4'b0010) ? Din: DataD;
  assign DataC = MD ? Din: DataD;
  
  
  assign SEIMM[5:0] = IMM[5:0];
  assign SEIMM[6] = IMM[5];
  assign SEIMM[7]= IMM[5];
  
  decoder d (
		.INST(Iin), 
		.DR(DR),
		.SA(SA),
		.SB(SB),
		.IMM(IMM),
		.MB(MB),
		.FS(FS),
		.MD(MD),
		.LD(LD),
		.MW(MW),
		.BS(BS),
		.OFF(OFF),
		.HALT(HALT)
  );
  
  
  RegisterFile f (
		.CLK(CLK),
		.RESET(RESET),
		.SA(SA),
		.SB(SB),
		.LD(LD),
		.DR(DR),
		.D_in(DataC),
		.DataA(DataA),
		.DataB(DataB)
	);
	  
 
  alu a (
		.A(DataA), 
		.B(MB ? SEIMM : DataB), //MB mux
		.OP(FS), 
		.Y(DataD), 
		.C(C), 
		.V(V), 
		.N(N), 
		.Z(Z)
  );
  
  HaltLogic h (
		.CLK(CLK),
		.HALT(HALT),
		.EN_L(EN_L),
		.H(H)
  );
 
	
  // ADD YOUR CODE ABOVE THIS LINE

endmodule
