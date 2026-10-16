_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_6ee8
_g_07fec EQU 7fech
_g_07fee EQU 7feeh
_g_07ff0 EQU 7ff0h
_g_07ff2 EQU 7ff2h
_g_0802e EQU 802eh
_g_08030 EQU 8030h
_grp_6ee8 PROC NEAR
        push bp
        mov bp, sp
        mov dx, 2e9ch
        mov word ptr ds:[_g_0802e], 7138h
        cli
        mov word ptr ds:[_g_08030], 0
        sti
        mov word ptr ds:[_g_07ff0], 5
        mov word ptr ds:[_g_07ff2], 5
        mov word ptr ds:[_g_07fee], 64h
        mov byte ptr ds:[_g_07fec], 1
        jmp near ptr $++88h
_grp_6ee8 ENDP
_TEXT ENDS
END
