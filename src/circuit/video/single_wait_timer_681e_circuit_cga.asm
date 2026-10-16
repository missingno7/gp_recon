_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _wait_timer
_g_07786 EQU 7786h
_g_07788 EQU 7788h
EXTRN _FN_CIRCUIT_CGA_06A68:NEAR
EXTRN _FN_CIRCUIT_CGA_0834C:NEAR
_wait_timer PROC NEAR
L_6A1E:
        call _FN_CIRCUIT_CGA_0834C
        cmp ax, 0
        jne short L_6A37
        call _FN_CIRCUIT_CGA_06A68
        cmp dx, word ptr ds:[_g_07788]
        jb short L_6A1E
        cmp ax, word ptr ds:[_g_07786]
        jb short L_6A1E
        xor ax, ax
L_6A37:
        ret
_wait_timer ENDP
_TEXT ENDS
END
