`define break_check keypress[8:1]
`define break_code keypress[19:12]

module kb_readout(clk, PS2Clk, PS2Data,LED,an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg,BCD_8bit);
  input clk, PS2Clk, PS2Data;
  output LED,an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg;
  output reg [7:0] BCD_8bit; // BCD value for the seven seg to display

  wire clk_1kHz; // clk for 7 seg
  wire clk_200ms; // clk for flashing LED
  wire rdy;
  reg newkey;
  wire [21:0] keypress;
  reg En_7seg;
  reg [27:0] LED_count;
  reg single_pulse;
  
  wire ld = newkey & ~single_pulse;

  assign an2 = 1'b1; // This turns off the two anodes on the 7 seg aren't using
  assign an3 = 1'b1; // This turns off the two anodes on the 7 seg aren't using
  
  assign LED = (LED_count > 0) ? 1 : 0;
  
  initial
  begin
    En_7seg <= 0;
    newkey <= 0;
  end

  always @(posedge clk)
  begin
    
    newkey <= 0;
    
    if (rdy == 1 && `break_check == 8'hF0) begin
    BCD_8bit <= `break_code;
    newkey <= 1;
    single_pulse <= newkey;
    En_7seg <= 1; end
  end
  
  always @(posedge clk, posedge ld)
  begin
    if (ld)
      LED_count <= 28'd10000000;
    else if (LED_count > 0) begin
        LED_count <= LED_count - 1;
      end
  end
  

Divider clk_7_seg (clk, 28'd100000, clk_1kHz,1'd1);
Four_Digit_7_seg_Display Seg (BCD_8bit,clk_1kHz,En_7seg,an0,an1,ca,cb,cc,cd,ce,cf,cg);
kb_scan kb1 (clk,PS2Clk, PS2Data, keypress, rdy);

endmodule