module HaltLogic(CLK, HALT, EN_L, H);
	input CLK;
	input HALT;
	input EN_L;

	output H;

	reg prevEN_L;

	always @ (posedge CLK) begin
		prevEN_L <= EN_L;
	end
	
	wire continue;
	assign continue = prevEN_L & ~EN_L; //when EN_L transitions from 1 to 0, continue incrementing PC
	
	assign H = HALT & ~continue;

endmodule


