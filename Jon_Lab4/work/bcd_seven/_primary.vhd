library verilog;
use verilog.vl_types.all;
entity bcd_seven is
    port(
        bcd             : in     vl_logic_vector(3 downto 0);
        seven           : out    vl_logic_vector(7 downto 1)
    );
end bcd_seven;
