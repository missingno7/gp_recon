.8086
DGROUP GROUP DSEG
DSEG SEGMENT BYTE PUBLIC 'DATA'
DSEG ENDS
ASSUME DS:DGROUP
EXTRN _G_CHAR_TABLE:BYTE
EXTRN _G_MAP_TABLE:BYTE
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _grp_43ff7e15
_grp_43ff7e15 PROC NEAR
        push    bp
        mov     bp,sp
        lea     bx,_G_CHAR_TABLE
        mov     cx,6
map_search:
        cmp     byte ptr cs:[bx],al
        je      short map_found
        dec     bx
        loop    map_search
        stc
        jmp     short map_finish
        nop
map_found:
        dec     cx
        mov     ax,cx
        shl     ax,1
        shl     ax,1
        lea     bx,_G_MAP_TABLE
        add     bx,ax
        clc
map_finish:
        mov     sp,bp
        pop     bp
        ret
_grp_43ff7e15 ENDP
_TEXT ENDS
END
