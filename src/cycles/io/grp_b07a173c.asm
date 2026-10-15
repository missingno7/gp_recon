_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        ASSUME  DS:DGROUP
        PUBLIC  _grp_b07a173c
        EXTRN   _G_A608:BYTE
        EXTRN   _G_A720:WORD
_grp_b07a173c PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,2
        push    si
        mov     si,OFFSET DGROUP:_G_A608
        mov     cx,word ptr ds:[_G_A720]
scan_nodes:
        test    byte ptr [si+6],83h
        jne     next_node
        sub     ax,ax
        mov     word ptr [si+2],ax
        mov     byte ptr [si+6],al
        mov     word ptr [si+4],ax
        mov     word ptr [si],ax
        mov     byte ptr [si+7],0ffh
        mov     ax,si
        jmp     done_nodes
next_node:
        mov     ax,si
        add     si,8
        cmp     ax,cx
        jne     scan_nodes
        sub     ax,ax
done_nodes:
        pop     si
        mov     sp,bp
        pop     bp
        retf
_grp_b07a173c ENDP
_TEXT ENDS
        END
