; Entry point to operation system
global start

section .text
bits 32 ; still in 32-bit mode at this point
start:
    ; print "OK"
    mov dword [0xb8000], 0x2f4b2f4f
    hlt ; instructs to cpu to completely freeze



