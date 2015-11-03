module kb_scan(PS2Clk, PS2Data, keypress);
  input PS2Clk, PS2Data;
  output reg [21:0] keypress;
  
  always @(negedge PS2Clk)
  begin
    keypress <= keypress >> 1;
    keypress[21] <= PS2Data;
  end
endmodule
  
  
