_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_623a
_g_05eaa EQU 5eaah
_g_05eb0 EQU 5eb0h
_grp_623a PROC NEAR
        mov bx, word ptr [bp + 0c96h]
        sub bx, word ptr ds:[_g_05eaa]
        shr bx, 1
        shr bx, 1
        shr bx, 1
        add bx, word ptr ds:[_g_05eb0]
        mov al, byte ptr [bx]
        test al, 0f0h
        jne short $++7h
        or al, al
        jg short $++1bh
        ret
_grp_623a ENDP
_TEXT ENDS
END
