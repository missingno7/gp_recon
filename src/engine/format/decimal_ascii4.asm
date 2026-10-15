; Exact reconstruction of the 36-byte near-callable decimal-field formatter
; found in all five Circuit and Cycles target images.
;
; Interface observed at the original call sites:
;   input:  AL = value; BX = destination offset in DS
;   output: [DS:BX..BX+2] = three ASCII decimal digits;
;           [DS:BX+3] = NUL
;   clobbers: AX, CX, flags; BX, DS, and other registers are unchanged
;
; The original clears AH before its first DIV CL. Therefore only AL is
; converted, with leading zeroes. For AX > 255 the high byte is discarded;
; preserving this behavior is required for a strict match.

_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME  CS:_TEXT

        PUBLIC  _format_u8_decimal3
_format_u8_decimal3 PROC NEAR
        mov     byte ptr [bx+3],0
        mov     cl,10
        xor     ah,ah
        div     cl
        add     ah,30h
        mov     [bx+2],ah
        xor     ah,ah
        div     cl
        add     ah,30h
        mov     [bx+1],ah
        xor     ah,ah
        div     cl
        add     ah,30h
        mov     [bx],ah
        ret
_format_u8_decimal3 ENDP

_TEXT ENDS
        END
