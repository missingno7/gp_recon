_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        EXTRN   _g_a730:BYTE
        PUBLIC  _grp_19ea88aa
_grp_19ea88aa PROC FAR
        push    bp
        mov     bp,sp
        sub     sp,2
        push    si
        mov     si,OFFSET DGROUP:_g_a730
        mov     cl,byte ptr [bp+6]
        jmp     test_byte
next_byte:
        inc     si
test_byte:
        cmp     byte ptr [si],0
        je      no_match
        cmp     cl,byte ptr [si]
        jne     next_byte
        mov     ax,1
        jmp     found_result
no_match:
        sub     ax,ax
found_result:
        pop     si
        mov     sp,bp
        pop     bp
        retf
_grp_19ea88aa ENDP
_TEXT ENDS
        END
