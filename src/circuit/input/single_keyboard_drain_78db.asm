_TEXT SEGMENT WORD PUBLIC 'CODE'
        ASSUME CS:_TEXT
        PUBLIC _drain_keyboard_buffer_78db
_drain_keyboard_buffer_78db PROC NEAR
L_POLL:
        mov ah, 1
        int 16h
        jne short L_READ
        xor ax, ax
        ret
L_READ:
        mov ah, 0
        int 16h
        jmp short L_POLL
_drain_keyboard_buffer_78db ENDP
_TEXT ENDS
END
