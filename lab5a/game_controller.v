`define up 2'b00
`define dn 2'b01
`define le 2'b10
`define ri 2'b11

//module Game_Controller(keycode,newKeyStrobe,Xcoord,Ycoord,clk,snake);
module Game_Controller(Xcoord,Ycoord,clk,snake);
//input [7:0] keycode;
input [9:0] Xcoord,Ycoord;
input clk;//,newKeyStrobe;
output reg snake;
reg [9:0] snakeX, snakeY [4:0]; //top left of each block
reg [1:0] direction;
integer i = 0;

initial begin 
	snakeX[0] <= 10'd100; snakeY[0] <= 10'd100;
	snakeX[1] <= 10'd90;  snakeY[1] <= 10'd100;
	snakeX[2] <= 10'd80;  snakeY[2] <= 10'd100;
	snakeX[3] <= 10'd70;  snakeY[3] <= 10'd100;
	snakeX[4] <= 10'd60;  snakeY[4] <= 10'd100;
end

always @(posedge clk) begin 
	for (i = 0; i < 5; i = i + 1) begin
		if(Xcoord >= snakeX[i] && Xcoord <= snakeX[i]+4 && Ycoord >= snakeY[i] && Ycoord >= snakeY[i]+4) 
		begin snake <= 1'b1; end
		else begin snake <= snake || 1'b0; end
	end
end
endmodule
