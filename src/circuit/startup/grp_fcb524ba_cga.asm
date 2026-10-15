_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_054F7:NEAR
        EXTRN _FN_CIRCUIT_CGA_06B72:NEAR
        EXTRN _FN_CIRCUIT_CGA_0A802:NEAR
        EXTRN _FN_CIRCUIT_CGA_0AA3B:NEAR
        PUBLIC _grp_fcb524ba
_G_05E72 EQU 5E6Eh
_G_05E5C EQU 5E58h
_G_05E5A EQU 5E56h
_G_05E66 EQU 5E62h
_G_05E50 EQU 5E4Ch
_G_05E40 EQU 5E3Ch
_G_05E36 EQU 5E32h
_grp_fcb524ba PROC NEAR
        call _FN_CIRCUIT_CGA_0AA3B
        push cs
        push word ptr ds:[_G_05E72]
        call _FN_CIRCUIT_CGA_0A802
        add sp,4
        push word ptr ds:[_G_05E5C]
        push word ptr ds:[_G_05E5A]
        call _FN_CIRCUIT_CGA_0A802
        add sp,4
        push cs
        push word ptr ds:[_G_05E66]
        call _FN_CIRCUIT_CGA_0A802
        add sp,4
        push cs
        push word ptr ds:[_G_05E50]
        call _FN_CIRCUIT_CGA_0A802
        add sp,4
        push cs
        push word ptr ds:[_G_05E40]
        call _FN_CIRCUIT_CGA_0A802
        add sp,4
        push cs
        push word ptr ds:[_G_05E36]
        call _FN_CIRCUIT_CGA_0A802
        add sp,4
        call _FN_CIRCUIT_CGA_054F7
        xor ax,ax
        push ax
        call _FN_CIRCUIT_CGA_06B72
        add sp,2
        ret
_grp_fcb524ba ENDP
_TEXT ENDS
END
