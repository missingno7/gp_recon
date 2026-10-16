_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _key_state_5537
_g_05e30 EQU 5e30h
_g_05e32 EQU 5e32h
_g_05e7e EQU 5e7eh
_g_05ee8 EQU 5ee8h
_key_state_5537 PROC NEAR
        or al, 40h
        cmp al, 64h
        jne short L_5544
        xor byte ptr ds:[_g_05e7e], 1
        xor al, al
L_5544:
        cmp al, 6dh
        jne short L_554F
        xor byte ptr ds:[_g_05e30], 0ffh
        xor al, al
L_554F:
        cmp al, 69h
        jne short L_555A
        xor byte ptr ds:[_g_05e32], 0ffh
        xor al, al
L_555A:
        mov byte ptr ds:[_g_05ee8], 1
        xor al, al
        ret
_key_state_5537 ENDP
_TEXT ENDS
END
