[bits 16]

bit_switch:
    cli                     ; Switch off interrupts
    lgdt [gdt_descriptor]   ; Load the infamous GDT
    mov eax, cr0
    or eax, 0x1             ; Enter protected mode
    mov cr0, eax
    jmp CODE_SEG:init_32bit ; Jump to the protected mode memory sectos

[bits 32]

init_32bit:
    mov ax, DATA_SEG        ; 
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000        ; Set stach
    mov esp, ebp

    call BEGIN_32BIT        ; 