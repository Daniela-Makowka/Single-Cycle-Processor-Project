module alu(A, B, OP, Y, C, V, N, Z);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  OP;

  output [7:0]  Y;
  output C;
  output V;
  output N;
  output Z;
  
  
  wire [7:0] Y_ADDER;
  wire [7:0] Y_SHIFTER;
  wire [7:0] Y_LOGICAL;
  wire [7:0] PARTIAL_LOGIC;
  wire [1:0] OSEL;
  wire BSEL;
  wire CISEL;
  wire SHIFT_LA;
  wire SHIFT_LR;
  wire LOGICAL_OP;

  wire C_PARTIAL_LOGIC;
  wire C_ADDER;
  wire C_SHIFTER;
  wire C_LOGICAL;
  
  wire V_ADDER;
  
  // ADD YOUR CODE BELOW THIS LINE

  
  adder a (
		.A(A),
		.B((BSEL == 1'b0) ? B: ~B),
		.CI((CISEL == 1'b0) ? 1'b0 : 1'b1),
		.Y(Y_ADDER),
		.C(C_ADDER),
		.V(V_ADDER)
  );
  
  shifter b (
		.A(A),
		.LA(SHIFT_LA), 
		.LR(SHIFT_LR), 
		.Y(Y_SHIFTER), 
		.C(C_SHIFTER) 
  );
  
  logical c (
		.A(A), 
		.B(B), 
		.OP(LOGICAL_OP), 
		.Y(Y_LOGICAL)

  );
  
  control d (
		.OP(OP),
		.BSEL(BSEL), 
		.CISEL(CISEL), 
		.OSEL(OSEL), 
		.SHIFT_LA(SHIFT_LA), 
		.SHIFT_LR(SHIFT_LR), 
		.LOGICAL_OP(LOGICAL_OP)
  );

  //if adding (OP = 000) -> keep B as is 

  assign PARTIAL_LOGIC = ((OSEL == 2'b00) ? Y_ADDER : Y_LOGICAL);
  assign Y = ((OSEL == 2'b01) ? Y_SHIFTER : PARTIAL_LOGIC);
  
  assign C_PARTIAL_LOGIC = ((OSEL == 2'b00) ? C_ADDER : 0);
  assign C = ((OSEL == 2'b01) ? C_SHIFTER : C_PARTIAL_LOGIC);
  
  assign V = ((OSEL == 2'b00) ? V_ADDER : 0);


  assign Z = (Y == 8'b0);
  assign N = (Y[7] == 1);
  
  // ADD YOUR CODE ABOVE THIS LINE

endmodule
