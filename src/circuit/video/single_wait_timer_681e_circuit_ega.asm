_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _wait_timer
_g_077ae EQU 77aeh
_g_077b0 EQU 77b0h
EXTRN _FN_CIRCUIT_EGA_06868:NEAR
EXTRN _FN_CIRCUIT_EGA_078A0:NEAR
_wait_timer PROC NEAR
L_681E:
        call _FN_CIRCUIT_EGA_078A0
        cmp ax, 0
        jne short L_6837
        call _FN_CIRCUIT_EGA_06868
        cmp dx, word ptr ds:[_g_077b0]
        jb short L_681E
        cmp ax, word ptr ds:[_g_077ae]
        jb short L_681E
        xor ax, ax
L_6837:
        ret
_wait_timer ENDP
_TEXT ENDS
END
