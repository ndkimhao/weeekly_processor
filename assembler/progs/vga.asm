.offset 0x8000

boot:
    mov A, 0xFE
    mov B, 0
    mmap 0, 0x9600, 1

    mov D, 0

    mov A, 0
loop_row:
    mov B, 0

    loop_col:
        mov [D], B
        add B, 16
        add D, 2
        jlt $loop_col, B, 640

    add A, 1
    jlt $loop_row, A, 480

    halt
