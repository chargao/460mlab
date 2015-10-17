module div_test (clk,k,out);
  input clk,k;
  output out;
  
  wire slowclk;
  
  Button_db_sp btn1 (k,slowclk,out);
  Divider clk1(clk,28'd5,slowclk);
  
endmodule