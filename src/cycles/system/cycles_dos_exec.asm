.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
CYCLES_DOS_EXEC_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:CYCLES_DOS_EXEC_TEXT, DS:DGROUP
        PUBLIC _grp_31639679
        EXTRN _g_08e62:WORD
        EXTRN _g_08e64:WORD
        EXTRN _CS_SAVED_SS:WORD
        EXTRN _CS_SAVED_SP:WORD
_grp_31639679 PROC FAR
        push bp
        mov bp, sp
        push es
        push ds
        push di
        push si
        mov ah, 4Bh
        mov al, 3
        les bx, dword ptr [bp+8]
        mov word ptr ds:_g_08e62, es
        mov word ptr ds:_g_08e64, es
        mov bx, ds
        mov es, bx
        mov bx, OFFSET DGROUP:_g_08e62
        mov dx, word ptr [bp+6]
        push bp
        mov word ptr cs:_CS_SAVED_SS, ss
        mov word ptr cs:_CS_SAVED_SP, sp
        int 21h
        jb short exec_error
        mov ax, 0
exec_error:
        cli
        mov ss, word ptr cs:_CS_SAVED_SS
        mov sp, word ptr cs:_CS_SAVED_SP
        pop bp
        sti
        pop si
        pop di
        pop ds
        pop es
        pop bp
        retf
_grp_31639679 ENDP
CYCLES_DOS_EXEC_TEXT ENDS
        END
