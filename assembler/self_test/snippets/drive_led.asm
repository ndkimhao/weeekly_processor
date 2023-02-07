drive_led:
    mov A, 0xCC
    mov C, 0
drive_led_loop:
    mov B, 0
    drive_led_inner_loop:
        add B, 1
        jne B, 0xFFFF, $drive_led_inner_loop

    add C, 1
    shr A, C, 4
    jmp $drive_led_loop
