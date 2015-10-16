`define x1 BCD_Xin[3:0]
`define x2 BCD_Xin[7:4]
`define x3 BCD_Xin[11:8]
`define x4 BCD_Xin[15:12]
`define y1 BCD_Yin[3:0]
`define y2 BCD_Yin[7:4]
`define y3 BCD_Yin[11:8]
`define y4 BCD_Yin[15:12]
`define z1 BCD_out[3:0]
`define z2 BCD_out[7:4]
`define z3 BCD_out[11:8]
`define z4 BCD_out[15:12]

 // Comb. BCD Adder
 
 module BCD_4digit_adder(BCD_Xin,BCD_Yin,BCD_out,Cout);
   input [15:0] BCD_Xin,BCD_Yin;
   output [15:0] BCD_out;
   output Cout;
   
   wire [4:0] s1,s2,s3,s4;
   wire c1,c2,c3;
   
   assign s1 = `x1 + `y1;
   assign `z1 = (s1 > 9) ? s1[3:0] + 6 : s1[3:0];
   assign c1 = (s1 > 9) ? 1'b1 : 1'b0;
   
   assign s2 = `x2 + `y2 + c1;
   assign `z2 = (s2 > 9) ? s2[3:0] + 6 : s2[3:0];
   assign c2 = (s2 > 9) ? 1'b1 : 1'b0;

   assign s3 = `x3 + `y3 + c2;
   assign `z3 = (s3 > 9) ? s3[3:0] + 6 : s3[3:0];
   assign c3 = (s3 > 9) ? 1'b1 : 1'b0;

   assign s4 = `x4 + `y4 + c3;
   assign `z4 = (s4 > 9) ? s4[3:0] + 6 : s4[3:0];
   assign Cout = (s4 > 9) ? 1'b1 : 1'b0;
   
 endmodule