_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _grp_37b665e9
_CS_G_0C7BC EQU 0C7BCh
_grp_37b665e9 PROC NEAR
        push bp
        mov bp,sp
        push ds
        push si
        mov ds,word ptr ss:[bp+6]
        mov si,word ptr ss:[bp+4]
        mov ax,word ptr [si+2]
        cmp word ptr cs:[_CS_G_0C7BC],ax
        jne short second_copy
        mov ax,word ptr ss:[bp+8]
        mov word ptr [si+0ch],ax
        mov word ptr cs:[_CS_G_0C7BC+0ah],ax
        mov ax,word ptr ss:[bp+0ah]
        mov word ptr [si+0eh],ax
        mov word ptr cs:[_CS_G_0C7BC+0ch],ax
        mov ax,word ptr ss:[bp+0ch]
        mov word ptr [si+10h],ax
        mov word ptr cs:[_CS_G_0C7BC+0eh],ax
        mov ax,word ptr ss:[bp+0eh]
        mov word ptr [si+12h],ax
        mov word ptr cs:[_CS_G_0C7BC+10h],ax
        pop si
        pop ds
        pop bp
        ret
second_copy:
        mov ax,word ptr ss:[bp+8]
        mov word ptr [si+0ch],ax
        mov ax,word ptr ss:[bp+0ah]
        mov word ptr [si+0eh],ax
        mov ax,word ptr ss:[bp+0ch]
        mov word ptr [si+10h],ax
        mov ax,word ptr ss:[bp+0eh]
        mov word ptr [si+12h],ax
        pop si
        pop ds
        pop bp
        ret
_grp_37b665e9 ENDP
_TEXT ENDS
END
