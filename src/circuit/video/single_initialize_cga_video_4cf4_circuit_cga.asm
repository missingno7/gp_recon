_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _initialize_cga_video_4cf4
_CS_G_0A846 EQU 0a846h
_CS_G_0A848 EQU 0a848h
_CS_G_0A84A EQU 0a84ah
_CS_G_0A84C EQU 0a84ch
_g_05e22 EQU 5e22h
_g_05e24 EQU 5e24h
_g_05e28 EQU 5e28h
_g_05e2a EQU 5e2ah
_g_06b8a EQU 6b8ah
_g_06b8c EQU 6b8ch
_g_06b8e EQU 6b8eh
_g_06b90 EQU 6b90h
_g_09ba4 EQU 9ba4h
EXTRN _FN_CIRCUIT_CGA_04AFD:NEAR
EXTRN _FN_CIRCUIT_CGA_05503:NEAR
EXTRN _FN_CIRCUIT_CGA_068EE:NEAR
EXTRN _GRP_1F63AB13:NEAR
EXTRN _GRP_32A19DA2:NEAR
EXTRN _GRP_389C6FA6:NEAR
EXTRN _GRP_5B2E6DBB:NEAR
EXTRN _GRP_93D4BA6D:NEAR
_initialize_cga_video_4cf4 PROC NEAR
        call _FN_CIRCUIT_CGA_05503
        mov ax, 6fh
        mov word ptr cs:[_CS_G_0A84C], ax
        mov word ptr ds:[_g_05e22], ax
        mov word ptr cs:[_CS_G_0A84A], 0
        mov word ptr ds:[_g_05e28], 140h
        mov word ptr cs:[_CS_G_0A848], 50h
        mov word ptr cs:[_CS_G_0A846], 0
        mov word ptr ds:[_g_05e24], 48h
        mov word ptr ds:[_g_05e2a], 28h
        call _FN_CIRCUIT_CGA_04AFD
        call _GRP_1F63AB13
        call _GRP_389C6FA6
        call _GRP_93D4BA6D
        cmp word ptr ds:[_g_09ba4], 0
        jg short L_4C37
        push word ptr ds:[_g_06b8c]
        push word ptr ds:[_g_06b8a]
        push word ptr ds:[_g_06b90]
        push word ptr ds:[_g_06b8e]
        call _FN_CIRCUIT_CGA_068EE
        add sp, 4
        call _GRP_5B2E6DBB
        add sp, 4
L_4C37:
        call _GRP_32A19DA2
        ret
_initialize_cga_video_4cf4 ENDP
_TEXT ENDS
END
