.8086
_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
RESIZE_TABLE_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:RESIZE_TABLE_TEXT, DS:DGROUP
        EXTRN _G_A590:WORD, _G_A53A:WORD, _G_A5B1:WORD
        PUBLIC _grp_1a4c7479
_grp_1a4c7479 PROC NEAR
        mov cx, word ptr [bp+0Eh]
        mov si, di
find_entry:
        cmp word ptr [si+2], cx
        je short found
        add si, 4
        cmp si, OFFSET DGROUP:_G_A590
        jne short find_entry
        stc
        jmp short done
found:
        mov bx, dx
        add bx, word ptr [si]
        jb short done
        mov dx, bx
        mov es, cx
        cmp si, di
        jne short round_size
        cmp word ptr DGROUP:[_G_A53A], bx
        jae short update_entry
round_size:
        add bx, 0Fh
        rcr bx, 1
        shr bx, 1
        shr bx, 1
        shr bx, 1
        cmp si, di
        jne short dos_resize
        add bx, cx
        mov ax, word ptr DGROUP:[_G_A5B1]
        sub bx, ax
        mov es, ax
dos_resize:
        mov ah, 4Ah
        int 21h
        jb short done
        cmp si, di
        jne short update_entry
        mov word ptr DGROUP:[_G_A53A], dx
update_entry:
        xchg dx, ax
        xchg word ptr [si], ax
        mov dx, cx
done:
        ret
_grp_1a4c7479 ENDP
RESIZE_TABLE_TEXT ENDS
        END
