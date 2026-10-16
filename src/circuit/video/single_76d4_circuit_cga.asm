_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _grp_76d4
_grp_76d4 PROC NEAR
        push bp
        mov bp, sp
        mov bx, word ptr [bp + 4]
        and bx, 0fh
        mov al, byte ptr [bx + 7c94h]
        xor ah, ah
        pop bp
        ret
_grp_76d4 ENDP
_TEXT ENDS
END
