_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_6446
_grp_6446 PROC NEAR
        mov si, 0
        xor bp, bp
L_62F1:
        mov bx, 10h
L_62F4:
        mov ax, word ptr [bx + 0d22h]
        cmp ax, word ptr [bx + 0d24h]
        jl short $++16h
        dec bx
        dec bx
        cmp bx, bp
        jge short L_62F4
        or si, si
        je short L_6311
        xor si, si
        inc bp
        inc bp
        cmp bp, 10h
        jle short L_62F1
L_6311:
        ret
_grp_6446 ENDP
_TEXT ENDS
END
