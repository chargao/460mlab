module BCD_Seven_Display (BCD, Seven);
input [3:0] BCD;
output [7:1] Seven; process (BCD);
reg [7:1] Seven;

always @(BCD) begin
	case (BCD)
	0000:	Seven = 7'b0111111; //0
	0001:	Seven = 7'b0000110; //1
	0010:	Seven = 7'b1011011; //2
	0011:	Seven = 7'b1001111; //3
	0100:	Seven = 7'b1100110; //4
	0101:	Seven = 7'b1101101; //5
	0110:	Seven = 7'b1111100; //6
	0111:	Seven = 7'b0000111; //7
	1000:	Seven = 7'b1111111; //8
	1001:	Seven = 7'b1100111; //9
	default:Seven = 7'bxxxxxxx; //doesn't matter
	endcase
end
endmodule
