_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_623a
_g_05ec6 EQU 5ec6h
_g_05ecc EQU 5ecch
_grp_623a PROC NEAR
        mov bx, word ptr [bp + 0c9ah]
        sub bx, word ptr ds:[_g_05ec6]
        shr bx, 1
        shr bx, 1
        shr bx, 1
        add bx, word ptr ds:[_g_05ecc]
        mov al, byte ptr [bx]
        test al, 0f0h
        jne short $++7h
        or al, al
        jg short $++1bh
        ret
_grp_623a ENDP
_TEXT ENDS
END
