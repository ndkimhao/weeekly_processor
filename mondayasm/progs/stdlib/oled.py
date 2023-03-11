from enum import Enum

from progs.stdlib.devices import OLED_IN, OLED_OUT, BIT_OLED_IN_SEND_READY, BIT_OLED_OUT_DC, FLAG_OLED_OUT_SEND_START, \
    BIT_OLED_OUT_SEND_START, BIT_OLED_OUT_VDD, BIT_OLED_OUT_RESET, BIT_OLED_OUT_VBAT
from progs.stdlib.printf import PRINTF
from progs.stdlib.timing import DELAY_MILLIS
from soeunasm import Loop, getb, call, If, M, Else, ForRange, For, NUM_VAR_ARGS
from soeunasm.free_cmds import clrb, setb


class OledDc(Enum):
    COMMAND = 0
    DATA = 1


# data_or_command = Data (1) / Command (0)
def send_oled_data_or_cmd(data_or_command, value,
                          A, B):
    with Loop():
        B @= getb([OLED_IN], BIT_OLED_IN_SEND_READY)
        If(B != 0).then_break()

    B @= value & 0x00FF
    A @= M[OLED_OUT] & 0xFF00
    A |= B + FLAG_OLED_OUT_SEND_START
    with If(data_or_command == 0):
        A @= clrb(A, BIT_OLED_OUT_DC)
        Else()
        A @= setb(A, BIT_OLED_OUT_DC)
    ###

    M[OLED_OUT] @= A
    M[OLED_OUT] @= clrb(A, BIT_OLED_OUT_SEND_START)


def send_oled_cmd(value):
    call(send_oled_data_or_cmd, OledDc.COMMAND, value)


def send_oled_data(value):
    call(send_oled_data_or_cmd, OledDc.DATA, value)


def delay_1ms():
    DELAY_MILLIS(1)


def delay_10ms():
    DELAY_MILLIS(10)


def send_oled_cmd_sequence(num, VAR_ARGS,
                           A, B):
    A @= VAR_ARGS.addr()
    B @= num
    B @= B * 2 + A
    # PRINTF('num=%d A=%x B=%x\n', num, A, B)
    with For((), A < B, A @ (A + 2)):
        # PRINTF('send: %x\n', [A])
        call(send_oled_data_or_cmd, OledDc.COMMAND, [A])


def init_oled(D):
    D @= OLED_OUT
    M[D] @= 0

    # Turn VDD on (active low), delay 1ms
    setb([D], BIT_OLED_OUT_VDD, inplace=True)
    call(delay_1ms)

    # Send DisplayOff command (hAE)
    call(send_oled_cmd, 0xAE)

    # Turn RES on (active low), delay 1ms
    setb([D], BIT_OLED_OUT_RESET, inplace=True)
    call(delay_1ms)

    # Turn RES off (active low), delay 1ms
    clrb([D], BIT_OLED_OUT_RESET, inplace=True)
    call(delay_1ms)

    call(send_oled_cmd_sequence,
         NUM_VAR_ARGS,
         0x8D,  # ChargePump1 command
         0x14,  # ChargePump2 command
         0xD9,  # PreCharge1 command
         0xF1,  # PreCharge2 command
         )

    # Turn VBAT on (active low), delay 100ms
    setb([D], BIT_OLED_OUT_VBAT, inplace=True)
    call(delay_10ms)

    call(send_oled_cmd_sequence,
         NUM_VAR_ARGS,
         0x81,  # DispContrast1 command
         0x0F,  # DispContrast2 command
         0xA0,  # SetSegRemap command
         0xC0,  # SetScanDirection command
         0xDA, 0x00,  # COM Pins Hardware Configuration
         0xAF,  # Display On command
         0x20, 0x00,  # Set Memory Addressing Mode: Horizontal
         )

    call(clear_oled)


def deinit_oled(D):
    D @= OLED_OUT

    # Send Display Off command (hAE)
    call(send_oled_cmd, 0xAE)

    # Power off vbat, wait 100ms
    clrb([D], BIT_OLED_OUT_VBAT, inplace=True)
    call(delay_10ms)

    # Power off vdd
    clrb([D], BIT_OLED_OUT_VDD, inplace=True)

    # Reset all controls
    M[OLED_OUT] @= 0


def quick_deinit_oled():
    # Turn VDD on
    setb([OLED_OUT], BIT_OLED_OUT_VDD, inplace=True)
    # Send Display Off command (hAE)
    call(send_oled_cmd, 0xAE)
    # Turn off everything
    M[OLED_OUT] @= 0


def clear_oled(A):
    call(send_oled_cmd_sequence,
         NUM_VAR_ARGS,
         0x21, 0x00, 0x7F,  # Set Column Address Range: 0 to 127
         0x22, 0x00, 0x03,  # Set Page Address Range: 0 to 3
         )
    with ForRange(A, 0, 512):
        call(send_oled_data, 0x00)


# row = 0 - 1
# col = 0 - 8
def draw_char_oled(row, col, c):
    ...
