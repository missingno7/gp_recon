.8086
_TEXT segment word public 'CODE'
assume cs:_TEXT
public _multiply_and_scale
_multiply_and_scale proc far
    push bp
    mov bp, sp
    mov ax, [bp+6]
    imul word ptr [bp+8]
    shl ax, 1
    rcl dx, 1
    shl ax, 1
    rcl dx, 1
    shl ax, 1
    adc dx, 0
    mov ax, dx
    pop bp
    retf
_multiply_and_scale endp
_TEXT ends
end
