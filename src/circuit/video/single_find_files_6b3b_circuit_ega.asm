_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _find_files
_g_07f44 EQU 7f44h
common_return:
        mov ax,ds
        mov es,ax
        mov si,7f64h
        mov di,word ptr ds:[_g_07f44]
        mov cx,0dh
        rep movsb
        mov ax,7ee0h
pop_di:
        pop di
        pop si
        pop ds
        pop bp
        ret
zero_return:
        xor ax,ax
        jmp short pop_di
_find_files PROC NEAR
        push bp
        mov bp,sp
        push ds
        push si
        push di
        mov dx,7f46h
        mov ah,1ah
        int 21h
        mov ah,4fh
        int 21h
        jb short zero_return
        jmp short common_return
_find_files ENDP
_TEXT ENDS
END
