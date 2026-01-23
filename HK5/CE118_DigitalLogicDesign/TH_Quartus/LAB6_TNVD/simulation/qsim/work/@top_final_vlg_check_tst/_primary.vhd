library verilog;
use verilog.vl_types.all;
entity Top_final_vlg_check_tst is
    port(
        ALUControl      : in     vl_logic_vector(3 downto 0);
        ALUresu         : in     vl_logic_vector(31 downto 0);
        Dmem            : in     vl_logic_vector(31 downto 0);
        Reg1            : in     vl_logic_vector(31 downto 0);
        Reg2            : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Top_final_vlg_check_tst;
