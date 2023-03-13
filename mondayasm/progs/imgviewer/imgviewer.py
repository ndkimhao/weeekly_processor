from progs.stdlib.devices import SD_SECTOR_SIZE, BTN_DEBOUNCED, BIT_BTN_UP, BIT_BTN_DOWN
from progs.stdlib.syscall import S, syscall
from progs.stdlib.video import switch_screen_page, g_row_buffer, HEIGHT, WIDTH
from soeunasm import call, halt, init_code_gen, Reg, Loop, If, global_var, cmt, expr, const, Else, local_var, ForRange, \
    mmap, umap, M, getb, Cleanup
from soeunasm.scope_func import Return

CODE_OFFSET = 0x5000

SD_IMAGE_BANK = 1

g_current_image_idx = global_var()

g_sd_buf = global_var('g_sd_buf', size=SD_SECTOR_SIZE + 2, align=16)

g_vid_chunk = global_var('g_vid_chunk', size=SD_SECTOR_SIZE + 2, align=16)
g_vid_chunk_end = g_vid_chunk.addr_add(SD_SECTOR_SIZE)

SD_BUF_MMAP_SLOT = 0

COLOR_LALETTE_SIZE = 48


def sd_error():
    syscall(S.draw_str_oled, 1, 0, const('SD Error'))
    halt()


# 2 - magic 0x3aa6
# 8 2 - first line
# 8 2 - second line
# 48 - color palette
# returns G: 0=fail, 1=ok, 2=interrupted
def show_image(img_slot, A, B, C, D, G, H):
    not_pressed_btns = local_var()
    not_pressed_btns @= ~M[BTN_DEBOUNCED]

    C @= img_slot << 8
    syscall(S.read_sd, g_sd_buf.addr(), SD_SECTOR_SIZE, SD_IMAGE_BANK, C)
    with If(G == 0):
        call(sd_error)

    # syscall(S.printf, const('%x %x\n'), img_slot, g_sd_buf)
    with If(g_sd_buf != 0x3aa6):
        G @= 0
        Return()

    g_sd_buf.addr_add(10) @ 0  # null terminate
    g_sd_buf.addr_add(20) @ 0
    syscall(S.clear_oled)
    syscall(S.draw_str_oled, 0, 0, g_sd_buf.addr() + 2)
    syscall(S.draw_str_oled, 1, 0, g_sd_buf.addr() + 12)

    call(switch_screen_page, 0, 0)
    syscall(S.memcpy, g_row_buffer.addr(), g_sd_buf.addr() + 22, COLOR_LALETTE_SIZE)

    N_PAGES = WIDTH * HEIGHT * 3 // 8 // SD_SECTOR_SIZE
    A @= 0xA1
    B @= 0
    with ForRange(D, 1, N_PAGES + 1):
        syscall(S.read_sd, g_sd_buf.addr(), SD_SECTOR_SIZE, SD_IMAGE_BANK, C + D)
        # syscall(S.printf, const('%x: %x %x \n'), C + D, A, B)
        mmap(g_vid_chunk.addr(), g_vid_chunk_end.addr(), SD_BUF_MMAP_SLOT)
        syscall(S.memcpy, g_vid_chunk.addr(), g_sd_buf.addr(), SD_SECTOR_SIZE)

        H @= A & 0x0F
        H <<= 1
        with If(H > 7):
            H @= 1
            B += SD_SECTOR_SIZE
        A @= 0xA0 | H

        H @= M[BTN_DEBOUNCED]
        H &= not_pressed_btns
        with If(H != 0):
            G @= 2
            Return()
    ###

    G @= 1
    Cleanup()
    umap(SD_BUF_MMAP_SLOT)


def move_slot(dir, A, G):
    A @= g_current_image_idx
    A += dir
    call(show_image, A)
    with If(G == 0):
        syscall(S.clear_oled)
        syscall(S.draw_str_oled, 0, 0, const('The end!'))

        Else()  # G = 1 or 2
        g_current_image_idx @ A


g_last_btn = global_var()


def main_loop(A, G, H):
    with Loop():
        A @= M[BTN_DEBOUNCED]
        with If(A != g_last_btn):
            g_last_btn @ A

            G @= getb(A, BIT_BTN_UP)
            with If(G != 0):
                call(move_slot, -1)

            G @= getb(A, BIT_BTN_DOWN)
            with If(G != 0):
                call(move_slot, 1)


def main(G):
    syscall(S.clear_oled)
    syscall(S.draw_str_oled, 0, 0, const('Img View'))
    syscall(S.init_sd)
    with If(G == 0):
        call(sd_error)
        Else()
        syscall(S.draw_str_oled, 1, 0, const('SD Okay'))

    g_current_image_idx @ 0
    call(show_image, g_current_image_idx)

    g_last_btn @ 0
    call(main_loop)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('imgviewer.asm')
