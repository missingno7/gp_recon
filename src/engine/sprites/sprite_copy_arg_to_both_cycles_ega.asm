.8086
; Cycles adaptation: copy 26 words; the Stunts source copies 30.
S012_TEXT segment word public 'CODE'
assume cs:S012_TEXT
org 6B36h
extrn _sprite1:byte
public _sprite_copy_arg_to_both
_sprite_copy_arg_to_both proc far
 push bp
 mov bp,sp
 push ds
 push di
 push si
 mov si,word ptr [bp+6]
 mov ax,cs
 mov es,ax
 lea di,_sprite1
 cld
 mov cx,1Ah
 rep movsw
 pop si
 pop di
 pop ds
 pop bp
 ret
_sprite_copy_arg_to_both endp
S012_TEXT ends
end
