`define break_check keypress[8:1]
`define break_code keypress[19:12]

module Top(clk, PS2Clk, PS2Data, an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg);
  input clk, PS2Clk, PS2Data;
  output an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg;

  wire clk_1kHz; // clk for 7 seg
  wire clk_200ms; // clk for flashing LED
  wire [21:0] keypress;
  //reg LED0;
  
  reg [7:0] BCD_8bit; // BCD value for the seven seg to display

  assign an2 = 1'b1; // This turns off the two anodes on the 7 seg aren't using
  assign an3 = 1'b1; // This turns off the two anodes on the 7 seg aren't using

  always @(posedge PS2Clk)
  begin
    //LED0 <= 0;
    if (`break_check == 8'hF0) begin
    BCD_8bit <= `break_code; end
  end

Divider clk_7_seg (clk, 28'd100000, clk_1kHz);
Four_Digit_7_seg_Display Seg (BCD_8bit,clk_1kHz,an0,an1,ca,cb,cc,cd,ce,cf,cg);
kb_scan kb1 (PS2Clk, PS2Data, keypress);
Divider clk_led_flash (clk, 28'd20000000, clk_200ms);

endmodule