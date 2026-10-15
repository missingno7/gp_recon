_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        EXTRN _FN_CIRCUIT_CGA_05590:NEAR
        PUBLIC _grp_64baada8
_G_00994 EQU 0994h
_G_00995 EQU 0995h
_G_00996 EQU 0996h
_grp_64baada8 PROC NEAR
        push bp
        mov bp,sp
        mov ax,word ptr [bp+4]
        mov dx,word ptr [bp+6]
        mov cx,10
        div cx
        mov byte ptr ds:[_G_00994],dl
        mov cl,60
        div cl
        mov byte ptr ds:[_G_00995],ah
        xor ah,ah
        mov cl,60
        div cl
        mov byte ptr ds:[_G_00996],ah
        mov bx,0997h
        mov al,byte ptr ds:[_G_00996]
        call _FN_CIRCUIT_CGA_05590
        mov byte ptr [bx+2], 'm'
        add bx,3
        mov al,byte ptr ds:[_G_00995]
        call _FN_CIRCUIT_CGA_05590
        add bx,2
        mov al,byte ptr ds:[_G_00994]
        call _FN_CIRCUIT_CGA_05590
        mov byte ptr [bx],'.'
        mov byte ptr [bx+2],'s'
        mov byte ptr [bx+3],0
        mov ax,0997h
        pop bp
        ret
_grp_64baada8 ENDP
_TEXT ENDS
END
