.offset 0xD000

boot:
    mov SP, 0xA000
    mov A, 0xFE
    mov B, 0
    mmap 0, 0x9600, 1

    mov A, 0xA2
loop_outer:
    mov D, 0
    mov C, 0
loop_row:
    mov B, 0

    loop_col:
        mov [D], 0xFF00
        shr [D], A
        add B, 1
        add D, 2
        jlt B, 40, $loop_col

    add C, 1
    jlt C, 480, $loop_row

    add A, 1
    call $delay_fn
    jmp $loop_outer


delay_fn:
    push B
    push C

    mov C, 0
    _L_delay_loop:
        mov B, 0
        _L_delay_inner_loop:
            add B, 1
            jne B, 0xFFFF, $_L_delay_inner_loop

        add C, 1
        jlt C, 32, $_L_delay_loop

    pop C
    pop B
    ret
