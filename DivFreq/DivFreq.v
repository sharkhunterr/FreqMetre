module DivFreq(ClkIn, ClkOut);


parameter NBT = 2;
parameter NBTON= 1;
parameter POLARITY = 1;
parameter BUS_SIZE = 1;

input ClkIn;
output ClkOut;
reg ClkOut;
reg[(BUS_SIZE-1):0] Cnt;

always @(negedge(ClkIn))
begin
	if(Cnt<NBT)
	begin
		Cnt<=Cnt+1;
	end
	else
	begin
		Cnt<=0;
	end
	if(Cnt<NBTON)
	begin
		ClkOut<=POLARITY;
	end
	else
	begin
		ClkOut<=~POLARITY;
	end
end

endmodule
