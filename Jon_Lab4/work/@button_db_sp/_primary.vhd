library verilog;
use verilog.vl_types.all;
entity Button_db_sp is
    port(
        k               : in     vl_logic;
        clk_db          : in     vl_logic;
        clk_100MHz      : in     vl_logic;
        \out\           : out    vl_logic
    );
end Button_db_sp;
