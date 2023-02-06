.offset 0xD000

boot:
    mov A, 0xFE
    mov B, 0
    mmap 0, 0x9600, 1

    mov A, 0
loop_outer:
    mov D, 0
    mov C, 0
loop_row:
    mov B, 0

    loop_col:
        mov [D], B+A
        add B, 16
        add D, 2
        jlt $loop_col, B, 640

    add C, 1
    jlt $loop_row, C, 480

    add A, 1
    jmp $loop_outer
