library verilog;
use verilog.vl_types.all;
entity Decrementer is
    port(
        BCD_in          : in     vl_logic_vector(15 downto 0);
        BCD_to_7seg     : out    vl_logic_vector(15 downto 0);
        BCD_to_adder    : out    vl_logic_vector(15 downto 0)
    );
end Decrementer;
