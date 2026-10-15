PUBLIC _grp_8fa8dedb
EXTRN _HOOK_TIMER:BYTE
EXTRN _G_7FF0:WORD
EXTRN _G_7FF2:WORD
EXTRN _G_802E:WORD
EXTRN _G_8030:WORD
EXTRN _G_7FEE:WORD
EXTRN _G_7FEC:BYTE
EXTRN _G_7FF4:WORD
EXTRN _G_7FF6:WORD
EXTRN _G_7FE0:WORD
EXTRN _G_7FE2:WORD
_TEXT SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:_TEXT
_grp_8fa8dedb PROC NEAR
    push bp
    mov bp, sp
    mov dx, 1
    xor ax, ax
    idiv word ptr [bp+4]
    mov word ptr _G_7FF0, ax
    mov word ptr _G_7FF2, ax
    mov dx, word ptr [bp+4]
    cli
    mov word ptr _G_802E, 0
    mov word ptr _G_8030, 0
    sti
    mov word ptr _G_7FEE, 64h
    mov byte ptr _G_7FEC, 1
    in al, 61h
    and al, 0fch
    out 61h, al
    mov al, 0b6h
    out 43h, al
    in al, 21h
    or al, 3
    out 21h, al
    mov bx, 0
    mov word ptr _G_7FF4, 0
    mov cx, 0ah
clear_loop:
    mov word ptr [bx+_G_7FF6], 0
    add bx, 2
    loop clear_loop
    mov ax, 0
    mov es, ax
    cli
    mov ax, word ptr es:[20h]
    cmp ax, OFFSET _HOOK_TIMER
    je offset_ready
    mov word ptr _G_7FE0, ax
offset_ready:
    mov ax, word ptr es:[22h]
    mov bx, cs
    cmp ax, bx
    je vector_ready
    mov word ptr _G_7FE2, ax
    mov word ptr es:[20h], OFFSET _HOOK_TIMER
    mov word ptr es:[22h], cs
vector_ready:
    in al, 21h
    and al, 0fch
    out 21h, al
    sti
    mov al, dl
    out 40h, al
    mov al, dh
    out 40h, al
    pop bp
    ret
_grp_8fa8dedb ENDP
_TEXT ENDS
END
