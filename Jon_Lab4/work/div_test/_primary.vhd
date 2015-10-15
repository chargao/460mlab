library verilog;
use verilog.vl_types.all;
entity div_test is
    port(
        clk             : in     vl_logic;
        k               : in     vl_logic;
        \out\           : out    vl_logic
    );
end div_test;
