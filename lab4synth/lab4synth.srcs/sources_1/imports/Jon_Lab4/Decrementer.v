`define d1 BCD_in[3:0]
`define d2 BCD_in[7:4]
`define d3 BCD_in[11:8]
`define d4 BCD_in[15:12]

module Decrementer(BCD_in, BCD_to_7seg, BCD_to_adder);
  input [15:0] BCD_in;
  output [15:0] BCD_to_7seg, BCD_to_adder;
  
  reg[3:0] s1,s2,s3,s4;
  reg c1,c2,c3;
  
  assign BCD_to_7seg = BCD_in;
  assign BCD_to_adder = {s4,s3,s2,s1};
  
  always @*
    begin
      s1=0;s2=0;s3=0;s4=0;
      c1=0;c2=0;c3=0;
      if (BCD_in)
        begin     
          if (`d1 > 0)
            begin
              s1 = `d1 - 1;
              c1 = 0;
            end
          else
            begin
              s1 = 4'b1001;
              c1 = 1;
            end
          if (`d2 > 0)
            begin
              s2 = `d2 - c1;
              c2 = 0;                
            end
          else
            begin
              if(c1)
                begin
                  s2 = 4'b1001;
                  c2 = 1;
                end
              else
                begin
                  s2 = `d2;
                  c2 = 0;
                end
            end               
          if (`d3 > 0)
            begin
              s3 = `d3 - c2;
              c3 = 0;                
            end
          else
            begin
              if(c2)
                begin
                  s3 = 4'b1001;
                  c3 = 1;
                end
              else
                begin
                  s3 = `d3;
                  c3 = 0;
                end
            end      
          if (`d4 > 0)
            begin
              s4 = `d4 - c3;                
            end
          else
            begin
              if(c3)
                begin
                  s4 = 4'b1001;
                end
              else
                begin
                  s4 = `d4;
                end
            end        
        
        end
      else
        begin
          {s4,s3,s2,s1} = BCD_in;
        end
      
    end
endmodule