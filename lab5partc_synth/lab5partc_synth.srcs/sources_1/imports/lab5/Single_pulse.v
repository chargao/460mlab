module single_pulser (sig_in, clk_pulse_dur, sig_out);
  input sig_in, clk_pulse_dur;
  output sig_out;
  
  reg ff;
  
  assign sig_out = sig_in & ~ff;
  
  always @(posedge clk_pulse_dur)
  begin
    ff <= sig_in;
  end
  
endmodule
