module SelectOutput(Input,Out1,Out2);

input Input;

output Out1;
output Out2;

reg Out1;
reg Out2;

always @(Input)
begin
	if(Input == 1'b1)
	begin
		Out1 <= 1'b1;
		Out2 <= 1'b0;
	end
	else
	begin
		Out1 <= 1'b0;
		Out2 <= 1'b1;
	end
end

endmodule
