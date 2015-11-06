`define up 2'b10
`define dn 2'b01
`define le 2'b00
`define ri 2'b11

//module Game_Controller(keycode,newKeyStrobe,Xcoord,Ycoord,clk,snake);
module Game_Controller(Xcoord,Ycoord,clk,snake,BCD_8bit);
//input [7:0] keycode;
input [9:0] Xcoord,Ycoord;
input [7:0] BCD_8bit;
input clk;//,newKeyStrobe;
output reg [1:0] snake;
reg [9:0] snakeX [0:4];
reg [9:0] snakeY [0:4]; //top left of each block
reg [9:0] appleX;
reg [9:0] appleY;
reg [1:0] direction;
//reg [1:0] seg1;
reg [1:0] seg2;
reg [3:0] seg3;
reg [5:0] seg4;
reg [7:0] seg5;
reg [7:0] prev_key_in;
reg [27:0] game_speed;
reg reset;
reg [1:0] state;
wire game_clk;
wire game_en = (state == 2'b01) ? 1 : 0 ;

initial begin 
    state <= 2'b00;
    snakeX[0] <= 10'd620; snakeY[0] <= 10'd240; 
    snakeX[1] <= 10'd630; snakeY[1] <= 10'd240; 
    snakeX[2] <= 10'd640; snakeY[2] <= 10'd240;
    snakeX[3] <= 10'd650; snakeY[3] <= 10'd240; 
    snakeX[4] <= 10'd660; snakeY[4] <= 10'd240;
    appleX <= 10'd50; appleY <= 10'd30;
    direction <= 2'b00;
    game_speed <= 28'd12500000;  
end

always @(posedge clk) begin 
    prev_key_in <= BCD_8bit;
    if (state == 2'b00) begin snake <= 2'b00; end
    else if(Xcoord >= snakeX[0] && Xcoord <= (snakeX[0] + 10'd9) && Ycoord >= snakeY[0] && Ycoord <= (snakeY[0] + 10'd9)) 
        begin snake <= 2'b01; end
    else if(Xcoord >= snakeX[1] && Xcoord <= (snakeX[1] + 10'd9) && Ycoord >= snakeY[1] && Ycoord <= (snakeY[1] + 10'd9)) 
        begin snake <= 2'b01; end
    else if(Xcoord >= snakeX[2] && Xcoord <= (snakeX[2] + 10'd9) && Ycoord >= snakeY[2] && Ycoord <= (snakeY[2] + 10'd9)) 
        begin snake <= 2'b01; end
    else if(Xcoord >= snakeX[3] && Xcoord <= (snakeX[3] + 10'd9) && Ycoord >= snakeY[3] && Ycoord <= (snakeY[3] + 10'd9)) 
        begin snake <= 2'b01; end
    else if(Xcoord >= snakeX[4] && Xcoord <= (snakeX[4] + 10'd9) && Ycoord >= snakeY[4] && Ycoord <= (snakeY[4] + 10'd9)) 
        begin snake <= 2'b01; end    
    else if (Xcoord >= appleX && Xcoord <= (appleX + 10'd9) && Ycoord >= appleY && Ycoord <= (appleY + 10'd9)) 
        begin snake <= 2'b10; end
    else begin snake <= 2'b00; end
    
    case (BCD_8bit)
    8'h6B : begin // Left Arrow
        if(direction != `ri) begin direction <= `le; end
    end
    8'h75 : begin // Up Arrow
        if(direction != `dn) begin direction <= `up; end
    end
    8'h74 : begin // Right Arrow
        if(direction != `le) begin direction <= `ri; end
    end
    8'h72 : begin // Down Arrow
        if(direction != `up) begin direction <= `dn; end
    end
    8'h4D : begin // Pause
        if(state == 2'b01) begin state <= 2'b10; end
    end
    8'h2D : begin // Resume  
        if(state == 2'b10) begin state <= 2'b01; end
    end
    8'h76 : begin state <= 2'b00; // ESC
    end
    8'h1B : begin // Start
        if (prev_key_in != 8'h1B) begin 
            reset <= 1'b1; 
            state <= 2'b01; 
            direction <= `le; 
            game_speed <= 28'd12500000; 
        end 
    end 
    8'h79 : begin game_speed <= 28'd6250000; end// Plus
    8'h7B : begin game_speed <= 28'd12500000; end// Minus
    default : direction <= direction;
    endcase
    
    if (reset == 1'b1) begin reset <= 1'b0; end
    
end //end system clock

always @(posedge game_clk, posedge reset) begin
    if(reset) begin // special reset
        seg2 <= 2'd0;
        seg3 <= 4'd0;
        seg4 <= 6'd0;
        seg5 <= 8'd0;
        snakeX[0] <= 10'd620; snakeY[0] <= 10'd240; 
        snakeX[1] <= 10'd630; snakeY[1] <= 10'd240; 
        snakeX[2] <= 10'd640; snakeY[2] <= 10'd240;
        snakeX[3] <= 10'd650; snakeY[3] <= 10'd240; 
        snakeX[4] <= 10'd660; snakeY[4] <= 10'd240;
    end
    
    else begin //normal gameplay
        seg2 <= direction;
        seg3 <= {seg3[1:0] , direction};
        seg4 <= {seg4[3:0] , direction};
        seg5 <= {seg5[5:0] , direction};

        if (snakeX[0] >= 10'd0 && snakeX[0]+10'd9 <10'd640 && snakeY[0] >= 10'd0 && snakeY[0]+10'd9 < 10'd480) begin
            if      (direction == `up) snakeY[0] <= snakeY[0] - 10'd10;
            else if (direction == `le) snakeX[0] <= snakeX[0] - 10'd10;
            else if (direction == `ri) snakeX[0] <= snakeX[0] + 10'd10;
            else if (direction == `dn) snakeY[0] <= snakeY[0] + 10'd10;

            if      (seg2[1:0] == `up) snakeY[1] <= snakeY[1] - 10'd10;
            else if (seg2[1:0] == `le) snakeX[1] <= snakeX[1] - 10'd10;
            else if (seg2[1:0] == `ri) snakeX[1] <= snakeX[1] + 10'd10;
            else if (seg2[1:0] == `dn) snakeY[1] <= snakeY[1] + 10'd10;

            if      (seg3[3:2] == `up) snakeY[2] <= snakeY[2] - 10'd10;
            else if (seg3[3:2] == `le) snakeX[2] <= snakeX[2] - 10'd10;
            else if (seg3[3:2] == `ri) snakeX[2] <= snakeX[2] + 10'd10;
            else if (seg3[3:2] == `dn) snakeY[2] <= snakeY[2] + 10'd10;

            if      (seg4[5:4] == `up) snakeY[3] <= snakeY[3] - 10'd10;
            else if (seg4[5:4] == `le) snakeX[3] <= snakeX[3] - 10'd10;
            else if (seg4[5:4] == `ri) snakeX[3] <= snakeX[3] + 10'd10;
            else if (seg4[5:4] == `dn) snakeY[3] <= snakeY[3] + 10'd10;

            if      (seg5[7:6] == `up) snakeY[4] <= snakeY[4] - 10'd10;
            else if (seg5[7:6] == `le) snakeX[4] <= snakeX[4] - 10'd10;
            else if (seg5[7:6] == `ri) snakeX[4] <= snakeX[4] + 10'd10;
            else if (seg5[7:6] == `dn) snakeY[4] <= snakeY[4] + 10'd10;
        end //end in range of display
    end //end S0
end //end game clock

Divider game_clk1(clk, game_speed, game_clk,game_en);

endmodule
