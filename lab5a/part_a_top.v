module PartATop (clk,PS2CLK,DATA,an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg);
input clk,PS2CLK,DATA;
output an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg;

wire [7:0] Hex8bit;

KeyboardController key (PS2CLK,DATA,Hex8bit);
Four_Digit_7_seg_Display sev (Hex8bit,clk,an0,an1,an2,an3,ca,cb,cc,cd,ce,cf,cg);

endmodule

