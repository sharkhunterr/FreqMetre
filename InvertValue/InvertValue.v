module InvertValue(In,Out);

parameter BUS_SIZE = 22;
parameter COEF_NUM = 10000;
parameter COEF_DEN = 1;

input[BUS_SIZE-1:0] In;
output[BUS_SIZE-1:0] Out;

reg[BUS_SIZE-1:0] Out;

always @(In)
begin
		Out <= 1*COEF_NUM / (In*COEF_DEN);
end

endmodule

