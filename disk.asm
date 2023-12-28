disk_load:
    pusha
    push dx

    mov ah, 0x02 ; set to read mode
    mov al, dh   ; read x sectors
                 ; CHS 
    mov cl, 0x02 ; start from second
    mov ch, 0x00 ; cylinder 0
    mov dh, 0x00 ; head 0

    int 0x13      ; BIOS interrupt
    jc disk_error ; check carry bit for error

    pop dx     ; Original number of sectors to read
    cmp al, dh 
               
    jne sectors_error
    popa
    ret

disk_error:
    jmp disk_loop

sectors_error:
    jmp disk_loop

disk_loop:
    jmp $