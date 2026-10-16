_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_6446
_grp_6446 PROC NEAR
        mov si, 0
        xor bp, bp
L_644B:
        mov bx, 10h
L_644E:
        mov ax, word ptr [bx + 0d26h]
        cmp ax, word ptr [bx + 0d28h]
        jl short $++16h
        dec bx
        dec bx
        cmp bx, bp
        jge short L_644E
        or si, si
        je short L_646B
        xor si, si
        inc bp
        inc bp
        cmp bp, 10h
        jle short L_644B
L_646B:
        ret
_grp_6446 ENDP
_TEXT ENDS
END
