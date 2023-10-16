module adder(A, B, CI, Y, C, V); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A;
  input [7:0] B;
  input CI;

  // outputs
  output [7:0] Y;
  output C;
  output V;
  
  reg V;
  
  wire [7:0] G;
  wire [7:0] P;
  wire [7:0] c;
  
  
  //compute carry out ith position
  
	assign G[0] = A[0] & B[0];
	assign G[1] = A[1] & B[1];
	assign G[2] = A[2] & B[2];
	assign G[3] = A[3] & B[3];
	assign G[4] = A[4] & B[4];
	assign G[5] = A[5] & B[5];
	assign G[6] = A[6] & B[6];
	assign G[7] = A[7] & B[7];
	
	assign P[0] = A[0] | B[0];
	assign P[1] = A[1] | B[1];
	assign P[2] = A[2] | B[2];
	assign P[3] = A[3] | B[3];
	assign P[4] = A[4] | B[4];
	assign P[5] = A[5] | B[5];
	assign P[6] = A[6] | B[6];
	assign P[7] = A[7] | B[7];
	
	assign c[0] = G[0] | P[0] & CI;
	assign c[1] = G[1] | P[1] & c[0];
	assign c[2] = G[2] | P[2] & c[1];
	assign c[3] = G[3] | P[3] & c[2];
	assign c[4] = G[4] | P[4] & c[3];
	assign c[5] = G[5] | P[5] & c[4];
	assign c[6] = G[6] | P[6] & c[5];
	assign c[7] = G[7] | P[7] & c[6];
	
	//set carry out of MSB
	assign C = c[7];
	
	assign Y[0] = A[0]^B[0]^CI;
	assign Y[1] = A[1]^B[1]^c[0];
	assign Y[2] = A[2]^B[2]^c[1];
	assign Y[3] = A[3]^B[3]^c[2];
	assign Y[4] = A[4]^B[4]^c[3];
	assign Y[5] = A[5]^B[5]^c[4];
	assign Y[6] = A[6]^B[6]^c[5];
	assign Y[7] = A[7]^B[7]^c[6];
	
	
	//set V if overflow occurred
	always @ (c[6],c[7], Y[7]) begin 
		if (c[6] != c[7]) V<=1; else V<=0;
	end 
  
endmodule
