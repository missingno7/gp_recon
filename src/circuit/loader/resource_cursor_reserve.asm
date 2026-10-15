.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _cs_resource_cursor:WORD
EXTRN _grp_04ea201c:NEAR
PUBLIC _grp_3f4e2cf3
_grp_3f4e2cf3 PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    mov es, [bp+6]
    mov di, [bp+4]
    mov ds, es:[di+2]
    mov si, es:[di]
    mov ax, [si+2]
    add ax, 0dh
    shl ax, 1
    mov bx, cs:_cs_resource_cursor
    sub bx, ax
    mov cs:_cs_resource_cursor, bx
    push ds
    push si
    mov ds, [bp-2]
    call _grp_04ea201c
    add sp, 4
    pop di
    pop si
    pop ds
    pop bp
    ret
_grp_3f4e2cf3 ENDP
_TEXT ENDS
END
