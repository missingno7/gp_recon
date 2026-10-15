_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        PUBLIC  _grp_ddba65f3
_grp_ddba65f3 PROC FAR
        push    bp
        mov     bp,sp
        push    si
        mov     si,word ptr [bp+6]
        cld
scan_path:
        lodsb
        or      al,al
        je      done_path
        cmp     al,':'
        je      update_path
        cmp     al,'\'
        jne     scan_path
update_path:
        mov     word ptr [bp+6],si
        jmp     scan_path
done_path:
        mov     ax,word ptr [bp+6]
        pop     si
        pop     bp
        retf
_grp_ddba65f3 ENDP
_TEXT ENDS
        END
