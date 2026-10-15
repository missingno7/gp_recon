_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_CSEG_DE0 SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_CSEG_DE0
        ASSUME  DS:DGROUP
        PUBLIC  _grp_de0df4b9
        EXTRN   _G_FILE_META:WORD, _G_OPEN_FLAGS:BYTE
        EXTRN   _FN_CYCLES_CGA_02B5F:NEAR
        EXTRN   _FN_CYCLES_CGA_02B32:NEAR
        EXTRN   _FN_CYCLES_CGA_03D34:FAR
_grp_de0df4b9 PROC FAR
        push    bp
        mov     bp,sp
        mov     si,OFFSET DGROUP:_G_FILE_META
        mov     di,OFFSET DGROUP:_G_FILE_META
        call    NEAR PTR _FN_CYCLES_CGA_02B5F
        mov     si,OFFSET DGROUP:_G_FILE_META
        mov     di,OFFSET DGROUP:_G_FILE_META
        call    NEAR PTR _FN_CYCLES_CGA_02B5F
        call    FAR PTR _FN_CYCLES_CGA_03D34
        or      ax,ax
        je      exit_check_done
        cmp     word ptr [bp+6],0
        jne     exit_check_done
        mov     word ptr [bp+6],0ffh
exit_check_done:
        mov     cx,0fh
        mov     bx,5
close_loop:
        test    byte ptr ds:[bx+_G_OPEN_FLAGS],1
        je      close_next
        mov     ah,3eh
        int     21h
close_next:
        inc     bx
        loop    close_loop
        call    NEAR PTR _FN_CYCLES_CGA_02B32
        mov     ax,word ptr [bp+6]
        mov     ah,4ch
        int     21h
_grp_de0df4b9 ENDP
_CSEG_DE0 ENDS
        END
