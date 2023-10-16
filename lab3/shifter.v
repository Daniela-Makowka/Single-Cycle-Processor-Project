module shifter(A, LA, LR, Y, C); // add all inputs and outputs inside parentheses

	input [7:0] A;
	input LA;
	input LR;
	
	output [7:0] Y;
	output C;
	
	
  // reg and internal variable definitions

	reg [7:0] Y;
	reg C;
	

  //when LR is 0, LA is ignored
 
 
  // implement module here
  
  always @(LR,LA,A) begin
		if (LR == 1) begin 
			if (LA==1) begin 
				Y[0] <= A[1];
				Y[1] <= A[2];
				Y[2] <= A[3];
				Y[3] <= A[4];
				Y[4] <= A[5]; 
				Y[5] <= A[6];
				Y[6] <= A[7];
				Y[7] <= A[7];
				end
			else begin
				Y[0] <= A[1];
				Y[1] <= A[2];
				Y[2] <= A[3];
				Y[3] <= A[4];
				Y[4] <= A[5]; 
				Y[5] <= A[6];
				Y[6] <= A[7];
				Y[7] <= 0;
			end
			C <= A[0];
		end
		else begin
			Y[0] <= 0;
			Y[1] <= A[0];
			Y[2] <= A[1];
			Y[3] <= A[2];
			Y[4] <= A[3]; 
			Y[5] <= A[4];
			Y[6] <= A[5];
			Y[7] <= A[6];
			C <= A[7];
		end 
	end 
	
	
	
endmodule
