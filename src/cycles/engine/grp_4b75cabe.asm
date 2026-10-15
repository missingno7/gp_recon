_DATA SEGMENT WORD PUBLIC 'DATA'
        EXTRN   _G_TIME_TICKS:BYTE, _G_TIME_SECONDS:BYTE
        EXTRN   _G_TIME_MINUTES:BYTE, _G_TIME_TEXT:BYTE
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_4B7 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_4B7
        ASSUME  DS:DGROUP
        PUBLIC  _grp_4b75cabe
_grp_4b75cabe PROC FAR
        push    bp
        mov     bp,sp
        mov     ax,word ptr [bp+6]
        mov     dx,word ptr [bp+8]
        cmp     dx,20h
        jbe     convert_time
        xor     ax,ax
        xor     dx,dx
convert_time:
        mov     cx,14h
        div     cx
        shr     dl,1
        mov     byte ptr [_G_TIME_TICKS],dl
        mov     cx,3ch
        xor     dx,dx
        div     cx
        mov     byte ptr [_G_TIME_SECONDS],dl
        xor     dx,dx
        mov     cx,3ch
        div     cx
        mov     byte ptr [_G_TIME_MINUTES],dl
        mov     bx,OFFSET DGROUP:_G_TIME_TEXT
        mov     al,byte ptr [_G_TIME_MINUTES]
        call    NEAR PTR format_byte
        mov     byte ptr [bx+2],6dh
        add     bx,3
        mov     al,byte ptr [_G_TIME_SECONDS]
        call    NEAR PTR format_byte
        add     bx,2
        mov     al,byte ptr [_G_TIME_TICKS]
        call    NEAR PTR format_byte
        mov     byte ptr [bx],2eh
        mov     byte ptr [bx+2],73h
        mov     byte ptr [bx+3],0
        mov     ax,OFFSET DGROUP:_G_TIME_TEXT
        pop     bp
        retf
format_byte:
_grp_4b75cabe ENDP
_CSEG_4B7 ENDS
        END
