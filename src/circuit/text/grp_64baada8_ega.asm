_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_EGA_056DA:NEAR
        PUBLIC _grp_64baada8
_G_00998 EQU 0998h
_G_00999 EQU 0999h
_G_0099A EQU 099Ah
_grp_64baada8 PROC NEAR
        push bp
        mov bp,sp
        mov ax,word ptr [bp+4]
        mov dx,word ptr [bp+6]
        mov cx,10
        div cx
        mov byte ptr ds:[_G_00998],dl
        mov cl,60
        div cl
        mov byte ptr ds:[_G_00999],ah
        xor ah,ah
        mov cl,60
        div cl
        mov byte ptr ds:[_G_0099A],ah
        mov bx,099Bh
        mov al,byte ptr ds:[_G_0099A]
        call _FN_CIRCUIT_EGA_056DA
        mov byte ptr [bx+2], 'm'
        add bx,3
        mov al,byte ptr ds:[_G_00999]
        call _FN_CIRCUIT_EGA_056DA
        add bx,2
        mov al,byte ptr ds:[_G_00998]
        call _FN_CIRCUIT_EGA_056DA
        mov byte ptr [bx],'.'
        mov byte ptr [bx+2],'s'
        mov byte ptr [bx+3],0
        mov ax,099Bh
        pop bp
        ret
_grp_64baada8 ENDP
_TEXT ENDS
END
