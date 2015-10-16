module top (btnU,btnL,btnR,btnD,Sw0,Sw1,clk_100MHz,An0,An1,An2,An3,ca,cb,cc,cd,ce,cf,cg);
  input btnU,btnL,btnR,btnD,Sw0,Sw1,clk_100MHz;
  output An0,An1,An2,An3,ca,cb,cc,cd,ce,cf,cg;

wire clk_100Hz,clk_1Hz,clk_HalfHz,clk_db; // Clock wires
wire btnU_out,btnL_out,btnR_out,btnD_out; // Button wires
wire [15:0] BCD_Time;                     // BCD Time wire
wire En_7seg;                             // 7 Segment Enable



Controller Controller (clk_1Hz, btnU_out, btnL_out, btnR_out, btnD_out, Sw0, Sw1, BCD_Time);

Divider Clk_100Hz (clk_100Mhz, 28'd500000, clk_100Hz);
Divider Clk_1Hz (clk_100Mhz, 28'd50000000, clk_1Hz);
Divider Clk_HalfHz (clk_100Mhz, 28'd100000000, clk_HalfHz);
Divider Clk_Db (clk_100Mhz, 28'd1250000, clk_db);

Four_Digit_7_seg_Display seven (BCD_Time, clk_100Hz, En_7seg, an0, an1, an2, an3, ca, cb, cc, cd, ce, cf, cg);

Button_db_sp BtnU (btnU, clk_db, clk_100MHz, btnU_out);
Button_db_sp BtnL (btnL, clk_db, clk_100MHz, btnL_out);
Button_db_sp BtnR (btnR, clk_db, clk_100MHz, btnR_out);
Button_db_sp BtnD (btnD, clk_db, clk_100MHz, btnD_out);

flasher F1 (BCD_Time, clk_HalfHz, En_7seg);

endmodule