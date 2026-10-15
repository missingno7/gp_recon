.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
EXTRN _g_8904:WORD
EXTRN _g_8902:WORD
EXTRN _catalog_error_text:BYTE
EXTRN _fn_circuit_ega_0ddd8:NEAR
PUBLIC _grp_04ea201c
_grp_04ea201c PROC NEAR
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
    mov word ptr [si+10h], 0
    cmp si, ds:_g_8904
    jne finish
scan_live:
    sub si, 12h
    cmp word ptr [si+10h], 0
    je scan_live
    mov ds:_g_8904, si
finish:
    pop di
    pop si
    pop bp
    ret
_grp_04ea201c ENDP
_TEXT ENDS
END
