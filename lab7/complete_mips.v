module Complete_MIPS(clk, led, sw); // A_Out, D_Out, 
/* Will need to be modified to add functionality */
input clk;
//input RST;
input [1:0] sw;
//output [6:0] A_Out;
//output [31:0] D_Out;
output [7:0] led;

wire CS, WE, slowCLK;
wire [6:0] ADDR;
wire [31:0] Mem_Bus;

assign A_Out = ADDR;
assign D_Out = Mem_Bus;

Divider slowclk(clk,28'd33000000,slowCLK);
MIPS CPU(slowCLK, CS, WE, ADDR, Mem_Bus, led, sw);
Memory MEM(CS, WE, slowCLK, ADDR, Mem_Bus);
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
  $readmemh("PartA_test.asm",RAM);
end

assign Mem_Bus = ((CS == 1'b0) || (WE == 1'b1)) ? 32'bZ : data_out;

always @(negedge CLK) begin
  if((CS == 1'b1) && (WE == 1'b1))
  RAM[ADDR] <= Mem_Bus[31:0];
  data_out <= RAM[ADDR];
end
endmodule

module REG(CLK, RegW, DR, SR1, SR2, Reg_In, ReadReg1, ReadReg2, reg1_lowbits);
input CLK;
input RegW;
input [4:0] DR;
input [4:0] SR1;
input [4:0] SR2;
input [31:0] Reg_In;
output reg [31:0] ReadReg1;
output reg [31:0] ReadReg2;
output [7:0] reg1_lowbits;
reg [31:0] REG [0:31];

initial begin
  ReadReg1 = 0;
  ReadReg2 = 0;
end

assign reg1_lowbits = REG[1][7:0]; 

always @(posedge CLK) begin
  if(RegW == 1'b1)
    REG[DR] <= Reg_In[31:0];
  ReadReg1 <= REG[SR1];
  ReadReg2 <= REG[SR2];
end
endmodule
