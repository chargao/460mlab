force clk 0 0ns, 1 1ns -repeat 2ns
force PS2Clk 0 0ns, 1 5ns
force PS2Data 0 0ns, 1 5ns
force keypress 22'hFF1E0 15ns
run 100ns
