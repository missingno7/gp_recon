_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_05641:NEAR
        EXTRN _FN_CIRCUIT_EGA_08B26:NEAR
        EXTRN _FN_CIRCUIT_EGA_08B9B:NEAR
        EXTRN _FN_CIRCUIT_EGA_09360:NEAR
        PUBLIC _grp_fcb524ba
_G_05E72 EQU 5E72h
_G_05E5C EQU 5E5Ch
_G_05E5A EQU 5E5Ah
_G_05E66 EQU 5E66h
_G_05E50 EQU 5E50h
_G_05E40 EQU 5E40h
_G_05E36 EQU 5E36h
_grp_fcb524ba PROC NEAR
        call _FN_CIRCUIT_EGA_08B9B
        push cs
        push word ptr ds:[_G_05E72]
        call _FN_CIRCUIT_EGA_08B26
        add sp,4
        push word ptr ds:[_G_05E5C]
        push word ptr ds:[_G_05E5A]
        call _FN_CIRCUIT_EGA_08B26
        add sp,4
        push cs
        push word ptr ds:[_G_05E66]
        call _FN_CIRCUIT_EGA_08B26
        add sp,4
        push cs
        push word ptr ds:[_G_05E50]
        call _FN_CIRCUIT_EGA_08B26
        add sp,4
        push cs
        push word ptr ds:[_G_05E40]
        call _FN_CIRCUIT_EGA_08B26
        add sp,4
        push cs
        push word ptr ds:[_G_05E36]
        call _FN_CIRCUIT_EGA_08B26
        add sp,4
        call _FN_CIRCUIT_EGA_05641
        xor ax,ax
        push ax
        call _FN_CIRCUIT_EGA_09360
        add sp,2
        ret
_grp_fcb524ba ENDP
_TEXT ENDS
END
