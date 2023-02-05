library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package Constants is

	-- ===========================================================================
	-- || Consts
	-- ===========================================================================
	constant PhyAddrWidth : integer := 24;
	constant AddrWidth : integer := 16;
	constant DataWidth : integer := 16;

	constant MMUIdxWidth : integer := 2;
	constant MMUSlots    : integer := 4;

	constant RAMSize : integer := 1048576; -- 1MB

	constant MaxInstructionLen : integer := 10; -- 10 bytes: 1 op + 3*3 args

	constant UopLen : integer := 13;
	constant UcodeHeadLen : integer := 3;
	constant UcodeTailLen : integer := 2;
	constant UcodeLen : integer := UcodeHeadLen + UcodeTailLen;
	
	constant ALUOpLen : integer := 5;

	-- ===========================================================================
	-- || Types
	-- ===========================================================================
	subtype TPhyAddr is std_logic_vector(PhyAddrWidth-1 downto 0);
	subtype TAddr is std_logic_vector(AddrWidth-1 downto 0);
	subtype TData is std_logic_vector(DataWidth-1 downto 0);
	subtype TByte is std_logic_vector(7 downto 0);

	subtype TInstBufferIdx is unsigned(4-1 downto 0);
	type TInstBuffer is array(0 to MaxInstructionLen) of TByte; -- allow 1 extra byte at the end

	subtype TUop is std_logic_vector(UopLen-1 downto 0);
	subtype TUcode is std_logic_vector(UcodeLen-1 downto 0);
	subtype TUcodeHead is std_logic_vector(UcodeHeadLen-1 downto 0);
	subtype TUcodeTail is std_logic_vector(UcodeTailLen-1 downto 0);

	-- ===========================================================================
	-- || Uops
	-- ===========================================================================
	constant UOP_NOP : TUcodeTail := "00";
	constant UOP_MOV : TUcodeTail := "01";
	constant UOP_CON : TUcodeTail := "10";
	constant UOP_MMU : TUcodeTail := "11";
	constant UOP_MEM_HEAD : TUcodeHead := "001";
	constant UOP_MEM_LOAD : TUcodeTail := "00";
	constant UOP_MEM_STORE : TUcodeTail := "01";
	constant UOP_ARG_HEAD : TUcodeHead := "010";
	constant UOP_ARG_PUT : TUcodeTail := "00";
	constant UOP_ARG_GET_0 : TUcodeTail := "01";
	constant UOP_ARG_GET_1 : TUcodeTail := "10";
	constant UOP_ARG_GET_2 : TUcodeTail := "11";
	constant UOP_ALU_HEAD : TUcodeHead := "011";
	constant UOP_ALU_ADD : TUcodeTail := "00";
	constant UOP_ALU_SUB : TUcodeTail := "01";
	constant UOP_ALU_AND : TUcodeTail := "10";
	constant UOP_ALU_OP_COPY : TUcodeTail := "11";
	constant UOP_CMP_HEAD : TUcodeHead := "100";
	constant UOP_CMP_UNSIGNED : TUcodeTail := "00";
	constant UOP_CMP_SIGNED : TUcodeTail := "01";
	constant UOP_JMP_HEAD : TUcodeHead := "101";
	constant UOP_JMP_ALWAYS : TUcodeTail := "00";
	constant UOP_JMP_COND_COPY : TUcodeTail := "01";
	constant UOP_BRK_HEAD : TUcodeHead := "111";

	constant REG_0 : integer := 0;
	constant REG_A : integer := 1;
	constant REG_B : integer := 2;
	constant REG_C : integer := 3;
	constant REG_D : integer := 4;
	constant REG_SP : integer := 5;
	constant REG_PC : integer := 6;
	constant REG_FL : integer := 7;
	constant REG_E : integer := 8;
	constant REG_F : integer := 9;
	constant REG_G : integer := 10;
	constant REG_H : integer := 11;
	constant REG_2 : integer := 12;

	constant FLAG_EQ : integer := 0;
	constant FLAG_NE : integer := 1;
	constant FLAG_LT : integer := 2;
	constant FLAG_LE : integer := 3;
	constant FLAG_GT : integer := 4;
	constant FLAG_GE : integer := 5;
	constant AluNumFLags : integer := 6;

	-- ===========================================================================
	-- || Instructions
	-- ===========================================================================
	constant OP_ADD    : integer := 0;
	constant OP_SUB    : integer := 1;
	constant OP_MUL    : integer := 2;
	constant OP_IMUL   : integer := 3;
	constant OP_DIV    : integer := 4;
	constant OP_IDIV   : integer := 5;
	constant OP_MOD    : integer := 6;
	constant OP_IMOD   : integer := 7;
	constant OP_SHR    : integer := 8;
	constant OP_ISHR   : integer := 9;
	constant OP_SHL    : integer := 10;
	constant OP_AND    : integer := 11;
	constant OP_OR     : integer := 12;
	constant OP_XOR    : integer := 13;
	constant OP_NEG    : integer := 14;
	constant OP_NOT    : integer := 15;
	constant OP_BOOL   : integer := 16;
	constant OP_INC    : integer := 17;
	constant OP_DEC    : integer := 18;
	constant OP_GETF   : integer := 19;
	constant OP_CMP    : integer := 20;
	constant OP_MMAP   : integer := 21;
	constant OP_JMP    : integer := 22;
	constant OP_CALL   : integer := 23;
	constant OP_MOV    : integer := 24;
	constant OP_BMOV   : integer := 25;
	constant OP_JEQ    : integer := 26;
	constant OP_JNE    : integer := 27;
	constant OP_JLT    : integer := 28;
	constant OP_JLE    : integer := 29;
	constant OP_JGT    : integer := 30;
	constant OP_JGE    : integer := 31;
	constant OP_ADD3   : integer := 32;
	constant OP_SUB3   : integer := 33;
	constant OP_MUL3   : integer := 34;
	constant OP_IMUL3  : integer := 35;
	constant OP_DIV3   : integer := 36;
	constant OP_IDIV3  : integer := 37;
	constant OP_MOD3   : integer := 38;
	constant OP_IMOD3  : integer := 39;
	constant OP_SHR3   : integer := 40;
	constant OP_ISHR3  : integer := 41;
	constant OP_SHL3   : integer := 42;
	constant OP_AND3   : integer := 43;
	constant OP_OR3    : integer := 44;
	constant OP_XOR3   : integer := 45;
	constant OP_NEG2   : integer := 46;
	constant OP_NOT2   : integer := 47;
	constant OP_BOOL2  : integer := 48;
	constant OP_INC2   : integer := 49;
	constant OP_DEC2   : integer := 50;
	constant OP_SETF   : integer := 51;
	constant OP_ICMP   : integer := 52;
	constant OP_UMAP   : integer := 53;
	constant OP_HALT   : integer := 54;
	constant OP_RET    : integer := 55;
	constant OP_PUSH   : integer := 56;
	constant OP_POP    : integer := 57;
	constant OP_JEQ3   : integer := 58;
	constant OP_JNE3   : integer := 59;
	constant OP_JLT3   : integer := 60;
	constant OP_JLE3   : integer := 61;
	constant OP_JGT3   : integer := 62;
	constant OP_JGE3   : integer := 63;


end Constants;

package body Constants is
end Constants;
