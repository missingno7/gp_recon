_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _initialize_ega_video_4cf4
_CS_G_0C7BC EQU 0c7bch
_CS_G_0C7BE EQU 0c7beh
_CS_G_0C7C0 EQU 0c7c0h
_CS_G_0C7C2 EQU 0c7c2h
_CS_G_0C7C6 EQU 0c7c6h
_CS_G_0C7C8 EQU 0c7c8h
_CS_G_0C7CA EQU 0c7cah
_CS_G_0C7CC EQU 0c7cch
_g_05e26 EQU 5e26h
_g_05e28 EQU 5e28h
_g_05e2c EQU 5e2ch
_g_05e2e EQU 5e2eh
_g_05e58 EQU 5e58h
_g_06ba6 EQU 6ba6h
_g_06ba8 EQU 6ba8h
_g_06baa EQU 6baah
_g_06bac EQU 6bach
_g_06c10 EQU 6c10h
_g_06c12 EQU 6c12h
_g_06c14 EQU 6c14h
_g_06c16 EQU 6c16h
_g_09bd4 EQU 9bd4h
EXTRN _FN_CIRCUIT_EGA_04BCB:NEAR
EXTRN _FN_CIRCUIT_EGA_04C0A:NEAR
EXTRN _FN_CIRCUIT_EGA_0564D:NEAR
EXTRN _FN_CIRCUIT_EGA_09026:NEAR
EXTRN _FN_CIRCUIT_EGA_0BE96:NEAR
EXTRN _GRP_1F63AB13:NEAR
EXTRN _GRP_32A19DA2:NEAR
EXTRN _GRP_389C6FA6:NEAR
EXTRN _GRP_93D4BA6D:NEAR
_initialize_ega_video_4cf4 PROC NEAR
        call _FN_CIRCUIT_EGA_0564D
        mov ax, 6fh
        mov word ptr cs:[_CS_G_0C7CC], ax
        mov word ptr ds:[_g_05e26], ax
        mov word ptr cs:[_CS_G_0C7CA], 0
        mov word ptr ds:[_g_05e2c], 140h
        mov word ptr cs:[_CS_G_0C7C8], 28h
        mov word ptr cs:[_CS_G_0C7C6], 0
        mov word ptr ds:[_g_05e28], 48h
        mov word ptr ds:[_g_05e2e], 14h
        mov ax, word ptr cs:[_CS_G_0C7BC]
        mov word ptr ds:[_g_06c10], ax
        mov ax, word ptr cs:[_CS_G_0C7BE]
        mov word ptr ds:[_g_06c12], ax
        mov ax, word ptr cs:[_CS_G_0C7C0]
        mov word ptr ds:[_g_06c14], ax
        mov ax, word ptr cs:[_CS_G_0C7C2]
        mov word ptr ds:[_g_06c16], ax
        call _FN_CIRCUIT_EGA_04BCB
        call _GRP_1F63AB13
        call _GRP_389C6FA6
        mov bx, 49h
        shl bx, 1
        add bx, word ptr ds:[_g_05e58]
        mov cx, 2f8h
        call _FN_CIRCUIT_EGA_04C0A
        call _GRP_93D4BA6D
        cmp word ptr ds:[_g_09bd4], 0
        jg short L_4D82
        push word ptr ds:[_g_06ba8]
        push word ptr ds:[_g_06ba6]
        push word ptr ds:[_g_06bac]
        push word ptr ds:[_g_06baa]
        call _FN_CIRCUIT_EGA_09026
        add sp, 4
        call _FN_CIRCUIT_EGA_0BE96
        add sp, 4
L_4D82:
        call _GRP_32A19DA2
        ret
_initialize_ega_video_4cf4 ENDP
_TEXT ENDS
END
