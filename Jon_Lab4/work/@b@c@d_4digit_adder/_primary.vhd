library verilog;
use verilog.vl_types.all;
entity BCD_4digit_adder is
    port(
        BCD_Xin         : in     vl_logic_vector(15 downto 0);
        BCD_Yin         : in     vl_logic_vector(15 downto 0);
        BCD_out         : out    vl_logic_vector(15 downto 0);
        Cout            : out    vl_logic
    );
end BCD_4digit_adder;
