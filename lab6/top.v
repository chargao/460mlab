module top(clk, mode, btns, swtchs, leds, segs, an);
  input clk;
  input[1:0] mode;
  input[1:0] btns;
  input[7:0] swtchs;
  output[7:0] leds;
  output[6:0] segs;
  output[3:0] an;

  //might need to change some of these from wires to regs
  wire cs;
  wire we;
  wire[1:0] btns_db;
  wire[6:0] addr;
  wire[7:0] data_out_mem;
  wire[7:0] data_out_ctrl;
  wire[7:0] data_bus;

  // 1st driver of the data bus -- tri state switches on we and data_out_ctrl
  assign data_bus = (we) ? data_out_ctrl : 8'bzzzzzzzz;
  // 2nd driver of the data bus -- tri state switches on !we and data_out_mem
  assign data_bus = (!we) ? data_out_mem : 8'bzzzzzzzz; 
  
  controller ctrl(clk, cs, we, addr, data_bus, data_out_ctrl, mode,
    btns_db, swtchs, leds, segs, an);

  memory mem(clk, cs, we, addr, data_bus, data_out_mem);

  //add any other functions you need
  //(e.g. debouncing, multiplexing, clock-division, etc)
  Divider dbclk (clk,28'd250000,clk_db);
  Button_db_sp left (btns[1], clk_db, clk, btns_db[1]); //left
  Button_db_sp right(btns[0], clk_db, clk, btns_db[0]); //right
endmodule
