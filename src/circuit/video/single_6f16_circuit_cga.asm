_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_6f16
_g_0789e EQU 789eh
_g_0789f EQU 789fh
_g_078a2 EQU 78a2h
_g_078a4 EQU 78a4h
_g_078e0 EQU 78e0h
_g_078e2 EQU 78e2h
_grp_6f16 PROC NEAR
        push bp
        mov dx, 2e9ch
        mov word ptr ds:[_g_078e0], 79d6h
        mov word ptr ds:[_g_078e2], 0
        mov word ptr ds:[_g_078a2], 5
        mov word ptr ds:[_g_078a4], 5
        mov byte ptr ds:[_g_0789e], 0
        mov byte ptr ds:[_g_0789f], 1
        jmp short $++5fh
_grp_6f16 ENDP
_TEXT ENDS
END
