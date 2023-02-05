.offset 0x8000

boot:
    mov [0xFA], 0x123
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
    call $function_a
    halt

text_abc:
    .string "Hello World!\n" # null-terminated

data:
    .dw 1234, 0xFF22
    .db 1, 3, 0x5, 'a'