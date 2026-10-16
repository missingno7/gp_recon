extern int g_0070c;
extern int g_b7aa;
extern unsigned char g_cga_b462;
extern unsigned char g_cga_b7e6;
extern int g_cga_b478;

int far fn_cycles_ega_113a0(char *argument)
{
    g_cga_b462 = 0;
    g_cga_b7e6 = 0;
    if (g_0070c == 1) {
        g_cga_b462 = 1;
        return 0;
    }
    *argument |= 5;
    g_b7aa = 0x190;
    g_cga_b478 = 1;
}

int far fn_cycles_cga_0ec38(char *argument)
{
    g_cga_b462 = 0;
    g_cga_b7e6 = 0;
    if (g_0070c == 1) {
        g_cga_b462 = 1;
        return 0;
    }
    *argument |= 5;
    g_b7aa = 0x190;
    g_cga_b478 = 1;
}

int far fn_cycles_tandy_0e630(char *argument)
{
    g_cga_b462 = 0;
    g_cga_b7e6 = 0;
    if (g_0070c == 1) {
        g_cga_b462 = 1;
        return 0;
    }
    *argument |= 5;
    g_b7aa = 0x190;
    g_cga_b478 = 1;
}
