module CalculFreq(In,FreqOut);
parameter BUS_SIZE = 22;
parameter COEF_NUM = 50000000;

input[21:0] In;
output[21:0] FreqOut;

reg[21:0] FreqOut;

always @(In)
begin
	FreqOut <= 1*COEF_NUM / (In);
end

endmodule

