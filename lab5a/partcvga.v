module VGA (clk,snake,Hsync,Vsync,vgaRed,vgaGreen,vgaBlue,Xcoord,Ycoord);
input clk;
input snake;
output reg Hsync,Vsync;
output reg [3:0] vgaRed,vgaGreen,vgaBlue;
reg [9:0] Hcount,Vcount;
output reg [9:0] Xcoord,Ycoord;

initial begin Hcount <=0; Vcount <=10'd492; end

always @(posedge clk) begin
if (Hcount < 10'd799) begin Hcount <= Hcount+1; end
else begin 
	Hcount <=0; 
	if (Vcount < 10'd524) begin 
		Vcount <= Vcount+1; end
	else begin Vcount <= 0; end
end

if (Hcount >= 10'd659 && Hcount < 10'd755) begin Hsync <= 0; end
else begin Hsync <= 1; end

if (Vcount >= 10'd493 && Vcount < 10'd494) begin Vsync <= 0; end
else begin Vsync <= 1; end

if (Hcount >= 10'd0 && Hcount < 10'd640 &&  Vcount >= 10'd0 && Vcount < 10'd480) begin //within display param
    Xcoord <= Hcount; Ycoord <= Vcount;
    case (snake)
        0: 	 {vgaRed,vgaGreen,vgaBlue} <= 12'h000;// 0 0 0 black  background
	1: 	 {vgaRed,vgaGreen,vgaBlue} <= 12'hF00;// F 0 0 red    snake 
        default: {vgaRed,vgaGreen,vgaBlue} <= 12'hFFF;// F F F white  ?!?!?!
    endcase
end
else begin {vgaRed,vgaGreen,vgaBlue} <= 12'h000; end // 0 0 0 black 


end 
endmodule
