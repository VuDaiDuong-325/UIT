library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        RegDST          : out    vl_logic;
        Op              : in     vl_logic_vector(5 downto 0);
        ALUSrc          : out    vl_logic;
        MemRead         : out    vl_logic;
        RegWrite        : out    vl_logic;
        MemtoReg        : out    vl_logic;
        MemWrite        : out    vl_logic;
        ALUControl      : out    vl_logic_vector(3 downto 0);
        funct           : in     vl_logic_vector(5 downto 0)
    );
end ControlUnit;
