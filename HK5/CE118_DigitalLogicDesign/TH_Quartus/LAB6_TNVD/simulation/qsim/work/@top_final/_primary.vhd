library verilog;
use verilog.vl_types.all;
entity Top_final is
    port(
        ALUControl      : out    vl_logic_vector(3 downto 0);
        Instr           : in     vl_logic_vector(31 downto 0);
        ALUresu         : out    vl_logic_vector(31 downto 0);
        Reg1            : out    vl_logic_vector(31 downto 0);
        CLK             : in     vl_logic;
        Dmem            : out    vl_logic_vector(31 downto 0);
        Reg2            : out    vl_logic_vector(31 downto 0)
    );
end Top_final;
