module CptXBits(Gate,ClkRef,Cpt);
parameter BUS_SIZE = 22;
parameter POLARITY = 1;

input Gate,ClkRef;

output[BUS_SIZE-1:0] Cpt;
reg[BUS_SIZE-1:0] iCpt;

always @(negedge(ClkRef))
begin
	if(Gate == 1'b0)
	begin
		iCpt<=0;
	end
	else
	begin
		iCpt<=Cpt+1;
	end
end


assign Cpt = (POLARITY==1)?iCpt:~iCpt;

endmodule
