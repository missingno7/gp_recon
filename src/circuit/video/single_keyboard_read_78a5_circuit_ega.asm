_DATA SEGMENT WORD PUBLIC 'DATA'
_DATA ENDS
DGROUP GROUP _DATA
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT, DS:DGROUP
PUBLIC _keyboard_read
_keyboard_read PROC NEAR
        mov ah, 1
        int 16h
        jne short L_78AE
        xor ax, ax
        ret
L_78AE:
        mov ah, 0
        int 16h
        or al, al
        je short L_78B8
        xor ah, ah
L_78B8:
        ret
_keyboard_read ENDP
_TEXT ENDS
END
