library verilog;
use verilog.vl_types.all;
entity top is
    port(
        btnU            : in     vl_logic;
        btnL            : in     vl_logic;
        btnR            : in     vl_logic;
        btnD            : in     vl_logic;
        Sw0             : in     vl_logic;
        Sw1             : in     vl_logic;
        clk_100MHz      : in     vl_logic;
        An0             : out    vl_logic;
        An1             : out    vl_logic;
        An2             : out    vl_logic;
        An3             : out    vl_logic;
        ca              : out    vl_logic;
        cb              : out    vl_logic;
        cc              : out    vl_logic;
        cd              : out    vl_logic;
        ce              : out    vl_logic;
        cf              : out    vl_logic;
        cg              : out    vl_logic
    );
end top;
