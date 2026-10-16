extern int g_cga_0250;
extern unsigned char g_cga_0252;
extern int g_cga_0b2a;
extern int g_cga_0c85c;
extern int g_cga_0b2c;
extern int g_00438;
extern int g_cga_0468[];
extern int g_cga_0b47a[];
extern int g_cga_0c87e[];
extern int far fn_cycles_ega_03c9c(void);
void far grp_8a299fba(void)
{
    struct { int i; int base; } local;
    if (g_cga_0250 < 2)
        g_cga_0252 = 1;
    else
        g_cga_0252 = 0;
    g_cga_0c85c = g_cga_0b2a;
    g_cga_0b2c = g_cga_0250 * 2;
    local.base = 90 * g_cga_0250 + g_cga_0468[g_00438];
    for (local.i = 0; local.i < 128; ++local.i) {
        if ((g_cga_0b47a[local.i] = (local.base - 68 * local.i) / 200) < 0)
            g_cga_0b47a[local.i] = 0;
    }
    for (local.i = 0; local.i < 10; ++local.i)
        g_cga_0c87e[local.i] = fn_cycles_ega_03c9c() % 14 + local.i + 8;
}
