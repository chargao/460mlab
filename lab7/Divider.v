module Divider(clk100Mhz,amount,slowClk);
input clk100Mhz; //fast clock and amount to countdown (this will allow us to instantiate different clks).
input [27:0] amount;
output reg slowClk; //slow clock
 
reg [27:0] counter;
 
initial begin counter = 0; slowClk = 0; end
  
always @ (posedge clk100Mhz) begin // begin always block
    if(counter == amount) begin counter <= 1; slowClk <= ~slowClk; end
    else begin counter <= counter + 1; end
end // end always block
endmodule
