extern int g_2166;
extern int g_45a0;
extern int g_215a;
extern int g_b7c6;
extern int g_0ef4;
extern int far fn_cycles_cga_03b32(int);
void far grp_0ea93981(void)
{
    int scaled;
    scaled = ((g_2166 / 256) * g_45a0) / 256;
    g_0ef4 = g_b7c6 - fn_cycles_cga_03b32(g_215a / 256) * 4 - scaled;
    if (g_0ef4 < 0x82)
        g_0ef4 = 0x82;
}
