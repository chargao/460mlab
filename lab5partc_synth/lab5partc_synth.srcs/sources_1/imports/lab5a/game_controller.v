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
reg [9:0] snakeX [2:0];
reg [9:0] snakeY [2:0]; //top left of each block
reg [1:0] direction;
//reg []
wire game_clk;
integer i = 0;

initial begin 
    snakeX[0] <= 10'd20; snakeY[0] <= 10'd0; 
    snakeX[1] <= 10'd30; snakeY[1] <= 10'd0; 
    snakeX[2] <= 10'd40; snakeY[2] <= 10'd0; 
end

always @(posedge clk) begin 

    if(Xcoord >= snakeX[0] && Xcoord <= (snakeX[0] + 10'd9) && Ycoord >= snakeY[0] && Ycoord <= (snakeY[0] + 10'd9)) 
        begin snake <= 1'b1; end
    else if(Xcoord >= snakeX[1] && Xcoord <= (snakeX[1] + 10'd9) && Ycoord >= snakeY[1] && Ycoord <= (snakeY[1] + 10'd9)) 
        begin snake <= 1'b1; end
    else if(Xcoord >= snakeX[2] && Xcoord <= (snakeX[2] + 10'd9) && Ycoord >= snakeY[2] && Ycoord <= (snakeY[2] + 10'd9)) 
        begin snake <= 1'b1; end
    else begin snake <= 1'b0; end
		
end

always @(posedge game_clk) begin
    if (snakeX[0] >= 10'd0 && snakeX[0]+10'd9 <10'd640 && snakeY[0] >= 10'd0 && snakeY[0]+10'd9 <10'd480) //assumes X[0], Y[0] is head
    begin  
        snakeX[0] <= snakeX[0] + 10'd5;
        snakeY[0] <= snakeY[0] + 10'd5;
        
        snakeX[1] <= snakeX[1] + 10'd5;
        snakeY[1] <= snakeY[1] + 10'd5;
        
        snakeX[2] <= snakeX[2] + 10'd5;
        snakeY[2] <= snakeY[2] + 10'd5;
    end
end

Divider game_clk1(clk, 28'd50000000, game_clk);

endmodule
