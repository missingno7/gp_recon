_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _update_display_5728
_g_05e32 EQU 5e32h
_g_05ef0 EQU 5ef0h
EXTRN _FN_CIRCUIT_EGA_02790:NEAR
EXTRN _FN_CIRCUIT_EGA_0564D:NEAR
EXTRN _FN_CIRCUIT_EGA_05783:NEAR
_update_display_5728 PROC NEAR
        call _FN_CIRCUIT_EGA_0564D
        cmp byte ptr ds:[_g_05e32], 0ffh
        jne short L_5735
        call _FN_CIRCUIT_EGA_05783
L_5735:
        mov al, byte ptr ds:[_g_05ef0]
        and al, 0fh
        cmp al, 5
        jne short L_5748
        mov ax, 5ef0h
        push ax
        call _FN_CIRCUIT_EGA_02790
        add sp, 2
L_5748:
        mov al, byte ptr ds:[_g_05ef0]
        and al, 0fh
        cmp al, 7
        je short $++3h
        ret
_update_display_5728 ENDP
_TEXT ENDS
END
