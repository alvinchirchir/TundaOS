[bits 16]
[org 0x7c00]

KERNEL_OFFSET equ 0x1000

; BIOS sets boot drive in 'dl'; store for later use
mov [BOOT_DRIVE], dl

; setup stack
mov bp, 0x9000
mov sp, bp

call load_kernel
call bit_switch

jmp $

%include "disk.asm"
%include "global_descriptor_table.asm"
%include "thirty_two_bit_switch.asm"

[bits 16]
load_kernel:
    mov bx, KERNEL_OFFSET ; bx -> destination
    mov dh, 2             ; dh -> num sectors
    mov dl, [BOOT_DRIVE]  ; dl -> disk
    call disk_load
    ret

[bits 32]
BEGIN_32BIT:
    call KERNEL_OFFSET ; handover to the kernel
    jmp $ ; loop (if kernel handover power)

; boot drive variable
BOOT_DRIVE db 0

; Indicate that this is valid bootloader
times 510 - ($-$$) db 0
dw 0xaa55