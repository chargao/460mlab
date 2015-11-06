module GameTop (clk,Hsync,Vsync,vgaRed,vgaGreen,vgaBlue,PS2Clk, PS2Data,LED,an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg);
input clk;
output Hsync,Vsync;
input PS2Clk, PS2Data;
output LED,an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg;
output [3:0] vgaRed,vgaGreen,vgaBlue;
wire pixelClk;
wire [1:0] snake;
wire [9:0] Xcoord,Ycoord;
wire [7:0] BCD_8bit;
//wire [7:0] keypress;


Divider div (clk,28'd2,pixelClk,1'd1); //pixelClk = 25Mhz
VGA veegeeay (pixelClk,snake,Hsync,Vsync,vgaRed,vgaGreen,vgaBlue,Xcoord,Ycoord);

Game_Controller game(Xcoord,Ycoord,clk,snake,BCD_8bit);
kb_readout kb_one (clk, PS2Clk, PS2Data,LED,an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg,BCD_8bit);

endmodule
