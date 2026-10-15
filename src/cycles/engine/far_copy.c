void grp_3da26d9f(char far *destination, char far *source, unsigned count)
{
    while (count--)
        *destination++ = *source++;
}
