module Aff7SegBcd(Byte,Aff);

parameter OUTPUT_POLARITY = 0; // '0' allume ou '1' allume

input [3:0] Byte;

output [6:0] Aff;
	
reg [6:0] iAff;

always @(Byte)
begin

	case (Byte[3:0])
		4'd0 : iAff[6:0] <= 7'b1111110;
		4'd1 : iAff[6:0] <= 7'b0110000;
		4'd2 : iAff[6:0] <= 7'b1101101;
		4'd3 : iAff[6:0] <= 7'b1111001;
		4'd4 : iAff[6:0] <= 7'b0110011;
		4'd5 : iAff[6:0] <= 7'b1011011;
		4'd6 : iAff[6:0] <= 7'b1011111;
		4'd7 : iAff[6:0] <= 7'b1110000;
		4'd8 : iAff[6:0] <= 7'b1111111;
		4'd9 : iAff[6:0] <= 7'b1111011;
	endcase
	
end

assign Aff = (OUTPUT_POLARITY==1)?iAff:~iAff;

endmodule
