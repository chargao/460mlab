library verilog;
use verilog.vl_types.all;
entity BCD_adder is
    port(
        clk_100MHz      : in     vl_logic;
        btnU            : in     vl_logic;
        btnL            : in     vl_logic;
        btnR            : in     vl_logic;
        btnD            : in     vl_logic;
        Sw0             : in     vl_logic;
        Sw1             : in     vl_logic;
        BCD_in          : in     vl_logic_vector(15 downto 0);
        BCD_out         : out    vl_logic_vector(15 downto 0)
    );
end BCD_adder;
