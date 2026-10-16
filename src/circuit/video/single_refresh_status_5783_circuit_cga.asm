_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _refresh_status_5783
_g_05e32 EQU 5e32h
_g_05e34 EQU 5e34h
_g_05e36 EQU 5e36h
_g_05e38 EQU 5e38h
EXTRN _FN_CIRCUIT_CGA_05503:NEAR
EXTRN _FN_CIRCUIT_CGA_0B418:NEAR
EXTRN _GRP_D139669E:NEAR
EXTRN _GRP_FDACD3B7:NEAR
_refresh_status_5783 PROC NEAR
        push word ptr ds:[_g_05e34]
        push word ptr ds:[_g_05e32]
        call _FN_CIRCUIT_CGA_0B418
        add sp, 4
        call _GRP_D139669E
        call _FN_CIRCUIT_CGA_05503
        push word ptr ds:[_g_05e38]
        push word ptr ds:[_g_05e36]
        call _GRP_FDACD3B7
        add sp, 4
        ret
_refresh_status_5783 ENDP
_TEXT ENDS
END
