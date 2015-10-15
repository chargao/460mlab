// Verilog code to implement a button with Debouncing and Single Pulse generation

module Button_db_sp (k, clk_db, clk_100MHz, out);
  input k, clk_db,clk_100MHz;   // Note that clock is NOT the board clock, but a specified time to account for bounce.
  output out;     // We'll need a clk divider when we instantiate this module
  
  reg db,kd,sp;   // Three registers total, db and kd synchronize our button to the clock. Sp and comb logic implement
                  // our single pulser.
  initial
    begin
      db <= 0;
      kd <= 0;
      sp <= 0;
    end
  
  always @(posedge clk_db)  // Debouncer runs on it's OWN clk speed approx 1 - 50ms;
    begin
      db <= k;
      kd <= db;
    end
    
    always @(posedge clk_100MHz)   // Single Pulser needs to run on the SYSTEM clk.
      begin
        sp <= kd;
      end
    
  assign out = (~sp & kd);  // logic produces a single pulse even while the button is held down.
  
endmodule