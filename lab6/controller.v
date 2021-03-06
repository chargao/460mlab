module controller(clk, cs, we, address, data_in, data_out, mode, btns_db, swtchs, leds, segs, an);
input clk;

input [7:0] data_in; //in from memory aka DVR
input [1:0] mode; //SW15,SW14
input [1:0] btns_db;//btnL,btnR
input [7:0] swtchs;//switch numerical input

output cs; //channel select
output reg we; //write enable
output[6:0] address; //mem addr aka DAR
output reg [7:0] data_out; //out to data bus 
output[7:0] leds; //address display
output[6:0] segs; //7seg value cathodes
output[3:0] an; //7seg value anodes

wire clk_500Hz; //for 7seg

reg [6:0] SPR,DAR;
reg [7:0] DVR,R0;
reg [3:0] state;

initial begin 
  state <= 4'h0;
  SPR <= 7'h7F;
  DAR <= 7'h00;
end

assign cs = 1'b1; //never changes
assign address = DAR;

//WRITE THE FUNCTION OF THE CONTROLLER
always @(posedge clk) begin
  we <= 1'b0;
  if (we == 1'b0) begin DVR <= data_in; end

  case (state)
  4'd00: begin
  end
  4'd01: begin
    data_out <= swtchs;	//push
    DAR <= SPR;
    we  <= 1;
    state <= 4'd02;
  end
  4'd02: begin
    SPR <= SPR - 1;
    DAR <= SPR + 1;
    state <= 4'd00;
  end
  4'd03: begin
    SPR <= SPR + 1;	//pop w/o read
    DAR <= SPR + 1;
    state <= 4'd00;
  end
  4'd04: begin
    DAR <= SPR + 1;	//add
    state <= 4'd05;
  end
  4'd05: begin
    R0 <= data_in;
    
  end
  4'd06: begin
  end
  4'd07: begin
  end
  4'd08: begin
  end
  4'd09: begin
  end
  4'd10: begin
  end
  4'd11: begin
  end
  4'd12: begin
  end
  4'd13: begin
  end
  4'd14: begin
  end
  4'd15: begin
  end
  endcase

  case({mode,btns_db})
  4'b0010: begin //pop 
    SPR <= SPR +1;
    DAR <= SPR +1;
  end
  4'b0001: begin //push
    we <= 1'b1;
    data_out <= swtchs;
    SPR <= SPR -1;
    DAR <= SPR +1;
  end
  4'b0110: begin //sub
  end
  4'b0101: begin //add
  end
  4'b1010: begin //clr/RST
    SPR <= 7'h7F;
    DAR <= 7'h00;
    data_out <= 8'h00;
    we <= 1'b1;
  end
  4'b1001: begin //top
    DAR <= SPR + 1;
  end
  4'b1110: begin //decrement
  end
  4'b1101: begin //increment
  end
  default: ; //do nothing
  endcase
end

Four_Digit_7_seg_Display two_digit (bin_in,clk_500Hz,an,segs);
Divider div100Hz (clk,28'd100000,clk_500Hz);
endmodule

