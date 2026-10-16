_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _refresh_status_5783
_g_05e36 EQU 5e36h
_g_05e38 EQU 5e38h
_g_05e3a EQU 5e3ah
_g_05e3c EQU 5e3ch
EXTRN _FN_CIRCUIT_EGA_0564D:NEAR
EXTRN _FN_CIRCUIT_EGA_08CD8:NEAR
EXTRN _FN_CIRCUIT_EGA_0A6DC:NEAR
EXTRN _GRP_D139669E:NEAR
_refresh_status_5783 PROC NEAR
        push word ptr ds:[_g_05e38]
        push word ptr ds:[_g_05e36]
        call _FN_CIRCUIT_EGA_08CD8
        add sp, 4
        call _GRP_D139669E
        call _FN_CIRCUIT_EGA_0564D
        push word ptr ds:[_g_05e3c]
        push word ptr ds:[_g_05e3a]
        call _FN_CIRCUIT_EGA_0A6DC
        add sp, 4
        ret
_refresh_status_5783 ENDP
_TEXT ENDS
END
