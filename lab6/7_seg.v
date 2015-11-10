module Four_Digit_7_seg_Display (bin_in,clk_100Hz,an,segs);
input [7:0] bin_in;
input clk_100Hz;
output reg [3:0] an;
output reg [6:0] segs;

reg digit_select;
reg [3:0] digit_to_display;

initial begin digit_select <= 0; end

always @(posedge clk_100Hz) begin
  digit_select <= ~digit_select; //"01" or "10" digit

  case (digit_select) // Choose which Anode and cathode set to activate. ACTIVE LOW!! 
  0: begin an <= 4'b1110; digit_to_display <= bin_in[3:0];  end
  1: begin an <= 4'b1101; digit_to_display <= bin_in[7:4];  end
  endcase
  
  an[3:2] = 2'b11; //disable top 2 anode digits
end // End Always block 1

always @(digit_to_display) begin
  case (digit_to_display) // Activate Cathodes per digit. ACTIVE LOW!!
  4'h0: segs = 7'b1000000; // 0
  4'h1: segs = 7'b1111001; // 1
  4'h2: segs = 7'b0100100; // 2
  4'h3: segs = 7'b0110000; // 3
  4'h4: segs = 7'b0011001; // 4
  4'h5: segs = 7'b0010010; // 5
  4'h6: segs = 7'b0000010; // 6
  4'h7: segs = 7'b1111000; // 7
  4'h8: segs = 7'b0000000; // 8
  4'h9: segs = 7'b0011000; // 9
  4'hA: segs = 7'b0001000; // A
  4'hB: segs = 7'b0000011; // b
  4'hC: segs = 7'b1000110; // C
  4'hD: segs = 7'b0100001; // d
  4'hE: segs = 7'b0000110; // E
  4'hF: segs = 7'b0001110; // F
  default:  segs = 7'b1111111;           
  endcase
end

endmodule
