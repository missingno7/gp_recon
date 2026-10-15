int pascal fn_cycles_ega_03c9c(long, long);
long pascal grp_183e807a(long);
long pascal grp_77e01831(long);
extern unsigned g_a8c6;
extern unsigned g_a8c8;
extern unsigned g_a8c2;
extern unsigned g_a8c4;
extern unsigned g_08e46;
extern unsigned g_08e44;
extern unsigned char g_08e4a[];
extern unsigned char g_08e56[];
extern unsigned g_08cc4[];
extern unsigned g_08d84[];
long grp_4896bb94(int value);
int far grp_71323de6(void);

long grp_4896bb94(int value)
{
    return grp_77e01831(grp_183e807a(fn_cycles_ega_03c9c(0x7fffL, (long)value)));
}

int far grp_71323de6(void)
{
    register int index;
    int value;
    index = (signed char)g_08e4a[g_a8c6];
    value = g_08cc4[(g_a8c8 << 3) + index];
    if (value == -1) {
        g_a8c8 = (signed char)g_08e56[g_a8c6] + g_a8c2 - g_a8c4;
        if (g_a8c8 >= 12)
            g_a8c8 -= 12;
        if ((int)g_a8c8 < 0)
            g_a8c8 += 12;
        value = g_08d84[(g_a8c8 << 3) + index];
    }
    value ^= 0x63;
    if (value != g_08e46)
        return -1;
    if (g_08e44 == 0xffff)
        return -2;
    return 0;
}
