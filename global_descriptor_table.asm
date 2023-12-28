gdt_start:
    gdt_null:
        dd 0x0
        dd 0x0
    gdt_code:
        dw 0xffff    ;  bits 0-15 = segment length,
        dw 0x0       ;  bits 0-15 = base
        db 0x0       ;  bits 16-23 = base
        db 10011010b ;  special flags
        db 11001111b ;  special flags
        db 0x0       ;  bits 24-31 = base

    gdt_data:
        dw 0xffff    ; segment length, bits 0-15
        dw 0x0       ; segment base, bits 0-15
        db 0x0       ; segment base, bits 16-23
        db 10010010b ; flags (8 bits)
        db 11001111b ; flags (4 bits) + segment length, bits 16-19
        db 0x0       ; segment base, bits 24-31
gdt_end:

; GDT descriptor
gdt_descriptor:
    dw gdt_end - gdt_start - 1 
    dd gdt_start 

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start