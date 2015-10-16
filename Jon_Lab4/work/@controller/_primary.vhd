library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        clk_1Hz         : in     vl_logic;
        btnU            : in     vl_logic;
        btnL            : in     vl_logic;
        btnR            : in     vl_logic;
        btnD            : in     vl_logic;
        Sw0             : in     vl_logic;
        Sw1             : in     vl_logic;
        BCD_out         : out    vl_logic_vector(15 downto 0)
    );
end Controller;
