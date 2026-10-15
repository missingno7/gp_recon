.8086
_TEXT segment word public 'CODE'
assume cs:_TEXT
public _unknown_libname_1
_unknown_libname_1 proc far
    push bp
    mov bp, sp
    mov bx, word ptr [bp+6]
    or bx, bx
    je short unknown_libname_1_done
    or byte ptr [bx-2], 1
unknown_libname_1_done:
    mov sp, bp
    pop bp
    retf
_unknown_libname_1 endp
_TEXT ends
end
