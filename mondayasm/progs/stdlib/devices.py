from soeunasm import M

DEV_BASE_ADDR = 0xFF00

###

UART_SEND = DEV_BASE_ADDR + 0x00
UART_RECV = DEV_BASE_ADDR + 0x02
UART_STATUS = DEV_BASE_ADDR + 0x04
PS2_RECV = DEV_BASE_ADDR + 0x06
LED = DEV_BASE_ADDR + 0x0A
BTN_READ = DEV_BASE_ADDR + 0x0C

JMP_TARGET = DEV_BASE_ADDR + 0x1C
# SYSCALL_ENTRY = DEV_BASE_ADDR + 0x1E
SYSCALL_ENTRY = 0x100  # TODO: TEST ONLY

CLK_COUNT_0 = DEV_BASE_ADDR + 0x10
CLK_COUNT_1 = DEV_BASE_ADDR + 0x12
CLK_COUNT_2 = DEV_BASE_ADDR + 0x14
CLK_INSTRUCTIONS_0 = DEV_BASE_ADDR + 0x16
CLK_INSTRUCTIONS_1 = DEV_BASE_ADDR + 0x18
CLK_INSTRUCTIONS_2 = DEV_BASE_ADDR + 0x1A

###

M_UART_SEND = M[UART_SEND]
M_UART_RECV = M[UART_RECV]
M_UART_STATUS = M[UART_STATUS]
M_PS2_RECV = M[PS2_RECV]
M_LED = M[LED]
M_BTN_READ = M[BTN_READ]
M_JMP_TARGET = M[JMP_TARGET]

M_CLK_COUNT_0 = M[CLK_COUNT_0]
M_CLK_COUNT_1 = M[CLK_COUNT_1]
M_CLK_COUNT_2 = M[CLK_COUNT_2]
M_CLK_INSTRUCTIONS_0 = M[CLK_INSTRUCTIONS_0]
M_CLK_INSTRUCTIONS_1 = M[CLK_INSTRUCTIONS_1]
M_CLK_INSTRUCTIONS_2 = M[CLK_INSTRUCTIONS_2]

###

FLAG_UART_RECV_VALID = 0x8000
FLAG_UART_RECV_EMPTY = 0x4000
FLAG_UART_RECV_FULL = 0x2000
MASK_UART_RECV_COUNT = 0x3F00

FLAG_UART_SEND_EMPTY = 0x0040
FLAG_UART_SEND_FULL = 0x0020
MASK_UART_SEND_COUNT = 0x003F

FLAG_PS2_RECV_VALID = 0x8000
