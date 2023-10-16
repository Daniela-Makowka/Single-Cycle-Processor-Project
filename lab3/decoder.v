module decoder(INST, DR, SA, SB, IMM, MB, FS, MD, LD, MW, BS, OFF, HALT);
	
	input [15:0] INST;

	output [2:0] DR;
	output [2:0] SA;
	output [2:0] SB;
	output [5:0] IMM;
	output MB; 
	output [2:0] FS;
	output MD;
	output LD;
	output MW;
	output [2:0] BS;
	output [7:0] OFF;
	output HALT;
	
	reg [2:0] DR;
	reg [2:0] SA;
	reg [2:0] SB;
	reg [5:0] IMM;
	reg MB; 
	reg [2:0] FS;
	reg MD;
	reg LD;
	reg MW;
	reg [2:0] BS;
	reg [7:0] OFF;
	reg HALT;
				
	
	wire [3:0] op;
	assign op = INST[15:12];
	
	localparam LB = 4'b0010,
				 SBcase = 4'b0100,
				 ADDI = 4'b0101,
				 ANDI = 4'b0110,
				 ORI = 4'b0111;

	always @ (*) begin
		if (op == 4'b0000) begin
			MW <= 0;
			FS <= INST[2:0];
			//don't care
			DR <= 3'b0;
			SA <= 3'b0;
			SB <= 3'b000;
			IMM <= 6'b0;
			MB <= 0;
			MD <= 0;
			LD <= 0;
			BS <= 3'b100;
			OFF <= 8'b0;		
			HALT <= (INST[2:0] == 3'b001);
		end
		else if (op == 4'b1111) begin
			MW <= 0;
			DR <= INST[5:3];
			SA <= INST[11:9];
			SB <= INST[8:6];
			IMM <= 6'b0;
			FS <= INST[2:0];
			BS <= 3'b100;
			OFF <= 8'b0;		
			HALT <= 1'b0;
			MB <= 0;
			MD <= 0;
			LD <= 1;
		end
		else begin
			case (op)
				LB:  
				begin
					MW <= 1'b0;
					DR <= INST[8:6];
					SA <= INST[11:9];
					SB <= 3'b0;
					IMM <= INST[5:0];
					FS <= 3'b000;
					BS <= 3'b100;
					OFF <= 8'b0;		
					HALT <= 1'b0;
					MB <= 1;
					MD <= 1;
					LD <= 1;
				end
				SBcase:
				begin
					MW <= 1;
					DR <= 3'b0; //
					SA <= INST[11:9];
					SB <= INST[8:6];
					IMM <= INST[5:0];
					FS <= 3'b000;
					BS <= 3'b100; 
					OFF <= 8'b0; //		
					HALT <= 1'b0; //
					MB <= 1;
					MD <= 0; //dc
					LD <= 0;
				end
				ADDI:
				begin
					MW <= 0;
					DR <= INST[8:6]; 
					SA <= INST[11:9];
					SB <= 3'b0; //
					IMM <= INST[5:0];
					FS <= 3'b000;
					BS <= 3'b100; 
					OFF <= 8'b0; //		
					HALT <= 1'b0; //
					MB <= 1;
					MD <= 0; 
					LD <= 1;
				end
				ANDI:
				begin
					MW <= 0;
					DR <= INST[8:6]; 
					SA <= INST[11:9];
					SB <= 3'b0; //
					IMM <= INST[5:0];
					FS <= 3'b101;
					BS <= 3'b100; 
					OFF <= 8'b0; //		
					HALT <= 1'b0; //
					MB <= 1;
					MD <= 0; 
					LD <= 1;
				end
				ORI:
				begin
					MW <= 0;
					DR <= INST[8:6]; 
					SA <= INST[11:9];
					SB <= 3'b0; //
					IMM <= INST[5:0];
					FS <= 3'b110;
					BS <= 3'b100; 
					OFF <= 8'b0; //		
					HALT <= 1'b0; //
					MB <= 1;
					MD <= 0; 
					LD <= 1;
				end
				default: //chose LB arbitrarily
				begin
					MW <= 0;
					DR <= INST[8:6];
					SA <= INST[11:9];
					SB <= 3'b0;
					IMM <= INST[5:0];
					FS <= 3'b0;
					BS <= 3'b100;
					OFF <= 8'b0;		
					HALT <= 1'b0;
					MB <= 1;
					MD <= 0;
					LD <= 1;
				end
			endcase
		end
	end
	

endmodule
