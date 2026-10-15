; Exact reconstruction of the 106-byte far-callable EGA display helper
; present in all three Cycles display images. It selects EGA sequencer map
; masks and performs two 20-word REP MOVSW transfers. The caller and the
; observed pointer resets do not yet justify a higher-level row description.
; The helper is video-specific and no Circuit match has been established.
;
; C-compatible cdecl interface (caller cleans the twelve argument bytes):
;   void far ega_copy_planes(unsigned src_off, unsigned src_seg,
;                            unsigned dst_off, unsigned dst_seg,
;                            unsigned stride, int count);

_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT

        PUBLIC  _ega_copy_planes
_ega_copy_planes PROC FAR
        push    bp
        mov     bp,sp

        ; EGA write mode 0, bit mask 0xff.
        mov     dx,03ceh
        mov     al,5
        out     dx,al
        mov     dx,03cfh
        mov     al,0
        out     dx,al
        mov     dx,03ceh
        mov     al,8
        out     dx,al
        mov     dx,03cfh
        mov     al,0ffh
        out     dx,al

        push    es
        push    ds
        push    si
        push    di
        mov     ax,[bp+8]
        mov     ds,ax
        mov     ax,[bp+0ch]
        mov     es,ax
        mov     si,[bp+6]
        mov     di,[bp+0ah]
        mov     bx,[bp+10h]
        or      bx,bx
        jle     short copy_done

        mov     dx,20
        cld
copy_row:
        mov     dx,03c4h
        mov     al,2
        out     dx,al
        inc     dx
        mov     al,1
        out     dx,al
        mov     cx,20
        rep     movsw

        mov     dx,03c4h
        mov     al,2
        out     dx,al
        inc     dx
        mov     al,2
        out     dx,al
        mov     di,[bp+0ah]
        mov     si,[bp+6]
        add     si,[bp+0eh]
        mov     cx,20
        rep     movsw
        dec     bx
        jg      short copy_row

copy_done:
        pop     di
        pop     si
        pop     ds
        pop     es
        pop     bp
        retf
_ega_copy_planes ENDP

_TEXT ENDS
        END
