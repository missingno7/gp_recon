.8086
_TEXT segment word public 'CODE'
assume cs:_TEXT
public _sub_2CE77
_sub_2CE77 proc near
sub_2CE77_walk:
    cmp si, di
    jae short sub_2CE77_done
    sub di, 4
    mov ax, word ptr [di]
    or ax, word ptr [di+2]
    je short sub_2CE77_walk
    call dword ptr [di]
    jmp short sub_2CE77_walk
sub_2CE77_done:
    ret
_sub_2CE77 endp
_TEXT ends
end
