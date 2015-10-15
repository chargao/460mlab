library verilog;
use verilog.vl_types.all;
entity button_db_sp is
    port(
        k               : in     vl_logic;
        clk             : in     vl_logic;
        \out\           : out    vl_logic
    );
end button_db_sp;
