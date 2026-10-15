.8086
FILL_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:FILL_TEXT
        EXTRN _G_4802:WORD, _G_480A:WORD, _G_480C:WORD, _G_480E:WORD, _G_4810:WORD, _G_4812:WORD
        PUBLIC _grp_e76f1ca2
_grp_e76f1ca2 PROC NEAR
        push bp
        mov bp,sp
        push ds
        push si
        push di
        mov ax,word ptr cs:[_G_4802]
        mov es,ax
        mov dx,word ptr cs:[_G_4812]
        mov bx,word ptr cs:[_G_4810]
        sub dx,bx
        shl bx,1
        mov ax,word ptr [bp+4]
        mov bp,word ptr cs:[_G_480E]
        mov si,word ptr cs:[_G_480C]
        sub bp,si
fill_test:
        test bx,2
        jne short fill_skip_swap
        xchg ah,al
fill_skip_swap: add bx,word ptr cs:[_G_480A]
fill_row:
        mov di,word ptr cs:[bx]
        add di,si
        mov cx,bp
        rep stosb
        xchg al,ah
        inc bx
        inc bx
        dec dx
        jg short fill_row
        pop di
        pop si
        pop ds
        pop bp
        ret
_grp_e76f1ca2 ENDP
FILL_TEXT ENDS
        END
