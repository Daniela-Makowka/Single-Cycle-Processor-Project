module control(OP, BSEL, CISEL, OSEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP); // add other inputs and outputs here

	input [2:0] OP;

	output CISEL;
	output BSEL;
	output [1:0] OSEL;
	output SHIFT_LA;
	output SHIFT_LR;
	output LOGICAL_OP;
	
	reg CISEL;
	reg BSEL;
	reg [1:0] OSEL;
	reg SHIFT_LA;
	reg SHIFT_LR;
	reg LOGICAL_OP;

	
	always @(OP) begin 
		case (OP)
			3'b000: 
			begin
				CISEL <= 1'b0;
				BSEL <= 1'b0;
				OSEL <= 2'b00;
				SHIFT_LA <= 1'b0;
				SHIFT_LR <= 0;
				LOGICAL_OP <= 0;	
			end	
			3'b001: 
			begin
				CISEL <= 1'b1;
				BSEL <= 1'b1;
				OSEL <= 2'b00;
				SHIFT_LA <= 1'b0;
				SHIFT_LR <=0;
				LOGICAL_OP <= 0;	
			end	
			3'b010: 
			begin
				CISEL <= 1'b0;
				BSEL <= 1'b0;
				OSEL <= 2'b01;
				SHIFT_LA <= 1'b1;
				SHIFT_LR <=1;
				LOGICAL_OP <= 0;	
			end	
			3'b011: 
			begin
				CISEL <= 1'b0;
				BSEL <= 1'b0;
				OSEL <= 2'b01;
				SHIFT_LA <= 1'b0;
				SHIFT_LR <=1;
				LOGICAL_OP <= 0;
		   end		
			3'b100: 
			begin
				CISEL <= 1'b0;
				BSEL <= 1'b0;
				OSEL <= 2'b01;
				SHIFT_LA <= 1'b0;
				SHIFT_LR <=0;
				LOGICAL_OP <= 0;	
			end	
			3'b101: 
			begin
				CISEL <= 1'b0;
				BSEL <= 1'b0;
				OSEL <= 2'b10;
				SHIFT_LA <= 1'b0;
				SHIFT_LR <=0;
				LOGICAL_OP <= 1;
			end
			3'b110: 
			begin
				CISEL <= 1'b0; 
				BSEL <= 1'b0;
				OSEL <= 2'b10;
				SHIFT_LA <= 1'b0;
				SHIFT_LR <=0;
				LOGICAL_OP <= 0;	
			end	
			default:
			begin
				CISEL <= 1'b0; 
				BSEL <= 1'b0;
				OSEL <= 2'b00;
				SHIFT_LA <= 1'b0;
				SHIFT_LR <=0;
				LOGICAL_OP <= 0;		
			end
		endcase 
	end


// reg and internal variable definitions


// implement module here (add other control signals below)


endmodule
