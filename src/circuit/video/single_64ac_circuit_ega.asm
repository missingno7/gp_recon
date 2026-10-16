_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_64ac
_grp_64ac PROC NEAR
        mov bp, 12h
L_64AF:
        mov ax, word ptr [bp + 0d12h]
        cmp ax, 10h
        jl short $++13h
        mov si, word ptr [bp + 0d3ah]
        mov ax, word ptr [si + 0cfeh]
        mov word ptr [si + 0ceah], ax
        dec bp
        dec bp
        jge short L_64AF
        ret
_grp_64ac ENDP
_TEXT ENDS
END
