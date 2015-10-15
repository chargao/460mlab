// BCD Adder
module BCD_adder(clk_100MHz,btnU,btnL,btnR,btnD,Sw0,Sw1,BCD_in,BCD_out);
  input clk_100MHz,btnU,btnD,btnL,btnR,Sw0,Sw1; // the adder runs off the system clock and takes 6 user inputs
  input [15:0] BCD_in;  // The adder takes in the BCD number from the decrementer
  output [15:0] BCD_out;  // The adder outputs the decremented time + any user inputs.

endmodule


// Decrementer
module Decrementer(BCD_in,BCD_out,En_7seg,clk_HalfHz);
  input [15:0] BCD_in;
  input clk_HalfHz;       // The Decrementer runs off a half second clk because this is where our 0.5 second
  output [15:0] BCD_out;  // flash rate will come from. There is an internal counter to cause decrement every
  output reg En_7seg;     // second instead of every .5 seconds
  
  reg counter;
  
  initial
    begin
      counter <= 0;
      En_7seg <= 1;
    end
    
  always @(posedge clk_HalfHz)
    begin
      
    // 7 Segment Flashing logic
      
      //En_7seg <= 1;             // Default is enable on (may not need this line)
      if (BCD_out <= 16'h0180)  // If 180 seconds or less, flash every second
        begin
          if (counter)
             En_7seg <= ~BCD_Out[0]; // Only enable on the Even numbers.
        end    
      else if (BCD_out == 0)    // If 0 seconds remain, flash every half second
        begin
          En_7seg <= ~En_7seg;  // flashs 7 segment every half second
        end
      else
        En_7seg <= 1;           // Default is En on
    
    // Decrement logic
    
    if (counter)
      begin
        // BCD <= BCD - 1; whatever logic needed goes here.
      end
    
    counter <= ~counter; // counter oscillates from 0 to 1 and back.
    
    /* It's worth noting here that we could have simplified the decrementer a ton without the 7 seg enable
       logic. But that would have required creating a "flasher" module which also took the 16bit BCD
       as input which seemed a bit wasteful and silly. Either way, we achieve our goal.
    */
    
    end    

endmodule