_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_64ac
_grp_64ac PROC NEAR
        mov bp, 12h
L_6355:
        mov ax, word ptr [bp + 0d0eh]
        cmp ax, 10h
        jl short $++13h
        mov si, word ptr [bp + 0d36h]
        mov ax, word ptr [si + 0cfah]
        mov word ptr [si + 0ce6h], ax
        dec bp
        dec bp
        jge short L_6355
        ret
_grp_64ac ENDP
_TEXT ENDS
END
