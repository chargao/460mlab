module controller(clk, cs, we, address, data_in, data_out, mode, btns_db, swtchs, leds, segs, an);
  input clk;
  output cs;
  output we;
  output[6:0] address;
  input [7:0] data_in;
  output[7:0] data_out; 
  input [1:0] mode;
  input [1:0] btns_db;
  input [7:0] swtchs;
  output[7:0] leds;
  output[6:0] segs;
  output[3:0] an;


  //WRITE THE FUNCTION OF THE CONTROLLER

always @(posedge clk) begin

end
endmodule

