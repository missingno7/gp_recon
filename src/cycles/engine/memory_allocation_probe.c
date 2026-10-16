typedef unsigned short word;
extern word far grp_69b75d8c(word, word);
extern void far grp_2e800973(word);
word far fn_cycles_ega_0e5fa(word input)
{
    word result = grp_69b75d8c(input, 0xcc);
    if (!result)
        return 0;
    grp_2e800973(result);
    return 1;
}
