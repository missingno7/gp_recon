_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _read_interrupt_vector
_g_00022 EQU 22h
_read_interrupt_vector PROC NEAR
        xor ax, ax
        mov es, ax
        mov ax, word ptr es:[_g_00022]
        mov dx, cs
        cmp ax, dx
        je short $++3h
        ret
_read_interrupt_vector ENDP
_TEXT ENDS
END
