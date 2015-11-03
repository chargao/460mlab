library verilog;
use verilog.vl_types.all;
entity kb_scan is
    port(
        PS2Clk          : in     vl_logic;
        PS2Data         : in     vl_logic;
        keypress        : out    vl_logic_vector(21 downto 0)
    );
end kb_scan;
