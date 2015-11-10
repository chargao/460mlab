module Four_Digit_7_seg_Display (bin_in,clk_100Hz,an,segs);
input [7:0] bin_in;
input clk_100Hz;
output reg [3:0] an;
output reg [6:0] segs;

reg Digit_Select;
reg [3:0] digit_to_Display;

initial begin Digit_Select <= 0; end

always @(posedge clk_100Hz) begin
  if(Digit_Select == 0) begin Digit_Select <= 1; end   // "10" digit
  else 			begin Digit_Select <= 0; end   // "01" digit

  case (Digit_Select) // Choose which Anode and cathode set to activate. ACTIVE LOW!! 
  0: begin an <= 4'b1110; digit_to_Display <= bin_in[3:0];  end
  1: begin an <= 4'b1101; digit_to_Display <= bin_in[7:4];  end
  endcase
  
  an[3:2] = 2'b11; //disable top 2 anode digits
end // End Always block 1

always @(digit_to_Display)begin
  case (digit_to_Display) // Activate Cathodes per digit. ACTIVE LOW!!
  4'b0000:  segs = 7'b1000000; // 0
  4'b0001:  segs = 7'b1111001; // 1
  4'b0010:  segs = 7'b0100100; // 2
  4'b0011:  segs = 7'b0110000; // 3
  4'b0100:  segs = 7'b0011001; // 4
  4'b0101:  segs = 7'b0010010; // 5
  4'b0110:  segs = 7'b0000010; // 6
  4'b0111:  segs = 7'b1111000; // 7
  4'b1000:  segs = 7'b0000000; // 8
  4'b1001:  segs = 7'b0011000; // 9
  4'hA:     segs = 7'b0001000; // A
  4'hB:     segs = 7'b0000011; // b
  4'hC:     segs = 7'b1000110; // C
  4'hD:     segs = 7'b0100001; // d
  4'hE:     segs = 7'b0000110; // E
  4'hF:     segs = 7'b0001110; // F
  default:  segs = 7'b1111111;           
  endcase
end

endmodule
