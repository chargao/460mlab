module VGA (clk,snake,Hsync,Vsync,vgaRed,vgaGreen,vgaBlue,Xcoord,Ycoord);
input clk;
input [1:0] snake;
output reg Hsync,Vsync;
output reg [3:0] vgaRed,vgaGreen,vgaBlue;
reg [9:0] Hcount,Vcount;
output reg [9:0] Xcoord,Ycoord; //interfaces with game controller

always @(posedge clk) begin

    Xcoord <= Hcount;
    Ycoord <= Vcount;

    //increment Hcount every pixel clock, increment Vcount every completed row
    if (Hcount < 10'd799) begin Hcount <= Hcount+10'd1; end
    else begin 
        Hcount <=10'd0; 
        if (Vcount < 10'd524) begin Vcount <= Vcount+10'd1; end
        else begin Vcount <= 10'd0; end
    end
    
    if (Hcount >= 10'd659 && Hcount < 10'd755) begin Hsync <= 1'd0; end
    else begin Hsync <= 1'd1; end
    
    if (Vcount >= 10'd493 && Vcount < 10'd494) begin Vsync <= 1'd0; end
    else begin Vsync <= 1'd1; end
    
    //detects if pixel marker is within the 640x480 display
    if (Hcount >= 10'd0 && Hcount < 10'd640 &&  Vcount >= 10'd0 && Vcount < 10'd480) begin 
        
        case (snake)
            2'b00: 	 {vgaRed,vgaGreen,vgaBlue} <= 12'h000;// 0 0 0 black  background
            2'b01: 	 {vgaRed,vgaGreen,vgaBlue} <= 12'hF00;// F 0 0 red    snake 
            2'b10:   {vgaRed,vgaGreen,vgaBlue} <= 12'h6F0;// 6 F 0 green  granny smith
            2'b11:   {vgaRed,vgaGreen,vgaBlue} <= 12'h888;// 8 8 8 gray   walls
            default: {vgaRed,vgaGreen,vgaBlue} <= 12'hFFF;// F F F white  ?!?!?!
        endcase
    end //end if within 640x480 display
    else begin {vgaRed,vgaGreen,vgaBlue} <= 12'h000; end // 0 0 0 black 

end 
endmodule
