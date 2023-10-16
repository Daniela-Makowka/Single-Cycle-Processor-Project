module RegisterFile(CLK,RESET,SA,SB,LD,DR,D_in,DataA,DataB);

	input CLK;
	input RESET;
	input [2:0] SA;
	input [2:0] SB;
	input LD;
	input [2:0] DR;
	input [7:0] D_in;

	output [7:0] DataA;
	output [7:0] DataB;

	reg [7:0] DataA;
	reg [7:0] DataB;

	reg [7:0] registers [0:7];
	

	always @(posedge CLK) begin
    if(RESET) begin
		registers[0] <= 0;
		registers[1] <= 0;
		registers[2] <= 0;
		registers[3] <= 0;
		registers[4] <= 0;
		registers[5] <= 0;
		registers[6] <= 0;
		registers[7] <= 0; 
	 end
	 else begin
		registers[0] <= registers[0];
		registers[1] <= registers[1];
		registers[2] <= registers[2];
		registers[3] <= registers[3];
		registers[4] <= registers[4];
		registers[5] <= registers[5];
		registers[6] <= registers[6];
		registers[7] <= registers[7]; 
	  end 
		if (LD == 1) begin
			registers[DR] <= D_in;
		end
		else begin 
			registers[DR] <= registers[DR];
		end 
	end
 
	always @(*) begin
		DataA <= registers[SA];
		DataB <= registers[SB];
	end

endmodule 