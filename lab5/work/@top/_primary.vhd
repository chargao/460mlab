library verilog;
use verilog.vl_types.all;
entity Top is
    port(
        clk             : in     vl_logic;
        PS2Clk          : in     vl_logic;
        PS2Data         : in     vl_logic;
        an0             : out    vl_logic;
        an1             : out    vl_logic;
        an2             : out    vl_logic;
        an3             : out    vl_logic;
        ca              : out    vl_logic;
        cb              : out    vl_logic;
        cc              : out    vl_logic;
        cd              : out    vl_logic;
        ce              : out    vl_logic;
        cf              : out    vl_logic;
        cg              : out    vl_logic
    );
end Top;
