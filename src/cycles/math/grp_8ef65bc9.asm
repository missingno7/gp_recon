; Signed absolute-value leaf. Its shared far epilogue is explicit in all members.
_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT
        PUBLIC  _grp_8ef65bc9
_grp_8ef65bc9 PROC FAR
        push    bp
        mov     bp,sp
        cmp     word ptr [bp+6],0
        jl      short negative
        mov     ax,word ptr [bp+6]
        jmp     short done
negative:
        mov     ax,word ptr [bp+6]
        neg     ax
done:
        pop     bp
        retf
_grp_8ef65bc9 ENDP
_TEXT ENDS
        END
