_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _read_param_byte_7893
_read_param_byte_7893 PROC NEAR
        push bp
        mov bp, sp
        mov bx, word ptr [bp+4]
        mov al, byte ptr [bx-7c2ah]
        pop bp
        ret
_read_param_byte_7893 ENDP
_TEXT ENDS
END
