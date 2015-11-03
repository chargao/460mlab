module Four_Digit_7_seg_Display (BCD_16bit,clk_100Hz,an0,an1,ca,cb,cc,cd,ce,cf,cg); //En_7seg,
  input [7:0] BCD_16bit;
  input clk_100Hz; //,En_7seg
  output an0,an1,ca,cb,cc,cd,ce,cf,cg;
  
  reg Digit_Select;
  reg [1:0] Anode_Active;
  reg [3:0] BCD_to_Display;
  reg [6:0] Seven;
  
  // All the Outputs for the 7 segment display are assigned here.
  assign an0 = Anode_Active[0];
  assign an1 = Anode_Active[1];
  //assign an2 = Anode_Active[2];
  //assign an3 = Anode_Active[3];
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
      
      if(Digit_Select == 0) begin
        Digit_Select <= 1; end   // Count up from 0 to 3.
      else begin
        Digit_Select <= 0; end   // Reset on 3.
    
      case (Digit_Select) // Choose which Anode and cathode set to activate. ACTIVE LOW!! 
          0 : begin
            Anode_Active <= 4'b10;
            BCD_to_Display <= BCD_16bit[3:0];
            
            end
          1: begin
            Anode_Active <= 4'b01;
            BCD_to_Display <= BCD_16bit[7:4];
            end         
          //2: begin
            //Anode_Active <= 4'b1011;
           // BCD_to_Display <= BCD_16bit[11:8];
           // end
        //  3: begin
          //  Anode_Active <= 4'b0111;
         //   BCD_to_Display <= BCD_16bit[15:12];
         //   end
            
        endcase
             
    end // End Always block 1
    
    always @(BCD_to_Display)
      begin  
          case (BCD_to_Display)       // Activate Cathodes corresponding to the BCD.
                                      // THIS IS ACTIVE LOW!!
           4'b0000:  Seven = 7'b1000000; // 0
           4'b0001:  Seven = 7'b1111001; // 1
           4'b0010:  Seven = 7'b0100100; // 2
           4'b0011:  Seven = 7'b0110000; // 3
           4'b0100:  Seven = 7'b0011001; // 4
           4'b0101:  Seven = 7'b0010010; // 5
           4'b0110:  Seven = 7'b0000010; // 6
           4'b0111:  Seven = 7'b1111000; // 7
           4'b1000:  Seven = 7'b0000000; // 8
           4'b1001:  Seven = 7'b0011000; // 9
           4'hA:     Seven = 7'b0001000; // A
           4'hB:     Seven = 7'b0000011; // b
           4'hC:     Seven = 7'b1000110; // C
           4'hD:     Seven = 7'b0100001; // d
           4'hE:     Seven = 7'b0000110; // E
           4'hF:     Seven = 7'b0001110; // F
           
           default: Seven = 7'bxxxxxxx;
           
        endcase
      end

endmodule
