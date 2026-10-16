_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_7d96
_grp_7d96 PROC NEAR
        push bp
        mov bp, sp
        push ds
        push si
        push di
        xor dx, dx
        jmp short $+0ch
_grp_7d96 ENDP
_TEXT ENDS
END
