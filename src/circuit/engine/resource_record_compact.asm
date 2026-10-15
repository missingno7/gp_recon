.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_8906:WORD
EXTRN _g_tail:WORD
EXTRN _grp_c9818520:NEAR
PUBLIC _grp_2a1dacea
_grp_2a1dacea PROC NEAR
    push si
    push di
    push dx
    mov si, ds:_g_tail
    mov di, si
    xor dx, dx
entry_loop:
    test word ptr [si+10h], 1
    jne flagged
    add dx, [si+0ch]
    jmp short next_entry
    nop
flagged:
    or dx, dx
    jne merge_entry
dest_step:
    sub di, 12h
next_entry:
    sub si, 12h
    cmp si, ds:_g_8906
    jae entry_loop
    add di, 12h
    mov ds:_g_8906, di
    pop dx
    pop di
    pop si
    ret
merge_entry:
    mov bx, [si+0ch]
    push bx
    add di, 12h
    mov ax, [di+0eh]
    sub ax, bx
    push ax
    push word ptr [si+0eh]
    sub di, 12h
    mov [di+0ch], bx
    mov [di+0eh], ax
    mov cx, [si+10h]
    mov word ptr [si+10h], 0
    mov [di+10h], cx
    xor bx, bx
    mov cx, 0ch
copy_item:
    mov al, [bx+si]
    mov [bx+di], al
    inc bx
    loop copy_item
    call _grp_c9818520
    add sp, 6
    jmp short dest_step
_grp_2a1dacea ENDP
_TEXT ENDS
END

