/****************
* COMPLETE MIPS *
*****************/
module Complete_MIPS(clk, sw, btnL, btnR, an, seg, reset);
input clk;
input reset;
input btnL, btnR;
input [2:0] sw;
output [6:0] seg;
output [3:0] an;

wire CS, WE, slowCLK;
wire [6:0] ADDR;
wire [31:0] Mem_Bus;
wire [15:0] Reg1;
wire clk_1kHz;
wire clk_blah;


Divider clk_quarter(clk,28'd4,clk_blah);
Divider clk_1k(clk,28'd50000,clk_1kHz);
MIPS CPU(clk_blah, CS, WE, ADDR, Mem_Bus, sw, reset, Reg1, btnL, btnR);
Memory MEM(CS, WE, clk_blah, ADDR, Mem_Bus);
Four_Digit_7_seg_Display display(Reg1,clk_1kHz,an,seg);
endmodule



/********
* MEMORY*
*********/
module Memory(CS, WE, CLK, ADDR, Mem_Bus);
input CS;
input WE;
input CLK;
input [6:0] ADDR;
inout [31:0] Mem_Bus;

reg [31:0] data_out;
reg [31:0] RAM [0:127];

initial begin
  /* Write your Verilog-Text IO code here */
  $readmemh("part_B.asm",RAM);
end

assign Mem_Bus = ((CS == 1'b0) || (WE == 1'b1)) ? 32'bZ : data_out;

always @(negedge CLK) begin
  if((CS == 1'b1) && (WE == 1'b1))
  RAM[ADDR] <= Mem_Bus[31:0];
  data_out <= RAM[ADDR];
end
endmodule



/***********
* REGISTER *
************/
module REG(CLK, RegW, DR, SR1, SR2, Reg_In, ReadReg1, ReadReg2, sw, DisplayReg, btnL, btnR);
input CLK;
input RegW;
input btnL,btnR;
input [2:0] sw;
input [4:0] DR;
input [4:0] SR1;
input [4:0] SR2;
input [31:0] Reg_In;
output reg [31:0] ReadReg1;
output reg [31:0] ReadReg2;
output reg [15:0] DisplayReg;
reg [31:0] REG [0:31];

integer i =0;

initial begin
  ReadReg1 = 0;
  ReadReg2 = 0;
  for (i = 0; i < 32; i = i+1)
	REG[i] = 32'd0;
end

always @* begin
  case ({btnL,btnR})
    2'b00 : DisplayReg = REG[2][15:0];
    2'b01 : DisplayReg = REG[2][31:16];
    2'b10 : DisplayReg = REG[3][15:0];
    2'b11 : DisplayReg = REG[3][31:16];
  endcase
end // always combinational

always @(posedge CLK) begin
	
	case(sw)
	3'b000 : REG[1] <= 32'd0;
	3'b001 : REG[1] <= 32'd1;
	3'b010 : REG[1] <= 32'd2;
	3'b011 : REG[1] <= 32'd3;
	3'b100 : REG[1] <= 32'd4;
	3'b101 : REG[1] <= 32'd5;
	3'b110 : REG[1] <= 32'd6;
	default : ;
	endcase
	
  if(RegW == 1'b1)
    REG[DR] <= Reg_In[31:0];
  ReadReg1 <= REG[SR1];
  ReadReg2 <= REG[SR2];
end
endmodule
