from soeunasm import M

DEV_BASE_ADDR = 0xFF00

###

UART_SEND = DEV_BASE_ADDR + 0x00
UART_RECV = DEV_BASE_ADDR + 0x02
UART_STATUS = DEV_BASE_ADDR + 0x04
PS2_READ = DEV_BASE_ADDR + 0x06
LED = DEV_BASE_ADDR + 0x0A
BTN_READ = DEV_BASE_ADDR + 0x0C
JMP_TARGET = DEV_BASE_ADDR + 0x1C

###

M_UART_SEND = M[UART_SEND]
M_UART_RECV = M[UART_RECV]
M_UART_STATUS = M[UART_STATUS]
M_PS2_READ = M[PS2_READ]
M_LED = M[LED]
M_BTN_READ = M[BTN_READ]
M_JMP_TARGET = M[JMP_TARGET]

###

FLAG_UART_RECV_VALID = 0x8000
FLAG_UART_RECV_EMPTY = 0x4000
FLAG_UART_RECV_FULL = 0x2000
MASK_UART_RECV_COUNT = 0x3F00

FLAG_UART_SEND_EMPTY = 0x0040
FLAG_UART_SEND_FULL = 0x0020
MASK_UART_SEND_COUNT = 0x003F
