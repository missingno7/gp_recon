typedef short I16;
/* MSC runtime routine recovered as a CRT symbol, not DSI game source. */
I16 toupper(I16 ch)
{
    if (ch >= 'a' && ch <= 'z') {
        ch -= ' ';
    }
    return ch;
}
