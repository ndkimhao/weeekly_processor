library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package Constants is

	constant PhyAddrWidth : integer := 24;
	constant AddrWidth : integer := 16;
	constant DataWidth : integer := 16;

	constant MMUIdxWidth : integer := 2;
	constant MMUSlots    : integer := 4;

	constant RAMSize : integer := 1048576; -- 1MB

	constant MaxInstructionLen : integer := 10; -- 10 bytes: 1 op + 3*3 args

	constant UopLen : integer := 14;

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
