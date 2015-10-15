library verilog;
use verilog.vl_types.all;
entity Divider is
    port(
        clk100Mhz       : in     vl_logic;
        amount          : in     vl_logic_vector(27 downto 0);
        slowClk         : out    vl_logic
    );
end Divider;
