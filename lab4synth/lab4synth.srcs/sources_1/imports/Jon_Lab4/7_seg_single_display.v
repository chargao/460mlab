module bcd_seven (bcd, seven);
    input    [3:0] bcd;
    output  [7:1] seven;

    reg  [7:1] seven;

    always @(bcd)  begin    // ACTIVE LOW 7 SEGMENT
        case (bcd)
           0000:  seven = 7'b1000000;
           0001:  seven = 7'b1111001;
           0010:  seven = 7'b0100100;
           0011:  seven = 7'b0110000;
           0100:  seven = 7'b0011001;
           0101:  seven = 7'b0010010;    
           0110:  seven = 7'b0000011;        
           0111:  seven = 7'b1111000;
           1000:  seven = 7'b0000000;
           1001:  seven = 7'b0011000;
           
           default:  seven = 7'bxxxxxxx;
           
        endcase
        
    end
endmodule

