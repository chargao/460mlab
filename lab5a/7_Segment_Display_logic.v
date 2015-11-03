module Four_Digit_7_seg_Display (Hex8bit,clk,an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg);
input [7:0] Hex8bit;
input clk;
output an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg;

reg Enable_7seg;
reg [1:0] Digit_Select;
reg [3:0] Anode_Active;
reg [3:0] BCD_to_Display;
reg [6:0] Seven;
  
// All the Outputs for the 7 segment display are assigned here.
assign {an3,an2,an1,an0} = Anode_Active;
assign {cg,cf,ce,cd,cc,cb,ca} = Seven;

initial begin Digit_Select <= 0; Enable_7seg <=1; end
  
always @(posedge clk) begin
	if(Digit_Select < 3) begin Digit_Select <= Digit_Select + 1; end   // Count up from 0 to 3.
	else begin Digit_Select <= 0; end   // Reset on 3.

	case (Digit_Select) // Choose which Anode and cathode set to activate. ACTIVE LOW!! 
          0 : begin
	    Enable_7seg <=1; 
            Anode_Active <= 4'b1110;
            BCD_to_Display <= Hex8bit[3:0];
            end
          1: begin
	    Enable_7seg <=1; 
            Anode_Active <= 4'b1101;
            BCD_to_Display <= Hex8bit[7:4];
            end         
          2: begin
	    Enable_7seg <=0; 
            Anode_Active <= 4'b1011;
            BCD_to_Display <= 4'bxxxx;
            end
          3: begin
	    Enable_7seg <=0; 
            Anode_Active <= 4'b0111;
            BCD_to_Display <= 4'bxxxx;
            end
        endcase
end // End Always block sequential
    
always @(BCD_to_Display) begin
	if(Enable_7seg) begin 		// This is the enable display signal.
	case (BCD_to_Display)		// Activate Cathodes corresponding to the BCD, ACTIVE LOW!!
           4'b0000:  Seven = 7'b1000000;
           4'b0001:  Seven = 7'b1111001;
           4'b0010:  Seven = 7'b0100100;
           4'b0011:  Seven = 7'b0110000;
           4'b0100:  Seven = 7'b0011001;
           4'b0101:  Seven = 7'b0010010;    
           4'b0110:  Seven = 7'b0000011;        
           4'b0111:  Seven = 7'b1111000;
           4'b1000:  Seven = 7'b0000000;
           4'b1001:  Seven = 7'b0011000;
           4'b1010:  Seven = 7'b0001000; // A
	   4'b1011:  Seven = 7'b0000011; // b
	   4'b1100:  Seven = 7'b1000110; // C
	   4'b1101:  Seven = 7'b0100001; // d
	   4'b1110:  Seven = 7'b0000110; // E
	   4'b1111:  Seven = 7'b0001000; // F
	endcase
	end      
	else begin Seven = 7'b1111111; end	// If enable display == 0, display nothing on the 7 segment. 
end // End Always block combinational
endmodule
