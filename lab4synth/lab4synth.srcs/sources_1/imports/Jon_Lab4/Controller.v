module Controller (clk_1Hz,btnU,btnL,btnR,btnD,Sw0,Sw1,BCD_out);
  input clk_1Hz,btnU,btnD,btnL,btnR,Sw0,Sw1; // the adder runs off the system clock and takes 6 user inputs
  output [15:0] BCD_out;  // The adder outputs the decremented time + any user inputs.
  
  reg [15:0] BCD_Time;
  wire [15:0] BCD_in;
  wire [15:0] BCD_0,BCD_30,BCD_120,BCD_180,BCD_300,BCD_out30,BCD_out120,BCD_out180,BCD_out300;
  wire Cout30,Cout120,Cout180,Cout300;
  
  //assign BCD_out = BCD_Time;
  
  initial
    begin
      BCD_Time <= 16'd0;
    end
    
  always @(posedge clk_1Hz, posedge btnU, posedge btnL, posedge btnR, posedge btnD, posedge Sw0, posedge Sw1)
    begin
      
      if(btnU)
        if (Cout30) BCD_Time <= 16'h9999;
        else BCD_Time <= BCD_out30;
      else if(btnL)
        if (Cout120) BCD_Time <= 16'h9999;
        else BCD_Time <= BCD_out120;
      else if(btnR)
        if (Cout180) BCD_Time <= 16'h9999;
        else BCD_Time <= BCD_out180;
      else if(btnD)
        if (Cout300) BCD_Time <= 16'h9999;
        else BCD_Time <= BCD_out300;
      else if(Sw0)
        BCD_Time <= 16'h0015;
      else if(Sw1)
        BCD_Time <= 16'h0185;
      else if (clk_1Hz)
        BCD_Time <= BCD_in;
    else ; //
    end
      
  
Decrementer Dec1 (BCD_Time, BCD_out, BCD_in);
      
BCD_4digit_adder BCD1(BCD_in,16'h0030,BCD_out30,Cout30);
BCD_4digit_adder BCD2(BCD_in,16'h0120,BCD_out120,Cout120);
BCD_4digit_adder BCD3(BCD_in,16'h0180,BCD_out180,Cout180);
BCD_4digit_adder BCD4(BCD_in,16'h0300,BCD_out300,Cout300);
      
endmodule