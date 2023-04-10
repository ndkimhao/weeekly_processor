.offset 0xFE00

mov A, [B*2 + 1]
add A, D*4
or  A, 0x7F

# dummy commands
add A, 0
add A, 0
add A, 0
