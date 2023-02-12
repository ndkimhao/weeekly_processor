from mondayasm import *

# Caller save: H
# Callee save: A, B, C, D, SP, E, F, G
#   Arg passing: A -> H
#   Return: H (optionally B->G)

###

M_UART_SEND = M[0x3000]
M_UART_RECV = M[0x3002]
M_UART_STATUS = M[0x3004]

M_SPI_SEND = M[0x3006]
M_SPI_STATUS = M[0x3008]

M_LED = M[0x300A]
M_BTN_READ = M[0x300C]

M_PS2_READ = M[0x300E]

FLAG_UART_RECV_VALID = 0x8000
FLAG_UART_RECV_EMPTY = 0x4000
FLAG_UART_RECV_FULL = 0x2000
MASK_UART_RECV_COUNT = 0x3F00

FLAG_UART_SEND_EMPTY = 0x0040
FLAG_UART_SEND_FULL = 0x0020
MASK_UART_SEND_COUNT = 0x003F

###

UART_HW_BUFSZ = 16
UART_BUFSZ = 128
recv_buf = StaticVar('uart_recv_buf', UART_BUFSZ + 2)
send_buf = StaticVar('uart_send_buf', UART_BUFSZ + 2)
m_led_stt = M[StaticVar('led_status', 2)]


def send_data():
    stashed = PUSH(A, B, C)
    MOV(C, UART_HW_BUFSZ + 1)  # C tracks send queue size
    with Block() as for_a:
        MOV(B, [A])
        AND(B, 0x00FF)  # only use 1 byte
        JEQ(B, 0, for_a.end)  # if (*A == '\0') break;

        # check if send buffer is full
        with Block() as wait_send_ready:
            JLT(C, UART_HW_BUFSZ, wait_send_ready.end)  # have empty send slots
            MOV(C, M_UART_STATUS)
            AND(C, MASK_UART_SEND_COUNT)
            JMP(wait_send_ready.begin)

        MOV(M_UART_SEND, B)  # SEND UART
        INC(A)
        INC(C)
        JMP(for_a.begin)  # loop next character
    # end for_a
    POP(stashed)


def recv_command():
    stash = PUSH(A, C, D, G)
    MOV(A, 0)  # A / return value is the number of received chars
    with Block() as loop_recv:
        # check overflow buffer
        with Block() as overflow_err:
            # if (A >= UART_BUFSZ - 1) then, print overflow!
            JLT(A, UART_BUFSZ - 1, overflow_err.end)
            # print error
            MOV(G, A)
            MOV(A, ConstData('OVERFLOW\n'))
            CALL(send_data)
            MOV(A, G)
            JMP(loop_recv.end)

        # RECV UART
        MOV(C, M_UART_RECV)
        # check if data is valid
        AND(D, C, FLAG_UART_RECV_VALID)  # D = C & FLAG_UART_RECV_VALID
        JEQ(D, 0, loop_recv.start)  # if (D == 0) continue; -- invalid data
        AND(C, 0xFF)  # C now contains the valid received char

        # Echo back
        MOV(M_UART_SEND, C)

        # break at end line char
        JEQ(C, ord('\n'), loop_recv.end)

        # ignore \r characters
        JEQ(C, ord('\r'), loop_recv.start)

        # write result to recv buffer
        # the buffer has padding so over-write is okay
        MOV([recv_buf + A], C)
        INC(A)
        JMP(loop_recv.start)
    # loop_recv.end
    BMOV([A], 0)  # null terminate
    MOV(H, A)
    POP(stash)


# input: A => PTR string
# returns H => PTR first position == ' ' or '\0'
def split_command():
    stash = PUSH(C)
    MOV(H, A)
    with Block() as loop:
        BMOV(C, [H])
        # if (*H == ' ' || *H == '\0') break
        JEQ(C, ord(' '), loop.end)
        JEQ(C, ord('\0'), loop.end)
        # else
        INC(H)
        JMP(loop.begin)
    # end loop
    POP(stash)


# input: string 1: [A, B)
#        string 2: C (null-terminated)
# returns 1 if equals, 0 if not
def string_cmp():
    lb_ret = DeclAnonLabel()
    lb_end_a = DeclAnonLabel()

    stash = PUSH(A, B, C, F, G)
    MOV(H, 0)
    with Block() as loop:
        BMOV(F, [A])
        BMOV(G, [C])
        JEQ(A, B, lb_end_a)
        JEQ(G, 0, lb_ret)
        JNE(F, G, lb_ret)  # if(F != G) return 0
        INC(A)
        INC(C)
        JMP(loop.begin)
    # end loop

    # lb_end_a:   A == B
    EmitLabel(lb_end_a)
    JNE(G, 0, lb_ret)  # if (G != 0) return 0
    MOV(H, 1)

    # return
    EmitLabel(lb_ret)
    POP(stash)


def handle_ping():
    fn_stash = PUSH(A)
    MOV(A, ConstData("PONG\n"))
    CALL(send_data)
    POP(fn_stash)


# A => PTR string
def parse_command():
    fn_stash = PUSH(B, C)

    # Get first argument => command name
    CALL(split_command)

    # Check commands
    # A is start of string, got from caller
    MOV(B, H)  # H is the end of first chunk
    MOV(C, ConstData("PING"))
    CALL(string_cmp)
    with Block() as is_ping:
        JEQ(H, 0, is_ping.end)
        CALL(handle_ping)

    POP(fn_stash)


def led_activity():
    # M_LED is only writable, read always return 0
    INC(m_led_stt)
    MOV(M_LED, m_led_stt)


def start():
    # map device range
    MOV(A, 0xFD)
    MOV(B, 0)
    MMAP(0x3000, 0x3000, 2)

    # send hello
    MOV(A, ConstData('READY\n'))
    CALL(send_data)
    MOV(A, H)  # A = return result

    # wait for commands
    MOV(m_led_stt, 0x01)
    MOV(M_LED, m_led_stt)

    with Block() as while_true:
        # recv command
        CALL(recv_command)
        CALL(led_activity)

        # echo back
        # MOV(A, recv_buf)
        # ADD(B, recv_buf, H)  # H is the size of buffer got from recv_command
        # MOV([B], 0x000A)  # write \n\0
        # CALL(send_data)
        # CALL(led_activity)
        # MOV([B], 0x0000)  # write \0\0

        # parse command
        MOV(A, recv_buf)  # PTR start of command buffer
        CALL(parse_command)

        # loop
        JMP(while_true.begin)


if __name__ == '__main__':
    MOV(SP, 0x2000)
    CALL(start)
    HALT()

    CodeGen().compile().write('bootloader.hex').write_vhd('bootloader.vhd')
