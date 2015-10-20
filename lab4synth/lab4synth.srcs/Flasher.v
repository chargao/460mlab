module flasher (BCD_in, clk_HalfHz, En_7seg);
  input clk_HalfHz;
  input [15:0] BCD_in;
  output reg En_7seg;
  
initial
  begin
    En_7seg = 1;
  end  
  
always @*
  begin
    if(BCD_in > 16'h0180)
      begin
        En_7seg = 1;
      end
    else if (BCD_in <= 16'h0180 && BCD_in > 0)
      begin
          En_7seg = BCD_in[0];
      end
    else
      begin
        En_7seg = clk_HalfHz;
      end
  end    
      
endmodule