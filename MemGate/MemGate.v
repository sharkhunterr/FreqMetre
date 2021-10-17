module MemGate(Gate,In,Out);

parameter BUS_SIZE = 22;

input Gate;
input[BUS_SIZE-1:0] In;

output[BUS_SIZE-1:0] Out;
reg[BUS_SIZE-1:0] Out;
reg[BUS_SIZE-1:0] Memoire;

always @(Gate)
begin
if(Gate == 1'b1)
	begin
		Memoire <= In;
	end
	else 
	begin
		Out <= Memoire;
	end
end
endmodule
