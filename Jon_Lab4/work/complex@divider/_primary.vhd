library verilog;
use verilog.vl_types.all;
entity complexDivider is
    port(
        clk100Mhz       : in     vl_logic;
        amount          : in     vl_logic;
        slowClk         : out    vl_logic
    );
end complexDivider;
