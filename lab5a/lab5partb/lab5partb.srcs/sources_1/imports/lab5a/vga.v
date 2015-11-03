module VGA (clk,sw,Hsync,Vsync,vgaRed,vgaGreen,vgaBlue);
input clk;
input [7:0] sw;
output reg Hsync,Vsync;
output reg [3:0] vgaRed,vgaGreen,vgaBlue;
reg [9:0] Hcount,Vcount;

initial begin Hcount <=0; Vcount <=10'd492; end

always @(posedge clk) begin
if (Hcount < 10'd800) begin Hcount <= Hcount+1; end
else begin 
	Hcount <=0; 
	if (Vcount < 10'd524) begin 
		Vcount <= Vcount+1; end
	else begin Vcount <= 0; end
end

if (Hcount >= 10'd659 && Hcount <=10'd755) begin Hsync <= 0; end
else begin Hsync <= 1; end

//if (Vcount >= 10'd2 && Vcount <=10'd5) begin Vsync <= 0; end
if (Vcount >= 10'd493 && Vcount <=10'd494) begin Vsync <= 0; end
else begin Vsync <= 1; end

case (sw) 						  // R G B
	8'b00000001: {vgaRed,vgaGreen,vgaBlue} <= 12'h000;// 0 0 0
	8'b00000010: {vgaRed,vgaGreen,vgaBlue} <= 12'hF19;// F 1 9
	8'b00000100: {vgaRed,vgaGreen,vgaBlue} <= 12'h060;// 0 6 0
	8'b00001000: {vgaRed,vgaGreen,vgaBlue} <= 12'h00F;// 0 0 F
	8'b00010000: {vgaRed,vgaGreen,vgaBlue} <= 12'hF00;// F 0 0
	8'b00100000: {vgaRed,vgaGreen,vgaBlue} <= 12'hF80;// F 8 0
	8'b01000000: {vgaRed,vgaGreen,vgaBlue} <= 12'hFF0;// F F 0
	8'b10000000: {vgaRed,vgaGreen,vgaBlue} <= 12'hFFF;// F F F
	default:     {vgaRed,vgaGreen,vgaBlue} <= 12'hFFF;// F F F
endcase
end
 
endmodule
