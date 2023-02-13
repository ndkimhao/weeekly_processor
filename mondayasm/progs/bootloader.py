from mondayasm import *

# Caller save: H
# Callee save: A, B, C, D, SP, E, F, G
#   Arg passing: A -> H
#   Return: H (optionally G, F, E)

###

DEV_ADDR = 0xFF00

M_UART_SEND = M[DEV_ADDR + 0x00]
M_UART_RECV = M[DEV_ADDR + 0x02]
M_UART_STATUS = M[DEV_ADDR + 0x04]

M_SPI_SEND = M[DEV_ADDR + 0x06]
M_SPI_STATUS = M[DEV_ADDR + 0x08]

M_LED = M[DEV_ADDR + 0x0A]
M_BTN_READ = M[DEV_ADDR + 0x0C]

M_PS2_READ = M[DEV_ADDR + 0x0E]

FLAG_UART_RECV_VALID = 0x8000
FLAG_UART_RECV_EMPTY = 0x4000
FLAG_UART_RECV_FULL = 0x2000
MASK_UART_RECV_COUNT = 0x3F00

FLAG_UART_SEND_EMPTY = 0x0040
FLAG_UART_SEND_FULL = 0x0020
MASK_UART_SEND_COUNT = 0x003F

###

UART_HW_BUFSZ = 16
UART_BUFSZ = 150
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
    stash = PUSH(A)
    MOV(A, ConstData("PONG\n"))
    CALL(send_data)
    MOV(H, 1)  # success
    POP(stash)


# input: A => PTR to 1-byte char
# output: H => value
#         G => is valid
def parse_hex_4():
    lb_ok = DeclAnonLabel()
    lb_fail = DeclAnonLabel()

    BMOV(H, [A])
    OR(H, 0b00100000)  # convert to lower case

    JLT(H, ord('0'), lb_fail)
    JGT(H, ord('f'), lb_fail)
    with Block() as chk:
        JLE(H, ord('9'), chk.end)
        JGE(H, ord('a'), chk.end)
        JMP(lb_fail)

    with Block() as if_le_9:
        JGT(H, ord('9'), if_le_9.end)
        SUB(H, ord('0'))
        JMP(lb_ok)
    # else
    SUB(H, ord('a') - 10)

    # lb_ok
    EmitLabel(lb_ok)
    MOV(G, 1)
    RET()  # EARLY RETURN

    # lb_fail:
    EmitLabel(lb_fail)
    MOV(G, 0)


# input: A => PTR to 4-byte string hex value
# output: H => value
#         G => is valid
def parse_hex_16():
    lb_ret = DeclAnonLabel()
    stash = PUSH(A, C)

    for i in range(4):
        CALL(parse_hex_4)
        JEQ(G, 0, lb_ret)  # passthrough G == 0
        SHL(C, 4)
        OR(C, H)
        INC(A)

    MOV(H, C)
    MOV(G, 1)
    EmitLabel(lb_ret)
    POP(stash)


# Input: A => PTR to string buffer (2 bytes, null-terminated)
#        B => value
# Output: none
def put_hex_4():
    lb_ret = DeclAnonLabel()
    MOV(H, B)
    with Block() as if_le_9:
        JGT(H, 9, if_le_9.end)
        ADD(H, ord('0'))
        JMP(lb_ret)
    # else
    ADD(H, ord('a') - 10)

    # lb_ret:
    EmitLabel(lb_ret)
    MOV([A], H)


# Input: A => PTR to string buffer (5 bytes, null-terminated)
#        B => value
# Output: none
def put_hex_16():
    stash = PUSH(A, B, C)
    MOV(C, B)
    for i in [3, 2, 1, 0]:
        SHR(B, C, i * 4)
        AND(B, 0xF)
        CALL(put_hex_4)
        INC(A)
    POP(stash)


# Input/output: A: PTR to string
# Output: H, G
#         A => NEW END POINTER
def _parse_hex_arg():
    lb_ret_fail = DeclAnonLabel()

    with Block() as if_space:
        BMOV(H, [A])
        JNE(H, ord(' '), if_space.end)
        INC(A)

    CALL(split_command)

    MOV(G, 0)
    JNE(A + 4, H, lb_ret_fail)

    CALL(parse_hex_16)
    JEQ(G, 0, lb_ret_fail)

    MOV(G, 1)
    MOV(A, A + 4)
    EmitLabel(lb_ret_fail)


