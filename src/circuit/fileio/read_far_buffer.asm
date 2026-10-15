PUBLIC _grp_427898b6
_TEXT SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:_TEXT
_grp_427898b6 PROC NEAR
    push bp
    mov bp, sp
    sub sp, 6
    push ds
    mov ax, [bp+6]
    mov [bp-4], ax
    mov ax, [bp+8]
    mov [bp-6], ax
    mov dx, [bp+4]
    xor al, al
    mov ah, 3dh
    int 21h
    jb short error_exit
    mov [bp-2], ax
read_next:
    mov ds, [bp-6]
    mov dx, [bp-4]
    mov cx, 4000h
    mov bx, [bp-2]
    mov ah, 3fh
    int 21h
    jb short error_exit
    add word ptr [bp-6], 0400h
    cmp ax, 4000h
    je short read_next
    mov bx, [bp-2]
    mov ah, 3eh
    int 21h
    mov ax, [bp+6]
    mov dx, [bp+8]
    pop ds
    mov sp, bp
    pop bp
    ret
error_exit:
_grp_427898b6 ENDP
_TEXT ENDS
END
