.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _grp_f93ec5a2:NEAR
EXTRN _fn_circuit_ega_0ddd8:NEAR
EXTRN _g_cir_8bac:WORD
EXTRN _g_cir_8bb3:WORD
EXTRN _cs_resource_cursor:WORD
PUBLIC _fn_circuit_ega_0c97e
_fn_circuit_ega_0c97e PROC NEAR
    push bp
    mov bp, sp
    push ds
    push si
    push di
    sub sp, 0Ch
    mov ax, word ptr [bp+4]
    shr ax, 1
    shr ax, 1
    shr ax, 1
    mov word ptr [bp-12h], ax
    mov bx, word ptr [bp+6]
    imul bx
    mov bx, ax
    and bx, 0Fh
    neg bx
    and bx, 0Fh
    mov word ptr [bp-10h], bx
    add ax, bx
    mov word ptr [bp-0Ch], ax
    xor dx, dx
    mov cx, 4
    mov bx, word ptr [bp+8]
L_C9B2:
    shr bx, 1
    jae short L_C9B8
    add dx, ax
L_C9B8:
    loop L_C9B2
    add dx, 10h
    mov cx, 4
L_C9C0:
    shr dx, cl
    inc dx
    mov word ptr [bp-0Eh], dx
    push dx
    mov ax, offset DGROUP:_g_cir_8bac
    push ax
    call _grp_f93ec5a2
    add sp, 4
    mov word ptr [bp-8], dx
    mov ds, dx
    xor bx, bx
    mov ax, word ptr [bp-12h]
    mov word ptr [bx], ax
    mov ax, word ptr [bp+6]
    mov word ptr [bx+2], ax
    xor ax, ax
    mov word ptr [bx+4], ax
    mov word ptr [bx+6], ax
    mov word ptr [bx+8], ax
    mov word ptr [bx+0Ah], ax
    mov cx, 4
    lea di, [bx+0Ch]
    xor ax, ax
    mov es, word ptr [bp-8]
    rep stosb
    lea di, [bx+0Ch]
    mov cx, 4
    mov dx, 1
L_CA07:
    mov ax, word ptr [bp+8]
    and ax, dx
    je short L_CA0F
    stosb
L_CA0F:
    shl dx, 1
    loop L_CA07
    mov ax, word ptr [bp-10h]
    shl ax, 1
    shl ax, 1
    shl ax, 1
    shl ax, 1
    or byte ptr [bx+0Fh], al
    mov ax, 0Dh
    add ax, word ptr [bp+6]
    shl ax, 1
    mov bx, word ptr cs:[_cs_resource_cursor]
    mov word ptr [bp-0Ah], bx
    add ax, bx
    cmp ax, 0D2A4h
    jb short L_CA3B
    jmp L_CAC8
L_CA3B:
    mov word ptr cs:[_cs_resource_cursor], ax
    mov word ptr cs:[bx], 0
    mov dx, word ptr [bp+8]
    mov cx, 4
    mov ax, word ptr [bp-8]
    mov si, word ptr [bp-0Ch]
    shr si, 1
    shr si, 1
    shr si, 1
    shr si, 1
L_CA58:
    mov word ptr cs:[bx+2], 0
    test dl, 1
    je short L_CA69
    mov word ptr cs:[bx+2], ax
    add ax, si
L_CA69:
    add bx, 2
    shr dx, 1
    loop L_CA58
    mov bx, word ptr [bp-0Ah]
    lea ax, [bx+1Ah]
    mov word ptr cs:[bx+0Ah], ax
    mov word ptr cs:[bx+0Ch], 0
    mov ax, word ptr [bp+4]
    mov word ptr cs:[bx+18h], ax
    shr ax, 1
    shr ax, 1
    shr ax, 1
    mov word ptr cs:[bx+0Eh], ax
    mov word ptr cs:[bx+14h], ax
    mov word ptr cs:[bx+10h], 0
    mov ax, word ptr [bp+6]
    mov word ptr cs:[bx+12h], ax
    mov ax, word ptr [bp-10h]
    mov word ptr cs:[bx+16h], ax
    mov cx, word ptr [bp+6]
    mov ax, 10h
L_CAAF:
    mov word ptr cs:[bx+1Ah], ax
    add bx, 2
    add ax, word ptr [bp-12h]
    loop L_CAAF
    mov dx, cs
    mov ax, word ptr [bp-0Ah]
    add sp, 0Ch
    pop di
    pop si
    pop ds
    pop bp
    ret
L_CAC8:
    mov ds, word ptr [bp-2]
    mov ax, offset DGROUP:_g_cir_8bb3
    push ax
    call _fn_circuit_ega_0ddd8
_fn_circuit_ega_0c97e ENDP
_TEXT ENDS
END
