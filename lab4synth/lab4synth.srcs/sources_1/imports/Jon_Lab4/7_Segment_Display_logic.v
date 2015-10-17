module Four_Digit_7_seg_Display (BCD_16bit,clk_100Hz,En_7seg,an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg);
  input [15:0] BCD_16bit;
  input clk_100Hz,En_7seg;
  output an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg;
  
  reg [1:0] Digit_Select;
  reg [3:0] Anode_Active;
  reg [3:0] BCD_to_Display;
  reg [6:0] Seven;
  
  // All the Outputs for the 7 segment display are assigned here.
  assign an0 = Anode_Active[0];
  assign an1 = Anode_Active[1];
  assign an2 = Anode_Active[2];
  assign an3 = Anode_Active[3];
  assign ca = Seven[0];
  assign cb = Seven[1];
  assign cc = Seven[2];
  assign cd = Seven[3];
  assign ce = Seven[4];
  assign cf = Seven[5];
  assign cg = Seven[6];
  
  initial
    begin
      Digit_Select <= 0;
    end
  
  always @(posedge clk_100Hz)
    begin
      
      if(Digit_Select <= 3) begin
        Digit_Select <= Digit_Select + 1; end   // Count up from 0 to 3.
      else begin
        Digit_Select <= 0; end   // Reset on 3.
    
      case (Digit_Select) // Choose which Anode and cathode set to activate. ACTIVE LOW!! 
          0 : begin
            Anode_Active <= 4'b1110;
            BCD_to_Display <= BCD_16bit[3:0];
            end
          1: begin
            Anode_Active <= 4'b1101;
            BCD_to_Display <= BCD_16bit[7:4];
            end         
          2: begin
            Anode_Active <= 4'b1011;
            BCD_to_Display <= BCD_16bit[11:8];
            end
          3: begin
            Anode_Active <= 4'b0111;
            BCD_to_Display <= BCD_16bit[15:12];
            end
            
        endcase
             
    end // End Always block 1
    
    always @(En_7seg,BCD_to_Display)
      begin 
        if(En_7seg) // This is the enable display signal.
          begin   
          case (BCD_to_Display)       // Activate Cathodes corresponding to the BCD.
                                      // THIS IS ACTIVE LOW!!
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
           
           default: Seven = 7'bxxxxxxx;
           
        endcase
        end
      
      else begin
        Seven = 7'b1111111; // If enable display == 0, display nothing on the 7 segment.
      end                   // This is useful for Flashing our 7 seg. 
        
        
    end // End Always block 2
  
endmodule