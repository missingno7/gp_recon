.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _copy_far_field_pair
_copy_far_field_pair PROC NEAR
    push bp
    mov bp, sp
    push si
    mov es, word ptr [bp+6]
    mov si, word ptr [bp+4]
    mov bx, word ptr [bp+8]
    shl bx, 1
    shl bx, 1
    mov ax, word ptr es:[bx+si+6]
    mov dx, word ptr es:[bx+si+8]
    mov si, word ptr [bp+0Ah]
    mov word ptr [si], ax
    mov word ptr [si+2], dx
    pop si
    pop bp
    ret
_copy_far_field_pair ENDP
_TEXT ENDS
END
