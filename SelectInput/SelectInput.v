module SelectInput(Sel,In1,In2,Out);

parameter BUS_SIZE=22;

input[BUS_SIZE-1:0] In1;
input[BUS_SIZE-1:0] In2;
input Sel;

output[BUS_SIZE-1:0] Out;

reg[BUS_SIZE-1:0] Out;

always @(Sel)
begin
	if(Sel==1'b1)
	begin
		Out <= In1;
	end
	else
	begin
		Out <= In2;
	end
end

endmodule
		