test_cmp:
    setf 0xFFFF
    getf A
    jne A, 0x3F, $fail

    setf 0xABAB
    getf A
    jne A, 0x2B, $fail

    # unsigned
    cmp 0xFFAB, 0x2B
    getf A
    # GE GT LE LT NE EQ
    jne A, 0b110010, $fail

    cmp 0x2B, 0xFFAB
    getf A
    jne A, 0b001110, $fail

    cmp 0xFFAB, 0xFFAB
    getf A
    jne A, 0b101001, $fail

    # signed
    icmp 0xFFAB, 0x2B
    getf A
    # GE GT LE LT NE EQ
    jne A, 0b001110, $fail

    icmp 0x2B, 0xFFAB
    getf A
    jne A, 0b110010, $fail

    icmp 0xFFAB, 0xFFAB
    getf A
    jne A, 0b101001, $fail
