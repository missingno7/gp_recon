_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _format_frame_time
_g_00994 EQU 994h
_g_00995 EQU 995h
_g_00996 EQU 996h
EXTRN _GRP_7644DE05:NEAR
_format_frame_time PROC NEAR
        push bp
        mov bp, sp
        mov ax, word ptr [bp + 4]
        mov dx, word ptr [bp + 6]
        mov cx, 0ah
        div cx
        mov byte ptr ds:[_g_00994], dl
        mov cl, 3ch
        div cl
        mov byte ptr ds:[_g_00995], ah
        xor ah, ah
        mov cl, 3ch
        div cl
        mov byte ptr ds:[_g_00996], ah
        mov bx, 997h
        mov al, byte ptr ds:[_g_00996]
        call _GRP_7644DE05
        mov byte ptr [bx + 2], 6dh
        add bx, 3
        mov al, byte ptr ds:[_g_00995]
        call _GRP_7644DE05
        add bx, 2
        mov al, byte ptr ds:[_g_00994]
        call _GRP_7644DE05
        mov byte ptr [bx], 2eh
        mov byte ptr [bx + 2], 73h
        mov byte ptr [bx + 3], 0
        mov ax, 997h
        pop bp
        ret
_format_frame_time ENDP
_TEXT ENDS
END
