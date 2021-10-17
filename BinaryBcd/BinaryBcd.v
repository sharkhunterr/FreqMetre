module BinaryBcd(bin,bcd);
parameter BUS_BIN = 22;
parameter BUS_BCD = 28;
integer i;
input[BUS_BIN-1:0] bin;
output[BUS_BCD-1:0] bcd;
reg[BUS_BCD-1:0] bcd;

//double dabble algorithme

always @(bin) begin
    bcd=0;		 	
    for (i=0;i<BUS_BIN;i=i+1)
	 begin					
      if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//Si le digit BCD >= 5, on ajoute 3
		if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
		if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
		if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
		if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 3;
		if (bcd[23:20] >= 5) bcd[23:20] = bcd[23:20] + 3;
		if (bcd[27:24] >= 5) bcd[27:24] = bcd[27:24] + 3;
		bcd = {bcd[BUS_BIN:0],bin[BUS_BIN-1-i]};				//Décalage d'un bit
    end
end
endmodule
