library verilog;
use verilog.vl_types.all;
entity Top_final_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        Instr           : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end Top_final_vlg_sample_tst;
