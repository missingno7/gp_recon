_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_78b9
_g_085f8 EQU 85f8h
_g_085fa EQU 85fah
_grp_78b9 PROC NEAR
        push bp
        mov bp, sp
        mov ax, word ptr [bp + 4]
        mov word ptr ds:[_g_085f8], ax
        mov ax, word ptr [bp + 6]
        mov word ptr ds:[_g_085fa], ax
        pop bp
        ret
_grp_78b9 ENDP
_TEXT ENDS
END
