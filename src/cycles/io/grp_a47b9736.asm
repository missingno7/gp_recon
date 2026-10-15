_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_A47 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_A47
        ASSUME  DS:DGROUP
        PUBLIC  _grp_a47b9736
        EXTRN   _G_DTA:BYTE, _G_FILENAME:BYTE, _G_SPLIT_PTR:WORD, _G_TRAILER:BYTE
_grp_a47b9736 PROC FAR
        push    bp
        mov     bp,sp
        push    ds
        push    si
        push    di
        mov     dx,OFFSET DGROUP:_G_DTA
        mov     ah,1ah
        int     21h
        mov     dx,word ptr [bp+6]
        mov     cl,6
        mov     ah,4eh
        int     21h
        jb      fail_return
        mov     di,OFFSET DGROUP:_G_FILENAME
        mov     word ptr ds:[_G_SPLIT_PTR],di
        mov     si,word ptr [bp+6]
        mov     cx,57h
path_loop:
        mov     al,byte ptr [si]
        mov     byte ptr [di],al
        inc     si
        inc     di
        cmp     al,0
        je      path_done
        cmp     al,3ah
        je      path_split
        cmp     al,5ch
        jne     path_next
path_split:
        mov     word ptr ds:[_G_SPLIT_PTR],di
path_next:
        loop    path_loop
path_done:
        mov     ax,ds
        mov     es,ax
        mov     si,OFFSET DGROUP:_G_TRAILER
        mov     di,word ptr ds:[_G_SPLIT_PTR]
        mov     cx,0dh
        cld
        rep     movsb
        mov     ax,OFFSET DGROUP:_G_FILENAME
restore_regs:
        pop     di
        pop     si
        pop     ds
        pop     bp
        retf
fail_return:
        xor     ax,ax
        jmp     restore_regs
_grp_a47b9736 ENDP
_CSEG_A47 ENDS
        END
