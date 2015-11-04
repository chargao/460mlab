module GameTop (clk,Hsync,Vsync,vgaRed,vgaGreen,vgaBlue);
input clk;
output Hsync,Vsync;
output [3:0] vgaRed,vgaGreen,vgaBlue;
wire pixelClk,snake;//,rdy;
wire [9:0] Xcoord,Ycoord;
//wire [7:0] keypress;


Divider div (clk,28'd2,pixelClk); //pixelClk = 25Mhz
VGA veegeeay (pixelClk,snake,Hsync,Vsync,vgaRed,vgaGreen,vgaBlue,Xcoord,Ycoord);

Game_Controller game(Xcoord,Ycoord,clk,snake);
//Game_Controller game(keypress,rdy,Xcoord,Ycoord,clk,snake);

//kb_scan kb (PS2Clk,PS2Data,keypress,rdy); 
endmodule
