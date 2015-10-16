library verilog;
use verilog.vl_types.all;
entity flasher is
    port(
        BCD_in          : in     vl_logic_vector(15 downto 0);
        clk_HalfHz      : in     vl_logic;
        En_7seg         : out    vl_logic
    );
end flasher;
