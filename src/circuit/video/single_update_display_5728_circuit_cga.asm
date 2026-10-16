_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _update_display_5728
_g_05e2e EQU 5e2eh
_g_05ed4 EQU 5ed4h
EXTRN _FN_CIRCUIT_CGA_0278C:NEAR
EXTRN _FN_CIRCUIT_CGA_05503:NEAR
EXTRN _FN_CIRCUIT_CGA_05639:NEAR
_update_display_5728 PROC NEAR
        call _FN_CIRCUIT_CGA_05503
        cmp byte ptr ds:[_g_05e2e], 0ffh
        jne short L_55EB
        call _FN_CIRCUIT_CGA_05639
L_55EB:
        mov al, byte ptr ds:[_g_05ed4]
        and al, 0fh
        cmp al, 5
        jne short L_55FE
        mov ax, 5ed4h
        push ax
        call _FN_CIRCUIT_CGA_0278C
        add sp, 2
L_55FE:
        mov al, byte ptr ds:[_g_05ed4]
        and al, 0fh
        cmp al, 7
        je short $++3h
        ret
_update_display_5728 ENDP
_TEXT ENDS
END
