module kb_scan(clk, PS2Clk, PS2Data, keypress, rdy);
  input clk, PS2Clk, PS2Data;
  output reg [21:0] keypress;
  output rdy;
  
  reg [3:0] count;
  wire half_clk;
  
  wire done = (count == 0) ? 1 : 0;
  
  initial
  begin
    count <= 0;
  end
  
  always @(negedge PS2Clk)
  begin
    keypress <= keypress >> 1;
    keypress[21] <= PS2Data;
    
    if(count == 4'd0)
      begin
        count <= 4'd10;
      end
    else begin
      count <= count - 1;
    end
  
  end
  
  Divider div1(clk,28'd1,half_clk,1'd1);
  single_pulser sp1 (done, half_clk, rdy);
  
endmodule
  
  
