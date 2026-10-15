.8086
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
EXTRN _grp_427898b6:NEAR
EXTRN _fn_circuit_ega_07af4:NEAR
EXTRN _grp_c9818520:NEAR
EXTRN _grp_ea09637f:NEAR
PUBLIC _grp_5306dd97
_grp_5306dd97 PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    sub sp, 11ch
    mov ax, [bp+6]
    mov [bp-0ch], ax
    add ax, [bp+0ah]
    mov [bp-8], ax
    push ax
    xor ax, ax
    push ax
    push word ptr [bp+4]
    call _grp_427898b6
    add sp, 6
    lea di, [bp-20h]
    mov ax, ds
    mov es, ax
    xor si, si
    mov ds, [bp-8]
    mov cx, 0ah
    rep movsw
    xor si, si
    add si, 9
    mov dx, [bp-18h]
    and dx, 7fh
    add si, dx
    mov [bp-0ah], si
    cmp byte ptr [bp-18h], 80h
    ja short no_conversion
    call _fn_circuit_ega_07af4
    mov [bp-1ch], ax
    mov [bp-1ah], dx
    mov si, ax
    shr dx, 1
    rcr ax, 1
    shr dx, 1
    rcr ax, 1
    shr dx, 1
    rcr ax, 1
    shr dx, 1
    rcr ax, 1
    test si, 0fh
    je short no_round
    inc ax
no_round:
    push ax
    mov bx, [bp+8]
    sub bx, ax
    add bx, [bp-0ch]
    mov [bp-8], bx
    push bx
    push word ptr [bp-0ch]
    call _grp_c9818520
    add sp, 6
    xor si, si
    mov [bp-0ah], si
no_conversion:
    call _grp_ea09637f
    xor ax, ax
    mov dx, [bp+6]
    add sp, 11ch
    pop di
    pop si
    pop ds
    pop bp
    ret
_grp_5306dd97 ENDP
_TEXT ENDS
END
