.8086
DGROUP GROUP DSEG
DSEG SEGMENT BYTE PUBLIC 'DATA'
DSEG ENDS
ASSUME DS:DGROUP
EXTRN _G_LAST_KEY:BYTE
EXTRN _G_KEY_MODE:BYTE
EXTRN _G_KEY_TABLE:BYTE
EXTRN _G_KEY_RESULT:WORD
_TEXT SEGMENT WORD PUBLIC 'CODE'
ASSUME CS:_TEXT
PUBLIC _keyboard_translate_keycode
_keyboard_translate_keycode PROC NEAR
        mov     byte ptr _G_LAST_KEY,al
        or      ah,ah
        jne     short key_extended
        cmp     byte ptr _G_KEY_MODE,3
        jb      short key_lower
        cmp     al,22h
        jae     short key_cap
        cmp     al,20h
        jb      short key_lower
        mov     al,5
        jmp     short key_translate
        nop
key_lower:
        cmp     al,13h
        jbe     short key_translate
key_cap:
        mov     al,13h
key_translate:
        mov     bx,OFFSET _G_KEY_TABLE
        xlatb
key_cwde:
        cbw
        mov     word ptr _G_KEY_RESULT,ax
        ret
key_extended:
        mov     al,ah
        jmp     short key_cwde
_keyboard_translate_keycode ENDP
_TEXT ENDS
END
