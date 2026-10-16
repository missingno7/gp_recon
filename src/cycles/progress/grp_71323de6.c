extern int far grp_71323de6(void);
#pragma alloc_text(GAP_71323DE6_TEXT, grp_71323de6)
extern int g_cga_8cc4[12][8];
extern int g_cga_8d84[12][8];
extern char g_cga_8e4a[], g_cga_8e56[];
extern int g_cga_a8c6, g_cga_a8c8, g_cga_a8c2, g_cga_a8c4;
extern int g_cga_8e46, g_cga_8e44;
int far grp_71323de6(void)
{
    int value;
    value = g_cga_8cc4[g_cga_a8c8][g_cga_8e4a[g_cga_a8c6]];
    if (value == -1) {
        g_cga_a8c8 = g_cga_8e56[g_cga_a8c6] + g_cga_a8c2 - g_cga_a8c4;
        if (g_cga_a8c8 >= 12) g_cga_a8c8 -= 12;
        if (g_cga_a8c8 < 0) g_cga_a8c8 += 12;
        value = g_cga_8d84[g_cga_a8c8][g_cga_8e4a[g_cga_a8c6]];
    }
    ((char *)&value)[0] ^= 0x63;
    if (value != g_cga_8e46) return -1;
    if (g_cga_8e44 == -1) return -2;
    return 0;
}
