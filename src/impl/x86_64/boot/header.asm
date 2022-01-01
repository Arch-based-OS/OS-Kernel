
header_start:
; Magic number
dd 0xe85250d6 ; multiboot2
; Architecture
dd 0 ; protected mode i386
; header lenght
dd header_end - header_start 
; checksum
dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))


header_end: