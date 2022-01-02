; Entry point to operation system
global start

section .text
bits 32 ; still in 32-bit mode at this point
start:
    mov esp, stack_top

    call check_multiboot ; comfirm that we have been loaded by a multi-boot
    call check_cpuid
    call check_long_mode
    ; print "OK"
    mov dword [0xb8000], 0x2f4b2f4f
    hlt ; instructs to cpu to completely freeze

check_multiboot:
    cmp eax, 0x36d76289
    jne .no_multiboot ; if this comparason faisl
    
    ret

.no_multiboot:
    mov al, "M"
    jmp error

check_cpuid:
    pushfd
    pop eax
    mov ecx, eax
    xor eax, 1 << 21
    push eax
    popfd
    pushfd
    pop eax
    push ecx
    popfd
    cmp eax, ecx
    je .no_cpuid
    
    ret

check_long_mode:
    mov eax, 0x80000000
    cpuid
    cmp eax, 0x80000001 ; if isn't supported 
    jb .no_long_mode

    mov eax, 0x00000001
    cpuid ; run cpuid again
    test edx, 1 << 29
    jz .no_long_mode

    ret


.no_long_mode:
    mov al, "L"
    jmp error


.no_cpuid:
    mov al, "C"
    jmp error


error:
    mov dword [0xb8000], 0x4f524f45
    mov dword [0xb8004], 0x4f3a4f52
    mov dword [0xb8008], 0x4f204f20
    mov byte  [0xb800a], al
    hlt


section .bss ; for reserved when bootloader loads the kernel

stack_bottom:
    resb 4096 * 4
stack_top: