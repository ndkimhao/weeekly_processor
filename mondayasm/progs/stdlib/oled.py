from enum import Enum

from progs.stdlib.devices import OLED_IN, OLED_OUT, BIT_OLED_IN_SEND_READY, BIT_OLED_OUT_DC, FLAG_OLED_OUT_SEND_START, \
    BIT_OLED_OUT_SEND_START, BIT_OLED_OUT_VDD, BIT_OLED_OUT_RESET, BIT_OLED_OUT_VBAT
from progs.stdlib.printf import PRINTF
from progs.stdlib.timing import DELAY_MILLIS
from soeunasm import Loop, getb, call, If, M, Else
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

    # Send ChargePump1 command (h8D)
    call(send_oled_cmd, 0x8D)
    # Send ChargePump2 command (h14)
    call(send_oled_cmd, 0x14)
    # Send PreCharge1 command (hD9)
    call(send_oled_cmd, 0xD9)
    # Send PreCharge2 command (hF1)
    call(send_oled_cmd, 0xF1)

    # Turn VBAT on (active low), delay 100ms
    setb([D], BIT_OLED_OUT_VBAT, inplace=True)
    call(delay_10ms)

    # Send DispContrast1 command (h81)
    call(send_oled_cmd, 0x81)
    # Send DispContrast2 command (h0F)
    call(send_oled_cmd, 0x0F)
    # Send SetSegRemap command (hA0)
    call(send_oled_cmd, 0xA0)
    # Send SetScanDirection command (hC0)
    call(send_oled_cmd, 0xC0)
    # Send Set Lower Column Address command (hDA)
    call(send_oled_cmd, 0xDA)
    # Send Lower Column Address (h00)
    call(send_oled_cmd, 0x00)
    # Send Display On command (hAF)
    call(send_oled_cmd, 0xAF)


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
