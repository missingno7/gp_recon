.8086
; Circuit variant: near entry/return and two-byte-lower stack arguments.
S012_TEXT segment byte public 'CODE'
assume cs:S012_TEXT
public _file_get_shape2d
_file_get_shape2d proc near
 push bp
 mov bp,sp
 push si
 mov es,[bp+6]
 mov si,word ptr [bp+4]
 mov ax,word ptr es:[si+4]
 shl ax,1
 shl ax,1
 mov bx,word ptr [bp+8]
 shl bx,1
 shl bx,1
 add bx,ax
 add bx,6
 shl ax,1
 add ax,6
 mov cx,es
 xor dx,dx
 shl cx,1
 rcl dx,1
 shl cx,1
 rcl dx,1
 shl cx,1
 rcl dx,1
 shl cx,1
 rcl dx,1
 add ax,cx
 adc dx,0
 add ax,word ptr es:[bx]
 adc dx,word ptr es:[bx+2]
 mov bx,ax
 and bx,0Fh
 shr dx,1
 rcr ax,1
 shr dx,1
 rcr ax,1
 shr dx,1
 rcr ax,1
 shr dx,1
 rcr ax,1
 mov dx,ax
 mov ax,bx
 pop si
 pop bp
 ret
_file_get_shape2d endp
S012_TEXT ends
end