# A start of cmd, B is the end of cmd name
def handle_read():
    lb_ret_ok = DeclAnonLabel()
    lb_ret_fail = DeclAnonLabel()

    stash = PUSH(A, B, C, D, E, F, G)

    # parse first argument
    CALL(_parse_hex_arg)
    JEQ(G, 0, lb_ret_fail)
    MOV(C, H)  # start addr

    # parse second argument
    CALL(_parse_hex_arg)
    JEQ(G, 0, lb_ret_fail)
    MOV(D, H)  # end addr

    # print memory
    MOV(A, send_buf)
    MOV(B, C)
    CALL(put_hex_16)
    MOV([A + 4], ord(' '))

    MOV(A, A + 5)
    MOV(B, D)
    CALL(put_hex_16)
    MOV([A + 4], ord(' '))

    MOV(A, A + 5)
    with Block() as loop_cd:
        JGE(A, recv_buf + UART_BUFSZ - 1, lb_ret_fail)  # overflow, -1 for \n char
        JGE(C, D, loop_cd.end)

        MOV(E, [C])
        # swap byte order
        SHL(B, E, 8)
        SHR(E, 8)
        OR(B, E)

        CALL(put_hex_16)
        MOV(A, A + 4)  # hex output
        MOV(C, C + 2)  # addr

        JMP(loop_cd.begin)

    MOV([A], ord('\n'))
    MOV(A, send_buf)
    CALL(send_data)

    # Return result
    with Block() as blk_ret:
        # lb_ret_ok:
        EmitLabel(lb_ret_ok)
        MOV(H, 1)
        JMP(blk_ret.end)
        # lb_ret_fail:
        EmitLabel(lb_ret_fail)
        MOV(H, 0)

    POP(stash)


def handle_write():
    lb_ret_fail = DeclAnonLabel()
    stash = PUSH(A, B, C, E, F, G)

    # parse first argument
    CALL(_parse_hex_arg)
    JEQ(G, 0, lb_ret_fail)
    MOV(C, H)  # start addr
    MOV(F, H)

    # check second argument
    BMOV(H, [A])
    JEQ(H, ord('\0'), lb_ret_fail)
    INC(A)

    CALL(split_command)
    MOV(B, H)  # [A,B)

    # write memory
    with Block() as loop:
        JGE(A, B, loop.end)
        # JGT(A + 4, B, lb_ret_fail)

        CALL(parse_hex_16)
        JEQ(G, 0, lb_ret_fail)
        SHL(E, H, 8)
        SHR(H, 8)
        OR(E, H)
        MOV([C], E)

        MOV(A, A + 4)
        MOV(C, C + 2)
        JMP(loop.begin)

    with Block() as b:
        MOV(A, send_buf)
        MOV([A], 0x4B4F)  # OK

        MOV([A + 2], ord(' '))
        MOV(A, A + 3)
        MOV(B, F)  # start addr
        CALL(put_hex_16)

        MOV([A + 4], ord(' '))
        MOV(A, A + 5)
        MOV(B, C)  # end addr
        CALL(put_hex_16)
        MOV([A + 4], ord('\n'))

        MOV(A, send_buf)
        CALL(send_data)

        MOV(H, 1)  # ok
        JMP(b.end)

        EmitLabel(lb_ret_fail)
        MOV(H, 0)  # fail
    POP(stash)


# A => PTR string
def parse_command():
    lb_ret_ok = DeclAnonLabel()
    lb_ret_fail = DeclAnonLabel()
    stash = PUSH(B, C)

    # Get first argument => command name
    CALL(split_command)

    # Check commands
    # A is start of string, got from caller
    MOV(B, H)  # H is the end of first chunk

    # Handle commands
    def check_cmd(cmd, handler, need_arg):
        MOV(C, ConstData(cmd))
        CALL(string_cmp)  # compare [A,B) with C
        with Block() as is_matched:
            JEQ(H, 0, is_matched.end)
            if need_arg:
                BMOV(H, [B])
                JEQ(H, ord('\0'), lb_ret_fail)
            MOV(A, B + 1)  # skip first part
            CALL(handler)
            # handler returns 0 if failed
            JEQ(H, 0, lb_ret_fail)
            JMP(lb_ret_ok)

    check_cmd("PING", handle_ping, False)
    check_cmd("READ", handle_read, True)
    check_cmd("WRITE", handle_write, True)

    # lb_ret_fail:
    EmitLabel(lb_ret_fail)
    MOV(A, ConstData("INVALID\n"))
    CALL(send_data)

    # lb_ret_ok:
    EmitLabel(lb_ret_ok)
    POP(stash)


def led_activity():
    # M_LED is only writable, read always return 0
    INC(m_led_stt)
    MOV(M_LED, m_led_stt)


def start():
    # map device range
    MOV(A, 0xFD)
    MOV(B, 0)
    MMAP(DEV_ADDR, DEV_ADDR + 0xFF, 2)

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


START_ADDR = 0xE000

if __name__ == '__main__':
    with Block() as check_mmap:
        JEQ(PC, START_ADDR, check_mmap.end)  # MUST be the first instruction
        MOV(A, 0xFF)
        MOV(B, 0)
        MMAP(START_ADDR, 0xFEFF, 2)  # tmp slot 2
        JMP(START_ADDR)

    # PC == START_ADDR
    MMAP(START_ADDR, 0xFEFF, 3)
    UMAP(2)

    MOV(SP, 0x500)
    CALL(start)
    HALT()

    cg = CodeGen()
    cg.code_offset = START_ADDR
    cg.compile().write('bootloader.hex').write_vhd('bootloader.vhd')
