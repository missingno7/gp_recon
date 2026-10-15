.8086
DGROUP GROUP DSEG
DSEG SEGMENT BYTE PUBLIC 'DATA'
DSEG ENDS
ASSUME DS:DGROUP
EXTRN _G_SCORE_1:WORD
EXTRN _G_SCORE_2:WORD
EXTRN _G_TABLE_1:WORD
EXTRN _G_TABLE_2:WORD
EXTRN _G_RANK:WORD
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _score_compute_rank
_score_compute_rank PROC FAR
        push    di
        push    bp
        mov     cx,9
        mov     bp,2
        mov     ax,word ptr _G_SCORE_1
        mov     dx,word ptr _G_SCORE_2
        mov     bx,1
rank_loop:
        cmp     dx,word ptr _G_TABLE_1[bp]
        jg      short rank_next
        jl      short rank_inc
        cmp     ax,word ptr _G_TABLE_2[bp]
        ja      short rank_next
rank_inc:
        inc     bx
rank_next:
        inc     bp
        inc     bp
        loop    rank_loop
        mov     word ptr _G_RANK,bx
        pop     bp
        pop     di
        retf
_score_compute_rank ENDP
_TEXT ENDS
END
