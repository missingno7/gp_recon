_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _grp_e61cb645
_G_07F46 EQU 77F8h
_G_07F44 EQU 77F6h
_G_07EE0 EQU 7792h
_G_07F64 EQU 7816h
_grp_e61cb645 PROC NEAR
        push bp
        mov bp,sp
        push ds
        push si
        push di
        mov dx,_G_07F46
        mov ah,1ah
        int 21h
        mov dx,word ptr ss:[bp+4]
        mov cl,6
        mov ah,4eh
        int 21h
        jb short failed
        mov di,_G_07EE0
        mov word ptr ds:[_G_07F44],di
        mov si,word ptr ss:[bp+4]
        mov cx,57h
copy_name:
        mov al,byte ptr [si]
        mov byte ptr [di],al
        inc si
        inc di
        cmp al,0
        je short copied
        cmp al,3ah
        je short save_last
        cmp al,5ch
        jne short next_char
save_last:
        mov word ptr ds:[_G_07F44],di
next_char:
        loop short copy_name
copied:
        mov ax,ds
        mov es,ax
        mov si,_G_07F64
        mov di,word ptr ds:[_G_07F44]
        mov cx,0dh
        rep movsb
        mov ax,_G_07EE0
return:
        pop di
        pop si
        pop ds
        pop bp
        ret
failed:
        xor ax,ax
        jmp short return
_grp_e61cb645 ENDP
_TEXT ENDS
END
