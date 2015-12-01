module Complete_MIPS(clk, sw, btnL, btnR, an, seg); // A_Out, D_Out, 
/* Will need to be modified to add functionality */
input clk;
input btnL, btnR;
//input RST;
input [2:0] sw;
//output [6:0] A_Out;
//output [31:0] D_Out;
//output [7:0] led;
output [6:0] seg;
output [3:0] an;

wire CS, WE, slowCLK;
wire [6:0] ADDR;
wire [31:0] Mem_Bus;
wire [31:0] Reg1;
wire clk_1kHz;

//assign A_Out = ADDR;
//assign D_Out = Mem_Bus;

//Divider slowclk(clk,28'd18000000,slowCLK);
Divider clk_1k(clk,28'd50000,clk_1kHz);
MIPS CPU(clk, CS, WE, ADDR, Mem_Bus, sw, Reg1);
Memory MEM(CS, WE, clk, ADDR, Mem_Bus);
Four_Digit_7_seg_Display display(bits_16,clk_1kHz,an,seg);
endmodule

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
  $readmemh("PartB_test.asm",RAM);
end

assign Mem_Bus = ((CS == 1'b0) || (WE == 1'b1)) ? 32'bZ : data_out;

always @(negedge CLK) begin
  if((CS == 1'b1) && (WE == 1'b1))
  RAM[ADDR] <= Mem_Bus[31:0];
  data_out <= RAM[ADDR];
end
endmodule

module REG(CLK, RegW, DR, SR1, SR2, Reg_In, ReadReg1, ReadReg2, sw, Reg1);
input CLK;
input RegW;
input [2:0] sw;
input [4:0] DR;
input [4:0] SR1;
input [4:0] SR2;
input [31:0] Reg_In;
output reg [31:0] ReadReg1;
output reg [31:0] ReadReg2;
output [31:0] Reg1;
reg [31:0] REG [0:31];

initial begin
  ReadReg1 = 0;
  ReadReg2 = 0;
end

//assign reg1_lowbits = REG[1][7:0]; 

always @(posedge CLK) begin
	
	case(sw) begin
	3'b000 : REG[1] <= 32'd0;
	3'b001 : REG[1] <= 32'd1;
	3'b010 : REG[1] <= 32'd2;
	3'b011 : REG[1] <= 32'd3;
	3'b100 : REG[1] <= 32'd4;
	3'b101 : REG[1] <= 32'd5;
	3'b110 : REG[1] <= 32'd6;
		end
	endcase
	
  if(RegW == 1'b1)
    REG[DR] <= Reg_In[31:0];
  ReadReg1 <= REG[SR1];
  ReadReg2 <= REG[SR2];
end
endmodule
