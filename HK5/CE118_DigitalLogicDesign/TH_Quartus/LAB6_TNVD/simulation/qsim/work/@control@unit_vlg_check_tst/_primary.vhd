library verilog;
use verilog.vl_types.all;
entity ControlUnit_vlg_check_tst is
    port(
        ALUControl      : in     vl_logic_vector(3 downto 0);
        ALUSrc          : in     vl_logic;
        MemRead         : in     vl_logic;
        MemtoReg        : in     vl_logic;
        MemWrite        : in     vl_logic;
        RegDST          : in     vl_logic;
        RegWrite        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ControlUnit_vlg_check_tst;
