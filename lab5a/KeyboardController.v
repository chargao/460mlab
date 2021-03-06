module KeyboardController (PS2CLK,DATA,Hex8bit);
input PS2CLK;
input DATA;
output Hex8bit;

reg [4:0]  count;
reg [21:0] shift;
reg [8:0]  data;

initial begin count <= 21; end

always @(negedge PS2CLK) begin
	if (count != 0 ) begin 
		count <= 21;
		if (shift[8:1] == 8'hF0) begin 
			data <= shift[19:12];
		end
	end
	else begin 
		count <= count -1 ; 
		shift <= {DATA,shift[21:1]};
	end
end

assign Hex8bit = data;
endmodule
