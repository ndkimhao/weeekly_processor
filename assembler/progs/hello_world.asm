.offset 0x8000

boot:
    mov A, 0x3C
    mov [0xFA], 0x123
    add [A*4 + 0xA], 0x32
    mov A, [0xFA]
    add A, 0x321
    mov C, 0x333
    sub D, A, C
    jmp $hello

function_a:
    add A, B
    ret

hello:
    mov C, $text_abc
    mov A, 1234     # comment asd
    mov B, 2*A + 5  # comment asd
    mov B, A*2 + 5  # comment asd
    mov B, [A + 5]
    mov B, 123
    mov B, 12345
    mov B, 0xFF
    mov B, 0xFFAA
    add D, A + 234, C*2 + D
    # call $function_a

    mov SP, 0x00FF

    mov A, 0x00F0
    mov C, A
    push C
    pop C
    mov A, C+1
    mov C, A
loop_outmost:
    push C

    mov D, 0
    loop_outer:
        mov B, 0
        loop_1:
            add B, 1
            jne $loop_1, B, 0xFFFF
        add D, 1
        jne $loop_outer, D, 5

    pop C
    mov A, C+1
    mov C, A
    jmp $loop_outmost
    halt

text_abc:
    .string "Hello World!\n" # null-terminated

data:
    .dw 1234, 0xFF22
    .db 1, 3, 0x5, 'a'
