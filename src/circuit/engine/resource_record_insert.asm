.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_8902:WORD
EXTRN _g_8904:WORD
EXTRN _g_8906:WORD
EXTRN _catalog_error_text:BYTE
EXTRN _fn_circuit_ega_0ddd8:NEAR
EXTRN _grp_c9818520:NEAR
PUBLIC _grp_3f05a1a6
_grp_3f05a1a6 PROC NEAR
    push bp
    mov bp, sp
    push si
    push di
    mov ax, [bp+6]
    mov si, ds:_g_8904
find_item:
    cmp si, ds:_g_8902
    je not_found
    cmp ax, [si+0eh]
    je found
    sub si, 12h
    jmp short find_item
not_found:
    push word ptr [bp+6]
    mov ax, OFFSET _catalog_error_text
    push ax
    call _fn_circuit_ega_0ddd8
found:
    mov word ptr [bp+6], 0
    mov word ptr [si+10h], 0
    cmp si, ds:_g_8904
    je allocate_item
    mov bx, ds:_g_8904
    mov di, ds:_g_8906
    mov ax, [di+0eh]
    sub ax, [bx+0eh]
    sub ax, [bx+0ch]
    cmp ax, [si+0ch]
    jb tail_cleanup
allocate_item:
    mov bx, [si+0ch]
    push bx
    mov di, ds:_g_8906
    mov ax, [di+0eh]
    sub ax, bx
    push ax
    mov [bp+6], ax
    push word ptr [si+0eh]
    sub di, 12h
    mov ds:_g_8906, di
    mov [di+0eh], ax
    mov [di+0ch], bx
    mov word ptr [di+10h], 1
    mov cx, 0ch
    xor bx, bx
copy_item:
    mov al, [bx+si]
    mov [bx+di], al
    inc bx
    loop copy_item
    call _grp_c9818520
    add sp, 6
tail_cleanup:
    cmp si, ds:_g_8904
    jne finish
scan_live:
    sub si, 12h
    cmp word ptr [si+10h], 0
    je scan_live
    mov ds:_g_8904, si
finish:
    mov ax, [bp+4]
    mov dx, [bp+6]
    pop di
    pop si
    pop bp
    ret
_grp_3f05a1a6 ENDP
_TEXT ENDS
END
