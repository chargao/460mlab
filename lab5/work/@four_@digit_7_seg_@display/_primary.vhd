library verilog;
use verilog.vl_types.all;
entity Four_Digit_7_seg_Display is
    port(
        BCD_16bit       : in     vl_logic_vector(7 downto 0);
        clk_100Hz       : in     vl_logic;
        an0             : out    vl_logic;
        an1             : out    vl_logic;
        ca              : out    vl_logic;
        cb              : out    vl_logic;
        cc              : out    vl_logic;
        cd              : out    vl_logic;
        ce              : out    vl_logic;
        cf              : out    vl_logic;
        cg              : out    vl_logic
    );
end Four_Digit_7_seg_Display;
