module Controller (clk,btnU,btnL,btnR,btnD,Sw0,Sw1,BCD_out);
  input clk,btnU,btnD,btnL,btnR,Sw0,Sw1; // the adder runs off the system clock and takes 6 user inputs
  output reg [15:0] BCD_out;  // The adder outputs the decremented time + any user inputs.
  reg [27:0] counter;
  
  //reg [15:0] BCD_Time;
  //reg [15:0] BCD_for_adder;
  wire [15:0] BCD_in;
  wire [15:0] BCD_out30,BCD_out120,BCD_out180,BCD_out300;
  wire Cout30,Cout120,Cout180,Cout300;
  //wire [15:0] BCD_to_Dec = BCD_Time;
  //wire [15:0] BCD_to_add = BCD_for_adder;
  
  //assign BCD_out = BCD_Time;
  
  initial
begin
    BCD_out <= 16'h0000;
    //BCD_Time <= 16'd0;
    //BCD_for_adder <= 16'd0;
end
    
always @(posedge clk)
begin
    if(counter == 28'd100000000) begin counter <= 1; end
    else begin counter <= counter + 1; end // end else
      
      
    
    if(btnU) begin
        if (Cout30) begin BCD_out <= 16'h9999; end
        else begin BCD_out <= BCD_out30; end      
    end
    else if(btnL) begin
        if(Cout120) BCD_out <= 16'h9999;
        else BCD_out <= BCD_out120;
    end
    else if(btnR) begin
        if(Cout180) BCD_out <= 16'h9999;
        else BCD_out <= BCD_out180;
    end
    else if(btnD) begin
        if(Cout300) BCD_out <= 16'h9999;
        else BCD_out <= BCD_out300;
    end
    else if(Sw0) BCD_out <= 16'h0015;
    else if(Sw1) BCD_out <= 16'h0185;
    else if(BCD_in != 16'h9999) begin
        if (counter == 1) begin BCD_out <= BCD_in; end
    end
end 

      
Decrementer Dec1 (BCD_out, BCD_in);
      
BCD_4digit_adder BCD1(BCD_out,16'h0030,BCD_out30,Cout30);
BCD_4digit_adder BCD2(BCD_out,16'h0120,BCD_out120,Cout120);
BCD_4digit_adder BCD3(BCD_out,16'h0180,BCD_out180,Cout180);
BCD_4digit_adder BCD4(BCD_out,16'h0300,BCD_out300,Cout300);
      
endmodule